Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C440358454
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 15:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82766EADE;
	Thu,  8 Apr 2021 13:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3EF6EADE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 13:13:49 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id r12so2971861ejr.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 06:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ORnP22zy8LvoN6Vu6LgYw2uM6LvPoq/FOOakSRtA/nc=;
 b=KuK/1lB/FSBAtu8ZbhEjVvJQbB6Xng5UiURnhScURFCEOcy+DgdaPqdtt1lzhs/Vgu
 IypVnWVth+wlFQ6/tXt4hXpU55G5FLXt7y5pVRYL9BduuDBnJjiKDx8/6SCNsIGGJLDf
 c6S4sn5pMw7F2SwNCOfLrLH/73Uaq+moVOgDEjV0SECHB2aRbotk7HldVhRGequQRUom
 A8On1kGXIQZt5FsfSf/mMFFPV2lkppv1O5UlqoM8ZOl8unoZXmAKHmInQ70QJqcE/KYN
 kmWyKfajv7UV769vQ/JhHnEnkPAafEukL9Bp1rTmsyrQ5Fd3ClAwMrUdJSkP5TMyxcN6
 LZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ORnP22zy8LvoN6Vu6LgYw2uM6LvPoq/FOOakSRtA/nc=;
 b=NbYv9nFulIu5fy6El2YNQcG9xoFN//eV9uinPzPtrf5nl3avw7Kswc3AjoDfV9BlqY
 Bofcs80kA2jGub7WY4d4CpXLi1VusUa00qlRKiMEwrD6/weGNWguVnOjkL5uMN7M4DSZ
 6JWDWbetk3C+OIjxAlEPxe01jNaVR7Oari+HY7ccPWDxuXqRgPKBJtaqo2njcWop890I
 EJOA5zsvMk5wMF9HX9RniS+k2SBhMQYSx1HEVKM+46fHvOcLJgmRAfMdzh/jc2La2ShX
 P9vf+Tm+irzMQW2mRCRWCQJMlOWHbfMqgELwqMTx6n/4elppa4mqIlAznkPdecG8Rcmn
 qsMw==
X-Gm-Message-State: AOAM5331HI05UCdpOBmxecOx9EMjt48Rs2mVN80twe6jNx0GPSEHvpFw
 NREG4TvI/99/xWNPf/7/Cd4=
X-Google-Smtp-Source: ABdhPJznXYjOCMyfm018yESs3U9GslqjR0p43VPV8g/LUGhePUpX0KIRm/szFgxKi0Pamq6bndWqHw==
X-Received: by 2002:a17:906:a84e:: with SMTP id
 dx14mr10525890ejb.332.1617887628411; 
 Thu, 08 Apr 2021 06:13:48 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id rk1sm10014019ejb.88.2021.04.08.06.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 06:13:46 -0700 (PDT)
Date: Thu, 8 Apr 2021 15:14:21 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Carlis <llyz108@163.com>
Subject: Re: [PATCH] drm/panel: tpo-td043mtea1: convert sysfs snprintf to
 sysfs_emit
Message-ID: <YG8BrQHbhiaxl9Yo@orome.fritz.box>
References: <20210408083118.557966-1-llyz108@163.com>
MIME-Version: 1.0
In-Reply-To: <20210408083118.557966-1-llyz108@163.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Xuezhi Zhang <zhangxuezhi1@yulong.com>,
 sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============2114839204=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2114839204==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iW+l5Rq0Obxe6tJ6"
Content-Disposition: inline


--iW+l5Rq0Obxe6tJ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 08:31:18AM +0000, Carlis wrote:
> From: Xuezhi Zhang <zhangxuezhi1@yulong.com>
>=20
> Fix the following coccicheck warning:
> drivers/gpu/drm//panel/panel-tpo-td043mtea1.c:217:8-16:=20
> WARNING: use scnprintf or sprintf
> drivers/gpu/drm//panel/panel-tpo-td043mtea1.c:189:8-16:=20
> WARNING: use scnprintf or sprintf
>=20
> Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
> ---
>  drivers/gpu/drm/panel/panel-tpo-td043mtea1.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--iW+l5Rq0Obxe6tJ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBvAa0ACgkQ3SOs138+
s6FHrBAAgrJO/HTk7DOFWultZrY/kAAAIYXxpOImF+Rc8zyUMN4hdnoATntvIGeN
s27b6P3IKWoCWZN0X/1a/kpvD0m5T/dgGO0STiwPwv9FcF9vLsHgrKo3wAnTT4v4
LlRfyATP+jRVZcuQDeXmGfoiLb+4y5yJj9u2g020fmUcLeTSLHeFMU0s3rXzlcz/
Vs3R7oGEUnvQ/azSiuGDg7kiX3WqHTDEHCPoiHqXz5RaKv1lJHCR1kOv4q4ZdEri
+6OHGTCuEt5JdYYAlJbtaEcumuAQqVg6YEFwEUWxJtHsVxxecwG6iWSaLHq/E2Ht
Zr+FrfixwG3AcZ7ofnzQ9jI8HWZ72gf/LfPiYBEMRoCzGloE6xIw3SF3CrbiTE1H
kk1zHfXvnkdqwrC5lwRPTPSe7jRqTpR+Kcw4G1Y3Fxu5KtPUMeaov4LQhG8BClU6
0gPEU7p5RaZuzPaAE/kinxlrz8LK8BJn87DD+DkdU8flDSEadq0JZvB/gH+7Oh8H
magjg7Ftva+ervLRUkTLcLgNpySklTa6BhR9tgNfiPV4hTyVLFc4BhqZYBXdeiLT
VbMc697uEeJJVwATCJ+NSaRvHe1XvGW1b+YLBAW6FtxqaaTmJHADW5qEZSbx5WkY
U1dvSvF82rR7gm7SEF5uTcwjaQbm+Xl8HofXCBTPrFV6ugSyPzM=
=tEPk
-----END PGP SIGNATURE-----

--iW+l5Rq0Obxe6tJ6--

--===============2114839204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2114839204==--
