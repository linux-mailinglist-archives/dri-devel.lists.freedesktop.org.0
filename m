Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 283A611C8B9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9AD6ECE4;
	Thu, 12 Dec 2019 08:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2566ECE4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 08:58:07 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 736CB214AF;
 Thu, 12 Dec 2019 08:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576141086;
 bh=bcqDN/kSAEFhAhyoriIauMiCUlZV7ZAz8eCQp1yjFik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DbAhl0lVIK4N0ew5qeEzOJD3joAtv0D0j0lNA27WKqdF6amldUi+Ivu+SS90cMSeN
 SOBs1wCi50KSGzBoymBICiAhI4ZYAUNbP1FZl+HE4NFappsYewnOAsrDGIiokLxVZW
 c9azBFRgfYRRcSoPrJc4mMzrL8piZVMsZeUVqplw=
Date: Thu, 12 Dec 2019 09:58:03 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 06/50] drm/bridge: dumb-vga-dac: Rename internal
 symbols to simple-bridge
Message-ID: <20191212085803.rjsrqz4c4ae6lioe@gilmour.lan>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-7-laurent.pinchart@ideasonboard.com>
 <20191211211318.GA27390@ravnborg.org>
 <20191211234212.GB26146@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20191211234212.GB26146@pendragon.ideasonboard.com>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1825448797=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1825448797==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ivl2f7yfccpxul55"
Content-Disposition: inline


--ivl2f7yfccpxul55
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Dec 12, 2019 at 01:42:12AM +0200, Laurent Pinchart wrote:
> On Wed, Dec 11, 2019 at 10:13:18PM +0100, Sam Ravnborg wrote:
> > On Wed, Dec 11, 2019 at 12:57:06AM +0200, Laurent Pinchart wrote:
> > > The dumb-vga-dac driver is a simple DRM bridge driver for simple VGA
> > > DACs that don't require configuration. Other non-VGA bridges fall in a
> > > similar category, and would benefit from a common driver. Prepare for
> > > this by renaming the internal symbols from dumb-vga-dac to
> > > simple-bridge.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> > > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > Maxime has a new email address today.
> > The one used here bounces.
>
> I know, but his Reviewed-by tag was given with the bootlin.com e-mail
> address, so I haven't changed it. Maxime, should I update your tags in
> this series ?

Yes, of course :)

Maxime

--ivl2f7yfccpxul55
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfIBGwAKCRDj7w1vZxhR
xahPAP92/4SLezk2AaXhWA+BWlF+B3y60PSKizGvIBBCX7yO7wD/a54dB7urtUDx
a48xYf0ETjXcZHdEEnBxFabbEAJ9KQ4=
=Gtgc
-----END PGP SIGNATURE-----

--ivl2f7yfccpxul55--

--===============1825448797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1825448797==--
