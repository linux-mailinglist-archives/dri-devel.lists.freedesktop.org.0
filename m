Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F11711F210
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1CD6E348;
	Sat, 14 Dec 2019 14:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78506E2E5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 09:56:11 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EDD26224DF;
 Fri, 13 Dec 2019 04:56:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 13 Dec 2019 04:56:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=5Wagss6upKdUYVoh8gQcMubIGyc
 SkIyFIPyFhwC/KP8=; b=C8dDBAwdI3nLplVW3/Txe2a5MtpludlI96gDSdENjht
 D4B2yHAYumX/iZONVC6BnC4/fBTK5wMUErtWLr2nG8wCGHRrCL2YqW8dBHCmW9zH
 1qbdYWAFNnasGeRMVa7/naTRRhO9eolHYQopY7qsHzsitIAP/VbSWb1dxBQtOx7D
 Re6cC34OdfEAOrkPM/678ZVw3Z80u6PVDyGIGHdU9bC/4cAqmVUIgNvwY3TQ4iXV
 nycsJLMUbXhxptE5PmdSGR4ojUGL/J++Ly+sLTejFS558UHoV4r6sCqRdcvdRnpn
 d5K6bAH7wRQUOQKDw/QTuqYBfbn6BfEt7/NnTmjNsqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5Wagss
 6upKdUYVoh8gQcMubIGycSkIyFIPyFhwC/KP8=; b=ruOV5aN8Gy9YvtkrNcj21E
 OjBZeyxz6EQ8WpUyUQehk/elYNkHRtOnUlvtu7W/Fsdd4rkGu8Ezcsb2CN/tqhWG
 nzidVF3hy5leFhWT/FoKLggG1H6Gs1izv0pv9vrLucDb3rUBleZ83znvMcm6/W8F
 umkms5ZFOE30leCCIcpQiFQFF29RK5SD2/STj4aW88hFsTCjSCuOSdI5Ad1sr4EX
 PCXWnWhD/CqeFyr+nOJ0v2YhadvNQ52yL84pInR5LZvmNtI1AncC9NQeK2a4kBEh
 z0XGDmaRPbHI0VwuCS5WnCFRQMxsfptrCuD5sYTkPlheemEcDbppg/VJF3VZUKEw
 ==
X-ME-Sender: <xms:OmDzXRK-z25EPmZOUv43jjjnhJj9Opsom0SoshvlvRzzZNtD0Sbz2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelledgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
 hnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthhenucevlh
 hushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:OmDzXU5cooI0mASqoBbYyKm1O25hbkiAC-6ObjNVQEQ-q-VVB_p2mw>
 <xmx:OmDzXevQCpEmzac9DHcmSirNOy9zMBzmLVRCNZ6gcfsZKMRef7Ompw>
 <xmx:OmDzXabQxt05Ik8iGoFBIf2ddSsNGRMQLjUjOW1HzHaiFeFmlYZeOQ>
 <xmx:OmDzXTK23qtE8WvCTh3OcizyNykkcBhYWPOuqbCuXjk2pmeVxwfTkQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DFF558005C;
 Fri, 13 Dec 2019 04:56:09 -0500 (EST)
Date: Fri, 13 Dec 2019 10:56:07 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Yuti Amonkar <yamonkar@cadence.com>
Subject: Re: [PATCH v1 02/15] dt-bindings:phy: Convert Cadence MHDP PHY
 bindings to YAML.
Message-ID: <20191213095607.esxwqwjknmqfpzvr@gilmour.lan>
References: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
 <1575368005-29797-3-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
In-Reply-To: <1575368005-29797-3-git-send-email-yamonkar@cadence.com>
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: mparab@cadence.com, praneeth@ti.com, dkangude@cadence.com, jsarha@ti.com,
 kishon@ti.com, tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org,
 sjakhade@cadence.com
Content-Type: multipart/mixed; boundary="===============1215539572=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1215539572==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xhng3gnbn64w7fej"
Content-Disposition: inline


--xhng3gnbn64w7fej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Dec 03, 2019 at 11:13:12AM +0100, Yuti Amonkar wrote:
> - Convert the MHDP PHY devicetree bindings to yaml schemas.
> - Rename DP PHY to have generic Torrent PHY nomrnclature.
> - Rename compatible string from "cdns,dp-phy" to "cdns,torrent-phy".
>
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> ---
>  .../devicetree/bindings/phy/phy-cadence-dp.txt     | 30 -------------
>  .../bindings/phy/phy-cadence-torrent.yaml          | 52 ++++++++++++++++++++++
>  2 files changed, 52 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-cadence-dp.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
>
> diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-dp.txt b/Documentation/devicetree/bindings/phy/phy-cadence-dp.txt
> deleted file mode 100644
> index 7f49fd54e..0000000
> --- a/Documentation/devicetree/bindings/phy/phy-cadence-dp.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Cadence MHDP DisplayPort SD0801 PHY binding
> -===========================================
> -
> -This binding describes the Cadence SD0801 PHY hardware included with
> -the Cadence MHDP DisplayPort controller.
> -
> --------------------------------------------------------------------------------
> -Required properties (controller (parent) node):
> -- compatible	: Should be "cdns,dp-phy"
> -- reg		: Defines the following sets of registers in the parent
> -		  mhdp device:
> -			- Offset of the DPTX PHY configuration registers
> -			- Offset of the SD0801 PHY configuration registers
> -- #phy-cells	: from the generic PHY bindings, must be 0.
> -
> -Optional properties:
> -- num_lanes	: Number of DisplayPort lanes to use (1, 2 or 4)
> -- max_bit_rate	: Maximum DisplayPort link bit rate to use, in Mbps (2160,
> -		  2430, 2700, 3240, 4320, 5400 or 8100)
> --------------------------------------------------------------------------------
> -
> -Example:
> -	dp_phy: phy@f0fb030a00 {
> -		compatible = "cdns,dp-phy";
> -		reg = <0xf0 0xfb030a00 0x0 0x00000040>,
> -		      <0xf0 0xfb500000 0x0 0x00100000>;
> -		num_lanes = <4>;
> -		max_bit_rate = <8100>;
> -		#phy-cells = <0>;
> -	};
> diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> new file mode 100644
> index 0000000..d0037bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> @@ -0,0 +1,52 @@
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Cadence Torrent SD0801 PHY binding for DisplayPort
> +
> +description:
> +  This binding describes the Cadence SD0801 PHY hardware included with
> +  the Cadence MHDP DisplayPort controller.
> +
> +maintainers:
> +  - Kishon Vijay Abraham I <kishon@ti.com>
> +
> +properties:
> +  compatible:
> +    const: cdns,torrent-phy
> +
> +  reg:
> +    items:
> +      - description: Offset of the DPTX PHY configuration registers.
> +      - description: Offset of the SD0801 PHY configuration registers.
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  num_lanes:
> +    maxItems: 1
> +    description:
> +      Number of DisplayPort lanes to use (1, 2 or 4)
> +
> +  max_bit_rate:
> +    maxItems: 1
> +    description:
> +      Maximum DisplayPort link bit rate to use, in Mbps (2160, 2430, 2700, 3240, 4320, 5400 or 8100)
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"

Setting additionalProperties: false here would be great, it prevents
additional properties from slipping in (or typos in optional
properties that would be unnoticed otherwise).

Maxime

--xhng3gnbn64w7fej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfNgNwAKCRDj7w1vZxhR
xfu5AQDRdThjxkJinath7ZVgv1Cc3HyQNEL/V8lLqR2wkfPGkAD/dMu6iEKX0YRu
eGYn+RXTiWVjfhc+kD2xpEqzS2DwAgI=
=Jdqn
-----END PGP SIGNATURE-----

--xhng3gnbn64w7fej--

--===============1215539572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1215539572==--
