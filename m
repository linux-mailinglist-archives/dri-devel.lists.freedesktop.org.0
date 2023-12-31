Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF32F82094E
	for <lists+dri-devel@lfdr.de>; Sun, 31 Dec 2023 01:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8A310E0E2;
	Sun, 31 Dec 2023 00:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9EB10E03E
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Dec 2023 00:43:59 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50e7ddd999bso4921254e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Dec 2023 16:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703983438; x=1704588238; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=i0o+ygDvKgdzg84z/yGD97dQg8nwAd++RNbp4iSd1H4=;
 b=cEi+O9LgOZj3kMOayDhVV4+lobkpPFYDQN2ATLkIclSX5e8Ac9NlNBGp6W1P+5Ughp
 sk9RnmgeZ9RAripnWHh11pIKqBZCUAe/8WZCoZNfu37gMkJocY0L5cy+Gs2DtO+Is7Q8
 O9+GuWRjn7hVWmyHXyGzNFvFSD7YUCJ76hIB1nqpGgEWfrHfAsPnIgBlXgWWn+3ovFP3
 wmU5sf+SG3oLe49IPuwZ1/PYJrC/y6HX+ueH+Wt3Xbm64nqqqxpWvEzb7oBJrygjDk2Q
 YvJsloc1nXQz0OXaySqfQu6NfIgvEKN89r5YRVHXACi9fSXXKw1kfs4j/kGHtk+jxNJG
 usIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703983438; x=1704588238;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i0o+ygDvKgdzg84z/yGD97dQg8nwAd++RNbp4iSd1H4=;
 b=nObM9UQkTeDBVW67XjpgcMEmkwoT4wio5xGoTx+twX/l6hMr9joFnfNdvFwFnanZOY
 Ws3OzvQq+UJjHC89UMlAak1Es3FPztNQesVvP3aKp2DOPp05sYWCekcfcdBznK3ugXoM
 PrNRna/zHzWpLMSfAHQh/2UZYOxVdyqXTgm24sUo9W+L1M6vrVgEIgJ6XrkoWUQD3Tlm
 3ULOHfH8tJnXHoM9JabMBw+HJYTQ0PE9XnFfv95S4tQJgKLiUDtuEfyTek7sKJ5tS3vx
 sddmafs+lJZbrSVRoX6n1lgF6wcQl85dbhfSMRo9jSN+F1LFJmHAlqFDJ9/bNP4nMHp7
 pAQA==
X-Gm-Message-State: AOJu0YzLNj8YWUdNp96V8taeh7pR7Kp+EaSa84KwkglWevkKbQlSMS2W
 zw7mxDqR5bimWbR+SnRcH1s42pbTm5NdxWW0I22E4ewurgG2Zw==
X-Google-Smtp-Source: AGHT+IFuKsyNeRIsb9xygH5jZjhnVEd6acR8l9kvPpcafsGNAEuVd0LqVjSdqOhwjSmp/ANF2Hm3Gg==
X-Received: by 2002:a05:6512:60c:b0:50b:f7bb:4545 with SMTP id
 b12-20020a056512060c00b0050bf7bb4545mr5260316lfe.68.1703983438024; 
 Sat, 30 Dec 2023 16:43:58 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05651203ed00b0050e84be8127sm1295995lfq.101.2023.12.30.16.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 16:43:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 02:43:49 +0200
Subject: [PATCH v2 02/15] drm/msm/dp: drop unused fields from dp_power_private
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-dp-power-parser-cleanup-v2-2-fc3e902a6f5b@linaro.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mPuJ0sdVtb49CzPgC03wOi5IYVOAPxO/LgrDoWoA7+M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkLlJ9pxCr+cfMbT52vEps1uINtOzZDFA5Bp0S
 JE02LmKf9GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZC5SQAKCRCLPIo+Aiko
 1YJUB/9HzfmJqtMbNuXniEQKlE2aau8EdIcJfrVD8jFUc21yySAuaqy5QLLHxYT/qktPDubQ/t2
 K0e852gS8v0R1ich+98jsWgae9PwbL2w8snsZIWP+G6sNVgGUF2n8AXyjR46zvvB+mKv7dsTTtt
 BYasWqlRqT6Oqn3TG60BzA80543KWt8nH9dJkfJ7VRIImfqPpsdQxDNaHIwHkJ/iAZl184uc8rM
 1VCLBSqF7xAVYgfDJcYX+m5bVKdh/4lKiIi4b1YF2+eNoT0AsCAtqYaxQ9p+f2ONIaetLQG0sQK
 qmKjg4QMfBkcENhDGoZPebtasnsAGMSI8EfaQTgOZexEkzz8
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop unused and obsolete fields from struct dp_power_private.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_power.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index c4843dd69f47..b095a5b47c8b 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -16,9 +16,6 @@ struct dp_power_private {
 	struct dp_parser *parser;
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct clk *link_clk_src;
-	struct clk *pixel_provider;
-	struct clk *link_provider;
 
 	struct dp_power dp_power;
 };

-- 
2.39.2

