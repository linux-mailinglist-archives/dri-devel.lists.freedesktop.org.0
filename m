Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1013F683468
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 18:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B4010E071;
	Tue, 31 Jan 2023 17:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E3410E071
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 17:57:55 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a3so8315458wrt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 09:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7hpHKoT0J/9lA0Urx6OWDWdlwdgaY7ZvRcfvsBqh+7U=;
 b=S0FaqOC209UTLl924Val6jGb2+ibAr/mzN/GIfzeIbuwSRc4k3iGSujcCXNB5PEgp8
 +W3VoHaz3IgTA5JI4e8+T2wtlubm8YobByQERoBVrvuuc5BrKT+/CGiEZIsoGACUsKkZ
 c1nXB0CPnyT5dvLsWuyqh3vD3P+fQQgJc2LpQ+hIkRVjdDQPjNddw9LdZSJzRWWkosfi
 J9ja9hbVMVLxV8MsH5IeqpkFySLFdTTUcnq/y0Em22VoHmnXH7+yn5uI8eR04HoXpUMu
 RvBbnwJNBMJhh4ZFw0WEAEQ0RqPtQ5dcW2Io3EGW0BjxDk7QeEkIqNFg8DtxoXb7ZZpJ
 03nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7hpHKoT0J/9lA0Urx6OWDWdlwdgaY7ZvRcfvsBqh+7U=;
 b=EnYgH1/LwrZ6sV8L3paNf2u3m5horY3TUY+bFEf9HlN/TOAEw32KWn6SJLrKNy2K1t
 +M+3AlqPZIqlGZk8owIS0ZOtULoP9w92kgz7bIVTZx62Wtgey52LcgXhMWEto7Dacm2Q
 /iKNiU8ZPftzmCPgZC8NcfyoTthCYGEMj3io2G/fhy88EUzNhfTfIO5u/clzYY4A/ebB
 Rlt8RvyBTozt8D1KFu2osvn4epc6af8omYgg3T45mFto6jKWrdBCeZWWNIRUYT2FH4yg
 KMOCFxp355xrguNrQyyfNjEf+j/7dtydxkMv7Rg3w//nkSixztCAsdwe/HbRpuK9tMYU
 FGjg==
X-Gm-Message-State: AO0yUKU18R6WtmSk3MNTfWO+t3Ad+TQnFvMmRqzsuFv3BAVCxWXzCYGA
 MiPFhvnM7g74w95K3d13hoaFFhBjfxE=
X-Google-Smtp-Source: AK7set8ChxJSbcwfi2e58dfWVR2+Om5tDNwmnc80hXFKHSkg658xmVVq2sWmPDGpXk9giqkcR1lp8A==
X-Received: by 2002:adf:e645:0:b0:2bf:b8f0:f6c6 with SMTP id
 b5-20020adfe645000000b002bfb8f0f6c6mr22813957wrn.45.1675187874199; 
 Tue, 31 Jan 2023 09:57:54 -0800 (PST)
Received: from [192.168.2.181] (84-238-195-59.ip.btc-net.bg. [84.238.195.59])
 by smtp.gmail.com with ESMTPSA id
 f28-20020a5d58fc000000b002be5401ef5fsm15835166wrd.39.2023.01.31.09.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 09:57:53 -0800 (PST)
Message-ID: <28fcae00-8d73-6ba1-2e40-c166bfa33571@gmail.com>
Date: Tue, 31 Jan 2023 19:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 6/8] drm/vmwgfx: Rename dummy to is_iomem
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230131033542.953249-1-zack@kde.org>
 <20230131033542.953249-7-zack@kde.org>
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20230131033542.953249-7-zack@kde.org>
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


LGTM
Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,
Martin


On 31.01.23 г. 5:35 ч., Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> Rename dummy to is_iomem because that's what it is even if we're not
> activelly using it. Makes the code easier to read.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 1082218a1cfc..e83286e08837 100644
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
> @@ -658,14 +658,14 @@ vmw_du_cursor_plane_cleanup_fb(struct drm_plane *plane,
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
