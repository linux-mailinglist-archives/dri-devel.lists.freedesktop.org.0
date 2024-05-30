Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2758D561B
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 01:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C259910E88E;
	Thu, 30 May 2024 23:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vN+Xqzcz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44A810E698
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 23:13:01 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52b88740a93so152572e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 16:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717110780; x=1717715580; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lhBHPUZLF3YIdDcb/ahdftpXzh5XIgh1+ZCXZdZsjMw=;
 b=vN+XqzczseHdJJXybxQeUctDxB1ppYZRGewo2BIWiQSxjuYa3BXy1hm0HmuDWFYOEj
 124mEf3YyZcOXwqPhnP/6kdxBDbNSUdLGgIdgfc3HANwkFU5B1weTrplBvQ+ZGqPRQ3E
 nuMY//k02XIOISz6ie8kVoZMamtz8M5AvTI4tPzs4RKZSM6uZoqYeLH17JWwI1KIkwhy
 nvhH5LWkK3E2vOcfpxS19WDVTLSn9NGNnPCz6NfQ5/4jdnftUUMQHND47bwn/7gkM2bO
 ZCaiDh3+NWVsdvXGAfFl5q+hflOnKBFc+DKGax8VBvtGBUhwoBcClrQ1w5SsI5BP3vFw
 CGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717110780; x=1717715580;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lhBHPUZLF3YIdDcb/ahdftpXzh5XIgh1+ZCXZdZsjMw=;
 b=wkR3GhkZ6zoq83Ol7/jbDfFhpxc0gQBqm7VcaXtdct6PT8q3xxoMrej+DU8zEVJd5g
 2ZLCprmIArt6ThFdx6EUS+JersTYuqzQtmx795z8bFgiD6oYg/i/wsIpP1dMo4w7L3Hv
 XGn0NVFa1sHNGtfuGkV3bFHTC8zDb18JlQ1qR6zRO2NgrJi/9VVHQYyiSXfcXvgOPWmp
 NPRE6ieRbSgOedNcZehEh5XYE6CyNPUdvqPkXAJDloqexiuJAvZPIRVq+lIKNtVnd1/p
 sSjyzmBycUz1Gl6j7Cc3OjrV/7Kn6aRvAieFxV3NLXRwMTyESx5+zBFJxtdkU7c1+lht
 1ovQ==
X-Gm-Message-State: AOJu0YzBJwTis4gGJPEO/CJFsnr3vVCmXvlCFqVo7WjlpOexzKCueecH
 QTcZ7xKjSeUyImDHeVVW7MnQhaZnjz9Zh+1/tCEHgThh5UCEZDZpBN3/Ed8btnvicqyfQqk5TrX
 3
X-Google-Smtp-Source: AGHT+IE9ND/0fkLm5FJJdIYQVd33IKLcJTOhUto0CqySS45XJxwfuCKJGkgAIr6Ocx9hm/auCRlgxg==
X-Received: by 2002:ac2:5053:0:b0:52b:84bd:3456 with SMTP id
 2adb3069b0e04-52b896bff1bmr30276e87.50.1717110779720; 
 Thu, 30 May 2024 16:12:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d75d96sm119005e87.120.2024.05.30.16.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 16:12:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 02:12:57 +0300
Subject: [PATCH v3 3/3] drm/panel-edp: drop several legacy panels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-edp-panel-drop-v3-3-4c98b2b95e3a@linaro.org>
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
In-Reply-To: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7181;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KHtSKai0pDM4VS5bgZCbe+P/cd/RkoPhPxoBXQvSaoc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWQf4Pgh6trwpQujTSN3Aoy5x8bELzq+8AMkPf
 L91C5FJRSmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlkH+AAKCRCLPIo+Aiko
 1UeqB/wIgK+VSSbx1aEHBxEs6cIt8HrRA3TPr2LR9q4sVODOIRlUU5bfRi8/V3sh96n2SyAEeCT
 6UWonlU/+Yee6igJOY2bliXn2QWwcLFVV05MqJGMgw5ZPNYt/PBsaySCNnTHf/UDD01yrIO95Wu
 wmcdH+1IP4FNWnM4gahogPnJ+EhtgNd+5SD71EjjWn5m/X46066dM8hrtmidnAKVqoBUFvL0Huq
 UEdqyOT1BjzcuqI7kl8d4bKQRwaOam8avX4q5m7837cCiePbVDe7cGFusU1uiKfClBQDeR41Fuk
 0zRTJ5NyJ/iVAeyh+7ecfHzb4eXapw3kPKdCbyxKOOC/aFOv
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

The panel-edp driver supports legacy compatible strings for several eDP
panels which were never used in DT files present in Linux tree and most
likely have never been used with the upstream kernel. Drop compatibles
for these panels in favour of using a generic "edp-panel" device on the
AUX bus.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 173 ++------------------------------------
 1 file changed, 7 insertions(+), 166 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index ce2ea204a41e..696f0f6412a5 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1059,33 +1059,6 @@ static const struct panel_desc auo_b116xak01 = {
 	},
 };
 
-static const struct drm_display_mode auo_b133han05_mode = {
-	.clock = 142600,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 58,
-	.hsync_end = 1920 + 58 + 42,
-	.htotal = 1920 + 58 + 42 + 60,
-	.vdisplay = 1080,
-	.vsync_start = 1080 + 3,
-	.vsync_end = 1080 + 3 + 5,
-	.vtotal = 1080 + 3 + 5 + 54,
-};
-
-static const struct panel_desc auo_b133han05 = {
-	.modes = &auo_b133han05_mode,
-	.num_modes = 1,
-	.bpc = 8,
-	.size = {
-		.width = 293,
-		.height = 165,
-	},
-	.delay = {
-		.hpd_reliable = 100,
-		.enable = 20,
-		.unprepare = 50,
-	},
-};
-
 static const struct drm_display_mode auo_b133htn01_mode = {
 	.clock = 150660,
 	.hdisplay = 1920,
@@ -1135,33 +1108,6 @@ static const struct panel_desc auo_b133xtn01 = {
 	},
 };
 
-static const struct drm_display_mode auo_b140han06_mode = {
-	.clock = 141000,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 16,
-	.hsync_end = 1920 + 16 + 16,
-	.htotal = 1920 + 16 + 16 + 152,
-	.vdisplay = 1080,
-	.vsync_start = 1080 + 3,
-	.vsync_end = 1080 + 3 + 14,
-	.vtotal = 1080 + 3 + 14 + 19,
-};
-
-static const struct panel_desc auo_b140han06 = {
-	.modes = &auo_b140han06_mode,
-	.num_modes = 1,
-	.bpc = 8,
-	.size = {
-		.width = 309,
-		.height = 174,
-	},
-	.delay = {
-		.hpd_reliable = 100,
-		.enable = 20,
-		.unprepare = 50,
-	},
-};
-
 static const struct drm_display_mode boe_nv101wxmn51_modes[] = {
 	{
 		.clock = 71900,
@@ -1428,33 +1374,6 @@ static const struct panel_desc innolux_p120zdg_bf1 = {
 	},
 };
 
-static const struct drm_display_mode ivo_m133nwf4_r0_mode = {
-	.clock = 138778,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 24,
-	.hsync_end = 1920 + 24 + 48,
-	.htotal = 1920 + 24 + 48 + 88,
-	.vdisplay = 1080,
-	.vsync_start = 1080 + 3,
-	.vsync_end = 1080 + 3 + 12,
-	.vtotal = 1080 + 3 + 12 + 17,
-	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
-};
-
-static const struct panel_desc ivo_m133nwf4_r0 = {
-	.modes = &ivo_m133nwf4_r0_mode,
-	.num_modes = 1,
-	.bpc = 8,
-	.size = {
-		.width = 294,
-		.height = 165,
-	},
-	.delay = {
-		.hpd_absent = 200,
-		.unprepare = 500,
-	},
-};
-
 static const struct drm_display_mode kingdisplay_kd116n21_30nv_a010_mode = {
 	.clock = 81000,
 	.hdisplay = 1366,
@@ -1703,75 +1622,6 @@ static const struct panel_desc sharp_lq123p1jx31 = {
 	},
 };
 
-static const struct drm_display_mode sharp_lq140m1jw46_mode[] = {
-	{
-		.clock = 346500,
-		.hdisplay = 1920,
-		.hsync_start = 1920 + 48,
-		.hsync_end = 1920 + 48 + 32,
-		.htotal = 1920 + 48 + 32 + 80,
-		.vdisplay = 1080,
-		.vsync_start = 1080 + 3,
-		.vsync_end = 1080 + 3 + 5,
-		.vtotal = 1080 + 3 + 5 + 69,
-		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-	}, {
-		.clock = 144370,
-		.hdisplay = 1920,
-		.hsync_start = 1920 + 48,
-		.hsync_end = 1920 + 48 + 32,
-		.htotal = 1920 + 48 + 32 + 80,
-		.vdisplay = 1080,
-		.vsync_start = 1080 + 3,
-		.vsync_end = 1080 + 3 + 5,
-		.vtotal = 1080 + 3 + 5 + 69,
-		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-	},
-};
-
-static const struct panel_desc sharp_lq140m1jw46 = {
-	.modes = sharp_lq140m1jw46_mode,
-	.num_modes = ARRAY_SIZE(sharp_lq140m1jw46_mode),
-	.bpc = 8,
-	.size = {
-		.width = 309,
-		.height = 174,
-	},
-	.delay = {
-		.hpd_absent = 80,
-		.enable = 50,
-		.unprepare = 500,
-	},
-};
-
-static const struct drm_display_mode starry_kr122ea0sra_mode = {
-	.clock = 147000,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 16,
-	.hsync_end = 1920 + 16 + 16,
-	.htotal = 1920 + 16 + 16 + 32,
-	.vdisplay = 1200,
-	.vsync_start = 1200 + 15,
-	.vsync_end = 1200 + 15 + 2,
-	.vtotal = 1200 + 15 + 2 + 18,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
-
-static const struct panel_desc starry_kr122ea0sra = {
-	.modes = &starry_kr122ea0sra_mode,
-	.num_modes = 1,
-	.size = {
-		.width = 263,
-		.height = 164,
-	},
-	.delay = {
-		/* TODO: should be hpd-absent and no-hpd should be set? */
-		.hpd_reliable = 10 + 200,
-		.enable = 50,
-		.unprepare = 10 + 500,
-	},
-};
-
 static const struct of_device_id platform_of_match[] = {
 	{
 		/* Must be first */
@@ -1799,18 +1649,12 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "auo,b116xa01",
 		.data = &auo_b116xak01,
-	}, {
-		.compatible = "auo,b133han05",
-		.data = &auo_b133han05,
 	}, {
 		.compatible = "auo,b133htn01",
 		.data = &auo_b133htn01,
 	}, {
 		.compatible = "auo,b133xtn01",
 		.data = &auo_b133xtn01,
-	}, {
-		.compatible = "auo,b140han06",
-		.data = &auo_b140han06,
 	}, {
 		.compatible = "boe,nv101wxmn51",
 		.data = &boe_nv101wxmn51,
@@ -1838,9 +1682,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,p120zdg-bf1",
 		.data = &innolux_p120zdg_bf1,
-	}, {
-		.compatible = "ivo,m133nwf4-r0",
-		.data = &ivo_m133nwf4_r0,
 	}, {
 		.compatible = "kingdisplay,kd116n21-30nv-a010",
 		.data = &kingdisplay_kd116n21_30nv_a010,
@@ -1871,12 +1712,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "sharp,lq123p1jx31",
 		.data = &sharp_lq123p1jx31,
-	}, {
-		.compatible = "sharp,lq140m1jw46",
-		.data = &sharp_lq140m1jw46,
-	}, {
-		.compatible = "starry,kr122ea0sra",
-		.data = &starry_kr122ea0sra,
 	}, {
 		/* sentinel */
 	}
@@ -1928,6 +1763,12 @@ static const struct panel_delay delay_200_500_e80_d50 = {
 	.disable = 50,
 };
 
+static const struct panel_delay delay_80_500_e50 = {
+	.hpd_absent = 80,
+	.unprepare = 500,
+	.enable = 50,
+};
+
 static const struct panel_delay delay_100_500_e200 = {
 	.hpd_absent = 100,
 	.unprepare = 500,
@@ -2129,7 +1970,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA45AF01"),
 
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
-	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &sharp_lq140m1jw46.delay, "LQ140M1JW46"),
+	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
 
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),

-- 
2.39.2

