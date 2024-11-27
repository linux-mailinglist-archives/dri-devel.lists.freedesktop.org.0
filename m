Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E09D9DA2E8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 08:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FEC10E9E2;
	Wed, 27 Nov 2024 07:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FTT/hOEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A8810E9E2;
 Wed, 27 Nov 2024 07:15:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8FCE45C5CCD;
 Wed, 27 Nov 2024 07:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32B0C4CECC;
 Wed, 27 Nov 2024 07:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732691716;
 bh=XZWQ9oZ2HZ5yV4Z16lWMIhYwZGdeiyPdxl0C9N9vkGA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FTT/hOEqOJTMxAF6cZD9+rwSEUxOsNmpBu+MGdcyLbHv1uLfGk6H63xWcXfgpyklP
 y9W7MSTcQjs7Re4LxJxkPz9lTtysN3p9m/lIzcfBRk4TaYhmwSO0F6n0Y/VefF01Qk
 g++onz1YITqdo6Fr9ysXmxS+LwtmAvcqShSlTkwf9aSqd4acNp8xBJZlvTkkOqLYE/
 yMtfSZelFVvcH6id4CMVjGw25OWqsLDuBgrphR1plyY6bMCEkyukRYnfFJX3LSvTqt
 phm2PJk6LAzOdycM0ofx7HfcNGygEreY3fAocDHWWp63BX5hjQx/snpKBiBL1TjKMY
 KVk5oNAEIa6+g==
Message-ID: <70abadbf-b796-4434-b2d8-0675c18eee07@kernel.org>
Date: Wed, 27 Nov 2024 08:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: Document MDSS on QCS8300
To: Yongxing Mou <quic_yongmou@quicinc.com>,
 Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-1-29b2c3ee95b8@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241127-mdss_qcs8300-v1-1-29b2c3ee95b8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 27/11/2024 08:05, Yongxing Mou wrote:
> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>


Will fail testing, so only limited review.

> +examples:
> +  - |
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
> +    #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
> +    #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    mdss: display-subsystem@ae00000 {
> +        compatible = "qcom,qcs8300-mdss";
> +        reg = <0 0x0ae00000 0 0x1000>;
> +        reg-names = "mdss";
> +
> +        interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ACTIVE_ONLY
> +                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                        <&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ACTIVE_ONLY
> +                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                        <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                         &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +        interconnect-names = "mdp0-mem",
> +                             "mdp1-mem",
> +                             "cpu-cfg";
> +
> +        power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
> +
> +        clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                 <&gcc GCC_DISP_HF_AXI_CLK>,
> +                 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
> +
> +        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +
> +        iommus = <&apps_smmu 0x1000 0x402>;
> +
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        ranges;
> +
> +        status = "disabled";

No, your code cannot be disabled.

> +
> +        mdss_mdp: display-controller@ae01000 {
> +            compatible = "qcom,qcs8300-dpu";
> +            reg = <0 0x0ae01000 0 0x8f000>,
> +                  <0 0x0aeb0000 0 0x2008>;
> +            reg-names = "mdp", "vbif";
> +
> +            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +            clock-names = "bus",
> +                          "iface",
> +                          "lut",
> +                          "core",
> +                          "vsync";
> +
> +            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +            assigned-clock-rates = <19200000>;
> +            operating-points-v2 = <&mdp_opp_table>;
> +            power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <0>;
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    dpu_intf0_out: endpoint {
> +                         remote-endpoint = <&mdss_dp0_in>;
> +                    };
> +                };
> +            };
> +
> +            mdp_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-375000000 {
> +                    opp-hz = /bits/ 64 <375000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +
> +                opp-500000000 {
> +                    opp-hz = /bits/ 64 <500000000>;
> +                    required-opps = <&rpmhpd_opp_nom>;
> +                };
> +
> +                opp-575000000 {
> +                    opp-hz = /bits/ 64 <575000000>;
> +                    required-opps = <&rpmhpd_opp_turbo>;
> +                };
> +
> +                opp-650000000 {
> +                    opp-hz = /bits/ 64 <650000000>;
> +                    required-opps = <&rpmhpd_opp_turbo_l1>;
> +                };
> +            };
> +        };
> +
> +        mdss_dp0: displayport-controller@af54000 {
> +            compatible = "qcom,qcs8300-dp";
> +
> +            pinctrl-0 = <&dp_hot_plug_det>;
> +            pinctrl-names = "default";
> +
> +            reg = <0 0xaf54000 0 0x104>,
> +                <0 0xaf54200 0 0x0c0>,
> +                <0 0xaf55000 0 0x770>,
> +                <0 0xaf56000 0 0x09c>;
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <12>;
> +            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,

Messed alignment in multiple places.

> +                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +            clock-names = "core_iface",
> +                "core_aux",
> +                "ctrl_link",
> +                "ctrl_link_iface",
> +                "stream_pixel";
> +            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +                 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +            assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
> +            phys = <&mdss_edp_phy>;
> +            phy-names = "dp";
> +            operating-points-v2 = <&dp_opp_table>;
> +            power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +            #sound-dai-cells = <0>;
> +            status = "disabled";

No, your code cannot be disabled.

> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    mdss_dp0_in: endpoint {
> +                        remote-endpoint = <&dpu_intf0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                   reg = <1>;
> +                   mdss_dp_out: endpoint { };
> +                };
> +            };
> +
> +            dp_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-160000000 {
> +                    opp-hz = /bits/ 64 <160000000>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
> +                };
> +
> +                opp-270000000 {
> +                    opp-hz = /bits/ 64 <270000000>;
> +                    required-opps = <&rpmhpd_opp_svs>;
> +                };
> +
> +                opp-540000000 {
> +                    opp-hz = /bits/ 64 <540000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +
> +                opp-810000000 {
> +                    opp-hz = /bits/ 64 <810000000>;
> +                    required-opps = <&rpmhpd_opp_nom>;
> +                };
> +            };
> +

Drop stray blank lines.

> +    };
> +...
> 


Best regards,
Krzysztof
