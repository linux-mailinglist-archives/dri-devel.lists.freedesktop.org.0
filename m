Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE705347B6E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2816EC4F;
	Wed, 24 Mar 2021 15:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0F16EC5C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:44 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id w37so32407072lfu.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zOtkoDiOO2j7crcK/NDW0zJrKE6imOch+G2dYhHVZU4=;
 b=rXGFoie/9yS3qzs+rJXWTT05Cj9L593a8CPJ8P7JADitduceizCaquXGeJ2dT2THGG
 l7ptbGmn9xeu5hmaAEvpiQO9qT+FwE/ECaqg3OIbG41DiXySO6h8W9f7aEUI27jVjJPu
 1ukn0MVHTlA39wHdC5r1iZPoOZ7gH06iUJRmBpBo9FqpvcudlfkwSNG3b2s+dNavzusX
 C58AlG06fKU95nLI0ivQwVshnxAxnyUoMg0h6dB+iDj43ZfRK5U3yrpxu5YV0bD5DoFO
 IExmy9X44z2IW5JhIHpUkXvTVU5ctQYX5CByMy7TzeNohgYjszcY+BuUS5LCblS1gocg
 T9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zOtkoDiOO2j7crcK/NDW0zJrKE6imOch+G2dYhHVZU4=;
 b=jeHcPz/1iJBdFFEMLXkLW5ywVGDssQAsRLPol8biMAUjRdZi+7KTK8hwBJJ69qHVVH
 XjqOlaTElP2Ff8rmcuUOAJXExbUsXYG75ETzVjFWZ6NNhJ27hf5OE8SrQ9X05ajB/vJS
 /z7Evz1wCUmjRWOGLEUW9foWlTQjGTUHLGFjltoHvPVKY4XW1maBoDv8VwKZ+TZw/uu8
 r/sXkJDdBE9CD42UqqRABhV+DCuC275CHVuBjqFzZJYv2xqs7e9g+dFd+Hrb+w6u+ojE
 +CIxtxQAqC3iF4E8e1e3AuhH1exIeVK9xhcRXAig9greWsALCQCGBJjrwwsE05VIoPg3
 wouw==
X-Gm-Message-State: AOAM533KyDpN4crXLUk6GNJCT/d8itEB4M2bPK8w8F+M5aHgWjuSvyGO
 92b5t4EiSEOfwwBv6adyLhHWPQ==
X-Google-Smtp-Source: ABdhPJwfDblbnU+Z1/65/qUpz0vpTBhQEknwMYuUiS0xokuJL1eIt7NEi2fvByDJR8ileYBvUKnNKg==
X-Received: by 2002:a19:353:: with SMTP id 80mr2095095lfd.97.1616598042791;
 Wed, 24 Mar 2021 08:00:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 10/21] drm/msm/dpu: drop dpu_hw_lm_setup_blend_config()
Date: Wed, 24 Mar 2021 18:00:13 +0300
Message-Id: <20210324150024.2768215-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DPU1 driver supports only hardware with the version of 4.0 and higher
(>= sdm845), so drop the dpu_hw_lm_setup_blend_config() used by previous
hardware generations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 26 +----------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index fd09b9ab9b4b..7d5b620f7f42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -23,9 +23,6 @@
 #define LM_FG_COLOR_FILL_SIZE            0x10
 #define LM_FG_COLOR_FILL_XY              0x14
 
-#define LM_BLEND0_FG_ALPHA               0x04
-#define LM_BLEND0_BG_ALPHA               0x08
-
 static const struct dpu_lm_cfg *_lm_offset(enum dpu_lm mixer,
 		const struct dpu_mdss_cfg *m,
 		void __iomem *addr,
@@ -117,24 +114,6 @@ static void dpu_hw_lm_setup_blend_config_sdm845(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
-static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
-	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
-{
-	struct dpu_hw_blk_reg_map *c = &ctx->hw;
-	int stage_off;
-
-	if (stage == DPU_STAGE_BASE)
-		return;
-
-	stage_off = _stage_offset(ctx, stage);
-	if (WARN_ON(stage_off < 0))
-		return;
-
-	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha);
-	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha);
-	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
-}
-
 static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	uint32_t mixer_op_mode)
 {
@@ -154,10 +133,7 @@ static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
 		unsigned long features)
 {
 	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (m->hwversion >= DPU_HW_VER_400)
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_sdm845;
-	else
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
+	ops->setup_blend_config = dpu_hw_lm_setup_blend_config_sdm845;
 	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
 	ops->setup_border_color = dpu_hw_lm_setup_border_color;
 }
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
