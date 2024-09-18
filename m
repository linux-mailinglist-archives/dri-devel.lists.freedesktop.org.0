Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A9397BD3F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 15:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2A210E5B0;
	Wed, 18 Sep 2024 13:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hDOpX9Cj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A55710E5AC;
 Wed, 18 Sep 2024 13:45:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 79C0EA40446;
 Wed, 18 Sep 2024 13:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95F5C4CEC2;
 Wed, 18 Sep 2024 13:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726667114;
 bh=cL6lpSz/kdR6T4KeqPH7EEkrh+WFPe2uL9PykCNsqqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hDOpX9CjSUgIJakr6qUKjN5axzMtd8hgKuof/Sdcp5Nycftg8xK/C7FXXdSYEJ6RY
 rF2arMHrM5eHns0mgfL4ag/MTKsKgc8bHXAPzT/bwILqhw7OWKPCSpqmhl5goy5eQD
 hT6dXCh+UzloN+FYe2OOvJ9dDuAWDqU7HUHjUpDQJTz656Vkk2127KpSVstIOuLy+4
 1od+pJwL/MAl+H3aQkoplS5sDz2Pr1NSVmwiqDCNyjehCVY2Ikd36bl9rg6wAlac/g
 l47uTubbe1Tb/5G9HJXfJYSR+HzceovEWL+4R47XpkaxIewKWeOnfEjv8qjahUGwb2
 PTufLyENcV4gw==
Date: Wed, 18 Sep 2024 15:45:11 +0200
From: Mark Brown <broonie@kernel.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v6 00/12] spi: add driver for Intel discrete graphics
Message-ID: <ZurZZ1pzmbWifjAD@finisterre.sirena.org.uk>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Bs8sGvs52rAy0duI"
Content-Disposition: inline
In-Reply-To: <20240916134928.3654054-1-alexander.usyskin@intel.com>
X-Cookie: Editing is a rewording activity.
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


--Bs8sGvs52rAy0duI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 16, 2024 at 04:49:16PM +0300, Alexander Usyskin wrote:
> Add driver for access to Intel discrete graphics card
> internal SPI device.
> Expose device on auxiliary bus by i915 and Xe drivers and
> provide spi driver to register this device with MTD framework.

As far as I can tell this does not actually provide a SPI driver, there
is no call to any SPI API that I've noticed here.  The SPI framework
does have support for SPI controllers with specific flash support via
spi_controller_mem_ops but this does not appear to use them.  Either it
should do that or it should just be a MTD driver.

The series is also split up into too many patches with minimal
explanation, making it hard to follow what's going on.  I would
recommend making the first patch be a minimal functional driver and then
building on top of that.

--Bs8sGvs52rAy0duI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbq2WYACgkQJNaLcl1U
h9BCZgf/W29Rkg31k8d/BbDhUYZW8jjlXYf12ChmIOuQyLVOpr4YRUpMoFKl1KGz
iu+tQ3AK35GqadvAzuEC3U4cyrM0bdthCUNFlH2I7zC5gMFFutdGumdF9D7EYke7
ygehHFnVZ/bHZg+Nt7zCqPpJtlboc8Tf130goHxzBougrUA4+HCH0r00lPgnVwJP
pOOAFgyYXEhvUKbZffE4jTorrTGcWGZm17TnTA6VtDL+KYBYls2ltLbB1pseRelB
tmGZMqJmU7cyJY1tVl4Hh4wsnziLPCyi/JAzZnS5WwFWgq3si4ZV1V9mTXkq6MM/
JqOpqfUJbVvxSSXkYUVoFFqqwjjcWQ==
=JQuG
-----END PGP SIGNATURE-----

--Bs8sGvs52rAy0duI--
