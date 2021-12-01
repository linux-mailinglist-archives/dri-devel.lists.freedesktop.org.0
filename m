Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 005E846518D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 16:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859F96ECC2;
	Wed,  1 Dec 2021 15:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EDA6EC69
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 15:26:06 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id bk14so49216140oib.7
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 07:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ho6rCo9lvPlr61eCFjwRCuPn4r4Kk8E194rQWiIz0bI=;
 b=YXF59qJSiaiKjxgLQe1GtDIWTcG43VO5iCCkRI2et4LcvkcKPMebyz92zURex8nzXK
 Q0/aKVyWDM1lJ6t9Tue0/s3t4Y5ONXFCBUBZXUtU42+D6EMCS7ym15Ce9GfaYnfwgtj7
 6CzxVWF/lVMGUR/kZYFErFRNs3zUB6EuctgjqljXgo/Jxeg+1EoyGmB/Hhr6YrpL9V7Z
 oaQW4yNQWj65D4YRq1o22wKY0GgSoRo2BL/iHVHIDmIQrQqVpstVh9YoWLxBlUUlDZgU
 6N6L7GBW+dzUu/DUl+LeZuphGH4L5oCVMMEQB0x7ICqnJlxyVkTj1F4MM/N2kCiIzZfn
 MiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ho6rCo9lvPlr61eCFjwRCuPn4r4Kk8E194rQWiIz0bI=;
 b=ZvbGoFKU4oZfFRiJ0pvhhPqvfaGo9zlv8gsU5RVnKMBmX9b4QJlBlFwy93JIBkzPEs
 TfnYBPP0NddHF2a5XzBZjUYRZSmjLc+VYHWMAIc19E0Gt+gcoDJ8p6tdni5WVhDdji8x
 OyXs69w6opHrabWQwyzqpb2Be3EDjBxhPhmfEZgU3yagntjoPBgW7jHQ4qPaow/WYi9z
 DOUApLD2r60zBnLMG05c5Xz6QayuhicynWdGeYRDUI7HpeVynm3FM60hMdmHqzV4xChz
 Oer2fG3JkewsOMN77BUunnNEwkNyxHziQ4IZOtmt0lFXAzuo2RwuPIxrsk/bwoX0v25t
 jTjA==
X-Gm-Message-State: AOAM531t916Fn9U2JwLjJxGYms3gH3b9MiDnmwpsFiwtSr5crtqoQYHz
 tMzDF0KBf4MmSAfM4ufF/msr8w==
X-Google-Smtp-Source: ABdhPJymuEP6wWTINOd5J43jZF/j9auHYUXRrHHj1cpGkUtoyw/CVMO7oF9UFb725mHlHPWTb/UEgQ==
X-Received: by 2002:a05:6808:1a02:: with SMTP id
 bk2mr6718132oib.52.1638372366039; 
 Wed, 01 Dec 2021 07:26:06 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id e14sm8491oow.3.2021.12.01.07.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 07:26:05 -0800 (PST)
Date: Wed, 1 Dec 2021 09:26:00 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: sc7280: add display dt nodes
Message-ID: <YaeUCK5+P8DrEM41@builder.lan>
References: <1637580369-876-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1637580369-876-1-git-send-email-quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org, dianders@chromium.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robh+dt@kernel.org, agross@kernel.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, seanpaul@chromium.org,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 22 Nov 05:26 CST 2021, Sankeerth Billakanti wrote:

> From: Krishna Manikandan <quic_mkrishn@quicinc.com>
> 
> Add mdss and mdp DT nodes for sc7280.
> 
> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> 
> Changes in v4:
>     None
> 
> Changes in v3:
>     None
> 
> Changes in v2:
>     - Rename display dt nodes (Stephen Boyd)
>     - Add clock names one per line for readability (Stephen Boyd)
> 
> 
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 90 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 365a2e0..a4536b6 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2704,6 +2704,96 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		mdss: display-subsystem@ae00000 {
> +			compatible = "qcom,sc7280-mdss";
> +			reg = <0 0x0ae00000 0 0x1000>;
> +			reg-names = "mdss";
> +
> +			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
> +
> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> +				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				<&dispcc DISP_CC_MDSS_MDP_CLK>;
> +			clock-names = "iface",
> +				      "ahb",
> +				      "core";
> +
> +			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +			assigned-clock-rates = <300000000>;
> +
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>;
> +			interconnect-names = "mdp0-mem";
> +
> +			iommus = <&apps_smmu 0x900 0x402>;
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			status = "disabled";
> +
> +			mdp: display-controller@ae01000 {

I believe the only reason to give this a label is so that you can enable
it in the dts. But I don't see the point of having it status disabled,
given that it should always follow the mdss node's status.

> +				compatible = "qcom,sc7280-dpu";
> +				reg = <0 0x0ae01000 0 0x8f030>,
> +					<0 0x0aeb0000 0 0x2008>;
> +				reg-names = "mdp", "vbif";
> +
> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +					<&gcc GCC_DISP_SF_AXI_CLK>,
> +					<&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					<&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +					<&dispcc DISP_CC_MDSS_MDP_CLK>,
> +					<&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "bus",
> +					      "nrt_bus",
> +					      "iface",
> +					      "lut",
> +					      "core",
> +					      "vsync";
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +						<&dispcc DISP_CC_MDSS_VSYNC_CLK>,
> +						<&dispcc DISP_CC_MDSS_AHB_CLK>;
> +				assigned-clock-rates = <300000000>,
> +							<19200000>,
> +							<19200000>;
> +				operating-points-v2 = <&mdp_opp_table>;
> +				power-domains = <&rpmhpd SC7280_CX>;
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <0>;
> +
> +				status = "disabled";

So my suggestion is to drop this and drop the label.

If not, please change the label of this node to mdss_mdp, for sorting
purposes.

Thanks,
Bjorn

> +
> +				mdp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-200000000 {
> +						opp-hz = /bits/ 64 <200000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-300000000 {
> +						opp-hz = /bits/ 64 <300000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-380000000 {
> +						opp-hz = /bits/ 64 <380000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-506666667 {
> +						opp-hz = /bits/ 64 <506666667>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sc7280-pdc", "qcom,pdc";
>  			reg = <0 0x0b220000 0 0x30000>;
> -- 
> 2.7.4
> 
