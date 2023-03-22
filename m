Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A0A6C592C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 22:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B0210E414;
	Wed, 22 Mar 2023 21:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CD410E40A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 21:57:46 +0000 (UTC)
Received: from p508fd58e.dip0.t-ipconnect.de ([80.143.213.142]
 helo=phil.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pf6Sm-0004wd-3z; Wed, 22 Mar 2023 22:57:44 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 Alfredo Cruz <alfredo.carlon@gmail.com>
Subject: Re: [PATCH] drm/rockchip: vop2: add error check to
 devm_regmap_init_mmio
Date: Wed, 22 Mar 2023 22:57:43 +0100
Message-ID: <4696479.44csPzL39Z@phil>
In-Reply-To: <20230314191532.33693-1-alfredo.carlon@gmail.com>
References: <20230314191532.33693-1-alfredo.carlon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Alfredo Cruz <alfredo.carlon@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alfredo,

while I do agree with the patch content, there are missing:
a patch description ... just a customary thing for a change like this

but more importantly the Signed-off-by line .


Heiko

Am Dienstag, 14. M=E4rz 2023, 20:15:32 CET schrieb Alfredo Cruz:
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 03ca32cd2050..4bde2d354462 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -2680,6 +2680,8 @@ static int vop2_bind(struct device *dev, struct dev=
ice *master, void *data)
>  	vop2->len =3D resource_size(res);
> =20
>  	vop2->map =3D devm_regmap_init_mmio(dev, vop2->regs, &vop2_regmap_confi=
g);
> +	if (IS_ERR(vop2->map))
> +		return PTR_ERR(vop2->map);
> =20
>  	ret =3D vop2_win_init(vop2);
>  	if (ret)
>=20




