Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A16B828BAC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 19:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5311A10E4C7;
	Tue,  9 Jan 2024 18:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5158D10E4C7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 18:00:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 75BDBB81B8E;
 Tue,  9 Jan 2024 18:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628B3C433F1;
 Tue,  9 Jan 2024 18:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704823254;
 bh=ymvzUtrJXnlHdMLNcKVm+KFBPspEJjs12uHChhr3maI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sJiZ0TArj6/22B0pPKyLwA0bzPVF3T2u3klppNGGEGHUO8M3BDFkwqrb2kwrfM5qM
 n8OPX5yutZE5G/UhksJ5cC45vCz64GkCX/M6AWwQxrax01A3STbsKYAKu1F1mPcGJ+
 bR3uj/Vh3XkYPmHDi1H1UJ2dMSusvalAqMh97599hj9F185gIgppESZUFItPAS50Fg
 S09uA67w7fdcUfEWOniP5ND3dOejivKCVhjuFBECC0uzb1Msa3bIwRy7OT17b8Aum+
 t6KsfYBwQKTV5BzlJ5PD1DukrbUrHZc/iioiSTLRbCMeo5N0GMwf/BNU6MCUWdiCNp
 Qkw3rr9mZt88Q==
Date: Tue, 9 Jan 2024 18:00:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [DO NOT MERGE v6 24/37] dt-binding: sh: cpus: Add SH CPUs
 json-schema
Message-ID: <20240109-hankie-glacier-a55818f28b91@spud>
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <2e8be1e493f315c486b3113adf5d2164c3cd29e2.1704788539.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xPLBpXcvOkLaXIuy"
Content-Disposition: inline
In-Reply-To: <2e8be1e493f315c486b3113adf5d2164c3cd29e2.1704788539.git.ysato@users.sourceforge.jp>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
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
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Yang Xiwen <forbidden405@foxmail.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sebastian Reichel <sre@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xPLBpXcvOkLaXIuy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Tue, Jan 09, 2024 at 05:23:21PM +0900, Yoshinori Sato wrote:
> Renesas SH series and compatible ISA CPUs.
>=20
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../devicetree/bindings/sh/cpus.yaml          | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sh/cpus.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/sh/cpus.yaml b/Documentati=
on/devicetree/bindings/sh/cpus.yaml
> new file mode 100644
> index 000000000000..c04f897d2c2a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sh/cpus.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sh/cpus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SuperH CPUs
> +
> +maintainers:
> +  - Yoshinori Sato <ysato@users.sourceforge.jp>
> +
> +description: |+
> +  The device tree allows to describe the layout of CPUs in a system thro=
ugh
> +  the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
> +  defining properties for every cpu.
> +
> +  Bindings for CPU nodes follow the Devicetree Specification, available =
=66rom:
> +
> +  https://www.devicetree.org/specifications/

You likely copied this description from the arm binding (or from
dt-schema), but I don't think this is anything other than a statement of
the obvious. If there is a description here it should (IMO) talk about
the superh cpus.

> +
> +properties:
> +  compatible:
> +    anyOf:
> +      - items:
> +          - enum:
> +              - renesas,sh2a
> +              - renesas,sh3
> +              - renesas,sh4
> +              - renesas,sh4a
> +              - jcore,j2
> +          - const: renesas,sh2
> +      - const: renesas,sh2
> +
> +  clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: CPU core clock frequency.

What is the point of this? You have a clocks property, can't you obtain
the clock frequency by looking up the provider of that clock?

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names: true

Why do you need clock-names if you only have one clock?

> +
> +  reg:
> +    maxItems: 1
> +
> +  device_type: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - device_type
> +
> +additionalProperties: true

This should be unevaluatedProperties: false

Properties like the icache-size are documented in cpu.yaml and
you can add an reference to that to permit them. The riscv cpus binding
does this if you need to see how that works.

Cheers,
Conor.

> +examples:
> +  - |
> +    #include <dt-bindings/clock/sh7750-cpg.h>
> +    cpus {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        cpu: cpu@0 {
> +            compatible =3D "renesas,sh4", "renesas,sh2";
> +            device_type =3D "cpu";
> +            reg =3D <0>;
> +            clocks =3D <&cpg SH7750_CPG_ICK>;
> +            clock-names =3D "ick";
> +            icache-size =3D <16384>;
> +            icache-line-size =3D <32>;
> +            dcache-size =3D <32768>;
> +            dcache-line-size =3D <32>;
> +        };
> +    };
> +...
> --=20
> 2.39.2
>=20

--xPLBpXcvOkLaXIuy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ2JyAAKCRB4tDGHoIJi
0hT2AP9R2UBDSiiyTAVtH1K3WE+zVT0M8gt7NsMcQVJTKbB22wD/TgGz2+9lyG+T
38cOZyNYa1mVFqzsmAghyWQdNloznwo=
=N8JY
-----END PGP SIGNATURE-----

--xPLBpXcvOkLaXIuy--
