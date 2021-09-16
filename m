Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B80940D8EE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85E86ED0A;
	Thu, 16 Sep 2021 11:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9266ED0D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 11:37:52 +0000 (UTC)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D10963FE02
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 11:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631792270;
 bh=908BDomxjWW13dJ+h5+IM/p6bjjEbnfsipmAx3G+qQk=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=TmHyCqKLEh4lMGmWRujkRmFghHu8m4wl8V/vJYKy5FdxC1UW9UZJ4hsnw8zhpgcw+
 tO4ljjsrIl5J62pBbrpoGV0RJyag/eUR1qx9EdH1U3q+xgr/taQIsUFX2MLDUbGoH2
 9IcZaJzogT4kaTc3t+5NuD6CqN/talFtvbCh601G8yVgXAvNCnFd5kHfVrNisY2GBU
 Js4wY7vCj5dyVUhDsHEVu/Ih3s7g2l6HhWmzUDmDE3oQQt5Gud/410pkdf1zEvMCsQ
 tooXzgpIHbcuaw1cQ31euBh2R+1WmhA2cGPV4gBs5XGNWdJ2ZD4pP/BeikCpXHggaV
 mlIZckdh4VhvA==
Received: by mail-pj1-f69.google.com with SMTP id
 s13-20020a17090a760d00b001996da9681dso4484485pjk.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 04:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=908BDomxjWW13dJ+h5+IM/p6bjjEbnfsipmAx3G+qQk=;
 b=MQ/d4K9E6Ymp2vZ3CVxbQ3XP9oG11fWV1hqDdoCPh3xOHiEDHL8CboefhRxclM+/X9
 Qh2aUmfe8Eg/7Ab0go7Rs/mizu1YokSmXjzWFQQkIFNTjXEz+1P7zW9Ts0i6J2T9Cg9b
 Wv+fvMFeMl9CHMDbhHfiFoB+cW/D+Dltj3Ac6C+IVbQ0oPKQvX60WjimeDb3ZQE5MJWy
 +KNxYnWOrysslqfX8LMnxO7nityXHKnnDF6aUszrJCK6FykzuRx7YDxjA9Sb5lvs306F
 MjI3MqKBfOa1BtH4zZsO2SjqR9ZIvUCJMrUQp1r3G2JArcdkt9szSSDbHB2Uj/ZIyKOV
 15ag==
X-Gm-Message-State: AOAM532/cZ4nip9h4M+1VXMV/9tjjNdsqab41aZYLRRY0ajRZZ4OY9+Z
 6z5P2OWNsa4UcFdj9R2l4m5UArYo+UgjVQlxLDLJLrHeWGOp0QP59k3LD7Wcur17y3z+PQ+wtVO
 yMChm/xn1+Ivcok8uRq8PsVDuNACYsITL9qUNUGe5yPcwlA==
X-Received: by 2002:a17:90b:1642:: with SMTP id
 il2mr14228767pjb.133.1631792269409; 
 Thu, 16 Sep 2021 04:37:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLagWl0Y6m5fry/PR5aoSchKNH70gRTQIBS9Soy65wMzgO8Re9fUCU8+kZz5YLK+ougSaEog==
X-Received: by 2002:a17:90b:1642:: with SMTP id
 il2mr14228747pjb.133.1631792269161; 
 Thu, 16 Sep 2021 04:37:49 -0700 (PDT)
Received: from [192.168.1.124] ([69.163.84.166])
 by smtp.gmail.com with ESMTPSA id j25sm2783466pff.34.2021.09.16.04.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 04:37:48 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH] drm/i915: zero fill vma name buffer
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210915192318.2061-1-tim.gardner@canonical.com>
 <7a653532-046d-c68a-3dc9-ef2deaf455f9@linux.intel.com>
 <87ee9ox0kv.fsf@intel.com>
From: Tim Gardner <tim.gardner@canonical.com>
Message-ID: <dc88e195-949c-bb46-b7d3-18e90df9b064@canonical.com>
Date: Thu, 16 Sep 2021 05:37:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87ee9ox0kv.fsf@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 9/16/21 4:43 AM, Jani Nikula wrote:
> On Thu, 16 Sep 2021, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>> On 15/09/2021 20:23, Tim Gardner wrote:
>>> In capture_vma() Coverity complains of a possible buffer overrun. Even
>>> though this is a static function where all call sites can be checked,
>>> limiting the copy length could save some future grief.
>>>
>>> CID 93300 (#1 of 1): Copy into fixed size buffer (STRING_OVERFLOW)
>>> 4. fixed_size_dest: You might overrun the 16-character fixed-size string c->name
>>>      by copying name without checking the length.
>>> 5. parameter_as_source: Note: This defect has an elevated risk because the
>>>      source argument is a parameter of the current function.
>>> 1326        strcpy(c->name, name);
>>>
>>> Fix any possible overflows by using strncpy(). Zero fill the name buffer to
>>> guarantee ASCII string NULL termination.
>>>
>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: intel-gfx@lists.freedesktop.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
>>> ---
>>>    drivers/gpu/drm/i915/i915_gpu_error.c | 7 ++++---
>>>    1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
>>> index 9cf6ac575de1..154df174e2d7 100644
>>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>>> @@ -1297,10 +1297,11 @@ static bool record_context(struct i915_gem_context_coredump *e,
>>>    	return simulated;
>>>    }
>>>    
>>> +#define VMA_NAME_LEN 16
>>>    struct intel_engine_capture_vma {
>>>    	struct intel_engine_capture_vma *next;
>>>    	struct i915_vma *vma;
>>> -	char name[16];
>>> +	char name[VMA_NAME_LEN];
>>>    };
>>>    
>>>    static struct intel_engine_capture_vma *
>>> @@ -1314,7 +1315,7 @@ capture_vma(struct intel_engine_capture_vma *next,
>>>    	if (!vma)
>>>    		return next;
>>>    
>>> -	c = kmalloc(sizeof(*c), gfp);
>>> +	c = kzalloc(sizeof(*c), gfp);
>>>    	if (!c)
>>>    		return next;
>>>    
>>> @@ -1323,7 +1324,7 @@ capture_vma(struct intel_engine_capture_vma *next,
>>>    		return next;
>>>    	}
>>>    
>>> -	strcpy(c->name, name);
>>> +	strncpy(c->name, name, VMA_NAME_LEN-1);
>>
>> GCC is supposed to catch any problems here as you say in the commit message.
>>
>> But to fix I suggest a single line change to strlcpy(c->name, name,
>> sizeof(c->name)) which always null terminates as bonus.
> 
> strscpy() is preferred over both strncpy() and strlcpy(). :)
> 
> BR,
> Jani.
> 

Good call. v2 on the way.

rtg

>>
>> Probably same in i915_vma_coredump_create() which with strncpy would
>> have a theoretical chance of attempting to copy over a
>> non-null-terminated string.
>>
>> Regards,
>>
>> Tvrtko
>>
>>>    	c->vma = vma; /* reference held while active */
>>>    
>>>    	c->next = next;
>>>
> 

-- 
-----------
Tim Gardner
Canonical, Inc
