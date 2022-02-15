Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E10E4B6E8F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 15:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159BA10E5F3;
	Tue, 15 Feb 2022 14:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D05610E5F4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 14:16:50 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u6so37148406lfc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 06:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zOWsFQ2NqdBKJaWz8vlkHE1lWZ3O8C4cPJw7Ctmru5A=;
 b=ar3rW97Bd/FO3/TiXMLwcY5rUfU+ObqWzWidDP6RqiKwOimcHmEUimm0UfmtFkl+ZY
 L/BEn+OZGQJnYcnOKPgy21EZ6vD0lIst/8Syl3z7NrF8Vkwh4AoFKsqVPi4jPaiWj6EJ
 e5/i8Qrd7Z9zD6epSqcnAtQBBQDURdwHriUDYextSnl+RG5HsfWloX+hVWk/cIFFfEA6
 qdBBi8D68pUh6KZ6QaGMiV9Rg/eIfqMEpB2+3Y1GLwWidsbsOaoCXAL5a7ZupVoKE5Ch
 FWqezFdsn7BthdHgOjTr47xeMKggMQA59gPGKU6PWLaKorvc7K7NqWL3D9+YDgOdcSFM
 ZJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zOWsFQ2NqdBKJaWz8vlkHE1lWZ3O8C4cPJw7Ctmru5A=;
 b=y3bTBAt5BQpLEm10CCddaHksxlukzDzhT7v4ja1xpMyCnn0rAlKOprBH6+poJRMUN4
 XQcEOWuKo8s6/paCVfM+ff6zoa39fSJrK+Kj7ZiDoJFxkHUlnXQ/oBOqHJSo7K5nw3xe
 Lh9M1nOor9KbkCrh6IgsOlL0Z4K6rtq3ZiMFq+0jyzTOKTnwcqdchip9R2MdvQ02AjJx
 aE3sjSF2rJltHU5RfnrRXWh0dalYuhHrDoBccmDXWvTrXa5zPBgMRfYUFh1/s4HcY0rm
 8FeJ0I0/DDCtbzHFnX7a/L9jw9wbiJbqciXk629u0ZwWNoMIKg+HUXZYneDeySGQhCTl
 nWng==
X-Gm-Message-State: AOAM5330Ht0kRfHC2nyjUqddoaHmtrKIdFaHvMcE8taw1+hLLC9I25cJ
 /zKkaaR4emXPGwDcfnNqjxp+Mg==
X-Google-Smtp-Source: ABdhPJwWu5XdG7swBIg4pLmlGomfy+NBGho2JRvRwq/drXs3qdUsRfmYvewCOymKNtQ43WXvP49t7w==
X-Received: by 2002:a05:6512:1081:: with SMTP id
 j1mr3247583lfg.257.1644934608816; 
 Tue, 15 Feb 2022 06:16:48 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m16sm1018044ljb.131.2022.02.15.06.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 06:16:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 5/8] drm/msm/dpu: encoder: drop unused mode_fixup callback
Date: Tue, 15 Feb 2022 17:16:40 +0300
Message-Id: <20220215141643.3444941-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both cmd and vid backends provide useless mode_fixup() callback. Drop
it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  4 ----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 10 ----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 --------------
 4 files changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 480d02ccff8c..394916e8fe08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -602,10 +602,6 @@ static int dpu_encoder_virt_atomic_check(
 		if (phys->ops.atomic_check)
 			ret = phys->ops.atomic_check(phys, crtc_state,
 					conn_state);
-		else if (phys->ops.mode_fixup)
-			if (!phys->ops.mode_fixup(phys, mode, adj_mode))
-				ret = -EINVAL;
-
 		if (ret) {
 			DPU_ERROR_ENC(dpu_enc,
 					"mode unsupported, phys idx %d\n", i);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index e7270eb6b84b..7b14948c4c87 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -84,7 +84,6 @@ struct dpu_encoder_virt_ops {
  * @is_master:			Whether this phys_enc is the current master
  *				encoder. Can be switched at enable time. Based
  *				on split_role and current mode (CMD/VID).
- * @mode_fixup:			DRM Call. Fixup a DRM mode.
  * @mode_set:			DRM Call. Set a DRM mode.
  *				This likely caches the mode, for use at enable.
  * @enable:			DRM Call. Enable a DRM mode.
@@ -117,9 +116,6 @@ struct dpu_encoder_phys_ops {
 			struct dentry *debugfs_root);
 	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
-	bool (*mode_fixup)(struct dpu_encoder_phys *encoder,
-			const struct drm_display_mode *mode,
-			struct drm_display_mode *adjusted_mode);
 	void (*mode_set)(struct dpu_encoder_phys *encoder,
 			struct drm_display_mode *mode,
 			struct drm_display_mode *adjusted_mode);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 35071964d0f6..1796f83b47ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -45,15 +45,6 @@ static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
 	return (phys_enc->split_role != ENC_ROLE_SLAVE);
 }
 
-static bool dpu_encoder_phys_cmd_mode_fixup(
-		struct dpu_encoder_phys *phys_enc,
-		const struct drm_display_mode *mode,
-		struct drm_display_mode *adj_mode)
-{
-	DPU_DEBUG_CMDENC(to_dpu_encoder_phys_cmd(phys_enc), "\n");
-	return true;
-}
-
 static void _dpu_encoder_phys_cmd_update_intf_cfg(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -756,7 +747,6 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
 	ops->is_master = dpu_encoder_phys_cmd_is_master;
 	ops->mode_set = dpu_encoder_phys_cmd_mode_set;
-	ops->mode_fixup = dpu_encoder_phys_cmd_mode_fixup;
 	ops->enable = dpu_encoder_phys_cmd_enable;
 	ops->disable = dpu_encoder_phys_cmd_disable;
 	ops->destroy = dpu_encoder_phys_cmd_destroy;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ddd9d89cd456..1831fe37c88c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -225,19 +225,6 @@ static void programmable_fetch_config(struct dpu_encoder_phys *phys_enc,
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 }
 
-static bool dpu_encoder_phys_vid_mode_fixup(
-		struct dpu_encoder_phys *phys_enc,
-		const struct drm_display_mode *mode,
-		struct drm_display_mode *adj_mode)
-{
-	DPU_DEBUG_VIDENC(phys_enc, "\n");
-
-	/*
-	 * Modifying mode has consequences when the mode comes back to us
-	 */
-	return true;
-}
-
 static void dpu_encoder_phys_vid_setup_timing_engine(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -676,7 +663,6 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_vid_is_master;
 	ops->mode_set = dpu_encoder_phys_vid_mode_set;
-	ops->mode_fixup = dpu_encoder_phys_vid_mode_fixup;
 	ops->enable = dpu_encoder_phys_vid_enable;
 	ops->disable = dpu_encoder_phys_vid_disable;
 	ops->destroy = dpu_encoder_phys_vid_destroy;
-- 
2.34.1

