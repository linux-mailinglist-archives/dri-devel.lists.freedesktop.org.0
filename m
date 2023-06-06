Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC71272499F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 18:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A73710E164;
	Tue,  6 Jun 2023 16:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE6310E164;
 Tue,  6 Jun 2023 16:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6IfKTPJl1CXgfNgP3O2/JxrKzLZYrcVJ1AeNvuc0/hw=; b=e1Ksbzg/74NnkAzeKA66e8hXW4
 duLnvn0mkXW0FpykYm5/mLmPLRlCTPUKyB2zmfKzJoF4tkDIi1qYk836L2NmFUuWawoc+ippKrka+
 GoMnxJvNQ5HXGAOobBDuwmH/UBknu7Od+7J6Y3RThkF7xy1XQSDishvsQk6VCUwDI0NoVzAhUg57o
 1ryXY5g6lMjfqD0o92yva03h452S8CG+VU9LYWGHDLG5lqoLbCkuFIyx7HwEROduah+TN3145TNiG
 I+14JvMUfipKAmm6o4z0dL3qm2H1Z4SQXb5vy9tlHbD5CQg+FFDJL2fDgM7Sv0FnIzEVDd980pAG3
 8K5yxMaA==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q6a0Q-009bfk-Na; Tue, 06 Jun 2023 18:58:02 +0200
Date: Tue, 6 Jun 2023 15:57:53 -0100
From: Melissa Wen <mwen@igalia.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH 06/36] drm/amd/display: add CRTC driver-specific property
 for gamma TF
Message-ID: <20230606165753.dr3xxcdfx7zcn6oe@mail.igalia.com>
References: <20230523221520.3115570-1-mwen@igalia.com>
 <20230523221520.3115570-7-mwen@igalia.com>
 <5ea0146c-19a2-58d9-4cc9-29af6d433915@amd.com>
 <47442442-794b-09da-4c70-1393344ce837@froggi.es>
 <CA+hFU4w3gwAaqvsiQW1Ns4ygi43ihn=iL7Y-Du_nH1RtKNP0sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yz6tkrot255xlvzk"
Content-Disposition: inline
In-Reply-To: <CA+hFU4w3gwAaqvsiQW1Ns4ygi43ihn=iL7Y-Du_nH1RtKNP0sw@mail.gmail.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yz6tkrot255xlvzk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/06, Sebastian Wick wrote:
> On Tue, Jun 6, 2023 at 6:19=E2=80=AFPM Joshua Ashton <joshua@froggi.es> w=
rote:
> >
> >
> >
> > On 6/1/23 20:17, Harry Wentland wrote:
> > >
> > >
> > > On 5/23/23 18:14, Melissa Wen wrote:
> > >> Hook up driver-specific atomic operations for managing AMD color
> > >> properties and create AMD driver-specific color management properties
> > >> and attach them according to HW capabilities defined by `struct
> > >> dc_color_caps`. Add enumerated transfer function property to DRM CRTC
> > >> gamma to convert to wire encoding with or without a user gamma LUT.
> > >> Enumerated TFs are not supported yet by the DRM color pipeline,
> > >> therefore, create a DRM enum list with the predefined TFs supported =
by
> > >> the AMD display driver.
> > >>
> > >> Co-developed-by: Joshua Ashton <joshua@froggi.es>
> > >> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> > >> Signed-off-by: Melissa Wen <mwen@igalia.com>
> > >> ---
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 36 ++++++++++
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  8 +++
> > >>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 22 ++++++
> > >>   .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 72 +++++++++++++++=
+++-
> > >>   4 files changed, 137 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_display.c
> > >> index 389396eac222..88af075e6c18 100644
> > >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > >> @@ -1247,6 +1247,38 @@ amdgpu_display_user_framebuffer_create(struct=
 drm_device *dev,
> > >>      return &amdgpu_fb->base;
> > >>   }
> > >>
> > >> +static const struct drm_prop_enum_list drm_transfer_function_enum_l=
ist[] =3D {
> > >> +    { DRM_TRANSFER_FUNCTION_DEFAULT, "Default" },
> > >> +    { DRM_TRANSFER_FUNCTION_SRGB, "sRGB" },
> > >> +    { DRM_TRANSFER_FUNCTION_BT709, "BT.709" },
> > >> +    { DRM_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
> > >> +    { DRM_TRANSFER_FUNCTION_LINEAR, "Linear" },
> > >> +    { DRM_TRANSFER_FUNCTION_UNITY, "Unity" },
> > >> +    { DRM_TRANSFER_FUNCTION_HLG, "HLG (Hybrid Log Gamma)" },
> > >> +    { DRM_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
> > >> +    { DRM_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
> > >> +    { DRM_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
> > >> +};
> > >
> > > Let's not use the DRM_/drm_ prefix here. It might clash later when
> > > we introduce DRM_ core interfaces for enumerated transfer functions.
> > >
> > > We'll want to specify whether something is an EOTF or an inverse EOTF,
> > > or possibly an OETF. Of course that wouldn't apply to "Linear" or
> > > "Unity" (I'm assuming the two are the same?).
> > >
> > > EOTF =3D electro-optical transfer function
> > > This is the transfer function to go from the encoded value to an
> > > optical (linear) value.
> > >
> > > Inverse EOTF =3D simply the inverse of the EOTF
> > > This is usually intended to go from an optical/linear space (which
> > > might have been used for blending) back to the encoded values.
> > >
> > > OETF =3D opto-electronic transfer function
> > > This is usually used for converting optical signals into encoded
> > > values. Usually that's done on the camera side but I think HLG might
> > > define the OETF instead of the EOTF. A bit fuzzy on that. If you're
> > > unclear about HLG I recommend we don't include it yet.
> > >
> > > It would also be good to document a bit more what each of the TFs
> > > mean, but I'm fine if that comes later with a "driver-agnostic"
> > > API. The key thing to clarify is whether we have an EOTF or inv_EOTF,
> > > i.e. whether we use the TF to go from encoded to optical or vice
> > > versa.
> >
> > Whether we use the inverse or not is just determined per-block though.
> >
> > I think we should definitely document it per-block very explicitly
> > (whether it is EOTF or inv EOTF) but I don't think we need to touch the
> > enums here.
>=20
> Either the drm prefix has to be removed or the enum variant names have
> to be explicitly be the EOTF, OETF, inverse EOTF or inverse OETF.

I'm okay on using `AMD_` prefix instead of `DRM_` for this
driver-specific implementation. I think the position of each block in
the pipeline already describe the conversion type, since we only
implemented one conversion type per-block. So, I agree we can keep it
simple as Joshua suggested (don't extend enum, just document blocks -
should it be a kernel doc?).

Melissa

>=20
> > - Joshie =F0=9F=90=B8=E2=9C=A8
> >
> > >
> > > I know DC is sloppy and doesn't define those but it will still use
> > > them as either EOTF or inv_EOTF, based on which block they're being
> > > programmed, if I'm not mistaken.
> > >
> > >> +
> > >> +#ifdef AMD_PRIVATE_COLOR
> > >> +static int
> > >> +amdgpu_display_create_color_properties(struct amdgpu_device *adev)
> > >> +{
> > >> +    struct drm_property *prop;
> > >> +
> > >> +    prop =3D drm_property_create_enum(adev_to_drm(adev),
> > >> +                                    DRM_MODE_PROP_ENUM,
> > >> +                                    "AMD_REGAMMA_TF",
> > >> +                                    drm_transfer_function_enum_list,
> > >> +                                    ARRAY_SIZE(drm_transfer_functio=
n_enum_list));
> > >> +    if (!prop)
> > >> +            return -ENOMEM;
> > >> +    adev->mode_info.regamma_tf_property =3D prop;
> > >> +
> > >> +    return 0;
> > >> +}
> > >> +#endif
> > >> +
> > >
> > > It'd be nice if we have this function and the above enum_list
> > > in amdgpu_dm, possibly in amdgpu_dm_color.c. You could call it
> > > directly after the amdgpu_display_modeset_create_prop() call in
> > > amdgpu_dm_mode_config_init().
> > >
> > >>   const struct drm_mode_config_funcs amdgpu_mode_funcs =3D {
> > >>      .fb_create =3D amdgpu_display_user_framebuffer_create,
> > >>   };
> > >> @@ -1323,6 +1355,10 @@ int amdgpu_display_modeset_create_props(struc=
t amdgpu_device *adev)
> > >>                      return -ENOMEM;
> > >>      }
> > >>
> > >> +#ifdef AMD_PRIVATE_COLOR
> > >> +    if (amdgpu_display_create_color_properties(adev))
> > >> +            return -ENOMEM;
> > >> +#endif
> > >>      return 0;
> > >>   }
> > >>
> > >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_mode.h
> > >> index b8633df418d4..881446c51b36 100644
> > >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > >> @@ -344,6 +344,14 @@ struct amdgpu_mode_info {
> > >>      int                     disp_priority;
> > >>      const struct amdgpu_display_funcs *funcs;
> > >>      const enum drm_plane_type *plane_type;
> > >> +
> > >> +    /* Driver-private color mgmt props */
> > >> +
> > >> +    /* @regamma_tf_property: Transfer function for CRTC regamma
> > >> +     * (post-blending). Possible values are defined by `enum
> > >> +     * drm_transfer_function`.
> > >> +     */
> > >> +    struct drm_property *regamma_tf_property;
> > >>   };
> > >>
> > >>   #define AMDGPU_MAX_BL_LEVEL 0xFF
> > >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > >> index 2e2413fd73a4..ad5ee28b83dc 100644
> > >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > >> @@ -699,6 +699,20 @@ static inline void amdgpu_dm_set_mst_status(uin=
t8_t *status,
> > >>
> > >>   extern const struct amdgpu_ip_block_version dm_ip_block;
> > >>
> > >> +enum drm_transfer_function {
> > >> +    DRM_TRANSFER_FUNCTION_DEFAULT,
> > >> +    DRM_TRANSFER_FUNCTION_SRGB,
> > >> +    DRM_TRANSFER_FUNCTION_BT709,
> > >> +    DRM_TRANSFER_FUNCTION_PQ,
> > >> +    DRM_TRANSFER_FUNCTION_LINEAR,
> > >> +    DRM_TRANSFER_FUNCTION_UNITY,
> > >> +    DRM_TRANSFER_FUNCTION_HLG,
> > >> +    DRM_TRANSFER_FUNCTION_GAMMA22,
> > >> +    DRM_TRANSFER_FUNCTION_GAMMA24,
> > >> +    DRM_TRANSFER_FUNCTION_GAMMA26,
> > >> +    DRM_TRANSFER_FUNCTION_MAX,
> > >> +};
> > >> +
> > >>   struct dm_plane_state {
> > >>      struct drm_plane_state base;
> > >>      struct dc_plane_state *dc_state;
> > >> @@ -726,6 +740,14 @@ struct dm_crtc_state {
> > >>      struct dc_info_packet vrr_infopacket;
> > >>
> > >>      int abm_level;
> > >> +
> > >> +        /**
> > >> +     * @regamma_tf:
> > >> +     *
> > >> +     * Pre-defined transfer function for converting internal FB -> =
wire
> > >> +     * encoding.
> > >> +     */
> > >> +    enum drm_transfer_function regamma_tf;
> > >
> > > Again, let's avoid a drm_ prefix. Maybe name all this amdgpu_ instead.
> > >
> > >>   };
> > >>
> > >>   #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, =
base)
> > >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > >> index e3762e806617..1eb279d341c5 100644
> > >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > >> @@ -229,7 +229,6 @@ static void dm_crtc_destroy_state(struct drm_crt=
c *crtc,
> > >>      if (cur->stream)
> > >>              dc_stream_release(cur->stream);
> > >>
> > >> -
> > >
> > > nit: stray newline
> > >
> > > Harry
> > >
> > >>      __drm_atomic_helper_crtc_destroy_state(state);
> > >>
> > >>
> > >> @@ -263,6 +262,7 @@ static struct drm_crtc_state *dm_crtc_duplicate_=
state(struct drm_crtc *crtc)
> > >>      state->freesync_config =3D cur->freesync_config;
> > >>      state->cm_has_degamma =3D cur->cm_has_degamma;
> > >>      state->cm_is_degamma_srgb =3D cur->cm_is_degamma_srgb;
> > >> +    state->regamma_tf =3D cur->regamma_tf;
> > >>      state->crc_skip_count =3D cur->crc_skip_count;
> > >>      state->mpo_requested =3D cur->mpo_requested;
> > >>      /* TODO Duplicate dc_stream after objects are stream object is =
flattened */
> > >> @@ -299,6 +299,69 @@ static int amdgpu_dm_crtc_late_register(struct =
drm_crtc *crtc)
> > >>   }
> > >>   #endif
> > >>
> > >> +#ifdef AMD_PRIVATE_COLOR
> > >> +/**
> > >> + * drm_crtc_additional_color_mgmt - enable additional color propert=
ies
> > >> + * @crtc: DRM CRTC
> > >> + *
> > >> + * This function lets the driver enable the 3D LUT color correction=
 property
> > >> + * on a CRTC. This includes shaper LUT, 3D LUT and regamma TF. The =
shaper
> > >> + * LUT and 3D LUT property is only attached if its size is not 0.
> > >> + */
> > >> +static void
> > >> +dm_crtc_additional_color_mgmt(struct drm_crtc *crtc)
> > >> +{
> > >> +    struct amdgpu_device *adev =3D drm_to_adev(crtc->dev);
> > >> +
> > >> +    if(adev->dm.dc->caps.color.mpc.ogam_ram)
> > >> +            drm_object_attach_property(&crtc->base,
> > >> +                                       adev->mode_info.regamma_tf_p=
roperty,
> > >> +                                       DRM_TRANSFER_FUNCTION_DEFAUL=
T);
> > >> +}
> > >> +
> > >> +static int
> > >> +amdgpu_dm_atomic_crtc_set_property(struct drm_crtc *crtc,
> > >> +                               struct drm_crtc_state *state,
> > >> +                               struct drm_property *property,
> > >> +                               uint64_t val)
> > >> +{
> > >> +    struct amdgpu_device *adev =3D drm_to_adev(crtc->dev);
> > >> +    struct dm_crtc_state *acrtc_state =3D to_dm_crtc_state(state);
> > >> +
> > >> +    if (property =3D=3D adev->mode_info.regamma_tf_property) {
> > >> +            if (acrtc_state->regamma_tf !=3D val) {
> > >> +                    acrtc_state->regamma_tf =3D val;
> > >> +                    acrtc_state->base.color_mgmt_changed |=3D 1;
> > >> +            }
> > >> +    } else {
> > >> +            drm_dbg_atomic(crtc->dev,
> > >> +                           "[CRTC:%d:%s] unknown property [PROP:%d:=
%s]]\n",
> > >> +                           crtc->base.id, crtc->name,
> > >> +                           property->base.id, property->name);
> > >> +            return -EINVAL;
> > >> +    }
> > >> +
> > >> +    return 0;
> > >> +}
> > >> +
> > >> +static int
> > >> +amdgpu_dm_atomic_crtc_get_property(struct drm_crtc *crtc,
> > >> +                               const struct drm_crtc_state *state,
> > >> +                               struct drm_property *property,
> > >> +                               uint64_t *val)
> > >> +{
> > >> +    struct amdgpu_device *adev =3D drm_to_adev(crtc->dev);
> > >> +    struct dm_crtc_state *acrtc_state =3D to_dm_crtc_state(state);
> > >> +
> > >> +    if (property =3D=3D adev->mode_info.regamma_tf_property)
> > >> +            *val =3D acrtc_state->regamma_tf;
> > >> +    else
> > >> +            return -EINVAL;
> > >> +
> > >> +    return 0;
> > >> +}
> > >> +#endif
> > >> +
> > >>   /* Implemented only the options currently available for the driver=
 */
> > >>   static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs =3D {
> > >>      .reset =3D dm_crtc_reset_state,
> > >> @@ -317,6 +380,10 @@ static const struct drm_crtc_funcs amdgpu_dm_cr=
tc_funcs =3D {
> > >>   #if defined(CONFIG_DEBUG_FS)
> > >>      .late_register =3D amdgpu_dm_crtc_late_register,
> > >>   #endif
> > >> +#ifdef AMD_PRIVATE_COLOR
> > >> +    .atomic_set_property =3D amdgpu_dm_atomic_crtc_set_property,
> > >> +    .atomic_get_property =3D amdgpu_dm_atomic_crtc_get_property,
> > >> +#endif
> > >>   };
> > >>
> > >>   static void dm_crtc_helper_disable(struct drm_crtc *crtc)
> > >> @@ -480,6 +547,9 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_ma=
nager *dm,
> > >>
> > >>      drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT=
_ENTRIES);
> > >>
> > >> +#ifdef AMD_PRIVATE_COLOR
> > >> +    dm_crtc_additional_color_mgmt(&acrtc->base);
> > >> +#endif
> > >>      return 0;
> > >>
> > >>   fail:
> > >
> >
>=20

--yz6tkrot255xlvzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmR/ZYsACgkQwqF3j0dL
ehy6WBAAtURzcWWPYOR/lv/LB8/MLt5T7xHK4wLV50gC0UeY03Q2SVsha/UlBNbC
N0V0RlpWyIM+vWwI4FnOKvJWQw9DdjaP6YPKl8vnIEmZgwQpTeUPimPVl7JCxNT7
KSFLAUckojmWwUJlhR8RiQN20Tuq50fQP4No5b8vdcZfEdqdDwr7yL37iHiQbkvL
XUEOHgcLR8mPtkkB689rtDf5EpyWljIB1iILJzLOq7p/k5txJIjjHcModtJRRJNb
aJNtNZHXOIPTKx6jQsDeR+2tj4XF9xWCJKPi2Hrfz+7qNJJcaXBgdB0t0z6SIdCI
SwmPZPl9BG2ZL+QhHyxZeW7Ifdrfv4Y7C+U/TSqMmYRzTPt32cNWRqQvElTLC/VL
NiQj6JSmr1pVytnHPJaulBgN5bJNwLZQ892VEUQi9+XuhRKX4qBCElUrusTDRmhc
IQuKtweWa71t0+TxAUrUyfYDPTrBBz+2i6C6DvRQmiz+LaHVkyYG0C/uQxOf9Xuw
vR5Ut1gK2DGnTZiL7MgQd2HoFYYvSat71KTSdAcypQWt67lg+OWh6OftsGc8LBo1
K0asC+qRFz5BpQNMriKgDbn20h8hJfbhTxqHj6cIhqkCZTba9DZmGtwmS7lSblCb
lTNgR579sj+uwlZoUrQCCxBMGHQ1Wyf0fpVOXq6v1WSk8yKHRfc=
=r4JL
-----END PGP SIGNATURE-----

--yz6tkrot255xlvzk--
