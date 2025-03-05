Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CC8A50133
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2504F10E2B0;
	Wed,  5 Mar 2025 13:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K2t5mJNW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4B510E2AC;
 Wed,  5 Mar 2025 13:59:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EFE53A456C3;
 Wed,  5 Mar 2025 13:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1730AC4CED1;
 Wed,  5 Mar 2025 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741183179;
 bh=uUWoM3F1VLISkGGtrbk8Iy0yfj+Viatw5PoaKtkbs6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K2t5mJNWY3wlbi4aDJChujXyV1y5J361iZqmhyeFECWV1ji2nlo1Kqdr8WVXowQmD
 5eVjRAXU6Gp7rczF1pKeMohb2hDCpuUFbXxjPLdSEJ4sGPabIM9Gj2/+esf1oY9yPz
 gN38O6D5HdxRD6oDkbdy5dK2xEmsE/sBeCAjtCfsagm6yVoZ7b9W2i5LEjxHNvc6ZL
 kmk56shNwvUgoD0njOpMbp6klkl9rJTQWi+65tN/yFMDTMajZeYWk8sbXKt8hEXlgU
 7C7S2U94xo/mwv6FjjbiwsjSXPm7UUYMbp1h4kQpCZR3b6q+9HHc5OTg+zg7jL1xiz
 Gic8wweyar+2A==
Date: Wed, 5 Mar 2025 14:59:36 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 simona.vetter@ffwll.ch, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 2/2] drm: ensure drm headers are self-contained and pass
 kernel-doc
Message-ID: <20250305-modest-finch-of-genius-917605@houat>
References: <cover.1737556766.git.jani.nikula@intel.com>
 <d8ad1c6d707f38a55987f616cb9650aef30b84e1.1737556766.git.jani.nikula@intel.com>
 <CAK7LNATHXwEkjJHP7b-ZmhzLfyyuOdsyimna-=r-sJk+DxigrA@mail.gmail.com>
 <87r03e1lft.fsf@intel.com>
 <CAK7LNARYBtpwkJxbf84+bzBYn05Kk2zvdVLDZMMBg=B_zzFokg@mail.gmail.com>
 <8734fu1arq.fsf@intel.com>
 <CAK7LNATu9OLEANiSzY3Smo=Bm_9M75EDyvmD6HT5kaS2sxRorw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="kilik4piyexv6knf"
Content-Disposition: inline
In-Reply-To: <CAK7LNATu9OLEANiSzY3Smo=Bm_9M75EDyvmD6HT5kaS2sxRorw@mail.gmail.com>
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


--kilik4piyexv6knf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] drm: ensure drm headers are self-contained and pass
 kernel-doc
MIME-Version: 1.0

On Wed, Mar 05, 2025 at 03:05:25AM +0900, Masahiro Yamada wrote:
> > IMO headers should almost invariably be self-contained, instead of
> > putting the burden on their users to include other headers to make it
> > work. It's a PITA in a project the size of the kernel, or even just the
> > drm subsystem, to track these cases when you modify includes in either
> > users or the headers being included.
> >
> > The exception to this are headers that are not to be included directly
> > by users, but rather by other headers as an implementation detail. There
> > may be such cases in include/linux, but not under include/drm.
>=20
> This results in a false check for include/linux/.
>=20
> I don=E2=80=99t see much sense in doing this exceptionally for include/dr=
m/
> after we've learned that it doesn't work globally.

As far as I'm concerned, I find this extremely helpful for DRM. If only
to ensure that the huge amount of work that went into cleaning up our
headers doesn't get lost.

Nobody here claims that it should be enabled globally, just that it
should be enabled for DRM. We already have plenty of exceptions like
that for compiler flags, checkpatch, contribution process, etc. so I'm
not sure why those would be ok, but additional checks limited to a
subsystem wouldn't.

Maxime

--kilik4piyexv6knf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8hYxAAKCRAnX84Zoj2+
dk/qAX9cvaynQadpHQNQtNJ5n10D59GlM1FAG2aESqDBrLmbXpcUOeyT/vqJ3m7d
J87XCn4BfjP+H+Kjq3FYJWmkBX+N0k4bYmUehreVGkLOyOUYOUXqgYoBkB6cph/J
cplTs2CUzQ==
=vJWI
-----END PGP SIGNATURE-----

--kilik4piyexv6knf--
