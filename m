Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 786E3828AE1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 18:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB83410E497;
	Tue,  9 Jan 2024 17:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B016810E497
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 17:18:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D6C29614E3;
 Tue,  9 Jan 2024 17:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41427C433F1;
 Tue,  9 Jan 2024 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704820693;
 bh=rTSF6jHsJ5Bms5qWgXfRjwBeSbdqBmaf+xJbPhMtxXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XCcR/f1HpwXjBL3+JzDA3cYTWF4cOKjY4w2ed/u5jR++Bs8BN5zPVONS9Q3+PnPAb
 pb8PKJO4yb/0nUsPYFDSmdRKvGurUE4/MCJvQiijN9vQFLmbMRXGMvUPl4HAGVQWYA
 QMBFEAoIMTyJHlknhQ5ZEGIG0QTdPO6ncBWSdQ4XwKZOT1mQAM2uaRusNY9o4FbI8x
 zdGZxJ0bgaKbALZMhjViShPBo6gwQTkPiNGEvWgjPt3etYDhvJqaij2AjavyN1IHts
 XuYqWl2YWLiREDZ+ZVW2lbnzZTn9WzxSx6IbGlHfgv0g8oahfXZYkod5O5B9LIQ8rK
 y6arbFMfhluYA==
Received: (nullmailer pid 2791151 invoked by uid 1000);
 Tue, 09 Jan 2024 17:18:07 -0000
Date: Tue, 9 Jan 2024 11:18:07 -0600
From: Rob Herring <robh@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [DO NOT MERGE v6 19/37] dt-bindings: interrupt-controller:
 renesas,sh7751-irl-ext: Add json-schema
Message-ID: <20240109171807.GA2783042-robh@kernel.org>
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <a801115c277e65341da079c318a1b970f8d9e671.1704788539.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a801115c277e65341da079c318a1b970f8d9e671.1704788539.git.ysato@users.sourceforge.jp>
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
Cc: , Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Bin Meng <bmeng@tinylab.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pci@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <dlemoal@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Yang Xiwen <forbidden405@foxmail.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sebastian Reichel <sre@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 05:23:16PM +0900, Yoshinori Sato wrote:
> Renesas SH7751 external interrupt encoder json-schema.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../renesas,sh7751-irl-ext.yaml               | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.yaml
> new file mode 100644
> index 000000000000..541b582b94ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.yaml
> @@ -0,0 +1,72 @@
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

Must define how many entries and what they are if more than one.

> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  '#address-cells':
> +    const: 0
> +
> +  renesas,set-to-disable:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: Invert enable registers. Setting the bit to 0 enables interrupts.

Why is this a property? Does it change per board or instance? If not, it 
should be implied by compatible.

> +
> +  renesas,enable-bit:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    description: |
> +      IRQ enable register bit mapping
> +      1st word interrupt level
> +      2nd word bit index of enable register

Same question here.

If it remains, then you need:

items:
  items:
    - description: interrupt level (does that mean high/low?)
    - description: bit index of enable register

Plus any constraints on the values if possible.


> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - renesas,enable-bit
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    r2dintc: sh7751irl_encoder@a4000000 {

interrupt-controller@a4000000 {

> +        compatible = "renesas,sh7751-irl-ext";
> +        reg = <0xa4000000 0x02>;
> +        interrupt-controller;
> +        #address-cells = <0>;
> +        #size-cells = <0>;
> +        #interrupt-cells = <1>;
> +        renesas,enable-bit = <0 11>,            /* PCI INTD */
> +                             <1 9>,             /* CF IDE */
> +                             <2 8>,             /* CF CD */
> +                             <3 12>,            /* PCI INTC */
> +                             <4 10>,            /* SM501 */
> +                             <5 6>,             /* KEY */
> +                             <6 5>,             /* RTC ALARM */
> +                             <7 4>,             /* RTC T */
> +                             <8 7>,             /* SDCARD */
> +                             <9 14>,            /* PCI INTA */
> +                             <10 13>,           /* PCI INTB */
> +                             <11 0>,            /* EXT */
> +                             <12 15>;           /* TP */

Looks like 'interrupt level' is just the index of the values? Why not 
make this an array?

Rob
