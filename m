Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2E98984EF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 12:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD3910E2CC;
	Thu,  4 Apr 2024 10:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SfhjUvrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAC810E2CC;
 Thu,  4 Apr 2024 10:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712226262;
 bh=MBNgvmTzYvdOLez6Ugc2Jt7qEVgyfSikKqoWPAmldqc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SfhjUvrYBkOSdJ6arYoRXkMmDpMZ+VqiNin3DdVMP0WODHgiq3pEf6Mw4/L9xvjGz
 yjLClj4xILA58wrCpXnPBa2P4jaq2IkfOhQzlJCsIsY8v+x0tDUzWQufd5cEwDlRU4
 ss0wE+Lj4JQrvmMlj8HRwuznYhL/JmSAcG2VJE3rsEmHEM14np0QnF6+3Anqvuv+l1
 SLeX/nmFFSCMNkmacHnB5AmRBtRgU1p+k53e4xOQWpK1xYQsqwbBGFRakUmxZIbQhK
 cYiZ2Zk5DjjNGbEM6PDlzyJP/raGlrwtK8N1ukS1RZp9xEfSa+1WIpNU1m7mf0kyNR
 bqhEbfRpO5NOw==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 399FB37813C0;
 Thu,  4 Apr 2024 10:24:21 +0000 (UTC)
Date: Thu, 4 Apr 2024 13:24:11 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Leo Li <sunpeng.li@amd.com>
Cc: Marius Vlad <marius.vlad@collabora.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, Joshua
 Ashton <joshua@froggi.es>, Michel =?UTF-8?B?RMOkbnplcg==?=
 <mdaenzer@redhat.com>, Chao Guo <chao.guo@nxp.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, Vikas Korjani <Vikas.Korjani@amd.com>, Robert Mader
 <robert.mader@posteo.de>, Sean Paul <sean@poorly.run>, Simon Ser
 <contact@emersion.fr>, Shashank Sharma <shashank.sharma@amd.com>, Harry
 Wentland <harry.wentland@amd.com>, Sebastian Wick
 <sebastian.wick@redhat.com>
Subject: Re: [PATCH 0/2] drm/amdgpu/display: Make multi-plane configurations
 more flexible
Message-ID: <20240404132411.5bb5cb53.pekka.paalanen@collabora.com>
In-Reply-To: <1ca9c55b-2358-4357-a337-c0bf5e3e2118@amd.com>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
 <20240328163311.34b58b39.pekka.paalanen@collabora.com>
 <1ca9c55b-2358-4357-a337-c0bf5e3e2118@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cBo9ue_lBTngwIYCW9.IR1n";
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

--Sig_/cBo9ue_lBTngwIYCW9.IR1n
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Apr 2024 17:32:46 -0400
Leo Li <sunpeng.li@amd.com> wrote:

> On 2024-03-28 10:33, Pekka Paalanen wrote:
> > On Fri, 15 Mar 2024 13:09:56 -0400
> > <sunpeng.li@amd.com> wrote:
> >  =20
> >> From: Leo Li <sunpeng.li@amd.com>
> >>
> >> These patches aim to make the amdgpgu KMS driver play nicer with compo=
sitors
> >> when building multi-plane scanout configurations. They do so by:
> >>
> >> 1. Making cursor behavior more sensible.
> >> 2. Allowing placement of DRM OVERLAY planes underneath the PRIMARY pla=
ne for
> >>     'underlay' configurations (perhaps more of a RFC, see below).
> >>
> >> Please see the commit messages for details.
> >>
> >>
> >> For #2, the simplest way to accomplish this was to increase the value =
of the
> >> immutable zpos property for the PRIMARY plane. This allowed OVERLAY pl=
anes with
> >> a mutable zpos range of (0-254) to be positioned underneath the PRIMAR=
Y for an
> >> underlay scanout configuration.
> >>
> >> Technically speaking, DCN hardware does not have a concept of primary =
or overlay
> >> planes - there are simply 4 general purpose hardware pipes that can be=
 maped in
> >> any configuration. So the immutable zpos restriction on the PRIMARY pl=
ane is
> >> kind of arbitrary; it can have a mutable range of (0-254) just like the
> >> OVERLAYs. The distinction between PRIMARY and OVERLAY planes is also s=
omewhat
> >> arbitrary. We can interpret PRIMARY as the first plane that should be =
enabled on
> >> a CRTC, but beyond that, it doesn't mean much for amdgpu.
> >>
> >> Therefore, I'm curious about how compositors devs understand KMS plane=
s and
> >> their zpos properties, and how we would like to use them. It isn't cle=
ar to me
> >> how compositors wish to interpret and use the DRM zpos property, or
> >> differentiate between OVERLAY and PRIMARY planes, when it comes to set=
ting up
> >> multi-plane scanout. =20
> >=20
> > You already quoted me on the Weston link, so I don't think I have
> > anything to add. Sounds fine to me, and we don't have a standard plane
> > arrangement algorithm that the kernel could optimize zpos ranges
> > against, yet.
> >  =20
> >> Ultimately, what I'd like to answer is "What can we do on the KMS driv=
er and DRM
> >> plane API side, that can make building multi-plane scanout configurati=
ons easier
> >> for compositors?" I'm hoping we can converge on something, whether tha=
t be
> >> updating the existing documentation to better define the usage, or upd=
ate the
> >> API to provide support for something that is lacking. =20
> >=20
> > I think there probably should be a standardised plane arrangement
> > algorithm in userspace, because the search space suffers from
> > permutational explosion. Either there needs to be very few planes (max
> > 4 or 5 at-all-possible per CRTC, including shareable ones) for an
> > exhaustive search to be feasible, or all planes should be more or less
> > equal in capabilities and userspace employs some simplified or
> > heuristic search.
> >=20
> > If the search algorithm is fixed, then drivers could optimize zpos
> > ranges to have the algorithm find a solution faster.
> >=20
> > My worry is that userspace already has heuristic search algorithms that
> > may start failing if drivers later change their zpos ranges to be more
> > optimal for another algorithm.
> >=20
> > OTOH, as long as exhaustive search is feasible, then it does not matter
> > how DRM drivers set up the zpos ranges.
> >=20
> > In any case, the zpos ranges should try to allow all possible plane
> > arrangements while minimizing the number of arrangements that won't
> > work. The absolute values of zpos are pretty much irrelevant, so I
> > think setting one plane to have an immutable zpos is a good idea, even
> > if it's not necessary by the driver. That is one less moving part, and
> > only the relative ordering between the planes matters.
> >=20
> >=20
> > Thanks,
> > pq =20
>=20
> Right, thanks for your thoughts! I agree that there should be a common pl=
ane
> arrangement algorithm. I think libliftoff is the most obvious candidate h=
ere. It
> only handles overlay arrangements currently, but mixed-mode arrangements =
is
> something I've been trying to look at.
>=20
> Taking the driver's reported zpos into account could narrow down the sear=
ch
> space for mixed arrangements. We could tell whether underlay, or overlay,=
 or
> both, is supported by looking at the allowed zpos ranges.
>=20
> I also wonder if it'll make underlay assignments easier. libliftoff has an
> assumption that the PRIMARY plane has the lowest zpos (which now I realiz=
e, is
> not always true). Therefore, the underlay buffer has to be placed on the
> PRIMARY, with the render buffer on a higher OVERLAY. Swapping buffers bet=
ween
> planes when testing mixed-arrangements is kind of awkward, and simply set=
ting
> the OVERLAY's zpos to be lower or higher than the PRIMARY's sounds simple=
r.
>=20
> Currently only gamescope makes use of libliftoff, but I'm curious if patc=
hes
> hooking it up to Weston would be welcomed? If there are other ways to hav=
e a
> common arrangement algorithm, I'd be happy to hear that as well.

A natural thing would be to document such an algorithm with the KMS
UAPI.

I don't know libliftoff well enough to say how welcome it would be in
Weston. I have no fundamental or policy reason to keep an independent
implementation in Weston though, so it's plausible at least.

It would need investigation, and perhaps also extending Weston test
suite a lot more towards VKMS to verify plane assignments. Currently
all plane assignment testing is manual on real hardware.

> Note that libliftoff's algorithm is more complex than weston, since it se=
arches
> harder, and suffers from that permutational explosion. But it solves that=
 by
> trying high benefit arrangements first (offloading surfaces that update
> frequently), and bailing out once the search reaches a hard-coded deadlin=
e.
> Since it's currently overlay-only, the goal could be to "simply" have no
> regressions.

Ensuring no regressions would indeed need to be taken care of by
extending the VKMS-based automated testing.


Thanks,
pq

> >  =20
> >> Some links to provide context and details:
> >> * What is underlay?: https://gitlab.freedesktop.org/emersion/libliftof=
f/-/issues/76
> >> * Discussion on how to implement underlay on Weston: https://gitlab.fr=
eedesktop.org/wayland/weston/-/merge_requests/1258#note_2325164
> >>
> >> Cc: Joshua Ashton <joshua@froggi.es>
> >> Cc: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> >> Cc: Chao Guo <chao.guo@nxp.com>
> >> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> >> Cc: Vikas Korjani <Vikas.Korjani@amd.com>
> >> Cc: Robert Mader <robert.mader@posteo.de>
> >> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> >> Cc: Sean Paul <sean@poorly.run>
> >> Cc: Simon Ser <contact@emersion.fr>
> >> Cc: Shashank Sharma <shashank.sharma@amd.com>
> >> Cc: Harry Wentland <harry.wentland@amd.com>
> >> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> >>
> >> Leo Li (2):
> >>    drm/amd/display: Introduce overlay cursor mode
> >>    drm/amd/display: Move PRIMARY plane zpos higher
> >>
> >>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 405 ++++++++++++++++=
--
> >>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   7 +
> >>   .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   1 +
> >>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  28 +-
> >>   4 files changed, 391 insertions(+), 50 deletions(-)
> >> =20
> >  =20


--Sig_/cBo9ue_lBTngwIYCW9.IR1n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYOf8sACgkQI1/ltBGq
qqdd5xAAp4FbLD6FvwfvSsXXzNikuw/XtEnPzBUSFWGOPimqz4xhtRCQPZMOQMZC
YbOOv8H2sP60AapTExF/UjbwMOjda0EGEZ3jHY3N6Eo+jACTKI8inSReGWzzSpsa
WWtplI+9mksQj7pt9zRV3zaQPblE+WycoSj39+Txjg5zXSmcZ3oBWqiHe52KyNm5
p04EjdhsHHgyulFDJe7lt+hTCgKmvaW3v1x2hUWTi5GwwYVngj+6Ur791YWc4daZ
rS5VKN2rhNvHL0YkYFBI/Vq8LhnXI5y9D1Hxcn1f1R1eSLlC+pSMQEEGn/FJiDVv
pGx0FYGtgIg7izjTvObEEbE7CYpQLMGxi2VPvKjpVm37gRsmmKh/hu630EJutjtG
2Xwf9XmhnDKosDdqszeGJMLgXceAlOtAgNXqUAyzyz5aL3wWS5Tw1ULokNIuOqs+
9AOsaRo3DQTQIwHfm6lDSzaziTYEDQ8pNBCL6SDJ/oQP+9rfVWtbIwVUSIf2snA6
+OW1RnHn9MdXIi9ZI96l5wpbxAgevxXDSSjmBcE/JHKwD9akEQhwy3J9c1dV9HMh
wvwtVoKW9nFn33kDN7MIqQ5q58nRcibdVttpegh/rPG7hIgAG65mc2uEhdMTLYdL
1B32y/b2LlOvjLXudagbVTXGpwWvWq9Hf0mHhOmrz/uKwupZYg8=
=4B6R
-----END PGP SIGNATURE-----

--Sig_/cBo9ue_lBTngwIYCW9.IR1n--
