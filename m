Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC66C8902D4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 16:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0A011248D;
	Thu, 28 Mar 2024 15:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="a5Q0K7+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF68011248D;
 Thu, 28 Mar 2024 15:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711639020;
 bh=ev5Hj4kowoGeYRtU8OOEaZGkDO3TmD/BhMPV2cKhGRY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=a5Q0K7+NKN/FtkW1jhlg4mmKBDgzGHyvIdLnGMXbqASDHtQV5XYHKHNI29FmkwPGs
 KeXZBDXPe3BJBa9C/V5MuMgX5lIX1BTXFgIkh/cHPX4Q4RfLws8YFc2mLbe9Psn2AM
 6NQc1+5XLNdz7q5YFOFCVyRVaCa5hT1CW0/Uzt9RpWtp3tRH+Ky8u7N5SDEemZm87W
 fifGhXzJ2hvbRv82p05p38XDgFVGd1IBeeWdIIkE6ZHaV/348hTf22M4kEjGrQV6SU
 2o7vnXuIzT7GPraqgLZPnahhODQziqXVvqX3r7//OtzXAd8nKhch6IB7bX23Uq1JEx
 2yiFs4P1L4AWg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C4468378211C;
 Thu, 28 Mar 2024 15:16:59 +0000 (UTC)
Date: Thu, 28 Mar 2024 17:16:58 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: <sunpeng.li@amd.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 Joshua Ashton <joshua@froggi.es>, Michel =?UTF-8?B?RMOkbnplcg==?=
 <mdaenzer@redhat.com>, Chao Guo <chao.guo@nxp.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, Vikas Korjani <Vikas.Korjani@amd.com>, Robert Mader
 <robert.mader@posteo.de>, "Sean Paul" <sean@poorly.run>, Simon Ser
 <contact@emersion.fr>, Shashank Sharma <shashank.sharma@amd.com>, Harry
 Wentland <harry.wentland@amd.com>, "Sebastian Wick"
 <sebastian.wick@redhat.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Introduce overlay cursor mode
Message-ID: <20240328171658.25b1ffaf.pekka.paalanen@collabora.com>
In-Reply-To: <20240315170959.165505-2-sunpeng.li@amd.com>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
 <20240315170959.165505-2-sunpeng.li@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=DZ=rnPVIjFG3hhH3Oi+MHL";
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

--Sig_/=DZ=rnPVIjFG3hhH3Oi+MHL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Mar 2024 13:09:57 -0400
<sunpeng.li@amd.com> wrote:

> From: Leo Li <sunpeng.li@amd.com>
>=20
> [Why]
>=20
> DCN is the display hardware for amdgpu. DRM planes are backed by DCN
> hardware pipes, which carry pixel data from one end (memory), to the
> other (output encoder).
>=20
> Each DCN pipe has the ability to blend in a cursor early on in the
> pipeline. In other words, there are no dedicated cursor planes in DCN,
> which makes cursor behavior somewhat unintuitive for compositors.
>=20
> For example, if the cursor is in RGB format, but the top-most DRM plane
> is in YUV format, DCN will not be able to blend them. Because of this,
> amdgpu_dm rejects all configurations where a cursor needs to be enabled
> on top of a YUV formatted plane.
>=20
> From a compositor's perspective, when computing an allocation for
> hardware plane offloading, this cursor-on-yuv configuration result in an
> atomic test failure. Since the failure reason is not obvious at all,
> compositors will likely fall back to full rendering, which is not ideal.
>=20
> Instead, amdgpu_dm can try to accommodate the cursor-on-yuv
> configuration by opportunistically reserving a separate DCN pipe just
> for the cursor. We can refer to this as "overlay cursor mode". It is
> contrasted with "native cursor mode", where the native DCN per-pipe
> cursor is used.

I can't comment on the code, but this explanation sounds like a really
good move!


Thanks,
pq

> [How]
>=20
> On each crtc, compute whether the cursor plane should be enabled in
> overlay mode (which currently, is iff the immediate plane below has a
> YUV format). If it is, mark the CRTC as requesting overlay cursor mode.
>=20
> During DC validation, attempt to enable a separate DCN pipe for the
> cursor if it's in overlay mode. If that fails, or if no overlay mode is
> requested, then fallback to native mode.
>=20
> Signed-off-by: Leo Li <sunpeng.li@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 309 +++++++++++++++---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   7 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   1 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  13 +-
>  4 files changed, 288 insertions(+), 42 deletions(-)

--Sig_/=DZ=rnPVIjFG3hhH3Oi+MHL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYFieoACgkQI1/ltBGq
qqcwBxAAk97QZfBlHlsDuYDhMeAkq/kUmUXdkgvypTAxJndMZXA7fYiNOSAeqrwZ
XgXfQJF43uIwu+Yhf7R6YW+MK7FB2qdbwXd5gsLBmbdBq0n1j9p1BX6Bg3E4zaaX
9cw9RuzPvGJ3odvcdpEPFe75bS+d78T6/5S2GG2kTTKC8IMRofLODCARs2AxrpqN
4qGNqZzjgA462dpP8AJiHUOfDhXX7+nng9fPa5BCpkZYqav20yG9cjGNZZk9ilJ/
SqPRidpgedZ/8jCgSIFdBUhuT8ht80vWqlkmcQhdS0eTMd/mACq+HuNiDe8aVVDC
4riOzFoBKpzyjVCrHTSuKoO3yuevfggjZqJVKxOEultSyg7FpDB1B+8YUyU1zYKL
h4EZO+cCDyIfbl/qeXwcnqazWMPAomsvZaIx7UMH9BwSzR+f/IU9eIWe09dbOIwL
8gGC0tK+usmMBdMIM6oPFdqB3D377h8x/coQ5rJH2k5c6JJnNeZYel+y01MlHbqp
6yJOcBW3RU3qV+o7lf1+hsO9ElutneVHiXuiAka8xZcRbO5GxryqhzGR5CbqVhZw
iHRJBQhwSl55JLkMh4hcE4wUZMrVRFHoY3deNJNLAivIukfsjSz/WqdgZPg2/paE
xKXBvu8S2vk6f6ohYrmdaEB3wY48CDvmtsYsyFzxC13N7f2P0EM=
=XkHL
-----END PGP SIGNATURE-----

--Sig_/=DZ=rnPVIjFG3hhH3Oi+MHL--
