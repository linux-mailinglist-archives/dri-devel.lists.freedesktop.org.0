Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D91F9B5424D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 07:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3699510E44D;
	Fri, 12 Sep 2025 05:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SI7aETGT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF1A10E442;
 Fri, 12 Sep 2025 05:56:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DA0E6601AE;
 Fri, 12 Sep 2025 05:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE472C4CEF4;
 Fri, 12 Sep 2025 05:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757656588;
 bh=NoVcwhHFhGVy4YaFMNb6TmrHk9QeQ0TL+216knOdmWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SI7aETGTzluOOEMW/W1Yf2oJIhfw+qt0AykEt+OlCHsqowZTUgxU7oUVaTUkzzR/c
 S1/R6Tav6Ja+kIX74IpvNBe72B57B3Rz45ou78b0eQyKNT3cDrMC7zZesYtUvqe9Cr
 AbCG9Wt1bQRpbLISofMxJZ0j5G665gshmHgrC+wRvp/ivLWmiP/uqgiaFpleqcbvVu
 7nZzXWcwEjGHFHZmYSWkQe1m341Q3a+VRh0007c2KexS/xYDDhfkfbFPjC5eOhgZIw
 FR4993IFUSHqxoxZx7UnDEC6cuYnDHzr2O8elUaYkEPrkTFnqoflalaQHHm1VBciyW
 1YpSNXHxTRO2g==
Date: Fri, 12 Sep 2025 07:56:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: display: msm: Document the Glymur
 Mobile Display SubSystem
Message-ID: <20250912-beautiful-radiant-pheasant-72dedd@kuoka>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-1-d391a343292e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-1-d391a343292e@linaro.org>
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

On Thu, Sep 11, 2025 at 03:28:48PM +0300, Abel Vesa wrote:
> +
> +            mdp_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-200000000 {
> +                    opp-hz = /bits/ 64 <200000000>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
> +                };
> +
> +                opp-325000000 {
> +                    opp-hz = /bits/ 64 <325000000>;
> +                    required-opps = <&rpmhpd_opp_svs>;
> +                };
> +
> +                opp-375000000 {
> +                    opp-hz = /bits/ 64 <375000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +
> +                opp-514000000 {
> +                    opp-hz = /bits/ 64 <514000000>;
> +                    required-opps = <&rpmhpd_opp_nom>;
> +                };
> +            };
> +        };
> +
> +        displayport-controller@ae90000 {
> +            compatible = "qcom,glymur-dp";
> +            reg = <0 0xae90000 0 0x200>,
> +                  <0 0xae90200 0 0x200>,
> +                  <0 0xae90400 0 0x600>,
> +                  <0 0xae91000 0 0x400>,
> +                  <0 0xae91400 0 0x400>;
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <12>;
> +
> +            clocks = <&dispcc_mdss_ahb_clk>,
> +               <&dispcc_dptx0_aux_clk>,
> +               <&dispcc_dptx0_link_clk>,
> +               <&dispcc_dptx0_link_intf_clk>,
> +               <&dispcc_dptx0_pixel0_clk>;

Mis-aligned entries.

> +            clock-names = "core_iface", "core_aux",
> +                    "ctrl_link",
> +                    "ctrl_link_iface",
> +                    "stream_pixel";

Same here and in other places.

> +
> +            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
> +                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
> +            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> +
> +            operating-points-v2 = <&mdss_dp0_opp_table>;
> +
> +            power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +            phys = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_PHY>;
> +            phy-names = "dp";
> +
> +            #sound-dai-cells = <0>;
> +
> +            ports {
> +              #address-cells = <1>;

Mixed up indentation, keep 4 spaces.

> +              #size-cells = <0>;
> +
> +              port@0 {
> +                  reg = <0>;
> +
> +                  mdss_dp0_in: endpoint {
> +                    remote-endpoint = <&mdss_intf0_out>;
> +                  };
> +              };
> +
> +              port@1 {
> +                  reg = <1>;
> +
> +                  mdss_dp0_out: endpoint {
> +                  };
> +              };
> +            };

Best regards,
Krzysztof

