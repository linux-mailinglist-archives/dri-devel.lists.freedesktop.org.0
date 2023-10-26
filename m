Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7657D7F20
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 10:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9CD10E782;
	Thu, 26 Oct 2023 08:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FB010E781;
 Thu, 26 Oct 2023 08:58:02 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c504a5e1deso10808031fa.2; 
 Thu, 26 Oct 2023 01:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698310681; x=1698915481; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=YuZqLsGF6S1JVfMA1p/jTUAoAKtS0RaUfwEgXaS33bw=;
 b=fa1es6M2/MO8hWzUY81jUnsgAe2z0dA+z8pgLEry7by5QXcfx+3NpxXj3jgzY287cb
 Bk0EsP/TJjiaGjpeaQRn8N0rOWD3QHTvBAxMYd4l6lO9AJf9qcKPWdh2b8e/6waVgwAn
 OpL+rnq7rZv45IHo0Qs4xMMEtXPolxMqzcawsGKmf+BPjNjMOeHMAzioJs6w7NRAq5wQ
 GEc+TFzoUlQqdcRPqlGP8q3QttoQ+duyhR5fDylyawjIJ3+xEwdqBGcU/Rlotlboolsr
 0V9y8Jx49uUD/7U5EL86pxsx5sV438k37IGomr4wqySPJs5k+2z12E7Y7afbPQtcQteJ
 wNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698310681; x=1698915481;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YuZqLsGF6S1JVfMA1p/jTUAoAKtS0RaUfwEgXaS33bw=;
 b=j48E86fQE6MWkl6pOBzar17kW5Zt/RyIREvCMi11UJBwpawiS5o6gEV6GbMm0ePctm
 5Rbf5gKQHvWmF4Q3eFDpTBW4Ii4LoQp/lmN8sq2baLE+hxn46oN3KH5Jagc0nj7c/L9r
 sh2xbdNHc/ZAtO3fCTiZrWtM1WLmlzh9p0G2T50b2Ht5nmrmZ9EJOG4KTGinF+rKncIR
 6cAMIr81W90samOMEnfgLoq+RzlVGPwr+t26YxDVwWyABLE/68ct5/Ek0SKQd1yt+RrR
 Q3Aydii/MAswkUJuVq+wylkL+nxqimJ2q4ttHigIkFxCpTKyWSLbeq+STWTxwF9h6O4x
 AD8w==
X-Gm-Message-State: AOJu0YzLfbIy5JklpAEEwMzd8eRlPPEDNM6aR5D32Uo1+3W0KWQKBP9m
 mPrgy++dClSFYS3TA2KZ4r0=
X-Google-Smtp-Source: AGHT+IE1wb23d6Sl3GvF3MUUj1YkvJUqdqUb9hsuSpxV/ut/g71PzN7286iFl1QIQXAW3VWrsbWsYg==
X-Received: by 2002:a05:651c:506:b0:2c5:1d95:f7a1 with SMTP id
 o6-20020a05651c050600b002c51d95f7a1mr14842171ljp.27.1698310680542; 
 Thu, 26 Oct 2023 01:58:00 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q13-20020a2eb4ad000000b002bb95815f92sm2810175ljm.115.2023.10.26.01.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 01:57:59 -0700 (PDT)
Date: Thu, 26 Oct 2023 11:57:47 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Alex Goins <agoins@nvidia.com>
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive
 color pipeline is needed
Message-ID: <20231026115747.44cbddad@eldfell>
In-Reply-To: <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
 <20231023111219.6e287958@eldfell>
 <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fLf_mMFrJ.X9yAOlRgfraqI";
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 dri-devel@lists.freedesktop.org,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Hector Martin <marcan@marcan.st>,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/fLf_mMFrJ.X9yAOlRgfraqI
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Oct 2023 15:16:08 -0500 (CDT)
Alex Goins <agoins@nvidia.com> wrote:

> Thank you Harry and all other contributors for your work on this. Respons=
es
> inline -
>=20
> On Mon, 23 Oct 2023, Pekka Paalanen wrote:
>=20
> > On Fri, 20 Oct 2023 11:23:28 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> > > On 2023-10-20 10:57, Pekka Paalanen wrote: =20
> > > > On Fri, 20 Oct 2023 16:22:56 +0200
> > > > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> > > >    =20
> > > >> Thanks for continuing to work on this!
> > > >>
> > > >> On Thu, Oct 19, 2023 at 05:21:22PM -0400, Harry Wentland wrote:   =
=20
> > > >>> v2:
> > > >>>  - Update colorop visualizations to match reality (Sebastian, Ale=
x Hung)
> > > >>>  - Updated wording (Pekka)
> > > >>>  - Change BYPASS wording to make it non-mandatory (Sebastian)
> > > >>>  - Drop cover-letter-like paragraph from COLOR_PIPELINE Plane Pro=
perty
> > > >>>    section (Pekka)
> > > >>>  - Use PQ EOTF instead of its inverse in Pipeline Programming exa=
mple (Melissa)
> > > >>>  - Add "Driver Implementer's Guide" section (Pekka)
> > > >>>  - Add "Driver Forward/Backward Compatibility" section (Sebastian=
, Pekka) =20
> > > >
> > > > ...
> > > > =20
> > > >>> +An example of a drm_colorop object might look like one of these::
> > > >>> +
> > > >>> +    /* 1D enumerated curve */
> > > >>> +    Color operation 42
> > > >>> +    =E2=94=9C=E2=94=80 "TYPE": immutable enum {1D enumerated cur=
ve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} =3D 1D enumerated curve
> > > >>> +    =E2=94=9C=E2=94=80 "BYPASS": bool {true, false}
> > > >>> +    =E2=94=9C=E2=94=80 "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB in=
verse EOTF, PQ EOTF, PQ inverse EOTF, =E2=80=A6}
> > > >>> +    =E2=94=94=E2=94=80 "NEXT": immutable color operation ID =3D =
43 =20
>=20
> I know these are just examples, but I would also like to suggest the poss=
ibility
> of an "identity" CURVE_1D_TYPE. BYPASS =3D true might get different resul=
ts
> compared to setting an identity in some cases depending on the hardware. =
See
> below for more on this, RE: implicit format conversions.
>=20
> Although NVIDIA hardware doesn't use a ROM for enumerated curves, it came=
 up in
> offline discussions that it would nonetheless be helpful to expose enumer=
ated
> curves in order to hide the vendor-specific complexities of programming
> segmented LUTs from clients. In that case, we would simply refer to the
> enumerated curve when calculating/choosing segmented LUT entries.

That's a good idea.

> Another thing that came up in offline discussions is that we could use mu=
ltiple
> color operations to program a single operation in hardware. As I understa=
nd it,
> AMD has a ROM-defined LUT, followed by a custom 4K entry LUT, followed by=
 an
> "HDR Multiplier". On NVIDIA we don't have these as separate hardware stag=
es, but
> we could combine them into a singular LUT in software, such that you can =
combine
> e.g. segmented PQ EOTF with night light. One caveat is that you will lose
> precision from the custom LUT where it overlaps with the linear section o=
f the
> enumerated curve, but that is unavoidable and shouldn't be an issue in mo=
st
> use-cases.

Indeed.

> Actually, the current examples in the proposal don't include a multiplier=
 color
> op, which might be useful. For AMD as above, but also for NVIDIA as the
> following issue arises:
>=20
> As discussed further below, the NVIDIA "degamma" LUT performs an implicit=
 fixed
> point to FP16 conversion. In that conversion, what fixed point 0xFFFFFFFF=
 maps
> to in floating point varies depending on the source content. If it's SDR
> content, we want the max value in FP16 to be 1.0 (80 nits), subject to a
> potential boost multiplier if we want SDR content to be brighter. If it's=
 HDR PQ
> content, we want the max value in FP16 to be 125.0 (10,000 nits). My assu=
mption
> is that this is also what AMD's "HDR Multiplier" stage is used for, is th=
at
> correct?

It would be against the UAPI design principles to tag content as HDR or
SDR. What you can do instead is to expose a colorop with a multiplier of
1.0 or 125.0 to match your hardware behaviour, then tell your hardware
that the input is SDR or HDR to get the expected multiplier. You will
never know what the content actually is, anyway.

Of course, if we want to have a arbitrary multiplier colorop that is
somewhat standard, as in, exposed by many drivers to ease userspace
development, you can certainly use any combination of your hardware
features you need to realize the UAPI prescribed mathematical operation.

Since we are talking about floating-point in hardware, a multiplier
does not significantly affect precision.

In order to mathematically define all colorops, I believe it is
necessary to define all colorops in terms of floating-point values (as
in math), even if they operate on fixed-point or integer. By this I
mean that if the input is 8 bpc unsigned integer pixel format for
instance, 0 raw pixel channel value is mapped to 0.0 and 255 is mapped
to 1.0, and the color pipeline starts with [0.0, 1.0], not [0, 255]
domain. We have to agree on this mapping for all channels on all pixel
formats. However, there is a "but" further below.

I also propose that quantization range is NOT considered in the raw
value mapping, so that we can handle quantization range in colorops
explicitly, allowing us to e.g. handle sub-blacks and super-whites when
necessary. (These are currently impossible to represent in the legacy
color properties, because everything is converted to full range and
clipped before any color operations.)

> From the given enumerated curves, it's not clear how they would map to the
> above. Should sRGB EOTF have a max FP16 value of 1.0, and the PQ EOTF a m=
ax FP16
> value of 125.0? That may work, but it tends towards the "descriptive" not=
ion of
> assuming the source content, which may not be accurate in all cases. This=
 is
> also an issue for the custom 1D LUT, as the blob will need to be converte=
d to
> FP16 in order to populate our "degamma" LUT. What should the resulting ma=
x FP16
> value be, given that we no longer have any hint as to the source content?

In my opinion, all finite non-negative transfer functions should
operate with [0.0, 1.0] domain and [0.0, 1.0] range, and that includes
all sRGB, power 2.2, and PQ curves.

If we look at BT.2100, there is no such encoding even mentioned where
125.0 would correspond to 10k cd/m=C2=B2. That 125.0 convention already has
a built-in assumption what the color spaces are and what the conversion
is aiming to do. IOW, I would say that choice is opinionated from the
start. The multiplier in BT.2100 is always 10000.

Given that elements like various kinds of look-up tables inherently
assume that the domain is [0.0, 1.0] (because the it is a table that
has a beginning and an end, and the usual convention is that the
beginning is zero and the end is one), I think it is best to stick to
the [0.0, 1.0] range where possible. If we go out of that range, then
we have to define how a LUT would apply in a sensible way.

Many TFs are intended to be defined only on [0.0, 1.0] -> [0.0, 1.0].
Some curves, like power 2.2, have a mathematical form that naturally
extends outside of that range. Power 2.2 generalizes to >1.0 input
values as is, but not for negative input values. If needed for negative
input values, it is common to use y =3D -TF(-x) for x < 0 mirroring.

scRGB is the prime example that intentionally uses negative channel
values. We can also have negative channel values with limited
quantization range, sometimes even intentionally (xvYCC chroma, or
PLUGE test sub-blacks). Out-of-unit-range values can also appear as a
side-effect of signal processing, and they should not get clipped
prematurely. This is a challenge for colorops that fundamentally cannot
handle out-of-unit-range values.

There are various workarounds. scRGB colorimetry can be converted into
BT.2020 primaries for example, to avoid saturation induced negative
values. Limited quantization range signal could be processed as-is,
meaning that the limited range is mapped to [16.0/255, 235.0/255]
instead of [0.0, 1.0] or so. But then, we have a complication with
transfer functions.

> I think a multiplier color op solves all of these issues. Named curves and
> custom 1D LUTs would by default assume a max FP16 value of 1.0, which wou=
ld then
> be adjusted by the multiplier.

Pretty much.

> For 80 nit SDR content, set it to 1, for 400
> nit SDR content, set it to 5, for HDR PQ content, set it to 125, etc.=20

That I think is a another story.

> > > >>> +
> > > >>> +    /* custom 4k entry 1D LUT */
> > > >>> +    Color operation 52
> > > >>> +    =E2=94=9C=E2=94=80 "TYPE": immutable enum {1D enumerated cur=
ve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} =3D 1D LUT
> > > >>> +    =E2=94=9C=E2=94=80 "BYPASS": bool {true, false}
> > > >>> +    =E2=94=9C=E2=94=80 "LUT_1D_SIZE": immutable range =3D 4096
> > > >>> +    =E2=94=9C=E2=94=80 "LUT_1D": blob
> > > >>> +    =E2=94=94=E2=94=80 "NEXT": immutable color operation ID =3D =
0 =20
> > > >=20
> > > > ...
> > > >    =20
> > > >>> +Driver Forward/Backward Compatibility
> > > >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >>> +
> > > >>> +As this is uAPI drivers can't regress color pipelines that have =
been
> > > >>> +introduced for a given HW generation. New HW generations are fre=
e to
> > > >>> +abandon color pipelines advertised for previous generations.
> > > >>> +Nevertheless, it can be beneficial to carry support for existing=
 color
> > > >>> +pipelines forward as those will likely already have support in D=
RM
> > > >>> +clients.
> > > >>> +
> > > >>> +Introducing new colorops to a pipeline is fine, as long as they =
can be
> > > >>> +disabled or are purely informational. DRM clients implementing s=
upport
> > > >>> +for the pipeline can always skip unknown properties as long as t=
hey can
> > > >>> +be confident that doing so will not cause unexpected results.
> > > >>> +
> > > >>> +If a new colorop doesn't fall into one of the above categories
> > > >>> +(bypassable or informational) the modified pipeline would be unu=
sable
> > > >>> +for user space. In this case a new pipeline should be defined.  =
   =20
> > > >>
> > > >> How can user space detect an informational element? Should we just=
 add a
> > > >> BYPASS property to informational elements, make it read only and s=
et to
> > > >> true maybe? Or something more descriptive?   =20
> > > >=20
> > > > Read-only BYPASS set to true would be fine by me, I guess.
> > > >    =20
> > >=20
> > > Don't you mean set to false? An informational element will always do
> > > something, so it can't be bypassed. =20
> >=20
> > Yeah, this is why we need a definition. I understand "informational" to
> > not change pixel values in any way. Previously I had some weird idea
> > that scaling doesn't alter color, but of course it may. =20
>=20
> On recent hardware, the NVIDIA pre-blending pipeline includes LUTs that do
> implicit fixed-point to FP16 conversions, and vice versa.

Above, I claimed that the UAPI should be defined in nominal
floating-point values, but I wonder, would that work? Would we need to
have explicit colorops for converting from raw pixel data values into
nominal floating-point in the UAPI?

> For example, the "degamma" LUT towards the beginning of the pipeline impl=
icitly
> converts from fixed point to FP16, and some of the following operations e=
xpect
> to operate in FP16. As such, if you have a fixed point input and don't by=
pass
> those following operations, you *must not* bypass the LUT, even if you are
> otherwise just programming it with the identity. Conversely, if you have a
> floating point input, you *must* bypass the LUT.

Interesting. Since the color pipeline is not(?) meant to replace pixel
format definitions which already make the difference between fixed and
floating point, wouldn't this little detail need to be taken care of by
the driver under the hood?

What if I want to use degamma colorop with a floating-point
framebuffer? Simply not possible on this hardware?

> Could informational elements and allowing the exclusion of the BYPASS pro=
perty
> be used to convey this information to the client?  For example, we could =
expose
> one pipeline with the LUT exposed with read-only BYPASS set to false, and
> sandwich it with informational "Fixed Point" and "FP16" elements to accom=
modate
> fixed point input. Then, expose another pipeline with the LUT missing, an=
d an
> informational "FP16" element in its place to accommodate floating point i=
nput.
>=20
> That's just an example; we also have other operations in the pipeline tha=
t do
> similar implicit conversions. In these cases we don't want the operations=
 to be
> bypassed individually, so instead we would expose them as mandatory in so=
me
> pipelines and missing in others, with informational elements to help info=
rm the
> client of which to choose. Is that acceptable under the current proposal?
>=20
> Note that in this case, the information just has to do with what format t=
he
> pixels should be in, it doesn't correspond to any specific operation. So,=
 I'm
> not sure that BYPASS has any meaning for informational elements in this c=
ontext.

Very good questions. Do we have to expose those conversions in the UAPI
to make things work for this hardware? Meaning that we cannot assume all
colorops work in nominal floating-point from userspace perspective
(perhaps with varying degrees of precision).

> > > > I think we also need a definition of "informational".
> > > >=20
> > > > Counter-example 1: a colorop that represents a non-configurable   =
=20
> > >=20
> > > Not sure what's "counter" for these examples?
> > >  =20
> > > > YUV<->RGB conversion. Maybe it determines its operation from FB pix=
el
> > > > format. It cannot be set to bypass, it cannot be configured, and it
> > > > will alter color values. =20
>=20
> Would it be reasonable to expose this is a 3x4 matrix with a read-only bl=
ob and
> no BYPASS property? I already brought up a similar idea at the XDC HDR Wo=
rkshop
> based on the principle that read-only blobs could be used to express some=
 static
> pipeline elements without the need to define a new type, but got mixed op=
inions.
> I think this demonstrates the principle further, as clients could detect =
this
> programmatically instead of having to special-case the informational elem=
ent.

If the blob depends on the pixel format (i.e. the driver automatically
chooses a different blob per pixel format), then I think we would need
to expose all the blobs and how they correspond to pixel formats.
Otherwise ok, I guess.

However, do we want or need to make a color pipeline or colorop
conditional on pixel formats? For example, if you use a YUV 4:2:0 type
of pixel format, then you must use this pipeline and not any other. Or
floating-point type of pixel format. I did not anticipate this before,
I assumed that all color pipelines and colorops are independent of the
framebuffer pixel format. A specific colorop might have a property that
needs to agree with the framebuffer pixel format, but I didn't expect
further limitations.

"Without the need to define a new type" is something I think we need to
consider case by case. I have a hard time giving a general opinion.

> > > >=20
> > > > Counter-example 2: image size scaling colorop. It might not be
> > > > configurable, it is controlled by the plane CRTC_* and SRC_*
> > > > properties. You still need to understand what it does, so you can
> > > > arrange the scaling to work correctly. (Do not want to scale an ima=
ge
> > > > with PQ-encoded values as Josh demonstrated in XDC.)
> > > >    =20
> > >=20
> > > IMO the position of the scaling operation is the thing that's importa=
nt
> > > here as the color pipeline won't define scaling properties. =20
>=20
> I agree that blending should ideally be done in linear space, and I remem=
ber
> that from Josh's presentation at XDC, but I don't recall the same being s=
aid for
> scaling. In fact, the NVIDIA pre-blending scaler exists in a stage of the
> pipeline that is meant to be in PQ space (more on this below), and that w=
as
> found to achieve better results at HDR/SDR boundaries. Of course, this on=
ly
> bolsters the argument that it would be helpful to have an informational "=
scaler"
> element to understand at which stage scaling takes place.

Both blending and scaling are fundamentally the same operation: you
have two or more source colors (pixels), and you want to compute a
weighted average of them following what happens in nature, that is,
physics, as that is what humans are used to.

Both blending and scaling will suffer from the same problems if the
operation is performed on not light-linear values. The result of the
weighted average does not correspond to physics.

The problem may be hard to observe with natural imagery, but Josh's
example shows it very clearly. Maybe that effect is sometimes useful
for some imagery in some use cases, but it is still an accidental
side-effect. You might get even better results if you don't rely on
accidental side-effects but design a separate operation for the exact
goal you have.

Mind, by scaling we mean changing image size. Not scaling color values.

> > > > Counter-example 3: image sampling colorop. Averages FB originated c=
olor
> > > > values to produce a color sample. Again do not want to do this with
> > > > PQ-encoded values.
> > > >    =20
> > >=20
> > > Wouldn't this only happen during a scaling op? =20
> >=20
> > There is certainly some overlap between examples 2 and 3. IIRC SRC_X/Y
> > coordinates can be fractional, which makes nearest vs. bilinear
> > sampling have a difference even if there is no scaling.
> >=20
> > There is also the question of chroma siting with sub-sampled YUV. I
> > don't know how that actually works, or how it theoretically should work=
. =20
>=20
> We have some operations in our pipeline that are intended to be static, i=
.e. a
> static matrix that converts from RGB to LMS, and later another that conve=
rts
> from LMS to ICtCp. There are even LUTs that are intended to be static,
> converting from linear to PQ and vice versa. All of this is because the
> pre-blending scaler and tone mapping operator are intended to operate in =
ICtCp
> PQ space. Although the stated LUTs and matrices are intended to be static=
, they
> are actually programmable. In offline discussions, it was indicated that =
it
> would be helpful to actually expose the programmability, as opposed to ex=
posing
> them as non-bypassable blocks, as some compositors may have novel uses fo=
r them.

Correct. Doing tone-mapping in ICtCp etc. are already policy that
userspace might or might not agree with.

Exposing static colorops will help usages that adhere to current
prevalent standards around very specific use cases. There may be
millions of devices needing exactly that processing in their usage, but
it is also quite limiting in what one can do with the hardware.

> Despite being programmable, the LUTs are updated in a manner that is less
> efficient as compared to e.g. the non-static "degamma" LUT. Would it be h=
elpful
> if there was some way to tag operations according to their performance,
> for example so that clients can prefer a high performance one when they
> intend to do an animated transition? I recall from the XDC HDR workshop
> that this is also an issue with AMD's 3DLUT, where updates can be too
> slow to animate.

I can certainly see such information being useful, but then we need to
somehow quantize the performance.

What I was left puzzled about after the XDC workshop is that is it
possible to pre-load configurations in the background (slow), and then
quickly switch between them? Hardware-wise I mean.


Thanks,
pq

--Sig_/fLf_mMFrJ.X9yAOlRgfraqI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmU6KgsACgkQI1/ltBGq
qqdJJg/+OyQsL3PmP0igbJHV7esFu4MLLP3+ugmC8jcclgXWpIh6YAWTi90LuwRS
X1KU1afocMwBlbQpfHozaTPjh62y7tNE7l99lpSJl5jJ322JRI9eDbCTgP/Sc/We
lYWIMu6FqkLyOq1TQnvPT8tLo8+dSltoGheAj1KgZCp9cKPxp+SWDOT3tSydyugp
WfBAsyMDYDMIdTv/XM0SLvxR+etcN1RveLGPa9V7GW9UhZWyd4HOnZzNDT9Tgiv7
Tbf6PLl5lgzUky5jF5Qk0YdsFuTnDQ22o9yexLTFbUnFKJt9BgFpB+hi5JPYCxal
lVw7C8EF338d2MzY3OI/uisFwNpzHqoCDedXwAULdjAdTobGw72lveTWdrVvvnUo
it3eHzTFt0l+gYWkykSxdm9Tizo+Naz49hRWrQ2jwHv15AXxsAtf3f3+xCQz7QtJ
ZQoqpyZ+rMSq8d8hofDVxdOGTamgSQ8/MqYg2GeMkbIrqAKEjkudtbS5VBc8RmoI
mXC3D7CjLKilC8EWYZ1p547M3/9C0IpoBOcZZ9rpStyp3bO6XRJYYyrWd0rxdoMR
gRTll/q5oOZgJP8Q/yoYoDpspUjHLhbB6k8CNjxuEMdIj/6VcgaKaH+GJWKnPuHM
wZ0F4hN5XpbFqgOiB6xGz1XwK/6U4q9Pvbe9GYFH99nwAyJAMiE=
=8jjQ
-----END PGP SIGNATURE-----

--Sig_/fLf_mMFrJ.X9yAOlRgfraqI--
