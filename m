Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA0888686A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 09:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE7710E61C;
	Fri, 22 Mar 2024 08:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jy/XB7tw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86FB10E61C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 08:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711097194;
 bh=Gs2UAC9Hy8VFwByHDlNC06xdCiz4QDNtsopwA8NrO4Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jy/XB7tw0FGS5tI0FcWpWhUzIrqIIeYInUM84WS16IpPsOCwNS4R96cgPgJzhUVRP
 Eepi17JezOVmbuiLp8Fo5BbSCnDCvXiKAqbunTeSngJxLdItvJYUkrYmITlEBD7ps3
 F4jlmQq41YUwav4f/MtGeRjSei/PyzDY7n7ADwI3IfGRczolHLEROndp7Qx5y2QuBp
 S6cPVl1uX0msVhBDSiIuDoagk225ecXPhX9509482xD1yeNasazvucrvYRIr56j6vl
 IWi9vY7VIbrrTD2Ws0ro9toDee2MVS91LpJ+Eu3ofSM7Q8jIyqwIiRTfC84vANaswp
 Vqx4X6Y/NL5cA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E90AF37809D1;
 Fri, 22 Mar 2024 08:46:33 +0000 (UTC)
Message-ID: <e1d5d349-c9e3-4af9-a9b6-d563027a5974@collabora.com>
Date: Fri, 22 Mar 2024 09:46:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/14] drm/mediatek: Rename "mtk_drm_plane" to
 "mtk_plane"
To: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
References: <20240322012808.26234-1-shawn.sung@mediatek.com>
 <20240322012808.26234-4-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240322012808.26234-4-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 22/03/24 02:27, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> 
> Rename all "mtk_drm_plane" to "mtk_plane":
> - To align the naming rule
> - To reduce the code size
> 
> Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>

Shawn - please - can you fix my typo'ed name also here and on all of the
patches of this series?

Thanks.

> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c | 6 +++---
>   drivers/gpu/drm/mediatek/mtk_drm_plane.h | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index cbdb70677d305..43137c46fc148 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -93,8 +93,8 @@ static bool mtk_plane_format_mod_supported(struct drm_plane *plane,
>   	return true;
>   }
>   
> -static void mtk_drm_plane_destroy_state(struct drm_plane *plane,
> -					struct drm_plane_state *state)
> +static void mtk_plane_destroy_state(struct drm_plane *plane,
> +				    struct drm_plane_state *state)
>   {
>   	__drm_atomic_helper_plane_destroy_state(state);
>   	kfree(to_mtk_plane_state(state));
> @@ -241,7 +241,7 @@ static const struct drm_plane_funcs mtk_plane_funcs = {
>   	.destroy = drm_plane_cleanup,
>   	.reset = mtk_plane_reset,
>   	.atomic_duplicate_state = mtk_plane_duplicate_state,
> -	.atomic_destroy_state = mtk_drm_plane_destroy_state,
> +	.atomic_destroy_state = mtk_plane_destroy_state,
>   	.format_mod_supported = mtk_plane_format_mod_supported,
>   };
>   
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> index 99aff7da0831d..231bb7aac9473 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -4,8 +4,8 @@
>    * Author: CK Hu <ck.hu@mediatek.com>
>    */
>   
> -#ifndef _MTK_DRM_PLANE_H_
> -#define _MTK_DRM_PLANE_H_
> +#ifndef _MTK_PLANE_H_
> +#define _MTK_PLANE_H_
>   
>   #include <drm/drm_crtc.h>
>   #include <linux/types.h>


