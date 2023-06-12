Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB89F72BBF6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 11:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A2E10E1EF;
	Mon, 12 Jun 2023 09:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436F310E1E4;
 Mon, 12 Jun 2023 09:21:52 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f62d93f38aso4812862e87.0; 
 Mon, 12 Jun 2023 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686561710; x=1689153710;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=bl/HE1Xwn1J0qLSA7/M0x05PqjZA1+n3L4NXiK/45fc=;
 b=ohcosnvDK9WtI1Gon8Dbb2Eo/xqjiUVNXuVRzY2222g80IcdqNUHl7OB3M7PQduV3t
 TFTX261/crz45ysOo1nmzSc5/5MNBSat3x2rHI37/XLZGae/wCHwXYyM8Vjk84k+xUGz
 9reGWsiZTcwK1bQ4PZnPI+GmPJ+VftxTDWuhNYmisg3HaaWT0fhBkBxxOL0bjssXH6Jq
 8vdkGAD+PeHr1EjobTv4LH6T5LzwK5T+7IakYxi9Dt8VCNVk5cuyAQRYcC5t7CNCK6Iy
 WWQ1Ukv9tomHr5YOZ29jpQBFq+NlKZ+NNvT/E2ECw0x5eh533euOQ5pW63jbJULtVMoz
 dSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686561710; x=1689153710;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bl/HE1Xwn1J0qLSA7/M0x05PqjZA1+n3L4NXiK/45fc=;
 b=Ezy2iEhZBoPArckqO0Fm59VEQrqfI56GfgTh1zXMXBRjTe1wntMT1ONlOSUJ685uEV
 VCmSgL4AiWjbJIKqsjaYVorytoKh2rNAId8utu60qDH6tYTakFQqeIdHq26grOvWv/ox
 0Vb0gZ4uwh7SSOI8weMGXOEGesFspa5ezvUmHGGumHMNv/b5M3bdqs4cEjaV4d0yBHIG
 cjRNbOOBenXmR/HYeH70wB+pdHX9CXdp3MJQPUUTqFKMr541n88EagJdFYHsspyFmkd1
 IH5DH23uqESeqI1V7wycdHbi/TlxLpLDE0e8HLphqv0RAAcQzvJelNQlbjX2gzX+2HOq
 1aRw==
X-Gm-Message-State: AC+VfDxC4DfPZRIXHq9FTpQVXp0CN8SlBKSyIyuqr8ggIhb0V1XBQnwQ
 4MgfhFPX3SP4i9hOYb49Y4Y=
X-Google-Smtp-Source: ACHHUZ7+RGIdyN5KgvtjojW+/PSJZQRhwQoHGn2WtQe9bujR/vYsPmZ2strksmrxf61/5BiuGBGRhA==
X-Received: by 2002:a19:5e55:0:b0:4f6:1969:e4a7 with SMTP id
 z21-20020a195e55000000b004f61969e4a7mr4137999lfi.24.1686561709418; 
 Mon, 12 Jun 2023 02:21:49 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 n15-20020ac2490f000000b004f377f317d4sm1396656lfi.285.2023.06.12.02.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 02:21:48 -0700 (PDT)
Date: Mon, 12 Jun 2023 12:21:35 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Christopher Braga <quic_cbraga@quicinc.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230612122135.40505458@eldfell>
In-Reply-To: <6f9598e5-09b4-738f-4d00-dfdaba1c91d0@quicinc.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <4341dac6-ada1-2a75-1c22-086d96408a85@quicinc.com>
 <84d5dad7-5e8e-ce92-d08e-4609970f6604@quicinc.com>
 <jerhZxCOWoQ2gv55pCK0JNVXMT_OY_j9KLewfG5me25cpqVzfOibpr4b9gZpjWPLQOaKWO2zD2KUI5mWge4mA74DmV1qmLB_LxsSRlKtvbk=@emersion.fr>
 <6f9598e5-09b4-738f-4d00-dfdaba1c91d0@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GnzQ+hkVRQ7hok/7sZdvJaW";
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

--Sig_/GnzQ+hkVRQ7hok/7sZdvJaW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Jun 2023 19:11:25 -0400
Christopher Braga <quic_cbraga@quicinc.com> wrote:

> On 6/9/2023 12:30 PM, Simon Ser wrote:
> > Hi Christopher,
> >=20
> > On Friday, June 9th, 2023 at 17:52, Christopher Braga <quic_cbraga@quic=
inc.com> wrote:
> >  =20
> >>> The new COLOROP objects also expose a number of KMS properties. Each =
has a
> >>> type, a reference to the next COLOROP object in the linked list, and =
other
> >>> type-specific properties. Here is an example for a 1D LUT operation:
> >>>
> >>>       Color operation 42
> >>>       =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> >>>       =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, BT.709=
, HLG, =E2=80=A6} =3D LUT =20
> >> The options sRGB / PQ / BT.709 / HLG would select hard-coded 1D
> >> curves? Will different hardware be allowed to expose a subset of these
> >> enum values? =20
> >=20
> > Yes. Only hardcoded LUTs supported by the HW are exposed as enum entrie=
s.
> >  =20
> >>>       =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> >>>       =E2=94=9C=E2=94=80 "lut_data": blob
> >>>       =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >>> =20
> >> Some hardware has per channel 1D LUT values, while others use the same
> >> LUT for all channels.  We will definitely need to expose this in the
> >> UAPI in some form. =20
> >=20
> > Hm, I was assuming per-channel 1D LUTs here, just like the existing GAM=
MA_LUT/
> > DEGAMMA_LUT properties work. If some hardware can't support that, it'll=
 need
> > to get exposed as another color operation block.
> >  =20
> >>> To configure this hardware block, user-space can fill a KMS blob with
> >>> 4096 u32
> >>> entries, then set "lut_data" to the blob ID. Other color operation ty=
pes
> >>> might
> >>> have different properties.
> >>> =20
> >> The bit-depth of the LUT is an important piece of information we should
> >> include by default. Are we assuming that the DRM driver will always
> >> reduce the input values to the resolution supported by the pipeline?
> >> This could result in differences between the hardware behavior
> >> and the shader behavior.
> >>
> >> Additionally, some pipelines are floating point while others are fixed.
> >> How would user space know if it needs to pack 32 bit integer values vs
> >> 32 bit float values? =20
> >=20
> > Again, I'm deferring to the existing GAMMA_LUT/DEGAMMA_LUT. These use a=
 common
> > definition of LUT blob (u16 elements) and it's up to the driver to conv=
ert.
> >=20
> > Using a very precise format for the uAPI has the nice property of makin=
g the
> > uAPI much simpler to use. User-space sends high precision data and it's=
 up to
> > drivers to map that to whatever the hardware accepts.
> > =20
> Conversion from a larger uint type to a smaller type sounds low effort,=20
> however if a block works in a floating point space things are going to=20
> get messy really quickly. If the block operates in FP16 space and the=20
> interface is 16 bits we are good, but going from 32 bits to FP16 (such=20
> as in the matrix case or 3DLUT) is less than ideal.

Hi Christopher,

are you thinking of precision loss, or the overhead of conversion?

Conversion from N-bit fixed point to N-bit floating-point is generally
lossy, too, and the other direction as well.

What exactly would be messy?

>=20
> > Exposing the actual hardware precision is something we've talked about =
during
> > the hackfest. It'll probably be useful to some extent, but will require=
 some
> > discussion to figure out how to design the uAPI. Maybe a simple propert=
y is
> > enough, maybe not (e.g. fully describing the precision of segmented LUT=
s would
> > probably be trickier).
> >=20
> > I'd rather keep things simple for the first pass, we can always add more
> > properties for bit depth etc later on.
> >  =20
> Indicating if a block operates on / with fixed vs float values is=20
> significant enough that I think we should account for this in initial=20
> design. It will have a affect on both the user space value packing +=20
> expected value ranges in the hardware.

What do you mean by "value packing"? Memory layout of the bits forming
a value? Or possible exact values of a specific type?

I don't think fixed vs. float is the most important thing. Even fixed
point formats can have different numbers of bits for whole numbers,
which changes the usable value range and not only precision. Userspace
at the very least needs to know the usable value range for the block's
inputs, outputs, and parameters.

When defining the precision for inputs, outputs and parameters, then
fixed- vs. floating-point becomes meaningful in explaining what "N bits
of precision" means.

Then there is the question of variable precision that depends on the
actual block input and parameter values, how to represent that. Worst
case precision might be too pessimistic alone.

> >>> Here is another example with a 3D LUT:
> >>>
> >>>       Color operation 42
> >>>       =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
> >>>       =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 33
> >>>       =E2=94=9C=E2=94=80 "lut_data": blob
> >>>       =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >>> =20
> >> We are going to need to expose the packing order here to avoid any
> >> programming uncertainty. I don't think we can safely assume all hardwa=
re
> >> is equivalent. =20
> >=20
> > The driver can easily change the layout of the matrix and do any conver=
sion
> > necessary when programming the hardware. We do need to document what la=
yout is
> > used in the uAPI for sure.
> >  =20
> >>> And one last example with a matrix:
> >>>
> >>>       Color operation 42
> >>>       =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> >>>       =E2=94=9C=E2=94=80 "matrix_data": blob
> >>>       =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >>> =20
> >> It is unclear to me what the default sizing of this matrix is. Any
> >> objections to exposing these details with an additional property? =20
> >=20
> > The existing CTM property uses 9 uint64 (S31.32) values. Is there a cas=
e where
> > that wouldn't be enough? =20
>=20
> Larger cases do exist, but as you mention this can be resolved with a=20
> different type then. I don't have any issues with the default 'Matrix'=20
> type being 9 entries.

Please, tell us more. How big, and what are they used for?

IIRC ICC has 3x3 matrix + offset vector. Do you have even more?


> >  =20
> >> Dithering logic exists in some pipelines. I think we need a plan to
> >> expose that here as well. =20
> >=20
> > Hm, I'm not too familiar with dithering. Do you think it would make sen=
se to
> > expose as an additional colorop block? Do you think it would have more
> > consequences on the design?

I think it would be an additional block, and no other consequences, be
it temporal and/or spatial dithering, as long as it does not look at
neighbouring pixels to determine the output for current pixel.

> >=20
> > I want to re-iterate that we don't need to ship all features from day 1=
. We
> > just need to come up with a uAPI design on which new features can be bu=
ilt on.
> >  =20
>=20
> Agreed. I don't think this will affect the proposed design so this can=20
> be figured out once we have a DRM driver impl that declares this block.
>=20
> >>> [Simon note: an alternative would be to split the color pipeline into
> >>> two, by
> >>> having two plane properties ("color_pipeline_pre_scale" and
> >>> "color_pipeline_post_scale") instead of a single one. This would be
> >>> similar to
> >>> the way we want to split pre-blending and post-blending. This could b=
e less
> >>> expressive for drivers, there may be hardware where there are depende=
ncies
> >>> between the pre- and post-scaling pipeline?]
> >>> =20
> >> As others have noted, breaking up the pipeline with immutable blocks
> >> makes the most sense to me here. This way we don't have to predict ahe=
ad
> >> of time every type of block that maybe affected by pipeline ordering.
> >> Splitting the pipeline into two properties now means future
> >> logical splits would require introduction of further plane properties.=
 =20
> >=20
> > Right, if there are more "breaking points", then we'll need immutable b=
locks
> > anyways.
> >  =20
> >>> Then, Alex from NVIDIA described how their hardware works. NVIDIA har=
dware
> >>> contains some fixed-function blocks which convert from LMS to ICtCp a=
nd
> >>> cannot
> >>> be disabled/bypassed. NVIDIA hardware has been designed for descripti=
ve
> >>> APIs
> >>> where user-space provides a high-level description of the colorspace
> >>> conversions it needs to perform, and this is at odds with our KMS uAPI
> >>> proposal. To address this issue, we suggest adding a special block ty=
pe
> >>> which
> >>> describes a fixed conversion from one colorspace to another and canno=
t be
> >>> configured by user-space. Then user-space will need to accomodate its
> >>> pipeline
> >>> for these special blocks. Such fixed hardware blocks need to be well =
enough
> >>> documented so that they can be implemented via shaders.
> >>> =20
> >> A few questions here. What is the current plan for documenting the
> >> mathematical model for each exposed block? Will each defined 'type' en=
um
> >> value be locked to a definition in the kernel documents? As an example,
> >> when we say '3D LUT' in this proposal does this mean the block will
> >> expose a tri-linear interpolated 3D LUT interface? Is '1D Curve' a
> >> direct in to out LUT mapping? =20
> >=20
> > I think we'll want to document these things, yes. We do want to give _s=
ome_
> > slack to drivers, so that they can e.g. implement the "1D LUT" colorop =
via
> > hardware segmented LUTs with a different number of elements per LUT seg=
ment.
> > But being mathematically precise (probably with formulae in the docs) is
> > definitely a goal, and absolutely necessary to implement a shader-based
> > fallback. =20
>=20
> I agree some driver slack is necessary, however ideally this will be=20
> locked down enough that from the compositor side they see "1D LUT" and=20
> know exactly what to expect independent of the hardware. This way=20
> regardless of if I am running on a NVIDIA / AMD / QCOM / etc... chip,=20
> common color pipeline strategies can be used. Assuming a perfect world=20
> where there is a workable overlap between chips of course.

Yes, of course, at least for a start.

However, the long term plan includes a shared userspace library with
driver- and hardware-specific knowledge to use hardware- and
driver-specific blocks. All blocks still need to be explicitly
specified in the kernel UAPI documentation, the idea is that it should
not be a problem for many vendors to have blocks no-one else does. The
library would offer a much more generic API, and use snowflake blocks
to their fullest. The library would also spit out OpenGL shaders and
whatnot for the fallback.

The future in the long term could be either way: evolving towards
generic KMS UAPI blocks with no need for a userspace library
abstraction, or evolving towards hardware-specific KMS UAPI blocks with
a userspace library to abstract them like Mesa does for GPUs.


Thanks,
pq

> Anyways, this isn't something we need to hammer down right this moment.
>=20
> Regards,
> Christopher
> >  =20
> >> Overall I am a fan of this proposal though. The prescriptive color
> >> pipeline UAPI is simple and easy to follow. =20
> >=20
> > Thank you for the comments! Let me know if you disagree with some of th=
e above,
> > or if my answers are unclear. =20


--Sig_/GnzQ+hkVRQ7hok/7sZdvJaW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSG458ACgkQI1/ltBGq
qqda0xAAnzx2Gh4TFzgVslAMv4V4/brYoV8hRnFd3u8Iuhm6y5Z4NSLZKtzl8SaH
5/30AT1g5CLMjKgot/xhyLBR02wTb4akpe4XvA6suIeSmsx3YE34LuNVhDGklH+j
P2+zX3X9g0zseFwZ3zQZLzUg8PGdK8r4JfjkX0fgwC+Z2ZQdpfm1z6qv6oKfkh80
PlHLWthA9Yrg8NAYCWt4VrT4WMSIPTD+rv+jv5eiZk53M+0sSI0yic9fOobyPaxB
1UZ2fheg0Vo2cHI2wufmpEfawXOy2yiEJan6z8CUnWWYwUEN+X1K0xOa/qz18sO4
cF2d3yafegr6+Tuw0HAGuihKbYDuaLwTjlcCRrIQpXdPd4YdIVp1PCJT4+lB3ZLo
31glFauQNaPF99Z3ztL8o1z0wZBFUrr5LncTqF8JU44MCWad+nwTJGBjNsFyGT1/
gZnn4OyKDNSL+eKVJXuRFDDcu0zjipPNbtkldLaWm7JsKLrUd9wuKqift9yLf5eQ
unTsxepPACLqo20D9q89p8a+ZwIXaehEpXAJ2/FmuLL43rD3mllrlHpqPi66H2Zt
XFdulY66pkr8Sf4x+mO0K4UXqs9c784d/fKlvK1cx3PGGURtIngXYtV0k7ccZTZW
7+f+xCcGt8PCCOskbIXWNQixSPcg7g/eW76kipMo6WkTtbm8SrA=
=HJtr
-----END PGP SIGNATURE-----

--Sig_/GnzQ+hkVRQ7hok/7sZdvJaW--
