Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 270D754831D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 11:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEF610E047;
	Mon, 13 Jun 2022 09:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F4F10E047
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MEL5DS0eisNERPPTvN+7r0EBXpeTnXMy7Oai9HNn+Wg=; b=MCqM2X7RM26GpCYEj74b/XZbeE
 Uf0SXov50kDFdkC2ihtgf7zTbcoa4RJRvy8ZoGoR0ZyeKceC6I/J5AKeEkxoPmjUbJyZQFUQOvC8S
 WXefaEWhMPa6TbrACOWoREcpFDMPhEdH7rVskcbO3yNXtXqGthZ5qsyZLtdKDtyApZiA/45o3BuIP
 jGxu1ZLKL/gsQjxnSSQeEi9r6UWi6hgqhyBfolB5cBgGJvzfyjQM//BTQ3gK2oJTTBJYhBPHYoNy3
 Gq4GgnP8pO6X5k6/9XJb2AI7d02dAYha6H6aPZbEuRuiUNlOrt3p0AcQszaGEctpBNo1yeUIBs4pW
 tksjZ/WQ==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1o0gSG-000P7j-1J; Mon, 13 Jun 2022 11:33:52 +0200
Date: Mon, 13 Jun 2022 08:33:38 -0100
From: Melissa Wen <mwen@igalia.com>
To: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/vkms: check plane_composer->map[0] before
 using it
Message-ID: <20220613093322.zpikmetwdptzt7iz@mail.igalia.com>
References: <20220415111300.61013-1-tales.aparecida@gmail.com>
 <20220415111300.61013-2-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bkggbyddtyrzuax4"
Content-Disposition: inline
In-Reply-To: <20220415111300.61013-2-tales.aparecida@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bkggbyddtyrzuax4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04/15, Tales Lelo da Aparecida wrote:
> Fix a copypasta error. The caller of compose_plane() already checks
> primary_composer->map. In contrast, plane_composer->map is never
> verified here before handling.
>=20
> Fixes: 7938f4218168 ("dma-buf-map: Rename to iosys-map")
> Reviewed-by: Andr=E9 Almeida <andrealmeid@riseup.net>
> Signed-off-by: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
> ---
> v2: detail the commit message with more information
>=20
>  drivers/gpu/drm/vkms/vkms_composer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index c6a1036bf2ea..b47ac170108c 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -157,7 +157,7 @@ static void compose_plane(struct vkms_composer *prima=
ry_composer,
>  	void *vaddr;
>  	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
> =20
> -	if (WARN_ON(iosys_map_is_null(&primary_composer->map[0])))
> +	if (WARN_ON(iosys_map_is_null(&plane_composer->map[0])))
>  		return;

I cherry-picked this one and applied to drm-misc-next.

Thanks,

Melissa

> =20
>  	vaddr =3D plane_composer->map[0].vaddr;
> --=20
> 2.35.1
>=20

--bkggbyddtyrzuax4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmKnBHIACgkQwqF3j0dL
ehyPXA//ZOSSI3d6rcOd682oWAZsvh9K8dCpKcS75nKQgBx89u1E3s44VwKZp7uB
+zeIOO07h74t7cKiF33fvCAVyIVSfpV1jMCueclTrxsz1p+DIl2Aq91tnv46WXwa
6URbiuUez8MO7yRZBZAfD5yEp6IOzrI46/QSrLgGKCnCOLgZzO+/stRypjZ9YMfp
RdfUHFUybX8bbHagQc7qXYdReN7PsLz1GjB1vHlbHwar5ScAoNdQ/QBCP0vtNNS3
j0vee4qWmXPvh3gcRbK2YAgeFAzCbORNKQ97WE2sHLuhEP14cFB2ydvb87k7guvd
qmhk49y0ONOAq7LAqqXuR+5rAmw493JbAjcrtOovBKhwsEIRGe+BiRzflbdevtE1
u/WUQd3lERv0JNQiLjO41rzhQTD2SWwxkT/zPeYnn7TitBqAOTFddmszW2kOG8V8
00UN32TOFNEOSqWclGMQzyNdL/dq9egtiH+Mu9KQyVg2EtieRzND22CxaUR6NU9W
nkXbJqwaTUUoMnWyOkCHPu3D4zyc5JXGDS7HhLNI9rmj5LR1rRzRqg3ZSYBLPp22
fYCeuZ3+AY9NMKhoq6ZRh1ayVrfYgxAg5l6sjgYTl8FEaLyAFBtMyzl0jVoNnRzK
cqwXzIYvwGSTHJVaLG2ROLyFJsV5dmSO4e0V9Y8+1hR0gkBRsQc=
=5Ak+
-----END PGP SIGNATURE-----

--bkggbyddtyrzuax4--
