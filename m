Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC03689444
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 10:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD0710E203;
	Fri,  3 Feb 2023 09:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276D110E203
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675417600; x=1706953600;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xdffIUHA+7+J+16AG2rhvVGHZkGMMU1Otb3Wlnns3A8=;
 b=TgvntGkvy5kqR4jubw4RH5HFclqJnSRU0pq0Hb8n674JnBLXnkE0R0/m
 a/5NFTwamTt2lClxg7RnVuYOCI9qt+rAqG1DRitl59ttQjMh5lSNJ/jDB
 TsYKqaRlvN0JoyjMWL7X3uumF8ZL1F3AXWKR6hdGk8FvTVjey3Htj0TXr
 A/Uo9o+w0EABU56XaV3/cbsvmC9Y7954YW4llMRbYLiGexQnu74O9ep0R
 tNvJ5M3M0aBfp9e8pnd9ZVASk2LpNNSFdns7KPU3TCI2vkNLGAS1DHDq5
 BgzRBfvjXXdKjkh1ICUj9nCta7bvotgxkwbGS2xcj2yEfBb90G5ggi4Ga Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="326401865"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="326401865"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 01:46:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="643210973"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="643210973"
Received: from lhime-mobl1.ger.corp.intel.com (HELO [10.213.220.100])
 ([10.213.220.100])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 01:46:31 -0800
Message-ID: <fd4d20c3-de97-6da0-3b95-32c830726716@linux.intel.com>
Date: Fri, 3 Feb 2023 09:46:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/4] memcg: Track exported dma-buffers
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>
References: <20230123191728.2928839-1-tjmercier@google.com>
 <20230123191728.2928839-2-tjmercier@google.com>
 <Y8/ybgp2FW+e3bjc@dhcp22.suse.cz>
 <20230124194628.d44rtcfsv23fndxw@google.com>
 <Y9EX+usSpAjZ/8LS@dhcp22.suse.cz>
 <347560bc-d06a-92b7-8003-133d2b8af2df@linux.intel.com>
 <CABdmKX09S3bYzX+xBkhfkFULk2BtzS11RhzrvWv94j+cHSezPA@mail.gmail.com>
 <ad6bd448-91bd-d47e-5b54-8755fe0e0340@linux.intel.com>
 <CABdmKX3VSdF3jmktpw9VH4k+J+ZtQCLCPdNN6uye4XnZGPhG5g@mail.gmail.com>
 <15adf130-61f7-2423-2a48-883e611e3304@linux.intel.com>
 <CABdmKX181c21dbFGR+F=n_tF1MUeNPhXZXTNkAcW5FNRcLfxaQ@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CABdmKX181c21dbFGR+F=n_tF1MUeNPhXZXTNkAcW5FNRcLfxaQ@mail.gmail.com>
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
Cc: Michal Hocko <mhocko@suse.com>, linux-doc@vger.kernel.org,
 daniel.vetter@ffwll.ch, Roman Gushchin <roman.gushchin@linux.dev>,
 cmllamas@google.com, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 jstultz@google.com, Zefan Li <lizefan.x@bytedance.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, android-mm@google.com,
 Jonathan Corbet <corbet@lwn.net>, jeffv@google.com,
 linux-media@vger.kernel.org, selinux@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 cgroups@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 02/02/2023 23:43, T.J. Mercier wrote:
> On Wed, Feb 1, 2023 at 6:23 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 01/02/2023 01:49, T.J. Mercier wrote:
>>> On Tue, Jan 31, 2023 at 6:01 AM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>
>>>>
>>>> On 25/01/2023 20:04, T.J. Mercier wrote:
>>>>> On Wed, Jan 25, 2023 at 9:31 AM Tvrtko Ursulin
>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 25/01/2023 11:52, Michal Hocko wrote:
>>>>>>> On Tue 24-01-23 19:46:28, Shakeel Butt wrote:
>>>>>>>> On Tue, Jan 24, 2023 at 03:59:58PM +0100, Michal Hocko wrote:
>>>>>>>>> On Mon 23-01-23 19:17:23, T.J. Mercier wrote:
>>>>>>>>>> When a buffer is exported to userspace, use memcg to attribute the
>>>>>>>>>> buffer to the allocating cgroup until all buffer references are
>>>>>>>>>> released.
>>>>>>>>>
>>>>>>>>> Is there any reason why this memory cannot be charged during the
>>>>>>>>> allocation (__GFP_ACCOUNT used)?
>>>>>>>>> Also you do charge and account the memory but underlying pages do not
>>>>>>>>> know about their memcg (this is normally done with commit_charge for
>>>>>>>>> user mapped pages). This would become a problem if the memory is
>>>>>>>>> migrated for example.
>>>>>>>>
>>>>>>>> I don't think this is movable memory.
>>>>>>>>
>>>>>>>>> This also means that you have to maintain memcg
>>>>>>>>> reference outside of the memcg proper which is not really nice either.
>>>>>>>>> This mimicks tcp kmem limit implementation which I really have to say I
>>>>>>>>> am not a great fan of and this pattern shouldn't be coppied.
>>>>>>>>>
>>>>>>>>
>>>>>>>> I think we should keep the discussion on technical merits instead of
>>>>>>>> personal perference. To me using skmem like interface is totally fine
>>>>>>>> but the pros/cons need to be very explicit and the clear reasons to
>>>>>>>> select that option should be included.
>>>>>>>
>>>>>>> I do agree with that. I didn't want sound to be personal wrt tcp kmem
>>>>>>> accounting but the overall code maintenance cost is higher because
>>>>>>> of how tcp take on accounting differs from anything else in the memcg
>>>>>>> proper. I would prefer to not grow another example like that.
>>>>>>>
>>>>>>>> To me there are two options:
>>>>>>>>
>>>>>>>> 1. Using skmem like interface as this patch series:
>>>>>>>>
>>>>>>>> The main pros of this option is that it is very simple. Let me list down
>>>>>>>> the cons of this approach:
>>>>>>>>
>>>>>>>> a. There is time window between the actual memory allocation/free and
>>>>>>>> the charge and uncharge and [un]charge happen when the whole memory is
>>>>>>>> allocated or freed. I think for the charge path that might not be a big
>>>>>>>> issue but on the uncharge, this can cause issues. The application and
>>>>>>>> the potential shrinkers have freed some of this dmabuf memory but until
>>>>>>>> the whole dmabuf is freed, the memcg uncharge will not happen. This can
>>>>>>>> consequences on reclaim and oom behavior of the application.
>>>>>>>>
>>>>>>>> b. Due to the usage model i.e. a central daemon allocating the dmabuf
>>>>>>>> memory upfront, there is a requirement to have a memcg charge transfer
>>>>>>>> functionality to transfer the charge from the central daemon to the
>>>>>>>> client applications. This does introduce complexity and avenues of weird
>>>>>>>> reclaim and oom behavior.
>>>>>>>>
>>>>>>>>
>>>>>>>> 2. Allocate and charge the memory on page fault by actual user
>>>>>>>>
>>>>>>>> In this approach, the memory is not allocated upfront by the central
>>>>>>>> daemon but rather on the page fault by the client application and the
>>>>>>>> memcg charge happen at the same time.
>>>>>>>>
>>>>>>>> The only cons I can think of is this approach is more involved and may
>>>>>>>> need some clever tricks to track the page on the free patch i.e. we to
>>>>>>>> decrement the dmabuf memcg stat on free path. Maybe a page flag.
>>>>>>>>
>>>>>>>> The pros of this approach is there is no need have a charge transfer
>>>>>>>> functionality and the charge/uncharge being closely tied to the actual
>>>>>>>> memory allocation and free.
>>>>>>>>
>>>>>>>> Personally I would prefer the second approach but I don't want to just
>>>>>>>> block this work if the dmabuf folks are ok with the cons mentioned of
>>>>>>>> the first approach.
>>>>>>>
>>>>>>> I am not familiar with dmabuf internals to judge complexity on their end
>>>>>>> but I fully agree that charge-when-used is much more easier to reason
>>>>>>> about and it should have less subtle surprises.
>>>>>>
>>>>>> Disclaimer that I don't seem to see patches 3&4 on dri-devel so maybe I
>>>>>> am missing something, but in principle yes, I agree that the 2nd option
>>>>>> (charge the user, not exporter) should be preferred. Thing being that at
>>>>>> export time there may not be any backing store allocated, plus if the
>>>>>> series is restricting the charge transfer to just Android clients then
>>>>>> it seems it has the potential to miss many other use cases. At least
>>>>>> needs to outline a description on how the feature will be useful outside
>>>>>> Android.
>>>>>>
>>>>> There is no restriction like that. It's available to anybody who wants
>>>>> to call dma_buf_charge_transfer if they actually have a need for that,
>>>>> which I don't really expect to be common since most users/owners of
>>>>> the buffers will be the ones causing the export in the first place.
>>>>> It's just not like that on Android with the extra allocator process in
>>>>> the middle most of the time.
>>>>
>>>> Yeah I used the wrong term "restrict", apologies. What I meant was, if
>>>> the idea was to allow spotting memory leaks, with the charge transfer
>>>> being optional and in the series only wired up for Android Binder, then
>>>> it obviously only fully works for that one case. So a step back..
>>>>
>>> Oh, spotting kernel memory leaks is a side-benefit of accounting
>>> kernel-only buffers in the root cgroup. The primary goal is to
>>> attribute buffers to applications that originated them (via
>>> per-application cgroups) simply for accounting purposes. Buffers are
>>> using memory on the system, and we want to know who created them and
>>> how much memory is used. That information is/will no longer available
>>> with the recent deprecation of the dmabuf sysfs statistics.
>>>
>>>> .. For instance, it is not feasible to transfer the charge when dmabuf
>>>> is attached, or imported? That would attribute the usage to the
>>>> user/importer so give better visibility on who is actually causing the
>>>> memory leak.
>>>>
>>> Instead of accounting at export, we could account at attach. That just
>>> turns out not to be very useful when the majority of our
>>> heap-allocated buffers don't have attachments at any particular point
>>> in time. :\ But again it's less about leaks and more about knowing
>>> which buffers exist in the first place.
>>>
>>>> Further more, if above is feasible, then could it also be implemented in
>>>> the common layer so it would automatically cover all drivers?
>>>>
>>> Which common layer code specifically? The dmabuf interface appears to
>>> be the most central/common place to me.
>>
>> Yes, I meant dma_buf_attach / detach. More below.
>>>>>> Also stepping back for a moment - is a new memory category really
>>>>>> needed, versus perhaps attempting to charge the actual backing store
>>>>>> memory to the correct client? (There might have been many past
>>>>>> discussions on this so it's okay to point me towards something in the
>>>>>> archives.)
>>>>>>
>>>>> Well the dmabuf counter for the stat file is really just a subcategory
>>>>> of memory that is charged. Its existence is not related to getting the
>>>>> charge attributed to the right process/cgroup. We do want to know how
>>>>> much of the memory attributed to a process is for dmabufs, which is
>>>>> the main point of this series.
>>>>
>>>> Then I am probably missing something because the statement how proposal
>>>> is not intended to charge to the right process, but wants to know how
>>>> much dmabuf "size" is attributed to a process, confuses me due a seeming
>>>> contradiction. And the fact it would not be externally observable how
>>>> much of the stats is accurate and how much is not (without knowing the
>>>> implementation detail of which drivers implement charge transfer and
>>>> when). Maybe I completely misunderstood the use case.
>>>>
>>> Hmm, did I clear this up above or no? The current proposal is for the
>>> process causing the export of a buffer to be charged for it,
>>> regardless of whatever happens afterwards. (Unless that process is
>>> like gralloc on Android, in which case the charge is transferred from
>>> gralloc to whoever called gralloc to allocate the buffer on their
>>> behalf.)
>>
>> Main problem for me is that charging at export time has no relation to memory used. But I am not familiar with the memcg counters to know if any other counter sets that same precedent. If all other are about real memory use then IMO this does not fit that well. I mean specifically this:
>>
>> +         dmabuf (npn)
>> +               Amount of memory used for exported DMA buffers allocated by the cgroup.
>> +               Stays with the allocating cgroup regardless of how the buffer is shared.
>> +
>>
>> I think that "Amount of memory used for exported..." is not correct. As implemented it is more akin the virtual address space size in the cpu space - it can have no relation to the actual usage since backing store is not allocated until the attachment is made.
>>
>> Then also this:
>>
>> @@ -446,6 +447,8 @@ struct dma_buf {
>>                  struct dma_buf *dmabuf;
>>          } *sysfs_entry;
>>    #endif
>> +       /* The cgroup to which this buffer is currently attributed */
>> +       struct mem_cgroup *memcg;
>>    };
>>
>> Does not conceptually fit in my mind. Dmabufs are not associated with one cgroup at a time.
>>
> It's true that a dmabuf could be shared among processes in different
> cgroups, but this refers to the one that's charged for it. Similar to
> how the shmem pages that back memfds which can be similarly shared get
> charged to the first cgroup that touches each page, here it's the
> entire buffer instead of each individual page. Maybe it'd be possible
> to charge whoever attaches / maps first, but I have to point out
> there'd be a gap between then and export where we'd have no accounting
> of the memory for cases where pages actually do get allocated during
> export (like in the system_heap).

Okay I wasn't familiar with heaps until now - indeed - allocating a dma 
buf from there is allocation and export in one, no delayed/lazy anything 
on neither edge. Therefore charge at exports works there.

One option - rename the proposed memcg category to be clear it is only 
for dma buf heaps?

But does it not create double accounting btw? Since there are both 
pages/cma allocations that would be tracked and the new dma buf category.

Another option was allow each "backend" to specify if export charge 
needs to happen on export or import to be more accurate? (Like a flag 
for dma_buf_export_info maybe.)

Regards,

Tvrtko

>> So if you would place tracking into dma_buf_attach/detach you would be able to charge to correct cgroup regardless of a driver and since by contract at this stage there is backing store, the reflected memory usage counter would be truthful.
>>
>> But then you state a problem, that majority of the time there are no attachments in your setup, and you also say the proposal is not so much about leaks but more about knowing what is exported.
>>
>> In this case you could additionally track that via dma_buf_getfile / dma_buf_file_release as a separate category like dmabuf-exported? But again, I personally don't know if such "may not really be using memory" counters fit in memcg.
>>
>> (Hm you'd probably still need dmabuf->export_memcg to store who was the original caller of dma_buf_getfile, in case last reference is dropped from a different process/context. Even dmabuf->attach_memcg for attach/detach to work correctly for the same reason.)
>>
>> Regards,
>>
>> Tvrtko
