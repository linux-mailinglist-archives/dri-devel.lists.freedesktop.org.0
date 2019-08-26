Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB0B9C782
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 05:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D336E087;
	Mon, 26 Aug 2019 03:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE666E087;
 Mon, 26 Aug 2019 03:06:44 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Gxjq6nJQz9s7T;
 Mon, 26 Aug 2019 13:06:39 +1000 (AEST)
Date: Mon, 26 Aug 2019 13:06:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
Message-ID: <20190826130637.176f6208@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1566788801;
 bh=ao4+tkZSNPxGhHnop5/uB0c25lKvBwr4pgEKllddgAQ=;
 h=Date:From:To:Cc:Subject:From;
 b=DcqgXxue3U+qpniOSwRvKEcQjSkM2i+VPn8GRJ0jY2ra05YOru62S7WOrCnR8ejY8
 rVIdjuHyTCJiqazmPLx7jSI3QWIx8DGgtAK3rAp9qLyRSyVSyGLhXz1QO5vCL1qHcV
 hyptsAtmzvpKInJOjaxKw5f030CTZhTFdXyYUvaRqEd/2gpKa8Up9ptEfUJXDottn1
 ItGK/tSsRHVLRoSYV4ncesgPGUcC8CkYDMzRnktZ7cvYw67n70kZfAs2nydzHWt/n/
 rKZQ+aDBZyRrepbiWC+mfkjXJoYEwQocKMNKc+zskyTMVTtIwPoqEDsszkXKT7X8ME
 2vgVpq0rIhpNg==
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, "James
 Qian Wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Ayan kumar halder <ayan.halder@arm.com>
Content-Type: multipart/mixed; boundary="===============1930830967=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1930830967==
Content-Type: multipart/signed; boundary="Sig_/wydur/h7UBhnu/l7f8Ha7ul";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wydur/h7UBhnu/l7f8Ha7ul
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/arm/display/komeda/komeda_dev.c

between commit:

  51a44a28eefd ("drm/komeda: Add missing of_node_get() call")

from the drm-misc-fixes tree and commit:

  8965ad8433ea ("drm/komeda: Enable dual-link support")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 9d4d5075cc64,1ff7f4b2c620..000000000000
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@@ -127,7 -128,8 +129,8 @@@ static int komeda_parse_pipe_dt(struct=20
  	pipe->of_output_port =3D
  		of_graph_get_port_by_id(np, KOMEDA_OF_PORT_OUTPUT);
 =20
+ 	pipe->dual_link =3D pipe->of_output_links[0] && pipe->of_output_links[1];
 -	pipe->of_node =3D np;
 +	pipe->of_node =3D of_node_get(np);
 =20
  	return 0;
  }

--Sig_/wydur/h7UBhnu/l7f8Ha7ul
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1jTL0ACgkQAVBC80lX
0Gxv3Qf/UZODeNlf0Cg6Pp21C0lTRqUfi6nfMnY9tk8fimcVVU7XczrGHYCdq9lh
2cix95QOpooh3Rr8edxYyYMnXNpP4l+Tt0yXFr1a7VGIX+mjZv35aY8Rw55L0WLC
ja+YF6MBfyXQMaSxee3XRsqX3bHrnqwX5P84at39Q5+gHoGaqm4HPbGB9dslfYIX
FG/D1pXucobj7tuKBDufUQcFcdmAvgt9uXqeveQ5mSAMToqtBM8d6F29lEan8A6H
tzPQdiowwIb16nRya/Qu7IVW/I4QwJLwp5ykDPp9foeSGM7YWKejUXUroOkNt0V2
C0m6H2culOjxXPqbSRq1efBeyIXpEQ==
=mbfu
-----END PGP SIGNATURE-----

--Sig_/wydur/h7UBhnu/l7f8Ha7ul--

--===============1930830967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1930830967==--
