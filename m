Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83899F185F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 23:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2448D10F0F0;
	Fri, 13 Dec 2024 22:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qj+pR3hA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5134A10F0EB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 22:14:45 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-3002c324e7eso23626921fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128083; x=1734732883; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a6/t+UEo+o4R/5x0BVa9xiJzTng+azk8DSVw42DIL44=;
 b=qj+pR3hAJoBcgTMzk04BB7wqxf1k5JOa/i9iQ8napD9y/ALGVTMknJbmuhbqlabqZO
 J4pLHcFzeQpV5lAOgCzVHmQYCJ15nQkyMEVf9aGpiOfQDTWktKBy5UVAm3Bznrrzwg+O
 FLsAzjpEJMLC2Gm0xQOQqwcb6iTdLbcv8MfUlRNiC+vRYOx6XGCg4sIGWPJ5TAJUVQt9
 vMh561veYesQ3ApF2uW3sKDxl2h/5GWtrvUfMNp0WUhRGwAvSzxMhDEF5ERZP2DKwsty
 4uP3/vtV1Tr/HHwrHoB+WxNNb0A3mCCSUk8mUgishckhYK0n2hi8mvPlwrZew02Q/oDV
 sJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128083; x=1734732883;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a6/t+UEo+o4R/5x0BVa9xiJzTng+azk8DSVw42DIL44=;
 b=ixzY6PVmZ0TWn0MdGivEe7WyGACue+rf9mY6R1enrvdoSxCPx1yoy2K651UFE9VTXa
 ZCK9WuIMAdSIQOABvdZhpjXYVCsRh26xQR0hd83xXObawpQi33DfG48WwRfGHHxCUtuq
 ruCqZsV760ILG9NkGh0dDfiUctwdhlgd9+FSZ7wRpuBxkPBfmpeGhbo536ApCvdJeFYR
 2ZyOAaDhR0yKJxV0gTB5EYqEGx70xC4FQjpWDXAdNoOt/MCigj2br7HLDsr8Q2fnYSY/
 pSplyTX1MSp1LroZ8RMnExeZWC/JkDGROcF6IUbPItY6+ox6YJf0ptDj0GQ1xBYC1zuY
 +XYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDRDXxj/nOQmFp0caHh/k21rlNKdgCrqYmUapSbrqsR0UShIcMe0eLch5J5sqRlHd5O+bedoRLafw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz684IhItKzfDTE45L7AnioX7IneEEqb+hpY5iyY8DgE5TB4Ll/
 l6nzgOOolnUQEyGTYwbZ+JG6IuBYBD1ifAhBRYNcTIhdIfjkoEYtQ2tlPz+9jWs=
X-Gm-Gg: ASbGncvw04Xlcnq1RUiOsibThn85dMXz8TRTN8E7dDYLUSgTiZqUW0nHoEc2CavJ3/f
 VH8/cN8wdfRUfHfnrFcV4S4lrpWSwg6xFcBvrB9knbziokvgUxJmzHonOUs6nHrSZxHBAzR5Hy6
 mkIG9WTkGB8swcFoH5cjNzMVleqDQwdNY4a5bCpu3i8tXyC4eDEbQ+2Yc7sqSiIIXVPriiWpQ/L
 ORmU36SDC11SRVPnHryMriYBh8tLycOrn321bDzXCmQzKTwY06Cw9Oy4KWrjFQr
X-Google-Smtp-Source: AGHT+IHkxr4X/C9aNnfH9bFExxSkoB1mD90El/rG/VeJ5/fjh3XHK+G1yR4l8HfLEZZZ7epTnoUyxQ==
X-Received: by 2002:a2e:b8d0:0:b0:300:2d54:c2c8 with SMTP id
 38308e7fff4ca-30254521f71mr13750741fa.8.1734128083581; 
 Fri, 13 Dec 2024 14:14:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:14:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:19 +0200
Subject: [PATCH 03/35] drm/msm/dpu: stop passing mdss_ver to setup_timing_gen()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-3-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3649;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=sURLU3QRO4lBSIODQBucrC/9R5zvezCH7Xkam1qgsTU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHEi5r26WnowVbacpDgVif3osRU7Lls2DTJ4
 iroXfFIqASJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxAAKCRCLPIo+Aiko
 1Y41CACbbx/PpgDANCo/yVbuGqmVnaIiPQTqCUwPuCRDf1buhfRnGzEQg+uwE8Tn4OA8qij4tlh
 kvQT3PKuwC3fkNBxYISHk2emM6FynDfv388JE9QZwS/kRzOByq03h42Qo6b0mqAUCiN5Qyw5rXX
 YplnDossOA2m2Vs8o7sMj31TzVjl7JySiotc4HQ/gnjR27UnAUtP940VcMU0vMYxvowJZRL6w+Q
 dI0xyGVVQhE5LPpolceNdxixgMZaV/8YT59gGnmRhN8Gg6arVPfzmlBo3RN8Uqu0bSAYImmIoX7
 GU3JU32h8cB+kPUI8WVgvGDEcLX6vBN4xtQBvg0L/59kM5Ra
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

As a preparation to further MDSS-revision cleanups stop passing MDSS
revision to the setup_timing_gen() callback. Instead store a pointer to
it inside struct dpu_hw_intf and use it diretly. It's not that the MDSS
revision can chance between dpu_hw_intf_init() and
dpu_encoder_phys_vid_setup_timing_engine().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 5 +++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index abd6600046cb3a91bf88ca240fd9b9c306b0ea2e..3e0f1288ad17e19f6d0b7c5dcba19d3e5977a461 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -307,8 +307,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
-			&timing_params, fmt,
-			phys_enc->dpu_kms->catalog->mdss_ver);
+			&timing_params, fmt);
 	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
 
 	/* setup which pp blk will connect to this intf */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index fb1d25baa518057e74fec3406faffd48969d492b..1d56c21ac79095ab515aeb485346e1eb5793c260 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -98,8 +98,7 @@
 
 static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 		const struct dpu_hw_intf_timing_params *p,
-		const struct msm_format *fmt,
-		const struct dpu_mdss_version *mdss_ver)
+		const struct msm_format *fmt)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
 	u32 hsync_period, vsync_period;
@@ -180,7 +179,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 
 	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
 	if (p->compression_en && !dp_intf &&
-	    mdss_ver->core_major_ver >= 7)
+	    intf->mdss_ver->core_major_ver >= 7)
 		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
 
 	hsync_data_start_x = hsync_start_x;
@@ -580,6 +579,8 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
 	c->idx = cfg->id;
 	c->cap = cfg;
 
+	c->mdss_ver = mdss_rev;
+
 	c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
 	c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
 	c->ops.get_status = dpu_hw_intf_get_status;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 114be272ac0ae67fe0d4dfc0c117baa4106f77c9..f31067a9aaf1d6b96c77157135122e5e8bccb7c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -81,8 +81,7 @@ struct dpu_hw_intf_cmd_mode_cfg {
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_timing_params *p,
-			const struct msm_format *fmt,
-			const struct dpu_mdss_version *mdss_ver);
+			const struct msm_format *fmt);
 
 	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_prog_fetch *fetch);
@@ -126,6 +125,8 @@ struct dpu_hw_intf {
 	enum dpu_intf idx;
 	const struct dpu_intf_cfg *cap;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* ops */
 	struct dpu_hw_intf_ops ops;
 };

-- 
2.39.5

