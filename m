Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF3A4B270D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 14:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B1710EC1E;
	Fri, 11 Feb 2022 13:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9A610EC1F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 13:27:53 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 4CC1A3201FDE;
 Fri, 11 Feb 2022 08:27:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 11 Feb 2022 08:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=f18KfTxd2ee/FLiVAwFuokRjJ08yesny4jQNWr
 VyNVw=; b=kK51pOBHiWoUyNJsLhE1Wfq6T7TsmaMHJXa+Gk3yCwVrXYc53neLYq
 tfXJ176q2vEityLoHDgxDo34N/4WtMOitcZIPXXIgeDNoOdANn8T7tEk1ZUPiEGN
 KGS++On6ZsqTKrQyxpnhC55DwZXOfxVmAGtbKxEuQrcYSQGaAXXulxQLsQTRVvwA
 vw0E4SJi2ZSRBqc0Wb/6uIik4huzBtsqmoED3v1wSKpP4lSN82eUdvY2tlR8MydF
 UP7D8ICW1o2AUP7LuX07xMjUkmwexEuBYd0lyNxFhk9lPve2gPRCcAyp+kP+SH6B
 N1GwWU51eGZIZoVQEYjKYjIX/5CSBLEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=f18KfTxd2ee/FLiVA
 wFuokRjJ08yesny4jQNWrVyNVw=; b=AQbh0FsKTr3KZe1h5JRFSNOFrcugRnd4b
 mtXdGMDnJYpMsqbnPb9drX7+AvTIOzGRs40aiE+FSXDRBVvLie51XVF1yWYDEaau
 PLvDaWzaPEEsiDsYcCZ+7AMGArJz/wJ8Fl9dJaYSHyMXGDeuwDDuN3sQROgf9Hn1
 TemxmFG4m8rfLXctvCATboFJ5gmpC4qRaJZGPdZUNbh7gk6CQWamjb46Uf9nBcpX
 7RklCdC/3sFL9HFGmFRxw94BTLtljaPI1sRPhqqv23R6lE/Vj2nqV2PB8HojvbQK
 nJfPa+GHOIegOicMFYPjlyNCfbdMEjenm0sgaEdmnGPi7hMiRWe0A==
X-ME-Sender: <xms:VWQGYrtwK0Tshs80W34TYbjGrMaeIOh0VEqPxeMCVuTUiinEeDwCsQ>
 <xme:VWQGYscdIWxj5IESGwc4bd9MbOhN38KS8cWVoE1cq7R6ElR3kbfQ7UPbpeZyreC0P
 7DXrTb8mFtoD_2IlcM>
X-ME-Received: <xmr:VWQGYuzPrsd3AWzW-oeAldvo36mTpynuKMnxjWTJrXtxQLstyC2P_z3jmuyvql4bu_j0UsyfzzFmTO2A1OxevHs5VSxooceIB-LpK6I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrieefgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeehieefudethfevkeeigedvgfetjeeghfdvveekvdffueffteejtdejudffgfdu
 keenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:VWQGYqP7r65jkef-PkZxS59ZDYQI63THfVR5s2mSNJifUoz9lc0wng>
 <xmx:VWQGYr9aig0YMShfUaM6hb2bZScBCpNjyEjpuS_Cn7WTRjHLWrBSbQ>
 <xmx:VWQGYqXZatxWRvw0Q2Ws4Ta1lauwuqCoxHBkI1V023yz2xgu7EoCag>
 <xmx:VWQGYrx6EoZUihfZiROCiaG8lCn8nshZEBPtsFcaoVPxOXBolmzclQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 08:27:49 -0500 (EST)
Date: Fri, 11 Feb 2022 14:27:45 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
Message-ID: <20220211132745.h5vyo7b7hrq6rkla@houat>
References: <20220211130434.20732-1-noralf@tronnes.org>
 <20220211130434.20732-2-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yamwfma4skb5as4w"
Content-Disposition: inline
In-Reply-To: <20220211130434.20732-2-noralf@tronnes.org>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yamwfma4skb5as4w
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2022 at 02:04:32PM +0100, Noralf Tr=F8nnes wrote:
> Add binding for MIPI DBI compatible SPI panels.
>=20
> v3:
> - Move properties to Device Tree (Maxime)
> - Use contains for compatible (Maxime)
> - Add backlight property to example
> - Flesh out description
>=20
> v2:
> - Fix path for panel-common.yaml
> - Use unevaluatedProperties
> - Drop properties which are in the allOf section
> - Drop model property (Rob)
>=20
> Signed-off-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> ---
>  .../display/panel/panel-mipi-dbi-spi.yaml     | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel=
-mipi-dbi-spi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-d=
bi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-db=
i-spi.yaml
> new file mode 100644
> index 000000000000..4d017a36ad4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.=
yaml
> @@ -0,0 +1,124 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-mipi-dbi-spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPI DBI SPI Panel
> +
> +maintainers:
> +  - Noralf Tr=F8nnes <noralf@tronnes.org>
> +
> +description: |
> +  This binding is for display panels using a MIPI DBI compatible control=
ler
> +  in SPI mode.
> +
> +  The MIPI Alliance Standard for Display Bus Interface defines the elect=
rical
> +  and logical interfaces for display controllers historically used in mo=
bile
> +  phones. The standard defines 4 display architecture types and this bin=
ding is
> +  for type 1 which has full frame memory. There are 3 interface types in=
 the
> +  standard and type C is the serial interface.
> +
> +  The standard defines the following interface signals for type C:
> +  - Power:
> +    - Vdd: Power supply for display module
> +    - Vddi: Logic level supply for interface signals
> +    Combined into one in this binding called: power-supply
> +  - Interface:
> +    - CSx: Chip select
> +    - SCL: Serial clock
> +    - Dout: Serial out
> +    - Din: Serial in
> +    - SDA: Bidrectional in/out
> +    - D/CX: Data/command selection, high=3Ddata, low=3Dcommand
> +      Called dc-gpios in this binding.
> +    - RESX: Reset when low
> +      Called reset-gpios in this binding.
> +
> +  The type C interface has 3 options:
> +
> +    - Option 1: 9-bit mode and D/CX as the 9th bit
> +      |              Command              |  the next command or followi=
ng data  |
> +      |<0><D7><D6><D5><D4><D3><D2><D1><D0>|<D/CX><D7><D6><D5><D4><D3><D2=
><D1><D0>|
> +
> +    - Option 2: 16-bit mode and D/CX as a 9th bit
> +      |              Command or data                              |
> +      |<X><X><X><X><X><X><X><D/CX><D7><D6><D5><D4><D3><D2><D1><D0>|
> +
> +    - Option 3: 8-bit mode and D/CX as a separate interface line
> +      |        Command or data         |
> +      |<D7><D6><D5><D4><D3><D2><D1><D0>|
> +
> +  The panel resolution is specified using the panel-timing node properti=
es
> +  hactive (width) and vactive (height). The other mandatory panel-timing
> +  properties should be set to zero except clock-frequency which can be
> +  optionally set to inform about the actual pixel clock frequency.
> +
> +  If the panel is wired to the controller at an offset specify this using
> +  hback-porch (x-offset) and vback-porch (y-offset).
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: panel-dbi-spi

This could be further improved by using

properties:
  compatible:
    items:
      - {} # Panel Specific Compatible
      - const: panel-dbi-spi

To make it obvious we expect two compatible, and what the first one should =
be.

Once fixed,

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--yamwfma4skb5as4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgZkUQAKCRDj7w1vZxhR
xSDOAP0Tov4MG92o7XvnehNhfLKRHpZSRn4LTz83ZVEnexlUvwEAp8/GskKie33v
mTvde9M8LVC8pUJgL2NgBj/alUJPzw0=
=0Y4m
-----END PGP SIGNATURE-----

--yamwfma4skb5as4w--
