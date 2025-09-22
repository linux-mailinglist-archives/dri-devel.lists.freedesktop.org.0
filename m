Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DE1B8F258
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 08:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE98D10E3B7;
	Mon, 22 Sep 2025 06:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C/9laVEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739F210E3B7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 06:31:00 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso29680585e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 23:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758522659; x=1759127459; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JBI7ozwg7DTSQ24O2TuFL4d84hmFpnF5vS3hSbCRd3Q=;
 b=C/9laVEfNbPgRk9RmodkGeXqenTbiMJ7uVAkbi3TLAxleWpDXEUystOdfCfp1454rn
 1ao7KSlnWR3XKXNl6P+HMyacsf95ulpP7j/pfCQLeyWV7qGvshTPpJWuFR4XACfM3MnG
 Ps6XFZAomlBXeECfYVPA+l/YTFFz9Fv9rFyXq/j5f+aZq1mfZZtZNvkvyCRbjK0Obbev
 kqOIrdI/K4/S/Z1ZhFgsoRnWV7cwQqWLIdSXxr7rY1NzpD76P+IB+d+GkTX3oEavBGYz
 YsE8m8Hliglzm5cwslcC1xGHVC1gm9/M+uJoWwy+5gmCSshwFEv3oBgnlaTI5BgaAini
 UHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758522659; x=1759127459;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JBI7ozwg7DTSQ24O2TuFL4d84hmFpnF5vS3hSbCRd3Q=;
 b=ppK9G+HOy1yS3tIeADHdkBgNi+JwBEvX49S16jD8Zeb3ZPl3EGjO6ktUOB5If4P6v1
 KHMW1DvJvkvGnqNiIpKKuCuUvBX8e0XA28VlVsJK0pnku5tAtMhh8AJi0roDwH9IvUTW
 X6a0gBJAITcRu+zr3Gixs0o5tRJ+LNA1vJgQryiPGk47uY5+4ER1k+gR0+Yiw+fGwVbC
 IIB2UEnVtMByI+sTpIGNebrXixVSZtUAT0c3Huscmt+WErd73dCb/JuADKVXyVzXBiFX
 GIj4e5a0ba3/TYFSfC5pjNmd31aFY+iefJxmWoSc84ahIh3LblMMfXsfGyohkxxFM5P1
 HVbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZCa3YCc6VHjBW32yPsV64zqdxez85xnEciBYsDryDJITM1Ig270cdlp/o3xJdOxOoCdlkTqDmFFQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTroHToYHCjg9/tvd2YBreyW7TvYfiyFZYhrspIPJ3HF6DHZUJ
 R+ZymIJaVspAwdIGU4dGjLHH81ez3Nqp07lyvxfehMdul3RFBc5kYsQ4ZC4yOMygOjaiheRwfzq
 t83esUfuUe228tNRh1pGUffy6NfY+i/w=
X-Gm-Gg: ASbGncvIRnxDGXfj0bqCG7m6y6kKtYLzAYeK4qRqM/5x4G/xkbWJg+YozMDfTRY/png
 8SGzDgS/iwvCsWCsMMyBq9XUZnFNsL2i6ZJik6v05SJsvzmqDoEkp38jXqrKfJhNury2Fd/J/4E
 74M1bIwO5y0Sc0fvhEIm39Jg9eZ50P058Htva+MvQb8Z8A5+EZ8OuEks7nnQmlHu2ff+YMHRcnh
 23Ur1EW
X-Google-Smtp-Source: AGHT+IEgRyr03+K3nP1v4RFDAaB2T/dukNJX/7fSxSDXqoenOtbaJwHE6abGnYzKvIAOsR+BBjFG+VRT8nGt6XTXdf4=
X-Received: by 2002:a05:600c:1554:b0:45d:f7ca:4f07 with SMTP id
 5b1f17b1804b1-467efb04520mr94891755e9.18.1758522658794; Sun, 21 Sep 2025
 23:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com>
 <25240767.ouqheUzb2q@senjougahara>
 <CAPVz0n1Tur0YY7yOYAyUFvyTxie4OteyzGhzv487L+aA-YY+wQ@mail.gmail.com>
 <4198615.hdfAi7Kttb@senjougahara>
In-Reply-To: <4198615.hdfAi7Kttb@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 22 Sep 2025 09:30:47 +0300
X-Gm-Features: AS18NWDVc75UgxzKXU9wjmggqvC2LNOMRXXeLZ6ybXXuZrOg-NHyYp0QsvZuWLs
Message-ID: <CAPVz0n0TPKa2cVXZdUEAWWHquGeqzj=p-9cXx79jc6RwXLkkGg@mail.gmail.com>
Subject: Re: [PATCH v2 16/23] staging: media: tegra-video: tegra20: simplify
 format align calculations
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, 
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:23 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Monday, September 22, 2025 2:13=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 07:44 =
Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel wrot=
e:
> > > > Simplify format align calculations by slightly modifying supported =
formats
> > > > structure.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/staging/media/tegra-video/tegra20.c | 41 ++++++++---------=
----
> > > >  1 file changed, 16 insertions(+), 25 deletions(-)
> > > >
> > > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/=
staging/media/tegra-video/tegra20.c
> > > > index 6e0b3b728623..781c4e8ec856 100644
> > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l2_pix_=
format *pix, unsigned int bpp)
> > > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA2=
0_MAX_WIDTH);
> > > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA2=
0_MAX_HEIGHT);
> > > >
> > > > -     switch (pix->pixelformat) {
> > > > -     case V4L2_PIX_FMT_UYVY:
> > > > -     case V4L2_PIX_FMT_VYUY:
> > > > -     case V4L2_PIX_FMT_YUYV:
> > > > -     case V4L2_PIX_FMT_YVYU:
> > > > -             pix->bytesperline =3D roundup(pix->width, 2) * 2;
> > > > -             pix->sizeimage =3D roundup(pix->width, 2) * 2 * pix->=
height;
> > > > -             break;
> > > > -     case V4L2_PIX_FMT_YUV420:
> > > > -     case V4L2_PIX_FMT_YVU420:
> > > > -             pix->bytesperline =3D roundup(pix->width, 8);
> > > > -             pix->sizeimage =3D roundup(pix->width, 8) * pix->heig=
ht * 3 / 2;
> > > > -             break;
> > > > -     }
> > > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, 8);
> > >
> > > Assuming the bpp is coming from the format table below, this changes =
the value of bytesperline for planar formats. With this it'll be (width * 1=
2) / 8 i.e. width * 3/2, which doesn't sound right.
> > >
> >
> > Downstream uses soc_mbus_bytes_per_line for this calculation which was
> > deprecated some time ago, here is a fragment
> >
> > s32 soc_mbus_bytes_per_line(u32 width, const struct soc_mbus_pixelfmt *=
mf)
> > {
> >  if (mf->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> >  return 0;
> >
> >  if (mf->layout !=3D SOC_MBUS_LAYOUT_PACKED)
> >  return width * mf->bits_per_sample / 8;
> >
> >  switch (mf->packing) {
> >  case SOC_MBUS_PACKING_NONE:
> >   return width * mf->bits_per_sample / 8;
> >  case SOC_MBUS_PACKING_2X8_PADHI:
> >  case SOC_MBUS_PACKING_2X8_PADLO:
> >  case SOC_MBUS_PACKING_EXTEND16:
> >   return width * 2;
> >  case SOC_MBUS_PACKING_1_5X8:
> >   return width * 3 / 2;
> >  case SOC_MBUS_PACKING_VARIABLE:
> >   return 0;
> >  }
> >    return -EINVAL;
> > }
> >
> > V4L2_PIX_FMT_YUV420 and V4L2_PIX_FMT_YVU420 are classified as
> > SOC_MBUS_PACKING_1_5X8 hence we get width * 3/2
>
> Googling this brings up the entry
>
> {
>         .code =3D V4L2_MBUS_FMT_YUYV8_1_5X8,
>         .fmt =3D {
>                 .fourcc                 =3D V4L2_PIX_FMT_YUV420,
>                 .name                   =3D "YUYV 4:2:0",
>                 .bits_per_sample                =3D 8,
>                 .packing                        =3D SOC_MBUS_PACKING_1_5X=
8,
>                 .order                  =3D SOC_MBUS_ORDER_LE,
>                 .layout                 =3D SOC_MBUS_LAYOUT_PACKED,
>         },
> }
>
> which matches that you're describing. It doesn't make sense to me, since =
it at the same time specifies PIX_FMT_YUV420 (which is planar with 3 planes=
, as documented by include/uapi/linux/videodev2.h), and LAYOUT_PACKED
>
> /**
>  * enum soc_mbus_layout - planes layout in memory
>  * @SOC_MBUS_LAYOUT_PACKED:             color components packed
>  * @SOC_MBUS_LAYOUT_PLANAR_2Y_U_V:      YUV components stored in 3 planes=
 (4:2:2)
>  * @SOC_MBUS_LAYOUT_PLANAR_2Y_C:        YUV components stored in a luma a=
nd a
>  *                                      chroma plane (C plane is half the=
 size
>  *                                      of Y plane)
>  * @SOC_MBUS_LAYOUT_PLANAR_Y_C:         YUV components stored in a luma a=
nd a
>  *                                      chroma plane (C plane is the same=
 size
>  *                                      as Y plane)
>  */
> enum soc_mbus_layout {
>         SOC_MBUS_LAYOUT_PACKED =3D 0,
>         SOC_MBUS_LAYOUT_PLANAR_2Y_U_V,
>         SOC_MBUS_LAYOUT_PLANAR_2Y_C,
>         SOC_MBUS_LAYOUT_PLANAR_Y_C,
> };
>
> i.e. non-planar. The code in the driver is handling it as three planes as=
 well, with addresses VB0_BASE_ADDRESS/VB0_BASE_ADDRESS_U/VB0_BASE_ADDRESS_=
V. Since the planes are separate, there should be no need to have more than=
 'width' samples per line.
>

I did not invent this, I have just simplified this calculation from
downstream, output values remain same. I have no cameras which can
output V4L2_PIX_FMT_YUV420 or V4L2_PIX_FMT_YVU420 so I cannot test if
this works either. Other YUV and RAW formats were tested on real HW
and work perfectly fine.

> >
> > > > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> > > >  }
> > > >
> > > >  /*
> > > > @@ -576,20 +564,23 @@ static const struct tegra_vi_ops tegra20_vi_o=
ps =3D {
> > > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > > >  };
> > > >
> > > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > > -{                                                    \
> > > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > > > -     .bpp     =3D BPP,                                 \
> > > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FO=
URCC)      \
> > > > +{                                                                 =
   \
> > > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,              =
     \
> > > > +     .bit_width      =3D BIT_WIDTH,                               =
     \
> > > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,               =
     \
> > > > +     .bpp            =3D BPP,                                     =
     \
> > > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,                   =
     \
> > > >  }
> > > >
> > > >  static const struct tegra_video_format tegra20_video_formats[] =3D=
 {
> > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > > +     /* YUV422 */
> > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> > > >  };
> > > >
> > > >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > > >
> > >
> > >
> > >
> > >
>
>
>
>
