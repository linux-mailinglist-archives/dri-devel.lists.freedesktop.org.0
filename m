Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5477F30258
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 20:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5110F6E3EE;
	Thu, 30 May 2019 18:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6026E3EE
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 18:54:00 +0000 (UTC)
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8BD9BFF806;
 Thu, 30 May 2019 18:53:54 +0000 (UTC)
Date: Thu, 30 May 2019 20:53:48 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] dt-bindings: display: Convert Allwinner DSI to a schema
Message-ID: <20190530185347.aql4znrk5msk2q6o@flea>
References: <20190527120910.18964-1-maxime.ripard@bootlin.com>
 <CAGb2v66uhrm20BwmODkPZjSM6Ek+xEg23w2Cs49ikW3WcU1Lqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v66uhrm20BwmODkPZjSM6Ek+xEg23w2Cs49ikW3WcU1Lqg@mail.gmail.com>
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
Cc: Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0238169710=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0238169710==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n26wko6czjrwlbek"
Content-Disposition: inline


--n26wko6czjrwlbek
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, May 30, 2019 at 09:48:02PM +0800, Chen-Yu Tsai wrote:
> On Mon, May 27, 2019 at 8:09 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > The Allwinner SoCs have a MIPI-DSI and MIPI-D-PHY controllers supported in
> > Linux, with a matching Device Tree binding.
> >
> > Now that we have the DT validation in place, let's convert the device tree
> > bindings for that controller over to a YAML schemas.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Looks good to me. However not sure why you replaced the clock index macros
> with raw numbers.

The examples are compiled now, and unfortunately we can't use the
defines at this point.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--n26wko6czjrwlbek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPAmuwAKCRDj7w1vZxhR
xTrkAP9aecEKOK5bHZC70YnbsnYn/b1tZ+7DzzXoqX/FQEYF5AEAylRFy9rknaOQ
uAzr1PQPqbqIGy8rVpSH/ibPa/zelgY=
=yRoQ
-----END PGP SIGNATURE-----

--n26wko6czjrwlbek--

--===============0238169710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0238169710==--
