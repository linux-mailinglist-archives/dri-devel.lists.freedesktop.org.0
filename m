Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5D7850F0D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 09:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7141C10E03A;
	Mon, 12 Feb 2024 08:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="fQdMmeIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B60210E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 08:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EuNggq+azN/d4DUim7Y3SUc/9/QLyzMSTboMTlt+rhM=; b=fQdMmeINIw/OVcHaw06BpgUPDl
 fw5dQ6HI/JQ7zkRBwx5o//kaJ4pgKMTqEVZYM+6WX4aiAezuJZg6YoEK3GLFB9+Klm3KAAhaXP/JI
 PwhjV5/Yl/ptsR7PKiyxkcJ1leGX/BohehwAutxt9ZX/EF5EOYfmXlWSyl/8jsrVbHn0D9fUdsUCM
 iDO6CBt5kzlinKJGMuCrBQLd+bdBgvBua5Xt2oGn1LCO33QCfoKk8d2Ms5HtslUj8qRCrzNEKU+KL
 YXA7v42c1UhxUSGXr0CaWIWbt+/jDa1R55mL7Qh4fTE/mwPSsYWZrsDkzNq1xTFxBQGIVd71tgxog
 etSMr1BA==;
Received: from [194.136.85.206] (port=52286 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rZRxV-0004fe-2j;
 Mon, 12 Feb 2024 10:46:37 +0200
Date: Mon, 12 Feb 2024 10:46:36 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 contact@emersion.fr, sebastian.wick@redhat.com
Subject: Re: [PATCH] drm: document userspace expectations around the
 Colorspace connector property
Message-ID: <20240212104636.5a411226@eldfell>
In-Reply-To: <20240209165307.29856-1-xaver.hugl@kde.org>
References: <20240209165307.29856-1-xaver.hugl@kde.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LCW_TU_jfeMT7rE1RMr6441";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/LCW_TU_jfeMT7rE1RMr6441
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri,  9 Feb 2024 17:53:07 +0100
Xaver Hugl <xaver.hugl@kde.org> wrote:

> Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
> ---
>  drivers/gpu/drm/drm_connector.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index b0516505f7ae..01e13984629b 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2158,6 +2158,14 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_propert=
y);
>   *     one supported. Sink supported colorspaces should be retrieved by
>   *     userspace from EDID and driver will not explicitly expose them.
>   *
> + *     As userspace can't currently know whether or not the output is us=
ing
> + *     RGB or YCC signalling, the driver must translate properties to th=
eir
> + *     relevant RGB or YCC counterparts, depending on the actually used
> + *     signalling. Property values that are only valid for either YCC or=
 RGB
> + *     and have no equivalent for the other signalling type must not be
> + *     exposed as supported, unless the driver can guarantee it never us=
es
> + *     the signalling that doesn't match the property.
> + *
>   *     Basically the expectation from userspace is:
>   *      - Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
>   *        colorspace

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/LCW_TU_jfeMT7rE1RMr6441
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXJ2uwACgkQI1/ltBGq
qqdGew//dpu8QJgwrjxKBt8fQ8UjZY2nbRQZXHfNBkuqKpX4U1LsoxfqgHCL9e8/
SGlobXM93e0riX7v+1Tkm5YSWv/Nbirdg26dHLg6Qs5AxMQsK41ayKyS9KZeagXw
1d1lSrb4IASlGAp9OEkrBXm4QOsDfzqqtF8U6mWyQN0RJhkmnKIR3F13+EH3Kioa
sCLM8jsYgGr56o6Lma8Vi5vyGS4B0FL3+3xWN6u86Q8zZZRnLMb6BxCVSPddVZfJ
xAgN6rSYFzONYCLaLFj0N6GHMyTgAV1kBUlvtGA8W0mkpIge0MpE1Ui7wlKAviBq
Z0Q3p6O+0NpO73bvgm+heYDtuv3YkQkFePt8dmgqGEwxsh34spEcasvLj0B9S6jp
4SmSY3hVqzldOZ4k+09xVvOimvSFXy3xrGYZ9Z75/Yfd+2HU4B8OU9BLQhwodQhg
r7MV1ZUXKzTxy5WEPDSYmDz4eeGqxU0vS0QC89tJXp2BVfdmNsuWHR8dBrAEfK30
o6ewRIjKQ7TufwulvCHvC+D57BtkK29BjGMxFZwrYxhiCmRq1Lxl0yjEFola2NN3
3PAvi4XqcY+WP7YOEogCrWR0iGN3nNh6Kl3R8LhJv8EAUoRWl+ZB8CGX8m8tyAtv
DZeORkHatRTlW7IuW6Oy3GeCist9xe6+zGis12ts+zuCSH7w+qs=
=ruZy
-----END PGP SIGNATURE-----

--Sig_/LCW_TU_jfeMT7rE1RMr6441--
