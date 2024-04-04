Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE1E8989F0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 16:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258851131C8;
	Thu,  4 Apr 2024 14:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="C+AOqCZr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3BF1131D1;
 Thu,  4 Apr 2024 14:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712240557;
 bh=cx5rKbtQlP++y9rMCiIkRVWP/OIT3MO9X3/OaFZnE8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C+AOqCZr87Zc8XWl8JaFKf1YoL063KWja4B8/CfDEI3e9AQJmVgj4+oW+PbZhpje8
 KpSpwWHMHawf2Cz5Dxh36izYXEgwg0Q3T+6DciC+jf0zikXWZIwjIBU9rLTOMB4BUm
 XLZCTqfpoApLHl+OKI8v5qcGcf1mRKfxwLqGQcPAloWO3lRF6YGKic/QCdvSx0LL6X
 ZvAGcUKzVQwtCYIx6M2hO9TxzXqvphd6Y9ZlKnsMIdzPRsiUWEwj7P1o+JMVpzdjDL
 vvSpSjOTxSPAji136G3ILvfjCm4f8FA4IigCZmuScz6EgLJ3CNVV0mk5o8O/qUM6+r
 KKUXEnen57VCw==
Received: from xpredator (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5DD0D3780029;
 Thu,  4 Apr 2024 14:22:36 +0000 (UTC)
Date: Thu, 4 Apr 2024 17:22:34 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Chao Guo <chao.guo@nxp.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Vikas Korjani <Vikas.Korjani@amd.com>,
 Robert Mader <robert.mader@posteo.de>, Sean Paul <sean@poorly.run>,
 Simon Ser <contact@emersion.fr>, Shashank Sharma <shashank.sharma@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH 0/2] drm/amdgpu/display: Make multi-plane configurations
 more flexible
Message-ID: <Zg63qvnHgutUARrh@xpredator>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
 <20240328163311.34b58b39.pekka.paalanen@collabora.com>
 <1ca9c55b-2358-4357-a337-c0bf5e3e2118@amd.com>
 <20240404132411.5bb5cb53.pekka.paalanen@collabora.com>
 <b1613277-567d-47db-af84-74dfad2e9cf2@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DYqoRLnWNQW/yYj5"
Content-Disposition: inline
In-Reply-To: <b1613277-567d-47db-af84-74dfad2e9cf2@amd.com>
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


--DYqoRLnWNQW/yYj5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2024 at 09:59:03AM -0400, Harry Wentland wrote:
>=20
Hi all,
>=20
> On 2024-04-04 06:24, Pekka Paalanen wrote:
> > On Wed, 3 Apr 2024 17:32:46 -0400
> > Leo Li <sunpeng.li@amd.com> wrote:
> >=20
> >> On 2024-03-28 10:33, Pekka Paalanen wrote:
> >>> On Fri, 15 Mar 2024 13:09:56 -0400
> >>> <sunpeng.li@amd.com> wrote:
> >>>  =20
> >>>> From: Leo Li <sunpeng.li@amd.com>
> >>>>
> >>>> These patches aim to make the amdgpgu KMS driver play nicer with com=
positors
> >>>> when building multi-plane scanout configurations. They do so by:
> >>>>
> >>>> 1. Making cursor behavior more sensible.
> >>>> 2. Allowing placement of DRM OVERLAY planes underneath the PRIMARY p=
lane for
> >>>>     'underlay' configurations (perhaps more of a RFC, see below).
> >>>>
> >>>> Please see the commit messages for details.
> >>>>
> >>>>
> >>>> For #2, the simplest way to accomplish this was to increase the valu=
e of the
> >>>> immutable zpos property for the PRIMARY plane. This allowed OVERLAY =
planes with
> >>>> a mutable zpos range of (0-254) to be positioned underneath the PRIM=
ARY for an
> >>>> underlay scanout configuration.
> >>>>
> >>>> Technically speaking, DCN hardware does not have a concept of primar=
y or overlay
> >>>> planes - there are simply 4 general purpose hardware pipes that can =
be maped in
> >>>> any configuration. So the immutable zpos restriction on the PRIMARY =
plane is
> >>>> kind of arbitrary; it can have a mutable range of (0-254) just like =
the
> >>>> OVERLAYs. The distinction between PRIMARY and OVERLAY planes is also=
 somewhat
> >>>> arbitrary. We can interpret PRIMARY as the first plane that should b=
e enabled on
> >>>> a CRTC, but beyond that, it doesn't mean much for amdgpu.
> >>>>
> >>>> Therefore, I'm curious about how compositors devs understand KMS pla=
nes and
> >>>> their zpos properties, and how we would like to use them. It isn't c=
lear to me
> >>>> how compositors wish to interpret and use the DRM zpos property, or
> >>>> differentiate between OVERLAY and PRIMARY planes, when it comes to s=
etting up
> >>>> multi-plane scanout. =20
> >>>
> >>> You already quoted me on the Weston link, so I don't think I have
> >>> anything to add. Sounds fine to me, and we don't have a standard plane
> >>> arrangement algorithm that the kernel could optimize zpos ranges
> >>> against, yet.
> >>>  =20
> >>>> Ultimately, what I'd like to answer is "What can we do on the KMS dr=
iver and DRM
> >>>> plane API side, that can make building multi-plane scanout configura=
tions easier
> >>>> for compositors?" I'm hoping we can converge on something, whether t=
hat be
> >>>> updating the existing documentation to better define the usage, or u=
pdate the
> >>>> API to provide support for something that is lacking. =20
> >>>
> >>> I think there probably should be a standardised plane arrangement
> >>> algorithm in userspace, because the search space suffers from
> >>> permutational explosion. Either there needs to be very few planes (max
> >>> 4 or 5 at-all-possible per CRTC, including shareable ones) for an
> >>> exhaustive search to be feasible, or all planes should be more or less
> >>> equal in capabilities and userspace employs some simplified or
> >>> heuristic search.
> >>>
> >>> If the search algorithm is fixed, then drivers could optimize zpos
> >>> ranges to have the algorithm find a solution faster.
> >>>
> >>> My worry is that userspace already has heuristic search algorithms th=
at
> >>> may start failing if drivers later change their zpos ranges to be more
> >>> optimal for another algorithm.
> >>>
> >>> OTOH, as long as exhaustive search is feasible, then it does not matt=
er
> >>> how DRM drivers set up the zpos ranges.
> >>>
> >>> In any case, the zpos ranges should try to allow all possible plane
> >>> arrangements while minimizing the number of arrangements that won't
> >>> work. The absolute values of zpos are pretty much irrelevant, so I
> >>> think setting one plane to have an immutable zpos is a good idea, even
> >>> if it's not necessary by the driver. That is one less moving part, and
> >>> only the relative ordering between the planes matters.
> >>>
> >>>
> >>> Thanks,
> >>> pq =20
> >>
> >> Right, thanks for your thoughts! I agree that there should be a common=
 plane
> >> arrangement algorithm. I think libliftoff is the most obvious candidat=
e here. It
> >> only handles overlay arrangements currently, but mixed-mode arrangemen=
ts is
> >> something I've been trying to look at.
> >>
> >> Taking the driver's reported zpos into account could narrow down the s=
earch
> >> space for mixed arrangements. We could tell whether underlay, or overl=
ay, or
> >> both, is supported by looking at the allowed zpos ranges.
> >>
> >> I also wonder if it'll make underlay assignments easier. libliftoff ha=
s an
> >> assumption that the PRIMARY plane has the lowest zpos (which now I rea=
lize, is
> >> not always true). Therefore, the underlay buffer has to be placed on t=
he
> >> PRIMARY, with the render buffer on a higher OVERLAY. Swapping buffers =
between
> >> planes when testing mixed-arrangements is kind of awkward, and simply =
setting
> >> the OVERLAY's zpos to be lower or higher than the PRIMARY's sounds sim=
pler.
> >>
> >> Currently only gamescope makes use of libliftoff, but I'm curious if p=
atches
> >> hooking it up to Weston would be welcomed? If there are other ways to =
have a
> >> common arrangement algorithm, I'd be happy to hear that as well.
> >=20
> > A natural thing would be to document such an algorithm with the KMS
> > UAPI.
> >=20
> > I don't know libliftoff well enough to say how welcome it would be in
> > Weston. I have no fundamental or policy reason to keep an independent
> > implementation in Weston though, so it's plausible at least.
> >=20
> > It would need investigation, and perhaps also extending Weston test
> > suite a lot more towards VKMS to verify plane assignments. Currently
> > all plane assignment testing is manual on real hardware.
> >=20
>=20
> It looks like VKMS doesn't have explicit zpos yet, so someone would
> probably need to add that.
>=20
> https://drmdb.emersion.fr/properties/4008636142/zpos
Yes. If we look into adding that, maybe it should be done using with
ConfigFS: https://patchwork.freedesktop.org/series/122618/

With that in and with zpos support, we could then run a batch of tests that=
=20
can dynamically exercise on-the-fly all possible combinations.
>=20
> Harry
>=20
> >> Note that libliftoff's algorithm is more complex than weston, since it=
 searches
> >> harder, and suffers from that permutational explosion. But it solves t=
hat by
> >> trying high benefit arrangements first (offloading surfaces that update
> >> frequently), and bailing out once the search reaches a hard-coded dead=
line.
> >> Since it's currently overlay-only, the goal could be to "simply" have =
no
> >> regressions.
> >=20
> > Ensuring no regressions would indeed need to be taken care of by
> > extending the VKMS-based automated testing.
> >=20
> >=20
> > Thanks,
> > pq
> >=20
> >>>  =20
> >>>> Some links to provide context and details:
> >>>> * What is underlay?: https://gitlab.freedesktop.org/emersion/liblift=
off/-/issues/76
> >>>> * Discussion on how to implement underlay on Weston: https://gitlab.=
freedesktop.org/wayland/weston/-/merge_requests/1258#note_2325164
> >>>>
> >>>> Cc: Joshua Ashton <joshua@froggi.es>
> >>>> Cc: Michel D=E4nzer <mdaenzer@redhat.com>
> >>>> Cc: Chao Guo <chao.guo@nxp.com>
> >>>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> >>>> Cc: Vikas Korjani <Vikas.Korjani@amd.com>
> >>>> Cc: Robert Mader <robert.mader@posteo.de>
> >>>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> >>>> Cc: Sean Paul <sean@poorly.run>
> >>>> Cc: Simon Ser <contact@emersion.fr>
> >>>> Cc: Shashank Sharma <shashank.sharma@amd.com>
> >>>> Cc: Harry Wentland <harry.wentland@amd.com>
> >>>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> >>>>
> >>>> Leo Li (2):
> >>>>    drm/amd/display: Introduce overlay cursor mode
> >>>>    drm/amd/display: Move PRIMARY plane zpos higher
> >>>>
> >>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 405 ++++++++++++++=
++--
> >>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   7 +
> >>>>   .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   1 +
> >>>>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  28 +-
> >>>>   4 files changed, 391 insertions(+), 50 deletions(-)
> >>>> =20
> >>>  =20
> >=20
>=20

--DYqoRLnWNQW/yYj5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmYOt6cACgkQ9jQS5glH
1u+t5w/+Nmr4cVWOGPTJ2IFAA3iahiSZ20DcC6oj2dINfPqgX309avIMo5Rm806b
8XRNtIfons4OUYivD+ncih4RNNsf+5YaBPbOI1XEUFu4N/my+cSQdDYwhDjisOI7
OGMUBr2sk0iF5SIeB9Z+r8ZxvfPXjM/LW1IxhD7CFQQZApPQgG4TzktHPRF4OXWf
6ukbTTG8/sWbrg2nxhpozxt3YXvNlhIqKU8CZNDvqevBnrbJcRUzMjdUGFq2yBfJ
IpI6Z30p8ej+l+cSEI9tuPI7b4NdOOt6B6u52oh2aWhpqZMrHvTaNtpkQhOB1qjK
nfAsgYhXmOTh5UBV1/4G/rF0iCEZSDoAFmycKarVapZnmTdIqJCxKYV0C2uz9PbH
oUpm5aYcDv0W/fyrBKPBOvijpbaH/SGkcCZeOqE0HPFEl8dR0i1KbpXo/13ef/aq
4DAwaGQDALq26n4hm8XtZsiDSu66pvrVdKaOt9EB6//chB3FXXd8PgCA8m4ro6As
ojP87aaswbOVuCBL6ljlj6HxbPxynlf78zZW2XWcIBXW+pGBknOknWuoZKuvyFe2
ne5TC1JZrDH9bpgnqYkN+0ze3bBSzvIw9CrYfZ/Xf2draqL9+oAEi5zm7yHo4mKv
+hUSvxdQGH8NneLSEFfbLUC6P/impYkgOJXmaabSwA3bHKk20BI=
=9S+f
-----END PGP SIGNATURE-----

--DYqoRLnWNQW/yYj5--
