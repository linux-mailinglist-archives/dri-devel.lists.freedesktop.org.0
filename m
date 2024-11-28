Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095549DB59A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 11:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763C510E336;
	Thu, 28 Nov 2024 10:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fqpqtxaR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FB510E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 10:25:55 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-434a95095efso10459025e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 02:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732789554; x=1733394354; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oxD1mwK+mwBfZm5ePvwF7qngRKOmVEln2kQY0A2fNXU=;
 b=fqpqtxaRiiY5ue6d7SSFTtRi7p+8Y/p/yamGbupDWBOrClz+Bzi58KVJUo0S2/kc+M
 CI+Q59YaBnLRdZ/8ngrUNBKzKiekBi7WaGFdHYS95ocpRK/FlAKHidQnhWi7HEd/I743
 wTJ44rvhr+SWcQb4JBOnatvj/BNeHjIWiJlbjrLxR7umhHLQiZ/58kUgCHhUxnQfynw8
 NBLiARmsAbkU+IEHPj6y1wSBWA97waQE4Fb9V7HBT6Qi9ZE1V+IfOY20qoC1KNtcv/T9
 K4sZr15m3NwK7T2LSkTK2fO+Ahk/tb5+XuWC6ZoBc0A/Hu+gO2ts1qo9Mti8UVgElmyt
 eeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732789554; x=1733394354;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oxD1mwK+mwBfZm5ePvwF7qngRKOmVEln2kQY0A2fNXU=;
 b=dBxEf7v6JZc/QWAg1DfB3ArsiLq91JGeHHOCPepqMNrB8WWtEVnyYOKIPlcQg5fQJP
 nstEzIdLDorV0cQVL4zzTSoeJGJXDJjMas3V6+8KCYdOtmxdPjrrmT0ePSkmwWqP15B/
 ddMbYoeBWnufJK/GokKEW/kIIi1aFFc90p4cX79RzzoZ/inErM363pI8bQMCQaAiTiD4
 3vMYlqV74XDJ2UvR7AwhDJNdExUJUvzoheiuiKz/406vBzgy+585j3n0WO8dtGfvOBQi
 odrtXlYdDvCGGMvjKSiu/qf1l7SCDhr9pK9D73p933UBRxc5dwFrxq9oS+K//rT4RQqh
 Z5iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL599scMI+grskAXs4jJG+9tkljGu2NnRsgu7PmUKVMCbathalWe7x6onOwr8CTS41cfY++FvRCZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5pVfe9KYz5T4NhfPFxnkm2/nWsDwaoFdThhW+q+CK63yQ1Ik2
 UapiaqxgqbchsllPjvbdYyqVjBZUcicGR0J5GaemCrBlSGzPv8pRGKpd7G8fowU=
X-Gm-Gg: ASbGnctXSPAWxJKXK/PLKdPUsSvUKjazGvQ8UhJ9BLCDtZeB86uIE0FIdCDeXPiY+Vs
 OeP1XrW7lq7u2W9BoDyg0XUgdoZyYJt8Gkawwhn8EtGh/W5A+SfAgc+2NNqp6d/Jb5or9mloc3W
 LkF5QoqcOTxIwa5OEqL/mXYbl21UlM4n08sRXR3WrALGxWLVeXJcGPp99Ic0T+/ch5jc1sE6QXs
 LKNhri07QlnXBXFn8hKfRv+a0P3Wjdk+JMub7ot/Q8oqQ+ENfZpZ+ASDe/KGunVF4dowQs=
X-Google-Smtp-Source: AGHT+IH9zTsMi4bXrztoim9bnTLqQthtJbqFnNXarWSa44HOSdk7AqCzL4tsxwQbZNvxNUCZd2R14A==
X-Received: by 2002:a05:600c:5123:b0:434:9ff4:24a1 with SMTP id
 5b1f17b1804b1-434afc3e694mr22424005e9.13.1732789554035; 
 Thu, 28 Nov 2024 02:25:54 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd2db59sm1265909f8f.11.2024.11.28.02.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 02:25:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 11:25:46 +0100
Subject: [PATCH v3 6/7] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-sm8x50-gpu-bw-vote-v3-6-81d60c10fb73@linaro.org>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2162;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=SPiS1PE0VaU+lZQZUAnT3yVj+1EZ8DKyTqWi4EEzxic=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSEUp3GWqkaAyvNyjK+Commp2P2mBY+OCujX5NST8
 VlBWoKyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0hFKQAKCRB33NvayMhJ0bUTEA
 C0HDx8xWxvW60Vq1Fn6+4ZVKKnqrCLe/5/utX2NRP7PNDJFGb96Do4ba6K6JuHAwoqirVKXdhPBLDp
 OQ1/jqoPoI+P0MZ/9DDvkZihtkzl31zXJY5RS+BpsGIOudVRLY8Fcj7CnSR9C9xrqNm3KXQ6cCjCI2
 wQD47Ee6FNL/t/XurPl0ZsZTEY5S2Lytdyo7FxK0KIOjw0prOTC4YO0D7lybb+q++WKCPBpZ3goopg
 IOYWckLX+xmmrQSP50gRZ3L3cSdhV8LDfpXEg6iD+ppH2Bbs1f94q602RTLVOzsdYpghreebEi8xkx
 t6tsRvaXQewCqfvs4KukxEJfEIq6AgyUsahoEcuHOphsgowe3qvT3C70WWuJu3hCpsHr01FBf31opN
 mz0BOSmsZFaDbl/VHnzV0QVppZJ+YukA4m49gR2/VQNtwLK1cklCqCwI88gK2iwAs4RDdnnT4GYkWB
 p3VE3RWOJFQVi72pPAqxLtJEmvE+xbAsC4DHcFye1AY5rxHbQL0OW2n3sGZ02Z4EeL08P4reyFFvTB
 aniTH+u4fB+cck65b/JewYNnWWWCG9+5K70XnkbBlwsYo1ygPp07ThCDL1Ie1hee8HC/CeBaXBFqDG
 e//LsTfex1Iy1ZFFNXBucoeLHxh7/o+bMo1NWjYWXSezVEoZ39mkDLDNCETg==
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
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e7774d32fb6d2288748ecec00bf525b2b3c40fbb..545eb52174c704bbefa69189fad9fbff053d8569 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2114,6 +2114,9 @@ gpu: gpu@3d00000 {
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
 
+			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "gfx-mem";
+
 			status = "disabled";
 
 			zap-shader {
@@ -2127,41 +2130,49 @@ gpu_opp_table: opp-table {
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-615000000 {
 					opp-hz = /bits/ 64 <615000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-550000000 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-475000000 {
 					opp-hz = /bits/ 64 <475000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <8171875>;
 				};
 
 				opp-401000000 {
 					opp-hz = /bits/ 64 <401000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6671875>;
 				};
 
 				opp-348000000 {
 					opp-hz = /bits/ 64 <348000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-295000000 {
 					opp-hz = /bits/ 64 <295000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-220000000 {
 					opp-hz = /bits/ 64 <220000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-peak-kBps = <6074218>;
 				};
 			};
 		};

-- 
2.34.1

