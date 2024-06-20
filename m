Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D0E9106D2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 15:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77F510EA13;
	Thu, 20 Jun 2024 13:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JcDLM82l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699A310EA13
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 13:52:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ADAF061DFA;
 Thu, 20 Jun 2024 13:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107C1C2BD10;
 Thu, 20 Jun 2024 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718891572;
 bh=oFVu9TzxFmLBCdttfVPTPbiSHB+vI2laulzcPKjzLfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JcDLM82l4s2FVt1gK7bkuVRKBX4WHsdnrPsrWD/e0m38Wy60Y6zs7DJVTUX7uQgP7
 Fw28XQiGwYtBECCxm59JoDOUkmAQbo51SoUM8qB9ItA1GEjMP6oO611X4VJbP0Csjl
 bVtrCFJPOu9XLV21QheVLhK0VeM+K98hnttnxjdFWAX+WZm18uuhbs0+COsDFRDufI
 7/qULjiRM/nSQ/4Jgq3MWSpDFrcPBYkiD4HqbiQ0ANsxvylE6GWdrI62L6E4CGHeWO
 jTk6tbABEF8HNT6FAI+pITvXqvhOoTMAFpkuXsSBIFE7SuW7B+YojeM8YYfkChW5XE
 NPq1GeICjzvOQ==
Date: Thu, 20 Jun 2024 15:52:49 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] MAINTAINERS: drm : vc4: Add Raspberry Pi as
 maintainers
Message-ID: <20240620-optimistic-kittiwake-of-vitality-f1ae20@houat>
References: <20240620111401.3629380-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="45odzivgl6x45mzw"
Content-Disposition: inline
In-Reply-To: <20240620111401.3629380-1-dave.stevenson@raspberrypi.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--45odzivgl6x45mzw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 12:14:00PM GMT, Dave Stevenson wrote:
> Add myself and our kernel maintenance list as maintainers for
> VC4 alongside Maxime.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1566c647a50..b6dd628d5bc6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7520,6 +7520,8 @@ F:	include/uapi/drm/v3d_drm.h
> =20
>  DRM DRIVERS FOR VC4
>  M:	Maxime Ripard <mripard@kernel.org>
> +M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
> +M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>

I don't think we can put a list as maintainer, maintainers (and
reviewers) should be explicit. We can definitely put the list as Cc with
L: though :)

Maxime

--45odzivgl6x45mzw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnQ0MQAKCRDj7w1vZxhR
xSJFAQDCChAVHIDwMR8t2lvlKH9aoHB0G9tPduveXc+6HduzOQD/b/FRw5n/vqGa
2AJCFSd6MrrPu77xfkMS1TIitEPAtAQ=
=NoS2
-----END PGP SIGNATURE-----

--45odzivgl6x45mzw--
