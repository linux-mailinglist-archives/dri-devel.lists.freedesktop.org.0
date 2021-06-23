Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC683B1925
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 13:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5566E8B5;
	Wed, 23 Jun 2021 11:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC5F6E8B5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 11:41:21 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id j4so3550353lfc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 04:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=4jXNkZBkJCroCZHEHJk4Yl0iihmMmzV2M0MO5HkyT6Q=;
 b=YYkBUkBpU74bPcyMCofnr6vYjMEV/taXJMbO203C+UhmzYMZlLtfIj6jjYVfkot34R
 FRyZMgx0hOwJNSjaJgn3ZOrlsluA8fZdlaumVe0xerzgjPQJxZrJa4mtYIAs/LaBOTbo
 ewVkZ9FycNDqwmYWW6cgAHTtmI0xJHp4OCk2qEJOoT+tBqJtDXzz0iaNEK77VOU/eCRD
 lUWBEWcMnE40AGTXpElCm1wymHKCcpGZ3gAdO1qxfGTqFqGb+wIM2iy9eFKW2LZ0lffi
 SbtHGSiq/ZNnIBSpy+Q1eRqbzNjFSx6103ZvlmIIE5VySWxlOozjSZX6LO5Iu9FC8FWL
 a3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=4jXNkZBkJCroCZHEHJk4Yl0iihmMmzV2M0MO5HkyT6Q=;
 b=P/2S7bhu3i0krw5daZ2UvQ45cu1b9LRDLnjra4Axrzo+qmI+ny535M2mg3kyEd2llv
 R8TPOILw/eUVj3gaN59eLUjWjG+Quc6ttRSzQPQb8n6DWHxmX564a++/LI1XkLt8Kdse
 qxJAsCTyy36SzZMUX5LxUAPlxLQIJUevOF6zWKL3dUqMTD3hdcR4q/hFvz/2eZpqds3L
 UKQ9QS5+kQHz+pGjQHgfB08ztJQWeCPpN6kzolLtwo+KOOYT0DlkgmuCKNDg5cYaHay6
 QAjPHdmyH2OHpTFEobuXpdLCnJeDRZUo9ZMrUTnEwJmf3Sie5VqFNN/SyGFDlV5v6S7G
 IiiA==
X-Gm-Message-State: AOAM533S8zg2NAissvlSqOD3N/9kP+2XkTr7aYSa8lKyqt9cBsB/O4xv
 gxx98nQF7RF+hk3pGUTA4Zc=
X-Google-Smtp-Source: ABdhPJzQLBEqhzr9/Fy6xHJQZ8lzEEnYgFyW2SIS8NS68pVkr6MWIEVK/UvsgUwXnzeArDL4SiA5+A==
X-Received: by 2002:a05:6512:1191:: with SMTP id
 g17mr4457991lfr.347.1624448479689; 
 Wed, 23 Jun 2021 04:41:19 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id c12sm2067401lfc.32.2021.06.23.04.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 04:41:19 -0700 (PDT)
Date: Wed, 23 Jun 2021 14:41:15 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Esaki Tomohito <etom@igel.co.jp>
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
Message-ID: <20210623144115.1bc55db1@eldfell>
In-Reply-To: <ab816c34-ff98-911f-e53d-b91cd3be6f2b@igel.co.jp>
References: <20210621062742.26073-1-etom@igel.co.jp>
 <7cde82a9-c60c-e527-eeac-eaad0c5842a1@metux.net>
 <1cfab5f9-f275-aa53-00de-5da3fcea71c5@igel.co.jp>
 <20210622111239.73aa87aa@eldfell>
 <ee0161b5-c88b-40ce-c02f-86e0927b70bb@igel.co.jp>
 <20210623113922.1e603139@eldfell>
 <ab816c34-ff98-911f-e53d-b91cd3be6f2b@igel.co.jp>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ljMzJSbhx05gG.4fz0yC81V";
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
Cc: devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ljMzJSbhx05gG.4fz0yC81V
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Jun 2021 18:22:47 +0900
Esaki Tomohito <etom@igel.co.jp> wrote:

> On 2021/06/23 17:39, Pekka Paalanen wrote:
> > On Wed, 23 Jun 2021 15:56:05 +0900
> > Esaki Tomohito <etom@igel.co.jp> wrote:
> >  =20
> >> Hi,
> >> Thank you all for your comments.
> >>
> >> On 2021/06/22 17:12, Pekka Paalanen wrote: =20
> >>> On Tue, 22 Jun 2021 13:03:39 +0900
> >>> Esaki Tomohito <etom@igel.co.jp> wrote:
> >>>    =20
> >>>> Hi, Enrico Weigelt
> >>>> Thank you for reply.
> >>>>
> >>>> On 2021/06/22 1:05, Enrico Weigelt, metux IT consult wrote:   =20
> >>>>> On 21.06.21 08:27, Tomohito Esaki wrote:
> >>>>>
> >>>>> Hi,
> >>>>>      =20
> >>>>>> Virtual DRM splits the overlay planes of a display controller into=
 multiple
> >>>>>> virtual devices to allow each plane to be accessed by each process.
> >>>>>>
> >>>>>> This makes it possible to overlay images output from multiple proc=
esses on a
> >>>>>> display. For example, one process displays the camera image withou=
t compositor
> >>>>>> while another process overlays the UI.     =20
> >>>>>
> >>>>> Are you attempting to create an simple in-kernel compositor ?     =
=20
> >>>>
> >>>> I think the basic idea is the same as DRMlease.   =20
> >>>
> >>> Hi,
> >>>
> >>> indeed. Why not use DRM leases instead?
> >>>    =20
> >>
> >> In this use case, I understand that this is not possible with DRM leas=
e,
> >> am I wrong?
> >> I understand that it=E2=80=99s not possible to lease a plane and updat=
e planes
> >> on the same output independently from different processes in current D=
RM
> >> lease.
> >>
> >> If this is correct, what do you think of adding support for plane leas=
es
> >> to the DRM lease to handle this case? =20
> >=20
> > Hi,
> >=20
> > I would love to see support added for leasing individual planes,
> > especially to replace the virtual DRM proposal which seems to be
> > eradicating everything that atomic modesetting and nuclear pageflip
> > have built over the many years.
> >=20
> > However, please note that "on the same output independently" is
> > physically impossible. Semantically, the planes define what a CRTC
> > scans out, and the CRTC defines the scanout timings. Therefore it is not
> > possible to update individual planes independently, they will all
> > always share the timings of the CRTC.
> >=20
> > That combined with KMS not allowing multiple updates to be queued at
> > the same time for the same CRTC (atomic commits and legacy pageflips
> > returning EBUSY) makes the plane updates very much inter-dependent.
> >=20
> > If you want to avoid EBUSY and have planes update on the vblank you
> > intended, you really need a userspace compositor to pull everything
> > together *before* submitting anything to the kernel. =20
>=20
> Hi,
>=20
> Thank you for your comments and advice.
> I will consider leasing a plane.

Hi,

I wish you considered a userspace compositor first, once more, with
passion.

It does not need to be Weston, and it does not need to use Wayland.
Just a userspace daemon that owns the whole display device and somehow
talks to whatever else wants stuff on screen.

I have not seen any evidence that leasing individual planes would do
you any good. I can easily see it doing you harm. I'm only saying that
it would be better than the virtual DRM proposal if you absolutely have
to go there. Please, consider not going there at all.

"On the same output independently" is not possible for the very simple
reason that the pixel data needs to be streamed serially to a monitor.


Thanks,
pq

--Sig_/ljMzJSbhx05gG.4fz0yC81V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDTHdsACgkQI1/ltBGq
qqcLZg//QkFy2hWZeB2Fkh+0ETzd5SkUgpmcL5x8+DLBH71YJk0Z3+sb9EhK1jl+
kfcuHCiAE9p1f3VpiOp8c0R7zpPqanhi6epHZ8iUQHksXrt6IG84GntHafCOeTeW
6xhQrCfV9RdhASfrKFTt0AFIcP1nw7daACtGDVMMKoUH5NzdrmEZClqxHFQ+3sti
NQZ96YGUNWkbmJ9UMki4qeJ/2Rp77YKUcFXBy4qZ2MZufuAB1iRt85C3DEWJQZOp
0JXxYEfFmaLj+9fEVeI5bMAWlIGbP9tzNhCc74xUhUTnryAOvhb/9X0C0hNiHG9T
aJrNBvTEYWayx28S6w8rLSCAoJ3CpMr9pAfZSehxzZDyaRpJf0+Lj55xb9VRUT7V
Hx5Wu+2bDdC3BFP0puhbD/bgWTcgHNGmPvVinqFfGoZYsp9nz+q2g4IEB7zYrDyt
yJsfPl8b1lGSzWvESjzNVE3QyP99142rULB3YvZa8zbgQuYkIlOMRGWeaJw9FxkI
w0zGDMQYZoaJ1kC615SweChTRkkN52CW49MKIsvtVDHdxhIKuD7P3ij6Cq9OAyuW
uqa/lz2uBZOrWEfv3S1f/O1fdWO0U1juNIF1DIvszZo4KDjn1Z9flOqd1/gKSzaa
NOaKo0UKDqzSrnj/gMdQRk+3aoxOA5WrQ5Uq3wh3juagyeHW1BA=
=+5tU
-----END PGP SIGNATURE-----

--Sig_/ljMzJSbhx05gG.4fz0yC81V--
