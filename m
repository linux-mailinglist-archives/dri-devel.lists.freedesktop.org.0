Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0F64AF327
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 14:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1C210E130;
	Wed,  9 Feb 2022 13:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AD210E130
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 13:43:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CF93EB821A2;
 Wed,  9 Feb 2022 13:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CEF5C340E7;
 Wed,  9 Feb 2022 13:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644414200;
 bh=37OR1ffupD9w9dKrsD/tXWDzbP9itwcwvYTx3uXtOps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fUge2DMeusx+jhrGmSAodUdP1Qlf9acOZcs8TjQf49xFNLNknrvgg4CY0s7fVgCF8
 Cix15WePuCE8YLeekKTb76Y/rXKbN1SD+6r0LxYI3H0d/imAIpMAl6lJgmm/jNVjzA
 WVB148FwaqUS5h6YKprZT6lPNyNuX5vPGeT9sQsgVI6BSEAJ4IQISslWPIRma9Al4A
 lAP9PBsiTlNG9LvPNdqJ/cdlV9LQad+75PzzcBLAgtfl1lKk9+d9kbJDxHLGVt79qY
 AWui1oqCXtrqDGBpfykYd4GAzGL+a/BPqHb5kqhe2BYye1Vu+IpQlkWBJ40Wul6tk1
 Pxlei95pitoIQ==
Date: Wed, 9 Feb 2022 13:43:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 3/7] drm: Add driver for Solomon SSD130X OLED displays
Message-ID: <YgPE8Z7HxU2wv7J/@sirena.org.uk>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-4-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hG/Egg4kkWequsOJ"
Content-Disposition: inline
In-Reply-To: <20220209090314.2511959-4-javierm@redhat.com>
X-Cookie: Disc space -- the final frontier!
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hG/Egg4kkWequsOJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 09, 2022 at 10:03:10AM +0100, Javier Martinez Canillas wrote:

> +	if (ssd130x->vbat_reg) {
> +		ret = regulator_enable(ssd130x->vbat_reg);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable VBAT: %d\n", ret);
> +			return ret;
> +		}
> +	}

Unless the device supports power being physically omitted regulator
usage should not be optional, it's just more code and a recipie for poor
error handling.

--hG/Egg4kkWequsOJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIDxPAACgkQJNaLcl1U
h9BlsAf8DXkDpBzNae52DdUZC+O3yzYIWFFywhEjjDbPX9wmJ4924EI/wjD/igl6
YeYnHYx0kj0SLfHYbpBFUehzykJQ/puIGOnDJ6FpE0SEtcl6fRWcLyKOuhvl+bHr
2vaJbS/pQ53i53EbMU5Zg5PXsZ18GkuDd+9zgz3aC3wSJAOr4LkPIpLe8sQpfSUM
O6QgrmffoUFahtVadrpjAd+We/dGDUuLvcJCrO184AWXoi3pHtpnzhI0k2/GHBfm
qJghua+CfAPUdSthNyVYVZ/YAB+QLAS5NLfW+QX2Ot0XctA6Lk006jjJ+H8LxFWM
BoGgjBzeIw+303F+wx4Ep1mBFYA2DA==
=MgLt
-----END PGP SIGNATURE-----

--hG/Egg4kkWequsOJ--
