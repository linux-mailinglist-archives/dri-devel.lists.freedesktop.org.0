Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C5B5A957D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 13:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D0810E6C3;
	Thu,  1 Sep 2022 11:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619DE10E5C4;
 Thu,  1 Sep 2022 11:13:28 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id t5so22059006edc.11;
 Thu, 01 Sep 2022 04:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=bOmtw5g4LNMuq3kmG+XEH4z+0oX2BU5SCR8n2452RYE=;
 b=NOULVDm2OTpdbztjCwt17ChPCZQQmQkw0+0K1nbZIVDYxXyG1ONBQ5uPPVOBTRmR4h
 siv0S6I+X0vI1r0/ziFwkDGXL8FhUXa14AL2dZQKkoXpyf2tFKTdDqGPZK76hM5sV0b3
 S8ZX31O94fsWHamWQ0EOY1Ka7uCoLLIPvaVoBXf+LVFTL6npWkCm0tt9ZUFaUgBhgl/b
 V6CkMGzUbeORHnv3jeG1Cvs4JBgF7e2ppZeJYnEJM5Fd5KIJSprfKstM2PyCx+kyp+AE
 /heIhjtlsWkfzSBd4ceuLq9bXwoVKnJhyUTencZM37IDkxjsyh5tieV0QJKPnHlFXuv2
 eRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=bOmtw5g4LNMuq3kmG+XEH4z+0oX2BU5SCR8n2452RYE=;
 b=mLc34F6YkqkjHazoc/sCKGeOXJ/PScm2AOLQ2hAjt41dyeuIdIAOXT87+moHcznMgb
 HyJhiVToOvUvbhAmDqUKgjH7UTXCa8Wg1N5FtSxGPdHxApcsHSyfp+YbPdV/yo15JLKn
 2WkM6UHzIbADELn1erFlM+TkPmW4OsB36TOTiDensLWvkbVu4+P4V80FkaGqxpDJH+Le
 RFEssMyZLjx7YbWZGUaRlm7lPMOEaqKvC7myQYwfyKc5te6FdW1YeWS1xH629+zFLKqH
 358+Lb9JKOPoY+XbX/p6bC9yOsuU8McN65Q95JkWreOX1CzM70A5yLbbaojOqQ/7nFx8
 YW7Q==
X-Gm-Message-State: ACgBeo1wpDjc13ZzgDHPPY3//VccYpybqAo/0FR9FK7T5a6i4Laxe6xE
 eFge8XlJ4eQ/mpgcbQ8c+tQ=
X-Google-Smtp-Source: AA6agR4wBIrOY8CH0K03atdrZt00843IKr+z4LO8IcuknNRhDQFhHVcgmzFRXq2eJeviCEIiRMuSeg==
X-Received: by 2002:a05:6402:5190:b0:448:5bdb:b27d with SMTP id
 q16-20020a056402519000b004485bdbb27dmr17022303edd.49.1662030806756; 
 Thu, 01 Sep 2022 04:13:26 -0700 (PDT)
Received: from [192.168.178.21] (p4fc20ad4.dip0.t-ipconnect.de.
 [79.194.10.212]) by smtp.gmail.com with ESMTPSA id
 q19-20020a50aa93000000b0044a3ecc535esm1142420edc.89.2022.09.01.04.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 04:13:25 -0700 (PDT)
Message-ID: <e42b6dac-de91-249c-4ccd-a379e209d6b0@gmail.com>
Date: Thu, 1 Sep 2022 13:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/ttm: update bulk move object of ghost BO
Content-Language: en-US
To: ZhenGuo Yin <zhenguo.yin@amd.com>, amd-gfx@lists.freedesktop.org
References: <20220901092946.2030744-1-zhenguo.yin@amd.com>
 <df602f9a-d55e-e034-febd-ac15d76cfa28@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <df602f9a-d55e-e034-febd-ac15d76cfa28@gmail.com>
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
Cc: jingwen.chen2@amd.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.09.22 um 13:11 schrieb Christian König:
> Am 01.09.22 um 11:29 schrieb ZhenGuo Yin:
>> [Why]
>> Ghost BO is released with non-empty bulk move object. There is a
>> warning trace:
>> WARNING: CPU: 19 PID: 1582 at ttm/ttm_bo.c:366 
>> ttm_bo_release+0x2e1/0x2f0 [amdttm]
>> Call Trace:
>>    amddma_resv_reserve_fences+0x10d/0x1f0 [amdkcl]
>>    amdttm_bo_put+0x28/0x30 [amdttm]
>>    amdttm_bo_move_accel_cleanup+0x126/0x200 [amdttm]
>>    amdgpu_bo_move+0x1a8/0x770 [amdgpu]
>>    ttm_bo_handle_move_mem+0xb0/0x140 [amdttm]
>>    amdttm_bo_validate+0xbf/0x100 [amdttm]
>>
>> [How]
>> The resource of ghost BO should be moved to LRU directly, instead of
>> using bulk move. The bulk move object of ghost BO should set to NULL
>> before function ttm_bo_move_to_lru_tail_unlocked.
>>
>> Fixed:·5b951e487fd6bf5f·("drm/ttm:·fix·bulk·move·handling·v2")
>> Signed-off-by: ZhenGuo Yin <zhenguo.yin@amd.com>
>
> Good catch, but the fix is not 100% correct. Please rather just NULL 
> the member while initializing the BO structure.
>
> E.g. something like this:
>
>  ....
>  fbo->base.pin_count = 0;
> +fbo->base.bulk_move= NULL;
>  if (bo->type != ttm_bo_type_sg)
>  ....

On the other hand thinking about it that won't work either.

You need to set bulk_move to NULL manually in an else clauses or 
something like this.

Regards,
Christian.

>
> Thanks,
> Christian.
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index 1cbfb00c1d65..a90bbbd91910 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -238,6 +238,7 @@ static int ttm_buffer_object_transfer(struct 
>> ttm_buffer_object *bo,
>>         if (fbo->base.resource) {
>>           ttm_resource_set_bo(fbo->base.resource, &fbo->base);
>> +        ttm_bo_set_bulk_move(&fbo->base, NULL);
>>           bo->resource = NULL;
>>       }
>

