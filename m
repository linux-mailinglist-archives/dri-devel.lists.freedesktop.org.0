Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9043C7350AB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 11:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B47D10E115;
	Mon, 19 Jun 2023 09:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B93A10E115
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 09:44:47 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31272fcedf6so370490f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 02:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687167885; x=1689759885;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NSP09R2WaLxxohUJ/p3vcrxW5xitvCM8OwtEijG+zc4=;
 b=W0R8EmNyXVsRacDc44gsxRQa/YhhdNa2z8F0AeJdc9qwWNwpB8l/vGm4FYTLev0TG+
 yf8wcc9/vpvjK+roKvQq70CCXtwxKZgPA6+ynmbT3foP0+1kfN+FcQRMCRXZ5Ya+y+gD
 1eHf58RK/F3f7jOrfVF5kmsxdA7xq4NU1vfDpzvKKux18PkgCsL89u6F8SauowS9DKyA
 XFdqUbwP4jrKaXlgMCWpOm32ycHGQyyOqybcoAPV4xHtq+a8KVxUnunkEPVAtI59gkgj
 O1+m++im3NrdIJt7/eSKk2DojWwZoVoC+s4nDSOajXwVyefMl+HktnjZ6zUKyoys+LIv
 5rEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687167885; x=1689759885;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NSP09R2WaLxxohUJ/p3vcrxW5xitvCM8OwtEijG+zc4=;
 b=XHQpO16g8DJGTcq75H44PfhMa0qkAJPwZYg2aMC3Wb7OakOKdzJWv9BGVpLoZKDK9q
 lpx4YXH9tMMmwGnL+pu3ANnH2kHKJlwLkuXDYFeE1Rg7adTavU9RvEE9SBMZ+UWpO+wO
 OqmYtCIRPmw8AuZVE1elJYD0w0ytnRlFG8f7QydOoTQKiOMvUJ5A889VamAvw+Unh3lG
 Yo2GbFPnkpfl3UyVvXl6cM463NFtBLQrTkf+Qoy/zs7iK2XQHo/7TozXkVe8UGpr7MCF
 tALnaavB/fB//BNSoG8nA3lxJSteBmaVxBOsN7VQIEjcZztwqe2hGVeM9+wrFy2iAKoi
 Mg2Q==
X-Gm-Message-State: AC+VfDw1M6MJwH99kET2OFbMhEMzTdObh23q8frmwzTGtFo+FrN1AKQy
 XiFYszRaQKz95ip8IkcWFNe+EQ==
X-Google-Smtp-Source: ACHHUZ5Zg5Z8LszP8AT8/SbmuWuU1V/RGxNU9GmhxgyQY6KcTSaIYtGjr5UlnR6za/yLFaeXETkP0g==
X-Received: by 2002:adf:ea90:0:b0:30f:c5b1:23ef with SMTP id
 s16-20020adfea90000000b0030fc5b123efmr6215351wrm.41.1687167885502; 
 Mon, 19 Jun 2023 02:44:45 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 v18-20020a5d43d2000000b0030ae93bd196sm30902612wrr.21.2023.06.19.02.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 02:44:44 -0700 (PDT)
Date: Mon, 19 Jun 2023 12:44:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH] drm/sprd: Remove unnecessary variable in
 calc_video_size_step()
Message-ID: <e3f65945-4a93-4d4c-afd7-8d68586ea591@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jani Nikula <jani.nikula@intel.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Orson Zhai <orsonzhai@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "video_size_step" variable is never used so it can be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/sprd/sprd_dsi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index ab0e5cce7adb..adeff6b2fb4b 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -324,8 +324,6 @@ static u16 calc_bytes_per_pixel_x100(int coding)
 
 static u8 calc_video_size_step(int coding)
 {
-	u8 video_size_step;
-
 	switch (coding) {
 	case COLOR_CODE_16BIT_CONFIG1:
 	case COLOR_CODE_16BIT_CONFIG2:
@@ -334,14 +332,14 @@ static u8 calc_video_size_step(int coding)
 	case COLOR_CODE_18BIT_CONFIG2:
 	case COLOR_CODE_24BIT:
 	case COLOR_CODE_COMPRESSTION:
-		return video_size_step = 1;
+		return 1;
 	case COLOR_CODE_20BIT_YCC422_LOOSELY:
 	case COLOR_CODE_24BIT_YCC422:
 	case COLOR_CODE_16BIT_YCC422:
 	case COLOR_CODE_30BIT:
 	case COLOR_CODE_36BIT:
 	case COLOR_CODE_12BIT_YCC420:
-		return video_size_step = 2;
+		return 2;
 	default:
 		DRM_ERROR("invalid color coding");
 		return 0;
-- 
2.39.2

