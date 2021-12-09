Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297DC46F6C5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 23:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C190F10E157;
	Thu,  9 Dec 2021 22:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F62210E23E;
 Thu,  9 Dec 2021 19:42:34 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id d10so16277013ybe.3;
 Thu, 09 Dec 2021 11:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UNgDpoXUl5PbvlFCagcOFS5xmBaoMxzD9DzgTdekBIA=;
 b=FujjdwIhEPxTTwRo0uxVovXeeYdYPC596C8vKtpzjSicoiM1G27DxZGnR9O5uK8Yuq
 Z2smaSgFdOe+Jft1ilFLwcmI37VpJLRWNJGA5vv6bUjgvdUj+5o8KFR6WSWp1b00Dsfy
 TBLxABsouqRQ6ehv6ybh+wnL6vgOXK3mIUOg84wlzGNS1JYzpigH20sEbrU5A5BLcG2d
 XKbI4lUoUtQx++0kZeMYmapLHkW1j7meEaJEGBsvojVr/LeW+XfCVXjvQmemi2pVwrTy
 Hv3bYOAeNCgLTVxCN6lzCqo79SXigfVvFYkYP/k6ei3DdMHHBk+hnjMLkwvyWMEfZ83U
 Y3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UNgDpoXUl5PbvlFCagcOFS5xmBaoMxzD9DzgTdekBIA=;
 b=dPYRpjjSYMhpZZ4YzQWILq0zjcoTpOPt4A5v4QdUnJz3RX/Lxwew8lOKw1t6laV1jH
 Q8s06vA48c6bSkOYrsK4deqlC1FMrelooHicq7AMO45L0rUCwsjt3tMIE9oJoisICOoI
 lU85AsY4Rnx0EVmJCb/Cy+iKgsMZM7EhMui9lILXoYCO8nplY3FYXuL6w9lpJN+F+ksk
 8+K0tVVcVRg9JgKPyRfWUUrsaErjLsEED+xJb64AFHzk2BD2S45HYH5VJHpNB14dLkEM
 BspIp3DxVbj+0YaVKzjvVOJ6eleDgXJ6/EAts+634tnuVtvJLMKR/M6UJgNj0rZe3EFh
 0YHA==
X-Gm-Message-State: AOAM533a3d9qTD+vFg/MVAIvRnW6bQOqnt57wa5BLkOe9p14gGMLoDKM
 W5aWa7KcjMsw/YRONzQ/fGlnKoQBFysxI3S9+4M=
X-Google-Smtp-Source: ABdhPJypkbqcqMYRkgXLeYrr85sBP4nKztEc2JQZg63uKkXgInECePCODndx/GF5knti62lLCtVTePaq60mxvaTEf20=
X-Received: by 2002:a25:69cc:: with SMTP id e195mr9012360ybc.456.1639078953165; 
 Thu, 09 Dec 2021 11:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20211027212339.29259-1-ramalingam.c@intel.com>
 <20211027212339.29259-14-ramalingam.c@intel.com>
 <CAJDL4uLzxxjw0vp+en3vVpJFBBBrm-g7PwFVBMMmDZEUoiJp3w@mail.gmail.com>
In-Reply-To: <CAJDL4uLzxxjw0vp+en3vVpJFBBBrm-g7PwFVBMMmDZEUoiJp3w@mail.gmail.com>
From: Nanley Chery <nanleychery@gmail.com>
Date: Thu, 9 Dec 2021 14:41:57 -0500
Message-ID: <CAJDL4uKiQNPm1WMo50m7Q4OPQQF1Ke9Rs8FzSojL_qT7OOaNsw@mail.gmail.com>
Subject: Re: [Mesa-dev] [PATCH v3 13/17] uapi/drm/dg2: Format modifier for DG2
 unified compression and clear color
To: Ramalingam C <ramalingam.c@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 09 Dec 2021 22:26:50 +0000
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
Cc: Tony Ye <tony.ye@intel.com>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Kenneth Graunke <kenneth@whitecape.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping. I see that a v4 has been sent out without these comments being addres=
sed.

-Nanley

On Tue, Dec 7, 2021 at 6:51 PM Nanley Chery <nanleychery@gmail.com> wrote:
>
> Hi Ramalingam,
>
> On Wed, Oct 27, 2021 at 5:22 PM Ramalingam C <ramalingam.c@intel.com> wro=
te:
> >
> > From: Matt Roper <matthew.d.roper@intel.com>
> >
> > DG2 unifies render compression and media compression into a single
> > format for the first time.  The programming and buffer layout is
> > supposed to match compression on older gen12 platforms, but the
> > actual compression algorithm is different from any previous platform; a=
s
> > such, we need a new framebuffer modifier to represent buffers in this
> > format, but otherwise we can re-use the existing gen12 compression driv=
er
> > logic.
> >
> > DG2 clear color render compression uses Tile4 layout. Therefore, we nee=
d
> > to define a new format modifier for uAPI to support clear color renderi=
ng.
> >
>
> I left some feedback on the modifier texts below, but I think it also
> applies to this commit message.
>
> > v2: Rebased on new format modifier check [Ram]
> >
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com> (v2)
> > Signed-off-by: Juha-Pekka Heikkil=C3=A4 <juha-pekka.heikkila@intel.com>
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > cc: Simon Ser <contact@emersion.fr>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > Cc: mesa-dev@lists.freedesktop.org
> > Cc: Tony Ye <tony.ye@intel.com>
> > Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
> > Acked-by: Simon Ser <contact@emersion.fr>
> > ---
> >  drivers/gpu/drm/i915/display/intel_fb.c       | 43 +++++++++++++++++++
> >  .../drm/i915/display/skl_universal_plane.c    | 29 ++++++++++++-
> >  include/uapi/drm/drm_fourcc.h                 | 30 +++++++++++++
> >  3 files changed, 101 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/=
i915/display/intel_fb.c
> > index 562d5244688d..484ae1fd0e94 100644
> > --- a/drivers/gpu/drm/i915/display/intel_fb.c
> > +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> > @@ -106,6 +106,21 @@ static const struct drm_format_info gen12_ccs_cc_f=
ormats[] =3D {
> >           .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
> >  };
> >
> > +static const struct drm_format_info gen12_flat_ccs_cc_formats[] =3D {
> > +       { .format =3D DRM_FORMAT_XRGB8888, .depth =3D 24, .num_planes =
=3D 2,
> > +         .char_per_block =3D { 4, 0 }, .block_w =3D { 1, 2 }, .block_h=
 =3D { 1, 1 },
> > +         .hsub =3D 1, .vsub =3D 1, },
> > +       { .format =3D DRM_FORMAT_XBGR8888, .depth =3D 24, .num_planes =
=3D 2,
> > +         .char_per_block =3D { 4, 0 }, .block_w =3D { 1, 2 }, .block_h=
 =3D { 1, 1 },
> > +         .hsub =3D 1, .vsub =3D 1, },
> > +       { .format =3D DRM_FORMAT_ARGB8888, .depth =3D 32, .num_planes =
=3D 2,
> > +         .char_per_block =3D { 4, 0 }, .block_w =3D { 1, 2 }, .block_h=
 =3D { 1, 1 },
> > +         .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
> > +       { .format =3D DRM_FORMAT_ABGR8888, .depth =3D 32, .num_planes =
=3D 2,
> > +         .char_per_block =3D { 4, 0 }, .block_w =3D { 1, 2 }, .block_h=
 =3D { 1, 1 },
> > +         .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
> > +};
> > +
> >  struct intel_modifier_desc {
> >         u64 modifier;
> >         struct {
> > @@ -166,6 +181,27 @@ static const struct intel_modifier_desc intel_modi=
fiers[] =3D {
> >                 .ccs.packed_aux_planes =3D BIT(1),
> >
> >                 FORMAT_OVERRIDE(gen12_ccs_cc_formats),
> > +       }, {
> > +               .modifier =3D I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
> > +               .display_ver =3D { 12, 13 },
> > +               .tiling =3D I915_TILING_NONE,
> > +
> > +               .ccs.type =3D INTEL_CCS_RC,
> > +       }, {
> > +               .modifier =3D I915_FORMAT_MOD_4_TILED_DG2_MC_CCS,
> > +               .display_ver =3D { 12, 13 },
> > +               .tiling =3D I915_TILING_NONE,
> > +
> > +               .ccs.type =3D INTEL_CCS_MC,
> > +       }, {
> > +               .modifier =3D I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC,
> > +               .display_ver =3D { 12, 13 },
> > +               .tiling =3D I915_TILING_NONE,
> > +
> > +               .ccs.type =3D INTEL_CCS_RC_CC,
> > +               .ccs.cc_planes =3D BIT(1),
> > +
> > +               FORMAT_OVERRIDE(gen12_flat_ccs_cc_formats),
> >         }, {
> >                 .modifier =3D I915_FORMAT_MOD_Yf_TILED_CCS,
> >                 .display_ver =3D { 9, 11 },
> > @@ -582,6 +618,9 @@ intel_tile_width_bytes(const struct drm_framebuffer=
 *fb, int color_plane)
> >                         return 128;
> >                 else
> >                         return 512;
> > +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
> > +       case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
> > +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
> >         case I915_FORMAT_MOD_4_TILED:
> >                 /*
> >                  * Each 4K tile consists of 64B(8*8) subtiles, with
> > @@ -759,6 +798,10 @@ unsigned int intel_surf_alignment(const struct drm=
_framebuffer *fb,
> >         case I915_FORMAT_MOD_4_TILED:
> >         case I915_FORMAT_MOD_Yf_TILED:
> >                 return 1 * 1024 * 1024;
> > +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
> > +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
> > +       case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
> > +               return 16 * 1024;
> >         default:
> >                 MISSING_CASE(fb->modifier);
> >                 return 0;
> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drive=
rs/gpu/drm/i915/display/skl_universal_plane.c
> > index aeca96925feb..136b3f74a290 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -753,6 +753,16 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
> >                 return PLANE_CTL_TILED_Y;
> >         case I915_FORMAT_MOD_4_TILED:
> >                 return PLANE_CTL_TILED_4;
> > +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
> > +               return PLANE_CTL_TILED_4 |
> > +                       PLANE_CTL_RENDER_DECOMPRESSION_ENABLE |
> > +                       PLANE_CTL_CLEAR_COLOR_DISABLE;
> > +       case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
> > +               return PLANE_CTL_TILED_4 |
> > +                       PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE |
> > +                       PLANE_CTL_CLEAR_COLOR_DISABLE;
> > +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
> > +               return PLANE_CTL_TILED_4 | PLANE_CTL_RENDER_DECOMPRESSI=
ON_ENABLE;
> >         case I915_FORMAT_MOD_Y_TILED_CCS:
> >         case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
> >                 return PLANE_CTL_TILED_Y | PLANE_CTL_RENDER_DECOMPRESSI=
ON_ENABLE;
> > @@ -1983,6 +1993,9 @@ skl_plane_disable_flip_done(struct intel_plane *p=
lane)
> >  static bool skl_plane_has_rc_ccs(struct drm_i915_private *i915,
> >                                  enum pipe pipe, enum plane_id plane_id=
)
> >  {
> > +       if (IS_DG2(i915) && !HAS_4TILE(i915))
> > +               return false;
> > +
> >         /* Wa_22011186057 */
> >         if (IS_ADLP_DISPLAY_STEP(i915, STEP_A0, STEP_B0))
> >                 return false;
> > @@ -2001,6 +2014,10 @@ static bool skl_plane_has_rc_ccs(struct drm_i915=
_private *i915,
> >  static bool gen12_plane_has_mc_ccs(struct drm_i915_private *i915,
> >                                    enum plane_id plane_id)
> >  {
> > +       /* Wa_14013215631:dg2[a0,b0] */
> > +       if (IS_DG2_DISP_STEP(i915, STEP_A0, STEP_C0))
> > +               return false;
> > +
> >         /* Wa_14010477008:tgl[a0..c0],rkl[all],dg1[all] */
> >         if (IS_DG1(i915) || IS_ROCKETLAKE(i915) ||
> >             IS_TGL_DISPLAY_STEP(i915, STEP_A0, STEP_D0))
> > @@ -2243,7 +2260,17 @@ skl_get_initial_plane_config(struct intel_crtc *=
crtc,
> >                 break;
> >         case PLANE_CTL_TILED_YF: /* aka PLANE_CTL_TILED_4 on XE_LPD+ */
> >                 if (DISPLAY_VER(dev_priv) >=3D 13) {
> > -                       fb->modifier =3D I915_FORMAT_MOD_4_TILED;
> > +                       u32 rc_mask =3D PLANE_CTL_RENDER_DECOMPRESSION_=
ENABLE |
> > +                                       PLANE_CTL_CLEAR_COLOR_DISABLE;
> > +
> > +                       if ((val & rc_mask) =3D=3D rc_mask)
> > +                               fb->modifier =3D I915_FORMAT_MOD_4_TILE=
D_DG2_RC_CCS;
> > +                       else if (val & PLANE_CTL_MEDIA_DECOMPRESSION_EN=
ABLE)
> > +                               fb->modifier =3D I915_FORMAT_MOD_4_TILE=
D_DG2_MC_CCS;
> > +                       else if (val & PLANE_CTL_RENDER_DECOMPRESSION_E=
NABLE)
> > +                               fb->modifier =3D I915_FORMAT_MOD_4_TILE=
D_DG2_RC_CCS_CC;
> > +                       else
> > +                               fb->modifier =3D I915_FORMAT_MOD_4_TILE=
D;
> >                 } else {
> >                         if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE=
)
> >                                 fb->modifier =3D I915_FORMAT_MOD_Yf_TIL=
ED_CCS;
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourc=
c.h
> > index 982b0a9fa78b..719c17847e07 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -567,6 +567,36 @@ extern "C" {
> >   */
> >  #define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 12)
> >
> > +/*
> > + * Intel color control surfaces (CCS) for DG2 render compression.
> > + *
> > + * DG2 uses a new compression format for render compression. The gener=
al
> > + * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> > + * but a new hashing/compression algorithm is used, so a fresh modifie=
r must
> > + * be associated with buffers of this type. Render compression uses 12=
8 byte
> > + * compression blocks.
> > + */
> > +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS fourcc_mod_code(INTEL, 13)
> > +
> > +/*
> > + * Intel color control surfaces (CCS) for DG2 media compression.
> > + *
> > + * DG2 uses a new compression format for media compression. The genera=
l
> > + * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS,
> > + * but a new hashing/compression algorithm is used, so a fresh modifie=
r must
> > + * be associated with buffers of this type. Media compression uses 256=
 byte
> > + * compression blocks.
> > + */
>
> More so than new compression algorithms, these modifiers are needed
> due to the lack of CCS planes.
>
> The layout of these surfaces are more like I915_FORMAT_MOD_4_TILED, right=
?
>
> > +#define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 14)
> > +
> > +/*
> > + * Intel color control surfaces (CCS) for DG2 clear color render compr=
ession.
> > + *
> > + * DG2 uses a unified compression format for clear color render compre=
ssion.
>
> This seems to imply a different format than RC_CCS (with additional
> clear color tracking).
>
> > + * The general layout is a tiled layout using 4Kb tiles i.e. Tile4 lay=
out.
> > + */
>
> It's unclear where the clear color is located from this description
> (by comparison, the GEN12 modifier states that the clear color can be
> found at plane index 2).
>
> Regards,
> Nanley
>
>
> > +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 1=
5)
> > +
> >  /*
> >   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macrobloc=
ks
> >   *
> > --
> > 2.20.1
> >
