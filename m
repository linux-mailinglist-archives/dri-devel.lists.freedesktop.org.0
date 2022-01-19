Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2292849413A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 20:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685B210F1CC;
	Wed, 19 Jan 2022 19:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBB510F1C1;
 Wed, 19 Jan 2022 19:49:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id EAFFE1F446F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642621751;
 bh=UIoafffS0/l3S1GB6KgQfq7k8XDj/WzZMnJi03jT+4w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NNcsmrQbUywS/Hicnx0DJF53N17Jr42HJKPIKGUJaxLaQTDR+kveaR+cFJf+fyfwu
 GMMAvv48j6+f2ZWTFED+g0ojdxBaXlOW8je2j2TQ1btl2H7c7kOhH7MTPs0+oJUxNe
 VMB8fv4YSY7acGIBIlEsEKeTVu4/kj5E1/QCWENbP/syauBoeVGSh0Bqti9t6vEzoi
 RwdnwaT3pL8jQEP8cZNjJRRVSRX6gVa9O2W2eegsEALXmPVxUyYqL66kgqm+KPE5f/
 QBtS3Nlvh6LqNmT7MNOB93OfVwHlr0lBZBcj49BeEuLuZwcxPu3Do5qhXcfZ/pRawh
 lRJA+NW1EyX0g==
Message-ID: <accbc66b-08ca-aa2a-92e6-4d65359e9bf4@collabora.com>
Date: Wed, 19 Jan 2022 19:49:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 4/4] drm/i915/uapi: document behaviour for DG2 64K
 support
Content-Language: en-US
To: Jordan Justen <jordan.l.justen@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220118175036.3840934-1-bob.beckett@collabora.com>
 <20220118175036.3840934-5-bob.beckett@collabora.com>
 <87zgnrefoo.fsf@jljusten-skl>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <87zgnrefoo.fsf@jljusten-skl>
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
Cc: Tony Ye <tony.ye@intel.com>, intel-gfx@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>, dri-devel@lists.freedesktop.org,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, mesa-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/01/2022 18:36, Jordan Justen wrote:
> Robert Beckett <bob.beckett@collabora.com> writes:
> 
>> From: Matthew Auld <matthew.auld@intel.com>
>>
>> On discrete platforms like DG2, we need to support a minimum page size
>> of 64K when dealing with device local-memory. This is quite tricky for
>> various reasons, so try to document the new implicit uapi for this.
>>
>> v2: Fixed suggestions on formatting [Daniel]
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>> cc: Simon Ser <contact@emersion.fr>
>> cc: Pekka Paalanen <ppaalanen@gmail.com>
>> Cc: Jordan Justen <jordan.l.justen@intel.com>
>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>> Cc: mesa-dev@lists.freedesktop.org
>> Cc: Tony Ye <tony.ye@intel.com>
>> Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
>> ---
>>   include/uapi/drm/i915_drm.h | 44 ++++++++++++++++++++++++++++++++-----
>>   1 file changed, 39 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 5e678917da70..486b7b96291e 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -1118,10 +1118,16 @@ struct drm_i915_gem_exec_object2 {
>>   	/**
>>   	 * When the EXEC_OBJECT_PINNED flag is specified this is populated by
>>   	 * the user with the GTT offset at which this object will be pinned.
>> +	 *
>>   	 * When the I915_EXEC_NO_RELOC flag is specified this must contain the
>>   	 * presumed_offset of the object.
>> +	 *
>>   	 * During execbuffer2 the kernel populates it with the value of the
>>   	 * current GTT offset of the object, for future presumed_offset writes.
>> +	 *
>> +	 * See struct drm_i915_gem_create_ext for the rules when dealing with
>> +	 * alignment restrictions with I915_MEMORY_CLASS_DEVICE, on devices with
>> +	 * minimum page sizes, like DG2.
>>   	 */
>>   	__u64 offset;
>>   
>> @@ -3145,11 +3151,39 @@ struct drm_i915_gem_create_ext {
>>   	 *
>>   	 * The (page-aligned) allocated size for the object will be returned.
>>   	 *
>> -	 * Note that for some devices we have might have further minimum
>> -	 * page-size restrictions(larger than 4K), like for device local-memory.
>> -	 * However in general the final size here should always reflect any
>> -	 * rounding up, if for example using the I915_GEM_CREATE_EXT_MEMORY_REGIONS
>> -	 * extension to place the object in device local-memory.
>> +	 *
>> +	 * **DG2 64K min page size implications:**
> 
> Long term, I'm not sure that the "**" (for emphasis) is needed here or
> below. It's interesting at the moment, but will be just another thing
> baked into the kernel/user code in a month from now. :)

fair point, I'll make it less shouty

> 
>> +	 *
>> +	 * On discrete platforms, starting from DG2, we have to contend with GTT
>> +	 * page size restrictions when dealing with I915_MEMORY_CLASS_DEVICE
>> +	 * objects.  Specifically the hardware only supports 64K or larger GTT
>> +	 * page sizes for such memory. The kernel will already ensure that all
>> +	 * I915_MEMORY_CLASS_DEVICE memory is allocated using 64K or larger page
>> +	 * sizes underneath.
>> +	 *
>> +	 * Note that the returned size here will always reflect any required
>> +	 * rounding up done by the kernel, i.e 4K will now become 64K on devices
>> +	 * such as DG2.
>> +	 *
>> +	 * **Special DG2 GTT address alignment requirement:**
>> +	 *
>> +	 * The GTT alignment will also need be at least 2M for  such objects.
>> +	 *
>> +	 * Note that due to how the hardware implements 64K GTT page support, we
>> +	 * have some further complications:
>> +	 *
>> +	 *   1) The entire PDE(which covers a 2MB virtual address range), must
>> +	 *   contain only 64K PTEs, i.e mixing 4K and 64K PTEs in the same
>> +	 *   PDE is forbidden by the hardware.
>> +	 *
>> +	 *   2) We still need to support 4K PTEs for I915_MEMORY_CLASS_SYSTEM
>> +	 *   objects.
>> +	 *
>> +	 * To keep things simple for userland, we mandate that any GTT mappings
>> +	 * must be aligned to and rounded up to 2MB. As this only wastes virtual
>> +	 * address space and avoids userland having to copy any needlessly
>> +	 * complicated PDE sharing scheme (coloring) and only affects GD2, this
>> +	 * id deemed to be a good compromise.
> 
> typos: GD2, id

thanks

> 
> Isn't much of this more relavent to the vma offset at exec time? Is
> there actually any new restriction on the size field during buffer
> creation?

No new restriction on size, just placement, which mesa is already doing.
The request for ack was just to get an ack from mesa folks that they are 
happy with the mandatory 2MB alignment for DG2 vma.

> 
> I see Matthew references these notes from the offset comments, so if the
> kernel devs prefer it here, then you can add my Acked-by on this patch.

thanks!

> 
> -Jordan
> 
>>   	 */
>>   	__u64 size;
>>   	/**
>> -- 
>> 2.25.1
