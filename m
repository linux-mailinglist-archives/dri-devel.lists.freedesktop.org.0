Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F274B4330
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 09:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6527510E1BD;
	Mon, 14 Feb 2022 08:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AF510E143
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 08:03:14 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nJWKA-0006vg-Ok; Mon, 14 Feb 2022 09:03:06 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 13/23] drm/rockchip: Make use of the helper
 component_compare_dev
Date: Mon, 14 Feb 2022 09:03:04 +0100
Message-ID: <3640952.nfqboWGjmy@diego>
In-Reply-To: <20220214060819.7334-14-yong.wu@mediatek.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
 <20220214060819.7334-14-yong.wu@mediatek.com>
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
Cc: Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 James Wang <james.qian.wang@arm.com>, Yong Wu <yong.wu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, 14. Februar 2022, 07:08:09 CET schrieb Yong Wu:
> Use the common compare helper from component.
>=20
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=A8=B9bner" <heiko@sntech.de>
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_drv.c
> index bec207de4544..3c2f2d6ecc36 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -290,11 +290,6 @@ int rockchip_drm_endpoint_is_subdriver(struct device=
_node *ep)
>  	return false;
>  }
> =20
> -static int compare_dev(struct device *dev, void *data)
> -{
> -	return dev =3D=3D (struct device *)data;
> -}
> -
>  static void rockchip_drm_match_remove(struct device *dev)
>  {
>  	struct device_link *link;
> @@ -321,7 +316,7 @@ static struct component_match *rockchip_drm_match_add=
(struct device *dev)
>  				break;
> =20
>  			device_link_add(dev, d, DL_FLAG_STATELESS);
> -			component_match_add(dev, &match, compare_dev, d);
> +			component_match_add(dev, &match, component_compare_dev, d);
>  		} while (true);
>  	}
> =20
>=20




