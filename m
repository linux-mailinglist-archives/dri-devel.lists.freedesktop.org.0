Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D603C8D869F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 17:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8BE10E110;
	Mon,  3 Jun 2024 15:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SKCKUK+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC4C10E110
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 15:54:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8F1FA60EC7;
 Mon,  3 Jun 2024 15:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B30C2BD10;
 Mon,  3 Jun 2024 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717430088;
 bh=/mqwg4w9jJOykMYUTyLRSt9g531pR70Ydsxqn4u/d+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SKCKUK+6SCKeWy0UyNbLs+BB50UwRzhJv4efMVYn6OgVCU8qKZOoOpikzAgyrDe1O
 c4yv7tSWwpos/H3uofzMHk3UaF+4OmLwFpp1u5SQZwX++JqcvFKzrN05AwuXi8pwiv
 l3OcNKpTom+E1RJSLQlmWM821dK+GFMnMb3xAiZ0CgSOXYuEjCMHNczULBEfDw6rFU
 6gL3Bl5JsihcjAqCZXhoGKU3e8X27voOnp9v0TqxQX3FKdnFAthexAWnpBGY29zyKJ
 GBUKCdxh3msMwIIQB/IY/VIEyArSMLRvKmyPeHrKA3Nmh3jHArbXt61pSR6XGaMBej
 70tQt7QWPZM7A==
Date: Mon, 3 Jun 2024 10:54:45 -0500
From: Rob Herring <robh@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Baoquan He <bhe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Guo Ren <guoren@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Anup Patel <apatel@ventanamicro.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [DO NOT MERGE v8 19/36] dt-bindings: interrupt-controller:
 renesas,sh7751-irl-ext: Add json-schema
Message-ID: <20240603155445.GA501876-robh@kernel.org>
References: <cover.1716965617.git.ysato@users.sourceforge.jp>
 <e35aa188e5176544c6884f2d1d7aa1b242a51acf.1716965617.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e35aa188e5176544c6884f2d1d7aa1b242a51acf.1716965617.git.ysato@users.sourceforge.jp>
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

On Wed, May 29, 2024 at 05:01:05PM +0900, Yoshinori Sato wrote:
> Renesas SH7751 external interrupt encoder json-schema.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../renesas,sh7751-irl-ext.yaml               | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.yaml
> new file mode 100644
> index 000000000000..ff70d57b86cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/renesas,sh7751-irl-ext.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SH7751 external interrupt encoder with enable regs.
> +
> +maintainers:
> +  - Yoshinori Sato <ysato@users.sourceforge.jp>
> +
> +description:
> +  This is the generally used external interrupt encoder on SH7751 based boards.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,sh7751-irl-ext
> +
> +  reg: true

Needs to define how many and what they are.

> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  '#address-cells':
> +    const: 0
> +
> +  renesas,set-to-disable:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: Invert enable registers. Setting the bit to 0 enables interrupts.
> +
> +  renesas,enable-reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |

Don't need '|'.

> +      IRQ enable register bit mapping

This needs a better description and constraints? Number of entries in 
the array or values of the entries.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - renesas,enable-reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    r2dintc: interrupt-controller@a4000000 {
> +        compatible = "renesas,sh7751-irl-ext";
> +        reg = <0xa4000000 0x02>;
> +        interrupt-controller;
> +        #address-cells = <0>;
> +        #interrupt-cells = <2>;
> +        renesas,enable-reg = <12 9 10 3 0 4 1 2 8 5 6 7 15 15 15 11>;
> +    };
> -- 
> 2.39.2
> 
