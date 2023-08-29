Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F29B278C722
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817F310E2A3;
	Tue, 29 Aug 2023 14:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137E210E29B;
 Tue, 29 Aug 2023 14:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fYoYQWql3dN6ng+TGsbsiiMf9BBnWIaalGw9xQefjYk=; b=Ci19qVZTBOqwCXTlzrnATN24YB
 pi9hyEZrP/TObcteDM7Z06XnMlNwYrmN7LeGtB05N2QHeT4Ev442E/22Ec9QJ0KnfC/324NFDCdq6
 TGU7faHhdBdG41wg8SpKrzNyjv5bpBkqwObNs7eNrYBO5b3tgkxNVTaBHUK2KvjsSmGnjG1WmCDbV
 4yFm4SmYjS3Fm+a2XVOLP0A7W4HdETBVIRzCHG/AucmyzFkLAhM7KLcceHAvtwEOSQ0kZsh0ogr/B
 2M4i1tFZK7w2VsjyQVcEmkTVbEo7Bi2MRcHjxKOWe9Wi6m+jrIDTL2ycxt6w/URjx7DJmxs5JveEc
 /FbLG1Sg==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qazWA-00GrW9-Iq; Tue, 29 Aug 2023 16:16:30 +0200
Date: Tue, 29 Aug 2023 13:16:17 -0100
From: Melissa Wen <mwen@igalia.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: Re: [PATCH] Revert "Revert "drm/amd/display: Implement zpos property""
Message-ID: <20230829141617.3ijuabdlxsxchsgp@mail.igalia.com>
References: <20230829113931.54391-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ph4kusoypisuj3hq"
Content-Disposition: inline
In-Reply-To: <20230829113931.54391-1-hamza.mahfooz@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Choi <Nicholas.Choi@amd.com>, amd-gfx@lists.freedesktop.org,
 =?utf-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ph4kusoypisuj3hq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/29, Hamza Mahfooz wrote:
> This reverts commit 984612bd4649c91f12e9c7c7f9e914fdc8ba7d3f.
>=20
> The problematic IGT test case (i.e. kms_atomic@plane-immutable-zpos) has
> been fixed as of commit cb77add45011 ("tests/kms_atomic: remove zpos <
> N-planes assert") to the IGT repo. So, reintroduce the reverted code.
>=20
> Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/cb77add45=
011b129e21f3cb2a4089a73dde56179
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Reviewed-by: Melissa Wen <mwen@igalia.com>

Thanks!

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 894bc7e4fdaa..df568a7cd005 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1469,6 +1469,15 @@ int amdgpu_dm_plane_init(struct amdgpu_display_man=
ager *dm,
>  		drm_plane_create_blend_mode_property(plane, blend_caps);
>  	}
> =20
> +	if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> +		drm_plane_create_zpos_immutable_property(plane, 0);
> +	} else if (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY) {
> +		unsigned int zpos =3D 1 + drm_plane_index(plane);
> +		drm_plane_create_zpos_property(plane, zpos, 1, 254);
> +	} else if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR) {
> +		drm_plane_create_zpos_immutable_property(plane, 255);
> +	}
> +
>  	if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY &&
>  	    plane_cap &&
>  	    (plane_cap->pixel_format_support.nv12 ||
> --=20
> 2.41.0
>=20

--ph4kusoypisuj3hq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmTt/asACgkQwqF3j0dL
ehz5iw//QTl4lSEpR0vCfckR4A9elJXQoof+pg4TqvoMD4opBuiR+1qzD0KMp2bQ
QD1KFcidiX8En5NXn/hOH076RdL8JwmFrfYQgknbiI2zqoSAKpdhClOusvMwaFvB
lVTro1WPASWUnXq2lQK7B7svFRVLccXE+QBwBHDc97xam/mpMlZmHm7NmVoX5AUd
ComKePR48jrfWvnA1ERgkMT9LGBf8KB6clK1gds0KJPPC5eHUBJ+p3R8U4ODSVxh
r5bwHF610VsDsIgmTBUKPuOpTFL3c0pM9zI7E4qoCxmv/4RroW5/nMQow8EpQvdp
/w60vj1LQILnkQRJZ1rOx0WuCjAReek+Wve9RQvkWzuwH1WNRHvW7mylP8K0//l5
zs4t2R0OuMv2Tq+rdZ1t4C2KAZpYsUI//v3v8MQ3cj7qFZ3246n65gwwKEGN3Fi+
0zUlrH60DKwtNie7aB/j70Vuc5ppqCFES3vSQ3iSs9RS4Aem8s0IfzY/N9q0pHy1
n+BF/bghLLqGJc9kAE7voBzPplkQsAVyVXNa9jX9TZm9FUg1Akxwe+R0fDJoSYYo
TV8+Wv55UOH0iHm6tBTEn3neCyamrSsJ6fHQdFsgTQD5K+v+DblHYCgdbF9SK6ru
EVh9fR1P5ohnS9WPHQ90PDn9Nl0MU4LoPpDOTk8jWVgw0F/5dNc=
=C0wn
-----END PGP SIGNATURE-----

--ph4kusoypisuj3hq--
