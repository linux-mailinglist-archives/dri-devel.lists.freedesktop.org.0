Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AAD924DED
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 04:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F8710E6F8;
	Wed,  3 Jul 2024 02:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dNzz6FLA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F9110E53F;
 Wed,  3 Jul 2024 02:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1719974404;
 bh=/EDCIQAEg/p+MMLYNbszg680nHn24gcRpI+TzuKcU9U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dNzz6FLALGPfiBBeUd9mFzjTACHs3c7VtDmmOlzIbDb9ExivdmeboVLwjOCuGmFlX
 8JHOe65oS15FjvwbiJsxRawcevEG1qyMNiWHu4rhUkAdKXKI4ccsz71CKZtgOYqjiJ
 x6yi5mPfvQsy2k5QW7Vr9IalFMl+gdRn5ac+DocdUnKsr/o1OHQXH3WxPnEo8RQYz5
 tiUcrHAfKmwHbYAC244CfiR60uCmb5gIos3dJDc8X/w58S2UzWg75hlT2QE2gJcaIv
 aLhoMoSV1rBx1dux0GkzFonVX8vjXHx2xbFOEgvCSMy/ak5/u103SLEmQ9tRgH63pv
 yA+tiaObozFpw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDPBq6FBXz4wcJ;
 Wed,  3 Jul 2024 12:40:03 +1000 (AEST)
Date: Wed, 3 Jul 2024 12:40:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: Comments in Fixes: line (Was: Re: linux-next: Fixes tag needs
 some work in the drm-intel tree)
Message-ID: <20240703123930.13edbfa5@canb.auug.org.au>
In-Reply-To: <155844385673.15761.3434506339174536733@jlahtine-desk.ger.corp.intel.com>
References: <20190520221526.0e103916@canb.auug.org.au>
 <155844385673.15761.3434506339174536733@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iW/ag6FLZSTW2BV7u.6x/zr";
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

--Sig_/iW/ag6FLZSTW2BV7u.6x/zr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joonas,

On Tue, 21 May 2019 16:04:16 +0300 Joonas Lahtinen <joonas.lahtinen@linux.i=
ntel.com> wrote:
>
> We also have an incoming patch where the Fixes: line has a comment in
> it. Does your tooling account for this when checking the Fixes: line?

No, but I will ignore it manually.  The tooling just produces suggested
notifications - I don't send them all.

--=20
Cheers,
Stephen Rothwell

--Sig_/iW/ag6FLZSTW2BV7u.6x/zr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaEugMACgkQAVBC80lX
0Gz4Jgf/UF7YP6SfzyE5+288tj6hS1FY8cZ48ltYoAR9PRxR4qY3m/+2f45akRCU
F4TmPbvvLVtB0XolGcP6OL7DyPoPp2KXG5yu5DUugxm/jLdZNqKJDM8F65oSc9Cg
jQdEy+CtBjJOXgSaX2sMP1ITeLa3CIUexX/McpAsRJTJODDEnAkzrDS+wNYGGU5+
FrF/gwBHi3Nx+ncrAmIh2KLXUS6Jtt2PWVbzbgvrBgbRzsZ0idj5jeC8P2Lcco6J
ftFxLt7sS2x9wFKTW+L++60F2XJFfdsYYqnTd5280gSrX6RvhihxKD3ShPkb9rW1
XVorTzC+YUyPO7ImMsStLKC9vsEh0A==
=vsZB
-----END PGP SIGNATURE-----

--Sig_/iW/ag6FLZSTW2BV7u.6x/zr--
