Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A667366EE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 11:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E597510E17D;
	Tue, 20 Jun 2023 09:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E0E10E17D;
 Tue, 20 Jun 2023 09:04:59 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6687b209e5aso478384b3a.0; 
 Tue, 20 Jun 2023 02:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687251898; x=1689843898;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FGn0Qo0rVtuq1KXF4Qu5pYNH5naIdt/5xwodLnmvyKc=;
 b=GO2Q7mnwru22PtDDWaWyVJe/NlSlD+H2eegdhYGRtv8MXJR3RrEDqHvT/TAZBMpgcj
 np1NPrcUkmx4oU21JebZz2AAWDehm9rYqp2uN7XfoQ0KE4rWd0OI5LFtNez/5L9CUj99
 CPsscpxH+MvJGyWR8hRWX3pIYjbOfY5DLdppB5OFY0xrgmk0qM2CepEfLh9G9iQ4esB6
 KFVajhbSL+IDWq28FNESUfuRhVeBBR2RYgH4SxPhVgTVvTla/loxBTJVoP5XTQ2xveCt
 IDbrSl6vRW4Lv97dXQDEx8Xa10gcMSSz6KhbGnpkblIXKb47Vm03m3nPTg4dVYJkFvph
 ev+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687251898; x=1689843898;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FGn0Qo0rVtuq1KXF4Qu5pYNH5naIdt/5xwodLnmvyKc=;
 b=ENeKSDOmZL9KrIf31GDOZ16Wpq1KhuJiAlux0fUzzJP7pmfu7StVwk9GhpKcZ1VEUe
 NjAJs6/6dkmzTWTwBQUuPVY5qJsPSbP4lhT4jX9PkEDQlNaznKfkKQyf1DL5wccO4i8i
 VOcijMv8/4VA4onousBU8tLgUyMqkOwapoHo1LQZr7nV2npWsVeZfFLz0aOoJfUrbHlR
 ERnJJX9JElJQifhfdeItHR/xCAacbfoElAoni7kZmSzBoC5mrMoOejHaVmuwKQxpIoI1
 s9iDlZJiAZpUVj6BJiB1C0ClFDX5XTCwY9OBNFCdV3P42ngImScQSyut8xRL6JYm64lP
 DlbQ==
X-Gm-Message-State: AC+VfDyOodRbu3eWKMfrxBi8faSdU5TwacSuubOZPvZv3Zj9UsyfaI/Z
 LIVbJFwgngY4OC5R6d67vlo=
X-Google-Smtp-Source: ACHHUZ5Es9/9Wm/v/rb4ZWeHx+aSXpYa0GHAMlTAgFSw7iIV5wTyuxXtSZX+LseI/I9tVUaHK549wQ==
X-Received: by 2002:a05:6a20:8426:b0:11f:7829:6d6c with SMTP id
 c38-20020a056a20842600b0011f78296d6cmr11891536pzd.3.1687251898331; 
 Tue, 20 Jun 2023 02:04:58 -0700 (PDT)
Received: from [10.104.2.174] (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 26-20020aa7925a000000b0064ff331b0b3sm910268pfp.127.2023.06.20.02.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 02:04:57 -0700 (PDT)
Message-ID: <9d9b3168-dffc-5171-215c-a6294f04d3eb@gmail.com>
Date: Tue, 20 Jun 2023 18:04:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 06/13] drm/amdgpu: use the new drm_exec object for CS v2
Content-Language: en-US
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 boris.brezillon@collabora.com
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-7-christian.koenig@amd.com>
 <e163fa54-b016-1879-d1c0-840a4d3885b1@gmail.com>
 <08169925-eb0b-bc79-e6f1-1eaa26198f5e@gmail.com>
 <34606cc5-7ef8-3d68-659d-fcfa35dd10e8@gmail.com>
In-Reply-To: <34606cc5-7ef8-3d68-659d-fcfa35dd10e8@gmail.com>
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

On 6/20/23 17:16, Tatsuyuki Ishi wrote:
> On 6/20/23 17:12, Christian König wrote:
>> Am 20.06.23 um 06:07 schrieb Tatsuyuki Ishi:
>>>> @@ -928,18 +874,56 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>>>           e->user_invalidated = userpage_invalidated;
>>>>       }
>>>>   -    r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
>>>> -                   &duplicates);
>>>> -    if (unlikely(r != 0)) {
>>>> -        if (r != -ERESTARTSYS)
>>>> -            DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
>>>> -        goto out_free_user_pages;
>>>> +    drm_exec_while_not_all_locked(&p->exec) {
>>>> +        r = amdgpu_vm_lock_pd(&fpriv->vm, &p->exec);
>>>> +        drm_exec_continue_on_contention(&p->exec);
>>>
>>> Duplicate handling is needed for pretty much every call of amdgpu_vm_lock_pd, as bo->tbo.base.resv == vm->root.bo->tbo.base.resv for AMDGPU_GEM_CREATE_VM_ALWAYS_VALID.
>>
>> Well no. AMDGPU_GEM_CREATE_VM_ALWAYS_VALID means that BOs should *not* be part of the relocation list. So when those cause an EALREADY here then userspace has a bug.
> 
> Sounds fair, lemme check how RADV is handling this again.

I checked again and relocation list was actually fine, but other places were not. For example amdgpu_gem_object_close
locks both bo->tbo.base.resv and vm->root.bo->tbo.base.resv (PD) on its own.

This was the easily debuggable case since it caused an error log but some other BO operations on ALWAYS_VALID
is also presumably broken due to the same reason.

Tatsuyuki
