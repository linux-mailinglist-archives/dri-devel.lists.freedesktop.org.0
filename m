Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D977E88751C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 23:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC02112894;
	Fri, 22 Mar 2024 22:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bRAs+RnC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4870A112887
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 22:57:09 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d21cdbc85bso36535361fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 15:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711148227; x=1711753027; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Cb7/om6AlfRdO+j4YRTK+w848aaaoMcNJflrHfAwxos=;
 b=bRAs+RnCCij9CXjt3MaK0wK/w5Ts0Qaod6wE1Vm0iqWwNkiPbEeb5MYS4UHSCYYkGr
 9VZhZ8MuyCwjkKSSyHrgmDggcaa9AhE926rQLjNBKpgQixE5VK0NnZIJn0piSkLkYr4k
 K7maKsnCYDeZs2Hc1GB+lYCXPfI5sOxeAWyY4Gretz0lZeotmO9iXFKG010B9Lplmxxx
 zbzm6L95RjxYIni061bgy/nEgADwbglHK5TPzjrkJvWHvJERRG8ssYr3WT2OiikFymmP
 ropRPeNk9EVQ6fcYxM94YAGnacxSay7uGiZhpxm1py9pBjD8va+Kt5IlBuD6X8/Ug0+W
 2HzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711148227; x=1711753027;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cb7/om6AlfRdO+j4YRTK+w848aaaoMcNJflrHfAwxos=;
 b=ZArD3R1ibV2MdQJGz4nbCp8acjmAJPg4g7ZSZAf17YMGt6iefYDmQF99ofFZyG97fV
 tjPGBp1bX8HhsEngfnfadnBX30Bs1SoTs+ObqI5BMvvZ+I8+M1u6JTmFDKW7KbPuYFpg
 jIxXMNgSEqYhnbolEc0XdYT/4eHeMBgclMpKM7IMYSCgI7MK6lYXS+kFH8EYVcngUWeU
 UKV/3IYf093XXmlLikocEO5bjKSqzcjCAtgpz9pM7zX/ZLqrBEkFi7a+UTqyDgmkjrFE
 O/ms8ia42/BhvbOIwXmSxpw6AB6aYiUYQqd11+lK+oYJ/WcKdSpyMKUHOSM0tWP43AfC
 /yKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm6AI5Bb3DydFmecoTZQxKEwxM8Ddm0J8TAhXxhHCdCg+piSaG5cA0dBkb1oprh/e12kSCYAWOxquZPQBa1nLkmdDvWe5bLM/DD2HrG1MF
X-Gm-Message-State: AOJu0YxJRykVdzWK//QP2h+LQoAYaKgCfxJx5pfX5hHtfBNsPwsji3pt
 eAKYichArGefjlyqey1BPqqL90ZF6+0zuDlYi95tRnI2bDi0WCJse4W2NHMh+00=
X-Google-Smtp-Source: AGHT+IGhHdPrmKYkN0NQIfp1fESrCRBUPGcJY09OsThuDhvFxdqCYyUOEV+kSN7eUZPHjBPOyXwmTQ==
X-Received: by 2002:a19:6413:0:b0:512:9e78:998c with SMTP id
 y19-20020a196413000000b005129e78998cmr496719lfb.9.1711148227518; 
 Fri, 22 Mar 2024 15:57:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 e7-20020a196907000000b005158982f42csm78530lfc.16.2024.03.22.15.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 15:57:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Mar 2024 00:57:02 +0200
Subject: [PATCH v4 10/16] drm/msm: generate headers on the fly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
In-Reply-To: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7259;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BSKLpdBLQvAArEEb7OAeB1JH9o8CJk1u7FWySDMUz7U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl/gy3bFm3zwkxZxetQRgrc5mar8NlFxaH4l4nY
 Wh99CTq5gKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZf4MtwAKCRCLPIo+Aiko
 1fSYCACykxcDNoiIyJtc6W9p3UFFoaJMsAUbNrzCJGjnq9Y5M4MYZ67dF495XPk4IOqh7chxwQR
 eIPmXCqy1/+rt46VQTMYSMxN+kWWSwOALh0o05GnM6kLqKnqC8O7qjG99/sqXngwftLqCCqW8I5
 NxK1eBdGyN+QEjzOghLMMJ7wD++toV9L3LqNtcn8jK4cs5dJ7vV95ReBo+X0JOsggznDMA34nMO
 PA+ATlQlnN+4CbxqBEtqWEV2pES60dVOiVpb0kUTa0Yx97v+i9rJ1zOKcc8uj1SHlwWSVCMJIaU
 uUe31Uw5mkqlIhRuOPNxPB03PlHY/NeLSOK7SKFdvUuVxwV9
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

Generate DRM/MSM headers on the fly during kernel build. This removes a
need to push register changes to Mesa with the following manual
synchronization step. Existing headers will be removed in the following
commits (split away to ease reviews).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/.gitignore |  1 +
 drivers/gpu/drm/msm/Makefile   | 97 +++++++++++++++++++++++++++++++++---------
 drivers/gpu/drm/msm/msm_drv.c  |  3 +-
 drivers/gpu/drm/msm/msm_gpu.c  |  2 +-
 4 files changed, 80 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/.gitignore b/drivers/gpu/drm/msm/.gitignore
new file mode 100644
index 000000000000..9ab870da897d
--- /dev/null
+++ b/drivers/gpu/drm/msm/.gitignore
@@ -0,0 +1 @@
+generated/
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 26ed4f443149..c861de58286c 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 ccflags-y := -I $(srctree)/$(src)
+ccflags-y += -I $(obj)/generated
 ccflags-y += -I $(srctree)/$(src)/disp/dpu1
 ccflags-$(CONFIG_DRM_MSM_DSI) += -I $(srctree)/$(src)/dsi
 ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)/$(src)/dp
 
-msm-y := \
+adreno-y := \
 	adreno/adreno_device.o \
 	adreno/adreno_gpu.o \
 	adreno/a2xx_gpu.o \
@@ -18,7 +19,11 @@ msm-y := \
 	adreno/a6xx_gmu.o \
 	adreno/a6xx_hfi.o \
 
-msm-$(CONFIG_DRM_MSM_HDMI) += \
+adreno-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
+
+adreno-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
+
+msm-display-$(CONFIG_DRM_MSM_HDMI) += \
 	hdmi/hdmi.o \
 	hdmi/hdmi_audio.o \
 	hdmi/hdmi_bridge.o \
@@ -31,7 +36,7 @@ msm-$(CONFIG_DRM_MSM_HDMI) += \
 	hdmi/hdmi_phy_8x74.o \
 	hdmi/hdmi_pll_8960.o \
 
-msm-$(CONFIG_DRM_MSM_MDP4) += \
+msm-display-$(CONFIG_DRM_MSM_MDP4) += \
 	disp/mdp4/mdp4_crtc.o \
 	disp/mdp4/mdp4_dsi_encoder.o \
 	disp/mdp4/mdp4_dtv_encoder.o \
@@ -42,7 +47,7 @@ msm-$(CONFIG_DRM_MSM_MDP4) += \
 	disp/mdp4/mdp4_kms.o \
 	disp/mdp4/mdp4_plane.o \
 
-msm-$(CONFIG_DRM_MSM_MDP5) += \
+msm-display-$(CONFIG_DRM_MSM_MDP5) += \
 	disp/mdp5/mdp5_cfg.o \
 	disp/mdp5/mdp5_cmd_encoder.o \
 	disp/mdp5/mdp5_ctl.o \
@@ -55,7 +60,7 @@ msm-$(CONFIG_DRM_MSM_MDP5) += \
 	disp/mdp5/mdp5_plane.o \
 	disp/mdp5/mdp5_smp.o \
 
-msm-$(CONFIG_DRM_MSM_DPU) += \
+msm-display-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_core_perf.o \
 	disp/dpu1/dpu_crtc.o \
 	disp/dpu1/dpu_encoder.o \
@@ -85,14 +90,16 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_vbif.o \
 	disp/dpu1/dpu_writeback.o
 
-msm-$(CONFIG_DRM_MSM_MDSS) += \
+msm-display-$(CONFIG_DRM_MSM_MDSS) += \
 	msm_mdss.o \
 
-msm-y += \
+msm-display-y += \
 	disp/mdp_format.o \
 	disp/mdp_kms.o \
 	disp/msm_disp_snapshot.o \
 	disp/msm_disp_snapshot_util.o \
+
+msm-y += \
 	msm_atomic.o \
 	msm_atomic_tracepoints.o \
 	msm_debugfs.o \
@@ -115,12 +122,12 @@ msm-y += \
 	msm_submitqueue.o \
 	msm_gpu_tracepoints.o \
 
-msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
-	dp/dp_debug.o
+msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
 
-msm-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
+msm-display-$(CONFIG_DEBUG_FS) += \
+	dp/dp_debug.o
 
-msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
+msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_catalog.o \
 	dp/dp_ctrl.o \
 	dp/dp_display.o \
@@ -130,21 +137,69 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_audio.o \
 	dp/dp_utils.o
 
-msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
-
-msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
+msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
 
-msm-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
+msm-display-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
 			dsi/dsi_cfg.o \
 			dsi/dsi_host.o \
 			dsi/dsi_manager.o \
 			dsi/phy/dsi_phy.o
 
-msm-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
-msm-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
-msm-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
-msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
-msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
-msm-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
+msm-display-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
+msm-display-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
+msm-display-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
+msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
+msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
+msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
+
+msm-y += $(adreno-y) $(msm-display-y)
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
+
+quiet_cmd_headergen = GENHDR  $@
+      cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(srctree)/$(src)/registers/gen_header.py --rnn $(srctree)/$(src)/registers --xml $< c-defines > $@
+
+$(obj)/generated/%.xml.h: $(src)/registers/adreno/%.xml \
+		$(src)/registers/adreno/adreno_common.xml \
+		$(src)/registers/adreno/adreno_pm4.xml \
+		$(src)/registers/freedreno_copyright.xml \
+		$(src)/registers/gen_header.py \
+		$(src)/registers/rules-fd.xsd \
+		FORCE
+	$(call if_changed,headergen)
+
+$(obj)/generated/%.xml.h: $(src)/registers/display/%.xml \
+		$(src)/registers/freedreno_copyright.xml \
+		$(src)/registers/gen_header.py \
+		$(src)/registers/rules-fd.xsd \
+		FORCE
+	$(call if_changed,headergen)
+
+ADRENO_HEADERS = \
+	generated/a2xx.xml.h \
+	generated/a3xx.xml.h \
+	generated/a4xx.xml.h \
+	generated/a5xx.xml.h \
+	generated/a6xx.xml.h \
+	generated/a6xx_gmu.xml.h \
+	generated/adreno_common.xml.h \
+	generated/adreno_pm4.xml.h \
+
+DISPLAY_HEADERS = \
+	generated/dsi_phy_7nm.xml.h \
+	generated/dsi_phy_10nm.xml.h \
+	generated/dsi_phy_14nm.xml.h \
+	generated/dsi_phy_20nm.xml.h \
+	generated/dsi_phy_28nm_8960.xml.h \
+	generated/dsi_phy_28nm.xml.h \
+	generated/dsi.xml.h \
+	generated/hdmi.xml.h \
+	generated/mdp4.xml.h \
+	generated/mdp5.xml.h \
+	generated/mdp_common.xml.h \
+	generated/sfpb.xml.h
+
+$(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
+$(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
+
+targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 97790faffd23..9c33f4e3f822 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -17,8 +17,9 @@
 
 #include "msm_drv.h"
 #include "msm_debugfs.h"
+#include "msm_gem.h"
+#include "msm_gpu.h"
 #include "msm_kms.h"
-#include "adreno/adreno_gpu.h"
 
 /*
  * MSM driver version:
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 655002b21b0d..cd185b9636d2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -11,7 +11,7 @@
 #include "msm_mmu.h"
 #include "msm_fence.h"
 #include "msm_gpu_trace.h"
-#include "adreno/adreno_gpu.h"
+//#include "adreno/adreno_gpu.h"
 
 #include <generated/utsrelease.h>
 #include <linux/string_helpers.h>

-- 
2.39.2

