Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BADCC0682
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 02:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F01510E616;
	Tue, 16 Dec 2025 01:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nD8mDo1v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B820D10E616;
 Tue, 16 Dec 2025 01:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1765846850;
 bh=Cv4u7qnmLy7vGK/p4d5x+IySSpkPGcj+fF/6/Oc/dZs=;
 h=Date:From:To:Cc:Subject:From;
 b=nD8mDo1vKWco4VgBtc8WugZwfVsrdSaXrRGNhcaE8CDJTgIAfj+by0hORbDOfAyqv
 d5WCUCy/Q7EZaP+RdsadCv47/MaNUqrRClon7qGjlxeomm6TmqNLVoAw/GeB7BDoaN
 JaigaDbL6ZVHMCc1bnCXkmrwbOIclB/79rFLKivm1z9m1Qt+2CNKd0HBpMneVIV70+
 yzCnnoOHVnn4IRq/k/ssts89IaMPt6AhD4hhU7EDQPaN0Csv4KJBnRLbdfeqRgvDCg
 0N6+GAo/cXqK5bfkYdfEK4C2/xFHVsrG4ID8UJA6ld0zE1Mb0MyD7eigs61CRi1kQY
 DEHnGXocnCx4w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVdsG1sDwz4wCm;
 Tue, 16 Dec 2025 12:00:50 +1100 (AEDT)
Date: Tue, 16 Dec 2025 12:00:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20251216120049.3ed7e06e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Hdpqtc.waxuJu+vBtY.SYSp";
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

--Sig_/Hdpqtc.waxuJu+vBtY.SYSp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: include/uapi/drm/panthor_drm.h:375 struct member 'selected_coheren=
cy' not described in 'drm_panthor_gpu_info'

Introduced by commit

  ea78ec982653 ("drm/panthor: Expose the selected coherency protocol to the=
 UMD")

--=20
Cheers,
Stephen Rothwell

--Sig_/Hdpqtc.waxuJu+vBtY.SYSp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlAr0EACgkQAVBC80lX
0GwHXgf8DegMLO5Nxpgf9SMwHY/jg4r0/hvub183+z9jhtHtSZNOaEQekaYSz0lT
i6WtlMxmI7zmf3LNTg4P1eisHconDHchDAtJ0eoyIVi5X8wy77GR/j0IRdz8XqMR
+kniGtC6CWeP6a/E3I6lWxExYIb87rFb4I045nBCVqB/BBre4lVyaCHi2pH6Hbfx
relCBlIAVI1rSAqi2oA3Rl2w1vRUs1dsIHGCoRBgBP6s5mr9mVwi6vGvwzALLis9
t0ny8hfmY+iobbbndHNcvQAr1bCgde/hK1wAVT+ZmAvqsYFWDGHjiXwQH2htmJHs
0Jb5QtzpGURcE6t5eO7cGH3t4edftA==
=chMS
-----END PGP SIGNATURE-----

--Sig_/Hdpqtc.waxuJu+vBtY.SYSp--
