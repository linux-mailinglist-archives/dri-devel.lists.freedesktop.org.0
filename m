Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F8911EE15
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 23:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02F96E0DF;
	Fri, 13 Dec 2019 22:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEBA6E0DF;
 Fri, 13 Dec 2019 22:58:02 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id k14so987606otn.4;
 Fri, 13 Dec 2019 14:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qiHxkm6KtZo6Tc2gJFAGw7nvz1X4DY5P/hEZQp6y9Gg=;
 b=scGQM7BYDswf732jXS9V3R6o+hKxptvWNzIDjdViPkE9gfI04xXm5PZ9XOL9xIgRji
 juIGqVr6QJjevnrCT3Jxye0jgr8nlRegriI+Nv7neD73Vp4Z/GiAhz5Y0kRkmPPH6hJL
 OjZBzQu+M2uFMj+WkXgwu9oGLEisPutaaqzF17nlx2ZKQnqc3Lb1xMd29JB/DatuOtfM
 Ct3Oq3a8hxSaCS1YavA2nyHkq77TiyolEj1CUGxYotUZFMQgqjy4cEgkZiH83Ei0+hYa
 iFGXKoT9eS3km1tTxTPKxBTA+dqEhi0rsWGPA0hcKTigILxJIsvOgeraxPV/oMyI7r/8
 FQ8w==
X-Gm-Message-State: APjAAAV9J8VHSsEvj7oOGg1ElvfPeumzhKNllPSbLC7XAPVMQgEEa2KV
 sz9LhrhIKPAopA1Qkj+tsg==
X-Google-Smtp-Source: APXvYqwmrBRTx8NiFcOlSM6Mbs/9f80Gl2thmPUknxOfQb4wS9RiU8VvOkxdByU3XcH1WHnRoBqqNw==
X-Received: by 2002:a9d:7094:: with SMTP id l20mr17643097otj.190.1576277881707; 
 Fri, 13 Dec 2019 14:58:01 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a17sm3796931otq.49.2019.12.13.14.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 14:58:00 -0800 (PST)
Date: Fri, 13 Dec 2019 16:58:00 -0600
From: Rob Herring <robh@kernel.org>
To: Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [DPU PATCH v3 1/5] dt-bindings: msm/dp: add bindings of
 DP/DP-PLL driver for Snapdragon 845
Message-ID: <20191213225800.GA21739@bogus>
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
 <0101016ec6ddf4fc-cbe2c43a-6b6c-4035-846a-038fac788c62-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0101016ec6ddf4fc-cbe2c43a-6b6c-4035-846a-038fac788c62-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 abhinavk@codeaurora.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, hoegsberg@google.com,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 02, 2019 at 01:47:45PM +0000, Chandan Uddaraju wrote:
> Add bindings for Snapdragon 845 DisplayPort and
> display-port PLL driver.

Is it just me, but I keep getting 2 copies of codeaurora emails?

> 
> Changes in V2:
> Provide details about sel-gpio

This is V3, what changed in V3?

> 
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> ---
>  .../devicetree/bindings/display/msm/dp.txt         | 249 +++++++++++++++++++++
>  .../devicetree/bindings/display/msm/dpu.txt        |  16 +-
>  2 files changed, 261 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp.txt

New bindings should be in DT schema format.

> diff --git a/Documentation/devicetree/bindings/display/msm/dp.txt b/Documentation/devicetree/bindings/display/msm/dp.txt
> new file mode 100644
> index 0000000..38be36d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dp.txt
> @@ -0,0 +1,249 @@
> +Qualcomm Technologies, Inc.
> +DP is the master Display Port device which supports DP host controllers that are compatible with VESA Display Port interface specification.
> +DP Controller: Required properties:
> +- compatible:           Should be "qcom,dp-display".

Needs to be more specific like including the SoC name.

> +- reg:                  Base address and length of DP hardware's memory mapped regions.
> +- cell-index:           Specifies the controller instance.

FDT doesn't use cell-index.

> +- reg-names:            A list of strings that name the list of regs.
> +			"dp_ahb" - DP controller memory region.
> +			"dp_aux" - DP AUX memory region.
> +			"dp_link" - DP link layer memory region.
> +			"dp_p0" - DP pixel clock domain memory region.
> +			"dp_phy" - DP PHY memory region.
> +			"dp_ln_tx0" - USB3 DP PHY combo TX-0 lane memory region.
> +			"dp_ln_tx1" - USB3 DP PHY combo TX-1 lane memory region.
> +			"dp_mmss_cc" - Display Clock Control memory region.

Sounds like a separate clock controller node...

> +			"qfprom_physical" - QFPROM Phys memory region.
> +			"dp_pll" - USB3 DP combo PLL memory region.
> +			"usb3_dp_com" - USB3 DP PHY combo memory region.

Should be a separate phy node?

> +			"hdcp_physical" - DP HDCP memory region.

The 'dp_' part is redundant.

What does 'physical' mean? Addresses in DT are always physical.

> +- interrupt-parent	phandle to the interrupt parent device node.

Don't document interrupt-parent. It's not required either because it 
could be in a parent node.

> +- interrupts:		The interrupt signal from the DP block.
> +- clocks:               Clocks required for Display Port operation. See [1] for details on clock bindings.
> +- clock-names:          Names of the clocks corresponding to handles. Following clocks are required:
> +			"core_aux_clk", "core_usb_ref_clk_src","core_usb_ref_clk", "core_usb_cfg_ahb_clk",
> +			"core_usb_pipe_clk", "ctrl_link_clk", "ctrl_link_iface_clk", "ctrl_crypto_clk",
> +			"ctrl_pixel_clk", "pixel_clk_rcg", "pixel_parent".

Clocks should be actual clock inputs to the module. If 'pixel_parent' is 
just some parent clock you want to assign, then use assigned-clocks.

> +- pll-node:		phandle to DP PLL node.

But you have a DP PLL reg region defined. Is this something else?

Needs a 'qcom' prefix if it stays.

> +- vdda-1p2-supply:		phandle to vdda 1.2V regulator node.
> +- vdda-0p9-supply:		phandle to vdda 0.9V regulator node.
> +- qcom,aux-cfg0-settings:		Specifies the DP AUX configuration 0 settings. The first
> +					entry in this array corresponds to the register offset
> +					within DP AUX, while the remaining entries indicate the
> +					programmable values.

Needs more details on what these are and why they must be in DT. We 
generally don't just stuff DT with raw values to initial registers with.

Line lengths should be <80 char.

> +- qcom,aux-cfg1-settings:		Specifies the DP AUX configuration 1 settings. The first
> +					entry in this array corresponds to the register offset
> +					within DP AUX, while the remaining entries indicate the
> +					programmable values.
> +- qcom,aux-cfg2-settings:		Specifies the DP AUX configuration 2 settings. The first
> +					entry in this array corresponds to the register offset
> +					within DP AUX, while the remaining entries indicate the
> +					programmable values.
> +- qcom,aux-cfg3-settings:		Specifies the DP AUX configuration 3 settings. The first
> +					entry in this array corresponds to the register offset
> +					within DP AUX, while the remaining entries indicate the
> +					programmable values.
> +- qcom,aux-cfg4-settings:		Specifies the DP AUX configuration 4 settings. The first
> +					entry in this array corresponds to the register offset
> +					within DP AUX, while the remaining entries indicate the
> +					programmable values.
> +- qcom,aux-cfg5-settings:		Specifies the DP AUX configuration 5 settings. The first
> +					entry in this array corresponds to the register offset
> +					within DP AUX, while the remaining entries indicate the
> +					programmable values.
> +- qcom,aux-cfg6-settings:		Specifies the DP AUX configuration 6 settings. The first
> +					entry in this array corresponds to the register offset
> +					within DP AUX, while the remaining entries indicate the
> +					programmable values.
> +- qcom,aux-cfg7-settings:		Specifies the DP AUX configuration 7 settings. The first
> +					entry in this array corresponds to the register offset
> +					within DP AUX, while the remaining entries indicate the
> +					programmable values.
> +- qcom,aux-cfg8-settings:		Specifies the DP AUX configuration 8 settings. The first
> +					entry in this array corresponds to the register offset
> +					within DP AUX, while the remaining entries indicate the
> +					programmable values.
> +- qcom,aux-cfg9-settings:		Specifies the DP AUX configuration 9 settings. The first
> +					entry in this array corresponds to the register offset
> +					within DP AUX, while the remaining entries indicate the
> +					programmable values.
> +- qcom,max-pclk-frequency-khz:	An integer specifying the maximum. pixel clock in KHz supported by Display Port.

Wrap your lines.

> +- extcon:				Phandle for the external connector class interface.

Don't use extcon. Either dp-connector or usb-connector binding instead.

> +- qcom,<type>-supply-entries:		A node that lists the elements of the supply used by the a particular "type" of DP module. The module "types"
> +					can be "core", "ctrl", and "phy". Within the same type,
> +					there can be more than one instance of this binding,
> +					in which case the entry would be appended with the
> +					supply entry index.
> +					e.g. qcom,ctrl-supply-entry@0
> +					-- qcom,supply-name: name of the supply (vdd/vdda/vddio)
> +					-- qcom,supply-min-voltage: minimum voltage level (uV)
> +					-- qcom,supply-max-voltage: maximum voltage level (uV)
> +					-- qcom,supply-enable-load: load drawn (uA) from enabled supply
> +					-- qcom,supply-disable-load: load drawn (uA) from disabled supply
> +					-- qcom,supply-pre-on-sleep: time to sleep (ms) before turning on
> +					-- qcom,supply-post-on-sleep: time to sleep (ms) after turning on
> +					-- qcom,supply-pre-off-sleep: time to sleep (ms) before turning off
> +					-- qcom,supply-post-off-sleep: time to sleep (ms) after turning off

Not sure what you're trying to do here, but looks like the regulator 
binding should be used.

> +- pinctrl-names:	List of names to assign mdss pin states defined in pinctrl device node
> +					Refer to pinctrl-bindings.txt
> +- pinctrl-<0..n>:	Lists phandles each pointing to the pin configuration node within a pin
> +					controller. These pin configurations are installed in the pinctrl
> +					device node. Refer to pinctrl-bindings.txt
> +DP Endpoint properties:
> +  - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
> +    input endpoint. For port@1, set to the DPU interface output. See [2] for
> +    device graph info.
> +
> +Optional properties:
> +- qcom,aux-en-gpio:		Specifies the aux-channel enable gpio.
> +- qcom,aux-sel-gpio:		Specifies the mux-selection that might be needed for aux interface.

-gpios is the preferred form.

> +
> +
> +DP PLL: Required properties:

Should be a separate doc.

> +- compatible:           Should be "qcom,dp-pll-10nm".
> +- reg:                  Base address and length of DP hardware's memory mapped regions.
> +- cell-index:           Specifies the PLL instance.
> +- reg-names:            A list of strings that name the list of regs.
> +			"pll_base" - DP PLL memory region.
> +			"phy_base" - DP PHY memory region.
> +			"ln_tx0_base" - USB3 DP PHY combo TX-0 lane memory region.
> +			"ln_tx1_base" - USB3 DP PHY combo TX-1 lane memory region.
> +			"gdsc_base" - gdsc memory region.
> +- interrupt-parent	phandle to the interrupt parent device node.
> +- interrupts:		The interrupt signal from the DP block.
> +- clocks:               Clocks required for Display Port operation. See [1] for details on clock bindings.
> +- clock-names:          Names of the clocks corresponding to handles. Following clocks are required:
> +			"iface_clk", "ref_clk", cfg_ahb_clk", "pipe_clk".
> +- clock-rate:           Initial clock rate to be configured. For the shared clocks, the default value			     is set to zero so that minimum clock value is configured. Non-zero clock
> +			value can be used to configure DP pixel clock.
> +
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +[2] Documentation/devicetree/bindings/graph.txt
> +
> +Example:
> +	msm_dp: dp_display@ae90000{
> +		cell-index = <0>;
> +		compatible = "qcom,dp-display";
> +
> +		reg =   <0 0x90000 0x0dc>,
> +			<0 0x90200 0x0c0>,
> +			<0 0x90400 0x508>,
> +			<0 0x90a00 0x094>,
> +			<1 0xeaa00 0x200>,
> +			<1 0xea200 0x200>,
> +			<1 0xea600 0x200>,
> +			<2 0x02000 0x1a0>,
> +			<3 0x00000 0x621c>,
> +			<1 0xea000 0x180>,
> +			<1 0xe8000 0x20>,
> +			<4 0xe1000 0x034>;
> +		reg-names = "dp_ahb", "dp_aux", "dp_link",
> +			"dp_p0", "dp_phy", "dp_ln_tx0", "dp_ln_tx1",
> +			"dp_mmss_cc", "qfprom_physical", "dp_pll",
> +			"usb3_dp_com", "hdcp_physical";
> +
> +		interrupt-parent = <&mdss>;
> +		interrupts = <12 0>;
> +
> +		extcon = <&usb_1_ssphy>;
> +		clocks =  <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +			<&rpmhcc RPMH_CXO_CLK>,
> +			<&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +			<&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +			<&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
> +			<&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +			<&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +			<&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +			<&dispcc DISP_CC_MDSS_DP_CRYPTO_CLK>,
> +			<&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +		clock-names = "core_aux_clk", "core_ref_clk_src",
> +			"core_usb_ref_clk", "core_usb_cfg_ahb_clk",
> +			"core_usb_pipe_clk", "ctrl_link_clk",
> +			"ctrl_link_iface_clk", "ctrl_pixel_clk",
> +			"crypto_clk", "pixel_clk_rcg";
> +
> +		pll-node = <&dp_pll>;
> +		qcom,aux-cfg0-settings = [20 00];
> +		qcom,aux-cfg1-settings = [24 13 23 1d];
> +		qcom,aux-cfg2-settings = [28 24];
> +		qcom,aux-cfg3-settings = [2c 00];
> +		qcom,aux-cfg4-settings = [30 0a];
> +		qcom,aux-cfg5-settings = [34 26];
> +		qcom,aux-cfg6-settings = [38 0a];
> +		qcom,aux-cfg7-settings = [3c 03];
> +		qcom,aux-cfg8-settings = [40 bb];
> +		qcom,aux-cfg9-settings = [44 03];
> +
> +		qcom,max-pclk-frequency-khz = <675000>;
> +
> +		qcom,ctrl-supply-entries {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			qcom,ctrl-supply-entry@0 {
> +				reg = <0>;
> +				qcom,supply-name = "vdda-1p2";
> +				qcom,supply-min-voltage = <1200000>;
> +				qcom,supply-max-voltage = <1200000>;
> +				qcom,supply-enable-load = <21800>;
> +				qcom,supply-disable-load = <4>;
> +			};
> +		};
> +
> +		qcom,phy-supply-entries {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			qcom,phy-supply-entry@0 {
> +				reg = <0>;
> +				qcom,supply-name = "vdda-0p9";
> +				qcom,supply-min-voltage = <880000>;
> +				qcom,supply-max-voltage = <880000>;
> +				qcom,supply-enable-load = <36000>;
> +				qcom,supply-disable-load = <32>;
> +			};
> +		};
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				dp_in: endpoint {
> +					remote-endpoint = <&dpu_intf0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				dp_out: endpoint {
> +				};
> +			};
> +		};
> +	};
> +
> +	dp_pll: dp-pll@c011000 {
> +		compatible = "qcom,dp-pll-10nm";
> +		label = "DP PLL";
> +		cell-index = <0>;
> +		#clock-cells = <1>;
> +
> +		reg = <1 0xea000 0x200>,
> +		      <1 0xeaa00 0x200>,
> +		      <1 0xea200 0x200>,
> +		      <1 0xea600 0x200>,
> +		      <2 0x03000 0x8>;
> +		reg-names = "pll_base", "phy_base", "ln_tx0_base",
> +			"ln_tx1_base", "gdsc_base";
> +
> +		clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +			 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +			 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +			 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +		clock-names = "iface_clk", "ref_clk",
> +			"cfg_ahb_clk", "pipe_clk";
> +		clock-rate = <0>;
> +
> +	};
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> index a61dd40..eac6e1c 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> @@ -63,8 +63,9 @@ Required properties:
>  	Documentation/devicetree/bindings/graph.txt
>  	Documentation/devicetree/bindings/media/video-interfaces.txt
>  
> -	Port 0 -> DPU_INTF1 (DSI1)
> -	Port 1 -> DPU_INTF2 (DSI2)
> +	Port 0 -> DPU_INTF0 (DP)
> +	Port 1 -> DPU_INTF1 (DSI1)
> +	Port 2 -> DPU_INTF2 (DSI2)

No, you can't redefine existing binding.

>  
>  Optional properties:
>  - assigned-clocks: list of clock specifiers for clocks needing rate assignment
> @@ -125,13 +126,20 @@ Example:
>  
>  				port@0 {
>  					reg = <0>;
> -					dpu_intf1_out: endpoint {
> -						remote-endpoint = <&dsi0_in>;
> +					dpu_intf0_out: endpoint {
> +						remote-endpoint = <&dp_in>;
>  					};
>  				};
>  
>  				port@1 {
>  					reg = <1>;
> +					dpu_intf1_out: endpoint {
> +						remote-endpoint = <&dsi0_in>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
>  					dpu_intf2_out: endpoint {
>  						remote-endpoint = <&dsi1_in>;
>  					};
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
