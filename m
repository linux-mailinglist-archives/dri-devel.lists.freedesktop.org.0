Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C3963ED27
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E396410E59E;
	Thu,  1 Dec 2022 10:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A73510E5B0
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 10:03:18 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id l15so643269qtv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 02:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h7orI/+fp6P+9YeMZGsDnPDJ3YP/9fqlxMdclgUX5LM=;
 b=Rd+6lq9nTupLlKTq4YLkyvn7fG8NMlUjEmroRMtkauuRoKhMwKCncuQ/6vvu5K4UMZ
 j4Lmn02XGjJLjZOOpLHCEx/5Ot9WXpcwRdk/gpVYXNewgvOAVxUzikveGn5SoU4Qp7IF
 1AHEUL1PpJC43B65YdsRAo4v57Ryt1ea5oj+tGMkTxECBFsnDcPBztZNkqIxvFKzI0MY
 qEsgStkSEIpheBXKdLEEGQqXT9NStp4DW+azljxn16Xub55K+4nGrlRTR2/xfLZL+ez2
 5KIkRVYy6Ie5LFPFJYMxNz4VlDn/0fuUpF/Pf2Nb+vZEq28KhaTryFya19Vo/Q8JruP7
 UQ5g==
X-Gm-Message-State: ANoB5plmgFXbJCo7YLlehQympU7mUzO1u+7ahKAny9UaU72UkpGjFYZ9
 scESklgLjKSaVQxpuO+JH+TfelID8HuBNQ==
X-Google-Smtp-Source: AA0mqf6Cya2zJJfV1PKjPQCYcnGRGtkjPt6e+WShO+ocMtRx5lwSDLl1fFY0YiF0Ogsvn2vwkRaheA==
X-Received: by 2002:ac8:5b44:0:b0:3a4:fb34:7d9a with SMTP id
 n4-20020ac85b44000000b003a4fb347d9amr60621057qtw.379.1669888997158; 
 Thu, 01 Dec 2022 02:03:17 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 dt34-20020a05620a47a200b006fbbacde9e4sm3087042qkb.78.2022.12.01.02.03.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 02:03:16 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id e141so1388568ybh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 02:03:16 -0800 (PST)
X-Received: by 2002:a25:d655:0:b0:6fc:1c96:c9fe with SMTP id
 n82-20020a25d655000000b006fc1c96c9femr1249230ybg.36.1669888996192; Thu, 01
 Dec 2022 02:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20221123065946.40415-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221123065946.40415-6-tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20221123065946.40415-6-tomi.valkeinen+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Dec 2022 11:03:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVy+cfDLsCWA0z-xF+Rr0g4hLSROry-m+=eZSBEsuLa_w@mail.gmail.com>
Message-ID: <CAMuHMdVy+cfDLsCWA0z-xF+Rr0g4hLSROry-m+=eZSBEsuLa_w@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: renesas: white-hawk-cpu: Add DP output
 support
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Wed, Nov 23, 2022 at 8:00 AM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> Add DT nodes needed for the mini DP connector. The DP is driven by
> sn65dsi86, which in turn gets the pixel data from the SoC via DSI.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.3, with the mini-dp-con node
moved up.

> --- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
> @@ -97,6 +97,15 @@ memory@600000000 {
>                 reg = <0x6 0x00000000 0x1 0x00000000>;
>         };
>
> +       reg_1p2v: regulator-1p2v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-1.2V";
> +               regulator-min-microvolt = <1200000>;
> +               regulator-max-microvolt = <1200000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> +
>         reg_1p8v: regulator-1p8v {
>                 compatible = "regulator-fixed";
>                 regulator-name = "fixed-1.8V";
> @@ -114,6 +123,24 @@ reg_3p3v: regulator-3p3v {
>                 regulator-boot-on;
>                 regulator-always-on;
>         };
> +
> +       mini-dp-con {
> +               compatible = "dp-connector";
> +               label = "CN5";
> +               type = "mini";
> +
> +               port {
> +                       mini_dp_con_in: endpoint {
> +                               remote-endpoint = <&sn65dsi86_out>;
> +                       };
> +               };
> +       };

Moving up while applying to preserve sort order...

> +
> +       sn65dsi86_refclk: clk-x6 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <38400000>;
> +       };
>  };
>
>  &avb0 {

> @@ -172,6 +216,51 @@ eeprom@50 {
>         };
>  };
>
> +&i2c1 {
> +       pinctrl-0 = <&i2c1_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +       clock-frequency = <400000>;
> +
> +       bridge@2c {

Ideally, this needs pinctrl for the intc_ex irq0 pin.
Unfortunately[1] is still in limbo as the naming of the alternate pins
is inconsistent.

> +               compatible = "ti,sn65dsi86";
> +               reg = <0x2c>;
> +
> +               clocks = <&sn65dsi86_refclk>;
> +               clock-names = "refclk";
> +
> +               interrupt-parent = <&intc_ex>;
> +               interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +               enable-gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
> +
> +               vccio-supply = <&reg_1p8v>;
> +               vpll-supply = <&reg_1p8v>;
> +               vcca-supply = <&reg_1p2v>;
> +               vcc-supply = <&reg_1p2v>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               sn65dsi86_in: endpoint {
> +                                       remote-endpoint = <&dsi0_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +                               sn65dsi86_out: endpoint {
> +                                       remote-endpoint = <&mini_dp_con_in>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
>  &mmc0 {
>         pinctrl-0 = <&mmc_pins>;
>         pinctrl-1 = <&mmc_pins>;

[1] "[PATCH/RFC] pinctrl: renesas: r8a779g0: Add INTC-EX pins, groups,
and function"
    https://lore.kernel.org/all/28fe05d41bea5a03ea6c8434f5a4fb6c80b48867.1664368425.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                                                Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                                            -- Linus Torvalds
