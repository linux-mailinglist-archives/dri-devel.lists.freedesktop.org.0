Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFFC8BC08A
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2024 15:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE97110F15D;
	Sun,  5 May 2024 13:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fiHGNNeK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492D410F15D
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2024 13:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=b8Fw
 I8NDIStQy++ysfaCCkTUM0+8iD45sYNvh1HiPTs=; b=fiHGNNeKbs3vaYfYPvQZ
 VPB/YR4n8iZ6EfSB08AxGISa05oG0NoUH/A9ZpxuKFdw1PYz3VMOmiTNk9Ci4nD6
 YHg3n0yec5A9pEiOPXWrHK18vTe/3ew8roDfS+r1qFfgITGvpzAwA/ssakVmj1oB
 XkjZoZIXKbZIwhwlWzsj3C+91lwK2tX//YvwEbDaUPqWn4QO4TD9Zdc71+TiIyV4
 WriO9Fle3l6+B0UddlMoIV1kes32PYF2EuLbmYlXBsf8D8Kg2kDMcfhvDTbVKz0O
 x3zanFEXirHA187Rtu0kGPu7ymwkKnMKKTzUjoI32UvOaIBeqCUJUSlDJL5q5IsV
 tg==
Received: (qmail 4097045 invoked from network); 5 May 2024 15:25:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 5 May 2024 15:25:12 +0200
X-UD-Smtp-Session: l3s3148p1@e53m4bQXEoIujnsp
Date: Sun, 5 May 2024 15:25:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/1] drm: arm: display: komeda: komeda_crtc: use
 'time_left' variable with wait_for_completion_timeout()
Message-ID: <otvdvad6cypqtedakhpqowyrorz6wzslmpnie65ydf57532mjq@n6muotubrea7>
References: <20240502210252.11617-2-wsa+renesas@sang-engineering.com>
 <ZjTQwBoCei02Bzp_@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sse4ipmep5yyeeb7"
Content-Disposition: inline
In-Reply-To: <ZjTQwBoCei02Bzp_@e110455-lin.cambridge.arm.com>
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


--sse4ipmep5yyeeb7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >  	/* wait the flip take affect.*/
> > -	timeout =3D wait_for_completion_timeout(flip_done, HZ);
> > -	if (timeout =3D=3D 0) {
> > +	time_left =3D wait_for_completion_timeout(flip_done, HZ);
> > +	if (time_left =3D=3D 0) {
>=20
> Honestly, if the name of the variable is confusing I would get rid of it =
completely. Can you
> send a patch that removes the timeout variable and here just does:
>=20
> 	if (wait_for_completion_timeout(flip_done, HZ) =3D=3D 0) {

Can do. I think, though, that using 'time_left' is still easier to
understand. However, this code block is simple enough and it is your
driver, so I'll send v2 later.


--sse4ipmep5yyeeb7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmY3iLcACgkQFA3kzBSg
Kbb5yxAAjTCNtLIg39Y5QNj7f+nASGIvGYzKubGjcNJjdC2XTX9OCGT7RdKIuEdL
aM8cnRuafYe1EDxNJfRIntbk/CInMUAwwlE/dWK+3+Sa9kRzd2YjT8T0oIh08BUS
VO6vZzXamwjXfKUvwPIXD0omUy9UiUaa/RtUOHHAKUL3tUwdf4aooyO646qgZDFl
GOm3/GEESnEDJ7zn6ZbNjKkF6gfsUc3fnMeRGlt8zu6zJFfgvFVFA5nBFB05SHpa
/HL/NNQkEzjhwIe32B+Do65DyeIqWGSbWnnbSmIlFntZETGIG0R2Pi4JNXilOcoi
PfGizdk8ZDwN8MPHU6yF8wlJsA/uyzR/UjM24yIECh8Zw8akx7szrLDd83EGTklw
Px4LbUD906K5Zka4o1AHHSjkVxXrAERzInRos+q5KoNTlGZFJyXC2BNSfVETWSp1
necXE/2jqH64h0hcfORPYfaDtYuXpkX+SmF/fwg3CXfKiS1HP3IcPxZF3r8OMpM+
AY0MDTebeIr3roJKfM92kYuhHhTXmno4/0m9+ttE8s8KS3aceLKAjvZCoqVDOZIG
BWOcQluWXmxlmMviTJqMGmtZF752ACqAv7IZz2TTIQMUYTrejqXBilAbeUZdNSNx
NYyKd2hcu38S/ZjLAzxN3UzUvPLfeHqJ4j/xQMEtdq1QyOdai2Q=
=fz3N
-----END PGP SIGNATURE-----

--sse4ipmep5yyeeb7--
