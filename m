Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CD1B0BB02
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 04:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D9610E07A;
	Mon, 21 Jul 2025 02:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZAb0OIVH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774A210E07A;
 Mon, 21 Jul 2025 02:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1753066091;
 bh=QNKPkR2IJqZgKeF82v1S1nbLIbKYi2iW05d4A11rPKc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZAb0OIVHKhFHrxQ5QF+hV4vy/gxSCkOoSC4VlH7qLZ+ERv9B/6YXgs8MYAMJEEX3p
 7amtT5TIxHdiI+116xwuNiEpmLkrkJawbXnLi/nQza21FmQU4DJFf08gZAO9N84s6H
 obr2Gu5NKTT+GyxK1zMgGBs9GTZFzEBtzUEA+TpCzTX5jhUmymz6epucTUS/IFTk3f
 OZ6NwGFEyhF+vH6HhavBpgjJkebrCnmRdnakbiwCV4+8MXUsvhG1no174ISBUZrsIf
 6o2HpI/mgNpscddDRahQSBfupHfy4WYn1eTzxVOkB0sfUYtIM1Gdht3bGF7+YXDqtn
 nQNy/cR/qr4kw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bllFQ0bwCz4wbb;
 Mon, 21 Jul 2025 12:48:09 +1000 (AEST)
Date: Mon, 21 Jul 2025 12:50:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20250721125039.170209b4@canb.auug.org.au>
In-Reply-To: <20250716142322.3a681368@canb.auug.org.au>
References: <20250716142322.3a681368@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bJ7l2V_5C4uQGTi4426rdUR";
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

--Sig_/bJ7l2V_5C4uQGTi4426rdUR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 16 Jul 2025 14:23:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c
>=20
> between commit:
>=20
>   61ee19dedb8d ("drm/etnaviv: Protect the scheduler's pending list with i=
ts lock")
>=20
> from the origin tree and commits:
>=20
>   0a5dc1b67ef5 ("drm/sched: Rename DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_=
SCHED_STAT_RESET")
>   8902c2b17a6e ("drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the =
reset")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (I used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/bJ7l2V_5C4uQGTi4426rdUR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh9qv8ACgkQAVBC80lX
0GyTfAgAnocNOglVpKszMsdTmlrcycE4sIklH32mbXHUmwFXT6wPM3NYShGrmbOH
T3hsIa7KaEM4Wr6SCS8VbGiqQUqawmn8D+YSXG2yqasWy8yiNlv+mkcTnHKMQhsL
xBs/E9QsaF2c5R7onm9+oYQsOCIwwcAhKKB7hSm7z3jj+vey6RGP/AbR+Dkho/TE
iNgSefonk+15op/NO/EhfvX0zWjDEeXlTse1wAyIOV1bLuxT5NSiT5NzwnyMlRqX
Fw6eARCmbFg6qm8UPY9/t5ewpsGWd8EoeXTJBkbds75KOs4Ht6wim4Rf97nhVVJq
M0LcT8Tr18FNY74NoAZ4K7ZczpjIiw==
=hkH7
-----END PGP SIGNATURE-----

--Sig_/bJ7l2V_5C4uQGTi4426rdUR--
