Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE98BAF269
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 07:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAFE10E668;
	Wed,  1 Oct 2025 05:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P3uheh1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2276810E66A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 05:36:12 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-46e5b7dfeb0so7735205e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 22:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759296970; x=1759901770; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SJrboPAQ3bvQVq27/EG4Rsr76H/+se+9jLXRfCa8zmo=;
 b=P3uheh1raeebQd3yFWfRbJOWeEq+Pau5oTa8r8OUDmnCffS9fmTxz3ihhIKFhM54Eh
 AWa8mR6nxkxWVWtr5N8usEeteIjVR8bgTti3vxVBovg03UlflcYZCoZ1aLE4/cF+qt9B
 Y5vhLWGfS291Dk/xtSlzm+bvq0fBXCrq+MLqr/WHkQIpC3vEtJWNdQPr3VFD9L8LoSuC
 FUuDBcsQTS6CPqUBbHvfWCaYRIEfk7FDwvn1bl+CTdC9fsAINgE5I+pDX/vg9/flrXOe
 5O1Y9l4wPuIZulnT3UYblpcYhrGEeCoGlKBRGoETjUaYLSFIwTsdIKDYz8J2NmJY1z73
 rrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759296970; x=1759901770;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SJrboPAQ3bvQVq27/EG4Rsr76H/+se+9jLXRfCa8zmo=;
 b=rfMkQ9pXifcy2mUnktKWc/J1KEFAlteHcXreTujdI/sZLqDHfTXBRmhmoEMcwIcmiO
 +vfRBtLAzfyGUiIG669BHNej0zy+qisF1OsMtHyf/MEFgJaCGV01ByO5HZlDCwR2rBP3
 EUok7w4s+tqZFnW5CsatPA2qw9zaJhetqQ2BRpYwPNZEYVv+Y8ia5O9kWs04fpXuhpzu
 DC6xFZnKCECaEmhY8p0fnDRD0uOwl7BeZdnHsi2cT95nHk+qkwZMSlv2qWsTP7bFirW9
 bJA45bKnmjPgRrZvixcZrthWM63KDSvMBeoZYBc7Yi6kYoAcTLGaCJmlAw5eDum8oMOk
 tOrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsvFQ0l4qIRRW5UHWBV1LfAvfG6C7nNJ5L/kr9vQlxlYDqEijk9W2/6HARnEofhFnjpZ+8iAgOnEE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytJ01p8QEoySLdDhF8h/CZosDqXcq9WOLNZO5GaNkK128ajrb5
 zGUZXjvlgTJKL/o6p76oEHosGrSDw5wvWDb+D3+Ngb9U5QsSB8chxkZlh8U4WZjDQOSevVRATI4
 kRxinlX5PHv5N6Z7nRkwqKEW+nmSw6Tc=
X-Gm-Gg: ASbGncvDpFObSdEy5pAhaHt6RtIzbPK135XHyMyiakOyxerC0kF/xbBU4Py6LxsPfhJ
 FOg8PnQWTiFBwwXHoaHOV/qtRzkkzW9p8OxQpOcTCFLV0XNFkBLI0YocwQGIMD2oLpfhjbo104w
 9caL2d9dNSVqLspt1uaj80x+L69RpIWgBJgi05Mr7xB2jyrHjl8Xsvv+PP9aibOLmMuOG4RCmQD
 RD/zndS9YrDh+d0Gy/n+nCA8BD7ifts
X-Google-Smtp-Source: AGHT+IGl4qoOTXJavodfDxV6HJESDY/3a24Dq7hSw7IU0JyXat/2RujwJvhHxdQJ+/VFFZv/MM/yRAJC9AIJaLEF69Y=
X-Received: by 2002:a05:600c:8b65:b0:43c:ec4c:25b4 with SMTP id
 5b1f17b1804b1-46e6127cccfmr17260215e9.10.1759296970493; Tue, 30 Sep 2025
 22:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250925151648.79510-1-clamor95@gmail.com>
 <20250925151648.79510-16-clamor95@gmail.com>
 <3419823.yaVYbkx8dN@senjougahara>
 <CAPVz0n2CRV8d1w1hp-60SQ_caBTFyJE8tJaWerwyEuZHD1p_Nw@mail.gmail.com>
In-Reply-To: <CAPVz0n2CRV8d1w1hp-60SQ_caBTFyJE8tJaWerwyEuZHD1p_Nw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 1 Oct 2025 08:35:59 +0300
X-Gm-Features: AS18NWBi4bYPebuwB4xx20Y7NKjL9OGwnlxl3s7Rk7XozkUX3za7EYle47R5QzE
Message-ID: <CAPVz0n3-VvtjHDPKoFiipYQFx=Xq6hph8WW=xa2UaC7iDf1MyA@mail.gmail.com>
Subject: Re: [PATCH v3 15/22] staging: media: tegra-video: tegra20: simplify
 format align calculations
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
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

=D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 08:07=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 07:=
38 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Friday, September 26, 2025 12:16=E2=80=AFAM Svyatoslav Ryhel wrote:
> > > Simplify format align calculations by slightly modifying supported fo=
rmats
> > > structure. Adjusted U and V offset calculations for planar formats si=
nce
> > > YUV420P bits per pixel is 12 (1 full plane for Y + 2 * 1/4 planes for=
 U
> > > and V) so stride is width * 3/2, but offset must be calculated with p=
lain
> > > width since each plain has stride width * 1. This aligns with downstr=
eam
> >
> > plane
> >
> > > behavior which uses same approach for offset calculations.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/staging/media/tegra-video/tegra20.c | 58 +++++++++----------=
--
> > >  drivers/staging/media/tegra-video/vi.h      |  3 +-
> > >  2 files changed, 27 insertions(+), 34 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/st=
aging/media/tegra-video/tegra20.c
> > > index 7c3ff843235d..b7a39723dfc2 100644
> > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l2_pix_fo=
rmat *pix, unsigned int bpp)
> > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_=
MAX_WIDTH);
> > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_=
MAX_HEIGHT);
> > >
> > > -     switch (pix->pixelformat) {
> > > -     case V4L2_PIX_FMT_UYVY:
> > > -     case V4L2_PIX_FMT_VYUY:
> > > -     case V4L2_PIX_FMT_YUYV:
> > > -     case V4L2_PIX_FMT_YVYU:
> > > -             pix->bytesperline =3D roundup(pix->width, 2) * 2;
> > > -             pix->sizeimage =3D roundup(pix->width, 2) * 2 * pix->he=
ight;
> > > -             break;
> > > -     case V4L2_PIX_FMT_YUV420:
> > > -     case V4L2_PIX_FMT_YVU420:
> > > -             pix->bytesperline =3D roundup(pix->width, 8);
> > > -             pix->sizeimage =3D roundup(pix->width, 8) * pix->height=
 * 3 / 2;
> > > -             break;
> > > -     }
> > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, 8);
> > > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> > >  }
> > >
> > >  /*
> > > @@ -305,6 +293,7 @@ static void tegra20_channel_queue_setup(struct te=
gra_vi_channel *chan)
> > >  {
> > >       unsigned int stride =3D chan->format.bytesperline;
> > >       unsigned int height =3D chan->format.height;
> > > +     unsigned int width =3D chan->format.width;
> > >
> > >       chan->start_offset =3D 0;
> > >
> > > @@ -321,8 +310,8 @@ static void tegra20_channel_queue_setup(struct te=
gra_vi_channel *chan)
> > >
> > >       case V4L2_PIX_FMT_YUV420:
> > >       case V4L2_PIX_FMT_YVU420:
> > > -             chan->addr_offset_u =3D stride * height;
> > > -             chan->addr_offset_v =3D chan->addr_offset_u + stride * =
height / 4;
> > > +             chan->addr_offset_u =3D width * height;
> > > +             chan->addr_offset_v =3D chan->addr_offset_u + width * h=
eight / 4;
> > >
> > >               /* For YVU420, we swap the locations of the U and V pla=
nes. */
> > >               if (chan->format.pixelformat =3D=3D V4L2_PIX_FMT_YVU420=
)
> > > @@ -332,14 +321,14 @@ static void tegra20_channel_queue_setup(struct =
tegra_vi_channel *chan)
> > >               chan->start_offset_v =3D chan->addr_offset_v;
> > >
> > >               if (chan->vflip) {
> > > -                     chan->start_offset   +=3D stride * (height - 1)=
;
> > > -                     chan->start_offset_u +=3D (stride / 2) * ((heig=
ht / 2) - 1);
> > > -                     chan->start_offset_v +=3D (stride / 2) * ((heig=
ht / 2) - 1);
> > > +                     chan->start_offset   +=3D width * (height - 1);
> > > +                     chan->start_offset_u +=3D (width / 2) * ((heigh=
t / 2) - 1);
> > > +                     chan->start_offset_v +=3D (width / 2) * ((heigh=
t / 2) - 1);
> > >               }
> > >               if (chan->hflip) {
> > > -                     chan->start_offset   +=3D stride - 1;
> > > -                     chan->start_offset_u +=3D (stride / 2) - 1;
> > > -                     chan->start_offset_v +=3D (stride / 2) - 1;
> > > +                     chan->start_offset   +=3D width - 1;
> > > +                     chan->start_offset_u +=3D (width / 2) - 1;
> > > +                     chan->start_offset_v +=3D (width / 2) - 1;
> > >               }
> > >               break;
> > >       }
> > > @@ -576,20 +565,23 @@ static const struct tegra_vi_ops tegra20_vi_ops=
 =3D {
> > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > >  };
> > >
> > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > -{                                                    \
> > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > > -     .bpp     =3D BPP,                                 \
> > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOUR=
CC)      \
> > > +{                                                                   =
 \
> > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,                =
   \
> > > +     .bit_width      =3D BIT_WIDTH,                                 =
   \
> > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,                 =
   \
> > > +     .bpp            =3D BPP,                                       =
   \
> > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,                     =
   \
> > >  }
> > >
> > >  static const struct tegra_video_format tegra20_video_formats[] =3D {
> > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > +     /* YUV422 */
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> > >  };
> >
> > Looking at the code, BPP seems to only be used for the line stride (i.e=
. bytes per line) calculation. I think we should just make it 8 for the pla=
nar formats (possibly with an explaining comment). With the current code, w=
e end up with 'bytesperline' variables in places not being the actual bytes=
 per line, which is confusing.
> >
> > Actually, we can then just make the 'bpp' field be bytes per pixel as i=
t was before to avoid the discrepancy with Tegra210.
> >
>
> No, this code is actually cleaner and in sync with what downstream
> does, Tegra210 bytes per pixel is confusing since it totally neglects
> formats with fractional bytes per pixel, it is impossible to set there
> 3/2 for example, which is used by YUV420.
>
> According to downstream code bytes_per_line =3D
> soc_mbus_bytes_per_line..., downstream directly name is bytes_per_line
> and soc_mbus_bytes_per_line returns width * 3 / 2 which is correct
> calculation (12 bits). Meanwhile for planar formats Tegra has 3
> different buffers so with offset calculation plain width must be used
> (which matches downstream).
>

If you mean use of BPP by VI, I can propose removing bytesperline and
sizeimage configuration from VI entirely and leave this to per-SoC
fmt_align function which does this already anyway and guards every
time those values are referred. This way there will be no instances
where "places not being the actual bytes per line" comes true.

> > >
> > >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > > diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging=
/media/tegra-video/vi.h
> > > index bfadde8858d4..5cbc0606ed6c 100644
> > > --- a/drivers/staging/media/tegra-video/vi.h
> > > +++ b/drivers/staging/media/tegra-video/vi.h
> > > @@ -281,7 +281,8 @@ enum tegra_image_dt {
> > >   * @img_dt: MIPI CSI-2 data type (for CSI-2 only)
> > >   * @bit_width: format width in bits per component (for CSI/Tegra210 =
only)
> > >   * @code: media bus format code
> > > - * @bpp: bytes per pixel (when stored in memory)
> > > + * @bpp: bytes per pixel (when stored in memory) for Tegra210,
> > > + *    bits per pixel for Tegra20/Tegra30
> > >   * @img_fmt: image format (for CSI/Tegra210 only)
> > >   * @fourcc: V4L2 pixel format FCC identifier
> > >   */
> > >
