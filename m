Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F8B14F2C3
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 20:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F019A6FBDE;
	Fri, 31 Jan 2020 19:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526DC6FBDE
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 19:32:29 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id t12so5064673vso.13
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 11:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0AtmJu7hXFUNe9U3goH8OgcFhymU6r5KbMZh3chCyp8=;
 b=Y42wNtuXU4P+de/Vgcp5OnUMD4nNFqiqVgdYLDKU/FTQidGg4kPiTTzI8D6unCgDlW
 cRSrOjeeXtsMZH6UH3U+QQTa6XgYTE6sgdc4JM6qyisI4VC+P2DdvkbY/pqjavthdmkC
 SW/yx5sMjogM1mA2XWGieJw1nmxFxRYeTplAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0AtmJu7hXFUNe9U3goH8OgcFhymU6r5KbMZh3chCyp8=;
 b=Rx7dVbcVERMHyvgxruG3ev4gm0I/HZV33vthGwTdOYRSvTLLZ+uNlgGrNkvr8CsBZz
 6MSWDHJm32/mDEMVJpfEyb7T9HLU2nXS20c/WG8TSywRACpddIHAJUILkaWvZoBtvBVT
 mx4N3GLGB6q5rtx2Z1buGoyzVBhGRvo/8ANLL8ENEVsaq4cWzCnmNVkWkEg4zVGpRSgH
 mbat1PT5tAzpjL72hxKTKWD0LXwvjTKiesun99dEKvsCeCvoWhKy8BFEQ+VtLkDRPTzg
 JJ9ULzghOzlMyqnDpzmbZqfg/U8UC6X+i5fp3K4nDeoGkw7RhGqQnH8Cr39ID46V1BqW
 L/5g==
X-Gm-Message-State: APjAAAVFippBbO2iBPkGx29JsuyyqWMAIGikCtxcxSiLRjDSzrqzZsIe
 scI8G/yUD80MY8P9BnMui1vagm9ivTw=
X-Google-Smtp-Source: APXvYqws8wpdNwHNdIRuJe9UkVRDSansGXQH3/4/mtAiTs/iO7lUZcZKkC/vjAFpniawnL36IcM2xQ==
X-Received: by 2002:a67:f60e:: with SMTP id k14mr7261511vso.14.1580499147878; 
 Fri, 31 Jan 2020 11:32:27 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id n25sm2893381vkk.56.2020.01.31.11.32.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2020 11:32:27 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id 1so3010575uao.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 11:32:26 -0800 (PST)
X-Received: by 2002:ab0:724c:: with SMTP id d12mr7404736uap.0.1580499146366;
 Fri, 31 Jan 2020 11:32:26 -0800 (PST)
MIME-Version: 1.0
References: <1580217884-21932-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1580217884-21932-1-git-send-email-harigovi@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 Jan 2020 11:32:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XwbHyYSCCqjgHoqQcRAwwekFYZbM-Mh1o=f0z+_W8ukw@mail.gmail.com>
Message-ID: <CAD=FV=XwbHyYSCCqjgHoqQcRAwwekFYZbM-Mh1o=f0z+_W8ukw@mail.gmail.com>
Subject: Re: [v4] arm64: dts: sc7180: add display dt nodes
To: Harigovindan P <harigovi@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jan 28, 2020 at 5:25 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> Add display, DSI hardware DT nodes for sc7180.
>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>
> Changes in v1:
>         -Added display DT nodes for sc7180
> Changes in v2:
>         -Renamed node names
>         -Corrected code alignments
>         -Removed extra new line
>         -Added DISP AHB clock for register access
>         under display_subsystem node for global settings
> Changes in v3:
>         -Modified node names
>         -Modified hard coded values
>         -Removed mdss reg entry
> Changes in v4:
>         -Reverting mdp node name
>         -Setting status to disabled in main SOC dtsi file
>         -Replacing _ to - for node names
>         -Adding clock dependency patch link
>         -Splitting idp dt file to a separate patch
>
> This patch has dependency on the below series
> https://lkml.org/lkml/2019/12/27/73
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 128 +++++++++++++++++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3bc3f64..c3883af 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1184,6 +1184,134 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               mdss: mdss@ae00000 {
> +                       compatible = "qcom,sc7180-mdss";
> +                       reg = <0 0x0ae00000 0 0x1000>;
> +                       reg-names = "mdss";
> +
> +                       power-domains = <&dispcc MDSS_GDSC>;
> +
> +                       clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                                <&gcc GCC_DISP_HF_AXI_CLK>,
> +                                <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +                       clock-names = "iface", "gcc_bus", "ahb", "core";

The clock "ahb" is not in your bindings.  If it is truly needed,
please update your bindings.

The clock "gcc_bus" is just called "bus" in the bindings.  Assuming
this is the same clock, please use the name from the bindings.


> +                       assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +                       assigned-clock-rates = <300000000>;
> +
> +                       interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +
> +                       iommus = <&apps_smmu 0x800 0x2>;
> +
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;

Do we need a:
  status = "disabled";

I noticed that in sdm845 the top-level mdss node _does_ have that.  If
someone was building a board with your chip and they had no display at
all, would they want this node disabled?  If so then it should be
disabled by default and boards should opt-in.


> +                       mdss_mdp: mdp@ae01000 {
> +                               compatible = "qcom,sc7180-dpu";
> +                               reg = <0 0x0ae01000 0 0x8f000>,
> +                                     <0 0x0aeb0000 0 0x2008>,
> +                                     <0 0x0af03000 0 0x16>;
> +                               reg-names = "mdp", "vbif", "disp_cc";

Did I already ask why you need the "disp_cc" register space?  If I
didn't, can I ask now?  This is not in the bindings and I can't think
of why you'd want it.  Does the code use it?  It doesn't seem to...


> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               clock-names = "iface", "rot", "lut", "core",
> +                                             "vsync";

Your bindings doc says that "bus" is required, yet you don't pass it.
Should you?

Your bindings doc says nothing about "rot" and "lut".  Presumably
those should be added if they are actually needed?


> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               assigned-clock-rates = <300000000>,
> +                                                      <19200000>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;

Do we need a:
  status = "disabled";

I noticed that in sdm845 the mdss_mdp node _does_ have that.  NOTE:
you'd only want to add it if it ever made sense to turn on the
top-level mdss node but not this one.  If this should always be
enabled at the exact same time as the top-level mdss node then there's
no need to add the 'status = "disabled";'

If you decide that you don't need to add this, maybe you can submit a
separate patch to remove it from sdm845?


> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               dpu_intf1_out: endpoint {
> +                                                       remote-endpoint = <&dsi0_in>;
> +                                               };
> +                                       };
> +                               };
> +                       };
> +
> +                       dsi_controller: dsi-controller@ae94000 {

nit: Though "dsi-controller" is a sensible name, current binding
examples show "dsi", not "dsi-controller".  The name "dsi" seems
blessed by Rob Herring since it came from commit a3c463e0961c
("dt-bindings: msm/dsi: Some binding doc cleanups") which has his Ack,
so I'd rather go with that.


> +                               compatible = "qcom,mdss-dsi-ctrl";
> +                               reg = <0 0x0ae94000 0 0x400>;
> +                               reg-names = "dsi_ctrl";
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&gcc GCC_DISP_HF_AXI_CLK>;

Comparing with sdm845 I notice that the last clock used to come from
dispcc.  Now you're getting it from gcc.  Did the architecture
actually change or are you working around a clock that should be
exported by the dispcc but hasn't been finished yet?


> +                               clock-names = "byte",
> +                                             "byte_intf",
> +                                             "pixel",
> +                                             "core",
> +                                             "iface",
> +                                             "bus";

Your bindings doc says this about which clocks you need:

- clock-names: the following clocks are required:
  * "mdp_core"
  * "iface"
  * "bus"
  * "core_mmss"
  * "byte"
  * "pixel"
  * "core"
  For DSIv2, we need an additional clock:
   * "src"
  For DSI6G v2.0 onwards, we need also need the clock:
   * "byte_intf"

...seems like either the binding is wrong or you're missing a few
clocks.  Which is it?


> +                               phys = <&dsi_phy>;
> +                               phy-names = "dsi";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               dsi0_in: endpoint {
> +                                                       remote-endpoint = <&dpu_intf1_out>;
> +                                               };
> +                                       };
> +
> +                                       port@1 {
> +                                               reg = <1>;
> +                                               dsi0_out: endpoint {
> +                                               };
> +                                       };
> +                               };
> +                       };
> +
> +                       dsi_phy: dsi-phy@ae94400 {
> +                               compatible = "qcom,dsi-phy-10nm";
> +                               reg = <0 0x0ae94400 0 0x200>,
> +                                     <0 0x0ae94600 0 0x280>,
> +                                     <0 0x0ae94a00 0 0x1e0>;
> +                               reg-names = "dsi_phy",
> +                                           "dsi_phy_lane",
> +                                           "dsi_pll";
> +
> +                               #clock-cells = <1>;
> +                               #phy-cells = <0>;
> +
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>;
> +                               clock-names = "iface";

Your bindings say:

- clock-names: the following clocks are required:
  * "iface"
  * "ref" (only required for new DTS files/entries)

I think you qualify as a "new" DTS file, so you should be providing "ref".


> +                               status = "disabled";

Bindings list "power-domains" as a required property.  Should the
bindings be updated to make this optional, or should you be adding it?


> +                       };
> +               };
> +
>                 pdc: interrupt-controller@b220000 {

nit: your sorting is still slightly off.  I can certainly apply your
patch atop the dispcc device tree patch [1] now, which is good.  But
the context clue in your patch that your stuff comes right before the
'pdc: interrupt-controller@b220000' means that you are being placed
_after_ 'dispcc: clock-controller@af00000'.  You should be before it
since ae00000 < af00000.

...this may sound like making a big deal out of nothing, but keeping
things sorted correctly is the best way to reduce merge conflicts when
landing patches and that's a big deal.

--

Also, in response to your last patch [2] I said:

> ...speaking of which, can you please change your patch to replace the
> bogus <0> in the dispcc for the DSI PHY, providing the clocks for
> "dsi_phy_pll_byte" and "dsi_phy_pll_pixel"?  See
> <https://crrev.com/c/2017974/3>

It doesn't appear that you've done this.  Can you?


NOTE: as you can probably guess, my review was mostly this:
- Compare your nodes with the nodes in a similar SoC (sdm845).
- Compare your nodes with the examples in the bindings.
- Compare your nodes with the text of the bindings.

Those are good things for you to do before you send out future patches
to help make sure you didn't miss anything.


-Doug

[1] https://lore.kernel.org/r/20200130131220.v3.15.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid
[2] https://lore.kernel.org/r/CAD=FV=WKVGq+x1XFvZQvBcKVPdcVxQWJJmsqpAxY3t4dorvMYg@mail.gmail.com/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
