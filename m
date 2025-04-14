Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A962A87E69
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 13:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE56310E31C;
	Mon, 14 Apr 2025 11:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PzbqJ5i5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DC910E31C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744628813;
 bh=Hmwdrg0iZvmYG9Goojwh5vjC2nIZBLeUaKF7tI+NUKQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PzbqJ5i5GMWW6qUgY9nkvjSO6jvTnoiJ/WLjSEkmZMvBm00o9ANsTD4UBw/ebTpk1
 YgoPWhCSylQ0A8XfWMTS4XtPAW0nfm8LZGJsugV570bA/zLTQ5erWN4x3Hpq7MHKRu
 TC/YFO+UKc2FYTh6j//YdOL9LSElZTu/Mt7ZKc6zlXEGlBAU1sMdBO6eaqTDG99gXK
 ra5rWXnPbCo1Pyk9zsrdcj7nxFJUl05bXYL+WTNh0GF8Ppuo80SH7HUdjD+klaff0j
 wbKF/0+VHfRQjyiFlzGJr4EoJzVc/OIzLaTTu1nY5TtujW+owDN/qjY4d2wZKzdmN7
 DdLc0nnnKpLJQ==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EC6317E1034;
 Mon, 14 Apr 2025 13:06:53 +0200 (CEST)
Date: Mon, 14 Apr 2025 14:06:38 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2] drm/doc: document front-buffer rendering
Message-ID: <20250414140638.49fa3f08@eldfell>
In-Reply-To: <20250414085652.43904-1-contact@emersion.fr>
References: <20250414085652.43904-1-contact@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EKZl4aJtLg4S0YXOe2Q2GWH";
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

--Sig_/EKZl4aJtLg4S0YXOe2Q2GWH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Apr 2025 08:56:56 +0000
Simon Ser <contact@emersion.fr> wrote:

> Explain how to perform front-buffer rendering.
>=20
> v2: apply Pekka's rewrite
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_blend.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 6e74de833466..4e83f372ea51 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -75,6 +75,12 @@
>   * 	the currently visible vertical area of the &drm_crtc.
>   * FB_ID:
>   * 	Mode object ID of the &drm_framebuffer this plane should scan out.
> + *
> + *	When a KMS client is perfoming front-buffer rendering, it should set
> + *	FB_ID to the same front-buffer FB on each atomic commit. This implies
> + *	to the driver that it needs to re-read the same FB again. Otherwise
> + *	drivers which do not employ continuously repeated scanout cycles might
> + *	not update the screen.
>   * CRTC_ID:
>   * 	Mode object ID of the &drm_crtc this plane should be connected to.
>   *

Looking good, but given the new wording is 100% mine, not sure I can
give reviewed-by?

Co-authored-by maybe?


Thanks,
pq

--Sig_/EKZl4aJtLg4S0YXOe2Q2GWH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmf87D4ACgkQI1/ltBGq
qqeHNA/9HKP7HaYNsiU57+z7VFcTlCsJ0D17TWmeYWX6Stv4UpKmQ0JWHtap3pFQ
hBdc8FrsW/4pYPYKrXVZlwLE6+uRceXS1539G4vH+qkbRPTee1mWeDeDcnzrzYH2
z5hcjcmJVFeJC5str9Kj2Byum3m/4MQqkveqy0r/s4f7cvshx/YcpYz9DlVR5kI0
iy26TMejt65bnSydREZ/2spmEeE32wfTQMF+Yg0dtevrYrSL8/xvFZLCNNtgxNW7
GsTL3OG8jzdEMJrGRvRbZTxP51GH/aVzcsLyMqUqv+aUyjjwETnxGcCmec0TNHhx
KS304QqLITeEJay98mssuWKT/SMlzuK/q24ybq/1JVZi8vtOgO3N+ptSfAjCK0c4
0nCfg4QcEJgEID+XanzHLJzkNoaGZIybnrHNvAmWi01an7y5qhD3qbFi/aOUa9ub
MD2pXpFh9M5zp45q0eAKiGr6ZBzyHkdzqsJvaFI+zkTCW47UrxQBLqE050HrvDmm
TWNncFTiqFln5XsNaTILocQp8tMZYsad4cWOXWZT6zfZdtsu4qBgV+kUvCANFNE5
wuLjDfWpf424c7DfBCoIxJA5fd/Bmc+7Akji2iXDcaF5N80UUxys4RbHV/rnLRyj
bMP5htSDK+lpCdB/IhRNf5YHQEs1CouOW4+JD2rGzmszIe8465A=
=BxOd
-----END PGP SIGNATURE-----

--Sig_/EKZl4aJtLg4S0YXOe2Q2GWH--
