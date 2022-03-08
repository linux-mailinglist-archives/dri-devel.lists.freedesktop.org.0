Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C344D1344
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 10:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DD710E1EC;
	Tue,  8 Mar 2022 09:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CC910E1EC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 09:24:46 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id z26so15974775lji.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 01:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Qc3cdtb2ObmZKvz2L8H2f36LArmlcfQVA40kTItDy2Y=;
 b=UOFi8/nxnDKYN9DV6hYfvHsbmJ9Xo3GDKCIzi1mqq/vv3PDq5xezVAMrOKJiYes2q6
 VuPJwYCMOhh5WLEJBq8tSQcVBWljUg/9a6kkheKtTwXhrUS3hUR9sGS9SvgkNBzblu0O
 7Fn3Okopy24xD0npgsASCEHav4G9VavME66GmLllzq7uS4u2Bxbe+nFgDTuOi2WDDoYl
 +r26vyG8Gzx+7qDI6QLl0dyQ8lhPACxgg7G/yorWJeQPm0K4sLaJd94YopM49GYwrqGe
 lC9E7uc+abKiBcgweUOuGbFw+vjJXE+7+dPlSht8hB3a4b3HJJYrkuDl/Ne2gaPJBsHe
 odJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Qc3cdtb2ObmZKvz2L8H2f36LArmlcfQVA40kTItDy2Y=;
 b=zxtCZlA2BYA0eLpHNv7lm3CIyaDX3tehUhRbKwDrOiw/NFvM926zeVwCe2EFRncoe6
 dgUq0VI04T1/rhCrAq8/8ejMQnzjpL5wSMTOyriZfMIBFvPxm6SVVCibRjMDZco+ccRb
 LrrIqgLKR4lVLm5rDmsSTwRDJ1A/FE5U2Yje7Qt1ydhUpZwEN4C2ErebXV8diCnDYo39
 telGYx6msq1FArAWeN5Z42kobU97871ZxpytYBi/1PUTfUrpMp7mEoCfqQCg7yEwF8y4
 RnjeKd+UxAWxT6ugdoCsMtBeEF/ISi21NS+MDGBAHhhzCsTCD1yzy+40o7Msqb4mqAxx
 YRag==
X-Gm-Message-State: AOAM533XSqiWfSt8lOHFErc2R/GBUDh+mQBaLVUx7l/KWD/EWAiLLypq
 9oDtWWZLchn2frZ5OzIFBUE=
X-Google-Smtp-Source: ABdhPJwS4ykfunOcYuzHIB1MB+GfCL56dZzm0pnKdbHfdJpVOpihwuOGmvJ4GFa68yoBf7ayziqUSA==
X-Received: by 2002:a2e:3e13:0:b0:246:7097:87eb with SMTP id
 l19-20020a2e3e13000000b00246709787ebmr10223359lja.168.1646731484954; 
 Tue, 08 Mar 2022 01:24:44 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 z32-20020a0565120c2000b004431836523esm3361488lfu.250.2022.03.08.01.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 01:24:44 -0800 (PST)
Date: Tue, 8 Mar 2022 11:24:41 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH libdrm 2/3] drm_fourcc: Add DRM_FORMAT_C[124]
Message-ID: <20220308112441.6e9e785a@eldfell>
In-Reply-To: <c9b62e081b77b625654e7d4477bfd63fe3833c35.1646683737.git.geert@linux-m68k.org>
References: <cover.1646683737.git.geert@linux-m68k.org>
 <c9b62e081b77b625654e7d4477bfd63fe3833c35.1646683737.git.geert@linux-m68k.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_3wdydvDyrrM4pNvdv+shA2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/_3wdydvDyrrM4pNvdv+shA2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon,  7 Mar 2022 21:53:17 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Add fourcc codes for color-indexed frame buffer formats with two, four,
> and sixteen colors.  Add support for creating buffers using these
> formats.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  include/drm/drm_fourcc.h |  5 ++++-
>  tests/modetest/buffers.c | 15 +++++++++++++++
>  tests/util/format.c      |  3 +++
>  3 files changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
> index 957c7be29239c0a1..f8b18d28a71dabff 100644
> --- a/include/drm/drm_fourcc.h
> +++ b/include/drm/drm_fourcc.h
> @@ -99,7 +99,10 @@ extern "C" {
>  #define DRM_FORMAT_INVALID	0
> =20
>  /* color index */
> -#define DRM_FORMAT_C8		fourcc_code('C', '8', ' ', ' ') /* [7:0] C */
> +#define DRM_FORMAT_C1		fourcc_code('C', '1', ' ', ' ') /* [7:0] C0:C1:C2=
:C3:C4:C5:C6:C7 1:1:1:1:1:1:1:1 eight pixels/byte */
> +#define DRM_FORMAT_C2		fourcc_code('C', '2', ' ', ' ') /* [7:0] C0:C1:C2=
:C3 2:2:2:2 four pixels/byte */
> +#define DRM_FORMAT_C4		fourcc_code('C', '4', ' ', ' ') /* [7:0] C0:C1 4:=
4 two pixels/byte */
> +#define DRM_FORMAT_C8		fourcc_code('C', '8', ' ', ' ') /* [7:0] C 8 one =
pixel/byte */

Hi Geert,

I believe updates to drm_fourcc.h in libdrm must be done with the
specific process, please see

https://gitlab.freedesktop.org/mesa/drm/-/blob/main/include/drm/README

section "When and how to update these files".


Thanks,
pq

> =20
>  /* 8 bpp Red */
>  #define DRM_FORMAT_R8		fourcc_code('R', '8', ' ', ' ') /* [7:0] R */
> diff --git a/tests/modetest/buffers.c b/tests/modetest/buffers.c
> index 8a8d9e0143474378..af7f60b4fb4d09ad 100644
> --- a/tests/modetest/buffers.c
> +++ b/tests/modetest/buffers.c
> @@ -135,6 +135,18 @@ bo_create(int fd, unsigned int format,
>  	int ret;
> =20
>  	switch (format) {
> +	case DRM_FORMAT_C1:
> +		bpp =3D 1;
> +		break;
> +
> +	case DRM_FORMAT_C2:
> +		bpp =3D 2;
> +		break;
> +
> +	case DRM_FORMAT_C4:
> +		bpp =3D 4;
> +		break;
> +
>  	case DRM_FORMAT_C8:
>  	case DRM_FORMAT_NV12:
>  	case DRM_FORMAT_NV21:
> @@ -283,6 +295,9 @@ bo_create(int fd, unsigned int format,
>  		planes[2] =3D virtual + offsets[2];
>  		break;
> =20
> +	case DRM_FORMAT_C1:
> +	case DRM_FORMAT_C2:
> +	case DRM_FORMAT_C4:
>  	case DRM_FORMAT_C8:
>  	case DRM_FORMAT_ARGB4444:
>  	case DRM_FORMAT_XRGB4444:
> diff --git a/tests/util/format.c b/tests/util/format.c
> index 1ca1b82ce947b2f4..4b984af9bce8ac6f 100644
> --- a/tests/util/format.c
> +++ b/tests/util/format.c
> @@ -40,6 +40,9 @@
> =20
>  static const struct util_format_info format_info[] =3D {
>  	/* Indexed */
> +	{ DRM_FORMAT_C1, "C1" },
> +	{ DRM_FORMAT_C2, "C2" },
> +	{ DRM_FORMAT_C4, "C4" },
>  	{ DRM_FORMAT_C8, "C8" },
>  	/* YUV packed */
>  	{ DRM_FORMAT_UYVY, "UYVY", MAKE_YUV_INFO(YUV_YCbCr | YUV_CY, 2, 2, 2) },


--Sig_/_3wdydvDyrrM4pNvdv+shA2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmInINkACgkQI1/ltBGq
qqf3TQ/+JyaSOx0+rYn7UhZ67w/TYCanMqkATpHMwbDY8muQE/4fIGzTlW2N+aGM
xFIvRzAk7jWaU9PaynSq94EeR+w1XAtS/HpO/FLxYEfPK2GLBw2nN3OPz4LK1Fj4
Mjb5rz+arB1PqFPXAj+qyczNhMyXPzqti8WDWu4TjyhAj8wHaLCbVC64+m4a5kQO
Lcah4KmkOcNvhFhDFyspzdftMhDS+9dnsvPN/mmFEK7hRe0tT3wGaTugIF5IuzWS
FwS6Gql7vxYKtoUBVOK/6fSh2HKfiSLjhk986t8jPR0/WQKa4OddfR+aP9VSBoS2
GkYH0yZIjU81ep+PKFvT7zw/G1nV3LG6/ag/7Z04BVAHLXr4hyH/kWpQg4DBQOJn
Gou179g86zR+VFxqRa7ZBOau3JKQEao5sx9JxpkVYTO98vJiBMF/3T1myBdDbwqn
Ni0Wh6L6r1FHS90NkPXsDX90X+zpVxae/5UUUxP99fpl+qO2Kq58BJsivfYMlAuY
bNlwnM5xpbwUA/vvT7iWA85vb2piWXrDpI0aBJrbvlN3t3Wq/y7ftJXF1dXSuE7E
fnfdjc6xaWNR92pknUHAMFo3xYBAxOMbR+n+U0BjaViVbJeyqsKKQpQg99KCYF5w
o59ywDS7zS//HIds1HsPt7fjvCKPSCxMh96SqA75av8yiNa4JbU=
=RvgS
-----END PGP SIGNATURE-----

--Sig_/_3wdydvDyrrM4pNvdv+shA2--
