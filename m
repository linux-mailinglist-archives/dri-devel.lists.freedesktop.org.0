Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 697136FCB5C
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 18:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78E710E16D;
	Tue,  9 May 2023 16:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDD510E16D;
 Tue,  9 May 2023 16:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x+H8K1XCNAnGXzLGAuK9t2Lpj5ZQtB8rGAmZJN7E4a0=; b=WZ77P8w+Lqs0VEXbN5ekOCxWFO
 7vlboLAWtgq/b5CJmY3b6y/yCYEuzYC5eN8iAPpw/Ce7Qp+l6mroAXunF35Apd2JsAEVDcY9xamcL
 OVPRfOEGmOQ+p3Pgyadw85wi8pamY64g+NxZ26q9Em4PMBR/fsuZlp+UblFawWtl2bUMN0r+dO2vY
 2Zl+P8qXMNrWBd85VL+8QZmRpy6MFX3el1lOwULOszpbSt1yR8qtSzQlNQdZ5huPQZL/4yS4ucYlD
 Sz3icvdhWLtVDbYyuTRc42e+itZWai2/NuSN14CG+phDlx42jL9L63Dl5lB3CDgPFs/TJAZ72bDYn
 fhfpQYmw==;
Received: from [38.44.72.37] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pwQIQ-0052cf-2H; Tue, 09 May 2023 18:34:38 +0200
Date: Tue, 9 May 2023 15:34:34 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 07/40] drm/amd/display: add CRTC gamma TF to
 driver-private props
Message-ID: <20230509163434.6xk5geyabfjydie5@mail.igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
 <20230423141051.702990-8-mwen@igalia.com>
 <e931004a-e8e3-5c27-cee7-ec3bba23fb3e@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pw4y24klhmpt4hkg"
Content-Disposition: inline
In-Reply-To: <e931004a-e8e3-5c27-cee7-ec3bba23fb3e@amd.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 linux-kernel@vger.kernel.org, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pw4y24klhmpt4hkg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/08, Harry Wentland wrote:
>=20
>=20
> On 4/23/23 10:10, Melissa Wen wrote:
> > From: Joshua Ashton <joshua@froggi.es>
> >=20
> > Add predefined transfer function property to DRM CRTC gamma to convert
> > to wire encoding with or without gamma LUT.
> >=20
>=20
> Are all these new CRTC properties used by gamescope? I would be reluctant
> to merge them if they're currently not needed.

The regamma TF yes. The shaper and 3D LUT not yet.

I'll double check with Joshie and drop from the series what we don't
have a short-term perspective of usage.

>=20
> > Co-developed-by: Melissa Wen <mwen@igalia.com>
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > Signed-off-by: Joshua Ashton <joshua@froggi.es>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 22 ++++++++++++++++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  4 ++++
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 23 +++++++++++++++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 13 +++++++++++
> >  4 files changed, 62 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_display.c
> > index 2abe5fe87c10..1913903cab88 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > @@ -1248,6 +1248,19 @@ amdgpu_display_user_framebuffer_create(struct dr=
m_device *dev,
> >  }
> > =20
> >  #ifdef CONFIG_STEAM_DECK
> > +static const struct drm_prop_enum_list drm_transfer_function_enum_list=
[] =3D {
> > +	{ DRM_TRANSFER_FUNCTION_DEFAULT, "Default" },
> > +	{ DRM_TRANSFER_FUNCTION_SRGB, "sRGB" },
> > +	{ DRM_TRANSFER_FUNCTION_BT709, "BT.709" },
> > +	{ DRM_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
> > +	{ DRM_TRANSFER_FUNCTION_LINEAR, "Linear" },
> > +	{ DRM_TRANSFER_FUNCTION_UNITY, "Unity" },
> > +	{ DRM_TRANSFER_FUNCTION_HLG, "HLG (Hybrid Log Gamma)" },
> > +	{ DRM_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
> > +	{ DRM_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
> > +	{ DRM_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
> > +};
> > +
>=20
> Would it be better to prefix things with AMD_/amd_ to avoid confusion? On=
 the other
> hand, these will likely just move into DRM core once we get the generic c=
olor uAPI.
>=20
> Harry
>=20
> >  static int
> >  amdgpu_display_create_color_properties(struct amdgpu_device *adev)
> >  {
> > @@ -1281,6 +1294,15 @@ amdgpu_display_create_color_properties(struct am=
dgpu_device *adev)
> >  		return -ENOMEM;
> >  	adev->mode_info.lut3d_size_property =3D prop;
> > =20
> > +	prop =3D drm_property_create_enum(adev_to_drm(adev),
> > +					DRM_MODE_PROP_ENUM,
> > +					"GAMMA_TF",
> > +					drm_transfer_function_enum_list,
> > +					ARRAY_SIZE(drm_transfer_function_enum_list));
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	adev->mode_info.gamma_tf_property =3D prop;
> > +
> >  	return 0;
> >  }
> >  #endif
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_mode.h
> > index 205fa4f5bea7..76337e18c728 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > @@ -368,6 +368,10 @@ struct amdgpu_mode_info {
> >  	 * LUT as supported by the driver (read-only).
> >  	 */
> >  	struct drm_property *lut3d_size_property;
> > +	/**
> > +	 * @gamma_tf_property: Transfer function for CRTC regamma.
> > +	 */
> > +	struct drm_property *gamma_tf_property;
> >  #endif
> >  };
> > =20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > index 09c3e1858b56..1e90a2dd445e 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > @@ -699,6 +699,23 @@ static inline void amdgpu_dm_set_mst_status(uint8_=
t *status,
> > =20
> >  extern const struct amdgpu_ip_block_version dm_ip_block;
> > =20
> > +#ifdef CONFIG_STEAM_DECK
> > +enum drm_transfer_function {
> > +	DRM_TRANSFER_FUNCTION_DEFAULT,
> > +
> > +	DRM_TRANSFER_FUNCTION_SRGB,
> > +	DRM_TRANSFER_FUNCTION_BT709,
> > +	DRM_TRANSFER_FUNCTION_PQ,
> > +	DRM_TRANSFER_FUNCTION_LINEAR,
> > +	DRM_TRANSFER_FUNCTION_UNITY,
> > +	DRM_TRANSFER_FUNCTION_HLG,
> > +	DRM_TRANSFER_FUNCTION_GAMMA22,
> > +	DRM_TRANSFER_FUNCTION_GAMMA24,
> > +	DRM_TRANSFER_FUNCTION_GAMMA26,
> > +	DRM_TRANSFER_FUNCTION_MAX,
> > +};
> > +#endif
> > +
> >  struct dm_plane_state {
> >  	struct drm_plane_state base;
> >  	struct dc_plane_state *dc_state;
> > @@ -751,6 +768,12 @@ struct dm_crtc_state {
> >  	 * &struct drm_color_lut.
> >  	 */
> >  	struct drm_property_blob *lut3d;
> > +        /**
> > +	 * @gamma_tf:
> > +	 *
> > +	 * Pre-defined transfer function for converting internal FB -> wire e=
ncoding.
> > +	 */
> > +	enum drm_transfer_function gamma_tf;
> >  #endif
> >  };
> > =20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > index 0e1280228e6e..79324fbab1f1 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > @@ -272,6 +272,7 @@ static struct drm_crtc_state *dm_crtc_duplicate_sta=
te(struct drm_crtc *crtc)
> >  #ifdef CONFIG_STEAM_DECK
> >  	state->shaper_lut =3D cur->shaper_lut;
> >  	state->lut3d =3D cur->lut3d;
> > +	state->gamma_tf =3D cur->gamma_tf;
> > =20
> >  	if (state->shaper_lut)
> >  		drm_property_blob_get(state->shaper_lut);
> > @@ -336,6 +337,11 @@ dm_crtc_additional_color_mgmt(struct drm_crtc *crt=
c)
> >  					   adev->mode_info.lut3d_size_property,
> >  					   MAX_COLOR_3DLUT_ENTRIES);
> >  	}
> > +
> > +	if(adev->dm.dc->caps.color.mpc.ogam_ram)
> > +		drm_object_attach_property(&crtc->base,
> > +					   adev->mode_info.gamma_tf_property,
> > +					   DRM_TRANSFER_FUNCTION_DEFAULT);
> >  }
> > =20
> >  static int
> > @@ -398,6 +404,11 @@ amdgpu_dm_atomic_crtc_set_property(struct drm_crtc=
 *crtc,
> >  					&replaced);
> >  		acrtc_state->base.color_mgmt_changed |=3D replaced;
> >  		return ret;
> > +	} else if (property =3D=3D adev->mode_info.gamma_tf_property) {
> > +		if (acrtc_state->gamma_tf !=3D val) {
> > +			acrtc_state->gamma_tf =3D val;
> > +			acrtc_state->base.color_mgmt_changed |=3D 1;
> > +		}
> >  	} else {
> >  		drm_dbg_atomic(crtc->dev,
> >  			       "[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
> > @@ -424,6 +435,8 @@ amdgpu_dm_atomic_crtc_get_property(struct drm_crtc =
*crtc,
> >  	else if (property =3D=3D adev->mode_info.lut3d_property)
> >  		*val =3D (acrtc_state->lut3d) ?
> >  			acrtc_state->lut3d->base.id : 0;
> > +	else if (property =3D=3D adev->mode_info.gamma_tf_property)
> > +		*val =3D acrtc_state->gamma_tf;
> >  	else
> >  		return -EINVAL;
> > =20
>=20
>=20

--pw4y24klhmpt4hkg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmRadhkACgkQwqF3j0dL
ehwXAA//VeejdTUmpLf5j+sLmh1WNkexn3maUW13AEU3yqFBksHOKG6EEIImugzQ
sR9KN+NA333ogQm47xBAhjJMfJvE8U57szlml1NsiRlp2j1ndLa9/kTMLgcapdPr
nwfy6MjPhvk+uxArKvjMXiTMNnXhVYF0WhZXA5D89TTDp1g7WfLbx6oVuxpyvrPC
NGZxy3wqyHQOOseXF7hXZpfjxDtHYNfMQXgyqc54l9KPfG7GkEpvmEtGN15u/Qvn
WJv9AOk6qGn9NF/Z8xXq2xskPeMFoqhfK+7oy92tC92IYRZirWdad8CceUXXiPRP
JCLx80TviezXQoM5f/jaJSQGuQp3LpGUI2hNw1j1njitXLfotYJxDlf3DJSpehDL
/EgRvJHxHgjp/DVo6/43mVMGv1ZXpQ2IVy/nFQ0Ohzb0Obf9KEd/oWQFB2CwVRer
aHiwaDEUJGiQNbKCE++w2z8ykJ7V8yX9x/WEM7VPVx+M4zmg0V9rwmtTQWDFPd6F
5BS0q/AdlbYqQ3sr12pGhytNSfjZae0FbORkYGVEowHs8RvmWhEqkV2qPZ3HFMrk
GpVLqhBTIym8gNEJ90rceenOppcrDea68Q1W5SB9CkvvXGv84KWCXPQT7ujMRUL5
BzAxC/OUC+F1S7trAbNxIWoANm4SdR9TlQj6vwFhJEqK+oo0Ouc=
=2t/h
-----END PGP SIGNATURE-----

--pw4y24klhmpt4hkg--
