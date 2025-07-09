Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6021CAFE635
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 12:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC0310E0D9;
	Wed,  9 Jul 2025 10:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p/RbCtwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45B810E0D9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 10:46:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BADD45C5E4E;
 Wed,  9 Jul 2025 10:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138F7C4CEF4;
 Wed,  9 Jul 2025 10:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752057975;
 bh=toOWmA98bVu2FI5BfREr41cRJRfznyEzuTbtF2pq5vU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p/RbCtwBEwgrt+D/0Kzo5Wp3epPu7LvoHPe59rrtU2snFbfwYSud6fLp4oKW2kphE
 jBFPcZZk1tmRbF9gXLp0JXcX9HfcAch5q2aMh441vLX8O8+XZQ7lhFfX2kz20JLbbn
 r75bP/kEsBiU5QavKp9gochHOUqd6mRG42yY3EYs2lehuuB7G1ghejqrga/ah/Hfds
 mDcQ9zhJ9Usp3HpOTBV7vQxTLwH1veANqo5RKJj17irzn3g2+yaN1jZLJWUUhOULs1
 PcQl/4z3xzp3IHdRFoM3htbF38gfV8o+7bsphf799RO7ECrevKMm0woI6MCCaUjzN3
 KW+gwwPp0QFjQ==
Date: Wed, 9 Jul 2025 11:45:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Linux Regressions <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Abdun Nihaal <abdun.nihaal@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Anders Roxell <anders.roxell@linaro.org>,
 Ben Copeland <benjamin.copeland@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: next-20250702 kernel NULL pointer dereference
 adv7511_cec_register_volatile
Message-ID: <aG5IZBTJSabxpyct@finisterre.sirena.org.uk>
References: <CA+G9fYtvLHtjKbw-zpqGmtmBMgyJ0B8aiVwd8R=vRnj9YOZ3Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LI3MD61bKK9M3qHg"
Content-Disposition: inline
In-Reply-To: <CA+G9fYtvLHtjKbw-zpqGmtmBMgyJ0B8aiVwd8R=vRnj9YOZ3Xw@mail.gmail.com>
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


--LI3MD61bKK9M3qHg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 09, 2025 at 01:26:02AM +0530, Naresh Kamboju wrote:

> I am investigating this issue,
> Planning to revert and re-build and test in a loop.
>   c871c199accb3 regmap: fix potential memory leak of regmap_bus

> [   11.087822] Call trace:
> [   11.094930] adv7511_cec_register_volatile+0xc/0x30 adv7511 (P)
> [   11.097194] regcache_read (drivers/base/regmap/regcache.c:273)
> [   11.103438] _regmap_read (drivers/base/regmap/regmap.c:2805)
> [   11.107084] regmap_read (drivers/base/regmap/regmap.c:2850)

This backtrace seems fishy, the function that's faulting is just doing a
straight lookup of the register number without reference to the supplied
device.  This looks like a preexisting bug in the driver, we create an
I2C bus for the CEC in adv7511_init_cec_regmap() using a non-devm
function but register the interrupt handler using devm_request_threaded_irq()
and devm will free things after the remove function has run.  This means
that on removal or error cleanup we free the I2C bus while the interrupt
is still registered but nothing stops the interrupt handler from
continuing to try to access the freed CEC bus.  This is going to access
freed memory, I'm kind of surprised it wasn't already having trouble -
turning on some of the memory debugging options or sanitisers should
show issues.

Don't use devm_request_threaded_irq() folks...

--LI3MD61bKK9M3qHg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhuSGAACgkQJNaLcl1U
h9CZOAf/c99HaLL754qnRVUODTIV7glQ5Q1Sek0UI1/MTsNPm6n7XKskuUiiN7+2
LZnY5V5o8K+cT9SVnq4yWNjRqokYzLelg3y5HwmdjbbIMY3ixk96NZ/KdxnnWtCi
w/Ao85DqtB899+Hl5Lhpgvyp/FEcjT/xPXS2F9lL1Mxs47SaCRwGxA6/e1k4Ol4K
bgG44Nl2UuilfCvM05/Vn4PEHkdJMEdlL8ss3DKNo1wwqCqaiOnxHsMvp767Ryot
D08nmTPMcIvrke96xqshqsqIVJfeaX2XINzFQahMwQWAABC5xyujMI6ic2INpFXY
t0tp8kTIQkEvCi5qgTnK0OPiCb+WuA==
=mbqq
-----END PGP SIGNATURE-----

--LI3MD61bKK9M3qHg--
