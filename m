Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A90F39F4E5A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718E310E9AB;
	Tue, 17 Dec 2024 14:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hroTZ7Ew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F9310E9B7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 14:51:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso57222435e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734447090; x=1735051890; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B4/tn0+NaXoZvCxd7DO6dwQt1/7UILyIFVNQSPfY62g=;
 b=hroTZ7EwQjnubEGhoiYEGdHO90iZQWug0TZGxo9i9SFt/ThJ5ROp8JR+CWDBRKvWQK
 Hd4vZgda5Nn0UHxNfsZek/AYGERPdAnhaeG6uS4UBWASQ/MoQqsGQmPdV/+Ykya++ziI
 Lt5ytk76S5Vqi3Qr2l/qZdiBMDA05UXwElc4f0SHndP+wLWT3WREZgR6hbmJYeC6OL1o
 GJ+8xtC/AC4Cxy8qGn2h16xbWVHjI6AeCckXJ9LYOjIu1h7OpjG12v22rbtQ5DwrQIHx
 FFvdGXbpwuKRVXIhG+Pbb+ixFNmjAM51jLA14GrDebiBE+4OpKChKRuUmQy+ANiqwLgY
 AfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734447090; x=1735051890;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B4/tn0+NaXoZvCxd7DO6dwQt1/7UILyIFVNQSPfY62g=;
 b=P99VBIiZblyoYeFwTS4iOqwP15/WYzGNR/oNv0KLTrynykn059wrqGibKd/F+XV1tK
 TB5GVoX9JX1GOacujwBLwNn7diyJ3OAPuCd7ZxjGIABxdyGd7QeZnmPFOBvP4lJtd1S3
 llcWK67KQytx8IC5/IVamTFdN6zzrlYYR1AVOJiGSB7Dc9RAM5bKRATuoTufbyE6z5Zz
 5c6KcWjsDuopgThFNqcndCy1fxMax21qqzBxssbblB/5TMmo++W0/I+zpC9X8ZbCp05j
 d3zqApFZBkjCDvQpdTdvuwAGFCFrxYx9wHPkAVH1CWRmbw6UXF/INOms9NHKfju5WuqC
 AfZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOLrF8vaYjIKShPNxAKDcivrn8XLKLWMVPqkVpLly2TogaT60x31vXm0JoxvTtD3ETvd6tjkr9DLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRCEUbRyjFl87c/L/dXxH8nuhldp7u0WM6vxqp6ajsXNQw9LDs
 z7mdL4iHh/yTcan1J3IYm0eu6JDRxp29SVr9Cm5io9xCl6zg0It1ha6sfCkT5ZE=
X-Gm-Gg: ASbGnctLrSMwsccWE3OqSdnuGd4CgMMvRKJFBQvhWzdcd2gyCewJqamkezBfjHUWYUI
 a1P+iyeilmEpSJY7afQlmpr6SaruKYk5+9VtD2agCk8dk+SPdMr9tLRUVkXw+AYN6JFiMC08zgO
 G8iBWzUI3aYHXazlysjhlsHuHwC+14H+i+kbjaS2i59vCaMK0sltVTk3Q8vJvbYP2ZQ02B2/UeG
 XNkTa5L8H3/IzkETz6DIv41w7jWtPWZIZzZ5Xyra8Q18/DAtAJl1Zl8iEbwKu2Hpvom0qLu9toN
 yA==
X-Google-Smtp-Source: AGHT+IH/5sriNzAD6IaFFPEiS4CWanvVfWJxtccBMyLLxpopN0MCzfz2fRQvDKyhFZ41uHBFsZ98Mw==
X-Received: by 2002:a05:600c:1f0b:b0:434:a94f:f8a9 with SMTP id
 5b1f17b1804b1-4362aaa495emr130893345e9.28.1734447089987; 
 Tue, 17 Dec 2024 06:51:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43636066f51sm118417375e9.22.2024.12.17.06.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 06:51:29 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 17 Dec 2024 15:51:20 +0100
Subject: [PATCH v6 7/7] arm64: qcom: dts: sm8650: add interconnect and
 opp-peak-kBps for GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-topic-sm8x50-gpu-bw-vote-v6-7-1adaf97e7310@linaro.org>
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnYY/obfz13xZbRrotrGQIw50hlz2scCvq+FWxJcUZ
 9RBFiZeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ2GP6AAKCRB33NvayMhJ0TEbD/
 9LdU33QP0qcYGWuG7UuVR7KT5vp8m/DQImoa/Hpl51HouhcVrZshNZwY4bSn1uMlj2v8iCcI8lQ006
 UnDSdei+wedcHwZdYM5t4ME6EPDaIBWI0PDVozWIUy4jbDaCp6G/0zWgJIoY4nCRCnA7RGaeusFVXa
 9rVGS0aCsmF2uiYynvpqgrsc5Z6FHtKVNTb9lCIXBpfzIXlDsFGTKQzKRjJvOHBmEKJB3APvjextbd
 EOw0N6KiAsCHqysZgpIW1BpjcwEfW3Sh2ko4kYiBBzl0Qbz20wAbg8HAMj/LGQQ747ajKjICqZzZTd
 1FS3N4LWO59SmtPLRImaDO14GFniJkLyhtptdiT/R/7RY9i6gDHdBe1ZZoiBN9AHHt3qyc2rvMxxxE
 Ml5iK0AkBQZYdGUR6moLrQlAybVFqlOAdikPA7bXQpsNiAIME3tQXBZFQtK0gzhMQd5HBkgNU+o5it
 sbrod/DJiHI1NFK7+U0XA8+/lEr3xvurM5EWKsdh6W4vYBU73vGogyNpDNfg6SH2GFk20qSIrRD9Gq
 6pLjhanFozPRudSjnyN5HBmvBsNeGKv8LBNsmicf24Yq33zlyKFFC21DcjTbEscCyjaoR3zK9/k/eo
 vpF8hw9h9kDloT50VlK1fAuWdBaf/CjJgQq1B93WyYgl87GZe1X9OmlTiyLA==
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

