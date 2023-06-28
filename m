Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 178897409BB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 09:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3005010E363;
	Wed, 28 Jun 2023 07:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B0210E0C7;
 Wed, 28 Jun 2023 07:35:06 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b69f1570b2so52817221fa.0; 
 Wed, 28 Jun 2023 00:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687937702; x=1690529702;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=N33RcmQutQvjVzSWqaySsbgKTXWzIERCtDZik833rC0=;
 b=G13bihmEccVqr/idqAttrUSw0l4LRbO4rG4ieXAA5YyAzLpX1UH6owKjVOp/o8RIrs
 v6Arooii8y5RStjD0PubpEdyxHfQdmdV5/YPlBq4U9Z1oq8+4iy0KvO29pgizVQILXfa
 1ALIXJbXT8M0OyPdVva72YaG0Ztm5+XyELj7wKw0hRbCGrm3Pi1oNsxHKJypicK8dGO7
 3moNhGpYMjsVsIVNUP+PE4Wyu/o6NoPb9LZjQGU+8SYuGfNhwVQjOesv+4BWOn97YIUL
 sbFREv+163YfttkLeMctyb6D/3UK2Xe+tIJO2KMty8aRgX6A/CPSH+dlNUbjaXTct1J1
 Tabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687937702; x=1690529702;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N33RcmQutQvjVzSWqaySsbgKTXWzIERCtDZik833rC0=;
 b=BRxoLsQLhJRdVX1l1qSTPD7tkmDMDvBNVCwfDX3gN8R9WMB15i9LmIZUsfSd2sbf3q
 Q9D8TmWHFL/71BF3SQSqieF2zMus9SGyFrtZz7s0tH6tPXnBvG5fKx+qen4SxANtowdy
 j76z706xRm2VlXuw3ti12hF8rs4zhcGyLKx5FmJ6P49Nx6ZQBpk36ARnBaaADeb5n4/4
 drOPb72mmmWwFcuWEhaIUQE5i8xdxOhQU9qsUBrl1CPXsTxFwH5ZcYUJGMxitGCvamgx
 q1tBezEmaklPhIEJ18jX0v26FcMmju5GBxRWAnSRMpWAsReh2S5qqsTO9yV/NviOldcs
 NbeQ==
X-Gm-Message-State: AC+VfDz1cE38pWlvbN9ZBbr+bghEp4DBtC4+ZwIP2YiRuEAUT1ytccsx
 1R25IijGBE7KumwCZqn0wMk=
X-Google-Smtp-Source: ACHHUZ5WnLUSWXzo2R3JpE7qMA5ff8cm1wq1KpRo/QLDHbpCdnZyFslZfkxZNk66g/SZf2HYPxEDGQ==
X-Received: by 2002:a2e:3210:0:b0:2b4:7559:32b0 with SMTP id
 y16-20020a2e3210000000b002b4755932b0mr18391054ljy.19.1687937701966; 
 Wed, 28 Jun 2023 00:35:01 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 l25-20020a2e99d9000000b002b69fcb08c6sm1525127ljj.72.2023.06.28.00.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 00:35:01 -0700 (PDT)
Date: Wed, 28 Jun 2023 10:34:51 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [RFC PATCH 0/3] Support for Solid Fill Planes
Message-ID: <20230628103451.118c0d76@eldfell>
In-Reply-To: <1613cdd4-8d90-6589-97e8-c4e1810bde04@quicinc.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com>
 <d0b5abdc-85ad-fee2-9760-866c32bab111@quicinc.com>
 <20230627105849.004050b3@eldfell>
 <5e60fe99-76d5-c242-608e-b74bf6f0e7bd@quicinc.com>
 <54f194fe-ab7b-247d-600b-6da8f5c57dbf@linaro.org>
 <1613cdd4-8d90-6589-97e8-c4e1810bde04@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/==yIrQ9htb+tmLinLHQNTqp";
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/==yIrQ9htb+tmLinLHQNTqp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Jun 2023 15:10:19 -0700
Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:

> On 6/27/2023 2:59 PM, Dmitry Baryshkov wrote:
> > On 28/06/2023 00:27, Jessica Zhang wrote: =20
> >>
> >>
> >> On 6/27/2023 12:58 AM, Pekka Paalanen wrote: =20
> >>> On Mon, 26 Jun 2023 16:02:50 -0700
> >>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >>> =20
> >>>> On 11/7/2022 11:37 AM, Ville Syrj=C3=A4l=C3=A4 wrote: =20
> >>>>> On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote: =20
> >>>>>> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
> >>>>>> properties. When the color fill value is set, and the framebuffer=
=20
> >>>>>> is set
> >>>>>> to NULL, memory fetch will be disabled. =20
> >>>>>
> >>>>> Thinking a bit more universally I wonder if there should be
> >>>>> some kind of enum property:
> >>>>>
> >>>>> enum plane_pixel_source {
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0FB,
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0COLOR,
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0LIVE_FOO,
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0LIVE_BAR,
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0...
> >>>>> } =20
> >>>>
> >>>> Reviving this thread as this was the initial comment suggesting to
> >>>> implement pixel_source as an enum.
> >>>>
> >>>> I think the issue with having pixel_source as an enum is how to deci=
de
> >>>> what counts as a NULL commit.
> >>>>
> >>>> Currently, setting the FB to NULL will disable the plane. So I'm
> >>>> guessing we will extend that logic to "if there's no pixel_source set
> >>>> for the plane, then it will be a NULL commit and disable the plane".
> >>>>
> >>>> In that case, the question then becomes when to set the pixel_source=
 to
> >>>> NONE. Because if we do that when setting a NULL FB (or NULL solid_fi=
ll
> >>>> blob), it then forces userspace to set one property before the other=
. =20
> >>>
> >>> Right, that won't work.
> >>>
> >>> There is no ordering between each property being set inside a single
> >>> atomic commit. They can all be applied to kernel-internal state
> >>> theoretically simultaneously, or any arbitrary random order, and the
> >>> end result must always be the same. Hence, setting one property cannot
> >>> change the state of another mutable property. I believe that doing
> >>> otherwise would make userspace fragile and hard to get right.
> >>>
> >>> I guess there might be an exception to that rule when the same proper=
ty
> >>> is set multiple times in a single atomic commit; the last setting in
> >>> the array prevails. That's universal and not a special-case between t=
wo
> >>> specific properties.
> >>> =20
> >>>> Because of that, I'm thinking of having pixel_source be represented=
=20
> >>>> by a
> >>>> bitmask instead. That way, we will simply unset the corresponding
> >>>> pixel_source bit when passing in a NULL FB/solid_fill blob. Then, in
> >>>> order to detect whether a commit is NULL or has a valid pixel=20
> >>>> source, we
> >>>> can just check if pixel_source =3D=3D 0. =20
> >>>
> >>> Sounds fine to me at first hand, but isn't there the enum property th=
at
> >>> says if the kernel must look at solid_fill blob *or* FB_ID?
> >>>
> >>> If enum prop says "use solid_fill prop", the why would changes to FB_=
ID
> >>> do anything? Is it for backwards-compatibility with KMS clients that =
do
> >>> not know about the enum prop?
> >>>
> >>> It seems like that kind of backwards-compatiblity will cause problems
> >>> in trying to reason about the atomic state, as explained above, leadi=
ng
> >>> to very delicate and fragile conditions where things work intuitively.
> >>> Hence, I'm not sure backwards-compatibility is wanted. This won't be
> >>> the first or the last KMS property where an unexpected value left over
> >>> will make old atomic KMS clients silently malfunction up to showing no
> >>> recognisable picture at all. *If* that problem needs solving, there
> >>> have been ideas floating around about resetting everything to nice
> >>> values so that userspace can ignore what it does not understand. So f=
ar
> >>> there has been no real interest in solving that problem in the kernel
> >>> though.
> >>>
> >>> Legacy non-atomic UAPI wrappers can do whatever they want, and program
> >>> any (new) properties they want in order to implement the legacy
> >>> expectations, so that does not seem to be a problem. =20
> >>
> >> Hi Pekka and Dmitry,
> >>
> >> After reading through both of your comments, I think I have a better=20
> >> understanding of the pixel_source implementation now.
> >>
> >> So to summarize, we want to expose another property called=20
> >> "pixel_source" to userspace that will default to FB (as to not break=20
> >> legacy userspace).
> >>
> >> If userspace wants to use solid fill planes, it will set both the=20
> >> solid_fill *and* pixel_source properties to a valid blob and COLOR=20
> >> respectively. If it wants to use FB, it will set FB_ID and=20
> >> pixel_source to a valid FB and FB.
> >>
> >> Here's a table illustrating what I've described above:
> >>
> >> +-----------------+-------------------------+-------------------------+
> >> | Use Case=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Legacy Userspac=
e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | solid_fill-aware=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | Userspace=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> >> | Valid FB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | pixel_source =
=3D FB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | pixel_source =3D FB=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FB_ID =3D valid FB=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | FB_ID =3D valid FB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |
> >> +-----------------+-------------------------+-------------------------+
> >> | Valid=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
pixel_source =3D COLOR=C2=A0=C2=A0=C2=A0 | N/A=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
> >> | solid_fill blob | solid_fill =3D valid blob |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =20
> >=20
> > Probably these two cells were swapped.
> >  =20
>=20
> Ack, yes they were swapped.
>=20
> >> +-----------------+-------------------------+-------------------------+
> >> | NULL commit=C2=A0=C2=A0=C2=A0=C2=A0 | pixel_source =3D FB=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | pixel_source =3D FB=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |
> >> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FB_ID =3D NULL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FB_ID =3D NULL=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> >> +-----------------+-------------------------+-------------------------=
+ =20
> >=20
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | or:
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | pixel_source =3D COLOR
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | solid_fill =3D NULL =
=20
> >>
> >> Is there anything I'm missing or needs to be clarified?
> >> =20
> >=20
> > LGTM otherwise
> >  =20
>=20
> LGTM too.

Hi,

yeah, that sounds fine to me, if everyone thinks that adding a new
property for pixel_source is a good idea. I just assumed it was already
agreed, and based my comments on that.

I don't really remember much of the discussion about a special FB that
is actually a solid fill vs. this two new properties design, so I
cannot currently give an opinion on that, or any other design.

Btw. there may be some confusion about "legacy userspace" which usually
refers to pre-atomic userspace, and old atomic userspace that does not
understand the new properties. That makes no difference in the table
here though, the legacy ioctls should just smash pixel_source.


Thanks,
pq

--Sig_/==yIrQ9htb+tmLinLHQNTqp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSb4psACgkQI1/ltBGq
qqcBTA//X2vnk1apn2S325V3wYmb+NDIQK12CHazRPGjEnCYEdqRnv+HrYw6qCC7
OloH4fXVt4L3o67DTJMCbFmJvpzuoy2AcmHJtlL9X6lA+mzyFdXW/5WBBIHuo291
pQmUBBQS+rvRkl1i9Ge5NSor/6v7242q7NJzCsqIor4hRxYWaWbJrAxPjEg1fSNF
YogLsJ4niekSCxSJ7xuOGDHSwqTcj/1rxUxte0GMsv5Ej2EjArJCQOqrvzH4knrl
ygabckM3n0LIKbppC8nIAJyQpOGCAxkUhurb51v76kpQBxQRpt7KLvH9NmVZxmHs
Wp9ECI9bgZ2DCfbzEN7k4UBR7qaVQTS4++2ETfIIwVLzqHo4/y4phzcNZSKZM2Y1
Ybj2BD49yQ4ImA+Ngy//GCt7bIIc9pggx26c/EMbOjQqc40BhzCUxfIJvEKuZUOX
wQhDYmcE3ZiOoTN8XBk9uvDGiSUmPVbvCnXiUAfi4ug7fAoaUAkpVaselEs1wQqC
Vkb7Ok7xS9kamqtQdS+03FWAm4GJZbNVQvCjYywEJff0xIhVJtOEHsrfY5OVSHAp
CHKM795tt4gpKbTsyKH5LkJA2LAxYNUl8Tvo9QeFCLLZZW5t+BqOj3toVWtk4Vm8
Ce1Yra6A4yiYKH62mPcqZ/LHLNnbBCg7Vyu4tdh50+CePqJAIsM=
=fY0p
-----END PGP SIGNATURE-----

--Sig_/==yIrQ9htb+tmLinLHQNTqp--
