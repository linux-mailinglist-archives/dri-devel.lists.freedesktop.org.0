Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 910836FEF96
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 12:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77EE10E5CB;
	Thu, 11 May 2023 10:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2066810E5C8;
 Thu, 11 May 2023 10:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683799394; x=1715335394;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QlT9To/OXd8EOJgtiTI8cBaN4OaCchdOcuG26O4bS00=;
 b=U/4pwlahc+E5N5fH9o27ywR+K5AqXm0VyqaXYUuenoqn1HVbKF0jwsfu
 sCokzkYOIQ8v2tbS0/TvUoVj5TA/a+jinRtxE0INUs8vf1vYVxVJHKt0Q
 HiP9CrI39v2uIHXW6LaWgacuTFB4UM6IF3chGyfNkGhFdrBumMCDeZWa1
 CtX1LI31KizVISsmUYCAgjo8p+OnWyFPMc8KziXsDcBOl201CwnBMU6L/
 CqwRQSLAak9uzKEbjEewNITkwKDfhJVP/f6Fg2SaZuPdJtJLZRFMw7SeY
 y8TKVnwp2Pi5dudKP2dUdsTu7rBNgQYXkXOgrbL5V1JplRZ6SauIWWHAW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="353549909"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="353549909"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 03:03:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="843886962"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="843886962"
Received: from acharach-mobl.ger.corp.intel.com (HELO [10.251.219.38])
 ([10.251.219.38])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 03:03:06 -0700
Message-ID: <56668e29-f697-bd9b-2c13-182e8456dbce@linux.intel.com>
Date: Thu, 11 May 2023 12:03:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [RFC PATCH 0/4] Add support for DRM cgroup memory accounting.
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>
References: <20230503083500.645848-1-maarten.lankhorst@linux.intel.com>
 <ZFVeI2DKQXddKDNl@slm.duckdns.org>
 <4d6fbce3-a676-f648-7a09-6f6dcc4bdb46@linux.intel.com>
 <ZFvmaGNo0buQEUi1@slm.duckdns.org>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZFvmaGNo0buQEUi1@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

On 2023-05-10 20:46, Tejun Heo wrote:
> Hello,
>
> On Wed, May 10, 2023 at 04:59:01PM +0200, Maarten Lankhorst wrote:
>> The misc controller is not granular enough. A single computer may have any number of
>> graphics cards, some of them with multiple regions of vram inside a single card.
> Extending the misc controller to support dynamic keys shouldn't be that
> difficult.
>
> ...
>> In the next version, I will move all the code for handling the resource limit to
>> TTM's eviction layer, because otherwise it cannot handle the resource limit correctly.
>>
>> The effect of moving the code to TTM, is that it will make the code even more generic
>> for drivers that have vram and use TTM. When using TTM, you only have to describe your
>> VRAM, update some fields in the TTM manager and (un)register your device with the
>> cgroup handler on (un)load. It's quite trivial to add vram accounting to amdgpu and
>> nouveau. [2]
>>
>> If you want to add a knob for scheduling weight for a process, it makes sense to
>> also add resource usage as a knob, otherwise the effect of that knob is very
>> limited. So even for Tvrtko's original proposed usecase, it would make sense.
> It does make sense but unlike Tvrtko's scheduling weights what's being
> proposed doesn't seem to encapsulate GPU memory resource in a generic enough
> manner at least to my untrained eyes. ie. w/ drm.weight, I don't need any
> specific knoweldge of how a specific GPU operates to say "this guy should
> get 2x processing power over that guy". This more or less holds for other
> major resources including CPU, memory and IO. What you're proposing seems a
> lot more tied to hardware details and users would have to know a lot more
> about how memory is configured on that particular GPU.

There's not much need of knowing the specifics of a card, but there might
be a need of knowing the workload to determine what allocation limits to set.

I've left region to be implementation specific, but it would make sense to
standardise it.
TTM, the layer used by drivers that support VRAM, have the following regions:
* sysmem - All system memory allocated; includes evicted VRAM.
* mapped - All physical system memory that is mapped to the GPU, when unbound
           moves to sysmem. When evicting VRAM to sysmem, it's temporarily
           mapped here.
* vramN - All VRAM regions of the device.
* driver specific regions - probably doesn't make sense to put in cgroup at all,
  this includes stolen from the PoC.

That leaves the question, what regions would make sense for a cgroup?
Since vramN can be moved to mapped and sysmem (VRAM eviction, suspend/resume,
driver_madvise), it becomes a subject of debate if we should include the other
regions, since things become complicated fast.

For the first iteration, I focus on a single category, vramN.

Even when not knowing anything about a GPU, it will be easy to partition its
memory like that.

If you can assign a weight for the scheduler, then you can also partition it's
vram by parsing /drm.capacity for total amount, and then splitting it across
cgroups.


> Now, if this is inherent to how all, or at least most, GPUs operate, sure,
> but otherwise let's start small in terms of interface and not take up space
> which should be for something universal. If this turns out to be the way,
> expanding to take up the generic interface space isn't difficult.
>
> I don't know GPU space so please educate me where I'm wrong.

Most GPU's have dedicated vram that works roughly in the same way, some
integrated chips like i915 or arm use shared memory from the host system
only. I would say amd, nvidia and intel's chips with dedicated memory work
roughly in the same way for vram.

I hope this explains it a little bit more,

~Maarten

