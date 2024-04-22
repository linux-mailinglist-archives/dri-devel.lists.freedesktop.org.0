Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D588AD065
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 17:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C2B112BC9;
	Mon, 22 Apr 2024 15:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hbLfiK2u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A198112BBF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 15:14:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 216AECE0B8B;
 Mon, 22 Apr 2024 15:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6B3C113CC;
 Mon, 22 Apr 2024 15:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713798867;
 bh=jnc8O2OGDn/sskDkfr8kRfCzr/w39Wo4NtWiEW/JWM8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hbLfiK2ufzKxA6jCwnKjq433CsonhZ0Ilo5x0049M1HyXqulkL8q/0V93hQ9+B3o4
 tL6PIoI/CHaQR6hcmn534Fc8yhmcXcIbyRrciLKyx+EFioKfkr5vnzgqFXe1RQytAe
 K3Rlg3uw39b4QRM7FeyFSWAwT/+JW4/PAT6FHjHoKHhayBjUIC7OvhaGnIjM2MH9y/
 GyfRUDB7IPeiWlyccDj98BIr8Es2A6hvdlSglgtOqeLGqyP0P6K5uWDVmna2lIrjge
 n1FsoHDD/W4w5E8z/uBz7qoLRiwIVuavumTN9FYiLbx0+osUjZLuAvbJhHmQ8kcaI5
 wW0UGuhsMDtiA==
Date: Mon, 22 Apr 2024 10:14:24 -0500
From: Rob Herring <robh@kernel.org>
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 xuxinxiong@huaqin.corp-partner.google.com
Subject: Re: [PATCH v2 1/7] dt-bindings: display: panel: Add himax hx83102
 panel bindings
Message-ID: <20240422151424.GA1273350-robh@kernel.org>
References: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
 <20240422090310.3311429-2-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422090310.3311429-2-yangcong5@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 22, 2024 at 05:03:04PM +0800, Cong Yang wrote:
> In V1, discussed with Doug and Linus [1], we need break out as separate
> driver for the himax83102-j02 controller. So add new documentation for
> "starry,himax83102-j02" panel.
> 
> [1]: https://lore.kernel.org/all/CACRpkdbzYZAS0=zBQJUC4CB2wj4s1h6n6aSAZQvdMV95r3zRUw@mail.gmail.com

Please summarize this in the commit message rather than referring to a 
link to understand "why" you doing this.

> 
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../display/panel/boe,tv101wum-nl6.yaml       |  2 -
>  .../bindings/display/panel/himax,hx83102.yaml | 73 +++++++++++++++++++
>  2 files changed, 73 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> index 906ef62709b8..53fb35f5c9de 100644
> --- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> @@ -32,8 +32,6 @@ properties:
>        - innolux,hj110iz-01a
>          # STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
>        - starry,2081101qfh032011-53g
> -        # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
> -      - starry,himax83102-j02
>          # STARRY ili9882t 10.51" WUXGA TFT LCD panel
>        - starry,ili9882t
>  
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
> new file mode 100644
> index 000000000000..2e0cd6998ba8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/himax,hx83102.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Himax HX83102 MIPI-DSI LCD panel controller
> +
> +maintainers:
> +  - Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +        # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
> +      - starry,himax83102-j02
> +
> +  reg:
> +    description: the virtual channel number of a DSI peripheral
> +
> +  enable-gpios:
> +    description: a GPIO spec for the enable pin
> +
> +  pp1800-supply:
> +    description: core voltage supply
> +
> +  avdd-supply:
> +    description: phandle of the regulator that provides positive voltage
> +
> +  avee-supply:
> +    description: phandle of the regulator that provides negative voltage
> +
> +  backlight:
> +    description: phandle of the backlight device attached to the panel
> +
> +  port: true
> +  rotation: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - enable-gpios
> +  - pp1800-supply
> +  - avdd-supply
> +  - avee-supply
> +
> +additionalProperties: false

Perhaps 'unevaluatedProperties' instead. Don't you want to support 
standard properties such as width-mm/height-mm?

> +
> +examples:
> +  - |
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel@0 {
> +            compatible = "starry,himax83102-j02";
> +            reg = <0>;
> +            enable-gpios = <&pio 45 0>;
> +            avdd-supply = <&ppvarn_lcd>;
> +            avee-supply = <&ppvarp_lcd>;
> +            pp1800-supply = <&pp1800_lcd>;
> +            backlight = <&backlight_lcd0>;
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&dsi_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.25.1
> 
