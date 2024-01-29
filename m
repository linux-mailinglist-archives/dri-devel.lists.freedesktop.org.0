Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD47840C3C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 17:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C6E112A0E;
	Mon, 29 Jan 2024 16:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BDE112A34;
 Mon, 29 Jan 2024 16:49:49 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-33ae2d80b70so1393859f8f.0; 
 Mon, 29 Jan 2024 08:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706546928; x=1707151728; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SClQHNx/XUF6O67AiYDDX/kFIJabNAFPJCNPiLsTpyI=;
 b=gxN7WRqrer3A6OzKe7XFfhSuPZktw+XTmwK+hJG8dxH3evv3cXXvKgvKcbjUcBZ8ni
 5LHqSSNQmPWLAcEMh54oc4p9ajxKSlNPdi86zENM6A2ztJ8dtdUkDwuddfFn+785np8F
 QepZazdGo5pUqhQH9x+y4DIpA2e45Qh7+JovVdcym4fVjr9BghLl4rBhPDn90BogapMz
 BXgghs1kUpsiq4+IKn880/VKq9Lozpla8zLjAXIHDGgnNQA0kPODKTwVfB/9NohJmbXn
 MKwjj4oUVjgJGCrWkIA6KYwPFvOSoo47d1oYCe/0vY3ikD56T83ifNwzE07hTH3TP9Ds
 jLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706546928; x=1707151728;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SClQHNx/XUF6O67AiYDDX/kFIJabNAFPJCNPiLsTpyI=;
 b=mprGAjjv9tJSD/Cp6c8kp6tkTKfcRqaf5pX2Njg+HTH+vI3cnWd1D8NukJJIfRoybx
 Qp8PaGgmLY6Bz794VUdriKpKfqqw+9s8xNUMVo1d5KjJ4at/dkkHlNnQbPSXfvXTmXvH
 O/GAYLXog+BvL7WDegSHEes+0fbgMallFpaW0UvVVyUGPwi8wVbqOp1J+2a6SNt1sVQU
 4o3Ko73ZsbDLwiK/UxGkQpZNH4srWt/xMqNwcWl3nj3rtL/NkZoIV0+eC8Pj/rLuZzr+
 kFR7GnV/wRragCF4sPMYIuA1lN35mpA0X0uIiDzvo3V01JauzizlZCgX5c5qMx+6xlZq
 +VQQ==
X-Gm-Message-State: AOJu0YzCkEQGBZgOoLDutH29SOHRUL8p3nFUqsXykPGewRZ3N7NAjjpH
 nsj9wZEiTGO5cc7usMTNfejZL0UzBmXChG+a2T15FzG5WjevApS+
X-Google-Smtp-Source: AGHT+IHJmefe0hja1kNT+O/lZqSBJOGR351CeocwmhhGIT1V3TLH7yzxvOLcemzQ1xyetKMl+76ZKA==
X-Received: by 2002:a5d:568d:0:b0:33a:ec16:48d8 with SMTP id
 f13-20020a5d568d000000b0033aec1648d8mr2737966wrv.29.1706546927895; 
 Mon, 29 Jan 2024 08:48:47 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 bv4-20020a0560001f0400b0033aec05328csm3837228wrb.6.2024.01.29.08.48.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 08:48:47 -0800 (PST)
Message-ID: <21f2b595-0690-4372-bd81-86d23ac7498b@gmail.com>
Date: Mon, 29 Jan 2024 17:48:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix a build error
Content-Language: en-US
To: Oak Zeng <oak.zeng@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20240127155327.423294-1-oak.zeng@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240127155327.423294-1-oak.zeng@intel.com>
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
Cc: Thomas.Hellstrom@linux.intel.com, Amaranath.Somalapuram@amd.com,
 lucas.demarchi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.01.24 um 16:53 schrieb Oak Zeng:
> This fixes a build failure on drm-tip. This issue was introduced during
> merge of "drm/ttm: replace busy placement with flags v6". For some
> reason, the xe_bo.c part of above change is not merged. Manually merge
> the missing part to drm_tip

Mhm, I provided this as manual fixup for drm-tip in this rerere commit:

commit afc5797e8c03bed3ec47a34f2bc3cf03fce24411
Author: Christian König <christian.koenig@amd.com>
Date:   Thu Jan 25 10:44:54 2024 +0100

     2024y-01m-25d-09h-44m-07s UTC: drm-tip rerere cache update

     git version 2.34.1


And for me compiling xe in drm-tip worked fine after that. No idea why 
that didn't work for you.

Anyway feel free to add my rb to this patch here if it helps in any way.

Regards,
Christian.

>
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 33 +++++++++++++++------------------
>   1 file changed, 15 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 686d716c5581..d6a193060cc0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -38,22 +38,26 @@ static const struct ttm_place sys_placement_flags = {
>   static struct ttm_placement sys_placement = {
>   	.num_placement = 1,
>   	.placement = &sys_placement_flags,
> -	.num_busy_placement = 1,
> -	.busy_placement = &sys_placement_flags,
>   };
>   
> -static const struct ttm_place tt_placement_flags = {
> -	.fpfn = 0,
> -	.lpfn = 0,
> -	.mem_type = XE_PL_TT,
> -	.flags = 0,
> +static const struct ttm_place tt_placement_flags[] = {
> +	{
> +		.fpfn = 0,
> +		.lpfn = 0,
> +		.mem_type = XE_PL_TT,
> +		.flags = TTM_PL_FLAG_DESIRED,
> +	},
> +	{
> +		.fpfn = 0,
> +		.lpfn = 0,
> +		.mem_type = XE_PL_SYSTEM,
> +		.flags = TTM_PL_FLAG_FALLBACK,
> +	}
>   };
>   
>   static struct ttm_placement tt_placement = {
> -	.num_placement = 1,
> -	.placement = &tt_placement_flags,
> -	.num_busy_placement = 1,
> -	.busy_placement = &sys_placement_flags,
> +	.num_placement = 2,
> +	.placement = tt_placement_flags,
>   };
>   
>   bool mem_type_is_vram(u32 mem_type)
> @@ -230,8 +234,6 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>   	bo->placement = (struct ttm_placement) {
>   		.num_placement = c,
>   		.placement = bo->placements,
> -		.num_busy_placement = c,
> -		.busy_placement = bo->placements,
>   	};
>   
>   	return 0;
> @@ -251,7 +253,6 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
>   		/* Don't handle scatter gather BOs */
>   		if (tbo->type == ttm_bo_type_sg) {
>   			placement->num_placement = 0;
> -			placement->num_busy_placement = 0;
>   			return;
>   		}
>   
> @@ -1391,8 +1392,6 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
>   	bo->placement = (struct ttm_placement) {
>   		.num_placement = 1,
>   		.placement = place,
> -		.num_busy_placement = 1,
> -		.busy_placement = place,
>   	};
>   
>   	return 0;
> @@ -2150,9 +2149,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
>   
>   	xe_place_from_ttm_type(mem_type, &requested);
>   	placement.num_placement = 1;
> -	placement.num_busy_placement = 1;
>   	placement.placement = &requested;
> -	placement.busy_placement = &requested;
>   
>   	/*
>   	 * Stolen needs to be handled like below VRAM handling if we ever need

