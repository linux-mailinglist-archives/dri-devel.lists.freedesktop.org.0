Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB30E14DD30
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 15:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89536E83C;
	Thu, 30 Jan 2020 14:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC0A6E83C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 14:48:33 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 832C821734
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 14:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580395713;
 bh=LGAqzJS0GyJFgUKZmtIdDZtfFciIuueFIQ1BOnbnUME=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P9ATMYJOv6XfFfeDW1AOUdWzwpmBGOFN5ofzDp3CfxPN1k7VgQ/YCFi7jI/yCAkud
 l83DG8rdi47TcQyUMxib6eswVsV8f10g+BTcM041zRF4eWkcJXvocyt4bNaao00+DN
 Rmdrg8WROtlz+PGB7HuhPRFjiyEJqAlX/YGu0Pho=
Received: by mail-qt1-f174.google.com with SMTP id l19so2624347qtq.8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 06:48:33 -0800 (PST)
X-Gm-Message-State: APjAAAXlsBTrbdgVsfzxxqSzfBeCEfNYJS1usVG22wLfV/CMDzmINOto
 8NuE1srJHO2pZDSoyCeZtY2lIEfHdg+Uq8wUqA==
X-Google-Smtp-Source: APXvYqxEpB4cDa9/7swv6DlUMyN3trqmvfCSCwbxMBK27JBi83VwuT0RrOr3Msu/KC9Ud66WY3wWHepEJsw0UZkjGj0=
X-Received: by 2002:aed:2344:: with SMTP id i4mr5204362qtc.136.1580395712357; 
 Thu, 30 Jan 2020 06:48:32 -0800 (PST)
MIME-Version: 1.0
References: <20200130084430.20966-1-benjamin.gaignard@st.com>
In-Reply-To: <20200130084430.20966-1-benjamin.gaignard@st.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 30 Jan 2020 08:48:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKDtiaq-hba5t1Ag-XJ1CQgkg1jPxCq9g2OdmK77+qHDQ@mail.gmail.com>
Message-ID: <CAL_JsqKDtiaq-hba5t1Ag-XJ1CQgkg1jPxCq9g2OdmK77+qHDQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: one file of all simple DSI panels
To: Benjamin Gaignard <benjamin.gaignard@st.com>
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
 Yannick Fertre <yannick.fertre@st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 30, 2020 at 2:45 AM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> From: Sam Ravnborg <sam@ravnborg.org>
>
> To complement panel-simple.yaml, create panel-simple-dsi.yaml.
> panel-simple-dsi-yaml are for all simple DSP panels with a single
> power-supply and optional backlight / enable GPIO / reset GPIO.
>
> Migrate panasonic,vvx10f034n00, orisetech,otm8009a and raydium,rm68200 over to the new file.
>
> The objectives with one file for all the simple DSI panels are:
>     - Make it simpler to add bindings for simple DSI panels
>     - Keep the number of bindings file lower
>     - Keep the binding documentation for simple DSI panels more consistent
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> ---
> version 3:
> - add orisetech,otm8009a and raydium,rm68200 compatibles
> - add reset-gpios optional property
> - fix indentation on compatible enumeration
> => Rob had reviewed the second version but, given the changes in version 3
>    I haven't added here.
>  .../bindings/display/panel/orisetech,otm8009a.txt  | 23 -------
>  .../display/panel/panasonic,vvx10f034n00.txt       | 20 ------
>  .../bindings/display/panel/panel-simple-dsi.yaml   | 74 ++++++++++++++++++++++
>  .../bindings/display/panel/raydium,rm68200.txt     | 25 --------
>  4 files changed, 74 insertions(+), 68 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt
>
> diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
> deleted file mode 100644
> index 203b03eefb68..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Orise Tech OTM8009A 3.97" 480x800 TFT LCD panel (MIPI-DSI video mode)
> -
> -The Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD panel connected using
> -a MIPI-DSI video interface. Its backlight is managed through the DSI link.
> -
> -Required properties:
> -  - compatible: "orisetech,otm8009a"
> -  - reg: the virtual channel number of a DSI peripheral
> -
> -Optional properties:
> -  - reset-gpios: a GPIO spec for the reset pin (active low).
> -  - power-supply: phandle of the regulator that provides the supply voltage.
> -
> -Example:
> -&dsi {
> -       ...
> -       panel@0 {
> -               compatible = "orisetech,otm8009a";
> -               reg = <0>;
> -               reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
> -               power-supply = <&v1v8>;
> -       };
> -};
> diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
> deleted file mode 100644
> index 37dedf6a6702..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Panasonic 10" WUXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "panasonic,vvx10f034n00"
> -- reg: DSI virtual channel of the peripheral
> -- power-supply: phandle of the regulator that provides the supply voltage
> -
> -Optional properties:
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Example:
> -
> -       mdss_dsi@fd922800 {
> -               panel@0 {
> -                       compatible = "panasonic,vvx10f034n00";
> -                       reg = <0>;
> -                       power-supply = <&vreg_vsp>;
> -                       backlight = <&lp8566_wled>;
> -               };
> -       };
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> new file mode 100644
> index 000000000000..1168b8186490
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple DSI panels with a single power-supply
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +description: |
> +  This binding file is a collection of the DSI panels that
> +  requires only a single power-supply.
> +  There are optionally a backlight and an enable GPIO.
> +  The panel may use an OF graph binding for the association to the display,
> +  or it may be a direct child node of the display.
> +
> +  If the panel is more advanced a dedicated binding file is required.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +
> +  compatible:
> +    enum:
> +      # compatible must be listed in alphabetical order, ordered by compatible.
> +      # The description in the comment is mandatory for each compatible.
> +
> +        # Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD
> +      - orisetech,otm8009a
> +        # Panasonic 10" WUXGA TFT LCD panel
> +      - panasonic,vvx10f034n00
> +        # Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280 TFT LCD
> +      - raydium,rm68200
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  reset-gpios:
> +    maxItems : 1

Can we keep whether to add 'reset-gpios' a separate discussion. If we
do add it, then it should go in panel-common.yaml and
panel-simple.yaml.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
