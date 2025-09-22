Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76941B8F4F8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 09:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E800510E3C7;
	Mon, 22 Sep 2025 07:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jki+L+9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6A910E3C7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 07:36:55 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3fc36b99e92so457900f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 00:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758526614; x=1759131414; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SQTiutALUjkpQjQ6uKKs077crH4fXFWsk2vBwe4NujY=;
 b=jki+L+9ydTonGvSPLZms7WxZ6dheNfqb0VOtnbl5H/XQw6cqHzJT3HqGHiv/PgSdqh
 IMdPIMm/7GAaVw0QOFKA9QN2/GaXZ1uaOcOS/fGNlcpOScFtGz+1lJZpefY8tfHph7zl
 qNZh2iaFjYtPcJ6GtMmbmNkv9QAZXVaWjPcxfT7Ju2NZQPdZutTBurlAt3z/LSH8Qe/E
 DHr82225wFU6T1Yybhu2uqce4YLfDa4w8kxomzp9BNRrlQL3HC0a+1K07gZfJCw6Ai/b
 6biyq5o1nj6iiGjvKZWo5x3fkuh9FRt4xBlXjJtv9yvUvv9qehoBxE89CKTGe+S32Smq
 527A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758526614; x=1759131414;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SQTiutALUjkpQjQ6uKKs077crH4fXFWsk2vBwe4NujY=;
 b=F0iqefpDGioXt2N0UkeaNIWy1sSvLFVI5JM9vqLF3YSL620zhv0cXRrY7L3vLCuIJ7
 b+uxlYwrJvTno+w2wLzeTI52LpgA5XJLcFY5rEW/FPpYxFefG2McGgn7Z81aEQbFbEeG
 fOaCdmGi1MlPglqiUn80FwOe9P/JMjBfoxjWE/DG3r1PtHprURinUmD+eKP1PMcmMRPA
 aR++i2H2ERMkc2aQmvblke0tZCBwz8YYarise85DiUFjT8HXlF1gnRFMeLlWDsGWTzHj
 exhq/KI53Cgk/lGc8kszKwBNvjhM39Uf1bYdW4aVebmcfRKdjbjCb38UCFuDVJAQ+gBR
 6fww==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3y88XN7kb3IDbK5JHtjo+tbBRvgqHFtnN3HIFs+bPC48gEKjtPqHad0HZFelUdkYgEkuSNJ37jxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyjYmsT1HfPJ1TZCCKKxhWu7VpyUzGt1o7coO7Z4st7ILV6voY
 ada4FoihMMrK/Tq9F6ZsUiuyp2W8NX9RwGavKySrrxly752/PxuPKbEpv5fCQs4UEzf5whYGcAl
 MHzchh7VqCfFPWg6831XDz4CK4aWH1EA=
X-Gm-Gg: ASbGncv5PNloC5B4LVkgnkGFCrC+aO/SN1G13xw0Hso/XLTDVt4WXIhBiXTMAQnWCiu
 aYwxXze2s0LV0fNG3Xl1vepPdlxxB3Ip+hiDSs5m9pIXM2UweHI6+clJ7WVZswVmSKSQu/ztStE
 xCZNgnaxN733qHmdKcfsEm7ytbEJOSDJ2EvYgVVRL/B9JWjKVWqTb5y4QdUENdoVNJykh7ntXoi
 Z5mu7HM
X-Google-Smtp-Source: AGHT+IG2SLbXARRu0t168HLsZz/v53XcB1wJ8Ft52VtbeB5V4oYB8nfGA5hMzmF2UiZq9koPPs+A0RRL4rJK+tjvmts=
X-Received: by 2002:a5d:5f87:0:b0:3ec:42f9:953e with SMTP id
 ffacd0b85a97d-3edd43b5c0dmr15773738f8f.7.1758526613972; Mon, 22 Sep 2025
 00:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com>
 <4198615.hdfAi7Kttb@senjougahara>
 <CAPVz0n0TPKa2cVXZdUEAWWHquGeqzj=p-9cXx79jc6RwXLkkGg@mail.gmail.com>
 <3074302.Sgy9Pd6rRy@senjougahara>
In-Reply-To: <3074302.Sgy9Pd6rRy@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 22 Sep 2025 10:36:42 +0300
X-Gm-Features: AS18NWCN3qDh6Art7Go1S1L6w234Yc5WBRcSNsroEE7Na7Xcr_-CeAzzooRElaI
Message-ID: <CAPVz0n1ozJ13MB4eFMAJzESe8iQ7SKjMApZCLFAZ_eubCFs0tg@mail.gmail.com>
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

=D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 10:27 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Monday, September 22, 2025 3:30=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:23 =
Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Monday, September 22, 2025 2:13=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 07=
:44 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel =
wrote:
> > > > > > Simplify format align calculations by slightly modifying suppor=
ted formats
> > > > > > structure.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  drivers/staging/media/tegra-video/tegra20.c | 41 ++++++++-----=
--------
> > > > > >  1 file changed, 16 insertions(+), 25 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/driv=
ers/staging/media/tegra-video/tegra20.c
> > > > > > index 6e0b3b728623..781c4e8ec856 100644
> > > > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l2_=
pix_format *pix, unsigned int bpp)
> > > > > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,  TE=
GRA20_MAX_WIDTH);
> > > > > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT, TE=
GRA20_MAX_HEIGHT);
> > > > > >
> > > > > > -     switch (pix->pixelformat) {
> > > > > > -     case V4L2_PIX_FMT_UYVY:
> > > > > > -     case V4L2_PIX_FMT_VYUY:
> > > > > > -     case V4L2_PIX_FMT_YUYV:
> > > > > > -     case V4L2_PIX_FMT_YVYU:
> > > > > > -             pix->bytesperline =3D roundup(pix->width, 2) * 2;
> > > > > > -             pix->sizeimage =3D roundup(pix->width, 2) * 2 * p=
ix->height;
> > > > > > -             break;
> > > > > > -     case V4L2_PIX_FMT_YUV420:
> > > > > > -     case V4L2_PIX_FMT_YVU420:
> > > > > > -             pix->bytesperline =3D roundup(pix->width, 8);
> > > > > > -             pix->sizeimage =3D roundup(pix->width, 8) * pix->=
height * 3 / 2;
> > > > > > -             break;
> > > > > > -     }
> > > > > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, 8);
> > > > >
> > > > > Assuming the bpp is coming from the format table below, this chan=
ges the value of bytesperline for planar formats. With this it'll be (width=
 * 12) / 8 i.e. width * 3/2, which doesn't sound right.
> > > > >
> > > >
> > > > Downstream uses soc_mbus_bytes_per_line for this calculation which =
was
> > > > deprecated some time ago, here is a fragment
> > > >
> > > > s32 soc_mbus_bytes_per_line(u32 width, const struct soc_mbus_pixelf=
mt *mf)
> > > > {
> > > >  if (mf->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> > > >  return 0;
> > > >
> > > >  if (mf->layout !=3D SOC_MBUS_LAYOUT_PACKED)
> > > >  return width * mf->bits_per_sample / 8;
> > > >
> > > >  switch (mf->packing) {
> > > >  case SOC_MBUS_PACKING_NONE:
> > > >   return width * mf->bits_per_sample / 8;
> > > >  case SOC_MBUS_PACKING_2X8_PADHI:
> > > >  case SOC_MBUS_PACKING_2X8_PADLO:
> > > >  case SOC_MBUS_PACKING_EXTEND16:
> > > >   return width * 2;
> > > >  case SOC_MBUS_PACKING_1_5X8:
> > > >   return width * 3 / 2;
> > > >  case SOC_MBUS_PACKING_VARIABLE:
> > > >   return 0;
> > > >  }
> > > >    return -EINVAL;
> > > > }
> > > >
> > > > V4L2_PIX_FMT_YUV420 and V4L2_PIX_FMT_YVU420 are classified as
> > > > SOC_MBUS_PACKING_1_5X8 hence we get width * 3/2
> > >
> > > Googling this brings up the entry
> > >
> > > {
> > >         .code =3D V4L2_MBUS_FMT_YUYV8_1_5X8,
> > >         .fmt =3D {
> > >                 .fourcc                 =3D V4L2_PIX_FMT_YUV420,
> > >                 .name                   =3D "YUYV 4:2:0",
> > >                 .bits_per_sample                =3D 8,
> > >                 .packing                        =3D SOC_MBUS_PACKING_=
1_5X8,
> > >                 .order                  =3D SOC_MBUS_ORDER_LE,
> > >                 .layout                 =3D SOC_MBUS_LAYOUT_PACKED,
> > >         },
> > > }
> > >
> > > which matches that you're describing. It doesn't make sense to me, si=
nce it at the same time specifies PIX_FMT_YUV420 (which is planar with 3 pl=
anes, as documented by include/uapi/linux/videodev2.h), and LAYOUT_PACKED
> > >
> > > /**
> > >  * enum soc_mbus_layout - planes layout in memory
> > >  * @SOC_MBUS_LAYOUT_PACKED:             color components packed
> > >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_U_V:      YUV components stored in 3 pl=
anes (4:2:2)
> > >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_C:        YUV components stored in a lu=
ma and a
> > >  *                                      chroma plane (C plane is half=
 the size
> > >  *                                      of Y plane)
> > >  * @SOC_MBUS_LAYOUT_PLANAR_Y_C:         YUV components stored in a lu=
ma and a
> > >  *                                      chroma plane (C plane is the =
same size
> > >  *                                      as Y plane)
> > >  */
> > > enum soc_mbus_layout {
> > >         SOC_MBUS_LAYOUT_PACKED =3D 0,
> > >         SOC_MBUS_LAYOUT_PLANAR_2Y_U_V,
> > >         SOC_MBUS_LAYOUT_PLANAR_2Y_C,
> > >         SOC_MBUS_LAYOUT_PLANAR_Y_C,
> > > };
> > >
> > > i.e. non-planar. The code in the driver is handling it as three plane=
s as well, with addresses VB0_BASE_ADDRESS/VB0_BASE_ADDRESS_U/VB0_BASE_ADDR=
ESS_V. Since the planes are separate, there should be no need to have more =
than 'width' samples per line.
> > >
> >
> > I did not invent this, I have just simplified this calculation from
> > downstream, output values remain same. I have no cameras which can
> > output V4L2_PIX_FMT_YUV420 or V4L2_PIX_FMT_YVU420 so I cannot test if
> > this works either. Other YUV and RAW formats were tested on real HW
> > and work perfectly fine.
>
> My understanding from the code was, that the MEDIA_BUS_FMT_ formats liste=
d in the video format table refer to the input formats from the camera, and=
 the V4L2_PIX_FMT_ formats to output formats from VI. Hence VI could input =
UYVY8_2X8 and write to memory in YUV420. The code dealing with V4L2_PIX_FMT=
_ values seems to be related to the output to memory. Is it possible to tes=
t this (your camera -> VI converts to YUV420) or am I mistaken?
>

Camera I am testing with has no YUV420 options available and from what
I can tell there is no way to force VI to output in YUV420 unless
camera supports it. Any format manipulations should requite hooking up
ISP, or am I missing smth?

> It's certainly possible that the current code is functional -- if bytespe=
rline is set to a too large value and that information flows to userspace, =
it could still read the buffer. It would just waste memory.
>
> >
> > > >
> > > > > > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> > > > > >  }
> > > > > >
> > > > > >  /*
> > > > > > @@ -576,20 +564,23 @@ static const struct tegra_vi_ops tegra20_=
vi_ops =3D {
> > > > > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > > > > >  };
> > > > > >
> > > > > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > > > > -{                                                    \
> > > > > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > > > > > -     .bpp     =3D BPP,                                 \
> > > > > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > > > > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP=
, FOURCC)      \
> > > > > > +{                                                             =
       \
> > > > > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,          =
         \
> > > > > > +     .bit_width      =3D BIT_WIDTH,                           =
         \
> > > > > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,           =
         \
> > > > > > +     .bpp            =3D BPP,                                 =
         \
> > > > > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,               =
         \
> > > > > >  }
> > > > > >
> > > > > >  static const struct tegra_video_format tegra20_video_formats[]=
 =3D {
> > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > > > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > > > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > > > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > > > > +     /* YUV422 */
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> > > > > >  };
> > > > > >
> > > > > >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > >
> > >
> > >
> > >
>
>
>
>
