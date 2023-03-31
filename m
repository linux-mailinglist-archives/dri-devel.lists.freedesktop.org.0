Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772256D14D6
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 03:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8434F10F0DE;
	Fri, 31 Mar 2023 01:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A40B10F0D1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 01:15:03 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id q14so21475609ljm.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 18:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680225302;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WZJsQk57WCVUIMbRGpk5EuvDlLybqOtHtI+G2nbIFso=;
 b=D8KSFSBSSGJFqOMXNNOCiuFF6cLNDqJKI3vB+hkEF3HG9Z4wdz5wamtmc/RGHCtK6E
 cNlqMOkHIkQlkuLr4cRP3HMT6YFhLwaQ4vY7UlTVShKqxvMhjnHmct0UQljIFIA8Jz6x
 tJidFb0nOjsIFwaiMGtBIFGI7TOPKrwn2mDKUPGphnbmwGsGInaRtFR8LSnmKbPnrSIi
 mAoKVYncjGXyRZ1S/GkgEPk3QWHDNcLN1+rUwI72h5gFHQYgjJhVcGbkVLhW2pfKHHB8
 yUFJcm9xm4Sc4BLoY3XYtb7zFIsVGg4OCRwqgk2zRWJWX38wOkmX09oU3+uHX5rz70/M
 Jbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680225302;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WZJsQk57WCVUIMbRGpk5EuvDlLybqOtHtI+G2nbIFso=;
 b=UtHFYox0iT0Qh/ymTvhKqHAQu45oLFWJ7B0X5ZpnBSKE5Ns1BPJPJcWXi5ejxhXOJB
 O5ebyzDDyUFduqyUGNn7SB4HMtD6V97JRvhn86B5xaIFaGWeeeykyuaBB1dagZ5fwXp8
 t4dCQ0/oGDeBcLSAVLnp0fHO4VDPZAPqoC/5v5vpQKFulcJAG48tcRM3bXRnlqMAy3xI
 3zv7P5ChGWomMdc1CaTIV/04NnxLk9aKG705F6GRpiAO3xhyXAWDvgoV10VeGsFJDOuY
 skFlPg3NpuyDXI56rlITEqqM6TE8wnX3gGyNdCcb4vpd4Z6ZB9pJz8AbP46I+v1Fwg4P
 wMoQ==
X-Gm-Message-State: AAQBX9eQxW/s8iAbxLd40K1710SkjAVU+SIY2d5zPMZbR4caQtwi/lP6
 yP6Se7uWYA1b0YD+bCCkzoLUcA==
X-Google-Smtp-Source: AKy350bN0vRHkarTfj7p+kxI/vAsesl0IlFFrVaUkbwYyU89Bm/V8kvmoZ7yf2tzzcmzSHxtnwWS/A==
X-Received: by 2002:a2e:998f:0:b0:2a6:16b5:2fc1 with SMTP id
 w15-20020a2e998f000000b002a616b52fc1mr1579576lji.23.1680225302618; 
 Thu, 30 Mar 2023 18:15:02 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a2e7207000000b002986854f27dsm134573ljc.23.2023.03.30.18.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 18:15:02 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 31 Mar 2023 03:14:53 +0200
Subject: [PATCH v3 5/5] arm64: dts: qcom: sm8250: Add GPU speedbin support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230331-topic-konahana_speedbin-v3-5-2dede22dd7f7@linaro.org>
References: <20230331-topic-konahana_speedbin-v3-0-2dede22dd7f7@linaro.org>
In-Reply-To: <20230331-topic-konahana_speedbin-v3-0-2dede22dd7f7@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680225294; l=2769;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=HqeX7I3FOTetdcP/eoIjPXuTw8wHKioKrQWO9/sbbPc=;
 b=wzgrdutbTKX9FfrY9LFUPMhDjNDEo4+SrLkqMv6V5PfX6iNaQWch4PLuJxwHXTHk7g1MsMg5kOBI
 ityYCqGcCx2USD9ZceGCCesjVdZrImYG7qWWu2UepIAf9GLUYALJ
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SM8250 has (at least) four GPU speed bins. With the support added on the
driver side, wire up bin detection in the DTS to restrict lower-quality
SKUs from running at frequencies they were not validated at.

Tested-by: Marijn Suijten <marijn.suijten@somainline.org> # On Sony Xperia 5 II (speed bin 0x7)
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7b78761f2041..65e6fcff2d6c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -962,6 +962,18 @@ ipcc: mailbox@408000 {
 			#mbox-cells = <2>;
 		};
 
+		qfprom: efuse@784000 {
+			compatible = "qcom,sm8250-qfprom", "qcom,qfprom";
+			reg = <0 0x00784000 0 0x8ff>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu_speed_bin@19b {
+				reg = <0x19b 0x1>;
+				bits = <5 3>;
+			};
+		};
+
 		rng: rng@793000 {
 			compatible = "qcom,prng-ee";
 			reg = <0 0x00793000 0 0x1000>;
@@ -2559,49 +2571,58 @@ gpu: gpu@3d00000 {
 
 			qcom,gmu = <&gmu>;
 
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
 			status = "disabled";
 
 			zap-shader {
 				memory-region = <&gpu_mem>;
 			};
 
-			/* note: downstream checks gpu binning for 670 Mhz */
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
 				opp-670000000 {
 					opp-hz = /bits/ 64 <670000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-supported-hw = <0xa>;
 				};
 
 				opp-587000000 {
 					opp-hz = /bits/ 64 <587000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-supported-hw = <0xb>;
 				};
 
 				opp-525000000 {
 					opp-hz = /bits/ 64 <525000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-supported-hw = <0xf>;
 				};
 
 				opp-490000000 {
 					opp-hz = /bits/ 64 <490000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-supported-hw = <0xf>;
 				};
 
 				opp-441600000 {
 					opp-hz = /bits/ 64 <441600000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-supported-hw = <0xf>;
 				};
 
 				opp-400000000 {
 					opp-hz = /bits/ 64 <400000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-supported-hw = <0xf>;
 				};
 
 				opp-305000000 {
 					opp-hz = /bits/ 64 <305000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-supported-hw = <0xf>;
 				};
 			};
 		};

-- 
2.40.0

