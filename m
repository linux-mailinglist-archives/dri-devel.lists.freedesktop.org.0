Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 907DF824596
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 16:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3121110E4BF;
	Thu,  4 Jan 2024 15:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE57E10E4BF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 15:59:11 +0000 (UTC)
Received: from i53875a56.versanet.de ([83.135.90.86] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rLQ7T-00072M-QC; Thu, 04 Jan 2024 16:58:55 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Drop unused if_dclk_rate variable
Date: Thu, 04 Jan 2024 16:58:54 +0100
Message-ID: <5867171.29KlJPOoH8@diego>
In-Reply-To: <20240104143951.85219-2-cristian.ciocaltea@collabora.com>
References: <20240104143951.85219-1-cristian.ciocaltea@collabora.com>
 <20240104143951.85219-2-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian, Andy,

Am Donnerstag, 4. Januar 2024, 15:39:50 CET schrieb Cristian Ciocaltea:
> Commit 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> introduced a variable which ended up being unused.  Remove it.
>=20
> rockchip_drm_vop2.c:1688:23: warning: variable =E2=80=98if_dclk_rate=E2=
=80=99 set but not used [-Wunused-but-set-variable]
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

in general, please don't send non-series patches as replies to other patche=
s.
It confuses tooling like b4 way too often, as this patch is not designated
as a 2/2 (similar to the first one not being 1/2).

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 44508c2dd614..923985d4161b 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1685,7 +1685,6 @@ static unsigned long rk3588_calc_cru_cfg(struct vop=
2_video_port *vp, int id,
>  	unsigned long dclk_core_rate =3D v_pixclk >> 2;
>  	unsigned long dclk_rate =3D v_pixclk;
>  	unsigned long dclk_out_rate;
> -	unsigned long if_dclk_rate;
>  	unsigned long if_pixclk_rate;
>  	int K =3D 1;
> =20
> @@ -1700,7 +1699,6 @@ static unsigned long rk3588_calc_cru_cfg(struct vop=
2_video_port *vp, int id,
>  		}
> =20
>  		if_pixclk_rate =3D (dclk_core_rate << 1) / K;
> -		if_dclk_rate =3D dclk_core_rate / K;
>  		/*
>  		 * *if_pixclk_div =3D dclk_rate / if_pixclk_rate;
>  		 * *if_dclk_div =3D dclk_rate / if_dclk_rate;
>  		 */
		*if_pixclk_div =3D 2;
		*if_dclk_div =3D 4;

with the code continuing with those static constants but the comment
showing a forumula, I do hope Andy can provide a bit of insight into
what is happening here.

I.e. I'd really like to understand if that really is just a remnant or
something different is needed.


Heiko


