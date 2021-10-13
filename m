Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF7A42C1C1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 15:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A1B6E0A8;
	Wed, 13 Oct 2021 13:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53C76E0A8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 13:51:42 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m22so8858373wrb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 06:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=RDjh7ljebRSt38zFWBMEBzk5yXKZ4FYMY85BFRMwWgQ=;
 b=MNifXt3mF3okNpsiEssZ27hMg61rLsCJUBbauwDiDcM6C0PnEaI7r+zy8SkpiycBgz
 /tynbL50JG6vWlyExoTOk9+dpyobfFqgdcsP60R6E2gUWVCEAssLoPNo7MkM6HdfGIXf
 5QeouRrJ3M2wTACOSdclhaeFDVZEGdGt+nfEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RDjh7ljebRSt38zFWBMEBzk5yXKZ4FYMY85BFRMwWgQ=;
 b=KWtMBhsjecX5IJ7VZ1e542bFuNpFhoFenONkWILb/kz49GkGEM2rWYFIR/vfNXobYV
 4QMaFblB51Ub7Il1TGgvB4+HY+QIOgCV4J6Z4O6bPZUMFSa5KpV0lvHdn/ne3YtFrHYG
 6r3rxAi+fE+wIRk/zXz4FKGu6RaylCYpp1BOnADK2GkaJBsuJ7aRzQEgwgTO6J3AQxzM
 cQtsx6nOiPY42zCXu9FoVMIkeywStwvjvD2fjq4I8xQmjH3vUTWlqubCiLD36S7iuW0/
 6kVAaGc9qOoWOExDAnD+2WxBK9VcQFz/3dVFdKqrInlG5v1ppnQ1wcVFG1SSA17YEmV9
 XmeA==
X-Gm-Message-State: AOAM530uQUQ6ovRk5QpfGmRqEEC0XsyR1THdZGas9IrxHcsLZkp69FdJ
 ygfn0M2444/MIpoWttD2RElQziiJ7TQ53w==
X-Google-Smtp-Source: ABdhPJxchLMfKiKcOWyofoSE2tFtausnvyMlP7w1Aspp2zYoZh3XqYq6O0VJiGoBl52SnyPeogcoTQ==
X-Received: by 2002:a05:600c:4f53:: with SMTP id
 m19mr13170826wmq.118.1634133101327; 
 Wed, 13 Oct 2021 06:51:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w8sm10829707wrr.47.2021.10.13.06.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 06:51:40 -0700 (PDT)
Date: Wed, 13 Oct 2021 15:51:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ramalingam C <ramalingam.c@intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>, CQ Tang <cq.tang@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>
Subject: Re: [PATCH 00/14] drm/i915/dg2: Enabling 64k page size and flat ccs
Message-ID: <YWbka8GGdYZvdlvu@phenom.ffwll.local>
References: <20211011161155.6397-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211011161155.6397-1-ramalingam.c@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Mon, Oct 11, 2021 at 09:41:41PM +0530, Ramalingam C wrote:
> This series introduces the enabling patches for new flat ccs feature and
> 64k page support for i915 local memory, along with documentation on the
> uAPI impact.
> 
> 64k page support
> ================
> 
> On discrete platforms, starting from DG2, we have to contend with GTT
> page size restrictions when dealing with I915_MEMORY_CLASS_DEVICE
> objects. Specifically the hardware only supports 64K or larger GTT page
> sizes for such memory. The kernel will already ensure that all
> I915_MEMORY_CLASS_DEVICE memory is allocated using 64K or larger page
> sizes underneath.
> 
> Note that the returned size here will always reflect any required
> rounding up done by the kernel, i.e 4K will now become 64K on devices
> such as DG2. The GTT alignment will also need be at least 64K for such
> objects.
> 
> Note that due to how the hardware implements 64K GTT page support, we
> have some further complications:
> 
> 1.) The entire PDE(which covers a 2M virtual address range), must
> contain only 64K PTEs, i.e mixing 4K and 64K PTEs in the same PDE is
> forbidden by the hardware.
> 
> 2.) We still need to support 4K PTEs for I915_MEMORY_CLASS_SYSTEM
> objects.
> 
> To handle the above the kernel implements a memory coloring scheme to
> prevent userspace from mixing I915_MEMORY_CLASS_DEVICE and
> I915_MEMORY_CLASS_SYSTEM objects in the same PDE. If the kernel is ever
> unable to evict the required pages for the given PDE(different color)
> when inserting the object into the GTT then it will simply fail the
> request.
> 
> Since userspace needs to manage the GTT address space themselves,
> special care is needed to ensure this doesn’t happen. The simplest
> scheme is to simply align and round up all I915_MEMORY_CLASS_DEVICE
> objects to 2M, which avoids any issues here. At the very least this is
> likely needed for objects that can be placed in both
> I915_MEMORY_CLASS_DEVICE and I915_MEMORY_CLASS_SYSTEM, to avoid
> potential issues when the kernel needs to migrate the object behind the
> scenes, since that might also involve evicting other objects.
> 
> To summarise the GTT rules, on platforms like DG2:
> 
> 1.) All objects that can be placed in I915_MEMORY_CLASS_DEVICE must have
> 64K alignment. The kernel will reject this otherwise.
> 
> 2.) All I915_MEMORY_CLASS_DEVICE objects must never be placed in the
> same PDE with other I915_MEMORY_CLASS_SYSTEM objects. The kernel will
> reject this otherwise.
> 
> 3.) Objects that can be placed in both I915_MEMORY_CLASS_DEVICE and
> I915_MEMORY_CLASS_SYSTEM should probably be aligned and padded out to
> 2M.
> 
> Flat CCS:
> =========
> Gen 12+ devices support 3D surfaces compression and compression formats.
> This is accomplished by an additional compression control state (CCS)
> stored for each surface.
> 
> Gen 12 devices(TGL and DG1) stores compression state in a separate
> region of memory. It is managed by userspace and has an associated set
> of userspace managed page tables used by hardware for address
> translation.
> 
> In Gen 12.5 devices(XEXPSDV and DG2) Flat CCS is introduced to replace
> the userspace managed AUX pagetable with the flat indexed region of
> device memory for storing the compression state
> 
> GOP Driver steals a chunk of memory for the CCS surface corresponding to
> the entire range of local memory. The memory required for the CCS of the
> entire local memory is 1/256 of the main local memory. The Gop driver
> will also program a secure register (XEHPSDV_FLAT_CCS_BASE_ADDR 0x4910)
> with this address value.
> 
> TODO: add patches for the flatccs modifiers and kdoc for them.

Ah it's here too :-)

Since this is uapi we also need link to igts (or at least where the tests
are), and to mesa MR (if that hasn't all landed yet).
-Daniel

> 
> *** BLURB HERE ***
> 
> Abdiel Janulgue (1):
>   drm/i915/lmem: Enable lmem for platforms with Flat CCS
> 
> Ayaz A Siddiqui (1):
>   drm/i915/gt: Clear compress metadata for Gen12.5 >= platforms
> 
> Bommu Krishnaiah (1):
>   drm/i915: Add vm min alignment support
> 
> CQ Tang (1):
>   drm/i915/xehpsdv: Add has_flat_ccs to device info
> 
> Matthew Auld (8):
>   drm/i915/xehpsdv: set min page-size to 64K
>   drm/i915/xehpsdv: enforce min GTT alignment
>   drm/i915: enforce min page size for scratch
>   drm/i915/gtt/xehpsdv: move scratch page to system memory
>   drm/i915/xehpsdv: support 64K GTT pages
>   drm/i915/selftests: account for min_alignment in GTT selftests
>   drm/i915/xehpsdv: implement memory coloring
>   drm/i915/uapi: document behaviour for DG2 64K support
> 
> Ramalingam C (1):
>   Doc/gpu/rfc/i915: i915 DG2 uAPI
> 
> Stuart Summers (1):
>   drm/i915: Add has_64k_pages flag
> 
>  Documentation/gpu/rfc/i915_dg2.rst            |  47 ++++++
>  Documentation/gpu/rfc/index.rst               |   3 +
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |   6 +-
>  .../gpu/drm/i915/gem/selftests/huge_pages.c   |  61 ++++++++
>  .../i915/gem/selftests/i915_gem_client_blt.c  |  23 ++-
>  drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |   1 +
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 145 +++++++++++++++++-
>  drivers/gpu/drm/i915/gt/intel_ggtt.c          |   2 +
>  drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |  14 ++
>  drivers/gpu/drm/i915/gt/intel_gt.c            |  19 +++
>  drivers/gpu/drm/i915/gt/intel_gt.h            |   1 +
>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  23 ++-
>  drivers/gpu/drm/i915/gt/intel_gtt.h           |  20 +++
>  drivers/gpu/drm/i915/gt/intel_migrate.c       | 120 ++++++++++++++-
>  drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   1 +
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  27 +++-
>  drivers/gpu/drm/i915/i915_drv.h               |   4 +
>  drivers/gpu/drm/i915/i915_gem_evict.c         |  17 ++
>  drivers/gpu/drm/i915/i915_pci.c               |   3 +
>  drivers/gpu/drm/i915/i915_reg.h               |   3 +
>  drivers/gpu/drm/i915/i915_vma.c               |  55 +++++--
>  drivers/gpu/drm/i915/intel_device_info.h      |   2 +
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  96 ++++++++----
>  drivers/gpu/drm/i915/selftests/mock_gtt.c     |   2 +
>  include/uapi/drm/i915_drm.h                   |  61 +++++++-
>  25 files changed, 681 insertions(+), 75 deletions(-)
>  create mode 100644 Documentation/gpu/rfc/i915_dg2.rst
> 
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
