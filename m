Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA94F533115
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 21:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2453E10E12C;
	Tue, 24 May 2022 19:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C95B10E12C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 19:01:33 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id fd25so24260814edb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 12:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p/LRcRqLMyeqKvQf1eqR0kvhGi6WSgrWgvB3HWqz/40=;
 b=bvixvnK/jmXe4FX2KH6IkCO+rTvQ6XL9e+QaLOKUvAH5zBa+Rb55pQnSQJJdbFMZ0D
 b3agVkbri00VAYLSh6NMoVS8VR6qW7+6/ORLbqC47T57yGA4LTQ/JzC5ViZILu4GY2m8
 VMmuhZe9Rn+2LrIp3dPGye/TpDpwhDKmHm+TIhPgd7oY2ppk7296jJSmuNs9cfdwSzg1
 AJFllVILBf1gApb6M4AamjsocrjHSXoApSzwd8eoicdgXhOYWz0jigDcXyTSeFaEa2in
 797VPsBzH8cf52zjuWFh79RGZijrVyANrha/9GbbsOWt2FxJ/V3iFh7bHcMU8bet2ld9
 4jnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p/LRcRqLMyeqKvQf1eqR0kvhGi6WSgrWgvB3HWqz/40=;
 b=lv71EbbEXhPGB29k9at6mOl0COey+qBm/Cr+Ep1DS4KlYWVUK9HMwzdReAFahP6sEE
 J2lsarwDRHkp2oX6hPOrKUJpOEcyPlNY/0kuts+9rAD/jHY0/RvwD46V3g1XxjDTi5ae
 6NPqUUNWs+0JrBpufPIk1hI4byE0dTcKizCtq8G97vPkU3HLUkR3RMdYgwe83i6I/pra
 927DMMh7dvpIb/9/hPO11PsUSvYnz5b7L4INph0zzWyknRd79Cum7N8U1ZLRUcGJ+dJo
 aZpVDQocRZ/xjItf7qOlEUkHBhDwIoj6Svf/AFVX/A9IZId704X2lne5qv13F1ZizuKp
 tYpg==
X-Gm-Message-State: AOAM532gezhPnRPNejlCXREgv9e3KefeogrLKjYLpxcrEdN1Nkw0ew2p
 UWPJn5TsyMt0Gtzl9zF6i5w=
X-Google-Smtp-Source: ABdhPJyXfVLVAhAn3Vtb2xtg0915wucMnM2SyXUZW1SXcuju6qSLOZ8ENWrXeCTRFzFNOP/hv35G8g==
X-Received: by 2002:a05:6402:390b:b0:42a:acb3:bb5 with SMTP id
 fe11-20020a056402390b00b0042aacb30bb5mr29413164edb.236.1653418891911; 
 Tue, 24 May 2022 12:01:31 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net.
 [213.161.3.76]) by smtp.gmail.com with ESMTPSA id
 hh15-20020a170906a94f00b006fec41b21e1sm3576351ejb.171.2022.05.24.12.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 12:01:31 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Icenowy Zheng <icenowy@aosc.io>, mripard@kernel.org, wens@csie.org,
 Genfu Pan <benlypan@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: Re: Re: [PATCH] drm/sun4i: mixer: fix scanline for V3s and D1
Date: Tue, 24 May 2022 21:01:29 +0200
Message-ID: <5568249.DvuYhMxLoT@kista>
In-Reply-To: <86a208c1-9277-32de-3f8f-8976eab15524@sholland.org>
References: <20220521133443.1114749-1-benlypan@gmail.com>
 <70b43ac2910ce9b3e3776d31eda7a791fbae5454.camel@aosc.io>
 <86a208c1-9277-32de-3f8f-8976eab15524@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne torek, 24. maj 2022 ob 19:07:27 CEST je Samuel Holland napisal(a):
> On 5/23/22 8:14 AM, Icenowy Zheng wrote:
> > =E5=9C=A8 2022-05-22=E6=98=9F=E6=9C=9F=E6=97=A5=E7=9A=84 10:36 +0200=EF=
=BC=8CJernej =C5=A0krabec=E5=86=99=E9=81=93=EF=BC=9A
> >> Hi!
> >>
> >> Dne sobota, 21. maj 2022 ob 15:34:43 CEST je Genfu Pan napisal(a):
> >>> Accrording the SDK from Allwinner, the scanline value of yuv and
> >>> rgb for
> >>> V3s are both 1024.
> >>
> >> s/scanline value/scanline length/
> >>
> >> Which SDK? All SDKs that I have or found on internet don't mention
> >> YUV nor RGB=20
> >> scanline limit. That doesn't mean there is none, I'm just unable to
> >> verify=20
> >> your claim. Did you test this by yourself? Also, please make YUV
> >> scanline=20
> >> change separate patch with fixes tag.
> >=20
> > BTW I think chip manuals all say that the chip supports NxN resolution
> > in DE2 chapter, e.g. the V3 datasheet says DE2 "Output size up to
> > 1024x1024".
> >=20
> > However there's no information about D1's second mixer.
>=20
> My information comes from the BSP driver[0]:
>=20
> static const int sun8iw20_de_scale_line_buffer[] =3D {
>         /* DISP0 */
>         2048,
>         /* DISP1 */
>         1024,
> };
>=20
> It looks like the value returned from de_feat_get_scale_linebuf() may be=
=20
used
> for RGB as well, if scaling is enabled. This appears to be the "format =
=3D=3D 3"
> case in de_rtmx_get_coarse_fac[1]. On the other hand, the code for V3 has
> specific code for the RGB limit[2].
>=20
> Is there some test I can do on D1 to see what the right value for RGB is?

I use modetest for such tests. It's part of libdrm. In general, you want to=
=20
make plane wider than scanline and then scale it down. Obviously you want t=
o=20
test this once with RGB and once with YUV format. This is all done with=20
"modetest -P".

Best regards,
Jernej

>=20
> Regards,
> Samuel
>=20
> [0]:
> https://github.com/Tina-Linux/tina-d1x-linux-5.4/blob/master/drivers/vide=
o/
fbdev/sunxi/disp2/disp/de/lowlevel_v2x/de_feat.c#L182
> [1]:
> https://github.com/Tina-Linux/tina-d1x-linux-5.4/blob/master/drivers/vide=
o/
fbdev/sunxi/disp2/disp/de/lowlevel_v2x/de_rtmx.c#L1588
> [2]:
> https://github.com/Tina-Linux/tina-d1x-linux-5.4/blob/master/drivers/vide=
o/
fbdev/sunxi/disp2/disp/de/lowlevel_sun8iw8/de_rtmx.c#L1211
>=20
> >>> The is also the same for mixer 1 of D1. Currently the
> >>> scanline value of rgb is hardcoded to 2048 for all SOCs.
> >>>
> >>> Change the scanline_yuv property of V3s to 1024. > Add the
> >>> scanline_rgb
> >>> property to the mixer config and replace the hardcoded value with
> >>> it before
> >>> scaling.
> >>
> >> I guess RGB scanline patch would also need fixes tag, since it fixes
> >> existing=20
> >> bug.
> >>
> >>>
> >>> Signed-off-by: Genfu Pan <benlypan@gmail.com>
> >>> ---
> >>>  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 13 ++++++++++++-
> >>>  drivers/gpu/drm/sun4i/sun8i_mixer.h    |  1 +
> >>>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  3 +--
> >>>  3 files changed, 14 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> >>> b/drivers/gpu/drm/sun4i/sun8i_mixer.c index 875a1156c..e64e08207
> >>> 100644
> >>> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> >>> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> >>> @@ -567,6 +567,7 @@ static const struct sun8i_mixer_cfg
> >>> sun8i_a83t_mixer0_cfg =3D { .ccsc         =3D CCSC_MIXER0_LAYOUT,
> >>>         .scaler_mask    =3D 0xf,
> >>>         .scanline_yuv   =3D 2048,
> >>> +       .scanline_rgb   =3D 2048,
> >>>         .ui_num         =3D 3,
> >>>         .vi_num         =3D 1,
> >>>  };
> >>> @@ -575,6 +576,7 @@ static const struct sun8i_mixer_cfg
> >>> sun8i_a83t_mixer1_cfg =3D { .ccsc         =3D CCSC_MIXER1_LAYOUT,
> >>>         .scaler_mask    =3D 0x3,
> >>>         .scanline_yuv   =3D 2048,
> >>> +       .scanline_rgb   =3D 2048,
> >>>         .ui_num         =3D 1,
> >>>         .vi_num         =3D 1,
> >>>  };
> >>> @@ -584,6 +586,7 @@ static const struct sun8i_mixer_cfg
> >>> sun8i_h3_mixer0_cfg
> >>> =3D { .mod_rate   =3D 432000000,
> >>>         .scaler_mask    =3D 0xf,
> >>>         .scanline_yuv   =3D 2048,
> >>> +       .scanline_rgb   =3D 2048,
> >>>         .ui_num         =3D 3,
> >>>         .vi_num         =3D 1,
> >>>  };
> >>> @@ -593,6 +596,7 @@ static const struct sun8i_mixer_cfg
> >>> sun8i_r40_mixer0_cfg
> >>> =3D { .mod_rate   =3D 297000000,
> >>>         .scaler_mask    =3D 0xf,
> >>>         .scanline_yuv   =3D 2048,
> >>> +       .scanline_rgb   =3D 2048,
> >>>         .ui_num         =3D 3,
> >>>         .vi_num         =3D 1,
> >>>  };
> >>> @@ -602,6 +606,7 @@ static const struct sun8i_mixer_cfg
> >>> sun8i_r40_mixer1_cfg
> >>> =3D { .mod_rate   =3D 297000000,
> >>>         .scaler_mask    =3D 0x3,
> >>>         .scanline_yuv   =3D 2048,
> >>> +       .scanline_rgb   =3D 2048,
> >>>         .ui_num         =3D 1,
> >>>         .vi_num         =3D 1,
> >>>  };
> >>> @@ -610,7 +615,8 @@ static const struct sun8i_mixer_cfg
> >>> sun8i_v3s_mixer_cfg
> >>> =3D { .vi_num =3D 2,
> >>>         .ui_num =3D 1,
> >>>         .scaler_mask =3D 0x3,
> >>> -       .scanline_yuv =3D 2048,
> >>> +       .scanline_yuv =3D 1024,
> >>> +       .scanline_rgb =3D 1024,
> >>>         .ccsc =3D CCSC_MIXER0_LAYOUT,
> >>>         .mod_rate =3D 150000000,
> >>>  };
> >>> @@ -620,6 +626,7 @@ static const struct sun8i_mixer_cfg
> >>> sun20i_d1_mixer0_cfg
> >>> =3D { .mod_rate   =3D 297000000,
> >>>         .scaler_mask    =3D 0x3,
> >>>         .scanline_yuv   =3D 2048,
> >>> +       .scanline_rgb   =3D 2048,
> >>>         .ui_num         =3D 1,
> >>>         .vi_num         =3D 1,
> >>>  };
> >>> @@ -629,6 +636,7 @@ static const struct sun8i_mixer_cfg
> >>> sun20i_d1_mixer1_cfg
> >>> =3D { .mod_rate   =3D 297000000,
> >>>         .scaler_mask    =3D 0x1,
> >>>         .scanline_yuv   =3D 1024,
> >>> +       .scanline_rgb   =3D 1024,
> >>>         .ui_num         =3D 0,
> >>>         .vi_num         =3D 1,
> >>>  };
> >>> @@ -638,6 +646,7 @@ static const struct sun8i_mixer_cfg
> >>> sun50i_a64_mixer0_cfg =3D { .mod_rate     =3D 297000000,
> >>>         .scaler_mask    =3D 0xf,
> >>>         .scanline_yuv   =3D 4096,
> >>> +       .scanline_rgb   =3D 2048,
> >>>         .ui_num         =3D 3,
> >>>         .vi_num         =3D 1,
> >>>  };
> >>> @@ -647,6 +656,7 @@ static const struct sun8i_mixer_cfg
> >>> sun50i_a64_mixer1_cfg =3D { .mod_rate     =3D 297000000,
> >>>         .scaler_mask    =3D 0x3,
> >>>         .scanline_yuv   =3D 2048,
> >>> +       .scanline_rgb   =3D 2048,
> >>>         .ui_num         =3D 1,
> >>>         .vi_num         =3D 1,
> >>>  };
> >>> @@ -657,6 +667,7 @@ static const struct sun8i_mixer_cfg
> >>> sun50i_h6_mixer0_cfg
> >>> =3D { .mod_rate   =3D 600000000,
> >>>         .scaler_mask    =3D 0xf,
> >>>         .scanline_yuv   =3D 4096,
> >>> +       .scanline_rgb   =3D 2048,
> >>>         .ui_num         =3D 3,
> >>>         .vi_num         =3D 1,
> >>>  };
> >>> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> >>> b/drivers/gpu/drm/sun4i/sun8i_mixer.h index 85c94884f..c01b3e9d6
> >>> 100644
> >>> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> >>> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> >>> @@ -172,6 +172,7 @@ struct sun8i_mixer_cfg {
> >>>         unsigned long   mod_rate;
> >>>         unsigned int    is_de3 : 1;
> >>>         unsigned int    scanline_yuv;
> >>> +       unsigned int    scanline_rgb;
> >>
> >> This quirk needs to be documented above in the comment.
> >>
> >> Best regards,
> >> Jernej
> >>
> >>>  };
> >>>
> >>>  struct sun8i_mixer {
> >>> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> >>> b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c index f7d0b082d..30e6bde92
> >>> 100644
> >>> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> >>> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> >>> @@ -188,8 +188,7 @@ static int sun8i_vi_layer_update_coord(struct
> >>> sun8i_mixer *mixer, int channel, src_h =3D vn;
> >>>                 }
> >>>
> >>> -               /* it seems that every RGB scaler has buffer for
> >>> 2048=20
> >> pixels */
> >>> -               scanline =3D subsampled ? mixer->cfg->scanline_yuv :=
=20
> >> 2048;
> >>> +               scanline =3D subsampled ? mixer->cfg->scanline_yuv :
> >>> mixer->cfg->scanline_rgb;
> >>>
> >>>                 if (src_w > scanline) {
> >>>                         DRM_DEBUG_DRIVER("Using horizontal coarse=20
> >> scaling\n");
> >>
> >>
> >>
> >>
> >>
> >=20
> >=20
>=20
>=20


