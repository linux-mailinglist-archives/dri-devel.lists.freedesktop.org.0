Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE55AD2AF7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 02:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502EC10E04A;
	Tue, 10 Jun 2025 00:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="pjxKQkns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 54010 seconds by postgrey-1.36 at gabe;
 Tue, 10 Jun 2025 00:45:37 UTC
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com
 [162.62.57.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA30610E04A;
 Tue, 10 Jun 2025 00:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1749516329;
 bh=eh0MKFXwRSKJeN6xSCf1HbT1d8FUKtrqXJ+Dp8MAsIQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=pjxKQknsZV1+5nEsvPA1d38Tjq3RF7JxJuK0VuGzRDfy9w+4QcckJE0KE9Ku/y3kj
 0dgkQa97ghkUrObVtFeAVflLLvWnydTXh/Ske8vYeLll+7CcJxuIrCPhTKPSpe7peu
 7dG3nDOJWwCKkHGP5+VtJxjXtwm6vskj5/HWzPhk=
Received: from [192.168.3.19] ([218.4.27.159])
 by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
 id B4787495; Tue, 10 Jun 2025 08:45:07 +0800
X-QQ-mid: xmsmtpt1749516307twxekh8mx
Message-ID: <tencent_1EB006F3EADC43F9710EC002C328BC474B09@qq.com>
X-QQ-XMAILINFO: MStTOrhA1CLVe8QmYEvkvgVwbij+zYPHXHa/ukbjGk7o/rxjTDwq8lMuHcxyEC
 ZbPs0GxvKyk5ETXRRnvIKReAnq9O0vHbhyzxBlK/K/LAt1a3skGrvaEo5c31smC9oEevs3jNbLDq
 lm1ERe1RSzUOBQXs9Fa/d5J/t+BlT4uVb4YbTd2NLQXppUSQYGQgxLLqIpEBsNdoQJauWVblw2ze
 wLk/m+1euA6o363+TWfPQtrVABlYRCjckiGpIN7MsjDblVpxXoKxVGuLo/k+ogd8WxnzcAwpzct4
 WboutieCsggDtEISQI8KzA18Gbq/EQ1HacOcFZqcfVDw55xMxNb5xMbB3KxyYZVvzwYrQxqitHkq
 jyMBqaJbDAVdgqba9GHFOLZUwNdR4ohutnDBsyDmGl1pq2e8vcdtOlp9eJcwQfXcAE2m/HR32v+Z
 Rz7vEIM+de/FAU60U1EwinndkwEp9iYRQwja5el7eKijAm66f/KLRBdbgvbh7UncJelyHYQRFroV
 /dOPLnu4BF96cOH2vDILkVEB8DUoXHQ4aDCJ8EP2TUOluqQkwC9l1CS5hdJwEM/2gDrKI6Km3HlC
 kQRYILYYBRaLE7BpzkmSTTfEfx0umnWkPQq5TxhRR7WlfXtDocNO4W9TuhMrDrDZppnqSjnHs+ph
 DYQqcQ9zzDgHtetsf46gvwxx21pzgCPIumrAu9RMGeauj+phFxAwYnrxq42Hs7/nxTuZEzWK8/hm
 fcyaXv7u4/YuuKkPZZrWkDtqpdSH4k0QGuD+HQWpucoHE3DU4bD/nwKXV31aQpM924egN6N0cfXz
 bAzzBiXXUt/TU/0xtWOKQDAhilgNJ+KTyIZ1qvHtSP3g9qsBJyn111uyz8nEBM12faS3GLiHfard
 pTdeaR1JNHyJWyZwBIIVus8fZh96QAcqT8234GHp4bQfCwirEcK1DRnQQaDbODN0qulrhMd22tI2
 +zWNIReNWt9LFE0Po5mkhZq9RFV79G2o2TUjeeYozucxriZWNif4Tnd9ayQDVQeZcgAg3727hpLF
 N/PL6Gg2bvvO8cCUFFfTfjrCoyR3hiPM93dXA5k3wY59J/cK/qCq6zXgH4xyU=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-OQ-MSGID: <f8f78ac6-4fdb-4f75-ba8b-e146ddf58bad@foxmail.com>
Date: Tue, 10 Jun 2025 08:45:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdkfd: register HMM dev memory to DMA-able range
 first
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <tencent_03FB073FD3015AE02485DD6839D6571EBC06@qq.com>
 <560baf50-1bc5-473c-9889-59f7d625ddd9@amd.com>
Content-Language: en-US
From: francisco_flynn <francisco_flynn@foxmail.com>
In-Reply-To: <560baf50-1bc5-473c-9889-59f7d625ddd9@amd.com>
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

On 6/9/25 20:46, Felix Kuehling wrote:
> On 2025-06-09 5:36, francisco_flynn wrote:
>> HMM device memory is allocated at the top of
>> iomem_resource, when iomem_resource is larger than
>> GPU device's dma mask, after devm_memremap_pages,
>> max_pfn will also be update and exceed device's
>> dma mask, when there are multiple card on system
>> need to be init, ttm_device_init would be called
>> with use_dma32=true, and this is not necessary at
>> all. let's request dev memory region at DMA-able
>> range first.
> That doesn't make sense to me. The addresses allocated here are not DMA addresses. They cannot be accessed by the GPU via DMA. They are purely fictional addresses for the purposes of creating struct pages for device-private memory. There should be no need to limit them by the GPU's DMA mask.


yes, this address is used by CPU to access VRAM. The patch is intended 
to cope with a special case, after checking the latest kernel code, i 
found this problem has been solved by this commit,

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=7170130e4c72ce0caa0cb42a1627c635cc262821

thanks for you reply.

Best regards,
flynn


> Regards,
>    Felix
>
>
>> Signed-off-by: francisco_flynn <francisco_flynn@foxmail.com>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> index 79251f22b702..3856b9fd2a70 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> @@ -1020,6 +1020,7 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
>>   	struct amdgpu_kfd_dev *kfddev = &adev->kfd;
>>   	struct dev_pagemap *pgmap;
>>   	struct resource *res = NULL;
>> +	struct resource temp_res = iomem_resource;
>>   	unsigned long size;
>>   	void *r;
>>   
>> @@ -1042,7 +1043,10 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
>>   		pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
>>   		pgmap->type = MEMORY_DEVICE_COHERENT;
>>   	} else {
>> -		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
>> +		temp_res.end = dma_get_mask(adev->dev);
>> +		res = devm_request_free_mem_region(adev->dev, &temp_res, size);
>> +		if (IS_ERR(res))
>> +			res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
>>   		if (IS_ERR(res))
>>   			return PTR_ERR(res);
>>   		pgmap->range.start = res->start;

