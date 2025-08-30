Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88885B3CF67
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 22:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027B210E029;
	Sat, 30 Aug 2025 20:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="KpA68xaP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EDC10E029
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 20:56:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756587368; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=C80znvS6HLmQAR2Xqx2p569m7XK5YZhrcbQcKf/Yn94kJSD2gp1i0Rz4AZAC5ruC+LyUVfwavPbr0CNUuC9Ph0LaVbjwoxIt14uKkgCjit+yDbimkUj59ED/q9Y21J05sYFRnkRn0o4d2h6b52IAjM8lsct85yZdszmg0ntznvc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756587368;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=CdVeq+DH8Ok61ytouQu7G9Bwf3CEvXSVj4Eaz6xQmas=; 
 b=e5vzX8Chj+/Lu12XCMK5TohKDcIYhhgxnvS0ofRnlz9o7UpVmcyCuXGokdTN1TJIavEk4QVklmLfWMl948BnoPDR8CRaokzBhw5SFlpAl+hXDW8sDjxD4/aGMBn/Z8CEpYElmvMXXxyVUmNCbSPuFObsnO6Em4oXbF5JCFJLKAE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756587368; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=CdVeq+DH8Ok61ytouQu7G9Bwf3CEvXSVj4Eaz6xQmas=;
 b=KpA68xaPVh5VW42eEhcQOtvZo3Q3fZSv+V5Dt+9oiUS7gwaqusjKNf2maGPpjrGD
 3uZBq/0EnVtpM6r7oedBPZYQcCFNtQJprZllgSAVLoZKP6CllbYgHqDR4KUNFHw0I/b
 ygIU22VEXNh59NC7KnzcHpwgqKvEiXsXx78WT0A8=
Received: by mx.zohomail.com with SMTPS id 1756587363738235.87912575851544;
 Sat, 30 Aug 2025 13:56:03 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
 id C76E4180F91; Sat, 30 Aug 2025 22:55:58 +0200 (CEST)
Date: Sat, 30 Aug 2025 22:55:58 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/rockchip: analogix_dp: Apply
 devm_clk_get_optional() for &rockchip_dp_device.grfclk
Message-ID: <vtpva7fgzwgde3sgtjir4ckns2yak7kmrumgccutwbupyqxyjt@zmxbatrhiaoo>
References: <20250824065441.3220852-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xhy3y75flbopwu4h"
Content-Disposition: inline
In-Reply-To: <20250824065441.3220852-1-damon.ding@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/256.549.67
X-ZohoMailClient: External
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


--xhy3y75flbopwu4h
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/rockchip: analogix_dp: Apply
 devm_clk_get_optional() for &rockchip_dp_device.grfclk
MIME-Version: 1.0

Hi,

On Sun, Aug 24, 2025 at 02:54:41PM +0800, Damon Ding wrote:
> The "grf" clock is optional for Rockchip eDP controller(RK3399 needs
> while RK3288 and RK3588 do not).
>=20
> It can make the code more consice to use devm_clk_get_optional()
> instead of devm_clk_get() with extra checks.
>=20
> In addtion, DRM_DEV_ERROR() is replaced by dev_err_probe().
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>=20
> ------

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>=20
> Changes in v2:
> - Replace DRM_DEV_ERROR() with dev_err_probe().
> ---
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index d30f0983a53a..937f83cf42fc 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -335,15 +335,9 @@ static int rockchip_dp_of_probe(struct rockchip_dp_d=
evice *dp)
>  		return PTR_ERR(dp->grf);
>  	}
> =20
> -	dp->grfclk =3D devm_clk_get(dev, "grf");
> -	if (PTR_ERR(dp->grfclk) =3D=3D -ENOENT) {
> -		dp->grfclk =3D NULL;
> -	} else if (PTR_ERR(dp->grfclk) =3D=3D -EPROBE_DEFER) {
> -		return -EPROBE_DEFER;
> -	} else if (IS_ERR(dp->grfclk)) {
> -		DRM_DEV_ERROR(dev, "failed to get grf clock\n");
> -		return PTR_ERR(dp->grfclk);
> -	}
> +	dp->grfclk =3D devm_clk_get_optional(dev, "grf");
> +	if (IS_ERR(dp->grfclk))
> +		return dev_err_probe(dev, PTR_ERR(dp->grfclk), "failed to get grf cloc=
k\n");
> =20
>  	dp->pclk =3D devm_clk_get(dev, "pclk");
>  	if (IS_ERR(dp->pclk)) {
> --=20
> 2.34.1
>=20

--xhy3y75flbopwu4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmizZVoACgkQ2O7X88g7
+ppybRAAnuprNlS3e0DxWGjBWmgQes7KWMOHGqPxrwx+w7DGlx8UwANysNrj+7TP
/WxUb7x9RoWqCkAQp+eZViVcWT9KJKwCiygwG8Y7Qs6yPOQF+totPtFOSjQjV5U1
seRfhDHhOBF3tlOE6lu1sdaywS8sDetN93iFsXVrPVIPXMHwFuYRIM/RSK9v3tp/
9kSs5cV7QqSAH1YPEVX3HKhbywFixMqld4EWpBz2/uPsS6jyqwo4FgrGoTfEoT0m
o+Mys/Hzl/LxueJF6gn0FC6FGUxd7Jwi5bvkq4Hlyubn+Bb0/ouZJGrhuo8JIpcV
W159aRLupmAb4Sh+NhPUjImDxjtsvoFCM7m64XUTxNsdxwFjEBujk84gYa/hjd9M
P+PZb4HeEzU66JUK/1scp0yGGnXtOM+ZIM186VwIgfGVtqgLmGGswk5Fl0wPZGTn
MqWMHE82iHMfWBOEhmIXMCLF5mOVwpFoFjcftc//2Ko80A27VPgCpzJcf9TXdJ7/
FrZ1PPPfGO1JCLIXRrfXU45OH45xkuZZK55BRyb8TaAzsJ/2tpPCjjcRyJp/znWT
GE2l+eWMNRwPGya3WhC4EOFyXmeTnfNtUhUa60XuINCfJjICM3P+dGtOrBS4lyM8
+MIwGalFj1Odm+lZeHbIQUXJSxVb0IF/Z2SPEwS/ZztVMsuEbAM=
=pWI8
-----END PGP SIGNATURE-----

--xhy3y75flbopwu4h--
