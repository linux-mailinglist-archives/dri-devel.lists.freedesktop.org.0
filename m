Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BC6817A81
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C3D10E2AA;
	Mon, 18 Dec 2023 19:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C9410E2AA;
 Mon, 18 Dec 2023 19:02:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 417B860BBC;
 Sun, 17 Dec 2023 12:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9546BC433CA;
 Sun, 17 Dec 2023 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702816548;
 bh=KC989wv7oa6s8n2noHfUkbDoZtIsS0MRmFFStVi1YFE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Acr3JvUsgOAqfwLnoisrFwMFamzmNs01P2HvLlsnrto10wHndMyX7j2/9Buqk4yww
 mQVrplFrbbNmZ/D5S5FB8uVtyF8z3eLi8WKpT69Z07uPK9Ur74OwaaE7Pf9sXxyhPm
 hKnSceBGTOqHGybphTSw3Rp5QB8FwBK82XwkXLUTdkfwDcUy7QMrUyj5RNc8zZDtZX
 75ASyhG1aUwwIUtpcUwI+60X+TtUNUXqoxW7QrxTSQ8onhtYE0Lbc/TGq353KtdcUW
 KJ3QaNTjmL30mPOSW/F7H4zMFSuxy0+nL3PbD+VGXRHQOFYBFFMZe3q3EIan4pveK4
 9h+WPlHr6LU1A==
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-6d9dc789f23so1741108a34.3; 
 Sun, 17 Dec 2023 04:35:48 -0800 (PST)
X-Gm-Message-State: AOJu0Yxk/4pCrQLB953XTpkBjgcz4H1pFrti7O1uJ8jFd7NhJTX+ufl6
 wTdsKzgCZBpbtMkU6R+0fG/8+5EDIpCcISoEtKg=
X-Google-Smtp-Source: AGHT+IEnHrrYhaJlu+ZMsbcLfTDmjX3KuNXjqnbb/RWCYRvy4T3EK0UA6mwcfoqDR8CXoY0Aw5Y6jHhX0p08xoVusFA=
X-Received: by 2002:a05:6358:a087:b0:172:cb1c:be8e with SMTP id
 u7-20020a056358a08700b00172cb1cbe8emr858852rwn.51.1702816546965; Sun, 17 Dec
 2023 04:35:46 -0800 (PST)
MIME-Version: 1.0
References: <ZXzTA75G5VhCrDis@intel.com>
In-Reply-To: <ZXzTA75G5VhCrDis@intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 17 Dec 2023 14:35:20 +0200
X-Gmail-Original-Message-ID: <CAFCwf10cCXiUoTJ0MU4uxMRSG0Qk00Aep8Kh9NvssTjyW4roWg@mail.gmail.com>
Message-ID: <CAFCwf10cCXiUoTJ0MU4uxMRSG0Qk00Aep8Kh9NvssTjyW4roWg@mail.gmail.com>
Subject: Re: [PULL] drm-xe-next
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: thomas.hellstrom@linux.intel.com, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 16, 2023 at 12:28=E2=80=AFAM Rodrigo Vivi <rodrigo.vivi@intel.c=
om> wrote:
>
> Hi Dave and Sima,
>
> Here goes the first pull request for the drm/xe driver.
>
> Our team was focused on putting together a driver that uses most, if not =
all,
> of the key drm concepts and has a functional display that is shared with =
i915.
> All the platforms are still protected by the force_probe protection becau=
se they
> are either officially supported by i915, or because they are still under
> enablement like Lunar Lake.
>
> We still have a lot of work ahead of us, but we believe that it will be b=
etter
> to work with all of these cross-driver concepts after we are merged to dr=
m-next
> along with the other drivers.
>
> Besides the cross-driver collaboration and enabling of upcoming hardware,=
 one of
> our key areas will be to improve performance and address reports by users=
 so that
> the driver keeps getting better.
>
> I=E2=80=99m having the honor to send this first pull request on behalf of=
 the new team of
> maintainers that we are putting together for the xe driver: Lucas, Thomas=
, and
> Oded. I=E2=80=99m going to assist them to get this through and to set up =
the drm-tip
> development flow. Then, you should expect future pull requests coming dir=
ectly
> from them. Likely, with a rotation of duties that they will define by the=
mselves,
> but that should be similar to drm-intel and drm-misc.
>
> Thanks,
> Rodrigo.

Hi Rodrigo,
You and the team did a great job on bringing the driver to this stage. Cong=
rats!

I reviewed a large part of the driver, mainly focusing on init/fini,
ioctls, memory management, dma-buf.
There were multiple issues raised and all of them were fixed/answered
to my satisfaction.

For the PR:
Acked-by: Oded Gabbay <ogabbay@kernel.org>

Thanks,
Oded

>
> The following changes since commit a60501d7c2d3e70b3545b9b96576628e369d8e=
85:
>
>   Merge tag 'drm-misc-next-2023-12-07' of git://anongit.freedesktop.org/d=
rm/drm-misc into drm-next (2023-12-08 16:27:00 +1000)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2023-=
12-15-pr1
>
> for you to fetch changes up to ac62a6ea9c2030910344723bab3e3f0d04c8a6f4:
>
>   MAINTAINERS: Updates to Intel DRM (2023-12-15 16:41:56 -0500)
>
> ----------------------------------------------------------------
> Introduce a new DRM driver for Intel GPUs
>
> Xe, is a new driver for Intel GPUs that supports both integrated and
> discrete platforms. The experimental support starts with Tiger Lake.
> i915 will continue be the main production driver for the platforms
> up to Meteor Lake and Alchemist. Then the goal is to make this Intel
> Xe driver the primary driver for Lunar Lake and newer platforms.
>
> It uses most, if not all, of the key drm concepts, in special: TTM,
> drm-scheduler, drm-exec, drm-gpuvm/gpuva and others.
>
> It reuses/shares i915 code for display support.
>
> ----------------------------------------------------------------
> Alan Previn (1):
>       drm/xe/guc: Fix h2g_write usage of GUC_CTB_MSG_MAX_LEN
>
> Alexander Usyskin (1):
>       drm/xe/gsc: enable pvc support
>
> Andrzej Hajda (1):
>       drm/xe: implement driver initiated function-reset
>
> Animesh Manna (1):
>       drm/xe/dsb: DSB implementation for xe
>
> Anshuman Gupta (7):
>       drm/xe/pm: Disable PM on unbounded pcie parent bridge
>       drm/xe/pm: Add pci d3cold_capable support
>       drm/xe/pm: Refactor xe_pm_runtime_init
>       drm/xe/pm: Add vram_d3cold_threshold Sysfs
>       drm/xe/pm: Toggle d3cold_allowed using vram_usages
>       drm/xe/pm: Init pcode and restore vram on power lost
>       drm/xe/pm: Add vram_d3cold_threshold for d3cold capable device
>
> Anusha Srivatsa (10):
>       drm/xe/huc: Support for loading unversiond HuC
>       drm/xe: Load HuC on Alderlake S
>       drm/xe: GuC and HuC loading support for RKL
>       drm/xe: Add Rocketlake device info
>       drm/xe/kunit: Handle fake device creation for all platform/subplatf=
orm cases
>       drm/xe: Add missing ADL entries to xe_test_wa
>       drm/xe/rplu: s/ADLP/ALDERLAKE_P
>       drm/xe/rpls: Add RPLS Support
>       drm/xe/rpls: Add Stepping info for RPLS
>       drm/xe: Add missing ADL entries to xe_test_wa
>
> Aravind Iddamsetty (5):
>       drm/xe: Get GT clock to nanosecs
>       drm/xe: Use spinlock in forcewake instead of mutex
>       drm/xe/pmu: Enable PMU interface
>       drm/xe/pmu: Drop interrupt pmu event
>       drm/xe: Fix lockdep warning in xe_force_wake calls
>
> Ashutosh Dixit (2):
>       drm/xe/uapi: Use common drm_xe_ext_set_property extension
>       drm/xe/pmu: Remove PMU from Xe till uapi is finalized
>
> Badal Nilawar (11):
>       drm/xe: Donot apply forcewake while reading actual frequency
>       drm/xe/mtl: Add support to get C6 residency/status of MTL
>       drm/xe/hwmon: Expose power attributes
>       drm/xe/hwmon: Expose card reactive critical power
>       drm/xe/hwmon: Expose input voltage attribute
>       drm/xe/hwmon: Expose hwmon energy attribute
>       drm/xe: Extend rpX values extraction for future platforms
>       drm/xe/hwmon: Add kernel doc and refactor xe hwmon
>       drm/xe/hwmon: Protect hwmon rw attributes with hwmon_lock
>       drm/xe/hwmon: Expose power1_max_interval
>       drm/xe/mtl: Use 16.67 Mhz freq scale factor to get rpX
>
> Balasubramani Vivekanandan (9):
>       drm/xe/gt: Enable interrupt while initializing root gt
>       drm/xe: Use max wopcm size when validating the preset GuC wopcm siz=
e
>       drm/xe: Stop accepting value in xe_migrate_clear
>       drm/xe: Keep all resize bar related prints inside xe_resize_vram_ba=
r
>       drm/xe/xe2: Add MOCS table
>       drm/xe/lnl: Hook up MOCS table
>       drm/xe: Leverage ComputeCS read L3 caching
>       drm/xe: Add event tracing for CTB
>       drm/xe/trace: Optimize trace definition
>
> Bommithi Sakeena (3):
>       drm/xe: Ensure mutex are destroyed
>       drm/xe: Add a missing mutex_destroy to xe_ttm_vram_mgr
>       drm/xe: Encapsulate all the module parameters
>
> Bommu Krishnaiah (2):
>       drm/xe/uapi: add exec_queue_id member to drm_xe_wait_user_fence str=
ucture
>       drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl
>
> Brian Welty (12):
>       drm/xe: Fix BUG_ON during bind with prefetch
>       drm/xe: Fix lockdep warning from xe_vm_madvise
>       drm/xe: Simplify xe_res_get_buddy()
>       drm/xe: Replace xe_ttm_vram_mgr.tile with xe_mem_region
>       drm/xe: Remove unused xe_bo_to_tile
>       drm/xe: Replace usage of mem_type_to_tile
>       drm/xe: Fix dequeue of access counter work item
>       drm/xe: Fix pagefault and access counter worker functions
>       drm/xe: Fix unbind of unaccessed VMA (fault mode)
>       drm/xe: Make xe_mmio_tile_vram_size() static
>       drm/xe: Support device page faults on integrated platforms
>       drm/xe/xe2: Respond to TRTT faults as unsuccessful page fault
>
> Carlos Santa (2):
>       drm/xe: Update the list of devices to add even more TGL devices
>       drm/xe: stringify the argument to avoid potential vulnerability
>
> Chang, Bruce (2):
>       drm/xe: don't auto fall back to execlist mode if guc failed to init
>       drm/xe: fix pvc unload issue
>
> Christopher Snowhill (3):
>       drm/xe: Enable the compat ioctl functionality
>       drm/xe: Add explicit padding to uAPI definition
>       drm/xe: Validate uAPI padding and reserved fields
>
> Dani Liberman (3):
>       drm/xe: proper setting of irq enabled flag
>       drm/xe: change old msi irq api to a new one
>       drm/xe: add msix support
>
> Daniele Ceraolo Spurio (36):
>       drm/xe: limit GGTT size to GUC_GGTT_TOP
>       drm/xe: fix HuC FW ordering for DG1
>       drm/xe/slpc: Start SLPC before GuC submission on reset
>       drm/xe: fix mcr semaphore locking for MTL
>       drm/xe: common function to assign queue name
>       drm/xe: base definitions for the GSCCS
>       drm/xe: add GSCCS irq support
>       drm/xe: add GSCCS ring ops
>       drm/xe: GSC forcewake support
>       drm/xe: don't expose the GSCCS to users
>       drm/xe: enable idle msg and set hysteresis for GSCCS
>       drm/xe: fix submissions without vm
>       drm/xe: split kernel vs permanent engine flags
>       drm/xe: standardize vm-less kernel submissions
>       drm/xe/guc: Switch to major-only GuC FW tracking for MTL
>       drm/xe/uc: Rename guc_submission_enabled() to uc_enabled()
>       drm/xe/uc: Fix uC status tracking
>       drm/xe/uc: Add GuC/HuC firmware path overrides
>       drm/xe: Add child contexts to the GuC context lookup
>       drm/xe/guc: Bump PVC GuC version to 70.9.1
>       drm/xe/uc: Prepare for parsing of different header types
>       drm/xe/huc: Extract version and binary offset from new HuC headers
>       drm/xe/huc: HuC is not supported on GTs that don't have video engin=
es
>       drm/xe/huc: Don't re-auth HuC if it's already authenticated
>       drm/xe/huc: Define HuC for MTL
>       drm/xe/uc: Rework uC version tracking
>       drm/xe/gsc: Introduce GSC FW
>       drm/xe/gsc: Parse GSC FW header
>       drm/xe/gsc: GSC FW load
>       drm/xe/gsc: Implement WA 14015076503
>       drm/xe/gsc: Trigger a driver flr to cleanup the GSC on unload
>       drm/xe/gsc: Query GSC compatibility version
>       drm/xe/gsc: Define GSCCS for MTL
>       drm/xe/gsc: Define GSC FW for MTL
>       drm/xe/huc: Prepare for 2-step HuC authentication
>       drm/xe/huc: HuC authentication via GSC
>
> David Kershner (2):
>       drm/xe/xe_migrate.c: Use DPA offset for page table entries.
>       drm/xe/tests/xe_migrate.c: Add vram to vram KUNIT test
>
> Dnyaneshwar Bhadane (1):
>       drm/xe/xe2: Add initial workarounds
>
> Fei Yang (3):
>       drm/xe: set PTE_AE for all platforms supporting it
>       drm/xe: timeout needs to be a signed value
>       drm/xe: explicitly set GGTT access for GuC DMA
>
> Francois Dugast (57):
>       drm/xe: Use global macros to set PM functions
>       drm/xe: Fix build without CONFIG_PM_SLEEP
>       drm/xe: Fix splat during error dump
>       drm/xe: Remove unused define
>       drm/xe: Use SPDX-License-Identifier instead of license text
>       drm/xe: Group engine related structs
>       drm/xe: Fix some formatting issues in uAPI
>       drm/xe: Document structures for device query
>       drm/xe: Move defines before relevant fields
>       drm/xe: Document topology mask query
>       drm/xe: Cleanup SPACING style issues
>       drm/xe: Cleanup OPEN_BRACE style issues
>       drm/xe: Cleanup POINTER_LOCATION style issues
>       drm/xe: Cleanup CODE_INDENT style issues
>       drm/xe: Cleanup TRAILING_WHITESPACE style issues
>       drm/xe: Cleanup COMPLEX_MACRO style issues
>       drm/xe: Fix typos
>       drm/xe: Prevent flooding the kernel log with XE_IOCTL_ERR
>       drm/xe: Cleanup style warnings
>       drm/xe: Rely on kmalloc/kzalloc log message
>       drm/xe/execlist: Remove leftover printk messages
>       drm/xe: Cleanup style warnings and errors
>       drm/xe/execlist: Log when using execlist submission
>       drm/xe/macro: Remove unused constant
>       drm/xe: Prefer WARN() over BUG() to avoid crashing the kernel
>       drm/xe: Rename xe_engine.[ch] to xe_exec_queue.[ch]
>       drm/xe: Rename engine to exec_queue
>       drm/xe/pm: Use PM functions only if CONFIG_PM_SLEEP is enabled
>       drm/xe: Replace XE_WARN_ON with drm_warn when just printing a strin=
g
>       drm/xe: Use Xe assert macros instead of XE_WARN_ON macro
>       drm/xe/uapi: Separate VM_BIND's operation and flag
>       drm/xe/vm: Remove VM_BIND_OP macro
>       drm/xe/uapi: Remove MMIO ioctl
>       drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
>       drm/xe/display: Use acpi_target_system_state only if ACPI_SLEEP is =
enabled
>       drm/xe/uapi: Remove useless XE_QUERY_CONFIG_NUM_PARAM
>       drm/xe/uapi: Remove unused inaccessible memory region
>       drm/xe/uapi: Remove unused QUERY_CONFIG_MEM_REGION_COUNT
>       drm/xe/uapi: Remove unused QUERY_CONFIG_GT_COUNT
>       drm/xe/uapi: Add missing DRM_ prefix in uAPI constants
>       drm/xe/uapi: Add _FLAG to uAPI constants usable for flags
>       drm/xe/uapi: Change rsvd to pad in struct drm_xe_class_instance
>       drm/xe/uapi: Align on a common way to return arrays (memory regions=
)
>       drm/xe/uapi: Align on a common way to return arrays (gt)
>       drm/xe/uapi: Align on a common way to return arrays (engines)
>       drm/xe/uapi: Remove DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
>       drm/xe/uapi: Remove DRM_XE_UFENCE_WAIT_MASK_*
>       drm/xe/uapi: Add a comment to each struct
>       drm/xe/uapi: Add missing documentation for struct members
>       drm/xe/uapi: Document use of size in drm_xe_device_query
>       drm/xe/uapi: Document drm_xe_query_config keys
>       drm/xe/uapi: Document DRM_XE_DEVICE_QUERY_HWCONFIG
>       drm/xe/uapi: Make constant comments visible in kernel doc
>       drm/xe/uapi: Add block diagram of a device
>       drm/xe/uapi: Add examples of user space code
>       drm/xe/uapi: Move CPU_CACHING defines before doc
>       drm/xe/uapi: Move DRM_XE_ACC_GRANULARITY_* where they are used
>
> Gustavo Sousa (15):
>       drm/xe: Include only relevant header in xe_module.h
>       drm/xe: Get rid of MAKE_INIT_EXIT_FUNCS
>       drm/xe: Call exit functions when xe_register_pci_driver() fails
>       drm/xe: Do not forget to drm_dev_put() in xe_pci_probe()
>       drm/xe: Call drmm_add_action_or_reset() early in xe_device_create()
>       drm/xe: Fail xe_device_create() if wq allocation fails
>       drm/xe: Replace deprecated DRM_ERROR()
>       drm/xe/reg_sr: Use a single parameter for xe_reg_sr_apply_whitelist=
()
>       drm/xe/reg_sr: Apply limit to register whitelisting
>       drm/xe: Simplify final return from xe_irq_install()
>       drm/xe/irq: Clear GFX_MSTR_IRQ as part of IRQ reset
>       drm/xe/rtp: Fix doc for XE_RTP_ACTIONS
>       drm/xe/xelpmp: Add Wa_16021867713
>       drm/xe/mmio: Move xe_mmio_wait32() to xe_mmio.c
>       drm/xe/mmio: Make xe_mmio_wait32() aware of interrupts
>
> Haridhar Kalvala (6):
>       drm/xe: Adjust mocs field mask definitions
>       drm/xe: Rename MEM_SET instruction
>       drm/xe/xe2: Set tile y type in XY_FAST_COPY_BLT to Tile4
>       drm/xe/xe2: Update MOCS fields in blitter instructions
>       drm/xe: Add Wa_14019877138
>       drm/xe: ATS-M device ID update
>
> Himal Prasad Ghimiray (12):
>       drm/xe: Notify Userspace when gt reset fails
>       drm/xe: Introduce fault injection for gt reset
>       drm/xe/xe2: Determine bios enablement for flat ccs on igfx
>       drm/xe/xe2: Modify main memory to ccs memory ratio.
>       drm/xe/xe2: Allocate extra pages for ccs during bo create
>       drm/xe/xe2: Updates on XY_CTRL_SURF_COPY_BLT
>       drm/xe/xe_migrate: Use NULL 1G PTE mapped at 255GiB VA for ccs clea=
r
>       drm/xe/xe2: Update chunk size for each iteration of ccs copy
>       drm/xe/xe2: Update emit_pte to use compression enabled PAT index
>       drm/xe/xe2: Handle flat ccs move for igfx.
>       drm/xe/xe2: Modify xe_bo_test for system memory
>       drm/xe/xe2: Support flat ccs
>
> Janga Rahul Kumar (1):
>       drm/Xe: Use EOPNOTSUPP instead of ENOTSUPP
>
> Jani Nikula (3):
>       drm/xe: make compound literal initialization const
>       drm/xe/irq: the irq handler local variable need not be static
>       drm/xe/mmio: add xe_mmio_read16()
>
> Jonathan Cavitt (1):
>       drm/xe: clear the serviced bits on INTR_IDENTITY_REG
>
> Jos=C3=A9 Roberto de Souza (17):
>       drm/xe/uapi: Rename XE_ENGINE_PROPERTY_X to XE_ENGINE_SET_PROPERTY_=
X
>       drm/xe/uapi: Add XE_ENGINE_GET_PROPERTY uAPI
>       drm/xe: Initialize ret in mcr_lock()
>       drm/xe: Fix size of xe_eu_mask_t
>       drm/xe: Add max engine priority to xe query
>       drm/xe: Limit the system memory size to half of the system memory
>       drm/xe: Enable Raptorlake-P
>       drm/xe: Set default MOCS value for cs instructions
>       drm/xe: Set default MOCS value for copy cs instructions
>       drm/xe: Replace PVC check by engine type check
>       drm/xe: Fix RING_MI_MODE label in devcoredump
>       drm/xe: Fix devcoredump readout of IPEHR
>       drm/xe: Remove devcoredump readout of IPEIR
>       drm/xe: Set PTE_AE for smem allocations in integrated devices
>       drm/xe: Include RPL-U to pciidlist
>       drm/xe: Add missing RPL and ADL
>       drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
>
> Jouni H=C3=B6gander (9):
>       drm/xe/display: Add struct i915_active for Xe
>       drm/xe/display: Add macro to get i915 device from xe_bo
>       drm/xe/display: Add frontbuffer setter/getter for xe_bo
>       drm/xe/display: Add i915_active.h compatibility header
>       drm/xe/display: Add empty def for i915_gem_object_flush_if_display
>       drm/xe/display: Add empty define for i915_ggtt_clear_scanout
>       drm/xe/display: Xe stolen memory handling for fbc support
>       drm/xe/display: Add i915_gem.h compatibility header
>       drm/xe/display: Add Xe implementation for fence checks used by fbc =
code
>
> Juha-Pekka Heikkila (2):
>       drm/xe/display: Don't try to use vram if not available
>       drm/xe/display: Add writing of remapped dpt
>
> Koby Elbaz (10):
>       drm/xe: add 28-bit address support in struct xe_reg
>       drm/xe: add read/write support for MMIO extension space
>       drm/xe: add a flag to bypass multi-tile config from MTCFG reg
>       drm/xe: add MMIO extension support flags
>       drm/xe: map MMIO BAR according to the num of tiles in device desc
>       drm/xe: refactor xe_mmio_probe_tiles to support MMIO extension
>       drm/xe: move the lmem verification code into a separate function
>       drm/xe/display: fix error handling flow when device probing fails
>       drm/xe: add skip_pcode flag
>       drm/xe: rename bypass_mtcfg to skip_mtcfg
>
> Lucas De Marchi (176):
>       drm/xe/ggtt: Use BIT_ULL() for 64bit
>       drm/xe: Fix some log messages on 32b
>       drm/xe/mmio: Use non-atomic writeq/readq variant for 32b
>       drm/xe: Fix tracepoints on 32b
>       drm/xe/gt: Fix min() with u32 and u64
>       drm/xe: Add documentation for mem_type
>       drm/xe: Add min config for kunit integration ARCH=3Dum
>       drm/xe: Fix typo in MCR documentation
>       drm/xe: Fix xe_tuning include
>       drm/xe: Remove TODO from rtp infra
>       drm/xe: Remove TODO from workaround documentation
>       drm/xe/mcr: Use designated init for xe_steering_types
>       drm/xe/mcr: Add SQIDI steering for DG2
>       drm/xe: Rename xe_rtp_regval to xe_rtp_action
>       drm/xe/rtp: Split action and entry flags
>       drm/xe/rtp: Support multiple actions per entry
>       drm/xe: Make local functions static
>       drm/xe: Fix application of LRC tunings
>       drm/xe: Remove unused functions
>       drm/xe: Add missing doc for xe parameter
>       drm/xe: Add missing include xe_wait_user_fence.h
>       drm/xe: Remove duplicate media_ver
>       drm/xe: Remove outdated build workaround
>       drm/xe/guc: Remove i915_regs.h include
>       drm/xe: Fix kunit integration due to missing prototypes
>       drm/xe: Sort includes
>       drm/xe: Remove dependency on intel_engine_regs.h
>       drm/xe: Remove dependency on intel_gt_regs.h
>       drm/xe: Remove dependency on intel_lrc_reg.h
>       drm/xe: Remove dependency on intel_gpu_commands.h
>       drm/xe: Remove dependency on i915_reg.h
>       drm/xe/guc_pc: Move gt register to the proper place
>       drm/xe: Remove dependency on intel_mchbar_regs.h
>       drm/xe: Prefer single underscore for header guards
>       drm/xe: Do not spread i915_reg_defs.h include
>       drm/xe/device: Prefer the drm-managed mutex_init
>       drm/xe: Fix typo persitent->persistent
>       drm/xe: Fix duplicated setting for register 0x6604
>       drm/xe: Fix ROW_CHICKEN2 define
>       drm/xe/mcr: Add L3BANK steering for DG2
>       drm/xe/mcr: Document how to initialize group/instance
>       drm/xe: Allow const propagation in gt_to_xe()
>       drm/xe: Constify xe_dss_mask_group_ffs()
>       drm/xe/rtp: Move match function from wa to rtp
>       drm/xe/rtp: Add match for render reset domain
>       drm/xe: Remove dump function from reg_sr
>       drm/xe: Name LRC wa after the engine it belongs
>       drm/xe/pvc: Remove A* steppings
>       drm/xe/rtp: Add match helper for gslice fused off
>       drm/xe/reg_sr: Tweak verbosity for register printing
>       drm/xe: Print whitelist while applying
>       drm/xe/debugfs: Dump register save-restore tables
>       drm/xe: Reorder WAs to consider the platform
>       drm/xe: Add PVC gt workarounds
>       drm/xe: Add PVC engine workarounds
>       drm/xe: Add missing DG2 gt workarounds and tunings
>       drm/xe: Add missing DG2 engine workarounds
>       drm/xe: Add missing DG2 lrc tunings
>       drm/xe: Add missing DG2 lrc workarounds
>       drm/xe: Add missing ADL-P engine workaround
>       drm/xe: Add missing LRC workarounds for graphics 1200
>       drm/xe: Replace i915 with xe in uapi
>       drm/xe/mcr: Separate version from engine type selection
>       drm/xe: Remove unused revid from firmware name
>       drm/xe: Fix platform order
>       drm/xe: Extract function to initialize xe->info
>       drm/xe: Move test infra out of xe_pci.[ch]
>       drm/xe: Use symbol namespace for kunit tests
>       drm/xe: Generalize fake device creation
>       drm/xe/reg_sr: Save errors for kunit integration
>       drm/xe: Add basic unit tests for rtp
>       drm/xe: Add test for GT workarounds and tunings
>       drm/xe: Update GuC/HuC firmware autoselect logic
>       drm/xe: Always log GuC/HuC firmware versions
>       drm/xe: Cleanup page-related defines
>       drm/xe: Rename RC0/RC6 macros
>       drm/xe: Rename instruction field to avoid confusion
>       drm/xe/guc: Rename GEN11_SOFT_SCRATCH for clarity
>       drm/xe/guc: Move GuC registers to regs/
>       drm/xe/guc: Convert GuC registers to REG_FIELD/REG_BIT
>       drm/xe: Drop gen afixes from registers
>       drm/xe: Use REG_FIELD/REG_BIT for all regs/*.h
>       drm/xe: Clarify register types on PAT programming
>       drm/xe: Introduce xe_reg/xe_reg_mcr
>       drm/xe: Use XE_REG/XE_REG_MCR
>       drm/xe: Annotate masked registers used by RTP
>       drm/xe: Plumb xe_reg into WAs, rtp, etc
>       drm/xe: Move helper macros to separate header
>       drm/xe: Fix media detection for pre-GMD_ID platforms
>       drm/xe: Do not mark 1809175790 as a WA
>       drm/xe: Fix comment on Wa_22013088509
>       drm/xe/guc: Remove special handling for PVC A*
>       drm/xe/guc: Handle RCU_MODE as masked from definition
>       drm/xe/mmio: Use struct xe_reg
>       drm/xe: Rename reg field to addr
>       drm/xe: Fix indent in xe_hw_engine_print_state()
>       drm/xe: Load HuC on Alderlake P
>       drm/xe: Fix Wa_22011802037 annotation
>       drm/xe/rtp: Split rtp process initialization
>       drm/xe/rtp: Replace XE_WARN_ON
>       drm/xe/rtp: Add "_sr" to entry/function names
>       drm/xe/rtp: Allow to track active workarounds
>       drm/xe/wa: Track gt/engine/lrc active workarounds
>       drm/xe/debugfs: Dump active workarounds
>       drm/xe/rtp: Rename STEP to GRAPHICS_STEP
>       drm/xe/rtp: Add check for media stepping
>       drm/xe/rtp: Add support for entries with no action
>       drm/xe: Include build directory
>       drm/xe: Add support for OOB workarounds
>       drm/xe/guc: Port Wa_22012773006 to xe_wa
>       drm/xe/guc: Port Wa_16011759253 to xe_wa
>       drm/xe/guc: Port Wa_14012197797/Wa_22011391025 to xe_wa
>       drm/xe/guc: Port Wa_16011777198 to xe_wa
>       drm/xe/guc: Port Wa_22012727170/Wa_22012727685 to xe_wa
>       drm/xe/guc: Port Wa_16015675438/Wa_18020744125 to xe_wa
>       drm/xe/guc: Port Wa_1509372804 to xe_wa
>       drm/xe/rtp: Also check gt type
>       drm/xe/guc: Port Wa_14014475959 to xe_wa and fix it
>       drm/xe: Rename pte/pde encoding functions
>       drm/xe/guc: Fix typo s/enabled/enable/
>       drm/xe/guc: Normalize error messages with %#x
>       drm/xe: Skip applying copy engine fuses
>       drm/xe: Normalize XE_VM_FLAG* names
>       drm/xe: Use FIELD_PREP/FIELD_GET for tile id encoding
>       drm/xe: Fix checking for unset value
>       drm/xe: Remove vma arg from xe_pte_encode()
>       drm/xe: Decouple vram check from xe_bo_addr()
>       drm/xe: Set PTE_DM bit for stolen on MTL
>       drm/xe: Fix MTL+ stolen memory mapping
>       drm/xe: Carve out top of DSM as reserved
>       drm/xe: Sort xe_regs.h
>       drm/xe: Fix error path in xe_guc_pc_gucrc_disable()
>       drm/xe: Fix error path in xe_guc_pc_start()
>       drm/xe: Update ARL-S DevIDs to the latest BSpec
>       drm/xe/pat: Use 0 instead of space on error
>       drm/xe/reg_sr: Simplify check for masked registers
>       drm/xe/reg_sr: Use xe_gt_dbg
>       drm/xe: Add dbg messages for LRC WAs
>       drm/xe: Fix LRC workarounds
>       drm/xe/mmio: Account for GSI offset when checking ranges
>       drm/xe: Accept a const xe device
>       drm/xe: Normalize pte/pde encoding
>       drm/xe: Remove check for vma =3D=3D NULL
>       drm/xe: Use vfunc for pte/pde ppgtt encoding
>       drm/xe/migrate: Do not hand-encode pte
>       drm/xe: Use vfunc to initialize PAT
>       drm/xe/dg2: Fix using wrong PAT table
>       drm/xe/pat: Prefer the arch/IP names
>       drm/xe/pat: Keep track of relevant indexes
>       drm/xe: Use pat_index to encode pde/pte
>       drm/xe: Use vfunc for ggtt pte encoding
>       drm/xe/xe2: Extend reserved stolen sizes
>       drm/xe/xe2: Add missing mocs entry
>       drm/xe/vm: Prefer xe_assert() over XE_WARN_ON()
>       drm/xe/xe2: Follow XeHPC for TLB invalidation
>       drm/xe/xe2: Add one more bit to encode PAT to ppgtt entries
>       drm/xe/pat: Add debugfs node to dump PAT
>       drm/xe/gt: Dump PAT table when failing to initialize
>       drm/xe: Fix WA 14010918519 write to wrong register
>       drm/xe: Fix build with KUNIT=3Dm
>       drm/xe/display: Silence kernel-doc warnings related to display
>       drm/xe: Fold GEN11_MOCS_ENTRIES into gen12_mocs_desc
>       drm/xe/mocs: Bring comment about mocs back to reality
>       drm/xe: Remove GEN[0-9]*_ prefixes
>       drm/xe: Fix modpost warning on kunit modules
>       drm/xe: Sync MTL PCI IDs with i915
>       drm/xe: Expand XE_REG_OPTION_MASKED documentation
>       drm/xe/kunit: Remove handling of XE_TEST_SUBPLATFORM_ANY
>       drm/xe/kunit: Move fake pci data to test-priv
>       drm/xe/kunit: Add stub to read_gmdid
>       drm/xe/kunit: Test WAs for MTL and LNL
>       drm/xe: Rename info.supports_* to info.has_*
>       drm/xe: Return error if drm_buddy_init() fails
>       drm/xe/bo: Remove unusued variable
>       drm/xe/display: Fix dummy __i915_inject_probe_error()
>       drm/xe: Enable W=3D1 warnings by default
>
> Maarten Lankhorst (11):
>       drm/xe: Implement stolen memory.
>       drm/xe: Fix hidden gotcha regression with bo create
>       drm/xe: Convert memory device refcount to s32
>       drm/xe: Map initial FB at the same place in GGTT too
>       drm/xe: Add debugfs for dumping GGTT mappings
>       drm/xe: Use atomic instead of mutex for xe_device_mem_access_ongoin=
g
>       drm/xe: Remove extra xe_mmio_read32 from xe_mmio_wait32
>       drm/xe: Prevent evicting for page tables
>       drm/xe: Fix error paths of __xe_bo_create_locked
>       drm/xe/display: Implement display support
>       drm/xe/display: Improve s2idle handling.
>
> Matt Atwood (2):
>       drm/xe: Add infrastructure for per engine tuning
>       drm/xe: add gt tuning for indirect state
>
> Matt Roper (131):
>       drm/xe: Remove gen-based mmio offsets from hw engine init
>       drm/xe: Assume MTL's forcewake register continues to future platfor=
ms
>       drm/xe/mocs: Drop unwanted TGL table
>       drm/xe/mocs: Add missing RKL handling
>       drm/xe/mocs: Drop xe_mocs_info_index
>       drm/xe/mocs: Drop duplicate assignment of uc_index
>       drm/xe/mocs: LNCF MOCS settings only need to be restored on pre-Xe_=
HP
>       drm/xe/mocs: Drop HAS_RENDER_L3CC flag
>       drm/xe/guc: Handle regset overflow check for entire GT
>       drm/xe: Separate engine fuse handling into dedicated functions
>       drm/xe: Add support for CCS engine fusing
>       drm/xe/pat: Move PAT setup to a dedicated file
>       drm/xe/pat: Use table-based programming of PAT settings
>       drm/xe/pat: Handle unicast vs MCR PAT registers
>       drm/xe/pat: Clean up PAT register definitions
>       drm/xe/mtl: Fix PAT table coherency settings
>       drm/xe/mtl: Handle PAT_INDEX offset jump
>       drm/xe/pat: Define PAT tables as static
>       drm/xe: Include hardware prefetch buffer in batchbuffer allocations
>       drm/xe: Adjust batchbuffer space warning when creating a job
>       drm/xe: Don't emit extra MI_BATCH_BUFFER_END in WA batchbuffer
>       drm/xe/irq: Drop gen3_ prefixes
>       drm/xe/irq: Add helpers to find ISR/IIR/IMR/IER registers
>       drm/xe/irq: Drop IRQ_INIT and IRQ_RESET macros
>       drm/xe/irq: Drop unnecessary GEN11_ and GEN12_ register prefixes
>       drm/xe/irq: Rename and clarify top-level interrupt handling routine=
s
>       drm/xe/irq: Drop remaining "gen11_" prefix from IRQ functions
>       drm/xe/irq: Drop commented-out code for non-existent media engines
>       drm/xe/irq: Don't clobber display interrupts on multi-tile platform=
s
>       drm/xe: Start splitting xe_device_desc into graphics/media structur=
es
>       drm/xe: Set require_force_probe in each platform's description
>       drm/xe: Move most platform traits to graphics IP
>       drm/xe: Move engine masks into IP descriptor structures
>       drm/xe: Clarify GT counting logic
>       drm/xe: Add printable name to IP descriptors
>       drm/xe: Select graphics/media descriptors from GMD_ID
>       drm/xe: Add KUnit test for xe_pci.c IP engine lists
>       drm/xe: Clean up xe_device_desc
>       drm/xe: Let primary and media GT share a kernel_bb_pool
>       drm/xe: Use packed bitfields for xe->info feature flags
>       drm/xe: Track whether platform has LLC
>       drm/xe: Only request PCODE_WRITE_MIN_FREQ_TABLE on LLC platforms
>       drm/xe/sr: Apply masked registers properly
>       drm/xe: Fix xe_mmio_rmw32 operation
>       drm/xe: Drop GFX_FLSH_CNTL_GEN6 write during GGTT invalidation
>       drm/xe/adlp: Add revid =3D> step mapping
>       drm/xe/adln: Enable ADL-N
>       drm/xe: Add stepping support for GMD_ID platforms
>       drm/xe/pvc: Don't try to invalidate AuxCCS TLB
>       drm/xe/mtl: Disable media GT
>       drm/xe: Introduce xe_tile
>       drm/xe: Add backpointer from gt to tile
>       drm/xe: Add for_each_tile iterator
>       drm/xe: Move register MMIO into xe_tile
>       drm/xe: Move GGTT from GT to tile
>       drm/xe: Move VRAM from GT to tile
>       drm/xe: Memory allocations are tile-based, not GT-based
>       drm/xe: Move migration from GT to tile
>       drm/xe: Clarify 'gt' retrieval for primary tile
>       drm/xe: Drop vram_id
>       drm/xe: Drop extra_gts[] declarations and XE_GT_TYPE_REMOTE
>       drm/xe: Allocate GT dynamically
>       drm/xe: Add media GT to tile
>       drm/xe: Interrupts are delivered per-tile, not per-GT
>       drm/xe/irq: Move ASLE backlight interrupt logic
>       drm/xe/irq: Ensure primary GuC won't clobber media GuC's interrupt =
mask
>       drm/xe/irq: Untangle postinstall functions
>       drm/xe: Replace xe_gt_irq_postinstall with xe_irq_enable_hwe
>       drm/xe: Invalidate TLB on all affected GTs during GGTT updates
>       drm/xe/tlb: Obtain forcewake when doing GGTT TLB invalidations
>       drm/xe: Allow GT looping and lookup on standalone media
>       drm/xe: Update query uapi to support standalone media
>       drm/xe: Reinstate media GT support
>       drm/xe: Add kerneldoc description of multi-tile devices
>       drm/xe: Reformat xe_guc_regs.h
>       drm/xe: Initialize MOCS earlier
>       drm/xe: Don't hardcode GuC's MOCS index in register header
>       drm/xe/wa: Extend scope of Wa_14015795083
>       drm/xe/mtl: Add some initial MTL workarounds
>       drm/xe: Return GMD_ID revid properly
>       drm/xe: Don't raise error on fused-off media
>       drm/xe: Print proper revid value for unknown media revision
>       drm/xe: Enable PCI device earlier
>       drm/xe/mtl: Map PPGTT as CPU:WC
>       drm/xe: xe_engine_create_ioctl should check gt_count, not tile_coun=
t
>       drm/xe/mtl: Reduce Wa_14018575942 scope to the CCS engine
>       drm/xe: Add Wa_14015150844 for DG2 and Xe_LPG
>       drm/xe: Stop tracking 4-tile support
>       drm/xe/xe2: Update render/compute context image sizes
>       drm/xe/xe2: Add GT topology readout
>       drm/xe/xe2: Add MCR register steering for primary GT
>       drm/xe/xe2: Add MCR register steering for media GT
>       drm/xe/xe2: Update context image layouts
>       drm/xe/xe2: Handle fused-off CCS engines
>       drm/xe/xe2: AuxCCS is no longer used
>       drm/xe/xe2: Define Xe2_LPG IP features
>       drm/xe/xe2: Define Xe2_LPM IP features
>       drm/xe/xe2: Track VA bits independently of max page table level
>       drm/xe/xe2: Program GuC's MOCS on Xe2 and beyond
>       drm/xe/lnl: Add LNL platform definition
>       drm/xe/lnl: Add GuC firmware definition
>       drm/xe: Avoid 64-bit register reads
>       drm/xe: Drop xe_mmio_write64()
>       drm/xe/wa: Apply tile workarounds at probe/resume
>       drm/xe: Infer service copy functionality from engine list
>       drm/xe/tuning: Add missing engine class rules for LRC tuning
>       drm/xe/xe2: Program PAT tables
>       drm/xe: Make MI_FLUSH_DW immediate size more explicit
>       drm/xe: Separate number of registers from MI_LRI opcode
>       drm/xe: Clarify number of dwords/qwords stored by MI_STORE_DATA_IMM
>       drm/xe: Extract MI_* instructions to their own header
>       drm/xe/debugfs: Add dump of default LRCs' MI instructions
>       drm/xe/debugfs: Include GFXPIPE commands in LRC dump
>       drm/xe: Prepare to emit non-register state while recording default =
LRC
>       drm/xe: Emit SVG state on RCS during driver load on DG2 and MTL
>       drm/xe/xe2: Update SVG state handling
>       drm/xe/mocs: MOCS registers are multicast on Xe_HP and beyond
>       drm/xe/xe2: Program correct MOCS registers
>       drm/xe: Add Wa_14019821291
>       drm/xe: Drop EXECLIST_CONTROL from error state dump
>       drm/xe/dg2: Wa_18028616096 now applies to all DG2
>       drm/xe/dg2: Drop Wa_22014600077
>       drm/xe: Remove duplicate RING_MAX_NONPRIV_SLOTS definition
>       drm/xe: Drop "_REG" suffix from CSFE_CHICKEN1
>       drm/xe: Move some per-engine register definitions to the engine hea=
der
>       drm/xe: Fix whitespace in register definitions
>       drm/xe: Move engine base offsets to engine register header
>       drm/xe: Move GSC HECI base offsets out of register header
>       drm/xe: Define interrupt vector bits with the interrupt registers
>       drm/xe: Re-sort GT register header
>       drm/xe: Drop some unnecessary header includes
>
> Matthew Auld (94):
>       drm/xe/pcode: fix pcode error check
>       drm/xe/bo: reduce xe_bo_create_pin_map() restrictions
>       drm/xe/ppgtt: clear the scratch page
>       drm/xe/ppgtt: fix scratch page usage on DG2
>       drm/xe/ggtt: fix alignment usage for DG2
>       drm/xe/ggtt: fix GGTT scratch usage for DG2
>       drm/xe/mmio: fix forcewake ref leak in xe_mmio_ioctl
>       drm/xe/stolen: don't map stolen on small-bar
>       drm/xe/query: zero the region info
>       drm/xe/pm: fix unbalanced ref handling
>       drm/xe: prefer xe_bo_create_pin_map()
>       drm/xe/bo: explicitly reject zero sized BO
>       drm/xe: s/lmem/vram/
>       drm/xe: one more s/lmem/vram/
>       drm/xe: add xe_ttm_stolen_cpu_access_needs_ggtt()
>       drm/xe/vram: start tracking the io_size
>       drm/xe/buddy: remove the virtualized start
>       drm/xe/buddy: add visible tracking
>       drm/xe/buddy: add compatible and intersects hooks
>       drm/xe/gt: some error handling fixes
>       drm/xe: add XE_BO_CREATE_VRAM_MASK
>       drm/xe/bo: refactor try_add_vram
>       drm/xe: fix suspend-resume for dgfx
>       drm/xe/mmio: stop incorrectly triggering drm_warn
>       drm/xe/tlb: fix expected_seqno calculation
>       drm/xe/sched_job: prefer dma_fence_is_later
>       drm/xe/lrc: give start_seqno a better default
>       drm/xe: fix tlb_invalidation_seqno_past()
>       drm/xe: fix kernel-doc issues
>       drm/xe/bo: further limit where CCS pages are needed
>       drm/xe/migrate: retain CCS aux state for vram -> vram
>       drm/xe: don't allocate under ct->lock
>       drm/xe: keep pulling mem_access_get further back
>       drm/xe/vm: fix double list add
>       drm/xe/bo: handle PL_TT -> PL_TT
>       drm/xe/uapi: restrict system wide accounting
>       drm/xe/uapi: add some kernel-doc for region query
>       drm/xe/uapi: silence kernel-doc errors
>       drm/doc: include xe_drm.h
>       drm/xe/bo: consider bo->flags in xe_bo_migrate()
>       drm/xe/tlb: drop unnecessary smp_wmb()
>       drm/xe/tlb: ensure we access seqno_recv once
>       drm/xe: hold mem_access.ref for CT fast-path
>       drm/xe/ct: hold fast_lock when reserving space for g2h
>       drm/xe/tlb: increment next seqno after successful CT send
>       drm/xe/ct: serialise fast_lock during CT disable
>       drm/xe/gt: tweak placement for signalling TLB fences after GT reset
>       drm/xe/tlb: also update seqno_recv during reset
>       drm/xe/tlb: print seqno_recv on fence TLB timeout
>       drm/xe/ct: update g2h outstanding for CTB capture
>       drm/xe: handle TLB invalidations from CT fast-path
>       drm/xe/mmio: update gt_count when probing multi-tile
>       drm/xe: fix xe_device_mem_access_get() races
>       drm/xe/vm: tidy up xe_runtime_pm usage
>       drm/xe/debugfs: grab mem_access around forcewake
>       drm/xe/guc_pc: add missing mem_access for freq_rpe_show
>       drm/xe/mmio: grab mem_access in xe_mmio_ioctl
>       drm/xe: ensure correct access_put ordering
>       drm/xe: drop xe_device_mem_access_get() from guc_ct_send
>       drm/xe/ggtt: prime ggtt->lock against FS_RECLAIM
>       drm/xe: drop xe_device_mem_access_get() from invalidation_vma
>       drm/xe: add lockdep annotation for xe_device_mem_access_get()
>       drm/xe/selftests: hold rpm for evict_test_run_device()
>       drm/xe/selftests: hold rpm for ccs_test_migrate()
>       drm/xe/selftests: restart GT after xe_bo_restore_kernel()
>       drm/xe: add missing bulk_move reset
>       drm/xe: add lockdep annotation for xe_device_mem_access_put()
>       drm/xe/bo: support tiered vram allocation for small-bar
>       drm/xe/uapi: add the userspace bits for small-bar
>       drm/xe: fully turn on small-bar support
>       drm/xe/engine: add missing rpm for bind engines
>       drm/xe/guc_submit: prevent repeated unregister
>       drm/xe: don't warn for bogus pagefaults
>       drm/xe/guc_submit: fixup deregister in job timeout
>       drm/xe: skip rebind_list if vma destroyed
>       drm/xe/ct: fix resv_space print
>       drm/xe: nuke GuC on unload
>       drm/xe: fix has_llc on rkl
>       drm/xe/selftests: consider multi-GT for eviction test
>       drm/xe/selftests: make eviction test tile centric
>       drm/xe/hwmon: fix uaf on unload
>       drm/xe/pat: trim the xelp PAT table
>       drm/xe: directly use pat_index for pte_encode
>       drm/xe: fix pat[2] programming with 2M/1G pages
>       drm/xe/migrate: fix MI_ARB_ON_OFF usage
>       drm/xe/bo: consider dma-resv fences for clear job
>       drm/xe/bo: sync kernel fences for KMD buffers
>       drm/xe/display: ensure clear-color surfaces are cpu mappable
>       drm/xe/bo: don't hold dma-resv lock over drm_gem_handle_create
>       drm/xe: fix mem_access for early lrc generation
>       drm/xe/pat: annotate pat_index with coherency mode
>       drm/xe/uapi: support pat_index selection with vm_bind
>       drm/xe/mocs: update MOCS table for xe2
>       drm/xe: add some debug info for d3cold
>
> Matthew Brost (90):
>       drm/xe: Introduce a new DRM driver for Intel GPUs
>       drm/xe: Take memory ref on kernel job creation
>       drm/xe: Ensure VMA not userptr before calling xe_bo_is_stolen
>       drm/xe: Fake pulling gt->info.engine_mask from hwconfig blob
>       drm/xe/guc: Report submission version of GuC firmware
>       drm/xe/guc: s/xe_guc_send_mmio/xe_guc_mmio_send
>       drm/xe/guc: Add support GuC MMIO send / recv
>       drm/xe/migrate: Update emit_pte to cope with a size level than 4k
>       drm/xe: Don't process TLB invalidation done in CT fast-path
>       drm/xe: Break of TLB invalidation into its own file
>       drm/xe: Move TLB invalidation variable to own sub-structure in GT
>       drm/xe: Add TLB invalidation fence
>       drm/xe: Invalidate TLB after unbind is complete
>       drm/xe: Kernel doc GT TLB invalidations
>       drm/xe: Add TLB invalidation fence ftrace
>       drm/xe: Add TDR for invalidation fence timeout cleanup
>       drm/xe: Only set VM->asid for platforms that support a ASID
>       drm/xe: Delete debugfs entry to issue TLB invalidation
>       drm/xe: Add has_range_tlb_invalidation device attribute
>       drm/xe: Add range based TLB invalidations
>       drm/xe: Propagate error from bind operations to async fence
>       drm/xe: Use GuC to do GGTT invalidations for the GuC firmware
>       drm/xe: Lock GGTT on when restoring kernel BOs
>       drm/xe: Propagate VM unbind error to invalidation fence
>       drm/xe: Signal invalidation fence immediately if CT send fails
>       drm/xe: Add has_asid to device info
>       drm/xe: Add TLB invalidation fence after rebinds issued from execs
>       drm/xe: Drop TLB invalidation from ring operations
>       drm/xe: Drop zero length arrays
>       drm/xe: Reinstate render / compute cache invalidation in ring ops
>       drm/xe: Use BO's GT to determine dma_offset when programming PTEs
>       drm/xe: Fix potential deadlock handling page faults
>       drm/xe: Decrement fault mode counts in xe_vm_close_and_put
>       drm/xe: Better error messages for xe_gt_record_default_lrcs
>       drm/xe: Always write GEN12_RCU_MODE.GEN12_RCU_MODE_CCS_ENABLE for C=
CS engines
>       drm/xe: Don't grab runtime PM ref in engine create IOCTL
>       drm/xe: Allow compute VMs to output dma-fences on binds
>       drm/xe: Allow dma-fences as in-syncs for compute / faulting VM
>       drm/xe/guc: Read HXG fields from DW1 of G2H response
>       drm/xe: Handle unmapped userptr in analyze VM
>       drm/xe: Use Xe ordered workqueue for rebind worker
>       drm/xe: s/XE_PTE_READ_ONLY/XE_PTE_FLAG_READ_ONLY
>       drm/xe: Move XE_PTE_FLAG_READ_ONLY to xe_vm_types.h
>       drm/xe: NULL binding implementation
>       drm/xe: Long running job update
>       drm/xe: Ensure LR engines are not persistent
>       drm/xe: Only try to lock external BOs in VM bind
>       drm/xe: VM LRU bulk move
>       drm/xe: Use internal VM flags in xe_vm_create
>       drm/xe: Ban a VM if rebind worker hits an error
>       drm/xe: Add helpers to hide struct xe_vma internals
>       drm/xe: Remove __xe_vm_bind forward declaration
>       drm/xe: Port Xe to GPUVA
>       drm/xe: Make bind engines safe
>       drm/xe: Remove xe_vma_op_unmap
>       drm/xe: Avoid doing rebinds
>       drm/xe: Reduce the number list links in xe_vma
>       drm/xe: Replace list_del_init with list_del for userptr.invalidate_=
link cleanup
>       drm/xe: Change tile masks from u64 to u8
>       drm/xe: Combine destroy_cb and destroy_work in xe_vma into union
>       drm/xe: Only alloc userptr part of xe_vma for userptrs
>       drm/xe: Use migrate engine for page fault binds
>       drm/xe: Always use xe_vm_queue_rebind_worker helper
>       drm/xe: Signal out-syncs on VM binds if no operations
>       drm/xe: Remove XE_GUC_CT_SELFTEST
>       drm/xe: Remove ct->fence_context
>       drm/xe: Add define WQ_HEADER_SIZE
>       drm/xe: remove header variable from parse_g2h_msg
>       drm/xe: Set max pte size when skipping rebinds
>       drm/xe: Call __guc_exec_queue_fini_async direct for KERNEL exec_que=
ues
>       drm/xe: Convert xe_vma_op_flags to BIT macros
>       drm/xe: Fixup unwind on VM ops errors
>       drm/gpuva: Add drm_gpuva_for_each_op_reverse
>       drm/xe: Fix array of binds
>       drm/xe: Fix fence reservation accouting
>       drm/xe: Fix exec queue usage for unbinds
>       drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
>       drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implement=
ation
>       drm/xe: Rename exec_queue_kill_compute to xe_vm_remove_compute_exec=
_queue
>       drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
>       drm/xe/uapi: Kill DRM_XE_UFENCE_WAIT_VM_ERROR
>       drm/xe: Remove async worker and rework sync binds
>       drm/xe: Fix VM bind out-sync signaling ordering
>       drm/xe: Adjust tile_present mask when skipping rebinds
>       drm/xe: Use pool of ordered wq for GuC submission
>       drm/xe: Only set xe_vma_op.map fields for GPUVA map operations
>       drm/xe: Use a flags field instead of bools for VMA create
>       drm/xe: Use a flags field instead of bools for sync parse
>       drm/xe: Allow num_batch_buffer / num_binds =3D=3D 0 in IOCTLs
>       drm/xe/uapi: Remove sync binds
>
> Mauro Carvalho Chehab (5):
>       drm/xe/Kconfig.debug: select DEBUG_FS for KUnit runs
>       drm/xe: KUnit tests depend on CONFIG_DRM_FBDEV_EMULATION
>       drm/xe: skip Kunit tests requiring real hardware when running on UM=
L
>       drm/xe/xe_uc_fw: Use firmware files from standard locations
>       drm/xe/uapi: Reject bo creation of unaligned size
>
> Michael J. Ruhl (5):
>       drm/xe: Rework size helper to be a little more correct
>       drm/xe: Simplify rebar sizing
>       drm/xe: Size GT device memory correctly
>       drm/xe: Rename GPU offset helper to reflect true usage
>       drm/xe: REBAR resize should be best effort
>
> Michal Wajdeczko (23):
>       drm/xe: Introduce GT oriented log messages
>       drm/xe: Use GT oriented log messages in xe_gt.c
>       drm/xe: Move Media GuC register definition to regs/
>       drm/xe: Change GuC interrupt data
>       drm/xe: Introduce Xe assert macros
>       drm/xe/guc: Promote guc_to_gt/xe helpers to .h
>       drm/xe/guc: Fix wrong assert about full_len
>       drm/xe/guc: Copy response data from proper registers
>       drm/xe/guc: Fix handling of GUC_HXG_TYPE_NO_RESPONSE_BUSY
>       drm/xe/guc: Use valid scratch register for posting read
>       drm/xe: Add device flag to indicate SR-IOV support
>       drm/xe: Prepare for running in different SR-IOV modes
>       drm/xe: Print virtualization mode during probe
>       drm/xe/kunit: Return number of iterated devices
>       drm/xe/guc: Drop ancient GuC CTB definitions
>       drm/xe/guc: Remove obsolete GuC CTB documentation
>       drm/xe/guc: Include only required GuC ABI headers
>       drm/xe/doc: Include documentation about xe_assert()
>       drm/xe: Define DRM_XE_DEBUG_SRIOV config
>       drm/xe: Introduce SR-IOV logging macros
>       drm/xe/pf: Introduce Local Memory Translation Table
>       drm/xe/kunit: Enable CONFIG_PCI_IOV in .kunitconfig
>       drm/xe/kunit: Add test for LMTT operations
>
> Micha=C5=82 Winiarski (21):
>       drm/xe: Fix uninitialized variables
>       drm/xe: Fix check for platform without geometry pipeline
>       drm/xe: Fix header guard warning
>       drm/xe: Skip calling drm_dev_put on probe error
>       drm/xe: Use managed pci_enable_device
>       drm/xe/irq: Don't call pci_free_irq_vectors
>       drm/xe: Move xe_set_dma_info outside of MMIO setup
>       drm/xe: Move xe_mmio_probe_tiles outside of MMIO setup
>       drm/xe: Split xe_info_init
>       drm/xe: Introduce xe_tile_init_early and use at earlier point in pr=
obe
>       drm/xe: Map the entire BAR0 and hold onto the initial mapping
>       drm/xe/device: Introduce xe_device_probe_early
>       drm/xe: Don't "peek" into GMD_ID
>       drm/xe: Move system memory management init to earlier point in prob=
e
>       drm/xe: Move force_wake init to earlier point in probe
>       drm/xe: Reorder GGTT init to earlier point in probe
>       drm/xe: Add a helper for DRM device-lifetime BO create
>       drm/xe/uc: Split xe_uc_fw_init
>       drm/xe/uc: Store firmware binary in system-memory backed BO
>       drm/xe/uc: Extract xe_uc_sanitize_reset
>       drm/xe/guc: Split GuC params used for "hwconfig" and "post-hwconfig=
"
>
> Mika Kuoppala (4):
>       drm/xe: destroy clients engine and vm xarrays on close
>       drm/xe: Fix unreffed ptr leak on engine lookup
>       drm/xe: Extend drm_xe_vm_bind_op
>       drm/xe/vm: Avoid asid lookup if none allocated
>
> Niranjana Vishwanathapura (16):
>       drm/xe/migrate: Fix number of PT structs in docbook
>       drm/xe/tests: Use proper batch base address
>       drm/xe/tests: Set correct expectation
>       drm/xe: Use proper vram offset
>       drm/xe: Fix memory use after free
>       drm/xe: Handle -EDEADLK case in preempt worker
>       drm/xe: Handle -EDEADLK case in exec ioctl
>       drm/xe: Apply upper limit to sg element size
>       drm/xe: Simplify engine class sched_props setting
>       drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
>       drm/xe/pvc: Blacklist BCS_SWCTRL register
>       drm/xe/pvc: Force even num engines to use 64B
>       drm/xe/pvc: Use fast copy engines as migrate engine on PVC
>       drm/xe: Enable Fixed CCS mode setting
>       drm/xe: Allow userspace to configure CCS mode
>       drm/xe: Avoid any races around ccs_mode update
>
> Nirmoy Das (3):
>       drm/xe/stolen: Exclude reserved lmem portion
>       drm/xe: Do not sleep in atomic
>       drm/xe: Print GT info on TLB inv failure
>
> Oak Zeng (3):
>       drm/xe: Implement HW workaround 14016763929
>       drm/xe: Make xe_mem_region struct
>       drm/xe: Improve vram info debug printing
>
> Ohad Sharabi (1):
>       drm/xe: do not register to PM if GuC is disabled
>
> Pallavi Mishra (5):
>       drm/xe: Prevent return with locked vm
>       drm/xe: Align size to PAGE_SIZE
>       drm/xe: Dump CTB during TLB timeout
>       drm/xe/tests: Fix migrate test
>       drm/xe/uapi: Add support for CPU caching mode
>
> Paulo Zanoni (5):
>       drm/xe: fix bounds checking for 'len' in xe_engine_create_ioctl
>       drm/xe: properly check bounds for xe_wait_user_fence_ioctl()
>       drm/xe/vm: print the correct 'keep' when printing gpuva ops
>       drm/xe/vm: use list_last_entry() to fetch last_op
>       drm/xe: fix range printing for debug messages
>
> Philippe Lecluse (4):
>       drm/xe: enforce GSMBASE for DG1 instead of BAR2
>       drm/xe: fix xe_mmio_total_vram_size
>       drm/xe: Fix Meteor Lake rsa issue on guc loading
>       drm/xe/mocs: add MTL mocs
>
> Priyanka Dandamudi (1):
>       drm/xe/xe_exec_queue: Add check for access counter granularity
>
> Riana Tauro (5):
>       drm/xe: Fix overflow in vram manager
>       drm/xe/guc_pc: Reorder forcewake and xe_pm_runtime calls
>       drm/xe: Fix GT looping for standalone media
>       drm/xe: add a new sysfs directory for gtidle properties
>       drm/xe: remove gucrc disable from suspend path
>
> Rodrigo Vivi (65):
>       drm/xe: Implement a local xe_mmio_wait32
>       drm/xe: Stop using i915's range_overflows_t macro.
>       drm/xe: Let's return last value read on xe_mmio_wait32.
>       drm/xe: Convert guc_ready to regular xe_mmio_wait32
>       drm/xe: Wait for success on guc done.
>       drm/xe: Remove i915_utils dependency from xe_guc_pc.
>       drm/xe: Stop using i915_utils in xe_wopcm.
>       drm/xe: Let's avoid i915_utils in the xe_force_wake.
>       drm/xe: Convert xe_mmio_wait32 to us so we can stop using wait_for_=
us.
>       drm/xe: Remove i915_utils dependency from xe_pcode.
>       drm/xe/guc_pc: Fix Meteor Lake registers.
>       drm/xe: Remove unseless xe_force_wake_prune.
>       drm/xe: Update comment on why d3cold is still blocked.
>       drm/xe: Fix print of RING_EXECLIST_SQ_CONTENTS_HI
>       drm/xe: Introduce the dev_coredump infrastructure.
>       drm/xe: Do not take any action if our device was removed.
>       drm/xe: Extract non mapped regions out of GuC CTB into its own stru=
ct.
>       drm/xe: Convert GuC CT print to snapshot capture and print.
>       drm/xe: Add GuC CT snapshot to xe_devcoredump.
>       drm/xe: Introduce guc_submit_types.h with relevant structs.
>       drm/xe: Convert GuC Engine print to snapshot capture and print.
>       drm/xe: Add GuC Submit Engine snapshot to xe_devcoredump.
>       drm/xe: Convert Xe HW Engine print to snapshot capture and print.
>       drm/xe: Add HW Engine snapshot to xe_devcoredump.
>       drm/xe: Limit CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE to itself.
>       drm/xe/uapi: Remove XE_QUERY_CONFIG_FLAGS_USE_GUC
>       drm/xe: Invert guc vs execlists parameters and info.
>       drm/xe: Fix an invalid locking wait context bug
>       drm/xe: Invert mask and val in xe_mmio_wait32.
>       drm/xe: Only set PCI d3cold_allowed when we are really allowing.
>       drm/xe: Move d3cold_allowed decision all together.
>       drm/xe: Fix the runtime_idle call and d3cold.allowed decision.
>       drm/xe: Only init runtime PM after all d3cold config is in place.
>       drm/xe: Ensure memory eviction on s2idle.
>       drm/xe/uapi: Typo lingo and other small backwards compatible fixes
>       drm/xe/uapi: Remove useless max_page_size
>       drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
>       drm/xe/uapi: Document drm_xe_query_gt
>       drm/xe/uapi: Replace useless 'instance' per unique gt_id
>       drm/xe/uapi: Remove unused field of drm_xe_query_gt
>       drm/xe/uapi: Rename gts to gt_list
>       drm/xe/uapi: Remove GT_TYPE_REMOTE
>       drm/xe/uapi: Kill VM_MADVISE IOCTL
>       drm/xe/uapi: Rename *_mem_regions masks
>       drm/xe/uapi: Rename query's mem_usage to mem_regions
>       drm/xe/uapi: Standardize the FLAG naming and assignment
>       drm/xe/uapi: Differentiate WAIT_OP from WAIT_MASK
>       drm/xe/uapi: Be more specific about the vm_bind prefetch region
>       drm/xe/uapi: Separate bo_create placement from flags
>       drm/xe/uapi: Split xe_sync types from flags
>       drm/xe/uapi: Kill tile_mask
>       drm/xe/uapi: Crystal Reference Clock updates
>       drm/xe/uapi: Add Tile ID information to the GT info query
>       drm/xe/uapi: Fix various struct padding for 64b alignment
>       drm/xe/uapi: Move xe_exec after xe_exec_queue
>       drm/xe: Remove unused extension definition
>       drm/xe/uapi: Kill exec_queue_set_property
>       drm/xe: Create a xe_gt_freq component for raw management and sysfs
>       drm/xe: Remove vram size info from sysfs
>       drm/xe/uapi: Ensure every uapi struct has drm_xe prefix
>       drm/xe/uapi: Order sections
>       drm/xe/uapi: More uAPI documentation additions and cosmetic updates
>       drm/xe/uapi: Document the memory_region bitmask
>       drm/xe/uapi: Remove reset uevent for now
>       MAINTAINERS: Updates to Intel DRM
>
> Ruthuvikas Ravikumar (1):
>       drm/xe: Add mocs kunit
>
> Shekhar Chauhan (6):
>       drm/xe/dg2: Remove Wa_15010599737
>       drm/xe: Add Wa_18028616096
>       drm/xe: Add new DG2 PCI IDs
>       drm/xe/dg2: Remove one PCI ID
>       drm/xe: Add performance tuning settings for MTL and Xe2
>       drm/xe/xelpmp: Extend Wa_22016670082 to Xe_LPM+
>
> Sujaritha Sundaresan (2):
>       drm/xe: Change the name of frequency sysfs attributes
>       drm/xe: Add frequency throttle reasons sysfs attributes
>
> Suraj Kandpal (1):
>       drm/xe/hdcp: Define intel_hdcp_gsc_check_status in Xe
>
> Tejas Upadhyay (26):
>       drm/xe: Add sysfs entry for tile
>       drm/xe: Add GTs under respective tile sysfs
>       drm/xe: Add sysfs entry to report per tile memory size
>       drm/xe: Make usable size of VRAM readable
>       drm/xe: make GT sysfs init return void
>       drm/xe: make kobject type struct as constant
>       drm/xe: Add sysfs entries for engines under its GT
>       drm/xe: Add sysfs for default engine scheduler properties
>       drm/xe: Add job timeout engine property to sysfs
>       drm/xe: Add timeslice duration engine property to sysfs
>       drm/xe: Add sysfs for preempt reset timeout
>       drm/xe: Add min/max cap for engine scheduler properties
>       drm/xe: Add drm-client infrastructure
>       drm/xe: Interface xe drm client with fdinfo interface
>       drm/xe: Add tracking support for bos per client
>       drm/xe: Record each drm client with its VM
>       drm/xe: Track page table memory usage for client
>       drm/xe: Account ring buffer and context state storage
>       drm/xe: Implement fdinfo memory stats printing
>       drm/xe/xe2: Add workaround 14017421178
>       drm/xe/xe2: Add workaround 16021867713
>       drm/xe/xe2: Add workaround 14019449301
>       drm/xe/xe2: Add workaround 14020013138
>       drm/xe/xe2: Add workaround 16020292621
>       drm/xe/xe2: Add workaround 14019988906
>       drm/xe/xe2: Add workaround 18032095049 and 16021639441
>
> Thomas Hellstr=C3=B6m (41):
>       drm/xe/migrate: Add kerneldoc for the migrate subsystem
>       drm/xe/tests: Remove CONFIG_FB dependency
>       drm/xe/tests: Grab a memory access reference around the migrate san=
ity test
>       drm/xe/vm: Use the correct vma destroy sequence on userptr failure
>       drm/xe: Use a define to set initial seqno for fences
>       drm/xe/migrate: Update cpu page-table updates
>       drm/xe/tests: Support CPU page-table updates in the migrate test
>       drm/xe: Introduce xe_engine_is_idle()
>       drm/xe: Use a small negative initial seqno
>       drm/xe/tests: Test both CPU- and GPU page-table updates with the mi=
grate test
>       drm/xe/vm: Defer vm rebind until next exec if nothing to execute
>       drm/xe: Fix the migrate selftest for integrated GPUs
>       drm/xe: Support copying of data between system memory bos
>       drm/xe: Invalidate TLB also on bind if in scratch page mode
>       drm/xe: Emit a render cache flush after each rcs/ccs batch
>       drm/xe/bo: Fix swapin when moving to VRAM
>       drm/xe/bo: Avoid creating a system resource when allocating a fresh=
 VRAM bo
>       drm/xe/bo: Gracefully handle errors from ttm_bo_move_accel_cleanup(=
).
>       drm/xe/bo: Evict VRAM to TT rather than to system
>       drm/xe: Fix vm refcount races
>       drm/xe: Make page-table updates using the default engine happen in =
order
>       drm/xe: Introduce a range-fence utility
>       drm/xe/bo: Simplify xe_bo_lock()
>       drm/xe/vm: Simplify and document xe_vm_lock()
>       drm/xe/bo: Remove the lock_no_vm()/unlock_no_vm() interface
>       drm/xe: Rework xe_exec and the VM rebind worker to use the drm_exec=
 helper
>       drm/xe: Convert pagefaulting code to use drm_exec
>       drm/xe: Convert remaining instances of ttm_eu_reserve_buffers to dr=
m_exec
>       drm/xe: Reinstate pipelined fence enable_signaling
>       drm/xe: Disallow pinning dma-bufs in VRAM
>       drm/xe: Update SPDX deprecated license identifier
>       drm/xe: Ensure that we don't access the placements array out-of-bou=
nds
>       drm/xe/bo: Rename xe_bo_get_sg() to xe_bo_sg()
>       drm/xe/bo: Remove leftover trace_printk()
>       drm/xe/vm: Fix ASID XA usage
>       drm/xe: Internally change the compute_mode and no_dma_fence mode na=
ming
>       drm/xe/uapi: Use LR abbrev for long-running vms
>       drm/xe: Restrict huge PTEs to 1GiB
>       drm/xe: Use NULL PTEs as scratch PTEs
>       drm/xe: Use DRM GPUVM helpers for external- and evicted objects
>       drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm
>
> Uma Shankar (1):
>       drm/xe/display: Create a dummy version for vga decode
>
> Umesh Nerlige Ramappa (3):
>       drm/xe: Fix array bounds check for queries
>       drm/xe: Set the correct type for xe_to_user_engine_class
>       drm/xe: Correlate engine and cpu timestamps with better accuracy
>
> Vinay Belgaumkar (5):
>       drm/xe: Raise GT frequency before GuC/HuC load
>       drm/xe: Rename xe_gt_idle_sysfs to xe_gt_idle
>       drm/xe: Add skip_guc_pc flag
>       drm/xe: Manually setup C6 when skip_guc_pc is set
>       drm/xe: Check skip_guc_pc before disabling gucrc
>
> Vitaly Lubart (3):
>       drm/xe/gsc: add HECI2 register offsets
>       drm/xe/gsc: add has_heci_gscfi indication to device
>       drm/xe/gsc: add gsc device support
>
> Zbigniew Kempczy=C5=84ski (1):
>       drm/xe: Use nanoseconds instead of jiffies in uapi for user fence
>
> Zhanjun Dong (1):
>       drm/xe: Add patch version on guc firmware init
>
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon        |   70 +
>  Documentation/gpu/driver-uapi.rst                  |    5 +
>  Documentation/gpu/drivers.rst                      |    1 +
>  Documentation/gpu/xe/index.rst                     |   25 +
>  Documentation/gpu/xe/xe_cs.rst                     |    8 +
>  Documentation/gpu/xe/xe_debugging.rst              |    7 +
>  Documentation/gpu/xe/xe_firmware.rst               |   37 +
>  Documentation/gpu/xe/xe_gt_mcr.rst                 |   13 +
>  Documentation/gpu/xe/xe_map.rst                    |    8 +
>  Documentation/gpu/xe/xe_migrate.rst                |    8 +
>  Documentation/gpu/xe/xe_mm.rst                     |   14 +
>  Documentation/gpu/xe/xe_pcode.rst                  |   14 +
>  Documentation/gpu/xe/xe_pm.rst                     |   14 +
>  Documentation/gpu/xe/xe_rtp.rst                    |   20 +
>  Documentation/gpu/xe/xe_tile.rst                   |   14 +
>  Documentation/gpu/xe/xe_wa.rst                     |   14 +
>  MAINTAINERS                                        |   29 +-
>  drivers/gpu/drm/Kconfig                            |    2 +
>  drivers/gpu/drm/Makefile                           |    1 +
>  drivers/gpu/drm/xe/.gitignore                      |    4 +
>  drivers/gpu/drm/xe/.kunitconfig                    |   13 +
>  drivers/gpu/drm/xe/Kconfig                         |   96 +
>  drivers/gpu/drm/xe/Kconfig.debug                   |  107 +
>  drivers/gpu/drm/xe/Kconfig.profile                 |   54 +
>  drivers/gpu/drm/xe/Makefile                        |  305 ++
>  drivers/gpu/drm/xe/abi/gsc_command_header_abi.h    |   46 +
>  drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h     |   39 +
>  drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h      |   59 +
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h           |  219 ++
>  drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h      |  249 ++
>  drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h |  127 +
>  .../gpu/drm/xe/abi/guc_communication_mmio_abi.h    |   49 +
>  drivers/gpu/drm/xe/abi/guc_errors_abi.h            |   37 +
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |  322 ++
>  drivers/gpu/drm/xe/abi/guc_messages_abi.h          |  234 ++
>  .../drm/xe/compat-i915-headers/gem/i915_gem_lmem.h |    1 +
>  .../drm/xe/compat-i915-headers/gem/i915_gem_mman.h |   17 +
>  .../xe/compat-i915-headers/gem/i915_gem_object.h   |   65 +
>  .../gem/i915_gem_object_frontbuffer.h              |   12 +
>  .../gpu/drm/xe/compat-i915-headers/gt/intel_rps.h  |   11 +
>  .../gpu/drm/xe/compat-i915-headers/i915_active.h   |   22 +
>  .../drm/xe/compat-i915-headers/i915_active_types.h |   13 +
>  .../gpu/drm/xe/compat-i915-headers/i915_config.h   |   19 +
>  .../gpu/drm/xe/compat-i915-headers/i915_debugfs.h  |   14 +
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  233 ++
>  .../gpu/drm/xe/compat-i915-headers/i915_fixed.h    |    6 +
>  drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h  |    9 +
>  .../drm/xe/compat-i915-headers/i915_gem_stolen.h   |   79 +
>  .../drm/xe/compat-i915-headers/i915_gpu_error.h    |   17 +
>  drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h  |    6 +
>  drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h  |    6 +
>  .../gpu/drm/xe/compat-i915-headers/i915_reg_defs.h |    6 +
>  .../gpu/drm/xe/compat-i915-headers/i915_trace.h    |    6 +
>  .../gpu/drm/xe/compat-i915-headers/i915_utils.h    |    6 +
>  drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h |   44 +
>  drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h  |   34 +
>  .../drm/xe/compat-i915-headers/i915_vma_types.h    |   74 +
>  .../xe/compat-i915-headers/intel_clock_gating.h    |    6 +
>  .../drm/xe/compat-i915-headers/intel_gt_types.h    |   11 +
>  .../drm/xe/compat-i915-headers/intel_mchbar_regs.h |    6 +
>  .../drm/xe/compat-i915-headers/intel_pci_config.h  |    6 +
>  .../gpu/drm/xe/compat-i915-headers/intel_pcode.h   |   42 +
>  .../drm/xe/compat-i915-headers/intel_runtime_pm.h  |   16 +
>  .../gpu/drm/xe/compat-i915-headers/intel_step.h    |   20 +
>  .../gpu/drm/xe/compat-i915-headers/intel_uc_fw.h   |   11 +
>  .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |  175 ++
>  .../gpu/drm/xe/compat-i915-headers/intel_wakeref.h |    8 +
>  .../gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h |   28 +
>  .../drm/xe/compat-i915-headers/soc/intel_dram.h    |    6 +
>  .../drm/xe/compat-i915-headers/soc/intel_gmch.h    |    6 +
>  .../gpu/drm/xe/compat-i915-headers/soc/intel_pch.h |    6 +
>  .../gpu/drm/xe/compat-i915-headers/vlv_sideband.h  |  132 +
>  .../drm/xe/compat-i915-headers/vlv_sideband_reg.h  |    6 +
>  drivers/gpu/drm/xe/display/ext/i915_irq.c          |   77 +
>  drivers/gpu/drm/xe/display/ext/i915_utils.c        |   26 +
>  drivers/gpu/drm/xe/display/intel_fb_bo.c           |   74 +
>  drivers/gpu/drm/xe/display/intel_fb_bo.h           |   24 +
>  drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |  104 +
>  drivers/gpu/drm/xe/display/intel_fbdev_fb.h        |   21 +
>  drivers/gpu/drm/xe/display/xe_display_misc.c       |   16 +
>  drivers/gpu/drm/xe/display/xe_display_rps.c        |   17 +
>  drivers/gpu/drm/xe/display/xe_dsb_buffer.c         |   71 +
>  drivers/gpu/drm/xe/display/xe_fb_pin.c             |  384 +++
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |   34 +
>  drivers/gpu/drm/xe/display/xe_plane_initial.c      |  291 ++
>  .../gpu/drm/xe/instructions/xe_gfxpipe_commands.h  |  160 +
>  drivers/gpu/drm/xe/instructions/xe_gsc_commands.h  |   36 +
>  drivers/gpu/drm/xe/instructions/xe_instr_defs.h    |   33 +
>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h   |   61 +
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h           |  184 ++
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h          |   70 +
>  drivers/gpu/drm/xe/regs/xe_gsc_regs.h              |   41 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h               |  478 +++
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h              |  143 +
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h            |   17 +
>  drivers/gpu/drm/xe/regs/xe_mchbar_regs.h           |   44 +
>  drivers/gpu/drm/xe/regs/xe_reg_defs.h              |  120 +
>  drivers/gpu/drm/xe/regs/xe_regs.h                  |   68 +
>  drivers/gpu/drm/xe/regs/xe_sriov_regs.h            |   17 +
>  drivers/gpu/drm/xe/tests/Makefile                  |   10 +
>  drivers/gpu/drm/xe/tests/xe_bo.c                   |  353 +++
>  drivers/gpu/drm/xe/tests/xe_bo_test.c              |   26 +
>  drivers/gpu/drm/xe/tests/xe_bo_test.h              |   14 +
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c              |  278 ++
>  drivers/gpu/drm/xe/tests/xe_dma_buf_test.c         |   25 +
>  drivers/gpu/drm/xe/tests/xe_dma_buf_test.h         |   13 +
>  drivers/gpu/drm/xe/tests/xe_lmtt_test.c            |   73 +
>  drivers/gpu/drm/xe/tests/xe_migrate.c              |  444 +++
>  drivers/gpu/drm/xe/tests/xe_migrate_test.c         |   25 +
>  drivers/gpu/drm/xe/tests/xe_migrate_test.h         |   13 +
>  drivers/gpu/drm/xe/tests/xe_mocs.c                 |  130 +
>  drivers/gpu/drm/xe/tests/xe_mocs_test.c            |   24 +
>  drivers/gpu/drm/xe/tests/xe_mocs_test.h            |   13 +
>  drivers/gpu/drm/xe/tests/xe_pci.c                  |  166 +
>  drivers/gpu/drm/xe/tests/xe_pci_test.c             |   71 +
>  drivers/gpu/drm/xe/tests/xe_pci_test.h             |   36 +
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c             |  319 ++
>  drivers/gpu/drm/xe/tests/xe_test.h                 |   67 +
>  drivers/gpu/drm/xe/tests/xe_wa_test.c              |  170 ++
>  drivers/gpu/drm/xe/xe_assert.h                     |  174 ++
>  drivers/gpu/drm/xe/xe_bb.c                         |  110 +
>  drivers/gpu/drm/xe/xe_bb.h                         |   25 +
>  drivers/gpu/drm/xe/xe_bb_types.h                   |   20 +
>  drivers/gpu/drm/xe/xe_bo.c                         | 2269 ++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h                         |  355 +++
>  drivers/gpu/drm/xe/xe_bo_doc.h                     |  179 ++
>  drivers/gpu/drm/xe/xe_bo_evict.c                   |  228 ++
>  drivers/gpu/drm/xe/xe_bo_evict.h                   |   15 +
>  drivers/gpu/drm/xe/xe_bo_types.h                   |   96 +
>  drivers/gpu/drm/xe/xe_debugfs.c                    |  148 +
>  drivers/gpu/drm/xe/xe_debugfs.h                    |   13 +
>  drivers/gpu/drm/xe/xe_devcoredump.c                |  196 ++
>  drivers/gpu/drm/xe/xe_devcoredump.h                |   20 +
>  drivers/gpu/drm/xe/xe_devcoredump_types.h          |   55 +
>  drivers/gpu/drm/xe/xe_device.c                     |  700 +++++
>  drivers/gpu/drm/xe/xe_device.h                     |  173 ++
>  drivers/gpu/drm/xe/xe_device_sysfs.c               |   89 +
>  drivers/gpu/drm/xe/xe_device_sysfs.h               |   13 +
>  drivers/gpu/drm/xe/xe_device_types.h               |  545 ++++
>  drivers/gpu/drm/xe/xe_display.c                    |  422 +++
>  drivers/gpu/drm/xe/xe_display.h                    |   72 +
>  drivers/gpu/drm/xe/xe_dma_buf.c                    |  322 ++
>  drivers/gpu/drm/xe/xe_dma_buf.h                    |   15 +
>  drivers/gpu/drm/xe/xe_drm_client.c                 |  204 ++
>  drivers/gpu/drm/xe/xe_drm_client.h                 |   70 +
>  drivers/gpu/drm/xe/xe_drv.h                        |   23 +
>  drivers/gpu/drm/xe/xe_exec.c                       |  350 +++
>  drivers/gpu/drm/xe/xe_exec.h                       |   14 +
>  drivers/gpu/drm/xe/xe_exec_queue.c                 |  956 ++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h                 |   69 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h           |  222 ++
>  drivers/gpu/drm/xe/xe_execlist.c                   |  474 +++
>  drivers/gpu/drm/xe/xe_execlist.h                   |   21 +
>  drivers/gpu/drm/xe/xe_execlist_types.h             |   49 +
>  drivers/gpu/drm/xe/xe_force_wake.c                 |  199 ++
>  drivers/gpu/drm/xe/xe_force_wake.h                 |   38 +
>  drivers/gpu/drm/xe/xe_force_wake_types.h           |   86 +
>  drivers/gpu/drm/xe/xe_gen_wa_oob.c                 |  165 +
>  drivers/gpu/drm/xe/xe_ggtt.c                       |  428 +++
>  drivers/gpu/drm/xe/xe_ggtt.h                       |   33 +
>  drivers/gpu/drm/xe/xe_ggtt_types.h                 |   39 +
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c              |  101 +
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h              |   73 +
>  drivers/gpu/drm/xe/xe_gpu_scheduler_types.h        |   57 +
>  drivers/gpu/drm/xe/xe_gsc.c                        |  438 +++
>  drivers/gpu/drm/xe/xe_gsc.h                        |   20 +
>  drivers/gpu/drm/xe/xe_gsc_submit.c                 |  184 ++
>  drivers/gpu/drm/xe/xe_gsc_submit.h                 |   30 +
>  drivers/gpu/drm/xe/xe_gsc_types.h                  |   39 +
>  drivers/gpu/drm/xe/xe_gt.c                         |  778 +++++
>  drivers/gpu/drm/xe/xe_gt.h                         |   72 +
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c                |  191 ++
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.h                |   24 +
>  drivers/gpu/drm/xe/xe_gt_clock.c                   |   85 +
>  drivers/gpu/drm/xe/xe_gt_clock.h                   |   15 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  249 ++
>  drivers/gpu/drm/xe/xe_gt_debugfs.h                 |   13 +
>  drivers/gpu/drm/xe/xe_gt_freq.c                    |  219 ++
>  drivers/gpu/drm/xe/xe_gt_freq.h                    |   13 +
>  drivers/gpu/drm/xe/xe_gt_idle.c                    |  192 ++
>  drivers/gpu/drm/xe/xe_gt_idle.h                    |   17 +
>  drivers/gpu/drm/xe/xe_gt_idle_types.h              |   38 +
>  drivers/gpu/drm/xe/xe_gt_mcr.c                     |  685 +++++
>  drivers/gpu/drm/xe/xe_gt_mcr.h                     |   29 +
>  drivers/gpu/drm/xe/xe_gt_pagefault.c               |  646 ++++
>  drivers/gpu/drm/xe/xe_gt_pagefault.h               |   19 +
>  drivers/gpu/drm/xe/xe_gt_printk.h                  |   46 +
>  drivers/gpu/drm/xe/xe_gt_sysfs.c                   |   61 +
>  drivers/gpu/drm/xe/xe_gt_sysfs.h                   |   19 +
>  drivers/gpu/drm/xe/xe_gt_sysfs_types.h             |   26 +
>  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c          |  251 ++
>  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h          |   16 +
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |  406 +++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |   26 +
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h  |   28 +
>  drivers/gpu/drm/xe/xe_gt_topology.c                |  169 ++
>  drivers/gpu/drm/xe/xe_gt_topology.h                |   25 +
>  drivers/gpu/drm/xe/xe_gt_types.h                   |  363 +++
>  drivers/gpu/drm/xe/xe_guc.c                        |  911 ++++++
>  drivers/gpu/drm/xe/xe_guc.h                        |   72 +
>  drivers/gpu/drm/xe/xe_guc_ads.c                    |  672 ++++
>  drivers/gpu/drm/xe/xe_guc_ads.h                    |   17 +
>  drivers/gpu/drm/xe/xe_guc_ads_types.h              |   25 +
>  drivers/gpu/drm/xe/xe_guc_ct.c                     | 1320 ++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.h                     |   59 +
>  drivers/gpu/drm/xe/xe_guc_ct_types.h               |  115 +
>  drivers/gpu/drm/xe/xe_guc_debugfs.c                |   74 +
>  drivers/gpu/drm/xe/xe_guc_debugfs.h                |   14 +
>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h       |   54 +
>  drivers/gpu/drm/xe/xe_guc_fwif.h                   |  361 +++
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c               |  104 +
>  drivers/gpu/drm/xe/xe_guc_hwconfig.h               |   17 +
>  drivers/gpu/drm/xe/xe_guc_log.c                    |   97 +
>  drivers/gpu/drm/xe/xe_guc_log.h                    |   48 +
>  drivers/gpu/drm/xe/xe_guc_log_types.h              |   23 +
>  drivers/gpu/drm/xe/xe_guc_pc.c                     | 1000 ++++++
>  drivers/gpu/drm/xe/xe_guc_pc.h                     |   31 +
>  drivers/gpu/drm/xe/xe_guc_pc_types.h               |   34 +
>  drivers/gpu/drm/xe/xe_guc_submit.c                 | 1990 ++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h                 |   38 +
>  drivers/gpu/drm/xe/xe_guc_submit_types.h           |  155 +
>  drivers/gpu/drm/xe/xe_guc_types.h                  |   81 +
>  drivers/gpu/drm/xe/xe_heci_gsc.c                   |  234 ++
>  drivers/gpu/drm/xe/xe_heci_gsc.h                   |   35 +
>  drivers/gpu/drm/xe/xe_huc.c                        |  307 ++
>  drivers/gpu/drm/xe/xe_huc.h                        |   26 +
>  drivers/gpu/drm/xe/xe_huc_debugfs.c                |   70 +
>  drivers/gpu/drm/xe/xe_huc_debugfs.h                |   14 +
>  drivers/gpu/drm/xe/xe_huc_types.h                  |   24 +
>  drivers/gpu/drm/xe/xe_hw_engine.c                  |  883 ++++++
>  drivers/gpu/drm/xe/xe_hw_engine.h                  |   70 +
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c      |  675 +++++
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h      |   36 +
>  drivers/gpu/drm/xe/xe_hw_engine_types.h            |  225 ++
>  drivers/gpu/drm/xe/xe_hw_fence.c                   |  230 ++
>  drivers/gpu/drm/xe/xe_hw_fence.h                   |   30 +
>  drivers/gpu/drm/xe/xe_hw_fence_types.h             |   72 +
>  drivers/gpu/drm/xe/xe_hwmon.c                      |  776 +++++
>  drivers/gpu/drm/xe/xe_hwmon.h                      |   19 +
>  drivers/gpu/drm/xe/xe_irq.c                        |  666 ++++
>  drivers/gpu/drm/xe/xe_irq.h                        |   19 +
>  drivers/gpu/drm/xe/xe_lmtt.c                       |  506 +++
>  drivers/gpu/drm/xe/xe_lmtt.h                       |   27 +
>  drivers/gpu/drm/xe/xe_lmtt_2l.c                    |  150 +
>  drivers/gpu/drm/xe/xe_lmtt_ml.c                    |  161 +
>  drivers/gpu/drm/xe/xe_lmtt_types.h                 |   63 +
>  drivers/gpu/drm/xe/xe_lrc.c                        | 1272 ++++++++
>  drivers/gpu/drm/xe/xe_lrc.h                        |   58 +
>  drivers/gpu/drm/xe/xe_lrc_types.h                  |   46 +
>  drivers/gpu/drm/xe/xe_macros.h                     |   18 +
>  drivers/gpu/drm/xe/xe_map.h                        |   93 +
>  drivers/gpu/drm/xe/xe_migrate.c                    | 1410 +++++++++
>  drivers/gpu/drm/xe/xe_migrate.h                    |  110 +
>  drivers/gpu/drm/xe/xe_migrate_doc.h                |   88 +
>  drivers/gpu/drm/xe/xe_mmio.c                       |  524 ++++
>  drivers/gpu/drm/xe/xe_mmio.h                       |  107 +
>  drivers/gpu/drm/xe/xe_mocs.c                       |  580 ++++
>  drivers/gpu/drm/xe/xe_mocs.h                       |   17 +
>  drivers/gpu/drm/xe/xe_module.c                     |  101 +
>  drivers/gpu/drm/xe/xe_module.h                     |   26 +
>  drivers/gpu/drm/xe/xe_pat.c                        |  459 +++
>  drivers/gpu/drm/xe/xe_pat.h                        |   61 +
>  drivers/gpu/drm/xe/xe_pci.c                        |  951 ++++++
>  drivers/gpu/drm/xe/xe_pci.h                        |   12 +
>  drivers/gpu/drm/xe/xe_pci_types.h                  |   46 +
>  drivers/gpu/drm/xe/xe_pcode.c                      |  296 ++
>  drivers/gpu/drm/xe/xe_pcode.h                      |   30 +
>  drivers/gpu/drm/xe/xe_pcode_api.h                  |   49 +
>  drivers/gpu/drm/xe/xe_platform_types.h             |   37 +
>  drivers/gpu/drm/xe/xe_pm.c                         |  405 +++
>  drivers/gpu/drm/xe/xe_pm.h                         |   35 +
>  drivers/gpu/drm/xe/xe_preempt_fence.c              |  158 +
>  drivers/gpu/drm/xe/xe_preempt_fence.h              |   61 +
>  drivers/gpu/drm/xe/xe_preempt_fence_types.h        |   32 +
>  drivers/gpu/drm/xe/xe_pt.c                         | 1653 ++++++++++
>  drivers/gpu/drm/xe/xe_pt.h                         |   48 +
>  drivers/gpu/drm/xe/xe_pt_types.h                   |   77 +
>  drivers/gpu/drm/xe/xe_pt_walk.c                    |  160 +
>  drivers/gpu/drm/xe/xe_pt_walk.h                    |  161 +
>  drivers/gpu/drm/xe/xe_query.c                      |  552 ++++
>  drivers/gpu/drm/xe/xe_query.h                      |   14 +
>  drivers/gpu/drm/xe/xe_range_fence.c                |  156 +
>  drivers/gpu/drm/xe/xe_range_fence.h                |   75 +
>  drivers/gpu/drm/xe/xe_reg_sr.c                     |  284 ++
>  drivers/gpu/drm/xe/xe_reg_sr.h                     |   28 +
>  drivers/gpu/drm/xe/xe_reg_sr_types.h               |   37 +
>  drivers/gpu/drm/xe/xe_reg_whitelist.c              |  146 +
>  drivers/gpu/drm/xe/xe_reg_whitelist.h              |   23 +
>  drivers/gpu/drm/xe/xe_res_cursor.h                 |  240 ++
>  drivers/gpu/drm/xe/xe_ring_ops.c                   |  482 +++
>  drivers/gpu/drm/xe/xe_ring_ops.h                   |   17 +
>  drivers/gpu/drm/xe/xe_ring_ops_types.h             |   22 +
>  drivers/gpu/drm/xe/xe_rtp.c                        |  325 ++
>  drivers/gpu/drm/xe/xe_rtp.h                        |  430 +++
>  drivers/gpu/drm/xe/xe_rtp_helpers.h                |   81 +
>  drivers/gpu/drm/xe/xe_rtp_types.h                  |  124 +
>  drivers/gpu/drm/xe/xe_sa.c                         |  106 +
>  drivers/gpu/drm/xe/xe_sa.h                         |   40 +
>  drivers/gpu/drm/xe/xe_sa_types.h                   |   19 +
>  drivers/gpu/drm/xe/xe_sched_job.c                  |  280 ++
>  drivers/gpu/drm/xe/xe_sched_job.h                  |   80 +
>  drivers/gpu/drm/xe/xe_sched_job_types.h            |   46 +
>  drivers/gpu/drm/xe/xe_sriov.c                      |   55 +
>  drivers/gpu/drm/xe/xe_sriov.h                      |   42 +
>  drivers/gpu/drm/xe/xe_sriov_printk.h               |   46 +
>  drivers/gpu/drm/xe/xe_sriov_types.h                |   28 +
>  drivers/gpu/drm/xe/xe_step.c                       |  264 ++
>  drivers/gpu/drm/xe/xe_step.h                       |   23 +
>  drivers/gpu/drm/xe/xe_step_types.h                 |   50 +
>  drivers/gpu/drm/xe/xe_sync.c                       |  344 +++
>  drivers/gpu/drm/xe/xe_sync.h                       |   36 +
>  drivers/gpu/drm/xe/xe_sync_types.h                 |   28 +
>  drivers/gpu/drm/xe/xe_tile.c                       |  185 ++
>  drivers/gpu/drm/xe/xe_tile.h                       |   18 +
>  drivers/gpu/drm/xe/xe_tile_sysfs.c                 |   57 +
>  drivers/gpu/drm/xe/xe_tile_sysfs.h                 |   19 +
>  drivers/gpu/drm/xe/xe_tile_sysfs_types.h           |   27 +
>  drivers/gpu/drm/xe/xe_trace.c                      |    9 +
>  drivers/gpu/drm/xe/xe_trace.h                      |  608 ++++
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |  334 ++
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h             |   21 +
>  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c                |  118 +
>  drivers/gpu/drm/xe/xe_ttm_sys_mgr.h                |   13 +
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |  480 +++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h               |   44 +
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h         |   52 +
>  drivers/gpu/drm/xe/xe_tuning.c                     |  121 +
>  drivers/gpu/drm/xe/xe_tuning.h                     |   16 +
>  drivers/gpu/drm/xe/xe_uc.c                         |  258 ++
>  drivers/gpu/drm/xe/xe_uc.h                         |   24 +
>  drivers/gpu/drm/xe/xe_uc_debugfs.c                 |   26 +
>  drivers/gpu/drm/xe/xe_uc_debugfs.h                 |   14 +
>  drivers/gpu/drm/xe/xe_uc_fw.c                      |  884 ++++++
>  drivers/gpu/drm/xe/xe_uc_fw.h                      |  184 ++
>  drivers/gpu/drm/xe/xe_uc_fw_abi.h                  |  321 ++
>  drivers/gpu/drm/xe/xe_uc_fw_types.h                |  146 +
>  drivers/gpu/drm/xe/xe_uc_types.h                   |   28 +
>  drivers/gpu/drm/xe/xe_vm.c                         | 3206 ++++++++++++++=
++++++
>  drivers/gpu/drm/xe/xe_vm.h                         |  263 ++
>  drivers/gpu/drm/xe/xe_vm_doc.h                     |  555 ++++
>  drivers/gpu/drm/xe/xe_vm_types.h                   |  373 +++
>  drivers/gpu/drm/xe/xe_wa.c                         |  895 ++++++
>  drivers/gpu/drm/xe/xe_wa.h                         |   32 +
>  drivers/gpu/drm/xe/xe_wa_oob.rules                 |   24 +
>  drivers/gpu/drm/xe/xe_wait_user_fence.c            |  178 ++
>  drivers/gpu/drm/xe/xe_wait_user_fence.h            |   15 +
>  drivers/gpu/drm/xe/xe_wopcm.c                      |  270 ++
>  drivers/gpu/drm/xe/xe_wopcm.h                      |   16 +
>  drivers/gpu/drm/xe/xe_wopcm_types.h                |   26 +
>  include/drm/drm_gpuvm.h                            |   10 +
>  include/drm/xe_pciids.h                            |  190 ++
>  include/uapi/drm/xe_drm.h                          | 1347 ++++++++
>  352 files changed, 61427 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>  create mode 100644 Documentation/gpu/xe/index.rst
>  create mode 100644 Documentation/gpu/xe/xe_cs.rst
>  create mode 100644 Documentation/gpu/xe/xe_debugging.rst
>  create mode 100644 Documentation/gpu/xe/xe_firmware.rst
>  create mode 100644 Documentation/gpu/xe/xe_gt_mcr.rst
>  create mode 100644 Documentation/gpu/xe/xe_map.rst
>  create mode 100644 Documentation/gpu/xe/xe_migrate.rst
>  create mode 100644 Documentation/gpu/xe/xe_mm.rst
>  create mode 100644 Documentation/gpu/xe/xe_pcode.rst
>  create mode 100644 Documentation/gpu/xe/xe_pm.rst
>  create mode 100644 Documentation/gpu/xe/xe_rtp.rst
>  create mode 100644 Documentation/gpu/xe/xe_tile.rst
>  create mode 100644 Documentation/gpu/xe/xe_wa.rst
>  create mode 100644 drivers/gpu/drm/xe/.gitignore
>  create mode 100644 drivers/gpu/drm/xe/.kunitconfig
>  create mode 100644 drivers/gpu/drm/xe/Kconfig
>  create mode 100644 drivers/gpu/drm/xe/Kconfig.debug
>  create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
>  create mode 100644 drivers/gpu/drm/xe/Makefile
>  create mode 100644 drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
>  create mode 100644 drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
>  create mode 100644 drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_actions_abi.h
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_errors_abi.h
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_messages_abi.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_l=
mem.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_m=
man.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_o=
bject.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_o=
bject_frontbuffer.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gt/intel_rps.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_active.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_active_ty=
pes.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_debugfs.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stole=
n.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error=
.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.=
h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_trace.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types=
.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_clock_ga=
ting.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types=
.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_r=
egs.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pci_conf=
ig.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_=
pm.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.=
h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.=
h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram=
.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_gmch=
.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.=
h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_r=
eg.h
>  create mode 100644 drivers/gpu/drm/xe/display/ext/i915_irq.c
>  create mode 100644 drivers/gpu/drm/xe/display/ext/i915_utils.c
>  create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.c
>  create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.h
>  create mode 100644 drivers/gpu/drm/xe/display/intel_fbdev_fb.c
>  create mode 100644 drivers/gpu/drm/xe/display/intel_fbdev_fb.h
>  create mode 100644 drivers/gpu/drm/xe/display/xe_display_misc.c
>  create mode 100644 drivers/gpu/drm/xe/display/xe_display_rps.c
>  create mode 100644 drivers/gpu/drm/xe/display/xe_dsb_buffer.c
>  create mode 100644 drivers/gpu/drm/xe/display/xe_fb_pin.c
>  create mode 100644 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>  create mode 100644 drivers/gpu/drm/xe/display/xe_plane_initial.c
>  create mode 100644 drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
>  create mode 100644 drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
>  create mode 100644 drivers/gpu/drm/xe/instructions/xe_instr_defs.h
>  create mode 100644 drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_engine_regs.h
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_regs.h
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_guc_regs.h
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_reg_defs.h
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_regs.h
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_sriov_regs.h
>  create mode 100644 drivers/gpu/drm/xe/tests/Makefile
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_bo.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_bo_test.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_bo_test.h
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_dma_buf.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_lmtt_test.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_migrate.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_migrate_test.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_migrate_test.h
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_mocs.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.h
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_pci.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_pci_test.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_pci_test.h
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_test.h
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_wa_test.c
>  create mode 100644 drivers/gpu/drm/xe/xe_assert.h
>  create mode 100644 drivers/gpu/drm/xe/xe_bb.c
>  create mode 100644 drivers/gpu/drm/xe/xe_bb.h
>  create mode 100644 drivers/gpu/drm/xe/xe_bb_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_bo.c
>  create mode 100644 drivers/gpu/drm/xe/xe_bo.h
>  create mode 100644 drivers/gpu/drm/xe/xe_bo_doc.h
>  create mode 100644 drivers/gpu/drm/xe/xe_bo_evict.c
>  create mode 100644 drivers/gpu/drm/xe/xe_bo_evict.h
>  create mode 100644 drivers/gpu/drm/xe/xe_bo_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_debugfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.c
>  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.h
>  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_device.c
>  create mode 100644 drivers/gpu/drm/xe/xe_device.h
>  create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_device_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_display.c
>  create mode 100644 drivers/gpu/drm/xe/xe_display.h
>  create mode 100644 drivers/gpu/drm/xe/xe_dma_buf.c
>  create mode 100644 drivers/gpu/drm/xe/xe_dma_buf.h
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_client.c
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h
>  create mode 100644 drivers/gpu/drm/xe/xe_drv.h
>  create mode 100644 drivers/gpu/drm/xe/xe_exec.c
>  create mode 100644 drivers/gpu/drm/xe/xe_exec.h
>  create mode 100644 drivers/gpu/drm/xe/xe_exec_queue.c
>  create mode 100644 drivers/gpu/drm/xe/xe_exec_queue.h
>  create mode 100644 drivers/gpu/drm/xe/xe_exec_queue_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_execlist.c
>  create mode 100644 drivers/gpu/drm/xe/xe_execlist.h
>  create mode 100644 drivers/gpu/drm/xe/xe_execlist_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_force_wake.c
>  create mode 100644 drivers/gpu/drm/xe/xe_force_wake.h
>  create mode 100644 drivers/gpu/drm/xe/xe_force_wake_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gen_wa_oob.c
>  create mode 100644 drivers/gpu/drm/xe/xe_ggtt.c
>  create mode 100644 drivers/gpu/drm/xe/xe_ggtt.h
>  create mode 100644 drivers/gpu/drm/xe/xe_ggtt_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gsc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gsc.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gsc_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_clock.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_clock.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_debugfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_freq.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_freq.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_idle.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_idle.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_mcr.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_mcr.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_printk.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sysfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sysfs_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_topology.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_topology.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_ads.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_ads.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_ads_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_ct.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_ct.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_ct_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_debugfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_fwif.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_hwconfig.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_hwconfig.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_log.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_log.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_log_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_pc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_pc.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_pc_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_submit.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_submit.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_submit_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_heci_gsc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_heci_gsc.h
>  create mode 100644 drivers/gpu/drm/xe/xe_huc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_huc.h
>  create mode 100644 drivers/gpu/drm/xe/xe_huc_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_huc_debugfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_huc_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine.h
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_fence.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_fence.h
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_fence_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h
>  create mode 100644 drivers/gpu/drm/xe/xe_irq.c
>  create mode 100644 drivers/gpu/drm/xe/xe_irq.h
>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt.c
>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt.h
>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt_2l.c
>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt_ml.c
>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_lrc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_lrc.h
>  create mode 100644 drivers/gpu/drm/xe/xe_lrc_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_macros.h
>  create mode 100644 drivers/gpu/drm/xe/xe_map.h
>  create mode 100644 drivers/gpu/drm/xe/xe_migrate.c
>  create mode 100644 drivers/gpu/drm/xe/xe_migrate.h
>  create mode 100644 drivers/gpu/drm/xe/xe_migrate_doc.h
>  create mode 100644 drivers/gpu/drm/xe/xe_mmio.c
>  create mode 100644 drivers/gpu/drm/xe/xe_mmio.h
>  create mode 100644 drivers/gpu/drm/xe/xe_mocs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_mocs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_module.c
>  create mode 100644 drivers/gpu/drm/xe/xe_module.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pat.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pat.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pci.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pci.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pcode.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pcode.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pcode_api.h
>  create mode 100644 drivers/gpu/drm/xe/xe_platform_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pm.h
>  create mode 100644 drivers/gpu/drm/xe/xe_preempt_fence.c
>  create mode 100644 drivers/gpu/drm/xe/xe_preempt_fence.h
>  create mode 100644 drivers/gpu/drm/xe/xe_preempt_fence_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pt.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pt.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pt_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pt_walk.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pt_walk.h
>  create mode 100644 drivers/gpu/drm/xe/xe_query.c
>  create mode 100644 drivers/gpu/drm/xe/xe_query.h
>  create mode 100644 drivers/gpu/drm/xe/xe_range_fence.c
>  create mode 100644 drivers/gpu/drm/xe/xe_range_fence.h
>  create mode 100644 drivers/gpu/drm/xe/xe_reg_sr.c
>  create mode 100644 drivers/gpu/drm/xe/xe_reg_sr.h
>  create mode 100644 drivers/gpu/drm/xe/xe_reg_sr_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_reg_whitelist.c
>  create mode 100644 drivers/gpu/drm/xe/xe_reg_whitelist.h
>  create mode 100644 drivers/gpu/drm/xe/xe_res_cursor.h
>  create mode 100644 drivers/gpu/drm/xe/xe_ring_ops.c
>  create mode 100644 drivers/gpu/drm/xe/xe_ring_ops.h
>  create mode 100644 drivers/gpu/drm/xe/xe_ring_ops_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_rtp.c
>  create mode 100644 drivers/gpu/drm/xe/xe_rtp.h
>  create mode 100644 drivers/gpu/drm/xe/xe_rtp_helpers.h
>  create mode 100644 drivers/gpu/drm/xe/xe_rtp_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sa.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sa.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sa_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sched_job.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sched_job.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sched_job_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_printk.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_step.c
>  create mode 100644 drivers/gpu/drm/xe/xe_step.h
>  create mode 100644 drivers/gpu/drm/xe/xe_step_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sync.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sync.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sync_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_tile.c
>  create mode 100644 drivers/gpu/drm/xe/xe_tile.h
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_trace.c
>  create mode 100644 drivers/gpu/drm/xe/xe_trace.h
>  create mode 100644 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>  create mode 100644 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>  create mode 100644 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>  create mode 100644 drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
>  create mode 100644 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>  create mode 100644 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>  create mode 100644 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_tuning.c
>  create mode 100644 drivers/gpu/drm/xe/xe_tuning.h
>  create mode 100644 drivers/gpu/drm/xe/xe_uc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_uc.h
>  create mode 100644 drivers/gpu/drm/xe/xe_uc_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_uc_debugfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_uc_fw.c
>  create mode 100644 drivers/gpu/drm/xe/xe_uc_fw.h
>  create mode 100644 drivers/gpu/drm/xe/xe_uc_fw_abi.h
>  create mode 100644 drivers/gpu/drm/xe/xe_uc_fw_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_uc_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_vm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_vm.h
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_doc.h
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_wa.c
>  create mode 100644 drivers/gpu/drm/xe/xe_wa.h
>  create mode 100644 drivers/gpu/drm/xe/xe_wa_oob.rules
>  create mode 100644 drivers/gpu/drm/xe/xe_wait_user_fence.c
>  create mode 100644 drivers/gpu/drm/xe/xe_wait_user_fence.h
>  create mode 100644 drivers/gpu/drm/xe/xe_wopcm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_wopcm.h
>  create mode 100644 drivers/gpu/drm/xe/xe_wopcm_types.h
>  create mode 100644 include/drm/xe_pciids.h
>  create mode 100644 include/uapi/drm/xe_drm.h
