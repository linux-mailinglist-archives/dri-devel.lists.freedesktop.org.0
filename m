Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A6C7C4FF7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 12:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6B610E63D;
	Wed, 11 Oct 2023 10:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23C410E635;
 Wed, 11 Oct 2023 10:20:19 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-503f39d3236so8031459e87.0; 
 Wed, 11 Oct 2023 03:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697019618; x=1697624418; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ApWxUM+KiewVt2MnppbOpApBUskpn3kN8APwyXQwGmk=;
 b=Pr1GQDhrUxhyscWuf2tv/6aUcppmO+zWCiSsqEqK7vce/m6wyLsurAOCSt1gaMT9d1
 s+nkIBeSGu8eC4pEeYbFRIkQvwoPx/drDvB9d+W5jS/72Yc7WHqoY2TFpQLI+ol8/2zM
 9OiwUJlIbxZE9o7P4pBBrx2LwGiy3zftdA/hnMOb97EJDs/muIxDZMFOqpAYM0YFAzLN
 Dyk+5RvzmAJstcr8wSJgGwy2+KsN+X5ybhDYWe0C8emO+t1sbVN1Hc80Itbdn1uRd6RV
 My4tXBa09L57YgWUyZiOs+yfsCfTmYcJ6acHC7ppcF38n94W/JHeAZvLxfeLhEecGJwW
 UI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697019618; x=1697624418;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ApWxUM+KiewVt2MnppbOpApBUskpn3kN8APwyXQwGmk=;
 b=nk6fT5j5xwev9rr3qY3PP7rSwXWB84G0c+0batn6TMkNe4cxu/FIzt8qcgliY7i0R6
 dEBayd2Q4nWGcvczLMLyE+28Ixa1xa5lx9vytoEm3KSIMWlEI9nqw48yx+0s4FFrvEzI
 4ponpexgrao9koEtSC3xXfpyEMBr0nxhAW8aFP1QSrMCEdJz9fMwQdlUx2ghMie1abnL
 OeuFbdoVXb0lYNB3zP6Tu+jS7y88+YKjE9gwLaY5keQKpZ6+BXy9Kx1Gyio/DlrzCI+d
 axHvgZqtzLmrR55fdz1UYkh9UqsmG0PWP9vSIzithSZiMsE6bNKoytV0ryWWtMJiUoch
 TiSQ==
X-Gm-Message-State: AOJu0YwdoQfDd/5N68xXKOvb5k5YKIbW2h/KLbJ2fhBhnZxFgnkBVYPf
 SPimhfPxMWQBr2u02Th+Csw=
X-Google-Smtp-Source: AGHT+IEokYBC02QSpzt8BMNVAcXpB/DIq0AUKiRWefV/DCz0PO7+Eg0aneBmw6sm80FLqcztet+m4A==
X-Received: by 2002:a05:6512:44d:b0:500:a092:d085 with SMTP id
 y13-20020a056512044d00b00500a092d085mr17404331lfk.68.1697019617332; 
 Wed, 11 Oct 2023 03:20:17 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y18-20020a197512000000b00503f39e6bcesm2195539lfe.95.2023.10.11.03.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 03:20:16 -0700 (PDT)
Date: Wed, 11 Oct 2023 13:20:05 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Message-ID: <20231011132005.43d2a86a@eldfell>
In-Reply-To: <20231010161322.topz6zfealkxtwjj@mail.igalia.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20231010161322.topz6zfealkxtwjj@mail.igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BolVCRejD.IPfg=R/IvyE43";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, Xaver Hugl <xaver.hugl@gmail.com>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/BolVCRejD.IPfg=R/IvyE43
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Oct 2023 15:13:46 -0100
Melissa Wen <mwen@igalia.com> wrote:

> O 09/08, Harry Wentland wrote:
> > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Melissa Wen <mwen@igalia.com>
> > Cc: Jonas =C3=85dahl <jadahl@redhat.com>
> > Cc: Sebastian Wick <sebastian.wick@redhat.com>
> > Cc: Shashank Sharma <shashank.sharma@amd.com>
> > Cc: Alexander Goins <agoins@nvidia.com>
> > Cc: Joshua Ashton <joshua@froggi.es>
> > Cc: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> > Cc: Aleix Pol <aleixpol@kde.org>
> > Cc: Xaver Hugl <xaver.hugl@gmail.com>
> > Cc: Victoria Brekenfeld <victoria@system76.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Uma Shankar <uma.shankar@intel.com>
> > Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> > Cc: Christopher Braga <quic_cbraga@quicinc.com>
> > ---
> >  Documentation/gpu/rfc/color_pipeline.rst | 278 +++++++++++++++++++++++
> >  1 file changed, 278 insertions(+)
> >  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
> >=20
> > diff --git a/Documentation/gpu/rfc/color_pipeline.rst b/Documentation/g=
pu/rfc/color_pipeline.rst
> > new file mode 100644
> > index 000000000000..bfa4a8f12087
> > --- /dev/null
> > +++ b/Documentation/gpu/rfc/color_pipeline.rst

...

> > +Color Pipeline Discovery
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > +
> > +A DRM client wanting color management on a drm_plane will:
> > +
> > +1. Read all drm_colorop objects
> > +2. Get the COLOR_PIPELINE property of the plane
> > +3. iterate all COLOR_PIPELINE enum values
> > +4. for each enum value walk the color pipeline (via the NEXT pointers)
> > +   and see if the available color operations are suitable for the
> > +   desired color management operations
> > +
> > +An example of chained properties to define an AMD pre-blending color
> > +pipeline might look like this:: =20
>=20
> Hi Harry,
>=20
> Thanks for sharing this proposal. Overall I think it's very aligned with
> Simon's description of the generic KMS color API. I think it's a good
> start point and we can refine over iterations. My general questions have
> already been pointed out by Sebastian and Pekka (mainly regarding the
> BYPASS property).
>=20
> I still have some doubts on how to fit these set of colorops with some
> AMD corners cases as below:
>=20
> > +
> > +    Plane 10
> > +    =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Curso=
r} =3D Primary
> > +    =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42} =3D 0
> > +    Color operation 42 (input CSC)
> > +    =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> > +    =E2=94=9C=E2=94=80 "matrix_data": blob
> > +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43 =20
>=20
> IIUC, for input CSC, there are currently two possiblities, or we use
> `drm_plane_color_encoding` and `drm_plane_color range` to get
> pre-defined coefficients or we set a custom matrix here, right? If so, I
> think we need some kind of pre-defined matrix option?
>=20
> Also, with this new plane API in place, I understand that we will
> already need think on how to deal with the mixing between old drm color
> properties (color encoding and color range) and these new way of setting
> plane color properties. IIUC, Pekka asked a related question about it
> when talking about CRTC automatic RGB->YUV (?)=20

I didn't realize color encoding and color range KMS plane properties
even existed. There is even color space on rockchip!

https://drmdb.emersion.fr/properties?object-type=3D4008636142

That list has even more conflicts: DEGAMMA_MODE, EOTF, FEATURE,
NV_INPUT_COLORSPACE, SCALING_FILTER, WATERMARK, alpha, GLOBAL_ALPHA,
brightness, colorkey, contrast, and more. I hope most of them are
actually from downstream drivers.

I think they should be forbidden to be used together with the new
pipeline UAPI. Mixing does not work in the long run, it would be
undefined at what position do the old properties apply in a pipeline.

Apparently, we already need a DRM client cap for the new color pipeline
UAPI to hide these legacy things.


This is different from "CRTC automatic RGB->YUV", because the CRTC
thing is chosen silently by the driver and there is nothing after it.
Those old plane properties are explicitly programmed by userspace.


Thanks,
pq

> > +    Color operation 43
> > +    =E2=94=9C=E2=94=80 "type": enum {Scaling} =3D Scaling
> > +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 44
> > +    Color operation 44 (DeGamma)
> > +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> > +    =E2=94=9C=E2=94=80 "1d_curve_type": enum {sRGB, PQ, =E2=80=A6} =3D=
 sRGB
> > +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 45
> > +    Color operation 45 (gamut remap)
> > +    =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> > +    =E2=94=9C=E2=94=80 "matrix_data": blob
> > +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 46
> > +    Color operation 46 (shaper LUT RAM)
> > +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> > +    =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT} =3D LUT
> > +    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> > +    =E2=94=9C=E2=94=80 "lut_data": blob
> > +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 47 =20
>=20
> For shaper and blend LUT RAM, that the driver supports pre-defined
> curves and custom LUT at the same time but the resulted LUT is a
> combination of those, how to make this behavior clear? Could this
> behavior be described by two colorop in a row: for example, one for
> shaper TF and,just after, another for shaper LUT or would it not be the
> right representation?
>=20
> > +    Color operation 47 (3D LUT RAM)
> > +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
> > +    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 17
> > +    =E2=94=9C=E2=94=80 "lut_data": blob
> > +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 48
> > +    Color operation 48 (blend gamma)
> > +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> > +    =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, =E2=80=A6=
} =3D LUT
> > +    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> > +    =E2=94=9C=E2=94=80 "lut_data": blob
> > +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 0
> > +
> > +
> > +Color Pipeline Programming
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +
> > +Once a DRM client has found a suitable pipeline it will:
> > +
> > +1. Set the COLOR_PIPELINE enum value to the one pointing at the first
> > +   drm_colorop object of the desired pipeline
> > +2. Set the properties for all drm_colorop objects in the pipeline to t=
he
> > +   desired values, setting BYPASS to true for unused drm_colorop block=
s,
> > +   and false for enabled drm_colorop blocks
> > +3. Perform atomic_check/commit as desired
> > +
> > +To configure the pipeline for an HDR10 PQ plane and blending in linear
> > +space, a compositor might perform an atomic commit with the following
> > +property values::
> > +
> > +    Plane 10
> > +    =E2=94=94=E2=94=80 "color_pipeline" =3D 42
> > +    Color operation 42 (input CSC)
> > +    =E2=94=94=E2=94=80 "bypass" =3D true
> > +    Color operation 44 (DeGamma)
> > +    =E2=94=94=E2=94=80 "bypass" =3D true
> > +    Color operation 45 (gamut remap)
> > +    =E2=94=94=E2=94=80 "bypasse" =3D true
> > +    Color operation 46 (shaper LUT RAM)
> > +    =E2=94=94=E2=94=80 "bypass" =3D true
> > +    Color operation 47 (3D LUT RAM)
> > +    =E2=94=94=E2=94=80 "lut_data" =3D Gamut mapping + tone mapping + n=
ight mode
> > +    Color operation 48 (blend gamma)
> > +    =E2=94=94=E2=94=80 "1d_curve_type" =3D PQ inverse EOTF =20
>=20
> Isn't it a PQ EOTF for blend gamma?
>=20
> Best Regards,
>=20
> Melissa
>=20
> > +
> > +
> > +References
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_=
hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=
=3D@emersion.fr/
> > \ No newline at end of file
> > --=20
> > 2.42.0
> >  =20


--Sig_/BolVCRejD.IPfg=R/IvyE43
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmUmdtUACgkQI1/ltBGq
qqfHZg/9GYh1504SC3uZHYZkvJ7ILq5e/rqpSucZeDMr9R6A2ke9+ngIT1Wixlk/
69ebgzU9tFAu1vHMTred9acYG3KymK9bDJ2zbshSzx4VmgDNDx9cGvD8GU5SlBnP
ELZED7ZIkxDQxKcqeVPOaLXzTbD1EEQ4LWwx3LpEhYKkDETp/wnS6CFpFeVVvdf6
3VjaqKH782tyAVZTgaZrAG5K9xXPphP1ZXSSVNywn5xm3txcsxUf3eyju9gpzsxo
Q8SXvSTXCIZHa2sFlFWJDSRfVt2WwTe5spCDubznQRUbU9Wa4pIvrke9TfObrz2B
Q95tR5sGtTq/wTy2Z6wuO32p8dN/waicIImsCGQD+DM8AmkJqf3HtJfSpkVIirx0
LQpAhKGGzUxU6AyLzDdH+r7IhS5V6v3TNPKrkq8YLdwsvFXLbLEzHSwAr0EteYd2
oo9adr9SAxpaINV4I7246Vky6SsQnUSTzN3GnkLGUmUaEWV63AYjh2ekAU+NTEDO
fnoNNFQiuC+GphUBm1GkGbs0G6u3Lph1RGcwfgiB4iiFg/pLaQfTWjEmDGY7CV42
HYGbL8uAX6wU4lauTMWuUJjiA34zdOBlM6VsAgW1GseJhC7Cvp/KL2m6W2mC7J8O
ow0AlIdIs2JbmuspCL6uxiJO0s3CeWfS5K3XrUR2SQ/fdbJbKKY=
=tSCA
-----END PGP SIGNATURE-----

--Sig_/BolVCRejD.IPfg=R/IvyE43--
