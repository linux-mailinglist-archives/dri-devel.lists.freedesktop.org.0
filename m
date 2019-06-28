Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EF65996E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 13:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874096E8E9;
	Fri, 28 Jun 2019 11:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0316E8E9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 11:51:48 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 9590440009;
 Fri, 28 Jun 2019 11:51:45 +0000 (UTC)
Date: Fri, 28 Jun 2019 13:51:45 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/1] drm: panel-orientation-quirks: Add extra quirk table
 entry GPD MicroPC
Message-ID: <20190628115145.g7hqqit2zad3z2wf@flea>
References: <20190624154014.8557-1-hdegoede@redhat.com>
 <5215f91a-377a-78f1-dc73-7f9ae7531d56@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5215f91a-377a-78f1-dc73-7f9ae7531d56@redhat.com>
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
Cc: Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1573100027=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1573100027==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k2js3lnbagke543w"
Content-Disposition: inline


--k2js3lnbagke543w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 28, 2019 at 12:04:30PM +0200, Hans de Goede wrote:
> Hi all,
>
> On 24-06-19 17:40, Hans de Goede wrote:
> > Hi All,
> >
> > Good news I have a contact inside GPD now and from now on their BIOS-es
> > will have proper sys_vendor and product_name DMI strings. This means that
> > we no longer need to do BIOS date matches and add a new BIOS date to
> > drm_panel_orientation_quirks.c for each BIOS update.
> >
> > The second batch of GPD MicroPC-s being delivered to users already uses
> > these new strings, this patch adds a quirk for the 90 degree mounted
> > LCD panel using the new DMI strings.
> >
> > It would be nice to get this into 5.2, but it is not that urgent, so
> > I believe that it is best to push this to drm-misc-next-fixes and then
> > it can get added to 5.2.y once it hits Torvald's tree.
> >
> > If someone can give this a review (it is a trivial patch really) and
> > give me an Acked-by then I'll push this to drm-misc-next-fixes.
>
> Maarten, Maxime, ping? Can I get an Acked-by (or Reviewed-by) for this
> please so that I can push it to drm-misc-next-fixes ?

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--k2js3lnbagke543w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRX/SwAKCRDj7w1vZxhR
xcLGAQDWuN90T+zToRV5X4gWGunQSqfMMii3zbxlNY8Gq8r7nAEA+ZoGtPPWYEcg
ItoAjaC5K589IwmpV3CnIQLYJJ/ZxAM=
=dyqR
-----END PGP SIGNATURE-----

--k2js3lnbagke543w--

--===============1573100027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1573100027==--
