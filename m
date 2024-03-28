Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E08B8901D7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 15:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451CE10F9C4;
	Thu, 28 Mar 2024 14:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZThIqaKU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A726610F9C4;
 Thu, 28 Mar 2024 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711636401;
 bh=GXX9H4LZpP1x+lXm0nHvyD8Q1f9EJq2u0U0yTui/CM4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZThIqaKUgV9UBNp7pYrqwNNWPQ8SEDcOZT/7dF+8nN8NnwA2VCb/NJ72dv6b+0uVQ
 GJq/ecwksu2ZIjBujqlJd1UxK0Gc4PACY31Sj+jlCxaFAN+Gwls5ZSLpw8fYZvNLJi
 bheyB7saSfWTYMUYdVx6Qh5t0cstqZLb9bFkQtRfOrDkG3GzXu7yhkm0YkktTKeqZU
 vYMDecXxkqyyR324L7VfH+VxiLP2hJN+b02JGJIjsJGQTPdJP+QcCMFRxJGbDmuD3C
 DCdsxYy+vc4f/A4cVKw0ZNu0xMdEBmXA15kYsJT/Jb8UBUf21mhS87rQ9KqmDOxnvT
 UozgOqfJCizmA==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B35A7378211C;
 Thu, 28 Mar 2024 14:33:20 +0000 (UTC)
Date: Thu, 28 Mar 2024 16:33:11 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: <sunpeng.li@amd.com>, Marius Vlad <marius.vlad@collabora.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 Joshua Ashton <joshua@froggi.es>, Michel =?UTF-8?B?RMOkbnplcg==?=
 <mdaenzer@redhat.com>, Chao Guo <chao.guo@nxp.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, Vikas Korjani <Vikas.Korjani@amd.com>, Robert Mader
 <robert.mader@posteo.de>, "Sean Paul" <sean@poorly.run>, Simon Ser
 <contact@emersion.fr>, Shashank Sharma <shashank.sharma@amd.com>, Harry
 Wentland <harry.wentland@amd.com>, "Sebastian Wick"
 <sebastian.wick@redhat.com>
Subject: Re: [PATCH 0/2] drm/amdgpu/display: Make multi-plane configurations
 more flexible
Message-ID: <20240328163311.34b58b39.pekka.paalanen@collabora.com>
In-Reply-To: <20240315170959.165505-1-sunpeng.li@amd.com>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mtPXnjFILmf965yRvrRc6K7";
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

--Sig_/mtPXnjFILmf965yRvrRc6K7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Mar 2024 13:09:56 -0400
<sunpeng.li@amd.com> wrote:

> From: Leo Li <sunpeng.li@amd.com>
>=20
> These patches aim to make the amdgpgu KMS driver play nicer with composit=
ors
> when building multi-plane scanout configurations. They do so by:
>=20
> 1. Making cursor behavior more sensible.
> 2. Allowing placement of DRM OVERLAY planes underneath the PRIMARY plane =
for
>    'underlay' configurations (perhaps more of a RFC, see below).
>=20
> Please see the commit messages for details.
>=20
>=20
> For #2, the simplest way to accomplish this was to increase the value of =
the
> immutable zpos property for the PRIMARY plane. This allowed OVERLAY plane=
s with
> a mutable zpos range of (0-254) to be positioned underneath the PRIMARY f=
or an
> underlay scanout configuration.
>=20
> Technically speaking, DCN hardware does not have a concept of primary or =
overlay
> planes - there are simply 4 general purpose hardware pipes that can be ma=
ped in
> any configuration. So the immutable zpos restriction on the PRIMARY plane=
 is
> kind of arbitrary; it can have a mutable range of (0-254) just like the
> OVERLAYs. The distinction between PRIMARY and OVERLAY planes is also some=
what
> arbitrary. We can interpret PRIMARY as the first plane that should be ena=
bled on
> a CRTC, but beyond that, it doesn't mean much for amdgpu.
>=20
> Therefore, I'm curious about how compositors devs understand KMS planes a=
nd
> their zpos properties, and how we would like to use them. It isn't clear =
to me
> how compositors wish to interpret and use the DRM zpos property, or
> differentiate between OVERLAY and PRIMARY planes, when it comes to settin=
g up
> multi-plane scanout.

You already quoted me on the Weston link, so I don't think I have
anything to add. Sounds fine to me, and we don't have a standard plane
arrangement algorithm that the kernel could optimize zpos ranges
against, yet.

> Ultimately, what I'd like to answer is "What can we do on the KMS driver =
and DRM
> plane API side, that can make building multi-plane scanout configurations=
 easier
> for compositors?" I'm hoping we can converge on something, whether that be
> updating the existing documentation to better define the usage, or update=
 the
> API to provide support for something that is lacking.

I think there probably should be a standardised plane arrangement
algorithm in userspace, because the search space suffers from
permutational explosion. Either there needs to be very few planes (max
4 or 5 at-all-possible per CRTC, including shareable ones) for an
exhaustive search to be feasible, or all planes should be more or less
equal in capabilities and userspace employs some simplified or
heuristic search.

If the search algorithm is fixed, then drivers could optimize zpos
ranges to have the algorithm find a solution faster.

My worry is that userspace already has heuristic search algorithms that
may start failing if drivers later change their zpos ranges to be more
optimal for another algorithm.

OTOH, as long as exhaustive search is feasible, then it does not matter
how DRM drivers set up the zpos ranges.

In any case, the zpos ranges should try to allow all possible plane
arrangements while minimizing the number of arrangements that won't
work. The absolute values of zpos are pretty much irrelevant, so I
think setting one plane to have an immutable zpos is a good idea, even
if it's not necessary by the driver. That is one less moving part, and
only the relative ordering between the planes matters.


Thanks,
pq

> Some links to provide context and details:
> * What is underlay?: https://gitlab.freedesktop.org/emersion/libliftoff/-=
/issues/76
> * Discussion on how to implement underlay on Weston: https://gitlab.freed=
esktop.org/wayland/weston/-/merge_requests/1258#note_2325164
>=20
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> Cc: Chao Guo <chao.guo@nxp.com>
> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> Cc: Vikas Korjani <Vikas.Korjani@amd.com>
> Cc: Robert Mader <robert.mader@posteo.de>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>=20
> Leo Li (2):
>   drm/amd/display: Introduce overlay cursor mode
>   drm/amd/display: Move PRIMARY plane zpos higher
>=20
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 405 ++++++++++++++++--
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   7 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   1 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  28 +-
>  4 files changed, 391 insertions(+), 50 deletions(-)
>=20


--Sig_/mtPXnjFILmf965yRvrRc6K7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYFf6cACgkQI1/ltBGq
qqfNtg//TtA5pQDAflmV9sN/T+8XLCcv8OUBqo5JzLWKOqH67QxUrbaMsY+wmHb9
WcZOSJNKs8Ncmtv1smqELDKy+s0lXIRbef9WtkKXEUkDntuo4OrtkXcMLa4mf04W
a7XA2zVeKLjANW0a5y87dzx3FEcb2IEmC0p55pTmKEHxBV8BDqHbcpLSQKfkZWkX
j5aQ+m0hZIqMErJAp4ImzBVLVqFXAIE+A/zl9qvnMgRY/CtkeTqPaUA7iXOzuklB
L6T6aqP3Dvcz9LOMiAKcwB+wuFJpcXawjSRXTB2xCr15wmRH8KWfbYcR8Tpwrk0t
iqvAmJEZxbDdbe/j4LFDwJKiKlLpW7G0FCHaInz+aUeo4QDauCtplT+y6w+WfvWv
zFoQIQElSoOGfnQAMlP6VK1yG/s1jeDROKD/p6FLQPz6N9mN+2Bjvb9SaWByEtnK
ny7uvnqoi/Lazmc80V0jtgf/Mbl3fxigQrokLXDTEDBkDHysfh0SQJinxsqkndl4
i0V9rliOGyyV9a64J6Gy0Amxkv5u6JOZlKLnE0msioL6Qhbinq44xBNPIK8b6sMt
40kOGvE74Adc0slt4kP4Eho9RTaPUc2xR/Y260NMhEsYn3OJ1oR21+6LzVaDuyOG
eFh1z/DBTTd2rUb4S5r5CEfD8kjcFGEi6/13rrR5ro7Cd5G32vs=
=K109
-----END PGP SIGNATURE-----

--Sig_/mtPXnjFILmf965yRvrRc6K7--
