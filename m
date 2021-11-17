Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3314549A5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 16:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33206E5CD;
	Wed, 17 Nov 2021 15:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29176E5BF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 15:13:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9743F613A2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 15:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637162027;
 bh=tZcW3zqZ2p/birQX+yJqTxjMCnP2s9t1QtRYxsWFEvg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oIOu6k7U8x9r4zq5aO5Af2XLg9EDYk/zb+z2ROUdG1bD9jpEslt+h6NtPF6+RhN+P
 Jq2PuElAE7Dbjw2ifM1uH+waLOktg3qXhuq499SSCevqiBErqmCUOYxkZOFpklLmeW
 6J01yU8SK7SmRVRhkxlzFpJCZcZ8Veq+UMOt/zP7FrEt54R0Wzf/M2CFbs2PAXa5kA
 3Ls0bA13u5oKnMOuy+20Ys7uvWekxEBxXKD5z4YpSzRLp+/tnY13486JwjKfWQ6Z9S
 2yckAJX0jtioZahzfU6A8E2jHcb9WgKxHY7LAP//J66xlIGfQcwmmWxDOa+NnqGeI5
 gc3LetSR2xpFQ==
Received: by mail-ed1-f44.google.com with SMTP id w1so12688778edc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 07:13:47 -0800 (PST)
X-Gm-Message-State: AOAM533nKhLOdeQ0F2fS0vV8049GeZXCCIg5nGBC7YHQIyw5q8b79t/p
 3MbEi+mlVhBLaj5RytpNaFTur+lXg7s1nHnM7Q==
X-Google-Smtp-Source: ABdhPJxbUqiZ3x7XGc+stsRtoSA5zmeY1KdzaMhPnAoOA8KUFon4ufB68HU/KiMA99G4V5+M/1oDu9//tiRxhtlVKTA=
X-Received: by 2002:a17:907:a411:: with SMTP id
 sg17mr22354933ejc.84.1637162025900; 
 Wed, 17 Nov 2021 07:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <20211117143347.314294-10-s.hauer@pengutronix.de>
In-Reply-To: <20211117143347.314294-10-s.hauer@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 17 Nov 2021 09:13:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJH4NZkte_2w9i1zf9UrkYZx3du4ja5i__Vzki5p13zBQ@mail.gmail.com>
Message-ID: <CAL_JsqJH4NZkte_2w9i1zf9UrkYZx3du4ja5i__Vzki5p13zBQ@mail.gmail.com>
Subject: Re: [PATCH 09/12] arm64: dts: rockchip: rk356x: Add HDMI nodes
To: Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <kernel@pengutronix.de>, Peter Geis <pgwipeout@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 8:34 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> Add support for the HDMI port found on RK3568.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 65 ++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> index 6ebf7c14e096a..53be61a7ce595 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> @@ -472,18 +472,36 @@ vp0: port@0 {
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
>                                 reg = <0>;
> +
> +                               vp0_out_hdmi: endpoint@0 {
> +                                       reg = <0>;
> +                                       remote-endpoint = <&hdmi_in_vp0>;
> +                                       status = "disabled";
> +                               };
>                         };
>
>                         vp1: port@1 {
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
>                                 reg = <1>;
> +
> +                               vp1_out_hdmi: endpoint@0 {
> +                                       reg = <0>;
> +                                       remote-endpoint = <&hdmi_in_vp1>;
> +                                       status = "disabled";
> +                               };
>                         };
>
>                         vp2: port@2 {
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
>                                 reg = <2>;
> +
> +                               vp2_out_hdmi: endpoint@0 {
> +                                       reg = <0>;
> +                                       remote-endpoint = <&hdmi_in_vp2>;
> +                                       status = "disabled";
> +                               };
>                         };
>                 };
>         };
> @@ -499,6 +517,53 @@ vop_mmu: iommu@fe043e00 {
>                 status = "disabled";
>         };
>
> +       hdmi: hdmi@fe0a0000 {
> +               compatible = "rockchip,rk3568-dw-hdmi";
> +               reg = <0x0 0xfe0a0000 0x0 0x20000>;
> +               interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&cru PCLK_HDMI_HOST>,
> +                        <&cru CLK_HDMI_SFR>,
> +                        <&cru CLK_HDMI_CEC>,
> +                        <&cru HCLK_VOP>;
> +               clock-names = "iahb", "isfr", "cec", "hclk";
> +               power-domains = <&power RK3568_PD_VO>;
> +               reg-io-width = <4>;
> +               rockchip,grf = <&grf>;
> +               #sound-dai-cells = <0>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&hdmitx_scl &hdmitx_sda &hdmitxm0_cec>;
> +               status = "disabled";
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       hdmi_in: port@0 {


The schema says there is only 1 'port' node. Please run schema
validation when making DT changes.

However, an HDMI bridge should also define an output port to a
connector node (or another bridge). So the fix is to allow 'port@0'
and add an output port.

> +                               reg = <0>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               hdmi_in_vp0: endpoint@0 {
> +                                       reg = <0>;
> +                                       remote-endpoint = <&vp0_out_hdmi>;
> +                                       status = "disabled";
> +                               };
> +
> +                               hdmi_in_vp1: endpoint@1 {
> +                                       reg = <1>;
> +                                       remote-endpoint = <&vp1_out_hdmi>;
> +                                       status = "disabled";
> +                               };
> +
> +                               hdmi_in_vp2: endpoint@2 {
> +                                       reg = <2>;
> +                                       remote-endpoint = <&vp2_out_hdmi>;
> +                                       status = "disabled";
> +                               };
> +                       };
> +               };
> +       };
> +
>         qos_gpu: qos@fe128000 {
>                 compatible = "rockchip,rk3568-qos", "syscon";
>                 reg = <0x0 0xfe128000 0x0 0x20>;
> --
> 2.30.2
>
