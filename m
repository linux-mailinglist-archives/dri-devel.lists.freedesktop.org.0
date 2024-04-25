Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90B88B2475
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 16:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6238A11A4D7;
	Thu, 25 Apr 2024 14:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BtLHAqD5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AC811A4D7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 14:58:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 263E2CE1A8D;
 Thu, 25 Apr 2024 14:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A06C113CC;
 Thu, 25 Apr 2024 14:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714057089;
 bh=zyuU7aypTY7g7YWDgpvL/ij2MOClcEQlWT1WF9DZpnE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BtLHAqD5xWO6OKKeia9yyRqUbAZB0xhKytVz5eaC5G5Ya1YPReGVbVAaF7/ZaKn9E
 /YuLVEgSYmSyITwT+i4uYE8KjcE9QsaA7lfLMFml/bQbHVooHG5gooswSTbsbxGkVb
 GmNqGaU0umBagSSt43PXEn7MfPYYrh/LXo7BxRaX+gCVpY0xbFfTVd1CyJVq44PgVk
 ijSEO/PN4GdaRWue3P0ayedh8e881ZCREpETeTeD7+LPthn+ICOFyrYRdiNqOwueVG
 ATod9Y9lk0OwDZmw/nbgeV3Q/0A5a65xik1HCpPMMXHzvhkd1Dz9D4tRGGhx7TSgTg
 Qw41nwqdHBLPg==
Date: Thu, 25 Apr 2024 16:58:06 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 David Lechner <dlechner@baylibre.com>, 
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 1/1] drm/ili9341: Remove the duplicative driver
Message-ID: <20240425-perky-myrtle-gorilla-e1e24f@penduick>
References: <20240425124208.2255265-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="74envoxrgvwfu67m"
Content-Disposition: inline
In-Reply-To: <20240425124208.2255265-1-andriy.shevchenko@linux.intel.com>
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


--74envoxrgvwfu67m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 25, 2024 at 03:42:07PM +0300, Andy Shevchenko wrote:
> First of all, the driver was introduced when it was already
> two drivers available for Ilitek 9341 panels.
>=20
> Second, the most recent (fourth!) driver has incorporated this one
> and hence, when enabled, it covers the provided functionality.
>=20
> Taking into account the above, remove duplicative driver and make
> maintenance and support eaiser for everybody.
>=20
> Also see discussion [1] for details about Ilitek 9341 duplication
> code.
>=20
> Link: https://lore.kernel.org/r/ZXM9pG-53V4S8E2H@smile.fi.intel.com [1]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I think it should be the other way around and we should remove the
mipi-dbi handling from panel/panel-ilitek-ili9341.c

It's basically two drivers glued together for no particular reason and
handling two very different use cases which just adds more complexity
than it needs to.

And it's the only driver doing so afaik, so it's definitely not "least
surprise" compliant.

Maxime


--74envoxrgvwfu67m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZipveQAKCRAnX84Zoj2+
dvmrAX9etHoRYY5/bI3esFlwYvaOtVaTDgXGupHx8xowA1Hxjt+tFOdluSqL/hlq
SI1l4y8BfRsxjM/ARJYlGvp4Wnn0sIUBposLg8sGbgX1rxcALiJweK1Et3vTt3+S
QMlLOJkL9w==
=4TjG
-----END PGP SIGNATURE-----

--74envoxrgvwfu67m--
