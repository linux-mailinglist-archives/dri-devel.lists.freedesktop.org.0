Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9346177BF6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 17:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557EB6E90E;
	Tue,  3 Mar 2020 16:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863B76E90E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 16:32:36 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id q9so1713437pfs.5
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 08:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=8obFbtbZXosEJKG//WZlSXOw7/1cIUl4XNv0HtqaUlo=;
 b=AK/rx03P8zzwEU/tsbGqZR+NHHpLtewT9FuZzrbN0AZosCh0QeP/h0ppzqStM5et5O
 7VN0bsmkkA6zGG2JX5Alq2aE2bN9WcEQ2Vb+fwKqZPblwN+ef97ydhQEHPDiYBJIYsdo
 2sBxzLSi7kzgvV9mGUp7OmUPeyFKzO7/ybmPjZqeEQPjOFggRtbxgk3Lk9YJLVSFTZgy
 fmqFxLWIFTkS2MdDToaDd1vyLjmnWg49v9Lrz7PJh+hqnVHJeRGsTj8OJKiGqtPawwqD
 AeebfheMeE8IBJJqyFJOkrNgVZxrH3ycK2uYcc619d52NTLp1TfQkyVxYULDJN9BBLHu
 roGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8obFbtbZXosEJKG//WZlSXOw7/1cIUl4XNv0HtqaUlo=;
 b=qypAsvK+llnxYnJrAMMGITKVT4F5VsidoLpYj8+AfyvCG1VPg8gzTA2boaTd2Fmhfg
 Yc/V4Jgu9ZsuembCeAuKn/ifEDbodlfjUJIfcZVtL54K/9ZFmxAOn2vihMOoapKx2wtX
 +LrsKYfXtnpbw5gvoFd1Qf6XZdbEJiL2BlQEGGt9jdbradHgys97ZIIA24YFg9GN5mgP
 Axg7li+mfW/ynYcaSNedulCgsZb10c9y+dkAZSJeeyOrZvPJb5+WwWObQE64pKnOe0Hk
 aEdUqGrVE4O/TrNFTIeE8X64SVTD8VrLwfSRL0j5rFr5GrD2onvathB2fIPfz7vgD9/C
 pc8w==
X-Gm-Message-State: ANhLgQ2GSlwz0zERToGY9janrgjjwbxbMlmEGdgEvYgr/Bip+lp4W3ce
 lz3sUz2wE2ON5aze3Dal/NQbKQ==
X-Google-Smtp-Source: ADFU+vv86EwZYvOoqv6IIpJ4gZzJ54FtER/PLX6g+gJjN3fjOzVkukpWM/hzrvaTm8KPy/v/uhVYIg==
X-Received: by 2002:a62:cd0a:: with SMTP id o10mr4918578pfg.18.1583253155971; 
 Tue, 03 Mar 2020 08:32:35 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 z17sm13299439pfk.110.2020.03.03.08.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 08:32:35 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: kirin: Revert "Fix for hikey620 display offset problem"
Date: Tue,  3 Mar 2020 16:32:28 +0000
Message-Id: <20200303163228.52741-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit ff57c6513820efe945b61863cf4a51b79f18b592.

With the commit ff57c6513820 ("drm: kirin: Fix for hikey620
display offset problem") we added support for handling LDI
overflows by resetting the hardware.

However, its been observed that when we do hit the LDI overflow
condition, the irq seems to be screaming, and we do nothing but
stream:
  [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
over and over to the screen

I've tried a few appraoches to avoid this, but none has yet
been successful and the cure here is worse then the original
disease, so revert this for now.

Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Rongrong Zou <zourongrong@gmail.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Chen Feng <puck.chen@hisilicon.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Fixes: ff57c6513820 ("drm: kirin: Fix for hikey620 display offset problem")
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 .../gpu/drm/hisilicon/kirin/kirin_ade_reg.h   |  1 -
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   | 20 -------------------
 2 files changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h b/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h
index 0da860200410..e2ac09894a6d 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h
@@ -83,7 +83,6 @@
 #define VSIZE_OFST			20
 #define LDI_INT_EN			0x741C
 #define FRAME_END_INT_EN_OFST		1
-#define UNDERFLOW_INT_EN_OFST		2
 #define LDI_CTRL			0x7420
 #define BPP_OFST			3
 #define DATA_GATE_EN			BIT(2)
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 73cd28a6ea07..86000127d4ee 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -46,7 +46,6 @@ struct ade_hw_ctx {
 	struct clk *media_noc_clk;
 	struct clk *ade_pix_clk;
 	struct reset_control *reset;
-	struct work_struct display_reset_wq;
 	bool power_on;
 	int irq;
 
@@ -136,7 +135,6 @@ static void ade_init(struct ade_hw_ctx *ctx)
 	 */
 	ade_update_bits(base + ADE_CTRL, FRM_END_START_OFST,
 			FRM_END_START_MASK, REG_EFFECTIVE_IN_ADEEN_FRMEND);
-	ade_update_bits(base + LDI_INT_EN, UNDERFLOW_INT_EN_OFST, MASK(1), 1);
 }
 
 static bool ade_crtc_mode_fixup(struct drm_crtc *crtc,
@@ -304,17 +302,6 @@ static void ade_crtc_disable_vblank(struct drm_crtc *crtc)
 			MASK(1), 0);
 }
 
-static void drm_underflow_wq(struct work_struct *work)
-{
-	struct ade_hw_ctx *ctx = container_of(work, struct ade_hw_ctx,
-					      display_reset_wq);
-	struct drm_device *drm_dev = ctx->crtc->dev;
-	struct drm_atomic_state *state;
-
-	state = drm_atomic_helper_suspend(drm_dev);
-	drm_atomic_helper_resume(drm_dev, state);
-}
-
 static irqreturn_t ade_irq_handler(int irq, void *data)
 {
 	struct ade_hw_ctx *ctx = data;
@@ -331,12 +318,6 @@ static irqreturn_t ade_irq_handler(int irq, void *data)
 				MASK(1), 1);
 		drm_crtc_handle_vblank(crtc);
 	}
-	if (status & BIT(UNDERFLOW_INT_EN_OFST)) {
-		ade_update_bits(base + LDI_INT_CLR, UNDERFLOW_INT_EN_OFST,
-				MASK(1), 1);
-		DRM_ERROR("LDI underflow!");
-		schedule_work(&ctx->display_reset_wq);
-	}
 
 	return IRQ_HANDLED;
 }
@@ -919,7 +900,6 @@ static void *ade_hw_ctx_alloc(struct platform_device *pdev,
 	if (ret)
 		return ERR_PTR(-EIO);
 
-	INIT_WORK(&ctx->display_reset_wq, drm_underflow_wq);
 	ctx->crtc = crtc;
 
 	return ctx;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
