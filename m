Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4437EA78B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 01:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFB610E427;
	Tue, 14 Nov 2023 00:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8562710E427;
 Tue, 14 Nov 2023 00:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1699922215;
 bh=U/j0SYvk3GviJyacvFPrMyZQgCXuN+SoJpI8XVVDb6I=;
 h=Date:From:To:Cc:Subject:From;
 b=BdUv7MQjeIP9/d8mll3mWAtnAoh/UX2HhBlHdcxrx3fpZmpr0HddDzwKKc3FxOAY+
 ik3SpZZqeA+OS83T4YU4O9L4jCIvijAvJewdTcGs/AAC9OHEb7tfgiNptQof+p8kke
 cqvJFtSR/hxMvo+txjjNmqFjvjyVjO55GzjwWr9yYG9f6P0/TpLA1rxJ9+7+haYLlU
 s0xukJHju+xq+yjddrtPTCZ40HXhN/6a0GrJCdlcsIQ9PuM1Ef7TBURVKoWNi7raoj
 yxFEuCE7hgn+wRLn+5qcjqKd4DNovGgKlEEEd4yaHAG9BuecdupQtmORjoFVlOaBms
 CVXlvN30FLoEA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4STnRq42VMz4xNH;
 Tue, 14 Nov 2023 11:36:55 +1100 (AEDT)
Date: Tue, 14 Nov 2023 11:36:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20231114113654.3bd7f0ee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XHi3bVwgPviu_TrdtL3I=pP";
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/XHi3bVwgPviu_TrdtL3I=pP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/accel/ivpu/ivpu_job.c

between commit:

  6309727ef271 ("kthread: add kthread_stop_put")

from Linus' tree and commit:

  57c7e3e4800a ("accel/ivpu: Stop job_done_thread on suspend")

from the drm-misc tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/XHi3bVwgPviu_TrdtL3I=pP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVSwSYACgkQAVBC80lX
0Gw+Nwf/evrsIdeTi1bCKKyBiKp8YtGSHng4DUjF1yWVmESZ+dwkUG1hG8kyrog5
5KhFcClTqb8SuWvwiPqJHQZiEaHsa2XE5YaLgbtV/1BwsB90U0oaDSZQcEXmpWYj
X28qgdTTrkqdQgd38LcKEokH23yANL0D/H1bTkv3Y1jZ8D8NKqkeBFpIDbCLRvAf
AyJpV+cuDW77XRgCu/VK7mwEvctEnsEFr8C4wUfCJ2lMuEoSxWdHGgM/lvfpn9pK
adKL7ab/OH0fwSWGGVSuNn1QWEUVZW3thfUdV/Rj5knECDwvEexG7aQsU8jPxc1J
JyyGrtk72M6P9OxNqf/8s7krottU+Q==
=m5+T
-----END PGP SIGNATURE-----

--Sig_/XHi3bVwgPviu_TrdtL3I=pP--
