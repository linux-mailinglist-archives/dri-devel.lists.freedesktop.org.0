Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D841A3DDC3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 16:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3D710E086;
	Thu, 20 Feb 2025 15:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uEG51OVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7FB10E086
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 15:07:31 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30918c29da2so10387801fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 07:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740064050; x=1740668850; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uvG19MxhO3fYpjz2GmSHw6ccIGj+912fnpqB5X8XAQE=;
 b=uEG51OVMDDUjL28R1tta+O0pnO0tX2pN+r7+9qgeOe9R6rl4R9F+QqtiiRYn8TUHoG
 v12ohLtRvxwNG1rzZWRN+hqKzZfXMONICnGtE8EGpxoxTaGTVzKXvJ7lElM6KrkZFUQ7
 xi0YoeJF/Pv2ldPEDekyzf49dz7fpOZBZhjAIsERMKihakxxwDgJvxTEQXvDBF0Axbs0
 LSoiSThL57pCr2A3OXUAew8RGQbs5xmH+1KB/NGuDIeoZweHDjBBB+QZ3lXaAh32QNz1
 amhGbRAW8w8ry3tozjFVSGcmquHUuG49Jp7QmZgDNH3cibhiffMjOrCpsDYooLIQt4FN
 wpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740064050; x=1740668850;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uvG19MxhO3fYpjz2GmSHw6ccIGj+912fnpqB5X8XAQE=;
 b=gpqW0CiOnApPrOT+kAGkJL1u76UOC1yqKwLOAhcltklT98eV17nkxHJqUHyTFrgPPB
 Cbh/a4jYg83j9zMIjyq06LO49yAlTp9vym5BahxnECIZGQGyBrDw4V93s87VkzNAZj95
 fg+s8g20vquN7R9dqHI1X+2Lur2Cd2bCwYF1Is4NQx8285D5U8xMLQM27bi3S9LXglic
 7Wp+QxTOpqzACkfrjysL+chbozuotIS/61iqVAjk8ngKhQ5BEyiE62RMn50VYJ4/2xSy
 W+4XlDS9Kf6Nkd99AdOuujRnXmWNI5mLajctuAreMtcJneKqBjCuQuLF7qhefvInsXRr
 7IPg==
X-Gm-Message-State: AOJu0YxlFfozQlSy7GOqb2phNd+bZYdhtelEkS0Kg5CZJm2i0WXXJLx9
 dPBPT3TAwHX8iaWTibifE2JwJYxTrVsQnzffUqT3tAHAmYP/MYKuXSiz5SRD8s2cjR2mzdC/N2/
 I
X-Gm-Gg: ASbGncuJKbnyPd2lXh/48IEpYjr4rOyKR4znqWX5B4mXNO1+nwK4u2v/0irT4FCq4gg
 KqWiGJrQuITAVPDlEC6L00LC0ma4IT6JX1tmTM5FBgT/aZxyDeeP4bb9MGy2wz0JRzP/D5tB/RK
 vQ7UJBjvPVvCGwgVVXOtT4LviMhcPkjGsEfR2Yg+1oVWB2wo08OT3pdz0GBc7xPKRDSYD2Z5qMn
 jWa88Ab0K11jGs+wQ57X/U1/DQIsDGxHbvNGEb36lE6YfYf8VBsJkD33EM95JBCM270ni/2bm+R
 gs/mp+LSpagvIU7yRr1kcow=
X-Google-Smtp-Source: AGHT+IETrZT5oIuDLjlPhyAtOgizah+3OWG8Z0rwGfMHYB+otPCEElkRy42DyiPBfMuzjPj44nhQvg==
X-Received: by 2002:a2e:8a84:0:b0:306:501:4772 with SMTP id
 38308e7fff4ca-30a2a7d42fbmr51425261fa.37.1740064049632; 
 Thu, 20 Feb 2025 07:07:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309311777a8sm18419121fa.25.2025.02.20.07.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 07:07:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 17:07:26 +0200
Subject: [PATCH] drm/bridge: panel: move prepare_prev_first handling to
 drm_panel_bridge_add_typed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-panel_prev_first-v1-1-b9e787825a1a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAC1Ft2cC/x2MUQqAIBAFrxL7nWALRXWVCBFbayFMNCIQ797S5
 /DmTYFMiSnD3BRI9HDmKwh0bQPusGEnxZswoMZeI2oVbaDTRHGN55Rv5d2k3eBGS96C3GTy/P7
 JZa31AyZLoq9iAAAA
X-Change-ID: 20250220-panel_prev_first-fc90c6c8aefa
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Svyatoslav Ryhel <clamor95@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2350;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kNWHbdQTfRuwv2Va9uXhxADhuf1Qe21ZY5fqlYZexyI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnt0Uv+NryiBFZE11p7O20qwstMksW1SPCO+2d5
 kshDb+eqtiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7dFLwAKCRCLPIo+Aiko
 1easB/9psQew0KpvbiVyfpBWBJJoXZ+oLaY5qqIF/v1CEUx19i8UKAZTpUv7/0eHvv4sCVW8oGs
 MG5FOmXafYYxbSyCNr1Es1NV8b/aZZSwiNn5yWos9VAOdJD5g9npG0q4JjqD3YpLst4cBdYsx0x
 sn3b5caZXqWVugrwYSh7bHwt09WR8fDI9qsRmC73mAmOpMiz9AELWOUM+Vk4TvaiPnf2sixFvDp
 yXLabRmGt2RzOnadKucI0q0VOZz/Le2BQ1nR/KFS2nWgBsNTr1X81D6S+Lzd2ldKQnfoyWQ/mIK
 pQrQU/Zh8Uc8dYZbW1XGzdMENFiSAAZlsq5GE+m4B8Jk+CyM
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

The commit 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to
drm_panel") and commit 0974687a19c3 ("drm/bridge: panel: Set
pre_enable_prev_first from drmm_panel_bridge_add") added handling of
panel's prepare_prev_first to devm_panel_bridge_add() and
drmm_panel_bridge_add(). However if the driver calls
drm_panel_bridge_add_typed() directly, then the flag won't be handled
and thus the drm_bridge.pre_enable_prev_first will not be set.

Move prepare_prev_first handling to the drm_panel_bridge_add_typed() so
that there is no way to miss the flag.

Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to drm_panel")
Fixes: 0974687a19c3 ("drm/bridge: panel: Set pre_enable_prev_first from drmm_panel_bridge_add")
Reported-by: Svyatoslav Ryhel <clamor95@gmail.com>
Closes: https://lore.kernel.org/dri-devel/CAPVz0n3YZass3Bns1m0XrFxtAC0DKbEPiW6vXimQx97G243sXw@mail.gmail.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/panel.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index c57036b06493a6922e2cae38bcd1733930ff0073..ed23de0478312a26a5d3434e63bd2fe4a6099bfc 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -302,6 +302,7 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 	panel_bridge->bridge.of_node = panel->dev->of_node;
 	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
 	panel_bridge->bridge.type = connector_type;
+	panel_bridge->bridge.pre_enable_prev_first = panel->prepare_prev_first;
 
 	drm_bridge_add(&panel_bridge->bridge);
 
@@ -416,8 +417,6 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 		return bridge;
 	}
 
-	bridge->pre_enable_prev_first = panel->prepare_prev_first;
-
 	*ptr = bridge;
 	devres_add(dev, ptr);
 
@@ -459,8 +458,6 @@ struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
 	if (ret)
 		return ERR_PTR(ret);
 
-	bridge->pre_enable_prev_first = panel->prepare_prev_first;
-
 	return bridge;
 }
 EXPORT_SYMBOL(drmm_panel_bridge_add);

---
base-commit: 8936cec5cb6e27649b86fabf383d7ce4113bba49
change-id: 20250220-panel_prev_first-fc90c6c8aefa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

