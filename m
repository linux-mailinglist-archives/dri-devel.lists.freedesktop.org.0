Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEEFD5913
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 02:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00B46E193;
	Mon, 14 Oct 2019 00:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1056E18E;
 Mon, 14 Oct 2019 00:31:38 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46rzyH00sKz9sPZ;
 Mon, 14 Oct 2019 11:31:34 +1100 (AEDT)
Date: Mon, 14 Oct 2019 11:31:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: DRI <dri-devel@lists.freedesktop.org>, Alex Deucher
 <alexdeucher@gmail.com>, Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: manual merge of the drm-misc tree with the admgpu tree
Message-ID: <20191014113134.0c184189@canb.auug.org.au>
In-Reply-To: <20191004111022.28bde6dc@canb.auug.org.au>
References: <20191004111022.28bde6dc@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1571013095;
 bh=txVz+KpHTxEXihitXuFZCcO9n7x7mzXgF+D2GNtYfrw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=he841bBBQ/gzvmza/djAZ4S4uuvtodWQwZDcpYdZNqN+cl3nyVtZiYwnGFYxk3mCZ
 qUR92yoo5I6tskb1kSDFmWtXHPt7m9WsFwapFn9xHKdKBBa4rrbWJLoFz8efJMf2Gi
 Gl9lPPOuBGdeNiQkR8aKUGZwRds0LfJ642LBOFwmYigG4VWppyuHujRMbXMiUcax4A
 aoHj4DAL3yl6hp36+5wYamQ+zTR5R9Ilm+0nglcs1nyh1g54ijFX3tbHcq2eu3mGNF
 HCT/SdlfwIJxnK7GlwHSPQlAF78F66DiQ8rxDHw4pBDSmyaH5afJfnmU1kmHe2WiMy
 lTATyUr5mb9Tw==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: multipart/mixed; boundary="===============1274869292=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1274869292==
Content-Type: multipart/signed; boundary="Sig_/8.OEXchmsJkajXkYsLBXLIM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8.OEXchmsJkajXkYsLBXLIM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

This is now a conflict between the amdgpu tree and the drm tree.

On Fri, 4 Oct 2019 11:10:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>=20
> between commit:
>=20
>   2f232cf29e03 ("drm/amdgpu/dm/mst: Don't create MST topology managers fo=
r eDP ports")
>=20
> from the admgpu tree and commit:
>=20
>   ae85b0df124f ("drm_dp_cec: add connector info support.")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 3af2b429ff1b,5ec14efd4d8c..000000000000
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@@ -414,11 -416,7 +414,11 @@@ void amdgpu_dm_initialize_dp_connector(
>  =20
>   	drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
>   	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> - 				      aconnector->base.name, dm->adev->dev);
> + 				      &aconnector->base);
>  +
>  +	if (aconnector->base.connector_type =3D=3D DRM_MODE_CONNECTOR_eDP)
>  +		return;
>  +
>   	aconnector->mst_mgr.cbs =3D &dm_mst_cbs;
>   	drm_dp_mst_topology_mgr_init(
>   		&aconnector->mst_mgr,

--=20
Cheers,
Stephen Rothwell

--Sig_/8.OEXchmsJkajXkYsLBXLIM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2jweYACgkQAVBC80lX
0Gz/6QgAjNQ3/SDnmDTMfowInDEfiJMBTQe26l3MvmGi1dt7W6/wj34iCRN8Cop6
1EtRLK8+JWELbhtSYzzY9+zSAgoyD3f5jRGO6+4GvpW7bqvXkl/yPbxWl+sQdV16
XfyrR45kO7hGd7+8iofk/ELBQjs8F7J6EyQevHTGBYr2tGgK8lSRsnIYs0BDtYzB
MWsCTAstSFA1nl9NOIh7XFq8SSoICWjKon0aMB489Y2TGygqSj/QB17P1C6PIRjP
2D13KApEXAWVnuk9zbC47Py3L/3NfCXpITcmluEfMPX1DdGlf0UXMtHSlS8zUbp2
rzQ/OUf4SpoFzixR19BwIo2S6JZN1A==
=HuqD
-----END PGP SIGNATURE-----

--Sig_/8.OEXchmsJkajXkYsLBXLIM--

--===============1274869292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1274869292==--
