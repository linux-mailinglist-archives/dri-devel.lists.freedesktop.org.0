Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AA48AB8B9
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 04:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24ED110F076;
	Sat, 20 Apr 2024 02:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IZ1CNFAj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7029E10E4DA
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 02:33:07 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2dcbcfe117dso18430301fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 19:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713580385; x=1714185185; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qJj0NVpNzcIA0CNg6WrohgI0V5laf6VHve5Qp9ZoIKY=;
 b=IZ1CNFAjCGGD/FPgrl3pEUHho6B/2VH2fuHVQW2KyslvMAqGHADWGLhbKNkBbwwbB6
 2uafkgBU3yxMHFB1XapXcFTMrx9omiCSW64r5Nv/HBAJ9InuC66JECNwml8j+vh6VDJF
 B1FoGX09/dbIP/fZGC5rP4jbPltGHiEEH2tGeVeOMXxKH+Z0LybpHZIwWlRzP0VQlszg
 GmOhEDWnyWdd+IApkTQFcGDD+UQVB3Wn1QEJVi9Jql+khsLBnyZOLEbryFQ1yz/xw1Gp
 L/Vg+nGVCo9vHk1+tmTNtc0v8vD+w+2p72punRurotcE+aPjavFF5HA7tAT+Pkm/ncfa
 vMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713580385; x=1714185185;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qJj0NVpNzcIA0CNg6WrohgI0V5laf6VHve5Qp9ZoIKY=;
 b=ZEVpK3BmG/ZGovojBgOtoVcrUZt583yJHeKkFnhqfQ8ckZLEURTfywRC+1mTA+5Pxt
 qv7FhQoNEkoEhSMxgpHWxV1sRpBFe+KsJAIhBKlHfxFQv6k8c3/sQFEix2Dk0Nd/fTmi
 N8bTLnqY+ccKP2tLXUAqLNUYNwoeZNXj2qMR1X40ZzKqShp07d5xfipr6/yDpv95SnSE
 DIn/jCteU8fbnrUlAB1XzGOPmpWKY5g+/noAuTkWaaGn+N2qkjXzlSPcnpNbpDMJD53h
 gopbyg2V9q0bA8UtjiFcY8Y8jqrAv9NsUC/74gIQ29xQTTl1KySgH1OcJHdHG8kpR1yz
 Jsxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAE3nD1aFQOp4oyJvHoUZu2xG9iPhWFeFIOIyVjNJbi9wybzfYoI4+qC/0M6t1niXbmHfAL+As000/byq76NZdPu5Xsz6frPfrbtOnSFWt
X-Gm-Message-State: AOJu0Yw9xTZxTHX/WEkvqkZU/qUvtH8ZF2wsVy9IQN66vfuw2GgGzt9h
 Mmq7fwROXOjzI6ry2HwaNTEg23rMQ06KLzELYPZgySoG5e6hUD4WlBezXQjROXM=
X-Google-Smtp-Source: AGHT+IFNtmgoAN9iJrlmraQgNVX1ijFC+HQJZ6EhK8prwLKNP2A9W//3plzTMOlbigeGs8o7w/FVXg==
X-Received: by 2002:a2e:97d7:0:b0:2d8:63a2:50d2 with SMTP id
 m23-20020a2e97d7000000b002d863a250d2mr2556913ljj.6.1713580385656; 
 Fri, 19 Apr 2024 19:33:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 20-20020a05651c009400b002d87e936833sm836843ljq.125.2024.04.19.19.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 19:33:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 05:33:03 +0300
Subject: [PATCH 3/3] drm/msm/mdp4: correct LCDC regulator name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-mdp4-fixes-v1-3-96a70f64fa85@linaro.org>
References: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
In-Reply-To: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=htOhpHZqfkaNIIMsarbteDzLLXhNLKYXxH4xJldHcHM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmIyleo14FB77/xwSYYxgiMneE+ot1fDNFIjmne
 V8/xay4OceJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiMpXgAKCRCLPIo+Aiko
 1fkIB/9jw5evFcz1CLYKLKgH5q4mGwLaIQyHv/tH6iRQFvR6xMI6/TmOexRXBFy+v6+vCaahyro
 Iv9NkjDwMYQsIX59E8SAk6R4rAS9yvbzer0Sk3SUgRPP5qWlmqYq35vvCBWGJ6zO6iTZh9A96Bf
 /+pD3nlkklNK3V9dh1BS8FNZ4FJ3shL1uSN6vlLuOjZmC9vqNmo7K39oyK2nr4S3/1tdLvHYuwM
 dTV7eE59SkZxB6YFs8blC+vWpbpF5QCitSCjuUOs3HRnGJDL+A0pwBJ+BFmhN2lkfBuVZJkY8Ts
 VdLU9Igta71TP8G2gE7I/OMx4WhznIJ4nIuLOqcj+8Shq+wt
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

Correct c&p error from the conversion of LCDC regulators to the bulk
API.

Fixes: 54f1fbcb47d4 ("drm/msm/mdp4: use bulk regulators API for LCDC encoder")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 576995ddce37..8bbc7fb881d5 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -389,7 +389,7 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 
 	/* TODO: different regulators in other cases? */
 	mdp4_lcdc_encoder->regs[0].supply = "lvds-vccs-3p3v";
-	mdp4_lcdc_encoder->regs[1].supply = "lvds-vccs-3p3v";
+	mdp4_lcdc_encoder->regs[1].supply = "lvds-pll-vdda";
 	mdp4_lcdc_encoder->regs[2].supply = "lvds-vdda";
 
 	ret = devm_regulator_bulk_get(dev->dev,

-- 
2.39.2

