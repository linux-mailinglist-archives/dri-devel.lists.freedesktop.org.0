Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC2A899830
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 10:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90FF113A8A;
	Fri,  5 Apr 2024 08:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bzU3PZ1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC4F113A89
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 08:41:42 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d71765d3e1so23057871fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 01:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712306500; x=1712911300; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=spb6697ES9tKN5pBQWfHJLIqG/6QeQNQA/25IsUNPBw=;
 b=bzU3PZ1IHB7DrBGxHmGTR1dec2fZt5b3LWQJKRDE6kGjpcdNVB/H8aMTNw3m+Zu8yr
 jhs0WVGNm84JQDyF2TMvMQCXtlExwM1+OurS1TagCV11zUfMrEhsAGgP4sSkB6wkr3sY
 rCgDPovi1s4imR61BL60mayWIOH6hgW1cxuzDFBZ3XwZ8lDydxV7S+FsYOkaaTCTFjR7
 cQgZ1LIRYHoFuQewFoqFAGpabOmeowIAQmNpYVN3AZS2vbCKJttS2LC6ENgwx8VtLS5R
 VX0y663E4n2zV9NmWlEEbr1VZw3yI/Mv9MN7Ohf+l/EGwVuWT0cC7VjNelsuEjfjJDN7
 yTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712306501; x=1712911301;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=spb6697ES9tKN5pBQWfHJLIqG/6QeQNQA/25IsUNPBw=;
 b=dN4/m/fMyl8Kr22vY82JZ0fXmEX1oVjBODAYPswUICNyrAf7H4Co3bfVb98TLQXFwO
 L60dKJh2s4+NLM/5yNiyJC4ErMqnczd4f2S8X5QDJGKTkmzMgaPsC5fNhNcD2Wj89i5X
 B8IsVbGjCvVs/cdbSHDWrfRonlWkDl/fbFsFUE0OXRdXaZ7OwQS4ueQ9Bf9mSjoGewQH
 VKnLWKHa0DxZihKMpK/n6UHBcftjYu5vmQygnePmP7x3+DtbfOruoIz0dmKvPI20okzW
 1rKCdUqc5q68HdgxnJe4A8Qif2ePiuEpyVUzHrFiGeSESdACr4iaK6Eh0+ciNSlpbUIy
 RVMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfGTCOrLYwTXuAmAgDdEjHTJysDAV7JcPi3LZ0v/+8H46R6rDVkjrQXVbTq3XBo5XFja+/5KKnyyEL1bJ2WcYBkCDxcGXrTx4+uOwcqrSZ
X-Gm-Message-State: AOJu0YyhbI1nTK1ZWdyQCZp91hbmAE0ZztAC8o0aBfyoqFe1tRPO712K
 Iv69qxH6X8GmL6CMWgpE4idsLMzyY05x8rNa0WkjzQ31j8dubMjNZAExDxTy6gA=
X-Google-Smtp-Source: AGHT+IEthjZxoBWTyYrykDhAmO05yKCnP9Kxxsc14FPETpPEiRbZkTbG7cBkSGtbDOlRlysEyAg8fw==
X-Received: by 2002:a2e:b282:0:b0:2d6:d7ff:5d40 with SMTP id
 2-20020a2eb282000000b002d6d7ff5d40mr854824ljx.38.1712306500761; 
 Fri, 05 Apr 2024 01:41:40 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-101.pol.akademiki.lublin.pl.
 [87.246.222.101]) by smtp.gmail.com with ESMTPSA id
 y3-20020a05651c020300b002d429304a20sm116880ljn.8.2024.04.05.01.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 01:41:40 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 05 Apr 2024 10:41:33 +0200
Subject: [PATCH 5/6] drm/msm/adreno: Add speedbin data for SM8550 / A740
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240405-topic-smem_speedbin-v1-5-ce2b864251b1@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
In-Reply-To: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c
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

Add speebin data for A740, as found on SM8550 and derivative SoCs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 901ef767e491..c976a485aef2 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -570,6 +570,20 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a740_zap.mdt",
 		.hwcg = a740_hwcg,
 		.address_space_size = SZ_16G,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ ADRENO_SKU_ID(SOCINFO_PC_UNKNOWN, SOCINFO_FC_AC), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_PC_UNKNOWN, SOCINFO_FC_AF), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_PCn(1), SOCINFO_FC_UNKNOWN), 1 },
+			{ ADRENO_SKU_ID(SOCINFO_PCn(2), SOCINFO_FC_Yn(0x0)), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_PCn(2), SOCINFO_FC_Yn(0x2)), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_PCn(4), SOCINFO_FC_Yn(0x0)), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_PCn(4), SOCINFO_FC_Yn(0x2)), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_PCn(6), SOCINFO_FC_Yn(0x0)), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_PCn(6), SOCINFO_FC_Yn(0x1)), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_PCn(6), SOCINFO_FC_Yn(0xd)), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_PCn(6), SOCINFO_FC_Yn(0xe)), 0 },
+		),
+		.default_speedbin = 1,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
 		.family = ADRENO_7XX_GEN3,

-- 
2.40.1

