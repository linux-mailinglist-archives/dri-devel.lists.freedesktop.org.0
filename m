Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6419F7F0A50
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 02:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBBE10E075;
	Mon, 20 Nov 2023 01:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF5A10E075;
 Mon, 20 Nov 2023 01:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1700443700;
 bh=Csn+rSOlc7hq+c8kVNN3ZRY0a5UgOwfACyTDU+giBM4=;
 h=Date:From:To:Cc:Subject:From;
 b=GQ5eWlmyF0MfSbdDe8/EDFZ9l/yhyRu23K+EbRZwDdGeXGB6sFWkA4WzWNDq01KsE
 2OBK9ejg8LiiGnbgxHaOP0oE0qC8se1jctVja3ONLZu8Zi9zhAoVwdwuHOl/+hY3jl
 e2cJizyF+sOt6oAdJcis+xfag/TJ2pZj155AuphfD0Of0b2aAuRjQ6Sm9TIKGioFna
 WodTWKADnR54thH/0gpRqk650dUcLz5qcng1ucfMQqy/Tkv0EoZxu2FaiXcV7Ap9h+
 24AJYfDFw/x2c33gm/pikCUHA9qgwzeJ8uiLGOe/p4J459GYV/lxq61Z/ahHBHreh6
 Pl2zBHZtz4qWw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SYVJM2FcNz4wnv;
 Mon, 20 Nov 2023 12:28:18 +1100 (AEDT)
Date: Mon, 20 Nov 2023 12:28:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexdeucher@gmail.com>
Subject: linux-next: manual merge of the drm-intel tree with the amdgpu tree
Message-ID: <20231120122818.09bb6f35@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+H5fErey4cTN8tJv.P0+EJV";
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Fangzhi Zuo <jerry.zuo@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/+H5fErey4cTN8tJv.P0+EJV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c

between commits:

  a58555359a9f ("drm/amd/display: Fix DSC not Enabled on Direct MST Sink")
  c29085d29562 ("drm/amd/display: Enable DSC Flag in MST Mode Validation")

from the amdgpu tree and commit:

  7707dd602259 ("drm/dp_mst: Fix fractional DSC bpp handling")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 8d7d4024f285,2afd1bc74978..000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@@ -1650,7 -1636,8 +1650,7 @@@ enum dc_status dm_dp_mst_is_port_suppor
  	} else {
  		/* check if mode could be supported within full_pbn */
  		bpp =3D convert_dc_color_depth_into_bpc(stream->timing.display_color_de=
pth) * 3;
- 		pbn =3D drm_dp_calc_pbn_mode(stream->timing.pix_clk_100hz / 10, bpp, fa=
lse);
+ 		pbn =3D drm_dp_calc_pbn_mode(stream->timing.pix_clk_100hz / 10, bpp << =
4);
 -
  		if (pbn > aconnector->mst_output_port->full_pbn)
  			return DC_FAIL_BANDWIDTH_VALIDATE;
  	}

--Sig_/+H5fErey4cTN8tJv.P0+EJV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVatjIACgkQAVBC80lX
0GzERQf/dspWZjht/bOS+ur+0tu/EliDMLpiAw0xVsjlhOfvvseEdYHvEo4ZQazz
lf+0LAj7yIQcd6hK+sv2xVn731w/pQwQF6wv7YEAsY/+EZhpwLekV6pnB30dEYyk
H0Cu3eB2QhLvsElHqqzKlq1FTVMpzucS1cfMG07aPFKZJhH8IbfUGBt4JdqFeio2
dpoGTEhVingpmX4KvvrBZc4jH9ef3XO8EAIq9Nm9eIsy4f46bR5+n94cBF1/A3jT
q8pqNYa3Z8b6zdxGeJJ4dT7xarfXEBzPU0JoOp6JsXJxdocFcT3i7geFZBtmKlyU
KD5wQSfN/cqr3IkHAyJdivP/Rx7sZg==
=YqFo
-----END PGP SIGNATURE-----

--Sig_/+H5fErey4cTN8tJv.P0+EJV--
