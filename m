Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0793446537D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 18:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D510D89F89;
	Wed,  1 Dec 2021 17:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6738 seconds by postgrey-1.36 at gabe;
 Wed, 01 Dec 2021 17:02:51 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AA689F89
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 17:02:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B2698B82048;
 Wed,  1 Dec 2021 17:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84061C53FCC;
 Wed,  1 Dec 2021 17:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638378168;
 bh=CvHtrXfgBU4nCjU0B0+DUSu63UaEebLTtzXAzA4qmq4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RSi8vBwTLTb2mtXwaqcm1aN8fQhZZXHxwRfVIv3Ph+E+KA80w09id79HSoWdMxh52
 Le083FK28TbGxOEYGbMSHTxk2sjdp40ebUWMOBZZ4McGEDNBV0CCawssYOcsYaM0qG
 cTyMKkw9UX17F3DG7cc5qHLBbPXtGm4oa2q3ex6HUWHd7IP/yRFypKJQfxTKkhsl4M
 O5Nz/iDP0+6EUK2mnTmAOoIKBKACBTUooxsJX8TzlAVxgS4aBBCnd4a33nF+5H8fGS
 mTG5ucT7w1HynJIwfHZhg7pk9b2haywLl+H4vMJGZaJfHZ4Wnou80e1ZWGDkUEVAh4
 0fjdkTRY9HnNQ==
Date: Wed, 1 Dec 2021 17:02:38 +0000
From: Mark Brown <broonie@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v10 4/8] drm/ingenic: Add dw-hdmi driver for jz4780
Message-ID: <YaeqrhJg4664Tr/y@sirena.org.uk>
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
 <YaeQW/akoLE6SpEi@sirena.org.uk>
 <3174DA41-EB38-4C30-8752-0D9C894C74A7@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="06/7sdeAneQqaZKj"
Content-Disposition: inline
In-Reply-To: <3174DA41-EB38-4C30-8752-0D9C894C74A7@goldelico.com>
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


--06/7sdeAneQqaZKj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 01, 2021 at 05:53:03PM +0100, H. Nikolaus Schaller wrote:
> > Am 01.12.2021 um 16:10 schrieb Mark Brown <broonie@kernel.org>:

> > Again, if the supply can be physically absent that is a sensible use
> > case but that means completely absent, not just not software
> > controllable.  We can represent fixed voltage regulators just fine.

> The question may be how we can know for a more generic driver that there is always a regulator.
> In the present case we know the schematics but it is just one example.

The datasheet will generally explicitly call out if a supply can be
disconnected.  In general it is astonishingly rare for this to be the
case, supporting that case will tend to make designing the chip harder
(you have to cope with what happens where the power domains meet) and
results in whatever functionality the supplies power not working.  If
not otherwise specified it's safer to assume that the supplies must be
connected.

--06/7sdeAneQqaZKj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGnqq0ACgkQJNaLcl1U
h9AiKgf6A1p3c1dtOyuPYAkfziLEMTL656L/Ng0sT/e9yjZ9D6KPZxQqSYqZJI2F
AxQcNhi9BBM7R94mawqJ6jekuZZ0RJoVo2iPJYWJ/vM36tq01U1SeojIamTmD1LN
IF4vSf9paAEB6kQGTW1WB9onUyNpaIyz358HSRZ6FzxP/9W1qVhuCgw2M16JPM5G
wFd64VVU8pyBLxa8glflmm8MGFaeKBqkNFJBSnRG2kX79RRtaVeX8wN6niXIsGQp
T7Uv+fFGAT+w315hhRUx10oTaZNghDPE6dYLm6SaV4fqYqhIFspHZ9GsOLPvDDvC
E4+8AFtE7h0IearW001RSgvJHmQFiw==
=8Z88
-----END PGP SIGNATURE-----

--06/7sdeAneQqaZKj--
