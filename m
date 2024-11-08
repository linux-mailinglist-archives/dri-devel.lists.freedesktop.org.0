Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 504F09C16A1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 07:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED69010E155;
	Fri,  8 Nov 2024 06:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="psRnedlV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3022310E155;
 Fri,  8 Nov 2024 06:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1731049014;
 bh=LQGyr1XSjGE9ZDiGrm/yDf2dGEiFCy3MIqS0AIM0Wg0=;
 h=Date:From:To:Cc:Subject:From;
 b=psRnedlVLhvL1xwwjLulAcUugSj1Kvf8XVgJlpu1dhMnivJgePQmWp4iS1yKVVbv4
 gkQhu55nqT01nTh00RKXPA09ONRK4Aqh/WcapbLALY2QHU7iq2shqhvlDxF1bmIQFJ
 sLszjTNhSiBz8iS+b56/Yr9yczqwOJRme8k4/0VHKp6/CWa15IQ6rRPMlv3CB1JC1S
 ZN+N1xrs3bYdb0Bvs+TYu89x347z8aV0vPjfLdHE0pnA7qkNEoYj74rsXxt5/d9QRp
 fTKRJTMT8L1kLp975pVzo/NVl5e2C6lYvFqNdYAe/kp0/mOG965SOq9F/jvoJzNWhS
 NoHzdL9kVppuQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xl8r52c5zz4wbx;
 Fri,  8 Nov 2024 17:56:53 +1100 (AEDT)
Date: Fri, 8 Nov 2024 17:56:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Philipp Stanner <pstanner@redhat.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241108175655.6d3fcfb7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9cS_GSxxYOx_.WHv0fv0wLh";
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

--Sig_/9cS_GSxxYOx_.WHv0fv0wLh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/drm-mm:571: /home/sfr/next/next/drivers/gpu/drm/scheduler=
/sched_main.c:1359: ERROR: Unexpected indentation.

Introduced by commit

  baf4afc58314 ("drm/sched: Improve teardown documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/9cS_GSxxYOx_.WHv0fv0wLh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcttjcACgkQAVBC80lX
0GyaaAf/eOLS6c0HIrzh5Q3g4RELU5f9WzYrcmAembUOfNR9nM8XcJi0AkTAC/xD
a2h9KC05+oN2rVMbRQ06ewyPAyMuifQelDoG6CShmie4pZp5QxDUxbkb0ZwvH/KS
r0H/VhPmcWFwtE/gyY1dNhk0cEMLQEjZR9cPfkbXvCEBUvlH/e2aerHn0jEYJCIJ
mQgO7USdzwhGp0q9vGgZPLo8jMO7QIVuAusc21ILmY6F2iFS46Ds0Zb0tEAz04d1
hHXpv724oO+MnFpw5YUf6AVhx6LdmirUallkO9cyJZuqvsHJGRn81x33wRaJr7W3
qL7D0Y2Mxt72KFIEGx6ahnhOh4EIDw==
=KhiW
-----END PGP SIGNATURE-----

--Sig_/9cS_GSxxYOx_.WHv0fv0wLh--
