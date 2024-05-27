Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D428CF9B9
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 09:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8664210F8FF;
	Mon, 27 May 2024 07:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="R9kZ1SeL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA5010F8FF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 07:07:25 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5295bcb9bc1so2498479e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 00:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716793643; x=1717398443;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RcSwrAOBgk0SabpBSOsxuNeS90Z/JnZDn0cwEFk4oc8=;
 b=R9kZ1SeLoGcA+8UHW/9CvO2rkBMyZ2U4noixGwBJskc1xK9JNoc5gJtjoti5GnZDOG
 LDeXwUXvUF6vcGCWz87endXxVvxsMyasO5WXmI/rcEWaMvFZDa8cD8nW/zZmezxo4V3E
 gEfHDk85Ztoq7k7UAXZpG2X7Pb2Fz65w1YX4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716793643; x=1717398443;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RcSwrAOBgk0SabpBSOsxuNeS90Z/JnZDn0cwEFk4oc8=;
 b=owcm/7rTM6aLrT+WfuyvYErjxX5Lc0DJSZLofGT4U9VqxS6BpnjtzfB7+um3/2QP3E
 HpTe6ae4x9P1aSg3bRryhM2f2RL0pZd0FoDzmgLP4QoqumuDXUYhjL9m4J/GQPpY0L+7
 cK1FI22KUKvijk8DU4DNnYKtVbMZ0bKjvWXZdeGcwv5MickfvfEApsu3OEOUYwK7lroz
 ou3weYYJQl0wV8rdKKnYUKEGd0W6njyUGTBDO7c1AcNfxXQQItPQbVDNfUZ+5jw15azs
 1rDz0d4CYbLZMVbRx8oDisD9sFKlJCebrCvnvFs3QeVCIbTcFl+Gg26wmCeFsQ0daE30
 8KLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUReP3LfKW+u22I47mjD51k5fFZy5Eff8YbPmeL8BXQBH1vk9x0/HNHaBxD5NP6OrFmwe5cg9B1XMcGNTigF5vCDtES8Ajwv+Cf4bkerOFp
X-Gm-Message-State: AOJu0YxNICnJ/C8ElmUS4x6jriOVxiF/5gxExp6jjUJ+T3jd9B5QOJVO
 PaD4FyO62LVLsQOSP3LaseoQWlfvJj8+edeIep+1aprMGvge3ESF3TYYWYQViQEDzhsoUa6xrmz
 /XhQLzeqIp9vaZbiOriXOKEIJ9zxKIMKKQcJ8
X-Google-Smtp-Source: AGHT+IH6hkPVE7ofiPKTM1LpKdq3IVMXIknOENA5KSdXkvMNG/QOho/QQ2nuWyvBQu7FsSYAuoYRgFJca6ReR+79/8Q=
X-Received: by 2002:a19:5f07:0:b0:51f:3cb3:48a4 with SMTP id
 2adb3069b0e04-529646e3b70mr4742266e87.1.1716793643444; Mon, 27 May 2024
 00:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-15-yunfei.dong@mediatek.com>
In-Reply-To: <20240516122102.16379-15-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 May 2024 15:07:12 +0800
Message-ID: <CAGXv+5Fo2x1R1=rJgC6ymLPMJYOypQdu9wQNdgSrjREyiQWHPw@mail.gmail.com>
Subject: Re: [PATCH v6,14/24] media: mediatek: vcodec: Add capture format to
 support one plane memory
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, 
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

Hi,

On Thu, May 16, 2024 at 8:21=E2=80=AFPM Yunfei Dong <yunfei.dong@mediatek.c=
om> wrote:
>
> Define one uncompressed capture format V4L2_PIX_FMT_MS21 in order to
> support one plane memory. The buffer size is luma + chroma, luma is
> stored at the start and chrome is stored at the end.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 8 ++++++++
>  drivers/media/v4l2-core/v4l2-common.c                     | 2 ++
>  drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
>  include/uapi/linux/videodev2.h                            | 1 +
>  4 files changed, 12 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/=
Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> index 886ba7b08d6b..6ec899649d50 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> @@ -295,6 +295,14 @@ please make a proposal on the linux-media mailing li=
st.
>        - Compressed format used by Nuvoton NPCM video driver. This format=
 is
>          defined in Remote Framebuffer Protocol (RFC 6143, chapter 7.7.4 =
Hextile
>          Encoding).
> +    * .. _V4L2-PIX-FMT-MS21:
> +
> +      - ``V4L2_PIX_FMT_MS21``
> +      - 'MS21'
> +      - This format has one plane, luma and chroma are stored in a conti=
guous
> +        memory. Luma pixel in 16x32 tiles at the start, chroma pixel in =
16x16
> +        tiles at the end. The image height must be aligned with 32 and t=
he image
> +        width must be aligned with 16.
>  .. raw:: latex
>
>      \normalsize
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 4165c815faef..5ae54cf48dc7 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -271,6 +271,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
>                   .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0,=
 0 }},
>                 { .format =3D V4L2_PIX_FMT_MT2110R, .pixel_enc =3D V4L2_P=
IXEL_ENC_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0=
 }, .bpp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
>                   .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0,=
 0 }},
> +               { .format =3D V4L2_PIX_FMT_MS21, pixel_enc =3D V4L2_PIXEL=
_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .=
bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,

                                                 ^
This is missing a '.' before 'pixel_enc', which breaks the build.

ChenYu

> +                 .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0,=
 0 }},
>
>                 /* YUV planar formats */
>                 { .format =3D V4L2_PIX_FMT_NV12,    .pixel_enc =3D V4L2_P=
IXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 =
}, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 4c76d17b4629..3a68f2b9e7a4 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1529,6 +1529,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>                 case V4L2_PIX_FMT_MT2110T:      descr =3D "Mediatek 10bit=
 Tile Mode"; break;
>                 case V4L2_PIX_FMT_MT2110R:      descr =3D "Mediatek 10bit=
 Raster Mode"; break;
>                 case V4L2_PIX_FMT_HEXTILE:      descr =3D "Hextile Compre=
ssed Format"; break;
> +               case V4L2_PIX_FMT_MS21:         descr =3D "MediaTek One P=
lane Format"; break;
>                 default:
>                         if (fmt->description[0])
>                                 return;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 89eb1a3c6555..7aff2f2c8f9c 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -800,6 +800,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediate=
k 8-bit block mode, two non-contiguous planes */
>  #define V4L2_PIX_FMT_MT2110T  v4l2_fourcc('M', 'T', '2', 'T') /* Mediate=
k 10-bit block tile mode */
>  #define V4L2_PIX_FMT_MT2110R  v4l2_fourcc('M', 'T', '2', 'R') /* Mediate=
k 10-bit block raster mode */
> +#define V4L2_PIX_FMT_MS21     v4l2_fourcc('M', 'S', '2', '1') /* MediaTe=
k 8-bit block mode with one plane */
>  #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel P=
lanar Greyscale 10-bit and Depth 16-bit */
>  #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4=
-bit packed depth confidence information */
>  #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-=
bit dithered RGB */
> --
> 2.25.1
>
