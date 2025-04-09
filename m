Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838BFA81F1F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 10:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD04910E7FF;
	Wed,  9 Apr 2025 08:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="slk6VF1v";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="09y8o62Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 471 seconds by postgrey-1.36 at gabe;
 Wed, 09 Apr 2025 08:02:49 UTC
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5327310E7FF;
 Wed,  9 Apr 2025 08:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1744185144;
 bh=m0UnMasJN//idMnYkH7ZVnj
 GqZ6c589EeVyBi7IEG6E=; b=slk6VF1v2JektGaPflcGO2CTCGnjVtConEYnMwNQuHIKv5GnZN
 iKySxNzKqaqmMSGTHV2sD7e6p9JMM/bWwVV60dKGgbydrphz39R0nULHz7MEORNs5C/68+fh8hE
 mlZ9b5Z88OSQ8xg9+VjAXpw/HRZzgwVLlWHsB8EiA5jMt5rjUUhF+Q/YRDNDgE1oqjF2JbvgPva
 cS89tlOy4Apc6IPe8ZmM/vtazs3BSCEAEgUDzLIxcvGjev4kX2xaLfNCszaUERyyBxHykYumB+1
 dBO7Dwa0yztI3rfuRieQ6sKhWOyoHaC9sv/tmFXCcrxeOxKvOvdgQCq577mnEJ+VpWw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1744185144; bh=m0UnMasJN//idMnYkH7ZVnj
 GqZ6c589EeVyBi7IEG6E=; b=09y8o62Y7U+ZSS7gXzumhfKXC15qDUDbHWKwRc+54MEVLT3ms7
 XJzrgBE+FB+rwkzQeINVbFqIXq5dQESfANCg==;
Message-ID: <f3416edf-46f8-4296-86bd-600ab629fe60@damsy.net>
Date: Wed, 9 Apr 2025 09:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/10] Improve gpu_scheduler trace events + UAPI
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, lima@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, nouveau@lists.freedesktop.org
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I've rebased the series on top of drm-next, applied the minor tweaks suggested by Tvrtko on v8 and 
the R-b tags. The result can be found on gitlab.fdo:

https://gitlab.freedesktop.org/pepp/linux/-/commits/improve_gpu_scheduler_trace_v9

I believe it's ready to be merged, unless I've missed something?

Thanks,
Pierre-Eric

Le 20/03/2025 à 10:57, Pierre-Eric Pelloux-Prayer a écrit :
> Hi,
> 
> The initial goal of this series was to improve the drm and amdgpu
> trace events to be able to expose more of the inner workings of
> the scheduler and drivers to developers via tools.
> 
> Then, the series evolved to become focused only on gpu_scheduler.
> The changes around vblank events will be part of a different
> series, as well as the amdgpu ones.
> 
> Moreover Sima suggested to make some trace events stable uAPI,
> so tools can rely on them long term.
> 
> The first patches extend and cleanup the gpu scheduler events,
> then add a documentation entry in drm-uapi.rst.
> 
> The last 2 patches are new in v8. One is based on a suggestion
> from Tvrtko and gets rid of drm_sched_job::id. The other is a
> cleanup of amdgpu trace events to use the fence=%llu:%llu format.
> 
> The drm_sched_job patches don't affect gpuvis which has code to parse
> the gpu_scheduler events but these events are not enabled.
> 
> Changes since v7:
> * uint64_t -> u64
> * reworked dependencies tracing (Tvrtko)
> * use common name prefix for all events (Tvrtko)
> * dropped drm_sched_job::id (Tvrtko)
> 
> Useful links:
> - userspace tool using the updated events:
> https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
> - v7:
> https://lists.freedesktop.org/archives/dri-devel/2025-January/488117.html
> 
> Pierre-Eric Pelloux-Prayer (10):
>    drm/debugfs: output client_id in in drm_clients_info
>    drm/sched: store the drm client_id in drm_sched_fence
>    drm/sched: add device name to the drm_sched_process_job event
>    drm/sched: cleanup gpu_scheduler trace events
>    drm/sched: trace dependencies for gpu jobs
>    drm/sched: add the drm_client_id to the drm_sched_run/exec_job events
>    drm/sched: cleanup event names
>    drm/doc: document some tracepoints as uAPI
>    drm: get rid of drm_sched_job::id
>    drm/amdgpu: update trace format to match gpu_scheduler_trace
> 
>   Documentation/gpu/drm-uapi.rst                |  19 ++++
>   drivers/accel/amdxdna/aie2_ctx.c              |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   8 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  32 ++----
>   drivers/gpu/drm/drm_debugfs.c                 |  10 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   2 +-
>   drivers/gpu/drm/imagination/pvr_job.c         |   2 +-
>   drivers/gpu/drm/imagination/pvr_queue.c       |   5 +-
>   drivers/gpu/drm/imagination/pvr_queue.h       |   2 +-
>   drivers/gpu/drm/lima/lima_gem.c               |   2 +-
>   drivers/gpu/drm/lima/lima_sched.c             |   6 +-
>   drivers/gpu/drm/lima/lima_sched.h             |   3 +-
>   drivers/gpu/drm/msm/msm_gem_submit.c          |   8 +-
>   drivers/gpu/drm/nouveau/nouveau_sched.c       |   3 +-
>   drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
>   drivers/gpu/drm/panthor/panthor_drv.c         |   3 +-
>   drivers/gpu/drm/panthor/panthor_mmu.c         |   2 +-
>   drivers/gpu/drm/panthor/panthor_sched.c       |   5 +-
>   drivers/gpu/drm/panthor/panthor_sched.h       |   3 +-
>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 103 +++++++++++++-----
>   drivers/gpu/drm/scheduler/sched_entity.c      |  16 ++-
>   drivers/gpu/drm/scheduler/sched_fence.c       |   4 +-
>   drivers/gpu/drm/scheduler/sched_internal.h    |   2 +-
>   drivers/gpu/drm/scheduler/sched_main.c        |  11 +-
>   drivers/gpu/drm/v3d/v3d_submit.c              |   2 +-
>   drivers/gpu/drm/xe/xe_sched_job.c             |   3 +-
>   include/drm/gpu_scheduler.h                   |  13 ++-
>   30 files changed, 186 insertions(+), 96 deletions(-)
> 
