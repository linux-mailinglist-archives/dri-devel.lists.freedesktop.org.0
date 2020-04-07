Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0181A058C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 06:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52686E109;
	Tue,  7 Apr 2020 04:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1206E109
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 04:23:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586233409; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=p8AiWAR7sO79j0rSGp9CRqkB75yONIL5cu2vJrDn6BM=;
 b=JnhNdlwT7H8LV0qbHhsvHANUrXj3Gcp96jb9RkkwhMrtZLj3RlziMPg+IJPKcghyift5gZxI
 yP7nmzWagN9tKP/Upyl00v8sLONvUHdvLoNVPWffvDNg+l2T7YTvPk2l89QktO8W9SNIxAzW
 vy+m9hZjCZCi+sfERe2gwFkmYGA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8c0030.7f42c92a9500-smtp-out-n02;
 Tue, 07 Apr 2020 04:23:12 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 762F6C43636; Tue,  7 Apr 2020 04:23:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from TANMSHAH (cpe-75-85-180-63.san.res.rr.com [75.85.180.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 011CDC433F2;
 Tue,  7 Apr 2020 04:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 011CDC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=tanmay@codeaurora.org
From: <tanmay@codeaurora.org>
To: "'Sam Ravnborg'" <sam@ravnborg.org>
References: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org>
 <1585701031-28871-2-git-send-email-tanmay@codeaurora.org>
 <20200401054949.GA10028@ravnborg.org>
In-Reply-To: <20200401054949.GA10028@ravnborg.org>
Subject: RE: [DPU PATCH v5 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL
 driver for Snapdragon
Date: Mon, 6 Apr 2020 21:23:09 -0700
Message-ID: <7d3401d60c94$3f2794a0$bd76bde0$@codeaurora.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQJnKLy7z6bNgCfKvhixjK+twDq6KwEizvlRAkyDUHinL1pZMA==
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
 abhinavk@codeaurora.org, swboyd@chromium.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, 'Vara Reddy' <varar@codeaurora.org>,
 hoegsberg@google.com, aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org, 'Chandan Uddaraju' <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thanks for reviews.

The changes were posted by Vara Reddy. Due to some configuration errors,
changes were posted with my E-mail ID. Vara will be addressing comments, and
we will take care of this error with next patchset.

Thanks,
Tanmay

-----Original Message-----
From: Sam Ravnborg <sam@ravnborg.org> 
Sent: Tuesday, March 31, 2020 10:50 PM
To: Tanmay Shah <tanmay@codeaurora.org>
Cc: freedreno@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
devicetree@vger.kernel.org; seanpaul@chromium.org; swboyd@chromium.org;
abhinavk@codeaurora.org; hoegsberg@google.com;
dri-devel@lists.freedesktop.org; Vara Reddy <varar@codeaurora.org>;
aravindh@codeaurora.org; linux-clk@vger.kernel.org; Chandan Uddaraju
<chandanu@codeaurora.org>
Subject: Re: [DPU PATCH v5 1/5] dt-bindings: msm/dp: add bindings of
DP/DP-PLL driver for Snapdragon

Hi Tanmay


Reviewing the yaml bindings triggered a few comments. See below.

	Sam

On Tue, Mar 31, 2020 at 05:30:27PM -0700, Tanmay Shah wrote:
> From: Chandan Uddaraju <chandanu@codeaurora.org>
> 
> Add bindings for Snapdragon DisplayPort and display-port PLL driver.
> 
> Changes in V2:
> Provide details about sel-gpio
> 
> Changes in V4:
> Provide details about max dp lanes
> Change the commit text
> 
> Changes in V5:
> Moved dp.txt to yaml file.
> 
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>

As you handle the patch, thus the patch passed throgh you, you are supposed
to sign-off the patch.


The changes to dpu.txt is not explained in the changelog.


> ---
>  .../devicetree/bindings/display/msm/dp-sc7180.yaml | 325
+++++++++++++++++++++
>  .../devicetree/bindings/display/msm/dpu.txt        |  16 +-
>  2 files changed, 337 insertions(+), 4 deletions(-)  create mode 
> 100644 Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> 
> diff --git 
> a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml 
> b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> new file mode 100644
> index 0000000..761a01d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> @@ -0,0 +1,325 @@
> +# SPDX-License-Identifier: GPL-2.0-only
For new bindings please use: (GPL-2.0-only OR BSD-2-Clause)


> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dp-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display Port dt properties.
> +
> +maintainers:
> +  - Chandan Uddaraju <chandanu@codeaurora.org>
> +  - Vara Reddy <varar@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for MSM Display Port which supports DP host 
> +controllers
> +  that are compatible with VESA Display Port interface specification.
> +
> +properties:
> +  "msm_dp":
The quotes seems not necessary.
This describes the name of the node.
The typical way to identify a node is using a compatible.

So I think that the right solution here is to drop "msm_dp".

> +    type: object
> +    description: |
> +      Node containing Display port register address bases, clocks, power
supplies.
> +

And start here.
> +    properties:
> +     compatible:
> +       items:
> +         - const: qcom,dp-display
> +
> +     cell-index:
> +       description: Specifies the controller instance.
> +
> +     reg:
> +       description: Physical base address and length of controller's
registers.
This description is generic and can be omitted.
But it would be good with a descrition of the individual registers like
this:

    reg:
      items:
        - description: AHB bla bla
	- description: aux bla bla

> +
> +     reg-names:
> +       description: |
> +         Names for different register regions defined above. The required
region
> +         is mentioned below.
> +       items:
> +         - const: dp_ahb
> +         - const: dp_aux
> +         - const: dp_link
> +         - const: dp_p0
> +         - const: dp_phy
> +         - const: dp_ln_tx0
> +         - const: dp_ln_tx1
> +         - const: afprom_physical
> +         - const: dp_pll
> +         - const: usb3_dp_com
> +         - const: hdcp_physical
> +
> +     interrupts:
> +       description: The interrupt signal from the DP block.
> +
> +     clocks:
> +       description: List of clock specifiers for clocks needed by the
device.
          items:
	    - description: aux clock bla bla
	    - description: ref clock bla bla


> +
> +     clock-names:
> +       description: |
> +         Device clock names in the same order as mentioned in clocks
property.
> +         The required clocks are mentioned below.
> +       items:
> +         - const: core_aux_clk
> +         - const: core_ref_clk_src
> +         - const: core_usb_ref_clk
> +         - const: core_usb_cfg_ahb_clk
> +         - const: core_usb_pipe_clk
> +         - const: ctrl_link_clk
> +         - const: ctrl_link_iface_clk
> +         - const: ctrl_pixel_clk
> +         - const: crypto_clk
> +         - const: pixel_clk_rcg
> +
> +     pll-node:
> +       description: phandle to DP PLL node.
Add type (phandle)

> +
> +     vdda-1p2-supply:
> +       description: phandle to vdda 1.2V regulator node.
> +
> +     vdda-0p9-supply:
> +       description: phandle to vdda 0.9V regulator node.
> +
> +     aux-cfg0-settings:
> +       description: |
> +         Specifies the DP AUX configuration 0 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
Add type, goes for all *-settings


> +
> +     aux-cfg1-settings:
> +       description: |
> +         Specifies the DP AUX configuration 1 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg2-settings:
> +       description: |
> +         Specifies the DP AUX configuration 2 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg3-settings:
> +       description: |
> +         Specifies the DP AUX configuration 3 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg4-settings:
> +       description: |
> +         Specifies the DP AUX configuration 4 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg5-settings:
> +       description: |
> +         Specifies the DP AUX configuration 5 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg6-settings:
> +       description: |
> +         Specifies the DP AUX configuration 6 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg7-settings:
> +       description: |
> +         Specifies the DP AUX configuration 7 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg8-settings:
> +       description: |
> +         Specifies the DP AUX configuration 8 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     aux-cfg9-settings:
> +       description: |
> +         Specifies the DP AUX configuration 9 settings.
> +         The first entry in this array corresponds to the register offset
> +         within DP AUX, while the remaining entries indicate the
> +         programmable values.
> +
> +     max-pclk-frequency-khz:
> +       description: Maximum displayport pixel clock supported for the
chipset.
> +
> +     data-lanes:
> +       description: Maximum number of lanes that can be used for Display
port.
> +
> +     usbplug-cc-gpio:
> +       maxItems: 1
> +       description: Specifies the usbplug orientation gpio.
Shall be named -gpios. Goes for all -gpio properties.
maxItems: 1 is good. Keep it.

> +
> +     aux-en-gpio:
> +       maxItems: 1
> +       description: Specifies the aux-channel enable gpio.
> +
> +     aux-sel-gpio:
> +       maxItems: 1
> +       description: Specifies the sux-channel select gpio.
> +
> +     ports:
> +       description: |
> +         Contains display port controller endpoint subnode.
> +         remote-endpoint: |
> +           For port@0, set to phandle of the connected panel/bridge's
> +           input endpoint. For port@1, set to the DPU interface output.
> +           Documentation/devicetree/bindings/graph.txt and
> +           Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +  "dp_pll":
quotes should not be required here.

I looks like yo try to describe two differents nodes in the same file.
Consider to split in two files.

Some of the comments from above applies here too.

> +     type: object
> +     description: Node contains properties of Display port pll and phy
driver.
> +
> +     properties:
> +       compatible:
> +         items:
> +           - const: qcom,dp-pll-10nm
> +
> +       cell-index:
> +         description: Specifies the controller instance.
> +
> +       reg:
> +         description: Physical base address and length of DP phy and pll
registers.
> +
> +       reg-names:
> +         description: |
> +           Names for different register regions defined above. The
required region
> +           is mentioned below.
> +         items:
> +           - const: pll_base
> +           - const: phy_base
> +           - const: ln_tx0_base
> +           - const: ln_tx1_base
> +           - const: gdsc_base
> +
> +       clocks:
> +         description: List of clock specifiers for clocks needed by the
device.
> +
> +       clock-names:
> +         description: |
> +           Device clock names in the same order as mentioned in clocks
property.
> +           The required clocks are mentioned below.
> +         items:
> +           - const: iface
> +           - const: ref
> +           - const: cfg_ahb
> +           - const: pipe
> +
> +examples:

4 spaces as indent - good.
You have include files - good.


> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    msm_dp: displayport-controller@ae90000{
> +                cell-index = <0>;
indent only four spaces

> +        compatible = "qcom,dp-display";
> +        reg =   <0 0xae90000 0 0x200>,
Only one space after '=' - rememebr to adjust indent in following lines.
> +                <0 0xae90200 0 0x200>,
> +                <0 0xae90400 0 0xc00>,
> +                <0 0xae91000 0 0x400>,
> +                <0 0x88eaa00 0 0x200>,
> +                <0 0x88ea200 0 0x200>,
> +                <0 0x88ea600 0 0x200>,
> +                <0 0x780000 0 0x6228>,
> +                <0 0x088ea000 0 0x40>,
> +                <0 0x88e8000 0 0x20>,
> +                <0 0x0aee1000 0 0x034>;
> +        reg-names = "dp_ahb", "dp_aux", "dp_link",
> +            "dp_p0", "dp_phy", "dp_ln_tx0", "dp_ln_tx1",
> +            "qfprom_physical", "dp_pll",
> +            "usb3_dp_com", "hdcp_physical";

Indent so names in following lines starts where names in previous lines
starts.
Like this:
        reg-names = "dp_ahb", "dp_aux", "dp_link",
                    "dp_p0", "dp_phy", "dp_ln_tx0", "dp_ln_tx1",
                    "qfprom_physical", "dp_pll",
                    "usb3_dp_com", "hdcp_physical";


> +
> +        interrupt-parent = <&display_subsystem>;
> +        interrupts = <12 0>;
> +
> +        clocks = <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +            <&rpmhcc RPMH_CXO_CLK>,
Indent so '<' are aligned under each other. Like done above for reg =

> +            <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +            <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +            <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
> +            <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +            <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +            <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +            <&dispcc DISP_CC_MDSS_DP_CRYPTO_CLK>,
> +            <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +        clock-names = "core_aux_clk", "core_ref_clk_src",
> +            "core_usb_ref_clk", "core_usb_cfg_ahb_clk",
> +            "core_usb_pipe_clk", "ctrl_link_clk",
> +            "ctrl_link_iface_clk", "ctrl_pixel_clk",
> +            "crypto_clk", "pixel_clk_rcg";
Fix indent

> +
> +        pll-node = <&dp_pll>;
> +        vdda-1p2-supply = <&vreg_l3c_1p2>;
> +        vdda-0p9-supply = <&vreg_l4a_0p8>;
> +
> +        aux-cfg0-settings = [20 00];
> +        aux-cfg1-settings = [24 13 23 1d];
> +        aux-cfg2-settings = [28 24];
> +        aux-cfg3-settings = [2c 00];
> +        aux-cfg4-settings = [30 0a];
> +        aux-cfg5-settings = [34 26];
> +        aux-cfg6-settings = [38 0a];
> +        aux-cfg7-settings = [3c 03];
> +        aux-cfg8-settings = [40 bb];
> +        aux-cfg9-settings = [44 03];
> +
> +        max-pclk-frequency-khz = <67500>;
> +        data-lanes = <2>;
> +
> +        aux-en-gpio = <&msmgpio 55 1>;
> +        aux-sel-gpio = <&msmgpio 110 1>;
> +        usbplug-cc-gpio = <&msmgpio 90 1>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                dp_in: endpoint {
> +                    remote-endpoint = <&dpu_intf0_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                dp_out: endpoint {
> +                };
> +            };
> +        };
> +    };
> +
> +    dp_pll: dp-pll@088ea000 {
> +        compatible = "qcom,dp-pll-10nm";
> +        label = "DP PLL";
> +        cell-index = <0>;
> +        #clock-cells = <1>;
> +
> +        reg = <0 0x088ea000 0 0x200>,
> +              <0 0x088eaa00 0 0x200>,
> +              <0 0x088ea200 0 0x200>,
> +              <0 0x088ea600 0 0x200>,
> +              <0 0x08803000 0 0x8>;
> +        reg-names = "pll_base", "phy_base", "ln_tx0_base",
> +            "ln_tx1_base", "gdsc_base";
> +
> +        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +             <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +             <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +             <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +        clock-names = "iface_clk", "ref_clk",
> +            "cfg_ahb_clk", "pipe_clk";
> +    };
> +
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt 
> b/Documentation/devicetree/bindings/display/msm/dpu.txt
> index 551ae26..7e99e45 100644
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
>  
>  Optional properties:
>  - assigned-clocks: list of clock specifiers for clocks needing rate 
> assignment @@ -125,13 +126,20 @@ Example:
>  
>  				port@0 {
>  					reg = <0>;
> -					dpu_intf1_out: endpoint {
> -						remote-endpoint =
<&dsi0_in>;
> +					dpu_intf0_out: endpoint {
> +						remote-endpoint = <&dp_in>;
>  					};
>  				};
>  
>  				port@1 {
>  					reg = <1>;
> +					dpu_intf1_out: endpoint {
> +						remote-endpoint =
<&dsi0_in>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
>  					dpu_intf2_out: endpoint {
>  						remote-endpoint =
<&dsi1_in>;
>  					};
> --
> 1.9.1
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
