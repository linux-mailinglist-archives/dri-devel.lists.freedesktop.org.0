Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0EE90FE5B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBADE10E84B;
	Thu, 20 Jun 2024 08:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kh6ft39J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30FF10E87A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:10:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 23A28CE206C;
 Thu, 20 Jun 2024 08:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054DEC2BD10;
 Thu, 20 Jun 2024 08:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718871030;
 bh=CQO1ZBCY35dlIP9EFLK4duHPiQg8itojF2iQa8PXx64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kh6ft39JpcBsdpZO0QMSFCDeFsuCKzbFwMn93a0DLuPj+dgILod/fjgwr5WUqu/fA
 DsdFZzgCVl9BCLCYPaQw6gzHZiXNVJbfFgAqlYdXTrOFqflIspGj8AUy02bovNrSH/
 UNSqLjbrWBRvcwQ7/YpeMo2jrqzwYA+kf0R64qbwBo7u0U33bwM5deVtdbG4OwnpSX
 77tVWOdf+AzKQDNPrCtvmKdNJ2w6wiNlRIDIg8QxGAZ+FGFluDgEGR5aaBThMAnJIC
 OrANFHGy1IZ8e0g1jEwMQTP8u1dnvSaSNpMiQdlKXotUAMusbr/1LjjzcJbfrcySKm
 lwtQNMJaK5giQ==
Date: Thu, 20 Jun 2024 10:10:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] drm/tests: Add tests for the new Monochrome value
 of tv_mode
Message-ID: <20240620-expert-coucal-from-shambhala-9f55b7@houat>
References: <20240619153913.2804051-1-dave.stevenson@raspberrypi.com>
 <20240619153913.2804051-2-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sjc64ugblgiodzuk"
Content-Disposition: inline
In-Reply-To: <20240619153913.2804051-2-dave.stevenson@raspberrypi.com>
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


--sjc64ugblgiodzuk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 04:39:11PM GMT, Dave Stevenson wrote:
>  static struct kunit_case drm_modes_analog_tv_tests[] = {
>  	KUNIT_CASE(drm_test_modes_analog_tv_ntsc_480i),
>  	KUNIT_CASE(drm_test_modes_analog_tv_ntsc_480i_inlined),
>  	KUNIT_CASE(drm_test_modes_analog_tv_pal_576i),
>  	KUNIT_CASE(drm_test_modes_analog_tv_pal_576i_inlined),
> +	KUNIT_CASE(drm_test_modes_analog_tv_mono_576i),
>  	{ }

Also, the tests should be sorted by alphabetical order

Maxime

--sjc64ugblgiodzuk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnPj8wAKCRDj7w1vZxhR
xTSlAQDmbAbsN3ET1P0m003ND7fzu8vtOOUZyNOL7MUDfn94gQEA7jzDXL8J+XiV
wMt7wd2FPFzm7ZI501XOzW3B2/nmMgc=
=T0r4
-----END PGP SIGNATURE-----

--sjc64ugblgiodzuk--
