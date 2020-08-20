Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5451424BE32
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 15:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036C9892BC;
	Thu, 20 Aug 2020 13:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA66892BC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 13:23:52 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35B7222D01
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 13:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597929832;
 bh=S0XMEVf2aAQ3IiYG7eOURhdsLOivgIMyT7tA6HisgHs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jIbFDbvKf1LKfEz1PAe5BHtw0D3gtcKxDyHF6BpQYmu9zRaFWSw6l4DaI8PLfmjC0
 jkHOBxdB0Hql2UpP9CiEAb4a5elCgqB/wu0zt6qUxXJkc0809OUaJSYradCp0i3dl8
 h54YWie3tOWixj6Mav8bOxGGR7n+8HxHWEZ/Blos=
Received: by mail-ot1-f52.google.com with SMTP id x24so1430482otp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 06:23:52 -0700 (PDT)
X-Gm-Message-State: AOAM531e8PtUTH94jnerekvxBX9WnmV5MOHyMg3rKhKI3M45boIEXpht
 nYwdqOuxVWR3NXIhAMfXUvX+5jFYze/o7mNHew==
X-Google-Smtp-Source: ABdhPJy4Fpviz3cjhVdHhhI5/I15s9IDqxEnlJNHzLguk6qFyLHNnIlZuwb5D0ctTnUeBkXCLYg81ebaPBQ23C3ysz8=
X-Received: by 2002:a9d:7f84:: with SMTP id t4mr2189699otp.192.1597929831438; 
 Thu, 20 Aug 2020 06:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
 <1597903458-8055-22-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1597903458-8055-22-git-send-email-yongqiang.niu@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 20 Aug 2020 07:23:39 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKy3kNOVuU3dbGmXBWuggzxx_NQpQL2wEvRQRVrn3pKgA@mail.gmail.com>
Message-ID: <CAL_JsqKy3kNOVuU3dbGmXBWuggzxx_NQpQL2wEvRQRVrn3pKgA@mail.gmail.com>
Subject: Re: [PATCH v1 21/21] arm64: dts: mt8192: add display node
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 20, 2020 at 12:06 AM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> add display node
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 126 +++++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 931e1ca..d2a814d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -17,6 +17,13 @@
>         #address-cells = <2>;
>         #size-cells = <2>;
>
> +        aliases {
> +               ovl0 = &ovl0;
> +               ovl_2l0 = &ovl_2l0;
> +               ovl_2l2 = &ovl_2l2;
> +               rdma0 = &rdma0;
> +               rdma4 = &rdma4;

No, please don't add a bunch of custom aliases that you probably don't need.

> +       };
>         clk26m: oscillator@0 {
>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;
> @@ -449,6 +456,125 @@
>                         #clock-cells = <1>;
>                 };
>
> +                mutex: mutex@14001000 {
> +                       compatible = "mediatek,mt8192-disp-mutex";
> +                       reg = <0 0x14001000 0 0x1000>;
> +                       interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       clocks = <&mmsys CLK_MM_DISP_CONFIG>,
> +                                <&mmsys CLK_MM_26MHZ>,
> +                                <&mmsys CLK_MM_DISP_MUTEX0>;
> +               };
> +               ovl0: ovl@14005000 {
> +                       compatible = "mediatek,mt8192-disp-ovl";
> +                       reg = <0 0x14005000 0 0x1000>;
> +                       interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       clocks = <&mmsys CLK_MM_DISP_OVL0>;
> +                       //iommus = <&iommu0 M4U_PORT_L0_OVL_RDMA0>,
> +                       //       <&iommu0 M4U_PORT_L0_OVL_RDMA0_HDR>;
> +                       power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
> +                       //mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
> +               };
> +
> +               ovl_2l0: ovl@14006000 {
> +                       compatible = "mediatek,mt8192-disp-ovl-2l";
> +                       reg = <0 0x14006000 0 0x1000>;
> +                       interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
> +                       clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> +                       //iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0>,
> +                       //       <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0_HDR>;
> +                       //mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
> +               };
> +
> +               rdma0: rdma@14007000 {
> +                       compatible = "mediatek,mt8192-disp-rdma";
> +                       reg = <0 0x14007000 0 0x1000>;
> +                       interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       clocks = <&mmsys CLK_MM_DISP_RDMA0>;
> +                       //iommus = <&iommu0 M4U_PORT_L0_DISP_RDMA0>;
> +                       mediatek,rdma_fifo_size = <5>;
> +                       power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
> +                       //mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x7000 0x1000>;
> +               };
> +
> +               color0: color@14009000 {
> +                       compatible = "mediatek,mt8192-disp-color",
> +                                    "mediatek,mt8173-disp-color";
> +                       reg = <0 0x14009000 0 0x1000>;
> +                       interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
> +                       clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> +                       //mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
> +               };
> +
> +               ccorr0: ccorr@1400a000 {
> +                       compatible = "mediatek,mt8192-disp-ccorr";
> +                       reg = <0 0x1400a000 0 0x1000>;
> +                       interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
> +                       clocks = <&mmsys CLK_MM_DISP_CCORR0>;
> +                       //mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
> +               };
> +
> +               aal0: aal@1400b000 {
> +                       compatible = "mediatek,mt8192-disp-aal";
> +                       reg = <0 0x1400b000 0 0x1000>;
> +                       interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
> +                       clocks = <&mmsys CLK_MM_DISP_AAL0>;
> +                       //mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
> +               };
> +
> +               gamma0: gamma@1400c000 {
> +                       compatible = "mediatek,mt8192-disp-gamma";
> +                       reg = <0 0x1400c000 0 0x1000>;
> +                       interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
> +                       clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
> +                       //mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
> +               };
> +
> +               postmask0: postmask@1400d000 {
> +                       compatible = "mediatek,mt8192-disp-postmask";
> +                       reg = <0 0x1400d000 0 0x1000>;
> +                       interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
> +                       clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
> +                       //iommus = <&iommu0 M4U_PORT_L0_DISP_POSTMASK0>;
> +                       //mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
> +               };
> +
> +               dither0: dither@1400e000 {
> +                       compatible = "mediatek,mt8192-disp-dither";
> +                       reg = <0 0x1400e000 0 0x1000>;
> +                       interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
> +                       clocks = <&mmsys CLK_MM_DISP_DITHER0>;
> +                       //mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
> +               };
> +
> +               ovl_2l2: ovl@14014000 {
> +                       compatible = "mediatek,mt8192-disp-ovl-2l";
> +                       reg = <0 0x14014000 0 0x1000>;
> +                       interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
> +                       clocks = <&mmsys CLK_MM_DISP_OVL2_2L>;
> +                       //iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2>,
> +                       //       <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2_HDR>;
> +                       //mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x4000 0x1000>;
> +               };
> +
> +               rdma4: rdma@14015000 {
> +                       compatible = "mediatek,mt8192-disp-rdma";
> +                       reg = <0 0x14015000 0 0x1000>;
> +                       interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
> +                       clocks = <&mmsys CLK_MM_DISP_RDMA4>;
> +                       //iommus = <&iommu0 M4U_PORT_L1_DISP_RDMA4>;
> +                       mediatek,rdma_fifo_size = <2>;
> +                       //mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
> +               };
> +
>                 imgsys: imgsys@15020000 {
>                         compatible = "mediatek,mt8192-imgsys", "syscon";
>                         reg = <0 0x15020000 0 0x1000>;
> --
> 1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
