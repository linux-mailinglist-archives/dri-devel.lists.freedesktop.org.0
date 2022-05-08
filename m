Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EBD51EE5F
	for <lists+dri-devel@lfdr.de>; Sun,  8 May 2022 16:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D9B10F60E;
	Sun,  8 May 2022 14:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B8510E9D3
 for <dri-devel@lists.freedesktop.org>; Sun,  8 May 2022 14:54:29 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nniIb-0000rS-RG; Sun, 08 May 2022 16:54:17 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Haowen Bai <baihaowen@meizu.com>
Subject: Re: [PATCH] drm/rockchip: Remove unneeded semicolon
Date: Sun, 08 May 2022 16:54:16 +0200
Message-ID: <3487561.R56niFO833@phil>
In-Reply-To: <1651802157-25092-1-git-send-email-baihaowen@meizu.com>
References: <1651802157-25092-1-git-send-email-baihaowen@meizu.com>
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
Cc: linux-rockchip@lists.infradead.org, Haowen Bai <baihaowen@meizu.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, 6. Mai 2022, 03:55:57 CEST schrieb Haowen Bai:
> Fixes coccicheck warning:
> 
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1476:2-3: Unneeded semicolon
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>

Yang Li was slightly faster [0] than this patch, so I've picked that one.

[0] https://lore.kernel.org/r/20220505232659.4405-1-yang.lee@linux.alibaba.com

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 0b49fed16535..7f9d88634a77 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1473,7 +1473,7 @@ static void rk3568_set_intf_mux(struct vop2_video_port *vp, int id,
>  	default:
>  		drm_err(vop2->drm, "Invalid interface id %d on vp%d\n", id, vp->id);
>  		return;
> -	};
> +	}
>  
>  	dip |= RK3568_DSP_IF_POL__CFG_DONE_IMD;
>  
> 




