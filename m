Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03221187993
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 07:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572996E04A;
	Tue, 17 Mar 2020 06:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBB06E04A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 06:24:25 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02H6NuGA045725;
 Tue, 17 Mar 2020 01:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1584426236;
 bh=AKYgfEFNiyElag9nObrSgF611W6lhUQnOuO49KGUNfY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=tbx6notyG4XV6iGHgFSU+XmSU6Z3UCOYwDFWqmKqsZhO1k76EmLmSbdLMODlCKpBO
 lzW2z6h5ccFMbY3ubUWt/yfYb4hEmLXDlLFTV3A0AtY7eX6DlkLSCR8WaDxbY+eSsW
 Sr3SXESRhC5vRP8FzA/O/dC1XCZPa747DH5fZLXY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02H6NtKd112284;
 Tue, 17 Mar 2020 01:23:55 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Mar 2020 01:23:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Mar 2020 01:23:55 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02H6Nl7P082387;
 Tue, 17 Mar 2020 01:23:48 -0500
Subject: Re: [PATCH v1 26/36] dt-bindings: display: convert sony, acx565akm to
 DT Schema
To: Sam Ravnborg <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-27-sam@ravnborg.org>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <b2cdb376-c283-fe06-14f3-a9e1a3ee3f4c@ti.com>
Date: Tue, 17 Mar 2020 08:23:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200315134416.16527-27-sam@ravnborg.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
 Sandeep Panda <spanda@codeaurora.org>, Paul Cercueil <paul@crapouillou.net>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 Guido Gunther <agx@sigxcpu.org>, Mark Brown <broonie@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/03/2020 15:44, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>   .../bindings/display/panel/sony,acx565akm.txt | 30 -----------
>   .../display/panel/sony,acx565akm.yaml         | 53 +++++++++++++++++++
>   2 files changed, 53 insertions(+), 30 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
>   create mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
> deleted file mode 100644
> index e12333280749..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Sony ACX565AKM SDI Panel
> -========================
> -
> -Required properties:
> -- compatible: "sony,acx565akm"
> -
> -Optional properties:
> -- label: a symbolic name for the panel
> -- reset-gpios: panel reset gpio
> -
> -Required nodes:
> -- Video port for SDI input
> -
> -Example
> --------
> -
> -acx565akm@2 {
> -	compatible = "sony,acx565akm";
> -	spi-max-frequency = <6000000>;
> -	reg = <2>;
> -
> -	label = "lcd";
> -	reset-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>; /* 90 */
> -
> -	port {
> -		lcd_in: endpoint {
> -			remote-endpoint = <&sdi_out>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
> new file mode 100644
> index 000000000000..a0b1abb9f33d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sony,acx565akm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony ACX565AKM SDI Panel
> +
> +maintainers:
> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: ../../spi/spi-slave.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,acx565akm
> +
> +  label: true
> +  reset-gpios: true
> +  port: true
> +
> +required:
> +  - compatible
> +  - port
> +
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        acx565akm@2 {
> +            compatible = "sony,acx565akm";
> +            spi-max-frequency = <6000000>;
> +            reg = <2>;
> +
> +            label = "lcd";
> +            reset-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>; /* 90 */
> +
> +            port {
> +                lcd_in: endpoint {
> +                    remote-endpoint = <&sdi_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
