Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDFB8CD06B
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 12:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A250C10E0EC;
	Thu, 23 May 2024 10:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IRNb8pXx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEE110E0EC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 10:36:17 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-51f12ccff5eso9405332e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 03:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716460576; x=1717065376;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oK/A89Z/zNw46yDzJQlKHlc10yICfqRNuD9iOVPjR0A=;
 b=IRNb8pXxMuNzBC43pC7HFjYMWmIvrJaonarfQFthyIl/nVPfJBrbSa0jzDjQIFXQYn
 X4fQYZq2Rb/9fcYojppWk1uqTojB4oxX8abnjLNfm1G3S00ZFeetFcmqLB5ppTs9X6WE
 pGvg+Dp2qefjoxQwyksG2fXwy1sMpYYQilgXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716460576; x=1717065376;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oK/A89Z/zNw46yDzJQlKHlc10yICfqRNuD9iOVPjR0A=;
 b=pX4itA0Pt8jm6B6/iy1DeDANJ429uuxB1WtSxV0/FREDjs1xp0QJptWdfl5KDlilsP
 6e4CTx7d/XehJh9pAwCIBUp7h/oW5fQPr+MvlNNkaU7xLtZdKHJmIuoI6QHGM1nzAAW2
 oP89C3hHbF33kxy3KsoWpZXCVG1MUk7LIYf5zgWz7o55mKebl8mOU2wKbfDxMjtsMsHI
 NGjtSwdn007Jo3lGaHPTl4HIY0PElANc/NIsX1phn8kQTKGuOuenWCRNPeTaiIOVNQny
 8hj8B+tyyZp7IFmInTOXERVlKHlIazbyUVGcj/SlMRhM5o+XoCB3Zr/Ru3lAY9g7lmIC
 yHVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/4KoDfKRGsBMHWCIbgkoD8dgG24UyWT5zoRlo2aimWjhkl6idp++lIuoyPFbLmzBAxjVYkh1IQhr8gfRGkx9BCJ7YvxSWd8DekNiHL2u0
X-Gm-Message-State: AOJu0YzGD3qJ9ZP+4lJ97Wud2hgrIkHjdIWvB35JC9L0h0PH4hWPf2Be
 pM2rHDKhhjhtoW9GbBbPlIBK9WERTQCpjgY8UyzEkPDwbuE/csOaErX3so9IKMcEal/o2t27YFb
 dEtt+X+TFxwgkHFeYnNcJSiNvn07Y0NfzLoh3
X-Google-Smtp-Source: AGHT+IF1qtqxIdOUuK18yoAkY3al5Dw2mSuMWQ9cFuoHZpQD9cry6r8COqpzTqWYrH9aBrtDFTCbGric5gRQDW1zyIw=
X-Received: by 2002:a05:6512:ac2:b0:51e:f68b:d2a2 with SMTP id
 2adb3069b0e04-526bf546146mr3472177e87.65.1716460575866; Thu, 23 May 2024
 03:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-15-yunfei.dong@mediatek.com>
 <1d4618ac-4316-495d-afdb-5849e4b1e805@collabora.com>
 <537a0969-afdf-4e48-a640-2d8fc665c964@collabora.com>
In-Reply-To: <537a0969-afdf-4e48-a640-2d8fc665c964@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 23 May 2024 18:36:04 +0800
Message-ID: <CAGXv+5Hg-61qQEiPScqEfO6irHnaJHHqcr=MYX=89RzUBRK7oA@mail.gmail.com>
Subject: Re: [PATCH v6,14/24] media: mediatek: vcodec: Add capture format to
 support one plane memory
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>, 
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Yong Wu <yong.wu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
 Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
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

On Thu, May 23, 2024 at 6:14=E2=80=AFPM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> Hi,
>
> I'm having second thoughts, please see inline,
>
> W dniu 22.05.2024 o 14:26, Andrzej Pietrasiewicz pisze:
> > Hi Yunfei,
> >
> > W dniu 16.05.2024 o 14:20, Yunfei Dong pisze:
> >> Define one uncompressed capture format V4L2_PIX_FMT_MS21 in order to
> >> support one plane memory. The buffer size is luma + chroma, luma is
> >> stored at the start and chrome is stored at the end.
> >>
> >> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> >> ---
> >>   Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 8 ++++++=
++
> >>   drivers/media/v4l2-core/v4l2-common.c                     | 2 ++
> >>   drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
> >>   include/uapi/linux/videodev2.h                            | 1 +
> >>   4 files changed, 12 insertions(+)
> >>
> >> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst=
 b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> >> index 886ba7b08d6b..6ec899649d50 100644
> >> --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> >> +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> >> @@ -295,6 +295,14 @@ please make a proposal on the linux-media mailing=
 list.
> >>         - Compressed format used by Nuvoton NPCM video driver. This fo=
rmat is
> >>           defined in Remote Framebuffer Protocol (RFC 6143, chapter 7.=
7.4 Hextile
> >>           Encoding).
> >> +    * .. _V4L2-PIX-FMT-MS21:
> >> +
> >> +      - ``V4L2_PIX_FMT_MS21``
> >> +      - 'MS21'
> >> +      - This format has one plane, luma and chroma are stored in a co=
ntiguous
> >
> > Maybe s/one/single ?
> >
> >> +        memory. Luma pixel in 16x32 tiles at the start, chroma pixel =
in 16x16
> >
> > maybe the word "pixel" is reduntant here? What else than pixels could t=
ile sizes mean?
> > Any padding between luma and chroma?
> >
> >> +        tiles at the end. The image height must be aligned with 32 an=
d the image
> >> +        width must be aligned with 16.
> >
> > Maybe aligned to?
> >
> >>   .. raw:: latex
> >>       \normalsize
> >> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l=
2-core/v4l2-common.c
> >> index 4165c815faef..5ae54cf48dc7 100644
> >> --- a/drivers/media/v4l2-core/v4l2-common.c
> >> +++ b/drivers/media/v4l2-core/v4l2-common.c
> >> @@ -271,6 +271,8 @@ const struct v4l2_format_info *v4l2_format_info(u3=
2 format)
> >>             .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0, 0 =
}},
> >>           { .format =3D V4L2_PIX_FMT_MT2110R, .pixel_enc =3D V4L2_PIXE=
L_ENC_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 },=
 .bpp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> >>             .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0, 0 =
}},
> >> +        { .format =3D V4L2_PIX_FMT_MS21, pixel_enc =3D V4L2_PIXEL_ENC=
_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> >> +          .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0, 0 }=
},
> >>           /* YUV planar formats */
> >>           { .format =3D V4L2_PIX_FMT_NV12,    .pixel_enc =3D V4L2_PIXE=
L_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, =
.bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> >> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2=
-core/v4l2-ioctl.c
> >> index 4c76d17b4629..3a68f2b9e7a4 100644
> >> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >> @@ -1529,6 +1529,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc=
 *fmt)
> >>           case V4L2_PIX_FMT_MT2110T:    descr =3D "Mediatek 10bit Tile=
 Mode"; break;
> >>           case V4L2_PIX_FMT_MT2110R:    descr =3D "Mediatek 10bit Rast=
er Mode"; break;
> >>           case V4L2_PIX_FMT_HEXTILE:    descr =3D "Hextile Compressed =
Format"; break;
> >> +        case V4L2_PIX_FMT_MS21:        descr =3D "MediaTek One Plane =
Format"; break;
> >
> > s/One/Single ?
> >
>
> On the other hand "single" would be [in this case incorrectly] associated=
 with
> single-planar API, which would be totally confusing.
>
> Still, the reality you are trying to model is complex: you use
> MPLANE, yet there's a single plane in case of secure playback.

I don't think that's a problem though. The NV12 format (seen above in
the diff context) has the same attributes: 1 contiguous memory plane
containing two component planes.

And it's perfectly fine for MPLANE drivers to support these formats,
Hantro being one of them that decodes to NV12. If a decoder can decode
into discontiguous buffers, it surely can decode into contiguous ones;
just set the second/third buffer address to the correct offset into
the first buffer based on the format layout.

In retrospect we probably should have named "MM21" as "MM21M" to denote
that it is multi-memory-plane, and this "MS21" would have been "MM21",
having a single contiguous memory plane.

And the MPLANE driver supporting "single memory plane" oddity gets
resolved if the API rework ever gets finished.


Regards,
ChenYu

> Regards,
>
> Andrzej
>
>
> > Regards,
> >
> > Andrzej
> >
> >>           default:
> >>               if (fmt->description[0])
> >>                   return;
> >> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/video=
dev2.h
> >> index 89eb1a3c6555..7aff2f2c8f9c 100644
> >> --- a/include/uapi/linux/videodev2.h
> >> +++ b/include/uapi/linux/videodev2.h
> >> @@ -800,6 +800,7 @@ struct v4l2_pix_format {
> >>   #define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Med=
iatek 8-bit block mode, two non-contiguous planes */
> >>   #define V4L2_PIX_FMT_MT2110T  v4l2_fourcc('M', 'T', '2', 'T') /* Med=
iatek 10-bit block tile mode */
> >>   #define V4L2_PIX_FMT_MT2110R  v4l2_fourcc('M', 'T', '2', 'R') /* Med=
iatek 10-bit block raster mode */
> >> +#define V4L2_PIX_FMT_MS21     v4l2_fourcc('M', 'S', '2', '1') /* Medi=
aTek 8-bit block mode with one plane */
> >>   #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Int=
el Planar Greyscale 10-bit and Depth 16-bit */
> >>   #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Int=
el 4-bit packed depth confidence information */
> >>   #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTT=
V 8-bit dithered RGB */
> >
>
