Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621E2D1B725
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 22:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965CA89317;
	Tue, 13 Jan 2026 21:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="b1+xWMwq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C254389317
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 21:38:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768340279; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TMRuKwSaPAl0mN7eCUvuIX18MFYChB0GoTEfXgkYhvsbT0fR5fIAVGSTXKjnzjKdI3ppFaWaF9rMKgY+QFkeFZg2y1hSa4oDJOgXfrvMYVHLBdMW1txZONeSUfOdyxar+feitLbcuItSP9x4ZQg8Qdx1NqHuM8romV+gxOF1acQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768340279;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=y7NtPpWbsvFnfglwEGLTqh7XYK8ygk1IdAQo37U7wrM=; 
 b=d/TCx5w+2nxF/sPNUcqqkGuNqkI5cCv/25/kacJ2GfbW14FoeG+m39PWYbhxA/RT3Zj8O/Z1iZjHArh4tWFn1iBpdHeIsYXrHYWJfPP3IiiO6aIIVi3w/K8tVIPUFdWjnbcAnocvmcnQUzMs4hgsVihTOsY6/B2PlSDHzBkkSZU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768340279; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=y7NtPpWbsvFnfglwEGLTqh7XYK8ygk1IdAQo37U7wrM=;
 b=b1+xWMwqCech+gKnLdudviRSI2wz+Q6MnbD8+4SVASM5RwsxRu/cEx3uGfb/S9p3
 /IGYJypXrteH1BWN0FQpUEj0hKysKdNE8iMCF4Uq5u3i0SJ0FAZpS2oYp3e0LMb6Irt
 jdzLYklS3vmYnoCRsqi+htYSIFxAmN7E9Z3Q8uE4=
Received: by mx.zohomail.com with SMTPS id 1768340277682489.0776181184626;
 Tue, 13 Jan 2026 13:37:57 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
 id D8AB1181010; Tue, 13 Jan 2026 22:37:51 +0100 (CET)
Date: Tue, 13 Jan 2026 22:37:51 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, dmitry.baryshkov@oss.qualcomm.com, krzk+dt@kernel.org, 
 conor+dt@kernel.org, cristian.ciocaltea@collabora.com, 
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org, hjc@rock-chips.com,
 robh@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 4/5] drm/rockchip: dw_dp: Add DisplayPort support for
 rk3576
Message-ID: <aWa7GuLKdUcbjA35@venus>
References: <20260109080054.228671-1-andyshrk@163.com>
 <20260109080054.228671-5-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hyleu5tjxzo42dvl"
Content-Disposition: inline
In-Reply-To: <20260109080054.228671-5-andyshrk@163.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.5.1/268.322.40
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


--hyleu5tjxzo42dvl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] drm/rockchip: dw_dp: Add DisplayPort support for
 rk3576
MIME-Version: 1.0

Hi,

On Fri, Jan 09, 2026 at 04:00:47PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> The DisplayPort of the RK3576 is basically the same as that of the
> RK3588, but it operates in dual-pixel mode and also support MST.
>=20
> This patch only enable the SST output now.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/=
rockchip/dw_dp-rockchip.c
> index 89d614d53596..dac3d202971e 100644
> --- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> @@ -142,10 +142,18 @@ static const struct dw_dp_plat_data rk3588_dp_plat_=
data =3D {
>  	.pixel_mode =3D DW_DP_MP_QUAD_PIXEL,
>  };
> =20
> +static const struct dw_dp_plat_data rk3576_dp_plat_data =3D {
> +	.max_link_rate =3D 810000,
> +	.pixel_mode =3D DW_DP_MP_DUAL_PIXEL,
> +};
> +
>  static const struct of_device_id dw_dp_of_match[] =3D {
>  	{
>  		.compatible =3D "rockchip,rk3588-dp",
>  		.data =3D &rk3588_dp_plat_data,
> +	}, {
> +		.compatible =3D "rockchip,rk3576-dp",
> +		.data =3D &rk3576_dp_plat_data,
>  	},
>  	{}
>  };
> --=20
> 2.43.0
>=20

--hyleu5tjxzo42dvl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmlmuy8ACgkQ2O7X88g7
+pqnQw//St6wApBlmwbGRyB42gAaYXw0QF7vQykT7SuXmi7T4kkK2N9FnTvghOx9
nhOUlAfYwCbAthiHQ1VsmZBCcbj+3akRorrCboycuzew+0oTSbasmkHyvyl3GxPH
9cFSX5UFJ9IwI7uUcPD+v6eYdHMl+B57nHk+OR2SuCdvAL7iQEkNKBhEkfE0jX/a
/Ta/Mx4/91MsT5aKRDVpAWyj2VJ8qfn/P4i+8A95pgVjLBIp+47BtmsVYy9LfUkh
yg0ldBFGG0f3VP8wOOLV4JEeRzu4IwtlAF9wcSViAbmveiv6pOk1qgKJwzaSChGH
470wm79F+8vUO/BPAZaBnwmwkoj5AtJzWLlc/1Wc7d++kNdqXbalmUMyCvqUa+V8
OKNF8prtjZeG2TWIDuOQuLHFto8CKIrvGSZrDYSh7vuFefBXyFfYILEjriNkrjcd
82+uErt13+qhoT5yf+9kXYk92nClOiI7xkYVQburWMFVxpkygrryPtZTTiz3xylT
Ue+WXZi6o7AJFTt6X6QuUJMRTvM/uxGMzR/9qXwa5dNnmXUaeKhKbKKkBbTSbk31
kQyohGVJMLJKikLDrfP75jux7Bm7HYYwfQDCu3EGoR662JBGn6fPg75R6PqK3MDx
wGWXvyoifjeU5vXyL+ohBfNksEFQ7Ov98mjmP8USmRzpbXmJz94=
=XJSW
-----END PGP SIGNATURE-----

--hyleu5tjxzo42dvl--
