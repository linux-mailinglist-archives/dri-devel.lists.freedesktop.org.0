Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB3150EE3D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 03:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888F710E2A0;
	Tue, 26 Apr 2022 01:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025C510E303;
 Tue, 26 Apr 2022 01:48:32 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KnPt22mnPz4xLb;
 Tue, 26 Apr 2022 11:48:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1650937707;
 bh=9kBhR8QSUgvJZYnXsARchbPfp7Jz9CUax/1FT05p1lA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Nh89AaDkqmpMgnPTvTYxJZIaoHWXHQrt09qUESfqG1L33T7CadwFMY6nDTSOylOO/
 +Mgo1zvutf1AatIgIKLXZvGbYAtGaWuFBspjffWb3KXC1ThItQnxqtd6c0AA9Rdbg0
 mN7lDCIv7mlavS91/Avbr6PPwaIg41Vx5JgZo/ERW6ko6oY77L3FnbnGkpDO8WoRoC
 9bzpDVF3gkET4JZNgHQz5aZu1c1tE02r4IJfV7akO/cx5XWN4DLD8xSCX6S3U6xcIn
 Nu4nVcePRXJvg+kYkXcrcW9bC9PdNO9XzLZ6DzugmMzyeAVjY4YmZqQBIrqtv491PE
 AB8dLgTmDbPfQ==
Date: Tue, 26 Apr 2022 11:48:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Message-ID: <20220426114825.7a07c67c@canb.auug.org.au>
In-Reply-To: <20220414094715.4c2e0127@canb.auug.org.au>
References: <20220414094715.4c2e0127@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YL0fxYxeUKXBwDs+mgbDYqx";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/YL0fxYxeUKXBwDs+mgbDYqx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 14 Apr 2022 09:47:15 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/radeon/radeon_sync.c
>=20
> between commit:
>=20
>   022074918042 ("drm/radeon: fix logic inversion in radeon_sync_resv")
>=20
> from the drm-misc-fixes tree and commit:
>=20
>   7bc80a5462c3 ("dma-buf: add enum dma_resv_usage v4")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (I just used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/YL0fxYxeUKXBwDs+mgbDYqx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJnT2kACgkQAVBC80lX
0GwXPQf7BQigK2+/T5d8A50Z/8M751oZO4FLYt30HQT8qgT98F/AjQcYo6eTKEQx
iqvQfCBGkHv2tjMT1BDykx0VyWFAEZ60BG26odiFZ7Qoelx7/MYdbYe5MPurGEr1
r/xaWxAgmJDg6JzNYbyDLEFAb3Q1Ofa8TyggINUuPitYHR+m821DRSgLwa2ZaAVA
+tGhybE04y85sV1Sme2LhbF6lvrhG4lYe6QoPWk2/MRrmaQgsgvOVagMjsFo6YJ9
Eg1HTePL5GopCLA1dyHaA5wWtQvMNj+Vy5d2LKRyQZZrdpbk8Y41MkhAdkN+McCK
YweRcvJgHysqZ7WQt5nt5czwLp8XbA==
=McuI
-----END PGP SIGNATURE-----

--Sig_/YL0fxYxeUKXBwDs+mgbDYqx--
