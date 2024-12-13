Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1D19F1866
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 23:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B4B10F0EE;
	Fri, 13 Dec 2024 22:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BvyYY4pH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41FE10F0EE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 22:14:54 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-3003c0c43c0so23514741fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128093; x=1734732893; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iJtZSquB3HDfURhgGFlz2CXT1G3f+2UMa/dHSyFOoPY=;
 b=BvyYY4pHl6Vi2LpZBFkbEzCQ6Zl+2rRb7pVKY1G8/NWGfHOren/+VlFO4mJZhqzJmj
 J8iCfE3ZAJli/KKJO35yRHlsbdtHTWDcDO422cKEsNPrUxfKU6zE3M69xh9aPm3fCRA4
 xbb0liflqW69jIsfzh5rvLs96jhyjLp0EQJumE2LUsn0JtyUA/m0xLxR6ChJOWYq7wUB
 tP7gM6VLf4oZvMJqCagLF8VDRc5M6N7JLI0s/MPFDDpjrpU2Z2AdqV1YlLMukOMV7Mzt
 mwXeC3q33v4HH0rToe2mkFIqO2QujlYoHZfFt6XNPk4/L/6F95ZLMmKFafZycsYrwyPq
 2X4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128093; x=1734732893;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iJtZSquB3HDfURhgGFlz2CXT1G3f+2UMa/dHSyFOoPY=;
 b=cnnDNJFrM/f2P+xQpypyQt/Qpe62zMAaBqORd6Bi/y+axUM+hE5D6hQfdxnnHFkvVA
 V5EkZY3UhkD9qbkBUI0htYfnyZm3WOXq7dw2rOFoeEQbBG5qZ0kBidqVFUPzBhbNUSVc
 QLgpj2f9MfL2wbiSOQZYvnvXx5Q4nyUiMtUanmQJCVAQy0pZy31ipuWtzBa3BmJNpSK+
 WY1JQaS41YOO8JWXBLzMQOS+21S9v8mXAyqGAWCz6EPuPItRU/zwBlpOrlT3o+4wSeav
 mZ7ZI6CP8S5JG6wLo6uYeOJj8xffkMWjyUnQPf0E6hXSZxh6u4q4OsWPWFgfW9nnCqfe
 oDsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUldSmiKvBMJw4+/gdRRiHOZgOoNEDm1dfs6rqMY0wSwPh9olyhd+UMEMoUIJb0nPUdVpZuyl+wb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH1ZqtjgJu+QJ0e8irKlxQtWEu9cNmso6RtV3eM/f1f9LHGxrz
 Etf2PnROSJ/x6vap1d3G0Bni4Q1pfEg9mLQ3bVZbHXYp9G036x4OTRcvpzl87hY=
X-Gm-Gg: ASbGnctgiLH/yDS7lY4wVlP/xxIkuIcbyxDZBhw2FwsSQxUrVsEbPYNh13U+P34XahH
 X1NBnRYktNJhTtGZDeGrc/HEO+pi6TMgUHy1qvtxNansTqXRObPRT/ciygDutdEQr+EwDeBJX6a
 QNhAUcxXKTxKF65hF1i8k1m+TkqfDywtzwr+js0s4VbLvOIL/kILculNK8OZXhlnpL8z2dPLPck
 Qo9TKpF9O9vaNqbM3b5HIo5HsWxrmpZOtYTm28p5xVGjJ9n+3NNPaiK/Ev/a1je
X-Google-Smtp-Source: AGHT+IGF47gos/KbiTRq1zUJvgHRDw8jwxMTDLYzMLQc/JkhDscH+dB7KQj3SsT7nqTQ9hGXODrHEw==
X-Received: by 2002:a2e:9e4c:0:b0:300:322e:6a with SMTP id
 38308e7fff4ca-3025456006bmr12271731fa.23.1734128093003; 
 Fri, 13 Dec 2024 14:14:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:14:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:23 +0200
Subject: [PATCH 07/35] drm/msm/dpu: inline _setup_dspp_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-7-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TzajbLeXFeWcm21J+7IjoKJq84HYxMWKTI0BXOLnjkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHE44BVGOKLQjlDQFY3advOwvZSm2J1OY1AG
 XfXgAAhpt+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxAAKCRCLPIo+Aiko
 1aB7B/sH1wn/y7qCaV6CgPzDrhgCQVXvSEKI+LBsjMOQYP75lbHYEr5Xf02HQQT2TTUbDIdlcss
 vbOsD+bmAYfX4pZyK6AwVZBDs2k4dwqEfCrLI9jeYK7qUi0jdmqe147Y+Dm3Gy2kncoK8+9G/Yk
 LFfWe/jMiGbDPZ7XO5NV/nlkCjyzdo2onOe5xNoeRZEeqSZJf1K5oF1RrcI4GUdGuKJLIHq9pfu
 l9xURiyRwvJh/avQhfKCd7uuEr2gBtKv8yJ0mFqe1GhtQhMGGFSeML5LZPEKhpGnPrMjjsbPf9k
 sB12UeoRn967bJoMGYGzj3XCLkKw9uj7wXC37YgWfuPMZDGU
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

Inline the _setup_dspp_ops() function, it makes it easier to handle
different conditions involving DSPP configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 829ca272873e45b122c04bea7da22dc569732e10..0f5a74398e66642fba48c112db41ffc75ae2a79f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -63,13 +63,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
 }
 
-static void _setup_dspp_ops(struct dpu_hw_dspp *c,
-		unsigned long features)
-{
-	if (test_bit(DPU_DSPP_PCC, &features))
-		c->ops.setup_pcc = dpu_setup_dspp_pcc;
-}
-
 /**
  * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
  * should be called once before accessing every DSPP.
@@ -97,7 +90,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_dspp_ops(c, c->cap->features);
+	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
+		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 
 	return c;
 }

-- 
2.39.5

