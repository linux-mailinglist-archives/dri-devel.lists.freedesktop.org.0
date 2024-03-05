Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9E287289F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 21:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B628C10E48C;
	Tue,  5 Mar 2024 20:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VodZSlly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C2810E5B2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 20:25:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 949FECE1EF5;
 Tue,  5 Mar 2024 20:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F29C43390;
 Tue,  5 Mar 2024 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709670326;
 bh=j7E+4ilNyI2ogqO9xhojvzYBsle7e7wsgBy4bElHkbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VodZSlly5fm4dpOGfW8UXP9Sqzd7xlx3YIeZ2atQCQw2EnmvyU8sYtWMGsvZOaB8P
 20UOrJ97Y9+2xaTtJdoFAi2wrEZ6n9WEbPE0KlIkYMrOiqkY4fEj7mhSqWsu81KEQR
 tbTEMPCSZkAZki6sJ8PhTLWOtHK6DqfNAF/0JQmFLQsVxzPhUfDLx4GyGXifW8Y1L8
 a+j0KcgiHi9zPJcDGvLrPV/ZAVuWSGRDKQhQgoTgx11Vf7TzxadU2FHxXO4VURTpWA
 WKYfJNuacU/2leQ06iQDkdlw55pqn24CPuw/M3DEoN+qbU0kB5T+HRtKsLDQB6mkPT
 VJQhb7E+H9Img==
Date: Tue, 5 Mar 2024 20:25:21 +0000
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
Message-ID: <20240305-hacked-udder-6d8396015ad5@spud>
References: <20240304160454.96977-1-jeremie.dautheribes@bootlin.com>
 <20240304-drivable-property-feaeba782880@spud>
 <5c3acbaa-dc95-4f8a-87cf-c62b6ccc442c@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OnU1VrWnwRjDQ5qV"
Content-Disposition: inline
In-Reply-To: <5c3acbaa-dc95-4f8a-87cf-c62b6ccc442c@bootlin.com>
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


--OnU1VrWnwRjDQ5qV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2024 at 10:48:56AM +0100, J=E9r=E9mie Dautheribes wrote:
> Hi Conor,
>=20
> On 04/03/2024 20:29, Conor Dooley wrote:
> > On Mon, Mar 04, 2024 at 05:04:51PM +0100, J=E9r=E9mie Dautheribes wrote:
> > > Hello everyone,
> > >=20
> > > This patch series add support for the Crystal Clear Technology
> > > CMT430B19N00 4.3" 480x272 TFT-LCD panel.
> > > It also adds Crystal Clear Technology to vendor-prefixes.yaml.
> > >=20
> > > Please note that unfortunately there is no public datasheet available
> > > for this panel.
> > >=20
> > > Changes in v2:
> > >    - add link to the Crystal Clear Technology website in commit messa=
ge, as
> > >    suggested by Conor Dooley and Neil Armstrong.
> >=20
> > You forgot however to add the acks that I gave you for the two
> > dt-binding patches.
>=20
>=20
> Oops you are right, I'm sorry. Should I send a v3 containing these acks?

I was going to just provide them here, I just wanted to make sure you
didn't intentionally drop them first. But in the interim you got some
=66rom Krzysztof, making some from me redundant anyway :)
I wouldn't bother adding the forgotten acks or resending, I don't care
about my ack count :)

--OnU1VrWnwRjDQ5qV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZed/sAAKCRB4tDGHoIJi
0vLvAQDO/sy0qtDDk88ASr2plItuCqG83Rp3/buiOkwrdMYpAwEAqhujH3JiXO3I
7dfR2aeehYrL5n3pZkBJD/b4l8QCSgM=
=HgAm
-----END PGP SIGNATURE-----

--OnU1VrWnwRjDQ5qV--
