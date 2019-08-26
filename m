Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41009CE3B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 13:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56D46E113;
	Mon, 26 Aug 2019 11:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F16B6E113
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 11:36:19 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 4ED571BF208;
 Mon, 26 Aug 2019 11:36:17 +0000 (UTC)
Date: Mon, 26 Aug 2019 13:36:16 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 11/50] drm/bridge: Add bridge driver for display
 connectors
Message-ID: <20190826113616.vkjeyeahbgsnvkx6@flea>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-12-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190820011721.30136-12-laurent.pinchart@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1768586013=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1768586013==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ao23im345tywyzll"
Content-Disposition: inline


--ao23im345tywyzll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 20, 2019 at 04:16:42AM +0300, Laurent Pinchart wrote:
> Display connectors are modelled in DT as a device node, but have so far
> been handled manually in several bridge drivers. This resulted in
> duplicate code in several bridge drivers, with slightly different (and
> thus confusing) logics.
>
> In order to fix this, implement a bridge driver for display connectors.
> The driver centralises logic for the DVI, HDMI, VGAn composite and
> S-video connectors and exposes corresponding bridge operations.
>
> This driver in itself doesn't solve the issue completely, changes in
> bridge and display controller drivers are needed to make use of the new
> connector driver.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ao23im345tywyzll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXWPEMAAKCRDj7w1vZxhR
xeWvAP0Rh09q+kG4qfXwylbRocvdDic96t2RNL6z+0cm+RxMqAD/WsHIBG0OhEbV
XxtVvsSgJ5dOfvW/2VgOSSCwtz4Gnwk=
=YZEJ
-----END PGP SIGNATURE-----

--ao23im345tywyzll--

--===============1768586013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1768586013==--
