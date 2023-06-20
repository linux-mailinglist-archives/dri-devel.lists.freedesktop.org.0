Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81866736292
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 06:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE3410E258;
	Tue, 20 Jun 2023 04:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B9810E258;
 Tue, 20 Jun 2023 04:14:26 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-77e3c55843cso22853939f.0; 
 Mon, 19 Jun 2023 21:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687234465; x=1689826465;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HfXcA5JdNA0yf+U+AJ2SuyKVr9rRyTUAx98Z0AaLNjU=;
 b=nCDvG5c6cXOqyczo3SPAlLoIYL3tinmRwA7LG1Sh2BeV10m0RceQxHtBmzDN5itEyg
 WdlBkyD57wkjgU577v+JxRgihq6/g8/IECAgMO8OIlwe5tO8Y8rLmSlSetePJayCXYo2
 ebHLcIDQaV6+YS6hKNMY2+RBjQbOsdsdJVHRzVz6YAfBAbPzP9a7ZDAnZTfYHaRbPwzC
 4a+LQiVzkY+sZLqT5kTZAqOBh+mgVqKlH/4fSRPWUIpVIyvlZsVpNOyMyZclRi0BXZWu
 LM0rjyTIWUds3EkqN41d2X2uY3DhCkBY3O3V4H4dlXyutG1ztMMDXRBXCKSeHxl73q8r
 J4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687234465; x=1689826465;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HfXcA5JdNA0yf+U+AJ2SuyKVr9rRyTUAx98Z0AaLNjU=;
 b=S7WX4tigEoPTsK6yP3hSPvOzyD8ZbE9WjAuDh1kHSDSxOzo1OglrclfRPKISiIA523
 etzzS+11E+9KzR0W5U74mugykX34L7Ir+aaWZiGm2BfP3jgGflaxFmhHMW9Yjz4S0yYy
 RhH5oMON7JKq/JbEEwC1/mDlqeCqLkXQziQ2WaAh/1sxrIRa0EgjugGdwHjXXzU0CLJ5
 MB8SJqBx+C4qHSh1w+hEHMNQarqYckOIRrHBeQIGqt8gjdr3KRfl2C+RAtNCO5eexAx6
 ggyyg2fqKh77tvJ8glZGy9Pa3HFS5p0KtJ9Mi4GmtCrhTz7e+8qoGb3s53DcGOGzNYgy
 PJBg==
X-Gm-Message-State: AC+VfDxBe4fgGpQ6gaKmcdQZAmhMjuEOepap6kGeNf2kzX1w1P2KXcyZ
 ASami6G6Y8wfJqNhOo0RfQ8=
X-Google-Smtp-Source: ACHHUZ6F2FXg8uHYdsZkLFEFMNP7a1KIe0AMPEYR5KKoRUALJJ8c0cL/kyR+1tAgGrT+v0QoVyQYHg==
X-Received: by 2002:a05:6e02:c72:b0:340:ba06:b16a with SMTP id
 f18-20020a056e020c7200b00340ba06b16amr7876800ilj.3.1687234465308; 
 Mon, 19 Jun 2023 21:14:25 -0700 (PDT)
Received: from [10.104.2.174] (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 l186-20020a6391c3000000b0052c9d1533b6sm432097pge.56.2023.06.19.21.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 21:14:24 -0700 (PDT)
Message-ID: <7446c685-474d-c69a-2224-e73146987365@gmail.com>
Date: Tue, 20 Jun 2023 13:14:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
Subject: Re: [PATCH 06/13] drm/amdgpu: use the new drm_exec object for CS v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 boris.brezillon@collabora.com
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-7-christian.koenig@amd.com>
 <e163fa54-b016-1879-d1c0-840a4d3885b1@gmail.com>
Content-Language: en-US
In-Reply-To: <e163fa54-b016-1879-d1c0-840a4d3885b1@gmail.com>
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

On 6/20/23 13:07, Tatsuyuki Ishi wrote:
>> @@ -1296,9 +1271,8 @@ static int amdgpu_cs_submit(struct 
>> amdgpu_cs_parser *p,
>>        */
>>       r = 0;
>>       amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
>> -        struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
>> -
>> -        r |= !amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm, e->range);
>> +        r |= !amdgpu_ttm_tt_get_user_pages_done(e->bo->tbo.ttm,
>> +                            e->range);
>>           e->range = NULL;
> 
> e->range = NULL; needs to be removed, or it's causing *massive* memory 
> leaks.

Actually, I quoted the wrong hunk, the correct one is below.

> @@ -928,18 +874,56 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  		e->user_invalidated = userpage_invalidated;
>  	}
>  
> -	r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
> -				   &duplicates);
> -	if (unlikely(r != 0)) {
> -		if (r != -ERESTARTSYS)
> -			DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
> -		goto out_free_user_pages;
> +	drm_exec_while_not_all_locked(&p->exec) {
> +		r = amdgpu_vm_lock_pd(&fpriv->vm, &p->exec);
> +		drm_exec_continue_on_contention(&p->exec);
> +		if (unlikely(r))
> +			goto out_free_user_pages;
> +
> +		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> +			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base, 2);
> +			drm_exec_break_on_contention(&p->exec);
> +			if (unlikely(r))
> +				goto out_free_user_pages;
> +
> +			e->bo_va = amdgpu_vm_bo_find(vm, e->bo);
> +			e->range = NULL;

This causes the leak.

> +		}
> +		drm_exec_continue_on_contention(&p->exec);
> +
> +		if (p->uf_bo) {
> +			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
> +						 2);
> +			drm_exec_continue_on_contention(&p->exec);
> +			if (unlikely(r))
> +				goto out_free_user_pages;
> +		}
>  	}

Tatsuyuki
