Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E348751A5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 15:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF75410F75F;
	Thu,  7 Mar 2024 14:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KbhypRNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C2410F75F;
 Thu,  7 Mar 2024 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709821086;
 bh=Dn57lnoeVPIi4ikb1eziAXS3zRHAGY/C1w2CfJ2RGII=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=KbhypRNXRGEBkNA6+Yn9VOXA9F9z8ZBGeSo1SxnOhiDY9Z42hf0L5WaqUkcidj7sx
 Czf2eHnygAIjlMdmrWgTUtMc6Uddx65Z/tao/xvdvtEA/WADl9Lh1p8I/Fq1rBlfNp
 b7RvGez5E0szPzORGg4Cnuc05s/bYrei9slOPoC4YzDcJSPQNb1T/QdXJmiLLPv1CH
 IEeVvEQ7zi+9itsufwirqc7UvHWIgNf/KpmPjn67BLGAgVV7a+nFBnbo1jAphcwLcc
 KyYG2dD9pW7aVcz8vX2DI6BbSF/B82S/AaL3yhQwQEZrnUpOQoI9z7kcbv/+YKTNnp
 eXQlnYUdxcxWg==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id ED3B737809D0;
 Thu,  7 Mar 2024 14:18:01 +0000 (UTC)
Message-ID: <52f6475c-680c-4709-b64a-8b5be03d2343@collabora.com>
Date: Thu, 7 Mar 2024 11:18:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/ci: update device type for volteer devices
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 guilherme.gallo@collabora.com, robdclark@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240307021841.100561-1-vignesh.raman@collabora.com>
 <a8ae3ca9-67d5-4d83-90e8-2777862473d7@collabora.com>
In-Reply-To: <a8ae3ca9-67d5-4d83-90e8-2777862473d7@collabora.com>
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



On 07/03/2024 10:21, Helen Koike wrote:
> 
> 
> On 06/03/2024 23:18, Vignesh Raman wrote:
>> Volteer devices in the collabora lab are categorized under the
>> asus-cx9400-volteer device type. The majority of these units
>> has an Intel Core i5-1130G7 CPU, while some of them have a
>> Intel Core i7-1160G7 CPU instead. So due to this difference,
>> new device type template is added for the Intel Core i5-1130G7
>> and i7-1160G7 variants of the Acer Chromebook Spin 514 (CP514-2H)
>> volteer Chromebooks. So update the same in drm-ci.
>>
>> https://gitlab.collabora.com/lava/lava/-/merge_requests/149
>>
>> Fixes: 0119c894ab0d ("drm: Add initial ci/ subdirectory")
>> Reviewed-by: David Heidelberg <david.heidelberg@collabora.com>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> 
> Acked-by: Helen Koike <helen.koike@collabora.com>

Applied to drm-misc-next.

> 
> Thanks
> Helen
> 
>> ---
>>
>> v2:
>>    - Add fixes tag so change gets propagated to stable.
>>      
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1119672
>>
>> v3:
>>    - Fix checkpatch warning.
>>      Please use correct Fixes: style 'Fixes: <12 chars of sha1> 
>> ("<title line>")'
>>
>> ---
>>   drivers/gpu/drm/ci/test.yml | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 0857773e5c5f..8bc63912fddb 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -252,11 +252,11 @@ i915:cml:
>>   i915:tgl:
>>     extends:
>>       - .i915
>> -  parallel: 8
>> +  parallel: 5
>>     variables:
>> -    DEVICE_TYPE: asus-cx9400-volteer
>> +    DEVICE_TYPE: acer-cp514-2h-1130g7-volteer
>>       GPU_VERSION: tgl
>> -    RUNNER_TAG: mesa-ci-x86-64-lava-asus-cx9400-volteer
>> +    RUNNER_TAG: mesa-ci-x86-64-lava-acer-cp514-2h-1130g7-volteer
>>   .amdgpu:
>>     extends:
