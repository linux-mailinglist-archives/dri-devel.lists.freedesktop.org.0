Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F4DB2E779
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 23:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB09E10E7FB;
	Wed, 20 Aug 2025 21:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hO63XzgC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFE010E7FD;
 Wed, 20 Aug 2025 21:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1755725344;
 bh=ZYmXWe6TcU4XRK0rHRezXUd3ygqj/SvPg85mvqxwbno=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hO63XzgC0HOe8rl8zT08VZ7dALn59sl2OnyOyafAsISSLgOwtWY1PFsGTEgP1dyzP
 CkwhTXKPMThwTpHSifkSE8DIGBQFarmFGdHNfpLNF/A9f9HqrxriIMveE+o5Wk9yFY
 wRib2ypijgkjZB/FqisHr1pM7cozTelxoe5VgBG9+OOAf32e9d9M+7dXF2jWvCMidx
 BSi1+ZTjpCQYNeP/2yif3JcUEJMFF6aeiCrUHpTYKELVjtf6kyB8vG4pMHEWppc+0p
 93QhEO1yVBmCyIuN2nliKpcSMjVE0/gXPbePc4fR0LeHGNYYUup7enqbtj8ZBfgGtd
 mVBJ7dPtQ/o7A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6fhw0V9Qz4wbr;
 Thu, 21 Aug 2025 07:29:04 +1000 (AEST)
Date: Thu, 21 Aug 2025 07:29:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Dave Airlie" <airlied@redhat.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Beata Michalska" <beata.michalska@arm.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "DRI" <dri-devel@lists.freedesktop.org>,
 "Intel Graphics" <intel-gfx@lists.freedesktop.org>, "Linux Kernel Mailing
 List" <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm tree with the
 drm-misc-fixes tree
Message-ID: <20250821072902.7a230ab9@canb.auug.org.au>
In-Reply-To: <DC76OGHHB0NH.2150TC0DHRN8A@kernel.org>
References: <20250820112144.43714c90@canb.auug.org.au>
 <DC76OGHHB0NH.2150TC0DHRN8A@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/achTr6dFbFgspk_=FCvdvd8";
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

--Sig_/achTr6dFbFgspk_=FCvdvd8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Danilo,

On Wed, 20 Aug 2025 12:30:14 +0200 "Danilo Krummrich" <dakr@kernel.org> wro=
te:
>
> I think this resolution doesn't compile, since attributes on expressions =
are
> behind an unstable feature flag.
>=20
> I assume your config does not have CONFIG_DRM_NOVA=3D{y,m}.
>=20
> The resolution in [1] is the one I came up with in the drm-tip tree.
>=20
> I should probably have given you a head-up on this conflict, sorry for th=
at.
>=20
> [1]
>=20
> diff --cc drivers/gpu/drm/nova/file.rs
> index 4fe62cf98a23,7e7d4e2de2fb..90b9d2d0ec4a
> --- a/drivers/gpu/drm/nova/file.rs
> +++ b/drivers/gpu/drm/nova/file.rs
> @@@ -39,8 -36,7 +36,7 @@@ impl File
>               _ =3D> return Err(EINVAL),
>           };
>=20
> -         #[allow(clippy::useless_conversion)]
> -         getparam.set_value(value.into());
>  -        getparam.value =3D value;
> ++        getparam.value =3D Into::<u64>::into(value);
>=20
>           Ok(0)
>       }
>=20

Thanks for that.  I will use that resolution from now on.

--=20
Cheers,
Stephen Rothwell

--Sig_/achTr6dFbFgspk_=FCvdvd8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmimPh8ACgkQAVBC80lX
0GzG3ggAhpCg4N/adzC9Wll12L8Giz65Otl8iwmjWFPSa6HvK/PYP6J2ykru9JUd
+Mgrefu37HrzrOswLuc/bhVKVZW2RrTAlTWNqcI8Nf3v7TVJADPz6utotStzxB8P
cs1S5WdrGySUpiSslV5IyFoBJg6ajfykGXuRn4uYxHCI0gjW0DIwwi9XycAHo9Qw
mtYQQE37HhF1A+gswTCJdG2kTKid4Gsdu2xrQk2AWDW7qjvpGQUFuP47Wg4wNHc+
4NU4pbkZnHNkYTGn1j303ua/x39yUu8l2BI0sXNS84YPDxQmWDCv9ESQaBVLhI/z
VecuxeVm8hce5qiV+GuBFGZG4Pxg4g==
=QFON
-----END PGP SIGNATURE-----

--Sig_/achTr6dFbFgspk_=FCvdvd8--
