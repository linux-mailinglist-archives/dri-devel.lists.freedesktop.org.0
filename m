Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C22CC0697
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 02:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F8410E28D;
	Tue, 16 Dec 2025 01:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="reAptcBr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A206C10E28D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 01:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1765847054;
 bh=FgBKxk2oSOsduDe/P4YZbjYHrMuYZqN20JZ4aYSI6hM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=reAptcBrTzt3x80A7OaEdqkXWXDNlJS3cRXhIiJbCgCW9nH3C1DeJRgI+CDV+WLPg
 ys0w8CC1sUXMgPFsKGw09rDpwRoL+aZOdtw9hN89FDi4K2ePSBbsKZnhvx+UDC/HPV
 XftRr/SZqxpTi2zjcpiXRwHkoUxIG9bTv/aOGBBYTdOmJdkX8P3ukYHFItppJYehcG
 c/15YoT55EfhE83uAwtsaD/3hFTXs0Jkr08uwssdz1RFnTaK6U0TR2+Tx1QYwM2pRA
 AGLRhFXRjZ0Y/aDBPyryu3dUEky/RKI509RgI8w8vKYE5rW191ShRLwLn72Et9luXj
 CVfUn0gXl2LqA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVdxB1rh8z4wCm;
 Tue, 16 Dec 2025 12:04:14 +1100 (AEDT)
Date: Tue, 16 Dec 2025 12:04:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Lyude Paul <lyude@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <20251216120413.5eca4194@canb.auug.org.au>
In-Reply-To: <20251106151103.2f1d5e00@canb.auug.org.au>
References: <20251106151103.2f1d5e00@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1iyXKLmPqaatZP.IwUyFEwS";
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

--Sig_/1iyXKLmPqaatZP.IwUyFEwS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 6 Nov 2025 15:11:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm tree, today's linux-next build (htmldocs) produced
> these warnings:
>=20
> WARNING: drivers/gpu/drm/drm_gem_shmem_helper.c:104 function parameter 's=
hmem' ot described in 'drm_gem_shmem_init'
> WARNING: drivers/gpu/drm/drm_gem_shmem_helper.c:104 function parameter 's=
ize' not described in 'drm_gem_shmem_init'
>=20
> Introduced by commit
>=20
>   e3f4bdaf2c5b ("drm/gem/shmem: Extract drm_gem_shmem_init() from drm_gem=
_shmem_create()")

I am still seeing these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/1iyXKLmPqaatZP.IwUyFEwS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlAsA0ACgkQAVBC80lX
0GyE4wf6A+MdgJAFyXvXinRWvmCFUF/jHxceoc3q6VTVREP90Gnu3HnrA7Ce3zsI
EzrHWxoGZAmEpZ3i2UiAf5tSpOMETHN1o32I31mzor9Es4sO6Mel2ycOh/nwbnui
yJ35nnO/9txoCbi8t/1DfZo9kbDojwv8OXWab2ZJjByB7/Dh5aFw1FUOcJO3k/MQ
UFgrQ1we6QrB8DAmREMNpJ4etsIlymuiLoL/t8roGnoBtMH8ayH6fPRrhjM/MIkV
6uH2tUPl0bXcjJE8XJo4+K3S+1nyE8DW0S5k6KFGDOiVrcux5RTCu4x7ZQAm97OD
UccQ6GSO57XTt6xfsJantI5LpfWnyA==
=jLkj
-----END PGP SIGNATURE-----

--Sig_/1iyXKLmPqaatZP.IwUyFEwS--
