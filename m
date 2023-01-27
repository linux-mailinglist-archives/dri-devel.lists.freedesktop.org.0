Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A8467EDE8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 19:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D603810E19B;
	Fri, 27 Jan 2023 18:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F83510E19B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 18:57:38 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l35-20020a05600c1d2300b003dc4634a466so4729wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 10:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H5Rj8aOxClVaC1/e+NP4KbguznuPQQCxeHyUWANfni0=;
 b=E8s9pl9AYsKw86qq00q3nhxwi/h5cFK+ylZMMSAFbd+8zXpia7+3QUFnqHT5y9mTbd
 OZiNhXcmrPrvnM2zVLMSvZQ6jVdYQOjru3eetc6qTdqzO2kUP6Sw8552JdOQr76aT46Z
 j/C37Leickc3vBX5PFmgJYGkYN3NdBQ0xn7kS99p675Dm2fSLwL0KLSQsIcE4dSSo0j/
 DfxQZKynPdE+uC1XX5aEXePOxkW87konpu9hvPPqxBVf+OoAnrMGblROIjuvp+oPedXg
 tHSRNM+97U+16RDrbmFNsUZSf/j3aSVDtfn9blX9zGVhWHJc5YgU6ozd+HT1ZKU5rCxP
 fcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H5Rj8aOxClVaC1/e+NP4KbguznuPQQCxeHyUWANfni0=;
 b=aEqBv5jMAqDwqCwXFxSuHA8GTlgu69QbGKGxs2ShHPfvSiaIi4M6HA0ffIhwyjoY/h
 tlMDyaWEmodPI7KLSPMkXGQEbkfTTA4MNyL6jVRPZD1wFyaI+dN6H+UP/VEqeXdn79eS
 dOIHErpAvzPPFNtZChm5GQFAQbvLGbObTdxZvZBZzCz8W6yuzjjo1/8lkwEmUhfLANAc
 58gl1lZXqsnh1DmkvsYAtPw7udipT/wVNDo1le02SE9iF9qwc7tf8DGfNtoSVxLBq+b+
 XAGgrk/Sil4YlW7DcWRhnZAntvojG806ocn9cp2KEUfbVMZoLvS2FJnStfMIY2T5N9Bd
 +A5w==
X-Gm-Message-State: AFqh2kpIwqafbGx8QUZgc1ZqLbH7oTVaNY6o9Jq+Y9aaxTiJQpColOEf
 vdDDVc+cZLjXT0yADcvW+SNsJ3rG5Fs=
X-Google-Smtp-Source: AMrXdXsEhTFmh6seE3uNZqBFmfULaKXfkwpWEQDGqgZFa6S4Wj5q6dyvi9TmF3sOPwth8o8lH1Y3UQ==
X-Received: by 2002:a05:600c:4248:b0:3d9:7667:c0e4 with SMTP id
 r8-20020a05600c424800b003d97667c0e4mr39882351wmm.31.1674845856638; 
 Fri, 27 Jan 2023 10:57:36 -0800 (PST)
Received: from [192.168.2.181] (46-10-148-141.ip.btc-net.bg. [46.10.148.141])
 by smtp.gmail.com with ESMTPSA id
 j38-20020a05600c1c2600b003daff80f16esm12014078wms.27.2023.01.27.10.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 10:57:36 -0800 (PST)
Message-ID: <d0cf6e3a-e60b-c675-447f-418d99e86a9a@gmail.com>
Date: Fri, 27 Jan 2023 20:57:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 5/7] drm/vmwgfx: Cleanup the vmw bo usage in the cursor
 paths
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230126173813.602748-1-zack@kde.org>
 <20230126173813.602748-6-zack@kde.org>
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20230126173813.602748-6-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>


Ah, good!
Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,
Martin


On 26.01.23 г. 19:38 ч., Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> Base mapped count is useless because the ttm unmap functions handle
> null maps just fine so completely remove all the code related to it.
> Rename dummy to is_iomem because that's what it is even if we're not
> activelly using it. Makes the code easier to read.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.h  |  4 ----
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 28 +++++++++-------------------
>   2 files changed, 9 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> index db85609ec01c..4dcf37235cb0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> @@ -44,7 +44,6 @@ struct vmw_resource;
>    * struct vmw_bo - TTM buffer object with vmwgfx additions
>    * @base: The TTM buffer object
>    * @res_tree: RB tree of resources using this buffer object as a backing MOB
> - * @base_mapped_count: ttm BO mapping count; used by KMS atomic helpers.
>    * @cpu_writers: Number of synccpu write grabs. Protected by reservation when
>    * increased. May be decreased without reservation.
>    * @dx_query_ctx: DX context if this buffer object is used as a DX query MOB
> @@ -55,8 +54,6 @@ struct vmw_resource;
>   struct vmw_bo {
>   	struct ttm_buffer_object base;
>   	struct rb_root res_tree;
> -	/* For KMS atomic helpers: ttm bo mapping count */
> -	atomic_t base_mapped_count;
>   
>   	atomic_t cpu_writers;
>   	/* Not ref-counted.  Protected by binding_mutex */
> @@ -67,7 +64,6 @@ struct vmw_bo {
>   	struct vmw_bo_dirty *dirty;
>   };
>   
> -
>   int vmw_bo_create_kernel(struct vmw_private *dev_priv,
>   			 unsigned long size,
>   			 struct ttm_placement *placement,
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 6780391c57ea..e83286e08837 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -153,9 +153,9 @@ static void vmw_cursor_update_mob(struct vmw_private *dev_priv,
>   	SVGAGBCursorHeader *header;
>   	SVGAGBAlphaCursorHeader *alpha_header;
>   	const u32 image_size = width * height * sizeof(*image);
> -	bool dummy;
> +	bool is_iomem;
>   
> -	header = ttm_kmap_obj_virtual(&vps->cursor.map, &dummy);
> +	header = ttm_kmap_obj_virtual(&vps->cursor.map, &is_iomem);
>   	alpha_header = &header->header.alphaHeader;
>   
>   	memset(header, 0, sizeof(*header));
> @@ -185,13 +185,13 @@ static u32 vmw_du_cursor_mob_size(u32 w, u32 h)
>    */
>   static u32 *vmw_du_cursor_plane_acquire_image(struct vmw_plane_state *vps)
>   {
> -	bool dummy;
> +	bool is_iomem;
>   	if (vps->surf) {
>   		if (vps->surf_mapped)
>   			return vmw_bo_map_and_cache(vps->surf->res.backup);
>   		return vps->surf->snooper.image;
>   	} else if (vps->bo)
> -		return ttm_kmap_obj_virtual(&vps->bo->map, &dummy);
> +		return ttm_kmap_obj_virtual(&vps->bo->map, &is_iomem);
>   	return NULL;
>   }
>   
> @@ -364,7 +364,7 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
>   	SVGA3dCopyBox *box;
>   	unsigned box_count;
>   	void *virtual;
> -	bool dummy;
> +	bool is_iomem;
>   	struct vmw_dma_cmd {
>   		SVGA3dCmdHeader header;
>   		SVGA3dCmdSurfaceDMA dma;
> @@ -424,7 +424,7 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
>   	if (unlikely(ret != 0))
>   		goto err_unreserve;
>   
> -	virtual = ttm_kmap_obj_virtual(&map, &dummy);
> +	virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
>   
>   	if (box->w == VMW_CURSOR_SNOOP_WIDTH && cmd->dma.guest.pitch == image_pitch) {
>   		memcpy(srf->snooper.image, virtual,
> @@ -658,19 +658,18 @@ vmw_du_cursor_plane_cleanup_fb(struct drm_plane *plane,
>   {
>   	struct vmw_cursor_plane *vcp = vmw_plane_to_vcp(plane);
>   	struct vmw_plane_state *vps = vmw_plane_state_to_vps(old_state);
> -	bool dummy;
> +	bool is_iomem;
>   
>   	if (vps->surf_mapped) {
>   		vmw_bo_unmap(vps->surf->res.backup);
>   		vps->surf_mapped = false;
>   	}
>   
> -	if (vps->bo && ttm_kmap_obj_virtual(&vps->bo->map, &dummy)) {
> +	if (vps->bo && ttm_kmap_obj_virtual(&vps->bo->map, &is_iomem)) {
>   		const int ret = ttm_bo_reserve(&vps->bo->base, true, false, NULL);
>   
>   		if (likely(ret == 0)) {
> -			if (atomic_read(&vps->bo->base_mapped_count) == 0)
> -			    ttm_bo_kunmap(&vps->bo->map);
> +			ttm_bo_kunmap(&vps->bo->map);
>   			ttm_bo_unreserve(&vps->bo->base);
>   		}
>   	}
> @@ -744,9 +743,6 @@ vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
>   
>   		ret = ttm_bo_kmap(&vps->bo->base, 0, PFN_UP(size), &vps->bo->map);
>   
> -		if (likely(ret == 0))
> -			atomic_inc(&vps->bo->base_mapped_count);
> -
>   		ttm_bo_unreserve(&vps->bo->base);
>   
>   		if (unlikely(ret != 0))
> @@ -786,7 +782,6 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
>   	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
>   	struct vmw_plane_state *old_vps = vmw_plane_state_to_vps(old_state);
>   	s32 hotspot_x, hotspot_y;
> -	bool dummy;
>   
>   	hotspot_x = du->hotspot_x;
>   	hotspot_y = du->hotspot_y;
> @@ -828,11 +823,6 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
>   						hotspot_x, hotspot_y);
>   	}
>   
> -	if (vps->bo) {
> -		if (ttm_kmap_obj_virtual(&vps->bo->map, &dummy))
> -			atomic_dec(&vps->bo->base_mapped_count);
> -	}
> -
>   	du->cursor_x = new_state->crtc_x + du->set_gui_x;
>   	du->cursor_y = new_state->crtc_y + du->set_gui_y;
>   
