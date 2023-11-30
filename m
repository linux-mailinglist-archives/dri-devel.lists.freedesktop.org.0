Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E337FEA82
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 09:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8D310E6BF;
	Thu, 30 Nov 2023 08:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5632810E6BD;
 Thu, 30 Nov 2023 08:27:51 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50bbb4de875so964892e87.0; 
 Thu, 30 Nov 2023 00:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701332869; x=1701937669; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+J7Dw0xS7njLls6LRLf0GFFRCC6R0nx+ESlm94JNcIs=;
 b=fk5sobDe45Vm0Dctkzkoa4ns4HSBZfUV1Vvb/kAsh8rRhF9UHvIiWrMmkTwFBNsof7
 7Bi6/kFbYwnSNXNNX3TMJExURhyxuOUu4EEXRWcV0zpbQpxbNCyaTOAdc/+c14XUzU1a
 v5aeG0p0kCfagm+ZNPD4Tss9MVwGb8uAoWkHj3ARmF5/HRxXsVhikDYENGAPj75h1MKV
 DslGhEyNAuwUqJE08yNB8oX/XXP/1GNg1tkfZdu3Ztut3jT3FAkZ56pEoGSdF3rTD9oK
 LGvkkjq8rHSHDsODT1Z3KDs0/2n3jr6peYYPKbEVrxVwcMyrQ9V+BGmuH8DhlqYyLwkV
 B0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701332869; x=1701937669;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+J7Dw0xS7njLls6LRLf0GFFRCC6R0nx+ESlm94JNcIs=;
 b=dRiTcioUxJJT5lrkMpn8c6qhbMgxEZ3k5P6SRupIu9ddDqtZb88Lnej4p3RQe4T3ii
 mrVdQ2+uc+2m1jCfmhqx2ko/QSYpUqBSVdjiaytxp7DX968iMxLt0Kbz6U+IgbnQmlwK
 2iuDJQiV0STqxpnq2pGLnIT4Y4X95U6DmtK3ZSF94+LvPMc4QxHMCHnYRF+Rt6qoxxTv
 Ur9lTEs9EqetKwIMerfvJPzE2sWb6UyyKbc2LKXA64kipMsQ5pycttaFXZ1HmKTt9Xib
 ttuhWX4EPCscbx4EJAjFakx9HWILv6iXVQ0t+QALM3f/o5rUfVbZZVRAA9zfJx0goHh4
 UFZg==
X-Gm-Message-State: AOJu0YxzMRO7Vp2EAAUXexjpTllV2kmCNrWVfn119ISUCGhvSACsauUy
 d93KbNY3M6JX2Z5mfLehVrk=
X-Google-Smtp-Source: AGHT+IF03WzohOCAOFDPfOmLeaFp7RZCFKxQ+YxMwrkoP0QP4/RXaRhf+B5nuuPq8R1GGPEyqyl7tw==
X-Received: by 2002:a05:6512:e84:b0:50b:c975:8b30 with SMTP id
 bi4-20020a0565120e8400b0050bc9758b30mr2145792lfb.66.1701332869075; 
 Thu, 30 Nov 2023 00:27:49 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a05600c34cd00b0040b540ff0a5sm1115323wmq.19.2023.11.30.00.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Nov 2023 00:27:48 -0800 (PST)
Message-ID: <65c01257-b96d-4365-a86a-4d0758a8ec65@gmail.com>
Date: Thu, 30 Nov 2023 09:27:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory management)
 for external memory devices
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Weixi Zhu <weixi.zhu@huawei.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20231128125025.4449-1-weixi.zhu@huawei.com>
 <56ec69e0-fee1-4edf-8839-62ba6a2f0183@amd.com>
 <SA1PR11MB69918A97B03BC578CFD15EBA9283A@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <SA1PR11MB69918A97B03BC578CFD15EBA9283A@SA1PR11MB6991.namprd11.prod.outlook.com>
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "apopple@nvidia.com" <apopple@nvidia.com>, "ziy@nvidia.com" <ziy@nvidia.com>,
 "weixi.zhu@openeuler.sh" <weixi.zhu@openeuler.sh>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "mhairgrove@nvidia.com" <mhairgrove@nvidia.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "leonro@nvidia.com" <leonro@nvidia.com>, "mgorman@suse.de" <mgorman@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oak,

yeah, #4 is indeed a really good point and I think Felix will agree to 
that as well.

HMM is basically still missing a way to advise device attributes for the 
CPU address space. Both migration strategy as well as device specific 
information (like cache preferences) fall into this category.

Since there is a device specific component in those attributes as well I 
think device specific IOCTLs still make sense to update them, but HMM 
should offer the functionality to manage and store those information.

Split and merge of VMAs only become a problem if you attach those 
information to VMAs, if you keep them completely separate than that 
doesn't become an issue either. The down side of this approach is that 
you don't get automatically extending attribute ranges for growing VMAs 
for example.

Regards,
Christian.

Am 29.11.23 um 23:23 schrieb Zeng, Oak:
> Hi Weixi,
>
> Even though Christian has listed reasons rejecting this proposal (yes they are very reasonable to me), I would open my mind and further explore the possibility here. Since the current GPU driver uses a hmm based implementation (AMD and NV has done this; At Intel we are catching up), I want to explore how much we can benefit from the proposed approach and how your approach can solve some pain points of our development. So basically what I am questioning here is: what is the advantage of your approach against hmm.
>
> To implement a UVM (unified virtual address space b/t cpu and gpu device), with hmm, driver essentially need to implement below functions:
>
> 1. device page table update. Your approach requires the same because this is device specific codes
>
> 2. Some migration functions to migrate memory b/t system memory and GPU local memory. My understanding is, even though you generalized this a bit, such as modified cpu page fault path, provided "general" gm_dev_fault handler... but device driver still need to provide migration functions because migration functions have to be device specific (i.e., using device dma/copy engine for performance purpose). Right?
>
> 3. GPU physical memory management, this part is now in drm/buddy, shared by all drivers. I think with your approach, driver still need to provide callback functions to allocate/free physical pages. Right? Or do you let linux core mm buddy manage device memory directly?
>
> 4. madvise/hints/virtual address range management. This has been pain point for us. Right now device driver has to maintain certain virtual address range data structure to maintain hints and other virtual address range based memory attributes. Driver need to sync with linux vma. Driver need to explicitly deal with range split/merging... HMM doesn't provide support in this area. Your approach seems cleaner/simpler to me...
>
>
> So in above, I have examined the some key factors of a gpu UVM memory manager. I think for #1 and #2, hmm has provide pretty good abstraction/tools for address space mirroring and migration helpers. For #3, since we have a common drm/buddy layer, I don't think it is a big problem for driver writer now.
>
> I do see #4 is something you solved more beautifully, requires new system call though.
>
> Oak
>
>
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> Christian König
>> Sent: Tuesday, November 28, 2023 8:09 AM
>> To: Weixi Zhu <weixi.zhu@huawei.com>; linux-mm@kvack.org; linux-
>> kernel@vger.kernel.org; akpm@linux-foundation.org; Danilo Krummrich
>> <dakr@redhat.com>; Dave Airlie <airlied@redhat.com>; Daniel Vetter
>> <daniel@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org; leonro@nvidia.com; apopple@nvidia.com;
>> amd-gfx@lists.freedesktop.org; mgorman@suse.de; ziy@nvidia.com; Wang, Zhi
>> A <zhi.a.wang@intel.com>; rcampbell@nvidia.com; jgg@nvidia.com;
>> weixi.zhu@openeuler.sh; jhubbard@nvidia.com; intel-gfx@lists.freedesktop.org;
>> mhairgrove@nvidia.com; jglisse@redhat.com; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>; intel-gvt-dev@lists.freedesktop.org;
>> tvrtko.ursulin@linux.intel.com; Felix.Kuehling@amd.com; Xinhui.Pan@amd.com;
>> alexander.deucher@amd.com; ogabbay@kernel.org
>> Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory
>> management) for external memory devices
>>
>> Adding a few missing important people to the explicit to list.
>>
>> Am 28.11.23 um 13:50 schrieb Weixi Zhu:
>>> The problem:
>>>
>>> Accelerator driver developers are forced to reinvent external MM subsystems
>>> case by case, because Linux core MM only considers host memory resources.
>>> These reinvented MM subsystems have similar orders of magnitude of LoC as
>>> Linux MM (80K), e.g. Nvidia-UVM has 70K, AMD GPU has 14K and Huawei NPU
>> has
>>> 30K. Meanwhile, more and more vendors are implementing their own
>>> accelerators, e.g. Microsoft's Maia 100. At the same time,
>>> application-level developers suffer from poor programmability -- they must
>>> consider parallel address spaces and be careful about the limited device
>>> DRAM capacity. This can be alleviated if a malloc()-ed virtual address can
>>> be shared by the accelerator, or the abundant host DRAM can further
>>> transparently backup the device local memory.
>>>
>>> These external MM systems share similar mechanisms except for the
>>> hardware-dependent part, so reinventing them is effectively introducing
>>> redundant code (14K~70K for each case). Such developing/maintaining is not
>>> cheap. Furthermore, to share a malloc()-ed virtual address, device drivers
>>> need to deeply interact with Linux MM via low-level MM APIs, e.g. MMU
>>> notifiers/HMM. This raises the bar for driver development, since developers
>>> must understand how Linux MM works. Further, it creates code maintenance
>>> problems -- any changes to Linux MM potentially require coordinated changes
>>> to accelerator drivers using low-level MM APIs.
>>>
>>> Putting a cache-coherent bus between host and device will not make these
>>> external MM subsystems disappear. For example, a throughput-oriented
>>> accelerator will not tolerate executing heavy memory access workload with
>>> a host MMU/IOMMU via a remote bus. Therefore, devices will still have
>>> their own MMU and pick a simpler page table format for lower address
>>> translation overhead, requiring external MM subsystems.
>>>
>>> --------------------
>>>
>>> What GMEM (Generalized Memory Management [1]) does:
>>>
>>> GMEM extends Linux MM to share its machine-independent MM code. Only
>>> high-level interface is provided for device drivers. This prevents
>>> accelerator drivers from reinventing the wheel, but relies on drivers to
>>> implement their hardware-dependent functions declared by GMEM. GMEM's
>> key
>>> interface include gm_dev_create(), gm_as_create(), gm_as_attach() and
>>> gm_dev_register_physmem(). Here briefly describe how a device driver
>>> utilizes them:
>>> 1. At boot time, call gm_dev_create() and registers the implementation of
>>>      hardware-dependent functions as declared in struct gm_mmu.
>>>        - If the device has local DRAM, call gm_dev_register_physmem() to
>>>          register available physical addresses.
>>> 2. When a device context is initialized (e.g. triggered by ioctl), check if
>>>      the current CPU process has been attached to a gmem address space
>>>      (struct gm_as). If not, call gm_as_create() and point current->mm->gm_as
>>>      to it.
>>> 3. Call gm_as_attach() to attach the device context to a gmem address space.
>>> 4. Invoke gm_dev_fault() to resolve a page fault or prepare data before
>>>      device computation happens.
>>>
>>> GMEM has changed the following assumptions in Linux MM:
>>>     1. An mm_struct not only handle a single CPU context, but may also handle
>>>        external memory contexts encapsulated as gm_context listed in
>>>        mm->gm_as. An external memory context can include a few or all of the
>>>        following parts: an external MMU (that requires TLB invalidation), an
>>>        external page table (that requires PTE manipulation) and external DRAM
>>>        (that requires physical memory management).
>>>     2. Faulting a MAP_PRIVATE VMA with no CPU PTE found does not necessarily
>>>        mean that a zero-filled physical page should be mapped. The virtual
>>>        page may have been mapped to an external memory device.
>>>     3. Unmapping a page may include sending device TLB invalidation (even if
>>>        its MMU shares CPU page table) and manipulating device PTEs.
>>>
>>> --------------------
>>>
>>> Semantics of new syscalls:
>>>
>>> 1. mmap(..., MAP_PRIVATE | MAP_PEER_SHARED)
>>>       Allocate virtual address that is shared between the CPU and all
>>>       attached devices. Data is guaranteed to be coherent whenever the
>>>       address is accessed by either CPU or any attached device. If the device
>>>       does not support page fault, then device driver is responsible for
>>>       faulting memory before data gets accessed. By default, the CPU DRAM is
>>>       can be used as a swap backup for the device local memory.
>>> 2. hmadvise(NUMA_id, va_start, size, memory_hint)
>>>       Issuing memory hint for a given VMA. This extends traditional madvise()
>>>       syscall with an extra argument so that programmers have better control
>>>       with heterogeneous devices registered as NUMA nodes. One useful
>> memory
>>>       hint could be MADV_PREFETCH, which guarantees that the physical data of
>>>       the given VMA [VA, VA+size) is migrated to NUMA node #id. Another
>>>       useful memory hint is MADV_DONTNEED. This is helpful to increase device
>>>       memory utilization. It is worth considering extending the existing
>>>       madvise() syscall with one additional argument.
>>>
>>> --------------------
>>>
>>> Implementation details
>>>
>>> 1. New VMA flag: MAP_PEER_SHARED
>>>
>>> This new flag helps isolate GMEM feature, so that common processes with
>>> no device attached does not need to maintain any logical page table. It
>>> can be deleted if the extra overhead from GMEM is acceptable.
>>>
>>> 2. MMU functions
>>> The device driver must implement the MMU functions declared in struct
>>> gm_mmu.
>>>
>>> VA functions: peer_va_alloc_fixed(), peer_va_free()
>>>
>>> They are used to negotiate a common available VMA between a host
>>> process and a device process at the mmap() time. This is because some
>>> accelerators like Intel Xeon Phi or Huawei's Ascend NPU have their
>>> acceleration tasks executed within a device CPU process context. Some
>>> accelerators may also choose a different format of virtual address
>>> space.
>>>
>>> PA functions: alloc_page(), free_page(), prepare_page()
>>>
>>> Alloc_page() and free_page() are used to allocate and free device physical
>>> pages. Prepare_page() is used to zero-fill or DMA the data of a physical
>>> page. These functions were removed from the submitted patch, since GMEM
>>> does not need to invoke them when testing Huawei's NPU accelerator. The
>> NPU
>>> accelerator has an OS running in the device that manages the device
>>> physical memory. However, even for such a device it is better for the host
>>> to directly manage device physical memory, which saves device HBM and
>>> avoids synchronizing management status between the host and device.
>>>
>>> Page-table functions: pmap_create()/destroy()/enter()/release()/protect()
>>>
>>> They are used to create and destroy device page tables, install and
>>> uninstall page table entries and to change the protection of page table
>>> entries.
>>>
>>> TLB-invalidation functions: tlb_invl(), tlb_invl_coalesced()
>>>
>>> They are used to invalidate the TLB entries of a given range of VA or
>>> invalidate a given list of VMAs.
>>>
>>> Wrapper functions: peer_map() and peer_unmap()
>>>
>>> These two functions are used to create or destroy a device mapping which
>>> could include allocating physical memory and copying data. They effectively
>>> wraps the PA functions, Page-table functions and TLB-invalidation
>>> functions. Implementing these steps together allows devices to optimize the
>>> communication cost between host and device. However, it requires the device
>>> driver to correctly order these steps.
>>>
>>> 3. Tracking logical mappings:
>>>
>>> Each process starts maintaining an xarray in mm->vm_obj->logical_page_table
>>> at the first time a host process calls mmap(MAP_PRIVATE |
>> MAP_PEER_SHARED).
>>> When a virtual page gets touched, its mapping status is created and stored
>>> in struct gm_mapping. The logical page table is utilized to query the
>>> struct gm_mapping given a virtual address. GMEM extends Linux MM to
>> update
>>> and lookup these logical mappings. For example, in the patch set we modify
>>> the page fault path of to additionally check the logical mapping of
>>> MAP_PEER_SHARED VMAs and identify if a device page should be migrated.
>>> Similarly, if the device driver wants to resolve a device page fault or
>>> prefetch data, the driver should call gm_dev_fault(). This function
>>> examines the mapping status and determines whether the device driver should
>>> migrate a CPU page to device or install a zero-filled device page.
>>>
>>> The logical mapping abstraction enhances the extensibility of Linux core MM
>>> (a virtual page may be mapped to a device physical page without any CPU PTE
>>> installed). The current implementation is not complete, since it only
>>> focused on anonymous VMAs with MAP_PEER_SHARED flag. The future plan of
>>> logical page table is to provide a generic abstraction layer that support
>>> common anonymous memory (I am looking at you, transparent huge pages)
>> and
>>> file-backed memory.
>>>
>>> --------------------
>>>
>>> Use cases
>>>
>>> GMEM has been tested over Huawei's NPU (neural process unit) device driver.
>>> The original NPU device driver has approximately 30,000 lines of code for
>>> memory management. On the contrary, the GMEM-based one has less than 30
>>> lines of code calling GMEM API, with approximately 3,700 lines of code
>>> implementing the MMU functions. This effectively saves over 26,200 lines
>>> of MM code for one driver. Therefore, developers from accelerator vendors,
>>> including Nvidia, AMD, Intel and other companies are welcome to discuss if
>>> GMEM could be helpful.
>>>
>>> Using GMEM-based driver, it is possible to write a C-style accelerator code
>>> with malloc(), whose underlying mmap() syscall should include
>>> MAP_PEER_SHARED according to current GMEM implementation. Importantly,
>> GMEM
>>> guarantees a coherent view of memory between the host and all attached
>>> devices. This means that any data written by the CPU or any attached
>>> accelerator can be seen by the next memory load instruction issued by any
>>> attached accelerator or the CPU. Furthermore, the NPU device was able to
>>> oversubscribe memory by swapping memory to host DDR. Note that this
>> memory
>>> oversubscription mechanism can be universal if the physical memory
>>> management is provided by GMEM. Other potential use cases of GMEM could
>>> include the IOMMU driver, KVM and RDMA drivers, as long as the device needs
>>> to manage external memory resources like VMAs, MMUs or local DRAMs.
>>>
>>> --------------------
>>>
>>> Discussion
>>>
>>> Physical memory management
>>> Most accelerators require the host OS to manage device DRAM. Even
>>> accelerators capable of running an OS inside the driver can benefit from
>>> it, since it helps avoid synchronizing management status between the host
>>> and device. In Linux OSS EU summit 2023, Hannes Reinecke from SUSE Labs
>>> suggested that people are concerned with the memory consumption of struct
>>> page (which considers all generic scenarios for the kernel). This leads to
>>> a possible solution that, instead of reusing Linux struct page and
>>> ZONE_DEVICE mechanism, GMEM can implement an isolated buddy allocator
>> for
>>> the device to instantiate and register. The isolation is useful because
>>> device DRAM physical address space is independent. Furthermore, the
>>> isolated buddy allocator can utilize a customized struct page that consumes
>>> less memory. It is worth discussing if accelerator vendors desire this
>>> solution.
>>>
>>> MMU functions
>>> The MMU functions peer_map() and peer_unmap() overlap other functions,
>>> leaving a question if the MMU functions should be decoupled as more basic
>>> operations. Decoupling them could potentially prevent device drivers
>>> coalescing these basic steps within a single host-device communication
>>> operation, while coupling them makes it more difficult for device drivers
>>> to utilize GMEM interface.
>>>
>>> The idea of GMEM was originated from Weixi's PhD study with
>>> Prof. Scott Rixner and Prof. Alan L. Cox at Rice University.
>>>
>>> [1] https://arxiv.org/abs/2310.12554.
>>>
>>> Weixi Zhu (6):
>>>     mm/gmem: add heterogeneous NUMA node
>>>     mm/gmem: add arch-independent abstraction to track address mapping
>>>       status
>>>     mm/gmem: add GMEM (Generalized Memory Management) interface for
>>>       external accelerators
>>>     mm/gmem: add new syscall hmadvise() to issue memory hints for
>>>       heterogeneous NUMA nodes
>>>     mm/gmem: resolve VMA conflicts for attached peer devices
>>>     mm/gmem: extending Linux core MM to support unified virtual address
>>>       space
>>>
>>>    arch/arm64/include/asm/unistd.h         |   2 +-
>>>    arch/arm64/include/asm/unistd32.h       |   2 +
>>>    drivers/base/node.c                     |   6 +
>>>    fs/proc/task_mmu.c                      |   3 +
>>>    include/linux/gmem.h                    | 368 ++++++++++++
>>>    include/linux/mm.h                      |   8 +
>>>    include/linux/mm_types.h                |   5 +
>>>    include/linux/nodemask.h                |  10 +
>>>    include/uapi/asm-generic/mman-common.h  |   4 +
>>>    include/uapi/asm-generic/unistd.h       |   5 +-
>>>    init/main.c                             |   2 +
>>>    kernel/fork.c                           |   5 +
>>>    kernel/sys_ni.c                         |   2 +
>>>    mm/Kconfig                              |  14 +
>>>    mm/Makefile                             |   1 +
>>>    mm/gmem.c                               | 746 ++++++++++++++++++++++++
>>>    mm/huge_memory.c                        |  85 ++-
>>>    mm/memory.c                             |  42 +-
>>>    mm/mempolicy.c                          |   4 +
>>>    mm/mmap.c                               |  40 +-
>>>    mm/oom_kill.c                           |   2 +
>>>    mm/page_alloc.c                         |   3 +
>>>    mm/vm_object.c                          | 309 ++++++++++
>>>    tools/include/uapi/asm-generic/unistd.h |   5 +-
>>>    24 files changed, 1654 insertions(+), 19 deletions(-)
>>>    create mode 100644 include/linux/gmem.h
>>>    create mode 100644 mm/gmem.c
>>>    create mode 100644 mm/vm_object.c
>>>

