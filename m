Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3354C9A20
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 01:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416FA10E920;
	Wed,  2 Mar 2022 00:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243FB10E781
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 00:52:13 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i11so106986lfu.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 16:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWC9HLvSBhB6Pz8h3N3F3AQ0kWvVsZWnOAu1rbrD3T8=;
 b=kFWE16Aoaj+o//Zn40/+etJqsbR+TZiRHqtnJsI4Wog2t4S6E4CxC6ghXAduSbJ7UT
 thVeHdkT3kso/hcUs38OYn6eAL65hSDNXuayQoJSyYJDPJsMAeDwSdgMhda9CjVIGSSS
 9UR9oX8fr7HPnLeOw6hY6crk5HT+Nknf6x3SwnSeZ7k27Bf7Oa7noyyqemREOVIZizMh
 QeWpgE+3gnWmbj/NKI1NqbzIefp7Zk0xmkvMqymGJvbgP5GrSt5UWwHruw2JQdBaMvVM
 u4qgyWgrchX3iceBmKZr8HKg4bWQPzevxyoJS629sZwO/ALPB1SloRM8f705ZAcDA5zB
 Wo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWC9HLvSBhB6Pz8h3N3F3AQ0kWvVsZWnOAu1rbrD3T8=;
 b=QaRyaf2SXYBwF+QygVMLr0e/PbOvHfHuH0qIR4XfziMVubBYe/OrHBFg5LV29c1UbE
 td3g01r8L+zWq/wKjmFOlR0XBtWOMGWf1bjCZlBKHHiQ5OmwDz/NYFn7y4Bu2h/HAD/7
 ErSXXUPfExcMES5RidJB4+tYIAYBVMeFzWb8iyQiyaSl03o4tNQH9RLAuIDOX72KfASq
 mFDMopSCCr0djADxmyXML/4SMbVO31htI5Sy31IF8VFbfso3g5ey6Hx7FH2NwUeLJJ1O
 BMMblmtN2AeFms0plPjVUxGyfETN1wFWqXeao2uW9YyLHqmxZ2KZnrGmAr7/sdgVkwyc
 q3wA==
X-Gm-Message-State: AOAM531w+lrMq4h6tqxk8EWu0THhqAiJowFxz1zeHziUg3AVOYvmxP1X
 /ZirYOnvlGQeTvtVj5/LaS4MQw==
X-Google-Smtp-Source: ABdhPJym3l2+Hs9czgroqBDyOci3cO8rUBNuuvJjNmEzzQ1BKImUtnbRIkY8c6HLvLBt5WHRuMLJWQ==
X-Received: by 2002:a05:6512:3042:b0:437:96f5:e68a with SMTP id
 b2-20020a056512304200b0043796f5e68amr17760636lfb.449.1646182332278; 
 Tue, 01 Mar 2022 16:52:12 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0:5258:5528:7624:3edd])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a19ef17000000b00445b8db3c42sm198171lfh.172.2022.03.01.16.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 16:52:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/5] arm64: dts: qcom: msm8996: Drop flags for mdss irqs
Date: Wed,  2 Mar 2022 03:52:06 +0300
Message-Id: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index f0f81c23c16f..0597d865a4a6 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -788,7 +788,7 @@ mdp: mdp@901000 {
 				reg-names = "mdp_phys";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				clocks = <&mmcc MDSS_AHB_CLK>,
 					 <&mmcc MDSS_AXI_CLK>,
@@ -834,7 +834,7 @@ dsi0: dsi@994000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				clocks = <&mmcc MDSS_MDP_CLK>,
 					 <&mmcc MDSS_BYTE0_CLK>,
@@ -904,7 +904,7 @@ hdmi: hdmi-tx@9a0000 {
 					    "hdcp_physical";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <8>;
 
 				clocks = <&mmcc MDSS_MDP_CLK>,
 					 <&mmcc MDSS_AHB_CLK>,
-- 
2.34.1

