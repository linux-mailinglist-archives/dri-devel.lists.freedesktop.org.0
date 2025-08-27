Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA91B3832D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 15:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B2C10E80A;
	Wed, 27 Aug 2025 13:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kB19MC+r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176F310E80A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 13:00:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5010A435D8;
 Wed, 27 Aug 2025 13:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD28C4CEEB;
 Wed, 27 Aug 2025 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756299619;
 bh=oUp0O4U5Go0EqkZZCq3EFdf5SUCnHRvMWMxrlZH33+4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kB19MC+r9aRUm4XXPz24W0+AjNcsef64msjlzE2Qhqt2mRnynQoWg0jryQG6AbtRQ
 TjcTqKn+mDIOLinl/4WkCNz2aBne69OBS/ebBlGiVQZAPAh8B6m42oj/8Pnmn5T7S2
 1eJgR2gpOFJd2XK6XGABz9i+AdANZ2nPgZq3VmC6j3bk03mhQQDkXAuOLXDuxtcW1H
 1Ngztd2EXeqZx/U7JXtYqEpjXuFq7mxDo0fGKUpa7Z0VNk9Hoc/d3VKlyrmE7Diyh5
 cumwwlO7k6NTn3a5Ytc7jhg33Vl9qkI5EfbAyegU8I2jxy9T8rL5RZjWxOjX3iUuJs
 UECLA3yCiYVIg==
Date: Wed, 27 Aug 2025 14:00:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/sysfb: Do not deref unexisting CRTC state in
 atomic_disable
Message-ID: <744ac958-aa8a-4fc7-9dbf-04511641b7c2@sirena.org.uk>
References: <20250826145044.954396-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VVNBbWciBKpsReWc"
Content-Disposition: inline
In-Reply-To: <20250826145044.954396-1-tzimmermann@suse.de>
X-Cookie: Pyros of the world... IGNITE !!!
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


--VVNBbWciBKpsReWc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 26, 2025 at 04:50:25PM +0200, Thomas Zimmermann wrote:
> Do not access CRTC state in drm_sysfb_plane_helper_atomic_disable().
> Use format from sysfb device for clearing scanout buffer. This is
> the behavior from before commit 061963cd9e5b ("drm/sysfb: Blit to
> CRTC destination format").

Tested-by: Mark Brown <broonie@kernel.org>

--VVNBbWciBKpsReWc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmivAVkACgkQJNaLcl1U
h9BgeAf+JXxs6GnEz+27nbVCTrbcaC1OJv6BF+6AJZXwoc7k7WwCO3WMqALNlrjZ
zT2AAst/+dZdiv9XUA3RvZqTL3D2LLZPzKQjKjNQrhGemiFOX1WA220fVa9NV49i
/k1Xw7b7xNA3oBlZjTrMcyK6Maz4AUgdNpAaBRWyRaWohJDW0jPGV02m10/RCDBJ
Rf6VGg4QPo2jP7R5hPGJzOy1L9GktJn0CjqraRHawFS3Mmzff4juehQzRQzayNl9
N5qPhONGMD4kODGrZzxyqdPXKmLS4vkJCvB1AD3O4Lds+LIzgg8hoinyvB5Bcm3W
noHWi5nn7nDQaspQNXy3Fjls8LlTFA==
=LAN7
-----END PGP SIGNATURE-----

--VVNBbWciBKpsReWc--
