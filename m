Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDBE28778E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 17:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB92B6E3DF;
	Thu,  8 Oct 2020 15:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CEF6E3DF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 15:35:59 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h7so7132425wre.4
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 08:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9sM8OV2emicSSgKUYTtCQMaEpJ4acgy1c6O/56Zq6Oo=;
 b=dGDSSLAihGRqMk4uF3NVxQAfBB8JtG0nhT+TtI+6X82vDcDzVzQJ5rQI0AjYcXav6W
 /pBJa9zMZbIHT1B+LuM/QnEDSRfeclIyPLqPHH0oSrJIVo3ARvlX364kS/Vz4K40IKqQ
 5El1aMMn7ZBwEnRlFrRKx4ELy2cr94LmWLsKLtc5n8/uucnB8FLGlk2vUMJObVCu+rWl
 pgfGjHVEYLvwz2dn8AqdgqqE8cNzF3tfcJTs+JpYlVGhVfvYLyBOhk1AMOlaNV76OB8K
 yzCv15Oqzr868GyoPSybw9Y2OQrUGAbcrJGzbR/Izxe7PrbvYKFxYsu3nDx7kXh3JkZ2
 4F6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9sM8OV2emicSSgKUYTtCQMaEpJ4acgy1c6O/56Zq6Oo=;
 b=JLl6MYpZZe78fjd66ADQF3CGITCpYlxSQflGw9gZJzDge+UqMgzmcs9Oai+lykliPM
 xF/e5jOvDqQ9uFjayznSkCvWf98Rsm/cbSqTYD6lKyVTn1yZwsYKvv3cWBFuimgMQ8Z9
 XIYRqjo7CCDcl2FhciAJYo6C2FSQEmloj6Ctfxky9d9eidneo90I+tUt/17MXrCl5jlh
 JdfNICzulTgjSnZw2FdlMcDYg80eQDT5JCsF2t3Y/x0rDOkG0W2kDQFwJjB+PImLa/sq
 q5EQCRWDnUFBJ+8YzZZ7ppFLin2zCbTey/3HPDb481YgS9vr6Iy/6Yg00I5uHOZl12Jg
 HZEg==
X-Gm-Message-State: AOAM531m/aISj6DAOS8tFE+XryS4dxN72gWFu/wuluGi1Kvs8BSLXGL7
 rwpaIcHD1x1+MO13Ysqgxl8=
X-Google-Smtp-Source: ABdhPJzur3cynY/5Bbw77VfAZaC4C6hT9eyZOSItC+slMlrkZYtvBoIewob3T44rU/3WFalnMKetOw==
X-Received: by 2002:adf:eb41:: with SMTP id u1mr2850331wrn.94.1602171357995;
 Thu, 08 Oct 2020 08:35:57 -0700 (PDT)
Received: from [192.168.1.125] (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id o186sm7679110wmb.12.2020.10.08.08.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 08:35:57 -0700 (PDT)
Subject: Re: [PATCH 3/5] drm/vmwgfx: add a move callback.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201006000644.1005758-1-airlied@gmail.com>
 <20201006000644.1005758-4-airlied@gmail.com>
From: Roland Scheidegger <rscheidegger.oss@gmail.com>
Message-ID: <e141ec18-439d-494e-1803-b7f549ce859b@gmail.com>
Date: Thu, 8 Oct 2020 17:35:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201006000644.1005758-4-airlied@gmail.com>
Content-Language: de-DE
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both vmwgxf patches look good to me too.
Reviewed-by: Roland Scheidegger <sroland@vmware.com>

Am 06.10.20 um 02:06 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
> 
> This just copies the fallback to vmwgfx, I'm going to iterate on this
> a bit until it's not the same as the fallback path.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index 2f88d2d79f9a..6e36fc932aeb 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -725,6 +725,23 @@ static void vmw_swap_notify(struct ttm_buffer_object *bo)
>  	(void) ttm_bo_wait(bo, false, false);
>  }
>  
> +static int vmw_move(struct ttm_buffer_object *bo,
> +		     bool evict,
> +		     struct ttm_operation_ctx *ctx,
> +		     struct ttm_resource *new_mem)
> +{
> +	struct ttm_resource_manager *old_man = ttm_manager_type(bo->bdev, bo->mem.mem_type);
> +	struct ttm_resource_manager *new_man = ttm_manager_type(bo->bdev, new_mem->mem_type);
> +
> +	if (old_man->use_tt && new_man->use_tt) {
> +		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
> +			ttm_bo_assign_mem(bo, new_mem);
> +			return 0;
> +		}
> +		return ttm_bo_move_ttm(bo, ctx, new_mem);
> +	} else
> +		return ttm_bo_move_memcpy(bo, ctx, new_mem);
> +}
>  
>  struct ttm_bo_driver vmw_bo_driver = {
>  	.ttm_tt_create = &vmw_ttm_tt_create,
> @@ -735,7 +752,7 @@ struct ttm_bo_driver vmw_bo_driver = {
>  	.ttm_tt_destroy = &vmw_ttm_destroy,
>  	.eviction_valuable = ttm_bo_eviction_valuable,
>  	.evict_flags = vmw_evict_flags,
> -	.move = NULL,
> +	.move = vmw_move,
>  	.verify_access = vmw_verify_access,
>  	.move_notify = vmw_move_notify,
>  	.swap_notify = vmw_swap_notify,
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
