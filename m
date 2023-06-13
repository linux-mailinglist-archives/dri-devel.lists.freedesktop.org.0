Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFFE72DC50
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 10:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A431810E038;
	Tue, 13 Jun 2023 08:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B896110E027;
 Tue, 13 Jun 2023 08:23:28 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b1bb2fc9c6so62077201fa.0; 
 Tue, 13 Jun 2023 01:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686644605; x=1689236605;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=BbcRKoQDsk4I+9bZEFmzcVuFvx3N2xVD9dSU8lzzV4Y=;
 b=iER+IX/y2EDr9lsk0tRJjMUfEd+aInnl7maKSKTtAgVO2tOXHVG2tQep98eA+xoPnO
 4vEnoIJBrwru6hL1bcAlsZT7cBetxRRm43pjhvEQjXGshWFqQkQPrQ6x4Bbv7VcZfgsB
 HMRTMZusUt2tmuFWvi5Rq0mBr5b2Ze0ijM3EPrRDuWEarUjOmt90+CwrleqicAiSuEO6
 pQHmXb1ku+cFcd23wVC4W4zFvOoYUEPMCb2epnV6arZunnsT1WQmmO5KNzVIniS3KfTp
 u+iDVYFXo2eggv/uMhGe73ShUcENQTW/YCl7S8AzOhWwQj6bFeQG1xLZoKX0WA78qXJV
 OZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686644605; x=1689236605;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BbcRKoQDsk4I+9bZEFmzcVuFvx3N2xVD9dSU8lzzV4Y=;
 b=NB6n9WuuG8POn9tGGW51KHJjU2f0XEFSrmSggXcJq6v34HY9WeYepp3kbu4zp7vZOc
 LOku+euRVgYr6BmN+jbRJz9PTAQ+wAlXpY9X4ZN6MQXF/qrScAnphhXMgCilINoMUDKZ
 nmaXaAOyw5Bnqohy0wXqJqmflcw6rQDmmwZyb4dcIneawR6ksXJdooNiBsAyVrKCLv5v
 SnpaNkUaf4CDekD1yrgt2c5E+6gIdiHvTwzhLPCZ7SY3CBzbtDG5ynDfrvZ2kGEs7NkK
 TE3MbWOhbnd1zDLAmqmVrnauz+fFNiuRTJydIGx9ZOCh8toYWr544zPxA2j+cCm6Qpp7
 Mrdg==
X-Gm-Message-State: AC+VfDzSo7VhRcOaKdVSXaWtd19zcohmUmkFsQZZZPfAh7iBMcaOtLm4
 iu9zfT3tUdNRKwoX7V3BL2g=
X-Google-Smtp-Source: ACHHUZ56z9TZ1qEAXVCpiVV4rbZqwHSQWx0h+Pl5gHmwk+Xs3XNCmtW0IPpWsyF8IJ36QKIUIuScKg==
X-Received: by 2002:a2e:9c50:0:b0:2b1:eb30:668a with SMTP id
 t16-20020a2e9c50000000b002b1eb30668amr3586470ljj.36.1686644604482; 
 Tue, 13 Jun 2023 01:23:24 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8e97000000b002b20b012d41sm2055046ljk.54.2023.06.13.01.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 01:23:24 -0700 (PDT)
Date: Tue, 13 Jun 2023 11:23:12 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Christopher Braga <quic_cbraga@quicinc.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230613112312.755ef58f@eldfell>
In-Reply-To: <f9428dd3-09fb-74b7-7ba0-4710e8b43229@quicinc.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <4341dac6-ada1-2a75-1c22-086d96408a85@quicinc.com>
 <84d5dad7-5e8e-ce92-d08e-4609970f6604@quicinc.com>
 <jerhZxCOWoQ2gv55pCK0JNVXMT_OY_j9KLewfG5me25cpqVzfOibpr4b9gZpjWPLQOaKWO2zD2KUI5mWge4mA74DmV1qmLB_LxsSRlKtvbk=@emersion.fr>
 <6f9598e5-09b4-738f-4d00-dfdaba1c91d0@quicinc.com>
 <20230612122135.40505458@eldfell>
 <f9428dd3-09fb-74b7-7ba0-4710e8b43229@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HyFd3EW=no0Ydi.=o1ilgE+";
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
Cc: Aleix Pol <aleixpol@kde.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/HyFd3EW=no0Ydi.=o1ilgE+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Jun 2023 12:56:57 -0400
Christopher Braga <quic_cbraga@quicinc.com> wrote:

> On 6/12/2023 5:21 AM, Pekka Paalanen wrote:
> > On Fri, 9 Jun 2023 19:11:25 -0400
> > Christopher Braga <quic_cbraga@quicinc.com> wrote:
> >  =20
> >> On 6/9/2023 12:30 PM, Simon Ser wrote: =20
> >>> Hi Christopher,
> >>>
> >>> On Friday, June 9th, 2023 at 17:52, Christopher Braga <quic_cbraga@qu=
icinc.com> wrote:
> >>>     =20
> >>>>> The new COLOROP objects also expose a number of KMS properties. Eac=
h has a
> >>>>> type, a reference to the next COLOROP object in the linked list, an=
d other
> >>>>> type-specific properties. Here is an example for a 1D LUT operation:
> >>>>>
> >>>>>        Color operation 42
> >>>>>        =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D cu=
rve
> >>>>>        =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, BT.=
709, HLG, =E2=80=A6} =3D LUT =20
> >>>> The options sRGB / PQ / BT.709 / HLG would select hard-coded 1D
> >>>> curves? Will different hardware be allowed to expose a subset of the=
se
> >>>> enum values? =20
> >>>
> >>> Yes. Only hardcoded LUTs supported by the HW are exposed as enum entr=
ies.
> >>>     =20
> >>>>>        =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> >>>>>        =E2=94=9C=E2=94=80 "lut_data": blob
> >>>>>        =E2=94=94=E2=94=80 "next": immutable color operation ID =3D =
43
> >>>>>    =20
> >>>> Some hardware has per channel 1D LUT values, while others use the sa=
me
> >>>> LUT for all channels.  We will definitely need to expose this in the
> >>>> UAPI in some form. =20
> >>>
> >>> Hm, I was assuming per-channel 1D LUTs here, just like the existing G=
AMMA_LUT/
> >>> DEGAMMA_LUT properties work. If some hardware can't support that, it'=
ll need
> >>> to get exposed as another color operation block.
> >>>     =20
> >>>>> To configure this hardware block, user-space can fill a KMS blob wi=
th
> >>>>> 4096 u32
> >>>>> entries, then set "lut_data" to the blob ID. Other color operation =
types
> >>>>> might
> >>>>> have different properties.
> >>>>>    =20
> >>>> The bit-depth of the LUT is an important piece of information we sho=
uld
> >>>> include by default. Are we assuming that the DRM driver will always
> >>>> reduce the input values to the resolution supported by the pipeline?
> >>>> This could result in differences between the hardware behavior
> >>>> and the shader behavior.
> >>>>
> >>>> Additionally, some pipelines are floating point while others are fix=
ed.
> >>>> How would user space know if it needs to pack 32 bit integer values =
vs
> >>>> 32 bit float values? =20
> >>>
> >>> Again, I'm deferring to the existing GAMMA_LUT/DEGAMMA_LUT. These use=
 a common
> >>> definition of LUT blob (u16 elements) and it's up to the driver to co=
nvert.
> >>>
> >>> Using a very precise format for the uAPI has the nice property of mak=
ing the
> >>> uAPI much simpler to use. User-space sends high precision data and it=
's up to
> >>> drivers to map that to whatever the hardware accepts.
> >>>    =20
> >> Conversion from a larger uint type to a smaller type sounds low effort,
> >> however if a block works in a floating point space things are going to
> >> get messy really quickly. If the block operates in FP16 space and the
> >> interface is 16 bits we are good, but going from 32 bits to FP16 (such
> >> as in the matrix case or 3DLUT) is less than ideal. =20
> >=20
> > Hi Christopher,
> >=20
> > are you thinking of precision loss, or the overhead of conversion?
> >=20
> > Conversion from N-bit fixed point to N-bit floating-point is generally
> > lossy, too, and the other direction as well.
> >=20
> > What exactly would be messy?
> >  =20
> Overheard of conversion is the primary concern here. Having to extract=20
> and / or calculate the significand + exponent components in the kernel=20
> is burdensome and imo a task better suited for user space. This also has=
=20
> to be done every blob set, meaning that if user space is re-using=20
> pre-calculated blobs we would be repeating the same conversion=20
> operations in kernel space unnecessarily.

What is burdensome in that calculation? I don't think you would need to
use any actual floating-point instructions. Logarithm for finding the
exponent is about finding the highest bit set in an integer and
everything is conveniently expressed in base-2. Finding significand is
just masking the integer based on the exponent.

Can you not cache the converted data, keyed by the DRM blob unique
identity vs. the KMS property it is attached to?

You can assume that userspace will not be re-creating DRM blobs without
a reason to believe the contents have changed. If the same blob is set
on the same property repeatedly, I would definitely not expect a driver
to convert the data again. If a driver does that, it seems like it
should be easy to avoid, though I'm no kernel dev. Even if the
conversion was just a memcpy, I would still posit it needs to be
avoided when the data has obviously not changed. Blobs are immutable.

Userspace having to use hardware-specific number formats would probably
not be well received.

> I agree normalization of the value causing precision loss and rounding=20
> we can't avoid.
>=20
> We should also consider the fact that float pipelines have been known to=
=20
> use the scrgb definition for floating point values=20
> (https://registry.khronos.org/EGL/extensions/EXT/EGL_EXT_gl_colorspace_sc=
rgb_linear.txt).=20

scRGB is as good a definition of color encoding as "floating-point" is
for numbers. What I mean is that it carries very little usable meaning,
and without further information it is practically boundless
- infinite - in both color gamut and dynamic range. Just like any
floating-point quantity.

However, what we want from KMS color pipeline is zero implied or
defined meaning. That means scRGB carries too much meaning, because the
primaries are fixed and (1.0, 1.0, 1.0) should match sRGB/SDR white.

Btw. if one brings in nit units, you assume a specific viewing
environment which is rarely true in reality. I'll leave that rabbit
hole for another time. I just want to mention that nit (cd/m=C2=B2) is a
unit that is relative to the chosen viewing environment when your goal
is a specific perception of brightness.

> In cases like this where there may be a expected value range in the=20
> pipeline, how to normalize a larger input becomes a little confusing. Ex=
=20
> - Does U32 MAX become FP16 MAX or value MAX (i.e 127).

UAPI simply needs to specify the number encoding used in the UAPI, how
bit patterns map to real numbers. Real numbers are then what the color
pipeline operates on.

However, intermediate value representation used between two KMS colorop
blocks is never observable to userspace. All userspace needs to know is
the usable value range and precision behaviour. I think that is best
defined for the input and output of each block rather than what flows
in between, because an optional (e.g. LUT) block when bypassed does not
impose its limitations.

What does 1.0 actually mean, that is left for userspace to use however
it wishes. There are only pipeline boundary conditions to that: the
input to a pipeline comes from a DRM FB, so it has a number encoding
specified mostly by pixel format, and an arbitrary colorimetric
encoding that only userspace knows. The output of the pipeline has to
be standardised so that drivers can number-encode the pipeline output
correctly to wire format on e.g. HDMI. Userspace alone is responsible
for making sure the colorimetry matches what the sink expects.

Individual KMS color pipeline colorop blocks need to define their own
acceptable input and output ranges. E.g. a look-up table may assume
that it's input is in [0.0, 1.0] and anything outside is clamped to
that range. That poses restrictions on how userspace can use the block.

> >> =20
> >>> Exposing the actual hardware precision is something we've talked abou=
t during
> >>> the hackfest. It'll probably be useful to some extent, but will requi=
re some
> >>> discussion to figure out how to design the uAPI. Maybe a simple prope=
rty is
> >>> enough, maybe not (e.g. fully describing the precision of segmented L=
UTs would
> >>> probably be trickier).
> >>>
> >>> I'd rather keep things simple for the first pass, we can always add m=
ore
> >>> properties for bit depth etc later on.
> >>>     =20
> >> Indicating if a block operates on / with fixed vs float values is
> >> significant enough that I think we should account for this in initial
> >> design. It will have a affect on both the user space value packing +
> >> expected value ranges in the hardware. =20
> >=20
> > What do you mean by "value packing"? Memory layout of the bits forming
> > a value? Or possible exact values of a specific type? > =20
> Both really. If the kernel is provided a U32 value, we need to know if=20
> this is a U32 value, or a float packed into a U32 container. Likewise as=
=20
> mentioned with the scRGB above, float could even adjust the value range=20
> expectations.

Right. The UAPI will simply define that.

> > I don't think fixed vs. float is the most important thing. Even fixed
> > point formats can have different numbers of bits for whole numbers,
> > which changes the usable value range and not only precision. Userspace
> > at the very least needs to know the usable value range for the block's
> > inputs, outputs, and parameters.
> >=20
> > When defining the precision for inputs, outputs and parameters, then
> > fixed- vs. floating-point becomes meaningful in explaining what "N bits
> > of precision" means.
> >=20
> > Then there is the question of variable precision that depends on the
> > actual block input and parameter values, how to represent that. Worst
> > case precision might be too pessimistic alone.
> >  =20
> Agreed. More information probably is needed to full define the interface=
=20
> expectations.
>=20
> >>>>> Here is another example with a 3D LUT:
> >>>>>
> >>>>>        Color operation 42
> >>>>>        =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
> >>>>>        =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 33
> >>>>>        =E2=94=9C=E2=94=80 "lut_data": blob
> >>>>>        =E2=94=94=E2=94=80 "next": immutable color operation ID =3D =
43
> >>>>>    =20
> >>>> We are going to need to expose the packing order here to avoid any
> >>>> programming uncertainty. I don't think we can safely assume all hard=
ware
> >>>> is equivalent. =20
> >>>
> >>> The driver can easily change the layout of the matrix and do any conv=
ersion
> >>> necessary when programming the hardware. We do need to document what =
layout is
> >>> used in the uAPI for sure.
> >>>     =20
> >>>>> And one last example with a matrix:
> >>>>>
> >>>>>        Color operation 42
> >>>>>        =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> >>>>>        =E2=94=9C=E2=94=80 "matrix_data": blob
> >>>>>        =E2=94=94=E2=94=80 "next": immutable color operation ID =3D =
43
> >>>>>    =20
> >>>> It is unclear to me what the default sizing of this matrix is. Any
> >>>> objections to exposing these details with an additional property? =20
> >>>
> >>> The existing CTM property uses 9 uint64 (S31.32) values. Is there a c=
ase where
> >>> that wouldn't be enough? =20
> >>
> >> Larger cases do exist, but as you mention this can be resolved with a
> >> different type then. I don't have any issues with the default 'Matrix'
> >> type being 9 entries. =20
> >=20
> > Please, tell us more. How big, and what are they used for?
> >=20
> > IIRC ICC has 3x3 matrix + offset vector. Do you have even more?
> >=20
> >  =20
> Offset is one. Range adjustment 'vector' is another. But ultimately this=
=20
> proposal is flexible enough that this can probably just be another color=
=20
> block in the pipeline. No complaints from me here.

What is a range adjustment vector? A vector of a multiplier per color
channel? Does it include offset?

Yes, sounds like just another block.

> >>>     =20
> >>>> Dithering logic exists in some pipelines. I think we need a plan to
> >>>> expose that here as well. =20
> >>>
> >>> Hm, I'm not too familiar with dithering. Do you think it would make s=
ense to
> >>> expose as an additional colorop block? Do you think it would have more
> >>> consequences on the design? =20
> >=20
> > I think it would be an additional block, and no other consequences, be
> > it temporal and/or spatial dithering, as long as it does not look at
> > neighbouring pixels to determine the output for current pixel.
> >  =20
> >>>
> >>> I want to re-iterate that we don't need to ship all features from day=
 1. We
> >>> just need to come up with a uAPI design on which new features can be =
built on.
> >>>     =20
> >>
> >> Agreed. I don't think this will affect the proposed design so this can
> >> be figured out once we have a DRM driver impl that declares this block.
> >> =20
> >>>>> [Simon note: an alternative would be to split the color pipeline in=
to
> >>>>> two, by
> >>>>> having two plane properties ("color_pipeline_pre_scale" and
> >>>>> "color_pipeline_post_scale") instead of a single one. This would be
> >>>>> similar to
> >>>>> the way we want to split pre-blending and post-blending. This could=
 be less
> >>>>> expressive for drivers, there may be hardware where there are depen=
dencies
> >>>>> between the pre- and post-scaling pipeline?]
> >>>>>    =20
> >>>> As others have noted, breaking up the pipeline with immutable blocks
> >>>> makes the most sense to me here. This way we don't have to predict a=
head
> >>>> of time every type of block that maybe affected by pipeline ordering.
> >>>> Splitting the pipeline into two properties now means future
> >>>> logical splits would require introduction of further plane propertie=
s. =20
> >>>
> >>> Right, if there are more "breaking points", then we'll need immutable=
 blocks
> >>> anyways.
> >>>     =20
> >>>>> Then, Alex from NVIDIA described how their hardware works. NVIDIA h=
ardware
> >>>>> contains some fixed-function blocks which convert from LMS to ICtCp=
 and
> >>>>> cannot
> >>>>> be disabled/bypassed. NVIDIA hardware has been designed for descrip=
tive
> >>>>> APIs
> >>>>> where user-space provides a high-level description of the colorspace
> >>>>> conversions it needs to perform, and this is at odds with our KMS u=
API
> >>>>> proposal. To address this issue, we suggest adding a special block =
type
> >>>>> which
> >>>>> describes a fixed conversion from one colorspace to another and can=
not be
> >>>>> configured by user-space. Then user-space will need to accomodate i=
ts
> >>>>> pipeline
> >>>>> for these special blocks. Such fixed hardware blocks need to be wel=
l enough
> >>>>> documented so that they can be implemented via shaders.
> >>>>>    =20
> >>>> A few questions here. What is the current plan for documenting the
> >>>> mathematical model for each exposed block? Will each defined 'type' =
enum
> >>>> value be locked to a definition in the kernel documents? As an examp=
le,
> >>>> when we say '3D LUT' in this proposal does this mean the block will
> >>>> expose a tri-linear interpolated 3D LUT interface? Is '1D Curve' a
> >>>> direct in to out LUT mapping? =20
> >>>
> >>> I think we'll want to document these things, yes. We do want to give =
_some_
> >>> slack to drivers, so that they can e.g. implement the "1D LUT" coloro=
p via
> >>> hardware segmented LUTs with a different number of elements per LUT s=
egment.
> >>> But being mathematically precise (probably with formulae in the docs)=
 is
> >>> definitely a goal, and absolutely necessary to implement a shader-bas=
ed
> >>> fallback. =20
> >>
> >> I agree some driver slack is necessary, however ideally this will be
> >> locked down enough that from the compositor side they see "1D LUT" and
> >> know exactly what to expect independent of the hardware. This way
> >> regardless of if I am running on a NVIDIA / AMD / QCOM / etc... chip,
> >> common color pipeline strategies can be used. Assuming a perfect world
> >> where there is a workable overlap between chips of course. =20
> >=20
> > Yes, of course, at least for a start.
> >=20
> > However, the long term plan includes a shared userspace library with
> > driver- and hardware-specific knowledge to use hardware- and
> > driver-specific blocks. All blocks still need to be explicitly
> > specified in the kernel UAPI documentation, the idea is that it should
> > not be a problem for many vendors to have blocks no-one else does. The
> > library would offer a much more generic API, and use snowflake blocks
> > to their fullest. The library would also spit out OpenGL shaders and
> > whatnot for the fallback.
> >=20
> > The future in the long term could be either way: evolving towards
> > generic KMS UAPI blocks with no need for a userspace library
> > abstraction, or evolving towards hardware-specific KMS UAPI blocks with
> > a userspace library to abstract them like Mesa does for GPUs.
> >  =20
> Sounds good to me!

Awesome!


Thanks,
pq

--Sig_/HyFd3EW=no0Ydi.=o1ilgE+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSIJ3AACgkQI1/ltBGq
qqfg3hAAhxofYbFTed4LozflRbzPw/JbAVlSzNkqomusFDVeF0R42r42uaFRAkHY
+yg/iIen3r/vYgupUK8aNWBV681OlR84Ir+DWzeJns1sLe+UE1A5wJB0H1y/URM9
GpmCjBBcXEUNq7O2U9yin0qHbpb03JuPiOhXgtLX6rSExZ6Ki+jA81ayMrTxjcdL
AVX72tTjzK2xrvhbuKIehprSL/iY6xYnNg7Eogacm68Fs0DwerJtVzwY5bfN0SN9
PVAXtSrh+Wdk0lf5E9I26q5r6sQoSt9qNArS7wrvEmWrnqNQXUPVq8FKfA6Xd2vB
xo09hPwMPS4In8OrEGdydEy/7MARgjNuNKNxh4u4v6kCPHgbsx5XZO9gxszXdUkW
NLpW/h1BfhbWhr0XTgCtPSRNUsLfPqMCijP8nzn69u93WThcffnU6T5IuYtEhQNl
ks7cNTvYDjpPHUSjzoP5F0xsCt+qJiWl4vurG1jLQj469I7AKCdHLBjQwXzOFRRq
+OF+PDUsBtga4iHDTfiOqjm4lrThzZmmWi/nnEJhamKssnnDxUaQRDeWIlwM77Rd
9IBb1AHexBvvAyGNMNAbBp5FdikWR1qd9Dz6fT72pgk0MbsKbmBL0rK/zxdartDB
5NsWT5Lp6dQQ4i6fMO/RrjrdvqevkaSHcbhHbLXSXTpts0EVeY8=
=U16q
-----END PGP SIGNATURE-----

--Sig_/HyFd3EW=no0Ydi.=o1ilgE+--
