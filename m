Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D587B167B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 10:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F415C10E039;
	Thu, 28 Sep 2023 08:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3129D10E039
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 08:54:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7C222B81B7B;
 Thu, 28 Sep 2023 08:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FE2C433C7;
 Thu, 28 Sep 2023 08:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695891244;
 bh=/Y/YLIi4rLlaX9qo7IT6ffy1/nl+3oL3sxDtAxfHEfA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OVeH9GsQ2YHlWLStVAxAB54acZ+8Po4YcSanosrsAxxCnjITyEN9ACkQ8zuVI/C77
 2V9P830OYSczHLweQIGfs82CgepJ5xDwX+np49sVdu/nXrBaTpsuJaysivFb+DxEGv
 HNjl+aW1+YSIkLJCRWedIReKecqUnUnG4lOX+RMbocA0l60SXOb/rs6oggTJJ3J4Ed
 0KQ6jpzt8zpc+y6BzB1bX9tY02I4Irz0bZ39kYGxBrQmaEpM/zdbDDfYe5xdYRbknd
 FVKe9uoZXjHcX5944AWTIOjO9prwFw0+FU5mMUq+o85VwANmSGDNkJKtT89Bvpq7xq
 dOxIQGBQ69jlQ==
Date: Thu, 28 Sep 2023 10:54:02 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] MAINTAINERS: Document that the NXP i.MX 8MQ DCSS driver
 goes thru drm-misc
Message-ID: <nbb7m32cjtxxqnonouh6wl3qswfcuhkmycnkgvn4njxvjd76et@udnxb3lenbyi>
References: <20230925154929.1.I3287e895ce8e68d41b458494a49a1b5ec5c71013@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kayxkznrfb6sydgg"
Content-Disposition: inline
In-Reply-To: <20230925154929.1.I3287e895ce8e68d41b458494a49a1b5ec5c71013@changeid>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kayxkznrfb6sydgg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 25, 2023 at 03:49:29PM -0700, Douglas Anderson wrote:
> As per the discussion on the lists [1], changes to this driver
> generally flow through drm-misc. Add a tag in MAINTAINERS to document
> this
>=20
> [1] https://lore.kernel.org/r/20230925054710.r3guqn5jzdl4giwd@fsr-ub1664-=
121.ea.freescale.net
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>


Applied to drm-misc-next, thanks!

This was somewhat conflicting with
https://lore.kernel.org/all/20230921105743.2611263-1-mripard@kernel.org/

So I removed the imx exclusion from that patch too.

Maxime

--kayxkznrfb6sydgg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZRU/KgAKCRDj7w1vZxhR
xWaNAPsHpEEbK5oADf0lboe90NZgx4zw6MmYBN7miPnJCZU1FgEAkt/61t0jhq5R
9Tsudpyj4W8o3p2r9sifIQX1piXShg0=
=mzDY
-----END PGP SIGNATURE-----

--kayxkznrfb6sydgg--
