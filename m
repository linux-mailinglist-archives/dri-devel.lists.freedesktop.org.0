Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E47384E3EF
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE6A10E8CF;
	Thu,  8 Feb 2024 15:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GBf7w4vh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E38910E8F4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 15:20:48 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d066b82658so28292381fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 07:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707405646; x=1708010446; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NIw6ujtsUIYYYh687QbPtfZ1kCZBQ+ag1MIZhtEUr50=;
 b=GBf7w4vh1oD7+D0lc0vsztKAJrIa7ohzXTiWoBu8Yk8sBE3G1masRgQZGnRPP++EcX
 A5l66HNWAlIhDzFQ0V8wiufoY849BlTVMiurQyZpGYvG2VffTDgcHyTAL9Tp2HYi+9lR
 wUgojhZDs6o566A/zm/QRtMZawRCereRoI7fCAKjAGj8FQd2TsWj5gioxm8Qncme+WZM
 H9Q3XL8W4VOCMqZSYOT39CFxR8jwTG5aIv1l8IS0WvZT68CUwglXzSX3eMloeAGj/8rv
 /q3grdL5URR9VhFGTNlmqRW+jiyioMFibvITpSKqe9kWNcQ931Mp0CY4gMLqtSUroqUq
 cvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707405646; x=1708010446;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NIw6ujtsUIYYYh687QbPtfZ1kCZBQ+ag1MIZhtEUr50=;
 b=JA0vVprif9CQcLUGxC5BByxd7JhgMj0ch5hm6+tmWeMAjci/CcNmgLCR3MsSpI9PuI
 Tm2VkdI9TMrHaSVaA0omQMwyTGUU2MCXUSsAp+FLxC5A7UJ0IF+Azddjc5ydFSmHyfdj
 Xj/DEMURYNWDCEkFZBDS1NMblCDz8qP8WPbM4H6ixxw7k2nT7OUNUDlPQ2Mb1BGhcdLQ
 12z0IcYt6+2P9r3PSpvLfLHKhZdKeUx1siQNBNnW2E5sz3kE3wJk4EXY0vKPRLL8TjAY
 XDj/G+ETpqZvLFzhUDxiCJnIHmsC5ph+pGDKnT9mon554t2gC0Q1W7eFwPo2xJUQAK3y
 H8Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnWsO4jiS0bfZMuVDGku/GxeXlj/BbjXiYBlaN1PAv7QbDBBjVrDZL6JijnwQYXtdUvCu3wk9YY9PV40M4ZWnaj/0cQVCsnTa5XrC2yA7U
X-Gm-Message-State: AOJu0YytpyLapBb3Gwk7xmwDGTME8q+NoacMXrrNA6YkD4Pbu1zyLAnE
 2BZDBGnqIMz7DZJZvyDxMWH4vzchTz+yYyvhG3jXI8gUEbDMnNa4c+Pigq7b60Q=
X-Google-Smtp-Source: AGHT+IHUa3gcP8godZ8zMP/Vgb76O88KRC7IPF1i++7oOmKu5RlF0MOXwJ452EohWaPD1qBPeMiI1A==
X-Received: by 2002:a05:651c:1411:b0:2d0:7fea:2920 with SMTP id
 u17-20020a05651c141100b002d07fea2920mr5936722lje.37.1707405646359; 
 Thu, 08 Feb 2024 07:20:46 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX074PSmb3MxJH6z7f62I84/Hj1HiP2zETfuF+cnyoANKVme9vqMomiFu+VnGso3L2bWPTWEPfxiaeytVj2K5Kd+gIpQtAU5sG6tK0ncYfCpMSYb8zvGPsmiB4Ke5hWAe3bh8PdZgigy7y5M0uV3F5RrFiNKXCYGvhd4uRbH4urSJR0JcbkoyQ4UwbuospeEMnd7LHRFETS3dxe3uCwcyJBKXzCxSYrb/9oNB2Gqm91stElrXkfqHAUMYSi4/1Ocq62eGmDAkYbQLX2p24/67VOd3Mkxd9NDEnzLDK47Rzzk/A75QMu0WF+Lyxyf6T4rCR4kk5G9K+41EEKjpA=
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y4-20020a2e9d44000000b002d0d1caf26bsm22116ljj.7.2024.02.08.07.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 07:20:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 08 Feb 2024 17:20:45 +0200
Subject: [PATCH v4 5/5] drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-5-caf5dcd125c0@linaro.org>
References: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
In-Reply-To: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2879;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LqxWcrfLJaFrkK4+v6orB1EiRUgTIz+Y0KjbSmEnvlo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxPFK3XtHtqLmF6T6oc6gdHxFqRPBns1rxGKau
 3bNMmEW3GiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTxSgAKCRCLPIo+Aiko
 1T4kB/4tZm+QTrUbPGyYxcrusdsPBusuPHn9Pygt/e6h0MPxQcx3lSUFbnZmynckbPgczTKgwgm
 qviZsLem7X+gnpPs8PzCtZI3AxsRmGJbLq2GnejmChi64V0brHl99YnsKBH4fBiuN5bqmG65KCK
 yNpbnma/nHoA8Ux1AbnT/T+nJaIMCgM2/++iQ0ugESIbHGKAbGk8yz46kf25F8m3+UzouLIMpWA
 olLlFLj250b/NJFv99i1RO/GZ7C8/5Cdqgu6bdywgxVdcsx59f9YHddx+8/wIus+7Me3qUTEZ0K
 /iM0oRiXaqyMZ2/PP1YPiol8lvs29wYbHz5mYdXsUcUi6kkb
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

Writeback was the last user of dpu_encoder_phys_ops's atomic_check()
callback. As the code was moved to the dpu_writeback.c, the callback
becomes unused. Drop it now.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 15 ---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  4 ----
 2 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2da50ce0c999..56a2c8222dfc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -584,7 +584,6 @@ static int dpu_encoder_virt_atomic_check(
 	struct dpu_global_state *global_state;
 	struct drm_framebuffer *fb;
 	struct drm_dsc_config *dsc;
-	int i = 0;
 	int ret = 0;
 
 	if (!drm_enc || !crtc_state || !conn_state) {
@@ -605,20 +604,6 @@ static int dpu_encoder_virt_atomic_check(
 
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
-	/* perform atomic check on the first physical encoder (master) */
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-		if (phys->ops.atomic_check)
-			ret = phys->ops.atomic_check(phys, crtc_state,
-					conn_state);
-		if (ret) {
-			DPU_ERROR_ENC(dpu_enc,
-					"mode unsupported, phys idx %d\n", i);
-			return ret;
-		}
-	}
-
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 7eb8bdfe6bbe..dd9e3603d120 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -71,7 +71,6 @@ struct dpu_encoder_phys;
  *				on split_role and current mode (CMD/VID).
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
- * @atomic_check:		DRM Call. Atomic check new DRM state.
  * @control_vblank_irq		Register/Deregister for VBLANK IRQ
  * @wait_for_commit_done:	Wait for hardware to have flushed the
  *				current pending frames to hardware
@@ -96,9 +95,6 @@ struct dpu_encoder_phys_ops {
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
 	void (*enable)(struct dpu_encoder_phys *encoder);
 	void (*disable)(struct dpu_encoder_phys *encoder);
-	int (*atomic_check)(struct dpu_encoder_phys *encoder,
-			    struct drm_crtc_state *crtc_state,
-			    struct drm_connector_state *conn_state);
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
 	int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
 	int (*wait_for_tx_complete)(struct dpu_encoder_phys *phys_enc);

-- 
2.39.2

