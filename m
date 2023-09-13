Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C29679E746
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 13:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C187910E060;
	Wed, 13 Sep 2023 11:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3325410E060;
 Wed, 13 Sep 2023 11:53:41 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2bfb17435e4so16818271fa.0; 
 Wed, 13 Sep 2023 04:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694606019; x=1695210819; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=pt36FCjLBAoG+TDlCYW1WSy1NYrMFmdc/j0NTQ4wJQY=;
 b=dIv37rZfyT0ujbaTOJXXDmw5DinfFRsoL0OjdnQ9M4JB6cDdWTGKQdiJ9iZVo8Yotn
 BrMXQIlZwPqCoMIFv9pN64FCjKUEaSfJYwaZH4RMBpUGezTAUPIJFC6k7gZzBATm1dr/
 4NUh4MrobChhjBiSRlyRhXyQzvpY2AApvbCfEMvs1phEylgUW9EDaj3e7zayRJ6AYwlx
 WUkT8Nsvz6K/AJtPMKwU6i78BrpRFdGK74C60YojM6MqUMDTy2QP1APY88gfBO080TjQ
 A0qzeDW5PqgxNCA8WcqmsA7QJC8Tc4UpEXDPGiOhgxFLSE+R2B15XW30il42sXr9sAgt
 pM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694606019; x=1695210819;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pt36FCjLBAoG+TDlCYW1WSy1NYrMFmdc/j0NTQ4wJQY=;
 b=vHB6REhtVoYba5KL5S8h2HmnCJYQpu8a+SmT1i16nSor0Eh6MsRvOPxH3FIuzlBnyQ
 jcJP7TLQ1/vUTbcf/pZ6W/oElO0twDQYEM96NHEb7mv+t8F5cUOqPhhp6/l/D39gmOUl
 h4mgnLs5+KjdcT48eoYggKObahlKtcmNIQfqF2RrUpcFIOqccnNXTMis2SzR5UN9lC1Y
 /nIyNChR8LbD91m8ykVM2etoFIDEXWLyTnWo2n1yowLpLFSVu+UhvnA78aZU+UwaKB6L
 UjwqntbseVL+mWG19Pytu1iFTuLJqgwZ0j0KwlLWZcSfX8i3KeOFNH0Z4owv+ST73UIs
 Is4Q==
X-Gm-Message-State: AOJu0Yw2i/edfRsoiTJ4AhjcpjWCec7vlTToClgHtdPHgChqwcEOsqTU
 yyhnGccm0/v7YdSxguUMTKQ=
X-Google-Smtp-Source: AGHT+IF3gMFmtEMaz+Bw4oOcxUBBnmgcHOgbnbE+TglO3o2qg/8sKRv7PvoILSyw2q9rV9f6v+8LYQ==
X-Received: by 2002:a2e:3318:0:b0:2bb:c212:5589 with SMTP id
 d24-20020a2e3318000000b002bbc2125589mr2096747ljc.17.1694606018854; 
 Wed, 13 Sep 2023 04:53:38 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 z17-20020a2ebe11000000b002bfb71c076asm302961ljq.43.2023.09.13.04.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 04:53:38 -0700 (PDT)
Date: Wed, 13 Sep 2023 14:53:35 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Message-ID: <20230913145335.3bd07b55@eldfell>
In-Reply-To: <f2b59759-a027-41c0-8ccc-3edc1d450c8a@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20230908193040.GA978120@toolbox>
 <f2b59759-a027-41c0-8ccc-3edc1d450c8a@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AMxG3mN7/iGWIbTWCcVlKiJ";
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Uma Shankar <uma.shankar@intel.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/AMxG3mN7/iGWIbTWCcVlKiJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 8 Sep 2023 16:38:44 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2023-09-08 15:30, Sebastian Wick wrote:
> > Hey Harry,
> >=20
> > Thank you and Simon for this great document. Really happy about it, but
> > obviously I've got a few notes and questions inline.
> >=20
> > On Fri, Sep 08, 2023 at 11:02:26AM -0400, Harry Wentland wrote: =20
> >> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> >> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> >> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> >> Cc: Simon Ser <contact@emersion.fr>
> >> Cc: Harry Wentland <harry.wentland@amd.com>
> >> Cc: Melissa Wen <mwen@igalia.com>
> >> Cc: Jonas =C3=85dahl <jadahl@redhat.com>
> >> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> >> Cc: Shashank Sharma <shashank.sharma@amd.com>
> >> Cc: Alexander Goins <agoins@nvidia.com>
> >> Cc: Joshua Ashton <joshua@froggi.es>
> >> Cc: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> >> Cc: Aleix Pol <aleixpol@kde.org>
> >> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> >> Cc: Victoria Brekenfeld <victoria@system76.com>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: Uma Shankar <uma.shankar@intel.com>
> >> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> >> Cc: Christopher Braga <quic_cbraga@quicinc.com>
> >> ---
> >>   Documentation/gpu/rfc/color_pipeline.rst | 278 +++++++++++++++++++++=
++
> >>   1 file changed, 278 insertions(+)
> >>   create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
> >>
> >> diff --git a/Documentation/gpu/rfc/color_pipeline.rst b/Documentation/=
gpu/rfc/color_pipeline.rst
> >> new file mode 100644
> >> index 000000000000..bfa4a8f12087
> >> --- /dev/null
> >> +++ b/Documentation/gpu/rfc/color_pipeline.rst
> >> @@ -0,0 +1,278 @@
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >> +Linux Color Pipeline API
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >> +
> >> +What problem are we solving?
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >> +
> >> +We would like to support pre-, and post-blending complex color transf=
ormations
> >> +in order to allow for HW-supported HDR use-cases, as well as to provi=
de support
> >> +to color-managed applications, such as video or image editors.
> >> +
> >> +While it is possible to support an HDR output on HW supporting the Co=
lorspace
> >> +and HDR Metadata drm_connector properties that requires the composito=
r or
> >> +application to render and compose the content into one final buffer i=
ntended for
> >> +display. Doing so is costly.
> >> +
> >> +Most modern display HW offers various 1D LUTs, 3D LUTs, matrices, and=
 other
> >> +operations to support color transformations. These operations are oft=
en
> >> +implemented in fixed-function HW and therefore much more power effici=
ent than
> >> +performing similar operations via shaders or CPU.
> >> +
> >> +We would like to make use of this HW functionality to support complex=
 color
> >> +transformations with no, or minimal CPU or shader load.
> >> +
> >> +
> >> +How are other OSes solving this problem?
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +The most widely supported use-cases regard HDR content, whether video=
 or
> >> +gaming.
> >> +
> >> +Most OSes will specify the source content format (color gamut, encodi=
ng transfer
> >> +function, and other metadata, such as max and average light levels) t=
o a driver.
> >> +Drivers will then program their fixed-function HW accordingly to map =
from a
> >> +source content buffer's space to a display's space.
> >> +
> >> +When fixed-function HW is not available the compositor will assemble =
a shader to
> >> +ask the GPU to perform the transformation from the source content for=
mat to the
> >> +display's format.
> >> +
> >> +A compositor's mapping function and a driver's mapping function are u=
sually
> >> +entirely separate concepts. On OSes where a HW vendor has no insight =
into
> >> +closed-source compositor code such a vendor will tune their color man=
agement
> >> +code to visually match the compositor's. On other OSes, where both ma=
pping
> >> +functions are open to an implementer they will ensure both mappings m=
atch.
> >> +
> >> +
> >> +Why is Linux different?
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +Unlike other OSes, where there is one compositor for one or more driv=
ers, on
> >> +Linux we have a many-to-many relationship. Many compositors; many dri=
vers.
> >> +In addition each compositor vendor or community has their own view of=
 how
> >> +color management should be done. This is what makes Linux so beautifu=
l.
> >> +
> >> +This means that a HW vendor can now no longer tune their driver to one
> >> +compositor, as tuning it to one will almost inevitably make it look v=
ery
> >> +different from another compositor's color mapping.
> >> +
> >> +We need a better solution.
> >> +
> >> +
> >> +Descriptive API
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +An API that describes the source and destination colorspaces is a des=
criptive
> >> +API. It describes the input and output color spaces but does not desc=
ribe
> >> +how precisely they should be mapped. Such a mapping includes many min=
ute
> >> +design decision that can greatly affect the look of the final result.
> >> +
> >> +It is not feasible to describe such mapping with enough detail to ens=
ure the
> >> +same result from each implementation. In fact, these mappings are a v=
ery active
> >> +research area.
> >> +
> >> +
> >> +Prescriptive API
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +A prescriptive API describes not the source and destination colorspac=
es. It
> >> +instead prescribes a recipe for how to manipulate pixel values to arr=
ive at the
> >> +desired outcome.
> >> +
> >> +This recipe is generally an order straight-forward operations, with c=
lear
> >> +mathematical definitions, such as 1D LUTs, 3D LUTs, matrices, or other
> >> +operations that can be described in a precise manner.
> >> +
> >> +
> >> +The Color Pipeline API
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +HW color management pipelines can significantly differ between HW
> >> +vendors in terms of availability, ordering, and capabilities of HW
> >> +blocks. This makes a common definition of color management blocks and
> >> +their ordering nigh impossible. Instead we are defining an API that
> >> +allows user space to discover the HW capabilities.
> >> +
> >> +
> >> +drm_colorop Object & IOCTLs
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >> +
> >> +To support the definition of color pipelines we introduce a new DRM c=
ore
> >> +object, a drm_colorop. Individual drm_colorop objects will be chained
> >> +via the NEXT property of a drm_colorop to constitute a color pipeline.
> >> +Each drm_colorop object is unique, i.e., even if multiple color
> >> +pipelines have the same operation they won't share the same drm_color=
op
> >> +object to describe that operation.
> >> +
> >> +Just like other DRM objects the drm_colorop objects are discovered via
> >> +IOCTLs:
> >> +
> >> +DRM_IOCTL_MODE_GETCOLOROPRESOURCES: This IOCTL is used to retrieve the
> >> +number of all drm_colorop objects.
> >> +
> >> +DRM_IOCTL_MODE_GETCOLOROP: This IOCTL is used to read one drm_colorop.
> >> +It includes the ID for the colorop object, as well as the plane_id of
> >> +the associated plane. All other values should be registered as
> >> +properties.
> >> +
> >> +Each drm_colorop has three core properties: =20
> >=20
> > We talked a bit about how forwards compatibility will look like. When a
> > driver introduces a new property that user space doesn't understand yet,
> > for user space to make use of the pipeline, the property either has to

A new property or colorop?

> > have a bypass property, or some other kind of standard/core property
> > that promises that this property is purely informational and the
> > existance doesn't change the result of the color pipeline. Something
> > like "INFORMATIONAL" or "INFO" (better suggestions welcome!).
> >=20
> > If a property doesn't fall into the two categories, the new pipeline
> > would be unusable for user space. So, if this new property is added on
> > an existing piece of hardware, it should be done on an entirely new
> > pipeline to avoid user space regressions.
> >=20
> > I believe these compatibility considerations are very important to
> > document.
> >  =20
>=20
> Should a property have a "bypass" or would it be enough if a colorop
> has a "bypass"?
>=20
> I might need to digest what you said a bit more... Not sure I fully
> understand yet, in particular how one would bypass a particular
> property.

I suspect new colorops in an old pipeline need different handling than
a new property in an old colorop.

What if bypass is not what happened before a new colorop was added in a
pipeline?

Let's have an example: the CRTC automatic RGB->YUV conversion to the
wire format applied as needed. Previously it was all implicit,
automatic, and not exposed. Now one wants to expose it as a new colorop
in the pipeline. Let's say you also expose the old pipeline without
this.

How will userspace choose between a pipeline without the colorop, and a
pipeline with the colorop set to bypass?

The definition of bypass is that it does not alter the values passing
through, but that's not what happens without the colorop.

Maybe this colorop must not have the standard bypass property.

Maybe "bypass" should be "default" instead. But then the color pipeline
results become undefined from userspace perspective, so that doesn't
work.

Maybe we need a rule that everything that modifies pixel values in a
pipeline MUST be exposed from the very moment the COLOR_PIPELINE
property is added to a KMS object. HW blocks that a driver hardcodes to
pass-through and so do not modify any values do not need to be exposed;
they can be trivially exposed later with "bypass" property.

That last "maybe" is actually a hard requirement for the whole color
pipeline design to work, because otherwise the results are unknown to
userspace.

What should a driver writer do if hardware implicitly clamps values at
some point? That potentially modifies values, so it must be taken into
account, especially when it is possible to exceed the nominal unit
range [0.0, 1.0].

What if a driver writer misses something or makes a mistake? Can that
be fixed a few releases later without regressing userspace? I feel like
that last "maybe" might be difficult to ensure.

> >> +
> >> +TYPE: The type of transformation, such as
> >> +* enumerated curve
> >> +* custom (uniform) 1D LUT
> >> +* 3x3 matrix
> >> +* 3x4 matrix
> >> +* 3D LUT
> >> +* etc.
> >> +
> >> +Depending on the type of transformation other properties will describe
> >> +more details.
> >> +
> >> +BYPASS: A boolean property that can be used to easily put a block into
> >> +bypass mode. While setting other properties might fail atomic check,
> >> +setting the BYPASS property to true should never fail. This allows DRM
> >> +clients to fallback to other methods of color management if an atomic
> >> +check for KMS color operations fails. =20
> >=20
> > This says BYPASS is a prop but in the example below the type property is
> > a mutable enum with Bypass being an enum variant.
> >=20
> > Any reason why you chose to make the type property mutable instead of a
> > separate BYPASS property? Personally I like the simplicity of immutable
> > properties and would favor a BYPASS property.
> >  =20
>=20
> My bad, I copy-pasted from Simon's draft but my actual implementation
> already looks different. Type is immutable. BYPASS is a separate mutable=
=20
> property.
>=20
> >> +
> >> +NEXT: The ID of the next drm_colorop in a color pipeline, or 0 if this
> >> +drm_colorop is the last in the chain.
> >> +
> >> +An example of a drm_colorop object might look like one of these::
> >> +
> >> +    Color operation 42
> >> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> >> +    =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, BT.709, =
HLG, =E2=80=A6} =3D LUT
> >> +    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> >> +    =E2=94=9C=E2=94=80 "lut_data": blob
> >> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >> +
> >> +    Color operation 42
> >> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
> >> +    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 33
> >> +    =E2=94=9C=E2=94=80 "lut_data": blob
> >> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >> +
> >> +    Color operation 42
> >> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> >> +    =E2=94=9C=E2=94=80 "matrix_data": blob
> >> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >> +
> >> +
> >> +COLOR_PIPELINE Plane Property
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >> +
> >> +Because we don't have existing KMS color properties in the pre-blendi=
ng
> >> +portion of display pipelines (i.e. on drm_planes) we are introducing
> >> +color pipelines here first. Eventually we'll want to use the same
> >> +concept for the post-blending portion, i.e. drm_crtcs.
> >> +
> >> +Color Pipelines are created by a driver and advertised via a new
> >> +COLOR_PIPELINE enum property on each plane. Values of the property
> >> +always include '0', which is the default and means all color processi=
ng
> >> +is disabled. Additional values will be the object IDs of the first =20
> >=20
> > Regarding the requirement to never fail atomic checks which set a
> > colorop to bypass: I think for user space it would be sufficient if
> > setting the entire pipeline to bypass would not fail the atomic check.

I agree.

> >=20
> > I'm also wondering if there is/will be hardware out there which always
> > does some kind of transformation which cannot be turned off. How would
> > they implement the '0' pipeline?
> >  =20
>=20
> Interesting thought. Not sure if that exists. Maybe in that case
> COLOR_PIPELINE doesn't ever expose 0 and we use an (immutable)=20
> drm_colorop to describe the operation.

Right.


Thanks,
pq

>=20
> >> +drm_colorop in a pipeline. A driver can create and advertise none, on=
e,
> >> +or more possible color pipelines. A DRM client will select a color
> >> +pipeline by setting the COLOR PIPELINE to the respective value.
> >> +
> >> +In the case where drivers have custom support for pre-blending color
> >> +processing those drivers shall reject atomic commits that are trying =
to
> >> +set both the custom color properties, as well as the COLOR_PIPELINE
> >> +property. =20
> >=20
> > By 'not setting the COLOR_PIPELINE property' you mean any value other
> > than '0' I guess? Should be fine to a proper user space.
> >  =20
>=20
> Correct, I should tighten up my language here.
>=20
> Harry
>=20
> >> +
> >> +An example of a COLOR_PIPELINE property on a plane might look like th=
is::
> >> +
> >> +    Plane 10
> >> +    =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Curs=
or} =3D Primary
> >> +    =E2=94=9C=E2=94=80 =E2=80=A6
> >> +    =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42, 52} =3D 0
> >> +
> >> +
> >> +Color Pipeline Discovery
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >> +
> >> +A DRM client wanting color management on a drm_plane will:
> >> +
> >> +1. Read all drm_colorop objects
> >> +2. Get the COLOR_PIPELINE property of the plane
> >> +3. iterate all COLOR_PIPELINE enum values
> >> +4. for each enum value walk the color pipeline (via the NEXT pointers)
> >> +   and see if the available color operations are suitable for the
> >> +   desired color management operations
> >> +
> >> +An example of chained properties to define an AMD pre-blending color
> >> +pipeline might look like this::
> >> +
> >> +    Plane 10
> >> +    =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Curs=
or} =3D Primary
> >> +    =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42} =3D 0
> >> +    Color operation 42 (input CSC)
> >> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> >> +    =E2=94=9C=E2=94=80 "matrix_data": blob
> >> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >> +    Color operation 43
> >> +    =E2=94=9C=E2=94=80 "type": enum {Scaling} =3D Scaling
> >> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 44
> >> +    Color operation 44 (DeGamma)
> >> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> >> +    =E2=94=9C=E2=94=80 "1d_curve_type": enum {sRGB, PQ, =E2=80=A6} =
=3D sRGB
> >> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 45
> >> +    Color operation 45 (gamut remap)
> >> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> >> +    =E2=94=9C=E2=94=80 "matrix_data": blob
> >> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 46
> >> +    Color operation 46 (shaper LUT RAM)
> >> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> >> +    =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT} =3D LUT
> >> +    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> >> +    =E2=94=9C=E2=94=80 "lut_data": blob
> >> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 47
> >> +    Color operation 47 (3D LUT RAM)
> >> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
> >> +    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 17
> >> +    =E2=94=9C=E2=94=80 "lut_data": blob
> >> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 48
> >> +    Color operation 48 (blend gamma)
> >> +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> >> +    =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, =E2=80=
=A6} =3D LUT
> >> +    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> >> +    =E2=94=9C=E2=94=80 "lut_data": blob
> >> +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 0
> >> +
> >> +
> >> +Color Pipeline Programming
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >> +
> >> +Once a DRM client has found a suitable pipeline it will:
> >> +
> >> +1. Set the COLOR_PIPELINE enum value to the one pointing at the first
> >> +   drm_colorop object of the desired pipeline
> >> +2. Set the properties for all drm_colorop objects in the pipeline to =
the
> >> +   desired values, setting BYPASS to true for unused drm_colorop bloc=
ks,
> >> +   and false for enabled drm_colorop blocks
> >> +3. Perform atomic_check/commit as desired
> >> +
> >> +To configure the pipeline for an HDR10 PQ plane and blending in linear
> >> +space, a compositor might perform an atomic commit with the following
> >> +property values::
> >> +
> >> +    Plane 10
> >> +    =E2=94=94=E2=94=80 "color_pipeline" =3D 42
> >> +    Color operation 42 (input CSC)
> >> +    =E2=94=94=E2=94=80 "bypass" =3D true
> >> +    Color operation 44 (DeGamma)
> >> +    =E2=94=94=E2=94=80 "bypass" =3D true
> >> +    Color operation 45 (gamut remap)
> >> +    =E2=94=94=E2=94=80 "bypasse" =3D true
> >> +    Color operation 46 (shaper LUT RAM)
> >> +    =E2=94=94=E2=94=80 "bypass" =3D true
> >> +    Color operation 47 (3D LUT RAM)
> >> +    =E2=94=94=E2=94=80 "lut_data" =3D Gamut mapping + tone mapping + =
night mode
> >> +    Color operation 48 (blend gamma)
> >> +    =E2=94=94=E2=94=80 "1d_curve_type" =3D PQ inverse EOTF
> >> +
> >> +
> >> +References
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze=
_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=
=3D@emersion.fr/
> >> \ No newline at end of file
> >> --=20
> >> 2.42.0
> >> =20
> >  =20


--Sig_/AMxG3mN7/iGWIbTWCcVlKiJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmUBor8ACgkQI1/ltBGq
qqcAIhAAhJDQgUqu/3xURUF36mWKXef682QlvDPAqIXEWig/pBe7cN1GixwunOZT
GxbFKhEb+wNjGLwzsoe0X8JDy/c/kWtrkCFunDjlSDAFdIZzKsFqaEqgJQsw/DYK
4GiQ6800M2SjCtchxQR2BtuV6OVlvFkYmepzCDVXkLIjA8aNOUxBcQ9dw8UgxENw
8WR5l92+KeUWXWjAB0v34Kd3kwDJDYlqXrdzmAXpgPN/acjdTHAKT2hCdq6ZOANd
t97ePilbkyN62dgwbqyXuHZ6z6MJWqoZ/vP23UOa8vU0gR4Ya4GTUBU+vYPestRb
z1Lg8u3I8P9+gzJGldcyyoQ9VazQMSfeDGb2/8BhR3D8dt4yx4NnzMtTOKcB22AP
bpbYVwIy/gui+G4zoDTMocZnQBk/p7/NjHeOZyRjgyhkdjDl83JQV9TX4WHHnosP
EMpOiQG5Mt6jFj6q64tU6X6aIxwF1A0eoWz/kICv7QW4KvIZFNzFl++9q07ervUq
sW7ZH+2Y3/3wVoyK8xMmp8zmIVM6BufDPrlNdhT9SQcj3dHi8jjv9e4Xzo3ep91J
2PHMcVLKgo57KConw1iKUycxULXckUFe+a/OehJBsL8PQSqm1KsbEUarv5hoicuw
RBcVlR+KtGkEC2H8DJ3//y48uBPgf+3OvRFFGzufc4yWv5+wCB4=
=4+CC
-----END PGP SIGNATURE-----

--Sig_/AMxG3mN7/iGWIbTWCcVlKiJ--
