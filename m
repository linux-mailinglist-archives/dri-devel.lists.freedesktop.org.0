Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601446FE0E6
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 16:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3627E10E4BD;
	Wed, 10 May 2023 14:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392DE10E4BD;
 Wed, 10 May 2023 14:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683730760; x=1715266760;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=5PcR85UP60W1q4JTlwAaNEIiLv3C4MtG+bgQlozaZAU=;
 b=ezezgabZuGpi/mh1m6UpjvksZm5pcYA/KDxi4zihy/Hflmd9fzpkz9wf
 uJs0LRZfsTPwWqyCUg5B66BdRXiR8CEWpJO4qLaDJTlVqA4vxvny6CDJW
 MOpRlUTo4D8yRIzGaf5jmug+EeuOsodKlYz6b6K7uQw1j7biHT5HAFe/K
 aLXyUjKKRbw2sNxJ1wvIW1oNssD6c0+0XjpSf5yvNMpuIkJUIVHXV+QmK
 AsSkAqrMogRWMcSsukyk2aC8ArDSudGVDdA14ZzQHj2en2UrqxG015y1b
 NwDZk0pLlz7ye4VpDVQkIl3W5jJrIIHfqLSp1GNBNA0CXKQ7eY+LJj3wS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="352424385"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
 d="scan'208,217";a="352424385"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 07:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="676875225"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
 d="scan'208,217";a="676875225"
Received: from mfalalee-mobl1.ger.corp.intel.com (HELO [10.252.39.242])
 ([10.252.39.242])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 07:59:15 -0700
Content-Type: multipart/alternative;
 boundary="------------L9LEjtZf5zN6LJSFQm2Vgkmg"
Message-ID: <4d6fbce3-a676-f648-7a09-6f6dcc4bdb46@linux.intel.com>
Date: Wed, 10 May 2023 16:59:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [RFC PATCH 0/4] Add support for DRM cgroup memory accounting.
To: Tejun Heo <tj@kernel.org>
References: <20230503083500.645848-1-maarten.lankhorst@linux.intel.com>
 <ZFVeI2DKQXddKDNl@slm.duckdns.org>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZFVeI2DKQXddKDNl@slm.duckdns.org>
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

This is a multi-part message in MIME format.
--------------L9LEjtZf5zN6LJSFQm2Vgkmg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey,

On 2023-05-05 21:50, Tejun Heo wrote:
> Hello,
>
> On Wed, May 03, 2023 at 10:34:56AM +0200, Maarten Lankhorst wrote:
>> RFC as I'm looking for comments.
>>
>> For long running compute, it can be beneficial to partition the GPU memory
>> between cgroups, so each cgroup can use its maximum amount of memory without
>> interfering with other scheduled jobs. Done properly, this can alleviate the
>> need for eviction, which might result in a job being terminated if the GPU
>> doesn't support mid-thread preemption or recoverable page faults.
>>
>> This is done by adding a bunch of knobs to cgroup:
>> drm.capacity: Shows maximum capacity of each resource region.
>> drm.max: Display or limit max amount of memory.
>> drm.current: Current amount of memory in use.
>>
>> TTM has not been made cgroup aware yet, so instead of evicting from
>> the current cgroup to stay within the cgroup limits, it simply returns
>> the error -ENOSPC to userspace.
>>
>> I've used Tvrtko's cgroup controller series as a base, but it implemented
>> scheduling weight, not memory accounting, so I only ended up keeping the
>> base patch.
>>
>> Xe is not upstream yet, so the driver specific patch will only apply on
>> https://gitlab.freedesktop.org/drm/xe/kernel
> Some high-level feedbacks.
>
> * There have been multiple attempts at this but the track record is kinda
>    poor. People don't seem to agree what should constitute DRM memory and how
>    they should be accounted / controlled.

Thanks for the feedback.

I think for a lot of drivers, what is VRAM might have different meaning, but the intention
is it being accounted in the same way. Most drivers use TTM, which has a standard way
of allocating memory, and a standard way of evicting VRAM.

This makes it very useful for the usecase which I'm looking at, long running compute.
When you have long running jobs, you don't want them to be interrupted because a completely
unrelated process needs some VRAM, and one of the compute jobs buffers are being evicted.

Some hardware does not support mid-thread preemption or page fault recovery, this means that
when memory is evicted, the compute job is terminated.

The full problem statement is in drm-compute.rst in the memory accounting patch.

> * I like Tvrtko's scheduling patchset because it exposes a generic interface
>    which makes sense regardless of hardware details and then each driver can
>    implement the configured control in whatever way they can. However, even
>    for that, there doesn't seem much buy-in from other drivers.

Yeah, that is correct. But it tries to solve a different part of the problem.

> * This proposal seems narrowly scoped trying to solve a specific problem
>    which may not translate to different hardware configurations. Please let
>    me know if I got that wrong, but if that's the case, I think a better and
>    easier approach might be just being a part of the misc controller. That
>    doesn't require much extra code and should be able to provide everything
>    necessary for statically limiting specific resources.

The misc controller is not granular enough. A single computer may have any number of
graphics cards, some of them with multiple regions of vram inside a single card.

For compute and shared hosting you might want to limit the usage of a single memory
region on a single card, and then limit the same limits for the rest too, to prevent
triggering eviction.

The current version doesn't handle eviction correctly, because I was still working
on it and I wanted to post a RFC. As a result, the case where resource limit is hit
will evict the device's entire memory or get stuck in a loop. With some changes, the
next version will not have this bug. This results in a few changes to the core code. [1]

In the next version, I will move all the code for handling the resource limit to
TTM's eviction layer, because otherwise it cannot handle the resource limit correctly.

The effect of moving the code to TTM, is that it will make the code even more generic
for drivers that have vram and use TTM. When using TTM, you only have to describe your
VRAM, update some fields in the TTM manager and (un)register your device with the
cgroup handler on (un)load. It's quite trivial to add vram accounting to amdgpu and
nouveau. [2]

If you want to add a knob for scheduling weight for a process, it makes sense to
also add resource usage as a knob, otherwise the effect of that knob is very
limited. So even for Tvrtko's original proposed usecase, it would make sense.

Cheers,
~Maarten

--------
[1] Compared to this version:
  static inline int drmcg_try_charge(struct drmcgroup_state **drmcs,
+                                  struct drmcgroup_state **limitcs,
                                    struct drmcgroup_device *cgdev,
                                    u32 index, u64 size)

This now returns which cgroup's limit is hit on -EAGAIN.

+bool drmcs_grouped(struct drmcgroup_state *limitcs,
+                  struct drmcgroup_state *testcs);
Tells if testcs is the same as limitcs, or a subgroup of it. This allows us to
skip evicting when it's unneeded. If we want to add a min, it will make sense
to pass the size too, to skip some subcgroups below min.

+void drmcs_put(struct drmcgroup_state *drmcs);
Drops the limitcs ref.
-------------------
[2] With the next version, I can very easily implement the cgroup handling on amdgpu too:
- embed a struct drmcgroup_device inside amdgpu_device.
- In amdgpu_vram_mgr_init, populate the struct drmcgroup_device.regions[0] for vram,
   and set ttm_resource_manager->cg to &adev->drmcgroup_device
- Call drmcg_register_device after, and drmcg_unregister_device after cleaning up vram.

So if anyone wants to limit VRAM on amdgpu or qxl or nouveau (left as exercise for reader)
afterwards, it will work as intended, while the driver doesn't have to be cgroups aware.

--------------L9LEjtZf5zN6LJSFQm2Vgkmg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hey,<br>
    </p>
    <div class="moz-cite-prefix">On 2023-05-05 21:50, Tejun Heo wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZFVeI2DKQXddKDNl@slm.duckdns.org">
      <pre class="moz-quote-pre" wrap="">Hello,

On Wed, May 03, 2023 at 10:34:56AM +0200, Maarten Lankhorst wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">RFC as I'm looking for comments.

For long running compute, it can be beneficial to partition the GPU memory
between cgroups, so each cgroup can use its maximum amount of memory without
interfering with other scheduled jobs. Done properly, this can alleviate the
need for eviction, which might result in a job being terminated if the GPU
doesn't support mid-thread preemption or recoverable page faults.

This is done by adding a bunch of knobs to cgroup:
drm.capacity: Shows maximum capacity of each resource region.
drm.max: Display or limit max amount of memory.
drm.current: Current amount of memory in use.

TTM has not been made cgroup aware yet, so instead of evicting from
the current cgroup to stay within the cgroup limits, it simply returns
the error -ENOSPC to userspace.

I've used Tvrtko's cgroup controller series as a base, but it implemented
scheduling weight, not memory accounting, so I only ended up keeping the
base patch.

Xe is not upstream yet, so the driver specific patch will only apply on
<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel">https://gitlab.freedesktop.org/drm/xe/kernel</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Some high-level feedbacks.

* There have been multiple attempts at this but the track record is kinda
  poor. People don't seem to agree what should constitute DRM memory and how
  they should be accounted / controlled.</pre>
    </blockquote>
    <pre>Thanks for the feedback.

I think for a lot of drivers, what is VRAM might have different meaning, but the intention
is it being accounted in the same way. Most drivers use TTM, which has a standard way
of allocating memory, and a standard way of evicting VRAM.

This makes it very useful for the usecase which I'm looking at, long running compute.
When you have long running jobs, you don't want them to be interrupted because a completely
unrelated process needs some VRAM, and one of the compute jobs buffers are being evicted.

Some hardware does not support mid-thread preemption or page fault recovery, this means that
when memory is evicted, the compute job is terminated.

The full problem statement is in drm-compute.rst in the memory accounting patch.

</pre>
    <blockquote type="cite" cite="mid:ZFVeI2DKQXddKDNl@slm.duckdns.org">
      <pre class="moz-quote-pre" wrap="">* I like Tvrtko's scheduling patchset because it exposes a generic interface
  which makes sense regardless of hardware details and then each driver can
  implement the configured control in whatever way they can. However, even
  for that, there doesn't seem much buy-in from other drivers.</pre>
    </blockquote>
    <pre>Yeah, that is correct. But it tries to solve a different part of the problem.</pre>
    <blockquote type="cite" cite="mid:ZFVeI2DKQXddKDNl@slm.duckdns.org">
      <pre class="moz-quote-pre" wrap="">* This proposal seems narrowly scoped trying to solve a specific problem
  which may not translate to different hardware configurations. Please let
  me know if I got that wrong, but if that's the case, I think a better and
  easier approach might be just being a part of the misc controller. That
  doesn't require much extra code and should be able to provide everything
  necessary for statically limiting specific resources.
</pre>
    </blockquote>
    <pre>The misc controller is not granular enough. A single computer may have any number of
graphics cards, some of them with multiple regions of vram inside a single card.

For compute and shared hosting you might want to limit the usage of a single memory
region on a single card, and then limit the same limits for the rest too, to prevent
triggering eviction.

The current version doesn't handle eviction correctly, because I was still working
on it and I wanted to post a RFC. As a result, the case where resource limit is hit
will evict the device's entire memory or get stuck in a loop. With some changes, the
next version will not have this bug. This results in a few changes to the core code. [1]

In the next version, I will move all the code for handling the resource limit to
TTM's eviction layer, because otherwise it cannot handle the resource limit correctly.

The effect of moving the code to TTM, is that it will make the code even more generic
for drivers that have vram and use TTM. When using TTM, you only have to describe your
VRAM, update some fields in the TTM manager and (un)register your device with the
cgroup handler on (un)load. It's quite trivial to add vram accounting to amdgpu and
nouveau. [2]

If you want to add a knob for scheduling weight for a process, it makes sense to
also add resource usage as a knob, otherwise the effect of that knob is very
limited. So even for Tvrtko's original proposed usecase, it would make sense.

Cheers,
~Maarten

--------
[1] Compared to this version:
 static inline int drmcg_try_charge(struct drmcgroup_state **drmcs,
+                                  struct drmcgroup_state **limitcs,
                                   struct drmcgroup_device *cgdev,
                                   u32 index, u64 size)

This now returns which cgroup's limit is hit on -EAGAIN.

+bool drmcs_grouped(struct drmcgroup_state *limitcs,
+                  struct drmcgroup_state *testcs);
Tells if testcs is the same as limitcs, or a subgroup of it. This allows us to
skip evicting when it's unneeded. If we want to add a min, it will make sense
to pass the size too, to skip some subcgroups below min.

+void drmcs_put(struct drmcgroup_state *drmcs);
Drops the limitcs ref.
-------------------
[2] With the next version, I can very easily implement the cgroup handling on amdgpu too:
- embed a struct drmcgroup_device inside amdgpu_device.
- In amdgpu_vram_mgr_init, populate the struct drmcgroup_device.regions[0] for vram,
  and set ttm_resource_manager-&gt;cg to &amp;adev-&gt;drmcgroup_device
- Call drmcg_register_device after, and drmcg_unregister_device after cleaning up vram.

So if anyone wants to limit VRAM on amdgpu or qxl or nouveau (left as exercise for reader)
afterwards, it will work as intended, while the driver doesn't have to be cgroups aware.

</pre>
  </body>
</html>

--------------L9LEjtZf5zN6LJSFQm2Vgkmg--
