Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3465A0010
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EBABB161;
	Wed, 24 Aug 2022 17:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2AF98A57
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 16:33:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8EAC8611F3;
 Mon, 15 Aug 2022 16:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E692C433D6;
 Mon, 15 Aug 2022 16:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660581199;
 bh=kBOMgsseA60cqKb8ZaWTeKRcdiuM8BBVMgx3WGOT2Vw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rmTxXiWdCfaKxjfeSH/wn3LpbaEYrRaZCw1f92jgSGWCcG2dAITp6jUamOj/9Et5l
 NLxQdQJ6bRwiBMzF3WOgxKy/ruO+5WFA5KyvFSSpRu6Jp4vPceQTBAGYsxJnkRaDiF
 VQs4HiAFoB6wMNroGRnPP1YIk98jhwB97kSZHSmw+l5iAPSEtqIYeHeV+2kguNbDCh
 OMOaadd3jKZLNLo5Ra4binpuaeeuHjzws48ygCy26/f3fh0/Z6Z2lPNoKbe/MHMGoD
 GRXNAh75/ymq45hZtYg5HjEKzu7bs/86N8gD/EMtnzrZtzuqtoEpW8lvyZOhjfQys0
 rKBQntmgxyAVw==
Date: Mon, 15 Aug 2022 17:33:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Message-ID: <Yvp1Qkuh7xfeb/B2@sirena.org.uk>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EyxHVb4W1IFNOeWj"
Content-Disposition: inline
In-Reply-To: <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
X-Cookie: We have ears, earther...FOUR OF THEM!
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
Cc: Miaoqian Lin <linmq006@gmail.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Johan Hovold <johan+linaro@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Aswath Govindraju <a-govindraju@ti.com>, linux-amlogic@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--EyxHVb4W1IFNOeWj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 15, 2022 at 06:54:45PM +0300, Laurent Pinchart wrote:

> - With devres, you don't have full control over the order in which
>   resources will be released, which means that you can't control the
>   power off sequence, in particular if it needs to be sequenced with
>   GPIOs and clocks. That's not a concern for all drivers, but this API
>   will creep in in places where it shouldn't be used, driver authours
>   should really pay attention to power management and not live with the
>   false impression that everything will be handled automatically for
>   them. In the worst cases, an incorrect power off sequence could lead
>   to hardware damage.

I basically agree with these concerns which is why I was only happy with
this API when Matti suggested doing it in a way that meant that the
callers are unable to access the regulator at runtime, this means that
if anyone wants to do any kind of management of the power state outside
of probe and remove they are forced to convert to the full fat APIs.
The general ordering concern with devm is that the free happens too late
but for the most part this isn't such a concern with regulators, they
might have delayed power off anyway due to sharing - it's no worse than
memory allocation AFAICT.  Given all the other APIs using devm it's
probably going to end up fixing some bugs.

For sequencing I'm not convinced it's much worse than the bulk API is
anyway, and practically speaking I expect most devices that have
problems here will also need more control over power anyway - it's
certainly the common case that hardware has pretty basic requirements
and is fairly tolerant.

> - Powering regulators on at probe time and leaving them on is a very bad
>   practice from a power management point of view, and should really be
>   discouraged. Adding convenience helpers to make this easy is the wrong
>   message, we should instead push driver authors to implement proper
>   runtime PM.

The stick simply isn't working here as far as I can see.

--EyxHVb4W1IFNOeWj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL6dUIACgkQJNaLcl1U
h9BS1Qf/aJ5FfSf2ZpgAnj2K1EYyJTQAf5hxweM6P8/UPf0PG25qZnrQ04w2KT+U
J0dyFRSYl6wQbpFV7qxu5fLJC4OGjrDvyUmF+FgpX4qXSZYWhspqlsH73vA5olJB
JssncwLyZQcX9kCua0RpN2NZ0+L7PAywvZ87c+2Ss00YkuS4GSE3CmeK3AhmHYfP
4sjjQuZeLgAF3KmoG8ImBJh+a9aRORWWmvVboZ4reeEkMfnIC37kD92wTH6+ubec
Rink1Toz39UYEOFWWLMmC9VkRDTunn4JGF6ei4tDrxADrV2aCJ+05N5wV7N0Eg/D
37fKiGeyHN4cc64BVj5NW6aFp6UfgQ==
=aGMq
-----END PGP SIGNATURE-----

--EyxHVb4W1IFNOeWj--
