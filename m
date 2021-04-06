Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 469B6355290
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 13:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3FC6E3CE;
	Tue,  6 Apr 2021 11:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73416E3CE;
 Tue,  6 Apr 2021 11:44:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54559613A3;
 Tue,  6 Apr 2021 11:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617709453;
 bh=2Vm9ityjyZldn07RFATp/5Z6vJvrtF34+UIuw8/w51g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GReFQWQpMbEkyEVsTKHs7ItqEeoFaP16m5Z3rbHGee/xUg8t97DrCK353XkdbGbf9
 lao7igukf7FQKFGApt0frZlorzz/1m9K6PSQnaNs8KWGe74p49eVqMnMWSMWr/eWb6
 h0E6V8WCjhzowkzHQKaBkT6y+Zl0z1OLo0UBhroRVCHDhJe0Nw2db833UnCeJjEsF5
 vFXsftpWcfKnGw/Wg7KJBeV7IdlAJh6JaV2qku9wWyxeJQCnvfMWFJ4nXmMzAkQKYp
 MBgfG9A4tCMG1nh+ayjA722WXw/iGJ434k7CUQ3wegQio0D9yZSJwuwQyNNFxp3+dF
 yc6IGZsD1CfUg==
Date: Tue, 6 Apr 2021 12:43:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] pwm: Rename pwm_get_state() to better reflect its semantic
Message-ID: <20210406114357.GC6443@sirena.org.uk>
References: <20210406073036.26857-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210406073036.26857-1-u.kleine-koenig@pengutronix.de>
X-Cookie: BARBARA STANWYCK makes me nervous!!
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-clk@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-input@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Support Opensource <support.opensource@diasemi.com>,
 Stephen Boyd <sboyd@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: multipart/mixed; boundary="===============1343311187=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1343311187==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UFHRwCdBEJvubb2X"
Content-Disposition: inline


--UFHRwCdBEJvubb2X
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 09:30:36AM +0200, Uwe Kleine-K=F6nig wrote:
> Given that lowlevel drivers usually cannot implement exactly what a
> consumer requests with pwm_apply_state() there is some rounding involved.

Acked-by: Mark Brown <broonie@kernel.org>

--UFHRwCdBEJvubb2X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBsSXwACgkQJNaLcl1U
h9CeAAgAg9/Q2RgSOxhbh64cI3whEBi2rDoy4JrnVOIaezDbl1KVpYtyba0y715D
Y+27eAxh97zRr3AOb8di8IGVTcKZqEJvwbFWeAxIYTqr7yewyfFV2r3+aj1n6uji
E06xtLVSajGadFJ8cwDdQmB2HGTiOraS8BIQTq8UgV4X6S2LOC6RRZ/BADXxlSXZ
awgIor1dw+uVGentYfCseXYt3xOeoBGm1kcv2bLWZOf7p34NrBErZxEelYeZycnR
FVaAHx4aGe2/1xPGOYGRdXxub+JSiKOXp8tFNWDNnrr/343S2A8pBE8u1GWqB2tu
i/C2E1EQmwot6hIKN5/6hIg/LOb4cA==
=bscb
-----END PGP SIGNATURE-----

--UFHRwCdBEJvubb2X--

--===============1343311187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1343311187==--
