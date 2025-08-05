Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB626B1B869
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 18:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8C410E6C3;
	Tue,  5 Aug 2025 16:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="saWHp7Ey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F00310E6C3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 16:24:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 572F9601D1;
 Tue,  5 Aug 2025 16:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B7FC4CEF0;
 Tue,  5 Aug 2025 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754411071;
 bh=5Nsf4l6kE+fRDakYijKJVMXGIXpZgnG1wCZGn1M7R+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=saWHp7EyI1492UAX2tBDDkZ3Beaj0S+V/wUTKcWX8QKc+t+28T4tir6ZiJ6/I6iRI
 rKUUkbcsv29qKtXlYuPRFfOIZtyfMAqpDZiKAB103kzKsaYTEPFUZZfXvPVCnUMuj/
 DU1en51Byihfks3SNnjNA2lZAcjZpAeHwJe2daRKhHN8eVhNUuoo9/4z50WaCptAWX
 HdenkUKckykgm4kFCspXy1hzaUHWQwyXX7116D7f8pZpMNsJbhXNnt5sr7OnOaJa9V
 grzSbYHSrf5YicRyi6waF/G/mYYPxUH1fX8IXYs7zF2DzElZ2ugdJZokHuXZIUwCTc
 9JheKgSQuXNWw==
Date: Tue, 5 Aug 2025 17:24:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: imre.deak@intel.com, dri-devel@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/3] drm/omap: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Message-ID: <e6d5b8a8-94f2-4a0d-84fa-95352a298e8e@sirena.org.uk>
References: <20250728101603.243788-1-imre.deak@intel.com>
 <20250728101603.243788-2-imre.deak@intel.com>
 <aaa77500-c886-417f-b800-8c9cbbcc3285@ideasonboard.com>
 <aJIaDgAVN8_5TXYu@ideak-desk>
 <5eb7a110-d10d-40a5-963e-185b65e714f1@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JP+a8Jk0hXlsVCGn"
Content-Disposition: inline
In-Reply-To: <5eb7a110-d10d-40a5-963e-185b65e714f1@ideasonboard.com>
X-Cookie: Trap full -- please empty.
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


--JP+a8Jk0hXlsVCGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 05, 2025 at 06:43:04PM +0300, Tomi Valkeinen wrote:

> The patch description here sounds more like it's just refactoring the
> code a bit, but if I understand correctly, it's fixing an issue that
> cause a WARN?

Yes, this has been causing a regression in my testing since before the
merge window.  I originally reported the issue on the 22nd, the week
before the merge window. =20

> So... Either we could 1) split the patch, have the WARN fix as a fix
> patch to the current rc, and the rest later in the next merge window, or
> 2) if you want to keep this as a single patch, I think it makes sense to
> change the subject and description to highlight the fix aspect.

The offending code had only been in -next since the 17th (a week and a
half before the merge window) so I'm not sure there's huge concerns
about stability TBH.  A this point I'm more concerned that we're going
to get a -rc1 with breakage.
with brea

--JP+a8Jk0hXlsVCGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiSMDkACgkQJNaLcl1U
h9ADIgf/T+8/8j90fR7YlUEZX2JQQ/DIRzyjy0JUN9TZvWhrDZm2hhfuNrOLDa+/
afXDuP3NazfUufgdw1C9gCwayv4k1YrWI8YQInOi0rU+WOUaclMoOaX9T+shZ6dJ
SwS603dn4P3P6c9PO+GTJWT0n9z3X2jtj9yqIy8gE+kS3hHimaITRj7zn2YgUHEm
F0g3LXmYVRxBedA9JxPp3NqUhrM4kWmX5Y3i241bMVCCzO9Ae/kfDU0Okm01T47z
sslf6r5lUHHEqxBxwSxMOGa1Fzp0kK97dVJZIyjOTF+Sn8hC1MoEEZHwDJB9fqF3
M6/i2WxizyH6InVLa3zTqXOBSsG3lw==
=h9Sh
-----END PGP SIGNATURE-----

--JP+a8Jk0hXlsVCGn--
