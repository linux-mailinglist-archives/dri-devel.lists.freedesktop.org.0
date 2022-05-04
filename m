Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0377D519F06
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 14:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4017A10EFC2;
	Wed,  4 May 2022 12:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B337410EFC2;
 Wed,  4 May 2022 12:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651666305; x=1683202305;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=C+h/rftgRKdb1i6UwOq/0z1PcO5ClpbUoFCjucqM6iM=;
 b=b9vyzU702BQBjYGPYhR78vS9scTbj85n06nPWMXMP8FNFDEE7WiedUcp
 PCI6qDMezGOzvqoY4eg/LZMsDNJoHDDgHR229jyHL/lwqYGWZdl8QUSoa
 /TV4pXcz0ruMS55TY7cOz6I7m8lxeVNDzQ6aH2mygEPH9FODHPBro8mxu
 tXRYWuXhZiVL69m07ZeH3esJ3PVk0nyTIYj66cNZLGOBku9BC8cM6AmEF
 q7i5cS2f3BklGYr0tZTDNLqLckoLOgrAVbvUxen3QUpo8EbId7Qmq2PXf
 ZkrhIoDvUWk3lmdnzAB81pns6sc1vJtGoX17leX4DJuaHKBGgsGX/QRtW A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267344641"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="267344641"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 05:11:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="664444001"
Received: from gidaly-mobl1.ger.corp.intel.com (HELO [10.213.236.183])
 ([10.213.236.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 05:11:43 -0700
Message-ID: <ab578c17-faa6-222f-f37e-d5cd4f45dfd0@linux.intel.com>
Date: Wed, 4 May 2022 13:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/i915: use IOMEM_ERR_PTR() directly
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220502034328.78486-1-wangkefeng.wang@huawei.com>
 <87h768s5f5.fsf@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87h768s5f5.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 02/05/2022 09:30, Jani Nikula wrote:
> On Mon, 02 May 2022, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>> Use IOMEM_ERR_PTR() instead of self defined IO_ERR_PTR().
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Pushed to drm-intel-gt-next, thanks for the patch and review!

Regards,

Tvrtko

> 
>> ---
>>   drivers/gpu/drm/i915/i915_vma.c | 4 ++--
>>   drivers/gpu/drm/i915/i915_vma.h | 1 -
>>   2 files changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index 94fcdb7bd21d..639605c89b7b 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -541,7 +541,7 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
>>   	int err;
>>   
>>   	if (WARN_ON_ONCE(vma->obj->flags & I915_BO_ALLOC_GPU_ONLY))
>> -		return IO_ERR_PTR(-EINVAL);
>> +		return IOMEM_ERR_PTR(-EINVAL);
>>   
>>   	if (!i915_gem_object_is_lmem(vma->obj)) {
>>   		if (GEM_WARN_ON(!i915_vma_is_map_and_fenceable(vma))) {
>> @@ -594,7 +594,7 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
>>   err_unpin:
>>   	__i915_vma_unpin(vma);
>>   err:
>> -	return IO_ERR_PTR(err);
>> +	return IOMEM_ERR_PTR(err);
>>   }
>>   
>>   void i915_vma_flush_writes(struct i915_vma *vma)
>> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
>> index 67ae7341c7e0..8e74972fdca3 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.h
>> +++ b/drivers/gpu/drm/i915/i915_vma.h
>> @@ -331,7 +331,6 @@ static inline bool i915_node_color_differs(const struct drm_mm_node *node,
>>    * Returns a valid iomapped pointer or ERR_PTR.
>>    */
>>   void __iomem *i915_vma_pin_iomap(struct i915_vma *vma);
>> -#define IO_ERR_PTR(x) ((void __iomem *)ERR_PTR(x))
>>   
>>   /**
>>    * i915_vma_unpin_iomap - unpins the mapping returned from i915_vma_iomap
> 
