Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB12F4651B9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 16:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46286EE6C;
	Wed,  1 Dec 2021 15:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CBB6EE70
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 15:31:59 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id u74so49250949oie.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 07:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uFMUhbGSve6XOXG4hT9U3q9GImUbsSFy9Vah1OZisDI=;
 b=VEqQ4qm73WYGNDTAMVaJv66zUxxEcw1I76eSBm6a3yxe4VglM1A8bd3AWGyIbSITsG
 L15cql+Aqb1LKY7WuUgdhnqVjOUvVvUYgw+iOUVzlqdv6g9JpLdLgFZJrdGc/qfem8Ic
 SmD6x7TfGe+WVqdeR9eLomzxti3j9u6g8H2Q+TruWVTvhxgGH/EbFn2BmHIKE77dcYPQ
 AVdAk4ha5MiNJ/fABaqxzubfxrrIAJ9KPPFfBnbxEAcMPPf7nSif221xhhqJDC0ethkY
 AdCVXauvs3kwFIM18EZC0A7yrJt/3j+OBqkcd047bVeqxiwyuaUmU+7dmprGUqcue6tA
 Pcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uFMUhbGSve6XOXG4hT9U3q9GImUbsSFy9Vah1OZisDI=;
 b=Pr6oJeH+gArt1f+U/oH1kyB55Zwog5ObpmOjZ8XdHiPqze0+qK09J3ffhpyuYaNjdL
 076eom1T0Kwp6G6ns3vIt2BecvjgSlIuyTYN3OGqNUd/a8NPd10rJwUbhm3iWpfYNdvx
 rfii1V4pKztU1Cwp9GDvQD2ZhHVFMospbRYI7/xzYt2uVpmXxwCliI/HSG20EAnJVjb2
 /CXmLJJ5R+9aqViN8R1vO3EdYaFBjk+zrL0OzzyH/ENgCkK1VZvxTe+mP9do5MxtBsed
 487HfuG/v94kz8FPK51t0WG1zL1f7aeE7EeQbMLLQ2doO996OvhesksklFS9kYDtWEr6
 +eFQ==
X-Gm-Message-State: AOAM532XP+I4KBhvqWl8edXOy0q4QDzR3e3p1W2wJksRkVbpG8+fpoHF
 OLa2MZL+1132HoQhj6HSmS0EbA==
X-Google-Smtp-Source: ABdhPJwnqbKqj2jV7StOM44pZVUXOOt1pFckEfKefaxTyLXR8Nzec8O4l7stJ4JSVQj5U2bon04vgw==
X-Received: by 2002:aca:1204:: with SMTP id 4mr6800261ois.136.1638372718608;
 Wed, 01 Dec 2021 07:31:58 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id m2sm7954oop.12.2021.12.01.07.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 07:31:58 -0800 (PST)
Date: Wed, 1 Dec 2021 09:31:53 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: sc7280: add edp display dt nodes
Message-ID: <YaeVaTtP4g6mchDr@builder.lan>
References: <1637580369-876-1-git-send-email-quic_sbillaka@quicinc.com>
 <1637580369-876-3-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1637580369-876-3-git-send-email-quic_sbillaka@quicinc.com>
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
 seanpaul@chromium.org, quic_mkrishn@quicinc.com, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 22 Nov 05:26 CST 2021, Sankeerth Billakanti wrote:

> Add edp controller and phy DT nodes for sc7280.
> 
> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>

If Krishna authored the patch (he certified its origin first), then he
should be From: as well.

> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> 
> Changes in v4:
>     None
> 
> Changes in v3:
>     - Add one clock cell per line (Stephen Boyd)
>     - Unit address should match first reg property (Stephen Boyd)
>     - Remove new line (Stephen Boyd)
>     - Add the dsi_phy clocks in dispcc (Kuogee Hsieh)
> 
> Changes in v2:
>     - Move regulator definitions to board file (Matthias Kaehlcke)
>     - Move the gpio definitions to board file (Matthias Kaehlcke)
>     - Move the pinconf to board file (Matthias Kaehlcke)
>     - Move status property (Stephen Boyd)
>     - Drop flags from interrupts (Stephen Boyd)
>     - Add clock names one per line for readability (Stephen Boyd)
>     - Rename edp-opp-table (Stephen Boyd)
> 
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 107 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 105 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 12c4d32..5ad500e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2695,8 +2695,8 @@
>  				 <&dsi_phy 1>,
>  				 <0>,
>  				 <0>,
> -				 <0>,
> -				 <0>;
> +				 <&edp_phy 0>,
> +				 <&edp_phy 1>;
>  			clock-names = "bi_tcxo",
>  				      "gcc_disp_gpll0_clk",
>  				      "dsi0_phy_pll_out_byteclk",
> @@ -2784,6 +2784,13 @@
>  							remote-endpoint = <&dsi0_in>;
>  						};
>  					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dpu_intf5_out: endpoint {
> +							remote-endpoint = <&edp_in>;
> +						};
> +					};
>  				};
>  
>  				mdp_opp_table: opp-table {
> @@ -2899,6 +2906,102 @@
>  
>  				status = "disabled";
>  			};
> +
> +			msm_edp: edp@aea0000 {

mdss_edp:

> +				compatible = "qcom,sc7280-edp";
> +
> +				reg = <0 0xaea0000 0 0x200>,
> +				      <0 0xaea0200 0 0x200>,
> +				      <0 0xaea0400 0 0xc00>,
> +				      <0 0xaea1000 0 0x400>;
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <14>;
> +
> +				clocks = <&rpmhcc RPMH_CXO_CLK>,
> +					 <&gcc GCC_EDP_CLKREF_EN>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_EDP_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_EDP_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK>;
> +				clock-names = "core_xo",
> +					      "core_ref",
> +					      "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface",
> +					      "stream_pixel";
> +				#clock-cells = <1>;
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
> +				assigned-clock-parents = <&edp_phy 0>, <&edp_phy 1>;
> +
> +				phys = <&edp_phy>;
> +				phy-names = "dp";
> +
> +				operating-points-v2 = <&edp_opp_table>;
> +				power-domains = <&rpmhpd SC7280_CX>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					port@0 {
> +						reg = <0>;
> +						edp_in: endpoint {
> +							remote-endpoint = <&dpu_intf5_out>;
> +						};
> +					};
> +				};
> +
> +				edp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
> +			edp_phy: phy@aec2a00 {

mdss_edp_phy

Thanks,
Bjorn

> +				compatible = "qcom,sc7280-edp-phy";
> +
> +				reg = <0 0xaec2a00 0 0x19c>,
> +				      <0 0xaec2200 0 0xa0>,
> +				      <0 0xaec2600 0 0xa0>,
> +				      <0 0xaec2000 0 0x1c0>;
> +
> +				clocks = <&rpmhcc RPMH_CXO_CLK>,
> +					 <&gcc GCC_EDP_CLKREF_EN>;
> +				clock-names = "aux",
> +					      "cfg_ahb";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				status = "disabled";
> +			};
>  		};
>  
>  		pdc: interrupt-controller@b220000 {
> -- 
> 2.7.4
> 
