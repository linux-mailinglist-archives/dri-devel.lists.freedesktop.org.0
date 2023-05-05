Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 669686F8410
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 15:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E2D10E5F6;
	Fri,  5 May 2023 13:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED0810E621
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 13:30:26 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-965d2749e2eso161243166b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 06:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=froggi.es; s=google; t=1683293424; x=1685885424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZzPUpv7jIOYW6euBRITwlwce3ryf/Q3nHGBtRxA8ZwM=;
 b=WEVu1nSZilzN7R8WTkWpGHHB4X8tUQJUB6z9rU51539OaIt99wKE8wEDVAfAGQb5+Z
 U146Qs/8Xi9j1QGzgrm9nIW8x6l3S5oTOOUfDAPkhO8tViSdclajUQ1lRT81R0FkZu2Z
 jCUp3F3dJ5g2j0n8hG1RR3dpFzskU9XotzR06EBa5sqrI1OSBnE2A6VRViB0kgsgORNR
 iZV9f1P/N674xx2UeWwX6dFvK78KxK2BXPU7hmMdv4FbnJP4o/oyXRu4KOmttrYozNat
 1in74PtGhehq6i/p7MDmo6aAMtbJKG/PdL7Dn2/dYA9JYe+AxKk8QjJz4bCLDk6yj9un
 jH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683293424; x=1685885424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZzPUpv7jIOYW6euBRITwlwce3ryf/Q3nHGBtRxA8ZwM=;
 b=VrB3pp4CStiVu5b1Ef9HKUomr3oNST2WNmAGKEAkj0qOqJFiDp1jRBxgvwlx1mWiv4
 NUZjrlHfRFb6XP68rbIZCp7JqrY3TPL2R5QEOGEo+SfjqxsePPYOdPw1xeUHGxSr3XBe
 S4pmD/BrRID/v8zZkKTexLg7quHvsbDvVYKApQqMJINZ1ycSvvqGN2Pp3bqfuqDFDPWi
 7X769d9HHdtpz/C64cFc7JyhHHbUsPW/LCqkeKYkKX8LzPo1DOrx3bKscivjciRbR47W
 uSt5IGL+OZybxrDwTsPMda+spsISbktYDnJn1iWRhbUpCVvYuk6UM9Uq6OEls/+OymAK
 MvgQ==
X-Gm-Message-State: AC+VfDwSDvU472z8Zii4E5ReQCFvV36iUMFsHikXU30JTlbTSbSxYPa+
 tcP/rTrwGbk17ylP+nMNeV6A7chE4lsM3IQBhn3Kvg==
X-Google-Smtp-Source: ACHHUZ6i+OFSj2R3CC2cBFoX+hPmXKkZmtuwAzkukPN/+h/pbvDLSK/4fQJrWYqDeG4O9TnpIPvw2twPcGVjyOq04+o=
X-Received: by 2002:a17:907:3f21:b0:92b:6f92:7705 with SMTP id
 hq33-20020a1709073f2100b0092b6f927705mr1344075ejc.40.1683293424349; Fri, 05
 May 2023 06:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <20230505144150.741a90e1@eldfell>
In-Reply-To: <20230505144150.741a90e1@eldfell>
From: Joshua Ashton <joshua@froggi.es>
Date: Fri, 5 May 2023 14:30:11 +0100
Message-ID: <CAEZNXZDnCeZKTJvTwFYnrECzjLc+WEhUG5y-GBDmOeoMBCdJ+A@mail.gmail.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
To: Pekka Paalanen <ppaalanen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Sebastian Wick <sebastian.wick@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some corrections and replies inline.

On Fri, 5 May 2023 at 12:42, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Thu, 04 May 2023 15:22:59 +0000
> Simon Ser <contact@emersion.fr> wrote:
>
> > Hi all,
> >
> > The goal of this RFC is to expose a generic KMS uAPI to configure the c=
olor
> > pipeline before blending, ie. after a pixel is tapped from a plane's
> > framebuffer and before it's blended with other planes. With this new uA=
PI we
> > aim to reduce the battery life impact of color management and HDR on mo=
bile
> > devices, to improve performance and to decrease latency by skipping
> > composition on the 3D engine. This proposal is the result of discussion=
s at
> > the Red Hat HDR hackfest [1] which took place a few days ago. Engineers
> > familiar with the AMD, Intel and NVIDIA hardware have participated in t=
he
> > discussion.
>
> Hi Simon,
>
> this is an excellent write-up, thank you!
>
> Harry's question about what constitutes UAPI is a good one for danvet.
>
> I don't really have much to add here, a couple inline comments. I think
> this could work.
>
> >
> > This proposal takes a prescriptive approach instead of a descriptive ap=
proach.
> > Drivers describe the available hardware blocks in terms of low-level
> > mathematical operations, then user-space configures each block. We deci=
ded
> > against a descriptive approach where user-space would provide a high-le=
vel
> > description of the colorspace and other parameters: we want to give mor=
e
> > control and flexibility to user-space, e.g. to be able to replicate exa=
ctly the
> > color pipeline with shaders and switch between shaders and KMS pipeline=
s
> > seamlessly, and to avoid forcing user-space into a particular color man=
agement
> > policy.
> >
> > We've decided against mirroring the existing CRTC properties
> > DEGAMMA_LUT/CTM/GAMMA_LUT onto KMS planes. Indeed, the color management
> > pipeline can significantly differ between vendors and this approach can=
not
> > accurately abstract all hardware. In particular, the availability, orde=
ring and
> > capabilities of hardware blocks is different on each display engine. So=
, we've
> > decided to go for a highly detailed hardware capability discovery.
> >
> > This new uAPI should not be in conflict with existing standard KMS prop=
erties,
> > since there are none which control the pre-blending color pipeline at t=
he
> > moment. It does conflict with any vendor-specific properties like
> > NV_INPUT_COLORSPACE or the patches on the mailing list adding AMD-speci=
fic
> > properties. Drivers will need to either reject atomic commits configuri=
ng both
> > uAPIs, or alternatively we could add a DRM client cap which hides the v=
endor
> > properties and shows the new generic properties when enabled.
> >
> > To use this uAPI, first user-space needs to discover hardware capabilit=
ies via
> > KMS objects and properties, then user-space can configure the hardware =
via an
> > atomic commit. This works similarly to the existing KMS uAPI, e.g. plan=
es.
> >
> > Our proposal introduces a new "color_pipeline" plane property, and a ne=
w KMS
> > object type, "COLOROP" (short for color operation). The "color_pipeline=
" plane
> > property is an enum, each enum entry represents a color pipeline suppor=
ted by
> > the hardware. The special zero entry indicates that the pipeline is in
> > "bypass"/"no-op" mode. For instance, the following plane properties des=
cribe a
> > primary plane with 2 supported pipelines but currently configured in by=
pass
> > mode:
> >
> >     Plane 10
> >     =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Cursor=
} =3D Primary
> >     =E2=94=9C=E2=94=80 =E2=80=A6
> >     =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42, 52} =3D 0
> >
> > The non-zero entries describe color pipelines as a linked list of COLOR=
OP KMS
> > objects. The entry value is an object ID pointing to the head of the li=
nked
> > list (the first operation in the color pipeline).
> >
> > The new COLOROP objects also expose a number of KMS properties. Each ha=
s a
> > type, a reference to the next COLOROP object in the linked list, and ot=
her
> > type-specific properties. Here is an example for a 1D LUT operation:
> >
> >     Color operation 42
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> >     =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, BT.709, HL=
G, =E2=80=A6} =3D LUT
> >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> >     =E2=94=9C=E2=94=80 "lut_data": blob
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >
> > To configure this hardware block, user-space can fill a KMS blob with 4=
096 u32
> > entries, then set "lut_data" to the blob ID. Other color operation type=
s might
> > have different properties.
> >
> > Here is another example with a 3D LUT:
> >
> >     Color operation 42
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
> >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 33
> >     =E2=94=9C=E2=94=80 "lut_data": blob
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >
> > And one last example with a matrix:
> >
> >     Color operation 42
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> >     =E2=94=9C=E2=94=80 "matrix_data": blob
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >
> > [Simon note: having "Bypass" in the "type" enum, and making "type" muta=
ble is
> > a bit weird. Maybe we can just add an "active"/"bypass" boolean propert=
y on
> > blocks which can be bypassed instead.]
> >
> > [Jonas note: perhaps a single "data" property for both LUTs and matrice=
s
> > would make more sense. And a "size" prop for both 1D and 3D LUTs.]
> >
> > If some hardware supports re-ordering operations in the color pipeline,=
 the
> > driver can expose multiple pipelines with different operation ordering,=
 and
> > user-space can pick the ordering it prefers by selecting the right pipe=
line.
> > The same scheme can be used to expose hardware blocks supporting multip=
le
> > precision levels.
> >
> > That's pretty much all there is to it, but as always the devil is in th=
e
> > details.
> >
> > First, we realized that we need a way to indicate where the scaling ope=
ration
> > is happening. The contents of the framebuffer attached to the plane mig=
ht be
> > scaled up or down depending on the CRTC_W and CRTC_H properties. Depend=
ing on
> > the colorspace scaling is applied in, the result will be different, so =
we need
> > a way for the kernel to indicate which hardware blocks are pre-scaling,=
 and
> > which ones are post-scaling. We introduce a special "scaling" operation=
 type,
> > which is part of the pipeline like other operations but serves an infor=
mational
> > role only (effectively, the operation cannot be configured by user-spac=
e, all
> > of its properties are immutable). For example:
> >
> >     Color operation 43
> >     =E2=94=9C=E2=94=80 "type": immutable enum {Scaling} =3D Scaling
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 44
>
> I like this.
>
> >
> > [Simon note: an alternative would be to split the color pipeline into t=
wo, by
> > having two plane properties ("color_pipeline_pre_scale" and
> > "color_pipeline_post_scale") instead of a single one. This would be sim=
ilar to
> > the way we want to split pre-blending and post-blending. This could be =
less
> > expressive for drivers, there may be hardware where there are dependenc=
ies
> > between the pre- and post-scaling pipeline?]
> >
> > Then, Alex from NVIDIA described how their hardware works. NVIDIA hardw=
are
> > contains some fixed-function blocks which convert from LMS to ICtCp and=
 cannot
> > be disabled/bypassed. NVIDIA hardware has been designed for descriptive=
 APIs
> > where user-space provides a high-level description of the colorspace
> > conversions it needs to perform, and this is at odds with our KMS uAPI
> > proposal. To address this issue, we suggest adding a special block type=
 which
> > describes a fixed conversion from one colorspace to another and cannot =
be
> > configured by user-space. Then user-space will need to accomodate its p=
ipeline
> > for these special blocks. Such fixed hardware blocks need to be well en=
ough
> > documented so that they can be implemented via shaders.
> >
> > We also noted that it should always be possible for user-space to compl=
etely
> > disable the color pipeline and switch back to bypass/identity without a
> > modeset. Some drivers will need to fail atomic commits for some color
> > pipelines, in particular for some specific LUT payloads. For instance, =
AMD
> > doesn't support curves which are too steep, and Intel doesn't support c=
urves
> > which decrease. This isn't something which routinely happens, but there=
 might
> > be more cases where the hardware needs to reject the pipeline. Thus, wh=
en
> > user-space has a running KMS color pipeline, then hits a case where the
> > pipeline cannot keep running (gets rejected by the driver), user-space =
needs to
> > be able to immediately fall back to shaders without any glitch. This do=
esn't
> > seem to be an issue for AMD, Intel and NVIDIA.
> >
> > This uAPI is extensible: we can add more color operations, and we can a=
dd more
> > properties for each color operation type. For instance, we might want t=
o add
> > support for Intel piece-wise linear (PWL) 1D curves, or might want to a=
dvertise
> > the effective precision of the LUTs. The uAPI is deliberately somewhat =
minimal
> > to keep the scope of the proposal manageable.
> >
> > Later on, we plan to re-use the same machinery for post-blending color
> > pipelines. There are some more details about post-blending which have b=
een
> > separately debated at the hackfest, but we believe it's a viable plan. =
This
> > solution would supersede the existing DEGAMMA_LUT/CTM/GAMMA_LUT propert=
ies, so
> > we'd like to introduce a client cap to hide the old properties and show=
 the new
> > post-blending color pipeline properties.
> >
> > We envision a future user-space library to translate a high-level descr=
iptive
> > color pipeline into low-level prescriptive KMS color pipeline ("liblift=
off but
> > for color pipelines"). The library could also offer a translation into =
shaders.
> > This should help share more infrastructure between compositors and ease=
 KMS
> > offloading. This should also help dealing with the NVIDIA case.
> >
> > To wrap things up, let's take a real-world example: how would gamescope=
 [2]
> > configure the AMD DCN 3.0 hardware for its color pipeline? The gamescop=
e color
> > pipeline is described in [3]. The AMD DCN 3.0 hardware is described in =
[4].
> >
> > AMD would expose the following objects and properties:
> >
> >     Plane 10
> >     =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Cursor=
} =3D Primary
> >     =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42} =3D 0
> >     Color operation 42 (input CSC)
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> >     =E2=94=9C=E2=94=80 "matrix_data": blob
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >     Color operation 43
> >     =E2=94=9C=E2=94=80 "type": enum {Scaling} =3D Scaling
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 44
> >     Color operation 44 (DeGamma)
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> >     =E2=94=9C=E2=94=80 "1d_curve_type": enum {sRGB, PQ, =E2=80=A6} =3D =
sRGB
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 45

Some vendors have per-tap degamma and some have a degamma after the sample.
How do we distinguish that behaviour?
It is important to know.

> >     Color operation 45 (gamut remap)
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> >     =E2=94=9C=E2=94=80 "matrix_data": blob
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 46
> >     Color operation 46 (shaper LUT RAM)
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> >     =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT} =3D LUT
> >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> >     =E2=94=9C=E2=94=80 "lut_data": blob
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 47
> >     Color operation 47 (3D LUT RAM)
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
> >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 17
> >     =E2=94=9C=E2=94=80 "lut_data": blob
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 48
> >     Color operation 48 (blend gamma)
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> >     =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, =E2=80=A6}=
 =3D LUT
> >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> >     =E2=94=9C=E2=94=80 "lut_data": blob
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 0
> >
> > To configure the pipeline for an HDR10 PQ plane (path at the top) and a=
 HDR
> > display, gamescope would perform an atomic commit with the following pr=
operty
> > values:
> >
> >     Plane 10
> >     =E2=94=94=E2=94=80 "color_pipeline" =3D 42
> >     Color operation 42 (input CSC)
> >     =E2=94=94=E2=94=80 "matrix_data" =3D PQ =E2=86=92 scRGB (TF)

^
Not sure what this is.
We don't use an input CSC before degamma.

> >     Color operation 44 (DeGamma)
> >     =E2=94=94=E2=94=80 "type" =3D Bypass

^
If we did PQ, this would be PQ -> Linear / 80
If this was sRGB, it'd be sRGB -> Linear
If this was scRGB this would be just treating it as it is. So... Linear / 8=
0.

> >     Color operation 45 (gamut remap)
> >     =E2=94=94=E2=94=80 "matrix_data" =3D scRGB (TF) =E2=86=92 PQ

^
This is wrong, we just use this to do scRGB primaries (709) to 2020.

We then go from scRGB -> PQ to go into our shaper + 3D LUT.

> >     Color operation 46 (shaper LUT RAM)
> >     =E2=94=94=E2=94=80 "lut_data" =3D PQ =E2=86=92 Display native

^
"Display native" is just the response curve of the display.
In HDR10, this would just be PQ -> PQ
If we were doing HDR10 on SDR, this would be PQ -> Gamma 2.2 (mapped
from 0 to display native luminance) [with a potential bit of headroom
for tonemapping in the 3D LUT]
For SDR on HDR10 this would be Gamma 2.2 -> PQ (Not intending to start
an sRGB vs G2.2 argument here! :P)

> >     Color operation 47 (3D LUT RAM)
> >     =E2=94=94=E2=94=80 "lut_data" =3D Gamut mapping + tone mapping + ni=
ght mode
> >     Color operation 48 (blend gamma)
> >     =E2=94=94=E2=94=80 "1d_curve_type" =3D PQ

^
This is wrong, this should be Display Native -> Linearized Display Referred

>
> You cannot do a TF with a matrix, and a gamut remap with a matrix on
> electrical values is certainly surprising, so the example here is a
> bit odd, but I don't think that hurts the intention of demonstration.

I have done some corrections inline.

You can see our fully correct color pipeline here:
https://raw.githubusercontent.com/ValveSoftware/gamescope/master/src/docs/S=
team%20Deck%20Display%20Pipeline.png

Please let me know if you have any more questions about our color pipeline.

>
> Btw. ISTR that if you want to do scaling properly with alpha channel,
> you need optical values multiplied by alpha. Alpha vs. scaling is just
> yet another thing to look into, and TF operations do not work with
> pre-mult.

What are your concerns here?

Having pre-multiplied alpha is fine with a TF: the alpha was
premultiplied in linear, then encoded with the TF by the client.
If you think of a TF as something something relative to a bunch of
reference state or whatever then you might think "oh you can't do
that!", but you really can.
It's really best to just think of it as a mathematical encoding of a
value in all instances that we touch.

The only issue is that you lose precision from having pre-multiplied
alpha as it's quantized to fit into the DRM format rather than using
the full range then getting divided by the alpha at blend time.
It doesn't end up being a visible issue ever however in my experience, at 8=
bpc.

Thanks
 - Joshie =F0=9F=90=B8=E2=9C=A8

>
>
> Thanks,
> pq
>
> >
> > I hope comparing these properties to the diagrams linked above can help
> > understand how the uAPI would be used and give an idea of its viability=
.
> >
> > Please feel free to provide feedback! It would be especially useful to =
have
> > someone familiar with Arm SoCs look at this, to confirm that this propo=
sal
> > would work there.
> >
> > Unless there is a show-stopper, we plan to follow up this RFC with
> > implementations for AMD, Intel, NVIDIA, gamescope, and IGT.
> >
> > Many thanks to everybody who contributed to the hackfest, on-site or re=
motely!
> > Let's work together to make this happen!
> >
> > Simon, on behalf of the hackfest participants
> >
> > [1]: https://wiki.gnome.org/Hackfests/ShellDisplayNext2023
> > [2]: https://github.com/ValveSoftware/gamescope
> > [3]: https://github.com/ValveSoftware/gamescope/blob/5af321724c8b8a29ce=
f5ae9e31293fd5d560c4ec/src/docs/Steam%20Deck%20Display%20Pipeline.png
> > [4]: https://kernel.org/doc/html/latest/_images/dcn3_cm_drm_current.svg
>
