Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 853D72752D0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 10:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4919B6E8F9;
	Wed, 23 Sep 2020 08:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA806E8F9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 08:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600848285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=N48g0ejR7+vnU9zZ+7/ssBxVKHOZrfIs9xMj3k/315g=;
 b=di9RU7yU1QC4mHS9bTsXTcgy470qzpleSkeu05q40alMyJkLxiqWN+zadBxPsPH0X3RVoY
 TZ8mSRVkSBSzeJUvHTNKnbCC3e+8Vbr5aL0r/IcelZ7bJmcCCJTp4xcPC6ayx6QwpC8YYW
 NI2xUg4/iRLTX6P6uEqTTdpNW6SI9F0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-ZcDCLb34Nnea1KP1GqBCnA-1; Wed, 23 Sep 2020 04:04:41 -0400
X-MC-Unique: ZcDCLb34Nnea1KP1GqBCnA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B6EA1018F64;
 Wed, 23 Sep 2020 08:04:39 +0000 (UTC)
Received: from [10.36.112.54] (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A319C5C26B;
 Wed, 23 Sep 2020 08:04:36 +0000 (UTC)
Subject: Re: [PATCH v4 11/23] device-dax: Kill dax_kmem_res
To: Joao Martins <joao.m.martins@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>
References: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
 <159643100485.4062302.976628339798536960.stgit@dwillia2-desk3.amr.corp.intel.com>
 <a3ad70a2-77a8-d50e-f372-731a8e27c03b@redhat.com>
 <17686fcc-202e-0982-d0de-54d5349cfb5d@oracle.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <9acc6148-72eb-7016-dba9-46fa87ded5a5@redhat.com>
Date: Wed, 23 Sep 2020 10:04:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <17686fcc-202e-0982-d0de-54d5349cfb5d@oracle.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>, ard.biesheuvel@linaro.org,
 peterz@infradead.org, Vishal Verma <vishal.l.verma@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-acpi@vger.kernel.org, linux-nvdimm@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08.09.20 17:33, Joao Martins wrote:
> [Sorry for the late response]
> 
> On 8/21/20 11:06 AM, David Hildenbrand wrote:
>> On 03.08.20 07:03, Dan Williams wrote:
>>> @@ -37,109 +45,94 @@ int dev_dax_kmem_probe(struct device *dev)
>>>  	 * could be mixed in a node with faster memory, causing
>>>  	 * unavoidable performance issues.
>>>  	 */
>>> -	numa_node = dev_dax->target_node;
>>>  	if (numa_node < 0) {
>>>  		dev_warn(dev, "rejecting DAX region with invalid node: %d\n",
>>>  				numa_node);
>>>  		return -EINVAL;
>>>  	}
>>>  
>>> -	/* Hotplug starting at the beginning of the next block: */
>>> -	kmem_start = ALIGN(range->start, memory_block_size_bytes());
>>> -
>>> -	kmem_size = range_len(range);
>>> -	/* Adjust the size down to compensate for moving up kmem_start: */
>>> -	kmem_size -= kmem_start - range->start;
>>> -	/* Align the size down to cover only complete blocks: */
>>> -	kmem_size &= ~(memory_block_size_bytes() - 1);
>>> -	kmem_end = kmem_start + kmem_size;
>>> -
>>> -	new_res_name = kstrdup(dev_name(dev), GFP_KERNEL);
>>> -	if (!new_res_name)
>>> +	res_name = kstrdup(dev_name(dev), GFP_KERNEL);
>>> +	if (!res_name)
>>>  		return -ENOMEM;
>>>  
>>> -	/* Region is permanently reserved if hotremove fails. */
>>> -	new_res = request_mem_region(kmem_start, kmem_size, new_res_name);
>>> -	if (!new_res) {
>>> -		dev_warn(dev, "could not reserve region [%pa-%pa]\n",
>>> -			 &kmem_start, &kmem_end);
>>> -		kfree(new_res_name);
>>> +	res = request_mem_region(range.start, range_len(&range), res_name);
>>
>> I think our range could be empty after aligning. I assume
>> request_mem_region() would check that, but maybe we could report a
>> better error/warning in that case.
>>
> dax_kmem_range() already returns a memory-block-aligned @range but
> IIUC request_mem_region() isn't checking for that. Having said that
> the returned @res wouldn't be different from the passed range.start.
> 
>>>  	/*
>>>  	 * Ensure that future kexec'd kernels will not treat this as RAM
>>>  	 * automatically.
>>>  	 */
>>> -	rc = add_memory_driver_managed(numa_node, new_res->start,
>>> -				       resource_size(new_res), kmem_name);
>>> +	rc = add_memory_driver_managed(numa_node, res->start,
>>> +				       resource_size(res), kmem_name);
>>> +
>>> +	res->flags |= IORESOURCE_BUSY;
>>
>> Hm, I don't think that's correct. Any specific reason why to mark the
>> not-added, unaligned parts BUSY? E.g., walk_system_ram_range() could
>> suddenly stumble over it - and e.g., similarly kexec code when trying to
>> find memory for placing kexec images. I think we should leave this
>> !BUSY, just as it is right now.
>>
> Agreed.
> 
>>>  	if (rc) {
>>> -		release_resource(new_res);
>>> -		kfree(new_res);
>>> -		kfree(new_res_name);
>>> +		release_mem_region(range.start, range_len(&range));
>>> +		kfree(res_name);
>>>  		return rc;
>>>  	}
>>> -	dev_dax->dax_kmem_res = new_res;
>>> +
>>> +	dev_set_drvdata(dev, res_name);
>>>  
>>>  	return 0;
>>>  }
>>>  
>>>  #ifdef CONFIG_MEMORY_HOTREMOVE
>>> -static int dev_dax_kmem_remove(struct device *dev)
>>> +static void dax_kmem_release(struct dev_dax *dev_dax)
>>>  {
>>> -	struct dev_dax *dev_dax = to_dev_dax(dev);
>>> -	struct resource *res = dev_dax->dax_kmem_res;
>>> -	resource_size_t kmem_start = res->start;
>>> -	resource_size_t kmem_size = resource_size(res);
>>> -	const char *res_name = res->name;
>>>  	int rc;
>>> +	struct device *dev = &dev_dax->dev;
>>> +	const char *res_name = dev_get_drvdata(dev);
>>> +	struct range range = dax_kmem_range(dev_dax);
>>>  
>>>  	/*
>>>  	 * We have one shot for removing memory, if some memory blocks were not
>>>  	 * offline prior to calling this function remove_memory() will fail, and
>>>  	 * there is no way to hotremove this memory until reboot because device
>>> -	 * unbind will succeed even if we return failure.
>>> +	 * unbind will proceed regardless of the remove_memory result.
>>>  	 */
>>> -	rc = remove_memory(dev_dax->target_node, kmem_start, kmem_size);
>>> -	if (rc) {
>>> -		any_hotremove_failed = true;
>>> -		dev_err(dev,
>>> -			"DAX region %pR cannot be hotremoved until the next reboot\n",
>>> -			res);
>>> -		return rc;
>>> +	rc = remove_memory(dev_dax->target_node, range.start, range_len(&range));
>>> +	if (rc == 0) {
>>
>> if (!rc) ?
>>
> Better off would be to keep the old order:
> 
> 	if (rc) {
> 		any_hotremove_failed = true;
> 		dev_err(dev, "%#llx-%#llx cannot be hotremoved until the next reboot\n",
> 				range.start, range.end);
> 	        return;
> 	}
> 
> 	release_mem_region(range.start, range_len(&range));
> 	dev_set_drvdata(dev, NULL);
> 	kfree(res_name);
> 	return;
> 
> 
>>> +		release_mem_region(range.start, range_len(&range));
>>
>> remove_memory() does a release_mem_region_adjustable(). Don't you
>> actually want to release the *unaligned* region you requested?
>>
> Isn't it what we're doing here?
> (The release_mem_region_adjustable() is using the same
> dax_kmem-aligned range and there's no split/adjust)
> 
> Meaning right now (+ parent marked as !BUSY), and if I am understanding
> this correctly:
> 
> request_mem_region(range.start, range_len)
>    __request_region(iomem_res, range.start, range_len) -> alloc @parent
> add_memory_driver_managed(parent.start, resource_size(parent))
>    __request_region(parent.start, resource_size(parent)) -> alloc @child
> 
> [...]
> 
> remove_memory(range.start, range_len)
>  request_mem_region_adjustable(range.start, range_len)
>   __release_region(range.start, range_len) -> remove @child
> 
> release_mem_region(range.start, range_len)
>   __release_region(range.start, range_len) -> doesn't remove @parent because !BUSY?
> 
> The add/removal of this relies on !BUSY. But now I am wondering if the parent remaining
> unreleased is deliberate even on CONFIG_MEMORY_HOTREMOVE=y.
> 
> 	Joao
> 

Thinking about it, if we don't set the parent resource BUSY (which is
what I think is the right way of doing things), and don't want to store
the parent resource pointer, we could add something like
lookup_resource() - e.g., lookup_mem_resource() - , however, searching
properly in the whole hierarchy (instead of only the first level), and
traversing down to the last hierarchy. Then it would be as simple as

remove_memory(range.start, range_len)
res = lookup_mem_resource(range.start);
release_resource(res);

-- 
Thanks,

David / dhildenb

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
