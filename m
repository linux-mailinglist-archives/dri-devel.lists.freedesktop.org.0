Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCAB8782CA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 16:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F54112AF7;
	Mon, 11 Mar 2024 15:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="N8GNVi4f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5334112AF7;
 Mon, 11 Mar 2024 15:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710169912;
 bh=O89uQE9KMTfx0GdpL3sx3EBxZNFGFV3vEOcsQ0lfMd4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=N8GNVi4fQhzX0s7Z5NmiaQDwV1HytgXi3/1CJPAdr6ZA33pjAsk+o4ZrUGG4mA+Fo
 28q6/P17+MJ7yZOivz2oeDS8bpx1Wh+AQ4fu2fr+eYdxFlHGJdfujJAf5LdhFU6s0B
 8tf7hqvWdBbixcbKIGaXoQZK9gqr+gYBskdq289Degbz/IWVsvWzKeYLfpOK7BihSZ
 IVeBPm1WDMWh0nAxtC5Png3JXwLG/v6M8ciw524guttTfVx1UaN0HbGIvWayFvuQYJ
 L5B0sxUmI0PvuV6BqiEw7hGQnwX1glGhHhWvv4+D5vQwny/8gjSddITDls2hrP8okc
 JN0ESKKDBB+9g==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 41EFF37813B6;
 Mon, 11 Mar 2024 15:11:52 +0000 (UTC)
Date: Mon, 11 Mar 2024 17:11:43 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <wayland-devel@lists.freedesktop.org>
Subject: Re: [RFC PATCH v4 08/42] drm/doc/rfc: Describe why prescriptive
 color pipeline is needed
Message-ID: <20240311171143.15fb02c0.pekka.paalanen@collabora.com>
In-Reply-To: <20240226211100.100108-9-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-9-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d0KzxibGqaenPueHknP8JgR";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/d0KzxibGqaenPueHknP8JgR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Feb 2024 16:10:22 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> v4:
>  - Drop IOCTL docs since we dropped the IOCTLs (Pekka)
>  - Clarify reading and setting of COLOR_PIPELINE prop (Pekka)
>  - Add blurb about not requiring to reject a pipeline due to
>    incompatible ops, as long as op can be bypassed (Pekka)
>  - Dropped informational strings (such as input CSC) as they're
>    not actually intended to be advertised (Pekka)
>=20
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
>  Documentation/gpu/rfc/color_pipeline.rst | 360 +++++++++++++++++++++++
>  1 file changed, 360 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>=20
> diff --git a/Documentation/gpu/rfc/color_pipeline.rst b/Documentation/gpu=
/rfc/color_pipeline.rst
> new file mode 100644
> index 000000000000..6c653e17054a
> --- /dev/null
> +++ b/Documentation/gpu/rfc/color_pipeline.rst
> @@ -0,0 +1,360 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Linux Color Pipeline API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +What problem are we solving?
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +We would like to support pre-, and post-blending complex color
> +transformations in display controller hardware in order to allow for
> +HW-supported HDR use-cases, as well as to provide support to
> +color-managed applications, such as video or image editors.
> +
> +It is possible to support an HDR output on HW supporting the Colorspace
> +and HDR Metadata drm_connector properties, but that requires the
> +compositor or application to render and compose the content into one
> +final buffer intended for display. Doing so is costly.
> +
> +Most modern display HW offers various 1D LUTs, 3D LUTs, matrices, and ot=
her
> +operations to support color transformations. These operations are often
> +implemented in fixed-function HW and therefore much more power efficient=
 than
> +performing similar operations via shaders or CPU.
> +
> +We would like to make use of this HW functionality to support complex co=
lor
> +transformations with no, or minimal CPU or shader load.
> +
> +
> +How are other OSes solving this problem?
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The most widely supported use-cases regard HDR content, whether video or
> +gaming.
> +
> +Most OSes will specify the source content format (color gamut, encoding =
transfer
> +function, and other metadata, such as max and average light levels) to a=
 driver.
> +Drivers will then program their fixed-function HW accordingly to map fro=
m a
> +source content buffer's space to a display's space.
> +
> +When fixed-function HW is not available the compositor will assemble a s=
hader to
> +ask the GPU to perform the transformation from the source content format=
 to the
> +display's format.
> +
> +A compositor's mapping function and a driver's mapping function are usua=
lly
> +entirely separate concepts. On OSes where a HW vendor has no insight into
> +closed-source compositor code such a vendor will tune their color manage=
ment
> +code to visually match the compositor's. On other OSes, where both mappi=
ng
> +functions are open to an implementer they will ensure both mappings matc=
h.
> +
> +This results in mapping algorithm lock-in, meaning that no-one alone can
> +experiment with or introduce new mapping algorithms and achieve
> +consistent results regardless of which implementation path is taken.
> +
> +Why is Linux different?
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Unlike other OSes, where there is one compositor for one or more drivers=
, on
> +Linux we have a many-to-many relationship. Many compositors; many driver=
s.
> +In addition each compositor vendor or community has their own view of how
> +color management should be done. This is what makes Linux so beautiful.
> +
> +This means that a HW vendor can now no longer tune their driver to one
> +compositor, as tuning it to one could make it look fairly different from
> +another compositor's color mapping.
> +
> +We need a better solution.
> +
> +
> +Descriptive API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +An API that describes the source and destination colorspaces is a descri=
ptive
> +API. It describes the input and output color spaces but does not describe
> +how precisely they should be mapped. Such a mapping includes many minute
> +design decision that can greatly affect the look of the final result.
> +
> +It is not feasible to describe such mapping with enough detail to ensure=
 the
> +same result from each implementation. In fact, these mappings are a very=
 active
> +research area.
> +
> +
> +Prescriptive API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A prescriptive API describes not the source and destination colorspaces.=
 It
> +instead prescribes a recipe for how to manipulate pixel values to arrive=
 at the
> +desired outcome.
> +
> +This recipe is generally an ordered list of straight-forward operations,
> +with clear mathematical definitions, such as 1D LUTs, 3D LUTs, matrices,
> +or other operations that can be described in a precise manner.
> +
> +
> +The Color Pipeline API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +HW color management pipelines can significantly differ between HW
> +vendors in terms of availability, ordering, and capabilities of HW
> +blocks. This makes a common definition of color management blocks and
> +their ordering nigh impossible. Instead we are defining an API that
> +allows user space to discover the HW capabilities in a generic manner,
> +agnostic of specific drivers and hardware.
> +
> +
> +drm_colorop Object
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +To support the definition of color pipelines we define the DRM core
> +object type drm_colorop. Individual drm_colorop objects will be chained
> +via the NEXT property of a drm_colorop to constitute a color pipeline.
> +Each drm_colorop object is unique, i.e., even if multiple color
> +pipelines have the same operation they won't share the same drm_colorop
> +object to describe that operation.
> +
> +Note that drivers are not expected to map drm_colorop objects statically
> +to specific HW blocks. The mapping of drm_colorop objects is entirely a
> +driver-internal detail and can be as dynamic or static as a driver needs
> +it to be. See more in the Driver Implementation Guide section below.
> +
> +Each drm_colorop has three core properties:
> +
> +TYPE: An enumeration property, definint the type of transformation, such=
 as

typo: definint

> +* enumerated curve
> +* custom (uniform) 1D LUT
> +* 3x3 matrix
> +* 3x4 matrix
> +* 3D LUT
> +* etc.
> +
> +Depending on the type of transformation other properties will describe
> +more details.
> +
> +BYPASS: A boolean property that can be used to easily put a block into
> +bypass mode. While setting other properties might fail atomic check,
> +setting the BYPASS property to true should never fail. The BYPASS
> +property is not mandatory for a colorop, as long as the entire pipeline
> +can get bypassed by setting the COLOR_PIPELINE on a plane to '0'.
> +
> +NEXT: The ID of the next drm_colorop in a color pipeline, or 0 if this
> +drm_colorop is the last in the chain.
> +
> +An example of a drm_colorop object might look like one of these::
> +
> +    /* 1D enumerated curve */
> +    Color operation 42
> +    =E2=94=9C=E2=94=80 "TYPE": immutable enum {1D enumerated curve, 1D L=
UT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} =3D 1D enumerated curve

Since this is an immutable enum, does it really need to list all the
possible values it will never have?

Internally DRM would have the complete list, but KMS tends to not
expose enum values that cannot be picked.

> +    =E2=94=9C=E2=94=80 "BYPASS": bool {true, false}
> +    =E2=94=9C=E2=94=80 "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EO=
TF, PQ EOTF, PQ inverse EOTF, =E2=80=A6}

A better name for "sRGB EOTF" would be "power 2.2", referring to a
power function with exponent 2.2. I know these are just examples, but
maybe giving an example of something that looks obvious but won't
actually exist should be avoided.

> +    =E2=94=94=E2=94=80 "NEXT": immutable color operation ID =3D 43
> +
> +    /* custom 4k entry 1D LUT */
> +    Color operation 52
> +    =E2=94=9C=E2=94=80 "TYPE": immutable enum {1D enumerated curve, 1D L=
UT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} =3D 1D LUT
> +    =E2=94=9C=E2=94=80 "BYPASS": bool {true, false}
> +    =E2=94=9C=E2=94=80 "LUT_1D_SIZE": immutable range =3D 4096
> +    =E2=94=9C=E2=94=80 "LUT_1D": blob
> +    =E2=94=94=E2=94=80 "NEXT": immutable color operation ID =3D 0
> +
> +    /* 17^3 3D LUT */
> +    Color operation 72
> +    =E2=94=9C=E2=94=80 "TYPE": immutable enum {1D enumerated curve, 1D L=
UT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} =3D 3D LUT
> +    =E2=94=9C=E2=94=80 "BYPASS": bool {true, false}
> +    =E2=94=9C=E2=94=80 "LUT_3D_SIZE": immutable range =3D 17
> +    =E2=94=9C=E2=94=80 "LUT_3D": blob
> +    =E2=94=94=E2=94=80 "NEXT": immutable color operation ID =3D 73
> +
> +
> +COLOR_PIPELINE Plane Property
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +Color Pipelines are created by a driver and advertised via a new
> +COLOR_PIPELINE enum property on each plane. Values of the property
> +always include object id 0, which is the default and means all color
> +processing is disabled. Additional values will be the object IDs of the

maybe "all color processing is pass-through"?

"Disabled" could read as "nothing comes through".

> +first drm_colorop in a pipeline. A driver can create and advertise none,
> +one, or more possible color pipelines. A DRM client will select a color
> +pipeline by setting the COLOR PIPELINE to the respective value.
> +
> +NOTE: Many DRM clients will set enumeration properties via the string
> +value, often hard-coding it. Since this enumeration is generated based
> +on the colorop object IDs it is important to perform the Color Pipeline
> +Discovery, described below, instead of hard-coding color pipeline
> +assignment. Drivers might generate the enum strings dynamically.
> +Hard-coded strings might only work for specific drivers on a specific
> +pieces of HW. Color Pipeline Discovery can work universally, as long as
> +drivers implement the required color operations.

Yes!

Should there be rules about the string names for drivers? Can any
driver pick anything, even if it conflicts with a different kind of
pipeline?

> +
> +The COLOR_PIPELINE property is only exposed when the
> +DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set. Drivers shall ignore any
> +existing pre-blend color operations when this cap is set, such as
> +COLOR_RANGE and COLOR_ENCODING. If drivers want to support COLOR_RANGE
> +or COLOR_ENCODING functionality when the color pipeline client cap is
> +set, they are expected to expose colorops in the pipeline to allow for
> +the appropriate color transformation.

I see it's called plane color pipeline, so I presume there will be
another cap for post-blending pipelines. Ok.

> +
> +Setting of the COLOR_PIPELINE plane property or drm_colorop properties
> +is only allowed for userspace that sets this client cap.
> +
> +An example of a COLOR_PIPELINE property on a plane might look like this::
> +
> +    Plane 10
> +    =E2=94=9C=E2=94=80 "TYPE": immutable enum {Overlay, Primary, Cursor}=
 =3D Primary
> +    =E2=94=9C=E2=94=80 =E2=80=A6
> +    =E2=94=94=E2=94=80 "COLOR_PIPELINE": enum {0, 42, 52} =3D 0
> +
> +
> +Color Pipeline Discovery
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A DRM client wanting color management on a drm_plane will:
> +
> +1. Get the COLOR_PIPELINE property of the plane
> +2. iterate all COLOR_PIPELINE enum values
> +3. for each enum value walk the color pipeline (via the NEXT pointers)
> +   and see if the available color operations are suitable for the
> +   desired color management operations
> +
> +If userspace encounters an unknown or unsuitable color operation during
> +discovery it does not need to reject the entire color pipeline outright,
> +as long as the unknown or unsuitable colorop has a "BYPASS" property.
> +Drivers will ensure that a bypassed block does not have any effect.
> +
> +An example of chained properties to define an AMD pre-blending color
> +pipeline might look like this::
> +
> +    Plane 10
> +    =E2=94=9C=E2=94=80 "TYPE" (immutable) =3D Primary
> +    =E2=94=94=E2=94=80 "COLOR_PIPELINE": enum {0, 44} =3D 0
> +
> +    Color operation 44
> +    =E2=94=9C=E2=94=80 "TYPE" (immutable) =3D 1D enumerated curve
> +    =E2=94=9C=E2=94=80 "BYPASS": bool
> +    =E2=94=9C=E2=94=80 "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} =3D sR=
GB EOTF
> +    =E2=94=94=E2=94=80 "NEXT" (immutable) =3D 45
> +
> +    Color operation 45
> +    =E2=94=9C=E2=94=80 "TYPE" (immutable) =3D 3x4 Matrix
> +    =E2=94=9C=E2=94=80 "BYPASS": bool
> +    =E2=94=9C=E2=94=80 "MATRIX_3_4": blob
> +    =E2=94=94=E2=94=80 "NEXT" (immutable) =3D 46
> +
> +    Color operation 46
> +    =E2=94=9C=E2=94=80 "TYPE" (immutable) =3D 1D enumerated curve
> +    =E2=94=9C=E2=94=80 "BYPASS": bool
> +    =E2=94=9C=E2=94=80 "CURVE_1D_TYPE": enum {sRGB Inverse EOTF, PQ Inve=
rse EOTF} =3D sRGB EOTF

Current value is illegal. ;-)

> +    =E2=94=94=E2=94=80 "NEXT" (immutable) =3D 47
> +
> +    Color operation 47
> +    =E2=94=9C=E2=94=80 "TYPE" (immutable) =3D 1D LUT
> +    =E2=94=9C=E2=94=80 "LUT_1D_SIZE": immutable range =3D 4096
> +    =E2=94=9C=E2=94=80 "LUT_1D_DATA": blob
> +    =E2=94=94=E2=94=80 "NEXT" (immutable) =3D 48
> +
> +    Color operation 48
> +    =E2=94=9C=E2=94=80 "TYPE" (immutable) =3D 3D LUT

I see these LUT things do not have BYPASS. They probably should, even
if it is equivalent to setting the data blob to 0.

> +    =E2=94=9C=E2=94=80 "LUT_3D_SIZE" (immutable) =3D 17
> +    =E2=94=9C=E2=94=80 "LUT_3D_DATA": blob
> +    =E2=94=94=E2=94=80 "NEXT" (immutable) =3D 49
> +
> +    Color operation 49
> +    =E2=94=9C=E2=94=80 "TYPE" (immutable) =3D 1D enumerated curve
> +    =E2=94=9C=E2=94=80 "BYPASS": bool
> +    =E2=94=9C=E2=94=80 "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} =3D sR=
GB EOTF
> +    =E2=94=94=E2=94=80 "NEXT" (immutable) =3D 0
> +
> +
> +Color Pipeline Programming
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +Once a DRM client has found a suitable pipeline it will:
> +
> +1. Set the COLOR_PIPELINE enum value to the one pointing at the first
> +   drm_colorop object of the desired pipeline
> +2. Set the properties for all drm_colorop objects in the pipeline to the
> +   desired values, setting BYPASS to true for unused drm_colorop blocks,
> +   and false for enabled drm_colorop blocks
> +3. Perform (TEST_ONLY or not) atomic commit with all the other KMS
> +   states it wishes to change
> +
> +To configure the pipeline for an HDR10 PQ plane and blending in linear
> +space, a compositor might perform an atomic commit with the following
> +property values::
> +
> +    Plane 10
> +    =E2=94=94=E2=94=80 "COLOR_PIPELINE" =3D 42
> +
> +    Color operation 42
> +    =E2=94=94=E2=94=80 "BYPASS" =3D true
> +
> +    Color operation 44
> +    =E2=94=94=E2=94=80 "BYPASS" =3D true
> +
> +    Color operation 45
> +    =E2=94=94=E2=94=80 "BYPASS" =3D true
> +
> +    Color operation 46
> +    =E2=94=94=E2=94=80 "BYPASS" =3D true
> +
> +    Color operation 47
> +    =E2=94=9C=E2=94=80 "LUT_3D_DATA" =3D Gamut mapping + tone mapping + =
night mode
> +    =E2=94=94=E2=94=80 "BYPASS" =3D false
> +
> +    Color operation 48
> +    =E2=94=9C=E2=94=80 "CURVE_1D_TYPE" =3D PQ EOTF
> +    =E2=94=94=E2=94=80 "BYPASS" =3D false
> +
> +
> +Driver Implementer's Guide
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +What does this all mean for driver implementations? As noted above the
> +colorops can map to HW directly but don't need to do so. Here are some
> +suggestions on how to think about creating your color pipelines:
> +
> +- Try to expose pipelines that use already defined colorops, even if
> +  your hardware pipeline is split differently. This allows existing
> +  userspace to immediately take advantage of the hardware.
> +
> +- Additionally, try to expose your actual hardware blocks as colorops.

...colorops in additional pipelines.

Especially if exposing hw-specific blocks together with generic blocks
in the same pipeline would result in the possibility of unsupported
combinations.

Maybe there should be a general rule, that it must be possible to
enable all colorops in the same pipeline simultaneously?

> +  Define new colorop types where you believe it can offer significant
> +  benefits if userspace learns to program them.
> +
> +- Avoid defining new colorops for compound operations with very narrow
> +  scope. If you have a hardware block for a special operation that
> +  cannot be split further, you can expose that as a new colorop type.
> +  However, try to not define colorops for "use cases", especially if
> +  they require you to combine multiple hardware blocks.
> +
> +- Design new colorops as prescriptive, not descriptive; by the
> +  mathematical formula, not by the assumed input and output.
> +
> +A defined colorop type must be deterministic. The exact behavior of the
> +colorop must be documented entirely, whether via a mathematical formula
> +or some other description. Its operation can depend only on its
> +properties and input and nothing else, allowed error tolerance
> +notwithstanding.
> +
> +
> +Driver Forward/Backward Compatibility
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +As this is uAPI drivers can't regress color pipelines that have been
> +introduced for a given HW generation. New HW generations are free to
> +abandon color pipelines advertised for previous generations.
> +Nevertheless, it can be beneficial to carry support for existing color
> +pipelines forward as those will likely already have support in DRM
> +clients.
> +
> +Introducing new colorops to a pipeline is fine, as long as they can be
> +bypassed or are purely informational. DRM clients implementing support
> +for the pipeline can always skip unknown properties as long as they can
> +be confident that doing so will not cause unexpected results.
> +
> +If a new colorop doesn't fall into one of the above categories
> +(bypassable or informational) the modified pipeline would be unusable
> +for user space. In this case a new pipeline should be defined.
> +
> +
> +References
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD=
5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=3D=
@emersion.fr/
> \ No newline at end of file

All in all, I think this is good enough to have my

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

in spite of the comments I had. They are just fine tuning.


Thanks,
pq

--Sig_/d0KzxibGqaenPueHknP8JgR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXvHy8ACgkQI1/ltBGq
qqdmrA//apBMQG4NJuCZ6xO4Y8HojNB6aZwAk+W4a3uVPsUXLoxLjJhu4S/J2sMj
wj+yVmiUNiOI4Kr9IjM/WpWJR/AQ+8guWK020+mJKIS4NxeGfFOC870XQaIFUc5+
h9rctkkGG01QIXKDMsHc6FdgRbI/4z8cZrXOhL38XhTvg7zQIourS2Wuj/8GR0kW
PAwKQA+Bex99kDmFu0v8L+BBwE0leYCHpX93bSgR3iIe+bCZt0FIgE7BIj4oLBGP
hKDCwrTkpA5b+b6ehVLPykfZprZSOtCpHMrsjzbG8XDhuZpbHM26lfyJj4v1i5PA
/xoSXEO8oozB3fie/bUWIHbn24lBHlRXT9xOYbPVI9pVZo+RUcc+zvYEzQaLP4uk
v/mFrHaalFrxNbR8hEQYBVvTSzVsHpQ2HQG+KwhmtgTVOS0dkKYziyxh1pkKyD5Y
n9b0dzooZD2iGokXd8rNtJziHcLJzxeT9LBly2h8dodH4JA2a1vw41KxQaPeaINx
Y+eImeM9QeO/o7KKBR7dEkmV81pFccARpH8t5j80DjcHtifLNmyn9t2M/YRaXXqG
3x8YB40jGeNkUBQi04ESnwVn4Cry7tTYEpTSvfvIhLum7QanKboNBvQI0jGWwdod
pH5t/j/2xsbUArojZF61VIAzSiVP5FM/tt47k/VxTl/x9B8QrX0=
=RWsx
-----END PGP SIGNATURE-----

--Sig_/d0KzxibGqaenPueHknP8JgR--
