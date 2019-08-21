Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615E1974A5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 10:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5708D6E93D;
	Wed, 21 Aug 2019 08:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E76C6E93D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 08:22:43 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 628481BF206;
 Wed, 21 Aug 2019 08:22:39 +0000 (UTC)
Date: Wed, 21 Aug 2019 09:31:54 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/3] dt-bindings: Convert Arm Mali GPUs to DT schema
Message-ID: <20190821073154.jnqv4sysoyorv7vo@flea>
References: <20190820195959.6126-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190820195959.6126-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1707711335=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1707711335==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ye7watdg3ithuyxt"
Content-Disposition: inline


--ye7watdg3ithuyxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Tue, Aug 20, 2019 at 02:59:56PM -0500, Rob Herring wrote:
> This series converts the various Arm Mali GPU bindings to use the DT
> schema format.
>
> The Midgard and Bifrost bindings generate warnings on 'interrupt-names'
> because there's all different ordering. The Utgard binding generates
> warnings on Rockchip platforms because 'clock-names' order is reversed.

Thank for taking care of that one, it was on my radar but I didn't
really want to actually do it :)

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ye7watdg3ithuyxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVzzagAKCRDj7w1vZxhR
xeOoAP0fDHwGDG+Pp7I7jUWueHcugddYVgoBEitC7+EXWXCGywD/cyBgtgtPE19N
g0eZSCfigQtpIBBde4Gqm9+94pYLnwI=
=UmRS
-----END PGP SIGNATURE-----

--ye7watdg3ithuyxt--

--===============1707711335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1707711335==--
