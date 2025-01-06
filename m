Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01CDA0211E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 09:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F7210E5CC;
	Mon,  6 Jan 2025 08:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iKuxI2sV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFF810E5CA
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 08:50:16 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-aa6965ad2a5so151366566b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 00:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736153355; x=1736758155; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ywLej3GM0KyKJnGRMRgcFZSn6sceBNpXrAUD1YJ/g44=;
 b=iKuxI2sVpZiOvsxdon+lJK24vCdZJmXwGQ46Gn9jIZXHYbNQfAAt9pT5YwyDgrioZd
 19iZIzfHcRCagg5F5mexj58vHxGB406s7xDUzZmEe6DnzL7348bDwgib7DnAcd6w6moP
 NWPtA2EBNdacKZ+b01hKU9NLv6I3BW/cIV+UscWv5VGSJjgk8obWFg2OWghROi/0LEXG
 vC/Cq768sMKY5lgK5G3VyvgyYBn1YxeCj8ycrTigyEfJP0YpLY5ihZs+dGkqheRbyEjq
 11cvYyTbTVp92kOljL9oBF/1tzpw8hHDM0bYqw1S9E4LXCJv7fWyd96PKGlabkwupWcl
 +qfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736153355; x=1736758155;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ywLej3GM0KyKJnGRMRgcFZSn6sceBNpXrAUD1YJ/g44=;
 b=Y8qPgp6Gc7BwQNqrH76vf6w2A0L869DQIawhlnRtyTl0rHWVzIMc954ZXUheA66dsP
 dcEmPpfc7qG0YwiuEhtsc/GL8mALbGdT24NQbDCFVKhp2/xTdQiC/FIkQKDDuIv8GUQY
 axIUg3LRakd8m2f+7YwQoXj3Iu/iwomv9DZFkKDwRhoYzotU/6JHmghxqI8iMJehtC5q
 oEaENhSWC+xTvDCKQWxyBAIyDlADMeeqAkAvqYOtYTTLUjM+b1cx4MCYcFgFx0KsBZaY
 39feX5PFFeoS3itLL0pFj8eFWPukTjzJdttuuntO45NLT8c9xqIkEuMgB9SOLCZpRxUm
 mXmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYUpMW2K3iLObtHuAci2exCOWTi/znt5YzFTxEl/GNP8GpUYX6vb/K2j6lLgowMrHHzYLlA48LrAU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxF5T+feZDCIXia93hseOWwHWefvCSMYiRNVR4LR+eBInOTk5e8
 63drK+vBg0aATP7lscl8xpDmDsmY9J7rEcrwU608oE/E8vj0vazDuv5ws7R+9hQ=
X-Gm-Gg: ASbGncsy5fiqX4rfFbOr1+FIeVo6dPlmVNMU9zAzTPWqeW+ryAWDEPzkAfvmNfsRp7B
 WGTfBMzMf+IcWt+UnWS8lA1iY6nc3rSGQj5R8eQm9mGMiiQKVl9Ez3K+zVA5rHCsaoE6wUgOelr
 2NQa/S0HA6GKQtDLFJPkGTAsD5KEYGd+YPJQeW53R14X0z0mq84OkfMs+aj3h1AZ5X4pwSj2/0a
 gUkg8Hne7cjjuhAN0/A4HsyMk2L6YPuMDCsqE87Xc2CUZ1K61HhOJiXEtJXFkvf/rk3N6gA
X-Google-Smtp-Source: AGHT+IHKHcWYf/OgOrf9O3FcoAGEsMn4vt0y96TrbQy13IkeRq/FUB+urbvhws6fwBpAAavMVngICA==
X-Received: by 2002:a17:907:7e92:b0:aa6:9631:9222 with SMTP id
 a640c23a62f3a-aac2874a950mr1828712466b.2.1736153354990; 
 Mon, 06 Jan 2025 00:49:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f1d2sm2222112466b.11.2025.01.06.00.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 00:49:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 06 Jan 2025 09:49:04 +0100
Subject: [PATCH 1/4] drm/msm/dsi: Drop redundant NULL-ifying of clocks on
 error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-drm-msm-cleanups-v1-1-271ff1c00795@linaro.org>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
In-Reply-To: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PhVBTMK/6+dy3CEy0PY9YFYK561quc3srNdqv8QLMdg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne5kEv7KHY56NiTm9j77NT3LYMCJ8uIFoRUbF3
 5W2BFiJFq+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3uZBAAKCRDBN2bmhouD
 170CD/4vWTXyM+nvORyBOO1HAK3W0ud+c+2A8tl59Lb1I4sWHkW4LsivhtrE1Rwl5GdaJ4TjOE/
 H1S9aW6Knaj85ZbFgSn8yKFtH4gPfhlh25E+ruqAzVgR8WS+kcEjJDm6stWoH2vver59o4/PHB2
 ZyZ46MvdktfvPOVelOt11uQbshRiXDbsAFNoYKa6vIfoN5u7JYQP4yeq47XH8SpZ2Y+QtrC+Ah+
 6plefQsrq4PUjEd70qUdUNs/5dDRNj+WEAsYwa7XwfizNY9BgmzaqA0nPRJJu291mMn0q+w2cCV
 3njkqnQnLoZEyRvH2qndWKqv0Lk8Oa2aWrrZjhpP2nXUIaSfWaoYtnRvQLXBqoMmCrdClhVYm42
 OfxsGBUUZCHIJbudkTKO6McO69ugiHBMC7ELfNmZs1as1cyAAoM1yemtUhTdwumN3OXyL12so6a
 5FqymO8OhgJ5EJP+/BCcHMwMh8XFggQeYVAnf0xv0JqLB6KPIxwHTxJ5PAWImeZrcWH7svCjMwB
 8EXxbxK7fA95BKBNWO2vbgBwTdsFSobfFhDPyaX3AvfcGRNgeJnjEexIqNgyHdQWTZAOdPdq9LU
 FY/x0NonnDbO7lPSw39p/C4Kl93CNn+QGF2Vjy7GyshrYPZtwshEd9IWB69OIUDZwvmS4VWk939
 JMpdFnWtunCaGSA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

dsi_clk_init(), which gets the clocks, is called only through platform
driver probe and its failure is a failure of the probe.  Therefore
NULL-ifying specific clocks is pointless and redundant - the PTR_ERR
value stored there won't be used/dereferenced afterwards.  What's more,
variant-specific clock init calls like dsi_clk_init_6g_v2() are not
doing this cleanup.  Dropping redundant code allows later to make this a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a98d24b7cb00b41d3bb371a965a80ceaa93775a6..86ac145076416fa7651d18820266a00d28e44b6f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -292,7 +292,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 		ret = PTR_ERR(msm_host->byte_clk);
 		pr_err("%s: can't find dsi_byte clock. ret=%d\n",
 			__func__, ret);
-		msm_host->byte_clk = NULL;
 		goto exit;
 	}
 
@@ -301,7 +300,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 		ret = PTR_ERR(msm_host->pixel_clk);
 		pr_err("%s: can't find dsi_pixel clock. ret=%d\n",
 			__func__, ret);
-		msm_host->pixel_clk = NULL;
 		goto exit;
 	}
 
@@ -310,7 +308,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 		ret = PTR_ERR(msm_host->esc_clk);
 		pr_err("%s: can't find dsi_esc clock. ret=%d\n",
 			__func__, ret);
-		msm_host->esc_clk = NULL;
 		goto exit;
 	}
 

-- 
2.43.0

