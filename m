Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E43A414225
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 08:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90306EA52;
	Wed, 22 Sep 2021 06:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA116EA52;
 Wed, 22 Sep 2021 06:48:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t8so3740069wri.1;
 Tue, 21 Sep 2021 23:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=UVuG9PyyEke7kqa6mTkW5GbJagaxKZkGtdj11KXgU6U=;
 b=WoAFkIbXl6uVtT2Dnazq/WQeIHOiEo+q3m9BDgObRZsa9pVo9QmD69oOae2vWtkBu9
 g4z61j4X7psfEUplmODssPSd+zzWIfsn/0NhzvRIy5sDUy1mWTiCXuPlZFjEtN9bW8X3
 2Eu0q1gm7pro7D/zCeOfP5MFla4VKOS/0GAeiwPRpF2BA7sqVUIJmZg5I17MeLjYcpGY
 acbqydsbviMZFsyP7Y2D+j25TQ6fDXnBMaYx8sgicCd1MftUXJS9ltZOageiJ7557grJ
 8iTIft/5dnIxpdKx39mFWTcyNtaNJwicvmBCpUPDV2inqB2JTpxMyc2rlInp79maJ+Va
 JRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UVuG9PyyEke7kqa6mTkW5GbJagaxKZkGtdj11KXgU6U=;
 b=1lWL6bRxSKuZnuMKIFd0HDcN21S0F53NLxAT8p5RhNo4A+olHdSA3PgkYwQUCJU7ZV
 nkXKc2iC8lUUP2njh0pzc+qEmfzTnXG9CUE7ZdVxWpb3dKTvUDGC6LzFA+goFTmdq7qu
 x2yeYtkzsH/8z1TxPLUhhQNfS4o/A4UoVhtmxrvOZHXfDPTRrt9TqcIThMV86V8K2X5x
 TlFdPR7CskOwEIV14UV6NsI/tvopq59C4anFLqIwLl60zjimyeGyiwsXXrOlHlR7woDC
 Whqjd74rF1PYIuoRhUCYioUzDa/phjtzkOGkimVv0ueNvxPx1jxuLD6Ig+3oHW1+UEO6
 M3Vw==
X-Gm-Message-State: AOAM530/oXoR0mKd2woUpclBsQo4sXtJnKTXILFXxj8OSooUaGteeenB
 WN31piineNWupjOSx/lVoLY=
X-Google-Smtp-Source: ABdhPJzVOExKnxtnqzGyvHLB4FRCqqIZ28v6T1VWtPNmqDKIYNykYbFd8haMSDmcDXqcJKqBhjgXNg==
X-Received: by 2002:a05:6000:2cd:: with SMTP id
 o13mr28880861wry.193.1632293308278; 
 Tue, 21 Sep 2021 23:48:28 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id g22sm4620213wmp.39.2021.09.21.23.48.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 23:48:27 -0700 (PDT)
Subject: Re: [PATCH 2/2] Add drm buddy manager support to amdgpu driver
To: "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "matthew.auld@intel.com" <matthew.auld@intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20210920192110.221153-1-Arunpravin.PaneerSelvam@amd.com>
 <adf913fd-da60-70b5-2a83-608d8b8b9cba@amd.com>
 <MN2PR12MB4342C3996173DC4DB6B34FC9E4A19@MN2PR12MB4342.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <16c9b28c-9272-f841-2f68-f04d7c50b996@gmail.com>
Date: Wed, 22 Sep 2021 08:48:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <MN2PR12MB4342C3996173DC4DB6B34FC9E4A19@MN2PR12MB4342.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Am 21.09.21 um 17:51 schrieb Paneer Selvam, Arunpravin:
> [AMD Public Use]
>
> Hi Christian,
> Please find my comments.

A better mail client might be helpful for mailing list communication. I 
use Thunderbird, but Outlook with appropriate setting should do as well.

>
> Thanks,
> Arun
> -----Original Message-----
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: Tuesday, September 21, 2021 2:34 PM
> To: Paneer Selvam, Arunpravin <Arunpravin.PaneerSelvam@amd.com>; dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; matthew.auld@intel.com; daniel@ffwll.ch; Deucher, Alexander <Alexander.Deucher@amd.com>
> Subject: Re: [PATCH 2/2] Add drm buddy manager support to amdgpu driver
>
> Am 20.09.21 um 21:21 schrieb Arunpravin:
> [SNIP]
>> +	struct list_head blocks;
>> +};
>> +
>> +static inline struct amdgpu_vram_mgr_node *
>> +to_amdgpu_vram_mgr_node(struct ttm_resource *res) {
>> +	return container_of(container_of(res, struct ttm_range_mgr_node, base),
>> +			struct amdgpu_vram_mgr_node, tnode); }
>> +
> Maybe stuff that in a separate amdgpu_vram_mgr.h file together with all the other defines for the vram manager.
>
> Arun - I thought about it, will create a new header file for vram manager

Maybe make that a separate patch before this one here.

>> +	if (mode == DRM_BUDDY_ALLOC_RANGE) {
>> +		r = drm_buddy_alloc_range(mm, &vnode->blocks,
>> +				(uint64_t)place->fpfn << PAGE_SHIFT, pages << PAGE_SHIFT);
> That handling won't work. It's possible that you need contiguous memory in a specific range.
>
> Arun - the existing default backend range handler allocates contiguous nodes in power of 2 finding the MSB's of
> the any given size. We get linked nodes (depends on the requested size) in continuous range of address.
> Example, for the size 768 pages request, we get 512 + 256 range of continuous address in 2 nodes.
>
> It works by passing the fpfn and the requested size, the backend handler calculates the lpfn by adding fpfn + size = lpfn.
> The drawback here are we are not handling the specific lpfn value (as of now it is calculated using the fpfn + requested size)
> and not following the pages_per_node rule.
>
> Please let me know if this won't work for all specific fpfn / lpfn cases

 From your description that sounds like it won't work at all for any cases.

See the fpfn/lpfn specifies the range of allocation. For the most common 
case that's either 0..visible_vram or 0..start_of_some_hw_limitation.

When you always try to allocate the range from 0 you will quickly find 
that you clash with existing allocations.

What you need to do in general is to have a drm_buddy_alloc() which is 
able to limit the returned page to the desired range fpfn..lpfn.

>> +
>> +			do {
>> +				unsigned int order;
>> +
>> +				order = fls(n_pages) - 1;
>> +				BUG_ON(order > mm->max_order);
>> +
>> +				spin_lock(&mgr->lock);
>> +				block = drm_buddy_alloc(mm, order, bar_limit_enabled,
>> +									visible_pfn, mode);
> That doesn't seem to make much sense either. The backend allocator should not care about the BAR size nor the visible_pfn.
>
> Arun - we are sending the BAR limit enable information (in case of APU or large BAR, we take different approach) and visible_pfn
> Information.
>
> In case of bar_limit_enabled is true, I thought visible_pfn required for the backend allocator to compare with the block start address
> and find the desired blocks for the TOP-DOWN and BOTTOM-UP approach (TOP-DOWN - return blocks higher than the visible_pfn limit,
> BOTTOM-UP - return blocks lower than the visible_pfn limit).
>
> In case of bar_limit_enabled is false, we just return the top ordered blocks and bottom most blocks for the TOP-DOWN and BOTTOM-UP
> respectively (suitable for APU and Large BAR case).
>
> Please let me know if we have other way to fix this problem

That is the completely wrong approach. The backend must not care about 
the BAR configuration and visibility of the VRAM.

What it should do instead is to take the fpfn..lpfn range into account 
and make sure that all allocated pages are in the desired range.

BOTTOM-UP vs. TOP-DOWN then just optimizes the algorithm because we 
insert all freed up TOP-DOWN pages at the end and all BOTTOM-UP pages at 
the front and on new allocations walk the lest of free pages from the 
front or back depending on the flag.

>
>> +				spin_unlock(&mgr->lock);
>>    
>> -		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
>> -		amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
>> -		pages_left -= pages;
>> -		++i;
>> +				if (IS_ERR(block)) {
>> +					r = -ENOSPC;
>> +					goto error_free_blocks;
>> +				}
>>    
>> -		if (pages > pages_left)
>> -			pages = pages_left;
>> +				n_pages -= BIT(order);
>> +
>> +				list_add_tail(&block->link, &vnode->blocks);
>> +
>> +				if (!n_pages)
>> +					break;
>> +			} while (1);
>> +
>> +			pages_left -= pages;
>> +			++i;
>> +
>> +			if (pages > pages_left)
>> +				pages = pages_left;
>> +		}
>>    	}
>> +
>> +	spin_lock(&mgr->lock);
>> +	list_sort(NULL, &vnode->blocks, sort_blocks);
> Why do you sort the list here?
>
> Regards,
> Christian.
>
> Arun - It gave better GLmark2 score when we sort the blocks in ascending order,
> Its not required, I will remove it

Interesting.  Maybe add a TODO comment so that somebody could 
investigate why that happens.

Regards,
Christian.
