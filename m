Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D064EBAF1F1
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 07:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062F110E302;
	Wed,  1 Oct 2025 05:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YQwDUSJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBCB10E302
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 05:07:18 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4060b4b1200so5890521f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 22:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759295237; x=1759900037; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r8vgGDTjLjTEmVqzleKL4l09ipBTPvzJcrzqUAiCnow=;
 b=YQwDUSJhVkjry1nt9U7tqZOwddCOQNrkxsAtq6SKC3bbWmOwdrVa/F73D+a8baX7bI
 yKy1KtD17mRGplBwXD1GCoqzV8NortkHdfMgvskY7SdrGblELAdPkTDsz5bq8T/zU6h6
 nq5a4lU4CDO1hG1vYvwP1ytv0YEs4sGpijnVlrZNm9C4OZKT5cCEUTcVq+sIYw7PWdJL
 5AbiWA77IGI2U4UIYhB/qWvBGNBlrontYtUMjIAzMUjJSGWgT9g5fqgM+w3QuPEjmQmd
 ROF7QWhKQNBVREdAXL1Hu2b1/SD4Xf7AX5X4rzdyP/V+VxC9V3rdsQnucIKxkJRQPWwt
 wHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759295237; x=1759900037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r8vgGDTjLjTEmVqzleKL4l09ipBTPvzJcrzqUAiCnow=;
 b=bzY3DA2a2dRAem5/zRU/KxBONerfUzSMdCFBRT8SGQ6nmMdMROFwXX/Z12SLtMaLOM
 2A5qZZWJTNnPbIkz82Egz2DRSO5oCNf/xrNKv6QGHbR6cm21rZ4NDVbOXwbRf+JsExJ0
 AdPnKmSHFvhw4NH5oG/nLKEz/G8BJjLR+TTbMLsYzQ2RKoiiFsXhonC+iWjlUw95EeAV
 6PGIekyVblJ13X1exGb+x7RU09FtTn5yHEUm1QdzjBkq7wwJlBW4pJTPiwC5Kwng+N4y
 9aA/66JLuppX5CeCriB2ROPf4P4ktCGxhf/ACTZunNSo/2SdaWJTzZXltLq2XdnS3Crj
 upqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX1b6bjYSDGePAK0soD/ui4LXBiyJkqr3j5HXVwLsErw3udvsbeq6sbuHMVY8rQQ1CTqJI0qeQC6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxhw2GgCv1lAwMEwtttXTV7ffwTlP8InqTcWkE/cHQhYBnYskOS
 qoWyyNVqcmEjoE96jhPBwAVJs2ILdg7l2zypGGdlVM/kCFSw6IuZEuHsg4Epc0eodDLf2JF5WZB
 DrzOjnxTh9zv5UpkJeqXGa/u7zdP/FDA=
X-Gm-Gg: ASbGncuM7Zh2A9gOJ7nbskLz+rr0qS3wTIhlYpb4dDGP3tY8bt79RNcbggi0GYlVvw7
 CytLtCAAiTGPiZ6qcC+gsvZAxYFKClgcjt5mhlQVa/BAL4pURY+CiNp7gbX16hKrCpSNLr5edo5
 tzkEp/Z6ixJg4mn+te2x5FQQJDsfUThVBvDhZhM4XBOBlsvGGdgE4FR+AsLQhTKSIcA4GYoCnr1
 +YTloqaMoQCZ4rbWveAOwlMRI9sDSFC
X-Google-Smtp-Source: AGHT+IFHxBP03z9ZXbXrKYWqGNzPPfQDYurBNIYBdZeZ1xQtoSKeOld5v2suhIZ1R4Hokx1AvTWEQpE8jK1BZsz3aV8=
X-Received: by 2002:a05:6000:240a:b0:3ea:6680:8fcd with SMTP id
 ffacd0b85a97d-425577edd9bmr1705706f8f.13.1759295236387; Tue, 30 Sep 2025
 22:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250925151648.79510-1-clamor95@gmail.com>
 <20250925151648.79510-16-clamor95@gmail.com>
 <3419823.yaVYbkx8dN@senjougahara>
In-Reply-To: <3419823.yaVYbkx8dN@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 1 Oct 2025 08:07:05 +0300
X-Gm-Features: AS18NWDirx6sT0hDXpNJ8eJzqR8FL9ZQmmgwfKfoVpD8bLX_BgsvnI1FqR8dIZE
Message-ID: <CAPVz0n2CRV8d1w1hp-60SQ_caBTFyJE8tJaWerwyEuZHD1p_Nw@mail.gmail.com>
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

=D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 07:38=
 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, September 26, 2025 12:16=E2=80=AFAM Svyatoslav Ryhel wrote:
> > Simplify format align calculations by slightly modifying supported form=
ats
> > structure. Adjusted U and V offset calculations for planar formats sinc=
e
> > YUV420P bits per pixel is 12 (1 full plane for Y + 2 * 1/4 planes for U
> > and V) so stride is width * 3/2, but offset must be calculated with pla=
in
> > width since each plain has stride width * 1. This aligns with downstrea=
m
>
> plane
>
> > behavior which uses same approach for offset calculations.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/tegra20.c | 58 +++++++++------------
> >  drivers/staging/media/tegra-video/vi.h      |  3 +-
> >  2 files changed, 27 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stag=
ing/media/tegra-video/tegra20.c
> > index 7c3ff843235d..b7a39723dfc2 100644
> > --- a/drivers/staging/media/tegra-video/tegra20.c
> > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l2_pix_form=
at *pix, unsigned int bpp)
> >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MA=
X_WIDTH);
> >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MA=
X_HEIGHT);
> >
> > -     switch (pix->pixelformat) {
> > -     case V4L2_PIX_FMT_UYVY:
> > -     case V4L2_PIX_FMT_VYUY:
> > -     case V4L2_PIX_FMT_YUYV:
> > -     case V4L2_PIX_FMT_YVYU:
> > -             pix->bytesperline =3D roundup(pix->width, 2) * 2;
> > -             pix->sizeimage =3D roundup(pix->width, 2) * 2 * pix->heig=
ht;
> > -             break;
> > -     case V4L2_PIX_FMT_YUV420:
> > -     case V4L2_PIX_FMT_YVU420:
> > -             pix->bytesperline =3D roundup(pix->width, 8);
> > -             pix->sizeimage =3D roundup(pix->width, 8) * pix->height *=
 3 / 2;
> > -             break;
> > -     }
> > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, 8);
> > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> >  }
> >
> >  /*
> > @@ -305,6 +293,7 @@ static void tegra20_channel_queue_setup(struct tegr=
a_vi_channel *chan)
> >  {
> >       unsigned int stride =3D chan->format.bytesperline;
> >       unsigned int height =3D chan->format.height;
> > +     unsigned int width =3D chan->format.width;
> >
> >       chan->start_offset =3D 0;
> >
> > @@ -321,8 +310,8 @@ static void tegra20_channel_queue_setup(struct tegr=
a_vi_channel *chan)
> >
> >       case V4L2_PIX_FMT_YUV420:
> >       case V4L2_PIX_FMT_YVU420:
> > -             chan->addr_offset_u =3D stride * height;
> > -             chan->addr_offset_v =3D chan->addr_offset_u + stride * he=
ight / 4;
> > +             chan->addr_offset_u =3D width * height;
> > +             chan->addr_offset_v =3D chan->addr_offset_u + width * hei=
ght / 4;
> >
> >               /* For YVU420, we swap the locations of the U and V plane=
s. */
> >               if (chan->format.pixelformat =3D=3D V4L2_PIX_FMT_YVU420)
> > @@ -332,14 +321,14 @@ static void tegra20_channel_queue_setup(struct te=
gra_vi_channel *chan)
> >               chan->start_offset_v =3D chan->addr_offset_v;
> >
> >               if (chan->vflip) {
> > -                     chan->start_offset   +=3D stride * (height - 1);
> > -                     chan->start_offset_u +=3D (stride / 2) * ((height=
 / 2) - 1);
> > -                     chan->start_offset_v +=3D (stride / 2) * ((height=
 / 2) - 1);
> > +                     chan->start_offset   +=3D width * (height - 1);
> > +                     chan->start_offset_u +=3D (width / 2) * ((height =
/ 2) - 1);
> > +                     chan->start_offset_v +=3D (width / 2) * ((height =
/ 2) - 1);
> >               }
> >               if (chan->hflip) {
> > -                     chan->start_offset   +=3D stride - 1;
> > -                     chan->start_offset_u +=3D (stride / 2) - 1;
> > -                     chan->start_offset_v +=3D (stride / 2) - 1;
> > +                     chan->start_offset   +=3D width - 1;
> > +                     chan->start_offset_u +=3D (width / 2) - 1;
> > +                     chan->start_offset_v +=3D (width / 2) - 1;
> >               }
> >               break;
> >       }
> > @@ -576,20 +565,23 @@ static const struct tegra_vi_ops tegra20_vi_ops =
=3D {
> >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> >  };
> >
> > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > -{                                                    \
> > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > -     .bpp     =3D BPP,                                 \
> > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOURCC=
)      \
> > +{                                                                    \
> > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,                  =
 \
> > +     .bit_width      =3D BIT_WIDTH,                                   =
 \
> > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,                   =
 \
> > +     .bpp            =3D BPP,                                         =
 \
> > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,                       =
 \
> >  }
> >
> >  static const struct tegra_video_format tegra20_video_formats[] =3D {
> > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > +     /* YUV422 */
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> >  };
>
> Looking at the code, BPP seems to only be used for the line stride (i.e. =
bytes per line) calculation. I think we should just make it 8 for the plana=
r formats (possibly with an explaining comment). With the current code, we =
end up with 'bytesperline' variables in places not being the actual bytes p=
er line, which is confusing.
>
> Actually, we can then just make the 'bpp' field be bytes per pixel as it =
was before to avoid the discrepancy with Tegra210.
>

No, this code is actually cleaner and in sync with what downstream
does, Tegra210 bytes per pixel is confusing since it totally neglects
formats with fractional bytes per pixel, it is impossible to set there
3/2 for example, which is used by YUV420.

According to downstream code bytes_per_line =3D
soc_mbus_bytes_per_line..., downstream directly name is bytes_per_line
and soc_mbus_bytes_per_line returns width * 3 / 2 which is correct
calculation (12 bits). Meanwhile for planar formats Tegra has 3
different buffers so with offset calculation plain width must be used
(which matches downstream).

> >
> >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/m=
edia/tegra-video/vi.h
> > index bfadde8858d4..5cbc0606ed6c 100644
> > --- a/drivers/staging/media/tegra-video/vi.h
> > +++ b/drivers/staging/media/tegra-video/vi.h
> > @@ -281,7 +281,8 @@ enum tegra_image_dt {
> >   * @img_dt: MIPI CSI-2 data type (for CSI-2 only)
> >   * @bit_width: format width in bits per component (for CSI/Tegra210 on=
ly)
> >   * @code: media bus format code
> > - * @bpp: bytes per pixel (when stored in memory)
> > + * @bpp: bytes per pixel (when stored in memory) for Tegra210,
> > + *    bits per pixel for Tegra20/Tegra30
> >   * @img_fmt: image format (for CSI/Tegra210 only)
> >   * @fourcc: V4L2 pixel format FCC identifier
> >   */
> >
