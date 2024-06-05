Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 808808FD731
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 22:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38A910E818;
	Wed,  5 Jun 2024 20:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XSOerStk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67FF10E809
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 20:10:35 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a68a288b8a4so11732666b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 13:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717618234; x=1718223034; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2zhSqnuAi2a4A8OlqdMxl1Xx25B3ZvBd8bPE6idYqUw=;
 b=XSOerStkuAfQIP9SMTQd4yF/4408IMV2i7HFOCoH21L//rxma7DycfoKY4yNPh0gwx
 XbpeD2fOS1wFlsVOeYJIKCbUqvTh5JBFmvnubdOKTlGAACU7L+qz2TcKn0XPl1ZV5dnU
 nvyQWgIA1v0Ncz/PPgMFQoQUXFrFal2mUrKUiucxxZDebkYOVD3Agzar2xuWAbjdgbuK
 +Tbqw+0HxnQQ1jg9G2CJPTFspAEhLnPN/BoQ4VARnCNsM6JroYRcR4EdZT3r1DMDgQYS
 Vhh/GfFafny2gjSUP/AlX5rgiiXsgnWCiP1p0QIjFU/s896ZuHHHBSEZvYiQX8i44FkW
 ATnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717618234; x=1718223034;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2zhSqnuAi2a4A8OlqdMxl1Xx25B3ZvBd8bPE6idYqUw=;
 b=fOHUyChDExWAo/013EdUI4cPgzOexgHifThmhn/xcuLZphjy2BoB/Le9DeHNjNo7UI
 X+xh42ORuA++qOPFzNCEswN1j5/b7y8BhrU3azo2RED/V1DBa0s/6szW6svwC7aHAuP4
 LbaMk9Xu4gKqfIcGlH0Jm4pqJX7CTIWxmZl8X5JHWtsxzCKEYTgE0qKjVY2M+SEUhmsA
 25ho96nl4QuTNpOCTddBMfTBqLjo0sSamBEmpJ81O0davpvEUuqHOuWVnp5HdBzNu0UU
 3NPW9FMsFHdI3TeoLFnP6vCQJxRW44w8/e0IflBr157nnAoiBepi5JTiyQ57807OptiC
 c69Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH+lCjhxxZHW5bvXVMziQqCIbcEQ4Jc6Ua/K6p3zUpbI5rRrENC34mG5uBnsvoYWMPHQZSFULm8IOfT3nkOjW9fQcmoi16jg8Tv5jRFcIQ
X-Gm-Message-State: AOJu0Yy7Xg9gKtw/rJQcDdTSxfYSb2LJPPCgwb74w1b1VKKuEkmB4fe3
 fASNrgW96PFxzR7qziuOA4b9G4MfCrWJ2VX+xyZcvs3CwDKNIB2/d1+bOD23REg=
X-Google-Smtp-Source: AGHT+IFDsc8B06V+5iEYvzet3jVlB0i+L5L9Nrt/H40mqNDBPty8TYTHLtrCt5rS5peLfSWm/ftVxA==
X-Received: by 2002:a50:9f2b:0:b0:578:881e:7b77 with SMTP id
 4fb4d7f45d1cf-57a8bc9c0aamr3181953a12.34.1717618233978; 
 Wed, 05 Jun 2024 13:10:33 -0700 (PDT)
Received: from [127.0.1.1] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31be4e36sm9717473a12.53.2024.06.05.13.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 13:10:33 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 05 Jun 2024 22:10:20 +0200
Subject: [PATCH v2 7/7] arm64: dts: qcom: sm8550: Wire up GPU speed bin &
 more OPPs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-topic-smem_speedbin-v2-7-8989d7e3d176@linaro.org>
References: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
In-Reply-To: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
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
X-Mailer: b4 0.14-dev
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

Add the speedbin masks to ensure only the desired OPPs are available on
chips of a given bin.

Using this, add the binned 719 MHz OPP and the non-binned 124.8 MHz.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index c55a818af935..5f5ddfe205b0 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2119,48 +2119,67 @@ zap-shader {
 				memory-region = <&gpu_micro_code_mem>;
 			};
 
-			/* Speedbin needs more work on A740+, keep only lower freqs */
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
+				opp-719000000 {
+					opp-hz = /bits/ 64 <719000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-supported-hw = <0x1>;
+				};
+
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-615000000 {
 					opp-hz = /bits/ 64 <615000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-550000000 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-475000000 {
 					opp-hz = /bits/ 64 <475000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-401000000 {
 					opp-hz = /bits/ 64 <401000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-348000000 {
 					opp-hz = /bits/ 64 <348000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-295000000 {
 					opp-hz = /bits/ 64 <295000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-220000000 {
 					opp-hz = /bits/ 64 <220000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-supported-hw = <0x3>;
+				};
+
+				opp-124800000 {
+					opp-hz = /bits/ 64 <124800000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-supported-hw = <0x3>;
 				};
 			};
 		};

-- 
2.43.0

