Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DC869F7BD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 16:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B9E10E9F6;
	Wed, 22 Feb 2023 15:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B57C10E9F6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 15:28:19 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id h19so5154908qtk.7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 07:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mMGVbRp8/+LXBEkNN10qPX4XoVpDfmaKg9TNaEHbmko=;
 b=BEGQiwQo/5qt+/+Jh0UDL0X3+RZ14qRZmnbU1/Eq9VcbM1XZ/k6zlhlhA8BPyeMY1L
 qKFzwzAXIjcCrmKaIwBk6gEglRIBHwoyTS3hx9VHrg0Z1nJu2YehVLqpPXmIKaSwZ7q7
 Ny5szDOnmWJGiJAVNH8p+O0DgnwoWUZti2EqHkrXV3wkk6EhYHtVZa1ht/TRzUeCx8tp
 GDe10mYQj77TwmGZHsbJzQqyZs5SNyVvQ40a1LvhkuZjtUMK2Yd1LI04EuNulkPBuwlM
 pjw82YqQCRZSZatNFESVrY6XndmgrADwkuLg+FwLjhUUL7l0lNTNCVl6To1yt2MgxMSh
 9nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mMGVbRp8/+LXBEkNN10qPX4XoVpDfmaKg9TNaEHbmko=;
 b=AAyZ5/+xvXXq5CNxRG7IRg+FVgSpjPuejHHSyrkrHqSm589trJZlawiSp2Je7Q/AwL
 T5Gbq/5yjONK73iYZiKhlNjLvLAXlgTvOJ92Sh9tdvT6MEHfJsgThLdo4uEr0hux+MTt
 l6EMZFDU8k1NTm6OBn1aD4aypDadTlX+GPsAo8nJAA8C96694LKmI9x0jZjKqUr7kRsS
 j3SbIXdWBpOQ6av4DP/0Z+uXaFhBEdIg0B4DgmUWOcEAj96WONzHnc5wW4FFuzj+VMaO
 Cx3PiseR1TUVZ3KqB+pbKJ+eVrV3zlpaCuJHMg7DM1z+01OoGmCbG04dpUVEl5Hl5Ha3
 rizA==
X-Gm-Message-State: AO0yUKW996MUV3uA0bX9C9zPuuhVZk91clPUk3yVMiJ0l0+f6Ved5gT5
 3ZFw+bHsT95Qb9kZzH79Egn3EQ==
X-Google-Smtp-Source: AK7set8/NS6DYgPvEDh1A39SVrEPyiubwkO5pgH/BlvNe4qqi9LKamfEXFWdq//MdVZeOSJgOjOJsA==
X-Received: by 2002:a05:622a:1447:b0:3b9:ba24:4f38 with SMTP id
 v7-20020a05622a144700b003b9ba244f38mr17195597qtx.56.1677079698605; 
 Wed, 22 Feb 2023 07:28:18 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 t82-20020a374655000000b006fa16fe93bbsm2373687qka.15.2023.02.22.07.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:28:17 -0800 (PST)
Message-ID: <691e89bd57907c96cbb8e922cb12b1264b31d471.camel@ndufresne.ca>
Subject: Re: [PATCH v3 2/7] media: Add Y210, Y212 and Y216 formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Feb 2023 10:28:16 -0500
In-Reply-To: <20221221092448.741294-3-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221221092448.741294-3-tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
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

Hi Tomi,

Le mercredi 21 d=C3=A9cembre 2022 =C3=A0 11:24 +0200, Tomi Valkeinen a =C3=
=A9crit=C2=A0:
> Add Y210, Y212 and Y216 formats.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  .../media/v4l/pixfmt-packed-yuv.rst           | 49 ++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  3 ++
>  include/uapi/linux/videodev2.h                |  8 +++
>  3 files changed, 58 insertions(+), 2 deletions(-)

It seems you omitted to update v4l2-common.c, Ming Qian had made a suplicat=
ed
commit for this, I'll ask him if he can keep the -common changes you forgot=
.

>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> index bf283a1b5581..24a771542059 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> @@ -262,7 +262,12 @@ the second byte and Y'\ :sub:`7-0` in the third byte=
.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  These formats, commonly referred to as YUYV or YUY2, subsample the chrom=
a
> -components horizontally by 2, storing 2 pixels in 4 bytes.
> +components horizontally by 2, storing 2 pixels in a container. The conta=
iner
> +is 32-bits for 8-bit formats, and 64-bits for 10+-bit formats.
> +
> +The packed YUYV formats with more than 8 bits per component are stored a=
s four
> +16-bit little-endian words. Each word's most significant bits contain on=
e
> +component, and the least significant bits are zero padding.
> =20
>  .. raw:: latex
> =20
> @@ -270,7 +275,7 @@ components horizontally by 2, storing 2 pixels in 4 b=
ytes.
> =20
>  .. tabularcolumns:: |p{3.4cm}|p{1.2cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8c=
m}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|
> =20
> -.. flat-table:: Packed YUV 4:2:2 Formats
> +.. flat-table:: Packed YUV 4:2:2 Formats in 32-bit container
>      :header-rows: 1
>      :stub-columns: 0
> =20
> @@ -337,6 +342,46 @@ components horizontally by 2, storing 2 pixels in 4 =
bytes.
>        - Y'\ :sub:`3`
>        - Cb\ :sub:`2`
> =20
> +.. tabularcolumns:: |p{3.4cm}|p{1.2cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8c=
m}|p{0.8cm}|p{0.8cm}|p{0.8cm}|p{0.8cm}|
> +
> +.. flat-table:: Packed YUV 4:2:2 Formats in 64-bit container
> +    :header-rows: 1
> +    :stub-columns: 0
> +
> +    * - Identifier
> +      - Code
> +      - Word 0
> +      - Word 1
> +      - Word 2
> +      - Word 3
> +    * .. _V4L2-PIX-FMT-Y210:
> +
> +      - ``V4L2_PIX_FMT_Y210``
> +      - 'Y210'
> +
> +      - Y'\ :sub:`0` (bits 15-6)
> +      - Cb\ :sub:`0` (bits 15-6)
> +      - Y'\ :sub:`1` (bits 15-6)
> +      - Cr\ :sub:`0` (bits 15-6)
> +    * .. _V4L2-PIX-FMT-Y212:
> +
> +      - ``V4L2_PIX_FMT_Y212``
> +      - 'Y212'
> +
> +      - Y'\ :sub:`0` (bits 15-4)
> +      - Cb\ :sub:`0` (bits 15-4)
> +      - Y'\ :sub:`1` (bits 15-4)
> +      - Cr\ :sub:`0` (bits 15-4)
> +    * .. _V4L2-PIX-FMT-Y216:
> +
> +      - ``V4L2_PIX_FMT_Y216``
> +      - 'Y216'
> +
> +      - Y'\ :sub:`0` (bits 15-0)
> +      - Cb\ :sub:`0` (bits 15-0)
> +      - Y'\ :sub:`1` (bits 15-0)
> +      - Cr\ :sub:`0` (bits 15-0)
> +
>  .. raw:: latex
> =20
>      \normalsize
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 875b9a95e3c8..a244d5181120 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1449,6 +1449,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>  	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr =3D "Rockchip ISP1 3A Statist=
ics"; break;
>  	case V4L2_PIX_FMT_NV12M_8L128:	descr =3D "NV12M (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12M_10BE_8L128:	descr =3D "10-bit NV12M (8x128 Line=
ar, BE)"; break;
> +	case V4L2_PIX_FMT_Y210:		descr =3D "10-bit YUYV Packed"; break;
> +	case V4L2_PIX_FMT_Y212:		descr =3D "12-bit YUYV Packed"; break;
> +	case V4L2_PIX_FMT_Y216:		descr =3D "16-bit YUYV Packed"; break;
> =20
>  	default:
>  		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 51d6a8aa4e17..403db3fb5cfa 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -621,6 +621,14 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_YUVX32  v4l2_fourcc('Y', 'U', 'V', 'X') /* 32  YUVX=
-8-8-8-8  */
>  #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV =
4:2:0 2 lines y, 1 line uv interleaved */
> =20
> +/*
> + * YCbCr packed format. For each Y2xx format, xx bits of valid data occu=
py the MSBs
> + * of the 16 bit components, and 16-xx bits of zero padding occupy the L=
SBs.
> + */
> +#define V4L2_PIX_FMT_Y210    v4l2_fourcc('Y', '2', '1', '0') /* 32  YUYV=
 4:2:2 */
> +#define V4L2_PIX_FMT_Y212    v4l2_fourcc('Y', '2', '1', '2') /* 32  YUYV=
 4:2:2 */
> +#define V4L2_PIX_FMT_Y216    v4l2_fourcc('Y', '2', '1', '6') /* 32  YUYV=
 4:2:2 */
> +
>  /* two planes -- one Y, one Cr + Cb interleaved  */
>  #define V4L2_PIX_FMT_NV12    v4l2_fourcc('N', 'V', '1', '2') /* 12  Y/Cb=
Cr 4:2:0  */
>  #define V4L2_PIX_FMT_NV21    v4l2_fourcc('N', 'V', '2', '1') /* 12  Y/Cr=
Cb 4:2:0  */

