Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E82C6DCFAD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 04:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A0910E0DB;
	Tue, 11 Apr 2023 02:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DE110E0DB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 02:24:40 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PwV6C3L5Xz4x84;
 Tue, 11 Apr 2023 12:24:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1681179876;
 bh=Tm3RwaWe4McpI5/vEhrd2G7tKXDeJ9T+zUbSJ25a6DM=;
 h=Date:From:To:Cc:Subject:From;
 b=PWTSwz/e0TOsNFgbGUT9G6LKOqfsCACJ/o8UjKUrx1wCTzwos9bgBgjG9JQQMh5my
 XsWnZwUZ7tijO3GpvXLqWvGPOKO2jgeor1hxsg7MoN+GYEgYEoh6WHtkYNihntN0l0
 YkUf475czrISZkSZJv7rrjLXoBOEdhEUpHABQnS/CH42B7Z1XZyQWGFkFN/I7QwCGv
 sPwj3sxsYOvPSdoQN0uusSfL95RK4dw+ZdUFdEKFVLGKkZsnE79QPhpZrhrtFZAR6u
 TsgJutx4tWLFhTeT985rQNF671B+l8O3NsxMjSqPxmgsUgcrCZCP7cVFQVedPPrrR1
 dhqcEV6fn/A5g==
Date: Tue, 11 Apr 2023 12:24:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: linux-next: manual merge of the drm tree with the mm-stable tree
Message-ID: <20230411122432.1d2b3ccb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B9uPXz1BZw3.PqgdhoFlJ0u";
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
Cc: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/B9uPXz1BZw3.PqgdhoFlJ0u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/ttm/ttm_pool.c

between commit:

  23baf831a32c ("mm, treewide: redefine MAX_ORDER sanely")

from the mm-stable tree and commit:

  322458c2bb1a ("drm/ttm: Reduce the number of used allocation orders for T=
TM pages")

from the drm tree.

I fixed it up (I just used the latter version - though I may have missed
something) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/B9uPXz1BZw3.PqgdhoFlJ0u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQ0xOAACgkQAVBC80lX
0GzuCgf/U3h7H0zq5aXOOPwZqA+fKakw+tdI8bVp32J0CGVkv5pP5mR7/l6vOjql
DWpqnZlPp3/uCm+AJdtVTBzaxUf5jpGmZnh78KFuwvCMu5uxJv9tR28vzXjP7/fA
3+tFMq5UitpgUJW6ku6ENPdA5v957ukFl1MOLcyVH04Qs+/r+vSjvSGMSFhLfXfa
uZs+qNd3i58ixZVWQ/Hoz5A5yrAMjBAbw/eoKtwLTwF4L/79Mf2Sd1eUynNVu6Ca
T7ciwltpvUIZhnnt5ZKeYoNZ0J2jD6KR1YulIBMDMw1NIiESPw1IVFtZLYI5m/ie
e2g1XCUwy8A9WVIhUuwj92ew8mtshw==
=Iyp2
-----END PGP SIGNATURE-----

--Sig_/B9uPXz1BZw3.PqgdhoFlJ0u--
