Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2565B859BA2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 06:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A2210E14A;
	Mon, 19 Feb 2024 05:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ajimO8V5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C517710E14A;
 Mon, 19 Feb 2024 05:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1708319871;
 bh=DiLQ78DkSeB+VFr6W48xH7ZI1R4cqbqoXRlZF7XqOGI=;
 h=Date:From:To:Cc:Subject:From;
 b=ajimO8V5mB2EySBWaJuCyS2mWAzEr8NrmgxZqW7bR0YTNtyXSdwBpU/wSYJFRccYF
 oW/nIupmIfD0FfF4xnyZuNd2dWGcWQ04h4Rjs3KdlAZXMiVj5uUebod+8FsvTp5L0K
 VJZuh4VvRi5z0GG9Q8EGekJXxsjuCyVREUemxZfSo2I4zNpkqM82czLKdx8/eytkH/
 vMQnB3TRG2TqhV2iwlC/r8v4vV3oM/wC9T4EquYRJw/6fTEIfx0m3QmStrAJVzNkzT
 2rHTNWrlUkc0xJBEEonJYtbvGmIpUd18U8t5UuwLq36vz33Kw2HFID4q02M7pmurBv
 NiAvFbs1ydx0w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TdW5941t2z4wd0;
 Mon, 19 Feb 2024 16:17:49 +1100 (AEDT)
Date: Mon, 19 Feb 2024 16:17:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Intel
 Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-intel tree
Message-ID: <20240219161747.0e867406@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y.AEXD9XRXmOD3_UAne7Cho";
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

--Sig_/y.AEXD9XRXmOD3_UAne7Cho
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/i915:222: drivers/gpu/drm/i915/display/intel_cdclk.c:69: =
ERROR: Unexpected indentation.

Introduced by commit

  79e2ea2eaaa6 ("drm/i915/cdclk: Document CDCLK update methods")

--=20
Cheers,
Stephen Rothwell

--Sig_/y.AEXD9XRXmOD3_UAne7Cho
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXS5HsACgkQAVBC80lX
0GyrhAf+MQM/FkWhlVWtkovGLvV9ffn3n0kyMg09Nal+PDllXMNFipnuIquyTl5B
j+xkdITwjY8CtQZfKJjcxT8LrVu8A5WiAb4qRniJRQARIq9p9zxVTBghsKiisylZ
0IXHh4APrqWx+fuTEpamYOskLwbQwlD8hAp94jizHuIY571RrSAkfMcLhLvK18lW
5Usl8mUvXesTcoY4q/6xna7RW14Q5CmApw7ptCGH1pVvrlVN6ItDyZcdXl/QrCht
gDPZjXlELGLelxjfbg+pd3akx1TVZ0m+rzUIcindrb69gIXiNTgWJCQ2B57QrK+r
515zTyQjtLTOAwrxdvsXZaIdmZKc6w==
=/y9I
-----END PGP SIGNATURE-----

--Sig_/y.AEXD9XRXmOD3_UAne7Cho--
