Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854E1D348C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 01:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02D189AC9;
	Thu, 10 Oct 2019 23:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476F689AC9;
 Thu, 10 Oct 2019 23:45:35 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46q74X3b6Qz9sN1;
 Fri, 11 Oct 2019 10:45:32 +1100 (AEDT)
Date: Fri, 11 Oct 2019 10:45:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20191011104531.6a5878fa@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1570751133;
 bh=AGVX3lJUAZT3jOSx8id9ksoYbtfMhHjY4TOLZ84JZB4=;
 h=Date:From:To:Cc:Subject:From;
 b=T/Cwil/sQE+i0dPQ2JMjjjHTFcL/fdlxW0EsfKTCrSMARwesIb/SyrAtfGVNxOhD+
 PB61J/Ziw/JWwGAd2Ed3wRIKJHeuQzSi7I6SVR/hXvQpQhCdeBOVSyxbn9VpYUOZLh
 xEC2mWw7zeGuBk6jnQ5czRTbk5SUl2chkMcEtFpCPuLc5eG0QL3xq3grGrtiyhHZkE
 KxQ6uYsfX6KbjomwUU95oK4HjJPO3FEdK4ZHsp/H+xCoUEd29zg8j8C5wHiOjpl/7u
 VgC006DexGmtoYiwGCkRj2Hfr335WKWHa/7q2zGx/ftIFeKAntq26ANfPR9xSJkqKB
 eDytpoAkJ5Ywg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1110306978=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1110306978==
Content-Type: multipart/signed; boundary="Sig_/VV0kRJMJDScfqR3BJY0WTT5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VV0kRJMJDScfqR3BJY0WTT5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpu/drm/drm_dp_mst_topology.c: In function 'drm_atomic_get_mst_topo=
logy_state':
drivers/gpu/drm/drm_dp_mst_topology.c:4187:21: warning: unused variable 'de=
v' [-Wunused-variable]
 4187 |  struct drm_device *dev =3D mgr->dev;
      |                     ^~~

Introduced by commit

  83fa9842afe7 ("drm/dp-mst: Drop connection_mutex check")

--=20
Cheers,
Stephen Rothwell

--Sig_/VV0kRJMJDScfqR3BJY0WTT5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2fwpsACgkQAVBC80lX
0Gw9kgf/QV93DF+u8j5jQ/OYHhRIS+sgmExFSoK1Vdl7mw+9pLyOa0b1eL4RTFP6
zJPv6OjCtdhEOIUCA5WnavMetwxYvluCtlRgR1cxv1VIfkQx+QUJ+srs7JDt5CfS
YXT4ye/pSWJ5qCcHXm4rJfdnj6dCe1I7k5+TSiwSPbOVg9xOxku2OCxlfXwKKlgd
xAtgjdgfDW9xQPymguZiCXyqDEIRMHX7LrGagxlrOltrh83Tc5RcpV36o2vqVOac
BiPcGo073CFfLwYQG2rx9eaY14bZejeoII+Qcw27mqi4Q5tjqKG9Snz3KmssaYoq
et+4SPxbZ8lmdKCHezJvF8rG5SJ1Mg==
=vSnO
-----END PGP SIGNATURE-----

--Sig_/VV0kRJMJDScfqR3BJY0WTT5--

--===============1110306978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1110306978==--
