Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE94E1E3FB2
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 13:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C826E2E0;
	Wed, 27 May 2020 11:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF856E2E0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 11:18:34 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9302A207CB;
 Wed, 27 May 2020 11:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590578314;
 bh=Eb5W1Mu4UnXinW4nhuzmv6KKdI/oP0r3mQb3N4LC+sU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XtBpaS+v/lpJ9RrOyaPoiNOws0yskW0gCFJwnq5/cqlLekMU3baEbiWM2aeapJ8di
 CklyM05gEwvP4Kf2SWN9Va00wb2otRuEMe7bisF3ZeRBm8TTQ0bikOri9+9fyDnkXP
 E7vBo27aAiaM9AkQWfLi96qnlVRBQMOK2vWz9Xfs=
Date: Wed, 27 May 2020 12:18:31 +0100
From: Mark Brown <broonie@kernel.org>
To: dillon min <dillon.minfei@gmail.com>
Subject: Re: [PATCH v6 8/9] spi: stm32: Add 'SPI_SIMPLEX_RX', 'SPI_3WIRE_RX'
 support for stm32f4
Message-ID: <20200527111831.GC5308@sirena.org.uk>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-9-git-send-email-dillon.minfei@gmail.com>
 <20200527095109.GA5308@sirena.org.uk>
 <CAL9mu0JA=XRTj_HONQGtj74X05TAV0__dW2At0AAeymwNvJhEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL9mu0JA=XRTj_HONQGtj74X05TAV0__dW2At0AAeymwNvJhEw@mail.gmail.com>
X-Cookie: Drop in any mailbox.
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Hua Dillon <dillonhua@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: multipart/mixed; boundary="===============2142495717=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2142495717==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Content-Disposition: inline


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2020 at 06:45:53PM +0800, dillon min wrote:

> sorry, forget to remove these two patch from this submits, will not
> include it in later submits
> which ack other's review result.

Ah, OK - no problem.

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7OTIcACgkQJNaLcl1U
h9CjnAf9EH3yOA2f087uyr/KGCDeTZDdKdksfcJ4a9wlCQWW1Cur92auEEnoA3Rt
OaZkMT9iqrDJqCSZ80c9Be1Ql4zXnjxCHU+qExkLFmDJcR448ywgqaYh9gluj6D3
xQnn0fxJcjgY+eixxAPqszazPIQm3iHZL0TsQo5DNBU7uDO/p+HytpUoYEntT7AT
bjn2mYE+1drgcxELR/TkQdRnV0jUiAtcpkGnI2tPO70MBQ6jcAwIAX4cBSnjwdhO
L9bXUB58NNMcuUWSj9+c8WyJn0zssre7UWLaYiX9g92/yJEPJNzGN2SFXiM1Jsks
PQH9axxSmBjKf8StOS7727u+sJ8H8Q==
=Ibfd
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--

--===============2142495717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2142495717==--
