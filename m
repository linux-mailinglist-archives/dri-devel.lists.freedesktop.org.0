Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 612A63D3B68
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 15:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C8D6F467;
	Fri, 23 Jul 2021 13:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F5D6F467;
 Fri, 23 Jul 2021 13:50:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="192153721"
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; d="scan'208";a="192153721"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 06:50:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; d="scan'208";a="502522416"
Received: from mrapopor-mobl.ger.corp.intel.com (HELO [10.213.214.117])
 ([10.213.214.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 06:50:56 -0700
Subject: Re: [Intel-gfx] [RFC 0/8] Per client GPU stats
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Intel-gfx@lists.freedesktop.org
References: <20210715091820.1613726-1-tvrtko.ursulin@linux.intel.com>
 <e6f53b40-b8bf-3d2b-2dbe-a568254e15d3@linux.intel.com>
 <5a4e9aad-5ad6-aa66-ce9b-3a937af39736@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c1d36ff0-c54c-a2ee-8b1f-68e5cc00cdb5@linux.intel.com>
Date: Fri, 23 Jul 2021 14:50:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5a4e9aad-5ad6-aa66-ce9b-3a937af39736@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org, "Nieto, David M" <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/07/2021 12:23, Christian König wrote:
> Am 23.07.21 um 13:21 schrieb Tvrtko Ursulin:
>>
>> On 15/07/2021 10:18, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Same old work but now rebased and series ending with some DRM docs 
>>> proposing
>>> the common specification which should enable nice common userspace 
>>> tools to be
>>> written.
>>>
>>> For the moment I only have intel_gpu_top converted to use this and 
>>> that seems to
>>> work okay.
>>>
>>> v2:
>>>   * Added prototype of possible amdgpu changes and spec updates to 
>>> align with the
>>>     common spec.
>>
>> Not much interest for the common specification?
> 
> Well I would rather say not much opposition :)

Hah, thanks, that's good to hear!

> Of hand everything you do in this patch set sounds absolutely sane to 
> me, just don't have any time to review it in detail.

That's fine - could you maybe suggest who on the AMD side could have a 
look at the relevant patches?

Regards,

Tvrtko

>> For reference I've just posted the intel-gpu-top adaptation required 
>> to parse it here: 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F446041%2F%3Fseries%3D90464%26rev%3D2&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cc967de8b8c2b499eb25b08d94dcbff2e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637626360837958764%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=07hzP1RuVQkFi8AXWK8i%2Ffu9ajnldcF36PLRrey5wXA%3D&amp;reserved=0. 
>>
>>
>> Note that this is not attempting to be a vendor agnostic tool but is 
>> adding per client data to existing i915 tool which uses PMU counters 
>> for global stats.
>>
>> intel-gpu-top: Intel Skylake (Gen9) @ /dev/dri/card0 -  335/ 339 MHz; 
>> 10% RC6;  1.24/ 4.18 W;      527 irqs/s
>>
>>       IMC reads:     3297 MiB/s
>>      IMC writes:     2767 MiB/s
>>
>>          ENGINES BUSY MI_SEMA MI_WAIT
>>        Render/3D   78.74% 
>> |██████████████████████████████████████████████████████████████████████████▏ 
>> |      0%      0%
>>          Blitter    0.00% | |      0%      0%
>>            Video    0.00% | |      0%      0%
>>     VideoEnhance    0.00% | |      0%      0%
>>
>>    PID              NAME          Render/3D 
>> Blitter                      Video                    VideoEnhance
>>  10202         neverball |███████████████▎ || || 
>> ||                          |
>>   5665              Xorg |███████▍ ||                          || 
>> ||                          |
>>   5679     xfce4-session | ||                          || 
>> ||                          |
>>   5772      ibus-ui-gtk3 | ||                          || 
>> ||                          |
>>   5775   ibus-extension- | ||                          || 
>> ||                          |
>>   5777          ibus-x11 | ||                          || 
>> ||                          |
>>   5823             xfwm4 | ||                          || 
>> ||                          |
>>
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Tvrtko Ursulin (8):
>>>    drm/i915: Explicitly track DRM clients
>>>    drm/i915: Make GEM contexts track DRM clients
>>>    drm/i915: Track runtime spent in closed and unreachable GEM contexts
>>>    drm/i915: Track all user contexts per client
>>>    drm/i915: Track context current active time
>>>    drm: Document fdinfo format specification
>>>    drm/i915: Expose client engine utilisation via fdinfo
>>>    drm/amdgpu: Convert to common fdinfo format
>>>
>>>   Documentation/gpu/amdgpu.rst                  |  26 ++++
>>>   Documentation/gpu/drm-usage-stats.rst         | 108 +++++++++++++
>>>   Documentation/gpu/i915.rst                    |  27 ++++
>>>   Documentation/gpu/index.rst                   |   1 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c    |  18 ++-
>>>   drivers/gpu/drm/i915/Makefile                 |   5 +-
>>>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  42 ++++-
>>>   .../gpu/drm/i915/gem/i915_gem_context_types.h |   6 +
>>>   drivers/gpu/drm/i915/gt/intel_context.c       |  27 +++-
>>>   drivers/gpu/drm/i915/gt/intel_context.h       |  15 +-
>>>   drivers/gpu/drm/i915/gt/intel_context_types.h |  24 ++-
>>>   .../drm/i915/gt/intel_execlists_submission.c  |  23 ++-
>>>   .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |   4 +
>>>   drivers/gpu/drm/i915/gt/intel_lrc.c           |  27 ++--
>>>   drivers/gpu/drm/i915/gt/intel_lrc.h           |  24 +++
>>>   drivers/gpu/drm/i915/gt/selftest_lrc.c        |  10 +-
>>>   drivers/gpu/drm/i915/i915_drm_client.c        | 143 ++++++++++++++++++
>>>   drivers/gpu/drm/i915/i915_drm_client.h        |  66 ++++++++
>>>   drivers/gpu/drm/i915/i915_drv.c               |   9 ++
>>>   drivers/gpu/drm/i915/i915_drv.h               |   5 +
>>>   drivers/gpu/drm/i915/i915_gem.c               |  21 ++-
>>>   drivers/gpu/drm/i915/i915_gpu_error.c         |   9 +-
>>>   drivers/gpu/drm/i915/i915_gpu_error.h         |   2 +-
>>>   23 files changed, 581 insertions(+), 61 deletions(-)
>>>   create mode 100644 Documentation/gpu/drm-usage-stats.rst
>>>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
>>>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h
>>>
> 
