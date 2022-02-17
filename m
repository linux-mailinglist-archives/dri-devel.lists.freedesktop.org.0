Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FFE4B974F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B94D10E78F;
	Thu, 17 Feb 2022 03:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B8710E78F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 03:54:06 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id o9so6379657ljq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 19:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LeHMkFoNMl5wbtqitgFOACM/7bfBhWBbMxRXA4GQO3c=;
 b=xDioYM+nRwpRvXfxQySDt5SdFQTGBo0mhX+hMfNRSjFUlxmIcFJBgc06uCvTNgCaG5
 B3h66Uou9fIGxPMo7HyCPbgblIcWQMQaF19lmzr7KatsujdAqHOSehyAcilrOPbqfMy1
 uA/I/5OPtdD5JY144Q9zebvyzW8GIOUQ12LIWttCDAzBmPMLXKiF1qumTDbOqVMbNg6/
 2At+UEGHcGbGQoFUYYaXoO61WBxO4tmmFePEl58tWdgAPXEU1VRDWLh/5r1Ni3SBGH8A
 OFjmUZPfKdRYBSO7qOPJYk5C44Mf9FPHMk1meyjqbcfWIwwK743Jn9HqW0cXUWnUq/wA
 59pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LeHMkFoNMl5wbtqitgFOACM/7bfBhWBbMxRXA4GQO3c=;
 b=7mgkJ32ubGHdkRfaDhv7umZTdg+OIrTr0N0o6NgDVr2lw9TOm/95sCrgZLFnO2nbEB
 nc0sH38Us+mjLHPKkXOhqUQDm8lNsFK2p+eh/7Zn2WEGQoy8dfbiEm2kblkujUnIQW90
 wpvy6n0eqfGtHtCLkTGvcX6Ri06QQe1yQa5Fz6FAZ1kFpLoRUmTZsrKvlLCOl8+lEICo
 FYDgYwg0HsvLvEwgncF2n/1jExqYEfZfzdsGeuwFAZlemkJ9ofiZJyLjxV9g69MauLWm
 HSLyTkaxgJgWI+kKtb6l3lCjz3I7iIfvA5Ust99C6g06bhi+ArNvGvZMasC4MATR0/4k
 Bk7g==
X-Gm-Message-State: AOAM533o3So0ZF7cgUrzgQBZRR8wBNiz7LrvTztLZqoTm3YpeM3Kosze
 +TlMIGSVb09kfJ/Q9kcg6nD2sg==
X-Google-Smtp-Source: ABdhPJz+PKWLqFzChp7jfA7jBHOX8xftiL3eCkcqveRWvqbvaS4l2FiOK0ZSwpn+PFkSIlveg2cc0A==
X-Received: by 2002:a2e:3c04:0:b0:238:eb48:5fc8 with SMTP id
 j4-20020a2e3c04000000b00238eb485fc8mr895475lja.148.1645070044755; 
 Wed, 16 Feb 2022 19:54:04 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h9sm1575454ljb.77.2022.02.16.19.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:54:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 5/7] drm/msm/dpu: encoder: drop unused mode_fixup callback
Date: Thu, 17 Feb 2022 06:53:56 +0300
Message-Id: <20220217035358.465904-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
References: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  4 ----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 10 ----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 --------------
 4 files changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f5bc15b2e56e..5b2eeea37d54 100644
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
index 34a6940d12c5..45fe97fb612d 100644
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
@@ -732,7 +723,6 @@ static void dpu_encoder_phys_cmd_init_ops(
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

