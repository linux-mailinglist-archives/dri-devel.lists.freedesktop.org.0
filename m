Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC24765908
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 18:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CFA10E5C4;
	Thu, 27 Jul 2023 16:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6BF10E5C3;
 Thu, 27 Jul 2023 16:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690476221; x=1722012221;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EPPEG5IjRpK3UjK14v1TE0oHNl+auGdkynzlUa5wKQI=;
 b=KCLBJPEDMythTfgwAbVvrBqE7BYTpkiJ5kaVTI/RQoDiZLc4jp/u0wgx
 mT7OcAC+oFwR6LdNnMAgWAUOiGKyF/ii+MWpaUfn9YQsbUGJ0TWEuiSgO
 uFBhCSIh21V45t8BW/0F6W41cjmR5/Kn8jBUIz9LuxMiFJ/dZQzAairvj
 2H9SkhTM/XvBbJAcD/U5XwMn47ISa/o15CvKG+nqO9+jylpIF++Jg4BTX
 e2Q2JxQwATPbqAmyYM5kzUY+/iYRDWaKlYrtFNRMBSzzHVpYDKg3bVoCx
 gMu5hPhFK89sHshI6OfLOsA+1W6S4nXvel+wPFgMaKGhPoSvkUg8oAlOV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="371996233"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="371996233"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 09:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="730416549"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="730416549"
Received: from jlenehan-mobl1.ger.corp.intel.com (HELO [10.213.228.208])
 ([10.213.228.208])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 09:43:36 -0700
Message-ID: <6ed5478c-8a67-5ad8-3e6d-51c300702cf3@linux.intel.com>
Date: Thu, 27 Jul 2023 17:43:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 16/17] cgroup/drm: Expose memory stats
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tejun Heo <tj@kernel.org>
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
 <20230712114605.519432-17-tvrtko.ursulin@linux.intel.com>
 <ZLsFBHqCQdPHoZVw@slm.duckdns.org>
 <ea64d7bf-c01b-f4ad-a36b-f77e2c2ea931@linux.intel.com>
 <ZMF3rLioJK9QJ0yj@slm.duckdns.org>
 <05178cf3-df1c-80a7-12ad-816fafbc2df7@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <05178cf3-df1c-80a7-12ad-816fafbc2df7@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 Eero Tamminen <eero.t.tamminen@intel.com>,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/07/2023 14:42, Maarten Lankhorst wrote:
> On 2023-07-26 21:44, Tejun Heo wrote:
>> Hello,
>>
>> On Wed, Jul 26, 2023 at 12:14:24PM +0200, Maarten Lankhorst wrote:
>>>> So, yeah, if you want to add memory controls, we better think 
>>>> through how
>>>> the fd ownership migration should work.
>>>
>>> I've taken a look at the series, since I have been working on cgroup 
>>> memory
>>> eviction.
>>>
>>> The scheduling stuff will work for i915, since it has a purely software
>>> execlist scheduler, but I don't think it will work for GuC (firmware)
>>> scheduling or other drivers that use the generic drm scheduler.
>>>
>>> For something like this,  you would probably want it to work inside 
>>> the drm
>>> scheduler first. Presumably, this can be done by setting a weight on 
>>> each
>>> runqueue, and perhaps adding a callback to update one for a running 
>>> queue.
>>> Calculating the weights hierarchically might be fun..
>>
>> I don't have any idea on this front. The basic idea of making high level
>> distribution decisions in core code and letting individual drivers 
>> enforce
>> that in a way which fits them the best makes sense to me but I don't know
>> enough to have an opinion here.
>>
>>> I have taken a look at how the rest of cgroup controllers change 
>>> ownership
>>> when moved to a different cgroup, and the answer was: not at all. If we
>>
>> For persistent resources, that's the general rule. Whoever instantiates a
>> resource gets to own it until the resource gets freed. There is an 
>> exception
>> with the pid controller and there are discussions around whether we want
>> some sort of migration behavior with memcg but yes by and large 
>> instantiator
>> being the owner is the general model cgroup follows.
>>
>>> attempt to create the scheduler controls only on the first time the 
>>> fd is
>>> used, you could probably get rid of all the tracking.
>>> This can be done very easily with the drm scheduler.
>>>
>>> WRT memory, I think the consensus is to track system memory like normal
>>> memory. Stolen memory doesn't need to be tracked. It's kernel only 
>>> memory,
>>> used for internal bookkeeping  only.
>>>
>>> The only time userspace can directly manipulate stolen memory, is by 
>>> mapping
>>> the pinned initial framebuffer to its own address space. The only 
>>> allocation
>>> it can do is when a framebuffer is displayed, and framebuffer 
>>> compression
>>> creates some stolen memory. Userspace is not
>>> aware of this though, and has no way to manipulate those contents.
>>
>> So, my dumb understanding:
>>
>> * Ownership of an fd can be established on the first ioctl call and 
>> doesn't
>>    need to be migrated afterwards. There are no persistent resources to
>>    migration on the first call.

Yes, keyword is "can". Trouble is migration may or may not happen.

One may choose "Plasma X.org" session type in your login manager and all 
DRM fds would be under Xorg if not migrated. Or one may choose "Plasma 
Wayland" and migration wouldn't matter. But former is I think has a huge 
deployed base so that not supporting implicit migration would be a 
significant asterisk next to the controller.

>> * Memory then can be tracked in a similar way to memcg. Memory gets 
>> charged
>>    to the initial instantiator and doesn't need to be moved around
>>    afterwards. There may be some discrepancies around stolen memory 
>> but the
>>    magnitude of inaccuracy introduced that way is limited and bound 
>> and can
>>    be safely ignored.
>>
>> Is that correct?
> 
> Hey,
> 
> Yeah mostly, I think we can stop tracking stolen memory. I stopped doing 
> that for Xe, there is literally nothing to control for userspace in there.

Right, but for reporting stolen is a red-herring. In this RFC I simply 
report on all memory regions known by the driver. As I said in the other 
reply, imagine the keys are 'system' and 'vram0'. Point was just to 
illustrate multiplicity of regions.

Regards,

Tvrtko
