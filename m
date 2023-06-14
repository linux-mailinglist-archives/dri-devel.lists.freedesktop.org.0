Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F40F972F887
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 11:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B840610E43E;
	Wed, 14 Jun 2023 09:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD0E10E276;
 Wed, 14 Jun 2023 09:00:20 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f5f728c4aaso7519642e87.0; 
 Wed, 14 Jun 2023 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686733218; x=1689325218;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Xp7E1dGIo/gFvf7ZDZoPMGyU2EJFTgvMBVvqvp0tPpc=;
 b=OGqZnw1YOc3jbfpLx7ZIYn/CgPZxJxE2uNjGEXHB78kql+u3IX42hArvgihCRPSRHD
 PyBC+kl8LOBrsdRr5xqUxYBDrvmIQnR7qhTwwSoemJ5rwNBHFmpj+hAP/eWbIq5VfnFM
 BAjRqnQ0NPtM2e/l3Q4EA0faz6fOnS7kp4PoFLQAPjxyo+6aWqM3cSTvPUzVl0lh0Tg7
 zXDpFPnYANMjiUrR74iAWsRFSgIKGHQODhPLetCkmtiBwBBPAGKdwdQaMoKjBwxH2Z2o
 ucQJyxlOHrygal4wXfxvBKxrRPNJk9+w4ly0Bj7Kw7/9MuJq4H1V6wuTd467QSAQRr0O
 wsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686733218; x=1689325218;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xp7E1dGIo/gFvf7ZDZoPMGyU2EJFTgvMBVvqvp0tPpc=;
 b=bZmunRx4vvtAsTjzHrwbv+7jLW+m9FO8keVbZhfS+pRK22+JwRsTrj2B6jvEy90gBK
 62/ADd4pUJw+Abbfv3cvaLadYwxEUbsDaWojmfnS9ClIbS7WcVseJ9GHoeiBPpe2LbdH
 sJj6ZOoHOADyVKPVQJdd+QScsL7dptWuHnbCZVhE6BfwCjQfi/jcLru5x+jtptGYtINb
 K0rwRYuRytCO87l+UHgM9ub/0WcLBftLZ+tNxuV9TrXFuSwF5IowzQE8gKZiQ7085chI
 5DHKOCOnoPS7rV3RMu6BXrsy3dGkqxatk05xHV2KjOITRhypirVfolRiTnQwq7x35A2f
 21PA==
X-Gm-Message-State: AC+VfDx0m4yRfh3xkBKXXNhrZCivR9OZBj98Lhul6sqJH8T/M3AqDF2M
 bLv38rf8REI0f/kBOpj8l28=
X-Google-Smtp-Source: ACHHUZ5I9KQ9feVHwhJ0sg7UL0jXEdoV2re2MGJ6viOe8JhrvRYn/L2KOUof+Rri48N4QxpVbpz6Kg==
X-Received: by 2002:a19:6403:0:b0:4f7:6a2f:523b with SMTP id
 y3-20020a196403000000b004f76a2f523bmr41059lfb.32.1686733217523; 
 Wed, 14 Jun 2023 02:00:17 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 m11-20020ac24acb000000b004eb0dcc52ddsm2054416lfp.41.2023.06.14.02.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 02:00:17 -0700 (PDT)
Date: Wed, 14 Jun 2023 12:00:06 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Christopher Braga <quic_cbraga@quicinc.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230614120006.03284f7e@eldfell>
In-Reply-To: <d132c9e0-d3e2-77e5-bcd6-1aef657b935f@quicinc.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <4341dac6-ada1-2a75-1c22-086d96408a85@quicinc.com>
 <84d5dad7-5e8e-ce92-d08e-4609970f6604@quicinc.com>
 <jerhZxCOWoQ2gv55pCK0JNVXMT_OY_j9KLewfG5me25cpqVzfOibpr4b9gZpjWPLQOaKWO2zD2KUI5mWge4mA74DmV1qmLB_LxsSRlKtvbk=@emersion.fr>
 <6f9598e5-09b4-738f-4d00-dfdaba1c91d0@quicinc.com>
 <20230612122135.40505458@eldfell>
 <f9428dd3-09fb-74b7-7ba0-4710e8b43229@quicinc.com>
 <20230613112312.755ef58f@eldfell>
 <d132c9e0-d3e2-77e5-bcd6-1aef657b935f@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lF5YkfJsvLKpnjvN0ig.c3s";
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

--Sig_/lF5YkfJsvLKpnjvN0ig.c3s
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Jun 2023 12:29:55 -0400
Christopher Braga <quic_cbraga@quicinc.com> wrote:

> On 6/13/2023 4:23 AM, Pekka Paalanen wrote:
> > On Mon, 12 Jun 2023 12:56:57 -0400
> > Christopher Braga <quic_cbraga@quicinc.com> wrote:
> >  =20
> >> On 6/12/2023 5:21 AM, Pekka Paalanen wrote: =20
> >>> On Fri, 9 Jun 2023 19:11:25 -0400
> >>> Christopher Braga <quic_cbraga@quicinc.com> wrote:
> >>>     =20
> >>>> On 6/9/2023 12:30 PM, Simon Ser wrote: =20
> >>>>> Hi Christopher,
> >>>>>
> >>>>> On Friday, June 9th, 2023 at 17:52, Christopher Braga <quic_cbraga@=
quicinc.com> wrote:
> >>>>>        =20
> >>>>>>> The new COLOROP objects also expose a number of KMS properties. E=
ach has a
> >>>>>>> type, a reference to the next COLOROP object in the linked list, =
and other
> >>>>>>> type-specific properties. Here is an example for a 1D LUT operati=
on:
> >>>>>>>
> >>>>>>>         Color operation 42
> >>>>>>>         =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D=
 curve
> >>>>>>>         =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, =
BT.709, HLG, =E2=80=A6} =3D LUT =20
> >>>>>> The options sRGB / PQ / BT.709 / HLG would select hard-coded 1D
> >>>>>> curves? Will different hardware be allowed to expose a subset of t=
hese
> >>>>>> enum values? =20
> >>>>>
> >>>>> Yes. Only hardcoded LUTs supported by the HW are exposed as enum en=
tries.
> >>>>>        =20
> >>>>>>>         =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> >>>>>>>         =E2=94=9C=E2=94=80 "lut_data": blob
> >>>>>>>         =E2=94=94=E2=94=80 "next": immutable color operation ID =
=3D 43
> >>>>>>>       =20
> >>>>>> Some hardware has per channel 1D LUT values, while others use the =
same
> >>>>>> LUT for all channels.  We will definitely need to expose this in t=
he
> >>>>>> UAPI in some form. =20
> >>>>>
> >>>>> Hm, I was assuming per-channel 1D LUTs here, just like the existing=
 GAMMA_LUT/
> >>>>> DEGAMMA_LUT properties work. If some hardware can't support that, i=
t'll need
> >>>>> to get exposed as another color operation block.
> >>>>>        =20
> >>>>>>> To configure this hardware block, user-space can fill a KMS blob =
with
> >>>>>>> 4096 u32
> >>>>>>> entries, then set "lut_data" to the blob ID. Other color operatio=
n types
> >>>>>>> might
> >>>>>>> have different properties.
> >>>>>>>       =20
> >>>>>> The bit-depth of the LUT is an important piece of information we s=
hould
> >>>>>> include by default. Are we assuming that the DRM driver will always
> >>>>>> reduce the input values to the resolution supported by the pipelin=
e?
> >>>>>> This could result in differences between the hardware behavior
> >>>>>> and the shader behavior.
> >>>>>>
> >>>>>> Additionally, some pipelines are floating point while others are f=
ixed.
> >>>>>> How would user space know if it needs to pack 32 bit integer value=
s vs
> >>>>>> 32 bit float values? =20
> >>>>>
> >>>>> Again, I'm deferring to the existing GAMMA_LUT/DEGAMMA_LUT. These u=
se a common
> >>>>> definition of LUT blob (u16 elements) and it's up to the driver to =
convert.
> >>>>>
> >>>>> Using a very precise format for the uAPI has the nice property of m=
aking the
> >>>>> uAPI much simpler to use. User-space sends high precision data and =
it's up to
> >>>>> drivers to map that to whatever the hardware accepts.
> >>>>>       =20
> >>>> Conversion from a larger uint type to a smaller type sounds low effo=
rt,
> >>>> however if a block works in a floating point space things are going =
to
> >>>> get messy really quickly. If the block operates in FP16 space and the
> >>>> interface is 16 bits we are good, but going from 32 bits to FP16 (su=
ch
> >>>> as in the matrix case or 3DLUT) is less than ideal. =20
> >>>
> >>> Hi Christopher,
> >>>
> >>> are you thinking of precision loss, or the overhead of conversion?
> >>>
> >>> Conversion from N-bit fixed point to N-bit floating-point is generally
> >>> lossy, too, and the other direction as well.
> >>>
> >>> What exactly would be messy?
> >>>     =20
> >> Overheard of conversion is the primary concern here. Having to extract
> >> and / or calculate the significand + exponent components in the kernel
> >> is burdensome and imo a task better suited for user space. This also h=
as
> >> to be done every blob set, meaning that if user space is re-using
> >> pre-calculated blobs we would be repeating the same conversion
> >> operations in kernel space unnecessarily. =20
> >=20
> > What is burdensome in that calculation? I don't think you would need to
> > use any actual floating-point instructions. Logarithm for finding the
> > exponent is about finding the highest bit set in an integer and
> > everything is conveniently expressed in base-2. Finding significand is
> > just masking the integer based on the exponent.
> >  =20
> Oh it definitely can be done, but I think this is just a difference of=20
> opinion at this point. At the end of the day we will do it if we have=20
> to, but it is just more optimal if a more agreeable common type is used.
>=20
> > Can you not cache the converted data, keyed by the DRM blob unique
> > identity vs. the KMS property it is attached to? =20
> If the userspace compositor has N common transforms (ex: standard P3 ->=20
> sRGB matrix), they would likely have N unique blobs. Obviously from the=20
> kernel end we wouldn't want to cache the transform of every blob passed=20
> down through the UAPI.

Hi Christoper,

as long as the blob exists, why not?

> > You can assume that userspace will not be re-creating DRM blobs without
> > a reason to believe the contents have changed. If the same blob is set
> > on the same property repeatedly, I would definitely not expect a driver
> > to convert the data again. =20
> If the blob ID is unchanged there is no issue since caching the last=20
> result is already common. As you say, blobs are immutable so no update=20
> is needed. I'd question why the compositor keeps trying to send down the
> same blob ID though.

To avoid hard-to-debug situations with userspace vs. kernel view of KMS
state getting out of sync by a bug, for example. I did originally write
such KMS state caching in Weston to avoid emitting unchanged state, but
that was deemed unnecessary as the kernel side needs to do the same
comparisons "anyway".

> > If a driver does that, it seems like it
> > should be easy to avoid, though I'm no kernel dev. Even if the
> > conversion was just a memcpy, I would still posit it needs to be
> > avoided when the data has obviously not changed. Blobs are immutable. =
=20
> >  > Userspace having to use hardware-specific number formats would proba=
bly =20
> > not be well received.
> >  =20
> To be clear, I am not asking user space to use custom value packing made=
=20
> purely for the hardware's benefit (this sounds like a problem just=20
> waiting to happen). Just support in the color pipeline UAPI for common=20
> numerical data types such as 16-bit floats. That said...

I wonder if there actually is a significant difference between
converting float<->float and int<->float if everything else is equally
fine.

It's possible that requirements on range and precision do
call for both types in UAPI, then we obviously need both.

> >> I agree normalization of the value causing precision loss and rounding
> >> we can't avoid.
> >>
> >> We should also consider the fact that float pipelines have been known =
to
> >> use the scrgb definition for floating point values
> >> (https://registry.khronos.org/EGL/extensions/EXT/EGL_EXT_gl_colorspace=
_scrgb_linear.txt). =20
> >=20
> > scRGB is as good a definition of color encoding as "floating-point" is
> > for numbers. What I mean is that it carries very little usable meaning,
> > and without further information it is practically boundless
> > - infinite - in both color gamut and dynamic range. Just like any
> > floating-point quantity.
> >=20
> > However, what we want from KMS color pipeline is zero implied or
> > defined meaning. That means scRGB carries too much meaning, because the
> > primaries are fixed and (1.0, 1.0, 1.0) should match sRGB/SDR white. =20
> >  > Btw. if one brings in nit units, you assume a specific viewing =20
> > environment which is rarely true in reality. I'll leave that rabbit
> > hole for another time. I just want to mention that nit (cd/m=C2=B2) is a
> > unit that is relative to the chosen viewing environment when your goal
> > is a specific perception of brightness.
> >  =20
> >> In cases like this where there may be a expected value range in the
> >> pipeline, how to normalize a larger input becomes a little confusing. =
Ex
> >> - Does U32 MAX become FP16 MAX or value MAX (i.e 127). =20
> >=20
> > UAPI simply needs to specify the number encoding used in the UAPI, how
> > bit patterns map to real numbers. Real numbers are then what the color
> > pipeline operates on.
> >  =20
> If we plan to have the color pipeline UAPI expose these details then I=20
> am satisfied.

Very good. I do not see how else it could even work.


Thanks,
pq


> > However, intermediate value representation used between two KMS colorop
> > blocks is never observable to userspace. All userspace needs to know is
> > the usable value range and precision behaviour. I think that is best
> > defined for the input and output of each block rather than what flows
> > in between, because an optional (e.g. LUT) block when bypassed does not
> > impose its limitations.
> >  =20
> Sure. Everything in between can be inferred from the pipeline.
>=20
> > What does 1.0 actually mean, that is left for userspace to use however
> > it wishes. There are only pipeline boundary conditions to that: the
> > input to a pipeline comes from a DRM FB, so it has a number encoding
> > specified mostly by pixel format, and an arbitrary colorimetric
> > encoding that only userspace knows. The output of the pipeline has to
> > be standardised so that drivers can number-encode the pipeline output
> > correctly to wire format on e.g. HDMI. Userspace alone is responsible
> > for making sure the colorimetry matches what the sink expects.
> >=20
> > Individual KMS color pipeline colorop blocks need to define their own
> > acceptable input and output ranges. E.g. a look-up table may assume
> > that it's input is in [0.0, 1.0] and anything outside is clamped to
> > that range. That poses restrictions on how userspace can use the block.
> >  =20
> >>>>    =20
> >>>>> Exposing the actual hardware precision is something we've talked ab=
out during
> >>>>> the hackfest. It'll probably be useful to some extent, but will req=
uire some
> >>>>> discussion to figure out how to design the uAPI. Maybe a simple pro=
perty is
> >>>>> enough, maybe not (e.g. fully describing the precision of segmented=
 LUTs would
> >>>>> probably be trickier).
> >>>>>
> >>>>> I'd rather keep things simple for the first pass, we can always add=
 more
> >>>>> properties for bit depth etc later on.
> >>>>>        =20
> >>>> Indicating if a block operates on / with fixed vs float values is
> >>>> significant enough that I think we should account for this in initial
> >>>> design. It will have a affect on both the user space value packing +
> >>>> expected value ranges in the hardware. =20
> >>>
> >>> What do you mean by "value packing"? Memory layout of the bits forming
> >>> a value? Or possible exact values of a specific type? > =20
> >> Both really. If the kernel is provided a U32 value, we need to know if
> >> this is a U32 value, or a float packed into a U32 container. Likewise =
as
> >> mentioned with the scRGB above, float could even adjust the value range
> >> expectations. =20
> >=20
> > Right. The UAPI will simply define that.
> >  =20
> Great!
>=20
> Thanks,
> Christopher
>=20
> >>> I don't think fixed vs. float is the most important thing. Even fixed
> >>> point formats can have different numbers of bits for whole numbers,
> >>> which changes the usable value range and not only precision. Userspace
> >>> at the very least needs to know the usable value range for the block's
> >>> inputs, outputs, and parameters.
> >>>
> >>> When defining the precision for inputs, outputs and parameters, then
> >>> fixed- vs. floating-point becomes meaningful in explaining what "N bi=
ts
> >>> of precision" means.
> >>>
> >>> Then there is the question of variable precision that depends on the
> >>> actual block input and parameter values, how to represent that. Worst
> >>> case precision might be too pessimistic alone.
> >>>     =20
> >> Agreed. More information probably is needed to full define the interfa=
ce
> >> expectations.
> >> =20
> >>>>>>> Here is another example with a 3D LUT:
> >>>>>>>
> >>>>>>>         Color operation 42
> >>>>>>>         =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D L=
UT
> >>>>>>>         =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 33
> >>>>>>>         =E2=94=9C=E2=94=80 "lut_data": blob
> >>>>>>>         =E2=94=94=E2=94=80 "next": immutable color operation ID =
=3D 43
> >>>>>>>       =20
> >>>>>> We are going to need to expose the packing order here to avoid any
> >>>>>> programming uncertainty. I don't think we can safely assume all ha=
rdware
> >>>>>> is equivalent. =20
> >>>>>
> >>>>> The driver can easily change the layout of the matrix and do any co=
nversion
> >>>>> necessary when programming the hardware. We do need to document wha=
t layout is
> >>>>> used in the uAPI for sure.
> >>>>>        =20
> >>>>>>> And one last example with a matrix:
> >>>>>>>
> >>>>>>>         Color operation 42
> >>>>>>>         =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matr=
ix
> >>>>>>>         =E2=94=9C=E2=94=80 "matrix_data": blob
> >>>>>>>         =E2=94=94=E2=94=80 "next": immutable color operation ID =
=3D 43
> >>>>>>>       =20
> >>>>>> It is unclear to me what the default sizing of this matrix is. Any
> >>>>>> objections to exposing these details with an additional property? =
=20
> >>>>>
> >>>>> The existing CTM property uses 9 uint64 (S31.32) values. Is there a=
 case where
> >>>>> that wouldn't be enough? =20
> >>>>
> >>>> Larger cases do exist, but as you mention this can be resolved with a
> >>>> different type then. I don't have any issues with the default 'Matri=
x'
> >>>> type being 9 entries. =20
> >>>
> >>> Please, tell us more. How big, and what are they used for?
> >>>
> >>> IIRC ICC has 3x3 matrix + offset vector. Do you have even more?
> >>>
> >>>     =20
> >> Offset is one. Range adjustment 'vector' is another. But ultimately th=
is
> >> proposal is flexible enough that this can probably just be another col=
or
> >> block in the pipeline. No complaints from me here. =20
> >=20
> > What is a range adjustment vector? A vector of a multiplier per color
> > channel? Does it include offset?
> >=20
> > Yes, sounds like just another block.
> >  =20
> >>>>>        =20
> >>>>>> Dithering logic exists in some pipelines. I think we need a plan to
> >>>>>> expose that here as well. =20
> >>>>>
> >>>>> Hm, I'm not too familiar with dithering. Do you think it would make=
 sense to
> >>>>> expose as an additional colorop block? Do you think it would have m=
ore
> >>>>> consequences on the design? =20
> >>>
> >>> I think it would be an additional block, and no other consequences, be
> >>> it temporal and/or spatial dithering, as long as it does not look at
> >>> neighbouring pixels to determine the output for current pixel.
> >>>     =20
> >>>>>
> >>>>> I want to re-iterate that we don't need to ship all features from d=
ay 1. We
> >>>>> just need to come up with a uAPI design on which new features can b=
e built on.
> >>>>>        =20
> >>>>
> >>>> Agreed. I don't think this will affect the proposed design so this c=
an
> >>>> be figured out once we have a DRM driver impl that declares this blo=
ck.
> >>>>    =20
> >>>>>>> [Simon note: an alternative would be to split the color pipeline =
into
> >>>>>>> two, by
> >>>>>>> having two plane properties ("color_pipeline_pre_scale" and
> >>>>>>> "color_pipeline_post_scale") instead of a single one. This would =
be
> >>>>>>> similar to
> >>>>>>> the way we want to split pre-blending and post-blending. This cou=
ld be less
> >>>>>>> expressive for drivers, there may be hardware where there are dep=
endencies
> >>>>>>> between the pre- and post-scaling pipeline?]
> >>>>>>>       =20
> >>>>>> As others have noted, breaking up the pipeline with immutable bloc=
ks
> >>>>>> makes the most sense to me here. This way we don't have to predict=
 ahead
> >>>>>> of time every type of block that maybe affected by pipeline orderi=
ng.
> >>>>>> Splitting the pipeline into two properties now means future
> >>>>>> logical splits would require introduction of further plane propert=
ies. =20
> >>>>>
> >>>>> Right, if there are more "breaking points", then we'll need immutab=
le blocks
> >>>>> anyways.
> >>>>>        =20
> >>>>>>> Then, Alex from NVIDIA described how their hardware works. NVIDIA=
 hardware
> >>>>>>> contains some fixed-function blocks which convert from LMS to ICt=
Cp and
> >>>>>>> cannot
> >>>>>>> be disabled/bypassed. NVIDIA hardware has been designed for descr=
iptive
> >>>>>>> APIs
> >>>>>>> where user-space provides a high-level description of the colorsp=
ace
> >>>>>>> conversions it needs to perform, and this is at odds with our KMS=
 uAPI
> >>>>>>> proposal. To address this issue, we suggest adding a special bloc=
k type
> >>>>>>> which
> >>>>>>> describes a fixed conversion from one colorspace to another and c=
annot be
> >>>>>>> configured by user-space. Then user-space will need to accomodate=
 its
> >>>>>>> pipeline
> >>>>>>> for these special blocks. Such fixed hardware blocks need to be w=
ell enough
> >>>>>>> documented so that they can be implemented via shaders.
> >>>>>>>       =20
> >>>>>> A few questions here. What is the current plan for documenting the
> >>>>>> mathematical model for each exposed block? Will each defined 'type=
' enum
> >>>>>> value be locked to a definition in the kernel documents? As an exa=
mple,
> >>>>>> when we say '3D LUT' in this proposal does this mean the block will
> >>>>>> expose a tri-linear interpolated 3D LUT interface? Is '1D Curve' a
> >>>>>> direct in to out LUT mapping? =20
> >>>>>
> >>>>> I think we'll want to document these things, yes. We do want to giv=
e _some_
> >>>>> slack to drivers, so that they can e.g. implement the "1D LUT" colo=
rop via
> >>>>> hardware segmented LUTs with a different number of elements per LUT=
 segment.
> >>>>> But being mathematically precise (probably with formulae in the doc=
s) is
> >>>>> definitely a goal, and absolutely necessary to implement a shader-b=
ased
> >>>>> fallback. =20
> >>>>
> >>>> I agree some driver slack is necessary, however ideally this will be
> >>>> locked down enough that from the compositor side they see "1D LUT" a=
nd
> >>>> know exactly what to expect independent of the hardware. This way
> >>>> regardless of if I am running on a NVIDIA / AMD / QCOM / etc... chip,
> >>>> common color pipeline strategies can be used. Assuming a perfect wor=
ld
> >>>> where there is a workable overlap between chips of course. =20
> >>>
> >>> Yes, of course, at least for a start.
> >>>
> >>> However, the long term plan includes a shared userspace library with
> >>> driver- and hardware-specific knowledge to use hardware- and
> >>> driver-specific blocks. All blocks still need to be explicitly
> >>> specified in the kernel UAPI documentation, the idea is that it should
> >>> not be a problem for many vendors to have blocks no-one else does. The
> >>> library would offer a much more generic API, and use snowflake blocks
> >>> to their fullest. The library would also spit out OpenGL shaders and
> >>> whatnot for the fallback.
> >>>
> >>> The future in the long term could be either way: evolving towards
> >>> generic KMS UAPI blocks with no need for a userspace library
> >>> abstraction, or evolving towards hardware-specific KMS UAPI blocks wi=
th
> >>> a userspace library to abstract them like Mesa does for GPUs.
> >>>     =20
> >> Sounds good to me! =20
> >=20
> > Awesome!
> >=20
> >=20
> > Thanks,
> > pq =20


--Sig_/lF5YkfJsvLKpnjvN0ig.c3s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSJgZYACgkQI1/ltBGq
qqfBHA//YtFulMsPA5mnL464uhnyPqi/JRT1CZiE6L55AlXZMmJUFR/U1RMQubfJ
o2A/EsC0pH8BC8pDEXaAXznvZPQEM01UdnxiwP+diIyMC0nlQTMWHYYhDtXPq9Li
24NOcnjzH2hgHfeMPoPFkC4RB771+awANCecLe+a3nDdy/wraHvkV8zW4qL242bJ
47AB05IyR3mOjNQo2m6Y8kCpI+aBBEsqzf9Lmos8AIAchK0mNZnO1ix6dfOkZoP5
YzJtNtwadN7RhAXhz7fkw3AC0CoQKF4ZhiH68KJEiWWgelAErBOOc01RbjZoXig/
+ID2aK60UqG0rm/3ZQoUzVi78gwvizC1iLDRMx4OPXTDFeiOnq9tqVUvHxCnehjH
YL1KS34mTPgSHQYVztNLfa4eOl5DA3BBX9f2ZiYqRQlDWu54yVvcc+L34x9difO3
FNdAWuy/WxHXbxrfJGsV4cB85P/NA0oI6NtmfxmCq//Ecipwx/IePH/ECUaGxX/G
GJOob9GkW+zygHTDHZiMOcppNf2ZNW9jhVU/jXlcUasVsoTATSafi+KX/z+QNTzE
FtW9s7yD0c+LNpHaA1oU9l8WgspjNAXR6B/22JpKtplfqXPp//kFXxtAi7IOo31J
7G2Yp3ysaRdGu8b8TI6QlBRiklijzCn4QV/W7o+VK3hXSOlDQHk=
=8L3i
-----END PGP SIGNATURE-----

--Sig_/lF5YkfJsvLKpnjvN0ig.c3s--
