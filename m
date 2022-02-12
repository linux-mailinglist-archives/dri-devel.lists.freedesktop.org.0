Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDBC4B3267
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 02:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3A010EB5A;
	Sat, 12 Feb 2022 01:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C0110EB5A;
 Sat, 12 Feb 2022 01:18:32 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id o19so29664117ybc.12;
 Fri, 11 Feb 2022 17:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=I7PX73WJgrFQEcf0GseBizwHlvss5whB3OdtywiV3oM=;
 b=cAHV+NupG6FJ8y3fOx6Ge3/fOP2RLcU3vKVxb2ALhiOvR9CO72LiZzi+CymQTZFYYc
 tCzp68ZoRznse+GLOUO2vkxI+6Rp2rNWIKd7JH9F+yAQexSh+rkh8S8W+Or/toQauTyx
 rjFk28sN2es2G3HhltwJuBBUbNoZCOWrHNVIgVlIKVu7bhqNMtqY1ex33Be8JyXmnM+J
 GCpIMsYNFVlkJe35MrkM1qU2lm1y8QgcFz0SvSo79KQrabyu3g0kUcR69IdIMbkHMCek
 vzbeUeEvs9rsjzMbei6M9BVEmd0t0VBApTjUjO+QufHPGTTFSuvYTBfyW9R0hu1cMXOw
 N2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I7PX73WJgrFQEcf0GseBizwHlvss5whB3OdtywiV3oM=;
 b=QUrfsmJrC0Mlr5a3TpMDs5Uf9awQvXDqbcLp2PvWiP1tvZUK8EuAKlrkHF37xG/9Xk
 cuVgKdkVeYusVQ306ivzo/1ss/j/Z16TH8JN8k94GtPOJZMg/y3ZgDggAuGaxieXBFxQ
 gXp1aNyes/vpoUCMR1cM5Zl0CR0/R8W87Few3wjzau1Ea/XzsZCVqIrGnpIB8sHiC9Ul
 qshg3yLolc18phdII1R9iNpX4QCoQBcJdk7HhJwIYZ66IjjpHHdiN4iOeCO8hqoiio8W
 zgBiMF3ZesDhPbd3epXD7U6RfCbjfFVnXDqTy+xnJSUVxH7rZyxOz27OF22AggB9VG3b
 6Fgg==
X-Gm-Message-State: AOAM532GVDPCjaAYzE19dDvzC9gfHqO8s+8Zxw2Rzf7DfDH72d9SDAPS
 NK0dMyicTg4ehA7tp5ZJeGNEzqGJyVDDBTTxt1E=
X-Google-Smtp-Source: ABdhPJxmVu348hxe2xEWy/YaMXRhdsL5gpLHd2AZPRAducOEJwMRHAhye5FlHap8aRp+4ATxFJgsDwdSCQxUp9md7bA=
X-Received: by 2002:a81:8d07:: with SMTP id d7mr4724337ywg.212.1644628711978; 
 Fri, 11 Feb 2022 17:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20220201104132.3050-1-ramalingam.c@intel.com>
 <20220201104132.3050-16-ramalingam.c@intel.com>
In-Reply-To: <20220201104132.3050-16-ramalingam.c@intel.com>
From: Nanley Chery <nanleychery@gmail.com>
Date: Fri, 11 Feb 2022 17:17:56 -0800
Message-ID: <CAJDL4uKokNLKhx1Yd_gnxyqto+bcg+=efLZFLVxqp-D7aQW0oQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v5 15/19] drm/i915/dg2: Add DG2 unified
 compression
To: Ramalingam C <ramalingam.c@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Nanley Chery <nanley.g.chery@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 1, 2022 at 2:42 AM Ramalingam C <ramalingam.c@intel.com> wrote:
>
> From: Matt Roper <matthew.d.roper@intel.com>
>
> DG2 unifies render compression and media compression into a single
> format for the first time.  The programming and buffer layout is
> supposed to match compression on older gen12 platforms, but the actual
> compression algorithm is different from any previous platform; as such,
> we need a new framebuffer modifier to represent buffers in this format,
> but otherwise we can re-use the existing gen12 compression driver logic.
>
> v2:
>   Display version fix [Imre]
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Signed-off-by: Mika Kahola <mika.kahola@intel.com> (v2)
> cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Juha-Pekka Heikkil=C3=A4 <juha-pekka.heikkila@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb.c       | 13 ++++++++++
>  .../drm/i915/display/skl_universal_plane.c    | 26 ++++++++++++++++---
>  include/uapi/drm/drm_fourcc.h                 | 22 ++++++++++++++++
>  3 files changed, 57 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i9=
15/display/intel_fb.c
> index 94c57facbb46..4d4d01963f15 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -141,6 +141,14 @@ struct intel_modifier_desc {
>
>  static const struct intel_modifier_desc intel_modifiers[] =3D {
>         {
> +               .modifier =3D I915_FORMAT_MOD_4_TILED_DG2_MC_CCS,
> +               .display_ver =3D { 13, 13 },
> +               .plane_caps =3D INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CA=
P_CCS_MC,
> +       }, {
> +               .modifier =3D I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
> +               .display_ver =3D { 13, 13 },
> +               .plane_caps =3D INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CA=
P_CCS_RC,
> +       }, {
>                 .modifier =3D I915_FORMAT_MOD_4_TILED,
>                 .display_ver =3D { 13, 13 },
>                 .plane_caps =3D INTEL_PLANE_CAP_TILING_4,
> @@ -550,6 +558,8 @@ intel_tile_width_bytes(const struct drm_framebuffer *=
fb, int color_plane)
>                         return 128;
>                 else
>                         return 512;
> +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
> +       case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>         case I915_FORMAT_MOD_4_TILED:
>                 /*
>                  * Each 4K tile consists of 64B(8*8) subtiles, with
> @@ -752,6 +762,9 @@ unsigned int intel_surf_alignment(const struct drm_fr=
amebuffer *fb,
>         case I915_FORMAT_MOD_4_TILED:
>         case I915_FORMAT_MOD_Yf_TILED:
>                 return 1 * 1024 * 1024;
> +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
> +       case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
> +               return 16 * 1024;
>         default:
>                 MISSING_CASE(fb->modifier);
>                 return 0;
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers=
/gpu/drm/i915/display/skl_universal_plane.c
> index 5299dfe68802..c38ae0876c15 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -764,6 +764,14 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
>                 return PLANE_CTL_TILED_Y;
>         case I915_FORMAT_MOD_4_TILED:
>                 return PLANE_CTL_TILED_4;
> +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
> +               return PLANE_CTL_TILED_4 |
> +                       PLANE_CTL_RENDER_DECOMPRESSION_ENABLE |
> +                       PLANE_CTL_CLEAR_COLOR_DISABLE;
> +       case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
> +               return PLANE_CTL_TILED_4 |
> +                       PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE |
> +                       PLANE_CTL_CLEAR_COLOR_DISABLE;
>         case I915_FORMAT_MOD_Y_TILED_CCS:
>         case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
>                 return PLANE_CTL_TILED_Y | PLANE_CTL_RENDER_DECOMPRESSION=
_ENABLE;
> @@ -2094,6 +2102,10 @@ static bool gen12_plane_has_mc_ccs(struct drm_i915=
_private *i915,
>         if (IS_ADLP_DISPLAY_STEP(i915, STEP_A0, STEP_B0))
>                 return false;
>
> +       /* Wa_14013215631 */
> +       if (IS_DG2_DISPLAY_STEP(i915, STEP_A0, STEP_C0))
> +               return false;
> +
>         return plane_id < PLANE_SPRITE4;
>  }
>
> @@ -2335,9 +2347,10 @@ skl_get_initial_plane_config(struct intel_crtc *cr=
tc,
>         case PLANE_CTL_TILED_Y:
>                 plane_config->tiling =3D I915_TILING_Y;
>                 if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
> -                       fb->modifier =3D DISPLAY_VER(dev_priv) >=3D 12 ?
> -                               I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS :
> -                               I915_FORMAT_MOD_Y_TILED_CCS;
> +                       if (DISPLAY_VER(dev_priv) >=3D 12)
> +                               fb->modifier =3D I915_FORMAT_MOD_Y_TILED_=
GEN12_RC_CCS;
> +                       else
> +                               fb->modifier =3D I915_FORMAT_MOD_Y_TILED_=
CCS;
>                 else if (val & PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE)
>                         fb->modifier =3D I915_FORMAT_MOD_Y_TILED_GEN12_MC=
_CCS;
>                 else
> @@ -2345,7 +2358,12 @@ skl_get_initial_plane_config(struct intel_crtc *cr=
tc,
>                 break;
>         case PLANE_CTL_TILED_YF: /* aka PLANE_CTL_TILED_4 on XE_LPD+ */
>                 if (HAS_4TILE(dev_priv)) {
> -                       fb->modifier =3D I915_FORMAT_MOD_4_TILED;
> +                       if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
> +                               fb->modifier =3D I915_FORMAT_MOD_4_TILED_=
DG2_RC_CCS;
> +                       else if (val & PLANE_CTL_MEDIA_DECOMPRESSION_ENAB=
LE)
> +                               fb->modifier =3D I915_FORMAT_MOD_4_TILED_=
DG2_MC_CCS;
> +                       else
> +                               fb->modifier =3D I915_FORMAT_MOD_4_TILED;
>                 } else {
>                         if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
>                                 fb->modifier =3D I915_FORMAT_MOD_Yf_TILED=
_CCS;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.=
h
> index b73fe6797fc3..b8fb7b44c03c 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -583,6 +583,28 @@ extern "C" {
>   */
>  #define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
>
> +/*
> + * Intel color control surfaces (CCS) for DG2 render compression.
> + *
> + * DG2 uses a new compression format for render compression. The general
> + * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> + * but a new hashing/compression algorithm is used, so a fresh modifier =
must
> + * be associated with buffers of this type. Render compression uses 128 =
byte
> + * compression blocks.

I think I've seen a way to configure the compression block size on TGL
at least. I can't find the spec text for that at the moment though...
Could we omit these mentions?

> + */
> +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS fourcc_mod_code(INTEL, 10)
> +

How about something like:

The main surface is Tile 4 and at plane index 0. The CCS plane is
hidden from userspace. The main surface pitch is required to be a
multiple of four Tile 4 widths. The CCS is configured with the render
compression format associated with the main surface format.

....I think the CCS is technically accessible via the blitter engine,
so the part about the plane being "hidden" may need some tweaking.


-Nanley

> +/*
> + * Intel color control surfaces (CCS) for DG2 media compression.
> + *
> + * DG2 uses a new compression format for media compression. The general
> + * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> + * but a new hashing/compression algorithm is used, so a fresh modifier =
must
> + * be associated with buffers of this type. Media compression uses 256 b=
yte
> + * compression blocks.
> + */
> +#define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 11)
> +
>  /*
>   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>   *
> --
> 2.20.1
>
