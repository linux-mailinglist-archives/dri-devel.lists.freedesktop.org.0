Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C0119751E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8606E065;
	Mon, 30 Mar 2020 07:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8B06EA74
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 20:18:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585340312; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uAOgskxYnwiD6TaplG8K0yCf9Xpdo+8+3cZf8varXRY=;
 b=GyhsfL5/CSp3lixrP7Zpia0jC+cOAY6mmZ6UMAGqLiiUJbR2xHnzH0zMv/I/i8y/ig/KeMsu
 Ni5LGw2I1lpKD1SHnUXuYRjJcdq6cRzG/orwjDsgV8k3xDT9bmvTMNVUz4XUsJDCQbx5gval
 dq91BT3eykl3rleCxabRuqD1IaY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7e5f88.7fa6fe716998-smtp-out-n04;
 Fri, 27 Mar 2020 20:18:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 68FA4C44788; Fri, 27 Mar 2020 20:18:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: varar)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 43C23C433D2;
 Fri, 27 Mar 2020 20:18:13 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 27 Mar 2020 13:18:13 -0700
From: varar@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [DPU PATCH v4 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL
 driver for Snapdragon
In-Reply-To: <158457890765.152100.17742965907717707149@swboyd.mtv.corp.google.com>
References: <1583367028-19979-1-git-send-email-varar@codeaurora.org>
 <1583367028-19979-2-git-send-email-varar@codeaurora.org>
 <158457890765.152100.17742965907717707149@swboyd.mtv.corp.google.com>
Message-ID: <4e2674445955bf49f552a680d8e01e46@codeaurora.org>
X-Sender: varar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
 dri-devel@lists.freedesktop.org, hoegsberg@google.com, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen Boyd,

Thanks for reviewing the change.
I have updated my comments inline for some comments, please check and 
let us know your views.
Rest of the comments are addressed, will try to post a new patchset in 
couple of days.

Thanks,
--Vara

On 2020-03-18 17:48, Stephen Boyd wrote:
> Quoting Vara Reddy (2020-03-04 16:10:24)
>> From: Chandan Uddaraju <chandanu@codeaurora.org>
>> 
>> Add bindings for Snapdragon DisplayPort and
>> display-port PLL driver.
>> 
>> Changes in V2:
>> Provide details about sel-gpio
>> 
>> Changes in V4:
>> Provide details about max dp lanes
>> Change the commit text
>> 
>> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
>> Signed-off-by: Vara Reddy <varar@codeaurora.org>
>> ---
>>  .../devicetree/bindings/display/msm/dp.txt         | 252 
>> +++++++++++++++++++++
>>  .../devicetree/bindings/display/msm/dpu.txt        |  16 +-
>>  2 files changed, 264 insertions(+), 4 deletions(-)
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dp.txt
> 
> Having this in YAML will certainly make it easier to review. Please do
> that as Rob H has asked.
> 
>> 
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp.txt 
>> b/Documentation/devicetree/bindings/display/msm/dp.txt
>> new file mode 100644
>> index 0000000..1a4e17f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dp.txt
>> @@ -0,0 +1,252 @@
>> +Qualcomm Technologies, Inc.
>> +DP is the master Display Port device which supports DP host 
>> controllers that are compatible with VESA Display Port interface 
>> specification.
>> +DP Controller: Required properties:
>> +- compatible:           Should be "qcom,dp-display".
>> +- reg:                  Base address and length of DP hardware's 
>> memory mapped regions.
>> +- cell-index:           Specifies the controller instance.
>> +- reg-names:            A list of strings that name the list of regs.
>> +                       "dp_ahb" - DP controller memory region.
>> +                       "dp_aux" - DP AUX memory region.
>> +                       "dp_link" - DP link layer memory region.
>> +                       "dp_p0" - DP pixel clock domain memory region.
>> +                       "dp_phy" - DP PHY memory region.
>> +                       "dp_ln_tx0" - USB3 DP PHY combo TX-0 lane 
>> memory region.
>> +                       "dp_ln_tx1" - USB3 DP PHY combo TX-1 lane 
>> memory region.
>> +                       "dp_mmss_cc" - Display Clock Control memory 
>> region.
>> +                       "qfprom_physical" - QFPROM Phys memory region.
>> +                       "dp_pll" - USB3 DP combo PLL memory region.
>> +                       "usb3_dp_com" - USB3 DP PHY combo memory 
>> region.
>> +                       "hdcp_physical" - DP HDCP memory region.
> 
> A handful of these register properties overlap with the USB PHY region.
> I suspect the existing qcom,sc7180-qmp-usb3-phy USB PHY binding that we
> have is wrong. It should describe both the USB part and the DP part of
> the combo PHY. Probably the DP part can be a subnode like how the
> superspeed PHY is a child node of the wrapper node. Then we'll have to
> figure out how to coordinate the access to usb3_dp_com (which I presume
> corresponds to the dp_com region in the usb3-phy binding) so that the
> USB and DP PHY drivers can figure out how to configure the "type-c" 
> pins
> on the SoC to be 2 lanes DP and 2 lanes USB or 4 lanes USB or 4 lanes 
> DP.

msm usb3_dp_com region has two separate software interface to combo phy 
used by DP and USB.
We are trying to map DP specific address space for configuration.
I am not sure if USB can figure out dynamically a 2 lane DP and 2 lane 
USB case
as i think we need to feed this information based on our hardware design 
through dtsi.

> 
>> +- interrupt-parent     phandle to the interrupt parent device node.
>> +- interrupts:          The interrupt signal from the DP block.
>> +- clocks:               Clocks required for Display Port operation. 
>> See [1] for details on clock bindings.
>> +- clock-names:          Names of the clocks corresponding to handles. 
>> Following clocks are required:
>> +                       "core_aux_clk", 
>> "core_usb_ref_clk_src","core_usb_ref_clk", "core_usb_cfg_ahb_clk",
>> +                       "core_usb_pipe_clk", "ctrl_link_clk", 
>> "ctrl_link_iface_clk", "ctrl_crypto_clk",
>> +                       "ctrl_pixel_clk", "pixel_clk_rcg", 
>> "pixel_parent".
> 
> Please remove _clk suffix on all clock names. It's redundant.
> 
>> +- pll-node:            phandle to DP PLL node.
>> +- vdda-1p2-supply:             phandle to vdda 1.2V regulator node.
>> +- vdda-0p9-supply:             phandle to vdda 0.9V regulator node.
>> +- qcom,aux-cfg0-settings:              Specifies the DP AUX 
>> configuration 0 settings. The first
>> +                                       entry in this array 
>> corresponds to the register offset
>> +                                       within DP AUX, while the 
>> remaining entries indicate the
>> +                                       programmable values.
>> +- qcom,aux-cfg1-settings:              Specifies the DP AUX 
>> configuration 1 settings. The first
>> +                                       entry in this array 
>> corresponds to the register offset
>> +                                       within DP AUX, while the 
>> remaining entries indicate the
>> +                                       programmable values.
>> +- qcom,aux-cfg2-settings:              Specifies the DP AUX 
>> configuration 2 settings. The first
>> +                                       entry in this array 
>> corresponds to the register offset
>> +                                       within DP AUX, while the 
>> remaining entries indicate the
>> +                                       programmable values.
>> +- qcom,aux-cfg3-settings:              Specifies the DP AUX 
>> configuration 3 settings. The first
>> +                                       entry in this array 
>> corresponds to the register offset
>> +                                       within DP AUX, while the 
>> remaining entries indicate the
>> +                                       programmable values.
>> +- qcom,aux-cfg4-settings:              Specifies the DP AUX 
>> configuration 4 settings. The first
>> +                                       entry in this array 
>> corresponds to the register offset
>> +                                       within DP AUX, while the 
>> remaining entries indicate the
>> +                                       programmable values.
>> +- qcom,aux-cfg5-settings:              Specifies the DP AUX 
>> configuration 5 settings. The first
>> +                                       entry in this array 
>> corresponds to the register offset
>> +                                       within DP AUX, while the 
>> remaining entries indicate the
>> +                                       programmable values.
>> +- qcom,aux-cfg6-settings:              Specifies the DP AUX 
>> configuration 6 settings. The first
>> +                                       entry in this array 
>> corresponds to the register offset
>> +                                       within DP AUX, while the 
>> remaining entries indicate the
>> +                                       programmable values.
>> +- qcom,aux-cfg7-settings:              Specifies the DP AUX 
>> configuration 7 settings. The first
>> +                                       entry in this array 
>> corresponds to the register offset
>> +                                       within DP AUX, while the 
>> remaining entries indicate the
>> +                                       programmable values.
>> +- qcom,aux-cfg8-settings:              Specifies the DP AUX 
>> configuration 8 settings. The first
>> +                                       entry in this array 
>> corresponds to the register offset
>> +                                       within DP AUX, while the 
>> remaining entries indicate the
>> +                                       programmable values.
>> +- qcom,aux-cfg9-settings:              Specifies the DP AUX 
>> configuration 9 settings. The first
>> +                                       entry in this array 
>> corresponds to the register offset
>> +                                       within DP AUX, while the 
>> remaining entries indicate the
>> +                                       programmable values.
> 
> It would be better if these properties were understandable by us mere
> kernel developers out there. Is it possible to make them into 
> standalone
> properties that control certain configuration tunings? Are any of these
> not variable per-board and can be hardcoded based on the SoC into the
> driver?
> 

These properties are used to tune the aux configurations and these vary 
per board and
some customers need to tune these settings to get through dp phy 
compliance.
I will move these settings to the driver code, if it is preferred.

>> +- qcom,max-pclk-frequency-khz:         An integer specifying the 
>> maximum. pixel clock in KHz supported by Display Port.
> 
> This can't be detected at runtime?

Some variants of DP controllers has a cap on the max-pclk frequency from 
DP controller side or from whole system bandwidth.
To maintain same driver code across chipsets, we are trying to use this 
to cap the max frequency through dtsi.

> 
>> +- qcom,max-lanes-for-dp:               Maximum number of lanes that 
>> can be used for Display port.
> 
> This can come from an of graph walk to figure out how many possible
> lanes are connected? Or some more standard property that describes
> logical to physical lane mapping, like data-lanes?
> 
>> +- qcom,<type>-supply-entries:          A node that lists the elements 
>> of the supply used by the a particular "type" of DP module. The module 
>> "types"
>> +                                       can be "core", "ctrl", and 
>> "phy". Within the same type,
>> +                                       there can be more than one 
>> instance of this binding,
>> +                                       in which case the entry would 
>> be appended with the
>> +                                       supply entry index.
>> +                                       e.g. qcom,ctrl-supply-entry@0
>> +                                       -- qcom,supply-name: name of 
>> the supply (vdd/vdda/vddio)
>> +                                       -- qcom,supply-min-voltage: 
>> minimum voltage level (uV)
>> +                                       -- qcom,supply-max-voltage: 
>> maximum voltage level (uV)
>> +                                       -- qcom,supply-enable-load: 
>> load drawn (uA) from enabled supply
>> +                                       -- qcom,supply-disable-load: 
>> load drawn (uA) from disabled supply
>> +                                       -- qcom,supply-pre-on-sleep: 
>> time to sleep (ms) before turning on
>> +                                       -- qcom,supply-post-on-sleep: 
>> time to sleep (ms) after turning on
>> +                                       -- qcom,supply-pre-off-sleep: 
>> time to sleep (ms) before turning off
>> +                                       -- qcom,supply-post-off-sleep: 
>> time to sleep (ms) after turning off
> 
> All these regulator properties look like things that should be handled
> by board constraints on certain supplies, not by this binding or the
> driver that matches this binding.
> 
>> +- pinctrl-names:       List of names to assign mdss pin states 
>> defined in pinctrl device node
>> +                                       Refer to pinctrl-bindings.txt
>> +- pinctrl-<0..n>:      Lists phandles each pointing to the pin 
>> configuration node within a pin
>> +                                       controller. These pin 
>> configurations are installed in the pinctrl
>> +                                       device node. Refer to 
>> pinctrl-bindings.txt
> 
> These two properties aren't needed.
> 
>> +DP Endpoint properties:
>> +  - remote-endpoint: For port@0, set to phandle of the connected 
>> panel/bridge's
>> +    input endpoint. For port@1, set to the DPU interface output. See 
>> [2] for
>> +    device graph info.
>> +
>> +Optional properties:
>> +- qcom,aux-en-gpio:            Specifies the aux-channel enable gpio.
>> +- qcom,aux-sel-gpio:           Specifies the mux-selection that might 
>> be needed for aux interface.
> 
> Please use the normal '<your name here>-gpios' property for gpios.
>> +
>> +
>> +DP PLL: Required properties:
>> +- compatible:           Should be "qcom,dp-pll-10nm".
>> +- reg:                  Base address and length of DP hardware's 
>> memory mapped regions.
>> +- cell-index:           Specifies the PLL instance.
>> +- reg-names:            A list of strings that name the list of regs.
>> +                       "pll_base" - DP PLL memory region.
>> +                       "phy_base" - DP PHY memory region.
>> +                       "ln_tx0_base" - USB3 DP PHY combo TX-0 lane 
>> memory region.
>> +                       "ln_tx1_base" - USB3 DP PHY combo TX-1 lane 
>> memory region.
> 
> This was in the other node binding. Probably the only reg property
> required here is pll_base?

Unfortunately msm DP controller PHY and PLL modules are tightly coupled 
in hardware.
DP phy hardware programming sequence has lot of register programming 
sequence interleaved
between PLL and PHY address space.
Our design has different DP PLL and DP PHY drivers, we need to map the 
needed address space.

> 
>> +                       "gdsc_base" - gdsc memory region.
>> +- interrupt-parent     phandle to the interrupt parent device node.
>> +- interrupts:          The interrupt signal from the DP block.
>> +- clocks:               Clocks required for Display Port operation. 
>> See [1] for details on clock bindings.
>> +- clock-names:          Names of the clocks corresponding to handles. 
>> Following clocks are required:
>> +                       "iface_clk", "ref_clk", cfg_ahb_clk", 
>> "pipe_clk".
>> +- clock-rate:           Initial clock rate to be configured. For the 
>> shared clocks, the default value                       is set to zero 
>> so that minimum clock value is configured. Non-zero clock
> 
> We have assigned-clock-rates for this.
> 
>> +                       value can be used to configure DP pixel clock.
>> +
>> +
>> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +[2] Documentation/devicetree/bindings/graph.txt
>> +
>> +Example:
>> +       msm_dp: dp_display@ae90000{
> 
> No underscores in node names. It should also be somewhat generic like
> 'display-controller' or 'displayport-controller' and the first reg
> property should match the unit address after the at sign (@).
> 
>> +               cell-index = <0>;
>> +               compatible = "qcom,dp-display";
>> +
>> +               reg =   <0 0x90000 0x0dc>,
>> +                       <0 0x90200 0x0c0>,
>> +                       <0 0x90400 0x508>,
>> +                       <0 0x90a00 0x094>,
>> +                       <1 0xeaa00 0x200>,
>> +                       <1 0xea200 0x200>,
>> +                       <1 0xea600 0x200>,
>> +                       <2 0x02000 0x1a0>,
>> +                       <3 0x00000 0x621c>,
>> +                       <1 0xea000 0x180>,
>> +                       <1 0xe8000 0x20>,
>> +                       <4 0xe1000 0x034>;
>> +               reg-names = "dp_ahb", "dp_aux", "dp_link",
>> +                       "dp_p0", "dp_phy", "dp_ln_tx0", "dp_ln_tx1",
>> +                       "dp_mmss_cc", "qfprom_physical", "dp_pll",
>> +                       "usb3_dp_com", "hdcp_physical";
>> +
>> +               interrupt-parent = <&display_subsystem>;
>> +               interrupts = <12 0>;
>> +
>> +               extcon = <&usb_1_ssphy>;
> 
> Please no extcon
> 
>> +               clocks =  <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>> +                       <&rpmhcc RPMH_CXO_CLK>,
>> +                       <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
>> +                       <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
>> +                       <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
>> +                       <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>> +                       <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> +                       <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>> +                       <&dispcc DISP_CC_MDSS_DP_CRYPTO_CLK>,
>> +                       <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +               clock-names = "core_aux_clk", "core_ref_clk_src",
>> +                       "core_usb_ref_clk", "core_usb_cfg_ahb_clk",
>> +                       "core_usb_pipe_clk", "ctrl_link_clk",
>> +                       "ctrl_link_iface_clk", "ctrl_pixel_clk",
>> +                       "crypto_clk", "pixel_clk_rcg";
>> +
>> +               pll-node = <&dp_pll>;
>> +               vdda-1p2-supply = <&vreg_l3c_1p2>;
>> +               vdda-0p9-supply = <&vreg_l4a_0p8>;
>> +               qcom,aux-cfg0-settings = [20 00];
>> +               qcom,aux-cfg1-settings = [24 13 23 1d];
>> +               qcom,aux-cfg2-settings = [28 24];
>> +               qcom,aux-cfg3-settings = [2c 00];
>> +               qcom,aux-cfg4-settings = [30 0a];
>> +               qcom,aux-cfg5-settings = [34 26];
>> +               qcom,aux-cfg6-settings = [38 0a];
>> +               qcom,aux-cfg7-settings = [3c 03];
>> +               qcom,aux-cfg8-settings = [40 bb];
>> +               qcom,aux-cfg9-settings = [44 03];
>> +
>> +               qcom,max-pclk-frequency-khz = <675000>;
>> +               qcom,max-lanes-for-dp = <2>;
>> +
>> +               qcom,ctrl-supply-entries {
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       qcom,ctrl-supply-entry@0 {
>> +                               reg = <0>;
>> +                               qcom,supply-name = "vdda-1p2";
>> +                               qcom,supply-min-voltage = <1200000>;
>> +                               qcom,supply-max-voltage = <1200000>;
>> +                               qcom,supply-enable-load = <21800>;
>> +                               qcom,supply-disable-load = <4>;
>> +                       };
>> +               };
>> +
>> +               qcom,phy-supply-entries {
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       qcom,phy-supply-entry@0 {
>> +                               reg = <0>;
>> +                               qcom,supply-name = "vdda-0p9";
>> +                               qcom,supply-min-voltage = <880000>;
>> +                               qcom,supply-max-voltage = <880000>;
>> +                               qcom,supply-enable-load = <36000>;
>> +                               qcom,supply-disable-load = <32>;
>> +                       };
>> +               };
>> +
>> +               ports {
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       port@0 {
>> +                               reg = <0>;
>> +                               dp_in: endpoint {
>> +                                       remote-endpoint = 
>> <&dpu_intf0_out>;
>> +                               };
>> +                       };
>> +
>> +                       port@1 {
>> +                               reg = <1>;
>> +                               dp_out: endpoint {
>> +                               };
>> +                       };
>> +               };
>> +       };
>> +
>> +       dp_pll: dp-pll@c011000 {
>> +               compatible = "qcom,dp-pll-10nm";
>> +               label = "DP PLL";
>> +               cell-index = <0>;
>> +               #clock-cells = <1>;
>> +
>> +               reg = <1 0xea000 0x200>,
>> +                     <1 0xeaa00 0x200>,
>> +                     <1 0xea200 0x200>,
>> +                     <1 0xea600 0x200>,
>> +                     <2 0x03000 0x8>;
>> +               reg-names = "pll_base", "phy_base", "ln_tx0_base",
>> +                       "ln_tx1_base", "gdsc_base";
>> +
>> +               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                        <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
>> +                        <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
>> +                        <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>> +               clock-names = "iface_clk", "ref_clk",
>> +                       "cfg_ahb_clk", "pipe_clk";
>> +               clock-rate = <0>;
>> +
> 
> Remove this extra newline.
> 
>> +       };
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
> 
> Why is port 0 changed to be DP? Can't we add DP to the end so that 
> older
> DTs remain compatible?

Interface 0 block of msm hardware is always connected to Displayport.
We are trying to retain the ports as per the hardware layed-out.

> 
>> +       Port 1 -> DPU_INTF1 (DSI1)
>> +       Port 2 -> DPU_INTF2 (DSI2)
>> 
>>  Optional properties:
>>  - assigned-clocks: list of clock specifiers for clocks needing rate 
>> assignment
>> @@ -125,13 +126,20 @@ Example:
>> 
>>                                 port@0 {
>>                                         reg = <0>;
>> -                                       dpu_intf1_out: endpoint {
>> -                                               remote-endpoint = 
>> <&dsi0_in>;
>> +                                       dpu_intf0_out: endpoint {
>> +                                               remote-endpoint = 
>> <&dp_in>;
>>                                         };
>>                                 };
>> 
>>                                 port@1 {
>>                                         reg = <1>;
>> +                                       dpu_intf1_out: endpoint {
>> +                                               remote-endpoint = 
>> <&dsi0_in>;
>> +                                       };
>> +                               };
>> +
>> +                               port@2 {
>> +                                       reg = <2>;
>>                                         dpu_intf2_out: endpoint {
>>                                                 remote-endpoint = 
>> <&dsi1_in>;
>>                                         };
>> --
>> $(echo -e 'The Qualcomm Innovation Center, Inc. is a member of the 
>> Code Aurora Forum,
> 
> You should fix your signature :)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
