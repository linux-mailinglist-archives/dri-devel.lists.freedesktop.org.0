Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AFA9288DA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 14:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85AC10E07C;
	Fri,  5 Jul 2024 12:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L0v++Hna";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F2510E07C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 12:41:38 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42648961d7aso11088405e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 05:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720183297; x=1720788097; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yVylWEKZHw3QN56Q2aAN+4BYrpsyrCUfinbyDm6984M=;
 b=L0v++HnaoIKCOFBn6BJJ0P8Je5HkwT66E1VI13neHC2Q4cC0e2reEvpmIFwB8HxyRA
 joG5qY6lRLs8BLLlG8FawtTR4H356O6x0ZRA/WN1bl5SAUtoq4sSc7JoCWYUyLh/xkYF
 m182m0+jMB58f1G5l/yRSBrBqdTNTGk3tDJrsaGw6puzDGwf0Edie1Oo18nBsEUIW1SR
 5raITfdAKmZIJdwKAWYrTjB4LCoB60Eup9O8r6dnASRH8ontrKW8d8/5hmDTkJftfrLE
 Qe54NJ0UiIgj6+TxrEJhX2s4fcaw526m/yIgt8Gemv4rSKw8aTfFnRrBFQ69hlYV4QMc
 Qjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720183297; x=1720788097;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yVylWEKZHw3QN56Q2aAN+4BYrpsyrCUfinbyDm6984M=;
 b=gPVvvIgu7Egxp1PPFd9qVNqhNt5doKM5tPy229tabhX7bHyIv7H88NAGLCrxBYUP4G
 rlnf44Oyc43DxKrrE05uGKn3+T+1PHM+FM/WVXsyDCmvwy2mdVkRg59Zt0bQ4hHRzdfF
 t72gm3oCa+hz74SGOsZyHfcku8TiJLD0daeU2lsgLISu3PlhPhux7om3GeXuBNYF3RTf
 wltTiuvFPsphmTOm6SE023Uzjgs2u5JK5vWCmCoiIzfwLtdKPJCRYkMA4q5C7jV/l0ug
 uPoD6lPOQ6bnXItZbSoeGeIaCsFIVEJ7ZHrZHNsG3/TKYvr1faK6JfcaHRPUtVcTif/n
 z4cg==
X-Gm-Message-State: AOJu0Yz9UoTi4fphe0GXpgjt/MPZaZy2GJ/W3WUjWGRZ4kWsJDeGRHRE
 DW+FSicdjKv3BBHyH1YHlQKRwMO6UIpzgOjIFism5Khu8p8unNqW
X-Google-Smtp-Source: AGHT+IGnUiKyDQI+P07ixLxi6nM11c2rYkBrBICW7UJ0PfD2OJXXMUUPmLTkzQA1bxykwOzIAj/8BA==
X-Received: by 2002:a05:600c:5126:b0:424:bb93:7aad with SMTP id
 5b1f17b1804b1-4264a36eebbmr36544645e9.0.1720183296347; 
 Fri, 05 Jul 2024 05:41:36 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36795d1fc9csm6171137f8f.83.2024.07.05.05.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jul 2024 05:41:35 -0700 (PDT)
Message-ID: <1aff22d6-09e4-42d9-9412-fc44ace145ac@gmail.com>
Date: Fri, 5 Jul 2024 14:41:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/exec: don't immediately add the prelocked obj
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240703132602.4756-1-christian.koenig@amd.com>
 <20240703132602.4756-3-christian.koenig@amd.com>
 <c2b5145c72a4d4598bfdde23c532f3f657f0c075.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <c2b5145c72a4d4598bfdde23c532f3f657f0c075.camel@linux.intel.com>
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

Am 03.07.24 um 17:51 schrieb Thomas Hellström:
> On Wed, 2024-07-03 at 15:25 +0200, Christian König wrote:
>> Some contended objects might never be locked again in the case of
>> eviction
>> handling for example.
>>
>> Make sure that those doesn't show up in the list of locked objects
>> until
>> they are explicitely mentioned.
> Could you be a bit more specific in the commit message about in what
> situations that is bad?

The prelocked object is not necessarily expected to be in the list of 
locked objects.

I ran into issues because amdgpu tried to validate all locked objects 
and so tried to also validate the prelocked one (which was only locked 
for eviction).

That obviously didn't made much sense.

Regards,
Christian.

>
> /Thomas
>
>
>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/drm_exec.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
>> index 2da094bdf8a4..220df336fbd9 100644
>> --- a/drivers/gpu/drm/drm_exec.c
>> +++ b/drivers/gpu/drm/drm_exec.c
>> @@ -61,8 +61,11 @@ static void drm_exec_unlock_all(struct drm_exec
>> *exec)
>>   		drm_gem_object_put(obj);
>>   	}
>>   
>> -	drm_gem_object_put(exec->prelocked);
>> -	exec->prelocked = NULL;
>> +	if (exec->prelocked) {
>> +		dma_resv_unlock(exec->prelocked->resv);
>> +		drm_gem_object_put(exec->prelocked);
>> +		exec->prelocked = NULL;
>> +	}
>>   }
>>   
>>   /**
>> @@ -179,16 +182,9 @@ static int drm_exec_lock_contended(struct
>> drm_exec *exec)
>>   		dma_resv_lock_slow(obj->resv, &exec->ticket);
>>   	}
>>   
>> -	ret = drm_exec_obj_locked(exec, obj);
>> -	if (unlikely(ret))
>> -		goto error_unlock;
>> -
>>   	exec->prelocked = obj;
>>   	return 0;
>>   
>> -error_unlock:
>> -	dma_resv_unlock(obj->resv);
>> -
>>   error_dropref:
>>   	drm_gem_object_put(obj);
>>   	return ret;
>> @@ -214,6 +210,10 @@ int drm_exec_lock_obj(struct drm_exec *exec,
>> struct drm_gem_object *obj)
>>   		return ret;
>>   
>>   	if (exec->prelocked == obj) {
>> +		ret = drm_exec_obj_locked(exec, obj);
>> +		if (unlikely(ret))
>> +			return ret;
>> +
>>   		drm_gem_object_put(exec->prelocked);
>>   		exec->prelocked = NULL;
>>   		return 0;

