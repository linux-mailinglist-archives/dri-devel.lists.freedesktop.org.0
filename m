Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B30473980
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 01:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED0610E9A4;
	Tue, 14 Dec 2021 00:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B28010E9A1;
 Tue, 14 Dec 2021 00:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639441414; x=1670977414;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+mvX/mKSkJDj4Xkoj32oS1O8rqXa/qDUXyNMG6k63K0=;
 b=cWYCVxfF9g3MM+cN6mlTMQX+U1BEy6KCw2pra1dHqpLypbh1ctlyg7Bz
 RlFCDarLduLNtxwmSZUQzuoaqqCU6xIllkznq5KxC1EXeiDHNzzZBKy1E
 UQNja5XLBTMsevfGAaAoLD2wLN/wtbmJxCq3RWIL0gJow/T4G/JJERsI6
 p+f7feUW9y5Jz1CGUTsyDt3zM466XK0HUjlFXgRwAlCQbOmQvofHbtsZS
 2cumFaMaqZzSDU3qu3oJDAxmNRqqbnJekyMeKnp/ySbHWZmuDZHgchnJ9
 5lOl6SxX8fMvO7OEXeycIUOTDT1pQ2gmqA0Y7f61BghcOjId8uhiwlGWI w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="218877003"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="218877003"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 16:23:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="464852735"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 16:23:29 -0800
Date: Tue, 14 Dec 2021 05:53:14 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Nanley Chery <nanleychery@gmail.com>
Subject: Re: [Mesa-dev] [PATCH v3 13/17] uapi/drm/dg2: Format modifier for
 DG2 unified compression and clear color
Message-ID: <20211214002314.GA31233@intel.com>
References: <20211027212339.29259-1-ramalingam.c@intel.com>
 <20211027212339.29259-14-ramalingam.c@intel.com>
 <CAJDL4uLzxxjw0vp+en3vVpJFBBBrm-g7PwFVBMMmDZEUoiJp3w@mail.gmail.com>
 <CAJDL4uKiQNPm1WMo50m7Q4OPQQF1Ke9Rs8FzSojL_qT7OOaNsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJDL4uKiQNPm1WMo50m7Q4OPQQF1Ke9Rs8FzSojL_qT7OOaNsw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On 2021-12-09 at 14:41:57 -0500, Nanley Chery wrote:
> Ping. I see that a v4 has been sent out without these comments being addressed.
Sorry for the miss. I will address it soon.

Ram.
> 
> -Nanley
> 
> On Tue, Dec 7, 2021 at 6:51 PM Nanley Chery <nanleychery@gmail.com> wrote:
> >
> > Hi Ramalingam,
> >
> > On Wed, Oct 27, 2021 at 5:22 PM Ramalingam C <ramalingam.c@intel.com> wrote:
> > >
> > > From: Matt Roper <matthew.d.roper@intel.com>
> > >
> > > DG2 unifies render compression and media compression into a single
> > > format for the first time.  The programming and buffer layout is
> > > supposed to match compression on older gen12 platforms, but the
> > > actual compression algorithm is different from any previous platform; as
> > > such, we need a new framebuffer modifier to represent buffers in this
> > > format, but otherwise we can re-use the existing gen12 compression driver
> > > logic.
> > >
> > > DG2 clear color render compression uses Tile4 layout. Therefore, we need
> > > to define a new format modifier for uAPI to support clear color rendering.
> > >
> >
> > I left some feedback on the modifier texts below, but I think it also
> > applies to this commit message.
> >
> > > v2: Rebased on new format modifier check [Ram]
> > >
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: Mika Kahola <mika.kahola@intel.com> (v2)
> > > Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
> > > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > > cc: Simon Ser <contact@emersion.fr>
> > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > > Cc: mesa-dev@lists.freedesktop.org
> > > Cc: Tony Ye <tony.ye@intel.com>
> > > Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
> > > Acked-by: Simon Ser <contact@emersion.fr>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_fb.c       | 43 +++++++++++++++++++
> > >  .../drm/i915/display/skl_universal_plane.c    | 29 ++++++++++++-
> > >  include/uapi/drm/drm_fourcc.h                 | 30 +++++++++++++
> > >  3 files changed, 101 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> > > index 562d5244688d..484ae1fd0e94 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_fb.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> > > @@ -106,6 +106,21 @@ static const struct drm_format_info gen12_ccs_cc_formats[] = {
> > >           .hsub = 1, .vsub = 1, .has_alpha = true },
> > >  };
> > >
> > > +static const struct drm_format_info gen12_flat_ccs_cc_formats[] = {
> > > +       { .format = DRM_FORMAT_XRGB8888, .depth = 24, .num_planes = 2,
> > > +         .char_per_block = { 4, 0 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
> > > +         .hsub = 1, .vsub = 1, },
> > > +       { .format = DRM_FORMAT_XBGR8888, .depth = 24, .num_planes = 2,
> > > +         .char_per_block = { 4, 0 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
> > > +         .hsub = 1, .vsub = 1, },
> > > +       { .format = DRM_FORMAT_ARGB8888, .depth = 32, .num_planes = 2,
> > > +         .char_per_block = { 4, 0 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
> > > +         .hsub = 1, .vsub = 1, .has_alpha = true },
> > > +       { .format = DRM_FORMAT_ABGR8888, .depth = 32, .num_planes = 2,
> > > +         .char_per_block = { 4, 0 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
> > > +         .hsub = 1, .vsub = 1, .has_alpha = true },
> > > +};
> > > +
> > >  struct intel_modifier_desc {
> > >         u64 modifier;
> > >         struct {
> > > @@ -166,6 +181,27 @@ static const struct intel_modifier_desc intel_modifiers[] = {
> > >                 .ccs.packed_aux_planes = BIT(1),
> > >
> > >                 FORMAT_OVERRIDE(gen12_ccs_cc_formats),
> > > +       }, {
> > > +               .modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
> > > +               .display_ver = { 12, 13 },
> > > +               .tiling = I915_TILING_NONE,
> > > +
> > > +               .ccs.type = INTEL_CCS_RC,
> > > +       }, {
> > > +               .modifier = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS,
> > > +               .display_ver = { 12, 13 },
> > > +               .tiling = I915_TILING_NONE,
> > > +
> > > +               .ccs.type = INTEL_CCS_MC,
> > > +       }, {
> > > +               .modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC,
> > > +               .display_ver = { 12, 13 },
> > > +               .tiling = I915_TILING_NONE,
> > > +
> > > +               .ccs.type = INTEL_CCS_RC_CC,
> > > +               .ccs.cc_planes = BIT(1),
> > > +
> > > +               FORMAT_OVERRIDE(gen12_flat_ccs_cc_formats),
> > >         }, {
> > >                 .modifier = I915_FORMAT_MOD_Yf_TILED_CCS,
> > >                 .display_ver = { 9, 11 },
> > > @@ -582,6 +618,9 @@ intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
> > >                         return 128;
> > >                 else
> > >                         return 512;
> > > +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
> > > +       case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
> > > +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
> > >         case I915_FORMAT_MOD_4_TILED:
> > >                 /*
> > >                  * Each 4K tile consists of 64B(8*8) subtiles, with
> > > @@ -759,6 +798,10 @@ unsigned int intel_surf_alignment(const struct drm_framebuffer *fb,
> > >         case I915_FORMAT_MOD_4_TILED:
> > >         case I915_FORMAT_MOD_Yf_TILED:
> > >                 return 1 * 1024 * 1024;
> > > +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
> > > +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
> > > +       case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
> > > +               return 16 * 1024;
> > >         default:
> > >                 MISSING_CASE(fb->modifier);
> > >                 return 0;
> > > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > > index aeca96925feb..136b3f74a290 100644
> > > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > > @@ -753,6 +753,16 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
> > >                 return PLANE_CTL_TILED_Y;
> > >         case I915_FORMAT_MOD_4_TILED:
> > >                 return PLANE_CTL_TILED_4;
> > > +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
> > > +               return PLANE_CTL_TILED_4 |
> > > +                       PLANE_CTL_RENDER_DECOMPRESSION_ENABLE |
> > > +                       PLANE_CTL_CLEAR_COLOR_DISABLE;
> > > +       case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
> > > +               return PLANE_CTL_TILED_4 |
> > > +                       PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE |
> > > +                       PLANE_CTL_CLEAR_COLOR_DISABLE;
> > > +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
> > > +               return PLANE_CTL_TILED_4 | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
> > >         case I915_FORMAT_MOD_Y_TILED_CCS:
> > >         case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
> > >                 return PLANE_CTL_TILED_Y | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
> > > @@ -1983,6 +1993,9 @@ skl_plane_disable_flip_done(struct intel_plane *plane)
> > >  static bool skl_plane_has_rc_ccs(struct drm_i915_private *i915,
> > >                                  enum pipe pipe, enum plane_id plane_id)
> > >  {
> > > +       if (IS_DG2(i915) && !HAS_4TILE(i915))
> > > +               return false;
> > > +
> > >         /* Wa_22011186057 */
> > >         if (IS_ADLP_DISPLAY_STEP(i915, STEP_A0, STEP_B0))
> > >                 return false;
> > > @@ -2001,6 +2014,10 @@ static bool skl_plane_has_rc_ccs(struct drm_i915_private *i915,
> > >  static bool gen12_plane_has_mc_ccs(struct drm_i915_private *i915,
> > >                                    enum plane_id plane_id)
> > >  {
> > > +       /* Wa_14013215631:dg2[a0,b0] */
> > > +       if (IS_DG2_DISP_STEP(i915, STEP_A0, STEP_C0))
> > > +               return false;
> > > +
> > >         /* Wa_14010477008:tgl[a0..c0],rkl[all],dg1[all] */
> > >         if (IS_DG1(i915) || IS_ROCKETLAKE(i915) ||
> > >             IS_TGL_DISPLAY_STEP(i915, STEP_A0, STEP_D0))
> > > @@ -2243,7 +2260,17 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
> > >                 break;
> > >         case PLANE_CTL_TILED_YF: /* aka PLANE_CTL_TILED_4 on XE_LPD+ */
> > >                 if (DISPLAY_VER(dev_priv) >= 13) {
> > > -                       fb->modifier = I915_FORMAT_MOD_4_TILED;
> > > +                       u32 rc_mask = PLANE_CTL_RENDER_DECOMPRESSION_ENABLE |
> > > +                                       PLANE_CTL_CLEAR_COLOR_DISABLE;
> > > +
> > > +                       if ((val & rc_mask) == rc_mask)
> > > +                               fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
> > > +                       else if (val & PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE)
> > > +                               fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS;
> > > +                       else if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
> > > +                               fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC;
> > > +                       else
> > > +                               fb->modifier = I915_FORMAT_MOD_4_TILED;
> > >                 } else {
> > >                         if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
> > >                                 fb->modifier = I915_FORMAT_MOD_Yf_TILED_CCS;
> > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > > index 982b0a9fa78b..719c17847e07 100644
> > > --- a/include/uapi/drm/drm_fourcc.h
> > > +++ b/include/uapi/drm/drm_fourcc.h
> > > @@ -567,6 +567,36 @@ extern "C" {
> > >   */
> > >  #define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 12)
> > >
> > > +/*
> > > + * Intel color control surfaces (CCS) for DG2 render compression.
> > > + *
> > > + * DG2 uses a new compression format for render compression. The general
> > > + * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> > > + * but a new hashing/compression algorithm is used, so a fresh modifier must
> > > + * be associated with buffers of this type. Render compression uses 128 byte
> > > + * compression blocks.
> > > + */
> > > +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS fourcc_mod_code(INTEL, 13)
> > > +
> > > +/*
> > > + * Intel color control surfaces (CCS) for DG2 media compression.
> > > + *
> > > + * DG2 uses a new compression format for media compression. The general
> > > + * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS,
> > > + * but a new hashing/compression algorithm is used, so a fresh modifier must
> > > + * be associated with buffers of this type. Media compression uses 256 byte
> > > + * compression blocks.
> > > + */
> >
> > More so than new compression algorithms, these modifiers are needed
> > due to the lack of CCS planes.
> >
> > The layout of these surfaces are more like I915_FORMAT_MOD_4_TILED, right?
> >
> > > +#define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 14)
> > > +
> > > +/*
> > > + * Intel color control surfaces (CCS) for DG2 clear color render compression.
> > > + *
> > > + * DG2 uses a unified compression format for clear color render compression.
> >
> > This seems to imply a different format than RC_CCS (with additional
> > clear color tracking).
> >
> > > + * The general layout is a tiled layout using 4Kb tiles i.e. Tile4 layout.
> > > + */
> >
> > It's unclear where the clear color is located from this description
> > (by comparison, the GEN12 modifier states that the clear color can be
> > found at plane index 2).
> >
> > Regards,
> > Nanley
> >
> >
> > > +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 15)
> > > +
> > >  /*
> > >   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
> > >   *
> > > --
> > > 2.20.1
> > >
