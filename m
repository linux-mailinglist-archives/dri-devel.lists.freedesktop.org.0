Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8FB74FBC8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 01:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE4B10E462;
	Tue, 11 Jul 2023 23:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A514D10E462
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 23:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1689117436;
 bh=Voycng5tZl4fvMvrRllI4DTHq2vqvF3FID/GJjuQmfw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pgywdPrbFHSvgsYXbZwkbENzKappkSgyVAUVqL/yn3jgqSrhACfOohR/trlHvIg9b
 0ipappMwktMz1xGHxkHBFEc1/gv1SGbySN+b7Sqj9wHeEhhnyMf4+wUE5+3U28zEKU
 VpDrrUkEcE4FBgxYrq8LBrTCTyiXTiW8jTv0/YRM0bf8qBf5OO4Gwzocb43t7ZAUhq
 2dE35DDGvSkucZ8x7p+Xgu8Qa99BAC3cdSJVblurJQ5Z7LOh9GPPeB4M69XCcBF/kS
 KgkUcLUDUTUOqqK80LyT7KbKM/HjoLctJb0EOmGAAWSxQcqdrPg72ue98fEwmYh+X7
 dz432SuSsz5bA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4R0xbb4pvFz4wxW;
 Wed, 12 Jul 2023 09:17:15 +1000 (AEST)
Date: Wed, 12 Jul 2023 09:17:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20230712091714.760c00c8@canb.auug.org.au>
In-Reply-To: <CAJs_Fx67+VQwveGE3i7Nyp+5R2+Z5mEeDJ9ZMTZEY_gnYtc5Sw@mail.gmail.com>
References: <20230330142818.7efb6d05@canb.auug.org.au>
 <CAJs_Fx67+VQwveGE3i7Nyp+5R2+Z5mEeDJ9ZMTZEY_gnYtc5Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IPwrynDl08lDiJT.Ja=Mn=j";
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
Cc: Rob Clark <robdclark@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/IPwrynDl08lDiJT.Ja=Mn=j
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 30 Mar 2023 07:28:26 -0700 Rob Clark <robdclark@chromium.org> wrote:
>
> On Wed, Mar 29, 2023 at 8:28=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.o=
rg.au> wrote:
> >
> > After merging the drm tree, today's linux-next build (htmldocs) produced
> > this warning:
> >
> > include/uapi/linux/sync_file.h:77: warning: Function parameter or membe=
r 'num_fences' not described in 'sync_file_info'
> > =20
>=20
> thanks, should be fixed by:
>=20
> https://patchwork.freedesktop.org/series/115871/
>=20
> > Revealed by commit
> >
> >   d71c11cc79d2 ("dma-buf/sync_file: Surface sync-file uABI")
> >
> > Introduced by commit
> >
> >   2d75c88fefb2 ("staging/android: refactor SYNC IOCTLs")
> >
> > in 2016.

I am still getting this warning (presumably now from Linus' tree).

--=20
Cheers,
Stephen Rothwell

--Sig_/IPwrynDl08lDiJT.Ja=Mn=j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSt4voACgkQAVBC80lX
0GzKkgf+KCDHS4286YMtNrzJXdU74fTZ8wo2CzZapGQammrSXXE4/t+0ck9vW5ov
NO5N2WYWcMBLUCzepn0csMeb5UMC071rw5slJ0otTVdFYN5xZXAPT7K8KY8wHe/9
bVLor5rpDzWTwLGYizGBYlyMEQyA08rAbsE64fIvQ4C4AlCSz9CfVeSoy9rp/V5/
pu4K0cyVkhi82rwLMh5/Ups80aWkcfNog1w1fyR05M1gYB319F2J+l2tbt4C53x7
f8acMjTYu5CbZUVK3xUve90OfaW3OQfDpku7XbiDEl+288DosozvLEAYR1F3skBv
+FuKdqz/m3d5P23Ko3xoZmNMo13www==
=0jac
-----END PGP SIGNATURE-----

--Sig_/IPwrynDl08lDiJT.Ja=Mn=j--
