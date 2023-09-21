Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4347A923C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 09:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91E110E56E;
	Thu, 21 Sep 2023 07:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4C010E56E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 07:44:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B4C7D61E71;
 Thu, 21 Sep 2023 07:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50C4C43142;
 Thu, 21 Sep 2023 07:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695282268;
 bh=JCq0O1XzoeOJfKdQOyYZ+dAwFcxhR4qFFxsFJNTh8Js=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B6f70IJzip3FnaCZrw0WVSUtlY6I4GSvfMabPLaiFIJB2Wwdq/mTfBL48JDJYLGOz
 0t7kIH92hy6TRL7/8LI4+rOg8BZV/GXJiGNlGucAL4JVlyv2ekoQ/GqhZnFbbbZlgi
 MkZxA3NAz1/MMr0nWD1CwdaJd+52AisXteMgLxZb3LIf1/QIwRRcbUH5hmQL7ZmqSt
 pCkB99QPMvHGPm0HQGdN+noOrvmwmws7/KBqaWi5Ba3HDERGuoz/8vPO2VvwZoL/7o
 FhI+YAq2PoyZoHnqlvqfeBOptNn1CLjUAzWqgxH3VzBJRzRYbtgEMcr/V51Oz44yNG
 cRV+9pdbRFUTg==
Date: Thu, 21 Sep 2023 09:44:25 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/ssd130x: Drop _helper prefix from struct
 drm_*_helper_funcs callbacks
Message-ID: <552hpgr7qzbjxuyei3n5m7rsn7ekwbdgzv25oe5vy6qb35gf23@q4etussk5jwl>
References: <20230914195138.1518065-1-javierm@redhat.com>
 <f5620d32-2705-498b-a65c-7dc663340a6d@suse.de>
 <87wmwo3q50.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2ociu33dmyngsoqo"
Content-Disposition: inline
In-Reply-To: <87wmwo3q50.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2ociu33dmyngsoqo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 18, 2023 at 09:19:07AM +0200, Javier Martinez Canillas wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>=20
> > Hi
> >
> > Am 14.09.23 um 21:51 schrieb Javier Martinez Canillas:
> >> The driver uses a naming convention where functions for struct drm_*_f=
uncs
> >> callbacks are named ssd130x_$object_$operation, while the callbacks for
> >> struct drm_*_helper_funcs are named ssd130x_$object_helper_$operation.
> >>=20
> >> The idea is that this helper_ prefix in the function names denote that=
 are
> >> for struct drm_*_helper_funcs callbacks. This convention was copied fr=
om
> >> other drivers, when ssd130x was written but Maxime pointed out that is=
 the
> >> exception rather than the norm.
> >
> > I guess you found this in my code. I want to point out that I use the=
=20
> > _helper infix to signal that these are callback for=20
> > drm_primary_plane_helper_funcs and *not* drm_primary_plane_funcs. The=
=20
> > naming is intentional.
> >
>=20
> Yes, that's what tried to say in the commit message and indeed I got the
> convention from drivers in drivers/gpu/drm/tiny. In fact I believe these
> function names are since first iteration of the driver, when was meant to
> be a tiny driver.
>=20
> According to Maxime it's the exception rather than the rule and suggested
> to change it, I don't really have a strong opinion on either naming TBH.

Maybe that's just me, but the helper in the name indeed throws me off. In my
mind, it's supposed to be used only for helpers, not functions implementing=
 the
helpers hooks.

Maxime

--2ociu33dmyngsoqo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQv0WQAKCRDj7w1vZxhR
xQqfAP92TE+LyR9XfDnY8TOYQ2btb0vi9F8eVCt96OBDOKAmwwD9GadGgQONJhi2
9eLzxM9+iTWsgK3rnNX7P7WK0mfI/w0=
=v3YY
-----END PGP SIGNATURE-----

--2ociu33dmyngsoqo--
