Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7367F20156
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 10:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3949A89259;
	Thu, 16 May 2019 08:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA8889259
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 08:31:14 +0000 (UTC)
X-Originating-IP: 80.215.246.107
Received: from localhost (unknown [80.215.246.107])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6532D20003;
 Thu, 16 May 2019 08:31:05 +0000 (UTC)
Date: Thu, 16 May 2019 10:31:04 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH 0/2] drm/sun4i: Fix sun8i HDMI PHY initialization
Message-ID: <20190516083104.rr2ewg3dd4aej67b@flea>
References: <20190514204337.11068-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
In-Reply-To: <20190514204337.11068-1-jernej.skrabec@siol.net>
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
Content-Type: multipart/mixed; boundary="===============1606654622=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1606654622==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nxc66wpttvnorf5q"
Content-Disposition: inline


--nxc66wpttvnorf5q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 14, 2019 at 10:43:35PM +0200, Jernej Skrabec wrote:
> I received a report that 4K resolution doesn't work if U-Boot video
> driver is disabled. It turns out that HDMI PHY clock driver was
> initialized prematurely, before reset line was deasserted and clocks
> enabled. U-Boot video driver masked the issue because it set pixel
> clock correctly.
>
> In the process of researching the bug, I also found out that few bits
> in HDMI PHY registers were not set correctly. While there is no
> noticeable change (4K resolution works with both settings), I've
> added fix anyway, to be conformant with vendor documentation.

Applied both, thanks

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nxc66wpttvnorf5q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXN0fyAAKCRDj7w1vZxhR
xUAXAP9xICklXvpieTeqdcZC4XE/+a2QALTSkxog1dIwU2z9hgEA9W1tdHngDaMj
jYInZNsuhpQY0H7zxkIQTeX7MeX2Ogs=
=TN7Y
-----END PGP SIGNATURE-----

--nxc66wpttvnorf5q--

--===============1606654622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1606654622==--
