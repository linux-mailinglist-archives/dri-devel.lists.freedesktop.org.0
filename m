Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA01622CCB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 14:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED4D10E5C6;
	Wed,  9 Nov 2022 13:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9677310E45B;
 Tue,  8 Nov 2022 13:17:43 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id m204so15463205oib.6;
 Tue, 08 Nov 2022 05:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2GgMjWUeDOa0y6Mw7fV1gcKP3Ka2/DN6qC2vXSuajOU=;
 b=XZ1r4euhMfX4WBZroZC2UWzK6rirDmsgccRGxXVGE1Z8an6ALR3EZjOWCFm2qXydvt
 oM0TqkBeVUR+Zwml4Jpw+wbDfBwhj9yvpHCu0yM/okrddAS92FNMVwMJvg/ebaJwzSJ8
 iB+aEm2vJDc1SNCBdYPypuH+C+T4MEcXzpvdpH39EoikL4AuS+G/KRiZdR7HrjFSYp+0
 LyvmdngabF3SaD3xHxxzFGI8j86pn7jeVqNwrOc2qUE8CtzOYAHNWm97bv8mZtshm9HD
 yLevvJH7G6/Fl+visV7LV7XnDnYeXFCbXO/g6jam27JfWxTskONYMr/Z9oUj/ILMdXvu
 lBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2GgMjWUeDOa0y6Mw7fV1gcKP3Ka2/DN6qC2vXSuajOU=;
 b=U3/+kTq/36GmThc3EldCsdCo815gKkPES8kOGKMgzTR76Enj5jefm7O6CvA3DYXPnM
 ihx+Bbys7v17aJV0F8JbmiQ+HCBdIHHKSdjEY1/4FnUZxoiy92KENBa3ipKZ2R1PnkLC
 DB0rJI0uObX8pkJvDdGNEFUHxFmeil7nwQDCVah6hwk/sTIWG5tqm/7F5FFZ8zEY1w8f
 quX7L4MG4/yEqW9+uyhHTPwd3rXfMzeR29vwI9HCsJ6fWZyGNklwwZmCXi43T+bTC9nF
 qsqgoL64llKnooXHFj4xSifG0RJEUHCLPwhr2vwXjlcNpeqLaO5TNji8fm0DJaA8NmV0
 XklQ==
X-Gm-Message-State: ACrzQf3S5jApcXW9wR8SfeY1F+PX5ruO05VeYU/Cp/nRB2UWTQx1WCbQ
 xbhq1GrMu1IeTfr0ahC3ALMDaeSPpTbTw/pvKMo=
X-Google-Smtp-Source: AMsMyM6RHMy2rRRmUjdQFV9AyI5dai8aG4qIYm7kfkzlhVjHTAos1GFdSvAN74P8Pn2xQp1werVRUK/cry/6d5Xsn3M=
X-Received: by 2002:a54:4587:0:b0:359:c737:b2e8 with SMTP id
 z7-20020a544587000000b00359c737b2e8mr29985757oib.234.1667913462796; Tue, 08
 Nov 2022 05:17:42 -0800 (PST)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
 <20220728-rpi-analog-tv-properties-v7-22-7072a478c6b3@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v7-22-7072a478c6b3@cerno.tech>
From: Lukas Satin <luke.satin@gmail.com>
Date: Tue, 8 Nov 2022 14:17:31 +0100
Message-ID: <CAEFVmOKn4Won90xyX2Efh2esZ94npoy0BuTQ7n-in+KapfBb=w@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v7 22/23] drm/vc4: vec: Add support for more
 analog TV standards
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: multipart/alternative; boundary="00000000000077594705ecf55d40"
X-Mailman-Approved-At: Wed, 09 Nov 2022 13:50:32 +0000
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000077594705ecf55d40
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

They are important for retrogaming and connecting TV out to CRT TV or using
emulator.

I have PS1 that is using PAL-60 for example.

Can you add 240p and 288p non-interlaced modes for NTSC and PAL, please?

Lukas

On Mon, Nov 7, 2022 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wrote:

> From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
>
> Add support for the following composite output modes (all of them are
> somewhat more obscure than the previously defined ones):
>
> - NTSC_443 - NTSC-style signal with the chroma subcarrier shifted to
>   4.43361875 MHz (the PAL subcarrier frequency). Never used for
>   broadcasting, but sometimes used as a hack to play NTSC content in PAL
>   regions (e.g. on VCRs).
> - PAL_N - PAL with alternative chroma subcarrier frequency,
>   3.58205625 MHz. Used as a broadcast standard in Argentina, Paraguay
>   and Uruguay to fit 576i50 with colour in 6 MHz channel raster.
> - PAL60 - 480i60 signal with PAL-style color at normal European PAL
>   frequency. Another non-standard, non-broadcast mode, used in similar
>   contexts as NTSC_443. Some displays support one but not the other.
> - SECAM - French frequency-modulated analog color standard; also have
>   been broadcast in Eastern Europe and various parts of Africa and Asia.
>   Uses the same 576i50 timings as PAL.
>
> Also added some comments explaining color subcarrier frequency
> registers.
>
> Acked-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> ---
> Changes in v6:
> - Support PAL60 again
> ---
>  drivers/gpu/drm/vc4/vc4_vec.c | 111
> ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 107 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.=
c
> index a828fc6fb776..d23dbad3cbf6 100644
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -46,6 +46,7 @@
>  #define VEC_CONFIG0_YDEL(x)            ((x) << 26)
>  #define VEC_CONFIG0_CDEL_MASK          GENMASK(25, 24)
>  #define VEC_CONFIG0_CDEL(x)            ((x) << 24)
> +#define VEC_CONFIG0_SECAM_STD          BIT(21)
>  #define VEC_CONFIG0_PBPR_FIL           BIT(18)
>  #define VEC_CONFIG0_CHROMA_GAIN_MASK   GENMASK(17, 16)
>  #define VEC_CONFIG0_CHROMA_GAIN_UNITY  (0 << 16)
> @@ -76,6 +77,27 @@
>  #define VEC_SOFT_RESET                 0x10c
>  #define VEC_CLMP0_START                        0x144
>  #define VEC_CLMP0_END                  0x148
> +
> +/*
> + * These set the color subcarrier frequency
> + * if VEC_CONFIG1_CUSTOM_FREQ is enabled.
> + *
> + * VEC_FREQ1_0 contains the most significant 16-bit half-word,
> + * VEC_FREQ3_2 contains the least significant 16-bit half-word.
> + * 0x80000000 seems to be equivalent to the pixel clock
> + * (which itself is the VEC clock divided by 8).
> + *
> + * Reference values (with the default pixel clock of 13.5 MHz):
> + *
> + * NTSC  (3579545.[45] Hz)     - 0x21F07C1F
> + * PAL   (4433618.75 Hz)       - 0x2A098ACB
> + * PAL-M (3575611.[888111] Hz) - 0x21E6EFE3
> + * PAL-N (3582056.25 Hz)       - 0x21F69446
> + *
> + * NOTE: For SECAM, it is used as the Dr center frequency,
> + * regardless of whether VEC_CONFIG1_CUSTOM_FREQ is enabled or not;
> + * that is specified as 4406250 Hz, which corresponds to 0x29C71C72.
> + */
>  #define VEC_FREQ3_2                    0x180
>  #define VEC_FREQ1_0                    0x184
>
> @@ -118,6 +140,14 @@
>
>  #define VEC_INTERRUPT_CONTROL          0x190
>  #define VEC_INTERRUPT_STATUS           0x194
> +
> +/*
> + * Db center frequency for SECAM; the clock for this is the same as for
> + * VEC_FREQ3_2/VEC_FREQ1_0, which is used for Dr center frequency.
> + *
> + * This is specified as 4250000 Hz, which corresponds to 0x284BDA13.
> + * That is also the default value, so no need to set it explicitly.
> + */
>  #define VEC_FCW_SECAM_B                        0x198
>  #define VEC_SECAM_GAIN_VAL             0x19c
>
> @@ -197,10 +227,15 @@ enum vc4_vec_tv_mode_id {
>         VC4_VEC_TV_MODE_NTSC_J,
>         VC4_VEC_TV_MODE_PAL,
>         VC4_VEC_TV_MODE_PAL_M,
> +       VC4_VEC_TV_MODE_NTSC_443,
> +       VC4_VEC_TV_MODE_PAL_60,
> +       VC4_VEC_TV_MODE_PAL_N,
> +       VC4_VEC_TV_MODE_SECAM,
>  };
>
>  struct vc4_vec_tv_mode {
>         unsigned int mode;
> +       u16 expected_htotal;
>         u32 config0;
>         u32 config1;
>         u32 custom_freq;
> @@ -236,35 +271,68 @@ static const struct debugfs_reg32 vec_regs[] =3D {
>  static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] =3D {
>         {
>                 .mode =3D DRM_MODE_TV_MODE_NTSC,
> +               .expected_htotal =3D 858,
>                 .config0 =3D VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
>                 .config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
>         },
> +       {
> +               .mode =3D DRM_MODE_TV_MODE_NTSC_443,
> +               .expected_htotal =3D 858,
> +               .config0 =3D VEC_CONFIG0_NTSC_STD,
> +               .config1 =3D VEC_CONFIG1_C_CVBS_CVBS |
> VEC_CONFIG1_CUSTOM_FREQ,
> +               .custom_freq =3D 0x2a098acb,
> +       },
>         {
>                 .mode =3D DRM_MODE_TV_MODE_NTSC_J,
> +               .expected_htotal =3D 858,
>                 .config0 =3D VEC_CONFIG0_NTSC_STD,
>                 .config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
>         },
>         {
>                 .mode =3D DRM_MODE_TV_MODE_PAL,
> +               .expected_htotal =3D 864,
>                 .config0 =3D VEC_CONFIG0_PAL_BDGHI_STD,
>                 .config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
>         },
> +       {
> +               /* PAL-60 */
> +               .mode =3D DRM_MODE_TV_MODE_PAL,
> +               .expected_htotal =3D 858,
> +               .config0 =3D VEC_CONFIG0_PAL_M_STD,
> +               .config1 =3D VEC_CONFIG1_C_CVBS_CVBS |
> VEC_CONFIG1_CUSTOM_FREQ,
> +               .custom_freq =3D 0x2a098acb,
> +       },
>         {
>                 .mode =3D DRM_MODE_TV_MODE_PAL_M,
> +               .expected_htotal =3D 858,
>                 .config0 =3D VEC_CONFIG0_PAL_M_STD,
>                 .config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
>         },
> +       {
> +               .mode =3D DRM_MODE_TV_MODE_PAL_N,
> +               .expected_htotal =3D 864,
> +               .config0 =3D VEC_CONFIG0_PAL_N_STD,
> +               .config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
> +       },
> +       {
> +               .mode =3D DRM_MODE_TV_MODE_SECAM,
> +               .expected_htotal =3D 864,
> +               .config0 =3D VEC_CONFIG0_SECAM_STD,
> +               .config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
> +               .custom_freq =3D 0x29c71c72,
> +       },
>  };
>
>  static inline const struct vc4_vec_tv_mode *
> -vc4_vec_tv_mode_lookup(unsigned int mode)
> +vc4_vec_tv_mode_lookup(unsigned int mode, u16 htotal)
>  {
>         unsigned int i;
>
>         for (i =3D 0; i < ARRAY_SIZE(vc4_vec_tv_modes); i++) {
>                 const struct vc4_vec_tv_mode *tv_mode =3D
> &vc4_vec_tv_modes[i];
>
> -               if (tv_mode->mode =3D=3D mode)
> +               if (tv_mode->mode =3D=3D mode &&
> +                   tv_mode->expected_htotal =3D=3D htotal)
>                         return tv_mode;
>         }
>
> @@ -273,9 +341,13 @@ vc4_vec_tv_mode_lookup(unsigned int mode)
>
>  static const struct drm_prop_enum_list legacy_tv_mode_names[] =3D {
>         { VC4_VEC_TV_MODE_NTSC, "NTSC", },
> +       { VC4_VEC_TV_MODE_NTSC_443, "NTSC-443", },
>         { VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
>         { VC4_VEC_TV_MODE_PAL, "PAL", },
> +       { VC4_VEC_TV_MODE_PAL_60, "PAL-60", },
>         { VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
> +       { VC4_VEC_TV_MODE_PAL_N, "PAL-N", },
> +       { VC4_VEC_TV_MODE_SECAM, "SECAM", },
>  };
>
>  static enum drm_connector_status
> @@ -306,11 +378,16 @@ vc4_vec_connector_set_property(struct drm_connector
> *connector,
>                 state->tv.mode =3D DRM_MODE_TV_MODE_NTSC;
>                 break;
>
> +       case VC4_VEC_TV_MODE_NTSC_443:
> +               state->tv.mode =3D DRM_MODE_TV_MODE_NTSC_443;
> +               break;
> +
>         case VC4_VEC_TV_MODE_NTSC_J:
>                 state->tv.mode =3D DRM_MODE_TV_MODE_NTSC_J;
>                 break;
>
>         case VC4_VEC_TV_MODE_PAL:
> +       case VC4_VEC_TV_MODE_PAL_60:
>                 state->tv.mode =3D DRM_MODE_TV_MODE_PAL;
>                 break;
>
> @@ -318,6 +395,14 @@ vc4_vec_connector_set_property(struct drm_connector
> *connector,
>                 state->tv.mode =3D DRM_MODE_TV_MODE_PAL_M;
>                 break;
>
> +       case VC4_VEC_TV_MODE_PAL_N:
> +               state->tv.mode =3D DRM_MODE_TV_MODE_PAL_N;
> +               break;
> +
> +       case VC4_VEC_TV_MODE_SECAM:
> +               state->tv.mode =3D DRM_MODE_TV_MODE_SECAM;
> +               break;
> +
>         default:
>                 return -EINVAL;
>         }
> @@ -341,6 +426,10 @@ vc4_vec_connector_get_property(struct drm_connector
> *connector,
>                 *val =3D VC4_VEC_TV_MODE_NTSC;
>                 break;
>
> +       case DRM_MODE_TV_MODE_NTSC_443:
> +               *val =3D VC4_VEC_TV_MODE_NTSC_443;
> +               break;
> +
>         case DRM_MODE_TV_MODE_NTSC_J:
>                 *val =3D VC4_VEC_TV_MODE_NTSC_J;
>                 break;
> @@ -353,6 +442,14 @@ vc4_vec_connector_get_property(struct drm_connector
> *connector,
>                 *val =3D VC4_VEC_TV_MODE_PAL_M;
>                 break;
>
> +       case DRM_MODE_TV_MODE_PAL_N:
> +               *val =3D VC4_VEC_TV_MODE_PAL_N;
> +               break;
> +
> +       case DRM_MODE_TV_MODE_SECAM:
> +               *val =3D VC4_VEC_TV_MODE_SECAM;
> +               break;
> +
>         default:
>                 return -EINVAL;
>         }
> @@ -448,13 +545,16 @@ static void vc4_vec_encoder_enable(struct
> drm_encoder *encoder,
>         struct drm_connector *connector =3D &vec->connector;
>         struct drm_connector_state *conn_state =3D
>                 drm_atomic_get_new_connector_state(state, connector);
> +       struct drm_display_mode *adjusted_mode =3D
> +               &encoder->crtc->state->adjusted_mode;
>         const struct vc4_vec_tv_mode *tv_mode;
>         int idx, ret;
>
>         if (!drm_dev_enter(drm, &idx))
>                 return;
>
> -       tv_mode =3D vc4_vec_tv_mode_lookup(conn_state->tv.mode);
> +       tv_mode =3D vc4_vec_tv_mode_lookup(conn_state->tv.mode,
> +                                        adjusted_mode->htotal);
>         if (!tv_mode)
>                 goto err_dev_exit;
>
> @@ -648,9 +748,12 @@ static int vc4_vec_bind(struct device *dev, struct
> device *master, void *data)
>
>         ret =3D drm_mode_create_tv_properties(drm,
>                                             BIT(DRM_MODE_TV_MODE_NTSC) |
> +                                           BIT(DRM_MODE_TV_MODE_NTSC_443=
)
> |
>                                             BIT(DRM_MODE_TV_MODE_NTSC_J) =
|
>                                             BIT(DRM_MODE_TV_MODE_PAL) |
> -                                           BIT(DRM_MODE_TV_MODE_PAL_M));
> +                                           BIT(DRM_MODE_TV_MODE_PAL_M) |
> +                                           BIT(DRM_MODE_TV_MODE_PAL_N) |
> +                                           BIT(DRM_MODE_TV_MODE_SECAM));
>         if (ret)
>                 return ret;
>
>
> --
> b4 0.11.0-dev-99e3a
>

--00000000000077594705ecf55d40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">They are important for retrogaming and connecting TV out t=
o CRT TV or using emulator.<div><br></div><div>I have PS1 that is using PAL=
-60 for example.</div><div><br></div><div>Can you add 240p and 288p non-int=
erlaced modes for NTSC and PAL, please?</div><div><br></div><div>Lukas</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Mon, Nov 7, 2022 at 3:19 PM Maxime Ripard &lt;maxime@cerno.tech&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Mateus=
z Kwiatkowski &lt;<a href=3D"mailto:kfyatek%2Bpublicgit@gmail.com" target=
=3D"_blank">kfyatek+publicgit@gmail.com</a>&gt;<br>
<br>
Add support for the following composite output modes (all of them are<br>
somewhat more obscure than the previously defined ones):<br>
<br>
- NTSC_443 - NTSC-style signal with the chroma subcarrier shifted to<br>
=C2=A0 4.43361875 MHz (the PAL subcarrier frequency). Never used for<br>
=C2=A0 broadcasting, but sometimes used as a hack to play NTSC content in P=
AL<br>
=C2=A0 regions (e.g. on VCRs).<br>
- PAL_N - PAL with alternative chroma subcarrier frequency,<br>
=C2=A0 3.58205625 MHz. Used as a broadcast standard in Argentina, Paraguay<=
br>
=C2=A0 and Uruguay to fit 576i50 with colour in 6 MHz channel raster.<br>
- PAL60 - 480i60 signal with PAL-style color at normal European PAL<br>
=C2=A0 frequency. Another non-standard, non-broadcast mode, used in similar=
<br>
=C2=A0 contexts as NTSC_443. Some displays support one but not the other.<b=
r>
- SECAM - French frequency-modulated analog color standard; also have<br>
=C2=A0 been broadcast in Eastern Europe and various parts of Africa and Asi=
a.<br>
=C2=A0 Uses the same 576i50 timings as PAL.<br>
<br>
Also added some comments explaining color subcarrier frequency<br>
registers.<br>
<br>
Acked-by: Noralf Tr=C3=B8nnes &lt;<a href=3D"mailto:noralf@tronnes.org" tar=
get=3D"_blank">noralf@tronnes.org</a>&gt;<br>
Signed-off-by: Mateusz Kwiatkowski &lt;<a href=3D"mailto:kfyatek%2Bpublicgi=
t@gmail.com" target=3D"_blank">kfyatek+publicgit@gmail.com</a>&gt;<br>
Signed-off-by: Maxime Ripard &lt;maxime@cerno.tech&gt;<br>
<br>
---<br>
Changes in v6:<br>
- Support PAL60 again<br>
---<br>
=C2=A0drivers/gpu/drm/vc4/vc4_vec.c | 111 +++++++++++++++++++++++++++++++++=
+++++++--<br>
=C2=A01 file changed, 107 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c<=
br>
index a828fc6fb776..d23dbad3cbf6 100644<br>
--- a/drivers/gpu/drm/vc4/vc4_vec.c<br>
+++ b/drivers/gpu/drm/vc4/vc4_vec.c<br>
@@ -46,6 +46,7 @@<br>
=C2=A0#define VEC_CONFIG0_YDEL(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
((x) &lt;&lt; 26)<br>
=C2=A0#define VEC_CONFIG0_CDEL_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(25, 24)<br>
=C2=A0#define VEC_CONFIG0_CDEL(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
((x) &lt;&lt; 24)<br>
+#define VEC_CONFIG0_SECAM_STD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(21)<br=
>
=C2=A0#define VEC_CONFIG0_PBPR_FIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
BIT(18)<br>
=C2=A0#define VEC_CONFIG0_CHROMA_GAIN_MASK=C2=A0 =C2=A0GENMASK(17, 16)<br>
=C2=A0#define VEC_CONFIG0_CHROMA_GAIN_UNITY=C2=A0 (0 &lt;&lt; 16)<br>
@@ -76,6 +77,27 @@<br>
=C2=A0#define VEC_SOFT_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x10c<br>
=C2=A0#define VEC_CLMP0_START=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x144<br>
=C2=A0#define VEC_CLMP0_END=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0x148<br>
+<br>
+/*<br>
+ * These set the color subcarrier frequency<br>
+ * if VEC_CONFIG1_CUSTOM_FREQ is enabled.<br>
+ *<br>
+ * VEC_FREQ1_0 contains the most significant 16-bit half-word,<br>
+ * VEC_FREQ3_2 contains the least significant 16-bit half-word.<br>
+ * 0x80000000 seems to be equivalent to the pixel clock<br>
+ * (which itself is the VEC clock divided by 8).<br>
+ *<br>
+ * Reference values (with the default pixel clock of 13.5 MHz):<br>
+ *<br>
+ * NTSC=C2=A0 (3579545.[45] Hz)=C2=A0 =C2=A0 =C2=A0- 0x21F07C1F<br>
+ * PAL=C2=A0 =C2=A0(4433618.75 Hz)=C2=A0 =C2=A0 =C2=A0 =C2=A0- 0x2A098ACB<=
br>
+ * PAL-M (3575611.[888111] Hz) - 0x21E6EFE3<br>
+ * PAL-N (3582056.25 Hz)=C2=A0 =C2=A0 =C2=A0 =C2=A0- 0x21F69446<br>
+ *<br>
+ * NOTE: For SECAM, it is used as the Dr center frequency,<br>
+ * regardless of whether VEC_CONFIG1_CUSTOM_FREQ is enabled or not;<br>
+ * that is specified as 4406250 Hz, which corresponds to 0x29C71C72.<br>
+ */<br>
=C2=A0#define VEC_FREQ3_2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x180<br>
=C2=A0#define VEC_FREQ1_0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x184<br>
<br>
@@ -118,6 +140,14 @@<br>
<br>
=C2=A0#define VEC_INTERRUPT_CONTROL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x190=
<br>
=C2=A0#define VEC_INTERRUPT_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x194<br>
+<br>
+/*<br>
+ * Db center frequency for SECAM; the clock for this is the same as for<br=
>
+ * VEC_FREQ3_2/VEC_FREQ1_0, which is used for Dr center frequency.<br>
+ *<br>
+ * This is specified as 4250000 Hz, which corresponds to 0x284BDA13.<br>
+ * That is also the default value, so no need to set it explicitly.<br>
+ */<br>
=C2=A0#define VEC_FCW_SECAM_B=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x198<br>
=C2=A0#define VEC_SECAM_GAIN_VAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x19c<br>
<br>
@@ -197,10 +227,15 @@ enum vc4_vec_tv_mode_id {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VC4_VEC_TV_MODE_NTSC_J,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VC4_VEC_TV_MODE_PAL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VC4_VEC_TV_MODE_PAL_M,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0VC4_VEC_TV_MODE_NTSC_443,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0VC4_VEC_TV_MODE_PAL_60,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0VC4_VEC_TV_MODE_PAL_N,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0VC4_VEC_TV_MODE_SECAM,<br>
=C2=A0};<br>
<br>
=C2=A0struct vc4_vec_tv_mode {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int mode;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 expected_htotal;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 config0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 config1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 custom_freq;<br>
@@ -236,35 +271,68 @@ static const struct debugfs_reg32 vec_regs[] =3D {<br=
>
=C2=A0static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .mode =3D DRM_MODE_=
TV_MODE_NTSC,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.expected_htotal =
=3D 858,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .config0 =3D VEC_CO=
NFIG0_NTSC_STD | VEC_CONFIG0_PDEN,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .config1 =3D VEC_CO=
NFIG1_C_CVBS_CVBS,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =3D DRM_MODE_=
TV_MODE_NTSC_443,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.expected_htotal =
=3D 858,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config0 =3D VEC_CO=
NFIG0_NTSC_STD,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config1 =3D VEC_CO=
NFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.custom_freq =3D 0x=
2a098acb,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .mode =3D DRM_MODE_=
TV_MODE_NTSC_J,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.expected_htotal =
=3D 858,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .config0 =3D VEC_CO=
NFIG0_NTSC_STD,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .config1 =3D VEC_CO=
NFIG1_C_CVBS_CVBS,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .mode =3D DRM_MODE_=
TV_MODE_PAL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.expected_htotal =
=3D 864,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .config0 =3D VEC_CO=
NFIG0_PAL_BDGHI_STD,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .config1 =3D VEC_CO=
NFIG1_C_CVBS_CVBS,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* PAL-60 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =3D DRM_MODE_=
TV_MODE_PAL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.expected_htotal =
=3D 858,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config0 =3D VEC_CO=
NFIG0_PAL_M_STD,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config1 =3D VEC_CO=
NFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.custom_freq =3D 0x=
2a098acb,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .mode =3D DRM_MODE_=
TV_MODE_PAL_M,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.expected_htotal =
=3D 858,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .config0 =3D VEC_CO=
NFIG0_PAL_M_STD,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .config1 =3D VEC_CO=
NFIG1_C_CVBS_CVBS,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =3D DRM_MODE_=
TV_MODE_PAL_N,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.expected_htotal =
=3D 864,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config0 =3D VEC_CO=
NFIG0_PAL_N_STD,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config1 =3D VEC_CO=
NFIG1_C_CVBS_CVBS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =3D DRM_MODE_=
TV_MODE_SECAM,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.expected_htotal =
=3D 864,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config0 =3D VEC_CO=
NFIG0_SECAM_STD,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config1 =3D VEC_CO=
NFIG1_C_CVBS_CVBS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.custom_freq =3D 0x=
29c71c72,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0};<br>
<br>
=C2=A0static inline const struct vc4_vec_tv_mode *<br>
-vc4_vec_tv_mode_lookup(unsigned int mode)<br>
+vc4_vec_tv_mode_lookup(unsigned int mode, u16 htotal)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(vc4_vec_tv_mode=
s); i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct vc4_ve=
c_tv_mode *tv_mode =3D &amp;vc4_vec_tv_modes[i];<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tv_mode-&gt;mod=
e =3D=3D mode)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tv_mode-&gt;mod=
e =3D=3D mode &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tv_mo=
de-&gt;expected_htotal =3D=3D htotal)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return tv_mode;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -273,9 +341,13 @@ vc4_vec_tv_mode_lookup(unsigned int mode)<br>
<br>
=C2=A0static const struct drm_prop_enum_list legacy_tv_mode_names[] =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { VC4_VEC_TV_MODE_NTSC, &quot;NTSC&quot;, },<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ VC4_VEC_TV_MODE_NTSC_443, &quot;NTSC-443&quot=
;, },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { VC4_VEC_TV_MODE_NTSC_J, &quot;NTSC-J&quot;, }=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { VC4_VEC_TV_MODE_PAL, &quot;PAL&quot;, },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ VC4_VEC_TV_MODE_PAL_60, &quot;PAL-60&quot;, }=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { VC4_VEC_TV_MODE_PAL_M, &quot;PAL-M&quot;, },<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ VC4_VEC_TV_MODE_PAL_N, &quot;PAL-N&quot;, },<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ VC4_VEC_TV_MODE_SECAM, &quot;SECAM&quot;, },<=
br>
=C2=A0};<br>
<br>
=C2=A0static enum drm_connector_status<br>
@@ -306,11 +378,16 @@ vc4_vec_connector_set_property(struct drm_connector *=
connector,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;tv.mode =
=3D DRM_MODE_TV_MODE_NTSC;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case VC4_VEC_TV_MODE_NTSC_443:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;tv.mode =
=3D DRM_MODE_TV_MODE_NTSC_443;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VC4_VEC_TV_MODE_NTSC_J:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;tv.mode =
=3D DRM_MODE_TV_MODE_NTSC_J;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VC4_VEC_TV_MODE_PAL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case VC4_VEC_TV_MODE_PAL_60:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;tv.mode =
=3D DRM_MODE_TV_MODE_PAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
@@ -318,6 +395,14 @@ vc4_vec_connector_set_property(struct drm_connector *c=
onnector,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;tv.mode =
=3D DRM_MODE_TV_MODE_PAL_M;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case VC4_VEC_TV_MODE_PAL_N:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;tv.mode =
=3D DRM_MODE_TV_MODE_PAL_N;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case VC4_VEC_TV_MODE_SECAM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;tv.mode =
=3D DRM_MODE_TV_MODE_SECAM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
@@ -341,6 +426,10 @@ vc4_vec_connector_get_property(struct drm_connector *c=
onnector,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D VC4_VEC_TV=
_MODE_NTSC;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_TV_MODE_NTSC_443:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D VC4_VEC_TV=
_MODE_NTSC_443;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case DRM_MODE_TV_MODE_NTSC_J:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D VC4_VEC_TV=
_MODE_NTSC_J;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
@@ -353,6 +442,14 @@ vc4_vec_connector_get_property(struct drm_connector *c=
onnector,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D VC4_VEC_TV=
_MODE_PAL_M;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_TV_MODE_PAL_N:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D VC4_VEC_TV=
_MODE_PAL_N;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_TV_MODE_SECAM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D VC4_VEC_TV=
_MODE_SECAM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
@@ -448,13 +545,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder=
 *encoder,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_connector *connector =3D &amp;vec-&g=
t;connector;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_connector_state *conn_state =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_atomic_get_new_=
connector_state(state, connector);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_display_mode *adjusted_mode =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;encoder-&gt;cr=
tc-&gt;state-&gt;adjusted_mode;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct vc4_vec_tv_mode *tv_mode;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int idx, ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!drm_dev_enter(drm, &amp;idx))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tv_mode =3D vc4_vec_tv_mode_lookup(conn_state-&=
gt;tv.mode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tv_mode =3D vc4_vec_tv_mode_lookup(conn_state-&=
gt;tv.mode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adjusted=
_mode-&gt;htotal);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tv_mode)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_dev_exit;<=
br>
<br>
@@ -648,9 +748,12 @@ static int vc4_vec_bind(struct device *dev, struct dev=
ice *master, void *data)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D drm_mode_create_tv_properties(drm,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(DRM_MODE_TV_MODE_NTSC) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(DRM_MODE_TV_MODE_NTSC_443) |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(DRM_MODE_TV_MODE_NTSC_J) |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(DRM_MODE_TV_MODE_PAL) |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(DRM_MODE_TV_MODE_PAL_M));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(DRM_MODE_TV_MODE_PAL_M) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(DRM_MODE_TV_MODE_PAL_N) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(DRM_MODE_TV_MODE_SECAM));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
<br>
<br>
-- <br>
b4 0.11.0-dev-99e3a<br>
</blockquote></div>

--00000000000077594705ecf55d40--
