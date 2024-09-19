Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0117397CB64
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 17:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AAE10E71A;
	Thu, 19 Sep 2024 15:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="yd/iGmcB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B8110E71A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 15:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SzhrwNTWqn3op7Q7MK/yO/jfaDhB8Okd6g5JGwQ4o9U=; b=yd/iGmcBt65hY8mQMYla7iQyun
 oXFUDn1kHH5781TXxv2MJhOpALlVXWmXKEabRYIeL8ZfCAAikgXM5r5vvyKOM0MQawUBz2YwkME1z
 VUYbzK0x4k3Rbe4flSQBQGhHnOVrqeHcCsTRxnrvTHAII5g+uo230hHyyAKl1Lk5xPX+LsM2FGVu7
 daMhHGEUv8Spz1RKNBm5nRNdu2cpRgTc87GKQpdXKJ7jGvoASa9vXGUyxEm6A3n9fzH/0OYnwN4pl
 Pl3/lReLV+jgxgxfIkilGDp0GJY+MxzyrQTcTbcC+7ilpCbBSc9Sr9PDzppdHbBphmPEaJBBtMgsN
 my89kAwQ==;
Received: from ip092042140082.rev.nessus.at ([92.42.140.82] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1srIoy-0003k2-9j; Thu, 19 Sep 2024 17:11:52 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Jinjie Ruan <ruanjinjie@huawei.com>
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH -next v2] drm/rockchip: Use for_each_child_of_node_scoped()
Date: Thu, 19 Sep 2024 17:11:51 +0200
Message-ID: <1846591.8hzESeGDPO@phil>
In-Reply-To: <20240830073454.3539590-1-ruanjinjie@huawei.com>
References: <20240830073454.3539590-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi,

Am Freitag, 30. August 2024, 09:34:54 CEST schrieb Jinjie Ruan:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
> v2:
> - Add Reviewed-by.
> - Split out from the PATCH set.

This patch also appears in your series
"[PATCH -next v2 0/3] drm/rockchip: Simplified with for_each_child_of_node_scoped()"
it seems, so I think you could describe why it was split from there now.

Also patch subject "drm/rockchip: lvds: ...."


Thanks
Heiko

> ---
>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> index 9a01aa450741..f5b3f18794dd 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -548,7 +548,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>  	struct drm_encoder *encoder;
>  	struct drm_connector *connector;
>  	struct device_node *remote = NULL;
> -	struct device_node  *port, *endpoint;
> +	struct device_node  *port;
>  	int ret = 0, child_count = 0;
>  	const char *name;
>  	u32 endpoint_id = 0;
> @@ -560,15 +560,13 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>  			      "can't found port point, please init lvds panel port!\n");
>  		return -EINVAL;
>  	}
> -	for_each_child_of_node(port, endpoint) {
> +	for_each_child_of_node_scoped(port, endpoint) {
>  		child_count++;
>  		of_property_read_u32(endpoint, "reg", &endpoint_id);
>  		ret = drm_of_find_panel_or_bridge(dev->of_node, 1, endpoint_id,
>  						  &lvds->panel, &lvds->bridge);
> -		if (!ret) {
> -			of_node_put(endpoint);
> +		if (!ret)
>  			break;
> -		}
>  	}
>  	if (!child_count) {
>  		DRM_DEV_ERROR(dev, "lvds port does not have any children\n");
> 




