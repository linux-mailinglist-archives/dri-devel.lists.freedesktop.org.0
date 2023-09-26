Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B30E47AF2B6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 20:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4217C10E424;
	Tue, 26 Sep 2023 18:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A024D10E41F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 18:24:52 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-503397ee920so15047876e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 11:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695752691; x=1696357491; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JSsmJJyHe36J6r6QQN8EBPervMH/lsHyGZmLHEQGT3w=;
 b=pEyzPCvRAPqliQtW6Ad3uTVqRSK9xNDSECAqhfqN4NMOlXSN9qLLBML/x8YC4MH9uB
 bUMHF+EoLKP4MKiTqAu+lNU623VeBYKN4OtU6vfIAHYcTevZganB0W8T0tCUFmPb5r98
 NwcUlkt94HQziRIjCjcR2ALIX9StgXDN3o/W8l4iCsnKXOh1lkgGE0Q1VA5IQXCTvE05
 5VA6Uupolseda5LCXU0o1pQ/6o41KvOBzgdn00Wcf8MTkNq3i8mywSw0qzGVkvfgXpNc
 uX8bW4Nn3+OGW3AFk6nee1n1vIwGotSd/q3IsoQvx0XhrF19Zdi7YBTJKf06HTd/z1oi
 X7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695752691; x=1696357491;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JSsmJJyHe36J6r6QQN8EBPervMH/lsHyGZmLHEQGT3w=;
 b=luzrv7VqQUh867vP/aMqYCq0ozBPduQbB0qNb8VgV5s4u9PT2Ej0qQ81Yc6A/fTAR4
 l6/g4HjyUiI1+5NpkoBgREvvBrtdNjm49HqhnM72zrGxyXzlQOAuJJE+4m1e7vXc43cK
 89ZuyTrhn2myQuEyzhQDBwrEXGL/4SpAPa9U+FQk4JrYPbdN1H6Cv5C+rOWkoPzc7NiE
 IW7ru39eomCiWDsdkAJHfttsjgFcrHzHbGkGOyj7iVb7uq57jluF6w+taZjF5IVwBm58
 bhorBDgIjogCjUUTgfw7t5RBFYztmXCATWlLMPOVNI5sGkri2sjdTkKSrhQe4QkgM8kf
 VMHA==
X-Gm-Message-State: AOJu0YzTK64eA/pYNNWewMnQN5agShJ40mQLntsAFQurPW2v3GYp9t9n
 jDMdqKJBlBjXI4cg4tJa5S7pew==
X-Google-Smtp-Source: AGHT+IFxdFFgpcBTFxSLcZfqdtgfPTF/TNGZldeq7ysgqWnx8RGOLQ5gHMDX+UzFDSjdg3j002TJ9A==
X-Received: by 2002:ac2:53ac:0:b0:503:2877:67e3 with SMTP id
 j12-20020ac253ac000000b00503287767e3mr8396426lfh.6.1695752690659; 
 Tue, 26 Sep 2023 11:24:50 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a056402151300b0053090e2afafsm7020643edw.22.2023.09.26.11.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 11:24:50 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 26 Sep 2023 20:24:40 +0200
Subject: [PATCH 5/7] arm64: dts: qcom: sc7280: Fix up GPU SIDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v1-5-7af6937ac0a3@linaro.org>
References: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
In-Reply-To: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695752677; l=1149;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=OKCYVjhQ/19k9GeBxxh+l0sjJaWU5GkjdhxKB9u2/vs=;
 b=9SVEap5bj9/9iIFUrp99rqRpCkF1yJSJnavWYyJzILyjurm26Pij46Bw+/KnOwd6frqVCvagj
 hxwquK7i3gkByj7w1dl5dnEr24gj8ym5NJr5mweF32LNem2LLWjiRad
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

GPU_SMMU SID 1 is meant for Adreno LPAC (Low Priority Async Compute).
On platforms that support it (in firmware), it is necessary to
describe that link, or Adreno register access will hang the board.

Add that and fix up the SMR mask of SID 0, which seems to have been
copypasted from another SoC.

Fixes: 96c471970b7b ("arm64: dts: qcom: sc7280: Add gpu support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index c38ddf267ef5..0d96d1454c49 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2603,7 +2603,8 @@ gpu: gpu@3d00000 {
 				    "cx_mem",
 				    "cx_dbgc";
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
-			iommus = <&adreno_smmu 0 0x401>;
+			iommus = <&adreno_smmu 0 0x400>,
+				 <&adreno_smmu 1 0x400>;
 			operating-points-v2 = <&gpu_opp_table>;
 			qcom,gmu = <&gmu>;
 			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;

-- 
2.42.0

