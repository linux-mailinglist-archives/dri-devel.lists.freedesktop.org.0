Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BEA350FF6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 09:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657F36EC72;
	Thu,  1 Apr 2021 07:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B8E6EC72
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 07:19:41 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9vh86P9vz9sVt;
 Thu,  1 Apr 2021 18:19:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1617261579;
 bh=2/EUPL3rwrP2ZNa91wW4p5emzJueDGRU/eFifvPQ69Q=;
 h=Date:From:To:Cc:Subject:From;
 b=ATWdnMpSXQmokcmm4NKtG93jQfUzaWDDRIeOV2HMcJrFA9XRbwrdHqgSBAHUvkPzK
 GrDautztnurIuO/YCbIaPN23qMUqNNGOKFSO/Sbm3gdBc5Th7Idrwkhq4d5UprlJMb
 cNeYE7JmxM7x1bcla1b6mnnWSHaTWmFzNt1JwVzkB1ZmI6aZPBCPhCRLK9MFG335jv
 nh+SF1tAhC++Lbe2vcmdaplhSIz+R9clvTXQZlXWnxeaEq5rXMKlX+EoXvJwd3tfNA
 wpqoEugjpfVKoNJoXBSPHYBKUciSo9mRVeMIlRZaApT6NQTiUzH4HyHM2jUp6zv5yh
 /KXm4zZGhCXhQ==
Date: Thu, 1 Apr 2021 18:19:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20210401181933.08472e2d@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0158046774=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0158046774==
Content-Type: multipart/signed; boundary="Sig_/cAk.5IP+iQqeCBvFKkw2UWy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cAk.5IP+iQqeCBvFKkw2UWy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:102: warning: Function paramet=
er or member 'ww' not described in 'i915_gem_shrink'

Introduced by commit

  cf41a8f1dc1e ("drm/i915: Finally remove obj->mm.lock.")

--=20
Cheers,
Stephen Rothwell

--Sig_/cAk.5IP+iQqeCBvFKkw2UWy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBldAUACgkQAVBC80lX
0GyelQf/fO9p5D16nYuhlyV7PcSrHJfWc6YGZSpwkcCzDsvcfXQMkgZhH37uYniD
G0qKlmnmGv6+gok0+wjJJNlf2rOK8vgiE0NHeOENMCU7JY3oHfuFkd6zCVG+IbyB
zD4ZgLwAp6NCTMpbTAIu6fNwCJYgpLBKE7H+dZhz/JSSn/qI6IPvV+CO/Wo0nTB9
nW0x7oxCaB9HRh7lYqUn2G3TuRMhTOR/beqAuhf2UDx54fu9cRBanckCA1afogQQ
BQAUkyGj178otbGS0lCZZNAwSPRdX+YnI5dyOppQFwaIeUb9acHY7Kxj0rwLdaW6
XT4FiFkjyD2HFRt0zreaYlEjQ9j7rA==
=gAer
-----END PGP SIGNATURE-----

--Sig_/cAk.5IP+iQqeCBvFKkw2UWy--

--===============0158046774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0158046774==--
