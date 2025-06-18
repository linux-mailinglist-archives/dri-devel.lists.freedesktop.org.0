Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F1EADE2DB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 07:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481C110E190;
	Wed, 18 Jun 2025 05:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="laKLAJ69";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53CB10E18D;
 Wed, 18 Jun 2025 05:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1750223015;
 bh=kqKSRJ/guIUFt5BzI3NN6IQBXj+pHJejH9za0Jf/xPE=;
 h=Date:From:To:Cc:Subject:From;
 b=laKLAJ69vBRPhMQY02vaJAO+FL9FAYvlRZ9Vjpoix9Nhi02Wes9sQi/ANAKqA7qcN
 AkszBzFYEj7OdophJ8ckxbC73yxBALgwr/HGxh+2kuZli8CvidF1Kaow3UnfnMLtoH
 vtINK4n8pl/RNks8O2QlB1FIwkBGSTTkM0TmyKiJTRqfXZHck+N0dByxkGJfKIErxe
 4NRdNckiAeeFbo6kVLDfAx8IOKkFCJA9fVJpZGM5+b4nMjlyn8jvcxgtaFvwaMRB0b
 JNi1UcbruGHr0NfpLc4DAiQ3oZ8BVg4qAZ5xegjeqymPcNqvLNUzhusgu6Cge7wJrt
 qrjk4iZ2tI0NQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bMWpt3Srrz4wb0;
 Wed, 18 Jun 2025 15:03:33 +1000 (AEST)
Date: Wed, 18 Jun 2025 15:03:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Raag Jadav <raag.jadav@intel.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20250618150333.5ded99a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/trREsfRjxJARIWUtxbQwCwy";
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

--Sig_/trREsfRjxJARIWUtxbQwCwy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.

Task information
--------------- [docutils]

Introduced by commit

  cd37124b4093 ("drm/doc: Add a section about "Task information" for the we=
dge API")

--=20
Cheers,
Stephen Rothwell

--Sig_/trREsfRjxJARIWUtxbQwCwy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhSSKUACgkQAVBC80lX
0Gz1gQf/fuPRHjtEJ9udvL2k+NPjFWGeST3ipVD1JZujraPfXxA79hMBUog64gM/
8V9knscyoYfQQ129RZ69XHnOKOBK64wIDxEU010j5toVfx+C5ofQLQswE+SXorIY
TYkM+Ztm1prkIq4mepvOP4oA/UX/hJp0WzX6JdsMN/HEbIOWDmqVGKp1Hp148qI8
21eG9LufC0FhhjSKLBqIgzPYaegNxvnCTFKT8MMkFGAT/NQSP9L7FxRWfMZTBFzh
KYFG6njPydzCSzcxMyJy2fC4RbnOstZx2bKJoaA+j73vm+U0v5aP9BbbYB+Hn1wX
RL2oqxWORxL6Xfg0ZKi1WaRP0Pc2vQ==
=m8hK
-----END PGP SIGNATURE-----

--Sig_/trREsfRjxJARIWUtxbQwCwy--
