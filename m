Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ED8861EB9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 22:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B6610ECD2;
	Fri, 23 Feb 2024 21:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fhKvkLcu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8605B10ECD4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 21:21:57 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so128370466b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 13:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708723316; x=1709328116; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mjP12Zq06nby7HMeSJ/EUbYJ63ENO6BkYD8FuiAok6w=;
 b=fhKvkLcuQkwsHSp+hoQ6JMlh8wuc/G8KZEh67qnpUv4xmGgTMLkWMs7HldBRO/H7EI
 cT9VyFNU+mkM7RVr5NNNQukd31amBBuV/bs5sL5tHKldU6NyO0MBx5mbsvKrU6FIjwk2
 GGwsnZz6EzNWtQIHNJKZpU7OnZK1CwFMpiJCBg3cDWsbZXC+ZPFvkjWj8O/eXqz5fCsL
 m4w/NfxkM3BW5MjbiTf0bUFwm2OYfEAm4ksPPvFY6ovRIBBVzqdFX4l4PtyMjGQIBDRZ
 0GBrPNiaibgvDJvT3hJSAX5U15FIO6BnroWp1JKYuhGa/+1bVd0pMEVgmgw3MsyYXrwU
 HsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708723316; x=1709328116;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mjP12Zq06nby7HMeSJ/EUbYJ63ENO6BkYD8FuiAok6w=;
 b=wysjagPqSzCLcu3MrBwb5FjBcRQEeVaToD8D3tRP/QwGo2WIVhTODdldIxAPFvFNjt
 ea91yrGDxIsDr/qktXpGhlMa8HqmTg3Nm1V8euCXp2u2ehhRfQ20Xmf47S2JfyeoqES2
 nGpxOuMh5nj3pldQDWnoFXUoxSM2axbeBA3DdRq96QbJAEGrrdPkwgLb2WC4EeBPh/wA
 KKoXxkJjqcsOVEEALD6vCI2RWF6MkGqO6kE1EyTMmNIp82uaYySzggkeTJoQUE1IIlDX
 TWWu8ZW0pnhICOMGJOYQ3kjdgRe3jwq6oewm2eClV418Gt72Ukt/OsExywlmGWHWsfdv
 ik1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLLhLXY+/M6cY6Olf6p95uwsqbKjLCdrjeFz8pAvtUiK2CILerYh7SPwm12ZxaAPqyXDXrhQFaJl6Y4Zdd796uYe2dxrB8Lb6sqeNEmrf1
X-Gm-Message-State: AOJu0YybWPCgv+ssz6+HQMzHGncfi1rsk9cQHY0CjXWWkts27PxD+PIb
 AWT/CiCBzpKhr8fAmg2gNfiEA7vfUR5C5F5a5MvFuYDVf9TMlEvdaLBl3j+VvjU=
X-Google-Smtp-Source: AGHT+IElLGA1VQIlXAlt56rTNEpM3OmiudTre3s73PFHTGooTnhMqgF/0YDNxtDTUSbwvvaMjDFiOA==
X-Received: by 2002:a17:906:a38b:b0:a3f:721f:a7ac with SMTP id
 k11-20020a170906a38b00b00a3f721fa7acmr600921ejz.45.1708723315809; 
 Fri, 23 Feb 2024 13:21:55 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 mj8-20020a170906af8800b00a3ee9305b02sm4091226ejb.20.2024.02.23.13.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 13:21:55 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 23 Feb 2024 22:21:40 +0100
Subject: [PATCH v2 4/7] drm/msm/adreno: Add missing defines for A702
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-topic-rb1_gpu-v2-4-2d3d6a0db040@linaro.org>
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708723303; l=1379;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=2VUaTHaFXwk9sVr7gsAachnQpNO5KMem0UoFA2HST7g=;
 b=NXYDavFJ3TC/4KiU+OLYy06EnXZgFmyjLCFX7iZKoUTbin8UI3o1WKHxiAxISRJ/Lpa8whlgL
 OmvgcvRyQ93Bgd7cMUYUQkgAXoezpOmzuvOSNtRIQf2InPOAkx5rZ92
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

Add some defines required for A702. Can be substituted with a header
sync after merging mesa!27665 [1].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27665
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx.xml.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index 863b5e3b0e67..1ec4dbc0e746 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -1945,6 +1945,24 @@ static inline uint32_t REG_A6XX_RBBM_PERFCTR_RBBM_SEL(uint32_t i0) { return 0x00
 
 #define REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE			0x00000122
 
+#define REG_A6XX_RBBM_CLOCK_CNTL_FCHE				0x00000123
+
+#define REG_A6XX_RBBM_CLOCK_DELAY_FCHE				0x00000124
+
+#define REG_A6XX_RBBM_CLOCK_HYST_FCHE				0x00000125
+
+#define REG_A6XX_RBBM_CLOCK_CNTL_MHUB				0x00000126
+
+#define REG_A6XX_RBBM_CLOCK_DELAY_MHUB				0x00000127
+
+#define REG_A6XX_RBBM_CLOCK_HYST_MHUB				0x00000128
+
+#define REG_A6XX_RBBM_CLOCK_DELAY_GLC				0x00000129
+
+#define REG_A6XX_RBBM_CLOCK_HYST_GLC				0x0000012a
+
+#define REG_A6XX_RBBM_CLOCK_CNTL_GLC				0x0000012b
+
 #define REG_A7XX_RBBM_CLOCK_HYST2_VFD				0x0000012f
 
 #define REG_A6XX_RBBM_LPAC_GBIF_CLIENT_QOS_CNTL			0x000005ff

-- 
2.43.2

