Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A304FEBC9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 02:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D56210E7D2;
	Wed, 13 Apr 2022 00:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF0A10E7C4;
 Wed, 13 Apr 2022 00:07:50 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KdNFw07rXz4xNl;
 Wed, 13 Apr 2022 10:07:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1649808468;
 bh=5D9JzxHZ9SkP4A+S2Dk3RBo3Rj+IgKIna634rjs7ueM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AR+q3v0GVUiC6+rG8rjn2soRuwRhphOarvrA9QRwT+ngr4Og7jHFHLxSSlykuQUe/
 FP976yIHfn9XE/ETuUycy8VFOFLlV5TQTnUy9Sx/8CNkiJeqUvQWZ0w1GXQrrjhK+6
 iuTenBxVFb+/aSj02MP3JYVjOBkQUNqWFzJE7kfBzZXMSwZHmXbxMVlON/JaCLeKqf
 iGnpCxEw4Ihs9flTvvfKg/FMP4nF9sjAsEZOPZg+BTWP+PjdNlJ4Mc0kPmMaB+8IJt
 g2+v8k+AhF1BzOXw9LSgvbV7JP67AYRtUcx8H3w7nJOpnUTavimwba9t9hf/RhWNG3
 YfFj/YQGpcRMQ==
Date: Wed, 13 Apr 2022 10:07:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20220413100747.2f9deea0@canb.auug.org.au>
In-Reply-To: <20220406154431.567414c3@canb.auug.org.au>
References: <20220406154431.567414c3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x4tk9Sq/vj5k4I8tIVUDpa0";
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/x4tk9Sq/vj5k4I8tIVUDpa0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 6 Apr 2022 15:44:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-misc tree, today's linux-next build (KCONFIG_NAME)
                                                             ^^^^^^^^^^^^
htmldocs

> produced these warnings:
>=20
> drivers/gpu/drm/drm_edid.c:1589: warning: Function parameter or member '_=
edid' not described in 'drm_edid_header_is_valid'
> drivers/gpu/drm/drm_edid.c:1589: warning: Excess function parameter 'raw_=
edid' description in 'drm_edid_header_is_valid'
> drivers/gpu/drm/drm_edid.c:1737: warning: Function parameter or member '_=
block' not described in 'drm_edid_block_valid'
> drivers/gpu/drm/drm_edid.c:1737: warning: Excess function parameter 'raw_=
edid' description in 'drm_edid_block_valid'
>=20
> Introduced by commits
>=20
>   6d987ddd6843 ("drm/edid: make drm_edid_header_is_valid() accept void po=
inter")
>   1f221284ab63 ("drm/edid: split drm_edid_block_valid() to check and act =
parts")

These warnings are now produced by the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/x4tk9Sq/vj5k4I8tIVUDpa0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJWFFMACgkQAVBC80lX
0Gxe7Af+KjcSkaNCgtVa8zaHJRKB5qqFCZt8SkokMrvYUTSUhwdJZ00R9ZHUPA3D
WzrZs1FgZx/PtDb2D8GGI5Vh1wRQRM6M+Ub5MOQ6qxn4EO0zBX+dJqtEf1TobbiY
amCmL0MXjJJ0WMXdn2O1tLtQGXam/4LHJcCymj9W+qgGtunCeVUtwd6BW6Akgpnb
6neh99KbhgxTABz3ufr3ZwvuIbSPyo1GFbnIvqj7VWbpn2Kdk6hh2heHZITOCOOn
a4DTh4B7AD352p0Gkf6aQTTz7WPftVMayQz8hnVJ0ADq6it1qEusaPSIMbNayVEC
9I9DB5Xznz7aSzEdhW97BTQOmD21ZQ==
=hpkW
-----END PGP SIGNATURE-----

--Sig_/x4tk9Sq/vj5k4I8tIVUDpa0--
