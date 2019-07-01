Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 407D85B612
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 09:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA1889AAD;
	Mon,  1 Jul 2019 07:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5626089AAD
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 07:51:37 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5D67724000A;
 Mon,  1 Jul 2019 07:51:29 +0000 (UTC)
Date: Mon, 1 Jul 2019 09:51:29 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/selftests: reduce stack usage
Message-ID: <20190701075129.wu5q5j2cl6fkkzxp@flea>
References: <20190628121712.1928142-1-arnd@arndb.de>
MIME-Version: 1.0
In-Reply-To: <20190628121712.1928142-1-arnd@arndb.de>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0614818671=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0614818671==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k3xrq2kk3vkmur5d"
Content-Disposition: inline


--k3xrq2kk3vkmur5d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 28, 2019 at 02:16:45PM +0200, Arnd Bergmann wrote:
> Putting a large drm_connector object on the stack can lead to warnings
> in some configuration, such as:
>
> drivers/gpu/drm/selftests/test-drm_cmdline_parser.c:18:12: error: stack frame size of 1040 bytes in function 'drm_cmdline_test_res' [-Werror,-Wframe-larger-than=]
> static int drm_cmdline_test_res(void *ignored)
>
> Since the object is never modified, just declare it as 'static const'
> and allow this to be passed down.
>
> Fixes: b7ced38916a9 ("drm/selftests: Add command line parser selftests")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--k3xrq2kk3vkmur5d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRm7gAAKCRDj7w1vZxhR
xSj3AQD883LdPCF2VHnJQSOigD1rze6Ji5RXavfZBuw0Wl+AFwEAhNezyMQujyQ9
tnGzcooJ6/8XWBIhPBIfP0Hs3nkamwk=
=tsnW
-----END PGP SIGNATURE-----

--k3xrq2kk3vkmur5d--

--===============0614818671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0614818671==--
