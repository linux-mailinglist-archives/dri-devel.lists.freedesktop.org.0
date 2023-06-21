Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E233737F97
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 12:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E009D10E047;
	Wed, 21 Jun 2023 10:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168A810E047;
 Wed, 21 Jun 2023 10:33:37 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f86a7a5499so5409207e87.2; 
 Wed, 21 Jun 2023 03:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687343615; x=1689935615;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=pfgox7DjqCgOODZiUus9R296tpfM4SHoLpMKmpo7PZc=;
 b=sqEzfQQt8Z1/ncRb725HjB/HGo0PmZ0deiAF1S72l4WbFl/BZNNjLiQ6RWjG1wKYrX
 4HNLB4RtO6GAz1R7/1b+GM28Xaqrj9w/tvGouIojau42K7XLX0467OH+nx/AVgaTWJ/q
 7WLThSWjbslGD+ZIqVL9ufxxiGOSEY1t8Ij/irD5g/5zL/Khj1/5+T/+75Z6o3IwFAVv
 VR28VYgj782NEmz7u54QpdjqHYyP+3Qz2+MCRLLxQqfZNKcSMcM3R2MWYgGX12mhJaQd
 hB7BKstTm4FbjN37W3+KeOJ/7Cj8IjH9R0JXln+iVpaOfmVC1LiqTD1QxEgJ2PZStmpk
 2oCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687343615; x=1689935615;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pfgox7DjqCgOODZiUus9R296tpfM4SHoLpMKmpo7PZc=;
 b=lHqU99vYDGH2R0jMdW2lSDfxf5yCuJrK7x7ZSsdJt162s+f4rACzg3SWTmqvRZ3h9N
 T/HLqNtk+cfeMN7u66Yxl2m2L5Gphv6YTFPrZHMSiGtLXoD5gVFrrx7EAbC+jYxYA+TF
 RH07NlpKWZWZgDYn/g8adniq6FP/j7I1Z/jrITGnSZOTLQW40dSo8D7dmFStvPvFGdLe
 HQt1fVnJnstQf2+nPA4Ai1YG6oACBgXPsg47liJVans+hCkf9MZe5XSFSy9NgmGqRyy6
 VtxGM127OdIqVK2ORlUIVQxv2rl6OUhB0BRfjK8oClgJtp42POdTCv3HvgSHo0djth1q
 Rw8w==
X-Gm-Message-State: AC+VfDxVZPOO1EDWD6UyTJ2Uf0iDsqTs2PYXtOvV6KF/GNaNp3+RfqH/
 BdcSiwjDqS1KPG9qNfcAyxw=
X-Google-Smtp-Source: ACHHUZ4tOvzHgGjDN2bgk1ZHXh+FyGxbppt5b9Yo+JBNsr8KddNaMOaxR8K46x42pniMmUxxt5b0nw==
X-Received: by 2002:ac2:5b0c:0:b0:4f8:666b:9de8 with SMTP id
 v12-20020ac25b0c000000b004f8666b9de8mr7317814lfn.13.1687343614713; 
 Wed, 21 Jun 2023 03:33:34 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q4-20020ac25144000000b004f8427f8716sm720493lfd.262.2023.06.21.03.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 03:33:34 -0700 (PDT)
Date: Wed, 21 Jun 2023 13:33:30 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [RFC 0/9] drm: rcar-du: cmm: Enable 3D LUT support
Message-ID: <20230621133330.3d09d47a@eldfell>
In-Reply-To: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
References: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fhMLvl8VtR_L/+6Pe_vgAZ7";
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
Cc: Victoria Brekenfeld <victoria@system76.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, mdaenzer@redhat.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, aleixpol@kde.org,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, tzimmermann@suse.de, sunpeng.li@amd.com,
 Sebastian Wick <sebastian.wick@redhat.com>, mripard@kernel.org,
 Melissa Wen <mwen@igalia.com>, Xinhui.Pan@amd.com, xaver.hugl@gmail.com,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/fhMLvl8VtR_L/+6Pe_vgAZ7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Jun 2023 10:10:22 +0200
Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:

> Hello, this series is based on the RFC sent by Melssa Wen:
> "[RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface"
> https://lore.kernel.org/dri-devel/20230109143846.1966301-1-mwen@igalia.co=
m/
> that introduces CRTC properties to control 3D LUT operations.
>=20
> The R-Car DU peripheral has a post-blending color management pipeline (CM=
M)
> composed by (in order of processing) a 3D LUT a 1D LUT and a Color conver=
sion
> unit.
>=20
> The CMM driver already supported operating the 1D LUT, this series add su=
pport
> for the cubic LUT (named CLU).
>=20
> I've been made aware by Melissa and Pekka that the focus of upstream for
> color management properties is now on the definition of the "Plane color
> pipeline" properties
> https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAc=
cFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=3D@eme=
rsion.fr/
>=20
> Unfortunately the model there proposed doesn't match the R-Car DU hardwar=
e which
> has color management at the post-blending level and not per plane (I've c=
c-ed
> all the receivers of that series, just in case).

Hi,

what are the actual use cases for post-blending color pipelines?

The pre-blending per-plane color pipelines are important for future
Wayland compositors, and post-blending is probably mostly about just
encoding for the sink (applying some inverse EOTF), so I've been
wondering why the post-blending color hardware seems to be so prevalent
and well-developed compared to pre-blending.

Is the idea that composition happens in a standard fixed color space,
and the post-blending color pipeline converts that to sink-native color
space?

If so, how do systems get their input content into the composition
space first?

Or is all this just a side-effect of caring about color on a single
plane, and not care at all how other planes with other kinds of content
will look? (e.g. TV broadcast vs. sub-titles, program guide, OSD)


Thanks,
pq

> The user-space interface has been validated with dedicated unit tests for
> the R-Car DU test suite (kms-test) which are available at:
> https://git.sr.ht/~jmondi_/kms-test
>=20
> The series validates the usage of the HW interface in the hope of re-star=
ting
> discussions and interests in the definition of CRTC color management
> properties.
>=20
> Thanks
>    j
>=20
> Alex Hung (1):
>   drm: Add 3D LUT mode and its attributes
>=20
> Jacopo Mondi (1):
>   drm: rcar-du: crtc: Enable 3D LUT
>=20
> Kieran Bingham (2):
>   drm: rcar-du: cmm: Provide 3D-CLU support
>   drm: rcar-du: kms: Configure the CLU
>=20
> Laurent Pinchart (1):
>   drm: rcar-du: cmm: Refactor LUT configuration
>=20
> Melissa Wen (4):
>   drm/drm_color_mgmt: add shaper LUT to color mgmt properties
>   drm/drm_color_mgmt: add 3D LUT props to DRM color mgmt
>   drm/drm_color_mgmt: add function to create 3D LUT modes supported
>   drm/drm_color_mgmt: add function to attach 3D LUT props
>=20
>  drivers/gpu/drm/drm_atomic_state_helper.c |   7 ++
>  drivers/gpu/drm/drm_atomic_uapi.c         |  24 ++++
>  drivers/gpu/drm/drm_color_mgmt.c          | 113 +++++++++++++++++++
>  drivers/gpu/drm/drm_fb_helper.c           |   5 +
>  drivers/gpu/drm/drm_mode_config.c         |  21 ++++
>  drivers/gpu/drm/rcar-du/rcar_cmm.c        | 127 ++++++++++++++++------
>  drivers/gpu/drm/rcar-du/rcar_cmm.h        |  36 +++++-
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c    |  68 +++++++++---
>  include/drm/drm_color_mgmt.h              |   7 ++
>  include/drm/drm_crtc.h                    |  32 +++++-
>  include/drm/drm_mode_config.h             |  25 +++++
>  include/drm/drm_mode_object.h             |   2 +-
>  include/uapi/drm/drm_mode.h               |  17 +++
>  13 files changed, 428 insertions(+), 56 deletions(-)
>=20
> --
> 2.40.1
>=20


--Sig_/fhMLvl8VtR_L/+6Pe_vgAZ7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSS0foACgkQI1/ltBGq
qqfjKg//SqaRQZPhOcU1s7eAHUHUDW0xyDuO6myOzWM/ltjB3/wmU2Q268RDspXh
rXqhgNAY5UnwqwxG0+O5sNB6gNV/ZZxE3Im+bRHnLTLkN1oigY/saElTSltgaali
bklvi7vi4trRnd6+g5Jm+6ahtJEeyYXvwDCycM2s1h7lYYzL6SK64CmHohOjsNUK
2TJQpk6bsCHIta6bF0Npyq/pYWzjFQZ2fb3HghXouwHXPwgKb3jxQ4p1zp99L6mx
7cJ+IBq654Cuf6xlMAUsyPqZUyeSgNEcXs5/NI0Dw4FFaLxk3fdS8d60TjAT2Wlw
lDWU1tQOJ9ir4WSh/uRGLIyg7gSYslCWEbeSxSh+ngv31lzyoVmUfd6TurNCuAHF
xJZGqPLdfTE1xsasj9+o62BL/EaMzsD63NBk9Vvalp+Lq+xcEaYmnrwLEAxbuNPd
CvKOMfKiYBGp6plbSfu7htOYRK4dm8wOpLtfmmwC1vqNZX23m6su8qlQAOOJFLSr
gdj2o5HckXzQ0xPTV1LWgrcY1E8q4Ye7/WJKtO9D8bdEEIa6DyOgKSrbNh2UH47k
GH+Cl0TmIkFDshve9/vEt/g+tJ0JUheYZs/8opa7MHX0gxp4nw0UwID3q5HPrwxf
AvDA8tYO3d9XFYkjOa6bLEKzcAagLz9fTFzwCY10vACsiDs6M6A=
=ZmE/
-----END PGP SIGNATURE-----

--Sig_/fhMLvl8VtR_L/+6Pe_vgAZ7--
