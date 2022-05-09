Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FB352011C
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 17:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B3610E569;
	Mon,  9 May 2022 15:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40A310E515
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 15:26:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A7887B815D2;
 Mon,  9 May 2022 15:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE89C385AF;
 Mon,  9 May 2022 15:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652109997;
 bh=HqOWIQattd4LHd81cOLCEKvK/1NcPCin61RkVefxtKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rgHj0MaXcvvwlvom69OKE0ZPd1kcEdnRaLvcFJn3F326k+URfIWUQHJrslYVe6sjf
 VRzZyR2rcP+NdcC+rmLekZHLtARsdhRYTA9bWxQRRI4xT8gGFc8HsUeYZQOWS1IJ1E
 kmg0B9Km8yTzr5Sfz1GJDHNGTVWHMX3euPHinAl95NbGc2P3bS4ce1SQjQs0Tdwq6W
 1KFqjyKat0eAlqBI4SGvxky/+FfUHZ/TVMEavXvpQTDDo752GL07cWmIIRXDrgYHEg
 16OXkXGjVzVN1kBZeSHTmi1g5WURIhdyrkgRiRNdkbb9z/uCPXbAXGStuMIWEbhRP9
 T9Hs+EiKeYTlQ==
Date: Mon, 9 May 2022 16:26:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: (subset) [PATCH 1/2] [RFC] regmap: Add bulk read/write callbacks
 into regmap_config
Message-ID: <YnkyqDBFo8Eo6IiF@sirena.org.uk>
References: <20220430025145.640305-1-marex@denx.de>
 <165176353878.543269.16463883419414078766.b4-ty@kernel.org>
 <877d6zkjw5.fsf@intel.com> <YnUXvXmDgLccTRNP@sirena.org.uk>
 <YnkdA9gp08mvxYLb@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nge4gsrsh/wHT+4o"
Content-Disposition: inline
In-Reply-To: <YnkdA9gp08mvxYLb@phenom.ffwll.local>
X-Cookie: Boycott meat -- suck your thumb.
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
Cc: marex@denx.de, jagan@amarulasolutions.com, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, sam@ravnborg.org,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nge4gsrsh/wHT+4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 09, 2022 at 03:54:11PM +0200, Daniel Vetter wrote:
> On Fri, May 06, 2022 at 01:42:37PM +0100, Mark Brown wrote:

> > Not outside of the source.  I did a presentation at ELC-E ages
> > ago which you can probably find but I'm not sure how much it
> > would add.

> I watched that one!

I'm so sorry.

> Anyway no recording, but I think I've found the pdf. Was in 2012
> apparently.

> https://elinux.org/images/a/a3/Regmap-_The_Power_of_Subsystems_and_Abstractions.pdf

That's the one I was thinking of, yes!

--nge4gsrsh/wHT+4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ5MqcACgkQJNaLcl1U
h9A68Qf8DFDfyg+NEM/e8CiMK9Nc7l2O+4rqGgrOjudQQ4IWqZe3VA5nwANWUBk7
gKYr29LcAfT+rDgV8HNcJ2IrD5vfkwjaRcK5x+wGL8OA0QRFQwMWhdfJTfvmkoaY
zKQGxd0elMP5McvpiZHLPEWXq0nSSaN/ZJTJ1WLlYrLLR+mErFjsRmmTtNc6/kcl
v6Io724xUt0gSuBMzALTgyZXtl372bGUobGTJO++qxHjGhwnZPbrNvaqLOxn2VCL
a9hRLLdEeEt/yKfXbgZdRx7ox1SG1ZOa9B32vIvB27e0Rpc0uv6zVua4RsoiTOKh
18TSILCJ/WDrerq4aAXOLaQv78YAvw==
=tUQ5
-----END PGP SIGNATURE-----

--nge4gsrsh/wHT+4o--
