Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39FC86AB16
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 10:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EA410E912;
	Wed, 28 Feb 2024 09:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nLYO1jwM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6859C10E912;
 Wed, 28 Feb 2024 09:20:46 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-512ab55fde6so7068707e87.2; 
 Wed, 28 Feb 2024 01:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709112044; x=1709716844; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a2noyD+gH5EeHWvIbCVfQ5txzmPqGPvNkLe5Kdw3vzI=;
 b=nLYO1jwM4XXG6+8JbzL5oLiisE+BNChveSjeUG4L4LojqCqoXz9hzwnMnvYKRwMADO
 kBIGqp6lhDV8IOTT2JjZdcEFEn19vE7mgSaL7JQq93hhNfoJ4Aqxs9YVGNcByRFJwGRm
 6hKCepbu6IO56HoHiLvbjSSYgFzmVbTbhV2VvBKTgyhMA00wLGckkFPAOjE981DHq9DB
 nz9iisEf2+DimjNdF4wPBJwK4ijIHtOqHh8+DRu26kp+ZrtrMN+Yf5ooqu8VnWUPho63
 a7sqShp9n5VL295tri5/gnxcM5syGLgnkLK4UNOKzOTOHVOt94iwCImQjjGkQnBA9k51
 8Ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709112044; x=1709716844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a2noyD+gH5EeHWvIbCVfQ5txzmPqGPvNkLe5Kdw3vzI=;
 b=fH3C1jfjabiebr3tqijM2D2nq/yFv6ms3QRxE06Iac+g7STD35hbp2tUdVit3nsXMu
 G6eUgccRjRrDFF52a41dQv6oqit96FznMwdRg9Cl6c1/cxwoz5V5f8fqagrz1f/0j2Ju
 kGERSpWjYWvBRBmT/McV/hx5H74iwY9B4vGoAKPxD7UakPIX3mlolim4vtT6eJ+HqB4I
 pjjN8cSPkANES5hhMJJwgoa+73zpAit+Bm8SMKt+lCuVOpCWoS3/RYhY0h3dDayoBct7
 8tjKPAZk/V+o0kK5hIAPizLoaTcCektqi/SF+12KUelWoXf4a2Rw0W4jlp+nGDh0rumI
 YGiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURYMA/w6ROvDCCJKX50Q/LKPX6YqvMZ3p0R7s3Xcnkt7eKAXKiCi2WcBHLWucWavS6aFZlLM51gKHO45FYpBYSD8WmroZbSlknz5KuIn/Awc/Ele+lNQhAxO0ob8soq7T4SGYMQrXHBvAOtygY1B6Qzh6uOWDPIbkOPSYrq0KQBhxak5+wXxCwv9noIa9vO6k=
X-Gm-Message-State: AOJu0YzGKnQbZRgOf2/Kuj2JgKFe0FQ4CbMzJ9mKSQomGpALSknb50+W
 tGHsKfDD0oA10Cc3r7p/iXzcB/Bg3s2ZBGbivrd2Hw2ibRpsiqQ5
X-Google-Smtp-Source: AGHT+IHqmkUwiO2sfj7BD6bTWs5IUeTj5Q2VJyj4bs2CxxwV7i3xk4DbJ+e5SZU7I6iDYoTpbxt8yg==
X-Received: by 2002:a05:6512:991:b0:512:ee1f:b5af with SMTP id
 w17-20020a056512099100b00512ee1fb5afmr6493372lft.41.1709112043681; 
 Wed, 28 Feb 2024 01:20:43 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 17-20020a05600c229100b00412b2afb2c8sm1457617wmf.26.2024.02.28.01.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 01:20:43 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/i915/dp: Fix spelling mistake "redect" -> "reject"
Date: Wed, 28 Feb 2024 09:20:42 +0000
Message-Id: <20240228092042.4125617-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a drm_dbg_kms message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp_tunnel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_tunnel.c b/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
index 75d76f91ecbd..6503abdc2b98 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
@@ -348,7 +348,7 @@ void intel_dp_tunnel_resume(struct intel_dp *intel_dp,
 
 out_err:
 	drm_dbg_kms(&i915->drm,
-		    "[DPTUN %s][CONNECTOR:%d:%s][ENCODER:%d:%s] Tunnel can't be resumed, will drop and redect it (err %pe)\n",
+		    "[DPTUN %s][CONNECTOR:%d:%s][ENCODER:%d:%s] Tunnel can't be resumed, will drop and reject it (err %pe)\n",
 		    drm_dp_tunnel_name(intel_dp->tunnel),
 		    connector->base.base.id, connector->base.name,
 		    encoder->base.base.id, encoder->base.name,
-- 
2.39.2

