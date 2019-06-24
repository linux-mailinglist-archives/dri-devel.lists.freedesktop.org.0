Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A1E50C27
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 15:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9964489B29;
	Mon, 24 Jun 2019 13:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D7A89B33
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 13:41:45 +0000 (UTC)
X-Originating-IP: 90.88.16.156
Received: from localhost (aaubervilliers-681-1-41-156.w90-88.abo.wanadoo.fr
 [90.88.16.156]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 19ED160011;
 Mon, 24 Jun 2019 13:41:40 +0000 (UTC)
Date: Mon, 24 Jun 2019 15:41:40 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/connector: Fix warning in debug message
Message-ID: <20190624134140.j4emmtixu2qgjgah@flea>
References: <20190624084016.12937-1-maxime.ripard@bootlin.com>
 <20190624084433.GO12905@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20190624084433.GO12905@phenom.ffwll.local>
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
Cc: kbuild test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 Nick Desaulniers <ndesaulniers@google.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1521794732=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1521794732==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3cjsmwxqlccxfppx"
Content-Disposition: inline


--3cjsmwxqlccxfppx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 24, 2019 at 10:44:33AM +0200, Daniel Vetter wrote:
> On Mon, Jun 24, 2019 at 10:40:16AM +0200, Maxime Ripard wrote:
> > The commit 3aeeb13d8996 ("drm/modes: Support modes names on the command
> > line") added name support to the DRM modes, and added that name to the
> > debug message.
> >
> > However, that code tests for whether or not the name variable is NULL and
> > only prints it if it's not. Except that that variable is an array, so it
> > will never be NULL.
> >
> > The original intent was to print it only when the name has been specified.
> > Just printing the array directly will achieve the same thing since the
> > drm_cmdline_mode structure that holds it is itself contained in
> > drm_connector, that is allocated with its whole content zero'd.
> >
> > That means that if the name is not declared, the array will be all zeros,
> > which will not print anything.
> >
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Fixes: 3aeeb13d8996 ("drm/modes: Support modes names on the command line")
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Applied,

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--3cjsmwxqlccxfppx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRDTFAAKCRDj7w1vZxhR
xWgnAP97nRT06dHI9QwiTFmYjPio9Ok6Jg4/RZMB58v77AJU1gD+OpqVJcTXXZ6Y
4kVapjShBM1Nu84E9UzD7c0rewhD5gk=
=JXQs
-----END PGP SIGNATURE-----

--3cjsmwxqlccxfppx--

--===============1521794732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1521794732==--
