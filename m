Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5570E207761
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A63E6EB91;
	Wed, 24 Jun 2020 15:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965816EB91
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:28:10 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE59B2078A;
 Wed, 24 Jun 2020 15:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593012490;
 bh=gYYRwt6GotEmTxPBlpzCjJGMURjga0QZ2WSAw4yPjpw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dy2fAdxt4yd6pYZmlrrQjI6l5D1uUGKsD8D57+NhVw3pmC/B/A6vCnnYEMWXXbsvz
 JgBv5Z2rCPEFAYp03qCmNSUoR+4FMh9xAFnx8xeOUT2HK/tuSmfvSUJWSRH61fVh91
 BhophuIwMxaADBgyPRuYeQ9J8G++Q3L4CQnXhzcA=
Date: Wed, 24 Jun 2020 16:28:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RESEND PATCH v5 1/5] driver core: add probe_err log helper
Message-ID: <20200624152808.GI5472@sirena.org.uk>
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114135eucas1p26e2e4683d60cebdce7acd55177013992@eucas1p2.samsung.com>
 <20200624114127.3016-2-a.hajda@samsung.com>
 <20200624132714.GD5472@sirena.org.uk>
 <CAHp75Ve9V1Vyxe3bEeHJ9H2J900wUXHMmXFJt-dn9sO5OMejHA@mail.gmail.com>
 <20200624140207.GE5472@sirena.org.uk>
 <6373a4eb-2f1b-b56f-48a8-ae97b4e4476a@arm.com>
MIME-Version: 1.0
In-Reply-To: <6373a4eb-2f1b-b56f-48a8-ae97b4e4476a@arm.com>
X-Cookie: So this is it.  We're going to die.
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jonas Karlman <jonas@kwiboo.se>
Content-Type: multipart/mixed; boundary="===============0647678899=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0647678899==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jaTU8Y2VLE5tlY1O"
Content-Disposition: inline


--jaTU8Y2VLE5tlY1O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 24, 2020 at 04:00:34PM +0100, Robin Murphy wrote:

> Be thankful... And count me in as one of those miserable users; here's one
> of mine being bad enough without even printing any specific messages about
> deferring ;)

> [robin@weasel-cheese ~]$ dmesg | grep dwmmc
> [    3.046297] dwmmc_rockchip ff0c0000.mmc: IDMAC supports 32-bit address mode.
> [    3.054312] dwmmc_rockchip ff0c0000.mmc: Using internal DMA controller.
> [    3.061774] dwmmc_rockchip ff0c0000.mmc: Version ID is 270a
> [    3.068101] dwmmc_rockchip ff0c0000.mmc: DW MMC controller at irq 30,32 bit host data width,256 deep fifo

Looking at that driver it's going to have lots of problems whatever
happens - it's printing out a huge amount of stuff before it's finished
acquiring resources.

--jaTU8Y2VLE5tlY1O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7zcQcACgkQJNaLcl1U
h9Cxggf/XCM1wfeUvaPwZWSZFgtAlPut0w2X9xlNsnHazAVjkdM2s7WvZKGWOene
pK9xzo21jPp/35tOSgtNySQGd489Jpb8haEPfW7znU+TsVdJVGI3tO2KpXRN1ueM
5uWopW7g/6uV6ArccbT+z49GyqeAMbAWXsarVUx21IAJlmcmKpbqFrxifmu+DHVN
FXKi6h9nEEa9OtF3lMTtv/dttM0QFXjGQeVMXmO26oJ2r6wykKLxkChaeJ5ItE6y
fRDFM+QKKrfYpZJDOyYo2hV3wbFnh7Ee0u1r+pzLGiD0/oNHDHgOpc1wmuu36Niz
mIr4ohC8aXHMeOohqmFMcjdwjVubPQ==
=egLK
-----END PGP SIGNATURE-----

--jaTU8Y2VLE5tlY1O--

--===============0647678899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0647678899==--
