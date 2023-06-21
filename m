Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1221D7383DF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 14:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFF210E456;
	Wed, 21 Jun 2023 12:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57FD10E456
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 12:34:10 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51bdf6336d2so431686a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 05:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687350848; x=1689942848; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9iTM9Tx3UJaYsQqcJ5JbhlSjUUYORfuUf20lfWrNUGw=;
 b=DyZTRfXkqmTQnyvBXikfY0NTynrMhXjBGLHZVMrJY0TwddYoDbuJhc1uqwl23cYthL
 6N/Z0MaQ8Dke4iO36VCMrPxTZ+bUC3ZT4vGz61ZpoHzd26MvkGEYBV/0U9Fstsdadhi7
 /O0RIB2jzarwKJf7bVIC3FrsfdfNmCdEWPOFMF3yDtdEFPphCau35K+7MEdgAan2QbQ4
 htypz58WEw1weh2+/UBIkqyGTp4wxvhmC7DYd6qFqe0jNQzgE7yCIZh/2WAODIe6mbj8
 2FZFKA71mrI1ORYFQZ1GTLsARQ2fbEKWihMKQHdpuVbMcgHkd+Na6kzd1Bdg2iz7J+3r
 GfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687350848; x=1689942848;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9iTM9Tx3UJaYsQqcJ5JbhlSjUUYORfuUf20lfWrNUGw=;
 b=iY5hR+8T5j6OvhuV5htBfcY1GjE/z52mB1y0UR91UHRKwqLZOqrPObKcnP9o7FOuoF
 PdRJoxkyxG9J9z4nEXuQnzDrC48YIeEBNFHaBwzLoQM7uJvejQZ0UMC0IjtXNPIrBK/n
 8XsFN5V9WIeylO0K8ZL7d3wbQJtCcXYZGAywJTfcBwnydyr8Ak6xrVlHOUuVC3ASENWv
 kQw6D8+4VMw82rHBlmftavNS+1jghEYpZX8ZdKZSALBJW6QKZjkfBTaXKBgF8XpP8gBy
 P6H+oV//uTeWkN+7q0jwm6jXAvDMG+OjwxRanveZk3atwavjIdIng3T32d+4PGczg+SY
 wPeg==
X-Gm-Message-State: AC+VfDxAU40mxHUV6BuVPu27Iko2v5wEtI6NsCZuKlGybPZuXNMrcjSy
 dn5yCtItl1P0XamwarXYBEZiEg==
X-Google-Smtp-Source: ACHHUZ73rIeM+5qs+5Ye74ibBRbWD6zPIqZkgDbrySnJcz6nb9Hi0Fxdp3gQ3hkix1TMdfOKYaKaYg==
X-Received: by 2002:aa7:cb84:0:b0:518:7a8b:5d4 with SMTP id
 r4-20020aa7cb84000000b005187a8b05d4mr10690489edt.16.1687350848621; 
 Wed, 21 Jun 2023 05:34:08 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 k2-20020aa7c382000000b0051a5ac9a40csm2606525edq.7.2023.06.21.05.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 05:34:08 -0700 (PDT)
Message-ID: <797c0144-4072-8728-304e-e64213185687@baylibre.com>
Date: Wed, 21 Jun 2023 14:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/4] drm/mediatek: Add casting before assign
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230621102247.10116-1-jason-jh.lin@mediatek.com>
 <20230621102247.10116-4-jason-jh.lin@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230621102247.10116-4-jason-jh.lin@mediatek.com>
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



On 21/06/2023 12:22, Jason-JH.Lin wrote:
> 1. Add casting before assign to avoid the unintentional integer
>     overflow or unintended sign extension.
> 2. Add a int varriable for multiplier calculation instead of calculating
>     different types multiplier with dma_addr_t varriable directly.
> 
> Fixes: 1a64a7aff8da ("drm/mediatek: Fix cursor plane no update")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c   |  3 ++-
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c | 22 +++++++++++++---------
>   2 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index a25b28d3ee90..da087d74612d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -121,7 +121,8 @@ int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
>   	int ret;
>   
>   	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
> -	args->size = args->pitch * args->height;
> +	args->size = args->pitch;
> +	args->size *= args->height;
>   
>   	mtk_gem = mtk_drm_gem_create(dev, args->size, false);
>   	if (IS_ERR(mtk_gem))
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index 31f9420aff6f..1cd41454d545 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -145,6 +145,7 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
>   	dma_addr_t addr;
>   	dma_addr_t hdr_addr = 0;
>   	unsigned int hdr_pitch = 0;
> +	int offset;

I agree with Angelo, please set offset as unsigned.

>   
>   	gem = fb->obj[0];
>   	mtk_gem = to_mtk_gem_obj(gem);
> @@ -154,8 +155,10 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
>   	modifier = fb->modifier;
>   
>   	if (modifier == DRM_FORMAT_MOD_LINEAR) {
> -		addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
> -		addr += (new_state->src.y1 >> 16) * pitch;
> +		offset = (new_state->src.x1 >> 16) * fb->format->cpp[0];
> +		addr += offset;
> +		offset = (new_state->src.y1 >> 16) * pitch;
> +		addr += offset;
>   	} else {
>   		int width_in_blocks = ALIGN(fb->width, AFBC_DATA_BLOCK_WIDTH)
>   				      / AFBC_DATA_BLOCK_WIDTH;
> @@ -163,21 +166,22 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
>   				       / AFBC_DATA_BLOCK_HEIGHT;
>   		int x_offset_in_blocks = (new_state->src.x1 >> 16) / AFBC_DATA_BLOCK_WIDTH;
>   		int y_offset_in_blocks = (new_state->src.y1 >> 16) / AFBC_DATA_BLOCK_HEIGHT;
> -		int hdr_size;
> +		int hdr_size, hdr_offset;
>   
>   		hdr_pitch = width_in_blocks * AFBC_HEADER_BLOCK_SIZE;
>   		pitch = width_in_blocks * AFBC_DATA_BLOCK_WIDTH *
>   			AFBC_DATA_BLOCK_HEIGHT * fb->format->cpp[0];
>   
>   		hdr_size = ALIGN(hdr_pitch * height_in_blocks, AFBC_HEADER_ALIGNMENT);
> +		hdr_offset = hdr_pitch * y_offset_in_blocks +
> +			AFBC_HEADER_BLOCK_SIZE * x_offset_in_blocks;
> +		hdr_addr = addr + hdr_offset;
>   
> -		hdr_addr = addr + hdr_pitch * y_offset_in_blocks +
> -			   AFBC_HEADER_BLOCK_SIZE * x_offset_in_blocks;
>   		/* The data plane is offset by 1 additional block. */
> -		addr = addr + hdr_size +
> -		       pitch * y_offset_in_blocks +
> -		       AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
> -		       fb->format->cpp[0] * (x_offset_in_blocks + 1);
> +		offset = pitch * y_offset_in_blocks +
> +			 AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
> +			 fb->format->cpp[0] * (x_offset_in_blocks + 1);
> +		addr = addr + hdr_size + offset;
>   	}
>   
>   	mtk_plane_state->pending.enable = true;

-- 
Regards,
Alexandre
