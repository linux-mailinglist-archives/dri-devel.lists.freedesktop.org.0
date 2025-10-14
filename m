Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F6DBD9651
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5D510E5F4;
	Tue, 14 Oct 2025 12:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j904v1zi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F33410E5F2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:40:05 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-46e48d6b95fso46474585e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 05:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760445604; x=1761050404; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1RYyzsf7oZTpApmmhnHm39MnizxtLSKAObcAdZ76I/g=;
 b=j904v1zi/Ctmb/sHWSmFDCYtvX8ohjXjofk6y4w5LqFxdgf0gZgpUQBuORfHC8ybg3
 twtPs3FgCBvVOQzp3ZsAe1OQqEVThQsj4WaX5v/j2gYP/eq5yUQVwzY4tyesngk29p3v
 bW10wx1icpY4i0bVgP8Q+OOkIF4luYX0Y8eeOXiCSJH2ZvG+/FiXAQ5/rEQFVpdb8MGG
 0uALC6T6ga5XWItLGX6lIlYrtIpzuPo6ejEV/Yje2jmX6giVWo0vJpyN2uYQDZFSvAw/
 YYqjpbvOc6VZ+he5muQej3EeYQxzR7Ua0IDniCaGLkMHtFyG5L/2cu1FFnJElBYF98lG
 ZzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760445604; x=1761050404;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1RYyzsf7oZTpApmmhnHm39MnizxtLSKAObcAdZ76I/g=;
 b=RNWqPUp2gdhMAO1qItHKo1XZyhnQZiZKyFpsnMPzjDdgN9omGATOTYjzjd/DBvEUGf
 14OCOTRbG5SWngcPhhrpfStZ6DSe8Qc/as7dTaYYpI1u+bfy0Zg21Kf7dYzs36+W1Ate
 gM/j5BhsBO37svxnE9kkyyCc6qK9NYkwEpIGSRTg6UlE9etOLhup1sUmNQC16rEXHh3C
 Jycq80GyJhWsgWNexYoUGS7h4Ubb2NuXSHcLaK38AwqKpn6wNDBD+W3UQ5MeguHwy/62
 6Sa01qdFYocWiX2IbqUevhmp538Pnry+8nJjipBY6KLp/YJWMqR22pldT5byAby0rwdb
 BWzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8VWqWT7FIF85T4uUkKaKiY31yWCTyA4RuejywJsLEudH9PMvYvgG2YdCNBMB/sKjWclKAYS+VA7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHC//W66DQJTLhBV3Y2jJWSwuHufZ05hiU4uigDUQ+nVe6ED7M
 N30na0VbQ59rPTU4HhE3B92Vym9a8hSOfRCcKUWwnb2I2TeNpXLwV7ev01cM6/WESR0=
X-Gm-Gg: ASbGncua99bhGRebfSQkps2kRhfoBA2BvX2bfLhKyvxnmTlLyXBGdGoNWKSPar1Kl5U
 DEbXJsVjTLmIh5y6lYo7Lw/yL9ydrF1f4gOEh4xczwWeMqgPZmVmdm4Wg83+hzuN4qitgKWlYx4
 AG53e8yu07tzc5hrDGnsP7YE2phVNmjwr3BwTKIpkeILpVa8oiBlkEoQL6MoxG2yUK9cJ+FP4Ib
 I0N4gr4lTnKb/jdE9oKUsA4Y6AS30NG5y/ienylhjUoBe3/gtNvZv+bOgaYmtaJXEScobrcxUVw
 0cVQleyCWnD2TpaLHxmoJkvZ8Uy+YRb92seTEqv6//gvrHRyxIuGsLOCZ1t5VDwwu2ssmP0zCHj
 O8XkUTJJFI8Rno7nIQ/c+cR8cG8LNJOWlwc4uFqWsBH330VF3gpjgam1VaNt6ubt7
X-Google-Smtp-Source: AGHT+IEf7Z8/P3u133rQ5LFYuWk/L8zLU2JN4M/uTzSeOh4jfJpa55YeNQBn0KZm+7kKT+tReAAC5Q==
X-Received: by 2002:a05:600c:a402:b0:46e:4705:4958 with SMTP id
 5b1f17b1804b1-46fa9b9a362mr150432245e9.30.1760445603208; 
 Tue, 14 Oct 2025 05:40:03 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482b9easm245813815e9.1.2025.10.14.05.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 05:40:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 14 Oct 2025 15:38:32 +0300
Subject: [PATCH v2 7/7] soc: qcom: ubwc: Add configuration Glymur platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
In-Reply-To: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=mQsq9Lyl9Xj4ieWxCs4ifLYeBM7hE4agqANYBsIaYvs=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo7kSLNYRKifdBgcF3xKNW0WLXs4gtszg2kFZsA
 pL/BdVpBNaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO5EiwAKCRAbX0TJAJUV
 VvKnD/sFavrflS06oimK1daRufz4+wRv0bIIBt/XB5fqDqKLrMdYTIA7A5Fsj7R08LRp5BTAcrp
 BJm0xLXVWeimbSlBheggj6qzBsm49RkBN4ZnBmdBPhiLMmzhydaU1Je7u8JUl7SoMX/AWYqBi0a
 uesyngx3xE97NQlls+wJmmzieK/dsUGa5VBFLlqh0OSNfX7cOCAWbYCePIb6bG9pWQuEH9beBBL
 p3n/QtpliEJl2jHk25LUUD41u8jOk+CV59HQdrnZpdMjSXV36M2sZfGpmOcHESc+mYACbCaQPZt
 TUC14Oy+kID1GoFwiPSlZsDx1u1dwfpJ/qjBtlP1Wbg8izyPK0tISJDXjDpJuw4hv1pG0f+w21t
 SPRTSVVHbBTDDgFAkuHREGYJnJJtmj5R+5OrYeW5ovdMYO6bYwbw/4eARHLDEHLjJ9N4ODcwm6F
 FGDbeAzXZGGpLN6oR7ZYAE2p41SYzHOy3YvTOHXIhp2S2PxUqw3xFPiuOXWtv9hmh/D2MkUBb2O
 55CEQyxkyQ6eTLUZeni7/5amUjQVto2+Ll2kZ5pINNLSzcJcR4SDFJvRh8mz9bqKNjtvq8W7Z0m
 KrBE/UfUAoDweX0ZAdmEiBfuJ4i2uLRPvCwxwpmr94rCTlZehiCcj/iXvvRPyEZ9bjGHVyIIwLe
 Uu9CvVduMzdmKSg==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Describe the Universal Bandwidth Compression (UBWC) configuration
for the new Glymur platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 15d373bff231d770e00fe0aee1b5a95c7b8a6305..7cca2afb68e3e9d33f3066f1deb3b9fcc01641a1 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -218,11 +218,23 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
 	.macrotile_mode = true,
 };
 
+static const struct qcom_ubwc_cfg_data glymur_data = {
+	.ubwc_enc_version = UBWC_5_0,
+	.ubwc_dec_version = UBWC_5_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
+	.highest_bank_bit = 16,
+	.macrotile_mode = true,
+};
+
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
+	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

-- 
2.48.1

