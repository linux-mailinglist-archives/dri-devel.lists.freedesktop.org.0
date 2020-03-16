Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D071188735
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5238E6E21D;
	Tue, 17 Mar 2020 14:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9806E388
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 09:00:09 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id h3so15724552ils.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XCC5SrkpztJ9xxqUlBBdM7gPVX58z1aXERNCgJId8GA=;
 b=uP7iM1w89MevX+DPQWWVqTgvS7D1ueYB4YDoYVrtvHmC8BvIJIs/2giQdvJ6D9KJaN
 yoeDPNFy7dc/1kHpTP1K7vf++4wJCJ21JSbElWL8YRL3NRfQgiTIYfm++7FTmbUeWbG7
 TxLk1g8p5zYPBsOL6KNsKSFw5aVWPIhRVLTcUAq/XpsDS5O14xcMWdoQ0Mp9FM0sbA/8
 RbL+PWvl4uX1WQgvvE06R3spz9gIM6A4GvFVpzYhz1xQTjpiN7jWod+O0uoSwS5fbN9N
 IzDZvgFmyA5ZzlxDEw1OIcxhzwL1QZCRBdNOzPpWFmDwTAHJO+Wk7+wCbQP7YSZ9Fy+u
 B5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XCC5SrkpztJ9xxqUlBBdM7gPVX58z1aXERNCgJId8GA=;
 b=glWNaKIYpMpgwtoXEIQ3lIRAfla5+GNM9NcHpsOcVv6U0buLdJtoB0/rxx4U/h67SD
 PPlliPg7DW+vIA226ZxN5nqIhr3HaiCPjlIBtuWbFGktyCEKkV9Se1Uj61dvXrBs4pLI
 q08rQ7qVvXwDw0Q+pHBAkHR9oiVRUYIVuyaj5J9jTR5CpwiCRb6tTImhCaI0yrmooJXD
 S/XStdPiNkZu91Y96BtfRnqhc0eRpCqGK4CV3dvoLTaBtOa2h+s7x/Zmc592CmYUL1m3
 J+j2ti580CHMReyaffLpSG9B1xoqxnLxVNdCqbtaa5HzRN/1dtBpKTQR+UQWK+7auQaF
 YV9Q==
X-Gm-Message-State: ANhLgQ0LRMF8V3HYwyPNzbTday31dM9OEGWl1HBySKxBWGyR4Tb3WrO3
 OJfOeyGQobDaKfXg1gKgi+DdbC1SioaZSj4wtok=
X-Google-Smtp-Source: ADFU+vu2bbIrkxVS2wGViv1mLQNLclYUkubsdT4bhu+47DNQydeTTWNZy6HH28+VMNaYwU2/5I2g83PJz9yz9iTT6cc=
X-Received: by 2002:a92:ba01:: with SMTP id o1mr17730663ili.217.1584349208510; 
 Mon, 16 Mar 2020 02:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-13-sam@ravnborg.org>
In-Reply-To: <20200315134416.16527-13-sam@ravnborg.org>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Mon, 16 Mar 2020 14:29:56 +0530
Message-ID: <CAGWqDJ7jiFoSxmQtKEVcQkTeKUKChAzU71f7V0nCrJYgO2n7ew@mail.gmail.com>
Subject: Re: [PATCH v1 12/36] dt-bindings: display: convert jdi,lt070me05000
 to DT Schema
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Marek Belisko <marek@goldelico.com>, Heiko Schocher <hs@denx.de>,
 Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Guido Gunther <agx@sigxcpu.org>,
 Mark Brown <broonie@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sam,

Reviewed-by: Vinay Simha BN <simhavcs@gmail.com>

Thanks.

On Sun, Mar 15, 2020 at 7:14 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Vinay Simha BN <simhavcs@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/jdi,lt070me05000.txt        | 31 ---------
>  .../display/panel/jdi,lt070me05000.yaml       | 69 +++++++++++++++++++
>  2 files changed, 69 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
> deleted file mode 100644
> index 4989c91d505f..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -JDI model LT070ME05000 1200x1920 7" DSI Panel
> -
> -Required properties:
> -- compatible: should be "jdi,lt070me05000"
> -- vddp-supply: phandle of the regulator that provides the supply voltage
> -  Power IC supply (3-5V)
> -- iovcc-supply: phandle of the regulator that provides the supply voltage
> -  IOVCC , power supply for LCM (1.8V)
> -- enable-gpios: phandle of gpio for enable line
> -  LED_EN, LED backlight enable, High active
> -- reset-gpios: phandle of gpio for reset line
> -  This should be 8mA, gpio can be configured using mux, pinctrl, pinctrl-names
> -  XRES, Reset, Low active
> -- dcdc-en-gpios: phandle of the gpio for power ic line
> -  Power IC supply enable, High active
> -
> -Example:
> -
> -       dsi0: qcom,mdss_dsi@4700000 {
> -               panel@0 {
> -                       compatible = "jdi,lt070me05000";
> -                       reg = <0>;
> -
> -                       vddp-supply = <&pm8921_l17>;
> -                       iovcc-supply = <&pm8921_lvs7>;
> -
> -                       enable-gpios = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
> -                       reset-gpios = <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;
> -                       dcdc-en-gpios = <&pm8921_gpio 23 GPIO_ACTIVE_HIGH>;
> -               };
> -       };
> diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml
> new file mode 100644
> index 000000000000..e0abf68ecb19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/jdi,lt070me05000.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: JDI model LT070ME05000 1200x1920 7" DSI Panel
> +
> +maintainers:
> +  - Vinay Simha BN <simhavcs@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: jdi,lt070me05000
> +
> +  enable-gpios: true
> +  reg: true
> +  reset-gpios: true
> +
> +  vddp-supply:
> +    description: |
> +      The regulator that provides the supply voltage Power IC supply (3-5V)
> +
> +  iovcc-supply:
> +    description: |
> +      The regulator that provides the supply voltage IOVCC,
> +      power supply for LCM (1.8V)
> +
> +  dcdc-en-gpios:
> +    description: |
> +      phandle of the gpio for power ic line
> +      Power IC supply enable, High active
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddp-supply
> +  - iovcc-supply
> +  - enable-gpios
> +  - reset-gpios
> +  - dcdc-en-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi: qcom,mdss_dsi@4700000 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "jdi,lt070me05000";
> +            reg = <0>;
> +
> +            vddp-supply = <&pm8921_l17>;
> +            iovcc-supply = <&pm8921_lvs7>;
> +
> +            enable-gpios = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
> +            reset-gpios = <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;
> +            dcdc-en-gpios = <&pm8921_gpio 23 GPIO_ACTIVE_HIGH>;
> +        };
> +    };
> +
> +...
> --
> 2.20.1
>


-- 
regards,
vinaysimha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
