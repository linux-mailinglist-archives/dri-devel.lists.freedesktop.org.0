Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80569234F37
	for <lists+dri-devel@lfdr.de>; Sat,  1 Aug 2020 03:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180E46EB51;
	Sat,  1 Aug 2020 01:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B98F6EB51
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Aug 2020 01:17:15 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C58520836;
 Sat,  1 Aug 2020 01:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596244634;
 bh=zopSIyD7SyaoxDqsyd46IeZnOYxBnkYrExnu/kOlsNA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GqQGPKxZeVjWvSru2Eqkich0iBK3tjY2w+aQrmHVb7kM5aejYP8Ndrl1JiFLHUw3k
 erHggVtDiGoWSo9h08n8sRdZyglVTCLAloQI3pg1qr+GvW3RDZDIocdLNH38P6PhCX
 I7uYLRLKZQZVSSfTh56+wmALGvXBR74BT6oUi8mE=
Date: Sat, 1 Aug 2020 02:16:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC][PATCH] regulator: rpi-panel: Add regulator/backlight
 driver for RPi panel
Message-ID: <20200801011653.GD4510@sirena.org.uk>
References: <20200729214645.247185-1-marex@denx.de>
 <20200730155944.GA1477410@ravnborg.org>
 <87447ebd-2838-c6bb-1dd4-28104f09dbb9@denx.de>
 <20200730191300.GJ5055@sirena.org.uk>
 <5cfc1d07-c8ce-47d7-8763-1efa0316d05a@denx.de>
MIME-Version: 1.0
In-Reply-To: <5cfc1d07-c8ce-47d7-8763-1efa0316d05a@denx.de>
X-Cookie: Some optional equipment shown.
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1860407655=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1860407655==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Content-Disposition: inline


--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2020 at 09:37:48PM +0200, Marek Vasut wrote:
> On 7/30/20 9:13 PM, Mark Brown wrote:
> > On Thu, Jul 30, 2020 at 06:28:07PM +0200, Marek Vasut wrote:

> >> about it ? I can over-complicate this and split it into multiple
> >> drivers, but I don't think it's worth the complexity, considering that
> >> this is likely a one-off device which will never be re-used elsewhere,
> >> except on this one particular display module for RPi.

> > Now you've written that you've pretty much guaranteed someone's going to
> > use the same component elsewhere :)

> How? The firmware is closed and not available, neither is documentation
> for it, sadly.

Companies often find other markets for their one off things, the
original RPi is a great example of this!

> > I don't 100% follow how this would actually get used in a
> > system (perhaps the binding would help) but for these things if there's
> > only one tightly coupled user that's possible it's sometimes simpler to
> > just skip APIs and do things directly.

> That's what I'm trying to replace by this patch and tc358762 bridge
> driver and panel driver, the combined version is already in tree:
> drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> but the tc358762 is clearly a generic bridge and the panel is generic
> too, so combining it into one panel driver doesn't seem right.

I see, so this is the remaining bits.  Perhaps the binding might help me
see how things fit together - I don't know anything about the system
really.  It's not doing anything that looks like it should cause the
framework too many problems so I'm not overly worried from that point of
view but equally well it's obviously not ideal.

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8kwoUACgkQJNaLcl1U
h9CwQQf/Yw7M4rcmxY74Cl/Kh1Vy5OnyqU5TpyeMAlFrfVDzNebXgBxCiYH3DiDa
AGsN7hizC693d108cEYWWEDxiwKY+sIy7nNZg6q9TjrHq+9dR/4zRf0kfgjdTUFO
eySF0PNMpCTaUUMckRPvkqKd/zdolX14d43epzFvHHmAqecm0mayiBV3Rslu22tL
5rfTyMAltWoIWDCpKI/p/hTuvHO1FksHSwwIUzVSm7+bMUBjzj/Zuf2Twcm47a5r
7G03Jsy45AUceMqMWXuwjgOHR7dbZl2lxzrIC0KybRCrYDl9ImhyvXEJu//SsgoV
m8SkZmVAdEjelKmVaRHw3wRd725mPw==
=1WO5
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--

--===============1860407655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1860407655==--
