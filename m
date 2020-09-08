Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1652627D1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD586E9D2;
	Wed,  9 Sep 2020 07:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAFD8930F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 15:35:55 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 088FYRJn136537;
 Tue, 8 Sep 2020 15:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=15pWPW/Ca41cmRWLeuMPyWbmipPwtweDunpubNIoPPI=;
 b=SVXTsDpSFwpPl2YQu4pQGURdmipzP4knX+vFsNr4Xf+nYLSlX4XYR3f5uayYcU6bwbQh
 rcWTxvH+qvnR5sfSliFIEg2QsTwDOZNTnXCp34PVu8bDs8lF5qFuQHDBAgxTtE3hUiFm
 EWHwEyXn4VAidUm5YyZA6h8Lnix8nXCgpJXSLuEMSUsz36PEPYCLv3TjVZDvzUt+/v8R
 uK1J8X+kMM8nCHSLIkuXWdDSsCkesnZ0a3wwnjae04wdh9PSq3WECNNilly14CPKB0pA
 zasqVOZyIhdi6ZesycNYUEZ7FmfAFl+ZwoK+c/Cv7TIn9f9n0wpdei+xbWpluqBLeeDC Mw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 33c2mkvaj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 08 Sep 2020 15:35:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 088FTXks100262;
 Tue, 8 Sep 2020 15:33:32 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 33dacj1nk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Sep 2020 15:33:32 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 088FXTdr008498;
 Tue, 8 Sep 2020 15:33:30 GMT
Received: from [10.175.177.246] (/10.175.177.246)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 08 Sep 2020 08:33:29 -0700
Subject: Re: [PATCH v4 11/23] device-dax: Kill dax_kmem_res
To: David Hildenbrand <david@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>
References: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
 <159643100485.4062302.976628339798536960.stgit@dwillia2-desk3.amr.corp.intel.com>
 <a3ad70a2-77a8-d50e-f372-731a8e27c03b@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <17686fcc-202e-0982-d0de-54d5349cfb5d@oracle.com>
Date: Tue, 8 Sep 2020 16:33:25 +0100
MIME-Version: 1.0
In-Reply-To: <a3ad70a2-77a8-d50e-f372-731a8e27c03b@redhat.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9738
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=1 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009080148
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9738
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 suspectscore=1 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009080148
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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

[Sorry for the late response]

On 8/21/20 11:06 AM, David Hildenbrand wrote:
> On 03.08.20 07:03, Dan Williams wrote:
>> @@ -37,109 +45,94 @@ int dev_dax_kmem_probe(struct device *dev)
>>  	 * could be mixed in a node with faster memory, causing
>>  	 * unavoidable performance issues.
>>  	 */
>> -	numa_node = dev_dax->target_node;
>>  	if (numa_node < 0) {
>>  		dev_warn(dev, "rejecting DAX region with invalid node: %d\n",
>>  				numa_node);
>>  		return -EINVAL;
>>  	}
>>  
>> -	/* Hotplug starting at the beginning of the next block: */
>> -	kmem_start = ALIGN(range->start, memory_block_size_bytes());
>> -
>> -	kmem_size = range_len(range);
>> -	/* Adjust the size down to compensate for moving up kmem_start: */
>> -	kmem_size -= kmem_start - range->start;
>> -	/* Align the size down to cover only complete blocks: */
>> -	kmem_size &= ~(memory_block_size_bytes() - 1);
>> -	kmem_end = kmem_start + kmem_size;
>> -
>> -	new_res_name = kstrdup(dev_name(dev), GFP_KERNEL);
>> -	if (!new_res_name)
>> +	res_name = kstrdup(dev_name(dev), GFP_KERNEL);
>> +	if (!res_name)
>>  		return -ENOMEM;
>>  
>> -	/* Region is permanently reserved if hotremove fails. */
>> -	new_res = request_mem_region(kmem_start, kmem_size, new_res_name);
>> -	if (!new_res) {
>> -		dev_warn(dev, "could not reserve region [%pa-%pa]\n",
>> -			 &kmem_start, &kmem_end);
>> -		kfree(new_res_name);
>> +	res = request_mem_region(range.start, range_len(&range), res_name);
> 
> I think our range could be empty after aligning. I assume
> request_mem_region() would check that, but maybe we could report a
> better error/warning in that case.
> 
dax_kmem_range() already returns a memory-block-aligned @range but
IIUC request_mem_region() isn't checking for that. Having said that
the returned @res wouldn't be different from the passed range.start.

>>  	/*
>>  	 * Ensure that future kexec'd kernels will not treat this as RAM
>>  	 * automatically.
>>  	 */
>> -	rc = add_memory_driver_managed(numa_node, new_res->start,
>> -				       resource_size(new_res), kmem_name);
>> +	rc = add_memory_driver_managed(numa_node, res->start,
>> +				       resource_size(res), kmem_name);
>> +
>> +	res->flags |= IORESOURCE_BUSY;
> 
> Hm, I don't think that's correct. Any specific reason why to mark the
> not-added, unaligned parts BUSY? E.g., walk_system_ram_range() could
> suddenly stumble over it - and e.g., similarly kexec code when trying to
> find memory for placing kexec images. I think we should leave this
> !BUSY, just as it is right now.
> 
Agreed.

>>  	if (rc) {
>> -		release_resource(new_res);
>> -		kfree(new_res);
>> -		kfree(new_res_name);
>> +		release_mem_region(range.start, range_len(&range));
>> +		kfree(res_name);
>>  		return rc;
>>  	}
>> -	dev_dax->dax_kmem_res = new_res;
>> +
>> +	dev_set_drvdata(dev, res_name);
>>  
>>  	return 0;
>>  }
>>  
>>  #ifdef CONFIG_MEMORY_HOTREMOVE
>> -static int dev_dax_kmem_remove(struct device *dev)
>> +static void dax_kmem_release(struct dev_dax *dev_dax)
>>  {
>> -	struct dev_dax *dev_dax = to_dev_dax(dev);
>> -	struct resource *res = dev_dax->dax_kmem_res;
>> -	resource_size_t kmem_start = res->start;
>> -	resource_size_t kmem_size = resource_size(res);
>> -	const char *res_name = res->name;
>>  	int rc;
>> +	struct device *dev = &dev_dax->dev;
>> +	const char *res_name = dev_get_drvdata(dev);
>> +	struct range range = dax_kmem_range(dev_dax);
>>  
>>  	/*
>>  	 * We have one shot for removing memory, if some memory blocks were not
>>  	 * offline prior to calling this function remove_memory() will fail, and
>>  	 * there is no way to hotremove this memory until reboot because device
>> -	 * unbind will succeed even if we return failure.
>> +	 * unbind will proceed regardless of the remove_memory result.
>>  	 */
>> -	rc = remove_memory(dev_dax->target_node, kmem_start, kmem_size);
>> -	if (rc) {
>> -		any_hotremove_failed = true;
>> -		dev_err(dev,
>> -			"DAX region %pR cannot be hotremoved until the next reboot\n",
>> -			res);
>> -		return rc;
>> +	rc = remove_memory(dev_dax->target_node, range.start, range_len(&range));
>> +	if (rc == 0) {
> 
> if (!rc) ?
> 
Better off would be to keep the old order:

	if (rc) {
		any_hotremove_failed = true;
		dev_err(dev, "%#llx-%#llx cannot be hotremoved until the next reboot\n",
				range.start, range.end);
	        return;
	}

	release_mem_region(range.start, range_len(&range));
	dev_set_drvdata(dev, NULL);
	kfree(res_name);
	return;


>> +		release_mem_region(range.start, range_len(&range));
> 
> remove_memory() does a release_mem_region_adjustable(). Don't you
> actually want to release the *unaligned* region you requested?
> 
Isn't it what we're doing here?
(The release_mem_region_adjustable() is using the same
dax_kmem-aligned range and there's no split/adjust)

Meaning right now (+ parent marked as !BUSY), and if I am understanding
this correctly:

request_mem_region(range.start, range_len)
   __request_region(iomem_res, range.start, range_len) -> alloc @parent
add_memory_driver_managed(parent.start, resource_size(parent))
   __request_region(parent.start, resource_size(parent)) -> alloc @child

[...]

remove_memory(range.start, range_len)
 request_mem_region_adjustable(range.start, range_len)
  __release_region(range.start, range_len) -> remove @child

release_mem_region(range.start, range_len)
  __release_region(range.start, range_len) -> doesn't remove @parent because !BUSY?

The add/removal of this relies on !BUSY. But now I am wondering if the parent remaining
unreleased is deliberate even on CONFIG_MEMORY_HOTREMOVE=y.

	Joao
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
