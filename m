Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9766F76C8BE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 10:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7876C10E524;
	Wed,  2 Aug 2023 08:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973C010E524
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 08:52:33 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fe1a17f983so32420425e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 01:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690966352; x=1691571152;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6wsrvVf1Tq2vaUhYtAT2JkjgDSEB22fZNeeTE0a5xSU=;
 b=IVOBTjzguAcA8nzoBa7REcOzJwvUR/3BndO0bPmLQRkwUFH4N3RsPRbfz6wGzY8mX/
 vT11GLqVCGmMrD4TewyaQm6InaYrjTG+NV7nnFiPgetuYQYqmKDafmNfd5Kyt7S+N9RY
 ym8em805p4ceawjLf1PRU1ox5Za/b7VP5iemiHUYFC9m+GHCV9YBFZzL3NiwVD9/ulbQ
 +XzmqlwlmOHi8eDo8BLneVJ6VVwOOdmR5ksuIvntNfEgaWQoc6A3fQcv4asPbn5wJGl0
 xFoTZ3ivECi9+kPDKKftXzkzX+BCKFLmJH0HymQZanARtu4ItLCgutNnh/us46DDWhde
 JGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690966352; x=1691571152;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6wsrvVf1Tq2vaUhYtAT2JkjgDSEB22fZNeeTE0a5xSU=;
 b=c0XF8Hy778pGXZMkV7O2ePP/wjRzeS3qIn+wmMdKWQ/xK19umk7dnZUNMvTAgLT75+
 FqH8n/+5haB231MVuhZqD8moQOTiWUNS1wHCfmRZnYXIb05moMlNr6iSU89YoGe87AB5
 T9ml511OsNPDBfeKT7iPdyniuoQDtLtmMb0AkXbN+okjVz+fb6/pNGB18TcpFUU90ySL
 uz2YodgjJxa4Xggx4UzGJD9K3VhA+WAdhdDA1nVgV8bouBIj4SNGwypiPIjQnX8HDMGg
 MNUP/c0tAmtFk7dXsSEhMpG9+y3cid1p9pd9cea3ihY0le0GcPDwAS0oK1ulyVpB+mL/
 aTcA==
X-Gm-Message-State: ABy/qLZ523RXKaHae+u4hcZ46qLaUFGfqdCWk4LGLaJzUWAQSbZBixdo
 kdKETFFXv3cUUr+EUdcM6hs6aQ==
X-Google-Smtp-Source: APBJJlFBrp0L1ElAj3/o+Jo3C6rZJBSvJPabmqO9SI7o9s+MUcvicTG8Z9gr1Gc4Ww2MLgt4RhW52g==
X-Received: by 2002:a05:600c:2159:b0:3fe:1f93:8cf4 with SMTP id
 v25-20020a05600c215900b003fe1f938cf4mr4223087wml.8.1690966351956; 
 Wed, 02 Aug 2023 01:52:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a1c7c04000000b003fa973e6612sm1094035wmc.44.2023.08.02.01.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 01:52:31 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 02 Aug 2023 10:52:22 +0200
Subject: [PATCH] Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA
 and EOT packet"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEUZymQC/x2NwQrDIBBEfyXsuQtqSgn9ldKDJmOUgsoqJRDy7
 116mMNjHjMndUhGp+d0kuCbe65Fwd4mWpMvOzhvyuSMm81iHKsEGbxVLnXwjgLxA5xi4xQ03TO
 0aH79YPAjmrsLNvjFzqSbTRDz8f97va/rBwbXaYZ/AAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Marek Vasut <marex@denx.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1936;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=e9tUV/g8uW3iJGQla2yximmXQmIZ4VqzDUhHU5HlWnQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkyhlOPAxfJvCKRFgFs7eo6UzvGsJ/l1XX6BklteG9
 88m6BGyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMoZTgAKCRB33NvayMhJ0cmAD/
 4xEICh1qTqtu2jreftXCG4HpmJWmOW9vxu5esdTN960Zi4rZDQnO3dTtJn/JQz88MItdN1NsICzWiq
 oUBBHD/ZYREyV1+oGOCmRxkkJ7n4SgB+GW1euwJeLsnxUXOWOPwiton1GHVm0vLZ80wmMMdHtdaBXf
 t3fqPdaaLD0XumzBQnXOSnU6IJ31TemVwkFbZIUJ2v9rXtNfnu5Oyd8n6wOVS54cag4Ffi61T9KmVp
 ktX+ET+Ysu87MD1PohBj5ccuANrVpcbLcH7zhStTmMkIX4ml4ipkEIU+mVuQirjjitt6ALXay+CoIz
 CsBvo/P5Neb8f3AlzSFMUxCRli4b51geO36qb2P3ETWLElTTwsTAljJ6Mhr4ToDb4xohxc2TphiA1K
 pClXYCQdb0F4cS6ce141ZRL/parRNNGUJnZAS2xlHEzRWNwYKm6YxMkZxO7QUa6JVF7Elr9s5ephD4
 9gx8q1bDXV3V9a7bosSOtyvxAtWXAIxaYliGDYJlFBUYy0SVqnR+uebZtppw9K6G5tMG5XtqntZ0lS
 8FTQxKb8TwC66ZvQJccqFTiv3Lx2HIFFXCiT33CDxwyeoKmEfU9G5RGuOW79tjMX9dYA0UAuzOXi6a
 oQdFtZ8Gth6/03IUD97/e/nC9v6oIQQmjceqDQDv1bu6nndW76cUj3mFhZoA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit [1] to fix display regression on the Dragonboard 845c
(SDM845) devboard.

There's a mismatch on the real action of the following flags:
- MIPI_DSI_MODE_VIDEO_NO_HSA
- MIPI_DSI_MODE_VIDEO_NO_HFP
- MIPI_DSI_MODE_VIDEO_NO_HBP
which leads to a non-working display on qcom platforms.

[1] 8ddce13ae696 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA and EOT packet")

Cc: Marek Vasut <marex@denx.de>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Fixes: 8ddce13ae69 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA and EOT packet")
Reported-by: Amit Pundir <amit.pundir@linaro.org>
Link: https://lore.kernel.org/r/CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com/
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 5163e5224aad..9663601ce098 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -774,9 +774,7 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-			  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO_NO_HSA |
-			  MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
-			  MIPI_DSI_MODE_NO_EOT_PACKET;
+			  MIPI_DSI_MODE_VIDEO_HSE;
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {

---
base-commit: f590814603bf2dd8620584b7d59ae94d7c186c69
change-id: 20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-6f042b1ba813

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

