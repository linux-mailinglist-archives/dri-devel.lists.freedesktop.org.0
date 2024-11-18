Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B1E9D085A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 05:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD21410E23C;
	Mon, 18 Nov 2024 04:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kQFgBWdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E5D10E23C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 04:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1731903248;
 bh=d+tL0KwV1n4w0y+aQKArnpxFMg/v7LoAmZuEToUallo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kQFgBWdIqDRyMo+1efplIwL+XPWvPLsSMJUskwRSFsn7XB6tvPglNWk8A46ENsYcQ
 ZcjPk+psEpvifed84X8FNvag5RwoJFPJyRd4+Jiuwj+AOgY6cP6bDqNd2CMHdMFYcY
 Wz0uv5RBMl7KRPtQo2YHMBvh+5whTZtVqfSGN2vy29P/HIXncpH7F/DUV9O8aFHOKG
 vMzO+cy2o8o4mYi65130aPI+2+Q8mKnoo2kg3W3XYzZ5NYcpj0TB2Ozp/ylYpsI6g8
 5Zrn1sxQB2+E0aqLCblAsayTaZzp442QlTV9n7OLl0B9MjTdfe9DzsRlbsabNnFkAA
 T8/445ZmTlAjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XsDlg5t2mz4x8m;
 Mon, 18 Nov 2024 15:14:07 +1100 (AEDT)
Date: Mon, 18 Nov 2024 15:14:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: [GIT PULL] random number generator updates for 6.13-rc1
Message-ID: <20241118151409.2a6a2333@canb.auug.org.au>
In-Reply-To: <20241118020939.641511-1-Jason@zx2c4.com>
References: <20241118020939.641511-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pLR6yKQ2jdQD0mFZy7=ShCJ";
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

--Sig_/pLR6yKQ2jdQD0mFZy7=ShCJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Nov 2024 03:09:39 +0100 "Jason A. Donenfeld" <Jason@zx2c4.com> w=
rote:
>
> This pull request contains a single series from Uros to replace uses of
> #include <linux/random.h> with prandom.h or other more specific headers, =
as
> needed, in order to avoid a circular header issue. Uros' goal is to be ab=
le to
> use percpu.h from prandom.h, which will then allow him to define __percpu=
 in
> percpu.h rather than in compiler_types.h.
>=20
> This has been sitting in next for most of the 6.12 cycle.

One conflict against the DRM tree.

https://lore.kernel.org/lkml/20241010153855.588ec772@canb.auug.org.au/

--=20
Cheers,
Stephen Rothwell

--Sig_/pLR6yKQ2jdQD0mFZy7=ShCJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc6vxEACgkQAVBC80lX
0GzyyAf/RtTTTtMAfPx2mqkl5u6fGrAriuFttFWVZm7bwFQEqbU3PfDS75WjZaZ/
5J/gtguRN+A6YxH/8mf6DP0XvW51l60R5go4TEwfWcAoB1KRRM2mF8NS34vtZ4eN
/mP+tS4CcVYiHRZJTorRDQn4fwE30sWr7wJl4ftBseNEAptGfo62aa/qjl8mNN8B
JuoUXqaL95dFw+jK//fZClIalnS+SkWi+zDPzNvvW6Da4Nhzsh6FtNDOEp+m0bb2
7+KyTvrsJ2R2uMpK9ufEykp6L0Nb/+IQt3g6z37Q52ww0OaWq7IzCvfYqwW+xmiX
SVs4jqgi2zmcvaDgNevsHHiRE9SG7g==
=uEIf
-----END PGP SIGNATURE-----

--Sig_/pLR6yKQ2jdQD0mFZy7=ShCJ--
