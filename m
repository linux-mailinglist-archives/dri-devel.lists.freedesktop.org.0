Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A57A1F2B02
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 02:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A95E89F2E;
	Tue,  9 Jun 2020 00:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A5989E9E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 00:15:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591661732; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2KLRpb+vFkWR5uAiSX+rTGYaLAnZJYACS5hn8nyWtZ4=;
 b=CjkV00FRNMyy4FWVDMvlagmmrCVjQVaiNEaGiGzWTmKoEGRTpf7E8aPlC7fazKjMW/Z5MLcM
 br0cWM3ytkUSxM3jHhQ1Ez5BWeEMtz7rpu8/6MWySnMxwmhfjLAKXx6Xfx0WN3EnZXR/ZEmt
 x413D2anOVY/FwVldFKPxX2g+eo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5eded4926ecee74a4f98cb3f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 00:15:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 651B7C433CA; Tue,  9 Jun 2020 00:15:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8D213C433CB;
 Tue,  9 Jun 2020 00:15:12 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 08 Jun 2020 17:15:12 -0700
From: tanmay@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [DPU PATCH v5 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL
 driver for Snapdragon
In-Reply-To: <158768527020.135303.4794713080581005908@swboyd.mtv.corp.google.com>
References: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org>
 <1585701031-28871-2-git-send-email-tanmay@codeaurora.org>
 <158768527020.135303.4794713080581005908@swboyd.mtv.corp.google.com>
Message-ID: <7bc8133dd6a0ec35478b4fc7c4ff10ca@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
 dri-devel@lists.freedesktop.org, Vara Reddy <varar@codeaurora.org>,
 hoegsberg@google.com, aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for reviews Stephen. Please find my comments according to new 
design.

On 2020-04-23 16:41, Stephen Boyd wrote:
> Quoting Tanmay Shah (2020-03-31 17:30:27)
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
>> b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
>> new file mode 100644
>> index 0000000..761a01d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
>> @@ -0,0 +1,325 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dp-sc7180.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Description of Qualcomm Display Port dt properties.
> 
> This title should be something like
> 
> "Qualcomm Display Port Controller"
> 
Changed title as suggested.
>> +
>> +maintainers:
>> +  - Chandan Uddaraju <chandanu@codeaurora.org>
>> +  - Vara Reddy <varar@codeaurora.org>
>> +
>> +description: |
>> +  Device tree bindings for MSM Display Port which supports DP host
>> controllers
>> +  that are compatible with VESA Display Port interface specification.
>> +
>> +properties:
>> +  "msm_dp":
>> +    type: object
>> +    description: |
>> +      Node containing Display port register address bases, clocks, 
>> power
>> supplies.
>> +
>> +    properties:
>> +     compatible:
>> +       items:
>> +         - const: qcom,dp-display
>> +
>> +     cell-index:
>> +       description: Specifies the controller instance.
>> +
>> +     reg:
>> +       description: Physical base address and length of controller's
>> registers.
>> +
>> +     reg-names:
>> +       description: |
>> +         Names for different register regions defined above. The 
>> required
>> region
>> +         is mentioned below.
>> +       items:
>> +         - const: dp_ahb
>> +         - const: dp_aux
>> +         - const: dp_link
>> +         - const: dp_p0
>> +         - const: dp_phy
>> +         - const: dp_ln_tx0
>> +         - const: dp_ln_tx1
>> +         - const: afprom_physical
>> +         - const: dp_pll
>> +         - const: usb3_dp_com
>> +         - const: hdcp_physical
>> +
>> +     interrupts:
>> +       description: The interrupt signal from the DP block.
>> +
>> +     clocks:
>> +       description: List of clock specifiers for clocks needed by the
>> device.
>> +
>> +     clock-names:
>> +       description: |
>> +         Device clock names in the same order as mentioned in clocks
>> property.
>> +         The required clocks are mentioned below.
>> +       items:
>> +         - const: core_aux_clk
>> +         - const: core_ref_clk_src
>> +         - const: core_usb_ref_clk
>> +         - const: core_usb_cfg_ahb_clk
>> +         - const: core_usb_pipe_clk
>> +         - const: ctrl_link_clk
>> +         - const: ctrl_link_iface_clk
>> +         - const: ctrl_pixel_clk
>> +         - const: crypto_clk
>> +         - const: pixel_clk_rcg
>> +
>> +     pll-node:
>> +       description: phandle to DP PLL node.
>> +
>> +     vdda-1p2-supply:
>> +       description: phandle to vdda 1.2V regulator node.
>> +
>> +     vdda-0p9-supply:
>> +       description: phandle to vdda 0.9V regulator node.
>> +
>> +     aux-cfg0-settings:
>> +       description: |
>> +         Specifies the DP AUX configuration 0 settings.
>> +         The first entry in this array corresponds to the register 
>> offset
>> +         within DP AUX, while the remaining entries indicate the
>> +         programmable values.
>> +
>> +     aux-cfg1-settings:
>> +       description: |
>> +         Specifies the DP AUX configuration 1 settings.
>> +         The first entry in this array corresponds to the register 
>> offset
>> +         within DP AUX, while the remaining entries indicate the
>> +         programmable values.
>> +
>> +     aux-cfg2-settings:
>> +       description: |
>> +         Specifies the DP AUX configuration 2 settings.
>> +         The first entry in this array corresponds to the register 
>> offset
>> +         within DP AUX, while the remaining entries indicate the
>> +         programmable values.
>> +
>> +     aux-cfg3-settings:
>> +       description: |
>> +         Specifies the DP AUX configuration 3 settings.
>> +         The first entry in this array corresponds to the register 
>> offset
>> +         within DP AUX, while the remaining entries indicate the
>> +         programmable values.
>> +
>> +     aux-cfg4-settings:
>> +       description: |
>> +         Specifies the DP AUX configuration 4 settings.
>> +         The first entry in this array corresponds to the register 
>> offset
>> +         within DP AUX, while the remaining entries indicate the
>> +         programmable values.
>> +
>> +     aux-cfg5-settings:
>> +       description: |
>> +         Specifies the DP AUX configuration 5 settings.
>> +         The first entry in this array corresponds to the register 
>> offset
>> +         within DP AUX, while the remaining entries indicate the
>> +         programmable values.
>> +
>> +     aux-cfg6-settings:
>> +       description: |
>> +         Specifies the DP AUX configuration 6 settings.
>> +         The first entry in this array corresponds to the register 
>> offset
>> +         within DP AUX, while the remaining entries indicate the
>> +         programmable values.
>> +
>> +     aux-cfg7-settings:
>> +       description: |
>> +         Specifies the DP AUX configuration 7 settings.
>> +         The first entry in this array corresponds to the register 
>> offset
>> +         within DP AUX, while the remaining entries indicate the
>> +         programmable values.
>> +
>> +     aux-cfg8-settings:
>> +       description: |
>> +         Specifies the DP AUX configuration 8 settings.
>> +         The first entry in this array corresponds to the register 
>> offset
>> +         within DP AUX, while the remaining entries indicate the
>> +         programmable values.
>> +
>> +     aux-cfg9-settings:
>> +       description: |
>> +         Specifies the DP AUX configuration 9 settings.
>> +         The first entry in this array corresponds to the register 
>> offset
>> +         within DP AUX, while the remaining entries indicate the
>> +         programmable values.
>> +
>> +     max-pclk-frequency-khz:
>> +       description: Maximum displayport pixel clock supported for the
>> chipset.
>> +
>> +     data-lanes:
>> +       description: Maximum number of lanes that can be used for 
>> Display
>> port.
> 
> This should be an array of cells, not a single cell indicating the
> number of lanes.
> 
Done. Now data-lanes is array of integers and size of array represents 
maximum number of lanes supported.
>> +
>> +     usbplug-cc-gpio:
>> +       maxItems: 1
>> +       description: Specifies the usbplug orientation gpio.
>> +
>> +     aux-en-gpio:
>> +       maxItems: 1
>> +       description: Specifies the aux-channel enable gpio.
>> +
>> +     aux-sel-gpio:
>> +       maxItems: 1
>> +       description: Specifies the sux-channel select gpio.
>> +
>> +     ports:
>> +       description: |
>> +         Contains display port controller endpoint subnode.
>> +         remote-endpoint: |
>> +           For port@0, set to phandle of the connected panel/bridge's
>> +           input endpoint. For port@1, set to the DPU interface 
>> output.
>> +           Documentation/devicetree/bindings/graph.txt and
>> +           
>> Documentation/devicetree/bindings/media/video-interfaces.txt.
>> +
>> +  "dp_pll":
>> +     type: object
>> +     description: Node contains properties of Display port pll and 
>> phy
>> driver.
>> +
>> +     properties:
>> +       compatible:
>> +         items:
>> +           - const: qcom,dp-pll-10nm
>> +
>> +       cell-index:
>> +         description: Specifies the controller instance.
>> +
>> +       reg:
>> +         description: Physical base address and length of DP phy and 
>> pll
>> registers.
>> +
>> +       reg-names:
>> +         description: |
>> +           Names for different register regions defined above. The
>> required region
>> +           is mentioned below.
>> +         items:
>> +           - const: pll_base
>> +           - const: phy_base
>> +           - const: ln_tx0_base
>> +           - const: ln_tx1_base
>> +           - const: gdsc_base
>> +
>> +       clocks:
>> +         description: List of clock specifiers for clocks needed by 
>> the
>> device.
>> +
>> +       clock-names:
>> +         description: |
>> +           Device clock names in the same order as mentioned in 
>> clocks
>> property.
>> +           The required clocks are mentioned below.
>> +         items:
>> +           - const: iface
>> +           - const: ref
>> +           - const: cfg_ahb
>> +           - const: pipe
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    msm_dp: displayport-controller@ae90000{
>> +                cell-index = <0>;
>> +        compatible = "qcom,dp-display";
>> +        reg =   <0 0xae90000 0 0x200>,
>> +                <0 0xae90200 0 0x200>,
>> +                <0 0xae90400 0 0xc00>,
>> +                <0 0xae91000 0 0x400>,
>> +                <0 0x88eaa00 0 0x200>,
>> +                <0 0x88ea200 0 0x200>,
>> +                <0 0x88ea600 0 0x200>,
>> +                <0 0x780000 0 0x6228>,
>> +                <0 0x088ea000 0 0x40>,
>> +                <0 0x88e8000 0 0x20>,
>> +                <0 0x0aee1000 0 0x034>;
> 
> This needs to be split up into at least two nodes. Any address above
> that starts in 88e needs to be put into a new node underneath the qmp
> phy. That is the "DP PHY" that lives in the power domain of the USB+DP
> combo phy. The qfprom_physical reg property should be removed from here
> and this binding should use the nvmem binding to reach into the qfprom
> to read out things (I guess there's some sort of HDCP key in the
> qfprom?).
> 
> After that I don't know why there are so many different reg properties
> for the DP controller here and why it needs to be split up.  It looks
> like we should just map the register space from 0xae90000 up to
> 0xae91400 as one big register region and have the driver figure out how
> to operate on top of that. If it changes between SoC versions then we
> should have a more specific compatible that tells us what registers are
> in what place.
> 

Done. Only one register region is specified here now in new bindings 
i.e. dp_controller
starting from 0xae90000 upto 0xae91400. Removed rest of the module 
offsets.
Driver will access each module using offset as required. Also PHY and 
USB3 DPCOM
register bases are hard-coded in driver. Removed redundant qfprom and 
hdcp registers from bindings.

>> +        reg-names = "dp_ahb", "dp_aux", "dp_link",
>> +            "dp_p0", "dp_phy", "dp_ln_tx0", "dp_ln_tx1",
>> +            "qfprom_physical", "dp_pll",
>> +            "usb3_dp_com", "hdcp_physical";
>> +
>> +        interrupt-parent = <&display_subsystem>;
>> +        interrupts = <12 0>;
>> +
>> +        clocks = <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>> +            <&rpmhcc RPMH_CXO_CLK>,
>> +            <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
>> +            <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
>> +            <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
>> +            <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>> +            <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> +            <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>> +            <&dispcc DISP_CC_MDSS_DP_CRYPTO_CLK>,
>> +            <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +        clock-names = "core_aux_clk", "core_ref_clk_src",
>> +            "core_usb_ref_clk", "core_usb_cfg_ahb_clk",
>> +            "core_usb_pipe_clk", "ctrl_link_clk",
>> +            "ctrl_link_iface_clk", "ctrl_pixel_clk",
>> +            "crypto_clk", "pixel_clk_rcg";
>> +
>> +        pll-node = <&dp_pll>;
> 
> If the DP PLL and DP controller need to be controlled from two software
> entities, it may make sense to just combine that DP PLL into the
> controller node and have this node be a clk provider. The pll-node
> property is pretty ugly and should be removed.
> 

Done. Removed PLL as separate node and combined PLL as module of DP 
driver.
Removed pll-node property as well.

>> +        vdda-1p2-supply = <&vreg_l3c_1p2>;
>> +        vdda-0p9-supply = <&vreg_l4a_0p8>;
>> +
>> +        aux-cfg0-settings = [20 00];
>> +        aux-cfg1-settings = [24 13 23 1d];
>> +        aux-cfg2-settings = [28 24];
>> +        aux-cfg3-settings = [2c 00];
>> +        aux-cfg4-settings = [30 0a];
>> +        aux-cfg5-settings = [34 26];
>> +        aux-cfg6-settings = [38 0a];
>> +        aux-cfg7-settings = [3c 03];
>> +        aux-cfg8-settings = [40 bb];
>> +        aux-cfg9-settings = [44 03];
> 
> This pile of properties is board specific configuration tuning or
> something? Can this go into the driver? Or can it be made more human
> readable? I seem to recall that the USB phy had similar properties and
> we made them into human readable properties when board integrators
> needed to change them. The easiest approach there is to put everything
> in the driver for now and then when something has to change for a board
> it gets punted out to the DT and that overrides the "default" settings
> that are used in the driver.
> 
Made aux-cfg[0-9]-settingsproperties optional in bindings.
Added default configurations in driver and using them if these 
properties
are not mentioned in dts.
>> +
>> +        max-pclk-frequency-khz = <67500>;
> 
> What is this? Why isn't this in the driver?
> 

Done. Removed this property from bindings and setting default value in 
driver.

>> +        data-lanes = <2>;
>> +
>> +        aux-en-gpio = <&msmgpio 55 1>;
>> +        aux-sel-gpio = <&msmgpio 110 1>;
>> +        usbplug-cc-gpio = <&msmgpio 90 1>;
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                dp_in: endpoint {
>> +                    remote-endpoint = <&dpu_intf0_out>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +                dp_out: endpoint {
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +    dp_pll: dp-pll@088ea000 {
>> +        compatible = "qcom,dp-pll-10nm";
>> +        label = "DP PLL";
>> +        cell-index = <0>;
>> +        #clock-cells = <1>;
>> +
>> +        reg = <0 0x088ea000 0 0x200>,
>> +              <0 0x088eaa00 0 0x200>,
>> +              <0 0x088ea200 0 0x200>,
>> +              <0 0x088ea600 0 0x200>,
>> +              <0 0x08803000 0 0x8>;
>> +        reg-names = "pll_base", "phy_base", "ln_tx0_base",
>> +            "ln_tx1_base", "gdsc_base";
> 
> I guess the DP_PLL lives inside the qmp combo phy? That would match how
> the USB phy binding has been done there. This whole node should be
> combined with the DP phy node that will be placed as a child of the qmp
> phy wrapper (i.e. qcom,sc7180-qmp-usb3-phy compatible node). Might as
> well change that compatible from qcom,sc7180-qmp-usb3-phy to be
> qcom,sc7180-qmp-usb3-dp-phy too so that it can create the DP phy bits
> too.
> 

Done. Removed whole dp_pll node from here and added PLL as module of DP 
driver.
This required hard coding of few register bases in driver for now.

>> +
>> +        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +             <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
>> +             <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
>> +             <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>> +        clock-names = "iface_clk", "ref_clk",
>> +            "cfg_ahb_clk", "pipe_clk";
>> +    };
>> +
>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt
>> b/Documentation/devicetree/bindings/display/msm/dpu.txt
>> index 551ae26..7e99e45 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
>> @@ -63,8 +63,9 @@ Required properties:
>>         Documentation/devicetree/bindings/graph.txt
>>         Documentation/devicetree/bindings/media/video-interfaces.txt
>> 
>> -       Port 0 -> DPU_INTF1 (DSI1)
>> -       Port 1 -> DPU_INTF2 (DSI2)
>> +       Port 0 -> DPU_INTF0 (DP)
>> +       Port 1 -> DPU_INTF1 (DSI1)
>> +       Port 2 -> DPU_INTF2 (DSI2)
> 
> DP should come last so that the port mapping doesn't have to change.
> 

Done. Reverted Port mapping to old one i.e. Port0->DSI1, Port1->DSI2 and
Added Port2->DP mapping.

>> 
>>  Optional properties:
>>  - assigned-clocks: list of clock specifiers for clocks needing rate
>> assignment
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
