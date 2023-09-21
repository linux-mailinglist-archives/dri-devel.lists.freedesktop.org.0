Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6B77A938A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 12:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034B610E0C8;
	Thu, 21 Sep 2023 10:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D2210E0C8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 10:19:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9D849B81FB8;
 Thu, 21 Sep 2023 10:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2ECC32791;
 Thu, 21 Sep 2023 10:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695291595;
 bh=UxQD1SuHVG9zIJNylN0lDXAMWfQVp1hT8KmGTNnnfsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KmvL1DeQ4sQGU+G5DAKsBLMqy0zToCzMk0V4KAfNHwoVhBtVbdg/BGibIFNWXoRAv
 dSth7skaz+dXYsJjXtATnTehoB4X4M22AnMzkKix3rVK0Rw09IM4YRVZYEnFVxnGPl
 z1lFqT+AX3FCqjvQtVCkgSkLssTDAhKHavzFsM1x/VAkrHwofg2k5lgoRXhBltl6i/
 FqYFL4sdtHHKwaV/OuMi4fO67XsL/jTNp4PshOMnQ5VRWJwCV344b2RLClRNSJ/Z4f
 QslxYOY/mcqgt+M+q/zuPcIFqWUb/kOgGJpqIZGV/asc2eFJ3jV22Km9GBWGKA9iMt
 snl+RS8yocYow==
Date: Thu, 21 Sep 2023 12:19:52 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Update drm-misc entry to match all drivers
Message-ID: <lrb6grhxsscojsayarkwdtlyj73hivjqxver7dp22rkvbdlpfk@a2suuejp6322>
References: <20230919131235.759959-1-mripard@kernel.org>
 <98716df2-c0d8-4b7d-8379-5bac815577ec@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4gtqni3xhud5etfv"
Content-Disposition: inline
In-Reply-To: <98716df2-c0d8-4b7d-8379-5bac815577ec@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4gtqni3xhud5etfv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Thu, Sep 21, 2023 at 10:57:57AM +0200, Thomas Zimmermann wrote:
> Am 19.09.23 um 15:12 schrieb Maxime Ripard:
> > We've had a number of times when a patch slipped through and we couldn't
> > pick them up either because our MAINTAINERS entry only covers the
> > framework and thus we weren't Cc'd.
> >=20
> > Let's take another approach where we match everything, and remove all
> > the drivers that are not maintained through drm-misc.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   MAINTAINERS | 23 ++++++++++++++++++++---
> >   1 file changed, 20 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 90f13281d297..757d4f33e158 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6860,12 +6860,29 @@ M:	Thomas Zimmermann <tzimmermann@suse.de>
> >   S:	Maintained
> >   W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.ht=
ml
> >   T:	git git://anongit.freedesktop.org/drm/drm-misc
> > +F:	Documentation/devicetree/bindings/display/
> > +F:	Documentation/devicetree/bindings/gpu/
> >   F:	Documentation/gpu/
> > -F:	drivers/gpu/drm/*
> > +F:	drivers/gpu/drm/
> >   F:	drivers/gpu/vga/
> > -F:	include/drm/drm*
> > +F:	include/drm/drm
> >   F:	include/linux/vga*
> > -F:	include/uapi/drm/drm*
> > +F:	include/uapi/drm/
> > +X:	drivers/gpu/drm/amd/
> > +X:	drivers/gpu/drm/armada/
> > +X:	drivers/gpu/drm/etnaviv/
> > +X:	drivers/gpu/drm/exynos/
>=20
> > +X:	drivers/gpu/drm/gma500/
>=20
> We always had gma500 in drm-misc. Where else would these go?

The maintainers entry has a git repo. I'll update it (and that patch too) t=
hen

Maxime

--4gtqni3xhud5etfv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQwYyAAKCRDj7w1vZxhR
xSN2AQDix/bMXD5wUd5Ie21+uCyffSlKechKMM85cKSoATZh7QEA29MA3JMC6b+E
uX00pND829U76VLVk/nBPvjE3pBoIwA=
=7cZn
-----END PGP SIGNATURE-----

--4gtqni3xhud5etfv--
