Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42364644A7B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 18:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B8E10E332;
	Tue,  6 Dec 2022 17:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3381610E332
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 17:40:42 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id y15so14279342qtv.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 09:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOkTYmnhiazLEuS2jorfY79zc25fQq5hfIh6dVD9kVI=;
 b=uv3CBgWIqChXvjmuNm20KjYb1uCyxwzVoz2EFD7Myt4nTY64wwm3LB1RoS2DwYsoZe
 e33HHZCax6mqBKjAFBeM1ZL6n6RdJWCW2MntKDUnqm8S1iJRy5qc1NCsOY82CWdzHX4/
 L8hPvsoyu5rKc6kWE4FSUL3SYlilBeIp8MkRz2IcmFSfWs4EKNBjNhF+v3OzRnUlWzcd
 Osf+QBZlpQVP/8uc2xv1PQUnVlk4wtvngvK4eXTxkbNHws+K5+sEX7x0xlVaYwDm6SzW
 rD7FYqiC2tiqarekYvpmW5OCHSExpg+Bbv8jhHwDQXrEe+cPj2z4W/MXQ+WOGcMR2nxa
 gtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oOkTYmnhiazLEuS2jorfY79zc25fQq5hfIh6dVD9kVI=;
 b=fd23/Bzg/Kr+5wRHb9A2WHV6qE9scM0vpnMPd30ZRN1/her+QZ2M6xcElrls/h+RpH
 h8dyVtUVv4Eh1Vbln7I9yS/Lnn3BZA+1whjh7WXwzRBvjo65yin810tWen/tGUJ2Zufl
 PLPum0NrBG0aVL/vB/Ar4SRcaURoISgYJgFa/GD3T+Ddfzp1ynCaHYbAIzA8dO1HKTwR
 nbOwNqe2F/n2h1s5upcY0pIYw0LuhW4uQQjtCneNlc/VyEXBReLDXgwQUtiTjEJ8lsVa
 6WwZxZeysV0cgCYYEgw8xTa5NYTLmFGjoIdcd28l5pkFpW+IXNpVqG4OFsKGcmdybp71
 x+7A==
X-Gm-Message-State: ANoB5pnTu6RYsY9Bhp45psDXY3UFhPkvI8DJwIJ7N7l4VBiqYv93MqJt
 DY+ifRQO2wbiQgTQnCrtWkYpRw==
X-Google-Smtp-Source: AA0mqf5M3Zjz1sCMVEfBbrR9e9NX8ylgiun/fzx+qW+W3siusIuNIpQ+5aaMgmPsPU0D7UqUEycUSA==
X-Received: by 2002:a05:622a:294:b0:3a7:e4d1:c76e with SMTP id
 z20-20020a05622a029400b003a7e4d1c76emr8031013qtw.505.1670348441326; 
 Tue, 06 Dec 2022 09:40:41 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 m10-20020ac8444a000000b0039cc944ebdasm11986491qtn.54.2022.12.06.09.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 09:40:40 -0800 (PST)
Message-ID: <c1727c05f5f19b749cb5d0e441e363f4bed9d044.camel@ndufresne.ca>
Subject: Re: [PATCH 2/7] media: Add Y210, Y212 and Y216 formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>
Date: Tue, 06 Dec 2022 12:40:38 -0500
In-Reply-To: <20221206133954.397098-3-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221206133954.397098-3-tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
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

Hi,

Le mardi 06 d=C3=A9cembre 2022 =C3=A0 15:39 +0200, Tomi Valkeinen a =C3=A9c=
rit=C2=A0:
> Add Y210, Y212 and Y216 formats.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

This patch is simply missing an update to:

Documentation/userspace-api/media/v4l/yuv-formats.rst

regards,
Nicolas

> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
>  include/uapi/linux/videodev2.h       | 8 ++++++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 964300deaf62..ba95389a59b5 100644
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
> index 877fd61693b8..15b640d2da8a 100644
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

