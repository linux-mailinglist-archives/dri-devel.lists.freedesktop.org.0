Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7044421B3A2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 13:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904CD6EBD0;
	Fri, 10 Jul 2020 11:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6053B6EBD0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 11:07:46 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB8C52076A;
 Fri, 10 Jul 2020 11:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594379266;
 bh=ZupbQMi/trtErw5kflVvFFpVwndB+ssCP+SNaqCL4rc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F9Un2HgrXYZEZVwYS3UFCu2ZkTlAib8sNzP2Pxn77/F28frjlzbmLYs7/dTfwIr/v
 cfH+b0ibGDtF1payrlIqOtEumturq22IAWlJOuZzsfL9myoOnDXVIAJaf4zywO0qLW
 CiK3RWcBIAEOMZu0+m34Mi3k0+TRfqHSyilli+Jg=
Date: Fri, 10 Jul 2020 12:07:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v6 2/4] driver core: add deferring probe reason to
 devices_deferred property
Message-ID: <20200710110740.GB5653@sirena.org.uk>
References: <CGME20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e@eucas1p2.samsung.com>
 <20200626100103.18879-3-a.hajda@samsung.com>
 <5f159e00-44fd-515b-dd8c-4db9845dc9e6@ti.com>
 <7e3c924b-c025-a829-6868-78e2935c70eb@samsung.com>
 <66faa188-5ef6-d449-07fe-28c8be5e559c@ti.com>
 <21f5ec9c-2d1d-5f28-5aeb-ac0db144a55e@samsung.com>
 <CAKdAkRRLBLCLGH2qhEjaVnt8wNjoyGAfQimNWHZUvzx2m6Mwng@mail.gmail.com>
 <e6057292-39de-831c-0b8d-b3f0b66937dc@samsung.com>
 <20200707041442.GE3273837@dtor-ws>
 <8b228571-d124-e5e2-2f53-57ea4b46b904@samsung.com>
MIME-Version: 1.0
In-Reply-To: <8b228571-d124-e5e2-2f53-57ea4b46b904@samsung.com>
X-Cookie: Use only in a well-ventilated area.
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
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Jonas Karlman <jonas@kwiboo.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: multipart/mixed; boundary="===============1067325206=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1067325206==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Content-Disposition: inline


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2020 at 09:42:49AM +0200, Andrzej Hajda wrote:

> But the provider does not know if *get is called in probe context or=20
> not, so it is not able to differentiate it.

> So the whole idea is for me suspicious/wrong. Kind of proof:

> 1. If you insist that provider's EPROBE_ERROR must be always propagated=
=20
> to driver core then.

> 2. You must enforce that resources can be gathered only from probe.

> 3. But this is against current practice, even if majority of drivers=20
> does it from probe, there are many which doesn't.

Those drivers are probably buggy anyway at this point given probe
deferral.

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8IS/sACgkQJNaLcl1U
h9CDlgf/czDS3TuzSg439iB93bfCxxvcHFqdaQ01xmcPSXS88+JplUZh9Mg0FzK0
5xFnzBmfpIUWbn9/4zRjimnp5qSwljIPBZvIJErny55gneAsZE2e3L78FBMTqz6a
s/l3e09KTuGG1tBfczy/03t6wxe+ks9t95cm6xJpj5qShpq26bVG3rNKB+/vd5us
+xYIqPuomBa8Q9zY8WDQ83p1d5T6x+RH03/fafT82DMwE2pLXz7DT8yWEUpUD7kg
iZA4zesvOMvSrDlTPVbMZjUu/BBlxpNBWpet41UW0dlklaUZCzmuegxOeFE86Zz5
D7yzP9yl92PPggknrdY7qZGrsTKtTg==
=B8/S
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--

--===============1067325206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1067325206==--
