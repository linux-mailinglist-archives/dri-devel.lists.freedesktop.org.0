Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF70C7EED9E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 09:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02F010E2A0;
	Fri, 17 Nov 2023 08:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654AF10E2A0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 08:38:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 76C2EB81CAB;
 Fri, 17 Nov 2023 08:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8D4C433C8;
 Fri, 17 Nov 2023 08:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700210296;
 bh=Zltwp4GsFJ8WfP3ZhXGXiAa9/m0rbEf851izwH8yjO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kMZGno5qrvLEpX6AN9zmd71utBBkwSFFzxkvEDGD5nD1hI/FzwtZeU1edNY9tbH93
 0VSY5MuZpTE4HYrai69U+Ept2rPIUjCpfa2GJ+Up25xQAPmbB+2iTK1Ltr7vwPZE4D
 IP44dPdtg9GBu/FEFbqA/R5ukGAEE7Gi+jiifEGeZF1RADYKNqc8u2hRU9zbPfrubG
 y7MBvOAm6ccBAyMhzeCTzFhhjquV3uKaqe1D0YePTNqo/8Foxydk0IysortH79cBei
 1Lr3MzK79PRPa9EX7/e7G4v4j0MNyXTbgmDd26kLAxveZrzXoJx6wcvAJvIAFTYyHS
 3nJhk4iggSnMA==
Date: Fri, 17 Nov 2023 09:38:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 3/3] drm/ssd130x: Change "solomon,page-offset" property
 default value
Message-ID: <yqneztpzmhhqenommpvhw2pksjspq7srpeba7ckfia5z3c5aap@wmnxhbgcflnd>
References: <20231116180743.2763021-1-javierm@redhat.com>
 <20231116180743.2763021-3-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ugqcnc4hp5qdpf6v"
Content-Disposition: inline
In-Reply-To: <20231116180743.2763021-3-javierm@redhat.com>
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
Cc: Sahaj Sarup <sahaj.sarup@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ugqcnc4hp5qdpf6v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 07:07:39PM +0100, Javier Martinez Canillas wrote:
> This is used to specify the page start address offset of the display RAM.
>=20
> The value is used as offset when setting the page start address with the
> SSD130X_SET_PAGE_RANGE command, and the driver currently sets its value to
> 1 if the property is not present in the Device Tree.
>=20
> But the datasheet mentions that the value on reset for the page start is a
> 0, so it makes more sense to also have 0 as the default value for the page
> offset if the property is not present.

I can see the argument, but that's a DT ABI breaking change.

> In fact, using a default value of 1 leads to the display not working when
> the emulated fbdev is attached to the framebuffer console.

Could we fix that one instead? What is the issue about, exactly

Maxime

--ugqcnc4hp5qdpf6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZVcmawAKCRDj7w1vZxhR
xT0mAQCE0xcyl9bZKj0rvFdl4wB/NEpUf6ubP/8QlEW1O0uNogEA3sQFl+W/EfEi
L21HM4MkPBXDc8MHyzB/8wbCsrnHQQ0=
=T+Yj
-----END PGP SIGNATURE-----

--ugqcnc4hp5qdpf6v--
