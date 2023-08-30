Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EDC78D600
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 15:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDA310E132;
	Wed, 30 Aug 2023 13:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7583D10E132;
 Wed, 30 Aug 2023 13:00:25 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2bcb89b476bso83691581fa.1; 
 Wed, 30 Aug 2023 06:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693400423; x=1694005223; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/+6COzNvj5xJQbxdFk6cEgTvgc9fsSQ/cdrafGwQNsY=;
 b=N5XpdMZMW1BuWbbnG3jvZ9OmL0mxSy252zZqn5XGCyfeEknqheK8184OMDkf/9zRNt
 AOK3lQczccbz2e1GmHrdxMzKZ0phAuYTEbXY7drwQMpDvLob5aRag0ySuaDzDUIitWXl
 r3OBbi1SufrDUa8gURY44upcvZ3p4P8VjMk41sXSJnv5slaWxYgBFAiokNm2m/2QJoR0
 vHJ8oz9fpqoma8UBM+GYWw0Eg8zTCEdi1ybipMzx2tzLhHmp3AiQo1Lv7hcPzcOc5PWh
 7gTYY0J1buEl7p5o8NNEnKuDC7KVyEG5B2GXYJHkSR2kPId7Qs1iksuaHVOIj3ZBvzFR
 aH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693400423; x=1694005223;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/+6COzNvj5xJQbxdFk6cEgTvgc9fsSQ/cdrafGwQNsY=;
 b=RF4c1+CADdpyd5GOu0LckfyWVDhWjh8B48AgGDwoTlIwuXWz07E/PUL5JMy1/JILI7
 pz3Wv0gcWP7+ysb6IOEQe01Dx0md3aTOQaBNg9PtCXxrx40IuqfS81siWetgus4hj1Uo
 q8TgzqizKNOdVXKCYTyXk7K1F5kUnEQdgYXTOpT7WcEzK3DCOcjRvwaYSdcVGxNktJ4Y
 vdH1i0auhWziugSUJrAYblyoQQApLwRLXXv1laln3eVF0xQaY2yLuCUwQOpKOtS02fA2
 cX+CFrviMkgPsrU2/Twj86JtyryCaw/n4wr5nwLZ2COIq48cw6wzVvUFe59OuEC8AP4Z
 a+hg==
X-Gm-Message-State: AOJu0Yy36dEMTLIhIGBbZdFCYm6ABbEzgHHQNR9N/zZH2IffktC5rTgn
 paX5+VGNdhruV0u+2+iJwdc=
X-Google-Smtp-Source: AGHT+IGZlKnAoyJ3gD4TpDJaqTtMj3I+jOS2xrRUIQa9X1FoyM56qcbVGtybhkNyeuPE7sN64Q6Tfg==
X-Received: by 2002:a2e:a17a:0:b0:2bc:c38a:bd7c with SMTP id
 u26-20020a2ea17a000000b002bcc38abd7cmr1870511ljl.33.1693400423112; 
 Wed, 30 Aug 2023 06:00:23 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 o18-20020a2e9b52000000b002bcbd292776sm2525783ljj.64.2023.08.30.06.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 06:00:22 -0700 (PDT)
Date: Wed, 30 Aug 2023 16:00:19 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Uma Shankar <uma.shankar@intel.com>
Subject: Re: [RFC 02/33] drm: Add color operation structure
Message-ID: <20230830160019.19e67519@eldfell>
In-Reply-To: <20230829160422.1251087-3-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
 <20230829160422.1251087-3-uma.shankar@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Or=fSSLLhkdmrmZqY5s7u3P";
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
Cc: intel-gfx@lists.freedesktop.org,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Or=fSSLLhkdmrmZqY5s7u3P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 29 Aug 2023 21:33:51 +0530
Uma Shankar <uma.shankar@intel.com> wrote:

> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Each Color Hardware block will be represented uniquely
> in the color pipeline. Define the structure to represent
> the same.
>=20
> These color operations will form the building blocks of
> a color pipeline which best represents the underlying
> Hardware. Color operations can be re-arranged, substracted
> or added to create distinct color pipelines to accurately
> describe the Hardware blocks present in the display engine.
>=20
> Co-developed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  include/uapi/drm/drm_mode.h | 72 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index ea1b639bcb28..882479f41745 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -943,6 +943,78 @@ struct hdr_output_metadata {
>  	};
>  };
> =20
> +/**
> + * enum color_op_block
> + *
> + * Enums to identify hardware color blocks.
> + *
> + * @DRM_CB_PRE_CSC: LUT before the CTM unit
> + * @DRM_CB_CSC: CTM hardware supporting 3x3 matrix
> + * @DRM_CB_POST_CSC: LUT after the CTM unit
> + * @DRM_CB_3D_LUT: LUT hardware with coefficients for all
> + *                 color components
> + * @DRM_CB_PRIVATE: Vendor specific hardware unit. Vendor
> + *                  can expose a custom hardware by defining a
> + *                  color operation block with this name as
> + *                  identifier

This naming scheme does not seem to work. It assumes a far too rigid
pipeline, just like the old KMS property design. What if you have two
other operations between PRE_CSC and CSC?

What sense do PRE_CSC and POST_CSC make if you don't happen to have a
CSC operation?

What if a driver put POST_CSC before PRE_CSC in its pipeline?

What if your CSC is actually a series of three independent operations,
and in addition you have PRE_CSC and POST_CSC?

3D_LUT is an operation category, not a name. The same could be said
about private.

Given that all these are also UAPI, do we also need protect old
userspace from seeing values it does not understand?

> + */
> +enum color_op_block {
> +	DRM_CB_INVAL =3D -1,
> +
> +	DRM_CB_PRE_CSC =3D 0,
> +	DRM_CB_CSC,
> +	DRM_CB_POST_CSC,
> +	DRM_CB_3D_LUT,
> +
> +	/* Any new generic hardware block can be updated here */
> +
> +	/*
> +	 * PRIVATE is kept at 255 to make it future proof and leave
> +	 * scope for any new addition
> +	 */
> +	DRM_CB_PRIVATE =3D 255,
> +	DRM_CB_MAX =3D DRM_CB_PRIVATE,
> +};
> +
> +/**
> + * enum color_op_type
> + *
> + * These enums are to identify the mathematical operation that
> + * a hardware block is capable of.
> + * @CURVE_1D: It represents a one dimensional lookup table
> + * @CURVE_3D: Represents lut value for each color component for 3d lut c=
apable hardware
> + * @MATRIX: It represents co-efficients for a CSC/CTM matrix hardware
> + * @FIXED_FUNCTION: To enable and program any custom fixed function hard=
ware unit
> + */
> +enum color_op_type {
> +	CURVE_1D,
> +	CURVE_3D,
> +	MATRIX,
> +	FIXED_FUNCTION,

My assumption was that a color_op_type would clearly and uniquely
define the mathematical model of the operation and the UABI structure
of the parameter blob. That means we need different values for uniform
vs. exponentially vs. programmable distributed 1D LUT, etc.

If there is a 1D curve with pre-programmed (fixed and named) curves, we
need to enumerate all the curve types somehow. Probably each fixed
curve type should not be a different operation type, because that would
explode the number of alternative pipelines.

A 3D curve in my mind is a function {x,y,z} =3D f(t), while I suspect you
meant a 3D LUT which is a {x,y,z} =3D f(t,u,v) - a 3-vector field in
three dimensional space.

A matrix element could be with or without an offset vector I guess.

FIXED_FUNCTION would need to be replaced with e.g. your example
VENDORXXX_BT602_TO_BT2020 to work.

Have I missed something, how did you intend this to work?


Thanks,
pq

> +};
> +
> +/**
> + * @struct drm_color_op
> + *
> + * This structure is used to represent the capability of
> + * individual color hardware blocks.
> + *
> + * @name: a standardized enum to identify the color hardware block
> + * @type: The type of mathematical operation it can perform
> + * @blob_id: Id pointing to a blob containing information about
> + *          the hardware block which advertizes its capabilities
> + *          to the userspace. It can be an optional field depending
> + *          on the members "name" and "type".
> + * @private_flags: This can be used to provide vendor specific hints
> + *                 to user space
> + */
> +struct drm_color_op {
> +	enum color_op_block name;
> +	enum color_op_type type;
> +	__u32 blob_id;
> +	__u32 private_flags;
> +};
> +
>  /**
>   * DRM_MODE_PAGE_FLIP_EVENT
>   *


--Sig_/Or=fSSLLhkdmrmZqY5s7u3P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTvPWMACgkQI1/ltBGq
qqdyHg//YvPmlDctgDTnznZ7QkFmg3fA6W5zdN6mEN/3oiA5iOws645AViUBmJsG
QSWyqob/G/keci2KOwFzPso1eAqUJuG1YyG9U/uswfy+Tgmq1wdZDUpykGGhdJsJ
zaoYv4PKI1V3VpDRPoadM+0mqzLON9m6GQ2lMk0otdLoS60c5wx8a+Q1oLX2+lED
vcscHQFzHvOlWHWq0OEDrba3wz5rTGXB245PQdkWsOeIlNCHs6hJ0GGGorR6EpgB
kOnYwweDxFLyh5RMZrQVSUPKCCKtIWCjs+2OacQ+bHyUUdHk7/O/Ew799eF+EwDA
3FviOmcRHsJ6mnK0jBSBLRJ8KKOpTvyrPsZjLPghEVveQmECBNxlg9GoHbAiyax3
0jSP9lG4ea0x5Uweg18+FGtQP3mlVuNaUbrZfULRqMlkTBMDlI+UEbSB3jzkq5MR
vjK4r+ihHRbPS7dCQCggFNKKjMTl8dyvDJibxEUIbBxOdEDfGrLvICQfPwepNEt3
Grft/G9sLWSABD29NDaAOYEZ+KMwVTOgxOtMerpVtunWjX7edDkW26/DGGLASI7K
yZRVZvf+43Ra4nt+PBiw8jnuXMa5+6PTJH1zfuLlQGDKjjZaRETx237qj8vii25m
VbEvJMOXHr3ivDknvO9+iZqydrDFBe65/ZYvLx0QQcvAHICYDbs=
=dflq
-----END PGP SIGNATURE-----

--Sig_/Or=fSSLLhkdmrmZqY5s7u3P--
