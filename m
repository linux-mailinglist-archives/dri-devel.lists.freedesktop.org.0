Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0A58A4A31
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 10:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81326112312;
	Mon, 15 Apr 2024 08:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RhCPd0ay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF225112312;
 Mon, 15 Apr 2024 08:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713169203;
 bh=DxxbWyUCO8m89FPIcy1pvTcJZ1Fm/MAWdmp25lpyqzE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RhCPd0ayb7ZSa6NhCfEKn0dwJxmKPuaM+ao5Ys9YTArqgYOKI3O4kqEPfxbum6Kpn
 vDz0Mdmn1X5lrZvs7UqfxLJK9EogwK3McTKabvW/hiiSr7p/5GRrIvq5FFA3w3SfoF
 siSqnu9TwgzCXO5J/Y09KwwWul5KGlMk+HrxN2FUKIp69KUgFP6eJQlY/N7vuF3+rA
 xIaVcqHS2Xoa/eXmXC1Adiblx5Nlo8uUuwg2jpMwS5vs/lPD8VfG5sQ4kKsVCo9ZVY
 fu263OthtmHt4GRQX2kZPpMXgJIy3/ehWixkRTInh1VoWUY9S26JymkVtag1eHiTQi
 A9E35fVAYH4gg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 457E837809D1;
 Mon, 15 Apr 2024 08:20:02 +0000 (UTC)
Date: Mon, 15 Apr 2024 11:19:53 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, Marius Vlad
 <marius.vlad@collabora.com>, Harry Wentland <harry.wentland@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, Joshua
 Ashton <joshua@froggi.es>, Michel =?UTF-8?B?RMOkbnplcg==?=
 <mdaenzer@redhat.com>, Chao Guo <chao.guo@nxp.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, Vikas Korjani <Vikas.Korjani@amd.com>, Robert Mader
 <robert.mader@posteo.de>, Sean Paul <sean@poorly.run>, Simon Ser
 <contact@emersion.fr>, Shashank Sharma <shashank.sharma@amd.com>, Sebastian
 Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH 0/2] drm/amdgpu/display: Make multi-plane configurations
 more flexible
Message-ID: <20240415111953.04b65a53.pekka.paalanen@collabora.com>
In-Reply-To: <75f2b674-4ad5-4d36-9708-0eea9a9bba6a@amd.com>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
 <20240328163311.34b58b39.pekka.paalanen@collabora.com>
 <1ca9c55b-2358-4357-a337-c0bf5e3e2118@amd.com>
 <20240404132411.5bb5cb53.pekka.paalanen@collabora.com>
 <b1613277-567d-47db-af84-74dfad2e9cf2@amd.com>
 <Zg63qvnHgutUARrh@xpredator>
 <46968a40-e0e5-4af9-b859-8a41d5992863@amd.com>
 <20240412110325.4afa29ca.pekka.paalanen@collabora.com>
 <7d04e345-b319-4e2f-a1d3-378cc1881144@amd.com>
 <20240412180741.360d8c2b.pekka.paalanen@collabora.com>
 <CADnq5_MD4EBm4kGuK3fa0azKsMimEnTM3tm-Hy8CN-NNtom3Kw@mail.gmail.com>
 <75f2b674-4ad5-4d36-9708-0eea9a9bba6a@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TKaTbrd5W+Ubs==7Ex4oH3d";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/TKaTbrd5W+Ubs==7Ex4oH3d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Apr 2024 16:14:28 -0400
Leo Li <sunpeng.li@amd.com> wrote:

> On 2024-04-12 11:31, Alex Deucher wrote:
> > On Fri, Apr 12, 2024 at 11:08=E2=80=AFAM Pekka Paalanen
> > <pekka.paalanen@collabora.com> wrote: =20
> >>
> >> On Fri, 12 Apr 2024 10:28:52 -0400
> >> Leo Li <sunpeng.li@amd.com> wrote:
> >> =20
> >>> On 2024-04-12 04:03, Pekka Paalanen wrote: =20
> >>>> On Thu, 11 Apr 2024 16:33:57 -0400
> >>>> Leo Li <sunpeng.li@amd.com> wrote:
> >>>> =20
> >>
> >> ...
> >> =20
> >>>>> That begs the question of what can be nailed down and what can left=
 to
> >>>>> independent implementation. I guess things like which plane should =
be enabled
> >>>>> first (PRIMARY), and how zpos should be interpreted (overlay, under=
lay, mixed)
> >>>>> can be defined. How to handle atomic test failures could be as well=
. =20
> >>>>
> >>>> What room is there for the interpretation of zpos values?
> >>>>
> >>>> I thought they are unambiguous already: only the relative numerical
> >>>> order matters, and that uniquely defines the KMS plane ordering. =20
> >>>
> >>> The zpos value of the PRIMARY plane relative to OVERLAYS, for example=
, as a way
> >>> for vendors to communicate overlay, underlay, or mixed-arrangement su=
pport. I
> >>> don't think allowing OVERLAYs to be placed under the PRIMARY is curre=
ntly
> >>> documented as a way to support underlay. =20
> >>
> >> I always thought it's obvious that the zpos numbers dictate the plane
> >> order without any other rules. After all, we have the universal planes
> >> concept, where the plane type is only informational to aid heuristics
> >> rather than defining anything.
> >>
> >> Only if the zpos property does not exist, the plane types would come
> >> into play.
> >>
> >> Of course, if there actually exists userspace that fails if zpos allows
> >> an overlay type plane to be placed below primary, or fails if primary
> >> zpos is not zero, then DRM needs a new client cap. =20
>=20
> Right, it wasn't immediately clear to me that the API allowed placement o=
f=20
> things beneath the PRIMARY. But reading the docs for drm_plane_create_zpo=
s*,=20
> there's nothing that forbids it.
>=20
> >> =20
> >>> libliftoff for example, assumes that the PRIMARY has the lowest zpos.=
 So
> >>> underlay arrangements will use an OVERLAY for the scanout plane, and =
the PRIMARY
> >>> for the underlay view. =20
> >>
> >> That's totally ok. It works, right? Plane type does not matter if the
> >> KMS driver accepts the configuration.
> >>
> >> What is a "scanout plane"? Aren't all KMS planes by definition scanout
> >> planes? =20
>=20
> Pardon my terminology, I thought the scanout plane was where weston rende=
red
> non-offloadable surfaces to. I guess it's more correct to call it the "re=
nder
> plane". On weston, it seems to be always assigned to the PRIMARY.
>=20

The assignment restriction is just technical design debt. It is
limiting. There is no other good reason for it, than when lighting
up a CRTC for the first time, Weston should do it with the renderer FB
only, on the plane that is most likely to succeed i.e. PRIMARY. After
the CRTC is lit, there should be no built-in limitations in what can go
where.

The reason for this is that if a CRTC can be activated, it must always
be able to show the renderer FB without incurring a modeset. This is
important for ensuring that the fallback compositing (renderer) is
always possible. So we start with that configuration, and everything
else is optional bonus.

>=20
> For libliftoff, using OVERLAYs as the render plane and PRIMARY as the und=
erlay
> plane would work. But I think keeping the render plane on PRIMARY (a la w=
eston)
> makes underlay arrangements easier to allocate, and would be nice to inco=
rporate
> into a shared algorithm.

If zpos exists, I don't think such limitation is a good idea. It will
just limit the possible configurations for no reason.

With zpos, the KMS plane type should be irrelevant for their
z-ordering. Underlay vs. overlay completely loses its meaning at the
KMS level.

> In an underlay arrangement, pushing down an OVERLAY's zpos below the PRIM=
ARY's
> zpos is simpler than swapping their surfaces. If such an arrangement fails
> atomic_test, we won't have to worry about swapping the surfaces back. Of =
course,
> it's not that we can't keep track of that in the algorithm, but I think i=
t does
> make things easier.

There is no "swapping" or "swapping back". The tentative configuration
is created as a new object that contains the complete CRTC+connector
state, and if it doesn't work, it's simply destroyed. In Weston at
least, I don't know of libliftoff.

One surface could also be assigned to multiple KMS planes for different
CRTCs, so there should be no 1:1 association in the first place.

> It may help with reducing the amount of atomic tests. Assuming that the s=
ame DRM
> plane provides the same format/color management/transformation support
> regardless of it's zpos,

I would definitely expect so.

> we should be able to reasonably expect that changing
> it's z-ordering will not cause atomic_test failures (or at least, expect =
less
> causes for failure). In other words, swapping the render plane from the P=
RIMARY
> to an OVERLAY might have more causes for an atomic_test fail, versus chan=
ging
> their z-ordering. The driver might have to do more things under-the-hood =
to
> provide this consistent behavior, but I think that's the right place for =
it.
> After all, drivers should know more about their hardware's behavior.

Indeed.

> The assumption that the PRIMARY has the lowest zpos isn't always true. I
> was made aware that the imx8mq platform places all of their OVERLAYS bene=
ath the
> PRIMARY. Granted, the KMS code for enabling OVERLAYS is not upstream yet,=
 but it
> is available from this thread:
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1258#note_=
2319898
> . I guess this is more of a bad assumption that should be fixed in liblif=
toff.

Weston needs fixing too, at least in case a renderer FB is used on the
CRTC. Weston has two problems: renderer FB is always on PRIMARY plane,
and renderer FB is always completely opaque.


Thanks,
pq

> >>
> >> IOW, if the KMS client understands zpos and can do a proper KMS
> >> configuration search, and all planes have zpos property, then there is
> >> no need to look at the plane type at all. That is the goal of the
> >> universal planes feature. =20
> >=20
> > The optimal configuration with DCN hardware is using underlays.  E.g.,
> > the desktop plane would be at the top and would have holes cut out of
> > it for videos or windows that want their own plane.  If you do it the
> > other way around, there are lots of limitations.
> >=20
> > Alex =20
>=20
> Right, patch 1/2 tries to work around one of these limitations (cursor-on=
-yuv).=20
> Others have mentioned we can do the same for scaling.
>=20
> Thanks,
> Leo

--Sig_/TKaTbrd5W+Ubs==7Ex4oH3d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYc4ykACgkQI1/ltBGq
qqe1bQ//RTJXT8mEb9Wr+xcSHycvCw3yGnFagdgzLuor4E71+Rubx78Vt9VbtKzJ
whStqwEMo0zLJ78xgAuRXaBsNbg2tZEE6izAbxWJaXFVtWgkZ5Yj1etpRJ5R5/N9
x9BoSC5XS+wTGCiTd++BO3lQ3W7U/UT2ncZnVz3y39X42Z0zcI7N0BxWdIwCoBWI
z83jFdjDKlFI3K/1o2bHckK3TQ7eK0v35Jev/Y8sfUCexT/ocn5Or3fdXRAr+qlX
6zzKFSXEAztQFueNOsa1dAe/cdXbspIJblKNmYKipctdg7fCSddwBsNzCz6zaLvi
lI4xbhzjuBbBumqR2b5DYZFuVoDQXZQc/GK2Ldji6Wu+2oxu3nYVKMv4k7ZAtqRA
03IM5pepB0lEWf3zB1w+Bn1ObyfYZciwDed4tHvO1k9NLBHD5lBU6zKXDqpL2yn4
QSVPVmtQMkxoSUWMi+Sm3RKKtDGbXgWeko6Hlyx9dobsDlvu5XPid+PK2vgdnHVY
5+trQtLh2AVwb0m312LT6EiR8EZwJYq1jb9uA73wAhGOVS6pu99U7RxIUaETL4o/
IZRsOhilEItp+69tZqQc6j0OhfLiaLRxf++bI+clcIaN5HydCei6H/5vZGD5cJ7j
FC6veWOtsU1tILWhHQ9nYZlfp66EiOV+pK3DLyq8BrUf7OFPuGQ=
=DoIZ
-----END PGP SIGNATURE-----

--Sig_/TKaTbrd5W+Ubs==7Ex4oH3d--
