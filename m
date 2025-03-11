Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D89A5D1A4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 22:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58DD10E282;
	Tue, 11 Mar 2025 21:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lNEGake5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C184010E282
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 21:15:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A62E95C11B1;
 Tue, 11 Mar 2025 21:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373E7C4CEE9;
 Tue, 11 Mar 2025 21:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741727752;
 bh=xjQgGwXvLDBc6wOl7YbU39yWFahSwmm6ndteUlBc5XA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lNEGake5cXKvDxoQt58Up95lRwHNDm6HXeKyolv9F+TzSB+diFhdgBsSbmQFhNke+
 Usj4htxgn2r0w9+b12VH8efkevZmZtqRbrdyUPX9EoY3w4R+qm1dv3tWOA8VFL3R8K
 1AJSSnsh/D7e0VbeumqoVyFuWr74ae/PkQU/YETFfCijnx/U9M2FyK2uaXIKfSGmsx
 /iltx9Dk2kLavw+3M7pKv2gMuJ7UXhLen9Z32ZFGuLsTBxoJ3DEFB4Q/AcCA2FNh7B
 Izce93wkuItQf0qOWitWN7up+RBZDT2qptzbYH4hiIgs8QC2/MqJWq7UJDQMskl5VJ
 UujMfVpEpPJYg==
Date: Tue, 11 Mar 2025 21:15:45 +0000
From: Mark Brown <broonie@kernel.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: arnd@arndb.de, lee@kernel.org, dmitry.torokhov@gmail.com,
 sre@kernel.org, lgirdwood@gmail.com, alexandre.belloni@bootlin.com,
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linus.walleij@linaro.org, brgl@bgdev.pl, tsbogend@alpha.franken.de,
 linux-mips@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/9] Remove pcf50633
Message-ID: <ad81e242-36d0-4f0b-a5ee-c073d7d92f7f@sirena.org.uk>
References: <20250309193612.251929-1-linux@treblig.org>
 <174172393659.371198.1480937233663952854.b4-ty@kernel.org>
 <Z9CltdJsg_qaTKzQ@gallifrey>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+OmabGPn0b5DXlH7"
Content-Disposition: inline
In-Reply-To: <Z9CltdJsg_qaTKzQ@gallifrey>
X-Cookie: Androphobia:
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


--+OmabGPn0b5DXlH7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 11, 2025 at 09:05:57PM +0000, Dr. David Alan Gilbert wrote:
> * Mark Brown (broonie@kernel.org) wrote:

> > [6/9] regulator: pcf50633-regulator: Remove
> >       commit: 248bc01138b11ff3af38c3b4a39cb8db7aae6eb6

> Thanks!
> Although....I'd only tested this as part of the series and assumed
> someone (Lee?) would pick the lot up in one go.

I test things as I apply them, it really shouldn't make a difference
either way for leaf drivers.  From my PoV this way it cuts down on
resends.

--+OmabGPn0b5DXlH7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfQqAAACgkQJNaLcl1U
h9AD1wf+I2aQLWbF5xfLjvKl72h8bg0RLiGAjZM1NfYz/hLS0dWlF3300oSwCY+G
rV9Wq8rDd7CWCKnPjzhF61Snu+atLhVVUQrUcYAwRVM/Srm7LNGFPiyMflHQe9mJ
Nko5SMqN9nRn5CNMLIORrD+uO4uT3KXuXYjrHtYrxmz+O57B+Dii5dEwZDxSbTD2
wnc1lt45lulI4GDYH0yheKpFvKIe44PN8BHZ+c54BA5WAqSf9moP15PdDK9CLIcc
bfpBXKvYHO7g2FpUGHN9TmXo0L/UmSaoRhvl0cT1sz2POYC52dqXOhSXvVG2/qdA
6v0mJL74pnETZ6ZNfFyQpsOIXzCaOw==
=jn9q
-----END PGP SIGNATURE-----

--+OmabGPn0b5DXlH7--
