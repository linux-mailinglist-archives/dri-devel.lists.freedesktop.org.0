Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F457F12F7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 13:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E01910E3B8;
	Mon, 20 Nov 2023 12:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659E710E3B5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 12:13:14 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-543456dbd7bso10252940a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 04:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700482393; x=1701087193; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hc7Srsl8oO2HlJZxLPv8yK7GL1izzxy48y1+02c51Ts=;
 b=YCpiO0GC/VD57VNHQwKX0ZOq606CMN2oO5v6vb5PQODeATfAo+fnGCToc++PaWQr/s
 H1648rtCJsWp2ShAK+3An9ypTWqBHcEdZHfYO76McgYrVkdWaNMaTX98H/CMeatPsE+7
 cSwNrH6dtv4hQxzhuwu+ZeqTdFIveMLh/thn9mXbxQeCjTzkGKf+wcdeaLUV7hcj6DkN
 XBv/+ZKYeP1B9ZZ4I1K1hKvwCkPNlqou//D6hrW5e2tAim8vTxJbUviCMjfjO7o5SlqK
 xLQvBHo6s+lHXrPFmRG2h3dNutczyHqCC5EdGAsfzpECIEDTq0AM8Kb6LnwwAzlA2ikK
 k7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700482393; x=1701087193;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hc7Srsl8oO2HlJZxLPv8yK7GL1izzxy48y1+02c51Ts=;
 b=d1bOHmZgzh8ZA4KoJ14zYFVqIovu8ASnTXKrOkQEb3XCUJmZMqkhGKn+wmQdWcebuG
 wSHIYY9fgqsAeF2KioF7AEafyJst3uu5FTLeasfWBcknRH+2Pa4Z4Mda8qr3VXb5MTON
 UpPWy2ycwigT4p837Vm+AJxAkxQDBoMX6v0Ol0HpGkU0CZh8M1bNoHwuyLiPr1b8Pgm5
 +Hir1UeUIfhLIULiHoQL+cRGFSFOGfNNvJ7/4KBo8T8eBSX2eaJ7eVSz1ipm8aCCE5Dd
 +lP12K+YfH7DxRGKBJs8oBT8C0sxB2YfUd4m1za+sa13eATJ/6unXiB5dmSnhO3VyxVg
 Gv5w==
X-Gm-Message-State: AOJu0YzSi8P25HyhvfrhR1agg+YyvRT+CGUBekDV+ZXaKTITCMQEOceP
 G7QAkg8zmT3pD+zxGYONE6o7fQ==
X-Google-Smtp-Source: AGHT+IGw/4MA6a4F2ynhiVNpF2g4hzEzhrMsIOv0gcbFJUT46nhwK4WRybWUyxcnRwFshSqp3RC5UA==
X-Received: by 2002:aa7:c7cc:0:b0:548:e0e1:4a37 with SMTP id
 o12-20020aa7c7cc000000b00548e0e14a37mr517770eds.6.1700482392848; 
 Mon, 20 Nov 2023 04:13:12 -0800 (PST)
Received: from [10.167.154.1]
 (178235187204.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.204])
 by smtp.gmail.com with ESMTPSA id
 i22-20020aa7c716000000b00548ac80f90csm1324584edq.40.2023.11.20.04.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 04:13:12 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 20 Nov 2023 13:12:54 +0100
Subject: [PATCH v2 3/4] arm64: dts: qcom: sc7280: Mark Adreno SMMU as DMA
 coherent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v2-3-06fa3d899c0a@linaro.org>
References: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
In-Reply-To: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700482383; l=799;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=05mrlbVuANlpTmTxHApROoZU1kjiSPRK0BLlIaRuxCY=;
 b=N7V3LfV39ASMH6JxhCBajFYvAbuJCyrK9fNCDfTK84S8uEkPk7JXxd/ojzzIXDuqIEsSYBu02
 my03rnSOGj3BWgra7wVYH42C6VvOO2cRT3XyDapRQaF6EMOK760EeZG
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SMMUs on sc7280 are cache-coherent. APPS_SMMU is marked as such,
mark the GPU one as well.

Fixes: 96c471970b7b ("arm64: dts: qcom: sc7280: Add gpu support")
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index db47af668232..6964c14ffce5 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2787,6 +2787,7 @@ adreno_smmu: iommu@3da0000 {
 					"gpu_cc_hub_aon_clk";
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
 		};
 
 		remoteproc_mpss: remoteproc@4080000 {

-- 
2.42.1

