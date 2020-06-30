Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 025C920F875
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 17:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242256E35D;
	Tue, 30 Jun 2020 15:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E026E35D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 15:35:08 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B8862074F;
 Tue, 30 Jun 2020 15:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593531307;
 bh=hbapiSFW66hXpzycU06z2LcbaJeuNN3dsr4X1PHfJVA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PM1OchYCo5d7s/0dHTzAp4CR34sFUpC/KwQRFA1wf5y3DgJ2TDfgOnlwhKQSjt68Y
 hGrO/f+IG48lqXSwCdDKdqlNMgvJstS2UzryEls8XBeYvuq0lwKeyFxIeHZy8y9h6y
 nIaWMRzoHl88lgYKQ8prc/16WQ2SfzW9DP0I5b3w=
Date: Tue, 30 Jun 2020 16:35:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v7 1/4] driver core: add device probe log helper
Message-ID: <20200630153505.GM5272@sirena.org.uk>
References: <20200629112242.18380-1-a.hajda@samsung.com>
 <CGME20200629112248eucas1p187e5dac2f4f6120aacbc86e48ad0fff9@eucas1p1.samsung.com>
 <20200629112242.18380-2-a.hajda@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20200629112242.18380-2-a.hajda@samsung.com>
X-Cookie: Walk softly and carry a megawatt laser.
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
Content-Type: multipart/mixed; boundary="===============1005778639=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1005778639==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MsEL38XAg4rx1uDx"
Content-Disposition: inline


--MsEL38XAg4rx1uDx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 29, 2020 at 01:22:39PM +0200, Andrzej Hajda wrote:
> During probe every time driver gets resource it should usually check for
> error printk some message if it is not -EPROBE_DEFER and return the error.
> This pattern is simple but requires adding few lines after any resource
> acquisition code, as a result it is often omitted or implemented only
> partially.

Reviewed-by: Mark Brown <broonie@kernel.org>

--MsEL38XAg4rx1uDx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl77W6gACgkQJNaLcl1U
h9BzwQf+JzNlmtiYmNXjlnt8XG+LzxdVCambFM2BriTiK4kqcAHo44/jTnkfgO/7
uc78IN9CohQgalmFe21k1ST2/FBz5Iy6HgnDbPiakilZHPLqNjS9NaEzo7w2tumc
Ntr1S9+KjvSYaosJdrhbr+OAKPWEVyt5yZ2wGVwoPNgKu3txHYCXFXNJtLsXcg0b
82yJY6BXSpzj26nm02UwZ/eDDtfQaoNDhcrAh9JmmZd/DytsbC2fBayDqrhmF2PS
4vRHYPFIArvxTGY/4RQjw9AWYy+Q7Ns+nYDbzxKBfIMremBWu8E9mr741PkPdKVV
LXVRLnx3tFUTwOl7loakReFTTCRx2w==
=yPu7
-----END PGP SIGNATURE-----

--MsEL38XAg4rx1uDx--

--===============1005778639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1005778639==--
