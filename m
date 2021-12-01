Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6645C4650FC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 16:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FE46E995;
	Wed,  1 Dec 2021 15:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5FB6E995
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 15:10:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 05281B81FE1;
 Wed,  1 Dec 2021 15:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445F5C53FAD;
 Wed,  1 Dec 2021 15:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638371427;
 bh=FCqeRLXF2VMVm3yt6gJHFdWgv9xL0KxQlSQpzBtnUxI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qdEk9dF+fvXqeKr+VVHH5Au1zNimX1ep8FxHJ1E1JMAXY2xRds2J25uXy0ENwvMpp
 0RAF6YJqUNx62zt/pqgvGssVjewJdtSaganLOg/zrjch7AGAWZovWZMcOCSVF4/g6P
 +YF6PKux0eA0DYuWRFeKi6dAb350HthWM8LOMeu5aUV28FMdn7UVcyg2nS7JE6HGZu
 uWgmjgUzJjQafFy9xG9u2euT8VCMnq3f72xtcowDFosOnJGvAozVAhtYS+/+TFBUSb
 Vn4wcmKCM+kySmw2KS8miSxmadTNv4V+/+5hX9aPcjXfevjbmT+qvYd4T/AlGFELNg
 cU4hrX00KPkWA==
Date: Wed, 1 Dec 2021 15:10:19 +0000
From: Mark Brown <broonie@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v10 4/8] drm/ingenic: Add dw-hdmi driver for jz4780
Message-ID: <YaeQW/akoLE6SpEi@sirena.org.uk>
Mail-Followup-To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@collabora.com>
References: <cover.1638307601.git.hns@goldelico.com>
 <4daf0c5dbed2c47c97003ab8de0a7dbd2a335dc3.1638307601.git.hns@goldelico.com>
 <LKTF3R.YREPOCHOSMQN2@crapouillou.net>
 <Yad69aTXcGixXvy3@sirena.org.uk>
 <46070A95-0FA9-43F9-A9A9-52A7B58B88F5@goldelico.com>
 <EDWF3R.CMVWMJL42OH9@crapouillou.net>
 <58C550A4-A21E-47BA-8BAE-00B927DC7A2E@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uxl0m5XHgmPX4QRQ"
Content-Disposition: inline
In-Reply-To: <58C550A4-A21E-47BA-8BAE-00B927DC7A2E@goldelico.com>
X-Cookie: All true wisdom is found on T-shirts.
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uxl0m5XHgmPX4QRQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 01, 2021 at 03:33:24PM +0100, H. Nikolaus Schaller wrote:
> > Am 01.12.2021 um 15:03 schrieb Paul Cercueil <paul@crapouillou.net>:

> > Please make it mandatory in DTS then, and use devm_regulator_get() in the driver.

> Well, I just wonder why the elegant devm_regulator_get_optional() exists at all
> and seems to be used in ca. 80 places.

Frankly because half of them are broken usages like this since people
seem determined to have the most fragile error handling they can :/
There are valid use cases for it, with things like SD cards where some
supplies are genuinely optional and simply constrain what features are
available if they're omitted from the design.  You also see some devices
with the ability to replace internal regulators with external ones.

> And if it is not allowed, why some DTS should be forced to add not physically existing dummy-regulators.

Again, if the supply can be physically absent that is a sensible use
case but that means completely absent, not just not software
controllable.  We can represent fixed voltage regulators just fine.

> AFAIR drivers should implement functionality defined by DTS but not the other way round: enforce DTS style.
> BTW: there is no +5 mains dummy regulator defined in ci20.dts.

It wouldn't be the first time a DTS were incomplete, and I'm sure it
won't be the last.

> What I fear is that if we always have to define the mains +5V (which is for example not
> defined in ci20.dts), which rules stops us from asking to add a dummy-regulator from 110/230V to +5V as well.

It is good practice to specify the full tree of supplies all the way to
the main supply rail of the board, this ensures that if we need the
information for something we've got it (even if that thing is just that
we've got to the root of the tree).  There's potential applications in
battery supplied devices for managing very low power situations.

--uxl0m5XHgmPX4QRQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGnkFoACgkQJNaLcl1U
h9A32gf/ZYHl/RIiCZDvdUvGhhXUQ5m3dke8DEbkuGwIbHOYqQDdVOpbI+NpTIMu
vmWcV7LpARb1R1Mst3T9J8O7p5STJUJulPLzFGsARuhjMeLE2z9+oyaocNmgXEfQ
54NPwbUWho0pcNd+GCtvoPzRiAMMkCxBrH2exwosdTPDYpF0gIOdpuSZ3YJXRsWU
eeni01wlGuXgswuy3SiXBc2nkmb0cNAPZlfxtdDvBoiDuR2zkIkSumfBuEeDvSvq
1rg+fYGi6vrNgTsbEnrfLaDB1GS5xzqdQryJizNS48arBhTalMrKXP0CVmfEYOc8
Edqu+7QgOTmmsAHtTGtymBAt2WnBUg==
=ZCY4
-----END PGP SIGNATURE-----

--uxl0m5XHgmPX4QRQ--
