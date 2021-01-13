Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7C92F4A60
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 12:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93B56E5A0;
	Wed, 13 Jan 2021 11:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63346E5A0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 11:42:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2D4A233ED;
 Wed, 13 Jan 2021 11:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610538177;
 bh=zD0PRAwPPHdJDtX3W1Wzw2SOHfIaFNZ0sverdBz1aLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h30YA1UHYQ6uUQvex3e4933En6rrwFtIJNjVOSaQFZg6xQwVJ4DsSSSxrDHIYEelO
 m0PRooOombid5Ty/awvIuv//cLrtFoUhY4Hf8xSLxe3ZTn8Nrk+dYauzBsX6vKgyrd
 ASZQqae7SV692wD8coR7wC9HoVKYGjjgfRHbVRmFxE7PB90GK+cWQM4DkxcaIbzwqj
 5AHLTy1n/SZGclI0qOgqv8tv+VMZqxpibFpfkT5Zwt4GhZmhqJwHM3PfLAwZzt1jLX
 pFZ8b8Hl9f0ZvkoTLBEzd6s+a8VsGnJoKcEoMYOvjUxvhW9UAAn1khIesay37pQQNi
 kwyS59sjz9lxw==
Date: Wed, 13 Jan 2021 11:42:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH RFC] drm/vc4: hdmi: Avoid ASoC error messages on startup
Message-ID: <20210113114223.GB4641@sirena.org.uk>
References: <1609256210-19863-1-git-send-email-stefan.wahren@i2se.com>
 <ab03444f-feb2-fbab-97fc-a070ccbe06b4@i2se.com>
 <20210113091957.odclfwmeykrkyq7v@gilmour>
MIME-Version: 1.0
In-Reply-To: <20210113091957.odclfwmeykrkyq7v@gilmour>
X-Cookie: Ignore previous fortune.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, David Airlie <airlied@linux.ie>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============0338133428=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0338133428==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 13, 2021 at 10:19:57AM +0100, Maxime Ripard wrote:

> I'd like to get Mark's opinion before merging though

I'm not sure what the question is here?  I get CCed on a bunch of not
obviously relevant DRM patches so there's a good chance I've just
deleted some relevnat discussion.

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/+3J4ACgkQJNaLcl1U
h9B9JAf+Ni7RLLSZ0B6zLXhFy3B8xcfWvbYPfvRCB7ZxY6tOGqU1sKrs0kKT5pZy
GcYQX+F3akK7yXaZc1tAjiijVdZrNQ5qg27Y1pJKG7RPJdUFcr+GrVJp93SRGaNI
nJXMPW1X6EyBIGLxhTYQx5QN2SIhFfkqbNGP4qW+zq5qSeKmRodrH1i21furuagE
dBAQgs8ygLnXw7exNTNbutoYbFoa6WFMpZC5TVzWnvAo4pmHoblMSWGcwrSlLSNV
GhhS4wL7dpQ9UvySz7XT5ogsiCQ5nAgz7HQozzDdxuwiBOtqBd9VqWLNiiBrLboX
rfYPeDYrRvH8++1Hd2w0TQT4BpCgqg==
=47J8
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--

--===============0338133428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0338133428==--
