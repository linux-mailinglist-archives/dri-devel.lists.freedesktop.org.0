Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E542ECC00
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CD16E444;
	Thu,  7 Jan 2021 08:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AD26E05F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 15:12:36 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 860F05C00FE;
 Wed,  6 Jan 2021 10:12:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 06 Jan 2021 10:12:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=P5/Tb7LCaQ16J1NVwYWbEViIiEf
 m9aUGJePzAFUKyxU=; b=e+fdxNwrL9Mkdbm3OSoQB4EZOWDfLAzCF5AMwr3SaYE
 3cOlgBiXyNMuLC1hoeH5i3dDSPFIK0sVblM6f5irtZiOS5FDdiVnOFJ8sEt7uGVt
 Gkaaxc9JQtqvHUELb8dW1E0YAHUzMjG8ZbUZ5yhGiJXrQLmHlSnc9Ep7/N7f4sAd
 HPxm1B+er9ptFe523Rmo56B/CPNWMsyTnGyDFXDZ4iN2mJ3CCvw2/vL52Kwp6KN2
 Phak5i8PXj3OWhJve0JTFY0uZyboL/NLfwts93PcpsBzBxv6TJuJ289iIL9RgJKO
 ++d2HK0/a9FuLbo5MmRjQRutHE8ihQaO/caRQ8clXIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=P5/Tb7
 LCaQ16J1NVwYWbEViIiEfm9aUGJePzAFUKyxU=; b=ZuY1KCgGGjy0ebo7b46DGb
 7E9nufoQwxfcZIYaquXX0T31VAOZyHTbkCxMDWIl9GiVgv4M9O6nuSsRK2BejNR0
 0mU3dTr3xzIzsEyRUZdle2Vl05Sr77y8oT7e/nxG3dQX7MdwNo0sXdDdJ1ymC/WO
 jU0HB09C5V/HTYMnE5Ap5pzqw3VI9xYakb28UvhFabfrctHKNChG4QgutX5/BdWN
 Mitk3j7zfdEP6iOvHebG/jtosfM1v5Kv6HKU4k2pympTNs4xMoG5ZR5oReMWfyyg
 Z1NEfGuq70zWQ5vgZUxPZtUDz9+Rk8lHNKT5p5QyWrFRKUD/dch0l36aoCPeshTg
 ==
X-ME-Sender: <xms:YdP1X77a4RrYOyYAQGUpvYjfOT8wBuSbu1LK7Ii-q1jxT73N4N_lQQ>
 <xme:YdP1Xw7zzg-6TEpo8F1-vfatGO_tXeAglh5Xx-yIuwWjdYTFvQGgRCFdljetVCJLo
 DTVpUfPvPBJi-cRcfI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefledgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepffetteevieejteeuhfffgeektefghfeileehhedtuddutefhhfejtddvtddu
 ledvnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekle
 drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YdP1XydpxNUxLVuTgagLoNP03nKpBgN4Rsz7RzS8rLnhJHsarWlv8Q>
 <xmx:YdP1X8I78YGqY_LXm-nim-Cc20K-LssyBk70PnxlKPFN4UfbppR4Lw>
 <xmx:YdP1X_KBgp4Fv6qxzseJiEqGip_qskxjcWZfJYRxLuXaEYSzCPQ5ug>
 <xmx:Y9P1X39rk6B8bDcmGk5I6LDTup43gonX3pfP7SRRK0mpbbpdSfiH0g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 576AD240066;
 Wed,  6 Jan 2021 10:12:33 -0500 (EST)
Date: Wed, 6 Jan 2021 16:12:32 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH V2 4/4] dt-bindings: gpu: Convert v3d to json-schema
Message-ID: <20210106151232.egv2d33rtw462iiw@gilmour>
References: <1608755714-18233-1-git-send-email-stefan.wahren@i2se.com>
 <1608755714-18233-5-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
In-Reply-To: <1608755714-18233-5-git-send-email-stefan.wahren@i2se.com>
X-Mailman-Approved-At: Thu, 07 Jan 2021 08:53:13 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============1586972020=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1586972020==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tnol5fwcnhnynxmr"
Content-Disposition: inline


--tnol5fwcnhnynxmr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2020 at 09:35:14PM +0100, Stefan Wahren wrote:
> This converts the v3d bindings to yaml format.
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  .../devicetree/bindings/gpu/brcm,bcm-v3d.txt       | 33 ----------
>  .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 76 ++++++++++++++++=
++++++
>  2 files changed, 76 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt b/Doc=
umentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
> deleted file mode 100644
> index b2df82b..0000000
> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Broadcom V3D GPU
> -
> -Only the Broadcom V3D 3.x and newer GPUs are covered by this binding.
> -For V3D 2.x, see brcm,bcm-vc4.txt.
> -
> -Required properties:
> -- compatible:	Should be "brcm,7268-v3d" or "brcm,7278-v3d"
> -- reg:		Physical base addresses and lengths of the register areas
> -- reg-names:	Names for the register areas.  The "hub" and "core0"
> -		  register areas are always required.  The "gca" register area
> -		  is required if the GCA cache controller is present.  The
> -		  "bridge" register area is required if an external reset
> -		  controller is not present.
> -- interrupts:	The interrupt numbers.  The first interrupt is for the hub,
> -		  while the following interrupts are separate interrupt lines
> -		  for the cores (if they don't share the hub's interrupt).
> -		  See bindings/interrupt-controller/interrupts.txt
> -
> -Optional properties:
> -- clocks:	The core clock the unit runs on
> -- resets:	The reset line for v3d, if not using a mapping of the bridge
> -		  See bindings/reset/reset.txt
> -
> -v3d {
> -	compatible =3D "brcm,7268-v3d";
> -	reg =3D <0xf1204000 0x100>,
> -	      <0xf1200000 0x4000>,
> -	      <0xf1208000 0x4000>,
> -	      <0xf1204100 0x100>;
> -	reg-names =3D "bridge", "hub", "core0", "gca";
> -	interrupts =3D <0 78 4>,
> -		     <0 77 4>;
> -};
> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Do=
cumentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> new file mode 100644
> index 0000000..a2b06d42
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/brcm,bcm-v3d.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom V3D GPU Bindings
> +
> +maintainers:
> +  - Eric Anholt <eric@anholt.net>
> +  - Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> +
> +properties:
> +  $nodename:
> +    pattern: '^gpu@[a-f0-9]+$'
> +
> +  compatible:
> +    enum:
> +      - brcm,7268-v3d
> +      - brcm,7278-v3d
> +
> +  reg:
> +    items:
> +      - description: hub register
> +      - description: core0 register
> +      - description: GCA cache controller register (if GCA controller)
> +      - description: bridge register (if no external reset controller)
> +    minItems: 2
> +    maxItems: 4
> +
> +  reg-names:
> +    items:
> +      enum: [ bridge, core0, gca, hub ]
> +    minItems: 2
> +    maxItems: 4

It's not really clear here what interrupts are expected. I assume that
bridge and core0 are always supposed to be here, but gca and hub are
optional?

It would be a bit cumbersome to get it to check properly, but we can at
least make it obvious in the binding with a comment or the description

> +
> +  interrupts:
> +    items:
> +      - description: hub interrupt
> +      - description: core interrupt (if it doesn't share the hub's inter=
rupt)
> +    minItems: 1
> +    maxItems: 2
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    maxItems: 1

This property wasn't in the previous binding?

Maxime

--tnol5fwcnhnynxmr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/XTYAAKCRDj7w1vZxhR
xeX5AP9AviPTqeBta4BqK7rpLkhbLmluVMjvq1x/qNn1nKXXRwD+JlpAS4gfPcmh
zcmHc6mNlGhVfxLdgD+Zp5v+4b0fJws=
=Yix0
-----END PGP SIGNATURE-----

--tnol5fwcnhnynxmr--

--===============1586972020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1586972020==--
