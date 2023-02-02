Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E4E68849D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 17:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EAB10E1E5;
	Thu,  2 Feb 2023 16:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D11510E1E5;
 Thu,  2 Feb 2023 16:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675355942; x=1706891942;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AIo+gKG4RH0SjX9WCTLu2AvRW9yV0Q+kO2RNkMJGFx8=;
 b=E/nnOsue8EXHXN61ygUi/xEIDGW9kdGcUzoVFFm+6KZ4xpadSsw0nmCP
 wfBiyr66y83RQwEmjF18MJRhiF650v+m4nCNZrK5+Nc3GDsSiIiEeCCK9
 SfvoQ63hg7FUZiGxtUBLd1bEhLq5f0o92JsTWkOR4j44LSCrBN+OCt0g/
 +TjHYQFODb5B2u4/4kLttRgroTKtombShr0pq3ix/d33DBs4Opp+Sb2Bl
 oO+gqbd101T+4ohFuGiTW7hZoE8vzXm0lrTJ6F37JsQxfJkY3943tKMAy
 ASgxESX2hEzT0O3JlGjmmKsYhuLl5HOeFLssmaSMACHZz8XHGIWVZEUfX A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="312139201"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="312139201"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 08:39:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="642952824"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="642952824"
Received: from mrogowsx-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.12])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 08:38:58 -0800
Date: Thu, 2 Feb 2023 17:38:55 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v10 20/23] drm/i915/vm_bind: Render VM_BIND documentation
Message-ID: <Y9vnHzZslHcKCZFi@ashyti-mobl2.lan>
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
 <20230118071609.17572-21-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118071609.17572-21-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Niranjana,

On Tue, Jan 17, 2023 at 11:16:06PM -0800, Niranjana Vishwanathapura wrote:
> Update i915 documentation to include VM_BIND changes
> and render all VM_BIND related documentation.
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

looks good!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

> ---
>  Documentation/gpu/i915.rst | 78 ++++++++++++++++++++++++++++----------
>  1 file changed, 59 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 60ea21734902..01429a8f0d6c 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -283,15 +283,18 @@ An Intel GPU has multiple engines. There are several engine types.
>  
>  The Intel GPU family is a family of integrated GPU's using Unified
>  Memory Access. For having the GPU "do work", user space will feed the
> -GPU batch buffers via one of the ioctls `DRM_IOCTL_I915_GEM_EXECBUFFER2`
> -or `DRM_IOCTL_I915_GEM_EXECBUFFER2_WR`. Most such batchbuffers will
> -instruct the GPU to perform work (for example rendering) and that work
> -needs memory from which to read and memory to which to write. All memory
> -is encapsulated within GEM buffer objects (usually created with the ioctl
> -`DRM_IOCTL_I915_GEM_CREATE`). An ioctl providing a batchbuffer for the GPU
> -to create will also list all GEM buffer objects that the batchbuffer reads
> -and/or writes. For implementation details of memory management see
> -`GEM BO Management Implementation Details`_.
> +GPU batch buffers via one of the ioctls `DRM_IOCTL_I915_GEM_EXECBUFFER2`,
> +`DRM_IOCTL_I915_GEM_EXECBUFFER2_WR` or `DRM_IOCTL_I915_GEM_EXECBUFFER3`.
> +Most such batchbuffers will instruct the GPU to perform work (for example
> +rendering) and that work needs memory from which to read and memory to
> +which to write. All memory is encapsulated within GEM buffer objects
> +(usually created with the ioctl `DRM_IOCTL_I915_GEM_CREATE`). In vm_bind mode
> +(see `VM_BIND mode`_), the batch buffer and all the GEM buffer objects that
> +it reads and/or writes should be bound with vm_bind ioctl before submitting
> +the batch buffer to GPU. In legacy (non-VM_BIND) mode, an ioctl providing a
> +batchbuffer for the GPU to create will also list all GEM buffer objects that
> +the batchbuffer reads and/or writes. For implementation details of memory
> +management see `GEM BO Management Implementation Details`_.
>  
>  The i915 driver allows user space to create a context via the ioctl
>  `DRM_IOCTL_I915_GEM_CONTEXT_CREATE` which is identified by a 32-bit
> @@ -309,8 +312,9 @@ In addition to the ordering guarantees, the kernel will restore GPU
>  state via HW context when commands are issued to a context, this saves
>  user space the need to restore (most of atleast) the GPU state at the
>  start of each batchbuffer. The non-deprecated ioctls to submit batchbuffer
> -work can pass that ID (in the lower bits of drm_i915_gem_execbuffer2::rsvd1)
> -to identify what context to use with the command.
> +work can pass that ID (drm_i915_gem_execbuffer3::ctx_id, or in the lower
> +bits of drm_i915_gem_execbuffer2::rsvd1) to identify what context to use
> +with the command.
>  
>  The GPU has its own memory management and address space. The kernel
>  driver maintains the memory translation table for the GPU. For older
> @@ -318,14 +322,14 @@ GPUs (i.e. those before Gen8), there is a single global such translation
>  table, a global Graphics Translation Table (GTT). For newer generation
>  GPUs each context has its own translation table, called Per-Process
>  Graphics Translation Table (PPGTT). Of important note, is that although
> -PPGTT is named per-process it is actually per context. When user space
> -submits a batchbuffer, the kernel walks the list of GEM buffer objects
> -used by the batchbuffer and guarantees that not only is the memory of
> -each such GEM buffer object resident but it is also present in the
> -(PP)GTT. If the GEM buffer object is not yet placed in the (PP)GTT,
> -then it is given an address. Two consequences of this are: the kernel
> -needs to edit the batchbuffer submitted to write the correct value of
> -the GPU address when a GEM BO is assigned a GPU address and the kernel
> +PPGTT is named per-process it is actually per context. In legacy
> +(non-vm_bind) mode, when user space submits a batchbuffer, the kernel walks
> +the list of GEM buffer objects used by the batchbuffer and guarantees that
> +not only is the memory of each such GEM buffer object resident but it is
> +also present in the (PP)GTT. If the GEM buffer object is not yet placed in
> +the (PP)GTT, then it is given an address. Two consequences of this are: the
> +kernel needs to edit the batchbuffer submitted to write the correct value
> +of the GPU address when a GEM BO is assigned a GPU address and the kernel
>  might evict a different GEM BO from the (PP)GTT to make address room
>  for another GEM BO. Consequently, the ioctls submitting a batchbuffer
>  for execution also include a list of all locations within buffers that
> @@ -407,6 +411,15 @@ objects, which has the goal to make space in gpu virtual address spaces.
>  .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>     :internal:
>  
> +VM_BIND mode
> +------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> +   :doc: VM_BIND/UNBIND ioctls
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> +   :internal:
> +
>  Batchbuffer Parsing
>  -------------------
>  
> @@ -419,11 +432,38 @@ Batchbuffer Parsing
>  User Batchbuffer Execution
>  --------------------------
>  
> +Client state
> +~~~~~~~~~~~~
> +
>  .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>  
> +User command execution
> +~~~~~~~~~~~~~~~~~~~~~~
> +
>  .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>     :doc: User command execution
>  
> +User command execution in vm_bind mode
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
> +   :doc: User command execution in vm_bind mode
> +
> +Common execbuff utilities
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c
> +   :internal:
> +
> +Execbuf3 ioctl path
> +~~~~~~~~~~~~~~~~~~~
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
> +   :internal:
> +
>  Scheduling
>  ----------
>  .. kernel-doc:: drivers/gpu/drm/i915/i915_scheduler_types.h
> -- 
> 2.21.0.rc0.32.g243a4c7e27
