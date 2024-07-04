Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D14C927DAE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 21:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147DA10EADB;
	Thu,  4 Jul 2024 19:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QNLqZl5e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D48F10EADB
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 19:17:12 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52e991fb456so916493e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 12:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720120630; x=1720725430; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5wVre2SxBMYBgXmlpdpsQlNbXS+4eCQaIUhshOOyPPM=;
 b=QNLqZl5eMpsDWv67LfL6LsdexxsRwPdBe1ICQZ3h2O1DhdLHQGRQ7Xmm83KYN4DoGO
 rSqdie/d+Q3/E8EQsPCChc334YB4hy4iwoF6k8GyakXvFmrizt9b4+u7ORg/t8va1OeZ
 ODfyk22WS13IH16//jrxubXz8VHbvnXR0m8W3NPNVLvrLgCNZrCGrg+nvH1/VqNF0fOh
 7sI7+eephXRm833PJR8WdmJX8rUxMINvXv7LSextFRi3tSxIohChAr0sVCLDYJ59/NoO
 BZXr7weOlQ12NQTG75yWv0BGujTXoPf/nZBkK9Qge+o9R00kk2KUASMt/xzvpAaCvYPc
 HFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720120630; x=1720725430;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5wVre2SxBMYBgXmlpdpsQlNbXS+4eCQaIUhshOOyPPM=;
 b=Mdr/LwFYsnv28uA1AEXjbnBVIlQegZFsGdL9RDpVlih2fDVWH6jeWobOb/LjN3Mtoo
 2y8/U/xmz0lapBkzmvNPUXioiJkHopXwc79/aUEMBMJtz9YEA2Vsyv5geT7a6ENLqdSX
 lRYAlJUtN9/Ln1GnOQLo7nEAsj5IM94PqmLw5fSlMSiOlbHbcDAaZcIqF18KGcRumW8n
 4NK60TxMJoRwSmq7SaIO3F1hAikaYjSlwjWmopciEDEMUW8xhrjRUCCK2Z/DlU7BmudQ
 t02H/NbUO3Y5Rk0ykVjF90RIZapENE4u5qnwm8BBsjxAfZ0s/zbXHC6b0WKo22nEZ2fa
 qacw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcIg4e20/dgsD2gccG18vnfDVbonCaEVCaACXFmG59qFN2xK04IQ7ZgbuoJyA3eNLdMUg4me8oyiLcJHgHjR17bcg73SxQmHMv9TWBgwhh
X-Gm-Message-State: AOJu0Yw8o9lsZiXTigEMmqTX4z+Fv+oVtYXcu/z3YpS9K8LAi/1ODEaa
 AjGyK4Ku76rxhs7DslIL3IP4po3qgHcjN0KxwAtn+voBex6BYqpnW4E9dErPPw8YRBmABsx95ow
 r2aA=
X-Google-Smtp-Source: AGHT+IEpAN9FJbUqjOVmLuHMHyufLg/IUIcYjwrw7gQRsGu0arTySk0d4oxbiqTopbo1El8C2IeDMA==
X-Received: by 2002:a05:6512:1187:b0:52c:910b:9c7d with SMTP id
 2adb3069b0e04-52ea0df66a6mr812095e87.21.1720120629808; 
 Thu, 04 Jul 2024 12:17:09 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e97de5ef6sm635046e87.58.2024.07.04.12.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 12:17:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 04 Jul 2024 22:17:08 +0300
Subject: [PATCH v6] drm/display: split DSC helpers from DP helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-panel-sw43408-fix-v6-1-3ea1c94bbb9b@linaro.org>
X-B4-Tracking: v=1; b=H4sIADP1hmYC/33NQW7DIBCF4atErEvFDAPGWfUeUReAhwQpsiOon
 FaR716STVLZ6vJ/0nxzE5VL5ir2u5soPOeap7GFfduJePLjkWUeWgtUSIpQyYsf+SzrlTQpJ1P
 +lilZQ30EhMCi3V0Kt/lhHj5bn3L9msrP48UM9/U/bQapZECHKXVokPDjnEdfpvepHMWdm/FJG
 NgksBEDcOqBGUI3rAj9QiBuEboRtleIzvghRrUi6JVwWwQ1QmsVCIlMiHFFmCdhUW8RRoI0pMA
 HC9xp94dYluUX+8+a3r8BAAA=
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5642;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EB5J+r5kFrFeaW4QDQqjIBc1cvwJxswklt/htDn32yU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmhvU0SfCI4iVIgT+QLF8ngmHFDvj5roZf3axsQ
 p2cURhDTBCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZob1NAAKCRCLPIo+Aiko
 1aN2B/9IioG/JNs/7TE4AxP4n6qIGUxISXut5Mv93XlV15PJswNNnOTZdP4x5pqcjp9xIBcekz2
 a1kyrP3RijZOx5zKxtS57Xdyp6rnCVVWgUBZCi0pDFEjN6ApOCaZTlxiL8kxH+FOrvcnYx4vSbc
 bJqh4y8BQV9cQoGYlcQ9Or9PGZiQc+IGs6SQJYs/M8C5fDu/pmVy1Ha6OU0dGKsSGlizL/HuQDs
 J5gBVCbkJ3UhFwSLNQz8vgNy5SXQxxuLNUcQO06D+e1Vlnxe1yQkWvJG7vax561Us46lGSuRFju
 HoZEcKgEZWrWjo9H2ioK1V8tMk41qeQ2ua10HaIWx4F7HkS9
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

Currently the DRM DSC functions are selected by the
DRM_DISPLAY_DP_HELPER Kconfig symbol. This is not optimal, since the DSI
code (both panel and host drivers) end up selecting the seemingly
irrelevant DP helpers. Split the DSC code to be guarded by the separate
DRM_DISPLAY_DSC_HELPER Kconfig symbol.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #i915
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v6:
- Moved the Makefile entry to follow the sorting order (Thomas
  Zimmermann)
- Link to v5: https://lore.kernel.org/r/20240623-panel-sw43408-fix-v5-1-5401ab61e738@linaro.org

Changes in v5:
- Drop applied patches
- Link to v4: https://lore.kernel.org/r/20240528-panel-sw43408-fix-v4-0-330b42445bcc@linaro.org

Changes in v4:
- Reoder patches so that fixes come first, to be able to land them to
  drm-misc-fixes
- Link to v3: https://lore.kernel.org/r/20240522-panel-sw43408-fix-v3-0-6902285adcc0@linaro.org

Changes in v3:
- Split DRM_DISPLAY_DSC_HELPER from DRM_DISPLAY_DP_HELPER
- Added missing Fixes tags
- Link to v2: https://lore.kernel.org/r/20240510-panel-sw43408-fix-v2-0-d1ef91ee1b7d@linaro.org

Changes in v2:
- use SELECT instead of DEPEND to follow the reverted Kconfig changes
- Link to v1: https://lore.kernel.org/r/20240420-panel-sw43408-fix-v1-0-b282ff725242@linaro.org
---
 drivers/gpu/drm/amd/amdgpu/Kconfig | 1 +
 drivers/gpu/drm/display/Kconfig    | 6 ++++++
 drivers/gpu/drm/display/Makefile   | 5 +++--
 drivers/gpu/drm/i915/Kconfig       | 1 +
 drivers/gpu/drm/msm/Kconfig        | 1 +
 drivers/gpu/drm/panel/Kconfig      | 6 +++---
 6 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 0051fb1b437f..fc3237da8090 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -6,6 +6,7 @@ config DRM_AMDGPU
 	depends on !UML
 	select FW_LOADER
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 479e62690d75..a2e42014ffe0 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -59,6 +59,12 @@ config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 
 	  If in doubt, say "N".
 
+config DRM_DISPLAY_DSC_HELPER
+	bool
+	depends on DRM_DISPLAY_HELPER
+	help
+	  DRM display helpers for VESA DSC (used by DSI and DisplayPort).
+
 config DRM_DISPLAY_HDCP_HELPER
 	bool
 	depends on DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 629df2f4d322..a023f72fa139 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -6,10 +6,11 @@ drm_display_helper-y := drm_display_helper_mod.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
 	drm_dp_dual_mode_helper.o \
 	drm_dp_helper.o \
-	drm_dp_mst_topology.o \
-	drm_dsc_helper.o
+	drm_dp_mst_topology.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_TUNNEL) += \
 	drm_dp_tunnel.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
+	drm_dsc_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
 	drm_hdmi_helper.o \
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index faa253b27664..db400aad88fa 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -11,6 +11,7 @@ config DRM_I915
 	select SHMEM
 	select TMPFS
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 26a4c71da63a..420385c47193 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -112,6 +112,7 @@ config DRM_MSM_DSI
 	depends on DRM_MSM
 	select DRM_PANEL
 	select DRM_MIPI_DSI
+	select DRM_DISPLAY_DSC_HELPER
 	default y
 	help
 	  Choose this option if you have a need for MIPI DSI connector
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 9f49b0189d3b..dac01ade7e2e 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -369,7 +369,7 @@ config DRM_PANEL_LG_SW43408
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
-	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for LG sw43408 panel.
@@ -578,7 +578,7 @@ config DRM_PANEL_RAYDIUM_RM692E5
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
-	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for Raydium RM692E5-based
@@ -936,7 +936,7 @@ config DRM_PANEL_VISIONOX_R66451
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
-	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for Visionox

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240420-panel-sw43408-fix-ff6549c121be

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

