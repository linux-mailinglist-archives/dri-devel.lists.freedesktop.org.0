Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A59DA30A89E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 14:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C5B6E59B;
	Mon,  1 Feb 2021 13:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7926E59B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 13:26:34 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id l12so19564910ljc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 05:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ucyMt61g8JcFNFBNILDPxkh5n07FH+dmgVEnCJ8A7zU=;
 b=XgzMr2ncXyHs2G1nY0f8+QhUzYhX30MUkYXGEbZIrzeDeZ7AwCjRgkj5uU3rleV2Rk
 iwj20/7deJb+2tMrg+ZLYns+ksfdXXbCUgdGs7Ny+Eq3tq36stj1mxW+U7sa5tpTyihM
 c1aD4ofgqOnkGtsxLFPXr9LrWTPNE/tnlY1oO5VKuYK3LBTEMm/T/7yp35PuWA4GUkXr
 Vd70vPgRtEOIGa9mPWtevudrZ3QHMLlxT5WSP1L4KO+Uj6WrZQ0cemz9HF3dteX/fF86
 m2JZy+VgJTNaruRcEYrUbDMq8V5SEqnoJPGkOBjGivzDwjcLY0UL2bM+5Pkvnl5deuDB
 /bMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ucyMt61g8JcFNFBNILDPxkh5n07FH+dmgVEnCJ8A7zU=;
 b=jbif/+RvfyC4cyLSUMLYwQmSlT3D+z/Yf2a+xRNwrQhHTkWBVnEC4890U+gqCTXtJy
 lkV6IXfyTf6qM78NF89sbmcXNkzlTiKBaQgHKS1vwSGgFqscz50I6uOvKv+xaDupuCBY
 NkGX1bNU/Oclr58q6j9G8wm4OQCZyw9kCIq5a+jo6lRlNgi1jORmUaOErbT+RDlCI3Kj
 xHoHbmvvIhIPCVfcOpr6Nvadh/YvyA3gxUer3mghyRiuVlYRWnHNrO6rsfqD8vnT3KsY
 pheN+26oXDnxnJ8VrC/GejRApQeqYbFZkbYWhb8AW5ZtRR83ga43z2tENQRDZB05BPWm
 /vYA==
X-Gm-Message-State: AOAM531rkfgjmkQjdrvgtqyNLvKK98SaXCo97b9m2HdeZEKCmAErzb8h
 GltETMQmiaRMVfB6ySWMamhzK8+ET/k=
X-Google-Smtp-Source: ABdhPJwcx1LFIQ9svLdJTSuONAGRBPuINBXJsqGZR2SnRhWa9bBKKWInuLCzXRp9YVI83VI74R4F6w==
X-Received: by 2002:a2e:7a0a:: with SMTP id v10mr10244920ljc.339.1612185992715; 
 Mon, 01 Feb 2021 05:26:32 -0800 (PST)
Received: from workstation.lan (81-229-85-231-no13.tbcn.telia.com.
 [81.229.85.231])
 by smtp.gmail.com with ESMTPSA id p21sm2984737lfu.227.2021.02.01.05.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 05:26:32 -0800 (PST)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/gma500: Remove unused DPST support
Date: Mon,  1 Feb 2021 14:26:13 +0100
Message-Id: <20210201132617.1233-2-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
References: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
MIME-Version: 1.0
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
Cc: airlied@linux.ie, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DPST never got enabled so remove it. We keep the reg save/restore code
just for safety.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/psb_drv.h       |   4 -
 drivers/gpu/drm/gma500/psb_intel_reg.h |  32 -------
 drivers/gpu/drm/gma500/psb_irq.c       | 110 -------------------------
 drivers/gpu/drm/gma500/psb_irq.h       |   4 -
 4 files changed, 150 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 020a71b91577..d4f14a5d509b 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -622,13 +622,9 @@ static inline struct drm_psb_private *psb_priv(struct drm_device *dev)
 
 /* psb_irq.c */
 extern irqreturn_t psb_irq_handler(int irq, void *arg);
-extern int psb_irq_enable_dpst(struct drm_device *dev);
-extern int psb_irq_disable_dpst(struct drm_device *dev);
 extern void psb_irq_preinstall(struct drm_device *dev);
 extern int psb_irq_postinstall(struct drm_device *dev);
 extern void psb_irq_uninstall(struct drm_device *dev);
-extern void psb_irq_turn_on_dpst(struct drm_device *dev);
-extern void psb_irq_turn_off_dpst(struct drm_device *dev);
 
 extern void psb_irq_uninstall_islands(struct drm_device *dev, int hw_islands);
 extern int psb_vblank_wait2(struct drm_device *dev, unsigned int *sequence);
diff --git a/drivers/gpu/drm/gma500/psb_intel_reg.h b/drivers/gpu/drm/gma500/psb_intel_reg.h
index 364ea8f06f9c..ced7b433befb 100644
--- a/drivers/gpu/drm/gma500/psb_intel_reg.h
+++ b/drivers/gpu/drm/gma500/psb_intel_reg.h
@@ -550,38 +550,6 @@
 #define HISTOGRAM_INT_CTRL_CLEAR		(1UL << 30)
 #define DPST_YUV_LUMA_MODE			0
 
-struct dpst_ie_histogram_control {
-	union {
-		uint32_t data;
-		struct {
-			uint32_t bin_reg_index:7;
-			uint32_t reserved:4;
-			uint32_t bin_reg_func_select:1;
-			uint32_t sync_to_phase_in:1;
-			uint32_t alt_enhancement_mode:2;
-			uint32_t reserved1:1;
-			uint32_t sync_to_phase_in_count:8;
-			uint32_t histogram_mode_select:1;
-			uint32_t reserved2:4;
-			uint32_t ie_pipe_assignment:1;
-			uint32_t ie_mode_table_enabled:1;
-			uint32_t ie_histogram_enable:1;
-		};
-	};
-};
-
-struct dpst_guardband {
-	union {
-		uint32_t data;
-		struct {
-			uint32_t guardband:22;
-			uint32_t guardband_interrupt_delay:8;
-			uint32_t interrupt_status:1;
-			uint32_t interrupt_enable:1;
-		};
-	};
-};
-
 #define PIPEAFRAMEHIGH		0x70040
 #define PIPEAFRAMEPIXEL		0x70044
 #define PIPEBFRAMEHIGH		0x71040
diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index ae9b100e640b..104009e78487 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -101,30 +101,6 @@ psb_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask)
 	}
 }
 
-static void mid_enable_pipe_event(struct drm_psb_private *dev_priv, int pipe)
-{
-	if (gma_power_begin(dev_priv->dev, false)) {
-		u32 pipe_event = mid_pipe_event(pipe);
-		dev_priv->vdc_irq_mask |= pipe_event;
-		PSB_WVDC32(~dev_priv->vdc_irq_mask, PSB_INT_MASK_R);
-		PSB_WVDC32(dev_priv->vdc_irq_mask, PSB_INT_ENABLE_R);
-		gma_power_end(dev_priv->dev);
-	}
-}
-
-static void mid_disable_pipe_event(struct drm_psb_private *dev_priv, int pipe)
-{
-	if (dev_priv->pipestat[pipe] == 0) {
-		if (gma_power_begin(dev_priv->dev, false)) {
-			u32 pipe_event = mid_pipe_event(pipe);
-			dev_priv->vdc_irq_mask &= ~pipe_event;
-			PSB_WVDC32(~dev_priv->vdc_irq_mask, PSB_INT_MASK_R);
-			PSB_WVDC32(dev_priv->vdc_irq_mask, PSB_INT_ENABLE_R);
-			gma_power_end(dev_priv->dev);
-		}
-	}
-}
-
 /*
  * Display controller interrupt handler for pipe event.
  */
@@ -392,92 +368,6 @@ void psb_irq_uninstall(struct drm_device *dev)
 	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
 }
 
-void psb_irq_turn_on_dpst(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv =
-		(struct drm_psb_private *) dev->dev_private;
-	u32 hist_reg;
-	u32 pwm_reg;
-
-	if (gma_power_begin(dev, false)) {
-		PSB_WVDC32(1 << 31, HISTOGRAM_LOGIC_CONTROL);
-		hist_reg = PSB_RVDC32(HISTOGRAM_LOGIC_CONTROL);
-		PSB_WVDC32(1 << 31, HISTOGRAM_INT_CONTROL);
-		hist_reg = PSB_RVDC32(HISTOGRAM_INT_CONTROL);
-
-		PSB_WVDC32(0x80010100, PWM_CONTROL_LOGIC);
-		pwm_reg = PSB_RVDC32(PWM_CONTROL_LOGIC);
-		PSB_WVDC32(pwm_reg | PWM_PHASEIN_ENABLE
-						| PWM_PHASEIN_INT_ENABLE,
-							   PWM_CONTROL_LOGIC);
-		pwm_reg = PSB_RVDC32(PWM_CONTROL_LOGIC);
-
-		psb_enable_pipestat(dev_priv, 0, PIPE_DPST_EVENT_ENABLE);
-
-		hist_reg = PSB_RVDC32(HISTOGRAM_INT_CONTROL);
-		PSB_WVDC32(hist_reg | HISTOGRAM_INT_CTRL_CLEAR,
-							HISTOGRAM_INT_CONTROL);
-		pwm_reg = PSB_RVDC32(PWM_CONTROL_LOGIC);
-		PSB_WVDC32(pwm_reg | 0x80010100 | PWM_PHASEIN_ENABLE,
-							PWM_CONTROL_LOGIC);
-
-		gma_power_end(dev);
-	}
-}
-
-int psb_irq_enable_dpst(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv =
-		(struct drm_psb_private *) dev->dev_private;
-	unsigned long irqflags;
-
-	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
-
-	/* enable DPST */
-	mid_enable_pipe_event(dev_priv, 0);
-	psb_irq_turn_on_dpst(dev);
-
-	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
-	return 0;
-}
-
-void psb_irq_turn_off_dpst(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv =
-	    (struct drm_psb_private *) dev->dev_private;
-	u32 pwm_reg;
-
-	if (gma_power_begin(dev, false)) {
-		PSB_WVDC32(0x00000000, HISTOGRAM_INT_CONTROL);
-		PSB_RVDC32(HISTOGRAM_INT_CONTROL);
-
-		psb_disable_pipestat(dev_priv, 0, PIPE_DPST_EVENT_ENABLE);
-
-		pwm_reg = PSB_RVDC32(PWM_CONTROL_LOGIC);
-		PSB_WVDC32(pwm_reg & ~PWM_PHASEIN_INT_ENABLE,
-							PWM_CONTROL_LOGIC);
-		pwm_reg = PSB_RVDC32(PWM_CONTROL_LOGIC);
-
-		gma_power_end(dev);
-	}
-}
-
-int psb_irq_disable_dpst(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv =
-	    (struct drm_psb_private *) dev->dev_private;
-	unsigned long irqflags;
-
-	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
-
-	mid_disable_pipe_event(dev_priv, 0);
-	psb_irq_turn_off_dpst(dev);
-
-	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
-
-	return 0;
-}
-
 /*
  * It is used to enable VBLANK interrupt
  */
diff --git a/drivers/gpu/drm/gma500/psb_irq.h b/drivers/gpu/drm/gma500/psb_irq.h
index 1b577fa7010a..17c9b0b62471 100644
--- a/drivers/gpu/drm/gma500/psb_irq.h
+++ b/drivers/gpu/drm/gma500/psb_irq.h
@@ -23,10 +23,6 @@ int  psb_irq_postinstall(struct drm_device *dev);
 void psb_irq_uninstall(struct drm_device *dev);
 irqreturn_t psb_irq_handler(int irq, void *arg);
 
-int psb_irq_enable_dpst(struct drm_device *dev);
-int psb_irq_disable_dpst(struct drm_device *dev);
-void psb_irq_turn_on_dpst(struct drm_device *dev);
-void psb_irq_turn_off_dpst(struct drm_device *dev);
 int  psb_enable_vblank(struct drm_crtc *crtc);
 void psb_disable_vblank(struct drm_crtc *crtc);
 u32  psb_get_vblank_counter(struct drm_crtc *crtc);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
