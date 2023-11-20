Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CD67F0F1E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 10:31:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832CC10E389;
	Mon, 20 Nov 2023 09:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116A110E382
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 09:31:37 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-548034455d9so916673a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 01:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1700472695; x=1701077495; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ewtnWJNQhHiLiMLN8r2jBe30ZkAW0FxAJIsUBkfk8bY=;
 b=EUbYmo1zcq1BhkjGCIQItLQvfX1cXG3kAOTD6IuF3BVZM4PMmjcHo0pjHsH5+3MiGa
 UtQ48NAeMfm8FC6wYVWckbWNTiRwvEKCObbDIT9u2DbrK/l1zFcBs3TZsnGh+T5OicT0
 dUQ4HM5eTubjiFR54EGr6J8UqS5EvgipqnJ/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700472695; x=1701077495;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ewtnWJNQhHiLiMLN8r2jBe30ZkAW0FxAJIsUBkfk8bY=;
 b=oXRrLYBPUu614zqBdFyDa9dh4wPyqXoingtPPK9ykOSka8ZiLo0o0ypugEYpZXwQDL
 pbIQqTd2attsy1USMg3OunnfEQ85YIDe7mWwGHiU043jotie14i3EKn+LHHUIQEz8uEx
 fy0DH5MQQKsqc2y8HUGZE1G/qmE2M/regnHHZwiGTYab9Yqc5B9ZdKCHe/QdWjvqGuxU
 QcpHBQ/P3blXzVbYhGqLU1w1zuGlZ8dW9rl6XL1aO+HaP7Bu/O+ALYrcyUyAPT2sBRZV
 9KE7rQ066b6lwnuSSUsgo53JnsXIHEashXG5cTrOEIHdyH3+LKHALpPBVet8GV3Vub8N
 W1NQ==
X-Gm-Message-State: AOJu0YzDT2UT+FAfXtNczsEZCgkLsseunIMgo5NNPVitDmA7l8VGCtgD
 s6hEDPls1GdSiG3egEpT4g/ZdQ==
X-Google-Smtp-Source: AGHT+IHd0+52QL8MeWdicRkxGw/mbR2+eFqJMzJTuL3KEa3ji34gLdKifU4vuk4AGtc5lSdyJvydvg==
X-Received: by 2002:a17:907:7806:b0:a00:1acf:6fe6 with SMTP id
 la6-20020a170907780600b00a001acf6fe6mr449838ejc.1.1700472695210; 
 Mon, 20 Nov 2023 01:31:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a170906468900b009fd6a22c2e9sm1291586ejr.138.2023.11.20.01.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 01:31:34 -0800 (PST)
Date: Mon, 20 Nov 2023 10:31:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@redhat.com>
Subject: Re: [PULL] drm-misc-next
Message-ID: <ZVsndImVHHOo5qqP@phenom.ffwll.local>
References: <y4awn5vcfy2lr2hpauo7rc4nfpnc6kksr7btmnwaz7zk63pwoi@gwwef5iqpzva>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <y4awn5vcfy2lr2hpauo7rc4nfpnc6kksr7btmnwaz7zk63pwoi@gwwef5iqpzva>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 17, 2023 at 10:41:34AM +0100, Maxime Ripard wrote:
> Hi,
> 
> Here's the first drm-misc-next PR for what will become 6.8.
> 
> There's one missing SoB on the commit 0da611a87021 ("dma-buf: add
> dma_fence_timestamp helper") from the committer. They provided their SoB
> on the ML here after the facts:
> https://lore.kernel.org/dri-devel/ce94020e-a7d4-4799-b87d-fbea7b14a268@gmail.com/

I added this to the merge commit so it's recorded.

> 
> Maxime
> 
> drm-misc-next-2023-11-17:
> drm-misc-next for 6.8:
> 
> UAPI Changes:
>   - drm: Introduce CLOSE_FB ioctl
>   - drm/dp-mst: Documentation for the PATH property
>   - fdinfo: Do not align to a MB if the size is larger than 1MiB
>   - virtio-gpu: add explicit virtgpu context debug name
> 
> Cross-subsystem Changes:
>   - dma-buf: Add dma_fence_timestamp helper
> 
> Core Changes:
>   - client: Do not acquire module reference
>   - edid: split out drm_eld, add SAD helpers
>   - format-helper: Cache format conversion buffers
>   - sched: Move from a kthread to a workqueue, rename some internal
>     functions to make it clearer, implement dynamic job-flow control
>   - gpuvm: Provide more features to handle GEM objects
>   - tests: Remove slow kunit tests
> 
> Driver Changes:
>   - ivpu: Update FW API, new debugfs file, a new NOP job submission test
>     mode, improve suspend/resume, PM improvements, MMU PT optimizations,
>     firmware profiling frequency support, support for uncached buffers,
>     switch to gem shmem helpers, replace kthread with threaded
>     interrupts
>   - panfrost: PM improvements
>   - qaic: Allow to run with a single MSI, support host/device time
>     synchronization, misc improvements
>   - simplefb: Support memory-regions, support power-domains
>   - ssd130x: Unitialized variable fixes
>   - omapdrm: dma-fence lockdep annotation fix
>   - tidss: dma-fence lockdep annotation fix
>   - v3d: Support BCM2712 (RaspberryPi5), Support fdinfo and gputop
>   - panel:
>     - edp: Support AUO B116XTN02, BOE NT116WHM-N21,836X2, NV116WHM-N49
>       V8.0, plus a whole bunch of panels used on Mediatek chromebooks.
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-11-17

Pulled into drm-next, thanks.
-Sima

> 
> for you to fetch changes up to 3b434a3445fff3149128db0169da864d67057325:
> 
>   accel/ivpu: Use threaded IRQ to handle JOB done messages (2023-11-16 13:41:49 +0100)
> 
> ----------------------------------------------------------------
> drm-misc-next for 6.8:
> 
> UAPI Changes:
>   - drm: Introduce CLOSE_FB ioctl
>   - drm/dp-mst: Documentation for the PATH property
>   - fdinfo: Do not align to a MB if the size is larger than 1MiB
>   - virtio-gpu: add explicit virtgpu context debug name
> 
> Cross-subsystem Changes:
>   - dma-buf: Add dma_fence_timestamp helper
> 
> Core Changes:
>   - client: Do not acquire module reference
>   - edid: split out drm_eld, add SAD helpers
>   - format-helper: Cache format conversion buffers
>   - sched: Move from a kthread to a workqueue, rename some internal
>     functions to make it clearer, implement dynamic job-flow control
>   - gpuvm: Provide more features to handle GEM objects
>   - tests: Remove slow kunit tests
> 
> Driver Changes:
>   - ivpu: Update FW API, new debugfs file, a new NOP job submission test
>     mode, improve suspend/resume, PM improvements, MMU PT optimizations,
>     firmware profiling frequency support, support for uncached buffers,
>     switch to gem shmem helpers, replace kthread with threaded
>     interrupts
>   - panfrost: PM improvements
>   - qaic: Allow to run with a single MSI, support host/device time
>     synchronization, misc improvements
>   - simplefb: Support memory-regions, support power-domains
>   - ssd130x: Unitialized variable fixes
>   - omapdrm: dma-fence lockdep annotation fix
>   - tidss: dma-fence lockdep annotation fix
>   - v3d: Support BCM2712 (RaspberryPi5), Support fdinfo and gputop
>   - panel:
>     - edp: Support AUO B116XTN02, BOE NT116WHM-N21,836X2, NV116WHM-N49
>       V8.0, plus a whole bunch of panels used on Mediatek chromebooks.
> 
> ----------------------------------------------------------------
> Ajit Pal Singh (1):
>       accel/qaic: Add support for periodic timesync
> 
> Andrzej Kacprowski (4):
>       accel/ivpu: Add support for VPU_JOB_FLAGS_NULL_SUBMISSION_MASK
>       accel/ivpu/40xx: Capture D0i3 entry host and device timestamps
>       accel/ivpu: Pass D0i3 residency time to the VPU firmware
>       accel/ivpu: Add support for delayed D0i3 entry message
> 
> AngeloGioacchino Del Regno (7):
>       drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()
>       drm/panfrost: Perform hard reset to recover GPU if soft reset fails
>       drm/panfrost: Tighten polling for soft reset and power on
>       drm/panfrost: Implement ability to turn on/off GPU clocks in suspend
>       drm/panfrost: Set clocks on/off during system sleep on MediaTek SoCs
>       drm/panfrost: Implement ability to turn on/off regulators in suspend
>       drm/panfrost: Set regulators on/off during system sleep on MediaTek SoCs
> 
> Arnd Bergmann (1):
>       accel/ivpu: avoid build failure with CONFIG_PM=n
> 
> Carl Vanderlip (2):
>       accel/qaic: Enable 1 MSI fallback mode
>       accel/qaic: Quiet array bounds check on DMA abort message
> 
> Christian König (1):
>       dma-buf: add dma_fence_timestamp helper
> 
> Danilo Krummrich (12):
>       drm/sched: implement dynamic job-flow control
>       drm/gpuvm: convert WARN() to drm_WARN() variants
>       drm/gpuvm: don't always WARN in drm_gpuvm_check_overflow()
>       drm/gpuvm: export drm_gpuvm_range_valid()
>       drm/nouveau: make use of drm_gpuvm_range_valid()
>       drm/gpuvm: add common dma-resv per struct drm_gpuvm
>       drm/nouveau: make use of the GPUVM's shared dma-resv
>       drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
>       drm/nouveau: separately allocate struct nouveau_uvmm
>       drm/gpuvm: reference count drm_gpuvm structures
>       drm/gpuvm: add an abstraction for a VM / BO combination
>       drm/gpuvm: track/lock/validate external/evicted objects
> 
> Dario Binacchi (1):
>       drm/panel: nt35510: fix typo
> 
> Dmitry Osipenko (1):
>       drm/virtio: Fix return value for VIRTGPU_CONTEXT_PARAM_DEBUG_NAME
> 
> Emma Anholt (1):
>       MAINTAINERS: Drop Emma Anholt from all M lines.
> 
> Gurchetan Singh (2):
>       drm/virtio: use uint64_t more in virtio_gpu_context_init_ioctl
>       drm/uapi: add explicit virtgpu context debug name
> 
> Hsin-Yi Wang (3):
>       drm/panel-edp: drm/panel-edp: Fix AUO B116XAK01 name and timing
>       drm/panel-edp: drm/panel-edp: Fix AUO B116XTN02 name
>       drm/panel-edp: drm/panel-edp: Add several generic edp panels
> 
> Iago Toral Quiroga (4):
>       drm/v3d: update UAPI to match user-space for V3D 7.x
>       drm/v3d: fix up register addresses for V3D 7.x
>       dt-bindings: gpu: v3d: Add BCM2712's compatible
>       drm/v3d: add brcm,2712-v3d as a compatible V3D device
> 
> Jacek Lawrynowicz (8):
>       accel/ivpu: Simplify MMU SYNC command
>       accel/ivpu: Rename VPU to NPU in product strings
>       accel/ivpu: Fix compilation with CONFIG_PM=n
>       accel/ivpu: Allocate vpu_addr in gem->open() callback
>       accel/ivpu: Fix locking in ivpu_bo_remove_all_bos_from_context()
>       accel/ivpu: Remove support for uncached buffers
>       accel/ivpu: Use GEM shmem helper for all buffers
>       accel/ivpu: Use threaded IRQ to handle JOB done messages
> 
> Jani Nikula (6):
>       drm/edid: split out drm_eld.h from drm_edid.h
>       drm/eld: replace uint8_t with u8
>       drm/edid: include drm_eld.h only where required
>       drm/edid: use a temp variable for sads to drop one level of dereferences
>       drm/edid: add helpers to get/set struct cea_sad from/to 3-byte sad
>       drm/eld: add helpers to modify the SADs of an ELD
> 
> Javier Martinez Canillas (2):
>       dt-bindings: display: ssd132x: Remove '-' before compatible enum
>       drm/ssd130x: Fix possible uninitialized usage of crtc_state variable
> 
> Karol Wachowski (5):
>       accel/ivpu: Remove reset from power up sequence
>       accel/ivpu: Change test_mode module param to bitmask
>       accel/ivpu: Introduce ivpu_ipc_send_receive_active()
>       accel/ivpu: Print CMDQ errors after consumer timeout
>       accel/ivpu: Make DMA allocations for MMU600 write combined
> 
> Krystian Pradzynski (2):
>       accel/ivpu: Update FW API
>       accel/ivpu/40xx: Allow to change profiling frequency
> 
> Kunwu Chan (1):
>       drm/atomic-helper: Fix spelling mistake "preceeding" -> "preceding"
> 
> Luben Tuikov (4):
>       drm/sched: Don't disturb the entity when in RR-mode scheduling
>       drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()
>       drm/sched: Define pr_fmt() for DRM using pr_*()
>       Revert "drm/sched: Define pr_fmt() for DRM using pr_*()"
> 
> Marco Pagani (1):
>       drm/test: rearrange test entries in Kconfig and Makefile
> 
> Matthew Brost (5):
>       drm/sched: Add drm_sched_wqueue_* helpers
>       drm/sched: Convert drm scheduler to use a work queue rather than kthread
>       drm/sched: Split free_job into own work item
>       drm/sched: Add drm_sched_start_timeout_unlocked helper
>       drm/sched: Add a helper to queue TDR immediately
> 
> Maxime Ripard (3):
>       drm/tests: Remove slow tests
>       drm/todo: Add entry to clean up former seltests suites
>       Merge drm/drm-next into drm-misc-next
> 
> Maíra Canal (4):
>       drm/v3d: wait for all jobs to finish before unregistering
>       drm/v3d: Implement show_fdinfo() callback for GPU usage stats
>       drm/v3d: Expose the total GPU usage stats on sysfs
>       MAINTAINERS: Add Maira to V3D maintainers
> 
> Michał Winiarski (1):
>       iosys-map: Rename locals used inside macros
> 
> Pranjal Ramajor Asha Kanojiya (2):
>       accel/qaic: Support MHI QAIC_TIMESYNC channel
>       accel/qaic: Support for 0 resize slice execution in BO
> 
> Sheng-Liang Pan (1):
>       drm/panel-edp: Add AUO B116XTN02, BOE NT116WHM-N21,836X2, NV116WHM-N49 V8.0
> 
> Simon Ser (3):
>       drm: extract closefb logic in separate function
>       drm: introduce CLOSEFB IOCTL
>       drm/doc: describe PATH format for DP MST
> 
> Stanislaw Gruszka (9):
>       accel/ivpu: Remove unneeded drm_driver declaration
>       accel/ivpu/37xx: Print warning when VPUIP is not idle during power down
>       accel/ivpu: Assure device is off if power up sequence fail
>       accel/ivpu: Stop job_done_thread on suspend
>       accel/ivpu: Abort pending rx ipc on reset
>       accel/ivpu: Rename cons->rx_msg_lock
>       accel/ivpu: Do not use irqsave in ivpu_ipc_dispatch
>       accel/ivpu: Do not use cons->aborted for job_done_thread
>       accel/ivpu: Use dedicated work for job timeout detection
> 
> Steven Price (1):
>       drm/panfrost: Remove incorrect IS_ERR() check
> 
> Thierry Reding (2):
>       fbdev/simplefb: Support memory-region property
>       fbdev/simplefb: Add support for generic power-domains
> 
> Thomas Zimmermann (9):
>       drm/format-helper: Cache buffers with struct drm_format_conv_state
>       drm/atomic-helper: Add format-conversion state to shadow-plane state
>       drm/format-helper: Pass format-conversion state to helpers
>       drm/ofdrm: Preallocate format-conversion buffer in atomic_check
>       drm/simpledrm: Preallocate format-conversion buffer in atomic_check
>       drm/ssd130x: Preallocate format-conversion buffer in atomic_check
>       drm: Remove struct drm_flip_task from DRM interfaces
>       drm: Fix flip-task docs
>       drm/client: Do not acquire module reference
> 
> Tomasz Rusinowicz (1):
>       accel/ivpu: Add dvfs_mode file to debugfs
> 
> Tomi Valkeinen (2):
>       Revert "drm/tidss: Annotate dma-fence critical section in commit path"
>       Revert "drm/omapdrm: Annotate dma-fence critical section in commit path"
> 
> Tvrtko Ursulin (6):
>       drm/sched: Rename drm_sched_get_cleanup_job to be more descriptive
>       drm/sched: Move free worker re-queuing out of the if block
>       drm/sched: Rename drm_sched_free_job_queue to be more descriptive
>       drm/sched: Rename drm_sched_run_job_queue_if_ready and clarify kerneldoc
>       drm/sched: Drop suffix from drm_sched_wakeup_if_can_queue
>       drm: Do not round to megabytes for greater than 1MiB sizes in fdinfo stats
> 
>  Documentation/accel/qaic/aic100.rst                |   11 +-
>  Documentation/accel/qaic/qaic.rst                  |   28 +
>  .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      |    1 +
>  Documentation/gpu/drm-kms-helpers.rst              |    6 +
>  Documentation/gpu/drm-mm.rst                       |    6 +
>  Documentation/gpu/todo.rst                         |   17 +
>  MAINTAINERS                                        |    9 +-
>  drivers/accel/ivpu/Kconfig                         |   11 +-
>  drivers/accel/ivpu/ivpu_debugfs.c                  |   57 +
>  drivers/accel/ivpu/ivpu_drv.c                      |   49 +-
>  drivers/accel/ivpu/ivpu_drv.h                      |   18 +-
>  drivers/accel/ivpu/ivpu_fw.c                       |   79 +-
>  drivers/accel/ivpu/ivpu_fw.h                       |    1 +
>  drivers/accel/ivpu/ivpu_gem.c                      |  692 +++----
>  drivers/accel/ivpu/ivpu_gem.h                      |   75 +-
>  drivers/accel/ivpu/ivpu_hw.h                       |   20 +
>  drivers/accel/ivpu/ivpu_hw_37xx.c                  |   70 +-
>  drivers/accel/ivpu/ivpu_hw_37xx_reg.h              |    2 +
>  drivers/accel/ivpu/ivpu_hw_40xx.c                  |   69 +-
>  drivers/accel/ivpu/ivpu_ipc.c                      |  249 ++-
>  drivers/accel/ivpu/ivpu_ipc.h                      |   33 +-
>  drivers/accel/ivpu/ivpu_job.c                      |   99 +-
>  drivers/accel/ivpu/ivpu_job.h                      |    4 +-
>  drivers/accel/ivpu/ivpu_jsm_msg.c                  |   38 +
>  drivers/accel/ivpu/ivpu_jsm_msg.h                  |    1 +
>  drivers/accel/ivpu/ivpu_mmu.c                      |   44 +-
>  drivers/accel/ivpu/ivpu_mmu_context.c              |  153 +-
>  drivers/accel/ivpu/ivpu_mmu_context.h              |   11 +-
>  drivers/accel/ivpu/ivpu_pm.c                       |   75 +-
>  drivers/accel/ivpu/ivpu_pm.h                       |    3 +
>  drivers/accel/ivpu/vpu_boot_api.h                  |   90 +-
>  drivers/accel/ivpu/vpu_jsm_api.h                   |  309 +++-
>  drivers/accel/qaic/Makefile                        |    3 +-
>  drivers/accel/qaic/mhi_controller.c                |   42 +-
>  drivers/accel/qaic/mhi_controller.h                |    2 +-
>  drivers/accel/qaic/qaic.h                          |    6 +
>  drivers/accel/qaic/qaic_control.c                  |    2 +-
>  drivers/accel/qaic/qaic_data.c                     |  137 +-
>  drivers/accel/qaic/qaic_drv.c                      |   48 +-
>  drivers/accel/qaic/qaic_timesync.c                 |  395 ++++
>  drivers/accel/qaic/qaic_timesync.h                 |   11 +
>  drivers/gpu/drm/Kconfig                            |   10 +-
>  drivers/gpu/drm/Makefile                           |    1 +
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   15 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   14 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    1 +
>  drivers/gpu/drm/drm_atomic_helper.c                |    4 +-
>  drivers/gpu/drm/drm_client.c                       |   12 +-
>  drivers/gpu/drm/drm_connector.c                    |    6 +
>  drivers/gpu/drm/drm_crtc_internal.h                |    2 +
>  drivers/gpu/drm/drm_edid.c                         |   43 +-
>  drivers/gpu/drm/drm_eld.c                          |   55 +
>  drivers/gpu/drm/drm_file.c                         |    2 +-
>  drivers/gpu/drm/drm_flip_work.c                    |   27 +-
>  drivers/gpu/drm/drm_format_helper.c                |  215 ++-
>  drivers/gpu/drm/drm_framebuffer.c                  |   75 +-
>  drivers/gpu/drm/drm_gem_atomic_helper.c            |    9 +
>  drivers/gpu/drm/drm_gpuvm.c                        | 1133 +++++++++++-
>  drivers/gpu/drm/drm_internal.h                     |    6 +
>  drivers/gpu/drm/drm_ioctl.c                        |    1 +
>  drivers/gpu/drm/drm_mipi_dbi.c                     |   19 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |    2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |    2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c            |    2 +-
>  drivers/gpu/drm/gud/gud_pipe.c                     |   30 +-
>  drivers/gpu/drm/i915/display/intel_audio.c         |    1 +
>  .../gpu/drm/i915/display/intel_crtc_state_dump.c   |    1 +
>  drivers/gpu/drm/i915/display/intel_sdvo.c          |    1 +
>  drivers/gpu/drm/lima/lima_device.c                 |    2 +-
>  drivers/gpu/drm/lima/lima_sched.c                  |    4 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c         |    6 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c               |    2 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c               |    2 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c            |    1 +
>  drivers/gpu/drm/nouveau/nouveau_bo.c               |   11 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.h               |    5 +
>  drivers/gpu/drm/nouveau/nouveau_drm.c              |    5 +-
>  drivers/gpu/drm/nouveau/nouveau_drv.h              |   10 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c              |   10 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c            |    4 +-
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c             |  192 +-
>  drivers/gpu/drm/nouveau/nouveau_uvmm.h             |    8 -
>  drivers/gpu/drm/omapdrm/omap_drv.c                 |    9 +-
>  drivers/gpu/drm/panel/panel-edp.c                  |   58 +-
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c      |    2 +-
>  drivers/gpu/drm/panfrost/panfrost_device.c         |   78 +-
>  drivers/gpu/drm/panfrost/panfrost_device.h         |   13 +
>  drivers/gpu/drm/panfrost/panfrost_drv.c            |    5 +-
>  drivers/gpu/drm/panfrost/panfrost_dump.c           |   12 +-
>  drivers/gpu/drm/panfrost/panfrost_gpu.c            |   85 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c            |    4 +-
>  drivers/gpu/drm/panfrost/panfrost_regs.h           |    1 +
>  drivers/gpu/drm/radeon/radeon_audio.c              |    1 +
>  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h    |    2 +-
>  drivers/gpu/drm/scheduler/sched_entity.c           |    4 +-
>  drivers/gpu/drm/scheduler/sched_main.c             |  480 +++--
>  drivers/gpu/drm/solomon/ssd130x.c                  |   38 +-
>  drivers/gpu/drm/tegra/hdmi.c                       |    1 +
>  drivers/gpu/drm/tegra/sor.c                        |    1 +
>  drivers/gpu/drm/tests/Makefile                     |    4 +-
>  drivers/gpu/drm/tests/drm_buddy_test.c             |  465 -----
>  drivers/gpu/drm/tests/drm_format_helper_test.c     |   72 +-
>  drivers/gpu/drm/tests/drm_mm_test.c                | 1904 --------------------
>  drivers/gpu/drm/tidss/tidss_kms.c                  |    4 -
>  drivers/gpu/drm/tiny/cirrus.c                      |    3 +-
>  drivers/gpu/drm/tiny/ili9225.c                     |   10 +-
>  drivers/gpu/drm/tiny/ofdrm.c                       |   16 +-
>  drivers/gpu/drm/tiny/repaper.c                     |   10 +-
>  drivers/gpu/drm/tiny/simpledrm.c                   |   43 +-
>  drivers/gpu/drm/tiny/st7586.c                      |   19 +-
>  drivers/gpu/drm/v3d/Makefile                       |    3 +-
>  drivers/gpu/drm/v3d/v3d_debugfs.c                  |  170 +-
>  drivers/gpu/drm/v3d/v3d_drv.c                      |   46 +-
>  drivers/gpu/drm/v3d/v3d_drv.h                      |   31 +
>  drivers/gpu/drm/v3d/v3d_gem.c                      |   15 +-
>  drivers/gpu/drm/v3d/v3d_irq.c                      |   93 +-
>  drivers/gpu/drm/v3d/v3d_regs.h                     |   90 +-
>  drivers/gpu/drm/v3d/v3d_sched.c                    |   81 +-
>  drivers/gpu/drm/v3d/v3d_sysfs.c                    |   69 +
>  drivers/gpu/drm/virtio/virtgpu_drv.h               |    5 +
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   41 +-
>  drivers/video/fbdev/simplefb.c                     |  128 +-
>  include/drm/drm_edid.h                             |  148 --
>  include/drm/drm_eld.h                              |  164 ++
>  include/drm/drm_flip_work.h                        |   20 +-
>  include/drm/drm_format_helper.h                    |   81 +-
>  include/drm/drm_gem.h                              |   32 +-
>  include/drm/drm_gem_atomic_helper.h                |   10 +
>  include/drm/drm_gpuvm.h                            |  521 +++++-
>  include/drm/drm_mipi_dbi.h                         |    4 +-
>  include/drm/gpu_scheduler.h                        |   50 +-
>  include/linux/iosys-map.h                          |   44 +-
>  include/uapi/drm/drm.h                             |   20 +
>  include/uapi/drm/drm_mode.h                        |   10 +
>  include/uapi/drm/ivpu_accel.h                      |    2 +-
>  include/uapi/drm/qaic_accel.h                      |    5 +-
>  include/uapi/drm/v3d_drm.h                         |    5 +
>  include/uapi/drm/virtgpu_drm.h                     |    2 +
>  sound/core/pcm_drm_eld.c                           |    1 +
>  sound/soc/codecs/hdac_hdmi.c                       |    1 +
>  sound/soc/codecs/hdmi-codec.c                      |    1 +
>  sound/x86/intel_hdmi_audio.c                       |    1 +
>  144 files changed, 5782 insertions(+), 4387 deletions(-)
>  create mode 100644 drivers/accel/qaic/qaic_timesync.c
>  create mode 100644 drivers/accel/qaic/qaic_timesync.h
>  create mode 100644 drivers/gpu/drm/drm_eld.c
>  create mode 100644 drivers/gpu/drm/v3d/v3d_sysfs.c
>  create mode 100644 include/drm/drm_eld.h



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
