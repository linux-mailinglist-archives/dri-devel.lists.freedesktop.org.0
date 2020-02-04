Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 292E51520E1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 20:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46CE6E8C1;
	Tue,  4 Feb 2020 19:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C487E6E8C1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 19:14:09 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id b79so12100990vsd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2020 11:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c05eGhfP62oyJ4uJzi+JFgkkWqqqI9hWVBoKeCjxm4w=;
 b=AZCPqV89v+hOzNtfW2saXZP0Q0an/t7IFjgge833KWWdrveSw7azdc6LDMxtiZJlJl
 e8z5D6BlfIf8VfNzB2FQSUlkfkMVb6p3A2wpczyjxmVzvbV84dk2tbFhyF/lLh+K21yA
 Uz0UcBE3wLwBuTZqVZiA41SK93XAiADvPM6X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c05eGhfP62oyJ4uJzi+JFgkkWqqqI9hWVBoKeCjxm4w=;
 b=lrUjMi8IVH1O7+24MjTrai5Ph0rJdoki93+RsHQIkB9K2D1xYaH/IfXdx0gt9n/alm
 31n2QbAy+lKEPMLEoHf/3jxQdxrmhMxB/hlHKEFDgHE8uPG8ai3C3hpgswtUk/J0mTW/
 NZ+9qOWhot2LvWPcJTI7K8A8dMh63hWRziL/f492wpPJhRtG01pBvjRlPRm2GI/isnL1
 7wgqni04k8RSCzfOF0JwcdtklxzZUPKQfjLgkyDzMh9gIIhWGEQFFOIz5cZsoY/pskHL
 DJHpHlRKOsYhJE0SkaoXTfeD/taWgxvHoREwROMOxNDB7H6ppSe66L0rtUdphM3qVwSy
 0vEg==
X-Gm-Message-State: APjAAAUqKQJBsjVCNreS7qZCF4JS1+jinfhTw2IL3ZICcJiBu65Ijb0l
 VhqeOYiWyXboaHFt0IJnvmygYHpqZek=
X-Google-Smtp-Source: APXvYqzQdp5yJEj8p510UeGT+ujyBNa28NKK6mraKOwScpC6qpA2FmYp1DnBjfD/os1O7/exJd/DVw==
X-Received: by 2002:a67:f9d2:: with SMTP id c18mr18254227vsq.183.1580843648493; 
 Tue, 04 Feb 2020 11:14:08 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53])
 by smtp.gmail.com with ESMTPSA id l193sm7555245vki.42.2020.02.04.11.14.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2020 11:14:07 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id g15so12157455vsf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2020 11:14:07 -0800 (PST)
X-Received: by 2002:ab0:30c2:: with SMTP id c2mr18396778uam.8.1580843646821;
 Tue, 04 Feb 2020 11:14:06 -0800 (PST)
MIME-Version: 1.0
References: <1580825707-27115-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1580825707-27115-1-git-send-email-harigovi@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 4 Feb 2020 11:13:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U5DPxR54YM38w4_QVp24VorQ2eYDGq2GXScAs9APTygA@mail.gmail.com>
Message-ID: <CAD=FV=U5DPxR54YM38w4_QVp24VorQ2eYDGq2GXScAs9APTygA@mail.gmail.com>
Subject: Re: [v5] arm64: dts: sc7180: add display dt nodes
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
Cc: Taniya Das <tdas@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
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

On Tue, Feb 4, 2020 at 6:15 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> Add display, DSI hardware DT nodes for sc7180.
>
> Co-developed-by: Kalyan Thota <kalyan_t@codeaurora.org>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>
> Changes in v1:
>         - Added display DT nodes for sc7180
> Changes in v2:
>         - Renamed node names
>         - Corrected code alignments
>         - Removed extra new line
>         - Added DISP AHB clock for register access
>           under display_subsystem node for global settings
> Changes in v3:
>         - Modified node names
>         - Modified hard coded values
>         - Removed mdss reg entry
> Changes in v4:
>         - Reverting mdp node name
>         - Setting status to disabled in main SOC dtsi file
>         - Replacing _ to - for node names
>         - Adding clock dependency patch link
>         - Splitting idp dt file to a separate patch
> Changes in v5:
>         - Renaming "gcc_bus" to "bus" as per bindings (Doug Anderson)
>         - Making status as disabled for mdss and mdss_mdp by default (Doug Anderson)
>         - Removing "disp_cc" register space (Doug Anderson)
>         - Renaming "dsi_controller" to "dsi" as per bindings (Doug Anderson)
>         - Providing "ref" clk for dsi_phy (Doug Anderson)
>         - Sorting mdss node before dispcc (Doug Anderson)
>
> This patch has dependency on the below series
> https://lkml.org/lkml/2019/12/27/73

You should have probably pointed to [1] which is a much newer version.


>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 136 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 134 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index bd2584d..3ac1b87 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1173,13 +1173,145 @@
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
> +                       clock-names = "iface", "bus", "ahb", "core";
> +
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
> +
> +                       status = "disabled";
> +
> +                       mdp: mdp@ae01000 {
> +                               compatible = "qcom,sc7180-dpu";
> +                               reg = <0 0x0ae01000 0 0x8f000>,
> +                                     <0 0x0aeb0000 0 0x2008>;
> +                               reg-names = "mdp", "vbif";
> +
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               clock-names = "iface", "rot", "lut", "core",
> +                                             "vsync";
> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               assigned-clock-rates = <300000000>,
> +                                                      <19200000>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               status = "disabled";
> +
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
> +                       dsi0: dsi@ae94000 {
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
> +                               clock-names = "byte",
> +                                             "byte_intf",
> +                                             "pixel",
> +                                             "core",
> +                                             "iface",
> +                                             "bus";
> +
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
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&rpmhcc RPMH_CXO_CLK>;
> +                               clock-names = "iface", "ref";
> +
> +                               status = "disabled";
> +                       };
> +               };
> +
>                 dispcc: clock-controller@af00000 {
>                         compatible = "qcom,sc7180-dispcc";
>                         reg = <0 0x0af00000 0 0x200000>;
>                         clocks = <&rpmhcc RPMH_CXO_CLK>,
>                                  <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> -                                <0>,
> -                                <1>,
> +                                <&dsi_phy 0>,
> +                                <&dsi_phy 1>,
>                                  <0>,
>                                  <0>;
>                         clock-names = "xo", "gpll0",

Thanks for adding this bit in v5.  What you end up with is good, but
I'm slightly confused by your baseline and that makes it hard for git
to automatically apply your patch.  Specifically:

* I don't think I ever sent out a patch where "<1>" was a
bogus/placeholder phandle.  Where did you get that from?
* On the newest version of my patch [1] the clock names were
"bi_tcxo", "gcc_disp_gpll0_clk_src", etc.  Not "xo", "gpll0", ....
Presumably you're applying atop an older version?

NOTE: it's not actually that hard to resolve this manually, so unless
Bjorn / Andy requests it you probably don't need a v6.  How I applied
it if it's helpful [2].


I see that you're working to fix the bindings [3].  Seems like that
still needs to be spun a bit more, but I think in general I'm
convinced that what you're got in the dts is OK for sc7180 while that
spins.  It's not like the bindings were in amazing shape to start
with.  Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/20200203103049.v4.15.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid
[2] https://crrev.com/c/2020394/4
[3] https://lore.kernel.org/r/1580825737-27189-1-git-send-email-harigovi@codeaurora.org



-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
