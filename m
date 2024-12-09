Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E9D9E8E7E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 10:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4907710E06A;
	Mon,  9 Dec 2024 09:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sBbYr/Sz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CFC10E06A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 09:16:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EA2ECA40F17;
 Mon,  9 Dec 2024 09:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AF1C4CED1;
 Mon,  9 Dec 2024 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733735785;
 bh=uvgSr2AH5BgIAzyVifUQ70yRN9JiYiWXcBSaRIQCrlM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sBbYr/Szi89JPd/3hkggMgGl/RrPw0qNnKoFM9LyYc6cqp+4HAxokwGCjFOCu/rig
 oZekTwOgsSU3AWHMP9/8FDM1szUW9TvG23sVNVDyh2CeW0pzI0NwRDUw3P/Pq/R+hd
 haaSV56Ord+sTTqcn2NHiM6jYBvAzUqdFcNINbOrAtfHRIQRrcGyIYfYdZtPl212+J
 vvBvCju3yVEBv9jmwlShp41YqLuh6NForLmBtkzD0OVzmEajKthRv076maodDewqWC
 NpsGP44aTORMCDYlv1FWWQREP1TamujxAcsdBCXIUaAEJgqxiYymYHbRIOgf6+eqWk
 /5+dv6TmiQH3Q==
Date: Mon, 9 Dec 2024 10:16:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Helge Deller <deller@gmx.de>, 
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 bindings for Apple DWI backlight
Message-ID: <iwapssdmronnbtmlmynuarzmkd2oh3ssrmzvlobxx4ixrgwgcl@dnonaahib6jw>
References: <20241207130433.30351-1-towinchenmi@gmail.com>
 <20241207130433.30351-2-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241207130433.30351-2-towinchenmi@gmail.com>
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

On Sat, Dec 07, 2024 at 09:03:14PM +0800, Nick Chan wrote:
> Add the device tree bindings for backlight controllers attached via Apple
> DWI 2-wire interface.

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../bindings/leds/backlight/apple,dwi-bl.yaml | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
> new file mode 100644
> index 000000000000..9d4aa243f679
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/apple,dwi-bl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple DWI 2-Wire Interface Backlight Controller
> +
> +maintainers:
> +  - Nick Chan <towinchenmi@gmail.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Apple SoCs contain a 2-wire interface called DWI. On some Apple iPhones,
> +  iPads and iPod touches with a LCD display, 1-2 backlight controllers
> +  are connected via DWI. Interfacing with DWI controls all backlight
> +  controllers at the same time. As such, the backlight controllers are
> +  treated as a single controller regardless of the underlying
> +  configuration.
> +


missing allOf: with $ref to common.yaml

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,s5l8960x-dwi-bl
> +          - apple,t7000-dwi-bl
> +          - apple,s8000-dwi-bl
> +          - apple,t8010-dwi-bl
> +          - apple,t8015-dwi-bl
> +      - const: apple,dwi-bl
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

(and this then becomes unevaluatedProperties: false)

> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      dwi_bl: backlight@20e200010 {
> +        compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
> +        reg = <0x2 0x0e200010 0 8>;

Usual preference is to keep hex everywhere.

Best regards,
Krzysztof

