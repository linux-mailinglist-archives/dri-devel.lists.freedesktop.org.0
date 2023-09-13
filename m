Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A1879E6BB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 13:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F9710E06E;
	Wed, 13 Sep 2023 11:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3298110E06E;
 Wed, 13 Sep 2023 11:29:19 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2bbbda48904so112215551fa.2; 
 Wed, 13 Sep 2023 04:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694604557; x=1695209357; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=cAD+nKI1CP234iaC7Q5uyerHyIx78m7sZbvE+EBeMTE=;
 b=Lrj5/FwOUV8U9/b+wR8Q9FeOcyNB7KPOYDyaRYA8pUoK+TtbyhO0PY8JgrpXngxDLa
 gCRfz+IzyVeYQQAXTasOuPUpMgWUo036jBOS1rDzqyzEQCNvVW9X3fHlxlr80vrFzo7w
 5TPTpPPClGzOrFTsuZC90S7XzgWsH/3/QPcidkQ8i/tUINUi1+3DPMOozXWVkk7EdsPg
 bZoiaLDs1XAhwm8A+yZAROFE+No/j/C+89U07c3rr7ZM3cuQcZPUh7hUPZk2JRtlqBlS
 gvnioM47+7TpEKw9WT6fypqKH//Voml5hr5wBrZDY0kMZu0Yw/UygVSVnjj1Otytl6jb
 cMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694604557; x=1695209357;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cAD+nKI1CP234iaC7Q5uyerHyIx78m7sZbvE+EBeMTE=;
 b=YOUEMaxPkzNgiuznms8F/vKbm4sncWUk3BppH1FGksr6TiTRvP8autHcxXv9+mDSYM
 cLJbrwy9itpDWwUH+IpwegGEyLNQKYNrb5N9JhDJku7pHavM3hs3lgeLtbj7qwubh3Bo
 Bt/mSNd1fAY6zigxRZ6RxZdipjn2tVqG/ZQq0HIK7HrAUdi0jwkaa47HhJVKeoDe2NBo
 1Nd1sY3Y1klUVvhTVLL1A8PIiHelIgWkRTTSgH8CnfFffzgSkzyQ9Cez8pgR2nPJCrBv
 zpN9EUiVrwBf71wvECvLRTHt4RQTVfkCzGJ0yECyK4skncgJA+1uz36Cx/tJL3KMhiMS
 S/sg==
X-Gm-Message-State: AOJu0YySyrDVsdNAMEZ5ARU0iQx5n1tdDdVMW4zdyVIoUcbgAC49dnGP
 1hEX0KSw4EAUMOsHjrC5H34=
X-Google-Smtp-Source: AGHT+IGWMBvJpeaWHXB7o5kfyAZoZyH8dRvpBE06eBRjU0+GnfFkl7i4sAcMkhmBiN5eAnxcRKfaow==
X-Received: by 2002:a2e:b44f:0:b0:2bc:b27f:4019 with SMTP id
 o15-20020a2eb44f000000b002bcb27f4019mr2163442ljm.6.1694604556893; 
 Wed, 13 Sep 2023 04:29:16 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 f14-20020a2ea0ce000000b002b6d781b60esm2385647ljm.82.2023.09.13.04.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 04:29:16 -0700 (PDT)
Date: Wed, 13 Sep 2023 14:29:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Message-ID: <20230913142902.31a51b46@eldfell>
In-Reply-To: <20230908150235.75918-2-harry.wentland@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S0eaWv_vh79Cx5812NpSu+i";
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>, wayland-devel@lists.freedesktop.org,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Uma Shankar <uma.shankar@intel.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/S0eaWv_vh79Cx5812NpSu+i
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 8 Sep 2023 11:02:26 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Jonas =C3=85dahl <jadahl@redhat.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Alexander Goins <agoins@nvidia.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> Cc: Aleix Pol <aleixpol@kde.org>
> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> Cc: Victoria Brekenfeld <victoria@system76.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> Cc: Christopher Braga <quic_cbraga@quicinc.com>
> ---
>  Documentation/gpu/rfc/color_pipeline.rst | 278 +++++++++++++++++++++++
>  1 file changed, 278 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst

Hi Harry,

it's really nice to see this!

Sebastian started on the backward/forward compatibility, so I'll
comment on everything else here, and leave the compatibility for that
thread.

> diff --git a/Documentation/gpu/rfc/color_pipeline.rst b/Documentation/gpu=
/rfc/color_pipeline.rst
> new file mode 100644
> index 000000000000..bfa4a8f12087
> --- /dev/null
> +++ b/Documentation/gpu/rfc/color_pipeline.rst
> @@ -0,0 +1,278 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Linux Color Pipeline API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +What problem are we solving?
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +We would like to support pre-, and post-blending complex color transform=
ations

+in display controller hardware

> +in order to allow for HW-supported HDR use-cases, as well as to provide =
support
> +to color-managed applications, such as video or image editors.
> +
> +While it is possible to support an HDR output on HW supporting the Color=
space
> +and HDR Metadata drm_connector properties that requires the compositor or
> +application to render and compose the content into one final buffer inte=
nded for
> +display. Doing so is costly.

I think a tiny re-wording would make it easier to read:

+~While i~*I*t is possible to support an HDR output on HW supporting the Co=
lorspace
+and HDR Metadata drm_connector properties*, but* that requires the composi=
tor or
+application to render and compose the content into one final buffer intend=
ed for
+display. Doing so is costly.

deletion ~~
addition **


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

I'd add, assuming it's true:

This results in mapping algorithm lock-in, meaning that no-one alone can
experiment with or introduce new mapping algorithms and achieve
consistent results regardless of which implementation path is taken.

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
> +compositor, as tuning it to one will almost inevitably make it look very
> +different from another compositor's color mapping.

This is easy to misunderstand as "all Linux desktops will get your
colors different so you cannot have a consistent look in an app". That
might trigger a few flamewars, even though it is a true goal in essence.

Maybe "almost inevitably" should be worded much more uncertain. Maybe
just "could make it look fairly different".

Much of color management is about user preferences. Different desktops
may have different sets of tunables, like different monitors and TV
have different tunables and color modes. It is still also an active
research area, and new image formats and new ways of driving displays
will surely emerge.

Different use cases have different fundamental goals with color
management, which warrants the "different colors". Linux should be
applicable to a wide range of use cases.

If these thoughts give you ideas how to rewrite this section, go for
it, but it could also be enough to change the couple words I suggested.


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
> +This recipe is generally an order straight-forward operations, with clear

Is this line missing some words?

> +mathematical definitions, such as 1D LUTs, 3D LUTs, matrices, or other
> +operations that can be described in a precise manner.
> +
> +
> +The Color Pipeline API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +HW color management pipelines can significantly differ between HW
> +vendors in terms of availability, ordering, and capabilities of HW
> +blocks. This makes a common definition of color management blocks and
> +their ordering nigh impossible. Instead we are defining an API that
> +allows user space to discover the HW capabilities.

+in a generic manner, agnostic of specific drivers and hardware.

> +
> +
> +drm_colorop Object & IOCTLs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +To support the definition of color pipelines we introduce a new DRM core

"we define the DRM core object type drm_colorop."

I think that reads better after being merged upstream.

> +object, a drm_colorop. Individual drm_colorop objects will be chained
> +via the NEXT property of a drm_colorop to constitute a color pipeline.
> +Each drm_colorop object is unique, i.e., even if multiple color
> +pipelines have the same operation they won't share the same drm_colorop
> +object to describe that operation.

Maybe add some words here how drivers are not expected to map a
drm_colorop object statically to a specific HW block?

If someone was to assume the contrary, they would be wondering how they
can ever expose multiple pipelines.

The mapping between drm_colorop objects and HW blocks is completely a
driver internal detail, and can be as dynamic or static as the driver
needs it to be.

Speaking of drivers, I remember recently writing an email about what
would be a good way to expose HW functionality as drm_colorops.
Something about that would be good to document for driver writers,
maybe in a section of its own:

- Try to expose pipelines that use already defined colorops, even if
  your hardware pipeline is split differently. This allows existing
  userspace to immediately take advantage of the hardware.

- Additionally, try to expose your actual hardware blocks as colorops.
  Define new colorop types where you believe it can offer significant
  benefits if userspace learns to program them.

- Avoid defining new colorops for compound operations with very narrow
  scope. If you have a hardware block for a special operation that
  cannot be split further, you can expose that as a new colorop type.
  However, try to not define colorops for "use cases", especially if
  they require you to combine multiple hardware blocks.

- Design new colorops as prescriptive, not descriptive; by the
  mathematical formula, not by the assumed input and output.

A defined colorop type must be deterministic. Its operation can depend
only on its properties (and input?) and nothing else, allowed error
tolerance notwithstanding.

(By input I'm thinking of a block that maintains some state from
previous frame color statistics, and adjusts its behaviour.)

> +
> +Just like other DRM objects the drm_colorop objects are discovered via
> +IOCTLs:
> +
> +DRM_IOCTL_MODE_GETCOLOROPRESOURCES: This IOCTL is used to retrieve the
> +number of all drm_colorop objects.

What is this useful for? Isn't the COLOR_PIPELINE plane property enough
to discover everything?

> +DRM_IOCTL_MODE_GETCOLOROP: This IOCTL is used to read one drm_colorop.
> +It includes the ID for the colorop object, as well as the plane_id of
> +the associated plane. All other values should be registered as
> +properties.

Why should plane_id not be a property? Could we remove GETCOLOROP
completely?

> +
> +Each drm_colorop has three core properties:
> +
> +TYPE: The type of transformation, such as
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
> +setting the BYPASS property to true should never fail. This allows DRM
> +clients to fallback to other methods of color management if an atomic
> +check for KMS color operations fails.
> +
> +NEXT: The ID of the next drm_colorop in a color pipeline, or 0 if this
> +drm_colorop is the last in the chain.
> +
> +An example of a drm_colorop object might look like one of these::
> +
> +    Color operation 42
> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> +    =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, BT.709, HLG=
, =E2=80=A6} =3D LUT
> +    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> +    =E2=94=9C=E2=94=80 "lut_data": blob
> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> +
> +    Color operation 42
> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
> +    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 33
> +    =E2=94=9C=E2=94=80 "lut_data": blob
> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> +
> +    Color operation 42
> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> +    =E2=94=9C=E2=94=80 "matrix_data": blob
> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> +
> +
> +COLOR_PIPELINE Plane Property
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +Because we don't have existing KMS color properties in the pre-blending
> +portion of display pipelines (i.e. on drm_planes) we are introducing
> +color pipelines here first. Eventually we'll want to use the same
> +concept for the post-blending portion, i.e. drm_crtcs.

This paragraph might fit better in a cover letter.

> +
> +Color Pipelines are created by a driver and advertised via a new
> +COLOR_PIPELINE enum property on each plane. Values of the property
> +always include '0', which is the default and means all color processing
> +is disabled. Additional values will be the object IDs of the first
> +drm_colorop in a pipeline. A driver can create and advertise none, one,
> +or more possible color pipelines. A DRM client will select a color
> +pipeline by setting the COLOR PIPELINE to the respective value.
> +
> +In the case where drivers have custom support for pre-blending color
> +processing those drivers shall reject atomic commits that are trying to
> +set both the custom color properties, as well as the COLOR_PIPELINE

s/set/use/ because one of them could be carried-over state from
previous commits while not literally set in this one.

> +property.
> +
> +An example of a COLOR_PIPELINE property on a plane might look like this::
> +
> +    Plane 10
> +    =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Cursor}=
 =3D Primary
> +    =E2=94=9C=E2=94=80 =E2=80=A6
> +    =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42, 52} =3D 0

Enum values are string names. I presume the intention here is that the
strings will never need to be parsed, and the uint64_t is always equal
to the string representation, right?

That needs a statement here. It differs from all previous uses of
enums, and e.g. requires a little bit of new API in libweston's
DRM-backend to handle since it has its own enums referring to the
string names that get mapped to the uint64_t per owning KMS object.

> +
> +
> +Color Pipeline Discovery
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A DRM client wanting color management on a drm_plane will:
> +
> +1. Read all drm_colorop objects

What does this do?

> +2. Get the COLOR_PIPELINE property of the plane
> +3. iterate all COLOR_PIPELINE enum values
> +4. for each enum value walk the color pipeline (via the NEXT pointers)
> +   and see if the available color operations are suitable for the
> +   desired color management operations
> +
> +An example of chained properties to define an AMD pre-blending color
> +pipeline might look like this::
> +
> +    Plane 10
> +    =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Cursor}=
 =3D Primary
> +    =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42} =3D 0
> +    Color operation 42 (input CSC)

I presume the string "(input CSC)" does not come from KMS, and is
actually just a comment added here by hand?


Thanks,
pq

> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> +    =E2=94=9C=E2=94=80 "matrix_data": blob
> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> +    Color operation 43
> +    =E2=94=9C=E2=94=80 "type": enum {Scaling} =3D Scaling
> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 44
> +    Color operation 44 (DeGamma)
> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> +    =E2=94=9C=E2=94=80 "1d_curve_type": enum {sRGB, PQ, =E2=80=A6} =3D s=
RGB
> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 45
> +    Color operation 45 (gamut remap)
> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> +    =E2=94=9C=E2=94=80 "matrix_data": blob
> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 46
> +    Color operation 46 (shaper LUT RAM)
> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> +    =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT} =3D LUT
> +    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> +    =E2=94=9C=E2=94=80 "lut_data": blob
> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 47
> +    Color operation 47 (3D LUT RAM)
> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
> +    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 17
> +    =E2=94=9C=E2=94=80 "lut_data": blob
> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 48
> +    Color operation 48 (blend gamma)
> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> +    =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, =E2=80=A6} =
=3D LUT
> +    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> +    =E2=94=9C=E2=94=80 "lut_data": blob
> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 0
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
> +
> +To configure the pipeline for an HDR10 PQ plane and blending in linear
> +space, a compositor might perform an atomic commit with the following
> +property values::
> +
> +    Plane 10
> +    =E2=94=94=E2=94=80 "color_pipeline" =3D 42
> +    Color operation 42 (input CSC)
> +    =E2=94=94=E2=94=80 "bypass" =3D true
> +    Color operation 44 (DeGamma)
> +    =E2=94=94=E2=94=80 "bypass" =3D true
> +    Color operation 45 (gamut remap)
> +    =E2=94=94=E2=94=80 "bypasse" =3D true
> +    Color operation 46 (shaper LUT RAM)
> +    =E2=94=94=E2=94=80 "bypass" =3D true
> +    Color operation 47 (3D LUT RAM)
> +    =E2=94=94=E2=94=80 "lut_data" =3D Gamut mapping + tone mapping + nig=
ht mode
> +    Color operation 48 (blend gamma)
> +    =E2=94=94=E2=94=80 "1d_curve_type" =3D PQ inverse EOTF
> +
> +
> +References
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD=
5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=3D=
@emersion.fr/
> \ No newline at end of file


--Sig_/S0eaWv_vh79Cx5812NpSu+i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmUBnP4ACgkQI1/ltBGq
qqeA4Q//Wq6TgaaYqRxCxHkPkm/Jt3kNj2FZSTpWNXYUNecV6skcCCPHspwPoVQg
2PKXf1dFZNJehmGy2fh6sQx75AkRJa7UiXis5eFpvxLG4klk+dew7s/74SRGBmuc
duDAgTc2haiReLEKRSuK2KNJjQ/qZO6M7N5weJVhPdfWdAPOeBljBOSJxuukM4De
VghQ9sy6rYfEc0uWMFe7LYgqEoOyZ1Ue2EUxv3bFizHVxcHUFA2uwXOike2MrJ42
mXkV/qqq8OZfNhqn+mnOuiBDOvFKl2pmv/Aeg3gEsbVUdzqhj7aFTucOMD5749K3
4ymWSGOSDPRrAWYdVHhSicaFQUS6ZITsptUiEbT4yvGnWp15kq+a69BQL3a+ZHhp
Fn0r519zvKnO+Km2Ekd/0pnxdxesnHhIef7v0auLcdGpRESUjsTAmKRnYFOIfqfe
ONpdrGTdm0wlGIH8z/ACBq3tyTpyT4udOc2skbUg1ugT28MhUMC4AJQatFQuQqol
PjmxE+ZVmE5Z7kPUjTgPIDQDqhE72eGvVFy/e5phYpJuasq/lL08KmK31GN/Bm/1
27Nx6W/eipFbzVS+K1c9B9ETo7o2zQEaY8s5jMP7Qn6Ib87s9u0LAl/Enzj4loP2
wFTd/MrY8VjNxBYauDQ/GzUdVLxVP+E+M4wRI7Y8LAeFKrM7Nyg=
=9tX2
-----END PGP SIGNATURE-----

--Sig_/S0eaWv_vh79Cx5812NpSu+i--
