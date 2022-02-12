Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 938DC4B326A
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 02:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C9D10EB5E;
	Sat, 12 Feb 2022 01:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F1D10EB5E;
 Sat, 12 Feb 2022 01:20:24 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id e140so10596590ybh.9;
 Fri, 11 Feb 2022 17:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rWqmQfb6KVd6lmWQRt07g0W3o4in0Dczk7Km1k1bWrk=;
 b=T4l901z2iunRNA5deT1dk5O/TrtE2y8OtqQq/QOuzMexbCrNUVjUxuKxm7zF6nX1+v
 g6xzXTeHOriy/jBZVJRfvw6QT09R+b01yfPtAoXr0HZCA4AOGyG/nVWz5VVcQGiaNTKL
 4qj+EIXLrADEQsq7N0drXEb4uuUPBFGhuCSNDEjXAL87rW2k8JXq0RNRLoXxbVnNshRX
 rqn/LGCUQLjw4jBvxrESWj8FBcx7PKC1fEDct1R8GMDt/OEvPRgo5V6zuLZOGBDDHNG1
 I60QfyCZNbRBNBF7HsO3A0cqudF2Wdzb3HJDS5CNoHcytbc/nbrqjke6/9AU4PJJvC1P
 95AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rWqmQfb6KVd6lmWQRt07g0W3o4in0Dczk7Km1k1bWrk=;
 b=Ah7m2fOV53NpPC4vPQxmnaNvEnfVcvl0Ohkjg4MMJQJzb+M6v3Ddj/sO8wimQkuxnF
 GXXx2DIFlz5Ehl5b4c/pbUgzqfv1oGVoWXskEo/INMsWKyg0IgNNrEzNIzCZZfP4S2/l
 J78jJIRyuuKiCdqqMC1Q6CMZjb/acG9JDnXbe8tpdwXnL3TqYaOMLP6oqNqH7FDoi2/l
 k/otzmi5NScrF/OU3CiT9kX+huSzvUV2T2RaHUGuzx6FDdUXiXtj6jKQyCTn+Rf8qumg
 mXJBii++Eguo7DHlQFG3KEBQiuzGw7x8eRlclrA4pCkJbyj6tDPC7UoGIPNiWOSdULsg
 BOxw==
X-Gm-Message-State: AOAM532Me700kBgXhHzBzyimVnotkc7T/c+r3atJarLDfeymu2Z3q89Y
 ObA/03jipt7phxCr2iu2WUZ6XxbfMIryaXxGc4SOLTuR
X-Google-Smtp-Source: ABdhPJyQbU25WAvULMQd1jyN6AplYUpv/gRtVKUWKb5+5XwCcdZq7QkXeCF6odQKj87SvpUKotD7aPXDWHj9dWHAP6c=
X-Received: by 2002:a25:188a:: with SMTP id 132mr4245858yby.616.1644628823974; 
 Fri, 11 Feb 2022 17:20:23 -0800 (PST)
MIME-Version: 1.0
References: <20220201104132.3050-1-ramalingam.c@intel.com>
 <20220201104132.3050-17-ramalingam.c@intel.com>
In-Reply-To: <20220201104132.3050-17-ramalingam.c@intel.com>
From: Nanley Chery <nanleychery@gmail.com>
Date: Fri, 11 Feb 2022 17:19:48 -0800
Message-ID: <CAJDL4u+hX2Dbu7q5P48t44XLSOr7vA9mf_jiC607oA1Y6+2k6Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v5 16/19] uapi/drm/dg2: Introduce format
 modifier for DG2 clear color
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
> From: Mika Kahola <mika.kahola@intel.com>
>
> DG2 clear color render compression uses Tile4 layout. Therefore, we need
> to define a new format modifier for uAPI to support clear color rendering=
.
>
> v2:
>   Display version is fixed. [Imre]
>   KDoc is enhanced for cc modifier. [Nanley & Lionel]
>
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Juha-Pekka Heikkil=C3=A4 <juha-pekka.heikkila@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb.c            |  8 ++++++++
>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  9 ++++++++-
>  include/uapi/drm/drm_fourcc.h                      | 10 ++++++++++
>  3 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i9=
15/display/intel_fb.c
> index 4d4d01963f15..3df6ef5ffec5 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -144,6 +144,12 @@ static const struct intel_modifier_desc intel_modifi=
ers[] =3D {
>                 .modifier =3D I915_FORMAT_MOD_4_TILED_DG2_MC_CCS,
>                 .display_ver =3D { 13, 13 },
>                 .plane_caps =3D INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CA=
P_CCS_MC,
> +       }, {
> +               .modifier =3D I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC,
> +               .display_ver =3D { 13, 13 },
> +               .plane_caps =3D INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CA=
P_CCS_RC_CC,
> +
> +               .ccs.cc_planes =3D BIT(1),
>         }, {
>                 .modifier =3D I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
>                 .display_ver =3D { 13, 13 },
> @@ -559,6 +565,7 @@ intel_tile_width_bytes(const struct drm_framebuffer *=
fb, int color_plane)
>                 else
>                         return 512;
>         case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
> +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
>         case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>         case I915_FORMAT_MOD_4_TILED:
>                 /*
> @@ -763,6 +770,7 @@ unsigned int intel_surf_alignment(const struct drm_fr=
amebuffer *fb,
>         case I915_FORMAT_MOD_Yf_TILED:
>                 return 1 * 1024 * 1024;
>         case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
> +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
>         case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>                 return 16 * 1024;
>         default:
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers=
/gpu/drm/i915/display/skl_universal_plane.c
> index c38ae0876c15..b4dced1907c5 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -772,6 +772,8 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
>                 return PLANE_CTL_TILED_4 |
>                         PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE |
>                         PLANE_CTL_CLEAR_COLOR_DISABLE;
> +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
> +               return PLANE_CTL_TILED_4 | PLANE_CTL_RENDER_DECOMPRESSION=
_ENABLE;
>         case I915_FORMAT_MOD_Y_TILED_CCS:
>         case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
>                 return PLANE_CTL_TILED_Y | PLANE_CTL_RENDER_DECOMPRESSION=
_ENABLE;
> @@ -2358,10 +2360,15 @@ skl_get_initial_plane_config(struct intel_crtc *c=
rtc,
>                 break;
>         case PLANE_CTL_TILED_YF: /* aka PLANE_CTL_TILED_4 on XE_LPD+ */
>                 if (HAS_4TILE(dev_priv)) {
> -                       if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
> +                       u32 rc_mask =3D PLANE_CTL_RENDER_DECOMPRESSION_EN=
ABLE |
> +                                     PLANE_CTL_CLEAR_COLOR_DISABLE;
> +
> +                       if ((val & rc_mask) =3D=3D rc_mask)
>                                 fb->modifier =3D I915_FORMAT_MOD_4_TILED_=
DG2_RC_CCS;
>                         else if (val & PLANE_CTL_MEDIA_DECOMPRESSION_ENAB=
LE)
>                                 fb->modifier =3D I915_FORMAT_MOD_4_TILED_=
DG2_MC_CCS;
> +                       else if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENA=
BLE)
> +                               fb->modifier =3D I915_FORMAT_MOD_4_TILED_=
DG2_RC_CCS_CC;
>                         else
>                                 fb->modifier =3D I915_FORMAT_MOD_4_TILED;
>                 } else {
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.=
h
> index b8fb7b44c03c..697614ea4b84 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -605,6 +605,16 @@ extern "C" {
>   */
>  #define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 11)
>
> +/*
> + * Intel color control surfaces (CCS) for DG2 clear color render compres=
sion.
> + *
> + * DG2 uses a unified compression format for clear color render compress=
ion.

What's unified about DG2's compression format? If this doesn't affect
the layout, maybe we should drop this sentence.

> + * The general layout is a tiled layout using 4Kb tiles i.e. Tile4 layou=
t.
> + *

This also needs a pitch aligned to four tiles, right? I think we can
save some effort by referencing the DG2_RC_CCS modifier here.

> + * Fast clear color value expected by HW is located in fb at offset 0 of=
 plane#1

Why is the expected offset hardcoded to 0 instead of relying on the
offset provided by the modifier API? This looks like a bug.

We should probably give some info about the relevant fields in the
fast clear plane (like what's done in the GEN12_RC_CCS_CC modifier).

-Nanley

> + */
> +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 12)
> +
>  /*
>   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>   *
> --
> 2.20.1
>
