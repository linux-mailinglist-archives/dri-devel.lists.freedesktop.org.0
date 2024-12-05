Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA879E5926
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 16:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6097E10EEC2;
	Thu,  5 Dec 2024 15:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ezDKGwDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B168110EEBB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 15:01:28 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43497839b80so7010245e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 07:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733410887; x=1734015687; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TPWex3NjhW2vBY02766onHCegT7hgDE9dyhsg/tMa2g=;
 b=ezDKGwDVR+w6yRbxyuhEMSMY6mEdHCziSFfnzHv3+0cP5qV9XyU/tM1+ZFS5VGshP7
 7UOpVymzJCQ852V5BSx9n2sE/HcOTOkwLLLMxqE/bFqex9uYNhahEb/TjHeKbPovp5Qk
 MhGcz+O+nZ1jUBTekjcPgWqiQ0v5Mb8tMQzIqzGMPcNGRodPDCJWX97RC1b6f1rUdHrw
 sdROXRR7kQ3fn3Yio5o8QQXO3I4Wx15CGLfxKskXbndpySEE4bzjuOdtqbnHI7akmIZN
 NNtqfnNvUYv6I8zdu9whLdM89VxYCepGvvB3es4dFpCnXK09Xs9+2lK1Q95P8FclCrEl
 MnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733410887; x=1734015687;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TPWex3NjhW2vBY02766onHCegT7hgDE9dyhsg/tMa2g=;
 b=L5gLsnS8HXJy7SMzlBqojk6Zh1kuH8ANVA/ai2MxGE2l84vYzeMWNgjywXyVibI4lo
 2tVchKaVltgpAeAzbGyByVpV0F2tDwd//bHIWr32wycChNpzy/aTbIdtXTiN7/Jjm83j
 njenAFdY29IxR5FR7yKs89HZG7XDIIRri+HzzwGQLlOVGeFfulGzJlMtPwYXZz+aR2RJ
 DFQk+YgaRfLvrQZBAxO9yYIAg3+5dkPz0GP5hqyfVH0M8gVCoSMALz/lGwSQBYmvrFSK
 y0VpoIyvant8VeXJR1fnv1cQ8TY4QXPJRQReJ0NzyhQErx8XjBd7n//Gpc6TmyHGhuxX
 Xvyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNuY+rgSZGKi3uPeNrTui4m2HhY/cVoMb3QPFcnO3RlECRwEz73vP9AA1Mrhf3ZI1P+V7R5U+wo9s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxt3u/XivruSBuj4t7DdSSYeMo9+huEP3Bu+K0f47KMlJJ6VkYo
 0c28DXa0sz1jsgdV22Q+YVtAFgM9bVA0mfloSFg2acUP+Bd3p7yhyThW5LaFhxE=
X-Gm-Gg: ASbGncvYE024rYIEUY9M2TuChUIYZERicCgJGeqZTMTUDsynZKmmc0xomAwsCU5s8/3
 7BDv32ZiInjslLHc+uB3zWS4Q/u/JF1f1L7PpKP1K33jK11C2cDgxpOTTi+ej9Sd7Ey/O8vpnr1
 zgBSXGT4fSKn3hhS4E7BTRkNl5o3M7FJhjHfhriTzH71Kl9XRAge/WF2cSO3Ad9u/eet9hcUnPD
 k2ekWfyUn9MGI9RjAV3JKIE8qr6cIEftO5RyUenJE17ePbu1dqsDJFDFu11w32hJueQIDI=
X-Google-Smtp-Source: AGHT+IGKNF8m6/P0t+uOND8u3TqccJB3NWyZR7DF6laJJjSGk7SxVgGuFUCe2VWQPy6USrZuONmIlA==
X-Received: by 2002:a05:600c:4ed0:b0:434:a929:42bb with SMTP id
 5b1f17b1804b1-434d3fae263mr79611665e9.18.1733410884709; 
 Thu, 05 Dec 2024 07:01:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52c0bc7sm62830795e9.35.2024.12.05.07.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 07:01:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 05 Dec 2024 16:01:11 +0100
Subject: [PATCH v4 7/7] arm64: qcom: dts: sm8650: add interconnect and
 opp-peak-kBps for GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-topic-sm8x50-gpu-bw-vote-v4-7-9650d15dd435@linaro.org>
References: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
In-Reply-To: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2682;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IgxztTAMWyT29UYzJNKnw7bdbAV70geqeOh7ctUQCIM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUcA6jBwt5/lJeHAuMw2p6QcJ8KfjQQOOW4fyFl/Y
 WsBO3zGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1HAOgAKCRB33NvayMhJ0e20EA
 CdtdyWN37WortzYjsbLjT6L16akMfEu8GAtTyJt4D8BSQ1G0yVf0YbZhZbO+cIksZi9QkgfPsR+9eh
 73pd5WF+1wx6Navr5WyAm9I6yO0Cc3M2iVEM/nb00z6p4o5rr+N04AxVyhOnJOTFdzM92wvC9LXySn
 BBDc18x3Ka+L08ygo/P8c2Yvh4Qurr8lM4OHbwarxYl3+ZqQNC/gyt66qvTy5rohJS7Wb24yKlbl3H
 Q+8gGmjsohJoT+5Ny3E+EhZkNSWrpL2+pKOHRKpJ37jmPLfR/OM6WsinrPcMWy1WXpz/4oZTEuyjEc
 mxlspjJITpZQ3bwevUkmSBG2kKzVtTaF6S/xhzKM52T37aaXeuN/yh0vi8h6THpVuvt9d2NUSLT09x
 xgB/R7HAAD+WBpsTpCj3bVacxYuTWT9JPh0GDTGdrNCnz5rLe6Qag20/ahOEeQ0wIiuXLSdcgkxmgQ
 xBQnPUBtULm+hS0Q7V+1UFBjHBJY/iKUdT+j1W0Ma5L5tRp8cltsVqp8IsJSVioA5KVQTBw/4DD1+z
 YK9wGfi3YcITvaWCzrlEIbL2ozgfSzYF14ukaytf/4LszqCyo9PJNQJqTlTCoiW8WIOpw1aM3N2kPH
 8Gr/0CneZdDb+EXtaKOZ6Ak0uIhyt54sP9j6tp+zFeCgRGGelx4hp7g2tV9Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Each GPU OPP requires a specific peak DDR bandwidth, let's add
those to each OPP and also the related interconnect path.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 25e47505adcb790d09f1d2726386438487255824..6ee7f362dedb73bcee6e8b2a7da6b71840de9001 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2636,6 +2636,10 @@ gpu: gpu@3d00000 {
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
 
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
 			status = "disabled";
 
 			zap-shader {
@@ -2649,56 +2653,67 @@ gpu_opp_table: opp-table {
 				opp-231000000 {
 					opp-hz = /bits/ 64 <231000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-peak-kBps = <2136718>;
 				};
 
 				opp-310000000 {
 					opp-hz = /bits/ 64 <310000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-366000000 {
 					opp-hz = /bits/ 64 <366000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-422000000 {
 					opp-hz = /bits/ 64 <422000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <8171875>;
 				};
 
 				opp-500000000 {
 					opp-hz = /bits/ 64 <500000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <8171875>;
 				};
 
 				opp-578000000 {
 					opp-hz = /bits/ 64 <578000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-629000000 {
 					opp-hz = /bits/ 64 <629000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-770000000 {
 					opp-hz = /bits/ 64 <770000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-834000000 {
 					opp-hz = /bits/ 64 <834000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <16500000>;
 				};
 			};
 		};

-- 
2.34.1

