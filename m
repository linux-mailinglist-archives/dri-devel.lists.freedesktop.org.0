Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C86AF4350
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 10:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF206F8E6;
	Fri,  8 Nov 2019 09:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9C36F8E6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 09:31:27 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B305D214DA;
 Fri,  8 Nov 2019 09:31:26 +0000 (UTC)
Date: Fri, 8 Nov 2019 10:31:24 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH v5 0/7][rebased] Add anx6345 DP/eDP bridge for Olimex
 Teres-I
Message-ID: <20191108093124.GD4345@gilmour.lan>
References: <20191107135018.0A04068BE1@verein.lst.de>
MIME-Version: 1.0
In-Reply-To: <20191107135018.0A04068BE1@verein.lst.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573205487;
 bh=2T3Ba/HzcnTOuzzt5o+FEiAJPzM/l6yorQVOheFyKdo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E5/QlUVw4HFCIXEX+ccAEyig5qjAsz2QnssGieCtqvgV6SriyjSz5YHdiSJtqAZyc
 tDN3I2HsDNCYL45f6eF1YEsh+u2WoYCDuaAKxnwgsVzuyb45yZG2oGnSvpwXEDpAhn
 1yfKWPSPYFegSowkz7v6+tZjwAGuqFz0F8uvzs7M=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============1674284515=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1674284515==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jL2BoiuKMElzg3CS"
Content-Disposition: inline


--jL2BoiuKMElzg3CS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 04, 2019 at 11:34:23AM +0100, Torsten Duwe wrote:
> On Wed, Nov 06, 2019 at 04:21:31PM +0100, Maxime Ripard wrote:
> >
> > Please resend the whole series rebased on top of either linux-next or
> > drm-misc-next.
>
> Here it is. Applies cleanly to both, modulo those patches already in.

applied, thanks!
Maxime
--jL2BoiuKMElzg3CS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXcU17AAKCRDj7w1vZxhR
xVqMAQCIfvK3vHGIOLtlR1wZJ1qhlXxRXFOgO5OH2g2LK36KCgD/Tyu1aY0jCKQN
IvSTgB2bS8dNe6KkrPg33wCTDFFKtw8=
=KfZB
-----END PGP SIGNATURE-----

--jL2BoiuKMElzg3CS--

--===============1674284515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1674284515==--
