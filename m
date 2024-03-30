Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86109892918
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 04:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E9C10E31C;
	Sat, 30 Mar 2024 03:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yaFHB3Pv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B79E10E31C
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 03:52:37 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-513e134f73aso3177796e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 20:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711770755; x=1712375555; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uSA/SKNWRohhoJyQK/SlAoPXXZhhwMJf30uvxPPaljA=;
 b=yaFHB3PvvX4GiKWiifF7lxTMNRv1FCG7CK1+eyP7r2PoFchIVCOoE4+PhVfHpJP3I1
 uFFot9dyydsa/2biCcBXPIvD2V6G7eUmtLDb2OD6XOW5YRORI0Zdzoj0KI/dMXaxlZ8q
 fq3FgYXT0y+MmTu9S0XlfRC9LuB27UVDQ3xuDFnZmzkzODw7Uj6rXFz6fRwKXFREe3Vk
 wPHPFEkhHymUyMjXf790OcQ+RFhxhw1qBuooPbBXUNerY+5YgFzxreAZ0yO2Ubau1B4l
 l1x++ggzP1SbLDJX/TXZ4TkrWqA5RtNQMQojgiC2qKJJaLer7dzMfCWmRo5xFL0NOqGf
 Ig9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711770755; x=1712375555;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uSA/SKNWRohhoJyQK/SlAoPXXZhhwMJf30uvxPPaljA=;
 b=qsTp7qgPWdGfY9inS699Rgge7hqZ/G1VNuOlc5gmPt0nnaadmFEIGSHyvVweTJDMAd
 gAqH7o8gEDfY0FyhyWZ8RwqL7Axfm7VPwR/EWU8pAvHdEgef/IvL9VKT92yGPT1wV4OK
 l2UzGsBa4L3BH79XyaTBXhjd8RDIz8CK7CWaVoiEpCbFJH2P2jV/b5GFeOfBmN0TrXwj
 lP8xrQ1973vWmTu7tkRmOvTzo380KHUhwicV23N1hj11zhpp8l8sK3ar/YK1BAS9hqhk
 SKbixR0Epoo2oqBPB6JBeazRqXHN08n3hPdF6uRjFc1SDwHM14yI2ph7OxZ4pW5nKXO9
 gUvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJCp0MkkOBS6B0NrFrdNBeO0uDMncMrwRsYQ6hxWk24HyFvnPXfTT9m2lTwYPCa468hEPkZBzZAeekI0vQPbY5qNkKvBGd5bFH51hO/zm/
X-Gm-Message-State: AOJu0YzYr9QsFmVgCd969Lck05bCsF1irC3vWmXl4RZpv8knpXnjIAfF
 hLSFg1NqKTzWN4+BGYoF8935H6hFFzG9WtN20k708UULYk8zsfVp33hvSl7F84I=
X-Google-Smtp-Source: AGHT+IFlJRR69+oen4pVxMw0Gqvq43dCgRxZPVzIGqw5ZCI7uMoYOpiHrFnqV6MrDDhhvWcn76CwZA==
X-Received: by 2002:ac2:44c1:0:b0:515:b082:817f with SMTP id
 d1-20020ac244c1000000b00515b082817fmr2931392lfm.18.1711770754464; 
 Fri, 29 Mar 2024 20:52:34 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 i15-20020a056512318f00b005162b5915b4sm86658lfe.132.2024.03.29.20.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 20:52:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Mar 2024 05:52:29 +0200
Subject: [PATCH] drm/msm/dpu: fix vblank IRQ handling for command panels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-dpu-fix-irqs-v1-1-39b8d4e4e918@linaro.org>
X-B4-Tracking: v=1; b=H4sIAH2MB2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDY2MD3ZSCUt20zArdzKLCYl1Ts9QkA4u05CTLFBMloJaColSgHNi46Nj
 aWgCpieQ0XgAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3329;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Cd4wDXm0dJqTu9lVUdgD8jllEmwa9/NyuEoxlOOn5KM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxp7T2O55IWA6hiBHWdaV1ewH7jlXLYji7NN8n1tiM26+
 3dWLrvSyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJpHJxMCyvaTRqveOXeHmT
 nON647ApagwG+zQNPZQfpGZu1LZh2qXA4rJS8HiBE3/ohfbJItlR3oFGH3MmfEqdbSD/8vji7/t
 Tt5YIPKxXmK/5sG//khL7ZpMGP/WFnrNVdpcq6usq7PcvlLu12/iOwuHam//UfOuiWR2y0l2c67
 +tYkrkP92258GZSwE8otP14oVkjilomO6W3Fkbv6jpu9rbZNkLemKKU7POLGXpq2zSv7jq/7dTB
 nNefBFp67i9+VusTNcW9V73CSc/fNruZttaeWOrvvRrVzf5l0rXT9otO6n+ol/0082qJQcerZms
 3i2btOJV48kF7Js/yKgnzuCY6SAT5tvf7nT1Vcqa7fMqAA==
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

In case of CMD DSI panels, the vblank IRQ can be used outside of
irq_enable/irq_disable pair. This results in the following kind of
messages. Move assignment of IRQ indices to atomic_enable /
atomic_disable callbacks.

[dpu error]invalid IRQ=[134217727, 31]
[drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable true/0
[drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable false/0

Fixes: d13f638c9b88 ("drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index fc1d5736d7fc..2a2b607bd1ab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -280,14 +280,6 @@ static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
 					  phys_enc->hw_pp->idx - PINGPONG_0,
 					  phys_enc->vblank_refcount);
 
-	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
-	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
-
-	if (phys_enc->has_intf_te)
-		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
-	else
-		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
-
 	dpu_core_irq_register_callback(phys_enc->dpu_kms,
 				       phys_enc->irq[INTR_IDX_PINGPONG],
 				       dpu_encoder_phys_cmd_pp_tx_done_irq,
@@ -318,10 +310,6 @@ static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
 	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_UNDERRUN]);
 	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
 	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_PINGPONG]);
-
-	phys_enc->irq[INTR_IDX_CTL_START] = 0;
-	phys_enc->irq[INTR_IDX_PINGPONG] = 0;
-	phys_enc->irq[INTR_IDX_RDPTR] = 0;
 }
 
 static void dpu_encoder_phys_cmd_tearcheck_config(
@@ -472,6 +460,14 @@ static void dpu_encoder_phys_cmd_enable(struct dpu_encoder_phys *phys_enc)
 		return;
 	}
 
+	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
+	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
+
+	if (phys_enc->has_intf_te)
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
+	else
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
+
 	dpu_encoder_phys_cmd_enable_helper(phys_enc);
 	phys_enc->enable_state = DPU_ENC_ENABLED;
 }
@@ -563,6 +559,10 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 		ctl->ops.update_pending_flush_intf(ctl, phys_enc->hw_intf->idx);
 	}
 
+	phys_enc->irq[INTR_IDX_CTL_START] = 0;
+	phys_enc->irq[INTR_IDX_PINGPONG] = 0;
+	phys_enc->irq[INTR_IDX_RDPTR] = 0;
+
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 }
 

---
base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
change-id: 20240330-dpu-fix-irqs-56eb08fcb9d4

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

