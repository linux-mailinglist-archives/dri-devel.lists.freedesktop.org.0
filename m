Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEF623BC04
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 16:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D06289F85;
	Tue,  4 Aug 2020 14:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9208A89F85
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 14:25:52 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB7C621744;
 Tue,  4 Aug 2020 14:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596551152;
 bh=sFX6756S4rZQRsnwG9E4aWfFukpwfYFYFByyg1RGRJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HhkO87aWftJemskSBWiZGzaZV9xhtsQSrwVB/8NjzW8kBMdvugZjzmKE+udcy40Xr
 loYqQo/SLZCyngG5yTJWoEEhuzxRzGvbnd6WoOa1LdH6+Ebi2XVvYv2lvjYEPF+meh
 oMD3lmA6102qZJ7Kss+nN+ADCM4DCKaB0VRxwOV0=
Date: Tue, 4 Aug 2020 15:25:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC][PATCH] regulator: rpi-panel: Add regulator/backlight
 driver for RPi panel
Message-ID: <20200804142530.GB5249@sirena.org.uk>
References: <20200729214645.247185-1-marex@denx.de>
 <20200730155944.GA1477410@ravnborg.org>
 <87447ebd-2838-c6bb-1dd4-28104f09dbb9@denx.de>
 <20200730191300.GJ5055@sirena.org.uk>
 <5cfc1d07-c8ce-47d7-8763-1efa0316d05a@denx.de>
 <20200801011653.GD4510@sirena.org.uk>
 <20116f3c-64d7-0f52-b38a-56c62398a5e9@denx.de>
 <20200803194831.GF4502@sirena.org.uk>
 <9512f1f4-d3a0-8306-4765-1efde5259ba9@denx.de>
MIME-Version: 1.0
In-Reply-To: <9512f1f4-d3a0-8306-4765-1efde5259ba9@denx.de>
X-Cookie: Every solution breeds new problems.
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
Content-Type: multipart/mixed; boundary="===============0015501102=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0015501102==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 04, 2020 at 12:29:49AM +0200, Marek Vasut wrote:
> On 8/3/20 9:48 PM, Mark Brown wrote:

> > OK, basically I've got no real objection from a regulator point of view
> > - it's not ideal but not the end of the world.

> Then, how shall we proceed ?

Submitting the patch properly with the binding document seems like a
good start.

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8pb9kACgkQJNaLcl1U
h9Bl0gf+PnfOyKas58bUudyDE7XKwZK6ENF5rM6LiCcd/cEe2yMgitsSdF2rJTQv
0tChznFQvs4S1/zVCU2Xnf1ACr4MRU0rtHWDust78se97XZ9zJznpCZZ0xBt2iwP
7C6so0RjZ86la7h7Rs3wgEQFpAYrNaZNx1ak3LrxYu2DGyUlj+bwkAQ98gwRUQNs
zPtIryarNMZGVXs23n/2JtTjM9Ksxq5n5OlvWQgdEZA4FRK66Jnvngn63G1uPivz
yWEc1JgpEovKCzsAHNR2zmXEONsmhoJhS2a3GDTcHb8DM6IkyVMroZu3xy1iAIfj
LXKfd1kO4rUkSvr8S9DolKvollkNJg==
=JQoT
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--

--===============0015501102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0015501102==--
