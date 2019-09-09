Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B81ADA85
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 15:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3916C89C8D;
	Mon,  9 Sep 2019 13:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1612E89C8D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 13:54:05 +0000 (UTC)
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7K71-0002ZE-GF; Mon, 09 Sep 2019 13:53:47 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id DB8BCD02D3E; Mon,  9 Sep 2019 14:53:46 +0100 (BST)
Date: Mon, 9 Sep 2019 14:53:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v5 0/5] Add HDMI jack support on RK3288
Message-ID: <20190909135346.GG2036@sirena.org.uk>
References: <20190717083327.47646-1-cychiang@chromium.org>
 <CA+Px+wX4gbntkd6y8NN8xwXpZLD4MH9rTeHcW9+Ndtw=3_mWBw@mail.gmail.com>
 <CAFv8NwLiY+ro0L4c5vjSOGN8jA-Qr4zm2OWvVHkiuoa7_4e2Fg@mail.gmail.com>
 <CAFv8NwJjG4mwfnYO=M3O9nZN48D6aY72nQuqEFpZL68dh5727w@mail.gmail.com>
 <7019a223-cc97-e1c6-907b-e6b3d626164f@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <7019a223-cc97-e1c6-907b-e6b3d626164f@baylibre.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cm68PPNUL9hpa20Iuq3N78KfFV9ZNG1FxC3bFlrLNBo=; b=SfCG2GghXvnLx5hk7+p07alq7
 rAtpln77hLd/I2OhSW53ZOqioUNmYHSKcBbb8mqu7CPtaK7xrY8P/BZAFJBwcbiTIiUNImLxvpA9q
 IP7v7eZk/iX6XwTN/nXk4BeApdZCIIVXbmK2eaCvwgK/XZDmHpv2JXbcjR+Uqt4JyETi8=;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Cheng-yi Chiang <cychiang@chromium.org>, linux-rockchip@lists.infradead.org,
 Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Dylan Reid <dgreid@chromium.org>, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, Russell King <rmk+kernel@armlinux.org.uk>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Douglas Anderson <dianders@chromium.org>
Content-Type: multipart/mixed; boundary="===============2093473043=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2093473043==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1XWsVB21DFCvn2e8"
Content-Disposition: inline


--1XWsVB21DFCvn2e8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 09, 2019 at 09:37:14AM +0200, Neil Armstrong wrote:

> I'd like some review from ASoC people and other drm bridge reviewers,
> Jernej, Jonas & Andrzej.

> Jonas could have some comments on the overall patchset.

The ASoC bits look basically fine, I've gone ahead and applied
patch 1 as is since we're just before the merge window and that
way we reduce potential cross tree issues.  I know there's a lot
of discussion on the DRM side about how they want to handle
things with jacks, I'm not 100% sure what the latest thinking is
there.

--1XWsVB21DFCvn2e8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl12WWoACgkQJNaLcl1U
h9B58gf/azL9m1nPkR4phZ6A1RIN6d+L25pbHNjtM6SvzmLQ2nOUKncgKEgrHCE5
mcWbRDcvUMGOQFMG4agAnXPvWxyTzLKs8YJ6inLI7FzsF9cGKN4eKz9wDl3QsikV
ObslZLrhqTPe29AtSfIKfC9A3GRt9L0E6gG/D6YYa+ZzPEcJOSRMSsPQ+GXeHh1x
uM7ntqIIEWytr2RkEDT+QJHAqgPWz9yI1L9ynlcZfp9OXt/sO2rWPkpFhNyyjeBs
YFUpXp0aMmVtolJYrljTBVJ+DZeTX5JifotTePHJYEpavbMXJ9lcyTIMGL0bB94R
o4rqAkYpM8kK2jGNg2ojes7W5qdjlA==
=a5GI
-----END PGP SIGNATURE-----

--1XWsVB21DFCvn2e8--

--===============2093473043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2093473043==--
