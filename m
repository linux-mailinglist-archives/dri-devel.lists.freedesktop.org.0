Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBC28A6598
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 10:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF5810F09C;
	Tue, 16 Apr 2024 08:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YbcvCqGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F7710F21B;
 Tue, 16 Apr 2024 08:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713254491;
 bh=/PFhRn239qD7YRxDDQYRh/Pl4gfTgIYm4GKSruSW5G8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YbcvCqGyP+GlXRIXiDAqhAQnJKDQdweNr4R7Ikn1Vlh9LInLUtIAHXPHZWVFKinci
 MqLYpRl9qZ7ynC+C8u8qA+RsPI+ojseHUfahoql91uOsj6erbYJej2BDpDLXN8j5Bp
 aX1PYYEB9AVUvsExFBzXG8S3SyZSWU+A4tTxTuZsSlWhW1YnE0WTnvNExJFssSef2O
 ELb+pHpXXSwxQwbUkrFiCj/UXt+mXjjGFpIQk7b/AkDHD4rSuOTfjNZdHwTXm6Dwie
 ITQ5ANA6sN4Eyd+xHHg+s4hJsvkdI+7k/B8Trc86izUmB8KBvMKooX2FcUczzdsfNa
 /AZN7FJusGxtQ==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 720C337804B2;
 Tue, 16 Apr 2024 08:01:30 +0000 (UTC)
Date: Tue, 16 Apr 2024 11:01:20 +0300
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
Message-ID: <20240416110120.0a5d24fd.pekka.paalanen@collabora.com>
In-Reply-To: <8f0a48da-3efc-4742-9539-d852fb92ebfd@amd.com>
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
 <20240415111953.04b65a53.pekka.paalanen@collabora.com>
 <8f0a48da-3efc-4742-9539-d852fb92ebfd@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nOacm/=mt7ZVw16nS1quUR5";
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

--Sig_/nOacm/=mt7ZVw16nS1quUR5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Apr 2024 18:33:39 -0400
Leo Li <sunpeng.li@amd.com> wrote:

> On 2024-04-15 04:19, Pekka Paalanen wrote:
> > On Fri, 12 Apr 2024 16:14:28 -0400
> > Leo Li <sunpeng.li@amd.com> wrote:
> >  =20
> >> On 2024-04-12 11:31, Alex Deucher wrote: =20
> >>> On Fri, Apr 12, 2024 at 11:08=E2=80=AFAM Pekka Paalanen
> >>> <pekka.paalanen@collabora.com> wrote: =20
> >>>>
> >>>> On Fri, 12 Apr 2024 10:28:52 -0400
> >>>> Leo Li <sunpeng.li@amd.com> wrote:
> >>>>    =20
> >>>>> On 2024-04-12 04:03, Pekka Paalanen wrote: =20
> >>>>>> On Thu, 11 Apr 2024 16:33:57 -0400
> >>>>>> Leo Li <sunpeng.li@amd.com> wrote:
> >>>>>>    =20
> >>>>
> >>>> ...
> >>>>    =20
> >>>>>>> That begs the question of what can be nailed down and what can le=
ft to
> >>>>>>> independent implementation. I guess things like which plane shoul=
d be enabled
> >>>>>>> first (PRIMARY), and how zpos should be interpreted (overlay, und=
erlay, mixed)
> >>>>>>> can be defined. How to handle atomic test failures could be as we=
ll. =20
> >>>>>>
> >>>>>> What room is there for the interpretation of zpos values?
> >>>>>>
> >>>>>> I thought they are unambiguous already: only the relative numerical
> >>>>>> order matters, and that uniquely defines the KMS plane ordering. =
=20
> >>>>>
> >>>>> The zpos value of the PRIMARY plane relative to OVERLAYS, for examp=
le, as a way
> >>>>> for vendors to communicate overlay, underlay, or mixed-arrangement =
support. I
> >>>>> don't think allowing OVERLAYs to be placed under the PRIMARY is cur=
rently
> >>>>> documented as a way to support underlay. =20
> >>>>
> >>>> I always thought it's obvious that the zpos numbers dictate the plane
> >>>> order without any other rules. After all, we have the universal plan=
es
> >>>> concept, where the plane type is only informational to aid heuristics
> >>>> rather than defining anything.
> >>>>
> >>>> Only if the zpos property does not exist, the plane types would come
> >>>> into play.
> >>>>
> >>>> Of course, if there actually exists userspace that fails if zpos all=
ows
> >>>> an overlay type plane to be placed below primary, or fails if primary
> >>>> zpos is not zero, then DRM needs a new client cap. =20
> >>
> >> Right, it wasn't immediately clear to me that the API allowed placemen=
t of
> >> things beneath the PRIMARY. But reading the docs for drm_plane_create_=
zpos*,
> >> there's nothing that forbids it.
> >> =20
> >>>>    =20
> >>>>> libliftoff for example, assumes that the PRIMARY has the lowest zpo=
s. So
> >>>>> underlay arrangements will use an OVERLAY for the scanout plane, an=
d the PRIMARY
> >>>>> for the underlay view. =20
> >>>>
> >>>> That's totally ok. It works, right? Plane type does not matter if the
> >>>> KMS driver accepts the configuration.
> >>>>
> >>>> What is a "scanout plane"? Aren't all KMS planes by definition scano=
ut
> >>>> planes? =20
> >>
> >> Pardon my terminology, I thought the scanout plane was where weston re=
ndered
> >> non-offloadable surfaces to. I guess it's more correct to call it the =
"render
> >> plane". On weston, it seems to be always assigned to the PRIMARY.
> >> =20
> >=20
> > The assignment restriction is just technical design debt. It is
> > limiting. There is no other good reason for it, than when lighting
> > up a CRTC for the first time, Weston should do it with the renderer FB
> > only, on the plane that is most likely to succeed i.e. PRIMARY. After
> > the CRTC is lit, there should be no built-in limitations in what can go
> > where.
> >=20
> > The reason for this is that if a CRTC can be activated, it must always
> > be able to show the renderer FB without incurring a modeset. This is
> > important for ensuring that the fallback compositing (renderer) is
> > always possible. So we start with that configuration, and everything
> > else is optional bonus. =20
>=20
> Genuinely curious - What exactly is limiting with keeping the renderer FB=
 on
> PRIMARY? IOW, what is the additional benefit of placing the renderer FB on
> something other than PRIMARY?

The limitations come from a combination of hardware limitations.
Perhaps zpos is not mutable, or maybe other planes cannot arbitrarily
move between above and below the primary. This reduces the number of
possible configurations, which might cause off-loading to fail.

I think older hardware has more of these arbitrary restrictions.

> >>
> >> For libliftoff, using OVERLAYs as the render plane and PRIMARY as the =
underlay
> >> plane would work. But I think keeping the render plane on PRIMARY (a l=
a weston)
> >> makes underlay arrangements easier to allocate, and would be nice to i=
ncorporate
> >> into a shared algorithm. =20
> >=20
> > If zpos exists, I don't think such limitation is a good idea. It will
> > just limit the possible configurations for no reason.
> >=20
> > With zpos, the KMS plane type should be irrelevant for their
> > z-ordering. Underlay vs. overlay completely loses its meaning at the
> > KMS level. =20
>=20
> Right, the plane types loose their meanings. But at least with the way
> libliftoff builds the plane arrangement, where we first allocate the rend=
erer fb
> matters.
>=20
> libliftoff incrementally builds the atomic state by adding a single plane=
 to the
> atomic state, then testing it. It essentially does a depth-first-search o=
f all
> possible arrangements, pruning the search on atomic test fail. The state =
that
> offloads the most number of FBs will be the arrangement used.
>=20
> Of course, it's unlikely that the entire DFS tree will traversed in time =
for a
> frame. So the key is to search the most probable and high-benefit branches
> first, while minimizing the # of atomic tests needed, before a hard-coded
> deadline is hit.
>=20
> Following this algorithm, the PRIMARY needs to be enabled first, followed=
 by all
> the secondary planes. After a plane is enabled, it's not preferred to cha=
nge
> it's assigned FB, since that can cause the state to be rejected (in actua=
lity,
> not just the FB, but also any color and transformation stuffs associated =
with
> the surface). It is preferable to build on the state by enabling another
> fb->plane. This is where changing a plane's zpos to be above/below the PR=
IMARY
> is advantageous, rather than changing the FBs assigned, to accommodate
> overlay/underlay arrangements.

This all sounds reasonable, but why limit this to only the renderer FB
on primary plane? The same idea should apply equally to any FB on any
plane. Then one needs more heuristics on when to stop the search short,
and when to reconsider each FB-plane assignment in case new candidates
have appeared but the old ones have not disappeared.

> I imagine that any algorithm which incrementally builds up the plane arra=
ngement
> will have a similar preference. Of course, it's entirely possible that su=
ch an
> algorithm isn't the best, I admittedly have not thought much about other
> possibilities, yet...

It's a complicated problem, indeed. Maybe there needs to be a background
task that is not limited by the page flip deadline and can do an
exhaustive search over many refresh periods.


Thanks,
pq

--Sig_/nOacm/=mt7ZVw16nS1quUR5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYeMFAACgkQI1/ltBGq
qqd+Hw//bCldiegzNYM5/g7xUqW3q+S6Fl/vszASJjJChBb22U7YhT4M+hRy6Rwo
zotzep+zawzFi3jBkzFwJ7VozR5mWizKsjlBVTR1QxGL+/sQkqwhEhDWW/EPU9LH
ien0DN6C6tybVDy+Y52DuGrf2AYN8ZCkZr+9ubXBULC/N2P3vuhY+eiROzMOvzCt
0r/vZhilQ6si+IoEakXtuDid77yjGqZ8lbO4xTKwtgUZgCqD65/J+/+bJD5g+zT7
eZx7zy6HulzevQqlIP8ygOsceorP2o1UnGziuJr6xyxkewc1gWifUrED8B/BmPeO
+F502s1KIEqqWFZWIRGZkV77tahw4RE4XTddrHJqgNcZlvyLMWawCFDTNRxDW6wI
bq3dnulOE+AWPCCsTv6muu59WtKnWW00oLx9P3nyrVh+3W6gBoYxd/J5hhs4Nq1L
QTc4hNYd+Ht1mYvF9JbllrqoXdtn99bZNAhl6rlF4EH+pQFwO0KmiDv8qMuDhZ2N
+0Qcyuf8MUWmonwj9biJqHqO2cx6CzKq5kQdrEhNk8unqiBNcTLwk+KHl0Z8l83U
K+FsAcZPQjIh0L/qx9W9GF7nggM3em+yzGH+tv/6LiRfPdffDSf4cuRQ/PKCi62+
jgJz/Go4jsAdxX+aGf8JWV2IT728QKNxA96fnezKNG4EPYOjUnY=
=BPEe
-----END PGP SIGNATURE-----

--Sig_/nOacm/=mt7ZVw16nS1quUR5--
