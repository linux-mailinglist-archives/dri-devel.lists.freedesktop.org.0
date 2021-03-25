Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4FC348BE0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 09:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9526ECE1;
	Thu, 25 Mar 2021 08:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905686ECDD;
 Thu, 25 Mar 2021 08:48:11 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F5dzX3HCBz9sRN;
 Thu, 25 Mar 2021 19:48:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1616662089;
 bh=tBQ4T2YDxZqLXKQJjgKq5hPoZEs+OKSjOiS/UCGOD5w=;
 h=Date:From:To:Cc:Subject:From;
 b=ZjrpqsUpqr0IG/sEGIXXvVf+ugcxyQipukI/vAuV1rEJcD0Lw/NRizTo+DfFRVSMw
 fB52CF+26PP2A6aRM+ArILscr0gha/TgxwjcCYqvPkFYx/YX7IEDO53Fv6uXALVFaz
 QbNfOXCgq6W1cQo9LX5dpSIwIbJIJ0Rg5e47kH/vFFEPbk6Uxr3ojZyRhznPBhMQyl
 LgHjujyqcRW9xvjVnCa9sCvBv1EUF+m1mCOnhUgIwVKLYO5JSTH8KD1C/z036hTNpT
 5mNISLgk3Oz0dVpBe8tiaNamlYpu+1qhbuunIjlLKTWBRChu8/wWd+lsT2JpVzPByG
 IgVM04T04sIjQ==
Date: Thu, 25 Mar 2021 19:48:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: please do not base your tree on v5.12-rc1-dontuse
Message-ID: <20210325194807.38ec3c55@canb.auug.org.au>
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
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Type: multipart/mixed; boundary="===============1448142985=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1448142985==
Content-Type: multipart/signed; boundary="Sig_/aK0egOh65TcUD3jC9tmu2u/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aK0egOh65TcUD3jC9tmu2u/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The latest version of the drm-misc tree consists of just 2 commits on
top of Linus' v5.12-rc1-dontuse tag.

--=20
Cheers,
Stephen Rothwell

--Sig_/aK0egOh65TcUD3jC9tmu2u/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBcTkcACgkQAVBC80lX
0Gz0VAf/ec4qbMsu5RHLC74gvf4aVusT7kTGpKjmo8fDjuc+wg7Z+qHAy2bHDXBR
LQToSER6kZNssqydbqS9pW08EfWSOlXUQIe/ornNdpWUz3jG7chGLI1yU/cHcZgC
5wN+lBLRxDpJ+uF/qbnDbRO6IQJAuvG0z0t9uVPeOPQlrNgGh16G8p3uqFX83pBZ
UBZHdaxG6EiS1v8IzXroq71zBfzUcx7x3azse7R3erSsLQo6nYEf8A8QdUZXUZ/5
ffW1sJPBn0H5EkBitBxwwKQk3/nUUl1f1GUbkFz8llXaiA3q1sl0YWRXV7rs4C/e
YnakxYCa60uMXoZSsAJwv9Mlx075YA==
=9NvJ
-----END PGP SIGNATURE-----

--Sig_/aK0egOh65TcUD3jC9tmu2u/--

--===============1448142985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1448142985==--
