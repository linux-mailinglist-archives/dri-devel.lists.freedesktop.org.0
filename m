Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4882973E2FD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 17:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1493110E227;
	Mon, 26 Jun 2023 15:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B2110E229;
 Mon, 26 Jun 2023 15:15:33 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f9c2913133so44422555e9.1; 
 Mon, 26 Jun 2023 08:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687792531; x=1690384531;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PmRfirqXfSvkyoAOVtCyAnitstVlhaC7q73gfVyb+4M=;
 b=Tz3rIQUnMqhrKtipZlRQ8sTMEJdS6wklxEeNVoGqe3XAeOD0UTPdSzU2qgGrltKqFi
 RIMyxRSqw+dgR8vnDhIFK91ubOr+jvEBmk+UgYvi38nW8hCsqQApZjBKDtxsh9rfMJhF
 zTs/D2G4m+/nqDyI7UhxwD7M4YF3TZmdTnbyV/5ylE0wXb7b+CIsyMCMxzgCTO/Um/ws
 cMHmSGN5MKInTke/cSFNpdLqUjypIM9SFlyXlSCntJBBaMH3LzrSIk7ZWCOLplFESPDc
 0LupZyhvQnlbOhX5EbY6+j/d/Z3Z/Kz+FjROZ5ES26qnp7UoyVjjh9/HnXgeFRHLLRtT
 tPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687792531; x=1690384531;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PmRfirqXfSvkyoAOVtCyAnitstVlhaC7q73gfVyb+4M=;
 b=krbLv7k8ALyP/jepq3IzTJ1xMnndAbcoVB1jD6Diyw6bIEuFiXmOH72CJwBo33oGx8
 Xe+1D78JiFCRJ8IPCtWjSdyiEK7tfJCMQLzI+/mgCrs/CG+P81L/xeYE7xYO6sIQ2QIj
 hkFaSYH0ImvkNM1+jKj/jT+ey2CyZMa/qi97OFgN1Y1/7XDtkAmK3OfY/GxAdhFdQuq+
 Xkys4MosozppB7F6+UFZEeIWK9AL+EwLioLhnHJrUKScx57VE74BIb13rdYMWbaP2IFS
 OO1x/KpjRxjAD1Yl6hZGOqC811lbkAXA8NmQ1dTKA/N4TgRRYHpyDHWaTkciTVY6+7vs
 Utbw==
X-Gm-Message-State: AC+VfDxmsh3rZRVh0boMFrLpVOl/AYdgWL8HM1EN1ESZPeL4rlvVKnMB
 ClDmkFIgZqlHiA2D56b9Mb0=
X-Google-Smtp-Source: ACHHUZ5GC9RZ5QCTpLhMVxwupOthRTX84J9A9FhGSg/kiJCyizTE4+re4OC1YLSKt8hn616Hrc4NJA==
X-Received: by 2002:a7b:ce09:0:b0:3f6:536:a4b2 with SMTP id
 m9-20020a7bce09000000b003f60536a4b2mr24178300wmc.27.1687792531467; 
 Mon, 26 Jun 2023 08:15:31 -0700 (PDT)
Received: from ?IPV6:2a00:e180:158d:7600:862:d9d5:c1f7:84a1?
 ([2a00:e180:158d:7600:862:d9d5:c1f7:84a1])
 by smtp.gmail.com with ESMTPSA id
 21-20020a05600c22d500b003f96d10eafbsm8012451wmg.12.2023.06.26.08.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 08:15:30 -0700 (PDT)
Message-ID: <8b22c855-c84d-4b56-c94b-a3a079ab3037@gmail.com>
Date: Mon, 26 Jun 2023 17:15:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/4] drm/ttm: Don't shadow the operation context
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230626091450.14757-1-thomas.hellstrom@linux.intel.com>
 <20230626091450.14757-3-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230626091450.14757-3-thomas.hellstrom@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Roger He <Hongbo.He@amd.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.06.23 um 11:14 schrieb Thomas Hellström:
> ttm_bo_swapout() shadows the ttm operation context which may cause
> major confusion in driver callbacks when swapping out !TTM_PL_SYSTEM
> memory. Fix this by reusing the operation context argument to
> ttm_bo_swapout().
>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Roger He <Hongbo.He@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Cc: <intel-gfx@lists.freedesktop.org>
> Cc: <stable@vger.kernel.org> # v4.16+
> Fixes: dc947770cf34 ("drm/ttm: enable swapout for reserved BOs during allocation")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>

We intentionally didn't used the parameter here, but I absolutely can't 
figure out why.

Feel free to add my rb, but let's give it some time upstream before you 
base anything on top of this. Just in case we missed something.

Regards,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index bd5dae4d1624..615d30c4262d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1154,7 +1154,6 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   	 * Move to system cached
>   	 */
>   	if (bo->resource->mem_type != TTM_PL_SYSTEM) {
> -		struct ttm_operation_ctx ctx = { false, false };
>   		struct ttm_resource *evict_mem;
>   		struct ttm_place hop;
>   
> @@ -1164,7 +1163,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   		if (unlikely(ret))
>   			goto out;
>   
> -		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, &ctx, &hop);
> +		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
>   		if (unlikely(ret != 0)) {
>   			WARN(ret == -EMULTIHOP, "Unexpected multihop in swaput - likely driver bug.\n");
>   			goto out;

