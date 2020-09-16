Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 007DE26D5B9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 10:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AC06EB78;
	Thu, 17 Sep 2020 08:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3247D6EA6F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:04:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 981522711D2
Date: Wed, 16 Sep 2020 13:04:09 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/3] drm: panfrost: Coherency support
Message-ID: <20200916170409.GA2543@kevin>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d109e9da-feb3-c09f-2b7f-98c92ce39593@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <d109e9da-feb3-c09f-2b7f-98c92ce39593@baylibre.com>
X-Mailman-Approved-At: Thu, 17 Sep 2020 08:08:02 +0000
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
Cc: tomeu.vizoso@collabora.com, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 iommu@lists.linux-foundation.org, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: multipart/mixed; boundary="===============0731873044=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0731873044==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> So I get a performance regression with the dma-coherent approach, even if it's
> clearly the cleaner.

That's bizarre -- this should really be the faster of the two.

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl9iRX8ACgkQ/v5QWgr1
WA0Fsg//Qy1ZMY68LHnG0Sv9WWMIPx28MJoZmed9VIQ5jMu951cNntKyVqqUVGJf
GAHSFPbAEPpbocf35MhRwm12dLx4SyomgpwavHF0Lkx9e/XkgCJz5n2yZBNvHikV
UP/R31ETfND5V4oRfLdHodJrNNyVabFk5PsWBVbgefRCxysLK+Pq1uXvsWeY5cUW
Nond4DUoQ48S+AMXUCaLFCjfNcqq3Jt1Juh1x2fW61pGdvCWoPHV9u2niQ3ylTiz
l6v105u/j4SvHALH2eW+mxfxNSBwS2kIkMTZdPzD8bTnh8N3DBokcwRpPw2LSR/O
UNPLxSfiTQVrvj5TX/VXBvK2B8eFph0lCMvtoUSt88WZ5xo+RZBkMZdXkOaXgMdt
eyhPLCXOWkLcyA/qPeElvCmRsJ3vrT1XSrfqZkq3Hx3XAedaFYEw2mXGVWRo8XAI
27zYwkyzvWweUR+QkC8HK4fpiXs8/x+rF/cGT3zfDU0VPpCOPLw8ZII/lGGKNazi
/0pocVSw+1IPg4OCdC26zjP9a1Drc5b5YIeLnnxwtb5+KcowkWG0sa4H5+CZ7zls
E4P2exzZCOeRAeqYZMzUWawGzkUCWKVnoxwYrWyyvbO/0eoreJ3kv50S+754JUOw
tAyaRpfGYLblm2cmC2xpckAtg1HekYaFIIphP1SZIm+iZTYv9+0=
=ZO+i
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--

--===============0731873044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0731873044==--
