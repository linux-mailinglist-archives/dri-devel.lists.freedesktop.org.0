Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DBE38E27
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 16:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2968589D4B;
	Fri,  7 Jun 2019 14:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9F189D4B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 14:54:54 +0000 (UTC)
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr
 [90.88.159.246]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id EC5BD240009;
 Fri,  7 Jun 2019 14:54:48 +0000 (UTC)
Date: Fri, 7 Jun 2019 16:54:48 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/2] drm: panel-orientation-quirks: Add quirk for GPD
 MicroPC
Message-ID: <20190607145448.uj5rluis73rhyqdh@flea>
References: <20190524125759.14131-1-hdegoede@redhat.com>
 <20190524125759.14131-2-hdegoede@redhat.com>
 <20190606091440.qomxukz72puwq7vy@flea>
 <e2077be3-c637-daf2-27dc-b1461c77f796@redhat.com>
 <20190606133849.2edsrkkryq6mks6x@flea>
 <fc5e247f-a6d1-b512-1187-ea2c7d48d461@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fc5e247f-a6d1-b512-1187-ea2c7d48d461@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============1198239908=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1198239908==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lqypapa6i4zcwa4m"
Content-Disposition: inline


--lqypapa6i4zcwa4m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 06, 2019 at 04:03:57PM +0200, Hans de Goede wrote:
> Hi,
>
> On 06-06-19 15:38, Maxime Ripard wrote:
> > On Thu, Jun 06, 2019 at 01:13:40PM +0200, Hans de Goede wrote:
> > > On 06-06-19 11:14, Maxime Ripard wrote:
> > > > On Fri, May 24, 2019 at 02:57:59PM +0200, Hans de Goede wrote:
> > > > > GPD has done it again, make a nice device (good), use way too generic
> > > > > DMI strings (bad) and use a portrait screen rotated 90 degrees (ugly).
> > > > >
> > > > > Because of the too generic DMI strings this entry is also doing bios-date
> > > > > matching, so the gpd_micropc data struct may very well need to be updated
> > > > > with some extra bios-dates in the future.
> > > > >
> > > > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > >
> > > > For both patches,
> > > > Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > >
> > > Thank you, I've pushed both to drm-misc-next now.
> > >
> > > Can you add them to drm-misc-fixes please ?
> > >
> > > (AFAIK I'm not supposed to do that myself)
> >
> > You definitely can :)
> >
> > Now that it's in next though, it's pretty hard to come back in time. I
> > guess we could just apply it in fixes and let git figure it out, or
> > revert the one in next. I'm not sure which one is preferred
> > though.
>
> I thought that the procedure was to get it in -next and then cherry-pick
> into -fixes?

If you feel like something should be in fixes, you can definitely
apply it there only.

> Git should sort this out without issues when Linus merges -next; or
> when we back-merge Linus' tree.

Yeah, looking at the doc, cherry-picking is the one encouraged, so
feel free to cherry-pick them in drm-misc-fixes.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--lqypapa6i4zcwa4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPp6uAAKCRDj7w1vZxhR
xQqqAQCUI6lb8xZEpVjThpfNbiEiGzlm4JUaHjDLb93uBg+NXQEA/PTqlJck/sZE
uqyiPndTm0ujkuQ0ixa7QF6F3BKWMw8=
=cGaU
-----END PGP SIGNATURE-----

--lqypapa6i4zcwa4m--

--===============1198239908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1198239908==--
