Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7D29C77B4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 16:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E791C10E72D;
	Wed, 13 Nov 2024 15:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T9f/LxHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8972810E73F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 15:48:48 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43168d9c6c9so61293345e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 07:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731512927; x=1732117727; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gHpOD3kUgP0NZgNkpxEn7+M6CVhgca5HnhadSgnc1wM=;
 b=T9f/LxHwUZAgGk5shnwlubDIpEE3cE7Kmcu97r4MOVH3YvewS27LoP0FEigTDWda7/
 vM8XArlyvhjGsiOTb6ZG6/ILqu8YWDRe2ib8L5kzoI42v6lBe2rYetYuclNSdJCyP4Hx
 +xWJ7/AfZNdjOlYMrZGmf1miEBQTHR2NgKTqCWnH+HVYJFps5/TTCdzVznS9pszep7Gi
 fvg4rDc0BJdIDzNDhkhHQde2PLROx0ih94TSfZJ1de2N9u3bRAO09F5oMVRxf7ci2Dpb
 o5ziLpmR6+bZBTeQh1gkeUUEIeW+/h6tH0ayGU61sKALATuT7HGF3LxC3lZnNFYNTPcK
 homA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731512927; x=1732117727;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gHpOD3kUgP0NZgNkpxEn7+M6CVhgca5HnhadSgnc1wM=;
 b=mJocGLEEOYJVw0TeRPHMckX34P14OMaO37sSIPIskx0kmpuUfM/YyJKqBPWE097gZ1
 1LMCO8ZU6A/aMQPTdLNLgOhhzVlveVX+NToSlfx2UE7spvRiNtjLEGTTS2D/9EC0Qiae
 w/gexkGydsPR2DTlI5U4gBWRf0IwugQq6jzhYPskraV1ICwGc/hghjuMkKA8GcHojdn4
 iXpc+RZuzF6SNCoPj1i26NxBc88rFK7Ki6RpiudSsgsYz2LwkQX6hk1dym68NNLlqC7V
 A2KwbNAN7lXvKWn2Yv8I/IzqTTyNuo009oIWPXOP4ycH/+y9HBVmbo8K3IuWj/SUbx8T
 iv2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLnuEs29hnTLzCFoBA0RjM9IjX7RCELBp2orm20b5ZMQ7gNJ7b7tUYIuQvFpG+28HxPF5c+Pv6ius=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtMgHKCV97juglJFgkNDZr906SHKqenXMaPaNyMPYjFj6mj63f
 prqwfVU+v4gFy0MG61ZEyaA8Idm2umsQYRhr9kzxV0jY9Y2020Y06stjSXRAaNE=
X-Google-Smtp-Source: AGHT+IH0RYYWLohZyGNIvU/YBRIN2CzLxqCAV/9/sRwAKqUUGNiysEqIfwjl60S1mV3GEi+WrLOXFg==
X-Received: by 2002:a05:600d:5:b0:431:b42a:2978 with SMTP id
 5b1f17b1804b1-432b75002d1mr182824155e9.9.1731512926878; 
 Wed, 13 Nov 2024 07:48:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d54f772asm28445345e9.18.2024.11.13.07.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 07:48:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 13 Nov 2024 16:48:34 +0100
Subject: [PATCH RFC 8/8] arm64: qcom: dts: sm8650: add interconnect and
 opp-peak-kBps for GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-topic-sm8x50-gpu-bw-vote-v1-8-3b8d39737a9b@linaro.org>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
In-Reply-To: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2636;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=kMBG33vo/TOc40mVibFxMI9MiLmVj3cBO8HFx/GtxHk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnNMpTcwoQUrggwwkSabiH780z4dLQruvKpbpj5wzd
 0mOSAUaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzTKUwAKCRB33NvayMhJ0X1cEA
 DGx+C8XLcffS07rX1a8GXBneILAAMZxTwADCFG8e6JtNnZJzswZECobDf5cWxYmi/C8Ij3dTMUoxi7
 syAUirUd2CoEZktqnJb+IIrk5Nc5CVZgXadx9sOF4hhiugjGRx2pLAX7FdNgnmGv3OCB2V+xBnuqe0
 edTVHyWGTgJNKU5NfaVtSn97nUP/yxiIEe5TQrPMusBP+Ie51VLWSWi8k8SMPAxqdl+W9GQCc7IWD+
 p1FCczczdWc4unE6ESpnun7+8g4BW4BS3ljwI89F+RGflAbZGmC6637h3eDaWwWTuxUAcqKrrx9udh
 giHoGNA1gtQOgl1XdRCxtUuqI7UfraelG7A7W5MG4+q1pcrq1Q3Vf2ZClYB0RNmjRXCndvJnlqreIc
 qz5YdSE70DEOswjgK5ARYKB3qwAlbH4fd/WXjTdvRAevhrD4jTDRHgNewt4HB55tXMzX4NhusIPN59
 3kytBZETZKY4s8bEMwqX9wbtqcJAfpo9zXeUbLPJhc86YcTB1nRVvOJhBqIYraHR3874gLux8rh+X/
 t0Oy9Dl4fFkrljtnQLwsPXKBgHbsUVUreMVldOqRouxm9BiHZS9fd3v6IPMeRzVVZNpZuKb5NrM3tC
 ef+s5JR48ONwzDM4frKGp4/QvFJACLv631/+MUQzN+7/rnZ51AIXn68bUbcw==
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
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 01ac3769ffa62ffb83c5c51878e2823e1982eb67..331c5140c16bf013190d6da136c0920009d2646b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2636,6 +2636,9 @@ gpu: gpu@3d00000 {
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
 
+			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "gfx-mem";
+
 			status = "disabled";
 
 			zap-shader {
@@ -2649,56 +2652,67 @@ gpu_opp_table: opp-table {
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

