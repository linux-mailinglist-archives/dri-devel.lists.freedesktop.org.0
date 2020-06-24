Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24202207471
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 15:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0C26EB4B;
	Wed, 24 Jun 2020 13:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8521A6EB49
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 13:27:16 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7BE620738;
 Wed, 24 Jun 2020 13:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593005236;
 bh=Uvzn5GGmX3qulKFklqhuFpDaBfwgpNZzFNj7oeuicfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DfCE+6p7BklpNaLNzQGhFErdJ9GEeuS7AoSebSPlnZJF5jsAgVtdGk7vUEwnjQGgM
 Fn2nQQELoj20anBdPArhIYnmlCcO2McCZEr2SrlB22cC8+EVhVWDkjq3ApDnPNuzAW
 6nsZgily1LPUOeIOBI2Li9olPjFfkoKLlrTYAVm0=
Date: Wed, 24 Jun 2020 14:27:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RESEND PATCH v5 1/5] driver core: add probe_err log helper
Message-ID: <20200624132714.GD5472@sirena.org.uk>
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114135eucas1p26e2e4683d60cebdce7acd55177013992@eucas1p2.samsung.com>
 <20200624114127.3016-2-a.hajda@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20200624114127.3016-2-a.hajda@samsung.com>
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
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 andy.shevchenko@gmail.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: multipart/mixed; boundary="===============1181669495=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1181669495==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EY/WZ/HvNxOox07X"
Content-Disposition: inline


--EY/WZ/HvNxOox07X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 24, 2020 at 01:41:23PM +0200, Andrzej Hajda wrote:
> During probe every time driver gets resource it should usually check for error
> printk some message if it is not -EPROBE_DEFER and return the error. This

As I said down the thread that's not a great pattern since it means that
probe deferral errors never get displayed and users have a hard time
figuring out why their driver isn't instantiating.

--EY/WZ/HvNxOox07X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7zVLEACgkQJNaLcl1U
h9ATPwgAhY22sy/BHlt091VyG8FAdVlhbYN6mk0lzhvHH7Vi9lhuFnpv4CoWIPp9
H3U6sE0bCKLDG8crEhrVfxSMYy8XdDafn37Ua0NYY/gKj3xKfLvZ6SgYAxKN9ljb
Fsr2TgqJzAlbV3h5wI9HX8GOzK3YU6qD0lv8QzWu4UU0zkgXD1ty2jIwAa/zv4F0
BvCMvOshZd7pXBg0unqxP0vm3dbOUbC3dup88YjidkmYYYQl8IHbPlrwtDlhVrk3
Eq3t9t69041O+cB6Rg6QIvKAumr/d5BmCqbajAXowB67NKvxxqzOhCIntTqKEiVw
U7DHVCCkPY49rXIH1tKz1ahQhgdu5w==
=XUqJ
-----END PGP SIGNATURE-----

--EY/WZ/HvNxOox07X--

--===============1181669495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1181669495==--
