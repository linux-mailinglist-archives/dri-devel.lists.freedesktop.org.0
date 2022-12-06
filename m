Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7F7644A74
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 18:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C58210E330;
	Tue,  6 Dec 2022 17:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B9710E330
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 17:39:28 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id d2so10898677qvp.12
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 09:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6vwJXO2yIwIyTaL+wwfhKV21EcpVahkX9Yfn9dWn2Vc=;
 b=EhNAx5d9kMUIKcYYW+d8SXABmCt5R36tbZqyhF3O/Hazlk/DPLdbQr50v0gLuS5Vs0
 Kzj+8ci3fMgF2xrUv0YIOeyUEzxtRtnkFWm3KtkxAAWTpTnhJaCkPlAlOZw5lDmMaTZd
 k8rkow6SokiZAgPltcfwMW/XqMjIMLGhu9qMllZwMf0tPLtuHN70/qj62e1ZHNg/BOiO
 LwmUhizn8qxhCXgBwi9HPXZAn3+NqiWuhZS5+o9pPHepERFFNXObPgovOF10+zjfbjzB
 EwiQlTHhcxOjLEmuNRqAFEjfsI0+QyKGev8FPTOzkNqOOR/mDwd2J86j8hToEuaHd9ve
 nsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6vwJXO2yIwIyTaL+wwfhKV21EcpVahkX9Yfn9dWn2Vc=;
 b=XtuCqaHaMfYHovMDgEsUgQhmReBW0nCJTOCugvh8KSGNMTWrlsDW58dSJL+Epk46Hm
 FMTgdr6pL4k2hpiVIQrQWrMP9aPXG83YBjIOUSRxv9Xb8hhrwB7O2hDXJcPRV/IpzZHt
 nh3NztzrOaGOA5NkNAPs+u/h0we57wK3+pNxXR0qmu1C3IllAKgjJxMLKP2hXlPRiSe0
 XtV/XrrQXobkUYOYFoCAnVslyvNf2c9IEkv0XyPf4PFMpIxRtd9L4FVcLfovLSJp1k9J
 Xw9auFXH3e2Y0QHbBiafR2VnsvROs2UoUAUvB6aU12njwRpBWfGbRMGBR1tCd4UXggjd
 DqiA==
X-Gm-Message-State: ANoB5pmqec2vaU1cyRXuOFDk9Qny2PYSB1cXKv5Z+W8UoHy8zN6fmTxP
 MPno0EyhavQ5XRStWrRv/VEdVsV+lkHe1OWN
X-Google-Smtp-Source: AA0mqf6kleqKRKauKukPH3nwqFrvrvx5HvV2ehp0YH2KTji20rCiwQJvXf/N0MX/9UJD/aYwc2m/8A==
X-Received: by 2002:a05:6214:3588:b0:4bb:6c92:378c with SMTP id
 nn8-20020a056214358800b004bb6c92378cmr78735052qvb.117.1670348367676; 
 Tue, 06 Dec 2022 09:39:27 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 dm54-20020a05620a1d7600b006fcc437c2e8sm6749646qkb.44.2022.12.06.09.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 09:39:27 -0800 (PST)
Message-ID: <228a5a9416a891895ce0e108719ba0badbbd0ad8.camel@ndufresne.ca>
Subject: Re: [PATCH 1/7] media: Add 2-10-10-10 RGB formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>
Date: Tue, 06 Dec 2022 12:39:24 -0500
In-Reply-To: <20221206133954.397098-2-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221206133954.397098-2-tomi.valkeinen+renesas@ideasonboard.com>
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
> Add XBGR2101010, ABGR2101010 and BGRA1010102 formats.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

This patch is simply missing an update to

Documentation/userspace-api/media/v4l/pixfmt-rgb.rst

regards,
Nicolas

> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
>  include/uapi/linux/videodev2.h       | 3 +++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index fddba75d9074..964300deaf62 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1304,6 +1304,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>  	case V4L2_PIX_FMT_BGRX32:	descr =3D "32-bit XBGR 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_RGBA32:	descr =3D "32-bit RGBA 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_RGBX32:	descr =3D "32-bit RGBX 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_XBGR2101010:	descr =3D "32-bit XBGR 2-10-10-10"; brea=
k;
> +	case V4L2_PIX_FMT_ABGR2101010:	descr =3D "32-bit ABGR 2-10-10-10"; brea=
k;
> +	case V4L2_PIX_FMT_BGRA1010102:	descr =3D "32-bit BGRA 10-10-10-2"; brea=
k;
>  	case V4L2_PIX_FMT_GREY:		descr =3D "8-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y4:		descr =3D "4-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y6:		descr =3D "6-bit Greyscale"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 29da1f4b4578..877fd61693b8 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -576,6 +576,9 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_RGBX32  v4l2_fourcc('X', 'B', '2', '4') /* 32  RGBX=
-8-8-8-8  */
>  #define V4L2_PIX_FMT_ARGB32  v4l2_fourcc('B', 'A', '2', '4') /* 32  ARGB=
-8-8-8-8  */
>  #define V4L2_PIX_FMT_XRGB32  v4l2_fourcc('B', 'X', '2', '4') /* 32  XRGB=
-8-8-8-8  */
> +#define V4L2_PIX_FMT_XBGR2101010 v4l2_fourcc('R', 'X', '3', '0') /* 32  =
XBGR-2-10-10-10  */
> +#define V4L2_PIX_FMT_ABGR2101010 v4l2_fourcc('R', 'A', '3', '0') /* 32  =
ABGR-2-10-10-10  */
> +#define V4L2_PIX_FMT_BGRA1010102 v4l2_fourcc('A', 'R', '3', '0') /* 32  =
BGRA-10-10-10-2  */
> =20
>  /* Grey formats */
>  #define V4L2_PIX_FMT_GREY    v4l2_fourcc('G', 'R', 'E', 'Y') /*  8  Grey=
scale     */

