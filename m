Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152B8A259AC
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 13:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7E110E4A4;
	Mon,  3 Feb 2025 12:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kIphV+Uf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF23810E4A4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 12:45:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 83CCEA416EB;
 Mon,  3 Feb 2025 12:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC344C4CEE0;
 Mon,  3 Feb 2025 12:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738586733;
 bh=JcKUnVRFhfPWaD36cL9IKQUCv5Wo87ZOqrEyuwlx9+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kIphV+UftcbLoqbIt+vFzwoiogm8+pnwz0ImB69UL36YOLSjxQCGdK5UM5W6tvR3K
 qOtjMlgXIThtajedx+v5iRSJbhSjYCP1hyOIQhhMD+wEqn0A/5xwHojlCafFytrHGB
 zxiwfhe68jME0iBZ7LMRs+HFMgg/bMQDpZVt+RQCY6Jl1drD765sCIaxRqLAswF6JS
 tGXAd9XCzb9ByAegGZ8UEuZSxbEeCkTiPDwXUbZyvJZaCG71olCeUx326JTvHWwGnS
 1Zsik4mRrw2bDeAAXIf974IuHdOuVv1szDvc6t2Ue9563X+XUG3K8zt8ktj2T3sVrZ
 B7Ty4MIOn6xxw==
Date: Mon, 3 Feb 2025 12:45:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
Message-ID: <849eca29-4f03-4fb2-bd1f-747ce42f4c5f@sirena.org.uk>
References: <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
 <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
 <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
 <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
 <6b4cba29-786c-4999-ac1d-27b3e4cea6f8@samsung.com>
 <Z5kJLrE6xOzOKaeb@smile.fi.intel.com>
 <Z5pESDSekep9ChAN@smile.fi.intel.com>
 <eyjsejpx7klztr4k7xmrvceosfykyozs736kycdnf5uur5by43@5i5x7tsuxtpg>
 <Z6CKGu7URC1iGOVO@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kIw/jZ2k8nynFeV2"
Content-Disposition: inline
In-Reply-To: <Z6CKGu7URC1iGOVO@smile.fi.intel.com>
X-Cookie: May your camel be as swift as the wind.
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


--kIw/jZ2k8nynFeV2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 03, 2025 at 11:19:22AM +0200, Andy Shevchenko wrote:

> Thank you, guys, for reporting an testing, but it seems the simple problem
> to solve requires a lot of changes to be done without regressions
> (this fix on fix makes a regression to those who have cache enabled), which
> means that for now I propose to revert it (or drop) if possible, Mark,
> what is your preference?

I dropped it a while ago, it's not in mainline.

--kIw/jZ2k8nynFeV2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmegumYACgkQJNaLcl1U
h9CI1Af/YUQZ/OvbLSPHBblbvWjcYRs/36TUcERL58yy+RZLvmccKwfXstl6CZxe
/8jDnW9rbwNP4/s7OC0Sz5MBlLyaJlnvr3/hiYcC6ybOpqYGFx3DwI/HQGBxSYah
4DNfH/NgnMWCkeCW2hoQHEmPbQ+kzIAPMbToMgZIo2k4buqcL9Avq2ITo5FwsEpu
2aN2ZRmmfIZ9X1I/2BbNqq0l6/8IBMiVs12CEyeb5PfbfSGNra564aL5VtyoqKIT
Mhx58Qdxk/fUknj7FnnFh8o3pYKTkqY4BLN9fPD1spvIKLXszA1wCASHSeZ+VS9F
QapzrA6XxMys3x/MsaJqpcuWMK9gDQ==
=oT4u
-----END PGP SIGNATURE-----

--kIw/jZ2k8nynFeV2--
