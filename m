Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3087E80A431
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 14:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BA510E2A1;
	Fri,  8 Dec 2023 13:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2F010E2A1;
 Fri,  8 Dec 2023 13:11:49 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c9c18e7990so27369491fa.2; 
 Fri, 08 Dec 2023 05:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702041108; x=1702645908; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=GOJWqOj9krQdnwxEv6cW+pzQZe27LORfH9YShKSjuCQ=;
 b=Vs/1SQ6Cz/GMxAVWosB/cjoWJpSrhacijFsJp6h4Wb8yTrOuXnqHqqaPeGNWCi9Azm
 curQ83YDXFbIbioO6cL2nhPnhV//my0J2XHyKW3vBxESwmr5RPxmXhsrFLOYLGpMdhCp
 /bZVELSUoo1RFPdbOp7Q2ccO1EoTT4MvRkqx43t0Jscmq1gsKtAvodr5uZERR/l2M8TQ
 N4Pt3L0p3SlIe3b6wUqRpXQgXa98FHphd1ddFOxFOf2KYwPsRPPhpbMFmvyDqqp1bor6
 QcuMNgj5+0BkUevcydKWENP49BFHDSqw460/epmJr2KkmwU63Qh4s8MYwhSEnnwrP9u1
 gy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702041108; x=1702645908;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GOJWqOj9krQdnwxEv6cW+pzQZe27LORfH9YShKSjuCQ=;
 b=T3WyqrhvnQsBvnswfQ/tuL3UFOB6FjPTIDNNn6NWkfsygBc/jBk3I0gWM80xOZLka5
 HEKEsHs3hUvj/vXX0/gL9JT4hiPrhA1T0Qy8lWL0ZnH/W3S/snWpRCbvSneI+oe6gtsG
 tL/aAfcElKBvbvzjeQfwbUCEUekphazDJTkLyXhNeIIQ1uh9+CnDNj08X3nVcf05bSNu
 sPpFmR6qp992hAeXX2rIjhNuz0vwbMI18PQKfTN6oNesNWFAvPWaQusrIlrixvIv7Y9F
 4Tvi1hm7IADXplGYwkrcMPue0QhKlBhLI0jQKqlGHgWgWey39y3psXOKuqwCd7PfE5ou
 gUOQ==
X-Gm-Message-State: AOJu0Yyhgh2EL4LZN40iOlUei1j3Xigw+0MVJ2y9PkAzWuv3nq5FrPJU
 DKRjiVRERfS+1Xd/EpvIZnQ=
X-Google-Smtp-Source: AGHT+IE0998ondlLeCZb+ioWerPIl7NDADrQphNauOrUjvFpJGxYna80q6sWblkKTJVMv3RfZOKzEQ==
X-Received: by 2002:a05:6512:748:b0:50b:e3f6:74c2 with SMTP id
 c8-20020a056512074800b0050be3f674c2mr2010157lfs.27.1702041107451; 
 Fri, 08 Dec 2023 05:11:47 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 t16-20020a056512069000b0050bfdfdf6ebsm213083lfe.14.2023.12.08.05.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 05:11:47 -0800 (PST)
Date: Fri, 8 Dec 2023 15:11:42 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v3 21/23] drm/vkms: add 3x4 matrix in color pipeline
Message-ID: <20231208151142.67beed2a@eldfell>
In-Reply-To: <20231108163647.106853-22-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-22-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//2KH1i.t._ZakEHNRtahOiK";
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
Cc: dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_//2KH1i.t._ZakEHNRtahOiK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Nov 2023 11:36:40 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> We add two 3x4 matrices into the VKMS color pipeline. The reason
> we're adding matrices is so that we can test that application
> of a matrix and its inverse yields an output equal to the input
> image.

Would it not be better to mimic what a hardware driver might likely
have? Or maybe that will be just a few more pipelines?

People testing their compositors would likely expect a more usual
pipeline arrangement.

> One complication with the matrix implementation has to do with
> the fact that the matrix entries are in signed-magnitude fixed
> point, whereas the drm_fixed.h implementation uses 2s-complement.
> The latter one is the one that we want for easy addition and
> subtraction, so we convert all entries to 2s-complement.
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/vkms/vkms_colorop.c  | 32 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/vkms/vkms_composer.c | 27 +++++++++++++++++++++++
>  2 files changed, 58 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/v=
kms_colorop.c
> index 9a26b9fdc4a2..4e37e805c443 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -31,7 +31,37 @@ const int vkms_initialize_tf_pipeline(struct drm_plane=
 *plane, struct drm_prop_e
> =20
>  	prev_op =3D op;
> =20
> -	/* 2nd op: 1d curve */
> +	/* 2nd op: 3x4 matrix */
> +	op =3D kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!op) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret =3D drm_colorop_init(dev, op, plane, DRM_COLOROP_CTM_3X4);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, op);
> +
> +	prev_op =3D op;
> +
> +	/* 3rd op: 3x4 matrix */
> +	op =3D kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!op) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret =3D drm_colorop_init(dev, op, plane, DRM_COLOROP_CTM_3X4);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, op);
> +
> +	prev_op =3D op;
> +
> +	/* 4th op: 1d curve */
>  	op =3D kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>  	if (!op) {
>  		DRM_ERROR("KMS: Failed to allocate colorop\n");
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index d04a235b9fcd..c278fb223188 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -164,6 +164,30 @@ static void apply_lut(const struct vkms_crtc_state *=
crtc_state, struct line_buff
>  	}
>  }
> =20
> +static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct =
drm_color_ctm_3x4 *matrix)
> +{
> +	s64 rf, gf, bf;
> +
> +	rf =3D drm_fixp_mul(drm_sm2fixp(matrix->matrix[0]), drm_int2fixp(pixel-=
>r)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[1]), drm_int2fixp(pixel->g=
)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[2]), drm_int2fixp(pixel->b=
)) +
> +	     drm_sm2fixp(matrix->matrix[3]);

Again, if you went for performance, you'd make a copy of the matrix in
fixp format in advance, to avoid having to convert the same thing for
every processed pixel.

> +
> +	gf =3D drm_fixp_mul(drm_sm2fixp(matrix->matrix[4]), drm_int2fixp(pixel-=
>r)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[5]), drm_int2fixp(pixel->g=
)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[6]), drm_int2fixp(pixel->b=
)) +
> +	     drm_sm2fixp(matrix->matrix[7]);
> +
> +	bf =3D drm_fixp_mul(drm_sm2fixp(matrix->matrix[8]), drm_int2fixp(pixel-=
>r)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[9]), drm_int2fixp(pixel->g=
)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[10]), drm_int2fixp(pixel->=
b)) +
> +	     drm_sm2fixp(matrix->matrix[11]);

Likewise the repetition of int2fixp three times for the same value is
probably hurting unless the compiler knows to eliminate the redundant
calls.

> +
> +	pixel->r =3D drm_fixp2int(rf);
> +	pixel->g =3D drm_fixp2int(gf);
> +	pixel->b =3D drm_fixp2int(bf);

Btw. why pick s32 and not fixp for your intermediate type?

Using both you get the limitations of both in range and precision.


Thanks,
pq

> +}
> +
>  static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_color=
op *colorop)
>  {
>  	/* TODO is this right? */
> @@ -185,6 +209,9 @@ static void apply_colorop(struct pixel_argb_s32 *pixe=
l, struct drm_colorop *colo
>  				DRM_DEBUG_DRIVER("unkown colorop 1D curve type %d\n", colorop_state-=
>curve_1d_type);
>  				break;
>  		}
> +	} else if (colorop->type =3D=3D DRM_COLOROP_CTM_3X4) {
> +		if (colorop_state->data)
> +			apply_3x4_matrix(pixel, (struct drm_color_ctm_3x4 *) colorop_state->d=
ata->data);
>  	}
> =20
>  }


--Sig_//2KH1i.t._ZakEHNRtahOiK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVzFg4ACgkQI1/ltBGq
qqfPUw/+IGZghVdOFF9P1yC14jwuSf8hr2LUemnX/NWVnEh/8fXGGBhKriQ6S1Ci
uq5/CiH+4149u34Q0njBtY3E8I7f4whJ6khkOZxo1KSIwcsSV8/almshJcS1VNsR
gFhE2dtuJbJ+0YDsUK8Ns4qu9h2g/Vu84kX3zHQAFu0u2iuyDn97S9QubS8Q+fs6
23j6tlnMIA5dyml3Vkj39yKgnoXw4XO8BnjeIpaOH6phHb8L5kHFznMHVcEv6f75
5nGS9lcR8Y7IG+RWhwA07meKP7QGZvb5jx7Xyc6mgCwbSCa8XpaeS3k6YxnMLFsG
4Oba6dSEqjHKO2XvBY/hIBEkvKg4RDQpPYgf+1SYx2Wat4mT8AC08qyQIVPl7fc6
TL5aEb1nfBZ9nv80I0bZU2I9W7p42xUz9TpxgH0vYNvs8GSrNFEP5oNimEWqnxXF
yEPReiuYTKu8Bv6tOAb2eWMtKmB4kXfIQ7ILueO6mOJjuCBI4YjSief60ykZSRuZ
9RPg5eCNGs4Br6EoCp0WCrshr7F8CU12DZ3vCKmCjtObqzHQ9IxFdwtLNyfS+3gQ
C36Pp6Aru8aXlcPDXQNrkXkTXbQaW1e6CunooSz20f6oVdpwZo7ypz9g8fw0GV9g
vw7CoeeqsY/xd08qWemkoyhizor6I8h/yYwwiU4mwi/PUPRFd7E=
=sy58
-----END PGP SIGNATURE-----

--Sig_//2KH1i.t._ZakEHNRtahOiK--
