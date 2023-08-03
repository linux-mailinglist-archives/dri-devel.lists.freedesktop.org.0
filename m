Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B09676E9E0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 15:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F68C10E095;
	Thu,  3 Aug 2023 13:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA2910E095
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 13:18:17 +0000 (UTC)
Received: from [192.168.0.125] (unknown [82.76.24.202])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7A0966600359;
 Thu,  3 Aug 2023 14:18:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691068696;
 bh=ehtnooF4XJa6rGTTWGX8btVhMNGF1adK7GnhGx2DAtI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ipwFnpLSOqCnx0wmqJHvBrSv2dMow/rQ+/kB4KqSlAY3JSTm7Tj7+m82MaRDPfAE7
 +tmY5B9VuWavIYILkiw3ltBLZjuhYo6tqzEaI+DsXCXfq8x1UpJ7LHBj4wNhcz0QYe
 VOuJ9H8LohHpv4klgjgYz3b5oG/e8v8woDmveqadGeEOA2JkebW8YXS/Y+vEAp6kpm
 CgbtoJIuVqT4pkD3sg8SYZbHmKSOuI7PSR232FlkYF8Gvhw+UjYPt9QA1ORJWRFdtm
 gk1yHbOEZKG/YYBIxjDhf9JADiNuFY8//MhhVDyJlhE9LNURJUvFwCNUaK1SL6XnO5
 8wyKQm3thV+5Q==
Message-ID: <38720b56-df8e-d25a-0e6f-ca6e1fb3df26@collabora.com>
Date: Thu, 3 Aug 2023 16:18:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 2/8] drm/mediatevk: Add crtc path enum for all_drm_priv
 array
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230802144802.751-1-jason-jh.lin@mediatek.com>
 <20230802144802.751-3-jason-jh.lin@mediatek.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230802144802.751-3-jason-jh.lin@mediatek.com>
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
Cc: Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/2/23 17:47, Jason-JH.Lin wrote:
> Add mtk_drm_crtc_path enum for eatch display path.

Typo: each

> 
> Instead of using array index of all_drm_priv in mtk_drm_kms_init(),
> mtk_drm_crtc_path enum can make more readable.

can make *code* more readable ?
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 +++---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h | 8 +++++++-
>   2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 249c9fd6347e..89a38561ba27 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -465,21 +465,21 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>   		for (j = 0; j < private->data->mmsys_dev_num; j++) {
>   			priv_n = private->all_drm_private[j];
>   
> -			if (i == 0 && priv_n->data->main_len) {
> +			if (i == CRTC_MAIN && priv_n->data->main_len) {
>   				ret = mtk_drm_crtc_create(drm, priv_n->data->main_path,
>   							  priv_n->data->main_len, j);
>   				if (ret)
>   					goto err_component_unbind;
>   
>   				continue;
> -			} else if (i == 1 && priv_n->data->ext_len) {
> +			} else if (i == CRTC_EXT && priv_n->data->ext_len) {
>   				ret = mtk_drm_crtc_create(drm, priv_n->data->ext_path,
>   							  priv_n->data->ext_len, j);
>   				if (ret)
>   					goto err_component_unbind;
>   
>   				continue;
> -			} else if (i == 2 && priv_n->data->third_len) {
> +			} else if (i == CRTC_THIRD && priv_n->data->third_len) {
>   				ret = mtk_drm_crtc_create(drm, priv_n->data->third_path,
>   							  priv_n->data->third_len, j);
>   				if (ret)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index eb2fd45941f0..f4de8bb27685 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -9,11 +9,17 @@
>   #include <linux/io.h>
>   #include "mtk_drm_ddp_comp.h"
>   
> -#define MAX_CRTC	3
>   #define MAX_CONNECTOR	2
>   #define DDP_COMPONENT_DRM_OVL_ADAPTOR (DDP_COMPONENT_ID_MAX + 1)
>   #define DDP_COMPONENT_DRM_ID_MAX (DDP_COMPONENT_DRM_OVL_ADAPTOR + 1)
>   
> +enum mtk_drm_crtc_path {
> +	CRTC_MAIN,
> +	CRTC_EXT,
> +	CRTC_THIRD,
> +	MAX_CRTC,
> +};
> +
>   struct device;
>   struct device_node;
>   struct drm_crtc;

