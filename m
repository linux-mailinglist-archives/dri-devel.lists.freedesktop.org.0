Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CD7143065
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 18:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DC16EA19;
	Mon, 20 Jan 2020 17:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 81FB06EA19
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 17:03:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC74E31B;
 Mon, 20 Jan 2020 09:03:45 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67D6C3F68E;
 Mon, 20 Jan 2020 09:03:45 -0800 (PST)
Date: Mon, 20 Jan 2020 17:03:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 4/7] drm/panfrost: Add support for multiple regulators
Message-ID: <20200120170343.GE6852@sirena.org.uk>
References: <20200114071602.47627-1-drinkcat@chromium.org>
 <20200114071602.47627-5-drinkcat@chromium.org>
 <7e82cac2-efbf-806b-8c2e-04dbd0482b50@arm.com>
MIME-Version: 1.0
In-Reply-To: <7e82cac2-efbf-806b-8c2e-04dbd0482b50@arm.com>
X-Cookie: I invented skydiving in 1989!
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0165992928=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0165992928==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a1QUDc0q7S3U7/Jg"
Content-Disposition: inline


--a1QUDc0q7S3U7/Jg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 20, 2020 at 02:43:10PM +0000, Steven Price wrote:

> From discussions offline, I think I've come round to the view that
> having a "soft PDC" in device tree isn't the right solution. Device tree
> should be describing the hardware and that isn't actually a hardware
> component.

You can use an implementation like that separately to it being in the
device tree, it is perfectly possible to instantiate devices that have
no representation at all in device tree based on other things that are
there like board or SoC information, or as subdevices of things that are
there.

--a1QUDc0q7S3U7/Jg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4l3W8ACgkQJNaLcl1U
h9DW1Qf+O1rhi1Qf46h1FjTMYWukB9iEFgJeJZ9xZby51p6qFhhoaf/vJWQgPgqC
PY+Tcxt1Dsk+84dKcLHXZVzsyFLanGZHI9TA2a0j5E1viknxKbaHP84RFmHU4y3s
lJQbgllRUQwkDF2ixZWfipql08kA3v/54BnAN8RsmJMrFN6mpSojTwQlT7390aaA
o2cjkfI/9GOUZ+mGsWzOmr/REEcE/+/aiFXvXnNFyRUzWHoHaEP3eIRegFGjp4E1
kV3GIOpFTkavPF8xb5LRChqYobnVhIizFJiFnlV9h9g/jG7OG1SUifQEtbSsOBT7
fvMX0psaSlV+9wp2Ei3MLvjGH1vemA==
=zekS
-----END PGP SIGNATURE-----

--a1QUDc0q7S3U7/Jg--

--===============0165992928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0165992928==--
