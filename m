Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB5E924DE0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 04:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A9D10E529;
	Wed,  3 Jul 2024 02:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BrTosh7Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211D210E529
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 02:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1719974205;
 bh=0SHqF0dUovd6ss7dr8haTSOKzF2Sqk2aiA+Wo+YlUXw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BrTosh7QOfRCq2kxrXOrE8VmZbJ+puf5D3nORfbHKQFZ166stwB0wms/m3X4eyOFO
 Kr7n0OQysIE4CUVMEpEMBM8t0wDnDB2G9glSM8lOIIaIU6zJMpQiWvYgOEn1Ovlgex
 UEkrQ60MvhEBj2ekWFrKPsk9f7xvJt5XqbEhjyGZF0ESDf2slOcg4Ci13fW72gtdRK
 StugcFI0ly3iVCGkClfUtX8oXm2/1DdYc31ir1Q2zloNy7I97NvwGZACzBes6XlMxG
 uB9wk9zd5xi2mfvy4ZnuSqsdXLOVejNqlNLiDf7M1Qf5jEQekJi87DoW9obsXnX4+H
 LtJl48F11Yshg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDP704HvCz4wbr;
 Wed,  3 Jul 2024 12:36:44 +1000 (AEST)
Date: Wed, 3 Jul 2024 12:36:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Mark Brown <broonie@kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 Piotr =?UTF-8?B?UGnDs3Jrb3dza2k=?= <piotr.piorkowski@intel.com>, Michal
 Wajdeczko <michal.wajdeczko@intel.com>,
 buildfailureaftermergeofthedrmtree@sirena.org.uk, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm
Message-ID: <20240703123643.5b4dc83f@canb.auug.org.au>
In-Reply-To: <Zn7s611xnutUFxR0@sirena.org.uk>
References: <Zn7s611xnutUFxR0@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yaBhn/0VkwjWMaUO2AGJq8U";
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

--Sig_/yaBhn/0VkwjWMaUO2AGJq8U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 28 Jun 2024 18:03:39 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> After merging the drm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> /tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c: In function '=
pf_get_threshold':
> /tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:1788:27: error=
: unused variable 'xe' [-Werror=3Dunused-variable]
>  1788 |         struct xe_device *xe =3D gt_to_xe(gt);
>       |                           ^~
> cc1: all warnings being treated as errors
>=20
> Caused by commit
>=20
>   629df234bfe73d ("drm/xe/pf: Introduce functions to configure VF thresho=
lds")
>=20
> I have used the tree from 20240627 instead.

I am still seeing that build failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/yaBhn/0VkwjWMaUO2AGJq8U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaEuTsACgkQAVBC80lX
0GxrbQf+LSBGQ52sQ0YfN9wr5fTIjIq/ntnbwl+hoEnKZtBUjmaiPZWEoWXYnmbG
oKgUBRZvVBAKjxpb4hwV4aVdvQGWKDe4FjD+AwUeevutrFEeZEGI2ZQBLfHbFC6x
+kio3gEHjh/I5VOIgeaDToOo47JLKvArn5Bu69nZgMZIaOVectLT74KrE0TP4L4a
V5Ey0a2C4MXXbTC+zZWP2Y9AX8LgvxE5wGOkRJ5pN7C0p5Ff8UDYwEXBEQ/T6SRF
E3ejRAGuWP5FVOe6gGDeC2FEeBQfrCVrnIzCq7aqNiZIyW3lrXTFHQo3atFYwekB
gk25zepLUnHaYJPhIXoYZw0eLsGC2g==
=efJw
-----END PGP SIGNATURE-----

--Sig_/yaBhn/0VkwjWMaUO2AGJq8U--
