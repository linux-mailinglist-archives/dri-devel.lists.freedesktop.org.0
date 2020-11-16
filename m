Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBFD2B3AAE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 01:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F2889D73;
	Mon, 16 Nov 2020 00:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AB189D73
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 00:01:31 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZ8PN4XcLz9sRR;
 Mon, 16 Nov 2020 11:01:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1605484889;
 bh=3TJ+uhMg//iK6QrVgIKwTAVbcFD1Pz5T71IObVLaifM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jlz29JWTINun98yqF+LxldA6XNTU84ramTMuTX4bdcyWCepkQnMcq+SYC1nvXXb7R
 alSyMtJeshAvyU88XRQVrz6to/91/wraFXMq3moCaBRPWsYvp3nllxYfAti7xPIUIa
 rqo30/uSw9c1ZSRkhQSwd3+ZtV0Uo9CAgoRGOhyp/37CvX90h73y6hSHfmeqEC+o4K
 JyYMGDP4NuZLhKDeHlvCzmqBda0LqWF6O2M6qNXe1PbBQQa4L54E5de7bc9/4YTG3h
 A/Rbvz/hzY4fcwLC0j5AKSKrEyo1ogCe8o+8jdGechxmi8/Wa7fcJVa2BAzfWgj4PJ
 Nwq4lANkqwQcA==
Date: Mon, 16 Nov 2020 11:01:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20201116110127.256b5a2c@canb.auug.org.au>
In-Reply-To: <20201105180250.549f2eda@canb.auug.org.au>
References: <20201105180250.549f2eda@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0457982729=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0457982729==
Content-Type: multipart/signed; boundary="Sig_/cTWeLK16nf7CLNMo.5JdCH8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cTWeLK16nf7CLNMo.5JdCH8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Thu, 5 Nov 2020 18:02:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the drm tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> Documentation/gpu/drm-kms:466: drivers/gpu/drm/drm_crtc.c:236: WARNING: U=
nexpected indentation.
> Documentation/gpu/drm-kms:466: drivers/gpu/drm/drm_crtc.c:237: WARNING: B=
lock quote ends without a blank line; unexpected unindent.
> Documentation/gpu/drm-kms:472: drivers/gpu/drm/drm_blend.c:203: WARNING: =
Unexpected indentation.
> Documentation/gpu/drm-kms:472: drivers/gpu/drm/drm_blend.c:204: WARNING: =
Block quote ends without a blank line; unexpected unindent.
>=20
> Introduced by commit
>=20
>   5c759eda9b04 ("drm: Introduce plane and CRTC scaling filter properties")

I am still getting these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/cTWeLK16nf7CLNMo.5JdCH8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+xwVcACgkQAVBC80lX
0GxYwwf/a8n+rl2rMjBjpPIRBDSENPHIPQSyTehzHMi5K4ZFIcdKpva+WzRgCrMN
f2GftS9lWBQ4SYBwRcudafORsBV0wl5cIFc2giKbUA3D7W3UCg1O0XOhxEhE6QJ3
3Cj08B3V2NxsLXH7Y0z8tEayMX/kOXnhclTGsKVU2wBk/XjWiS6InYT4i0a6dBFL
YqzUYZO70gaXe3Ik1B0pDUlQbC0sf1bVefToAHsbpxVnOYWxcEUT6vNaDhTvjbO3
Ee9eJJ1SNzq1cXHWfVx/nZ9lZjftEcb7ChgkysfjFn7tTGpbbatc1Dj6gMG0z/y1
ZM6ks8GXvLSYjU8nnXfkUAlHoK4WZg==
=9f6T
-----END PGP SIGNATURE-----

--Sig_/cTWeLK16nf7CLNMo.5JdCH8--

--===============0457982729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0457982729==--
