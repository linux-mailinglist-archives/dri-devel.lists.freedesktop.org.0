Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF09623DCA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 09:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0461E10E6B0;
	Thu, 10 Nov 2022 08:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739C610E057;
 Wed,  9 Nov 2022 16:55:48 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46-20020a9d0631000000b00666823da25fso10463765otn.0; 
 Wed, 09 Nov 2022 08:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O1KkFGb5e1YThMNwGJF2UpWctvb6fSwzAk2yYSNMgcY=;
 b=KVXY/zxRn5GycrdQQG1L/TuGy6SsRScy+AtF4y6X64Nf8iLHXppA/VMeMjaX9ZXIEB
 /mNi3yr8PoR+v0v7mFWQ3S5gAbeZynGvKZvBnO0ZPILS9uOcXKXuTnCmaubdtctyqTd6
 4A8yDdWAovg29V+6p/aFZf8gTcxnWaFjuVfad5TompEzKa/HVGY5FCFiM2O+oGoXhZpy
 iG2k4xKP7WSPni52EyIaPhfBIczzOJJv/kZhTvb0bGOhu9dmVEfqTtjLVoDIudQM8cCk
 dL0KJsJE+v4Or3aX3Fp/Ewes9sVC8NXK6J6+nYV9a95hudSatGSa4wNtIBJb5dGtKqBG
 n1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O1KkFGb5e1YThMNwGJF2UpWctvb6fSwzAk2yYSNMgcY=;
 b=gieBPt0lThv65isQ7fIZFgbxe3rMNTYAcg5+p/qftSVV+aObz2pvJdFUIDGToaimoz
 2Elr89iPvXyStSB0tuOYHT1dXLo9NBFksuzLY0RO0pgW5lVo1wqmfBHIJeiK/s9dxga3
 e1vouAGhE3kcbGzXbEem6wi9oQDU2A2tU4EzNQl5tMZPli8Ef+1gCRfAz/qmTKQUkE45
 ZXr0eFtIpuQcEJlF4fRLKbEX7fRVkOJEavmrf9a5HR8g64GFLyk12v+PE8m9agkojW+1
 hjfw2omJYRf0kQ9VDcHyjcNmQSvJ6uH4HxsdKixVtsD18ETZNWWURwSr8cDrnh5iYHiV
 oIsg==
X-Gm-Message-State: ACrzQf1+SFyYdasitl9Wh3Lyz2nYN0ijDzqYKoYv2es50yhipU+BE4an
 UfOuvZeTeqWKrZfHFlFVKKKCkSrUDMP1rqhHFxI=
X-Google-Smtp-Source: AMsMyM4vcLLdqPpBKQH+DtQtf9XrUlcrESRCDNAr7IHzlXAycuBvizOeH9kJ1MwbD6kif03YYUGWDE6hdPlPksSuqnE=
X-Received: by 2002:a9d:20e3:0:b0:655:d819:244b with SMTP id
 x90-20020a9d20e3000000b00655d819244bmr29464942ota.232.1668012947381; Wed, 09
 Nov 2022 08:55:47 -0800 (PST)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
 <20220728-rpi-analog-tv-properties-v7-22-7072a478c6b3@cerno.tech>
 <e0779ff5-3227-4a6f-1c0b-de2fbff99425@gmail.com>
In-Reply-To: <e0779ff5-3227-4a6f-1c0b-de2fbff99425@gmail.com>
From: Lukas Satin <luke.satin@gmail.com>
Date: Wed, 9 Nov 2022 17:55:36 +0100
Message-ID: <CAEFVmOJ5A7+hUPwb3yUiVegJfUb_1-DGKu1YUCsF=hFTrjASzA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v7 22/23] drm/vc4: vec: Add support for more
 analog TV standards
To: kfyatek+publicgit@gmail.com
Content-Type: multipart/alternative; boundary="00000000000035a59d05ed0c8771"
X-Mailman-Approved-At: Thu, 10 Nov 2022 08:47:29 +0000
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
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000035a59d05ed0c8771
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That's great, I will test it on Ubuntu + Nouveau x86_64 and Batocera-Linux.

I'm not interested in Raspberry Pi. I see you have some commit in
RaspberryPi/Linux. Will this go to some Nouveau driver, so I can test it on
x86_64 machine? I have some basic experience compiling Linux kernel (nvidia
driver) from 10 years ago.

Scaling is not the way to go because I do this to not use scaling. I could
use 640x480 and scale 320x240 to that mode, right? That is what old
retrogaming laptop LCD screens do (you can even enable this in their BIOS).

More appropriate is to preserve pixel ratio and have some border. So you
mostly select the closest resolution and live with small border on the
edge. Then you can crop it on analog TV using real world dials :-)

I joined Nouveau developer list here. I don't know why we have like 40
email recipients here and now we discuss Raspberry. Anyway, I would like to
see this in Nouveau, so I could test it on several Geforce devices with TV
out and Windows Media Center devices such as Acer iDEA 510. Such devices
have SCART and component out, they did cost quite a lot and nowadays you
can get them for 30-50 EUR. It is cheaper that Raspberry with all the
additional cables and have better video output quality (RGB is better than
CVBS).

There was NVTV utility that can do this in Linux, but that works only for
Geforce 3 and older. That would make sense if you get Intel Core Quad
motherboard with AGP slot (yes they do exist).

So I'm collecting various retrogaming hardware, have 8 computers on single
KVM and CRT, several big box games and 20 computers total. Two Sony PVM's,
one JVC, several CRT's and Samsung QLED with HDR as well. I prefer CRT :-)

So can we have this NVTV functionality or this above Rasp commit in
Nouveau, so I can test it with Nvidia GPU even it takes me whole weekend to
mess around?

When it works, I would like to present it to regular retrogaming community
and give you a proper credit, of course.

Thank you,
Lukas

On Wed, Nov 9, 2022 at 2:15 AM Mateusz Kwiatkowski <kfyatek@gmail.com>
wrote:

> Hi Maxime,
>
> I ran your v7 patchset on my Pi with Xorg, and the mode switching, as wel=
l
> as
> the preferred mode handling, all work really well now!
>
> I just noted that the downstream version of the vc4 driver still has
> inaccurate
> field delays in vc4_crtc.c, which causes vertical lines to appear jagged
> (like
> here:
> https://user-images.githubusercontent.com/4499762/112738569-385c3280-8f64=
-11eb-83c4-d671537af209.png
> ).
> This has been fixed downstream in
>
> https://github.com/raspberrypi/linux/pull/4241/commits/bc093f27bf2613ec93=
524fdc19e922dd7dd3d800
> ,
> but I guess that should be upstreamed separately...?
>
> Anyway, it's unrelated to the changes made in this patchset, so... I'm no=
t
> sure
> if I'm qualified or allowed to do these, but just in case:
>
> Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
>
> (that pretty much applies to parts 19-22 in general, I can respond to tho=
se
> messages as well if you wish)
>
> Best regards,
> Mateusz Kwiatkowski
>
> W dniu 7.11.2022 o 15:16, Maxime Ripard pisze:
> > From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> >
> > Add support for the following composite output modes (all of them are
> > somewhat more obscure than the previously defined ones):
> >
> > - NTSC_443 - NTSC-style signal with the chroma subcarrier shifted to
> >   4.43361875 MHz (the PAL subcarrier frequency). Never used for
> >   broadcasting, but sometimes used as a hack to play NTSC content in PA=
L
> >   regions (e.g. on VCRs).
> > - PAL_N - PAL with alternative chroma subcarrier frequency,
> >   3.58205625 MHz. Used as a broadcast standard in Argentina, Paraguay
> >   and Uruguay to fit 576i50 with colour in 6 MHz channel raster.
> > - PAL60 - 480i60 signal with PAL-style color at normal European PAL
> >   frequency. Another non-standard, non-broadcast mode, used in similar
> >   contexts as NTSC_443. Some displays support one but not the other.
> > - SECAM - French frequency-modulated analog color standard; also have
> >   been broadcast in Eastern Europe and various parts of Africa and Asia=
.
> >   Uses the same 576i50 timings as PAL.
> >
> > Also added some comments explaining color subcarrier frequency
> > registers.
> >
> > Acked-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> > Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > ---
> > Changes in v6:
> > - Support PAL60 again
> > ---
> >  drivers/gpu/drm/vc4/vc4_vec.c | 111
> ++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 107 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_vec.c
> b/drivers/gpu/drm/vc4/vc4_vec.c
> > index a828fc6fb776..d23dbad3cbf6 100644
> > --- a/drivers/gpu/drm/vc4/vc4_vec.c
> > +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> > @@ -46,6 +46,7 @@
> >  #define VEC_CONFIG0_YDEL(x)          ((x) << 26)
> >  #define VEC_CONFIG0_CDEL_MASK                GENMASK(25, 24)
> >  #define VEC_CONFIG0_CDEL(x)          ((x) << 24)
> > +#define VEC_CONFIG0_SECAM_STD                BIT(21)
> >  #define VEC_CONFIG0_PBPR_FIL         BIT(18)
> >  #define VEC_CONFIG0_CHROMA_GAIN_MASK GENMASK(17, 16)
> >  #define VEC_CONFIG0_CHROMA_GAIN_UNITY        (0 << 16)
> > @@ -76,6 +77,27 @@
> >  #define VEC_SOFT_RESET                       0x10c
> >  #define VEC_CLMP0_START                      0x144
> >  #define VEC_CLMP0_END                        0x148
> > +
> > +/*
> > + * These set the color subcarrier frequency
> > + * if VEC_CONFIG1_CUSTOM_FREQ is enabled.
> > + *
> > + * VEC_FREQ1_0 contains the most significant 16-bit half-word,
> > + * VEC_FREQ3_2 contains the least significant 16-bit half-word.
> > + * 0x80000000 seems to be equivalent to the pixel clock
> > + * (which itself is the VEC clock divided by 8).
> > + *
> > + * Reference values (with the default pixel clock of 13.5 MHz):
> > + *
> > + * NTSC  (3579545.[45] Hz)     - 0x21F07C1F
> > + * PAL   (4433618.75 Hz)       - 0x2A098ACB
> > + * PAL-M (3575611.[888111] Hz) - 0x21E6EFE3
> > + * PAL-N (3582056.25 Hz)       - 0x21F69446
> > + *
> > + * NOTE: For SECAM, it is used as the Dr center frequency,
> > + * regardless of whether VEC_CONFIG1_CUSTOM_FREQ is enabled or not;
> > + * that is specified as 4406250 Hz, which corresponds to 0x29C71C72.
> > + */
> >  #define VEC_FREQ3_2                  0x180
> >  #define VEC_FREQ1_0                  0x184
> >
> > @@ -118,6 +140,14 @@
> >
> >  #define VEC_INTERRUPT_CONTROL                0x190
> >  #define VEC_INTERRUPT_STATUS         0x194
> > +
> > +/*
> > + * Db center frequency for SECAM; the clock for this is the same as fo=
r
> > + * VEC_FREQ3_2/VEC_FREQ1_0, which is used for Dr center frequency.
> > + *
> > + * This is specified as 4250000 Hz, which corresponds to 0x284BDA13.
> > + * That is also the default value, so no need to set it explicitly.
> > + */
> >  #define VEC_FCW_SECAM_B                      0x198
> >  #define VEC_SECAM_GAIN_VAL           0x19c
> >
> > @@ -197,10 +227,15 @@ enum vc4_vec_tv_mode_id {
> >       VC4_VEC_TV_MODE_NTSC_J,
> >       VC4_VEC_TV_MODE_PAL,
> >       VC4_VEC_TV_MODE_PAL_M,
> > +     VC4_VEC_TV_MODE_NTSC_443,
> > +     VC4_VEC_TV_MODE_PAL_60,
> > +     VC4_VEC_TV_MODE_PAL_N,
> > +     VC4_VEC_TV_MODE_SECAM,
> >  };
> >
> >  struct vc4_vec_tv_mode {
> >       unsigned int mode;
> > +     u16 expected_htotal;
> >       u32 config0;
> >       u32 config1;
> >       u32 custom_freq;
> > @@ -236,35 +271,68 @@ static const struct debugfs_reg32 vec_regs[] =3D =
{
> >  static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] =3D {
> >       {
> >               .mode =3D DRM_MODE_TV_MODE_NTSC,
> > +             .expected_htotal =3D 858,
> >               .config0 =3D VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
> >               .config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
> >       },
> > +     {
> > +             .mode =3D DRM_MODE_TV_MODE_NTSC_443,
> > +             .expected_htotal =3D 858,
> > +             .config0 =3D VEC_CONFIG0_NTSC_STD,
> > +             .config1 =3D VEC_CONFIG1_C_CVBS_CVBS |
> VEC_CONFIG1_CUSTOM_FREQ,
> > +             .custom_freq =3D 0x2a098acb,
> > +     },
> >       {
> >               .mode =3D DRM_MODE_TV_MODE_NTSC_J,
> > +             .expected_htotal =3D 858,
> >               .config0 =3D VEC_CONFIG0_NTSC_STD,
> >               .config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
> >       },
> >       {
> >               .mode =3D DRM_MODE_TV_MODE_PAL,
> > +             .expected_htotal =3D 864,
> >               .config0 =3D VEC_CONFIG0_PAL_BDGHI_STD,
> >               .config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
> >       },
> > +     {
> > +             /* PAL-60 */
> > +             .mode =3D DRM_MODE_TV_MODE_PAL,
> > +             .expected_htotal =3D 858,
> > +             .config0 =3D VEC_CONFIG0_PAL_M_STD,
> > +             .config1 =3D VEC_CONFIG1_C_CVBS_CVBS |
> VEC_CONFIG1_CUSTOM_FREQ,
> > +             .custom_freq =3D 0x2a098acb,
> > +     },
> >       {
> >               .mode =3D DRM_MODE_TV_MODE_PAL_M,
> > +             .expected_htotal =3D 858,
> >               .config0 =3D VEC_CONFIG0_PAL_M_STD,
> >               .config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
> >       },
> > +     {
> > +             .mode =3D DRM_MODE_TV_MODE_PAL_N,
> > +             .expected_htotal =3D 864,
> > +             .config0 =3D VEC_CONFIG0_PAL_N_STD,
> > +             .config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
> > +     },
> > +     {
> > +             .mode =3D DRM_MODE_TV_MODE_SECAM,
> > +             .expected_htotal =3D 864,
> > +             .config0 =3D VEC_CONFIG0_SECAM_STD,
> > +             .config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
> > +             .custom_freq =3D 0x29c71c72,
> > +     },
> >  };
> >
> >  static inline const struct vc4_vec_tv_mode *
> > -vc4_vec_tv_mode_lookup(unsigned int mode)
> > +vc4_vec_tv_mode_lookup(unsigned int mode, u16 htotal)
> >  {
> >       unsigned int i;
> >
> >       for (i =3D 0; i < ARRAY_SIZE(vc4_vec_tv_modes); i++) {
> >               const struct vc4_vec_tv_mode *tv_mode =3D
> &vc4_vec_tv_modes[i];
> >
> > -             if (tv_mode->mode =3D=3D mode)
> > +             if (tv_mode->mode =3D=3D mode &&
> > +                 tv_mode->expected_htotal =3D=3D htotal)
> >                       return tv_mode;
> >       }
> >
> > @@ -273,9 +341,13 @@ vc4_vec_tv_mode_lookup(unsigned int mode)
> >
> >  static const struct drm_prop_enum_list legacy_tv_mode_names[] =3D {
> >       { VC4_VEC_TV_MODE_NTSC, "NTSC", },
> > +     { VC4_VEC_TV_MODE_NTSC_443, "NTSC-443", },
> >       { VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
> >       { VC4_VEC_TV_MODE_PAL, "PAL", },
> > +     { VC4_VEC_TV_MODE_PAL_60, "PAL-60", },
> >       { VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
> > +     { VC4_VEC_TV_MODE_PAL_N, "PAL-N", },
> > +     { VC4_VEC_TV_MODE_SECAM, "SECAM", },
> >  };
> >
> >  static enum drm_connector_status
> > @@ -306,11 +378,16 @@ vc4_vec_connector_set_property(struct
> drm_connector *connector,
> >               state->tv.mode =3D DRM_MODE_TV_MODE_NTSC;
> >               break;
> >
> > +     case VC4_VEC_TV_MODE_NTSC_443:
> > +             state->tv.mode =3D DRM_MODE_TV_MODE_NTSC_443;
> > +             break;
> > +
> >       case VC4_VEC_TV_MODE_NTSC_J:
> >               state->tv.mode =3D DRM_MODE_TV_MODE_NTSC_J;
> >               break;
> >
> >       case VC4_VEC_TV_MODE_PAL:
> > +     case VC4_VEC_TV_MODE_PAL_60:
> >               state->tv.mode =3D DRM_MODE_TV_MODE_PAL;
> >               break;
> >
> > @@ -318,6 +395,14 @@ vc4_vec_connector_set_property(struct drm_connecto=
r
> *connector,
> >               state->tv.mode =3D DRM_MODE_TV_MODE_PAL_M;
> >               break;
> >
> > +     case VC4_VEC_TV_MODE_PAL_N:
> > +             state->tv.mode =3D DRM_MODE_TV_MODE_PAL_N;
> > +             break;
> > +
> > +     case VC4_VEC_TV_MODE_SECAM:
> > +             state->tv.mode =3D DRM_MODE_TV_MODE_SECAM;
> > +             break;
> > +
> >       default:
> >               return -EINVAL;
> >       }
> > @@ -341,6 +426,10 @@ vc4_vec_connector_get_property(struct drm_connecto=
r
> *connector,
> >               *val =3D VC4_VEC_TV_MODE_NTSC;
> >               break;
> >
> > +     case DRM_MODE_TV_MODE_NTSC_443:
> > +             *val =3D VC4_VEC_TV_MODE_NTSC_443;
> > +             break;
> > +
> >       case DRM_MODE_TV_MODE_NTSC_J:
> >               *val =3D VC4_VEC_TV_MODE_NTSC_J;
> >               break;
> > @@ -353,6 +442,14 @@ vc4_vec_connector_get_property(struct drm_connecto=
r
> *connector,
> >               *val =3D VC4_VEC_TV_MODE_PAL_M;
> >               break;
> >
> > +     case DRM_MODE_TV_MODE_PAL_N:
> > +             *val =3D VC4_VEC_TV_MODE_PAL_N;
> > +             break;
> > +
> > +     case DRM_MODE_TV_MODE_SECAM:
> > +             *val =3D VC4_VEC_TV_MODE_SECAM;
> > +             break;
> > +
> >       default:
> >               return -EINVAL;
> >       }
> > @@ -448,13 +545,16 @@ static void vc4_vec_encoder_enable(struct
> drm_encoder *encoder,
> >       struct drm_connector *connector =3D &vec->connector;
> >       struct drm_connector_state *conn_state =3D
> >               drm_atomic_get_new_connector_state(state, connector);
> > +     struct drm_display_mode *adjusted_mode =3D
> > +             &encoder->crtc->state->adjusted_mode;
> >       const struct vc4_vec_tv_mode *tv_mode;
> >       int idx, ret;
> >
> >       if (!drm_dev_enter(drm, &idx))
> >               return;
> >
> > -     tv_mode =3D vc4_vec_tv_mode_lookup(conn_state->tv.mode);
> > +     tv_mode =3D vc4_vec_tv_mode_lookup(conn_state->tv.mode,
> > +                                      adjusted_mode->htotal);
> >       if (!tv_mode)
> >               goto err_dev_exit;
> >
> > @@ -648,9 +748,12 @@ static int vc4_vec_bind(struct device *dev, struct
> device *master, void *data)
> >
> >       ret =3D drm_mode_create_tv_properties(drm,
> >                                           BIT(DRM_MODE_TV_MODE_NTSC) |
> > +                                         BIT(DRM_MODE_TV_MODE_NTSC_443=
)
> |
> >                                           BIT(DRM_MODE_TV_MODE_NTSC_J) =
|
> >                                           BIT(DRM_MODE_TV_MODE_PAL) |
> > -                                         BIT(DRM_MODE_TV_MODE_PAL_M));
> > +                                         BIT(DRM_MODE_TV_MODE_PAL_M) |
> > +                                         BIT(DRM_MODE_TV_MODE_PAL_N) |
> > +                                         BIT(DRM_MODE_TV_MODE_SECAM));
> >       if (ret)
> >               return ret;
> >
> >
> */pre>
>
>

--00000000000035a59d05ed0c8771
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That&#39;s great, I will test it on Ubuntu=C2=A0+ Nouveau =
x86_64 and Batocera-Linux.<div><br></div><div>I&#39;m not interested in Ras=
pberry Pi. I see you have some commit in RaspberryPi/Linux. Will this go to=
 some Nouveau driver, so I can test it on x86_64 machine? I have some basic=
 experience compiling Linux kernel (nvidia driver) from 10 years ago.</div>=
<div><br></div><div>Scaling is not the way to go because I do this to not u=
se scaling. I could use 640x480 and scale 320x240 to that mode, right? That=
 is what old retrogaming laptop LCD screens do (you can even enable this in=
 their BIOS).</div><div><br></div><div>More appropriate is to preserve pixe=
l ratio and have some border. So you mostly select the closest resolution a=
nd live with small border on the edge. Then you can crop it on analog TV us=
ing real world dials :-)</div><div><br></div><div>I joined Nouveau develope=
r list here. I don&#39;t know why we have like 40 email recipients here and=
 now we discuss Raspberry. Anyway, I would like to see this in Nouveau, so =
I could test it on several Geforce devices with TV out and Windows Media Ce=
nter devices such as Acer iDEA 510. Such devices have SCART and component o=
ut, they did cost quite a lot and nowadays you can get them for 30-50 EUR. =
It is cheaper that Raspberry with all the additional cables and have better=
 video output quality (RGB is better than CVBS).</div><div><br></div><div>T=
here was NVTV utility that can do this in Linux, but that works only for Ge=
force 3 and older. That would make sense if you get Intel=C2=A0Core Quad mo=
therboard with AGP slot (yes they do exist).</div><div><br></div><div>So I&=
#39;m collecting various retrogaming hardware, have 8 computers on single K=
VM and CRT, several big box games and 20 computers total. Two Sony PVM&#39;=
s, one JVC, several CRT&#39;s and Samsung QLED with HDR as well. I prefer C=
RT :-)</div><div><br></div><div>So can we have this NVTV functionality or t=
his above Rasp commit in Nouveau, so I can test it with Nvidia GPU even it =
takes me whole weekend to mess around?</div><div><br></div><div>When it wor=
ks, I would like to present it to regular retrogaming community and give yo=
u a proper credit, of course.</div><div><br></div><div>Thank you,</div><div=
>Lukas</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, Nov 9, 2022 at 2:15 AM Mateusz Kwiatkowski &lt;<a href=
=3D"mailto:kfyatek@gmail.com">kfyatek@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi Maxime,<br>
<br>
I ran your v7 patchset on my Pi with Xorg, and the mode switching, as well =
as<br>
the preferred mode handling, all work really well now!<br>
<br>
I just noted that the downstream version of the vc4 driver still has inaccu=
rate<br>
field delays in vc4_crtc.c, which causes vertical lines to appear jagged (l=
ike<br>
here: <a href=3D"https://user-images.githubusercontent.com/4499762/11273856=
9-385c3280-8f64-11eb-83c4-d671537af209.png" rel=3D"noreferrer" target=3D"_b=
lank">https://user-images.githubusercontent.com/4499762/112738569-385c3280-=
8f64-11eb-83c4-d671537af209.png</a>).<br>
This has been fixed downstream in<br>
<a href=3D"https://github.com/raspberrypi/linux/pull/4241/commits/bc093f27b=
f2613ec93524fdc19e922dd7dd3d800" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/raspberrypi/linux/pull/4241/commits/bc093f27bf2613ec93524fdc1=
9e922dd7dd3d800</a>,<br>
but I guess that should be upstreamed separately...?<br>
<br>
Anyway, it&#39;s unrelated to the changes made in this patchset, so... I&#3=
9;m not sure<br>
if I&#39;m qualified or allowed to do these, but just in case:<br>
<br>
Tested-by: Mateusz Kwiatkowski &lt;<a href=3D"mailto:kfyatek%2Bpublicgit@gm=
ail.com" target=3D"_blank">kfyatek+publicgit@gmail.com</a>&gt;<br>
<br>
(that pretty much applies to parts 19-22 in general, I can respond to those=
<br>
messages as well if you wish)<br>
<br>
Best regards,<br>
Mateusz Kwiatkowski<br>
<br>
W dniu 7.11.2022 o 15:16, Maxime Ripard pisze:<br>
&gt; From: Mateusz Kwiatkowski &lt;<a href=3D"mailto:kfyatek%2Bpublicgit@gm=
ail.com" target=3D"_blank">kfyatek+publicgit@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Add support for the following composite output modes (all of them are<=
br>
&gt; somewhat more obscure than the previously defined ones):<br>
&gt;<br>
&gt; - NTSC_443 - NTSC-style signal with the chroma subcarrier shifted to<b=
r>
&gt;=C2=A0 =C2=A04.43361875 MHz (the PAL subcarrier frequency). Never used =
for<br>
&gt;=C2=A0 =C2=A0broadcasting, but sometimes used as a hack to play NTSC co=
ntent in PAL<br>
&gt;=C2=A0 =C2=A0regions (e.g. on VCRs).<br>
&gt; - PAL_N - PAL with alternative chroma subcarrier frequency,<br>
&gt;=C2=A0 =C2=A03.58205625 MHz. Used as a broadcast standard in Argentina,=
 Paraguay<br>
&gt;=C2=A0 =C2=A0and Uruguay to fit 576i50 with colour in 6 MHz channel ras=
ter.<br>
&gt; - PAL60 - 480i60 signal with PAL-style color at normal European PAL<br=
>
&gt;=C2=A0 =C2=A0frequency. Another non-standard, non-broadcast mode, used =
in similar<br>
&gt;=C2=A0 =C2=A0contexts as NTSC_443. Some displays support one but not th=
e other.<br>
&gt; - SECAM - French frequency-modulated analog color standard; also have<=
br>
&gt;=C2=A0 =C2=A0been broadcast in Eastern Europe and various parts of Afri=
ca and Asia.<br>
&gt;=C2=A0 =C2=A0Uses the same 576i50 timings as PAL.<br>
&gt;<br>
&gt; Also added some comments explaining color subcarrier frequency<br>
&gt; registers.<br>
&gt;<br>
&gt; Acked-by: Noralf Tr=C3=B8nnes &lt;<a href=3D"mailto:noralf@tronnes.org=
" target=3D"_blank">noralf@tronnes.org</a>&gt;<br>
&gt; Signed-off-by: Mateusz Kwiatkowski &lt;<a href=3D"mailto:kfyatek%2Bpub=
licgit@gmail.com" target=3D"_blank">kfyatek+publicgit@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Maxime Ripard &lt;maxime@cerno.tech&gt;<br>
&gt;<br>
&gt; ---<br>
&gt; Changes in v6:<br>
&gt; - Support PAL60 again<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/vc4/vc4_vec.c | 111 ++++++++++++++++++++++++++++=
++++++++++++--<br>
&gt;=C2=A0 1 file changed, 107 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_v=
ec.c<br>
&gt; index a828fc6fb776..d23dbad3cbf6 100644<br>
&gt; --- a/drivers/gpu/drm/vc4/vc4_vec.c<br>
&gt; +++ b/drivers/gpu/drm/vc4/vc4_vec.c<br>
&gt; @@ -46,6 +46,7 @@<br>
&gt;=C2=A0 #define VEC_CONFIG0_YDEL(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((=
x) &lt;&lt; 26)<br>
&gt;=C2=A0 #define VEC_CONFIG0_CDEL_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 GENMASK(25, 24)<br>
&gt;=C2=A0 #define VEC_CONFIG0_CDEL(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((=
x) &lt;&lt; 24)<br>
&gt; +#define VEC_CONFIG0_SECAM_STD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(21)<br>
&gt;=C2=A0 #define VEC_CONFIG0_PBPR_FIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BI=
T(18)<br>
&gt;=C2=A0 #define VEC_CONFIG0_CHROMA_GAIN_MASK GENMASK(17, 16)<br>
&gt;=C2=A0 #define VEC_CONFIG0_CHROMA_GAIN_UNITY=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 (0 &lt;&lt; 16)<br>
&gt; @@ -76,6 +77,27 @@<br>
&gt;=C2=A0 #define VEC_SOFT_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x10c<br>
&gt;=C2=A0 #define VEC_CLMP0_START=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x144<br>
&gt;=C2=A0 #define VEC_CLMP0_END=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x148<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * These set the color subcarrier frequency<br>
&gt; + * if VEC_CONFIG1_CUSTOM_FREQ is enabled.<br>
&gt; + *<br>
&gt; + * VEC_FREQ1_0 contains the most significant 16-bit half-word,<br>
&gt; + * VEC_FREQ3_2 contains the least significant 16-bit half-word.<br>
&gt; + * 0x80000000 seems to be equivalent to the pixel clock<br>
&gt; + * (which itself is the VEC clock divided by 8).<br>
&gt; + *<br>
&gt; + * Reference values (with the default pixel clock of 13.5 MHz):<br>
&gt; + *<br>
&gt; + * NTSC=C2=A0 (3579545.[45] Hz)=C2=A0 =C2=A0 =C2=A0- 0x21F07C1F<br>
&gt; + * PAL=C2=A0 =C2=A0(4433618.75 Hz)=C2=A0 =C2=A0 =C2=A0 =C2=A0- 0x2A09=
8ACB<br>
&gt; + * PAL-M (3575611.[888111] Hz) - 0x21E6EFE3<br>
&gt; + * PAL-N (3582056.25 Hz)=C2=A0 =C2=A0 =C2=A0 =C2=A0- 0x21F69446<br>
&gt; + *<br>
&gt; + * NOTE: For SECAM, it is used as the Dr center frequency,<br>
&gt; + * regardless of whether VEC_CONFIG1_CUSTOM_FREQ is enabled or not;<b=
r>
&gt; + * that is specified as 4406250 Hz, which corresponds to 0x29C71C72.<=
br>
&gt; + */<br>
&gt;=C2=A0 #define VEC_FREQ3_2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x180<br>
&gt;=C2=A0 #define VEC_FREQ1_0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x184<br>
&gt;=C2=A0 <br>
&gt; @@ -118,6 +140,14 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define VEC_INTERRUPT_CONTROL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x190<br>
&gt;=C2=A0 #define VEC_INTERRUPT_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
194<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Db center frequency for SECAM; the clock for this is the same as f=
or<br>
&gt; + * VEC_FREQ3_2/VEC_FREQ1_0, which is used for Dr center frequency.<br=
>
&gt; + *<br>
&gt; + * This is specified as 4250000 Hz, which corresponds to 0x284BDA13.<=
br>
&gt; + * That is also the default value, so no need to set it explicitly.<b=
r>
&gt; + */<br>
&gt;=C2=A0 #define VEC_FCW_SECAM_B=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x198<br>
&gt;=C2=A0 #define VEC_SECAM_GAIN_VAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x19c<br>
&gt;=C2=A0 <br>
&gt; @@ -197,10 +227,15 @@ enum vc4_vec_tv_mode_id {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VC4_VEC_TV_MODE_NTSC_J,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VC4_VEC_TV_MODE_PAL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VC4_VEC_TV_MODE_PAL_M,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0VC4_VEC_TV_MODE_NTSC_443,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0VC4_VEC_TV_MODE_PAL_60,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0VC4_VEC_TV_MODE_PAL_N,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0VC4_VEC_TV_MODE_SECAM,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct vc4_vec_tv_mode {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 expected_htotal;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 config0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 config1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 custom_freq;<br>
&gt; @@ -236,35 +271,68 @@ static const struct debugfs_reg32 vec_regs[] =3D=
 {<br>
&gt;=C2=A0 static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =3D DRM_MO=
DE_TV_MODE_NTSC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.expected_htotal =3D =
858,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config0 =3D VEC=
_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config1 =3D VEC=
_CONFIG1_C_CVBS_CVBS,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =3D DRM_MODE_TV=
_MODE_NTSC_443,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.expected_htotal =3D =
858,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config0 =3D VEC_CONF=
IG0_NTSC_STD,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config1 =3D VEC_CONF=
IG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.custom_freq =3D 0x2a=
098acb,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =3D DRM_MO=
DE_TV_MODE_NTSC_J,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.expected_htotal =3D =
858,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config0 =3D VEC=
_CONFIG0_NTSC_STD,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config1 =3D VEC=
_CONFIG1_C_CVBS_CVBS,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =3D DRM_MO=
DE_TV_MODE_PAL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.expected_htotal =3D =
864,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config0 =3D VEC=
_CONFIG0_PAL_BDGHI_STD,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config1 =3D VEC=
_CONFIG1_C_CVBS_CVBS,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* PAL-60 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =3D DRM_MODE_TV=
_MODE_PAL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.expected_htotal =3D =
858,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config0 =3D VEC_CONF=
IG0_PAL_M_STD,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config1 =3D VEC_CONF=
IG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.custom_freq =3D 0x2a=
098acb,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =3D DRM_MO=
DE_TV_MODE_PAL_M,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.expected_htotal =3D =
858,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config0 =3D VEC=
_CONFIG0_PAL_M_STD,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config1 =3D VEC=
_CONFIG1_C_CVBS_CVBS,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =3D DRM_MODE_TV=
_MODE_PAL_N,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.expected_htotal =3D =
864,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config0 =3D VEC_CONF=
IG0_PAL_N_STD,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config1 =3D VEC_CONF=
IG1_C_CVBS_CVBS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =3D DRM_MODE_TV=
_MODE_SECAM,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.expected_htotal =3D =
864,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config0 =3D VEC_CONF=
IG0_SECAM_STD,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config1 =3D VEC_CONF=
IG1_C_CVBS_CVBS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.custom_freq =3D 0x29=
c71c72,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static inline const struct vc4_vec_tv_mode *<br>
&gt; -vc4_vec_tv_mode_lookup(unsigned int mode)<br>
&gt; +vc4_vec_tv_mode_lookup(unsigned int mode, u16 htotal)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int i;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(vc4_vec_tv_m=
odes); i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct vc4=
_vec_tv_mode *tv_mode =3D &amp;vc4_vec_tv_modes[i];<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tv_mode-&gt;mode =
=3D=3D mode)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tv_mode-&gt;mode =
=3D=3D mode &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tv_mode=
-&gt;expected_htotal =3D=3D htotal)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return tv_mode;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; @@ -273,9 +341,13 @@ vc4_vec_tv_mode_lookup(unsigned int mode)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const struct drm_prop_enum_list legacy_tv_mode_names[] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ VC4_VEC_TV_MODE_NTSC, &quot;NTSC&quot;, },=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ VC4_VEC_TV_MODE_NTSC_443, &quot;NTSC-443&quot;,=
 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ VC4_VEC_TV_MODE_NTSC_J, &quot;NTSC-J&quot;=
, },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ VC4_VEC_TV_MODE_PAL, &quot;PAL&quot;, },<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0{ VC4_VEC_TV_MODE_PAL_60, &quot;PAL-60&quot;, },<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ VC4_VEC_TV_MODE_PAL_M, &quot;PAL-M&quot;, =
},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ VC4_VEC_TV_MODE_PAL_N, &quot;PAL-N&quot;, },<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0{ VC4_VEC_TV_MODE_SECAM, &quot;SECAM&quot;, },<br=
>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static enum drm_connector_status<br>
&gt; @@ -306,11 +378,16 @@ vc4_vec_connector_set_property(struct drm_connec=
tor *connector,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;tv.mod=
e =3D DRM_MODE_TV_MODE_NTSC;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0case VC4_VEC_TV_MODE_NTSC_443:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;tv.mode =3D=
 DRM_MODE_TV_MODE_NTSC_443;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case VC4_VEC_TV_MODE_NTSC_J:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;tv.mod=
e =3D DRM_MODE_TV_MODE_NTSC_J;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case VC4_VEC_TV_MODE_PAL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case VC4_VEC_TV_MODE_PAL_60:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;tv.mod=
e =3D DRM_MODE_TV_MODE_PAL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 <br>
&gt; @@ -318,6 +395,14 @@ vc4_vec_connector_set_property(struct drm_connect=
or *connector,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;tv.mod=
e =3D DRM_MODE_TV_MODE_PAL_M;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0case VC4_VEC_TV_MODE_PAL_N:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;tv.mode =3D=
 DRM_MODE_TV_MODE_PAL_N;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case VC4_VEC_TV_MODE_SECAM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;tv.mode =3D=
 DRM_MODE_TV_MODE_SECAM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -341,6 +426,10 @@ vc4_vec_connector_get_property(struct drm_connect=
or *connector,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D VC4_VEC=
_TV_MODE_NTSC;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_MODE_TV_MODE_NTSC_443:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D VC4_VEC_TV_M=
ODE_NTSC_443;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_TV_MODE_NTSC_J:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D VC4_VEC=
_TV_MODE_NTSC_J;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; @@ -353,6 +442,14 @@ vc4_vec_connector_get_property(struct drm_connect=
or *connector,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D VC4_VEC=
_TV_MODE_PAL_M;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_MODE_TV_MODE_PAL_N:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D VC4_VEC_TV_M=
ODE_PAL_N;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_MODE_TV_MODE_SECAM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D VC4_VEC_TV_M=
ODE_SECAM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -448,13 +545,16 @@ static void vc4_vec_encoder_enable(struct drm_en=
coder *encoder,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector =3D &amp;vec=
-&gt;connector;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector_state *conn_state =3D<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_atomic_get_n=
ew_connector_state(state, connector);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_display_mode *adjusted_mode =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;encoder-&gt;crtc=
-&gt;state-&gt;adjusted_mode;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct vc4_vec_tv_mode *tv_mode;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int idx, ret;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!drm_dev_enter(drm, &amp;idx))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0tv_mode =3D vc4_vec_tv_mode_lookup(conn_state-&gt=
;tv.mode);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tv_mode =3D vc4_vec_tv_mode_lookup(conn_state-&gt=
;tv.mode,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adjusted_mo=
de-&gt;htotal);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tv_mode)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_dev_exi=
t;<br>
&gt;=C2=A0 <br>
&gt; @@ -648,9 +748,12 @@ static int vc4_vec_bind(struct device *dev, struc=
t device *master, void *data)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_mode_create_tv_properties(drm,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(DRM_MODE_TV_MODE_NTSC) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0BIT(DRM_MODE_TV_MODE_NTSC_443) |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(DRM_MODE_TV_MODE_NTSC_J) |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(DRM_MODE_TV_MODE_PAL) |<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0BIT(DRM_MODE_TV_MODE_PAL_M));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0BIT(DRM_MODE_TV_MODE_PAL_M) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0BIT(DRM_MODE_TV_MODE_PAL_N) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0BIT(DRM_MODE_TV_MODE_SECAM));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 <br>
&gt;<br>
*/pre&gt;<br>
<br>
</blockquote></div>

--00000000000035a59d05ed0c8771--
