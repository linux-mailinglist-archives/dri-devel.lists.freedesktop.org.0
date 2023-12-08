Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1846F80A209
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 12:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4132B10EA64;
	Fri,  8 Dec 2023 11:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24D510EA64;
 Fri,  8 Dec 2023 11:20:24 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c9f572c4c5so27886881fa.2; 
 Fri, 08 Dec 2023 03:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702034423; x=1702639223; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=8joaWTXUFCp5AADWLpS1PdTyOKJegeW+aUOSlsKB54E=;
 b=A3IVB344C6219RhBso1z5jkAij3149ZK0jQeMPnVqJ1R1O7VDnA7HO0flHzdKF0e5Q
 xCD/xsoIw5ZTXad4X/b0EWdGy2FRaVyJTR9YpNgk4oC4WbdnlBlU67r0o1usCNzAm3Yl
 UAJZL6SD+i/gLieNqr4qB1cGwELnJjVhTfbentOlVaIWgjaT6BSi6QRp2+N5M4G9+/Fi
 2qvhX3/NKMQMTHGDqdtAcKCkRT/2pHbe3HNoYhWUDt+7v4OA8B48T2cq1CU1pJg4V6W7
 CVfHF2NEr139lNV4si0xhCAm2H8wuW/TmwC6JL9VvcO2w3pkl5cOwE01mmX/Gg1jsG+h
 lxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702034423; x=1702639223;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8joaWTXUFCp5AADWLpS1PdTyOKJegeW+aUOSlsKB54E=;
 b=gZBIWeU+/Ve3VHRyx15JBCVCT8Q7Bz0tqtQ5DB7nnFHH1It5uw0kbkKO/em/ff+pLe
 HWiol4aZwKN2NYctuXmEAFMc8ndiSEHPGSvXQam8JqxZYc4DjB9pt3Ne/jNYlj23PD2Q
 y/z9ruMQ2JvFos7/a6revJomTO9wZw/+y7N1o1n5LbmNAprjSDLNC6blwoNKIPAr/3Hf
 9X/XJSPwegaaUX9TQYb6XgZU6fgg+mru1Cq4iCvdXGHwEWH6JQqTXCa/UOiiZSdT+/Lj
 bDcHKnE7g5oiLAmnS7V+6fZREO3g1azJPOr9aRsDIGrQTRioAeXUrV/Ap/KuPzLHyCbt
 AQkw==
X-Gm-Message-State: AOJu0Yz5orTjlRO/MB1EqWWhrZqJregc2esbtGPTFdZm8UpBMh6eKUe/
 FcbHev/zr/9Qc8rnqTVDDMM=
X-Google-Smtp-Source: AGHT+IGGHN7R6s/pn1Z8gahBIGQw1+q9DB3e28/oxi2Hl2frYahBrlYYGsZjB2YJP5VR7OarDOteng==
X-Received: by 2002:a05:651c:1030:b0:2c9:d872:e7b3 with SMTP id
 w16-20020a05651c103000b002c9d872e7b3mr2421870ljm.106.1702034422430; 
 Fri, 08 Dec 2023 03:20:22 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u5-20020a05651c130500b002ca0290a0fesm197345lja.126.2023.12.08.03.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 03:20:21 -0800 (PST)
Date: Fri, 8 Dec 2023 13:20:11 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v3 06/23] drm/doc/rfc: Describe why prescriptive
 color pipeline is needed
Message-ID: <20231208132011.6c228bf6@eldfell>
In-Reply-To: <20231108163647.106853-7-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-7-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zSQbAa9E0ARcOQ4X89w0/HJ";
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

--Sig_/zSQbAa9E0ARcOQ4X89w0/HJ
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
> @@ -0,0 +1,352 @@
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
> +drm_colorop Object & IOCTLs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
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
> +Just like other DRM objects the drm_colorop objects are discovered via
> +IOCTLs:
> +
> +DRM_IOCTL_MODE_GETCOLOROPRESOURCES: This IOCTL is used to retrieve the
> +number of all drm_colorop objects.
> +
> +DRM_IOCTL_MODE_GETCOLOROP: This IOCTL is used to read one drm_colorop.
> +It includes the ID for the colorop object, as well as the plane_id of
> +the associated plane. All other values should be registered as
> +properties.

Hi Harry,

were you not dropping these two ioctls?

> +
> +Each drm_colorop has three core properties:
> +
> +TYPE: The type of transformation, such as

Should it say type is an enumeration?

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

'0' in quotes, see below.

Which one is easier to read, BYPASS=3Dfalse or ENABLED=3Dtrue?

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
> +    =E2=94=9C=E2=94=80 "BYPASS": bool {true, false}
> +    =E2=94=9C=E2=94=80 "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EO=
TF, PQ EOTF, PQ inverse EOTF, =E2=80=A6}
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
> +always include '0', which is the default and means all color processing

Since '0' is in quotes, is it a string? I guess it is object id 0
instead.

> +is disabled. Additional values will be the object IDs of the first
> +drm_colorop in a pipeline. A driver can create and advertise none, one,
> +or more possible color pipelines. A DRM client will select a color
> +pipeline by setting the COLOR PIPELINE to the respective value.

Maybe explain here what the string name of the COLOR_PIPELINE enum
values is and how it should be used?

As I mentioned before, userspace is accustomed to hardcoding string
names and looking for matches. You could explain that that is ok,
but userspace should really do the discovery explained below if it aims
to works across hardware and vendors.

> +
> +The COLOR_PIPELINE property is only exposed when the
> +DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set. Drivers are expected to
> +reject setting any existing pre-blend color operations when this cap is
> +set, such as COLOR_RANGE or COLOR_ENCODING. If drivers want to support
> +COLOR_RANGE or COLOR_ENCODING functionality when the color pipeline
> +client cap is set, they are expected to expose colorops in the pipeline
> +to allow for the appropriate color transformation.

Out of curiosity:

- What was the reason to refuse setting those old properties instead of
  not exposing them to begin with after the cap is set?

- How do you ensure drivers will actually reject them?

> +
> +An example of a COLOR_PIPELINE property on a plane might look like this::
> +
> +    Plane 10
> +    =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Cursor}=
 =3D Primary
> +    =E2=94=9C=E2=94=80 =E2=80=A6
> +    =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42, 52} =3D 0

In other examples of enums, the { } contains the string names. This
doesn't?

> +
> +
> +Color Pipeline Discovery
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A DRM client wanting color management on a drm_plane will:
> +
> +1. Read all drm_colorop objects

Wasn't step 1 dropped?

> +2. Get the COLOR_PIPELINE property of the plane
> +3. iterate all COLOR_PIPELINE enum values
> +4. for each enum value walk the color pipeline (via the NEXT pointers)
> +   and see if the available color operations are suitable for the
> +   desired color management operations

It would be nice to elaborate here, that even if a specific colorop
does not fit for what userspace is looking for or userspace does not
understand the colorop, userspace does not need to reject the whole
pipeline just because of that if it can set the colorop to BYPASS=3Dtrue.

How would userspace recognise an informational colorop that is safe to
ignore?

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
> +3. Perform atomic_check/commit as desired

  3. Perform (TEST_ONLY or not) atomic commit with all the other KMS
     state it wishes to change.

Simply to avoid implying that programming color pipelines would need
another atomic commit of its own.

> +
> +To configure the pipeline for an HDR10 PQ plane and blending in linear
> +space, a compositor might perform an atomic commit with the following
> +property values::
> +
> +    Plane 10
> +    =E2=94=94=E2=94=80 "COLOR_PIPELINE" =3D 42
> +
> +    Color operation 42 (input CSC)

The names like "input CSC" seem confusing, they're not in the UAPI,
right?

> +    =E2=94=94=E2=94=80 "BYPASS" =3D true
> +
> +    Color operation 44 (DeGamma)
> +    =E2=94=94=E2=94=80 "BYPASS" =3D true
> +
> +    Color operation 45 (gamut remap)
> +    =E2=94=94=E2=94=80 "BYPASS" =3D true
> +
> +    Color operation 46 (shaper LUT RAM)
> +    =E2=94=94=E2=94=80 "BYPASS" =3D true
> +
> +    Color operation 47 (3D LUT RAM)
> +    =E2=94=94=E2=94=80 "LUT_3D_DATA" =3D Gamut mapping + tone mapping + =
night mode

"BYPASS" =3D false

> +
> +    Color operation 48 (blend gamma)
> +    =E2=94=94=E2=94=80 "CURVE_1D_TYPE" =3D PQ EOTF

"BYPASS" =3D false

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
> +disabled or are purely informational. DRM clients implementing support

s/disabled/bypassed/, unless you rename BYPASS to ENABLE.

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

Looks really good overall!


Thanks,
pq


--Sig_/zSQbAa9E0ARcOQ4X89w0/HJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVy++sACgkQI1/ltBGq
qqcvPRAAmTmzqOAWl1xnnOZFTAz4DE2II8L64eNwyZFtReugH4wJ+Id3rmCs3GLp
XxCIaqfFzrdEz5htRnoEkHWiHpBVc4QBE7NUc7h3ACt7r3VWzri+v/8N7H8VusLS
xqO80HF7mLmnEmZbAX3NXo05SsfOlRsLp3PBxnop8MLWMRzu/dYB0DroRjdmX6Qe
68nffFuXkNAaZg2HBo3aYTGt5rj4RkEgQUI2VHV7Hz42nsa8iQDf3OOovB/fMWQl
W7tJN6zgHlfUgF+OtAZlmUBLHC6i3bRkmfbpckjctBqT/LmKGCEr2Ff6MJhFWBtT
q9mmgnnrBAN/JJg1N7KqVs1G0aFUj4Law7/JzzcR1y2EAGOa/IP3JU6BR8YMxzlD
5WPualbjda2288IgXOffALky5K9hTfTfsFiCKQ16DlBBgerq5OYyz5nMfUix4BO4
Fw8Y330DpBgZQ2Q442V0pmIZFyvF1KlyowQc08CnDiWTZMqX1ncUOx4GwDOYQWmd
o66yOd68IpQlbc10NOG6+sPaYUKo5rDp5DxA9PomvgnIWYaoS/OSf0agwxvYeys0
uex3uv4q/fWnCla/IIX3IbkcWw6+/AGUxQW+o6gw4e7dzX1NY1yKLHDJG0S+pmBu
PbKIJL/quhkIjbhagqmLGOjIbU80Z7Cyf5fGSK9mWkojhVAWgww=
=fps7
-----END PGP SIGNATURE-----

--Sig_/zSQbAa9E0ARcOQ4X89w0/HJ--
