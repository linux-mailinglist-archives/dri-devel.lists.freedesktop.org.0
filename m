Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AD58406B0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 14:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285B410F72F;
	Mon, 29 Jan 2024 13:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7FA10F72B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 13:20:14 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a35e9161b8cso66211166b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 05:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706534353; x=1707139153; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=avsFIxhX/jtxHDt6bjDOfQ40vEVTMaWnxh/VVgqRP8I=;
 b=wrApILif6SqZ/EyM56wALBtx1r1rOcAzPfGR5SIVLwH6ojh7+lCda7spIGwMKmnO06
 u6yk4/Je6DAeQrQhsBR78/lfd9arogp57wdvzhMMvfZhz4v057QTNMzapFSf0iMIkYbH
 GeQzr9yJJ/GVLKWsIIM6hOyCXD9yj3yY5OK891NI62YCN1wEPRDL1IEYmISGJX0fxuPD
 REzAMe6XtlbLr1rpriFQiKlqvmizf3Iny/WtvK3i3Zc1Y6vW43LwIoyLxpgq8WC6j8nK
 MIoDxWmOl3/3Pp+Zdea3V2HiiSO571FKRsDkGjzhkwQwg/G+BLRr9JSVM1XWZJ3fevIE
 xlwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706534353; x=1707139153;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=avsFIxhX/jtxHDt6bjDOfQ40vEVTMaWnxh/VVgqRP8I=;
 b=sAvFqY4dIljkwMRLzIQQ/THIypTOA6EIRCiKKGJw05foGn6LD/01fNE0037JB0frzx
 eK85DrqrncZ01zmqnLJByqN9gD/rYyrrvzfqjb5KRI4YtDPYZzCH/R2DnPC/zufnwDZy
 Rn+GjbsLtiIC8o4JCWN7uIqZAOithr859jWeY2mC5gx+rrPmsjS85ElcERXODEwRfXGq
 dldHqeiY3E76++I/1GnVE8rjWwwDHgoVxequUBbMWJcxyzx4NZmu1JE/eHRNDWSGJTos
 ccyGRUa2vipkOFeQUVP4WrZz2eNN0ER0+vwkKV9Dle+PbvpGPT/158hgYemr59HW6mV8
 59xA==
X-Gm-Message-State: AOJu0YztzuzPLnai1utazwSEu03dI7GDYzA1BNdJKwi1uO1o3Pym8taE
 AyzphRI7R/IXzBSLKJtLCcd0pnUw1VYf4w3pmQfKR0Xw1mDCWmBzUQ4koBpQfhc=
X-Google-Smtp-Source: AGHT+IHeG6mDUl+ksN0m3/oS9noMoULpS/ssljn6bdDUjLBizSFE1Oo68zXcRckMajlrJwPoI0Hwag==
X-Received: by 2002:a17:906:c343:b0:a30:fba8:8fe1 with SMTP id
 ci3-20020a170906c34300b00a30fba88fe1mr4296187ejb.21.1706534352761; 
 Mon, 29 Jan 2024 05:19:12 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25]) by smtp.gmail.com with ESMTPSA id
 q15-20020a17090622cf00b00a359afad88dsm1591658eja.10.2024.01.29.05.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 05:19:12 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 29 Jan 2024 15:18:56 +0200
Subject: [PATCH 3/5] drm/msm: mdss: Add X1E80100 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-x1e80100-display-v1-3-0d9eb8254df0@linaro.org>
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
In-Reply-To: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=rfGkK17/i+BleU3qzcJWNOMRKGI09BZOvobQeTG7kY0=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlt6XH99bhpkCbAVQ3v7T0Zu5dazEjO8JPZDEyT
 B5uByWz/JaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbelxwAKCRAbX0TJAJUV
 Vvy1D/9B9s4n/T4FadLNi76W26+2YKGm3mcG+yf6nOSpCieYzh7MBGwlQQfu6eFB2+RUss76VeV
 Mc5xb1pQZULcW9U1M72fJfZ6kKPsDG4xbKHrtJ3PvR0waNTrRv0jAcGU4MW1/2rdvInN7LDBVS+
 u6BG0JXGh3dZ0wmOnYzke6YIzL16URZv83iNgJTR+QKUObkbW9zNqWNU1WdQrgEJNO9XZFBcH5h
 Ls26Q7amA6HuoaCqGsAwPjtTQwm1DsHzoYoXIXWLxueQ9efGJBlboHsatloAHFEXdonSzZLF0nY
 xjT7x8U6VW9UkI4w1f+1uY5uteZLjJgtT/2ULqRlzkIlJ1WOTVCtXy4CsEGvrC+wSrMGGQdcpJ6
 Hh6L7ZqW6Qwc6xfl6J/LGHgZVQFU6nMOMa3jvGxDTia533+4CSC85WiYHUab0SbtIy0Wwg98IYk
 eeMWF7kcv1qPfsvI+gbLSxzlYB1rmalHi0AKBbk7UYyIndqoyHvn5Z0V1J/ztjB7zMq2kzew8id
 Rtuc3MmHsxerYq3SJNicAypaC4NObHpVqHYRuEVCmgOe8WWSB4QYyj2NiKozrzTx2NgrM90Oi82
 cLQpit73LcVtcimvIiOB33tT1fBlXAMVqgHIFpmFxK6Bnscz7d5pTipYewQURemNMR+oASgC2/C
 x6PXzS1yvt4z8Dw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abel Vesa <abel.vesa@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for MDSS on X1E80100.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 455b2e3a0cdd..eddf7fdbb60a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -564,6 +564,15 @@ static const struct msm_mdss_data sdm670_data = {
 	.highest_bank_bit = 1,
 };
 
+static const struct msm_mdss_data x1e80100_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	.highest_bank_bit = 2,
+	.macrotile_mode = 1,
+};
+
 static const struct msm_mdss_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
@@ -655,6 +664,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
+	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);

-- 
2.34.1

