Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990B931B61A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 10:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DCB6E14D;
	Mon, 15 Feb 2021 09:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736666E14D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 09:02:56 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r21so7926415wrr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 01:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oxng+iLTqqX8u5ivqtnCjUwXLDUqWJ1hcpwFjRoA3VA=;
 b=ac688awfA3FPRyNpqL3gz2V/rX+S8U5zTQRtMRo6icLd2KKc2Q0vJRIGoh9eutOswf
 Yrq3HZUkcs8iv8oiCGSfcXjYNE+/SNK8A9RMz72KvK/2uv7PvOxRBIXriw8ojqK43u5O
 MxFLuwhOzZFa2Asy6mJXPBHp5Ry+81qdM1G/uF//ca4CQU66Sm49He6efgMffWH2wzV9
 d3F82w2n4q6TW+eYGN6j433Jb/E0RZAGD48o56/Rw42ewbPl30JJZz48qystNsggrNm3
 c0w0cj1ZRzEJIcZw/paHy0IUgb+FAPWAJBBuhKOGGho/yYY5A2AAf4RKZ1pvK8CsDLBQ
 H99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=oxng+iLTqqX8u5ivqtnCjUwXLDUqWJ1hcpwFjRoA3VA=;
 b=lC6Y4QXwpoP/Sjk3L1lCuWhtKuAu/Vcb57nJJ6JzcdSBE1/+Mr+AjFDRVyLoOLWYju
 J7e8kQH7ovkefiFziCeImZDSVUKIPYq3bytW5iCGhiPUwzDQmue4AHNyVrO8/02/wmsR
 iuoTo8KerQhEHlLrR/23SzNi1iqAbs6cSDgaRZTQ+MEK9nr5vPgNw6i3qAd7MiWMElTQ
 Y8LQ6bnPg/BMDifZUJvfuQwwD3L7j2Gr2zeta8dDPSLlK0h3xQJ5SWWk+Ps08RiEZ1MC
 MHnqIp8wHE2RmdoX+Es2PDqhvuZumQlt8p0hOwBEU5/JpMvjSbYyijdodj0EUey6L51J
 cTRA==
X-Gm-Message-State: AOAM531fStrUY8zOMmlpn6Juiyd0M9cxCM8Fk/2ZuWfUuKXGk0vsHWJi
 t5f8MMTcyxkfj0UiaPwB/UZN5A==
X-Google-Smtp-Source: ABdhPJw9V7cNWKzDbfSUv8B57NHph44XaDLrcPA6q6O1NqcDCMjI2y8gkBhlh76py+jkM/KamN5Dsw==
X-Received: by 2002:a5d:4651:: with SMTP id j17mr17448450wrs.64.1613379774832; 
 Mon, 15 Feb 2021 01:02:54 -0800 (PST)
Received: from ?IPv6:2a01:e0a:90c:e290:3627:e500:c425:5f5c?
 ([2a01:e0a:90c:e290:3627:e500:c425:5f5c])
 by smtp.gmail.com with ESMTPSA id t9sm18140381wrw.76.2021.02.15.01.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 01:02:54 -0800 (PST)
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add bindings for
 SN65DSI83/84/85
To: Jagan Teki <jagan@amarulasolutions.com>, Rob Herring
 <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20210214174453.104616-1-jagan@amarulasolutions.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <8330126a-b2f4-5991-a2fa-37776cb412d0@baylibre.com>
Date: Mon, 15 Feb 2021 10:02:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214174453.104616-1-jagan@amarulasolutions.com>
Content-Language: en-US
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-amarula@amarulasolutions.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 14/02/2021 18:44, Jagan Teki wrote:
> SN65DSI83/84/85 devices are MIPI DSI to LVDS based bridge
> controller IC's from Texas Instruments.
> 
> SN65DSI83 - Single Channel DSI to Single-link LVDS bridge
> SN65DSI84 - Single Channel DSI to Dual-link LVDS bridge
> SN65DSI85 - Dual Channel DSI to Dual-link LVDS bridge
> 
> Right now the bridge driver is supporting Channel A with single
> link, so dt-bindings documented according to it.

Shouldn't it describe Dual-link LVDS already for SN65DSI84/85 and Dual Channel DSI for SN65DSI85 even if not implemented in the driver ?

Neil

> 
> Cc: Marek Vasut <marex@denx.de>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - fixed Rob comments
> - updated commit message and file name to support all chip variants 
> Changes for v2:
> - none
> 
>  .../bindings/display/bridge/ti,sn65dsi8x.yaml | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8x.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8x.yaml
> new file mode 100644
> index 000000000000..7f9f8cd6e786
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8x.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi8x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI SN65DSI83/84/85 MIPI DSI to LVDS bridge bindings
> +
> +maintainers:
> +  - Jagan Teki <jagan@amarulasolutions.com>
> +
> +description: |
> +  SN65DSI83/84/85 devices are MIPI DSI to LVDS based bridge controller
> +  IC's from Texas Instruments.
> +
> +  SN65DSI83 - Single Channel DSI to Single-link LVDS bridge
> +  SN65DSI84 - Single Channel DSI to Dual-link LVDS bridge
> +  SN65DSI85 - Dual Channel DSI to Dual-link LVDS bridge
> +
> +  Bridge decodes MIPI DSI 18bpp RGB666 and 240bpp RG888 packets and
> +  converts the formatted video data stream to a FlatLink compatible
> +  LVDS output operating at pixel clocks operating from 25 MHx to
> +  154 MHz.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,sn65dsi83
> +      - ti,sn65dsi84
> +
> +  reg:
> +    const: 0x2c
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO specifier for bridge enable pin (active high).
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: |
> +          DSI Input. The remote endpoint phandle should be a
> +          reference to a valid mipi_dsi_host device node.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: |
> +          Video port for LVDS output (panel or connector).
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - enable-gpios
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       ports {
> +           #address-cells = <1>;
> +           #size-cells = <0>;
> +
> +           port@0 {
> +               reg = <0>;
> +               dsi_in: endpoint {
> +                   remote-endpoint = <&ltdc_ep0_out>;
> +               };
> +           };
> +
> +           port@1 {
> +               reg = <1>;
> +               dsi_out: endpoint {
> +                   remote-endpoint = <&bridge_in>;
> +                   data-lanes = <0 1>;
> +               };
> +           };
> +       };
> +    };
> +
> +    i2c6 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       bridge@2c {
> +           compatible = "ti,sn65dsi84";
> +           reg = <0x2c>;
> +           enable-gpios = <&gpiof 15 GPIO_ACTIVE_HIGH>;
> +
> +           ports {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               port@0 {
> +                   reg = <0>;
> +                   bridge_in: endpoint {
> +                        remote-endpoint = <&dsi_out>;
> +                   };
> +               };
> +
> +               port@1 {
> +                   reg = <1>;
> +                   bridge_out: endpoint {
> +                        remote-endpoint = <&panel_in_lvds>;
> +                   };
> +               };
> +           };
> +       };
> +    };
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
