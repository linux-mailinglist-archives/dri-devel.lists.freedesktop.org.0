Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DD67365DA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 10:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F317E10E17C;
	Tue, 20 Jun 2023 08:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0B210E17C;
 Tue, 20 Jun 2023 08:13:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3094910b150so4386457f8f.0; 
 Tue, 20 Jun 2023 01:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687248790; x=1689840790;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O5yWFB9+hW98sz5KC80vu4mKa/C9d9tRsTlC5NRvDfQ=;
 b=cYn6aP+uCFCx6PNEWy4fNxE5ZahWtw0h6VrQRHAL8jnHzXj6+ZTbNuQOoWbVkwk5Qi
 KbAwDuL8TwQzp8LOA1iiT9bVNfgdSrxb16RfwO7fxNZ28SYQsPZkRWzDY57E4tD+0Ut/
 K8R1hYXIa7jYD047RyCtGfz3h8lQUAWevX9UAKudoASFhEUxPKAsrIPgf6Yt1Jhcs+FC
 lZa+saR2q7ttCPnjoSjTt+3AoDHQ90ec3GL02mYRy1+P+kZEfn7Z5fBB5m0+9m2ohB+b
 RQlmT3NM/Yw+LS2O1libAirVwzcLkB8CINvo0euJCpusAiaYCcuBO7kG3abwk9S/cq7f
 5UxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687248790; x=1689840790;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O5yWFB9+hW98sz5KC80vu4mKa/C9d9tRsTlC5NRvDfQ=;
 b=AI6H2GX294Nd7psFhateGzT6Kh7YK0j9joPvctNAWpYmV9mDIRy2+0MvSv9/SAP9VG
 rOgRGCDAXfm3Sd1KOch6IsdlR+twwmEY+xYGaYF+s9htIBroBwK6z20xq2bGKeHhahU2
 mPdhZb8sj0zXfd1K4Bt+HnGirvpSO7jXR50N0MU/qk/UZnjlbGUg+5aj00Rp3M09DIrC
 Eqw2shBB6FupwpCpVPqR2TFyhTAXmLk4ec9+X6qaptFExJZEolwpobnbMBhSXGFJJ4WJ
 Ha60zX5NhKCxmbeh9f34yTWmjvkfEv1o+N4J2Pb4MEntvD0Y8yfrcrNk3Dxxif/G13LH
 nEZQ==
X-Gm-Message-State: AC+VfDzQQe2uWY4xv680SThBiZ2PjoOkOweDVtG5lhMbjjFvcSg+7v0P
 7tjF1BMrwIoEVWIK+kMH7ps=
X-Google-Smtp-Source: ACHHUZ5kdIMPqO/JdnX9JeJJ/ozTBPGh3jbUPuTO/VmWqNZcFnYmFSmjD+w63kNZEB9gpUjwWenhgA==
X-Received: by 2002:adf:f212:0:b0:30f:c622:b986 with SMTP id
 p18-20020adff212000000b0030fc622b986mr10251395wro.59.1687248790270; 
 Tue, 20 Jun 2023 01:13:10 -0700 (PDT)
Received: from ?IPV6:2a00:e180:154d:9c00:68d9:fc9c:8543:a6?
 ([2a00:e180:154d:9c00:68d9:fc9c:8543:a6])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a056000018700b003095bd71159sm1431226wrx.7.2023.06.20.01.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 01:13:09 -0700 (PDT)
Message-ID: <e1b3b356-a19f-b2d6-383b-e71bd9d26e84@gmail.com>
Date: Tue, 20 Jun 2023 10:13:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 06/13] drm/amdgpu: use the new drm_exec object for CS v2
Content-Language: en-US
To: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, francois.dugast@intel.com,
 felix.kuehling@amd.com, arunpravin.paneerselvam@amd.com,
 thomas_os@shipmail.org, dakr@redhat.com, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.brost@intel.com, boris.brezillon@collabora.com
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-7-christian.koenig@amd.com>
 <e163fa54-b016-1879-d1c0-840a4d3885b1@gmail.com>
 <7446c685-474d-c69a-2224-e73146987365@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <7446c685-474d-c69a-2224-e73146987365@gmail.com>
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

Am 20.06.23 um 06:14 schrieb Tatsuyuki Ishi:
> On 6/20/23 13:07, Tatsuyuki Ishi wrote:
>>> @@ -1296,9 +1271,8 @@ static int amdgpu_cs_submit(struct 
>>> amdgpu_cs_parser *p,
>>>        */
>>>       r = 0;
>>>       amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
>>> -        struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
>>> -
>>> -        r |= !amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm, 
>>> e->range);
>>> +        r |= !amdgpu_ttm_tt_get_user_pages_done(e->bo->tbo.ttm,
>>> +                            e->range);
>>>           e->range = NULL;
>>
>> e->range = NULL; needs to be removed, or it's causing *massive* 
>> memory leaks.
>
> Actually, I quoted the wrong hunk, the correct one is below.

Ah, yes that makes more sense. Going to take a look.

Thanks,
Christian.

>
>> @@ -928,18 +874,56 @@ static int amdgpu_cs_parser_bos(struct 
>> amdgpu_cs_parser *p,
>>          e->user_invalidated = userpage_invalidated;
>>      }
>>
>> -    r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
>> -                   &duplicates);
>> -    if (unlikely(r != 0)) {
>> -        if (r != -ERESTARTSYS)
>> -            DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
>> -        goto out_free_user_pages;
>> +    drm_exec_while_not_all_locked(&p->exec) {
>> +        r = amdgpu_vm_lock_pd(&fpriv->vm, &p->exec);
>> +        drm_exec_continue_on_contention(&p->exec);
>> +        if (unlikely(r))
>> +            goto out_free_user_pages;
>> +
>> +        amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>> +            r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base, 2);
>> +            drm_exec_break_on_contention(&p->exec);
>> +            if (unlikely(r))
>> +                goto out_free_user_pages;
>> +
>> +            e->bo_va = amdgpu_vm_bo_find(vm, e->bo);
>> +            e->range = NULL;
>
> This causes the leak.
>
>> +        }
>> +        drm_exec_continue_on_contention(&p->exec);
>> +
>> +        if (p->uf_bo) {
>> +            r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
>> +                         2);
>> +            drm_exec_continue_on_contention(&p->exec);
>> +            if (unlikely(r))
>> +                goto out_free_user_pages;
>> +        }
>>      }
>
> Tatsuyuki

