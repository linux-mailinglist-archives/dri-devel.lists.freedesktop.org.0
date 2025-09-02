Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90A4B3F432
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 07:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2058110E58E;
	Tue,  2 Sep 2025 05:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mpnMmppd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD82010E58E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 05:11:40 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3cf991e8bb8so2213242f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 22:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756789899; x=1757394699; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TTCTGbNV0A/hFnSRRaapGnfqcH++dszehZn/PYcxf4U=;
 b=mpnMmppdc3A9KxAddFyDrInnbp5vCINqHeEdR/hCm8zac8vI2PxBNCosZSzpHna9Ih
 SVIIoALk7rKT5MWHiQQq3thgY/YM1avmierFQbTMC7F6nhPns5NP4n52b5XQPQebkqMc
 r/FAbCrwWZi5oxuuK51xq3BiDaRez0tPODYcRhd9Mh5yW6kHr0xDHdB6TLFodlLJ9ApQ
 FnbGW/tpEBg3CPiUMA1zsm1fgrSmaDYikBmrOlV96DPq97IYLp7BCLTNZxIiFHymt4fC
 EDwV98Y0E42eG2E6uMrTFBOCAu1SWB+bfRmVqXhKzJzajo3yb8adwTpnraPuJbtUIYDf
 qHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756789899; x=1757394699;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TTCTGbNV0A/hFnSRRaapGnfqcH++dszehZn/PYcxf4U=;
 b=wMSYzBBVYA/gzcnKl+0CtfD1MfIMb8y2NWyz5ZgolNTiXEfuLuO2zhUpVHu0xJS/a3
 W06fvmeqeuCSsDRr5aswfzhZcJyKxA5v/KXmQrJpGW3Z5siu8OfvB4Uchczo8hk++/UF
 4PVmpQQFMtin74zbStaY8UoiWHKAF0O+xc+NCUnC7XXpTsMJv9EkHnggyobwg55m09QK
 hMa7fXTeBYF+u8IiaClJhhERs+BslzEi+QABIDl49IDtjEzDlsmoAjyudvkqIvhRkVfW
 Xl3WfYHE/6hv3xHuVlbQO1MUvnwfczpC1m9Fjc11kqQjWvtFfLWzEA0WKuDKEZAQoMzv
 8EMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXikBkdAjn71G3hvqLGCv1Ul4YqU1vWBA+0Cj40MDWlbAtD6CcVFvFtgZXeMVrjYDIOlWwlK862gJM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjdFq8t2J/Awx5xJStbaFzjILfciV1z5u4sV2OF7Slki9P5uEG
 sVZCC9d3+tBAvapj3YtUZ3r0DlQ+WPnwr1S7X7yiQXSrvcF2Lq6KLYYEL6DtovLw0Ea4G4LzC4V
 Blw8i1/6G5DxLzIxdk/hGoqPFF94wY+E=
X-Gm-Gg: ASbGnctOjILDS04owPcMn4oOOFl/rl+qVTThVuhtfQ1QsOwkGbcHH3/zXTClSkrA/xh
 qcQho04U+TZX84MwZbbP/UxFBe/jXoQB6wwrqr9pJSClOmnINK/9WMCtTTKJ5UNSRR4N/TVbbEm
 yMjrOGosF5OefQWzjL9Q8cJ9GJneYICFv4gGC21b5F2zecBbPKtIOXxz3kGlh5GTL/LPiDzOCc3
 5yihp8zzE1xayWdZHc=
X-Google-Smtp-Source: AGHT+IGa3PRa1/gPaTBOeY7kLDsRJnMljXOD1O/8RwlykLwiecvwVwe6PtEAfF2dKWb9ZplPBeb9IGmICuTGLrkPfCk=
X-Received: by 2002:a05:6000:290f:b0:3b7:8914:cd94 with SMTP id
 ffacd0b85a97d-3d1de5b0a87mr5975119f8f.41.1756789898968; Mon, 01 Sep 2025
 22:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-16-clamor95@gmail.com>
 <3765586.e9J7NaK4W3@senjougahara>
In-Reply-To: <3765586.e9J7NaK4W3@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Sep 2025 08:11:27 +0300
X-Gm-Features: Ac12FXwYaklM9dfwRJGJ0niOGEaCaWCMSJaDJ1qiJ-WWQceVJ49LceOdwSONuvs
Message-ID: <CAPVz0n2Qo97fcshY=pCUzXn2zNe-akbtgsmhFA=vqvQ28ppZ5A@mail.gmail.com>
Subject: Re: [PATCH v1 15/19] staging: media: tegra-video: tegra20: expand
 format support with RAW8/10 and YUV422 1X16
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
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-staging@lists.linux.dev
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

=D0=B2=D1=82, 2 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 04:10 Mikko=
 Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Add support for Bayer formats (RAW8 and RAW10) and YUV422_8 1X16 versio=
ns
> > of existing YUV422_8 2X8.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/tegra20.c | 71 ++++++++++++++++++++-
> >  1 file changed, 69 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/tegra20.c
> > b/drivers/staging/media/tegra-video/tegra20.c index
> > 67631e0c9ffc..b466fe7f4504 100644
> > --- a/drivers/staging/media/tegra-video/tegra20.c
> > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > @@ -186,6 +186,18 @@ static void tegra20_vi_get_input_formats(struct
> > tegra_vi_channel *chan, case MEDIA_BUS_FMT_YVYU8_2X8:
> >               (*yuv_input_format) =3D VI_INPUT_YUV_INPUT_FORMAT_YVYU;
> >               break;
> > +     /* RAW8 */
> > +     case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +     case MEDIA_BUS_FMT_SGBRG8_1X8:
> > +     case MEDIA_BUS_FMT_SGRBG8_1X8:
> > +     case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +     /* RAW10 */
> > +     case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +     case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +     case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +     case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +             (*yuv_input_format) =3D VI_INPUT_INPUT_FORMAT_BAYER;
>
> Should this be main_input_format instead of yuv_input_format?
>

Yes, it should be main_input_format, you are correct. Thank you.

> > +             break;
> >       }
> >  }
> >
> > @@ -220,6 +232,18 @@ static void tegra20_vi_get_output_formats(struct
> > tegra_vi_channel *chan, case V4L2_PIX_FMT_YVU420:
> >               (*main_output_format) =3D
> VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR;
> >               break;
> > +     /* RAW8 */
> > +     case V4L2_PIX_FMT_SBGGR8:
> > +     case V4L2_PIX_FMT_SGBRG8:
> > +     case V4L2_PIX_FMT_SGRBG8:
> > +     case V4L2_PIX_FMT_SRGGB8:
> > +     /* RAW10 */
> > +     case V4L2_PIX_FMT_SBGGR10:
> > +     case V4L2_PIX_FMT_SGBRG10:
> > +     case V4L2_PIX_FMT_SGRBG10:
> > +     case V4L2_PIX_FMT_SRGGB10:
> > +             (*main_output_format) =3D
> VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT;
> > +             break;
> >       }
> >  }
> >
> > @@ -300,6 +324,16 @@ static void tegra20_channel_queue_setup(struct
> > tegra_vi_channel *chan) case V4L2_PIX_FMT_VYUY:
> >       case V4L2_PIX_FMT_YUYV:
> >       case V4L2_PIX_FMT_YVYU:
> > +     /* RAW8 */
> > +     case V4L2_PIX_FMT_SRGGB8:
> > +     case V4L2_PIX_FMT_SGRBG8:
> > +     case V4L2_PIX_FMT_SGBRG8:
> > +     case V4L2_PIX_FMT_SBGGR8:
> > +     /* RAW10 */
> > +     case V4L2_PIX_FMT_SRGGB10:
> > +     case V4L2_PIX_FMT_SGRBG10:
> > +     case V4L2_PIX_FMT_SGBRG10:
> > +     case V4L2_PIX_FMT_SBGGR10:
> >               if (chan->vflip)
> >                       chan->start_offset +=3D stride * (height - 1);
> >               if (chan->hflip)
> > @@ -365,6 +399,19 @@ static void tegra20_channel_vi_buffer_setup(struct
> > tegra_vi_channel *chan, tegra20_vi_write(chan,
> > TEGRA_VI_VB0_BASE_ADDRESS(OUT_1),  base); tegra20_vi_write(chan,
> > TEGRA_VI_VB0_START_ADDRESS(OUT_1), base + chan->start_offset); break;
> > +     /* RAW8 */
> > +     case V4L2_PIX_FMT_SRGGB8:
> > +     case V4L2_PIX_FMT_SGRBG8:
> > +     case V4L2_PIX_FMT_SGBRG8:
> > +     case V4L2_PIX_FMT_SBGGR8:
> > +     /* RAW10 */
> > +     case V4L2_PIX_FMT_SRGGB10:
> > +     case V4L2_PIX_FMT_SGRBG10:
> > +     case V4L2_PIX_FMT_SGBRG10:
> > +     case V4L2_PIX_FMT_SBGGR10:
> > +             tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(OUT_2),
> base);
> > +             tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(OUT_2),
> base +
> > chan->start_offset); +                break;
> >       }
> >  }
> >
> > @@ -446,12 +493,15 @@ static int tegra20_chan_capture_kthread_start(voi=
d
> > *data) static void tegra20_camera_capture_setup(struct tegra_vi_channel
> > *chan) {
> >       u32 output_fourcc =3D chan->format.pixelformat;
> > +     u32 data_type =3D chan->fmtinfo->img_dt;
> >       int width  =3D chan->format.width;
> >       int height =3D chan->format.height;
> >       int stride_l =3D chan->format.bytesperline;
> >       int stride_c =3D (output_fourcc =3D=3D V4L2_PIX_FMT_YUV420 ||
> >                       output_fourcc =3D=3D V4L2_PIX_FMT_YVU420) ? 1 : 0=
;
> > -     int output_channel =3D OUT_1;
> > +     int output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_RAW8 ||
> > +                           data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
> > +                           OUT_2 : OUT_1;
> >       int main_output_format;
> >       int yuv_output_format;
> >
> > @@ -580,6 +630,20 @@ static const struct tegra_video_format
> > tegra20_video_formats[] =3D { TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8=
, 16,
> > YVYU),
> >       TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> >       TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 16, UYVY),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_1X16, 16, VYUY),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_1X16, 16, YUYV),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_1X16, 16, YVYU),
> > +     /* RAW 8 */
> > +     TEGRA20_VIDEO_FMT(RAW8, 8, SRGGB8_1X8, 16, SRGGB8),
> > +     TEGRA20_VIDEO_FMT(RAW8, 8, SGRBG8_1X8, 16, SGRBG8),
> > +     TEGRA20_VIDEO_FMT(RAW8, 8, SGBRG8_1X8, 16, SGBRG8),
> > +     TEGRA20_VIDEO_FMT(RAW8, 8, SBGGR8_1X8, 16, SBGGR8),
> > +     /* RAW 10 */
> > +     TEGRA20_VIDEO_FMT(RAW10, 10, SRGGB10_1X10, 16, SRGGB10),
> > +     TEGRA20_VIDEO_FMT(RAW10, 10, SGRBG10_1X10, 16, SGRBG10),
> > +     TEGRA20_VIDEO_FMT(RAW10, 10, SGBRG10_1X10, 16, SGBRG10),
> > +     TEGRA20_VIDEO_FMT(RAW10, 10, SBGGR10_1X10, 16, SBGGR10),
> >  };
> >
> >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > @@ -606,9 +670,12 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
> >  static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_c=
han)
> >  {
> >       struct tegra_vi_channel *vi_chan =3D
> > v4l2_get_subdev_hostdata(&vip_chan->subdev); +        u32 data_type =3D
> > vi_chan->fmtinfo->img_dt;
> >       int width  =3D vi_chan->format.width;
> >       int height =3D vi_chan->format.height;
> > -     int output_channel =3D OUT_1;
> > +     int output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_RAW8 ||
> > +                           data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
> > +                           OUT_2 : OUT_1;
> >
> >       unsigned int main_input_format;
> >       unsigned int yuv_input_format;
>
>
>
>
