Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0503C6FA2CC
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 11:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAB910E1B6;
	Mon,  8 May 2023 09:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0A710E1B7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 09:00:58 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-195ffe37d10so239650fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 02:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1683536456; x=1686128456;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G1JQIx3bK+AKLtEmmipIyKAo0Jz6esMWFQayoVx2OHA=;
 b=huGQzNvr7KZO0mPkyeFCB8gjNNFD92xXALiNDodKNK753Pu3t8/kQQHMX82sFHHPAx
 2Kv+/KDdTBaIq/gft8ARmhfVtN9Z2pjXAolkUhrUu4a2td75uvn08BtDOo9u/mlTFZfu
 tHkM++JyQGw0oCdb2D41jhiiPK6lLOkaSQdZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683536456; x=1686128456;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G1JQIx3bK+AKLtEmmipIyKAo0Jz6esMWFQayoVx2OHA=;
 b=MBy4Gugy32O+6ziVwsEtrtRcF/pj2TYbHJ0Hi9tSnv2Ugwaj3hyF5jCkzja7ujLFpa
 n4hRjSJYRkgNPH5JI43IxU9NsHob29wVg7MVoDclJFaXHcfiGybKHq0IkLSUnT9118GL
 8IMpZZkEZvah0Sv3sxUGb1sC7+LzkqtT3d90pdT2yU2k+UkJORA4dakzCKXRNUxOXPS0
 lt454boPYTGOBx6SXmvTVnJUsL+tpM0Icc93J2IxgbJ9KSo4z4otIZ/M0XYlND2brHNV
 ffQiXSSg2u2aUxyzw3Tzl8ZZ19UHLzxMNcfzR9vuJpFvQeTWglVUy28hOhBa1HEumK/Y
 0sMw==
X-Gm-Message-State: AC+VfDwuELMRp3JsvnrQ/kEnZ6iZduunb1tLPgVruosNfLvT59U7GVm7
 KrAnEhJ19qsf52p//F6G3d8XKHxSxU1EMkEsufay1Q==
X-Google-Smtp-Source: ACHHUZ7SJBmuJ+NIB0AdTNpGAyEzDX6xRjE5JO7XURTtc3ZJkugKRCf/8gNK98x2YpqVlU7Ss79Jqt1coZ+NYhxfeog=
X-Received: by 2002:a05:6870:f626:b0:187:7a49:d227 with SMTP id
 ek38-20020a056870f62600b001877a49d227mr5618244oab.5.1683536456511; Mon, 08
 May 2023 02:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <ZFUgnMI4IIbv78By@phenom.ffwll.local>
 <CA+hFU4wbU-FEkk2YrKOPOMNgODNbXXpmzi5EH5Pf3gJO08bQmw@mail.gmail.com>
 <ZFVeTcUOOpRrXtvI@phenom.ffwll.local> <20230508112423.688549cf@eldfell>
In-Reply-To: <20230508112423.688549cf@eldfell>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 8 May 2023 11:00:45 +0200
Message-ID: <CAKMK7uFF3hCgFkeg1D5JhKJi_UPna2t5MPRxNRdJfsv663LoWQ@mail.gmail.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Uma Shankar <uma.shankar@intel.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 8 May 2023 at 10:24, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Fri, 5 May 2023 21:51:41 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Fri, May 05, 2023 at 05:57:37PM +0200, Sebastian Wick wrote:
> > > On Fri, May 5, 2023 at 5:28=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch=
> wrote:
> > > >
> > > > On Thu, May 04, 2023 at 03:22:59PM +0000, Simon Ser wrote:
> > > > > Hi all,
> > > > >
> > > > > The goal of this RFC is to expose a generic KMS uAPI to configure=
 the color
> > > > > pipeline before blending, ie. after a pixel is tapped from a plan=
e's
> > > > > framebuffer and before it's blended with other planes. With this =
new uAPI we
> > > > > aim to reduce the battery life impact of color management and HDR=
 on mobile
> > > > > devices, to improve performance and to decrease latency by skippi=
ng
> > > > > composition on the 3D engine. This proposal is the result of disc=
ussions at
> > > > > the Red Hat HDR hackfest [1] which took place a few days ago. Eng=
ineers
> > > > > familiar with the AMD, Intel and NVIDIA hardware have participate=
d in the
> > > > > discussion.
> > > > >
> > > > > This proposal takes a prescriptive approach instead of a descript=
ive approach.
> > > > > Drivers describe the available hardware blocks in terms of low-le=
vel
> > > > > mathematical operations, then user-space configures each block. W=
e decided
> > > > > against a descriptive approach where user-space would provide a h=
igh-level
> > > > > description of the colorspace and other parameters: we want to gi=
ve more
> > > > > control and flexibility to user-space, e.g. to be able to replica=
te exactly the
> > > > > color pipeline with shaders and switch between shaders and KMS pi=
pelines
> > > > > seamlessly, and to avoid forcing user-space into a particular col=
or management
> > > > > policy.
> > > >
> > > > Ack on the prescriptive approach, but generic imo. Descriptive pret=
ty much
> > > > means you need the shaders at the same api level for fallback purpo=
ses,
> > > > and we're not going to have that ever in kms. That would need somet=
hing
> > > > like hwc in userspace to work.
> > >
> > > Which would be nice to have but that would be forcing a specific colo=
r
> > > pipeline on everyone and we explicitly want to avoid that. There are
> > > just too many trade-offs to consider.
> > >
> > > > And not generic in it's ultimate consquence would mean we just do a=
 blob
> > > > for a crtc with all the vendor register stuff like adf (android dis=
play
> > > > framework) does, because I really don't see a point in trying a
> > > > generic-looking-but-not vendor uapi with each color op/stage split =
out.
> > > >
> > > > So from very far and pure gut feeling, this seems like a good middl=
e
> > > > ground in the uapi design space we have here.
> > >
> > > Good to hear!
> > >
> > > > > We've decided against mirroring the existing CRTC properties
> > > > > DEGAMMA_LUT/CTM/GAMMA_LUT onto KMS planes. Indeed, the color mana=
gement
> > > > > pipeline can significantly differ between vendors and this approa=
ch cannot
> > > > > accurately abstract all hardware. In particular, the availability=
, ordering and
> > > > > capabilities of hardware blocks is different on each display engi=
ne. So, we've
> > > > > decided to go for a highly detailed hardware capability discovery=
.
> > > > >
> > > > > This new uAPI should not be in conflict with existing standard KM=
S properties,
> > > > > since there are none which control the pre-blending color pipelin=
e at the
> > > > > moment. It does conflict with any vendor-specific properties like
> > > > > NV_INPUT_COLORSPACE or the patches on the mailing list adding AMD=
-specific
> > > > > properties. Drivers will need to either reject atomic commits con=
figuring both
> > > > > uAPIs, or alternatively we could add a DRM client cap which hides=
 the vendor
> > > > > properties and shows the new generic properties when enabled.
> > > > >
> > > > > To use this uAPI, first user-space needs to discover hardware cap=
abilities via
> > > > > KMS objects and properties, then user-space can configure the har=
dware via an
> > > > > atomic commit. This works similarly to the existing KMS uAPI, e.g=
. planes.
> > > > >
> > > > > Our proposal introduces a new "color_pipeline" plane property, an=
d a new KMS
> > > > > object type, "COLOROP" (short for color operation). The "color_pi=
peline" plane
> > > > > property is an enum, each enum entry represents a color pipeline =
supported by
> > > > > the hardware. The special zero entry indicates that the pipeline =
is in
> > > > > "bypass"/"no-op" mode. For instance, the following plane properti=
es describe a
> > > > > primary plane with 2 supported pipelines but currently configured=
 in bypass
> > > > > mode:
> > > > >
> > > > >     Plane 10
> > > > >     =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, =
Cursor} =3D Primary
> > > > >     =E2=94=9C=E2=94=80 =E2=80=A6
> > > > >     =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42, 52} =3D 0
> > > >
> > > > A bit confused, why is this an enum, and not just an immutable prop=
 that
> > > > points at the first element? You already can disable elements with =
the
> > > > bypass thing, also bypassing by changing the pointers to the next n=
ode in
> > > > the graph seems a bit confusing and redundant.
> > >
> > > We want to allow multiple pipelines to exist and a plane can choose
> > > the pipeline by selecting the first element of the pipeline. The enum
> > > here lists all the possible pipelines that can be attached to the
> > > surface.
> >
> > Ah in that case I guess we do need the flexibility of explicitly
> > enumerated object property right away I guess. The example looked a bit
> > like just bypass would do the trick.
>
> Setting individual pipeline elements to bypass is not flexible enough,
> because it does not allow re-ordering the pipeline elements.
>
> OTOH, hardware does not allow arbitrary re-ordering of elements,
> therefore all the "next" links in the pipeline elements are immutable.
>
> Presumably when some re-ordering in hardware is possible, the number of
> order-variants is small (given we can also bypass individual elements),
> so all variants are explicitly enumerated at the plane property.
>
> This way there are no traps like "you cannot enable all elements at the
> same time" that a single standard pipeline would end up with. All
> elements for all enumerated pipelines are always usable simultaneously,
> I believe.
>
> "Re-ordering" may not even be an accurate description of hardware. Some
> hardware elements could be mutually exclusive, whether they implement
> the same or a different operation.
>
> > > > > The non-zero entries describe color pipelines as a linked list of=
 COLOROP KMS
> > > > > objects. The entry value is an object ID pointing to the head of =
the linked
> > > > > list (the first operation in the color pipeline).
> > > > >
> > > > > The new COLOROP objects also expose a number of KMS properties. E=
ach has a
> > > > > type, a reference to the next COLOROP object in the linked list, =
and other
> > > > > type-specific properties. Here is an example for a 1D LUT operati=
on:
> > > >
> > > > Ok no comments from me on the actual color operations and semantics=
 of all
> > > > that, because I have simply nothing to bring to that except confusi=
on :-)
> > > >
> > > > Some higher level thoughts instead:
> > > >
> > > > - I really like that we just go with graph nodes here. I think that=
 was
> > > >   bound to happen sooner or later with kms (we almost got there wit=
h
> > > >   writeback, and with hindsight maybe should have).
> > > >
> > > > - Since there's other use-cases for graph nodes (maybe scaler modes=
, or
> > > >   histogram samplers for adaptive backglight, or blending that goes=
 beyond
> > > >   the stacked alpha blending we have now) it think we should make t=
his all
> > > >   fairly generic:
> > > >   * Add a new graph node kms object type.
> > > >   * Add a class type so that userspace knows which graph nodes it m=
ust
> > > >     understand for a feature (like "ColorOp" on planes here), and w=
hich it
> > > >     can ignore (like perhaps a scaler node to control the interpola=
tion)
> > > >   * Probably need to adjust the object property type. Currently tha=
t
> > > >     accept any object of a given type (crtc, fb, blob are the major=
 ones).
> > > >     I think for these graph nodes we want an explicit enumeration o=
f the
> > > >     possible next objects. In kms thus far we've done that with the
> > > >     separate possible_* mask properties, but they're cumbersome.
> > > >   * It sounds like for now we only have immutable next pointers, so=
 that
> > > >     would simplify the first iteration, but should probably anticip=
ate all
> > > >     this.
> > >
> > > Just to be clear: right now we don't expect any pipeline to be a grap=
h
> > > but only linked lists. It probably doesn't hurt to generalize this to
> > > graphs but that's not what we want to do here (for now).
> >
> > Oh a list is still a graph :-) Also my idea isn't to model a graph data
> > structure, but just the graph nodes, and a bit of scaffolding to handle
> > the links/pointers. Whether you only build a list of a graph out of tha=
t
> > is kinda irrelevant.
> >
> > Plus with the multiple pipelines you can already have a non-list in the
> > starting point already.
>
> No, there is no need for a graph. It literally is just multiple
> single-linked lists at the UAPI level, and userspace picks one for the
> plane.
>
> If you change the immutable "next element" properties to mutable, then
> I think the UAPI collapses. It becomes far too hard to know what even
> could work, and probing for success/failure like with KMS in general is
> simply infeasible.
>
> Let's leave the more wild scenarios for the second total rewrite of the
> KMS color API (assuming this is the start of the first). Otherwise we
> get nowhere. That's what Wayland protocol design work has taught us.

A list is still a graph.

What I'm asking for is _not_ that you make this into a full flexible
graph, because that doesn't make sense.

What I'm asking is that we don't add some special colorop nodes, like
we added planes, then cursor/primary planes, then writeback nodes in
the past, because there will be more. Instead I'm asking that you add
a graph node thing (call it a "it's only a list node but in future it
might be a more generic graph node" if that makes it easier to
understand, but maybe the uapi should have a shorter name like NODE,
like in "list node"), with a class value of "ColorOp" and an uapi
promise that userspace can ignore any graph nodes for classes it
doesn't understand when it walks a chain. Plus like the minimum amount
of scaffolding internall to make these graph nodes connect over edges
(which doesn't even have to be walkable really, just common support to
set/get links and check they point at something valid, for some value
of "valid" that makes sense).

I'm not asking you at all to make the graph you have any different, or
any more flexible, or anything like this at all. That can all be done
later on (probably with new classes and stuff since for color
conversion the linear pipeline is a good fit I think). I just don't
want a new GETFOORESOURCES and GETFOO/SETFOO ioctl DRM_MODE_OBJECT_FOO
for every new feature $FOO. Because there's going to be more than
ColorOp (historically about one new class every few years for the past
12 or so years of kms).

Does that make some sense? Or do we have to have this all specific to
ColorOp to make absolutey sure no one gets confused that a color
operations pipeline is linear to make sure that when people read "node
of the color op pipeline with a single immutable next pointer" they
somehow get the funky idea it's a full blown graph network? That seems
a bit excessive to me :-)
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
