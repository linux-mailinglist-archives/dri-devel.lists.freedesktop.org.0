Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E757870AAE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 20:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF131124EE;
	Mon,  4 Mar 2024 19:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LvYNXVFR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EC91124EE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 19:29:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 205F7CE13A0;
 Mon,  4 Mar 2024 19:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF2CC433C7;
 Mon,  4 Mar 2024 19:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709580550;
 bh=V8gmN+cucgc/503pO37ENBKhzWyVzgTTUpxzw+uscCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LvYNXVFRMh4C/CW9oQo7AnwCsurlRlFLoO3zdy8DQqw+gA/tTAU8+Hj3CAXE9kqE2
 0kDm4U3+4fQNf5PMRJuQdxVQWwkqjMxbDWXg6MOpuTgmkUbYMGDXQ0aFEvF0sLQrr6
 idA/WDl3GfUewLIDCNhnjjXns2Jd6Lg7ylYgCa+/DbunU2ExrE3pq0G8RwmYbjDqTt
 mq8/I3WRbuDmkLnEEqCTqtw3x5SjEVnlTlTHEg1SiqdHZrTOAjddYiv3W2ktfUt/Ku
 x6DNCc+y5658KPyzjutARzwEZIsZ2B8ci7e/ImBtYazayHt1u64lI67/lXAYOJhFDI
 L3rZy45BO7kkg==
Date: Mon, 4 Mar 2024 19:29:04 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?J=E9r=E9mie?= Dautheribes <jeremie.dautheribes@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>
Subject: Re: [PATCH v2 0/3] panel-simple: add support for Crystal Clear
 CMT430B19N00
Message-ID: <20240304-drivable-property-feaeba782880@spud>
References: <20240304160454.96977-1-jeremie.dautheribes@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rI073bo/OhsyVdFq"
Content-Disposition: inline
In-Reply-To: <20240304160454.96977-1-jeremie.dautheribes@bootlin.com>
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


--rI073bo/OhsyVdFq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 05:04:51PM +0100, J=E9r=E9mie Dautheribes wrote:
> Hello everyone,
>=20
> This patch series add support for the Crystal Clear Technology
> CMT430B19N00 4.3" 480x272 TFT-LCD panel.
> It also adds Crystal Clear Technology to vendor-prefixes.yaml.
>=20
> Please note that unfortunately there is no public datasheet available
> for this panel.
>=20
> Changes in v2:
>   - add link to the Crystal Clear Technology website in commit message, as
>   suggested by Conor Dooley and Neil Armstrong.

You forgot however to add the acks that I gave you for the two
dt-binding patches.

--rI073bo/OhsyVdFq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeYhAAAKCRB4tDGHoIJi
0nAcAQCc3o01bI3Ifa5xoNkCxhVQ62sJgXDVhXy3VZlzzE4KmgD8D61G2EON3aLG
RtxPHF0vPEGYsIXGqwyz/wkAwB4j3w4=
=fyIn
-----END PGP SIGNATURE-----

--rI073bo/OhsyVdFq--
