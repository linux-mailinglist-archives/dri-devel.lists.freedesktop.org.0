Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D2E36C7F6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 16:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8D96E2B8;
	Tue, 27 Apr 2021 14:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32166E2B8;
 Tue, 27 Apr 2021 14:50:13 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id u20so68486214lja.13;
 Tue, 27 Apr 2021 07:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=EX6p+UaEJc6LTy2VhcoP2k1egM9Ko3885KQg+/YJn6U=;
 b=V7Pqt5hryFiwxw8cXs9O/aviIb9G83eUNN6ytKqrHf8dZnKbOf4ailQFibi+NOUsaz
 tkSfCwd0j1Z+zGAxXzD+uIn5runECzkCRr93MiV2vMak97o8JHhAtvGeEBlYppAWhubR
 8cIdlcmUL0cc2UzJ3aTQXgTx0TFU9gSyi7eAiWkJLkLiXZ3S3LKxGDPp8CFbfE+Gdbfb
 2gRtpyypgb6lFZUAk+P2rKJ9dzKH1gpy0ka5oGFMn7mPjW1gb4ndAdPifn9IPMXQnhMd
 gOsVfP4XCV/jcQVQMvmL/QpHxaLauIpHJhfusIOht4VfEKWiNnVmzXf1aFe84jg/KyRf
 /woA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=EX6p+UaEJc6LTy2VhcoP2k1egM9Ko3885KQg+/YJn6U=;
 b=CXrk3n9FP34+jdZusxwLl7BgN+yL5aDq8sGZFkucvhlaUXXj02kcSNt7atuCneUyUg
 xecxySO6kLjMOOBGKm3RKAtv/3ss7adVQVFHpTjyifjc0Blhvdv39WR3pnUvHUmsgtUu
 ebRtOVMm5NsIHH7MLjvY+zpS3KpO8gRksbPPGz8+ERl4ILA4lvYZuX8qxnP5KvPW5ZIQ
 c+S2cQ4mcyo/Em34trUmZsQ+GBKIAyDOJo/TFA9w1Kw9iNEHFORIeJhlpcxYZg7fXPxz
 wNmxxTsrFCfU8F50NKMnp9E1XYVL7bv6PRE7L3FeXL1AToKjUg9HXLj+pd+tX3Q8AJwV
 d3XQ==
X-Gm-Message-State: AOAM530MZLYT/Fp3USzaDAQdMMoxCK4Mzfr6Pvc2YrtMm600FErA92bk
 x153H1WfIRGRcLUxWHef0qE=
X-Google-Smtp-Source: ABdhPJwRZwdAXEJ7/LcORcvgJ5RWJSRNlMq68NDpopLEu7KjyUG0S35zg+VPlRKDgc4HNN5IGxDQWA==
X-Received: by 2002:a2e:88c1:: with SMTP id a1mr14644716ljk.253.1619535011828; 
 Tue, 27 Apr 2021 07:50:11 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id n8sm28253lfe.285.2021.04.27.07.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 07:50:11 -0700 (PDT)
Date: Tue, 27 Apr 2021 17:50:05 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 0/3] A drm_plane API to support HDR planes
Message-ID: <20210427175005.5b92badc@eldfell>
In-Reply-To: <20210426173852.484368-1-harry.wentland@amd.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Shashank.Sharma@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 sebastian@sebastianwick.net, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com,
 Bhawanpreet.Lakha@amd.com, Nicholas.Kazlauskas@amd.com, Vitaly.Prosyak@amd.com
Content-Type: multipart/mixed; boundary="===============1693009959=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1693009959==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PwenWCvv0_DSkbbNXI+n.zM"; protocol="application/pgp-signature"

--Sig_/PwenWCvv0_DSkbbNXI+n.zM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Apr 2021 13:38:49 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> ## Introduction
>=20
> We are looking to enable HDR support for a couple of single-plane and
> multi-plane scenarios. To do this effectively we recommend new
> interfaces to drm_plane. Below I'll give a bit of background on HDR
> and why we propose these interfaces.
>=20
>=20
> ## Defining a pixel's luminance
>=20
> Currently the luminance space of pixels in a framebuffer/plane
> presented to the display is not well defined. It's usually assumed to
> be in a 2.2 or 2.4 gamma space and has no mapping to an absolute
> luminance value but is interpreted in relative terms.
>=20
> Luminance can be measured and described in absolute terms as candela
> per meter squared, or cd/m2, or nits. Even though a pixel value can
> be mapped to luminance in a linear fashion to do so without losing a
> lot of detail requires 16-bpc color depth. The reason for this is
> that human perception can distinguish roughly between a 0.5-1%
> luminance delta. A linear representation is suboptimal, wasting
> precision in the highlights and losing precision in the shadows.
>=20
> A gamma curve is a decent approximation to a human's perception of
> luminance, but the PQ (perceptual quantizer) function [1] improves on
> it. It also defines the luminance values in absolute terms, with the
> highest value being 10,000 nits and the lowest 0.0005 nits.
>=20
> Using a content that's defined in PQ space we can approximate the
> real world in a much better way.
>=20
> Here are some examples of real-life objects and their approximate
> luminance values:
>=20
> | Object            | Luminance in nits |
> | ----------------- | ----------------- |
> | Sun               | 1.6 million       |
> | Fluorescent light | 10,000            |
> | Highlights        | 1,000 - sunlight  |
> | White Objects     | 250 - 1,000       |
> | Typical objects   | 1 - 250           |
> | Shadows           | 0.01 - 1          |
> | Ultra Blacks      | 0 - 0.0005        |
>=20
>=20
> ## Describing the luminance space
>=20
> **We propose a new drm_plane property to describe the Eletro-Optical
> Transfer Function (EOTF) with which its framebuffer was composed.**
> Examples of EOTF are:
>=20
> | EOTF      | Description                                                =
               |
> | --------- |:-----------------------------------------------------------=
-------------- |
> | Gamma 2.2 | a simple 2.2 gamma                                         =
               |
> | sRGB      | 2.4 gamma with small initial linear section                =
               |
> | PQ 2084   | SMPTE ST 2084; used for HDR video and allows for up to 10,0=
00 nit support |
> | Linear    | Linear relationship between pixel value and luminance value=
               |
>=20

The definitions agree with what I have learnt so far. However, with
these EOTF definitions, only PQ defines absolute luminance values
while the others do not. So this is not enough information to blend
planes together if they do not all use the same EOTF with the same
dynamic range. More below.


>=20
> ## Mastering Luminances
>=20
> Now we are able to use the PQ 2084 EOTF to define the luminance of
> pixels in absolute terms. Unfortunately we're again presented with
> physical limitations of the display technologies on the market today.
> Here are a few examples of luminance ranges of displays.
>=20
> | Display                  | Luminance range in nits |
> | ------------------------ | ----------------------- |
> | Typical PC display       | 0.3 - 200               |
> | Excellent LCD HDTV       | 0.3 - 400               |
> | HDR LCD w/ local dimming | 0.05 - 1,500            |
>=20
> Since no display can currently show the full 0.0005 to 10,000 nits
> luminance range the display will need to tonemap the HDR content, i.e
> to fit the content within a display's capabilities. To assist with
> tonemapping HDR content is usually accompanied with a metadata that
> describes (among other things) the minimum and maximum mastering
> luminance, i.e. the maximum and minimum luminance of the display that
> was used to master the HDR content.
>=20
> The HDR metadata is currently defined on the drm_connector via the
> hdr_output_metadata blob property.
>=20
> It might be useful to define per-plane hdr metadata, as different
> planes might have been mastered differently.

I don't think this would directly help with the dynamic range blending
problem. You still need to establish the mapping between the optical
values from two different EOTFs and dynamic ranges. Or can you know
which optical values match the mastering display maximum and minimum
luminances for not-PQ?


> ## SDR Luminance
>=20
> Since SDR covers a smaller luminance range than HDR, an SDR plane
> might look dark when blended with HDR content. Since the max HDR
> luminance can be quite variable (200-1,500 nits on actual displays)
> it is best to make the SDR maximum luminance value configurable.
>=20
> **We propose a drm_plane property to specfy the desired maximum
> luminance of the SDR plane in nits.** This allows us to map the SDR
> content predictably into HDR's absolute luminance space.

What would be the mapping? Simple linear scaling? A more complicated
tone mapping?

Rather than "SDR luminance", do you perhaps intend this to configure
the dynamic range of the non-absolute-luminance EOTFs?
In that case maybe you'd need a black luminance level too?


> ## Let There Be Color
>=20
> So far we've only talked about luminance, ignoring colors altogether.
> Just like in the luminance space, traditionally the color space of
> display outputs has not been well defined. Similar to how an EOTF
> defines a mapping of pixel data to an absolute luminance value, the
> color space maps color information for each pixel onto the CIE 1931
> chromaticity space. This can be thought of as a mapping to an
> absolute, real-life, color value.
>=20
> A color space is defined by its primaries and white point. The
> primaries and white point are expressed as coordinates in the CIE
> 1931 color space. Think of the red primary as the reddest red that
> can be displayed within the color space. Same for green and blue.
>=20
> Examples of color spaces are:
>=20
> | Color Space | Description                                |
> | ----------- | ------------------------------------------ |
> | BT 601      | similar to BT 709                          |
> | BT 709      | used by sRGB content; ~53% of BT 2020      |
> | DCI-P3      | used by most HDR displays; ~72% of BT 2020 |
> | BT 2020     | standard for most HDR content              |
>=20
> The color space is defined in DRM for YCbCr planes via the
> color_encoding property of the drm_plane.=20

I don't think that is quite right.

As far I understand, COLOR_ENCODING property controls which matrix is
used to convert from YCbCr to RGB, but that is all it does. It is not
used for the actual color space. So while these BT standards do
specify the chromaticities, they also specify the YCbCr encoding which
is the part used in this property.

YCbCr and RGB are color models. They are not color spaces. RGB is an
additive color model while YCbCr is not, AFAIU. Blending requires an
additive color model and linear luminance encoding.

You need two color space definitions to create one color space
transformation: source color space and destination color space. You
also need an idea *how* the two color spaces should be mapped, which is
called "rendering intent". You can't do anything with just one color
space definition, except to pass it on along with the pixels.

To be able to blend planes together, all planes need to be converted to
the same color space first: the blending color space, whatever you
choose it to be. I do not see where KMS would do this color space
conversion, or where it would get the definition of the blending color
space.

> **We propose to add definitions for the RGB variants of the BT color
> spaces.**

Therefore I'm not sure this makes sense.


> ## Color Primaries and White Point
>=20
> Just like displays can currently not represent the entire 0.0005 -
> 10,000 nits HDR range of the PQ 2084 EOTF, they are currently not
> capable of representing the entire BT.2020 color Gamut. For this
> reason video content will often specify the color primaries and white
> point used to master the video, in order to allow displays to be able
> to map the image as best as possible onto the display's gamut.
>=20
>=20
> ## Displays and Tonemapping
>=20
> External displays are able to do their own tone and color mapping,
> based on the mastering luminance, color primaries, and white space
> defined in the HDR metadata.
>=20
> Internal panels (which are currently few and far between) usually
> don't include the complex HW to do tone and color mapping on their
> own and will require the display driver to perform appropriate
> mapping.

FWIW, when designing Weston's color management, we are aiming for
the latter "simple" panels foremost, because that gives us full control
of all color conversions and tone mappings.

OTOH, if Weston has to present to a display which only accepts e.g.
BT.2020/PQ signal, the display might always mangle the image in
unexpected ways. Therefore I expect that by default Weston will do
everything it can to try to make the display not apply anything magic
image enhancement: trust that EDID description of the display gamut and
dynamic range are correct, and use HDR metadata to tell the display
that those values are exactly what we are using. And we use them.

IMO, a display doing its tone mapping magically is only useful when you
want to be able to use "simple" playback devices that cannot adapt to
the display they are driving. Magic tone mapping is also a way for
hardware vendors to differentiate, which from the color management
perspective is harmful as it makes it more difficult or impossible to
predict the display behaviour or to keep it consistent.

So there are two opposing goals:

- Traditional color management wants absolute control of the display,
  leaving nothing unpredictable and preferably also nothing undefined.
  Undefined behaviour can always be measured (profiled) which makes it
  predictable and known. The viewing environment is controlled and
  constant.

- Entertainment wants the most visually impressive image quality by
  dynamically adapting to both displayed content and to the viewing
  environment conditions.

> ## Pixel Formats
>=20
> The pixel formats, such as ARGB8888, ARGB2101010, P010, or FP16 are
> unrelated to color space and EOTF definitions. HDR pixels can be
> formatted in different ways but in order to not lose precision HDR
> content requires at least 10 bpc precision. For this reason
> ARGB2101010, P010, and FP16 are the obvious candidates for HDR.
> ARGB2101010 and P010 have the advantage of requiring only half the
> bandwidth as FP16, while FP16 has the advantage of enough precision
> to operate in a linear space, i.e. without EOTF.

Right.

> ## Proposed use-cases
>=20
> Although the userspace side of this work is still in the early stages
> it is clear that we will want to support the following two use-cases:
>=20
> **One XRGB2101010 HDR Plane:** A single, composited plane of HDR
> content. The use-case is a video player on a desktop with the
> compositor owning the composition of SDR and HDR content. The content
> shall be PQ BT.2020 formatted. The drm_connector's
> hdr_output_metadata shall be set.

This use case is already possible, right?

> **One ARGB8888 SDR Plane + One P010 HDR Plane:** A normal 8bpc
> desktop plane, with a P010 HDR video plane underlayed. The HDR plane
> shall be PQ BT.2020 formatted. The desktop plane shall specify an SDR
> boost value. The drm_connector's hdr_output_metadata shall be set.

This use case requires blending in KMS, so is the primary goal I
suppose.

> **One XRGB8888 SDR Plane - HDR output:** In order to support a smooth
> transition we recommend an OS that supports HDR output to provide the
> hdr_output_metadata on the drm_connector to configure the output for
> HDR, even when the content is only SDR. This will allow for a smooth
> transition between SDR-only and HDR content. In this use-case the SDR
> max luminance value should be provided on the drm_plane.

I think this might be already possible by crafting a CRTC GAMMA LUT? Not
sure about precision.

> In DCN we will de-PQ or de-Gamma all input in order to blend in
> linear space. For SDR content we will also apply any desired boost
> before blending. After blending we will then re-apply the PQ EOTF and
> do RGB to YCbCr conversion if needed.

This assumes the same color space over everything.

>=20
> ## Summary of proposed interface changes
>=20
> per drm_plane:
> - new RGB color space definitions, mirroring the existing YUV color
> space definitions
> - new transfer function property
> - new SDR maximum white level property

How will these new KMS properties interact with per-plane DEGAMMA, CTM
and/or GAMMA properties?

Why go with your proposal instead of per-plane CTM and LUT?

I think the ideal KMS pipeline for me, assuming I cannot have 3D LUTs
both per-plane and on CRTC, would be:

plane:
	FB -> M1 -> LUT1 -> M2 -> blending input

CRTC:
	blending output -> LUT2 -> M3 -> connector

FB: framebuffer
M1: matrix transform, capable of converting e.g. YCbCr to RGB
LUT1: 1D LUT for content EOTF, to produce light-linear RGB
M2: matrix transform for color space transformation

LUT2: 1D LUT for applying monitor EOTF^-1
M3: matrix transform, e.g. if you need to push YCbCr on the connector

We also need to know where and how clipping happens.

I think this scheme would allow implementing everything you want, and
it would not be tied to rigid enumerations, and it won't have any
magical conversions done under the hood as you would need to do to
convert from one enum space to another. It leaves the render intent to
be defined by the userspace compositor, rather than building a fixed
policy in the kernel.

Userspace would be setting transformation operators, not color spaces,
to the kernel, allowing the blending space to be chosen by userspace.
In Weston we aim to choose then blending color space to be the same as
the output color space, except in optical (linear) encoding. The output
color space can be non-standard, e.g. measured with a display profiler
equipment.

I would expect gamut mapping, dynamic range mapping and tone mapping to
be places where most experimentation and innovation happens, so
implementing them in the kernel with just few or no controllable
parameters at this time seems like it could become useless fast.


Thanks,
pq

> ## References
>=20
> [1]
> https://en.wikipedia.org/wiki/High-dynamic-range_video#Perceptual_Quantiz=
er
>=20
>=20
> ## Further Reading
>=20
> https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unsta=
ble/color-management/color.rst
> http://downloads.bbc.co.uk/rd/pubs/whp/whp-pdf-files/WHP309.pdf
> https://app.spectracal.com/Documents/White%20Papers/HDR_Demystified.pdf
>=20
>=20
> Bhawanpreet Lakha (3):
>   drm/color: Add RGB Color encodings
>   drm/color: Add Color transfer functions for HDR/SDR
>   drm/color: Add sdr boost property
>=20
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
>  .../gpu/drm/arm/display/komeda/komeda_plane.c |  4 +-
>  drivers/gpu/drm/arm/malidp_planes.c           |  4 +-
>  drivers/gpu/drm/armada/armada_overlay.c       |  4 +-
>  drivers/gpu/drm/drm_atomic_uapi.c             |  8 ++
>  drivers/gpu/drm/drm_color_mgmt.c              | 84
> +++++++++++++++++-- drivers/gpu/drm/i915/display/intel_sprite.c   |
> 4 +- .../drm/i915/display/skl_universal_plane.c    |  4 +-
>  drivers/gpu/drm/nouveau/dispnv04/overlay.c    |  4 +-
>  drivers/gpu/drm/omapdrm/omap_plane.c          |  4 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  4 +-
>  drivers/gpu/drm/tidss/tidss_plane.c           |  6 +-
>  include/drm/drm_color_mgmt.h                  | 25 +++++-
>  include/drm/drm_plane.h                       | 30 +++++++
>  14 files changed, 173 insertions(+), 16 deletions(-)
>=20


--Sig_/PwenWCvv0_DSkbbNXI+n.zM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCIJJ0ACgkQI1/ltBGq
qqdSAQ/9Ejg2gP/hFGRl3FmUb0Lud61JLn3hDoUfZUG3C7zpXucjJ5+vkE3QYxOZ
bbUwwp9D9BZ4wXdS0FTmo8jWDnSZm7QKUrnOLqM9iDWiAcrAd0rRrBzEK+nkpv6I
0dM7WPXX5mHgEFUdu+aWyVcWwEwUaDGku4gEhIohBgetjdwFKLOBk6reXEv/qtfH
gIy5UOU9BntxS7naV26fG8Ru+e3tgTvBvPgx0epRJdC1w3+sVNMg+nCqNFB5YsQu
EsaH9vWhtIj778d6XyZMkj/sRXjAe4WeS/eBS2V/0XggJmy9ihgsxEaqfa0W9QRr
KJJSBLPqNy+E8N3HN5QlGtrzXouKsSsnsjeLmPZFQd0SC1OLVqS7CSslS9paaeVM
VdD1yAN8obSfk+dF/NHcV0oKoR7jKXwz49qRQoyBn/XM/ayOpMLx2za0EjVU/Hi6
tjQWTQVZ+UGtvPz4dIWdPMAoRb+iJIV82JgmVx4Sg0k+MXOl2epiCfItkvjFrPyp
/VOCmh0Stj3jIIyfoUvQzItP5ry8gzVsRsRWWBkpjgXRltJ/PkNOSz4eIje/cq7X
qF/oHL5Wk9XuIxUlSd4hNwqVxwavyNawjqx8Vlq9SehijA7V83PlJt0cMGHoA5Po
aGdJ42lH6G6kYu1ectKwY1XJM0s1Z4/aHpIi6lrJakwJauf4Kv8=
=QER3
-----END PGP SIGNATURE-----

--Sig_/PwenWCvv0_DSkbbNXI+n.zM--

--===============1693009959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1693009959==--
