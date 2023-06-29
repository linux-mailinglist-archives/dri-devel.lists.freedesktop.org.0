Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90A07421F3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 10:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7F310E112;
	Thu, 29 Jun 2023 08:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BFD10E14B;
 Thu, 29 Jun 2023 08:20:14 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-657c4bcad0bso121325b3a.1; 
 Thu, 29 Jun 2023 01:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688026814; x=1690618814;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ekq2//rgPNBeYEEizIXWWlTW0BlgF6AzeVi3W6aqWk=;
 b=gLh59snSNoiU7tTwAJb8m69dA0EkbBED24tNnjXXAa4t6Xv84z+0PbiAsW5M6aQP2Q
 IimpafEq4juTGZh/SKzqH0aY60u/B81xfbYbPVhRRt+8scMk1sai/4a5IRBmw8cCy8eR
 lMez6HIv64gXmFUAJ64U68BFGkofC7C5Z3yLEA/Eg34tVUKMQmXzOJlopI82jiA8gAnt
 zj9HXW8v/EpHKhk8ir96TGMeci1Y6YCH8i/MwwWMghP8eGFo6pjtn7va+pekPz55MDza
 xOelWSxbfLIC4ULyH4nRiJjCZl3gdi/5IcF4h6ewOjR24uEaAhJ7rwUCcr5LF92IGbg+
 qmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688026814; x=1690618814;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3ekq2//rgPNBeYEEizIXWWlTW0BlgF6AzeVi3W6aqWk=;
 b=PfjyoPD75c54SB6Wg7rDdvwPk7K753G6M4fi5zp1L4pPSthRoOdw/CxaAERXn8JWUw
 lfAcF7iTrGhlBhbcFgR9u5KR00yDFdpOeLYK3lXt07VCEdWHlamvTKIwgm/P8rJMlWiF
 KxttpiqJtDdk+n7ytRwayzpiCHAnzjUtgUpLbgZEBZ6e5Butq/r8qbMP50jXCy7V842P
 3cqSuQw4cK626Ww836EdUNfbEymuxVqmAfmlUK6yW+v+SZARphxf5ygcxVq8LzeshYku
 azWTysxUZlixvBVIRA6Y6QyZheYF3o5GNSIh22CiwcuZVoQonNhHp8OdR8V2hSvkM8pM
 epYg==
X-Gm-Message-State: AC+VfDzWPlljGGhFrKXUeuUM1AvKogUqJymnSpOOtuQe0si9OvQ7zFC6
 kMrhoZC0f/IE+TGAd//rjsk=
X-Google-Smtp-Source: ACHHUZ7FM2u2Mak8pDEsLVfIxizeo2nY/DwLtfHzUm6ovUXRCyjoZPhkQJExFHJCZSCqYJRe2u+N4w==
X-Received: by 2002:a05:6a20:432a:b0:126:c759:27f8 with SMTP id
 h42-20020a056a20432a00b00126c75927f8mr16009003pzk.2.1688026813753; 
 Thu, 29 Jun 2023 01:20:13 -0700 (PDT)
Received: from [10.104.2.174] (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 n13-20020a170903110d00b001b558c37f91sm8610183plh.288.2023.06.29.01.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 01:20:12 -0700 (PDT)
Message-ID: <dda5dd70-403a-273d-6506-cca5bc084f64@gmail.com>
Date: Thu, 29 Jun 2023 17:20:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
Subject: Re: [PATCH 4/6] drm/amdgpu: use drm_exec for GEM and CSA handling
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
References: <20230628104446.1369-1-christian.koenig@amd.com>
 <20230628104446.1369-5-christian.koenig@amd.com>
Content-Language: en-US
In-Reply-To: <20230628104446.1369-5-christian.koenig@amd.com>
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

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 74055cba3dc9..6811fc866494 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -728,36 +723,37 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>   		return -EINVAL;
>   	}
>   
> -	INIT_LIST_HEAD(&list);
> -	INIT_LIST_HEAD(&duplicates);
>   	if ((args->operation != AMDGPU_VA_OP_CLEAR) &&
>   	    !(args->flags & AMDGPU_VM_PAGE_PRT)) {
>   		gobj = drm_gem_object_lookup(filp, args->handle);
>   		if (gobj == NULL)
>   			return -ENOENT;
>   		abo = gem_to_amdgpu_bo(gobj);
> -		tv.bo = &abo->tbo;
> -		if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
> -			tv.num_shared = 1;
> -		else
> -			tv.num_shared = 0;
> -		list_add(&tv.head, &list);
>   	} else {
>   		gobj = NULL;
>   		abo = NULL;
>   	}
>   
> -	amdgpu_vm_get_pd_bo(&fpriv->vm, &list, &vm_pd);
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);

Sorry, I missed this last time, but this needs to allow duplicates as well or mapping
always_valid BOs doesn't work.

> +	drm_exec_until_all_locked(&exec) {
> +		if (gobj) {
> +			r = drm_exec_lock_obj(&exec, gobj);
> +			drm_exec_retry_on_contention(&exec);
> +			if (unlikely(r))
> +				goto error;
> +		}
>   
> -	r = ttm_eu_reserve_buffers(&ticket, &list, true, &duplicates);
> -	if (r)
> -		goto error_unref;
> +		r = amdgpu_vm_lock_pd(&fpriv->vm, &exec, 2);
> +		drm_exec_retry_on_contention(&exec);
> +		if (unlikely(r))
> +			goto error;
> +	}
>   
>   	if (abo) {
>   		bo_va = amdgpu_vm_bo_find(&fpriv->vm, abo);
>   		if (!bo_va) {
>   			r = -ENOENT;
> -			goto error_backoff;
> +			goto error;
>   		}
>   	} else if (args->operation != AMDGPU_VA_OP_CLEAR) {
>   		bo_va = fpriv->prt_va;
> @@ -794,10 +790,8 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>   		amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
>   					args->operation);
>   
> -error_backoff:
> -	ttm_eu_backoff_reservation(&ticket, &list);
> -
> -error_unref:
> +error:
> +	drm_exec_fini(&exec);
>   	drm_gem_object_put(gobj);
>   	return r;
>   }
