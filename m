Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5705FECCC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 12:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1162F10E72C;
	Fri, 14 Oct 2022 10:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EEE10E9D9;
 Fri, 14 Oct 2022 10:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665745099; x=1697281099;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8WHP7256XgL6r+GHZnM4u3uombJFm6QP9tixwB4AJ5U=;
 b=nvlq0pMpNSTvMXkEmDiMAt1QlOiNQoUAji6c10Ai187Ptt89JhcPF/37
 rTuqwP4xbehux4YYkbkVy8H8wy/+Gs6UTN/IJG7ThKEOR3CN/YCcFJBgh
 9CaxcXzwreWbk1fmbtEJxbTsuN3eBN7IVGr7z8X5aCMRBYbDvYj4X855k
 ox1/wMKCaCxLz7B2xjxEn3nwSaYAz8lNfR/Ncl0LIvJOzS5ESYMF7D6uW
 SoYURRClkRtWiBmVUMN5j9fwik0tsxYX/U2tC7jbaHP2mnezElkYo6HBf
 Gz+jhzmOvroE82u9e6H/sgeGdg02JS5102c1J/lopf6PYuPmXmFMnYiCD Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="285737545"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; d="scan'208";a="285737545"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 03:58:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="629899238"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; d="scan'208";a="629899238"
Received: from salamu-mobl1.ger.corp.intel.com (HELO [10.252.11.69])
 ([10.252.11.69])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 03:58:14 -0700
Message-ID: <466153a3-59ef-e91f-d267-ff9c777eccb9@intel.com>
Date: Fri, 14 Oct 2022 11:58:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [PATCH v3 2/2] drm/i915/uapi: expose GTT alignment
Content-Language: en-GB
To: Jordan Justen <jordan.l.justen@intel.com>, intel-gfx@lists.freedesktop.org
References: <20221004114915.221708-1-matthew.auld@intel.com>
 <20221004114915.221708-2-matthew.auld@intel.com>
 <166573205234.1044993.5297661838478296333@jljusten-skl.local>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <166573205234.1044993.5297661838478296333@jljusten-skl.local>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Yang A Shi <yang.a.shi@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, dri-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/10/2022 08:20, Jordan Justen wrote:
> Acked-by: Jordan Justen <jordan.l.justen@intel.com>

Thanks. Can I take that as ack for merging the series from Mesa POV? I 
think Lionel was going to test this, but I think keeps getting swamped 
with other stuff. We kind of urgently need to land this series.

> 
> On 2022-10-04 04:49:15, Matthew Auld wrote:
>> On some platforms we potentially have different alignment restrictions
>> depending on the memory type. We also now have different alignment
>> restrictions for the same region across different kernel versions.
>> Extend the region query to return the minimum required GTT alignment.
>>
>> Testcase: igt@gem_create@create-ext-placement-alignment
>> Testcase: igt@i915_query@query-regions-sanity-check
>> Suggested-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Michal Mrozek <michal.mrozek@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Cc: Jordan Justen <jordan.l.justen@intel.com>
>> Cc: Yang A Shi <yang.a.shi@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_query.c |  1 +
>>   include/uapi/drm/i915_drm.h       | 29 +++++++++++++++++++++++++++--
>>   2 files changed, 28 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
>> index 6ec9c9fb7b0d..111377f210ed 100644
>> --- a/drivers/gpu/drm/i915/i915_query.c
>> +++ b/drivers/gpu/drm/i915/i915_query.c
>> @@ -498,6 +498,7 @@ static int query_memregion_info(struct drm_i915_private *i915,
>>                  info.region.memory_class = mr->type;
>>                  info.region.memory_instance = mr->instance;
>>                  info.probed_size = mr->total;
>> +               info.gtt_alignment = mr->min_page_size;
>>   
>>                  if (mr->type == INTEL_MEMORY_LOCAL)
>>                          info.probed_cpu_visible_size = mr->io_size;
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 08d69e36fb66..2e613109356b 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -3346,8 +3346,33 @@ struct drm_i915_memory_region_info {
>>          /** @region: The class:instance pair encoding */
>>          struct drm_i915_gem_memory_class_instance region;
>>   
>> -       /** @rsvd0: MBZ */
>> -       __u32 rsvd0;
>> +       union {
>> +               /** @rsvd0: MBZ */
>> +               __u32 rsvd0;
>> +               /**
>> +                * @gtt_alignment:
>> +                *
>> +                * The minimum required GTT alignment for this type of memory.
>> +                * When allocating a GTT address it must be aligned to this
>> +                * value or larger. On some platforms the kernel might opt to
>> +                * using 64K pages for I915_MEMORY_CLASS_DEVICE, where 64K GTT
>> +                * pages can then be used if we also use 64K GTT alignment.
>> +                *
>> +                * NOTE: If this is zero then this must be an older
>> +                * kernel which lacks support for this field.
>> +                *
>> +                * Side note: For larger objects (especially for
>> +                * I915_MEMORY_CLASS_DEVICE), like 2M+ in size, userspace should
>> +                * consider potentially bumping the GTT alignment to say 2M,
>> +                * which could potentially increase the likelihood of the kernel
>> +                * being able to utilise 2M GTT pages underneath, if the layout
>> +                * of the physical pages allows it.  On some configurations we
>> +                * can then also use a more efficient page-table layout, if we
>> +                * can't use the more desirable 2M GTT page, so long as we know
>> +                * that the entire page-table will be used by this object.
>> +                */
>> +               __u32 gtt_alignment;
>> +       };
>>   
>>          /**
>>           * @probed_size: Memory probed by the driver
>> -- 
>> 2.37.3
>>
