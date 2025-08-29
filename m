Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD206B3B100
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 04:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94EB10EB2E;
	Fri, 29 Aug 2025 02:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p0qwMLOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8193910EB2D;
 Fri, 29 Aug 2025 02:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1756434225;
 bh=UHRA4gGEGjTWcsmrfjcfYxxL2gmHi/bqcEFXtmpy7Kc=;
 h=Date:From:To:Cc:Subject:From;
 b=p0qwMLOHs6YcbWy7GVJu/S40VlvyXA2q+nIZrB7rk1fTIINyYPUW71fiZ8xb9UKfq
 UradhSBBhwCIQ66WBkxR7fQkusmpaChy5x25SDUDAiybqRePgOz+EEWoSToxFoIu8j
 Sjb6rw/slXBoKYHeXlgg6b8s6W1JfrJgH2iv3p1G1f8YlW6GzZ+bPhyFGtRfKXV5wX
 oa8ULY0TH6eypszEv/Qn5WO+dbvadQ+Wi8nHS+wqgsGVYR6IAzUIERPc7yGnoEu5P1
 0x49D3VMWsQ7V3oXKKvOgASq3hKwmpvonA9C53tTa7XD6Ykfe2ALPWlgdB9K7UqJqT
 kr2BnkagCWgww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4cChsD6Rjzz4wfl;
 Fri, 29 Aug 2025 12:23:44 +1000 (AEST)
Date: Fri, 29 Aug 2025 12:23:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20250829122343.4b31642f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dbmPQnu+I=eNxOB/okb+t/_";
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

--Sig_/dbmPQnu+I=eNxOB/okb+t/_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/tests/drm_exec_test.c: In function 'test_prepare_array':
drivers/gpu/drm/tests/drm_exec_test.c:171:1: error: the frame size of 2136 =
bytes is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
  171 | }
      | ^
cc1: all warnings being treated as errors

Possibly caused by commit

  e7fa80e2932c ("drm_gem: add mutex to drm_gem_object.gpuva")

I have used the drm-misc tree from next-20250828 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/dbmPQnu+I=eNxOB/okb+t/_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmixDy8ACgkQAVBC80lX
0GzsnQf/aMPMRMWvoXVvkr/0OOseZGxrEsTbLfDhThTKjMWEWKrq3PVFUnVyzWzL
iqanDcSr+7NHIRP+S1bKH/alnMdSdtYpwYUARwfEJUVvTpWmFkjX8FM3A52r6ahs
uQhPHzZN6AgnYHv1H6aKg3ZthwAMSt2OO+pRZRVDkbJNZNbDctSloJ+s3oUNAXNC
7eSO+MP35OaKkz6VklGCoQfRhJXonAZeQoCdECi+U7ybdYk6kgbOP0XXprWCmTot
/U2bBYKlTli++XtKiTvjnEG9vAJGde7+thjHEDFKYuWUwaaOHDGlevWgaZMOm6f1
WzSFbbBA1nWC2h9HOiQyssb6GjeYxA==
=RbTf
-----END PGP SIGNATURE-----

--Sig_/dbmPQnu+I=eNxOB/okb+t/_--
