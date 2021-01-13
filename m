Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8332F5D4D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7036E112;
	Thu, 14 Jan 2021 09:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FC36E2ED
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 09:15:23 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 837765C0194;
 Wed, 13 Jan 2021 04:15:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 13 Jan 2021 04:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=MygAzndgaPE7EJwkItlbKgKXiN2
 CNI7nQQx9sgMYLls=; b=UseYZKOUCwmaff8O7R7dr7RqrkIP2KfckYCRZ4yfgM4
 gG06kjJSWsVwK33Fxhi54pvH9SWPrpzAlDwhyT5+yABOvpN9WXYBi2cVDMjp2sUA
 5rzXhwHxgI6dt9U0582jFJ4g6mzKG7mEFzjNC8OSy8pt98JB5ofMOXI4GpYBUkBl
 kDMATcAB1pz/OMxmCFan8MnWF5SgxPwMILVDalivXIzDyqOVqioYAnrh+2bwKkkd
 j9JK0mvTiQGPm7+gPJKy8L9DKO4/Toj8ZpOojb5A7PF6cYKCp73Z/9WTlgrBykGD
 DTrF8I1Cl2j+OR5SelBSkKfG8nTLO8WIAI67jzaYBXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MygAzn
 dgaPE7EJwkItlbKgKXiN2CNI7nQQx9sgMYLls=; b=pC8rk5qZ5AiOFAj5r7lboA
 E6gh3WF3ru89YdYX/Z//YDYzW/9nm9YywflxgCf25VuDwkASY+CuMnzFAdCE0rnB
 WjeTk4eCUnYIQB4129x9tYvJk6+NahazU/p7LRuC8+2Ki2mBWwIosHtK5upUFZjs
 eofOAaameEAT9d5teB0DnZUrByd9/EH3xTNWCQxby/FZ8T3ssucTwyNnX9ARbeQg
 xTXLSUP3ISGMM4dqzqmBnKEGJduHrPHU2zFcO9ZZrvx0ch2PJFWJFLuhH4iJX1pC
 bGn4JXVuRFCH4JE0l8XunGAbctRw5ah8LJ6Ol80Rbt9NSCKtVNrPp4p5SysMObkA
 ==
X-ME-Sender: <xms:Kbr-X8yboJKKAcUlEBxcSIUVR9qiG_9CFQEhjYQ9JPAGoBBxYcIbzQ>
 <xme:Kbr-XwS6YYo5tHglW8RPs51H5hE0nc4weDf8-aSn4c6bbSSEKrUciVQouYZ9Lw8WY
 nuytS5LWgpS7JmWrNk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdefgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeffteetveeijeetuefhffegkeetgffhieelheehtdduudethffhjedtvddtudel
 vdenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Kbr-X-UjzKO4cM42ZOQ4HmJFBI6t1mkrTLKGbAvw40g6hLe70LiEog>
 <xmx:Kbr-X6hyKhiPz8307O8jZQCLfVZT6ioevX3LAiFk1GmxjpwtR6mvOg>
 <xmx:Kbr-X-CFOQz0dWMh04ijGXr23MjScsJK6jLmrqN4NC-bFj6dO6tJjQ>
 <xmx:Krr-Xw2M3D-tJVYXC__TpdynpzkDt971IN-7yThHIsUDupFnAcglfg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A5F26240057;
 Wed, 13 Jan 2021 04:15:21 -0500 (EST)
Date: Wed, 13 Jan 2021 10:15:20 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH V3] dt-bindings: gpu: Convert v3d to json-schema
Message-ID: <20210113091520.btk53z5mrhmaqd6h@gilmour>
References: <1610189433-29985-1-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
In-Reply-To: <1610189433-29985-1-git-send-email-stefan.wahren@i2se.com>
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Content-Type: multipart/mixed; boundary="===============0114880493=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0114880493==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sfw42jwsi5m26ljh"
Content-Disposition: inline


--sfw42jwsi5m26ljh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jan 09, 2021 at 11:50:32AM +0100, Stefan Wahren wrote:
> This converts the v3d bindings to yaml format.
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>=20
> Changes in V3:
> - drop redundant maxItems in case we already have items defined
> - fix order of reg-names enum
> - tag required items in description
> - add reg-names to required properties
> - drop clock-names
>=20
>  .../devicetree/bindings/gpu/brcm,bcm-v3d.txt       | 33 ----------
>  .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 72 ++++++++++++++++=
++++++
>  2 files changed, 72 insertions(+), 33 deletions(-)
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
> index 0000000..3b543d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> @@ -0,0 +1,72 @@
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
> +      - description: hub register (required)
> +      - description: core0 register (required)
> +      - description: GCA cache controller register (if GCA controller pr=
esent)
> +      - description: bridge register (if no external reset controller)
> +    minItems: 2

maxItems will be set to 2 in this case, while it would be 4 I guess?

Looks fine otherwise

Maxime

--sfw42jwsi5m26ljh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/66KAAKCRDj7w1vZxhR
xWGqAP0ctcD91iQuKDGJftdswF0t0Cle2waMy0MgAZCzY1CFsAEA5TvpFr1D0WVc
LgNjEYsl9oXX6M1jnsFYCBhRYkAO9As=
=qgAJ
-----END PGP SIGNATURE-----

--sfw42jwsi5m26ljh--

--===============0114880493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0114880493==--
