Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED547427CF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 15:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4072D10E130;
	Thu, 29 Jun 2023 13:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667AA10E0F8;
 Thu, 29 Jun 2023 13:58:15 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f8735ac3e3so1077209e87.2; 
 Thu, 29 Jun 2023 06:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688047093; x=1690639093;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4kITJlcrUmU8tHjuThxQLR7HDJZ6H3jRown+5txUCGE=;
 b=k5NWRUDKzqGetrVx9DY/IQtyO1mMepJPTSvVVsxm30HIWqBd6jnKk5JcAqusWMdB72
 QNJOxLZGcyhaN99epDTZIdu51J2Z3/tZXxm48Rlmb+a6UMVE8cWiq/LI1HCBBbA7z0bn
 nttnaIVLfJ+NH4lS2XkF2cHwuNz5aX/g4sAbYBkewpRUcwg4bo/PDtCpUDskIqfN50sD
 5MDJRE2AS0+13KJiHs8ra7x8uEkx324sseqE+dQaNBeTpNVTLdJouvOxTRHNgJ+PP4q1
 V36RaCwKWshp+XBsjLpnvQ7Y6DFrWzFq7hZCVL6Yi42dJADnDoknGHu2rxWSsWEbM150
 bVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688047093; x=1690639093;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4kITJlcrUmU8tHjuThxQLR7HDJZ6H3jRown+5txUCGE=;
 b=HG4X1fTWAVzl1VqIK/EleSIzIaz8C/EI4kFxWZsmdwJp/L6GbJT7GNfstWKxF1m7yz
 kskdIIIma1zeGWagW5bT/HsEhmehBJ7FXkiqlqFPyoMuMLqZGfvyPFKNSJvLRSmwaxy0
 CGpYvaLJ2qOPPyfLQUcH6yC/Rxi9FJXjsK4PMwATSHek0MR1C31vEtk+8KqseCK3T20J
 Zdszt3okZqhwCKpfFzp9Vtw7m71yAOIcphoH81k10rRQU9eZRx1cBT+XjOX51I/6UxGq
 HGY+CnpPyJ27rDJKCtm2gosAlXb9n1GNDQYU5ditMgTcs5fOVLPVFhBltErXeWTKwjDu
 UvEw==
X-Gm-Message-State: ABy/qLY1eefiAVhcwmSmrEfLwBwirGI5vF6SUyde370047u6lIwe0L3V
 N9Rae9mVbMNVRbjz7ezUIW4=
X-Google-Smtp-Source: APBJJlGtgxw4Ik0N+LuPBcuAJLmewIlSZNBjY9cNZUdMox0kqvrdUfBBUqXHY4sL7zn8L82ADsxxfQ==
X-Received: by 2002:a05:6512:1105:b0:4fb:744e:17db with SMTP id
 l5-20020a056512110500b004fb744e17dbmr65414lfg.1.1688047092575; 
 Thu, 29 Jun 2023 06:58:12 -0700 (PDT)
Received: from ?IPV6:2a00:e180:15af:8a00:54e3:8652:e343:aef4?
 ([2a00:e180:15af:8a00:54e3:8652:e343:aef4])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c290700b003fbb346279dsm3853504wmd.38.2023.06.29.06.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 06:58:12 -0700 (PDT)
Message-ID: <517a4b60-94bb-e683-b8be-ca3b71509cb5@gmail.com>
Date: Thu, 29 Jun 2023 15:58:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/6] drm/amdgpu: use the new drm_exec object for CS v2
Content-Language: en-US
To: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
References: <20230628104446.1369-1-christian.koenig@amd.com>
 <20230628104446.1369-7-christian.koenig@amd.com>
 <17e929a5-d94f-8370-6aad-cf93490c6ad7@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <17e929a5-d94f-8370-6aad-cf93490c6ad7@gmail.com>
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



Am 29.06.23 um 10:20 schrieb Tatsuyuki Ishi:
> On 6/28/23 19:44, Christian König wrote:
>> @@ -958,18 +904,57 @@ static int amdgpu_cs_parser_bos(struct 
>> amdgpu_cs_parser *p,
>>           e->user_invalidated = userpage_invalidated;
>>       }
>>   -    r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
>> -                   &duplicates);
>> -    if (unlikely(r != 0)) {
>> -        if (r != -ERESTARTSYS)
>> -            DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
>> -        goto out_free_user_pages;
>> +    drm_exec_until_all_locked(&p->exec) {
>> +        r = amdgpu_vm_lock_pd(&fpriv->vm, &p->exec, 1 + p->gang_size);
>> +        drm_exec_retry_on_contention(&p->exec);
>> +        if (unlikely(r))
>> +            goto out_free_user_pages;
>> +
>> +        amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>> +            /* One fence for TTM and one for each CS job */
>> +            r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base,
>> +                         1 + p->gang_size);
>> +            drm_exec_retry_on_contention(&p->exec);
>> +            if (unlikely(r))
>> +                goto out_free_user_pages;
>> +
>> +            e->bo_va = amdgpu_vm_bo_find(vm, e->bo);
>> +            e->range = NULL;
> Still leaking.

Scratching my head, I though I fixed this.

Thanks for pointing this out,
Christian.

>> +        }
>> +
>> +        if (p->uf_bo) {
>> +            r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
>> +                         1 + p->gang_size);
>> +            drm_exec_retry_on_contention(&p->exec);
>> +            if (unlikely(r))
>> +                goto out_free_user_pages;
>> +        }
>>       }
>

