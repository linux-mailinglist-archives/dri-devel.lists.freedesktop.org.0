Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922C98AC1A4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 00:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8499810F3A5;
	Sun, 21 Apr 2024 22:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZWQiPBEl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AD210F3A5
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 22:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1713737980;
 bh=KDRWTdY/BdehO8gYSGZjXUGgjh95qAwgwfLuKoyBYbQ=;
 h=Date:From:To:Cc:Subject:From;
 b=ZWQiPBEluaoclAncRL44AJ1ntXmrOWYbttWsW2e/3ysjZqlsAJ6XFM5Bs9Nnz+51o
 mx3E1gCRBC0DgJTD9EtorvngvhrYIzx+nc7SO79INbd1hBjp9e82hVbs7o6OgdosZC
 sUHOK/LjNYXjhUhBqfL/1QhL7JuzBs3xyYB9oCpBTtKducuCnjL2aSFYEv3pBzjRfa
 BIaWaezxeHIpfkkhN+/I18uV8iXNTbQoDs2Zwt0GxCzpYLu1N4gBoLKVgTxxqigpQJ
 04WWBbiZDuMsNOCfd/LyayDJKp3OaqEwpVGrjlJagVXjZvmyBOC2uViSzowo7tg3VR
 pA0vLofASCJqQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VN2qc04kMz4wc5;
 Mon, 22 Apr 2024 08:19:39 +1000 (AEST)
Date: Mon, 22 Apr 2024 08:19:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: warning while fetching the drm tree
Message-ID: <20240422081939.7d61cfa5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1XdrssMqPnKOZyM8fpylqaQ";
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

--Sig_/1XdrssMqPnKOZyM8fpylqaQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the drm tree produced this warning:

Commit

  326e30e4624c ("drm/i915: Drop dead code for pvc")

added this unexpected file:

  drivers/gpu/drm/i915/gt/intel_workarounds.c.rej

--=20
Cheers,
Stephen Rothwell

--Sig_/1XdrssMqPnKOZyM8fpylqaQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYlkPsACgkQAVBC80lX
0GyRegf8DG88Tc2ajFce9SaiKMtc1R291H0Yx8bJRd1QRT0Nc+bsZPHmaw8SDDYK
e880Nn6u/R6JlO/bfYezdYNIVyQZ+JTRmROPqNYvAlI/D5c5KVLyFvTIMutMQkMF
kn+7ud6Vcbn2atoikFAIKegroDdTco/alpBl2gv6bTuZ9k9T+0MGrXxtU5D31QZJ
B3EMvIiECd5iS5EStJHlM3ikKGM1lfA7lE1SpnzXJNFapop6X06ewKA22a/kGlSg
wcDyjnRDbKW/WYFhYQzGF3yOcJvOCrVfIGEVri4fXHpbuZwbszf4ptFwXEUuJpi0
qwleqOQcnIwnkKon3NNspiiBoqWioA==
=sdp2
-----END PGP SIGNATURE-----

--Sig_/1XdrssMqPnKOZyM8fpylqaQ--
