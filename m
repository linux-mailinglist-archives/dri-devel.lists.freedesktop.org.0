Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D78B12348
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 19:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4394E10EA08;
	Fri, 25 Jul 2025 17:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q8V88xbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F5A10EA01;
 Fri, 25 Jul 2025 17:52:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2E75143597;
 Fri, 25 Jul 2025 17:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FEAAC4CEE7;
 Fri, 25 Jul 2025 17:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753465935;
 bh=g1r1LpHW+KoaHQWYuEtYodRe7C+UkFUdiAIH+d6QkAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q8V88xbZpY6j1VppEMK9JtzJOvuUPje44ZkeLllK8ScgTDDD3BGg01CuBgfyd4JK2
 QteadXVyPjyV9Eb6RA/yEnsL8ml8p2gDPBRGLAU1VhvAMrV30cZLqjd7H1DO+Xj1U9
 OvqJr5kvSoMy+9dS5CdHxU7mPo8crA9PMtAne0y1vQNtTVI5HMkZFzIieO3mybl9FR
 9prXupZPMFWt2oP/Z5KKO+WgeqAMmxUEb5anz6ppYrTo7jW1w7wXCVoT6g9+0bF8Gi
 aQolyds1Bv4QxlfGJmI0GXdOzV/yoNyXjcFr6E6tgNAoGb0Xpf6FooyLrgvg6NVDoq
 sPHtY9x6aEY7w==
Date: Fri, 25 Jul 2025 18:52:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 19/19] drm: Make passing of format info to
 drm_helper_mode_fill_fb_struct() mandatory
Message-ID: <aIPES8pWAdCVB07L@finisterre.sirena.org.uk>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-20-ville.syrjala@linux.intel.com>
 <98b3a62c-91ff-4f91-a58b-e1265f84180b@sirena.org.uk>
 <aIOIX8W6olY8ryTN@finisterre.sirena.org.uk>
 <aIOTaOA6bUelUtBm@ideak-desk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CzoA5MeqgHcBgqVK"
Content-Disposition: inline
In-Reply-To: <aIOTaOA6bUelUtBm@ideak-desk>
X-Cookie: Do not cut switchbacks.
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


--CzoA5MeqgHcBgqVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 25, 2025 at 05:23:36PM +0300, Imre Deak wrote:
> On Fri, Jul 25, 2025 at 02:36:31PM +0100, Mark Brown wrote:

> > This regression is still present in today's -next, I've not seen any
> > response to my report?

> Looks like the following would fix it, could you give it a go?:

Yes, that seems to do the trick thanks!

Tested-by: Mark Brown <broonie@kernel.org>

--CzoA5MeqgHcBgqVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiDxEgACgkQJNaLcl1U
h9AweQf/YZwa1qV3H9OqoK39DEZtYKLaigJabw3mDKnZHbCdlTZCdwGf6ykWhQJl
wwvBB1TWBHiC5NuqoO3g/rTg68MVQBgcZHjiQeKwL91Chm9YQXCqFkmyUs+3elV1
bMom32BV52wVTSsnwrfrBHviA/zcdOB0OyPhw1gOzY4jsfQ9a+yBPjUeX5frKm+9
1JRPlMnHsFQeDW0UqdTgfUQMxFfak0xE5p4ekjp+qCqvgrPT0nYhm0Fp+JL8HieU
5dKmPOhUCIpXNHAyNYqd5AehPzFDNcHYi5pCb4BUOC43KZOBiFawSoCBYg7lirce
XCIYYgY4++qlFDYl4o4XmMuSlcUWgg==
=VRPF
-----END PGP SIGNATURE-----

--CzoA5MeqgHcBgqVK--
