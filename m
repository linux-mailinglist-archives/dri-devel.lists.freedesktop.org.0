Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFCA6FA218
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B5210E166;
	Mon,  8 May 2023 08:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A1C10E166;
 Mon,  8 May 2023 08:24:37 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ad89c7a84fso14783941fa.2; 
 Mon, 08 May 2023 01:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683534275; x=1686126275;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=LiQBHt3HXUARdHub7qHIl3CP4QbdGfdIbR7o51zOQJk=;
 b=cjkncK14irrsEHPzfMauqWH0jzXKEcl3c4uhtXzHRRclqVo2ILr7y/0M6VRQ5NJRJO
 IE26Pu8XOq8lhIQjJIXP+kJhY4qcDbiQXDEJk5TJgEwcayifU4ckcndJATZJ2vAji+Pq
 mo8CweY8E5GuaoB+e4OuN86syoeDS//z8Llgx9sPWXBVA0RpRE8Q9t2BwtjASJ6UrZ8p
 9G1p3KRyrpYbJVm8oxqykgM3oXP/E3ccdZfne8MNQvQimk2sI72UAmx1V4RFCeZQVktt
 mTHb4K8taBy7KR3Bf/40DDUVR6tZ1PPZs70p7PkG+v8HblRxt75bM/zKrO1ivUzk+qL5
 AgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683534275; x=1686126275;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LiQBHt3HXUARdHub7qHIl3CP4QbdGfdIbR7o51zOQJk=;
 b=jXJPlMrUZgA69VYnj7X3qkQOBOUmsbBwd+uBAPShY+itSjjpWThWWKC73of5YGovt6
 7bVhi+aD/eM6amYgxdtCjdOnyj3cYureHfAyL9+8xKZ4j4Kqn2i5XH+o3NIKO7U5VUvc
 0HlwG7iPmB0jt/ygrp1kv8RrXydVB417Mrmzrs7lDD7uOQ96f3g933CM/K9OWYJrxRs1
 qs+/hzpsdYl7T4zvwaaejkLhdXxmiMDE6jESTzgFdm7ptptsCLF4poxl+XtXXKzte6cR
 ykMTxKS0pUK/n5eIZY+tqv4GYs7PJtCA8F2TsOnh0WHBZkSar4P3PmThMPiwN8T56iu+
 Qy7w==
X-Gm-Message-State: AC+VfDxbZ3cD1MlotAGArqIkR731Llg/5G8FA23s5LsocXFClgTomUKQ
 AI9MYZQ/iiq7OBts3SpIa9w=
X-Google-Smtp-Source: ACHHUZ6Wa1S5zVu5gM1tQKTETUk8KwYVOcmoT0l/WrAEJSj4YT+zey+X3IPQOZJjlZcE/UJgQ+2GQQ==
X-Received: by 2002:a2e:940a:0:b0:2a7:9884:ad53 with SMTP id
 i10-20020a2e940a000000b002a79884ad53mr2512581ljh.48.1683534274516; 
 Mon, 08 May 2023 01:24:34 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 k16-20020a2e2410000000b002ac6b18999asm1101985ljk.4.2023.05.08.01.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 01:24:34 -0700 (PDT)
Date: Mon, 8 May 2023 11:24:23 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230508112423.688549cf@eldfell>
In-Reply-To: <ZFVeTcUOOpRrXtvI@phenom.ffwll.local>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <ZFUgnMI4IIbv78By@phenom.ffwll.local>
 <CA+hFU4wbU-FEkk2YrKOPOMNgODNbXXpmzi5EH5Pf3gJO08bQmw@mail.gmail.com>
 <ZFVeTcUOOpRrXtvI@phenom.ffwll.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bIlJ4Gr5pv.fF_v_O1XaBzX";
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
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Uma Shankar <uma.shankar@intel.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/bIlJ4Gr5pv.fF_v_O1XaBzX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 5 May 2023 21:51:41 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Fri, May 05, 2023 at 05:57:37PM +0200, Sebastian Wick wrote:
> > On Fri, May 5, 2023 at 5:28=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> =
wrote: =20
> > >
> > > On Thu, May 04, 2023 at 03:22:59PM +0000, Simon Ser wrote: =20
> > > > Hi all,
> > > >
> > > > The goal of this RFC is to expose a generic KMS uAPI to configure t=
he color
> > > > pipeline before blending, ie. after a pixel is tapped from a plane's
> > > > framebuffer and before it's blended with other planes. With this ne=
w uAPI we
> > > > aim to reduce the battery life impact of color management and HDR o=
n mobile
> > > > devices, to improve performance and to decrease latency by skipping
> > > > composition on the 3D engine. This proposal is the result of discus=
sions at
> > > > the Red Hat HDR hackfest [1] which took place a few days ago. Engin=
eers
> > > > familiar with the AMD, Intel and NVIDIA hardware have participated =
in the
> > > > discussion.
> > > >
> > > > This proposal takes a prescriptive approach instead of a descriptiv=
e approach.
> > > > Drivers describe the available hardware blocks in terms of low-level
> > > > mathematical operations, then user-space configures each block. We =
decided
> > > > against a descriptive approach where user-space would provide a hig=
h-level
> > > > description of the colorspace and other parameters: we want to give=
 more
> > > > control and flexibility to user-space, e.g. to be able to replicate=
 exactly the
> > > > color pipeline with shaders and switch between shaders and KMS pipe=
lines
> > > > seamlessly, and to avoid forcing user-space into a particular color=
 management
> > > > policy. =20
> > >
> > > Ack on the prescriptive approach, but generic imo. Descriptive pretty=
 much
> > > means you need the shaders at the same api level for fallback purpose=
s,
> > > and we're not going to have that ever in kms. That would need somethi=
ng
> > > like hwc in userspace to work. =20
> >=20
> > Which would be nice to have but that would be forcing a specific color
> > pipeline on everyone and we explicitly want to avoid that. There are
> > just too many trade-offs to consider.
> >  =20
> > > And not generic in it's ultimate consquence would mean we just do a b=
lob
> > > for a crtc with all the vendor register stuff like adf (android displ=
ay
> > > framework) does, because I really don't see a point in trying a
> > > generic-looking-but-not vendor uapi with each color op/stage split ou=
t.
> > >
> > > So from very far and pure gut feeling, this seems like a good middle
> > > ground in the uapi design space we have here. =20
> >=20
> > Good to hear!
> >  =20
> > > > We've decided against mirroring the existing CRTC properties
> > > > DEGAMMA_LUT/CTM/GAMMA_LUT onto KMS planes. Indeed, the color manage=
ment
> > > > pipeline can significantly differ between vendors and this approach=
 cannot
> > > > accurately abstract all hardware. In particular, the availability, =
ordering and
> > > > capabilities of hardware blocks is different on each display engine=
. So, we've
> > > > decided to go for a highly detailed hardware capability discovery.
> > > >
> > > > This new uAPI should not be in conflict with existing standard KMS =
properties,
> > > > since there are none which control the pre-blending color pipeline =
at the
> > > > moment. It does conflict with any vendor-specific properties like
> > > > NV_INPUT_COLORSPACE or the patches on the mailing list adding AMD-s=
pecific
> > > > properties. Drivers will need to either reject atomic commits confi=
guring both
> > > > uAPIs, or alternatively we could add a DRM client cap which hides t=
he vendor
> > > > properties and shows the new generic properties when enabled.
> > > >
> > > > To use this uAPI, first user-space needs to discover hardware capab=
ilities via
> > > > KMS objects and properties, then user-space can configure the hardw=
are via an
> > > > atomic commit. This works similarly to the existing KMS uAPI, e.g. =
planes.
> > > >
> > > > Our proposal introduces a new "color_pipeline" plane property, and =
a new KMS
> > > > object type, "COLOROP" (short for color operation). The "color_pipe=
line" plane
> > > > property is an enum, each enum entry represents a color pipeline su=
pported by
> > > > the hardware. The special zero entry indicates that the pipeline is=
 in
> > > > "bypass"/"no-op" mode. For instance, the following plane properties=
 describe a
> > > > primary plane with 2 supported pipelines but currently configured i=
n bypass
> > > > mode:
> > > >
> > > >     Plane 10
> > > >     =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Cu=
rsor} =3D Primary
> > > >     =E2=94=9C=E2=94=80 =E2=80=A6
> > > >     =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42, 52} =3D 0 =20
> > >
> > > A bit confused, why is this an enum, and not just an immutable prop t=
hat
> > > points at the first element? You already can disable elements with the
> > > bypass thing, also bypassing by changing the pointers to the next nod=
e in
> > > the graph seems a bit confusing and redundant. =20
> >=20
> > We want to allow multiple pipelines to exist and a plane can choose
> > the pipeline by selecting the first element of the pipeline. The enum
> > here lists all the possible pipelines that can be attached to the
> > surface. =20
>=20
> Ah in that case I guess we do need the flexibility of explicitly
> enumerated object property right away I guess. The example looked a bit
> like just bypass would do the trick.

Setting individual pipeline elements to bypass is not flexible enough,
because it does not allow re-ordering the pipeline elements.

OTOH, hardware does not allow arbitrary re-ordering of elements,
therefore all the "next" links in the pipeline elements are immutable.

Presumably when some re-ordering in hardware is possible, the number of
order-variants is small (given we can also bypass individual elements),
so all variants are explicitly enumerated at the plane property.

This way there are no traps like "you cannot enable all elements at the
same time" that a single standard pipeline would end up with. All
elements for all enumerated pipelines are always usable simultaneously,
I believe.

"Re-ordering" may not even be an accurate description of hardware. Some
hardware elements could be mutually exclusive, whether they implement
the same or a different operation.

> > > > The non-zero entries describe color pipelines as a linked list of C=
OLOROP KMS
> > > > objects. The entry value is an object ID pointing to the head of th=
e linked
> > > > list (the first operation in the color pipeline).
> > > >
> > > > The new COLOROP objects also expose a number of KMS properties. Eac=
h has a
> > > > type, a reference to the next COLOROP object in the linked list, an=
d other
> > > > type-specific properties. Here is an example for a 1D LUT operation=
: =20
> > >
> > > Ok no comments from me on the actual color operations and semantics o=
f all
> > > that, because I have simply nothing to bring to that except confusion=
 :-)
> > >
> > > Some higher level thoughts instead:
> > >
> > > - I really like that we just go with graph nodes here. I think that w=
as
> > >   bound to happen sooner or later with kms (we almost got there with
> > >   writeback, and with hindsight maybe should have).
> > >
> > > - Since there's other use-cases for graph nodes (maybe scaler modes, =
or
> > >   histogram samplers for adaptive backglight, or blending that goes b=
eyond
> > >   the stacked alpha blending we have now) it think we should make thi=
s all
> > >   fairly generic:
> > >   * Add a new graph node kms object type.
> > >   * Add a class type so that userspace knows which graph nodes it must
> > >     understand for a feature (like "ColorOp" on planes here), and whi=
ch it
> > >     can ignore (like perhaps a scaler node to control the interpolati=
on)
> > >   * Probably need to adjust the object property type. Currently that
> > >     accept any object of a given type (crtc, fb, blob are the major o=
nes).
> > >     I think for these graph nodes we want an explicit enumeration of =
the
> > >     possible next objects. In kms thus far we've done that with the
> > >     separate possible_* mask properties, but they're cumbersome.
> > >   * It sounds like for now we only have immutable next pointers, so t=
hat
> > >     would simplify the first iteration, but should probably anticipat=
e all
> > >     this. =20
> >=20
> > Just to be clear: right now we don't expect any pipeline to be a graph
> > but only linked lists. It probably doesn't hurt to generalize this to
> > graphs but that's not what we want to do here (for now). =20
>=20
> Oh a list is still a graph :-) Also my idea isn't to model a graph data
> structure, but just the graph nodes, and a bit of scaffolding to handle
> the links/pointers. Whether you only build a list of a graph out of that
> is kinda irrelevant.
>=20
> Plus with the multiple pipelines you can already have a non-list in the
> starting point already.

No, there is no need for a graph. It literally is just multiple
single-linked lists at the UAPI level, and userspace picks one for the
plane.

If you change the immutable "next element" properties to mutable, then
I think the UAPI collapses. It becomes far too hard to know what even
could work, and probing for success/failure like with KMS in general is
simply infeasible.

Let's leave the more wild scenarios for the second total rewrite of the
KMS color API (assuming this is the start of the first). Otherwise we
get nowhere. That's what Wayland protocol design work has taught us.


Thanks,
pq

--Sig_/bIlJ4Gr5pv.fF_v_O1XaBzX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRYsbcACgkQI1/ltBGq
qqfS8A//QGxiEb7e8zFAYG8NUI7OsozX7XyFOk7C0RZYifsl/tvbyWQkml2NYaxS
EIDz+B0nS+5PY5fDKG6RqY4cGzQQO9QnvRLdi6LnI2VPAgRXXwA0mycQ0W+GWXd6
dvdfPfmDV57AFHs8gDQWuMIUdgHMW0MLkHmo9j0yhT1aZhPxvpqfoaq6RAGnijBM
WBIEuc82KHYE/44+4a4Hgs28qGuwJ7pcKtbtfZx2HERykkn4IdTSxWUM8g54Z/K4
MmBGG5bELiHqTGucTRmRn9tYK2zCOq6jXnhFBvp1GZec6q+6iQ/wGl2ldu6kIgus
KsoA1OGhc1QXmytaptjAnggR/Ko5IvT7DtW24fPTYsP5zzjhtA2e0/Rh4ui7TlCM
kSXle7QfE55VkEBWv7g9Id76OOxolFby7sQx4o7D4EDUTyBYAyskGuLBty4yDLu8
2kKPXjs/f3027hk9rGKPTiTcHadBKNlFE0m9GxgRJFrz4TW5zLSKr0ceSka+Pyn7
2b6EvPhC4KxPWXnddFM0Uhg2dgNIZEDMTpxqWMvJLJUbm+KTe7LunGvKP3Tq28Pi
OxhGAy/WvuCc4DPgvgO/G0hhVLcxWffb1TyKYH0lTv7kHLtI5cOZGkpta1GHfiOP
/GqYe/M7ihBzxGf8dnT072X08+u7Sp/lH7VW+KBabpldSeB84eg=
=+Za6
-----END PGP SIGNATURE-----

--Sig_/bIlJ4Gr5pv.fF_v_O1XaBzX--
