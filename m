Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF898AB8D7
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 04:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A73010F1C9;
	Sat, 20 Apr 2024 02:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KrevNnvg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D0010F17F
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 02:41:07 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51ac5923ef6so951013e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 19:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713580865; x=1714185665; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qSmAuCxNU1y3XahseuBRK4nFztnrZzASjwN1faGf/vg=;
 b=KrevNnvgvD7ANCxIRlWEzeh5ciC28DpBwRjhE5lk7RZ6NNg3fsV+do8qScfsqICLBQ
 eQ97eOyo4YFmC2+vAekJXW1eYaJkwz+oOKy/7v/RjGJhHi0Rjbrb5JLIbbNUCS0tfXlZ
 AkdqYtbYmmZx5EiyeVqBYyP6UWxLVHit4/ZdM8WdaqWC1jao4xNjflDYgi/zW3sx26XL
 sD+AsadA2XB37WHsX9hCpUs+HukDCJvD/MoH6Sf4SPZ3zumrYFcDaET+wyJeEd+XuFxM
 v67boeK5IttGd8mtC5HrQOQAnuw66+GxGry5oe7AL63mJNFaz5QnGaBX87ODv5pDg1V+
 MTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713580865; x=1714185665;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qSmAuCxNU1y3XahseuBRK4nFztnrZzASjwN1faGf/vg=;
 b=sK+gUV1Z9Wy/r7EnPgADcszz+YI+7EY3TXbhj5706/1EQMuPegr2WZwp8wYQcKCzwi
 +QYbji3CBvpj3JGKfsZqexZfNx+EAaH5/JrgDSq/0Dr3cFmi4At1ryPPiQvKa26O/fH4
 XGv4JhCJd40EJE/BujSdDR1z4YXEikEhT5mzqGZXasWLaJ+ss4Yml4aHcblEeqO5V805
 yCBjUZhmq1mOiYSLTVi9Q736NuYOU/aYaYeHw3oNI8qtqYHr7GwvLS51CZPBby48yl+K
 yLatel6YDXf9x3UFWT3Nr+oNkJifT4MqUeHm+otELJ5bTLrd+w03N/lv8teSV58NNKHs
 OEyQ==
X-Gm-Message-State: AOJu0YwARgRunT3d7Z+Tw6u0MBKsj1ufnz7Lgo6zWY08AuJgqYN+6i7m
 hSxiAqwzUBKbuG32nwLAYjIAMmdLGg0wYE6HEHCVlh09eDqdI4onmYYouff89rw=
X-Google-Smtp-Source: AGHT+IEgORzz5Sy7uopK88mYrNu4WR6OjysMQQsGBjGgh1ZjqLMNVs4IpmXJ343ikFhE5QjiQcON5Q==
X-Received: by 2002:a05:6512:2353:b0:51a:c548:7257 with SMTP id
 p19-20020a056512235300b0051ac5487257mr1068099lfu.34.1713580864804; 
 Fri, 19 Apr 2024 19:41:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 p1-20020a19f001000000b00518c69b3903sm956951lfc.84.2024.04.19.19.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 19:41:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 05:41:02 +0300
Subject: [PATCH 2/2] drm/panel/lg-sw43408: mark sw43408_backlight_ops as static
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-panel-sw43408-fix-v1-2-b282ff725242@linaro.org>
References: <20240420-panel-sw43408-fix-v1-0-b282ff725242@linaro.org>
In-Reply-To: <20240420-panel-sw43408-fix-v1-0-b282ff725242@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=982;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9SBs1y5K2hzjnYPD9Ky3KqU2SZnDlGyGsApyJDQKsvY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5qyth1D4+TVMU/O7ssqkMzQcj/nXJK7mukZb+MpR3fuZ
 s4mlR+djMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE9gULk4BmIjCd/Y/XAbVOztcDKU/WKt9
 Y36w3G53REaOgtqqd2tEHE+x1O66sq9ai9u5iPNrK9OzVRWpu/6sWeu5b/qF4pKssxLn1f9bRX5
 d5Sx+7cKSFx951+25U74kbHmHxJEA66SQ2gdytyMVbzY/CNnTa39Q2qLzr1JZoJ105IvT3mmOfp
 umLiy1NVP+yDlx8X6fnGpXRw+9HfuuHd3yaqFClt3/C+8OTmdS2jRbbmpQlPwxjmWvHn9/qPr2t
 JFerh+bdVIjx5dLAYL97L3fLhdaTc7aHzzZ4+zTkF1sFgdi7bMn12wPt97b3K6rwZpp9O6Wj+Ae
 aYvjS1Ki7jHGifGaMLww+3R1b93DN/uL1dJL3u3lNxAEAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Fix sparse warning regarding symbol 'sw43408_backlight_ops' not being
declared.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404200739.hbWZvOhR-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 115f4702d59f..2b3a73696dce 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -182,7 +182,7 @@ static int sw43408_backlight_update_status(struct backlight_device *bl)
 	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
 }
 
-const struct backlight_ops sw43408_backlight_ops = {
+static const struct backlight_ops sw43408_backlight_ops = {
 	.update_status = sw43408_backlight_update_status,
 };
 

-- 
2.39.2

