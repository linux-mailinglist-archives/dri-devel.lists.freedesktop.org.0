Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3A6850F5F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 10:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEFF10E0A5;
	Mon, 12 Feb 2024 09:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="UU+Dz0Pv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1C510E0A5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 09:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=agIpmtZmjTn0iCPZfL+BWytr7HU+ooqFB12nwZhp8tY=; b=UU+Dz0Pv3Lc6S4bZuHQCRaIIbT
 IRelgT8nTR7NxqL9a0QQMyc4MMPKDz5RCfinWlFSwMMP+vUEzH0fFSwdtZNkc8nWqMW1DH3krUDci
 ho8LK9Jb0cMABFcEhzlmliJu3zg5uYJG1HIyRHhktmVUX4sSrdKjEfbLKPAEKC9PCFtd+9jDGFuJu
 CqbBhbxgcOnB/1CHnB2+E6c7tQNO2v71poHtE1JmJpfnl5DN34qwshhPg/6j8MFFW5/EX4Po6dorW
 7jRe2Et5VrxJrpAjvfA4a6uiJ7qWP3trAgLeVLIOqvHxfbNL3lfPSt98gUzr+dOEM/dSwq3v2FIu3
 WesettZw==;
Received: from [194.136.85.206] (port=55636 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rZSKP-0003N7-0P;
 Mon, 12 Feb 2024 11:10:17 +0200
Date: Mon, 12 Feb 2024 11:10:15 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 contact@emersion.fr, sebastian.wick@redhat.com
Subject: Re: [PATCH] drm: document userspace expectations around the
 Colorspace connector property
Message-ID: <20240212111015.2d22f0fa@eldfell>
In-Reply-To: <20240209165307.29856-1-xaver.hugl@kde.org>
References: <20240209165307.29856-1-xaver.hugl@kde.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ufBGtH0IYeNZ2gRdlJeAyWh";
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

--Sig_/ufBGtH0IYeNZ2gRdlJeAyWh
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

While this addition is good, I have another question:

Does "Colorspace" property choose also the RGB->YCbCr matrix that the
driver will use when it happens to use YCbCr signalling?

So far we have only been talking about the primaries and white point.

--Sig_/ufBGtH0IYeNZ2gRdlJeAyWh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXJ4HcACgkQI1/ltBGq
qqc6KRAAhR2LsUsAHRZ+z+shvZm2Lzj89qvtdpWeq8+iouhonROYIIYR9u0y489I
lOrpwONcCdzU5RGj1fDbC9xwLSLiA8XKAPG8liJAU94+s9zOatA84/HXvdS4VzqK
ALaeyradE7aoVUXTEgcwGL7Xo5lX3RcFTvblHoVSTpw4srajBhw7DGlT6qhimXuv
9+h0wVeDm0enLa7dvGlxIapXbZY0QMzgs6rGsCJZRGH7RN/A68tM2lSUsQsghcjW
z51IJyy1g3+UJxnk9HGTqswaetJDoYKD4F2zunIeiu2d21OCDtFR6fNM/BKYvBH6
K+gylpUkTv7tlz9DVNCbS7DaKD0z5PJhbnKhjGiPbwJU9wOyv4RfC/25mpqsEfxI
gKSqOZooJH5O1V5nnaBrZiw0ldCuZ69ngY+lPtnF+aHavpeBka1DfdcbS9z52K8t
aHd6QTmsLcQgyH8UVXhq/BHRrxmLx+8RHk035MLqUO+KxKEStIqBalVwq2FGyUDp
bInOgAtnyikP9pdQXqKk4UjDyRkD/ylhUJ71FNeZxJqCm+jsYgXDC+iTHU5CtYyx
THUSmB1o/EfEkyItdXj+rTyTooViztQMpQ2oJQLOSuJzR0IuKtvh65Su9ahd7+9h
ife3GDRImR5uJDFIhF9xvDDAf1WbzUZL81xdqyiP+cWcLKtmsKw=
=mCsK
-----END PGP SIGNATURE-----

--Sig_/ufBGtH0IYeNZ2gRdlJeAyWh--
