Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A3C5BF845
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 09:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E1D10E8BE;
	Wed, 21 Sep 2022 07:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E76510E8B9;
 Wed, 21 Sep 2022 07:52:10 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id q21so7366582edc.9;
 Wed, 21 Sep 2022 00:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=7GXQJg1MtZ8u0ssW58yg/QC6ri/4B3Kry1/oczC1OUU=;
 b=W4swEwLo8lHMmMpipK74s7WK3AkF3zu/sEIJZps98+WkLdEnM3NrXAHLpYEPS8eNby
 uDawVOFg2osQCL6XlIUT3jsqacFNCSywY/gAowXffSDa+hloNvLjYXW+Sa7WxyqMUpwY
 WXr/7TCxz4qaERwbQJeuz9pQN640b2QFDLdcuHmbUdm2PBx90FmkMxN8FjEwf3RZzL+e
 XLurp04GO3tVJJHqC+YhJ+6iAtYxzVQ7xfXwxlc3Yodml1QH0dBb5AWvujISjofwx4WJ
 qmzFEwHb59kHIAXll3B7ectIAgi/jN+aJ8nrm3Vn4s5fCELhti/xHdwB/SLcurvqfXZh
 Nwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=7GXQJg1MtZ8u0ssW58yg/QC6ri/4B3Kry1/oczC1OUU=;
 b=j88mvvDYRNP6RGlQTLyK4oo3iBIczKrZd/iej/yW2zYRfxgQwjvSwHKXJrooudPvCo
 nzDiRiCU7Ki12t1yJ/AGGcVwFad/AkxuDkoXqH+N/ctwaFepZnyPWO1hToYtDF7LFRxS
 LFv35jnky0V9ZepIaPC7GMlBbukatykzfph6M0UbN2X1VNB+V0JTs9Vvfeg0qS+ZS5LE
 T/fm6ocNmEKVbyW3rCpKBOkqzTMDwYUoctojG0VobXX3lMrmXe6wOnqWQGdUYQJQMw4y
 Lmj7pTaPnmUFOGXLdEFJgs9fLzPaR51IREFBVHSAi7uMMu/RazZSLylsOuabFfyi7DV+
 2zNw==
X-Gm-Message-State: ACrzQf1JryO1uZlnd1p3FdwTHn4KzQA42agd/lHWY/dR7oGhDO+4ZUk7
 ACkW8XfZkVUjs/Ql4sDVaZUl8fRBHQg=
X-Google-Smtp-Source: AMsMyM4pmBzeeeZGzJ+3RNaMv0bo0KOQDaU5wlneY9YAzXjbG90o6Ztcb1JmqifVhcmesIZbci6SfQ==
X-Received: by 2002:a05:6402:3784:b0:453:9d2a:771b with SMTP id
 et4-20020a056402378400b004539d2a771bmr17918922edb.353.1663746728625; 
 Wed, 21 Sep 2022 00:52:08 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:77d1:43b9:2a25:bbed?
 ([2a02:908:1256:79a0:77d1:43b9:2a25:bbed])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a0564020f0900b0044e937ddcabsm1303203eda.77.2022.09.21.00.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 00:52:08 -0700 (PDT)
Message-ID: <0bd4f404-4340-9b3d-7a3b-baf6dc6e84ec@gmail.com>
Date: Wed, 21 Sep 2022 09:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/i915: Do not cleanup obj with NULL bo->resource
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, 
 intel-gfx@lists.freedesktop.org
References: <20220920170628.3391-1-nirmoy.das@intel.com>
 <180ffaa1-1739-5a84-b0e7-76685c577518@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <180ffaa1-1739-5a84-b0e7-76685c577518@intel.com>
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
Cc: anshuman.gupta@intel.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.09.22 um 19:13 schrieb Matthew Auld:
> On 20/09/2022 18:06, Nirmoy Das wrote:
>> For delayed BO release i915_ttm_delete_mem_notify()
>> gets called twice, once with proper bo->resource and
>> another time with NULL. We shouldn't do anything for
>> the 2nd time as we already cleanedup the obj once.
>>
>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/6850
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
> Christian, as per above it looks like ttm calls into the 
> delete_mem_notify() hook twice if the object ends up on the delayed 
> destroy list, is that expected/normal?

Yeah, that's expected. IIRC some driver depended on this for some reason.

I already wanted to change this behavior, but forgot to do so after the 
patch set which made bo->resource a pointer landed.

Going to look into it once more.

Thanks,
Christian.

>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 0544b0a4a43a..e3fc38dd5db0 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -511,7 +511,7 @@ static void i915_ttm_delete_mem_notify(struct 
>> ttm_buffer_object *bo)
>>       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>>       intel_wakeref_t wakeref = 0;
>>   -    if (likely(obj)) {
>> +    if (bo->resource && likely(obj)) {
>>           /* ttm_bo_release() already has dma_resv_lock */
>>           if (i915_ttm_cpu_maps_iomem(bo->resource))
>>               wakeref = 
>> intel_runtime_pm_get(&to_i915(obj->base.dev)->runtime_pm);

