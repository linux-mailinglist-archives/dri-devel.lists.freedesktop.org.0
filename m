Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EEF9C1EDA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 15:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8E110E9BF;
	Fri,  8 Nov 2024 14:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="OD2GaGNu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAD010E9BF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 14:08:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1731074924; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=oAj2c0TIVxFk0uIdvNN/ewWCb1AAIHEF6PfPIjiVnuGuVkhx9f+R8q3GnmoRvdGtSD2LqMpYpelZtVGBLTJ6YNSwMB11PBscTGZydUVqN3WHjnvTwOu5dtdlkWU1xomdUHAK4RFCbPCzZzGjpQNcdbyCb3yO5MrumNmBnaXOm+s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1731074924;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=mVElLljDMkH2gCb36Qpaybb+YgOSLlNL2FEVOV/jwkM=; 
 b=aigQwFQ6TRguUM1lvEptcT6Src9fdY7ej4FQL4Ajh0HqLqZ2dHlVTIcl6KYeahXDSqUqMUqhfjYlkGG41SX+sSnbCLl+zxQuGro9W+B/O2mVYDX02LS3Gngckz607RJ6M9PJvmWfjONbuGRuZrOtxGBF9UHe2CopmXr99S1/PB0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731074924; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=mVElLljDMkH2gCb36Qpaybb+YgOSLlNL2FEVOV/jwkM=;
 b=OD2GaGNuQNvKEhovoKeMnrC3ZRv7U6t6vN0dJema56qXSF1LJ5Ncla59l2mrCmgM
 KK1hZj3snaUHE+BLnRwH4/iKLIBXStFfqztjzSIlhPH3KsWUa+wIHvI7eW8rJ0bB8Cp
 2Z6cfOh76W+5sJHso4PNW4XKloULP6f055xv9xTU=
Received: by mx.zohomail.com with SMTPS id 1731074923259860.7417195009734;
 Fri, 8 Nov 2024 06:08:43 -0800 (PST)
Received: by mercury (Postfix, from userid 1000)
 id 84B401060446; Fri, 08 Nov 2024 15:08:38 +0100 (CET)
Date: Fri, 8 Nov 2024 15:08:38 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 heiko@sntech.de, hjc@rock-chips.com, andy.yan@rock-chips.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH 2/2] drm/rockchip: dsi: Don't log errors on deferred dphy
Message-ID: <yrm6r4urzf5hvnui53cvepw2loqvuhydalq6haw7qmpktor5y5@zjc34wlcoeg2>
References: <cover.1731073565.git.dsimic@manjaro.org>
 <559094275c3e41cae7c89e904341f89a1240a51a.1731073565.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jbebcpfdxkuwxpqm"
Content-Disposition: inline
In-Reply-To: <559094275c3e41cae7c89e904341f89a1240a51a.1731073565.git.dsimic@manjaro.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/231.63.7
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


--jbebcpfdxkuwxpqm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] drm/rockchip: dsi: Don't log errors on deferred dphy
MIME-Version: 1.0

Hi,

On Fri, Nov 08, 2024 at 02:53:58PM +0100, Dragan Simic wrote:
> Deferred driver probing shouldn't result in errors or warnings being logg=
ed,
> because their presence in the kernel log provides no value and may actual=
ly
> cause false impression that some issues exist.  Thus, let's no longer pro=
duce
> error messages when getting the dphy results in deferred probing.
>=20
> This prevents misleading error messages like the following one, which was
> observed on a Pine64 PineTab2, from appearing in the kernel log.  To make
> matters worse, the following error message was observed appearing multiple
> times in the kernel log of a single PineTab2 boot:
>=20
>   dw-mipi-dsi-rockchip fe060000.dsi: [drm:dw_mipi_dsi_rockchip_probe \
>   [rockchipdrm]] *ERROR* failed to get mipi dphy: -517
>=20
> At the same time, make the adjusted logged message a bit more consistent =
with
> the other logged messages by capitalizing its first word.
>=20
> Reported-by: Diederik de Haas <didi.debian@cknow.org>
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> ---

=46rom include/drm/drm_print.h:

 * DRM_DEV_ERROR() - Error output.
 *
 * NOTE: this is deprecated in favor of drm_err() or dev_err().

The recommended way to do this nowadays looks like this:

return dev_err_probe(dev, PTR_ERR(dsi->phy), "Failed to get mipi dphy");

That will not print anything for -EPROBE_DEFER, but capture
the reason and make it available through
/sys/kernel/debug/devices_deferred if the device never probes.

Greetings,

-- Sebastian

>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gp=
u/drm/rockchip/dw-mipi-dsi-rockchip.c
> index f451e70efbdd..ffa7f2bc640d 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -1387,7 +1387,8 @@ static int dw_mipi_dsi_rockchip_probe(struct platfo=
rm_device *pdev)
>  	dsi->phy =3D devm_phy_optional_get(dev, "dphy");
>  	if (IS_ERR(dsi->phy)) {
>  		ret =3D PTR_ERR(dsi->phy);
> -		DRM_DEV_ERROR(dev, "failed to get mipi dphy: %d\n", ret);
> +		if (ret !=3D -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "Failed to get mipi dphy: %d\n", ret);
>  		return ret;
>  	}
> =20

--jbebcpfdxkuwxpqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmcuG1cACgkQ2O7X88g7
+poqOw//XpffXl7k7aTrQfYUgac6w5Ax61S2qx+q08M4H7qDdJt/VVg8PnS6EP0P
WGPmQ/mtjFO+aPPxwS3DQgi+oy2EClVgjKw/rTNPABVonLA48AZXzxRWpEDOMJ3b
Snb6GzOt3M/ZLDbvVm2qnxMndHgDPfeGtjHZyb97YEMHY565zRxjgBNh2weug+X0
qfv+Uo4maCdY7LeGBfykLK4uLedJpkZejb//HtAN1bmU70kb6csiBcB4Iee4FC4H
CTWCP5G8t/VBweYf2curGn4252BlTyLa5SN8XrYm9hgsDYc8K75wCa70tZuk3rHR
ac6wMwRZDUEVNiTk6tCYQJsAjXyZPOfQXG8rAV9W+NurLaVGtJnbSdmD3KTwIxSw
11uIjqaOFNrrKOtzQYlGHh0t7LLtOo66OSGzllOh8fJbYOmpt/NaLG585+ddw3Ot
hbfzziAmN6R3j/bB9QNdGWDQok9Mk3WoQYPryrbWbErhAweiA7sIGeM3n9Zcysmy
dgUKzJtOZ7gUcAWdA1UPatRHxDQ3dh4Hgjw/9izYqkbr6zpGGrp91HIhP9p2APZ9
NriNU8nxUVULiYdKR7hCgNEPI0MrxqXEzg6Lhs2i5y1UJlECiwmMnBpGizj+250g
jgJQskZJ0vQ1bHk1ELk3zoX7h5IFOFxkl6RPWGtUHuk/Q1M5028=
=9OkR
-----END PGP SIGNATURE-----

--jbebcpfdxkuwxpqm--
