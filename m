Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0458F9EC744
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 09:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AFC10EABD;
	Wed, 11 Dec 2024 08:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HJOe5CGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DE210EABD
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 08:30:09 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3862a4b8ec2so2675822f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733905808; x=1734510608; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B4/tn0+NaXoZvCxd7DO6dwQt1/7UILyIFVNQSPfY62g=;
 b=HJOe5CGR11DeI5xikr58iKPgQzZoWZ91AM/xQ2ip5OsA/tfoKHQcqwtCy9YORExaVC
 EbHVMDwzAf63aqtqXf0czk82Vh4OphhYRxfydCFF/Yt0foUwZFrsJUZ8z3ZhNSJhkZ38
 RiiTS3wg6uWWEarRb5s2NZHRV6ceGtDTu5aOuJBB4NoLJHBQLCtG9Y3coWho2u8kAget
 p2oOj1+Qu60syQtfrVZlzHu4lMj4/zqyWnuKkXsMz1Va40miNMf+6AqhhqdM5CzXpZK/
 X4Z/e4XlgwSyyg0zjZ9qTUEDaFQmDYglmNAKwrXi+xvCgofYe4Qt2OpNSQsIFhc/woXu
 9o5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733905808; x=1734510608;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B4/tn0+NaXoZvCxd7DO6dwQt1/7UILyIFVNQSPfY62g=;
 b=XxsbN5ebZOkSCcEU63zDWOuSb3wMJGZ7rBLo5gkn1dak8Ak71Tji7iBPV07Kg+hL7p
 dbPFXy3VlNyMauAqoc+KZsTboUh5nPnKRL87MBZx8ixOrcKO84g9+NMhN+lYdqhfgJcG
 Sgn2gNWauKEbjM4kznS80nOLfiTKunSKJLVnKzjdcEBl23Akl6OnJKH7BwLHsE4y3aPX
 C5IAQax8GGdmYYOlicKw7r8GX/sOMhmxK4ickl6d48noOfLrWBQ/rlu7aWKkCR4C9QN6
 HpWISEfb4cNTun9TfMQbDdBf4zePkAHMEWliQvnrND/5+5qAkhWNjtyYK80zLycRGR0M
 1q4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLcfdN1M1c8RP4pg1XW6VGnE3gRLS6vFV4QkJ4H5KoWhrmdiKhVlvH/VmtF4333cqk3F89z1bxxh0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRAb8OD9w/9p5OT9U/dxbZjb1u96RfI0Wr/hA/FMlBOu5OnxEG
 ymXseCu+2kIVl7UFLtYJbaX6YoXlVtePL/JOFWNXW6BBhEsuGUYxJPU3CccSR44=
X-Gm-Gg: ASbGncuGplxF15CZNvcITqcYqLbnh6riXA62/QpVDshfg3cPjh7uG+UPDJM/YkLlCYn
 A6Y9mWL6Vl6Ik94Og5KweNKcVySLEW0dJDr7UAFGlB9OrD2ZtbfJKFMt1MDks9W65IKczK3gfV9
 dxmgcvKWdSj41EOvdu+VyXml0vSfHDhN6R21IcAITkwfhdQRkRLGd/w6I9muHSI+OBVEJt4m868
 ns08F0SA+TlbbQdcs6YG/WSiaZ4ygnfMYB+A5EaAtOUcX4mfrNEUw3nvkABZu9TgQ43VcyS24k=
X-Google-Smtp-Source: AGHT+IFH/NzXNJbgRyEoKdsrxfAQKdSlTl8if4/S8TBRBKiFSopNd9WK8zDKR4VFHgwJ90urpCjVjA==
X-Received: by 2002:a05:6000:1a8b:b0:382:30a5:c38e with SMTP id
 ffacd0b85a97d-3864cea3ea9mr1488908f8f.31.1733905807963; 
 Wed, 11 Dec 2024 00:30:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a3e38sm735687f8f.23.2024.12.11.00.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 00:30:07 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Dec 2024 09:29:57 +0100
Subject: [PATCH v5 7/7] arm64: qcom: dts: sm8650: add interconnect and
 opp-peak-kBps for GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-topic-sm8x50-gpu-bw-vote-v5-7-6112f9f785ec@linaro.org>
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2681;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mRmcybJomrA8DtYq9fiyqS6rR7q297sl5lRf/i/VlGk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWU2FIURdxNJLLaES0fnJrqYO+HzNf4JEpRojHmTZ
 gBojavyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lNhQAKCRB33NvayMhJ0ZWEEA
 CaXmuD++16A4jWWDPTEnOk6gHg/IoOGcwhhh5hSIk7V1mQdjU/g5+hVTcDxpB7epXvCSHEei5zO7l8
 j151YYqlSesFX58NbskoPn4b5RnO5oTgQojQ+s1fSk+4sy5ma7p7eavT3ScwnkZmmePM9CZcFYixFv
 maLVtAqSC9HX1UbotSMFXkl49O4YNS3NmD691m3yaqz584LXPApnDnsL7vk9cYucv+wb+cRt32i8aV
 zkDut4H7bGNPxieMKeSPddgeGrPI2lbeOyF1KEMo9HXRqqNH7W9bryUOcKOyNnU1fIjvWX+WEJ2Pa3
 GMjrFD66Z6NYSthpEO6yhvWhBliW9g26Md2JO8QwIG2V4hEKS/afML23yoQM8MezF3johQgLBQ4WFP
 JuVUVb70eptjRYCC4NMk4Hpe1+sI00FhEtRTv8sLCcS9bqfw5R1fuO/edkzlhIqckvoZEviiJBReJ5
 z+OEs9GqX1Gk4p20epT7VQJuL74ywqCBm18WqgMuUnuVR8Zvwbhjc+0mHJR8RJZ8AtUuK7TzPDkzcu
 PFt1AFR4vtuZW3ap+J76jHpTBf0Ufg8jEP9US4gjrRMNKm/lxk++tJzD/d2pkZnpGFLu8RdGGzjxdV
 3Sm0R2CkIrPFb2c0Z8e1L++R/uV3E1BDLcUL54gh3YTqROKG3BiLEK+2ijSw==
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
index 25e47505adcb790d09f1d2726386438487255824..c76c0038c35ab048c88be9870b14c3a0b24b4183 100644
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
+					opp-peak-kBps = <2136718>;
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
+					opp-peak-kBps = <8171875>;
 				};
 
 				opp-629000000 {
 					opp-hz = /bits/ 64 <629000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <10687500>;
 				};
 
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-770000000 {
 					opp-hz = /bits/ 64 <770000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-834000000 {
 					opp-hz = /bits/ 64 <834000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <14398437>;
 				};
 			};
 		};

-- 
2.34.1

