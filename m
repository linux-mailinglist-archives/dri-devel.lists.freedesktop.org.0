Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441794B2711
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 14:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5313710EC25;
	Fri, 11 Feb 2022 13:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8407810EC25
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 13:28:28 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 64B633202010;
 Fri, 11 Feb 2022 08:28:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 11 Feb 2022 08:28:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=LVaL0oZjNN2nlFiERRO631NJvt9v3Bn6gFKSM0
 SpSw4=; b=eSRvzw2vE23XtgiKGafcx+sZUPUJzfygI1RpGjpRhn0sqxxCyCqBwj
 NrBheJppRKLM09umdgrK7wUAWz9SuM1My+uw01kIocl9JajQyjqHbWBY13pQtEdp
 KlsV4j10oNxfPBBZjux+8Fvc69ZIVGdwkvRytw6vVUojQM1RlajZ8NSBIVkSSn9b
 7LtZrMzkYo0PA/jLR5PgZHyIGTa2gbE/ZkLuxHNJnIDtMIP49SKBu2+SkCJDCXyU
 J1RhnyXDTqJ38quCooOKGsCSkuPTbVkphj98Ntl2E5PApntIx9Ej0OM5DDpmNCtX
 guf2sJ/taR/OwI7eNwGEakXNUdYeqfQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LVaL0oZjNN2nlFiER
 RO631NJvt9v3Bn6gFKSM0SpSw4=; b=ancHwhDkqaQKHzr+uwkAZUmG20MCe/IfL
 4zlhTSC83L0tELHZ8i8GgOg4868P7fb5dcxfVq6UiSf6bSQeO84/GIvRW9DPIybJ
 pvsf0Ugun6DOoIgO0QYupS4f5TMp43NZ/bB+SvY15FPkpzD6s8EYzqFHFjkS92Hi
 0tR9XwytYadxQ2g+ov4fkHdp0r3PxOS8WvLLVqnTX/bMYJLYoXcDFlmrO11zB0E/
 6ZDM1bm8bPBMUwJhO0pUFeYVbOtHtP/kFfHcUruNnweGSim8YHxibC3aWNe4VkZG
 Jn7EJU/nYtNNKUBQKiJmsuF4A4n4COMI3T0l4j7Wm+r0lZ1l8EYTA==
X-ME-Sender: <xms:emQGYuhmzUJHtIGhRq_66JRU7PzCNglHCfP-593JfCAEbv-zfPg0YQ>
 <xme:emQGYvBcv1Ht5tOZDWf15f6Njv-HFY6rvQN_GzoBzirEP5bfn_oQ9NK6_LzSx2swa
 e7wljVJvPHgcybGQC8>
X-ME-Received: <xmr:emQGYmGKmoBlOjF5nFAYjRNstNlWqg2SdmRlTWI9O9jTr-wut7qU5HeN_Ixd3tqT3S00O3KXojsu5snjbkp52BXzrXjD_gsQqpyHfG4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrieefgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:emQGYnR9b474h3tdzmxIEVhCZ6iyfSQbYHwIsd-FgglKhO-Vd4qJGA>
 <xmx:emQGYrxmYku-GH2JaWZLHBwMJwUqohaE6CSVc4qoC0adBcNX7PU6mA>
 <xmx:emQGYl5Cab_SLhhap7CFVEV5ZONRCzk0K1hL8HOuUr2kMWbjjnxBkQ>
 <xmx:emQGYilWgt0pbaWfQbxbGIn5vYQ-6AZTVk7f2Q40fdPUx7TZID1IFg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 08:28:26 -0500 (EST)
Date: Fri, 11 Feb 2022 14:28:25 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v3 3/3] drm/panel: Add MIPI DBI compatible SPI driver
Message-ID: <20220211132825.7or4blrr6o7um7jf@houat>
References: <20220211130434.20732-1-noralf@tronnes.org>
 <20220211130434.20732-4-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="g25a6v77b7y56qgc"
Content-Disposition: inline
In-Reply-To: <20220211130434.20732-4-noralf@tronnes.org>
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


--g25a6v77b7y56qgc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2022 at 02:04:34PM +0100, Noralf Tr=F8nnes wrote:
> Add a driver that will work with most MIPI DBI compatible SPI panels.
> This avoids adding a driver for every new MIPI DBI compatible controller
> that is to be used by Linux. The 'compatible' Device Tree property with
> a '.bin' suffix will be used to load a firmware file that contains the
> controller configuration.
>=20
> Example (driver will load sainsmart18.bin):
>=20
> display@0 {
> 	compatible =3D "sainsmart18", "panel-mipi-dbi-spi";
> ...
> };
>=20
> v3:
> - Move properties to DT (Maxime)
> - The MIPI DPI spec has optional support for DPI where the controller is
>   configured over DBI. Rework the command functions so they can be moved
>   to drm_mipi_dbi and shared with a future panel-mipi-dpi-spi driver
>=20
> v2:
> - Drop model property and use compatible instead (Rob)
> - Add wiki entry in MAINTAINERS
>=20
> Signed-off-by: Noralf Tr=F8nnes <noralf@tronnes.org>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--g25a6v77b7y56qgc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgZkeQAKCRDj7w1vZxhR
xedvAQCDkrYvU6FhjOWlUgb6KI54jCuobneFSC4S6W6a+XOtIQEArefCOAAxWjUa
Ih3CQbp4Wi5svfMv61CggDzZnDiNHw0=
=8qWf
-----END PGP SIGNATURE-----

--g25a6v77b7y56qgc--
