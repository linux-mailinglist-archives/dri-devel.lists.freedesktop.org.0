Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEE837565
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 15:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD7A88894;
	Thu,  6 Jun 2019 13:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A7B88894
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 13:38:58 +0000 (UTC)
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr
 [90.88.144.139]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1027924000D;
 Thu,  6 Jun 2019 13:38:49 +0000 (UTC)
Date: Thu, 6 Jun 2019 15:38:49 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/2] drm: panel-orientation-quirks: Add quirk for GPD
 MicroPC
Message-ID: <20190606133849.2edsrkkryq6mks6x@flea>
References: <20190524125759.14131-1-hdegoede@redhat.com>
 <20190524125759.14131-2-hdegoede@redhat.com>
 <20190606091440.qomxukz72puwq7vy@flea>
 <e2077be3-c637-daf2-27dc-b1461c77f796@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e2077be3-c637-daf2-27dc-b1461c77f796@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1994927825=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1994927825==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h6zh3tujx4gdoncr"
Content-Disposition: inline


--h6zh3tujx4gdoncr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 06, 2019 at 01:13:40PM +0200, Hans de Goede wrote:
> On 06-06-19 11:14, Maxime Ripard wrote:
> > On Fri, May 24, 2019 at 02:57:59PM +0200, Hans de Goede wrote:
> > > GPD has done it again, make a nice device (good), use way too generic
> > > DMI strings (bad) and use a portrait screen rotated 90 degrees (ugly).
> > >
> > > Because of the too generic DMI strings this entry is also doing bios-date
> > > matching, so the gpd_micropc data struct may very well need to be updated
> > > with some extra bios-dates in the future.
> > >
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >
> > For both patches,
> > Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Thank you, I've pushed both to drm-misc-next now.
>
> Can you add them to drm-misc-fixes please ?
>
> (AFAIK I'm not supposed to do that myself)

You definitely can :)

Now that it's in next though, it's pretty hard to come back in time. I
guess we could just apply it in fixes and let git figure it out, or
revert the one in next. I'm not sure which one is preferred
though.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--h6zh3tujx4gdoncr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPkXaQAKCRDj7w1vZxhR
xQjvAP0cmcmqp+J2CrGBXJbqmM6+GeMXv8wugDLya3TBPr/kqAD/UoYwEWVxjStP
7PxHT9y12hzVafYKKbTXekaGQsbgKAk=
=6nkP
-----END PGP SIGNATURE-----

--h6zh3tujx4gdoncr--

--===============1994927825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1994927825==--
