Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0335CA49012
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 05:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAE910EBF4;
	Fri, 28 Feb 2025 04:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xrmy/Nzn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6717D10EBEE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 04:14:14 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-546267ed92fso1706188e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 20:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740716053; x=1741320853; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BV2g354nchRnBXWZVfbxLCtDMmHT1sLILUGtzSkps/s=;
 b=Xrmy/NznvOq0eRKlcpJ+nAd6oJLs6Ds4/ViEIHuTepUQN1UghnYosJ/+uKCFDDklgI
 Ot/xqfVXjfyTTReOVN6VXe0ntkyLbYGj1D0cEIdpfyCytQ8avafTdKECLfg9Owf6R6+R
 1WVonb8E/saAm/aTVBn0zpazcrlXE7elrvfZTWbuNt294Bwjtk/HGXdiyYpKZooLjDVy
 lwGFJHULXiE/GgZWOy4cb9SvuigDtmT7Q/T1dnEuEVC0HW9clJ2D66t2RHzO562jIxVx
 UixCGmFG+Fgr5bbofDmpMJ0Rg3lLkLkNyJRKFl/SeQ1b967G/Cj30+LANAgGqOp9Y9qR
 Fvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740716053; x=1741320853;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BV2g354nchRnBXWZVfbxLCtDMmHT1sLILUGtzSkps/s=;
 b=R0JoADcPOWv0JM8dk4y9/4J6bG+sa0ojlAbBTG/h/p2GGBzuANdLkHP2pFAoOMAKAi
 HI7uLmyF34+UJwSRTcjE8huvruf+z6t5dzb9OF3a460ui/3BCaeuVhCxCYe85t456+Pd
 ZaBnb0SkYLoS21OVmo/XtamQcOvOlaAf1Ly7zOC5PynmRCDHXZT0qc1e84TB/OTDEE6+
 l5jRo0ia9r6iyef9P+xtsDWo/60oXr1iGctzpj0FitFh6psztg/T+J9w2f0tvrqkFtA1
 FkuRooq6S2zxtJy4vFsKL76Sh0eo0Nl9vK+Jio+aoWNFWqP23qSRZg94IPQpDDobygth
 i/1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1OkOtW1a7w9mqx2D/rLnyqmgIQpZNjKtH6TvsDucBHltor/ufJDo9Q5iEaTQnZFog7LNPXw9agZs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA1umqy+JguSdt6hqe3GdvUB9JJRQC9KVWsDXA8XlQcdecljXw
 tJiznpMaWz69gZIlg7TmHzu5I65Jgi/duUFTjq2rAqdxCytKtnOxdNBK1MRXWoc=
X-Gm-Gg: ASbGncvMRuxgvFz/l4eVvGWDSvCRL1LRfSC6V44s9BV1qo7hhmAVtAhScEAiJUb1aHo
 H4CD+kyCKcvE7OGTqWGGfI7Kanm+FeeeiBmkIcZGQaCRTPPYZojhVhrXH0gwA9skBavewWq/cob
 PjuXMjd3Ok3vEVq5ONb9f/q6gF3hjXiKHZyECcYBA6kNSuZbsGIB96dadQPlnqsZ00ZS6HkaAvo
 m9CkUXiqaBzyBrPRN8/U6uXHQO1btDFLFjgJG7NSwzcWLlyRDvTHMXxROYYREkmZ+ZSUV+JkuMg
 R1fvv+PO6jprt/d0leCm8f8cepEW4MMS6w==
X-Google-Smtp-Source: AGHT+IE9YBTQR0iV6z+4YepiNFtTYxrWpO2RsdsEJMdQ2gFeW5S0vYwMjTGDZ3kcFTQ5S0SfoKkU5A==
X-Received: by 2002:a05:6512:281d:b0:545:2950:5361 with SMTP id
 2adb3069b0e04-5494c129f93mr735078e87.5.1740716052705; 
 Thu, 27 Feb 2025 20:14:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441262b9sm361101e87.0.2025.02.27.20.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 20:14:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 06:14:05 +0200
Subject: [PATCH v2 1/8] drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE
 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-active-ctl-v2-1-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
In-Reply-To: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2182;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Db28RCeq/Z1F9VUkba+d3OjHCuLcQ1RUKoNZ2nefo0Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwTgOusw857TkyTSoMiWxrvJMdo3LAJUISc0/L
 9jFAe2cySKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8E4DgAKCRCLPIo+Aiko
 1QK1B/4gSzJoznIbF6hHlsqXJji1ggjQMu8PWaU29vFYaqaUN4wmnphk65OGL0wrF5300/u+ew8
 20fdZGfbJWN3TgnO/90hH51YuE9eOMeV6ruKTZoBRQyBYZ9zqrUt/67hXw2UU+0QGxVgmdpFLH2
 D5Q/wskOJ1NCiP8ETGMlaeR0cR1ONr5k+RVvNJjIIl2/Dvo/WWMqqoHQNkj5iISwTkSXGfk/PlP
 HlHh33TKB66Ei5fTrP/bfWJYe6HlgMUkOUrFHqzGgd1UyeYB5NmEFlE239EseEewJO6huzdljB3
 dgiizUDrhoXlICW5r0hgeLgqR6WQD7Ec2KhEPdZ0y8Z75QR6
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

In case of complex pipelines (e.g. the forthcoming quad-pipe) the DPU
might use more that one MERGE_3D block for a single output.  Follow the
pattern and extend the CTL_MERGE_3D_ACTIVE active register instead of
simply writing new value there. Currently at most one MERGE_3D block is
being used, so this has no impact on existing targets.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 4893f10d6a5832521808c0f4d8b231c356dbdc41..32ab33b314fc44e12ccb935c1695d2eea5c7d9b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -548,6 +548,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	u32 dsc_active = 0;
 	u32 wb_active = 0;
 	u32 mode_sel = 0;
+	u32 merge_3d_active = 0;
 
 	/* CTL_TOP[31:28] carries group_id to collate CTL paths
 	 * per VM. Explicitly disable it until VM support is
@@ -562,6 +563,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 	wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
 	dsc_active = DPU_REG_READ(c, CTL_DSC_ACTIVE);
+	merge_3d_active = DPU_REG_READ(c, CTL_MERGE_3D_ACTIVE);
 
 	if (cfg->intf)
 		intf_active |= BIT(cfg->intf - INTF_0);
@@ -572,14 +574,14 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (cfg->dsc)
 		dsc_active |= cfg->dsc;
 
+	if (cfg->merge_3d)
+		merge_3d_active |= BIT(cfg->merge_3d - MERGE_3D_0);
+
 	DPU_REG_WRITE(c, CTL_TOP, mode_sel);
 	DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
 	DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
 	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
-
-	if (cfg->merge_3d)
-		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
-			      BIT(cfg->merge_3d - MERGE_3D_0));
+	DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
 
 	if (cfg->cdm)
 		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);

-- 
2.39.5

