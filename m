Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F02961BE4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F4610E434;
	Wed, 28 Aug 2024 02:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SN47Jk7h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0655110E433;
 Wed, 28 Aug 2024 02:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1724811087;
 bh=GrnMPzsealqVcmG/cpz0XaAX0puRx4QlSU1EyZW3TVc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SN47Jk7hrl6yULXmzQpI/AdxR98etvIwKyrOy/q9IfFvesZIdT1A/XPCIpff9faHS
 uagZNk7NmFPmW1FvpzHGKzmwAAkGKCyN+dxql37k/LBh2/3CpgCtPJKi6LPEQ3I1hs
 PP+gfUt3YHQq03DWQKE6OuanXP3Mgk2XtJs72IUFSKPhEABLGBNhrzovimfXOTk50o
 XfC8an27yeEt88Pb21vouA5BqlaH5t2Lfi373LfWtE/p9pMgM9EBUD+o3eG4+20auo
 PFvAL7p0E0uofKceSjUR0Yinn3POUY+vqtPZSTgvjxxLnJCMtonxWPPqXFmNcF7nQl
 6E9LDWi8Dd3xA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wtnvy1YNqz4x21;
 Wed, 28 Aug 2024 12:11:26 +1000 (AEST)
Date: Wed, 28 Aug 2024 12:11:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, Alex Deucher
 <alexander.deucher@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <20240828121125.1d698246@canb.auug.org.au>
In-Reply-To: <20240826111022.41db1e95@canb.auug.org.au>
References: <20240826111022.41db1e95@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B+ciLLBp8C2=DJ/Pi3m_hKM";
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

--Sig_/B+ciLLBp8C2=DJ/Pi3m_hKM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 26 Aug 2024 11:10:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the amdgpu tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>=20
> between commits:
>=20
>   537ef0f88897 ("drm/amd/display: use new vblank enable policy for DCN35+=
")
>   e45b6716de4b ("drm/amd/display: use a more lax vblank enable policy for=
 DCN35+")
>   58a261bfc967 ("drm/amd/display: use a more lax vblank enable policy for=
 older ASICs")
>=20
> from the drm-misc tree and commit:
>=20
>   7fb363c57522 ("drm/amd/display: Let drm_crtc_vblank_on/off manage inter=
rupts")
>=20
> from the amdgpu tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 34872eb4fc84,7d999e352df3..000000000000
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@@ -8229,66 -8248,12 +8242,35 @@@ static int amdgpu_dm_encoder_init(struc
>  =20
>   static void manage_dm_interrupts(struct amdgpu_device *adev,
>   				 struct amdgpu_crtc *acrtc,
>  -				 bool enable)
>  +				 struct dm_crtc_state *acrtc_state)
>   {
> - 	/*
> - 	 * We have no guarantee that the frontend index maps to the same
> - 	 * backend index - some even map to more than one.
> - 	 *
> - 	 * TODO: Use a different interrupt or check DC itself for the mapping.
> - 	 */
> - 	int irq_type =3D
> - 		amdgpu_display_crtc_idx_to_irq_type(
> - 			adev,
> - 			acrtc->crtc_id);
>  -	if (enable)
>  -		drm_crtc_vblank_on(&acrtc->base);
>  -	else
>  +	struct drm_vblank_crtc_config config =3D {0};
>  +	struct dc_crtc_timing *timing;
>  +	int offdelay;
>  +
>  +	if (acrtc_state) {
>  +		if (amdgpu_ip_version(adev, DCE_HWIP, 0) <
>  +		    IP_VERSION(3, 5, 0) ||
>  +		    acrtc_state->stream->link->psr_settings.psr_version <
>  +		    DC_PSR_VERSION_UNSUPPORTED) {
>  +			timing =3D &acrtc_state->stream->timing;
>  +
>  +			/* at least 2 frames */
>  +			offdelay =3D DIV64_U64_ROUND_UP((u64)20 *
>  +						      timing->v_total *
>  +						      timing->h_total,
>  +						      timing->pix_clk_100hz);
>  +
>  +			config.offdelay_ms =3D offdelay ?: 30;
>  +		} else {
>  +			config.disable_immediate =3D true;
>  +		}
>  +
>  +		drm_crtc_vblank_on_config(&acrtc->base,
>  +					  &config);
> -=20
> - 		amdgpu_irq_get(
> - 			adev,
> - 			&adev->pageflip_irq,
> - 			irq_type);
> - #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
> - 		amdgpu_irq_get(
> - 			adev,
> - 			&adev->vline0_irq,
> - 			irq_type);
> - #endif
>  +	} else {
> - #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
> - 		amdgpu_irq_put(
> - 			adev,
> - 			&adev->vline0_irq,
> - 			irq_type);
> - #endif
> - 		amdgpu_irq_put(
> - 			adev,
> - 			&adev->pageflip_irq,
> - 			irq_type);
>   		drm_crtc_vblank_off(&acrtc->base);
>  +	}
>   }
>  =20
>   static void dm_update_pflip_irq_state(struct amdgpu_device *adev,

This is now a conflict between the drm-misc tree and the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/B+ciLLBp8C2=DJ/Pi3m_hKM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbOh00ACgkQAVBC80lX
0Gw7oQf9EzWizfLWzxAPQO3UVYd23Nrjtx9rLzojxorJcPe/F5a95wCFsldGkRIw
/YHJT5wnZE8HS5uC/8hIv/6nLvjehq3+WgW1l/qKD2KqYzoHkUmFx4SrkotPFogG
1pZfy0g/HsZzy0t+5j/f0wSXiELg37Vx/z8fJ/BxTAOkMzg26RVf8zIByv0eIw/K
ZFxXL57WZoubtpPUTlm0WMwj22inPJEqNrr84LvdJPP/kXcLT9xaak9YgVPGAf3M
KUdVwqaInM/BV1M9mWfwLwy8zA47oaHSFn/w0o/IBRWnFVE/wiSjcUFabY1n7xSh
idFnFFwCrmdxKO9nSohIT/Tw/RLRJQ==
=d0Hz
-----END PGP SIGNATURE-----

--Sig_/B+ciLLBp8C2=DJ/Pi3m_hKM--
