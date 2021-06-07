Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B5239DA7E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 13:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724A56E101;
	Mon,  7 Jun 2021 11:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4613F6E039;
 Mon,  7 Jun 2021 11:00:45 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id x14so7233485ljp.7;
 Mon, 07 Jun 2021 04:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=eIAkgrlqc9qscnVJm7cjOJVMQ5CB0CWJDb7eNKJ+UDQ=;
 b=AZWNmAarFjYBGLx/JILtRQ0wKVhcn0DGBRgQskVt6hzWw8cy3sEieyfbbFlaqkJW6Q
 LINQpMZ8v/yRATnziRmtX4TSgD1WPJE5udjm0GWB8SB4qYM7M76RBfN1DVahKmBwtw0A
 jEmbSREj+XFgYpVIJoYqWs5Z7JeEE10NU9GvfQ2FVL23dEmy3FctrMn5aV1pkclr/oPv
 z6/1DPMr+Y+xwYLVGMLOdbyCuY0jB8Mwzpvyfbtl8A9pWAf7srbpIdkrbVYCIdV4pkmi
 GFjUNoUcPlQfvtN1D8aAWwOZNPNd1IOtAX9lg2BLA2jUcP77BWvPCfmJiHHHy74Oyb8b
 O+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=eIAkgrlqc9qscnVJm7cjOJVMQ5CB0CWJDb7eNKJ+UDQ=;
 b=NSeUmYa1L+yBVZLhzuj6jyzIVLYfNUwFt08vNokYssQzzgfnH2mvz1zWMyaox3LgXS
 05L0jR9j9Q0B6UDg3SnzecIf0i3Xw7NYnXVENR+HzWRjJonzweN8cZn/u0ArRUwUt5IA
 kvHsv63vgEHyC27K8Nq9q8D59Y8+y+jk5eYCruo6et5jjlvaVB1Svm1ud2UVaQukJfm0
 EsqPTx/BkQBAnqzaUwiWGv0KQ3cntxyReWgq26IYdXa6V8yFCK5C+pkoWSx60JuSe9XZ
 X3idMv4ovOohlo4JW3Q9PKIzJygO0LCPLSZZv8HkhJTqTETlyJfE1FkHCDcjX3GaWccx
 +LWQ==
X-Gm-Message-State: AOAM531uoP6biIVzwrVZ3O+yhE6v8bi1K/NUzx6vJg44yJ8r8S36mY2F
 /cRjT8cO0Dh02w0BlY+b+Ow=
X-Google-Smtp-Source: ABdhPJx2W6LcLyIIe0/rrwaFuO66QnrqOybu4wc1aeDByEguLNnSKQAiuEWW2pGfuD0sZ1fDKoYB4g==
X-Received: by 2002:a2e:b890:: with SMTP id r16mr14137842ljp.300.1623063643538; 
 Mon, 07 Jun 2021 04:00:43 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id w4sm1807163ljo.1.2021.06.07.04.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 04:00:43 -0700 (PDT)
Date: Mon, 7 Jun 2021 14:00:31 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 02/21] drm: Add Plane Degamma Mode property
Message-ID: <20210607140031.3f70cc4e@eldfell>
In-Reply-To: <2154f1d1-2c86-ede7-4b23-acab93e3eb00@amd.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
 <20210601105218.29185-3-uma.shankar@intel.com>
 <2154f1d1-2c86-ede7-4b23-acab93e3eb00@amd.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UDaTTfq2ubvo/aAp1ib/nK2"; protocol="application/pgp-signature"
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sebastian Wick <sebastian@sebastianwick.net>,
 Uma Shankar <uma.shankar@intel.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/UDaTTfq2ubvo/aAp1ib/nK2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Jun 2021 14:24:28 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-06-01 6:51 a.m., Uma Shankar wrote:
> > Add Plane Degamma Mode as an enum property. Create a helper
> > function for all plane color management features.
> >=20
> > This is an enum property with values as blob_id's and exposes
> > the various gamma modes supported and the lut ranges. Getting
> > the blob id in userspace, user can get the mode supported and
> > also the range of gamma mode supported with number of lut
> > coefficients. It can then set one of the modes using this
> > enum property.
> >=20
> > Lut values will be sent through separate GAMMA_LUT blob property.
> >=20
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  Documentation/gpu/drm-kms.rst             | 90 ++++++++++++++++++++++
> >  drivers/gpu/drm/drm_atomic.c              |  1 +
> >  drivers/gpu/drm/drm_atomic_state_helper.c |  2 +
> >  drivers/gpu/drm/drm_atomic_uapi.c         |  4 +
> >  drivers/gpu/drm/drm_color_mgmt.c          | 93 ++++++++++++++++++++++-
> >  include/drm/drm_mode_object.h             |  2 +-
> >  include/drm/drm_plane.h                   | 23 ++++++
> >  7 files changed, 212 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.=
rst
> > index 87e5023e3f55..752be545e7d7 100644
> > --- a/Documentation/gpu/drm-kms.rst
> > +++ b/Documentation/gpu/drm-kms.rst
> > @@ -514,9 +514,99 @@ Damage Tracking Properties
> >  Color Management Properties
> >  ---------------------------
> > =20
> > +Below is how a typical hardware pipeline for color
> > +will look like:
> > +
> > +.. kernel-render:: DOT
> > +   :alt: Display Color Pipeline
> > +   :caption: Display Color Pipeline Overview
> > +
> > +   digraph "KMS" {
> > +      node [shape=3Dbox]
> > +
> > +      subgraph cluster_static {
> > +          style=3Ddashed
> > +          label=3D"Display Color Hardware Blocks"
> > +
> > +          node [bgcolor=3Dgrey style=3Dfilled]
> > +          "Plane Degamma A" -> "Plane CSC/CTM A"
> > +          "Plane CSC/CTM A" -> "Plane Gamma A"
> > +          "Pipe Blender" [color=3Dlightblue,style=3Dfilled, width=3D5.=
25, height=3D0.75];
> > +          "Plane Gamma A" -> "Pipe Blender"
> > +	  "Pipe Blender" -> "Pipe DeGamma"
> > +          "Pipe DeGamma" -> "Pipe CSC/CTM"
> > +          "Pipe CSC/CTM" -> "Pipe Gamma"
> > +          "Pipe Gamma" -> "Pipe Output"
> > +      }
> > + =20
>=20
> It might be worthwhile to also highlight the YCbCr coefficient matrix in =
the pipeline,
> between the FB and Plane degamma, i.e.
>   YCbCr coefficients > plane degamma > csc > ...
>=20
> One problem with this view is that not all HW will support all (or any) o=
f these
> CM blocks on all planes. For example, on AMD HW cursors are very differen=
t from
> other planes and don't really have full CM support.
>=20
> > +      subgraph cluster_static {
> > +          style=3Ddashed
> > +
> > +          node [shape=3Dbox]
> > +          "Plane Degamma B" -> "Plane CSC/CTM B"
> > +          "Plane CSC/CTM B" -> "Plane Gamma B"
> > +          "Plane Gamma B" -> "Pipe Blender"
> > +      }
> > +
> > +      subgraph cluster_static {
> > +          style=3Ddashed
> > +
> > +          node [shape=3Dbox]
> > +          "Plane Degamma C" -> "Plane CSC/CTM C"
> > +          "Plane CSC/CTM C" -> "Plane Gamma C"
> > +          "Plane Gamma C" -> "Pipe Blender"
> > +      }
> > +
> > +      subgraph cluster_fb {
> > +          style=3Ddashed
> > +          label=3D"RAM"
> > +
> > +          node [shape=3Dbox width=3D1.7 height=3D0.2]
> > +
> > +          "FB 1" -> "Plane Degamma A"
> > +          "FB 2" -> "Plane Degamma B"
> > +          "FB 3" -> "Plane Degamma C"
> > +      }
> > +   }
> > +
> > +In real world usecases,
> > +
> > +1. Plane Degamma can be used to linearize a non linear gamma
> > +encoded framebuffer. This is needed to do any linear math like
> > +color space conversion. For ex, linearize frames encoded in SRGB
> > +or by HDR curve.
> > +
> > +2. Later Plane CTM block can convert the content to some different
> > +colorspace. For ex, SRGB to BT2020 etc.
> > +
> > +3. Plane Gamma block can be used later to re-apply the non-linear
> > +curve. This can also be used to apply Tone Mapping for HDR usecases.
> > + =20
>=20
> This would mean you're blending in gamma space which is likely not what
> most compositors expect. There are numerous articles that describe why
> blending in gamma space is problematic, such as [1]
>=20
> [1] https://ninedegreesbelow.com/photography/linear-gamma-blur-normal-ble=
nd.html
>=20
> To blend in linear space this should be configured to do
>=20
>   Plane Degamma > Plane CTM > CRTC Gamma
>=20
> I think it would also be good if we moved away from calling this gamma. I=
t's
> really only gamma for legacy SDR scenarios. For HDR cases I would never e=
xpect
> these to use gamma and even though the sRGB transfer function is based on=
 gamma
> functions it's complicated [2].
>=20
> [2] https://en.wikipedia.org/wiki/SRGB
>=20
> A better way to describe these would be as "transfer function" and "inver=
se
> transfer function." The space at various stages could then be described a=
s linear
> or non-linear, specifically PQ, HLG, sRGB, BT709, or using another transf=
er
> function.

Hi,

incidentally, I, Sebastian and Vitaly are discussing on what to call
these pieces in Weston:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/582#note_947=
292

They might not even be the transfer functions but just some curves,
e.g. optimized to keep a 3D LUT small without sacrificing precision.


Thanks,
pq

> > +All the layers or framebuffers need to be converted to same color
> > +space and format before blending. The plane color hardware blocks
> > +can help with this. Once the Data is blended, similar color processing
> > +can be done on blended output using pipe color hardware blocks.
> > +
> > +DRM Properties have been created to define and expose all these
> > +hardware blocks to userspace. A userspace application (compositor
> > +or any color app) can use these interfaces and define policies to
> > +efficiently use the display hardware for such color operations.
> > +
> > +Pipe Color Management Properties
> > +---------------------------------
> > +
> >  .. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
> >     :doc: overview
> > =20
> > +Plane Color Management Properties
> > +---------------------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
> > +   :doc: Plane Color Properties
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
> > +   :doc: export
> > +
> >  Tile Group Property
> >  -------------------

--Sig_/UDaTTfq2ubvo/aAp1ib/nK2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmC9/E8ACgkQI1/ltBGq
qqd3vQ//UIYknHZNRLABlWUYNTRAdbhMWTTNxxyjv9tCCXTnJDKcZqL6mPIZkbgh
8Ud+AxY6XXJehlos+avtyuEYXl6/5NXpPhzEl97QSsmIKf2i3Us3/FK+iX7i8ebC
4hmD4y6VA7NE0Zt6IFz468wfiko6dpFMfzTfoj+e1FAn0otEnoxCgGqMSKkRTYMD
cc92uECRZHsEhk9HIzngrHCipg4/ga3Wsyfu12WIK9+/qTTfSXw67dpOgU5CRL1I
Hl/Xq038Sm3MAHiAX56VhJBlwMis/MqjiEpNn+GZV0wvLpWUwN2iJwSPx1lkP/qY
811x098Tf3cOaVwlr35u+OeoAtniXE8rQW8iBaxirNy9uvJ8mxjMnLSy8Gby5u0I
PTExfW31QGmnAyZhBg5gpm17HoSpRZ75Fk2re8h9fGca4x6anpbISeDL/PVm0Osm
KEK4r3b72mkisqfLPqvMTad7UN+Q4msFCwYIpqZRU85+8JZKiGh7FH9OgZI/eIla
EDJoQqGx7eH6QI6Vnv+lekaj5XSVrV9UE6DIYN6GVpbJ686E1N5eVF8nGGY/6rjL
2P9NhaKDg6GvGP32SgVPo5sfWmvlMr/jiEqi7xqFJuKv925P6pi0i/ALk7Krd0Ba
mX5uBPE/9fXdtjQUXCFdIGG14zSv4JYGs7CtXuk7IgBX0TEaSdo=
=DnyA
-----END PGP SIGNATURE-----

--Sig_/UDaTTfq2ubvo/aAp1ib/nK2--
