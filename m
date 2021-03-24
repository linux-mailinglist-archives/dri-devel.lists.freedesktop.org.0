Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE06C348490
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 23:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4586EAA1;
	Wed, 24 Mar 2021 22:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B686EA9F;
 Wed, 24 Mar 2021 22:25:02 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F5N8T3WjPz9sWS;
 Thu, 25 Mar 2021 09:24:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1616624700;
 bh=Lt1046lPm+M0t+PnUEF/7zYkeQkAleAyRe/nHCtvliQ=;
 h=Date:From:To:Cc:Subject:From;
 b=n97owxz9QYJoqMkBquoOBIbQ3m85Fn5VJrXFdU8xakKvYG7bPyTsEmTK6KrHVv+1A
 wzgBTsDbTG5zvav6L1oxzvYrf5DFfbA+Og3AiddKpHAZI1TYjxrmb+/lWM6+2+oGSc
 7AwGwYX0i6UmPW33OXpYA/zqQQRqMdgLKsXca865Emjt/WzHNimyDq+n5ssgaegFcj
 JHpbZLlSa/bE3Tu7AbEp1z3BBhRhGfE9NMlLyGCL6d7VYNq7TxBY/Xnrk45pWTDNt7
 P4jJLnjKj2YPx/gGvntMX+tO4j7nHvqU8+BeG7ygFjC8OjTOgO4XZ7L087v5TOQdno
 bIokMdizzJIQg==
Date: Thu, 25 Mar 2021 09:24:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm-intel-fixes tree
Message-ID: <20210325092455.7a629047@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0069327574=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0069327574==
Content-Type: multipart/signed; boundary="Sig_/nicSjGR_B/XICY4AoVrQOrA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nicSjGR_B/XICY4AoVrQOrA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel-fixes tree, today's linux-next build
(htmldocs) produced this warning:

Documentation/gpu/i915:22: /home/sfr/next/next/drivers/gpu/drm/i915/intel_r=
untime_pm.c:423: WARNING: Inline strong start-string without end-string.

Introduced by commit

  8840e3bd981f ("drm/i915: Fix the GT fence revocation runtime PM logic")

--=20
Cheers,
Stephen Rothwell

--Sig_/nicSjGR_B/XICY4AoVrQOrA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBbvDcACgkQAVBC80lX
0Gwu7gf6AipS7+ub2HMWch7KBKGHskD98Lxo/DuFL9WVwNXFWpXDOdVJ6pT9wsHs
DlBBT1/4uSXzY2SDIQ+bxSlANTond+9Mc6ne6a+0JlrI3mMu9Q9R8nfKPNi327GJ
qTOq3NtPovhJZqzg4EhNjM+H0jF5L6NUbaeA2b5fW5j3BszhdouKOtyG6OPd74l8
bqLYAsLOMmyisDDanymY9lumMw7we4e2kZdmzLYmqPt0+Vhfa74UJre2OzAluVpm
+d7GniRz61rLuqUgKzZxIpxBZbmkdbt6LYYvFzxMOr4Ut+G4Ueo8ywvxJTcBX1IV
1yQNdIDrukr8nQYS4v6fpAr5Lbh2+g==
=dyCb
-----END PGP SIGNATURE-----

--Sig_/nicSjGR_B/XICY4AoVrQOrA--

--===============0069327574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0069327574==--
