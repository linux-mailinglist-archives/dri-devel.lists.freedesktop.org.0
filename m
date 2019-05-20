Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A32023336
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 14:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F2389263;
	Mon, 20 May 2019 12:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC33989262
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 12:07:40 +0000 (UTC)
X-Originating-IP: 90.88.22.185
Received: from localhost (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B57911BF20E;
 Mon, 20 May 2019 12:07:37 +0000 (UTC)
Date: Mon, 20 May 2019 14:07:36 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 7/7] drm: Remove users of drm_format_num_planes
Message-ID: <20190520120736.6ywe64l2oaigktbh@flea>
References: <27b0041c7977402df4a087c78d2849ffe51c9f1c.1558002671.git-series.maxime.ripard@bootlin.com>
 <c0a78c87cd0410a1819edad2794ad06543c85bb5.1558002671.git-series.maxime.ripard@bootlin.com>
 <20190520112045.GB6789@aptenodytes>
MIME-Version: 1.0
In-Reply-To: <20190520112045.GB6789@aptenodytes>
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
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1790299357=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1790299357==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="omouog2ag5tr5q2s"
Content-Disposition: inline


--omouog2ag5tr5q2s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 20, 2019 at 01:20:45PM +0200, Paul Kocialkowski wrote:
> Hi,
>
> On Thu 16 May 19, 12:31, Maxime Ripard wrote:
> > drm_format_info_plane_cpp() basically just returns the cpp array content
> > found in the drm_format_info structure.
> >
> > Since it's pretty trivial, let's remove the function and have the users use
> > the array directly
>
> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Applied all 7 patches to drm-misc-next, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--omouog2ag5tr5q2s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOKYiAAKCRDj7w1vZxhR
xQQ3AQCwmuWyICKzfQgOtEuXjQnERNJXKUlcT2+4I6UFvOzbpQEA1mQQ+PKTdFJ7
5c02i7jc4RH+Vxdlxw9S1jewokogoQE=
=Sv7i
-----END PGP SIGNATURE-----

--omouog2ag5tr5q2s--

--===============1790299357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1790299357==--
