Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33A78A28B5
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 10:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7EA10E66E;
	Fri, 12 Apr 2024 08:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="A1qEfWVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9257410E66E;
 Fri, 12 Apr 2024 08:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712909015;
 bh=srB/6FETs68bYNsavIN08fkq91+7X15f1A2DijK/uZQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A1qEfWVEPviNYM0dgSHicdMtuh5OKM6e0CzCld0P2ZpSU/zG0tbsWX/naOd8etD64
 5AJHP1Nm94AXzUdYLaN0Mz3e8/rfFrDZrEhoIu2JKipU2CDM4K5/GXo11+A8KMAckF
 jjBgXye+f/7ee6vPl6wzUTRuTKKjvV02eCzrVNvCAidhqagkl7EMuBMocmGXvyfldr
 ajv21MVOcD999yHIludSHEblfGMaInO4o83LjfhMJKzA0/TSzQB260Gp8UgvFaPWEz
 6rvRkUdIMxEXemoRG3v7MO91IRPL3gm8ezKLh4JYnXQ5/G6J5UB2ASxPKsDfDepIIm
 TebfpH3BAu0Tw==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E0A24378212D;
 Fri, 12 Apr 2024 08:03:34 +0000 (UTC)
Date: Fri, 12 Apr 2024 11:03:25 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Leo Li <sunpeng.li@amd.com>
Cc: Marius Vlad <marius.vlad@collabora.com>, Harry Wentland
 <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>, Michel
 =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>, Chao Guo
 <chao.guo@nxp.com>, Xaver Hugl <xaver.hugl@gmail.com>, Vikas Korjani
 <Vikas.Korjani@amd.com>, Robert Mader <robert.mader@posteo.de>, Sean Paul
 <sean@poorly.run>, Simon Ser <contact@emersion.fr>, Shashank Sharma
 <shashank.sharma@amd.com>, Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH 0/2] drm/amdgpu/display: Make multi-plane configurations
 more flexible
Message-ID: <20240412110325.4afa29ca.pekka.paalanen@collabora.com>
In-Reply-To: <46968a40-e0e5-4af9-b859-8a41d5992863@amd.com>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
 <20240328163311.34b58b39.pekka.paalanen@collabora.com>
 <1ca9c55b-2358-4357-a337-c0bf5e3e2118@amd.com>
 <20240404132411.5bb5cb53.pekka.paalanen@collabora.com>
 <b1613277-567d-47db-af84-74dfad2e9cf2@amd.com>
 <Zg63qvnHgutUARrh@xpredator>
 <46968a40-e0e5-4af9-b859-8a41d5992863@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m+vKvnvfyj51RLafmbi8hsB";
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

--Sig_/m+vKvnvfyj51RLafmbi8hsB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Apr 2024 16:33:57 -0400
Leo Li <sunpeng.li@amd.com> wrote:

> On 2024-04-04 10:22, Marius Vlad wrote:
> > On Thu, Apr 04, 2024 at 09:59:03AM -0400, Harry Wentland wrote: =20
> >> =20
> > Hi all, =20
> >>
> >> On 2024-04-04 06:24, Pekka Paalanen wrote: =20
> >>> On Wed, 3 Apr 2024 17:32:46 -0400
> >>> Leo Li <sunpeng.li@amd.com> wrote:
> >>> =20
> >>>> On 2024-03-28 10:33, Pekka Paalanen wrote: =20
> >>>>> On Fri, 15 Mar 2024 13:09:56 -0400
> >>>>> <sunpeng.li@amd.com> wrote:
> >>>>>     =20
> >>>>>> From: Leo Li <sunpeng.li@amd.com>
> >>>>>>
> >>>>>> These patches aim to make the amdgpgu KMS driver play nicer with c=
ompositors
> >>>>>> when building multi-plane scanout configurations. They do so by:
> >>>>>>
> >>>>>> 1. Making cursor behavior more sensible.
> >>>>>> 2. Allowing placement of DRM OVERLAY planes underneath the PRIMARY=
 plane for
> >>>>>>      'underlay' configurations (perhaps more of a RFC, see below).
> >>>>>>
> >>>>>> Please see the commit messages for details.
> >>>>>>
> >>>>>>
> >>>>>> For #2, the simplest way to accomplish this was to increase the va=
lue of the
> >>>>>> immutable zpos property for the PRIMARY plane. This allowed OVERLA=
Y planes with
> >>>>>> a mutable zpos range of (0-254) to be positioned underneath the PR=
IMARY for an
> >>>>>> underlay scanout configuration.
> >>>>>>
> >>>>>> Technically speaking, DCN hardware does not have a concept of prim=
ary or overlay
> >>>>>> planes - there are simply 4 general purpose hardware pipes that ca=
n be maped in
> >>>>>> any configuration. So the immutable zpos restriction on the PRIMAR=
Y plane is
> >>>>>> kind of arbitrary; it can have a mutable range of (0-254) just lik=
e the
> >>>>>> OVERLAYs. The distinction between PRIMARY and OVERLAY planes is al=
so somewhat
> >>>>>> arbitrary. We can interpret PRIMARY as the first plane that should=
 be enabled on
> >>>>>> a CRTC, but beyond that, it doesn't mean much for amdgpu.
> >>>>>>
> >>>>>> Therefore, I'm curious about how compositors devs understand KMS p=
lanes and
> >>>>>> their zpos properties, and how we would like to use them. It isn't=
 clear to me
> >>>>>> how compositors wish to interpret and use the DRM zpos property, or
> >>>>>> differentiate between OVERLAY and PRIMARY planes, when it comes to=
 setting up
> >>>>>> multi-plane scanout. =20
> >>>>>
> >>>>> You already quoted me on the Weston link, so I don't think I have
> >>>>> anything to add. Sounds fine to me, and we don't have a standard pl=
ane
> >>>>> arrangement algorithm that the kernel could optimize zpos ranges
> >>>>> against, yet.
> >>>>>     =20
> >>>>>> Ultimately, what I'd like to answer is "What can we do on the KMS =
driver and DRM
> >>>>>> plane API side, that can make building multi-plane scanout configu=
rations easier
> >>>>>> for compositors?" I'm hoping we can converge on something, whether=
 that be
> >>>>>> updating the existing documentation to better define the usage, or=
 update the
> >>>>>> API to provide support for something that is lacking. =20
> >>>>>
> >>>>> I think there probably should be a standardised plane arrangement
> >>>>> algorithm in userspace, because the search space suffers from
> >>>>> permutational explosion. Either there needs to be very few planes (=
max
> >>>>> 4 or 5 at-all-possible per CRTC, including shareable ones) for an
> >>>>> exhaustive search to be feasible, or all planes should be more or l=
ess
> >>>>> equal in capabilities and userspace employs some simplified or
> >>>>> heuristic search.
> >>>>>
> >>>>> If the search algorithm is fixed, then drivers could optimize zpos
> >>>>> ranges to have the algorithm find a solution faster.
> >>>>>
> >>>>> My worry is that userspace already has heuristic search algorithms =
that
> >>>>> may start failing if drivers later change their zpos ranges to be m=
ore
> >>>>> optimal for another algorithm.
> >>>>>
> >>>>> OTOH, as long as exhaustive search is feasible, then it does not ma=
tter
> >>>>> how DRM drivers set up the zpos ranges.
> >>>>>
> >>>>> In any case, the zpos ranges should try to allow all possible plane
> >>>>> arrangements while minimizing the number of arrangements that won't
> >>>>> work. The absolute values of zpos are pretty much irrelevant, so I
> >>>>> think setting one plane to have an immutable zpos is a good idea, e=
ven
> >>>>> if it's not necessary by the driver. That is one less moving part, =
and
> >>>>> only the relative ordering between the planes matters.
> >>>>>
> >>>>>
> >>>>> Thanks,
> >>>>> pq =20
> >>>>
> >>>> Right, thanks for your thoughts! I agree that there should be a comm=
on plane
> >>>> arrangement algorithm. I think libliftoff is the most obvious candid=
ate here. It
> >>>> only handles overlay arrangements currently, but mixed-mode arrangem=
ents is
> >>>> something I've been trying to look at.
> >>>>
> >>>> Taking the driver's reported zpos into account could narrow down the=
 search
> >>>> space for mixed arrangements. We could tell whether underlay, or ove=
rlay, or
> >>>> both, is supported by looking at the allowed zpos ranges.
> >>>>
> >>>> I also wonder if it'll make underlay assignments easier. libliftoff =
has an
> >>>> assumption that the PRIMARY plane has the lowest zpos (which now I r=
ealize, is
> >>>> not always true). Therefore, the underlay buffer has to be placed on=
 the
> >>>> PRIMARY, with the render buffer on a higher OVERLAY. Swapping buffer=
s between
> >>>> planes when testing mixed-arrangements is kind of awkward, and simpl=
y setting
> >>>> the OVERLAY's zpos to be lower or higher than the PRIMARY's sounds s=
impler.
> >>>>
> >>>> Currently only gamescope makes use of libliftoff, but I'm curious if=
 patches
> >>>> hooking it up to Weston would be welcomed? If there are other ways t=
o have a
> >>>> common arrangement algorithm, I'd be happy to hear that as well. =20
> >>>
> >>> A natural thing would be to document such an algorithm with the KMS
> >>> UAPI.
> >>>
> >>> I don't know libliftoff well enough to say how welcome it would be in
> >>> Weston. I have no fundamental or policy reason to keep an independent
> >>> implementation in Weston though, so it's plausible at least. =20
>=20
> Is it the case that different compositors may want different plane arrang=
ement
> behaviors? Like selecting which surfaces to offload, for example? It occu=
rred to
> me that prescribing an allocation algorithm via something like libliftoff=
 might
> be too restrictive. In which case, documenting the parts that can be nail=
ed down
> would be better.

I don't know. Probably there shouldn't be, eventually, because it's
hard to imagine how DE or end user style/taste/preferences would affect
things. Usually the global goal would be optimising power consumption.

There could be trade-offs though, when reduction in power consumption
results in reduced image quality or increased latency. What to favour
for which surfaces is definitely policy and preference. Such
preferences could perhaps be designed into libliftoff API.

> That begs the question of what can be nailed down and what can left to
> independent implementation. I guess things like which plane should be ena=
bled
> first (PRIMARY), and how zpos should be interpreted (overlay, underlay, m=
ixed)
> can be defined. How to handle atomic test failures could be as well.

What room is there for the interpretation of zpos values?

I thought they are unambiguous already: only the relative numerical
order matters, and that uniquely defines the KMS plane ordering.


Thanks,
pq

> I can start working on a draft for this. If anything, as a spark for disc=
ussions
> for the display hackfest.
>=20
> >>>
> >>> It would need investigation, and perhaps also extending Weston test
> >>> suite a lot more towards VKMS to verify plane assignments. Currently
> >>> all plane assignment testing is manual on real hardware.
> >>> =20
> >>
> >> It looks like VKMS doesn't have explicit zpos yet, so someone would
> >> probably need to add that.
> >>
> >> https://drmdb.emersion.fr/properties/4008636142/zpos =20
> > Yes. If we look into adding that, maybe it should be done using with
> > ConfigFS: https://patchwork.freedesktop.org/series/122618/
> >=20
> > With that in and with zpos support, we could then run a batch of tests =
that
> > can dynamically exercise on-the-fly all possible combinations. =20
>=20
> Using vkms to come up with a bunch of different hw plane configurations i=
s a
> good idea. It may come in handy for testing other compositors too. Thanks=
 for
> the suggestions.
>=20
> - Leo
>=20
>=20
> >>
> >> Harry
> >> =20
> >>>> Note that libliftoff's algorithm is more complex than weston, since =
it searches
> >>>> harder, and suffers from that permutational explosion. But it solves=
 that by
> >>>> trying high benefit arrangements first (offloading surfaces that upd=
ate
> >>>> frequently), and bailing out once the search reaches a hard-coded de=
adline.
> >>>> Since it's currently overlay-only, the goal could be to "simply" hav=
e no
> >>>> regressions. =20
> >>>
> >>> Ensuring no regressions would indeed need to be taken care of by
> >>> extending the VKMS-based automated testing.
> >>>
> >>>
> >>> Thanks,
> >>> pq
> >>> =20
> >>>>>     =20
> >>>>>> Some links to provide context and details:
> >>>>>> * What is underlay?: https://gitlab.freedesktop.org/emersion/libli=
ftoff/-/issues/76
> >>>>>> * Discussion on how to implement underlay on Weston: https://gitla=
b.freedesktop.org/wayland/weston/-/merge_requests/1258#note_2325164
> >>>>>>
> >>>>>> Cc: Joshua Ashton <joshua@froggi.es>
> >>>>>> Cc: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> >>>>>> Cc: Chao Guo <chao.guo@nxp.com>
> >>>>>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> >>>>>> Cc: Vikas Korjani <Vikas.Korjani@amd.com>
> >>>>>> Cc: Robert Mader <robert.mader@posteo.de>
> >>>>>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> >>>>>> Cc: Sean Paul <sean@poorly.run>
> >>>>>> Cc: Simon Ser <contact@emersion.fr>
> >>>>>> Cc: Shashank Sharma <shashank.sharma@amd.com>
> >>>>>> Cc: Harry Wentland <harry.wentland@amd.com>
> >>>>>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> >>>>>>
> >>>>>> Leo Li (2):
> >>>>>>     drm/amd/display: Introduce overlay cursor mode
> >>>>>>     drm/amd/display: Move PRIMARY plane zpos higher
> >>>>>>
> >>>>>>    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 405 +++++++++++=
+++++--
> >>>>>>    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   7 +
> >>>>>>    .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   1 +
> >>>>>>    .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  28 +-
> >>>>>>    4 files changed, 391 insertions(+), 50 deletions(-)
> >>>>>>    =20
> >>>>>     =20
> >>> =20
> >> =20


--Sig_/m+vKvnvfyj51RLafmbi8hsB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYY6s0ACgkQI1/ltBGq
qqezQBAAocFMIzAzEW6D5wiPZ3hDWTd8skXVtzDLsSTHJew+xDmC/YDAMJl7HDup
a0+Sli9I77npei4PMhbS19XMBJv6chnX8hVVh6F6Dik9oybFtDwqecZ39PqJE9aX
DQjufVIq8crF2lBOeRHjXSRkZMhkeFEE93+1O0K2VMYEZ3vdQ+8wBocGrdcv+/PG
Gvmm+4D5mHCLRrqWFK3hh3m243+TxmC7hXtwbP9nT+HTJCSbMybf5SVtb8Iqgp2x
5WWswqRVE0JiywKiw0N8yWmDGRbAKDgZFmQMFzMZ+ZaEnVCZDFusMOuckOrXhvHl
bTZ+0XI1MVM8BdJOPueggpzl9NeqVUxa3+TZEZfTeVlB+F5yqXyJ42FwswGtboFR
rwud8cKtMVROjW+/LJ4HpcGQb7v7P8OJrzBVWL7oTlNd6yvofIhnRcgDVOVkTzh3
o7JQ8BxvgZ+FzXzrtpRjNNklg03x4+yFr03iW/sghyq/Ywbp2fG6tDhMv5sMnV0M
2+k/Pxp4Knlr//6mnsgs4hdEnzf4Vs77AO5iFCNAAY9vW8OkyapI8xRmKh6UcE2X
gETwqoTelcsagEbs4XGnvLxUn4a8CUo5InrTobmJblq9zP+qAiERM2tfx+EOfNiW
+DBq8J9feRlLbQLl+YiWv4Mw0OZULACR5cWzjJAO75uzEmjSXms=
=Qwlc
-----END PGP SIGNATURE-----

--Sig_/m+vKvnvfyj51RLafmbi8hsB--
