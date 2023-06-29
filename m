Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97B27421F2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 10:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF22710E116;
	Thu, 29 Jun 2023 08:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FAC10E112;
 Thu, 29 Jun 2023 08:20:08 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-668842bc50dso112947b3a.1; 
 Thu, 29 Jun 2023 01:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688026807; x=1690618807;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MuU+IODmkTTkuhzQJRxiHpwnwKWskFKRKmO7ulwVp0E=;
 b=H+OfIxIC8xbL8SD6LYRIa82WDrmeZosn0syjWycpayKCcOKXYx/1VAkw9dDxL5N8lF
 BFFvJ9xhTzYcSAf57G9biAZbH4gKqYvwK1xOhL3anU0KU9L1vGfnzq6P9a+ejrUAj+Hz
 5/Om69YAQ/q52t5QyH9aGA2/mUyvGch3nMRUcNBsDMdy6CIf7ZPtYLrKB9f6SBio4s2C
 LyNbLPtQXGQJDr8ce0n26htgKMtwJDXvjX9GvWbTmlPOCkhHahua0UwBhb4tx8pO6W4V
 8vP+zOsCbNvrq/0wEFOAWR1xY33g+bvkr1NWEcaXA3+Wo46vYIKcXIcLKHLZusO4mnMn
 N7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688026807; x=1690618807;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MuU+IODmkTTkuhzQJRxiHpwnwKWskFKRKmO7ulwVp0E=;
 b=XmGiV5+YZRP/BeU6tljlFDdQJECGLbNa+woUFWcLtsdqKyPEMdEpjz0RtEmP8Tp/eK
 J19yNMA4GVf/kUynpR7RODNH4Oh/lgyHTMAdsceG0WJ5hb3bHPjZYdFj2TdqNDloB3zF
 qGXTSBNXyKmbTLKTqOYZ+EcL7i92DfQZL3nyO0Ntwkoy0tg7EmApGSJ66xJIvAgOVCXC
 DYmArNisjD36gIv1wgkv8fOlnGc1g/DX5HS+sb9Nqxrb+qW8aWmq3WM+SbRevzxVCKDP
 ymhyqnlmO9yDNz3oa96jB79JfozvZS1zvSOUYKEDNRxEKdnEy2nL7ofFHoGsDdgFYn9Z
 j7SQ==
X-Gm-Message-State: AC+VfDwuCXrpaw+eUOJ/OGMmcAGPyis28HMVAvaGEE9fGidEF9tRchHY
 CZG/Mu9SXcZgVXdWzf+PFK8=
X-Google-Smtp-Source: ACHHUZ6gEZ5ACJV9oTS+MZBK7ulcj/tZMk6ytkXBK0GHfzMcE9c/6cAsaq3y+NbFE3JtAbsOrm1xyQ==
X-Received: by 2002:a05:6a20:7295:b0:111:fba0:bd3b with SMTP id
 o21-20020a056a20729500b00111fba0bd3bmr45096785pzk.1.1688026807173; 
 Thu, 29 Jun 2023 01:20:07 -0700 (PDT)
Received: from [10.104.2.174] (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 5-20020aa79145000000b0063b96574b8bsm7916030pfi.220.2023.06.29.01.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 01:20:05 -0700 (PDT)
Message-ID: <17e929a5-d94f-8370-6aad-cf93490c6ad7@gmail.com>
Date: Thu, 29 Jun 2023 17:20:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
Subject: Re: [PATCH 6/6] drm/amdgpu: use the new drm_exec object for CS v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
References: <20230628104446.1369-1-christian.koenig@amd.com>
 <20230628104446.1369-7-christian.koenig@amd.com>
Content-Language: en-US
In-Reply-To: <20230628104446.1369-7-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/28/23 19:44, Christian König wrote:
> @@ -958,18 +904,57 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>   		e->user_invalidated = userpage_invalidated;
>   	}
>   
> -	r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
> -				   &duplicates);
> -	if (unlikely(r != 0)) {
> -		if (r != -ERESTARTSYS)
> -			DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
> -		goto out_free_user_pages;
> +	drm_exec_until_all_locked(&p->exec) {
> +		r = amdgpu_vm_lock_pd(&fpriv->vm, &p->exec, 1 + p->gang_size);
> +		drm_exec_retry_on_contention(&p->exec);
> +		if (unlikely(r))
> +			goto out_free_user_pages;
> +
> +		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> +			/* One fence for TTM and one for each CS job */
> +			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base,
> +						 1 + p->gang_size);
> +			drm_exec_retry_on_contention(&p->exec);
> +			if (unlikely(r))
> +				goto out_free_user_pages;
> +
> +			e->bo_va = amdgpu_vm_bo_find(vm, e->bo);
> +			e->range = NULL;
Still leaking.
> +		}
> +
> +		if (p->uf_bo) {
> +			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
> +						 1 + p->gang_size);
> +			drm_exec_retry_on_contention(&p->exec);
> +			if (unlikely(r))
> +				goto out_free_user_pages;
> +		}
>   	}

