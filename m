Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4AA62DEE3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 15:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACE410E61B;
	Thu, 17 Nov 2022 14:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3B110E61C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 14:59:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3967DB8206C;
 Thu, 17 Nov 2022 14:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD1FC433C1;
 Thu, 17 Nov 2022 14:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668697171;
 bh=O+U992v26U9/jVBVgthCJ9el4v7NKpgKZhUu+7FqnGE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cEAkBgVTSjigXjhLE8Z3WCze+jK69DkTc+6W6TlQnjaTee11N1klVaeutLzNQw2BG
 9vAsQv2qawUh6q/34t050wVxU0MBZmzhginKGpmDeC6e/LqZ3iQXuZDvob/kEFYdM2
 Tg4GoTGlYoOj9/A6BoYVPvcgKBNB8WlTOTZI6lj7qcAoUCbHNFg6IT9/6p2OGfypN7
 0nEBjRZiTUonuIal7bJdOpsemQ5O3dC9LMFhhHE3Ue1kJL3LmBARVcVblZAjoH/WDT
 DWy3beAQBDNo8QkNFqWB9X+vAtEYrEx3YaQ50x/3jSB+1ouDq/YiJcC+0mKX+gFVO7
 C/KTEZKS3cBIQ==
Date: Thu, 17 Nov 2022 14:59:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Carlo Caione <carlo@caione.org>
Subject: Re: [PATCH 2/3] drm/tiny: ili9486: Do not assume 8-bit only SPI
 controllers
Message-ID: <Y3ZMT4F3+3bjNXKo@sirena.org.uk>
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
 <20221116-s905x_spi_ili9486-v1-2-630401cb62d5@baylibre.com>
 <Y3YWdeTLfmDh7UyB@sirena.org.uk>
 <cd2d4d1e-f42a-da5b-e498-fbb32f792094@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9UsFcg/cAJcYd/H+"
Content-Disposition: inline
In-Reply-To: <cd2d4d1e-f42a-da5b-e498-fbb32f792094@baylibre.com>
X-Cookie: Ego sum ens omnipotens.
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--9UsFcg/cAJcYd/H+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 17, 2022 at 02:40:05PM +0100, Carlo Caione wrote:
> On 17/11/2022 12:09, Mark Brown wrote:

> > I don't understand what the commit log is saying here.  The meson-spicc
> > driver advertises support for 8 bit words, if the driver is sending data
> > formatted as a byte stream everything should be fine.
> > It may be that there is some optimisation available from taking
> > advantage of the hardware's ability to handle larger word sizes but
> > there should be no data corruption issue.

> There is no data corruption but the 16-bit pixel data have per-pixel
> bytes swapped: for example 0x55AD is sent instead of 0xAD55 and this is
> causing the wrong color to be displayed on the panel.

If the data is being unexpectedly byte swapped then clearly it is
being corrupted.  How is this byte swapping happening?  SPI
devices should default to doing 8 bit transfers, if things
randomly get put into anything other than 8 bit mode without the
client device explicitly asking for it then that seems really
bad.

> The problem is that the current code is sending data with an hardcoded
> bpw == 8 whether the data is swapped or not before the sending.

> For 8-bit only controllers the data is swapped by the MIPI DBI code but
> this is not true for controllers supporting 16-bit as well, but in both
> cases we are sending the data out the same way with an 8 bpw.

> So the same image is basically displayed differently whether the SPI
> controller supports 16 bpw or not. I'm trying to fix this by sending
> data with 16-bit bpw when the controller is supporting that.

So this is an issue in the MIPI DBI code where the interpretation
of the buffer passed in depends on both the a caller parameter
and the capabilities of the underlying SPI controller, meaning
that a driver can suddenly become buggy when used with a new
controller?  I can't really tell what the bits per word being
passed in along with the buffer is supposed to mean, I'd have
expected it to correspond to the format of the buffer but it
seems like perhaps the buffer is always formatted for 16 bits and
the callers are needing to pass in the capabilities of the
controller which is then also checked by the underlying code?
This all seems extremely confusing, I'm not surprised there's
bugs.

At the very least your changelog needs to express clearly what is
going on, the description doesn't appear to correspond to what
you're changing.

> Please note that this is what it is done also by mipi_dbi_typec3_command().

The core code does appear to have some checks for controller
capabilities...

--9UsFcg/cAJcYd/H+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN2TEsACgkQJNaLcl1U
h9DpKgf9FzxQ7ChMJiClsOLDz6yyHyS/FPaa1Kptfbl/K1nGsgEialuKtIsbFLTk
Jns3jfo9+KpsN60wB9hYy0rstq8QUhoFd8M7HXHH0p8zC++zRgV64I0NUl1c7EKQ
v4nMTmWTAwqeJ7g7rModR/lsJl7VeGJ4fxdY6b5TLBwVfasa/geoEAU8L7tlZYrb
ECgj8WLnAmRkBTdXDuONdftUIbhBHJndjKJF9pmB4q9yXQ1/RlQk+DWQ7ERH9HHN
oQEhftvv9z3hgY8dzfSCgFPWpx8MSQLgn3JigCHypmbMGwd6v5TJaR+MrbCCinWs
55DZt6sIYRCfTC4nMyDGg0ogAZ2Hbg==
=qeiD
-----END PGP SIGNATURE-----

--9UsFcg/cAJcYd/H+--
