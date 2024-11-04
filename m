Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10CF9BBE3B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 20:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B7E10E0CA;
	Mon,  4 Nov 2024 19:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lnVq2zqV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C5210E0CA;
 Mon,  4 Nov 2024 19:47:05 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2fb58980711so42006361fa.0; 
 Mon, 04 Nov 2024 11:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730749624; x=1731354424; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LJTAScS3K0llQzMuKYDLn1RSGzD1V0TfB/ZV9WBhbSI=;
 b=lnVq2zqVNutF7PX3TfWYcIFVxNFgGtl74P2jfl1svr0ryXmPoFmftyJDFqakfjTsKt
 JnkKdM/gsf+aZmK7ThD5IojW8U5K6GIUAGZurpMzARcQxDI73tvp6vio7xrIBJHTQStx
 Ig6uqVjwAkusFB2ROoUH5pLIv/aBBMdjq8uQAgUoitRZ6RVS398BRDFPo580RWXDOdDB
 8H7RxPqi8qmAH+5pJ8fE9qZdJKVAZYC67R9RNuJulZ0q6KqXq2Qowj/taB4WmSp1w17i
 Mwb6uUtewkh+LZfPv1b9k+9Z9FtZAgwM+T7tTDavkKXoTjWe3PRD5YEFDNaC/63QZD5G
 Ko6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730749624; x=1731354424;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LJTAScS3K0llQzMuKYDLn1RSGzD1V0TfB/ZV9WBhbSI=;
 b=cye2Ok1Gobl260hbWW6l0U/sbobSHLD5CcId9+jqWK7r56yfFte29Bnj23lsp+6rPR
 BLafVCeKmosP0Y7+ScP5ux4MkHXPFa5zlkY6iADJuahJ7LT/Txdy1iywsp+ozx0jSRj5
 eEsRcLNjQz0QJuY8HlPxSfhhL1WdKcJx3EJ0RV9gOT+pI//fCqNZMQgT8mDTXIxzvcSb
 +FnfnrGNZZ1Mhb33J3TOS9zpLbGoaE82qXd2HjH320C31Hg9gpB3PHEMaOBynmj1dKCc
 KCzejE/Amk2Ri9RW9leZZSDapTz87mDqzlvvufO+o6JDazl35aVvMtYYfzmVMcbH2RJl
 MVfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFdl1+c/Y70vurozNQ3icBSwh1KA9UlrPCsvJDxYOBwT6ly61wjV0W+2x7HRixlkjV2z6ZhcSH/Tk=@lists.freedesktop.org,
 AJvYcCXnmfYKkp6dMFkXwMaqpetHx8YDz7YKPlKhfOG627XZGcln/Imq3Q+m+G8rlU3814l73YUmOH+GlDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsDfRjR4Z8s/TyJ2NFsfaszP98NV1Onii5fOHxr3QoJy3QhqLq
 0kSM1SIeO8KiyuRdDhNkVJOwcBULUF2xUzSLKzsP/YXl99hA3KBK
X-Google-Smtp-Source: AGHT+IEE2IS201A8b/WMPub56FMmLrWcaoF5upJ53+isYJLL1/CL4SgDCjTsptqfjcNMhtX48DNWaA==
X-Received: by 2002:a05:6512:b84:b0:536:55a9:caf0 with SMTP id
 2adb3069b0e04-53b347231b4mr16938669e87.0.1730749623283; 
 Mon, 04 Nov 2024 11:47:03 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c0f9bbccsm14181086f8f.0.2024.11.04.11.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 11:47:02 -0800 (PST)
Message-ID: <eb0b672c-3300-4501-96c4-bc310b80f63e@gmail.com>
Date: Mon, 4 Nov 2024 20:47:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: matthew.auld@intel.com
References: <20241031181048.2948948-1-matthew.brost@intel.com>
 <20241031181048.2948948-3-matthew.brost@intel.com>
 <ZyQWF/k9VFo99tDB@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZyQWF/k9VFo99tDB@lstrano-desk.jf.intel.com>
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

Am 01.11.24 um 00:43 schrieb Matthew Brost:
> On Thu, Oct 31, 2024 at 11:10:42AM -0700, Matthew Brost wrote:
>> Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
>> VRAM easily be accessed. Add ttm_bo_access, which is similar to
>> ttm_bo_vm_access, to access such memory.
>>
>> v4:
>>   - Fix checkpatch warnings (CI)
>> v5:
>>   - Fix checkpatch warnings (CI)
>> v6:
>>   - Fix kernel doc (Auld)
>>
> Christian - Do you mind if I merge patch along with the rest of the
> series to drm-xe-next?

I don't see the original patch anywhere in my inbox, please make sure to 
CC me while sending things out.

Apart from that I absolutely don't see any justification for this patch. 
You move stuff into ttm_bo_util.c which not even remotely belongs in there.

Regards,
Christian.

>
> Matt
>
>> Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
>>   include/drm/ttm/ttm_bo.h          |  2 +
>>   3 files changed, 89 insertions(+), 64 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index d939925efa81..77e760ea7193 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>>   
>>   	return progress;
>>   }
>> +
>> +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
>> +			      unsigned long offset,
>> +			      void *buf, int len, int write)
>> +{
>> +	unsigned long page = offset >> PAGE_SHIFT;
>> +	unsigned long bytes_left = len;
>> +	int ret;
>> +
>> +	/* Copy a page at a time, that way no extra virtual address
>> +	 * mapping is needed
>> +	 */
>> +	offset -= page << PAGE_SHIFT;
>> +	do {
>> +		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
>> +		struct ttm_bo_kmap_obj map;
>> +		void *ptr;
>> +		bool is_iomem;
>> +
>> +		ret = ttm_bo_kmap(bo, page, 1, &map);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
>> +		WARN_ON_ONCE(is_iomem);
>> +		if (write)
>> +			memcpy(ptr, buf, bytes);
>> +		else
>> +			memcpy(buf, ptr, bytes);
>> +		ttm_bo_kunmap(&map);
>> +
>> +		page++;
>> +		buf += bytes;
>> +		bytes_left -= bytes;
>> +		offset = 0;
>> +	} while (bytes_left);
>> +
>> +	return len;
>> +}
>> +
>> +/**
>> + * ttm_bo_access - Helper to access a buffer object
>> + *
>> + * @bo: ttm buffer object
>> + * @offset: access offset into buffer object
>> + * @buf: pointer to caller memory to read into or write from
>> + * @len: length of access
>> + * @write: write access
>> + *
>> + * Utility function to access a buffer object. Useful when buffer object cannot
>> + * be easily mapped (non-contiguous, non-visible, etc...).
>> + *
>> + * Returns:
>> + * @len if successful, negative error code on failure.
>> + */
>> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>> +		  void *buf, int len, int write)
>> +{
>> +	int ret;
>> +
>> +	if (len < 1 || (offset + len) > bo->base.size)
>> +		return -EIO;
>> +
>> +	ret = ttm_bo_reserve(bo, true, false, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	switch (bo->resource->mem_type) {
>> +	case TTM_PL_SYSTEM:
>> +		fallthrough;
>> +	case TTM_PL_TT:
>> +		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
>> +		break;
>> +	default:
>> +		if (bo->bdev->funcs->access_memory)
>> +			ret = bo->bdev->funcs->access_memory
>> +				(bo, offset, buf, len, write);
>> +		else
>> +			ret = -EIO;
>> +	}
>> +
>> +	ttm_bo_unreserve(bo);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(ttm_bo_access);
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> index 2c699ed1963a..20b1e5f78684 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
>>   }
>>   EXPORT_SYMBOL(ttm_bo_vm_close);
>>   
>> -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
>> -				 unsigned long offset,
>> -				 uint8_t *buf, int len, int write)
>> -{
>> -	unsigned long page = offset >> PAGE_SHIFT;
>> -	unsigned long bytes_left = len;
>> -	int ret;
>> -
>> -	/* Copy a page at a time, that way no extra virtual address
>> -	 * mapping is needed
>> -	 */
>> -	offset -= page << PAGE_SHIFT;
>> -	do {
>> -		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
>> -		struct ttm_bo_kmap_obj map;
>> -		void *ptr;
>> -		bool is_iomem;
>> -
>> -		ret = ttm_bo_kmap(bo, page, 1, &map);
>> -		if (ret)
>> -			return ret;
>> -
>> -		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
>> -		WARN_ON_ONCE(is_iomem);
>> -		if (write)
>> -			memcpy(ptr, buf, bytes);
>> -		else
>> -			memcpy(buf, ptr, bytes);
>> -		ttm_bo_kunmap(&map);
>> -
>> -		page++;
>> -		buf += bytes;
>> -		bytes_left -= bytes;
>> -		offset = 0;
>> -	} while (bytes_left);
>> -
>> -	return len;
>> -}
>> -
>>   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>   		     void *buf, int len, int write)
>>   {
>> @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>   	unsigned long offset = (addr) - vma->vm_start +
>>   		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>>   		 << PAGE_SHIFT);
>> -	int ret;
>> -
>> -	if (len < 1 || (offset + len) > bo->base.size)
>> -		return -EIO;
>>   
>> -	ret = ttm_bo_reserve(bo, true, false, NULL);
>> -	if (ret)
>> -		return ret;
>> -
>> -	switch (bo->resource->mem_type) {
>> -	case TTM_PL_SYSTEM:
>> -		fallthrough;
>> -	case TTM_PL_TT:
>> -		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
>> -		break;
>> -	default:
>> -		if (bo->bdev->funcs->access_memory)
>> -			ret = bo->bdev->funcs->access_memory(
>> -				bo, offset, buf, len, write);
>> -		else
>> -			ret = -EIO;
>> -	}
>> -
>> -	ttm_bo_unreserve(bo);
>> -
>> -	return ret;
>> +	return ttm_bo_access(bo, offset, buf, len, write);
>>   }
>>   EXPORT_SYMBOL(ttm_bo_vm_access);
>>   
>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>> index 5804408815be..8ea11cd8df39 100644
>> --- a/include/drm/ttm/ttm_bo.h
>> +++ b/include/drm/ttm/ttm_bo.h
>> @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
>>   int ttm_bo_evict_first(struct ttm_device *bdev,
>>   		       struct ttm_resource_manager *man,
>>   		       struct ttm_operation_ctx *ctx);
>> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>> +		  void *buf, int len, int write);
>>   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>>   			     struct vm_fault *vmf);
>>   vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>> -- 
>> 2.34.1
>>

