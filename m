Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AAA6EDE3
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 07:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448896E861;
	Sat, 20 Jul 2019 05:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35B56E861
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2019 05:43:00 +0000 (UTC)
Received: from localhost (91-163-65-175.subs.proxad.net [91.163.65.175])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4F917100005;
 Sat, 20 Jul 2019 05:42:56 +0000 (UTC)
Date: Sat, 20 Jul 2019 07:42:55 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH 0/3] drm/sun4i: Add support for color encoding and range
Message-ID: <20190720054255.vyma2lyiu2tohl74@flea>
References: <20190713120346.30349-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
In-Reply-To: <20190713120346.30349-1-jernej.skrabec@siol.net>
User-Agent: NeoMutt/20180716
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1960222326=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1960222326==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4bp3a2hzmkf5ifze"
Content-Disposition: inline


--4bp3a2hzmkf5ifze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 13, 2019 at 02:03:43PM +0200, Jernej Skrabec wrote:
> In order to correctly convert image between YUV and RGB, you have to
> know color encoding and color range. This patch set adds appropriate
> properties and considers them when choosing CSC conversion matrix for
> DE2 and DE3.
>
> Note that this is only the half of needed changes when using HDMI output.
> DW HDMI bridge driver has to be extended to have a property to select
> limited (TVs) or full (PC monitors) range. But that will be done at a
> later time.
>
> Please take a look.

Sorry for the delay, I applied all three.

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--4bp3a2hzmkf5ifze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTKp3wAKCRDj7w1vZxhR
xb/MAP0YGFEL32Wso4KP7I+AUWQBVf1s5y0UbrS6kdiCC1q+pwD+IxvTlGoVYE3C
XSeD1QTADsnw4LRHiB1TTiZsmdd3rw4=
=gCkd
-----END PGP SIGNATURE-----

--4bp3a2hzmkf5ifze--

--===============1960222326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1960222326==--
