Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B169DB592
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 11:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81A910EC64;
	Thu, 28 Nov 2024 10:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fwIDA0z7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DB910E34E
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 10:25:56 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-434a2f3bae4so5880545e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 02:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732789555; x=1733394355; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MV2f7FQ+IZLtcez7+tYl5S56MAb02gKSe/ez4DkB/II=;
 b=fwIDA0z7HPW4Q4aG1855Luk2Pjc8JWXEWpjB7PT8OJxShv7lshvBaUB8dl3XuSZfT8
 D0fn3Me3NNbyu3+qrU3vYsyOsTa64HULdWYNcXxeopkZWd0aekrSwITIki6z2qAFKW74
 ivCX6tcaXuHjhiyPTywSLmqYxCrMhMcKUvX+L+55GmpKdxxAalRJGrGvNmKR0rOOwTRI
 rU2j3FRCNLbY3VLsXXVWyrk2eB52YoUHXZOl/LU7jIgSJrj6qNbBiZpcTGtTpNRjHQ35
 5eynQt1Fb03BMg/sIVbRQmmWSIUK7Ag317eqAKQYHJrqV1xw1ckvPSNi4XMKjq5nDW9Y
 9kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732789555; x=1733394355;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MV2f7FQ+IZLtcez7+tYl5S56MAb02gKSe/ez4DkB/II=;
 b=ZjppxrZLJA//RUmkW7vHqwwD/q4EVjFNw9WIFEA5zMn74oQY2ZNuik/UcHaCPS5TRx
 n2pRWjxrzVmB01BVskJ7T5xuKnUBgkxmJET9yDc6ChHnywzLeQKVl0whMRaqDzQHrqdf
 ZSbr7v6nZkpIOLYq7cAkXbuK6+gkAg69bcLtcAwjJidA+Md4mExfdd6jeu5adZJbObc3
 zYMy066zCcY3hHfA0HIVNdm6P+kgqDD6grOSTzAsgpdtfRV69r1e50gylHhQPppgn31i
 OR4ckoQek3nZZNTaBbhtwYmO+O3KdQLjUEQmZtJQV7672EpcRQHXH1JFkZY/4tlqUWRQ
 tT2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKLV0Yw0MJNIzqJZ/2OMJ7aUQ/4cl3DYKRNe2837gC0dhwlo2oFoSKGic0tSqP5/20UC6uAjqv4Q4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5+OxMQWGHu0TkyCCPZBbGqwrUN23ShE+NTJI38su7nhYVf60z
 Kk+Q1q5Dh90aeeW+9y7CcyWD7km7COpyinXbNcHzHYsTyla/QF6p0n6lQK2trmk=
X-Gm-Gg: ASbGnct6j0ijVZ26HnXd6xWF0k/8MFd6QlIcpOL3BK5693PCcwYKEPmVKpAzOdI5XrR
 XPygTCR31Tf9rluJfmLkXAIYrO1ulLrBK++9PvMD5usb7qUzsmA357JxXs1ByfD0MBKm8iQ/CdQ
 psmIb2wR1CX+cnUBgZL2pWA64wqoGezBxptXzIpbBIaMTXGUqNJYFudmL2/hpy20Uap7lt0hsIW
 BFG/NvoIUysYunUEQSfUNH1Q0/inu1zHKIRrN+yD11mWYQZm/9puUXgDzaxFVN7o2xyBCk=
X-Google-Smtp-Source: AGHT+IFDPNwfPwU7WoDGxeoMVmod7G7Th8E2EFadkBA7uRFVnWAcSGDgmzTL1DRYsdo/WKpUznV5Jw==
X-Received: by 2002:a05:600c:3b16:b0:434:a4fe:cd6d with SMTP id
 5b1f17b1804b1-434a9dc02c5mr60957305e9.12.1732789555076; 
 Thu, 28 Nov 2024 02:25:55 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd2db59sm1265909f8f.11.2024.11.28.02.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 02:25:54 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 11:25:47 +0100
Subject: [PATCH v3 7/7] arm64: qcom: dts: sm8650: add interconnect and
 opp-peak-kBps for GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-sm8x50-gpu-bw-vote-v3-7-81d60c10fb73@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2636;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Z/fubARSNKiSdA4saAVoRo6dxj5fjC0/InYw7gi/1hw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSEUq+h8O+EIw/Wmn20ule4XeaTlABW5canDbHBVJ
 hvj0Tk+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0hFKgAKCRB33NvayMhJ0YUlD/
 9AklTjzKjHTXsDNhxoMU2vlELfn13KBdQEWIH7QLvqednKgEWEfQJF/QAYc8iiDJEHIHnmaCbXADHa
 JHCBES8HZ7L1U8mnXKneTx3HJ92mYMbWKtjcderjdusT4Lxwv3uoj9WejleepYfBS3GGTIW3SspHtK
 +69uE+EeNwMP7zLvfSDiCvEhppZ4Vjg3lmAjp5d+2C0aQFFAWBie75uXLei3mO20W1nNCmo95Vgpv6
 sxbYN9NKLGDhQv2/5i+ZwjkpPN8s7CPji3gdO4ODau44hzRvcbUetfP/ZSZVPRj3C0f78ho42pz7t3
 9U26Ay/sNCKAt/b638J6YA0jJd4StYkw7Q1A1f0hufut+1Mo208B3truFKCTiyfTGY5bg/n6p+sC5k
 qS719wFR2pr3CpuU/lC94xsSFhyK7WIhxcntyygzVphL8u4GpKx6yA//9FnIgZY6r4vJysR7qF18ZT
 G671aFiMFhH7OzHPqY+SAlEtAuFY23udPGTfeD6Mco3VXICcf3gahprPPZfg7L2nadNnqBWSD7fC4u
 EPOuQW6szIx32FHqvgumi6Ss5bXUlcfVAq2Q6idXkNDTCNY+t80e1qv/jIEoM2C/9o9P3X4BrGEU40
 pJTEJ5PKOxQpg7RVNZ/H/Jv2oWqt85dgvAgt5qnYBdU/N0xgrT6Lamw9+Uig==
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
index 25e47505adcb790d09f1d2726386438487255824..dc85ba8fe1d8f20981b6d7e9672fd7137b915b98 100644
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

