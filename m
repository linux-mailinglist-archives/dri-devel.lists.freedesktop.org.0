Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38304A110FF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 20:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688EF10E476;
	Tue, 14 Jan 2025 19:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tkzZEOml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2038610E476
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 19:17:29 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3862c78536bso333623f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 11:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736882247; x=1737487047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V06lBlmBxfsjJKJMHVQIInwZH2ivoya6DqMfzagHCMc=;
 b=tkzZEOml8GpKF1PlYCnpDIhpo/mSXcGNTGdQkvsEjDGDQNnUYCvFwvO7/yDmKCMiee
 BqSPmfW1YkAyXGeSn8rO9GpBp9PAkNYSewUxSMx4LbM4LFITEfXC9OwgF1IU1DpR4rkm
 6UBJjTwSM2fcF1jGeaozeyBOoiiWOU5rdZ+AFVpCSphKzGP3LnfzwwqKG1hPDsC1h49w
 FZLlkiNXpQOvjNuoDpIgpsSnnZnjInMBj9bxBhoEdSmlfoxSn09bpOIPEh33781F1H24
 kqQzw6030OSncQGPRy85fFw3xXU/pcI9uSSKMNdCiSpmBhGEhUbdPUvd5W46W2b7Ermx
 aTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736882247; x=1737487047;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V06lBlmBxfsjJKJMHVQIInwZH2ivoya6DqMfzagHCMc=;
 b=fr30tOUIBxX+cw84sGYBcib8W64YWVbXz+O1kWwNzMIxCk/Usyj/dAkX0m71YzCLBn
 zol66Q2mSHKe4LVkqW1QRij3aoRbEe8C+6BTxJMSwuH4r1XP6RY8EvM4Xggq0y5+2imx
 Zt/y/9DKQ0sesFYCMMxzlBdVCUwXRiuIuXHi/SyQ7ihd3YeLqwHkTPOzXlxij1xeYLgS
 D4Vbgew28Qpo+p8GEW60sC+pq7wfhv+K6itESK/x6XyBGakbUA9B/3SxzW4l+z6Rj5jt
 FcHhSL2e7LHcZckX9LMJ1NQc7NsNQzaK7TOZn5R1gU9RD8BTuZSTdMD+uTkksMQdHatZ
 E4/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkj9gpL/BviBWCAJICF04nVEB0XFaegFxJKykpZylhz/UfQ4lzcO0PjmEjRLTIlbcFpt+oCDFz3X8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYqwQBnTrYtsAXJukpZdk/hlqPWBqPFHrKQllRI8SVkx7GJQyT
 k4vkkKC2+BvmVJhj+c1Zp3FAK1IVerM1mZ11fE876yy2/5KFcdAuOvRWVOH2xM0=
X-Gm-Gg: ASbGncu3AXOLpSC2De0MMntGrg2WknCZYhnrnsof2hnGYTdzna9NCyvDfqip/5s1RUm
 FX5vMY5O73XelGqG2J5cmYbhqXEozipMxm6IDjhQz59dFkgYMwUM13MApunjr8OeBYz9RLxyDZ4
 wKORHo42qsdmNs2ZrdDDTQxbyQj7GVZVJCYfQvmRxEki3QAse4T6vNyH+rUrL865bwHyUfNTqm1
 Y7m5CsAvmEALpikDWrB1PVS2AQt6RHwwxoa7DyH4MHHWGlwaiFpJ3zRaFzJWD7j/NI5Rgo=
X-Google-Smtp-Source: AGHT+IGUuvJd37PBNvk/Af4zVCTFBkmKr2VZr39NQdU1icUhyecsGR7h9tETuRGt6OlfcQkAdHOQXg==
X-Received: by 2002:a5d:6c69:0:b0:38a:9ed4:9ffc with SMTP id
 ffacd0b85a97d-38a9ed4b06fmr5620244f8f.10.1736882247587; 
 Tue, 14 Jan 2025 11:17:27 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b82a4sm15814423f8f.72.2025.01.14.11.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 11:17:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/msm: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 20:17:24 +0100
Message-ID: <20250114191724.861601-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  5 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c      |  3 ++-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              | 25 ++++++++++---------
 drivers/gpu/drm/msm/dp/dp_display.c           |  4 +--
 drivers/gpu/drm/msm/dp/dp_drm.c               |  5 ++--
 5 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index e9bbccc44dad..da9994a79ca2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
 #include <linux/delay.h>
+#include <linux/string_choices.h>
 #include "dpu_encoder_phys.h"
 #include "dpu_hw_interrupts.h"
 #include "dpu_hw_pingpong.h"
@@ -261,7 +262,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 
 	DRM_DEBUG_KMS("id:%u pp:%d enable=%s/%d\n", DRMID(phys_enc->parent),
 		      phys_enc->hw_pp->idx - PINGPONG_0,
-		      enable ? "true" : "false", refcount);
+		      str_true_false(enable), refcount);
 
 	if (enable) {
 		if (phys_enc->vblank_refcount == 0)
@@ -285,7 +286,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 		DRM_ERROR("vblank irq err id:%u pp:%d ret:%d, enable %s/%d\n",
 			  DRMID(phys_enc->parent),
 			  phys_enc->hw_pp->idx - PINGPONG_0, ret,
-			  enable ? "true" : "false", refcount);
+			  str_true_false(enable), refcount);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
index 666de99a46a5..fc183fe37f56 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2014-2015 The Linux Foundation. All rights reserved.
  */
 
+#include <linux/string_choices.h>
 #include "mdp5_kms.h"
 #include "mdp5_ctl.h"
 
@@ -233,7 +234,7 @@ int mdp5_ctl_set_encoder_state(struct mdp5_ctl *ctl,
 		return -EINVAL;
 
 	ctl->encoder_enabled = enabled;
-	DBG("intf_%d: %s", intf->num, enabled ? "on" : "off");
+	DBG("intf_%d: %s", intf->num, str_on_off(enabled));
 
 	if (start_signal_needed(ctl, pipeline)) {
 		send_start_signal(ctl);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 9c463ae2f8fa..d8633a596f8d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -11,6 +11,7 @@
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-dp.h>
 #include <linux/pm_opp.h>
+#include <linux/string_choices.h>
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_fixed.h>
@@ -1366,9 +1367,9 @@ int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "enable core clocks \n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
-		   ctrl->stream_clks_on ? "on" : "off",
-		   ctrl->link_clks_on ? "on" : "off",
-		   ctrl->core_clks_on ? "on" : "off");
+		   str_on_off(ctrl->stream_clks_on),
+		   str_on_off(ctrl->link_clks_on),
+		   str_on_off(ctrl->core_clks_on));
 
 	return 0;
 }
@@ -1385,9 +1386,9 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "disable core clocks \n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
-		   ctrl->stream_clks_on ? "on" : "off",
-		   ctrl->link_clks_on ? "on" : "off",
-		   ctrl->core_clks_on ? "on" : "off");
+		   str_on_off(ctrl->stream_clks_on),
+		   str_on_off(ctrl->link_clks_on),
+		   str_on_off(ctrl->core_clks_on));
 }
 
 static int msm_dp_ctrl_link_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
@@ -1416,9 +1417,9 @@ static int msm_dp_ctrl_link_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "enable link clocks\n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
-		   ctrl->stream_clks_on ? "on" : "off",
-		   ctrl->link_clks_on ? "on" : "off",
-		   ctrl->core_clks_on ? "on" : "off");
+		   str_on_off(ctrl->stream_clks_on),
+		   str_on_off(ctrl->link_clks_on),
+		   str_on_off(ctrl->core_clks_on));
 
 	return 0;
 }
@@ -1435,9 +1436,9 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "disabled link clocks\n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
-		   ctrl->stream_clks_on ? "on" : "off",
-		   ctrl->link_clks_on ? "on" : "off",
-		   ctrl->core_clks_on ? "on" : "off");
+		   str_on_off(ctrl->stream_clks_on),
+		   str_on_off(ctrl->link_clks_on),
+		   str_on_off(ctrl->core_clks_on));
 }
 
 static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 24dd37f1682b..b200efd97947 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -11,6 +11,7 @@
 #include <linux/of_irq.h>
 #include <linux/phy/phy.h>
 #include <linux/delay.h>
+#include <linux/string_choices.h>
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/drm_edid.h>
 
@@ -343,8 +344,7 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 {
 	if ((hpd && dp->msm_dp_display.link_ready) ||
 			(!hpd && !dp->msm_dp_display.link_ready)) {
-		drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
-				(hpd ? "on" : "off"));
+		drm_dbg_dp(dp->drm_dev, "HPD already %s\n", str_on_off(hpd));
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index d3e241ea6941..8364f3834531 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/string_choices.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_bridge.h>
@@ -25,7 +26,7 @@ static enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
 	dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
-		(dp->link_ready) ? "true" : "false");
+		str_true_false(dp->link_ready));
 
 	return (dp->link_ready) ? connector_status_connected :
 					connector_status_disconnected;
@@ -41,7 +42,7 @@ static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
 	dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
-		(dp->link_ready) ? "true" : "false");
+		str_true_false(dp->link_ready));
 
 	/*
 	 * There is no protection in the DRM framework to check if the display
-- 
2.43.0

