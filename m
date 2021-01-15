Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9F22F807F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 17:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF476E103;
	Fri, 15 Jan 2021 16:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B25A6E103
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 16:19:51 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v15so6189976wrx.4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 08:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LQ5pysIVvzw8UX1UVpnBr2BWl784HQLa7ZmK6MgcSpo=;
 b=tww0XAuPvVbDK+WWtsDaZEScz9oQkN3cjZ2TS9pg9O+NMTccvAkPCVr7ff2yJhuKv4
 fkTK4OBt39yFcIY10N2KteXDjkXyPNevhByoNigCms8WX03271Cv8ylQ7u9gGGFqdG3D
 nFULY5C/c5NA4CdnCGa4UxkcklnDDsnogr2hPhCCf1qtz27iiBdKoOuuhlO9WEpom8eW
 MqUO3imEtvHugDsAMVpmQv4+HsO+ES5SxPSdLxX1EmHW+C4/HfXK77ovSo/WfR62shz0
 4I3h/ZAh8tZug/rXD3Ot+7WXQ9awwtcsfSWEVE5NpRR/fr86hH2CTQoqwpZ728LIavL7
 KMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LQ5pysIVvzw8UX1UVpnBr2BWl784HQLa7ZmK6MgcSpo=;
 b=uTR2jPyb7YirM628/3EuowSWJJCzucC5YeMxN09GTzUj+OPK+ghrPRckvkG+fUYcsE
 c8AU0zr9F3xbNCSFjSSvssT40Kye9WSgRnwE6X+09tJirIvJJ7QYcQzIV/OwZG77Mrt5
 oEwL+UtwGJdfih7ezYhCK/yvndSyBGF/hpdH+UEm9gfDkS3rWqQcyIEucG2f3e//jccd
 Pe8TEe4Jb7vO8V1d+mH5UD7zMc7wVGrFQxrF7yyhhyHm9KwKVjyESOpLqXl342Zwzj8I
 W98NI/QETBCcJGA4FPkQZqjYsgJH7M88mNVYOpLm/DBuSRc7pw+Myjo+1FnR8D9aOD+/
 QFgw==
X-Gm-Message-State: AOAM5339gv2CRqO6EGoNTmV2Y+rpMaGcvAPeBxtj47A6fajGiw7Q1rp4
 6EKkvHxriHKIM4uB+HBuUwo=
X-Google-Smtp-Source: ABdhPJxOcIAfog89Q/+yn3+tZjESlYiessSXAArWffiF9meVS777/7pJkL5OXfgb/pwoUWpv0RUd+g==
X-Received: by 2002:adf:d231:: with SMTP id k17mr12831128wrh.264.1610727590150; 
 Fri, 15 Jan 2021 08:19:50 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id b3sm9576381wrn.70.2021.01.15.08.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:19:49 -0800 (PST)
Date: Fri, 15 Jan 2021 17:19:48 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/3] drm/tegra: gr2d: Add compatible for Tegra114
Message-ID: <YAHApJNZG5rE/uMQ@ulmo>
References: <20210112181421.21293-1-digetx@gmail.com>
 <20210112181421.21293-4-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210112181421.21293-4-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
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
Cc: linux-tegra@vger.kernel.org, Anton Bambura <jenneron@protonmail.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: multipart/mixed; boundary="===============1045924755=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1045924755==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JDyQh/XtqKkzYXWz"
Content-Disposition: inline


--JDyQh/XtqKkzYXWz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 09:14:21PM +0300, Dmitry Osipenko wrote:
> Tegra114 has GR2D hardware block, support it by the 2D driver.
>=20
> Tested-by: Anton Bambura <jenneron@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/drm.c  | 1 +
>  drivers/gpu/drm/tegra/gr2d.c | 5 +++++
>  2 files changed, 6 insertions(+)

Applied, thanks.

Thierry

--JDyQh/XtqKkzYXWz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABwKMACgkQ3SOs138+
s6E9KQ//Ww3t+ff5EPjesX5CUsgT3goZAgU6gMacwUgKCY24A/LzPtxVd5WEsG91
hUHyGHagXTnxMvA+5yNK1tGQiYKoQsCIsgbWCz8J/3JWo73++L+5Bcwrywy5vD35
CkkQsO0pXlCrEBlyIq++/EksW6MqaiAJwQJl5+vmHw3NLZT83Nkj4a1pwmNMFZyC
gpk99GsI9awRM8Xvc2+3gJ5z7FjGwjRQUOG5178yXtEwpIRlD6o1IbYmTzTu7Hyr
tki4JeeGXMblp26ON3D6jNda3LNhbIPimNKb/DI8a0GcNBH8YpZD54VW6QR0ykHK
qIHjqaXkIf6tvxPlU9MritvQSZvzxHgRL+XRQtonmBvoxgBbAX+BcEsT6TMnwb3j
WXZKzz7lOVCw2TUBST/j2A52JZfuADv3wVM24TQI8dEW/PzLAossA8rltjY/dboS
wMJ8SYWRva7qJQileioo40oPwpewbnsoijSK3ZrBCo9dTNIXVafjHjfc/M0kGCc8
E7i894+klC/TvCaIG3VVK9BT12ZO+O6VbPRL+h2F7qhxguMGYlF7Lcn8Fk91ZToq
LR+Tn/OUtKo75mvPneuanPOTCtNIJ6OMIPfN8DcJ6cEhA2cSAcsmbas/UV86CuQB
sZZ2J7RyzABBsMl+5lmhdxsWlspZT18AewYLL9tAT7RYi8wpY10=
=7Yfs
-----END PGP SIGNATURE-----

--JDyQh/XtqKkzYXWz--

--===============1045924755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1045924755==--
