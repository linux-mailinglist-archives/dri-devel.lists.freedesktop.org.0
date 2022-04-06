Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5734F600D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 15:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955CE10E2EE;
	Wed,  6 Apr 2022 13:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A23210E2F7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 13:34:46 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id 17so3269430lji.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 06:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=V90PxnafyyyrLitDFx01gCjLqvEmPMg8reBbGv3nzX8=;
 b=dMC8KZhee89xqoNHh/xcEB6gtyP/V48ohjRqKkPVPBDt86eHLnV2oeNCSnaZIS/URP
 rP+sZU2HaeQGP29hYMnVRUSeMpfPklicHiGNbu8xoCpsoi8NORi1UGoot2//zeUE9pN9
 BFNF/L01Cqg6VvorM6pEngWN44uhFEKXbAAyTG89GfRRhPNVu4gZBlCZt7lmsGeVUZrh
 TLzMvdtz/zw7OFNwyAfCB1RoVBQx8TzjemPHlBZz4ndhjskPnGvCVTmN0dB7TVbM/gQo
 g2FcZOAEFytAyorf13tzXKWGKA6fwUSDIHmogftlU2gUYdaffctCObAaB/UQ6mWzqLm3
 UKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=V90PxnafyyyrLitDFx01gCjLqvEmPMg8reBbGv3nzX8=;
 b=zJUXZ91vZdsAcfWIk9bCUM8+4qPZNfTIODy8fcl9sJasyV2TVqg6mXT53RhFerfnfO
 fjJTeO7Jv7icnSnh68ckiQJXvOtCEyZksWEzXwL0qjvX5TcTfptrBAkxUYDBNsaIRtDE
 RMbZHp5Fv0HZAbfXpVqNaULvfSnPy7/PI0gifYBLasQED4HtjuUQrK6xgHhZYjIZFhU1
 G3ymBjfCEMNYfNU2X6RnRF84MQHug0GTrXFMeR78PdrUYXaFoMThA+aQySU/rTTV0Hc4
 N3+aueZkhRyd5cLf7Ilpi0TPRH9EZequXt470vgwWkmWFNaYZs5wBieGNNcxIwRsYcVt
 eXwQ==
X-Gm-Message-State: AOAM531zml1hLARz5EjcGe4ZYa7epMjMmlUlocrpRJBmBND7X8Q6SFbK
 fYhIh747YoPN28TKYJazgeU=
X-Google-Smtp-Source: ABdhPJx/x6lyQdnpIRycXKcuk4GYHH8nwLJZrsbtHGG5dDG1zDXXnufRnzCG62cI8rElvOLOISaPQQ==
X-Received: by 2002:a2e:a275:0:b0:24a:fe62:5e8d with SMTP id
 k21-20020a2ea275000000b0024afe625e8dmr5593201ljm.416.1649252084224; 
 Wed, 06 Apr 2022 06:34:44 -0700 (PDT)
Received: from orome (pd9e518f7.dip0.t-ipconnect.de. [217.229.24.247])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a19384d000000b0044a20646b2bsm1836476lfj.205.2022.04.06.06.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 06:34:42 -0700 (PDT)
Date: Wed, 6 Apr 2022 15:34:41 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] gpu: host1x: Show all allocated syncpts via debugfs
Message-ID: <Yk2W8XBRFmYdlitz@orome>
References: <20220114140453.83863-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WT2Xb/X6kQ2JXyny"
Content-Disposition: inline
In-Reply-To: <20220114140453.83863-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--WT2Xb/X6kQ2JXyny
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2022 at 02:04:53PM +0000, Jon Hunter wrote:
> When the host1x syncpts status is dumped via the debugfs, syncpts that
> have been allocated but not yet used are not shown and so currently it
> is not possible to see all the allocated syncpts. Update the path for
> dumping the syncpt status via the debugfs to show all allocated syncpts
> even if they have not been used yet. Note that when the syncpt status
> is dumped by the kernel itself for debugging only the active syncpt are
> shown.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpu/host1x/debug.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Applied, thanks.

Thierry

--WT2Xb/X6kQ2JXyny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJNlvAACgkQ3SOs138+
s6EFQxAAvtSZ2jDT2wJjYpay3l9DAsHVlTbhmo9HQ3mHj7Cw2QszY40waIe12TS1
yRWgfL6U0XVfH1yC2uVKwDeA1HroRUuxJEcL6vcvNoZvhtwKIehgAeTbgonxcZWn
bSlGymkAc1TWVbwcAM2EAo7JLN5Q0pABJ12/TUvOcmX/BZTapQmpJYrgGtGwQYnk
6pUmCzxdvXq5U57rdkngklXAHtbXS4q9C4WXCRTFb0JWmuIndboBaEYdawqdx6r3
gfJwnbCqAdHFMauIxcPHOvQXPVcX8u4wGygOkdMGI3brAX3X3x4yMJby/AdJHXYZ
ma36sqKLsPAS2RXulo6ELWKQDeYuQ5DFiOwwbyte5RdNeADncHQX3e7rvBkBHKTB
rlxAKltTAvLGABEdFxQXXASRiQcEbLxTmfNLgbpK+FFZPbYCWoKPcx+o9bngrZVh
QL4oR8cQwDtiqTUlE9QeOGDsNSplkQAFRtF6ekN9gQph/yACRs3F4JDhjtavsuIp
KCIdDpR7SGOc2GWpYTuiXEm9GOS6Cg2kuVB4Lk2GqRSd/mp5OBTglXZXQ1Ol6WED
GKkhEPz8eXaFD68bI0EW1ZFQRKVIW2amjAwV8yjRHyeQx0vHvhyCYdCoj05tIVZ7
ospSYxX39rBSW1jrCG3P3UBg/3IqVZUaPGJsSebOsQwlwgQE8TI=
=FtrS
-----END PGP SIGNATURE-----

--WT2Xb/X6kQ2JXyny--
