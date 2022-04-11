Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645374FBDF5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 15:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A8510E052;
	Mon, 11 Apr 2022 13:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F62210E10D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:58:36 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b15so18550935edn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 06:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cQDE7B8OjjP5bzCOTtdbrBlg09bIxVPi7SIEZbhjnBU=;
 b=TSF17WxOfA68WPNIPPFhDimCvGOovKRlkvPByaJakg0pyyQ7bs16MN/pAdwOECZGsv
 snsxkvRe6LvIazQPg3AbnfNAe1NdDoQm/fIRKQR6XvV6r4GNN/j+6Cg+SgOWxl/fjHQ/
 bWId1KjlRcgH8lHh5RsduRZPfIErEMD2juLgWHN+nMuy9qbBWdDsu4LrCLIVXkY0UweA
 DcI+Q1jQpi4G7FEtR21oPNH/K6vNZ7d4GCvHtXbkPu0Z2sVQvbIpF7PMVaYl8pG6AnQ8
 wnt1+FHJJDGw1F9RH56ia1QOCs1l7Vz6pG8lTpwMDKNmU4YPnekMM4/6QnkhH/W0dcjT
 Y9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cQDE7B8OjjP5bzCOTtdbrBlg09bIxVPi7SIEZbhjnBU=;
 b=S306PAIpPk0o+0EJjrYoDNtyemWgM6JD3N1Sd4SncCtEgpQvIPF4yzmhFiDnWcFK3m
 n8APl5V5ntoH5SQi3v3+zZ9AlLK6bChzy0wAzteLi0qGV2b3tS8wAHt0ojZ2r1cd3lzW
 CMOJo+4IQgjgIorVQSIGITk/W0ueHPH9fJzwvZPQzxGLN4l6c6fNQA6M667CGQxUeZDo
 8DDDetyhIzjU5ivW9tcyeEvTbSmDOwWCgTUYRU1XWtEViJ7egA3KDLBrfYNYb0vrgL2o
 g0Bu2VOOR5h4xAnbb8eBHkUoRF9JJV5XkCMwC/xwSd/NdAo/+NUmoSev1dl4+4OsHXoK
 cO2A==
X-Gm-Message-State: AOAM530OI4H+1T3fLeQ5uW/+P629tcHLg3v/tVoFaE+m+yH6L10mSceu
 8mxUdSteQoe4YG/3ww5LfXQ=
X-Google-Smtp-Source: ABdhPJz9HAeaWqL/Yy2FdYB4iw/jiB5Cjn1agfWW0caMT9lpm1hLMpoLZp7UwHmDVM/NDFvkXZfzAg==
X-Received: by 2002:a05:6402:22b5:b0:41d:7637:98b8 with SMTP id
 cx21-20020a05640222b500b0041d763798b8mr8447250edb.69.1649685515229; 
 Mon, 11 Apr 2022 06:58:35 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:b3e9:56a3:6bb9:f974?
 ([2a02:908:1252:fb60:b3e9:56a3:6bb9:f974])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a50be8b000000b0041cdd4a7bf6sm9860115edk.58.2022.04.11.06.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 06:58:34 -0700 (PDT)
Message-ID: <093fce13-f52c-ee8d-6a4d-7a9174ae0ca0@gmail.com>
Date: Mon, 11 Apr 2022 15:58:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/ttm: fix logic inversion in ttm_eu_reserve_buffers
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
References: <20220411134537.2854-1-christian.koenig@amd.com>
 <ba95cca1-9aa3-edfd-3462-ab8afb2314d6@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ba95cca1-9aa3-edfd-3462-ab8afb2314d6@intel.com>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.04.22 um 15:55 schrieb Matthew Auld:
> On 11/04/2022 14:45, Christian König wrote:
>> That should have been max, not min.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Fixes: 73511edf8b19 ("dma-buf: specify usage while adding fences to 
>> dma_resv obj v7")
>
> Should that rather be:
>
> Fixes: c8d4c18bfbc4 ("dma-buf/drivers: make reserving a shared slot 
> mandatory v4")

Ah, yes good point. Thanks.

>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_execbuf_util.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c 
>> b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
>> index 0eb995d25df1..dbee34a058df 100644
>> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
>> @@ -101,7 +101,7 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx 
>> *ticket,
>>               continue;
>>           }
>>   -        num_fences = min(entry->num_shared, 1u);
>> +        num_fences = max(entry->num_shared, 1u);
>>           if (!ret) {
>>               ret = dma_resv_reserve_fences(bo->base.resv,
>>                                 num_fences);

