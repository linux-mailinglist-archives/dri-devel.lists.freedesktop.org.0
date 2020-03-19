Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A78A18AE05
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C162D6E9A6;
	Thu, 19 Mar 2020 08:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2596E212
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 00:48:30 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id ck23so197318pjb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 17:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=F+8qEsHCihA/upFwOD+n8Z89QlpcvWA6YcIP6FiyIoc=;
 b=VkoPAWn0qesYDAbxC1oYgdt4t23xU93ASnUrOEzIVDz7DwrrJRC7CRZixF02Zaq1Hf
 URtR5bq6tPIL9xxM9xcfEJNQcMLTREuWUjeNci/RYqb1Mg34of6J6zJYUAAseMu7B+Th
 7OfRvHJmElKv6Bd24PgkYXsT8dM7iBtFMNLlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=F+8qEsHCihA/upFwOD+n8Z89QlpcvWA6YcIP6FiyIoc=;
 b=PSQe61V/5aVZGObHAnSd7RlkhevxfaYCLLbXDm+JKL2KXnEMbO/GFKALPssJmKTi5M
 HSRnQgjqyQu40LyNoVpYQih0s1hG0jZl9ygiIbUjvTJREQTJlBRjhYrHuheQyh6fc+of
 hk5KxHbdPIpFzhwHhHT10OJq1W5/K5arid6tLcdoHh9CM25r0EpvI8V299AasgSQebRD
 iIvgA6KEgAB1cbr+mxxmBFTcMeAsPdxel4LTnYm7g3vBepiAxw+uu2OYBU6+f/AoJrpe
 8Pn0ewzdSVs9+ZVfdyS1kHDDsK+9tmlSjGuw+EidDBNMnr0I7Kxf17lHpaRtdE1/h3s+
 FjQQ==
X-Gm-Message-State: ANhLgQ21VbFH5yawYargCKpnIFIuDA8yFa4+eCNAyX2m9F20O6Owwsis
 /CCxJSc5DPXFPHf57sfl1X1eJw==
X-Google-Smtp-Source: ADFU+vtVYKkYoVSkfz07Z51dcbgiu1tVxz7OmrUvw2lFgRn0Eyh21JwVpHZFtfagLGHImd52mO8l2Q==
X-Received: by 2002:a17:902:8d89:: with SMTP id v9mr760736plo.83.1584578909331; 
 Wed, 18 Mar 2020 17:48:29 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id p5sm189144pfn.182.2020.03.18.17.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 17:48:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1583367028-19979-2-git-send-email-varar@codeaurora.org>
References: <1583367028-19979-1-git-send-email-varar@codeaurora.org>
 <1583367028-19979-2-git-send-email-varar@codeaurora.org>
Subject: Re: [DPU PATCH v4 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL
 driver for Snapdragon
From: Stephen Boyd <swboyd@chromium.org>
To: Vara Reddy <varar@codeaurora.org>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 seanpaul@chromium.org
Date: Wed, 18 Mar 2020 17:48:27 -0700
Message-ID: <158457890765.152100.17742965907717707149@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Thu, 19 Mar 2020 08:08:58 +0000
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
Cc: abhinavk@codeaurora.org, hoegsberg@google.com,
 dri-devel@lists.freedesktop.org, Vara Reddy <varar@codeaurora.org>,
 aravindh@codeaurora.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Vara Reddy (2020-03-04 16:10:24)
> From: Chandan Uddaraju <chandanu@codeaurora.org>
> 
> Add bindings for Snapdragon DisplayPort and
> display-port PLL driver.
> 
> Changes in V2:
> Provide details about sel-gpio
> 
> Changes in V4:
> Provide details about max dp lanes
> Change the commit text
> 
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> ---
>  .../devicetree/bindings/display/msm/dp.txt         | 252 +++++++++++++++++++++
>  .../devicetree/bindings/display/msm/dpu.txt        |  16 +-
>  2 files changed, 264 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp.txt

Having this in YAML will certainly make it easier to review. Please do
that as Rob H has asked.

> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp.txt b/Documentation/devicetree/bindings/display/msm/dp.txt
> new file mode 100644
> index 0000000..1a4e17f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dp.txt
> @@ -0,0 +1,252 @@
> +Qualcomm Technologies, Inc.
> +DP is the master Display Port device which supports DP host controllers that are compatible with VESA Display Port interface specification.
> +DP Controller: Required properties:
> +- compatible:           Should be "qcom,dp-display".
> +- reg:                  Base address and length of DP hardware's memory mapped regions.
> +- cell-index:           Specifies the controller instance.
> +- reg-names:            A list of strings that name the list of regs.
> +                       "dp_ahb" - DP controller memory region.
> +                       "dp_aux" - DP AUX memory region.
> +                       "dp_link" - DP link layer memory region.
> +                       "dp_p0" - DP pixel clock domain memory region.
> +                       "dp_phy" - DP PHY memory region.
> +                       "dp_ln_tx0" - USB3 DP PHY combo TX-0 lane memory region.
> +                       "dp_ln_tx1" - USB3 DP PHY combo TX-1 lane memory region.
> +                       "dp_mmss_cc" - Display Clock Control memory region.
> +                       "qfprom_physical" - QFPROM Phys memory region.
> +                       "dp_pll" - USB3 DP combo PLL memory region.
> +                       "usb3_dp_com" - USB3 DP PHY combo memory region.
> +                       "hdcp_physical" - DP HDCP memory region.

A handful of these register properties overlap with the USB PHY region.
I suspect the existing qcom,sc7180-qmp-usb3-phy USB PHY binding that we
have is wrong. It should describe both the USB part and the DP part of
the combo PHY. Probably the DP part can be a subnode like how the
superspeed PHY is a child node of the wrapper node. Then we'll have to
figure out how to coordinate the access to usb3_dp_com (which I presume
corresponds to the dp_com region in the usb3-phy binding) so that the
USB and DP PHY drivers can figure out how to configure the "type-c" pins
on the SoC to be 2 lanes DP and 2 lanes USB or 4 lanes USB or 4 lanes DP.

> +- interrupt-parent     phandle to the interrupt parent device node.
> +- interrupts:          The interrupt signal from the DP block.
> +- clocks:               Clocks required for Display Port operation. See [1] for details on clock bindings.
> +- clock-names:          Names of the clocks corresponding to handles. Following clocks are required:
> +                       "core_aux_clk", "core_usb_ref_clk_src","core_usb_ref_clk", "core_usb_cfg_ahb_clk",
> +                       "core_usb_pipe_clk", "ctrl_link_clk", "ctrl_link_iface_clk", "ctrl_crypto_clk",
> +                       "ctrl_pixel_clk", "pixel_clk_rcg", "pixel_parent".

Please remove _clk suffix on all clock names. It's redundant.

> +- pll-node:            phandle to DP PLL node.
> +- vdda-1p2-supply:             phandle to vdda 1.2V regulator node.
> +- vdda-0p9-supply:             phandle to vdda 0.9V regulator node.
> +- qcom,aux-cfg0-settings:              Specifies the DP AUX configuration 0 settings. The first
> +                                       entry in this array corresponds to the register offset
> +                                       within DP AUX, while the remaining entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg1-settings:              Specifies the DP AUX configuration 1 settings. The first
> +                                       entry in this array corresponds to the register offset
> +                                       within DP AUX, while the remaining entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg2-settings:              Specifies the DP AUX configuration 2 settings. The first
> +                                       entry in this array corresponds to the register offset
> +                                       within DP AUX, while the remaining entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg3-settings:              Specifies the DP AUX configuration 3 settings. The first
> +                                       entry in this array corresponds to the register offset
> +                                       within DP AUX, while the remaining entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg4-settings:              Specifies the DP AUX configuration 4 settings. The first
> +                                       entry in this array corresponds to the register offset
> +                                       within DP AUX, while the remaining entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg5-settings:              Specifies the DP AUX configuration 5 settings. The first
> +                                       entry in this array corresponds to the register offset
> +                                       within DP AUX, while the remaining entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg6-settings:              Specifies the DP AUX configuration 6 settings. The first
> +                                       entry in this array corresponds to the register offset
> +                                       within DP AUX, while the remaining entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg7-settings:              Specifies the DP AUX configuration 7 settings. The first
> +                                       entry in this array corresponds to the register offset
> +                                       within DP AUX, while the remaining entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg8-settings:              Specifies the DP AUX configuration 8 settings. The first
> +                                       entry in this array corresponds to the register offset
> +                                       within DP AUX, while the remaining entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg9-settings:              Specifies the DP AUX configuration 9 settings. The first
> +                                       entry in this array corresponds to the register offset
> +                                       within DP AUX, while the remaining entries indicate the
> +                                       programmable values.

It would be better if these properties were understandable by us mere
kernel developers out there. Is it possible to make them into standalone
properties that control certain configuration tunings? Are any of these
not variable per-board and can be hardcoded based on the SoC into the
driver?

> +- qcom,max-pclk-frequency-khz:         An integer specifying the maximum. pixel clock in KHz supported by Display Port.

This can't be detected at runtime?

> +- qcom,max-lanes-for-dp:               Maximum number of lanes that can be used for Display port.

This can come from an of graph walk to figure out how many possible
lanes are connected? Or some more standard property that describes
logical to physical lane mapping, like data-lanes?

> +- qcom,<type>-supply-entries:          A node that lists the elements of the supply used by the a particular "type" of DP module. The module "types"
> +                                       can be "core", "ctrl", and "phy". Within the same type,
> +                                       there can be more than one instance of this binding,
> +                                       in which case the entry would be appended with the
> +                                       supply entry index.
> +                                       e.g. qcom,ctrl-supply-entry@0
> +                                       -- qcom,supply-name: name of the supply (vdd/vdda/vddio)
> +                                       -- qcom,supply-min-voltage: minimum voltage level (uV)
> +                                       -- qcom,supply-max-voltage: maximum voltage level (uV)
> +                                       -- qcom,supply-enable-load: load drawn (uA) from enabled supply
> +                                       -- qcom,supply-disable-load: load drawn (uA) from disabled supply
> +                                       -- qcom,supply-pre-on-sleep: time to sleep (ms) before turning on
> +                                       -- qcom,supply-post-on-sleep: time to sleep (ms) after turning on
> +                                       -- qcom,supply-pre-off-sleep: time to sleep (ms) before turning off
> +                                       -- qcom,supply-post-off-sleep: time to sleep (ms) after turning off

All these regulator properties look like things that should be handled
by board constraints on certain supplies, not by this binding or the
driver that matches this binding.

> +- pinctrl-names:       List of names to assign mdss pin states defined in pinctrl device node
> +                                       Refer to pinctrl-bindings.txt
> +- pinctrl-<0..n>:      Lists phandles each pointing to the pin configuration node within a pin
> +                                       controller. These pin configurations are installed in the pinctrl
> +                                       device node. Refer to pinctrl-bindings.txt

These two properties aren't needed.

> +DP Endpoint properties:
> +  - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
> +    input endpoint. For port@1, set to the DPU interface output. See [2] for
> +    device graph info.
> +
> +Optional properties:
> +- qcom,aux-en-gpio:            Specifies the aux-channel enable gpio.
> +- qcom,aux-sel-gpio:           Specifies the mux-selection that might be needed for aux interface.

Please use the normal '<your name here>-gpios' property for gpios.
> +
> +
> +DP PLL: Required properties:
> +- compatible:           Should be "qcom,dp-pll-10nm".
> +- reg:                  Base address and length of DP hardware's memory mapped regions.
> +- cell-index:           Specifies the PLL instance.
> +- reg-names:            A list of strings that name the list of regs.
> +                       "pll_base" - DP PLL memory region.
> +                       "phy_base" - DP PHY memory region.
> +                       "ln_tx0_base" - USB3 DP PHY combo TX-0 lane memory region.
> +                       "ln_tx1_base" - USB3 DP PHY combo TX-1 lane memory region.

This was in the other node binding. Probably the only reg property
required here is pll_base?

> +                       "gdsc_base" - gdsc memory region.
> +- interrupt-parent     phandle to the interrupt parent device node.
> +- interrupts:          The interrupt signal from the DP block.
> +- clocks:               Clocks required for Display Port operation. See [1] for details on clock bindings.
> +- clock-names:          Names of the clocks corresponding to handles. Following clocks are required:
> +                       "iface_clk", "ref_clk", cfg_ahb_clk", "pipe_clk".
> +- clock-rate:           Initial clock rate to be configured. For the shared clocks, the default value                       is set to zero so that minimum clock value is configured. Non-zero clock

We have assigned-clock-rates for this.

> +                       value can be used to configure DP pixel clock.
> +
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +[2] Documentation/devicetree/bindings/graph.txt
> +
> +Example:
> +       msm_dp: dp_display@ae90000{

No underscores in node names. It should also be somewhat generic like
'display-controller' or 'displayport-controller' and the first reg
property should match the unit address after the at sign (@).

> +               cell-index = <0>;
> +               compatible = "qcom,dp-display";
> +
> +               reg =   <0 0x90000 0x0dc>,
> +                       <0 0x90200 0x0c0>,
> +                       <0 0x90400 0x508>,
> +                       <0 0x90a00 0x094>,
> +                       <1 0xeaa00 0x200>,
> +                       <1 0xea200 0x200>,
> +                       <1 0xea600 0x200>,
> +                       <2 0x02000 0x1a0>,
> +                       <3 0x00000 0x621c>,
> +                       <1 0xea000 0x180>,
> +                       <1 0xe8000 0x20>,
> +                       <4 0xe1000 0x034>;
> +               reg-names = "dp_ahb", "dp_aux", "dp_link",
> +                       "dp_p0", "dp_phy", "dp_ln_tx0", "dp_ln_tx1",
> +                       "dp_mmss_cc", "qfprom_physical", "dp_pll",
> +                       "usb3_dp_com", "hdcp_physical";
> +
> +               interrupt-parent = <&display_subsystem>;
> +               interrupts = <12 0>;
> +
> +               extcon = <&usb_1_ssphy>;

Please no extcon

> +               clocks =  <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +                       <&rpmhcc RPMH_CXO_CLK>,
> +                       <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +                       <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +                       <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
> +                       <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +                       <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +                       <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +                       <&dispcc DISP_CC_MDSS_DP_CRYPTO_CLK>,
> +                       <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +               clock-names = "core_aux_clk", "core_ref_clk_src",
> +                       "core_usb_ref_clk", "core_usb_cfg_ahb_clk",
> +                       "core_usb_pipe_clk", "ctrl_link_clk",
> +                       "ctrl_link_iface_clk", "ctrl_pixel_clk",
> +                       "crypto_clk", "pixel_clk_rcg";
> +
> +               pll-node = <&dp_pll>;
> +               vdda-1p2-supply = <&vreg_l3c_1p2>;
> +               vdda-0p9-supply = <&vreg_l4a_0p8>;
> +               qcom,aux-cfg0-settings = [20 00];
> +               qcom,aux-cfg1-settings = [24 13 23 1d];
> +               qcom,aux-cfg2-settings = [28 24];
> +               qcom,aux-cfg3-settings = [2c 00];
> +               qcom,aux-cfg4-settings = [30 0a];
> +               qcom,aux-cfg5-settings = [34 26];
> +               qcom,aux-cfg6-settings = [38 0a];
> +               qcom,aux-cfg7-settings = [3c 03];
> +               qcom,aux-cfg8-settings = [40 bb];
> +               qcom,aux-cfg9-settings = [44 03];
> +
> +               qcom,max-pclk-frequency-khz = <675000>;
> +               qcom,max-lanes-for-dp = <2>;
> +
> +               qcom,ctrl-supply-entries {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       qcom,ctrl-supply-entry@0 {
> +                               reg = <0>;
> +                               qcom,supply-name = "vdda-1p2";
> +                               qcom,supply-min-voltage = <1200000>;
> +                               qcom,supply-max-voltage = <1200000>;
> +                               qcom,supply-enable-load = <21800>;
> +                               qcom,supply-disable-load = <4>;
> +                       };
> +               };
> +
> +               qcom,phy-supply-entries {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       qcom,phy-supply-entry@0 {
> +                               reg = <0>;
> +                               qcom,supply-name = "vdda-0p9";
> +                               qcom,supply-min-voltage = <880000>;
> +                               qcom,supply-max-voltage = <880000>;
> +                               qcom,supply-enable-load = <36000>;
> +                               qcom,supply-disable-load = <32>;
> +                       };
> +               };
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               dp_in: endpoint {
> +                                       remote-endpoint = <&dpu_intf0_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +                               dp_out: endpoint {
> +                               };
> +                       };
> +               };
> +       };
> +
> +       dp_pll: dp-pll@c011000 {
> +               compatible = "qcom,dp-pll-10nm";
> +               label = "DP PLL";
> +               cell-index = <0>;
> +               #clock-cells = <1>;
> +
> +               reg = <1 0xea000 0x200>,
> +                     <1 0xeaa00 0x200>,
> +                     <1 0xea200 0x200>,
> +                     <1 0xea600 0x200>,
> +                     <2 0x03000 0x8>;
> +               reg-names = "pll_base", "phy_base", "ln_tx0_base",
> +                       "ln_tx1_base", "gdsc_base";
> +
> +               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                        <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +                        <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +                        <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +               clock-names = "iface_clk", "ref_clk",
> +                       "cfg_ahb_clk", "pipe_clk";
> +               clock-rate = <0>;
> +

Remove this extra newline.

> +       };
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> index 551ae26..7e99e45 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> @@ -63,8 +63,9 @@ Required properties:
>         Documentation/devicetree/bindings/graph.txt
>         Documentation/devicetree/bindings/media/video-interfaces.txt
>  
> -       Port 0 -> DPU_INTF1 (DSI1)
> -       Port 1 -> DPU_INTF2 (DSI2)
> +       Port 0 -> DPU_INTF0 (DP)

Why is port 0 changed to be DP? Can't we add DP to the end so that older
DTs remain compatible?

> +       Port 1 -> DPU_INTF1 (DSI1)
> +       Port 2 -> DPU_INTF2 (DSI2)
>  
>  Optional properties:
>  - assigned-clocks: list of clock specifiers for clocks needing rate assignment
> @@ -125,13 +126,20 @@ Example:
>  
>                                 port@0 {
>                                         reg = <0>;
> -                                       dpu_intf1_out: endpoint {
> -                                               remote-endpoint = <&dsi0_in>;
> +                                       dpu_intf0_out: endpoint {
> +                                               remote-endpoint = <&dp_in>;
>                                         };
>                                 };
>  
>                                 port@1 {
>                                         reg = <1>;
> +                                       dpu_intf1_out: endpoint {
> +                                               remote-endpoint = <&dsi0_in>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg = <2>;
>                                         dpu_intf2_out: endpoint {
>                                                 remote-endpoint = <&dsi1_in>;
>                                         };
> -- 
> $(echo -e 'The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,

You should fix your signature :)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
