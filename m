Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB339A2D3EB
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 06:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7758510E1BF;
	Sat,  8 Feb 2025 05:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="k+gmPzKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC6910E1BF
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 04:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1738990704;
 bh=/29YvJfNYx4cOak9f0BCdC7DkksatuIrpDsCdCnsKvg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k+gmPzKf9ByrFYBr/1+WehnEB+als8wu9hFN1WGY9kZ2eHPyx2vk5Mum1xbVk0TlM
 mvUWi4P0YxVGCjuurPmmaxpJdWbZ/0wI6V70lLm6tVtQ2cDgO20mpVYWkGJkus4cE6
 nx022O/6VnFdRCwP9Dsuqnrd+JQw/kf3LY/WQwlS1CTc3EiaDV8VbesVw/Q9fsb5Ar
 m0geuKcUd6kN0jROqSb1b2/KmdDZhqN1Za90XnmaDoKPYT4ps0xnXV1sZdb07AOcgy
 VyaaAUawWFQaBlOhwCFjHu4MIKEwhaxUB1R/uiCwM/PLvK/Q0Rec7LRV4tu2q9HpZJ
 i/pbavZn76S2Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yqdrv20v3z4wcy;
 Sat,  8 Feb 2025 15:58:23 +1100 (AEDT)
Date: Sat, 8 Feb 2025 15:58:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: writeback: Fix kernel doc name
Message-ID: <20250208155831.762f3d5e@canb.auug.org.au>
In-Reply-To: <20250207-b4-fix-warning-v1-1-b4964beb60a3@bootlin.com>
References: <20250207-b4-fix-warning-v1-1-b4964beb60a3@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WzKXaXyQPu0/ayuViPhSa4N";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/WzKXaXyQPu0/ayuViPhSa4N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Louis,

On Fri, 07 Feb 2025 18:35:22 +0100 Louis Chauvet <louis.chauvet@bootlin.com=
> wrote:
>
> During the creation of drmm_ variants for writeback connector, one
> function was renamed, but not the kernel doc.
>=20
> To remove the warning, use the proper name in kernel doc.
>=20
> Fixes: 135d8fc7af44 ("drm: writeback: Create an helper for drm_writeback_=
connector initialization")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20250207142201.550ce870@canb.auug.org=
.au/
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
> Hi,
>=20
> I don't know the process to merge fixes for commits in linux-next. If I
> should apply this patch, where should I it be? drm-misc-next-fixes and
> drm-fixes does not contains the problematic patch.

The above commit (135d8fc7af44) is (or was yesterday) in the drm-misc
tree in linux-next
(https://gitlab.freedesktop.org/drm/misc/kernel.git#for-linux-next).

So this fix should be applied to that branch/tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/WzKXaXyQPu0/ayuViPhSa4N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmem5HcACgkQAVBC80lX
0GzaGAf/bvNGTPPN/BCbc74C1yNh57GJPpii/IoQJBF0sstFg23ShkvQ3qE0HK7n
TIZH6p6V1KlI32TfEmVN1mtxVa1rm5lDpHd4XOpWKt/Ufa6ezAb1mTpWTANjIkgI
POvDcwu1EUstMNloSSDQxGCkHDxZnyP1JIsH7QYd/4YE2vzPfCoq1/+J4O9CTIQG
80XM4YXXyHYgxWhPXh41NaeXcL9lxhCviVw/nzmKhDjDJbh8f2U+eoYKaQOhWUcB
P+Glt4ZqGfffHSVJYfHsbUKHyrcvPrBm2Uhk1y+qlYxjPECMj02ZkU74w0jf6IfJ
kUOo+RB4d/AQJky928ezyx2HUiuf2w==
=enLQ
-----END PGP SIGNATURE-----

--Sig_/WzKXaXyQPu0/ayuViPhSa4N--
