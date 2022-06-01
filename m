Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EF553A9CC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 17:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EB510E2BE;
	Wed,  1 Jun 2022 15:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB8E10E212
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 15:16:17 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id u23so3314850lfc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 08:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PG45RJTfQj2XjWSZj2kXhwY9Vhlgkfpe3KSbMYv1SXg=;
 b=p1VllauBtKGKdqT77TGHC9LL7sAWDf7OouqXsWRpWFzJ1mcdwsW/TV4uvyUkXSrdME
 4jT2Q3ijJEEtwUMmn5hu37yAqaRmOwiGQ95OhDFJRx23SIxEAonU1gNsxuDwerH2HiSJ
 MStrlDT0Le6gYbOrUX0ljkf/6MpAgu9JiYHhuT71eMNNyRDHIMNeMfkjsljcQlb90LHm
 KX9NdsHaUMq/G8Y5u1i9gDlZX9WpHCKPF+WGsanAadgoZqtcl3ujy+kiGG4u4IT3fvP8
 C2arI1Nx+Im1b4K8zf/V1CsIfhtzLf8SS4boFOu51QTNZNUghPSpaAqAiLMw7rtYNTar
 UtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PG45RJTfQj2XjWSZj2kXhwY9Vhlgkfpe3KSbMYv1SXg=;
 b=3WCzoiA+hUqad3FeRCgghB/6gMsnTmkmVGfqMm8WFowj2sdxRDQdWZ0eqMzoSXCjTf
 8OeymqfiBa0cuJISTMwfs84K0RxMKldR9gfBdwmwyoAT4BuCh39Xe9rG42UgliRXnGOS
 CHHsny37AHvrcXJCbkhD1jCMPFd7TQYCkwtRBSxovvZBsImAeycw3gSOT3z4ABPKni/x
 tgMHJ9+miR2gMXC5X6BYPlT5KdvobtKCYOuFA5POZAIMo3Q4lFwKNNLQti2B7FHSHCA7
 4ZDwHenh0pHkhoIMuM+VDQqq9raQNqvQAsgwD7uA9K+EHwG3DbOP0oDULC5KQ2CgWmTT
 y8Eg==
X-Gm-Message-State: AOAM532Q2Z/lhM2aR43ZRNqZKp3sGmuRzwjgGpNAXL96a+C+MooVd2yH
 69teY/fSmQHKfKPjeJa+Lh1Qxw==
X-Google-Smtp-Source: ABdhPJylxx/kpdNToX4SnH6hCWXbT9727/FxAfgTj0PhVxA5J3XD40eQDnB4ToXfXLr4ojDvMvPcJg==
X-Received: by 2002:a19:6458:0:b0:479:86:569f with SMTP id
 b24-20020a196458000000b004790086569fmr3269858lfj.377.1654096577203; 
 Wed, 01 Jun 2022 08:16:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 bp17-20020a056512159100b0047255d21186sm415294lfb.181.2022.06.01.08.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 08:16:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v1 3/5] drm/msm/dpu: remove hwversion field from data
 structures
Date: Wed,  1 Jun 2022 18:16:11 +0300
Message-Id: <20220601151613.1513554-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601151613.1513554-1-dmitry.baryshkov@linaro.org>
References: <20220601151613.1513554-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver should not depend on hw revision for detecting features.
Instead it should use features from the hw catalog. Drop the hwversion
field from struct dpu_mdss_cfg and struct dpu_hw_blk_reg_map.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c        | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c        | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c       | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c       | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c         | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c       | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c        | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h       | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c       | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c         | 1 -
 15 files changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index cff6fe3a85ac..367279371e8d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -2002,7 +2002,6 @@ struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
 	for (i = 0; i < ARRAY_SIZE(cfg_handler); i++) {
 		if (cfg_handler[i].hw_rev == hw_rev) {
 			cfg_handler[i].cfg_init(dpu_cfg);
-			dpu_cfg->hwversion = hw_rev;
 			return dpu_cfg;
 		}
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index f70de97f492a..4225f58d8f97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -826,8 +826,6 @@ struct dpu_perf_cfg {
  * @mdss_irqs:         Bitmap with the irqs supported by the target
  */
 struct dpu_mdss_cfg {
-	u32 hwversion;
-
 	const struct dpu_caps *caps;
 
 	u32 mdp_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index c33e7ef611a6..7d416bf4ae91 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -61,7 +61,6 @@ static const struct dpu_ctl_cfg *_ctl_offset(enum dpu_ctl ctl,
 			b->base_off = addr;
 			b->blk_off = m->ctl[i].base;
 			b->length = m->ctl[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_CTL;
 			return &m->ctl[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 4ad8991fc7d9..6f20d6b6dddd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -169,7 +169,6 @@ static struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
 			b->base_off = addr;
 			b->blk_off = m->dsc[i].base;
 			b->length = m->dsc[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_DSC;
 			return &m->dsc[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 355894a3b48c..3e63bf4fa64e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -83,7 +83,6 @@ static const struct dpu_dspp_cfg *_dspp_offset(enum dpu_dspp dspp,
 			b->base_off = addr;
 			b->blk_off = m->dspp[i].base;
 			b->length = m->dspp[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_DSPP;
 			return &m->dspp[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 61284e6c313d..01bb2d84c3a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -403,7 +403,6 @@ static void __intr_offset(struct dpu_mdss_cfg *m,
 {
 	hw->base_off = addr;
 	hw->blk_off = m->mdp[0].base;
-	hw->hwversion = m->hwversion;
 }
 
 struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 3f4d2c6e1b45..b2ca8d19fdd7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -80,7 +80,6 @@ static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
 			b->base_off = addr;
 			b->blk_off = m->intf[i].base;
 			b->length = m->intf[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_INTF;
 			return &m->intf[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 25d2eba28e71..b41993269d09 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -46,7 +46,6 @@ static const struct dpu_lm_cfg *_lm_offset(enum dpu_lm mixer,
 			b->base_off = addr;
 			b->blk_off = m->mixer[i].base;
 			b->length = m->mixer[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_LM;
 			return &m->mixer[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index c06d595d5df0..b053d68d38da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -26,7 +26,6 @@ static const struct dpu_merge_3d_cfg *_merge_3d_offset(enum dpu_merge_3d idx,
 			b->base_off = addr;
 			b->blk_off = m->merge_3d[i].base;
 			b->length = m->merge_3d[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_PINGPONG;
 			return &m->merge_3d[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 47c6ab6caf95..6538e195cfe9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -54,7 +54,6 @@ static const struct dpu_pingpong_cfg *_pingpong_offset(enum dpu_pingpong pp,
 			b->base_off = addr;
 			b->blk_off = m->pingpong[i].base;
 			b->length = m->pingpong[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_PINGPONG;
 			return &m->pingpong[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 0a0864dff783..ab7f1a4cc578 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -772,7 +772,6 @@ static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
 				b->base_off = addr;
 				b->blk_off = catalog->sspp[i].base;
 				b->length = catalog->sspp[i].len;
-				b->hwversion = catalog->hwversion;
 				b->log_mask = DPU_DBG_MASK_SSPP;
 				return &catalog->sspp[i];
 			}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index ab3ef162b666..12d3b0067275 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -288,7 +288,6 @@ static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,
 			b->base_off = addr;
 			b->blk_off = m->mdp[i].base;
 			b->length = m->mdp[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_TOP;
 			return &m->mdp[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index e4a65eb4f769..550b2e2b3e34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -21,14 +21,12 @@
  * @blk_off:      pipe offset relative to mdss offset
  * @length        length of register block offset
  * @xin_id        xin id
- * @hwversion     mdss hw version number
  */
 struct dpu_hw_blk_reg_map {
 	void __iomem *base_off;
 	u32 blk_off;
 	u32 length;
 	u32 xin_id;
-	u32 hwversion;
 	u32 log_mask;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index 046854c3fbed..789ecc531b43 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -223,7 +223,6 @@ static const struct dpu_vbif_cfg *_top_offset(enum dpu_vbif vbif,
 			b->base_off = addr;
 			b->blk_off = m->vbif[i].base;
 			b->length = m->vbif[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_VBIF;
 			return &m->vbif[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index bcccce292937..084439fdd3a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -63,7 +63,6 @@ static const struct dpu_wb_cfg *_wb_offset(enum dpu_wb wb,
 			b->base_off = addr;
 			b->blk_off = m->wb[i].base;
 			b->length = m->wb[i].len;
-			b->hwversion = m->hwversion;
 			return &m->wb[i];
 		}
 	}
-- 
2.35.1

