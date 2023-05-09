Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AD76FC12A
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 10:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2306D10E34F;
	Tue,  9 May 2023 08:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7038910E34B;
 Tue,  9 May 2023 08:04:39 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f1fe1208a4so3320958e87.2; 
 Tue, 09 May 2023 01:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683619477; x=1686211477;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ifT+vLuhbDTuRQoL5iokYYJiQrrJXaAHqWGcNeXFEBQ=;
 b=i8zWIuqWFtxBAEQWAwAuWdZBmYegSFduz6UyX8nXpw78kuKw+GQmQMdchciTG5LqFF
 KhJpRD7N8Du/WJImJDD7nWIy3NbbU8VHLqqiIu23l8nPviZAfFEY/53blD8OUNIjVrQz
 t9EoOaWS6LyjQaH6MoK4br4sU7skZqyEPWcH50HQKhFSu1BJnquYCXFbGUPIuoC8pxNx
 ZiCq7QcIgH9wsMK1Gd5afOfziljEVsj2aaBKdTkcb5U08RFDoBfxtV7MZcVNUy/hW9Qz
 6fm2ScB1suYfbC1yHbI8neWAKM3r7BeK/JVxgdFwsGZkwmj9GQR+rVdtyOGxmrxbtz6K
 fwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683619477; x=1686211477;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ifT+vLuhbDTuRQoL5iokYYJiQrrJXaAHqWGcNeXFEBQ=;
 b=f4LZxOpPJuaA/trFt7Oq/cUCnUDUis/px2mbwRojBvOPjDCcGK9FL9dxTvFSSwjxTx
 VjiLkRd/qkg8CSfP7cDY1niZvbigbT/1ODe0B9UsFSC0JEBjudXvmcJa/Pck6Nj07htX
 2dtL9lrCNw8DPzPj6TvfziWFUJdlNLwq/99x2utB5waPt/lt0arU/oF2n2+bo1qkMd6R
 XGHfy6+wXSinJv/KjO5xqZfBXSyNQpCijyD0WmhMALnMw/j7K+wTo7PGJpQ3IMzGrM3f
 a+JOoqH1DfPg/FLl8zP55BvnJg8peYDh2M6oOKCNLR99hMg5X4HcbRFMkFCLxBGcHEBR
 UCZA==
X-Gm-Message-State: AC+VfDyXfHAWO3LlEQjNJhr/abAvUawOZsel3VAAdCeR4gEJa2kze6ND
 Ag//STfq1c0OLdPj/BGq8MI=
X-Google-Smtp-Source: ACHHUZ49eYNuBqRdIjJUh3FxDuHr9fi+FC6TYRMapRR3ZyXHSe0CP8ZdbiCByofjqgBRwX5RM8nvPw==
X-Received: by 2002:ac2:5deb:0:b0:4f1:1de7:1aac with SMTP id
 z11-20020ac25deb000000b004f11de71aacmr625765lfq.20.1683619476614; 
 Tue, 09 May 2023 01:04:36 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 p3-20020a19f003000000b004f24d357794sm255313lfc.281.2023.05.09.01.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 01:04:36 -0700 (PDT)
Date: Tue, 9 May 2023 11:04:25 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230509110425.208c91ac@eldfell>
In-Reply-To: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H2hO39VA.kS5nXOXd5hcFdF";
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
Cc: "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Joshua Ashton <joshua@froggi.es>,
 Sebastian Wick <sebastian.wick@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/H2hO39VA.kS5nXOXd5hcFdF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 04 May 2023 15:22:59 +0000
Simon Ser <contact@emersion.fr> wrote:

> Hi all,
>=20
> The goal of this RFC is to expose a generic KMS uAPI to configure the col=
or
> pipeline before blending, ie. after a pixel is tapped from a plane's
> framebuffer and before it's blended with other planes. With this new uAPI=
 we
> aim to reduce the battery life impact of color management and HDR on mobi=
le
> devices, to improve performance and to decrease latency by skipping
> composition on the 3D engine. This proposal is the result of discussions =
at
> the Red Hat HDR hackfest [1] which took place a few days ago. Engineers
> familiar with the AMD, Intel and NVIDIA hardware have participated in the
> discussion.
>=20
> This proposal takes a prescriptive approach instead of a descriptive appr=
oach.
> Drivers describe the available hardware blocks in terms of low-level
> mathematical operations, then user-space configures each block. We decided
> against a descriptive approach where user-space would provide a high-level
> description of the colorspace and other parameters: we want to give more
> control and flexibility to user-space, e.g. to be able to replicate exact=
ly the
> color pipeline with shaders and switch between shaders and KMS pipelines
> seamlessly, and to avoid forcing user-space into a particular color manag=
ement
> policy.
>=20
> We've decided against mirroring the existing CRTC properties
> DEGAMMA_LUT/CTM/GAMMA_LUT onto KMS planes. Indeed, the color management
> pipeline can significantly differ between vendors and this approach cannot
> accurately abstract all hardware. In particular, the availability, orderi=
ng and
> capabilities of hardware blocks is different on each display engine. So, =
we've
> decided to go for a highly detailed hardware capability discovery.
>=20
> This new uAPI should not be in conflict with existing standard KMS proper=
ties,
> since there are none which control the pre-blending color pipeline at the
> moment. It does conflict with any vendor-specific properties like
> NV_INPUT_COLORSPACE or the patches on the mailing list adding AMD-specific
> properties. Drivers will need to either reject atomic commits configuring=
 both
> uAPIs, or alternatively we could add a DRM client cap which hides the ven=
dor
> properties and shows the new generic properties when enabled.

Hi,

I have some further ideas which do conflict with some existing KMS
properties. This dives into the color encoding specific side of the
UAPI.

The main idea is to make the color pipeline not specific to RGB. We
might actually be having YCbCr, XYZ, ICtCp and whatnot instead, at
least in the middle of a pipeline. The aim is to avoid the confusion
from statements like "my red channel is actually luma and not red". So
it's purely syntactic. ISTR some people being against saying "R is just
a channel name, it's not necessarily a red component."

Therefore I propose to address the color channels with indices instead:

	ch 0, ch 1, ch 2, ch 3

Then we define the mapping between pixel and wire formats and the
indices:

	R =3D ch 0
	G =3D ch 1
	B =3D ch 2
	A =3D ch 3

	Y =3D ch 0
	U =3D ch 1
	V =3D ch 2

If necessary, the following can also be defined:

	Z =3D ch 1
	X =3D ch 2
	L =3D ch 0
	M =3D ch 1
	S =3D ch 2

The Y from YUV and Y from XYZ share the designation for the name's sake
although they are not the same quantity. If YUV is not a well-defined
designation wrt. YCbCr, ICtCp and everything else in the same category,
we can assign Cb, Cr, I, Ct, Cp etc. instead. That might be more clear
anyway even if there is a popular convention.

We can also choose differently, to e.g. match the H.273 mapping where
channels are assigned such that Y=3DG, Cr=3DR, Cb=3DB. H.273 gives mappings
between almost all of these, so if using those make more sense, then
let's use those. In the end it shouldn't matter too much, since one
does not arbitrarily mix channels from different formats. Special care
needs to be taken when defining COLOROP elements that do not handle all
channels interchangeably. (E.g. a curve set element is mostly
channel-agnostic when it applies the same curve to channels 0-2, but ch
3 is pass-through.)

Then, we define COLOROP elements in terms of channel indices. This
removes any implied connection to any specific color coding. Elements
that just do not make sense for arbitrary channel ordering, e.g.
special-case elements or enumerated matrix elements with a specific
purpose, will document the intended usage and the expected channel
mapping.

The main reason to do all this is to ultimately allow e.g. limited
range YCbCr scanout with a fully pass-through pipeline with no implied
conversion to or from RGB.

This is where some existing KMS properties will conflict: those that
affect how current implicit YUV-RGB conversions are done. These
properties shall be replaced with COLOROP elements in pipelines, so
that they can be controlled explicitly and we can know where they
reside wrt. e.g. sampling operations. Chroma channel reconstruction
from sub-sampled chroma planes could potentially be explicitly
represented, and so it could also be controlled (chroma siting).

"Nominal" or "normalized" color value encoding at the input and output
of each COLOROP element needs to be defined as well. Some elements,
like matrices, can theoretically handle arbitrary values, but some
elements like LUTs are inherently limited in their input values.
Regardless of how a LUT is defined, it almost always assumes an input
range [0.0, 1.0] of nominal color value encoding. This is particularly
important for cases where out-of-unit-range values are expected:
- scRGB
- maybe some HDR encodings
- YCbCr and anything else with chroma which is normally [-0.5, 0.5]
- xvYCC

Most likely we need to find some way to map everything to the nominal
range [0.0, 1.0] if at all possible. We also need to know how elements
handle input values outside of that range.

The KMS property to control the scaling filter would be replaced
by the scaling COLOROP element with changeable filter property.

All this applies to pre-blending pipelines already. For the
post-blending pipeline we have the added complication of drivers
automatically choosing the wire format, but maybe that can be
hand-waved with a special-purpose COLOROP element that does whatever
the driver chooses, until it can be fully controlled from userspace.


Thanks,
pq

--Sig_/H2hO39VA.kS5nXOXd5hcFdF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRZ/okACgkQI1/ltBGq
qqeoiRAAjNnmS45T8OLDZvbs67/F8AdYDNnzEjXnJgqW8wmZBcTjabgPyCRARG1z
ifyBKx6ucPenIqv5HNazwGtByLySKCwd/xYuji3IQrKT5Oh4Rrs5bbEmPjgUo6Bf
IztADgJI3ZnRJr5PcPzf19fZ3pes5fnbHypOWCCPz3oqBeBkDVRqGlmlC2QNaey7
RUt0eNNJbLxllePuK0o3+vlN5f55+rdnqbFqswseRZLUglNhVpmw2L83IxxkUOus
hTRgXc2pkLgJe344h1HEMkQ2H26rrSfyscB3mt6JSgYyR9IBrFfE+eVSAbKIvkPI
VBHxBmHCVOtpf7ENXV0AUHzn94/UqwS9GeITYjSlDwvMbukKCvocItRBaYr/hpg3
3LxGSn7kosyPdgnEJ0URJgT4uCrdPJErRuxLwIY8Hocuw/4BmAkETmu0++BgNFo0
U9vk0s41d+8ogfo5ss3qdSJtq1Q2mHUFL6J5tNU+SKL61kheieR4fsQ+y/Jmk8R9
FQW3XgjsTjUuzH9Ag5ryBUW+OX4JYviTgsa/KLJ3Pcl7IXuLYyanCJxcpsLm0+F5
a0uGgBs2C9guBdttW3DNrD5g63GLzUr0NVv8VxbyKocsCja6GaSCrzrA3qjeF8lF
D14QGDlHDjfnR4daIn24SYeeoEQDGPOmBluDous3tk2TYl/DY+o=
=jvLd
-----END PGP SIGNATURE-----

--Sig_/H2hO39VA.kS5nXOXd5hcFdF--
