Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9108C2F7C
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 06:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFFD10E01F;
	Sat, 11 May 2024 04:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XDWZGbtt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA7910E0EC;
 Sat, 11 May 2024 04:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1715400976;
 bh=UqzBiM388HTXlF76lTgKaIUcO6NDM2h6/IHU8fyzD/g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XDWZGbtt34u41ia4rstlx0cdeoBp+jY81LOjbmzcKo6hRc8EKoPcfncfQ9Q+Mfk0K
 05DmRLSE0QIvk7bguL7e3PTiJ3TePlJpKLRBowBHxyEucHfx1lkdNjLMZDweYrP79p
 lvwTMMecnMmCH5byPAv7SD1ATWO6K2BGtmnIxgbAp6iDcq9rkEmutiK6TR7yaD0Ppq
 E5kktpdjcN5ZG7XLaoOm2zAWGOFLeAEOjP9rwHB63VMsQfqzkSPX9wFpp9xlFNzYbE
 +8jo+luzqcaTTUtZfQewK3p9j/K0melWG3Pn0agnP5la/FAVHh8ZXZ9/Q//nn2bc+H
 fkD9DcnwhRDUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VbsrJ1x45z4wyl;
 Sat, 11 May 2024 14:16:16 +1000 (AEST)
Date: Sat, 11 May 2024 14:16:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/amd/display: fix documentation warnings for mpc.h
Message-ID: <20240511141615.6074b4e3@canb.auug.org.au>
In-Reply-To: <20240511133717.23263f55@canb.auug.org.au>
References: <20240511000203.28505-1-marcelomspessoto@gmail.com>
 <20240511133717.23263f55@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qKFmv9PJ/f=pSASv0qkp7d_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/qKFmv9PJ/f=pSASv0qkp7d_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Marcelo,

On Sat, 11 May 2024 13:37:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Thanks for doing this.
>=20
> I haven't tested it, but just a couple of little things:
>=20
> On Fri, 10 May 2024 21:02:02 -0300 Marcelo Mendes Spessoto Junior <marcel=
omspessoto@gmail.com> wrote:
> >
> > Fix most of the display documentation compile warnings by
> > documenting struct mpc_funcs functions in dc/inc/hw/mpc.h file.
> >  =20
> 	.
> 	.
> 	.
> >=20
> > Fixes:
> > b8c1c3a82e75 ("Documentation/gpu: Add kernel doc entry for MPC") =20
>=20
> Please don't split the Fixes tag line and also don't add blank lines
> between tags.
>=20
> I also appreciate being credited for reporting (unless you got a report
> from somewhere else as well, then maybe credit both).
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

Now tested.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20240130134954.04fcf763@canb.auu=
g.org.au/

--=20
Cheers,
Stephen Rothwell

--Sig_/qKFmv9PJ/f=pSASv0qkp7d_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY+8Q8ACgkQAVBC80lX
0GzHyAgAgFe0v9n7X56CQIErsjX2qaxg0NhHm4Ql/rL+uAw7HtBtM/+a3JY2XFYS
yqvq45JGRXmkLmV4OX0Nn/8T39GE63bK0w+OcuqUEhR4wVW53ZMBpZipbHQSUkI1
R2M2TO5ammPUTeyFXWbRa9tSubvYN3gRnCwSmwHVV8aC56xR30Fuh/+OHK3Y0JQn
++Gd/pd1un/YU9Wx/4cnaYx2E0iepU2Kr+OBae4hdZ4G4UoGrk7VYbER59zt69O3
EnDDnxdHc/MEDdBD4nqVaPxq/WvpCTjHeQgHe2HHtkEd00G5IBhL7BkwmgNGIcxL
XLzVWN7kGD2tHL1+hH2Gj7lz7rFk/Q==
=4rJh
-----END PGP SIGNATURE-----

--Sig_/qKFmv9PJ/f=pSASv0qkp7d_--
