Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7242480A269
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 12:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851D310EA90;
	Fri,  8 Dec 2023 11:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F1710EA90;
 Fri,  8 Dec 2023 11:40:07 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50bf3efe2cbso2267983e87.2; 
 Fri, 08 Dec 2023 03:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702035605; x=1702640405; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=CCDIKbcOIEiwLN/BZoakMCa7YJeKfcoN5s4rLy+zy0E=;
 b=ASYihHrKWxUZTTrm7axLGWko/X1B7kkL2+0KYa5K8xyM8B/44g6fitajLPUmaP+w4c
 nj0M3mN9fW3DQFm5fTLxY0Lf/6JwSYustO1DJqggrYLzQAudwMv2uV2wWCfUo2U7C+X7
 EkEhMsQuqLoHOz9RRiko8wnn3xOLjeGKRl4bzQHHVVjMGMxzE2qLeoGDGls5GOQrm2Vh
 nN+kVINB4UZE2qZd6UGIqVBHVTJ+8Ubf3oAR0VJai6jSDvLKQCL8N8bVuelHQlBynVvc
 COF4ULrOt7AfoKP4IRB2J051Hb67rAR8unzvtIeXRs/beUzRTiT6LriIA+0D3gX9d84l
 gISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702035605; x=1702640405;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CCDIKbcOIEiwLN/BZoakMCa7YJeKfcoN5s4rLy+zy0E=;
 b=KFjl4KNdJg4CsDbbMVj0BWIa/0fjGWMy0rgcQ6y2Aq9zwT/iaGVAarEm9pZicOyJEi
 V+0PEr6l52kLC4HBZ3CjeW1dV+3sNIFiVVbljIwPf0cYmeZqqGvcdmS+y2XZDjzi97O7
 EmSgYDyQNDYCjQVtTXTJwa+OUj+YlHDOTwMIRHhw/splTnzSgI0Ms4WGGkcyvhNayxRa
 63X6rOhvtZZ3pEoEyC5t6Vmt4c6ffKQhOPr7dyQ8ws2QKde7NRl/1vO8a7eVbRC6yEmz
 59t7mJmUYzEpm2iz1wNqvIx8yigWjdp8tyxz/yYjbTFuTLLySIl7f6ZMOelUf9YTxp5O
 zVug==
X-Gm-Message-State: AOJu0Yx3YRfx5OQpQgH8s2QE+joLRPI4UHkli5J/U9TuPHNyXVUMfva1
 8hPuntn6seMgS39DglFNBws=
X-Google-Smtp-Source: AGHT+IHi6wiZekOvVT30CR3sdQG47kLpl7Z10qlPgBprXeI8J56RE7nNgfIPTO9YSp/vR5hqcSWM+w==
X-Received: by 2002:a05:6512:3707:b0:50b:e3f6:a3cd with SMTP id
 z7-20020a056512370700b0050be3f6a3cdmr1138769lfr.17.1702035605020; 
 Fri, 08 Dec 2023 03:40:05 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y1-20020ac24e61000000b0050bff86c497sm193117lfs.23.2023.12.08.03.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 03:40:04 -0800 (PST)
Date: Fri, 8 Dec 2023 13:40:01 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v3 06/23] drm/doc/rfc: Describe why prescriptive
 color pipeline is needed
Message-ID: <20231208134001.654d718c@eldfell>
In-Reply-To: <20231108163647.106853-7-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-7-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iwcLYkGeO5Gq7YCjxDMeBXX";
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

--Sig_/iwcLYkGeO5Gq7YCjxDMeBXX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Nov 2023 11:36:25 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> v3:
>  - Describe DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE (Sebastian)
>  - Ask for clear documentation of colorop behavior (Sebastian)
>=20
> v2:
>  - Update colorop visualizations to match reality (Sebastian, Alex Hung)
>  - Updated wording (Pekka)
>  - Change BYPASS wording to make it non-mandatory (Sebastian)
>  - Drop cover-letter-like paragraph from COLOR_PIPELINE Plane Property
>    section (Pekka)
>  - Use PQ EOTF instead of its inverse in Pipeline Programming example (Me=
lissa)
>  - Add "Driver Implementer's Guide" section (Pekka)
>  - Add "Driver Forward/Backward Compatibility" section (Sebastian, Pekka)
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  Documentation/gpu/rfc/color_pipeline.rst | 352 +++++++++++++++++++++++
>  1 file changed, 352 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>=20
> diff --git a/Documentation/gpu/rfc/color_pipeline.rst b/Documentation/gpu=
/rfc/color_pipeline.rst
> new file mode 100644
> index 000000000000..efc70570a592
> --- /dev/null
> +++ b/Documentation/gpu/rfc/color_pipeline.rst

...

> +An example of a drm_colorop object might look like one of these::
> +
> +    /* 1D enumerated curve */
> +    Color operation 42
> +    =E2=94=9C=E2=94=80 "TYPE": immutable enum {1D enumerated curve, 1D L=
UT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} =3D 1D enumerated curve
> +    =E2=94=9C=E2=94=80 "BYPASS": bool {true, false}
> +    =E2=94=9C=E2=94=80 "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EO=
TF, PQ EOTF, PQ inverse EOTF, =E2=80=A6}
> +    =E2=94=94=E2=94=80 "NEXT": immutable color operation ID =3D 43

If TYPE is a range, then all examples like this need fixing.


Thanks,
pq

--Sig_/iwcLYkGeO5Gq7YCjxDMeBXX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVzAJEACgkQI1/ltBGq
qqdsrxAAstqcUhxgoDqCx6oEAJoOo/rZD9SdjRPrM/rKjZtBnew6m7IV4sTAO8Cm
6svqPW3lEt+NCCnY5UMooJhGMVLpnhOuluXYfc4xK765eEo4BKAxTxGrhTXIMjuc
VGc4PqS1U4niPcC214U5xq+LWSDk7NwKvTkA70FST8fbOPFoUlcZgGiJiCimJ1RX
eMAk7ykNmagvkxYJ9Bd4nzClpXd1f/bToosezevmeLlFl4nVd1OSbFnKRF10gl+l
2wmDgvt69jfh5GYxrw5ltoZjJdoezSYhJYqss5OMH6mnLneF0Jz6loVEYPXuoFlz
K1YEQvp9BISIUO6GPDpod6fu5QgFT32rVNQar1AZPKYQkm9nuLcw0W35G64nnLAA
mzJI1z5Bapzyud3z0nu3ZyuArcRoihdoPBQ+2vUwdw0AjpHaqNpkAwKObl44S5wE
7C0wUypo/AcCAv8QnP0pVOfsZhwBk0r+5gNnihgdoLFAjQQpn8KEKIspiugDy9G5
gIB6fkJ0b9zM2w+Xo2crxUUEfF4e3edQZYD3CL/ci6DtBbHIwwMkG28n7ub49QOj
fw6/xjK3TrMEYWQ+6HWyzyD5CXQfbwT9Iy8XEmYUP04os7jeeIeFKyrZ84drtjLW
zwR2lkPmddrW0VABNegi8vV5z0g70+YJc529eQvsfeiCKbPq6+8=
=Ckpo
-----END PGP SIGNATURE-----

--Sig_/iwcLYkGeO5Gq7YCjxDMeBXX--
