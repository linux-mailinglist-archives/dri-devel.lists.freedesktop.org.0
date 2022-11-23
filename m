Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5C5636C0D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 22:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6442A10E639;
	Wed, 23 Nov 2022 21:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAE610E635
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 21:07:25 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id u2so22774362ljl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 13:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEqiDsYEiDO00tgdMLKsNoJpUA3u2krxNv3MdZBB8lA=;
 b=O6qYidow5Njs1Xc0c/xzRnI23D0NoTJl3aGsoZE5FaLHAt4eL64AXcKS664gTzW9Pr
 PgfbwhV/ZrIG4mkHjdypZk1/QPKgFBmQVs2dEtfe3eXVRvFFZJ9pguIHeuX5sM4CiVHq
 bOEM588FynQohToKxb+TT0+gfpxA54fku+TSZ1+YtnuWIBTtsWpBS1cfMNE74uLClu/0
 teyqZ8wb1UUZbHnmy21+ir7+FnpUwBj7orT2fI4WAGXOonZGe575zbFCXQ+hRveGvjwD
 EPiDwRnOYXvyzmj+zQzwz2zzzkTlne5GjI9LumQbEje08+O+mUFaytVgaOfEmFfdQlc7
 0jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PEqiDsYEiDO00tgdMLKsNoJpUA3u2krxNv3MdZBB8lA=;
 b=CEAbtwO9N0QutJkytNSf+rWBrMcI2fGBh6Lu9RtEcv9p+S/qjjwx+v8kaz9o83sM4b
 TuNQD9Mq5GydyvT8r4GvyPC4CGgFVS1Ytm1TfPOEK+wuZ5mIAACtq4J4PdU7VeYNoY/q
 dgDtoG7ZFgnKWcP6pcgf/coz33D96sKX8RR7C+8BUpvhO3LpS+XEp0NBlII4sJxc0aKm
 pfrEAXaH1ldkeLgwrspLWH+sz/y9BqlB1et/AzTDv6IiUEa3Cc5aIwkCIjebmazCqRXT
 EBiQkF08onwWSmaHQDVfs4CSFODXRek4g+3yb/JklOCRET17n0IssGFeIdLY+5J303S/
 6Cqw==
X-Gm-Message-State: ANoB5pk0yVo9e2ADtsKhumNcOIoX8hvQ/NNJ2/6DnNla6d+sCIhe988Y
 /6KELai6t6Mow7jCXjAgJdAPfw==
X-Google-Smtp-Source: AA0mqf71uC4J6jcyKHOaLZ49f9m0APWIhySt+5xGk5IO/WZTjqjldm4PDtYvVyybKpbWKXZzUR4Orw==
X-Received: by 2002:a2e:b4b7:0:b0:277:f86:ddc6 with SMTP id
 q23-20020a2eb4b7000000b002770f86ddc6mr9843299ljm.131.1669237643831; 
 Wed, 23 Nov 2022 13:07:23 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac2415a000000b0048a8c907fe9sm3024119lfi.167.2022.11.23.13.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 13:07:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 3/5] arm64: dts: qcom: sm8450-hdk: enable display hardware
Date: Wed, 23 Nov 2022 23:07:18 +0200
Message-Id: <20221123210720.3593671-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
References: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable MDSS/DPU/DSI0 on SM8450-HDK device.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 2dd4f8c8f931..75b7aecb7d8e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -349,6 +349,28 @@ vreg_l7e_2p8: ldo7 {
 	};
 };
 
+&dispcc {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l6b_1p2>;
+	status = "okay";
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5b_0p88>;
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 	max-link-speed = <2>;
-- 
2.35.1

