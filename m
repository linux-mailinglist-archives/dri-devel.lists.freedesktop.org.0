Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B23A7514E1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 01:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4681310E5FA;
	Wed, 12 Jul 2023 23:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD89A10E5F9;
 Wed, 12 Jul 2023 23:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1689206341;
 bh=WvD/wcqsrNHh3y8u93t1s7rTT9s8JP0V1FCKN/Chx3Q=;
 h=Date:From:To:Cc:Subject:From;
 b=FS50z64r3y1HGxodjKuX67NyYcwTSMw1NrtaL6+W0w3a2Rs23rXzdO/burwF18/e6
 NP2Bp0756pPqxM2ewbfU1sxzr+CU0mzso9NoKwL49pLHeIwel1G3+GOgFFtxRq2vRp
 bX2a5xO23EaATOj9ZX2oeqpo8YIKBziQCoBfawgPSWAvPqL8pd9lBoK5PGwaqmtKps
 IuNnYPNTfyZfIEe6zGAT59GYEvclpDGXMNZTvGnDj1g9VunjIWLUkXjYxEIllD6muW
 /l5zHqn7hjRGlImC1W4xRSaIe+Dc9QFo7xF2w3jXdHp9CmEde+1Kr2NBiK5fkHAjRz
 6u/BYX7epoxIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4R1ZTJ3nF1z4wZn;
 Thu, 13 Jul 2023 09:58:59 +1000 (AEST)
Date: Thu, 13 Jul 2023 09:58:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20230713095858.093fd5a4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pGl.vQJOhlpe_n_JyuAO4gC";
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/pGl.vQJOhlpe_n_JyuAO4gC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c

between commit:

  570b295248b0 ("drm/amdgpu: fix number of fence calculations")

from Linus' tree and commit:

  ca6c1e210aa7 ("drm/amdgpu: use the new drm_exec object for CS v3")

from the drm-misc tree.

I fixed it up (the latter removed the lines modified by the former, so
I just did that) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/pGl.vQJOhlpe_n_JyuAO4gC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSvPkIACgkQAVBC80lX
0Gwe3wf/XZDmnSV6Jbj11uan8s5RJPcTMZg3GNjWxJFHMRMEISqTZ2Pd64P+7NBA
SfXptsdpB8ug1o62KorxjVwhDE6wqFVMw9o7+OpGW/eZNnZrzdnGh9Vwdjaz6E1/
+tqTclTz+1x3ffgE+3zMuOyrpj7KrDvdzbi6CkWAwy2w6JaNdEHDwxPRToVrG3o1
hB5LyQkFLXFCuEG83PI48xfz6E4vY1ZgO15nZimftJ0FSv9Cv/1+6w1WipotAgwj
yitvfzKPl5lMqJpIQgysBDjw01PFdZsc78OzSjcsTmh6hFy787tgTDoYe5T8PsS4
Po8z5PFYcSjk39BTcYJKqiEBa1pMKA==
=Hwy+
-----END PGP SIGNATURE-----

--Sig_/pGl.vQJOhlpe_n_JyuAO4gC--
