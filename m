Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CBF47F968
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 23:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D95610EF43;
	Sun, 26 Dec 2021 22:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26E710E1E3;
 Sun, 26 Dec 2021 22:41:13 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id b73so8712071wmd.0;
 Sun, 26 Dec 2021 14:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=8Zhk7ovsNA8K/QZxki5KLYcEQWn8bVrD89+EYUjEhDo=;
 b=qKJ7QfPPiOsPXJ+eOkiB+7VDOcSJR5Od2U5mAWkK/kqDFWO0RNfBlylZZUoW4X/1pv
 Z6ueIrZxZM5o6oZB3gcyPUkvY7p8OB4MrL6f5tmkyhLGqNbJfEeXsUBvJMafL/Hd8bfF
 JjzyAUoLYJ37+PrxMuTmvQ0zKbHD9I/nNDoRP4VMi+To/O15ieQs/tlo3VmHdKCT/HxN
 ec4+q7hb9/BuiczgIflWn4DL0Sc7lnp57TeR9cuwwL3npAur0qb+dXQRw0OULQYP2Fw/
 hvjS6ammeO6v40misVlyEQFlUedTMb2evLFjGEvwAVnjUIzenVsFAU5+FD0TPcMJIqng
 +MCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=8Zhk7ovsNA8K/QZxki5KLYcEQWn8bVrD89+EYUjEhDo=;
 b=ejnRqQKVYVXK/fEKx9qzl/pWXt6CHSH96cTyt8mToJ7UxBaqZ6TweLuChPeD/Dtnvc
 B3Vihhfv0yKmv+UAaCaxuvqmzgxQ92wU/ROZ+FgNrlOEYapYpp3ei7QJ9KkEGyEpLX0P
 QLR10vGoVmrjvJXSW1d2p4U/18OmWCDAqsb3Ktgt9Gu5Z1huRyuccj+g+a2r/50ewXnw
 XV0jlu2Gdmp20lJBYPmstTr4a3AeVl5S9pEJM7Ufc92YvBt1jp4RNC9KhXddempZpvPm
 9aS07m7FGsDbu51lhY/LfSPlZvDs4066EyBgQzwbTbr721fhdktrtFixrF/MIoVV9fFq
 hT0A==
X-Gm-Message-State: AOAM530lhHejA/tUmlGgPPll7RwLNs72A56aG0xDlKTRoSy463XSLnNj
 vGrk4KENubgZbD7Wv6IjlIeXQUKastJyM9j0W1s=
X-Google-Smtp-Source: ABdhPJzhbx3a8+X999gInFOhHTqFxBc78OhOw7LMieaU4gy21NkvWHoSXoCQA5XRLnICZh3BI0qQGJsEkoGiaMAIokg=
X-Received: by 2002:a05:600c:3d9a:: with SMTP id
 bi26mr4881984wmb.168.1640558471558; 
 Sun, 26 Dec 2021 14:41:11 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 26 Dec 2021 14:40:59 -0800
Message-ID: <CAF6AEGs+vwr0nkwgYzuYAsCoHtypWpWav+yVvLZGsEJy8tJ56A@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2021-12-26 for 5.17
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

This is the main pull for v5.17.

This includes a backmerge from drm-next to pick up the bridge
probe-order changes, because we needed a few fixes on top of that.
Unfortunately that seems to make the request-pull summary also include
*all* of drm-next (at that point).  I'm not entirely sure how to avoid
that.

The summary of *actual* msm-next changes, not including the backmerge:

* dpu plane state cleanup in prep for multirect
* dpu debugfs cleanup (and moving things to atomic_print_state) in prep
  for multirect
* dp support for sc7280
* struct_mutex removal
* include more GMU state in gpu devcore dumps
* add support for a506
* remove old eDP sub-driver (never was used in any upstream supported
  devices and modern things with eDP will use DP sub-driver instead)
* debugfs to disable hw gpu hang detect for (igt tests)
* debugfs for dumping display hw state
* and the usual assortment of cleanup and bug fixes

There still seems to be a timing issue with dpu, showing up on sc7180
devices, after the bridge probe-order change. Ie. things work great if
loglevel is high enough (or enough debug options are enabled, etc).
We'll continue to debug this in the new year.

The following changes since commit afece15a68dc83b438cc4c3a64634e48a5735573=
:

  drm: msm: fix building without CONFIG_COMMON_CLK (2021-11-26 08:58:57 -08=
00)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-12-26

for you to fetch changes up to 6ed95285382d6f90a3c3a11d5806a5eb7db715c3:

  drm/msm/a5xx: Fix missing CP_PROTECT for SMMU on A540 (2021-12-17
15:09:46 -0800)

----------------------------------------------------------------
Aaron Ma (1):
      net: usb: r8152: Add MAC passthrough support for more Lenovo Docks

Abhinav Kumar (3):
      MAINTAINERS: update designated reviewer entry for MSM DRM driver
      mailmap: add and update email addresses
      drm/msm/dpu: add layer mixer register dump to dpu snapshot

Adrian Hunter (2):
      scsi: ufs: core: Fix task management completion timeout race
      scsi: ufs: core: Fix another task management completion race

Akeem G Abodunrin (1):
      iavf: Restore VLAN filters after link down

Akhil P Oommen (2):
      drm/msm: Increase gpu boost interval
      drm/msm/a6xx: Capture gmu log in devcoredump

Akira Yokosawa (1):
      docs: Update Sphinx requirements

Alex Elder (2):
      net: ipa: HOLB register sometimes must be written twice
      net: ipa: disable HOLB drop when updating timer

Alex Shi (1):
      doc/zh_CN: fix a translation error in management-style

Alex Williamson (1):
      platform/x86: think-lmi: Abort probe on analyze failure

Alexander Antonov (3):
      perf/x86/intel/uncore: Fix filter_tid mask for CHA events on
Skylake Server
      perf/x86/intel/uncore: Fix IIO event constraints for Skylake Server
      perf/x86/intel/uncore: Fix IIO event constraints for Snowridge

Alexander Egorenkov (1):
      s390/dump: fix copying to user-space of swapped kdump oldmem

Alexander Lobakin (2):
      samples/bpf: Fix summary per-sec stats in xdp_sample_user
      samples/bpf: Fix build error due to -isystem removal

Alexander Mikhalitsyn (2):
      ipc: WARN if trying to remove ipc object which is absent
      shm: extend forced shm destroy to support objects from several IPC ns=
es

Alexander Stein (1):
      spi: lpspi: Silence error message upon deferred probe

Alexei Starovoitov (2):
      bpf: Fix inner map state pruning regression.
      Merge branch 'Forbid bpf_ktime_get_coarse_ns and bpf_timer_* in
tracing progs'

Alexey Kardashevskiy (3):
      powerpc/pseries/ddw: Revert "Extend upper limit for huge DMA
window for persistent memory"
      powerpc/pseries/ddw: simplify enable_ddw()
      powerpc/pseries/ddw: Do not try direct mapping with persistent
memory and one window

Alistair Delva (1):
      block: Check ADMIN before NICE for IOPRIO_CLASS_RT

Ameer Hamza (1):
      drm/msm/dpu: removed logically dead code

Andreas Gruenbacher (5):
      gfs2: Only dereference i->iov when iter_is_iovec(i)
      gfs2: Fix atomic bug in gfs2_instantiate
      gfs2: Fix length of holes reported at end-of-file
      gfs2: Fix "Introduce flag for glock holder auto-demotion"
      gfs2: Prevent endless loops in gfs2_file_buffered_write

Andreas Schwab (1):
      riscv: fix building external modules

Andrey Grodzovsky (1):
      drm/sched: Avoid lockdep spalt on killing a processes

Andy Shevchenko (2):
      printk: Remove printk.h inclusion in percpu.h
      agp/intel-gtt: Replace kernel.h with the necessary inclusions

AngeloGioacchino Del Regno (7):
      dt-bindings: display/bridge: ptn3460: Convert to YAML binding
      dt-bindings: display/bridge: sil, sii9234: Convert to YAML binding
      dt-bindings: display: Add bindings for Novatek NT35950
      drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels
      dt-bindings: display: Document BOE BF060Y8M-AJ0 panel compatible
      drm/panel: Add BOE BF060Y8M-AJ0 5.99" AMOLED panel driver
      drm/msm: Allocate msm_drm_private early and pass it as driver data

Anitha Chrisanthus (1):
      drm/kmb: Enable support for framebuffer console

Ankit Nautiyal (2):
      drm/i915/dp: Optimize the FRL configuration for HDMI2.1 PCON
      drm/i915/dp: For PCON TMDS mode set only the relavant bits in config =
DPCD

Anup Patel (1):
      RISC-V: Enable KVM in RV64 and RV32 defconfigs as a module

Anusha Srivatsa (1):
      i915/display/dmc: Add Support for PipeC and PipeD DMC

Ard Biesheuvel (1):
      kmap_local: don't assume kmap PTEs are linear arrays in memory

Arjun Roy (1):
      tcp: Fix uninitialized access in skb frags array for Rx 0cp.

Arnaldo Carvalho de Melo (8):
      selftests: KVM: Add /x86_64/sev_migrate_tests to .gitignore
      tools headers cpufeatures: Sync with the kernel sources
      tools headers UAPI: Sync linux/kvm.h with the kernel sources
      perf tests wp: Remove unused functions on s390
      perf tools: Set COMPAT_NEED_REALLOCARRAY for CONFIG_AUXTRACE=3D1
      tools headers UAPI: Sync x86's asm/kvm.h with the kernel sources
      tools build: Fix removal of feature-sync-compare-and-swap
feature detection
      tools headers UAPI: Sync MIPS syscall table file changed by new
futex_waitv syscall

Arnd Bergmann (3):
      dma-buf: st: fix error handling in test_get_fences()
      pinctrl: tegra194: remove duplicate initializer again
      thermal: int340x: Limit Kconfig to 64-bit

Avihai Horon (1):
      net/mlx5: Fix flow counters SF bulk query len

Baoquan He (1):
      s390/kexec: fix memory leak of ipl report buffer

Bart Van Assche (1):
      scsi: ufs: core: Improve SCSI abort handling

Ben Skeggs (2):
      drm/nouveau/pmu/gm200-: avoid touching PMU outside of DEVINIT/PREOS/A=
CR
      drm/nouveau/pmu/gm200-: use alternate falcon reset sequence

Bernard Zhao (1):
      drm/amd/amdgpu: fix potential memleak

Bhaskar Chowdhury (1):
      drm/nouveau/bios/init: A typo fix

Bjorn Andersson (8):
      pwm: Introduce single-PWM of_xlate function
      drm/bridge: ti-sn65dsi86: Use regmap_bulk_write API
      drm/bridge: ti-sn65dsi86: Implement the pwm_chip
      drm/bridge: sn65dsi86: ti_sn65dsi86_read_u16() __maybe_unused
      pinctrl: qcom: sdm845: Enable dual edge errata
      pinctrl: qcom: sm8350: Correct UFS and SDC offsets
      drm/msm/dp: Drop now unused hpd_high member
      drm/msm/dpu: Add more of the INTF interrupt regions

Bob Peterson (1):
      gfs2: release iopen glock early in evict

Boqun Feng (1):
      Drivers: hv: balloon: Use VMBUS_RING_SIZE() wrapper for dm_ring_size

Borislav Petkov (1):
      x86/boot: Pull up cmdline preparation and early param parsing

Brian Norris (9):
      drm/panel: kingdisplay-kd097d04: Delete panel on attach() failure
      drm/panel: innolux-p079zca: Delete panel on attach() failure
      drm/panel: Delete panel on mipi_dsi_attach() failure
      drm/rockchip: vop: Add timeout for DSP hold
      drm/rockchip: dsi: Hold pm-runtime across bind/unbind
      drm/rockchip: dsi: Reconfigure hardware on resume()
      drm/rockchip: dsi: Fix unbalanced clock on probe error
      drm/rockchip: dsi: Disable PLL clock on bind error
      drm/bridge: analogix_dp: Make PSR-exit block less

Bryan Tan (1):
      MAINTAINERS: Update for VMware PVRDMA driver

Bui Quang Minh (1):
      hugetlb: fix hugetlb cgroup refcounting during mremap

Cai Huoqing (16):
      drm: panel: nt36672a: Removed extra whitespace.
      drm/panel: ej030na: Make use of the helper function dev_err_probe()
      drm/panel: fy07024di26a30d: Make use of the helper function
dev_err_probe()
      drm/panel: ili9881c: Make use of the helper function dev_err_probe()
      drm/panel: k101-im2ba02: Make use of the helper function dev_err_prob=
e()
      drm/panel: ls037v7dw01: Make use of the helper function dev_err_probe=
()
      drm/panel: nt39016: Make use of the helper function dev_err_probe()
      drm/panel: s6e63j0x03: Make use of the helper function dev_err_probe(=
)
      drm/panel: sofef00: Make use of the helper function dev_err_probe()
      drm/panel: td043mtea1: Make use of the helper function dev_err_probe(=
)
      drm/panel: xpp055c272: Make use of the helper function dev_err_probe(=
)
      drm/panel: y030xx067a: Make use of the helper function dev_err_probe(=
)
      drm/omapdrm: Convert to SPDX identifier
      drm/omap: dss: Make use of the helper macro SET_RUNTIME_PM_OPS()
      drm/omap: Make use of the helper function
devm_platform_ioremap_resourcexxx()
      drm/tidss: Make use of the helper macro SET_RUNTIME_PM_OPS()

Changcheng Deng (1):
      drm/msm/dp: remove unneeded variable

Chia-I Wu (1):
      MAINTAINERS: add reviewers for virtio-gpu

Christian Borntraeger (1):
      MAINTAINERS: update email address of Christian Borntraeger

Christian Brauner (1):
      fs: handle circular mappings correctly

Christian K=C3=B6nig (26):
      drm/scheduler: fix drm_sched_job_add_implicit_dependencies
      drm/amdgpu: use new iterator in amdgpu_vm_prt_fini
      drm/msm: use new iterator in msm_gem_describe
      drm/radeon: use new iterator in radeon_sync_resv
      dma-buf: fix kerneldoc for renamed members
      drm/nouveau: use the new iterator in nouveau_fence_sync
      dma-buf: add dma_resv selftest v4
      drm/amdgpu: use the new iterator in amdgpu_sync_resv
      drm/amdgpu: use new iterator in amdgpu_ttm_bo_eviction_valuable
      drm: use new iterator in drm_gem_plane_helper_prepare_fb v3
      drm/etnaviv: use new iterator in etnaviv_gem_describe
      drm/etnaviv: replace dma_resv_get_excl_unlocked
      drm/nouveau: use the new interator in nv50_wndw_prepare_fb
      drm/etnaviv: stop getting the excl fence separately here
      drm/radeon: use dma_resv_wait_timeout() instead of manually waiting
      dma-buf: add dma_fence_describe and dma_resv_describe v2
      drm/msm: use the new dma_resv_describe
      drm/etnaviv: use dma_resv_describe
      drm/scheduler: fix drm_sched_job_add_implicit_dependencies
      drm/i915: use the new iterator in i915_gem_busy_ioctl v2
      drm/i915: use new iterator in i915_gem_object_wait_priority
      drm/i915: use the new iterator in i915_sw_fence_await_reservation v3
      drm/i915: use new cursor in intel_prepare_plane_fb v2
      drm/i915: use new iterator in i915_gem_object_wait_reservation
      drm/amdgpu: stop getting excl fence separately
      dma-buf: nuke dma_resv_get_excl_unlocked

Christophe JAILLET (1):
      platform/x86: hp_accel: Fix an error handling path in 'lis3lv02d_prob=
e()'

Christophe Leroy (3):
      powerpc/book3e: Fix TLBCAM preset at boot
      powerpc/signal32: Fix sigset_t copy
      powerpc/8xx: Fix pinned TLBs with CONFIG_STRICT_KERNEL_RWX

Chuck Lever (1):
      NFSD: Fix exposure in nfsd4_decode_bitmap()

Colin Ian King (5):
      drm/virtio: fix potential integer overflow on shift of a int
      drm/virtio: fix another potential integer overflow on shift of a int
      drm/i915: make array states static const
      MIPS: generic/yamon-dt: fix uninitialized variable error
      btrfs: make 1-bit bit-fields of scrub_page unsigned int

Cong Wang (1):
      udp: Validate checksum in udp_read_sock()

C=C3=A9dric Le Goater (1):
      powerpc/xive: Change IRQ domain to a tree domain

Damien Le Moal (3):
      ata: libata: improve ata_read_log_page() error message
      ata: libata: add missing ata_identify_page_supported() calls
      ata: libata-sata: Declare ata_ncq_sdev_attrs static

Dan Carpenter (9):
      drm/bridge: display-connector: fix an uninitialized pointer in probe(=
)
      drm/i915: pin: delete duplicate check in intel_pin_and_fence_fb_obj()
      spi: spi-geni-qcom: fix error handling in spi_geni_grab_gpi_chan()
      platform/mellanox: mlxreg-lc: fix error code in
mlxreg_lc_create_static_devices()
      drm/i915/guc: fix NULL vs IS_ERR() checking
      drm/i915/guc: fix NULL vs IS_ERR() checking
      octeontx2-af: debugfs: don't corrupt user memory
      ptp: ocp: Fix a couple NULL vs IS_ERR() checks
      drm/msm/dp: Fix double free on error in msm_dp_bridge_init()

Daniel Borkmann (1):
      bpf: Fix toctou on read-only map's constant scalar tracking

Daniel Lezcano (1):
      powercap: DTPM: Fix suspend failure and kernel warning

Daniel Mack (2):
      dt-bindings: display: add bindings for newhaven, 1.8-128160EF
      drm/tiny: add driver for newhaven, 1.8-128160EF

Dave Airlie (5):
      Merge tag 'drm-misc-fixes-2021-11-18' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2021-11-18' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.16-2021-11-17' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-next-2021-11-18' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-2021-11-30' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next

David Hildenbrand (1):
      proc/vmcore: fix clearing user buffer by properly using clear_user()

David Matlack (4):
      KVM: selftests: Start at iteration 0 instead of -1
      KVM: selftests: Move vCPU thread creation and joining to common helpe=
rs
      KVM: selftests: Wait for all vCPU to be created before entering guest=
 mode
      KVM: selftests: Use perf_test_destroy_vm in
memslot_modification_stress_test

David S. Miller (5):
      Merge branch 'net-ipa-fixes'
      Merge branch 'bnxt_en-fixes'
      Merge branch '40GbE' of
git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue
      Merge tag 'mlx5-fixes-2021-11-16' of
git://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux
      Merge branch '40GbE' of
git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net- queue

David Woodhouse (8):
      KVM: selftests: Add event channel upcall support to xen_shinfo_test
      KVM: Fix steal time asm constraints
      KVM: x86/xen: Fix get_attr of KVM_XEN_ATTR_TYPE_SHARED_INFO
      KVM: nVMX: Use kvm_{read,write}_guest_cached() for shadow_vmcs12
      KVM: x86/xen: Use sizeof_field() instead of open-coding it
      KVM: nVMX: Use kvm_read_guest_offset_cached() for nested VMCS check
      KVM: nVMX: Use a gfn_to_hva_cache for vmptrld
      KVM: Kill kvm_map_gfn() / kvm_unmap_gfn() and gfn_to_pfn_cache

Davide Caratti (1):
      selftests: add a test case for mirred egress to ingress

Dennis Dalessandro (1):
      IB/hfi1: Properly allocate rdma counter desc memory

Dinh Nguyen (1):
      spi: cadence-quadspi: fix write completion support

Dmitrii Banshchikov (2):
      bpf: Forbid bpf_ktime_get_coarse_ns and bpf_timer_* in tracing progs
      selftests/bpf: Add tests for restricted helpers

Dmitry Baryshkov (32):
      drm/msm/dpu: move LUT levels out of QOS config
      drm/msm/dpu: remove pipe_qos_cfg from struct dpu_plane
      drm/msm/dpu: drop pipe_name from struct dpu_plane
      drm/msm/dpu: remove stage_cfg from struct dpu_crtc
      drm/msm/dpu: move dpu_hw_pipe_cfg out of struct dpu_plane
      drm/msm/dpu: drop dpu_csc_cfg from dpu_plane
      drm/msm/dpu: remove dpu_hw_pipe_cdp_cfg from dpu_plane
      drm/msm/dpu: don't cache pipe->cap->features in dpu_plane
      drm/msm/dpu: don't cache pipe->cap->sblk in dpu_plane
      drm/msm/mdp5: drop eDP support
      drm/msm/edp: drop old eDP support
      dt-bindings: display/msm: remove edp.txt
      drm/msm/dsi: untangle cphy setting from the src pll setting
      drm/msm/dsi: stop setting clock parents manually
      drm/msm/mdp5: drop vdd regulator
      drm/msm: Initialize MDSS irq domain at probe time
      drm/msm/hdmi: switch to drm_bridge_connector
      drm/msm/dpu: drop scaler config from plane state
      drm/msm/dpu: drop pe argument from _dpu_hw_sspp_setup_scaler3
      drm/msm/dpu: simplify DPU_SSPP features checks
      drm/msm/dpu: fix CDP setup to account for multirect index
      drm/msm/dsi: fix initialization in the bonded DSI case
      drm/msm/dpu: move disable_danger out of plane subdir
      drm/msm/dpu: fix safe status debugfs file
      drm/msm/dpu: make danger_status/safe_status readable
      drm/msm/dpu: drop plane's default_scaling debugfs file
      drm/msm/dpu: stop manually removing debugfs files for the DPU plane
      drm/msm/dpu: stop manually removing debugfs files for the DPU CRTC
      drm/msm/dpu: simplify DPU's regset32 code
      drm/msm/dpu: add dpu_crtc_atomic_print_state
      drm/msm/dpu: add dpu_plane_atomic_print_state
      drm/msm/dpu: move SSPP debugfs support from plane to SSPP code

Dmitry Osipenko (5):
      drm/bridge: tc358768: Enable reference clock
      drm/bridge: tc358768: Support pulse mode
      drm/bridge: tc358768: Calculate video start delay
      drm/bridge: tc358768: Disable non-continuous clock mode
      drm/bridge: tc358768: Correct BTACNTRL1 programming

Edwin Peer (2):
      bnxt_en: extend RTNL to VF check in devlink driver_reinit
      bnxt_en: fix format specifier in live patch error message

Eric W. Biederman (2):
      signal: Don't always set SA_IMMUTABLE for forced signals
      signal: Replace force_fatal_sig with force_exit_sig when in doubt

Eryk Rybak (3):
      i40e: Fix correct max_pkt_size on VF RX queue
      i40e: Fix changing previously set num_queue_pairs for PFs
      i40e: Fix ping is lost after configuring ADq on VF

Evan Quan (1):
      drm/amd/pm: avoid duplicate powergate/ungate setting

Ewan D. Milne (1):
      scsi: qla2xxx: Fix mailbox direction flags in qla2xxx_get_adapter_id(=
)

Felix Fietkau (2):
      mac80211: drop check for DONT_REORDER in __ieee80211_select_queue
      mac80211: fix throughput LED trigger

Filipe Manana (1):
      btrfs: silence lockdep when reading chunk tree during mount

Geert Uytterhoeven (1):
      pstore/blk: Use "%lu" to format unsigned long

German Gomez (1):
      perf inject: Fix ARM SPE handling

Grzegorz Szczurek (2):
      iavf: Fix for setting queues to 0
      i40e: Fix display error code in dmesg

Guangming Cao (1):
      dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME

Guchun Chen (1):
      drm/amdgpu: add error print when failing to add IP block(v2)

Gustavo A. R. Silva (2):
      video: omapfb: Fix fall-through warning for Clang
      kbuild: Fix -Wimplicit-fallthrough=3D5 error for GCC 5.x and 6.x

Hans Verkuil (2):
      drm/nouveau: hdmigv100.c: fix corrupted HDMI Vendor InfoFrame
      drm/nouveau: set RGB quantization range to FULL

Hans de Goede (9):
      drm: Add privacy-screen class (v4)
      drm/privacy-screen: Add X86 specific arch init code
      drm/privacy-screen: Add notifier support (v2)
      drm/connector: Add a drm_connector privacy-screen helper functions (v=
2)
      platform/x86: thinkpad_acpi: Add hotkey_notify_extended_hotkey() help=
er
      platform/x86: thinkpad_acpi: Get privacy-screen / lcdshadow ACPI
handles only once
      platform/x86: thinkpad_acpi: Register a privacy-screen device
      platform/x86: amd-pmc: Make CONFIG_AMD_PMC depend on RTC_CLASS
      drm/i915/vlv_dsi: Double pixelclock on read-back for dual-link panels

He Ying (1):
      drm: Small optimization to intel_dp_mst_atomic_master_trans_check

Heiko Carstens (3):
      s390/kexec: fix return code handling
      ftrace/samples: add missing Kconfig option for ftrace direct multi sa=
mple
      ftrace/samples: add s390 support for ftrace direct multi sample

Helge Deller (5):
      parisc: Include stringify.h to avoid build error in crypto/api.c
      parisc: Wire up futex_waitv
      parisc: Wrap assembler related defines inside __ASSEMBLY__
      Revert "parisc: Reduce sigreturn trampoline to 3 instructions"
      parisc: Enable CONFIG_PRINTK_TIME=3Dy in 32bit defconfig

Ian Rogers (3):
      perf hist: Fix memory leak of a perf_hpp_fmt
      perf report: Fix memory leaks around perf_tip()
      perf evsel: Fix memory leaks relating to unit

Ilia Mirkin (1):
      drm/nouveau/kms/nv04: use vzalloc for nv04_display

Imre Deak (31):
      drm/i915/dp: Skip the HW readout of DPCD on disabled encoders
      drm/i915/dp: Ensure sink rate values are always valid
      drm/i915/dp: Ensure max link params are always valid
      drm/i915/dp: Ensure sink/link max lane count values are always valid
      drm/i915/dp: Sanitize sink rate DPCD register values
      drm/i915/dp: Sanitize link common rate array lookups
      drm/i915: Add a table with a descriptor for all i915 modifiers
      drm/i915: Move intel_get_format_info() to intel_fb.c
      drm/i915: Add tiling attribute to the modifier descriptor
      drm/i915: Simplify the modifier check for interlaced scanout support
      drm/i915: Unexport is_semiplanar_uv_plane()
      drm/i915: Move intel_format_info_is_yuv_semiplanar() to intel_fb.c
      drm/i915: Add a platform independent way to get the RC CCS CC plane
      drm/i915: Handle CCS CC planes separately from CCS AUX planes
      drm/i915: Add a platform independent way to check for CCS AUX planes
      drm/i915: Move is_ccs_modifier() to intel_fb.c
      drm/i915: Add functions to check for RC CCS CC and MC CCS modifiers
      drm/i915/fb: Don't report MC CCS plane capability on GEN<12
      drm/i915/fb: Don't store bitmasks in the intel_plane_caps enum
      drm/i915/fb: Fold modifier CCS type/tiling attribute to plane caps
      drm/i915/fb: Fix rounding error in subsampled plane size calculation
      drm/i915/adlp/fb: Prevent the mapping of redundant trailing
padding NULL pages
      drm/i915/fb: Factor out functions to remap contiguous FB obj pages
      drm/i915/adlp/fb: Fix remapping of linear CCS AUX surfaces
      drm/i915/fb: Rename i915_color_plane_view::stride to mapping_stride
      drm/i915/adlp/fb: Remove restriction on semiplanar UV plane offset
      drm/i915/adlp/fb: Remove restriction on CCS AUX plane strides
      drm/i915: Factor out i915_ggtt_suspend_vm/i915_ggtt_resume_vm()
      drm/i915: Restore memory mapping for DPT FBs across system suspend/re=
sume
      drm/i915: Fix fastsets on TypeC ports following a non-blocking modese=
t
      drm/i915: Fix DPT suspend/resume on !HAS_DISPLAY platforms

Jack Wang (1):
      RDMA/mlx4: Do not fail the registration on port stats

Jackie Liu (1):
      drm/msm/dp: displayPort driver need algorithm rational

Jacob Keller (1):
      iavf: prevent accidental free of filter structure

Jakub Kicinski (5):
      selftests: net: switch to socat in the GSO GRE test
      ethernet: sis900: fix indentation
      Merge https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf
      Merge tag 'mac80211-for-net-2021-11-16' of
git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211
      Merge branch 'net-fix-the-mirred-packet-drop-due-to-the-incorrect-dst=
'

Jan Kara (1):
      udf: Fix crash after seekdir

Jani Nikula (31):
      drm/dp: add helpers to read link training delays
      drm/dp: reuse the 8b/10b link training delay helpers
      Merge tag 'topic/drm-dp-training-delay-helpers-2021-10-19' of
git://anongit.freedesktop.org/drm/drm-intel into drm-intel-next
      drm/i915/dp: use new link training delay helpers
      Revert "drm/i915/bios: gracefully disable dual eDP for now"
      drm/i915/cdclk: put the cdclk vtables in const data
      drm/i915/dp: fix integer overflow in 128b/132b data rate calculation
      drm/i915/dsc: demote noisy drm_info() to drm_kms_dbg()
      Merge drm/drm-next into drm-intel-next
      drm/i915/audio: group audio under anonymous struct in drm_i915_privat=
e
      drm/i915/audio: name the audio sub-struct in drm_i915_private
      drm/i915/audio: define the audio struct separately from drm_i915_priv=
ate
      drm/i915/audio: move intel_audio_funcs internal to intel_audio.c
      drm/i915/audio: rename intel_init_audio_hooks to intel_audio_hooks_in=
it
      drm/i915: include intel-gtt.h only where needed
      agp/intel-gtt: reduce intel-gtt dependencies more
      drm/i915/fbc: fix the FBC kernel-doc warnings
      drm/i915/driver: rename i915_drv.c to i915_driver.c
      drm/i915/driver: rename driver to i915_drm_driver
      drm/i915/driver: add i915_driver_ prefix to functions
      drm/i915: drop intel_display.h include from intel_ddi.h
      drm/i915: drop intel_display.h include from intel_dpll_mgr.h
      drm/i915/debugfs: move debug printing to intel_display_power.c
      drm/i915: move structs from intel_display_power.h to .c
      drm/i915: drop intel_display.h include from intel_display_power.h
      drm/i915/pxp: fix includes for headers in include/drm
      Merge drm/drm-next into drm-intel-next
      drm/i915/dsi: split out intel_dsi_vbt.h
      drm/i915/dsi: split out vlv_dsi_pll.h
      drm/i915/dsi: split out vlv_dsi.h
      drm/i915/dsi: split out icl_dsi.h

Jason Wang (1):
      platform/x86: samsung-laptop: Fix typo in a comment

Javier Martinez Canillas (2):
      drm/i915: Fix comment about modeset parameters
      fbdev: Prevent probing generic drivers if a FB is already registered

Jean-Philippe Brucker (1):
      tools/runqslower: Fix cross-build

Jedrzej Jagielski (1):
      i40e: Fix creation of first queue by omitting it if is not power of t=
wo

Jens Axboe (1):
      block: fix missing queue put in error path

Jernej Skrabec (1):
      drm/sun4i: virtual CMA addresses are not needed

Jesse Brandeburg (1):
      e100: fix device suspend/resume

Jiapeng Chong (3):
      drm/nouveau: Remove unused variable ret
      drm/nouveau/fifo: make tu102_fifo_runlist static
      net: Clean up some inconsistent indenting

Jimmy Wang (1):
      platform/x86: thinkpad_acpi: Add support for dual fan control

Johannes Berg (3):
      nl80211: fix radio statistics in survey dump
      mac80211: fix radiotap header generation
      mac80211: fix monitor_sdata RCU/locking assertions

John Keeping (3):
      dt-bindings: ili9881c: add missing panel-common inheritance
      dt-bindings: ili9881c: add rotation property
      drm/panel: ilitek-ili9881c: Read panel orientation

Jonathan Corbet (1):
      Remove unused header <linux/sdb.h>

Jonathan Davies (1):
      net: virtio_net_hdr_to_skb: count transport header in UFO

Jordy Zomer (1):
      ipv6: check return value of ipv6_skip_exthdr

Jos=C3=A9 Roberto de Souza (8):
      drm/i915/display: Rename POWER_DOMAIN_DPLL_DC_OFF to POWER_DOMAIN_DC_=
OFF
      drm/i915/display: Add warn_on in intel_psr_pause()
      drm/i915/display: Wait PSR2 get out of deep sleep to update pipe
      drm/i915/adlp: Extend PSR2 support in transcoder B
      drm/i915/adlp: Implement workaround 16013190616
      drm/i915/display: Check async flip state of every crtc and plane once
      drm/i915/display/adlp: Disable underrun recovery
      drm/i915/psr: Fix PSR2 handling of multiplanar format

Jouni H=C3=B6gander (2):
      drm/i915/display: Add initial selective fetch support for biplanar fo=
rmats
      Revert "drm/i915/display/psr: Do full fetch when handling
multi-planar formats"

Julian Braha (2):
      drm/sun4i: fix unmet dependency on RESET_CONTROLLER for
PHY_SUN6I_MIPI_DPHY
      pinctrl: qcom: fix unmet dependencies on GPIOLIB for GPIOLIB_IRQCHIP

Kai Vehmanen (1):
      drm/i915/display: program audio CDCLK-TS for keepalives

Kalesh Singh (1):
      tracing/histogram: Fix UAF in destroy_hist_field()

Kalyan Thota (1):
      drm/msm/disp/dpu1: set default group ID for CTL.

Karen Sornek (1):
      i40e: Fix warning message and call stack during rmmod i40e driver

Karol Herbst (1):
      MAINTAINERS: update information for nouveau

Kees Cook (3):
      Revert "mark pstore-blk as broken"
      tracing: Use memset_startat() to zero struct trace_iterator
      kasan: test: silence intentional read overflow warnings

Kent Gibson (2):
      selftests: gpio: fix uninitialised variable warning
      selftests: gpio: restore CFLAGS options

Kieran Bingham (1):
      gpu: drm: panel-edp: Fix edp_panel_entry documentation

Konrad Dybcio (1):
      net/ipa: ipa_resource: Fix wrong for loop range

Krishna Manikandan (1):
      drm/msm: use compatible lists to find mdp node

Kumar Kartikeya Dwivedi (2):
      samples/bpf: Fix incorrect use of strlen in xdp_redirect_cpu
      libbpf: Perform map fd cleanup for gen_loader in case of error

Kuogee Hsieh (3):
      drm/msm/dp: Add "qcom, sc7280-dp" to support display port.
      drm/msm/dp: employ bridge mechanism for display enable and disable
      drm/msm/dp: dp_link_parse_sink_count() return immediately if aux
read failed

Lee Jones (1):
      drm/nouveau/dispnv50/headc57d: Make local function 'headc57d_olut' st=
atic

Leon Romanovsky (4):
      RDMA/netlink: Add __maybe_unused to static inline in C file
      RDMA/core: Set send and receive CQ before forwarding to the driver
      RDMA/nldev: Check stat attribute before accessing it
      devlink: Don't throw an error if flash notification sent before
devlink visible

Li Zhijian (1):
      selftests: gpio: fix gpio compiling error

Lijo Lazar (1):
      drm/amd/pm: Remove artificial freq level on Navi1x

Lin Ma (4):
      hamradio: remove needs_free_netdev to avoid UAF
      NFC: reorganize the functions in nci_request
      NFC: reorder the logic in nfc_{un,}register_device
      NFC: add NCI_UNREG flag to eliminate the race

Linus Torvalds (37):
      Merge tag 'trace-v5.16-5' of
git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace
      Merge tag 'nfsd-5.16-1' of git://linux-nfs.org/~bfields/linux
      Merge tag 'hyperv-fixes-signed-20211117' of
git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux
      Merge tag 'mips-fixes_5.16_1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
      Merge tag 'gfs2-v5.16-rc2-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2
      Merge tag 'printk-for-5.16-fixup' of
git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux
      Merge tag 'docs-5.16-2' of git://git.lwn.net/linux
      Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
      Merge tag 'for-5.16/parisc-4' of
git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
      Merge tag 'fs.idmapped.v5.16-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux
      Merge tag 'fs_for_v5.16-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs
      Merge tag 'for-5.16-rc1-tag' of
git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
      Merge tag 'net-5.16-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
      Merge tag 'spi-fix-v5.16-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi
      Merge tag 'platform-drivers-x86-v5.16-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
      Merge tag 'acpi-5.16-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
      Merge tag 'pm-5.16-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
      Merge tag 'thermal-5.16-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
      Merge tag 'zstd-for-linus-5.16-rc1' of git://github.com/terrelln/linu=
x
      Merge tag 'drm-fixes-2021-11-19' of git://anongit.freedesktop.org/drm=
/drm
      Merge tag 'gpio-fixes-for-v5.16-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
      Merge tag 'for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
      Merge tag 'scsi-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
      Merge branch 'SA_IMMUTABLE-fixes-for-v5.16-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace
      Merge tag 'riscv-for-linus-5.16-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
      Merge tag 'perf-tools-fixes-for-v5.16-2021-11-19' of
git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux
      Merge tag 'trace-v5.16-6' of
git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace
      Merge tag 'libata-5.16-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata
      Merge tag '5.16-rc1-smb3-fixes' of git://git.samba.org/sfrench/cifs-2=
.6
      Merge tag 's390-5.16-3' of
git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
      Merge tag 'pinctrl-v5.16-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
      Merge tag 'block-5.16-2021-11-19' of git://git.kernel.dk/linux-block
      Merge branch 'akpm' (patches from Andrew)
      Merge tag 'powerpc-5.16-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
      Merge tag 'perf-urgent-2021-11-21' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
      Merge tag 'x86-urgent-2021-11-21' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
      Linux 5.16-rc2

Lorenz Bauer (1):
      selftests/bpf: Check map in map pruning

Luben Tuikov (1):
      drm/amd/pm: Enhanced reporting also for a stuck command

Lucas De Marchi (1):
      drm/i915: remove CNL leftover

Lukasz Luba (2):
      Documentation: power: Add description about new callback for EM
registration
      Documentation: power: Describe 'advanced' and 'simple' EM models

Luo Jiaxing (3):
      drm/nouveau/device: use snprintf() to replace strncpy() to avoid
NUL-terminated string loss
      drm/nouveau/kms/nv50-: Remove several set but not used variables
"ret" in disp.c
      drm/nouveau/kms: delete an useless function call in
nouveau_framebuffer_new()

Lyude Paul (13):
      drm/nouveau/kms/nv50-: Use drm_dbg_kms() in crc.c
      drm/nouveau/kms/nv50-: Check vbl count after CRC context flip
      drm/nouveau/kms/nv140-: Use hard-coded wndws or core channel for
CRC channel
      drm/nouveau/kms/nvd9-nv138: Fix CRC calculation for the cursor channe=
l
      drm/nouveau/kms/nv140-: Add CRC methods to gv100_disp_core_mthd_head
      drm/nouveau/kms/nv50-: Correct size checks for cursors
      drm/nouveau/kms/nv50-: Use NV_ATOMIC() in nv50_head_atomic_check_lut(=
)
      drm/nouveau/kms/nv50-: Always validate LUTs in
nv50_head_atomic_check_lut()
      drm/i915: Add support for panels with VESA backlights with PWM
enable/disable
      drm/nouveau/kms/nv50-: Explicitly check DPCD backlights for aux
enable/brightness
      drm/dp: Don't read back backlight mode in drm_edp_backlight_enable()
      drm/dp, drm/i915: Add support for VESA backlights using PWM for
brightness control
      drm/i915: Clarify probing order in intel_dp_aux_init_backlight_funcs(=
)

Maarten Lankhorst (1):
      drm/i915: Fix i915_request fence wait semantics

Magnus Karlsson (1):
      xsk: Fix crash on double free in buffer pool

Maher Sanalla (1):
      net/mlx5: Lag, update tracker when state change event received

Manaf Meethalavalappu Pallikunhi (1):
      thermal: core: Reset previous low and high trip during thermal zone i=
nit

Manasi Navare (1):
      drm/i915/: Extend VRR platform support to Gen 11

Marcel Ziswiler (1):
      drm: import DMA_BUF module namespace

Marcin Wojtas (1):
      net: mvmdio: fix compilation warning

Marek Vasut (2):
      drm: of: Add drm_of_lvds_get_data_mapping
      drm/bridge: ti-sn65dsi83: Optimize reset line toggling

Mario Limonciello (4):
      ACPI: Add stubs for wakeup handler functions
      pinctrl: amd: Fix wakeups when IRQ is shared with SCI
      ata: ahci: Add Green Sardine vendor ID as board_ahci_mobile
      ata: libahci: Adjust behavior when StorageD3Enable _DSD is set

Mark Bloch (1):
      net/mlx5: E-Switch, rebuild lag only when needed

Masahiro Yamada (2):
      powerpc: clean vdso32 and vdso64 directories
      s390/vdso: remove -nostdlib compiler flag

Mateusz Palczewski (1):
      iavf: Fix return of set the new channel count

Matthew Wilcox (1):
      mm/swap.c:put_pages_list(): reinitialise the page list

Mauro Carvalho Chehab (4):
      libbpf: update index.rst reference
      docs: accounting: update delay-accounting.rst reference
      Documentation: update vcpu-requests.rst reference
      Documentation/process: fix a cross reference

Maxim Levitsky (2):
      KVM: nVMX: don't use vcpu->arch.efer when checking host state on
nested state load
      KVM: x86/mmu: include EFER.LMA in extended mmu role

Maxime Ripard (53):
      Merge tag 'topic/drm-dp-training-delay-helpers-2021-10-19' of
git://anongit.freedesktop.org/drm/drm-intel into drm-misc-next
      Merge drm/drm-next into drm-misc-next
      clk: bcm-2835: Pick the closest clock rate
      clk: bcm-2835: Remove rounding up the dividers
      drm/vc4: hdmi: Set a default HSM rate
      drm/vc4: hdmi: Move the HSM clock enable to runtime_pm
      drm/vc4: hdmi: Make sure the controller is powered in detect
      drm/vc4: hdmi: Make sure the controller is powered up during bind
      drm/vc4: hdmi: Rework the pre_crtc_configure error handling
      drm/vc4: hdmi: Split the CEC disable / enable functions in two
      drm/vc4: hdmi: Make sure the device is powered with CEC
      drm/vc4: hdmi: Warn if we access the controller while disabled
      drm/vc4: crtc: Make sure the HDMI controller is powered when disablin=
g
      drm/bridge: adv7533: Switch to devm MIPI-DSI helpers
      drm/bridge: adv7511: Register and attach our DSI device at probe
      drm/bridge: anx7625: Switch to devm MIPI-DSI helpers
      drm/bridge: anx7625: Register and attach our DSI device at probe
      drm/bridge: lt8912b: Switch to devm MIPI-DSI helpers
      drm/bridge: lt8912b: Register and attach our DSI device at probe
      drm/bridge: lt9611: Switch to devm MIPI-DSI helpers
      drm/bridge: lt9611: Register and attach our DSI device at probe
      drm/bridge: lt9611uxc: Switch to devm MIPI-DSI helpers
      drm/bridge: lt9611uxc: Register and attach our DSI device at probe
      drm/bridge: ps8640: Switch to devm MIPI-DSI helpers
      drm/bridge: ps8640: Register and attach our DSI device at probe
      drm/bridge: sn65dsi83: Fix bridge removal
      drm/bridge: sn65dsi83: Switch to devm MIPI-DSI helpers
      drm/bridge: sn65dsi83: Register and attach our DSI device at probe
      drm/bridge: sn65dsi86: Switch to devm MIPI-DSI helpers
      drm/bridge: sn65dsi86: Register and attach our DSI device at probe
      drm/bridge: tc358775: Switch to devm MIPI-DSI helpers
      drm/bridge: tc358775: Register and attach our DSI device at probe
      drm/kirin: dsi: Adjust probe order
      drm/vc4: hdmi: Remove the DDC probing for status detection
      drm/vc4: hdmi: Fix HPD GPIO detection
      drm/vc4: Make vc4_crtc_get_encoder public
      drm/vc4: crtc: Add encoder to vc4_crtc_config_pv prototype
      drm/vc4: crtc: Rework the encoder retrieval code (again)
      drm/vc4: crtc: Add some logging
      drm/vc4: Leverage the load tracker on the BCM2711
      drm/vc4: hdmi: Raise the maximum clock rate
      drm/vc4: hdmi: Enable the scrambler on reconnection
      drm/vc4: Increase the core clock based on HVS load
      drm/vc4: crtc: Drop feed_txp from state
      drm/vc4: Fix non-blocking commit getting stuck forever
      drm/vc4: crtc: Copy assigned channel to the CRTC
      drm/vc4: hdmi: Add a spinlock to protect register access
      drm/vc4: hdmi: Use a mutex to prevent concurrent framework access
      drm/vc4: hdmi: Prevent access to crtc->state outside of KMS
      drm/vc4: hdmi: Check the device state in prepare()
      drm/vc4: hdmi: Introduce an output_enabled flag
      drm/vc4: hdmi: Introduce a scdc_enabled flag
      Merge drm/drm-fixes into drm-misc-fixes

Meng Li (1):
      net: stmmac: socfpga: add runtime suspend/resume callback for
stratix10 platform

Michael Chan (1):
      bnxt_en: Fix compile error regression when CONFIG_BNXT_SRIOV is not s=
et

Michael Ellerman (1):
      KVM: PPC: Book3S HV: Use GLOBAL_TOC for kvmppc_h_set_dabr/xdabr()

Michael Trimarchi (4):
      dt-bindings: vendor-prefix: add Wanchanglong Electronics Technology
      dt-bindings: ili9881c: add compatible string for Wanchanglong w552946=
aba
      drm/panel: ilitek-ili9881d: add support for Wanchanglong W552946ABA p=
anel
      drm/panel: ilitek-ili9881c: Make gpio-reset optional

Michael Walle (1):
      spi: fix use-after-free of the add_lock mutex

Michal Maloszewski (1):
      i40e: Fix NULL ptr dereference on VSI filter sync

Mike Christie (2):
      scsi: iscsi: Unblock session then wake up error handler
      scsi: core: sysfs: Fix hang when device state is set via sysfs

Mina Almasry (1):
      hugetlb, userfaultfd: fix reservation restore on userfaultfd error

Ming Lei (3):
      blk-mq: cancel blk-mq dispatch work in both blk_cleanup_queue
and disk_release()
      block: avoid to quiesce queue in elevator_init_mq
      blk-mq: don't insert FUA request with data into scheduler queue

Mitch Williams (1):
      iavf: validate pointers

Mullati, Siva (1):
      drm/i915: abstraction for iosf to compile on all archs

Namhyung Kim (3):
      perf sort: Fix the 'weight' sort key behavior
      perf sort: Fix the 'ins_lat' sort key behavior
      perf sort: Fix the 'p_stage_cyc' sort key behavior

Nathan Chancellor (4):
      drm/i915: Avoid bitwise vs logical OR warning in snb_wm_latency_quirk=
()
      hexagon: export raw I/O routines for modules
      hexagon: clean up timer-regs.h
      hexagon: ignore vmlinux.lds

Neil Armstrong (8):
      drm/bridge: synopsys: dw-hdmi: also allow interlace on bridge
      drm/bridge: dw-hdmi: handle ELD when DRM_BRIDGE_ATTACH_NO_CONNECTOR
      drm/bridge: display-connector: implement bus fmts callbacks
      drm/meson: remove useless recursive components matching
      drm/meson: split out encoder from meson_dw_hdmi
      drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNEC=
TOR
      drm/meson: rename venc_cvbs to encoder_cvbs
      drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR

Neta Ostrovsky (1):
      net/mlx5: Update error handler for UCTX and UMEM

Nguyen Dinh Phi (1):
      cfg80211: call cfg80211_stop_ap when switch from P2P_GO type

Nicholas Nunley (3):
      iavf: check for null in iavf_fix_features
      iavf: free q_vectors before queues in iavf_disable_vf
      iavf: don't clear a lock we don't hold

Nicholas Piggin (3):
      printk: restore flushing of NMI buffers on remote CPUs after NMI
backtraces
      powerpc/pseries: rename numa_dist_table to form2_distances
      powerpc/pseries: Fix numa FORM2 parsing fallback code

Nick Terrell (3):
      lib: zstd: Fix unused variable warning
      lib: zstd: Don't inline functions in zstd_opt.c
      lib: zstd: Don't add -O3 to cflags

Nicolas Dichtel (1):
      tun: fix bonding active backup with arp monitoring

Nikita Yushchenko (1):
      tracing: Don't use out-of-sync va_list in event printing

Nikola Pavlica (1):
      drm/panel-simple: Add Vivax TPC-9150 panel v6

Nikolay Borisov (2):
      btrfs: fix memory ordering between normal and ordered work functions
      btrfs: deprecate BTRFS_IOC_BALANCE ioctl

Oleksij Rempel (1):
      drm: panel-simple: Add support for the Innolux G070Y2-T02 panel

Pali Roh=C3=A1r (3):
      Documentation: arm: marvell: Add some links to homepage / product inf=
os
      Documentation: arm: marvell: Put Armada XP section between
Armada 370 and 375
      Documentation: arm: marvell: Fix link to armada_1000_pb.pdf document

Paolo Bonzini (2):
      Merge branch 'kvm-selftest' into kvm-master
      Merge branch 'kvm-5.16-fixes' into kvm-master

Paul Blakey (1):
      net/mlx5: E-Switch, Fix resetting of encap mode when entering switchd=
ev

Paul Cercueil (7):
      drm/ingenic: Simplify code by using hwdescs array
      drm/ingenic: Add support for private objects
      drm/ingenic: Move IPU scale settings to private state
      drm/ingenic: Set DMA descriptor chain register when starting CRTC
      drm/ingenic: Upload palette before frame
      drm/ingenic: Attach bridge chain to encoders
      drm/ingenic: Remove bogus register write

Paul Durrant (1):
      cpuid: kvm_find_kvm_cpuid_features() should be declared 'static'

Paul Moore (1):
      net,lsm,selinux: revert the security_sctp_assoc_established() hook

Paulo Alcantara (1):
      cifs: introduce cifs_ses_mark_for_reconnect() helper

Pavel Skripkin (3):
      net: bnx2x: fix variable dereferenced before check
      MAINTAINERS: remove GR-everest-linux-l2@marvell.com
      net: dpaa2-eth: fix use-after-free in dpaa2_eth_remove

Perry Yuan (1):
      drm/amd/pm: add GFXCLK/SCLK clocks level print support for APUs

Peter Zijlstra (1):
      x86: Pin task-stack in __get_wchan()

Petr Mladek (1):
      Merge branch 'rework/printk_safe-removal' into for-linus

Philip Chen (2):
      drm/bridge: parade-ps8640: Enable runtime power management
      drm/bridge: parade-ps8640: Populate devices on aux-bus

Piotr Marczak (1):
      iavf: Fix failure to exit out from last all-multicast mode

Prathamesh Shete (1):
      pinctrl: tegra: Return const pointer from tegra_pinctrl_get_group()

Qiang Yu (1):
      drm/lima: fix warning when CONFIG_DEBUG_SG=3Dy & CONFIG_DMA_API_DEBUG=
=3Dy

Qing Wang (4):
      drm/panel: dsi-cm: replace snprintf in show functions with sysfs_emit
      video: fbdev: replace snprintf in show functions with sysfs_emit
      video: omapfb: replace snprintf in show functions with sysfs_emit
      s390: replace snprintf in show functions with sysfs_emit

Qu Wenruo (1):
      btrfs: fix a out-of-bound access in copy_compressed_data_to_page()

Radhakrishna Sripada (2):
      drm/i915: Update memory bandwidth formulae
      drm/i915: Fix Memory BW formulae for ADL-P

Raed Salem (1):
      net/mlx5: E-Switch, return error if encap isn't supported

Rafael J. Wysocki (3):
      Revert "ACPI: scan: Release PM resources blocked by unused objects"
      Merge branch 'powercap'
      Merge branch 'thermal-int340x'

Raffaele Tranquillini (2):
      dt-bindings: panel-simple-dsi: add JDI R63452 panel bindings
      drm/panel: Add JDI R63452 MIPI DSI panel driver

Rajat Jain (1):
      drm/connector: Add support for privacy-screen properties (v4)

Randy Dunlap (6):
      ptp: ptp_clockmatrix: repair non-kernel-doc comment
      net: ethernet: lantiq_etop: fix build errors/warnings
      mips: bcm63xx: add support for clk_get_parent()
      mips: lantiq: add support for clk_get_parent()
      gpio: rockchip: needs GENERIC_IRQ_CHIP to fix build errors
      riscv: kvm: fix non-kernel-doc comment block

Reinette Chatre (1):
      x86/sgx: Fix free page accounting

Rob Clark (22):
      drm/msm/dsi: Adjust probe order
      drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder
      drm/msm: Remove unnecessary struct_mutex
      drm/msm: Drop priv->lastctx
      drm/msm: Remove struct_mutex usage
      drm/msm: Handle fence rollover
      drm/msm: Add debugfs to disable hw err handling
      drm/msm/adreno: Name the shadow buffer
      drm/msm/gpu: Respect PM QoS constraints
      drm/msm/gpu: Add some WARN_ON()s
      drm/msm/gpu: Make a6xx_get_gmu_log() more generic
      drm/msm/gpu: Also snapshot GMU HFI buffer
      drm/msm/gpu: Snapshot GMU debug buffer
      drm/msm/gpu: Add a comment in a6xx_gmu_init()
      drm/msm/gpu: Name GMU bos
      Merge remote-tracking branch 'drm/drm-next' into msm-next-staging
      drm/msm/gpu: Don't allow zero fence_id
      drm/msm/a6xx: Skip crashdumper state if GPU needs_hw_init
      drm/msm/disp: Tweak display snapshot to match gpu snapshot
      drm/msm/disp: Export helper for capturing snapshot
      drm/msm/debugfs: Add display/kms state snapshot
      drm/msm: Don't use autosuspend for display

Rodrigo Vivi (2):
      drm/i915: Clean-up bonding debug message.
      drm/i915: Don't propagate the gen split confusion further

Roi Dayan (1):
      net/mlx5e: CT, Fix multiple allocations and memleak of mod acts

Roman Li (1):
      drm/amd/display: Fix OLED brightness control on eDP

Rustam Kovhaev (1):
      mm: kmemleak: slob: respect SLAB_NOLEAKTRACE flag

Sam Ravnborg (1):
      drm/tiny: ili9163: fix build

Sankeerth Billakanti (5):
      dt-bindings: msm/dp: Add DP compatible strings for sc7280
      drm/msm/dp: Add DP controllers for sc7280
      drm/dp: Add macro to check max_downspread capability
      drm/msm/dp: Enable downspread for supported DP sinks
      drm/msm/dp: Enable ASSR for supported DP sinks

Sean Christopherson (19):
      x86/hyperv: Fix NULL deref in set_hv_tscchange_cb() if Hyper-V setup =
fails
      x86/hyperv: Move required MSRs check to initial platform probing
      KVM: selftests: Explicitly state indicies for vm_guest_mode_params ar=
ray
      KVM: selftests: Expose align() helpers to tests
      KVM: selftests: Assert mmap HVA is aligned when using HugeTLB
      KVM: selftests: Require GPA to be aligned when backed by hugepages
      KVM: selftests: Use shorthand local var to access struct perf_tests_a=
rgs
      KVM: selftests: Capture per-vCPU GPA in perf_test_vcpu_args
      KVM: selftests: Use perf util's per-vCPU GPA/pages in demand paging t=
est
      KVM: selftests: Move per-VM GPA into perf_test_args
      KVM: selftests: Remove perf_test_args.host_page_size
      KVM: selftests: Create VM with adjusted number of guest pages
for perf tests
      KVM: selftests: Fill per-vCPU struct during "perf_test" VM creation
      KVM: selftests: Sync perf_test_args to guest during VM creation
      KVM: SEV: Disallow COPY_ENC_CONTEXT_FROM if target has created vCPUs
      KVM: SEV: Set sev_info.active after initial checks in sev_guest_init(=
)
      KVM: SEV: WARN if SEV-ES is marked active but SEV is not
      KVM: SEV: Drop a redundant setting of sev->asid during initialization
      KVM: SEV: Fix typo in and tweak name of cmd_allowed_from_miror()

Sean Paul (4):
      drm/msm/dpu_kms: Re-order dpu includes
      drm/msm/dpu: Remove useless checks in dpu_encoder
      drm/msm/dpu: Remove encoder->enable() hack
      drm/msm/dp: Re-order dp_audio_put in deinit_sub_modules

SeongJae Park (2):
      mm/damon/dbgfs: use '__GFP_NOWARN' for user-specified size
buffer allocation
      mm/damon/dbgfs: fix missed use of damon_dbgfs_lock

Sergio Paracuellos (1):
      pinctrl: ralink: include 'ralink_regs.h' in 'pinctrl-mt7620.c'

Shawn Guo (2):
      dt-bindings: display: Add Sony Tulip Truly NT35521 panel support
      drm/panel: Add Sony Tulip Truly NT35521 driver

Shunsuke Mie (1):
      dma-buf: Update obsoluted comments on dma_buf_vmap/vunmap()

Simon Ser (6):
      drm/sysfs: introduce drm_sysfs_connector_hotplug_event
      drm/probe-helper: add drm_kms_helper_connector_hotplug_event
      drm/connector: use drm_sysfs_connector_hotplug_event
      amdgpu: use drm_kms_helper_connector_hotplug_event
      drm/probe-helper: use drm_kms_helper_connector_hotplug_event
      i915/display/dp: send a more fine-grained link-status uevent

Slark Xiao (1):
      platform/x86: thinkpad_acpi: Fix WWAN device disabled issue after S3 =
deep

Sohaib Mohamed (1):
      perf bench: Fix two memory leaks detected with ASan

Song Liu (1):
      x86/perf: Fix snapshot_branch_stack warning in VM

Sriharsha Basavapatna (1):
      bnxt_en: reject indirect blk offload when hw-tc-offload is off

Stanislav Lisovskiy (3):
      drm/i915/dg2: Implement WM0 cursor WA for DG2
      drm/i915/dg2: Tile 4 plane format support
      Revert "drm/i915/dg2: Tile 4 plane format support"

Stephen Rothwell (1):
      drm/locking: fix __stack_depot_* name conflict

Steve French (2):
      cifs: move debug print out of spinlock
      cifs: protect srv_count with cifs_tcp_ses_lock

Steven Rostedt (VMware) (1):
      tracing: Add length protection to histogram string copies

Surabhi Boob (1):
      iavf: Fix for the false positive ASQ/ARQ errors while issuing VF rese=
t

Sven Peter (1):
      pinctrl: apple: Always return valid type in apple_gpio_irq_type

Sven Schnelle (2):
      s390/vdso: filter out -mstack-guard and -mstack-size
      parisc/sticon: fix reverse colors

Tadeusz Struk (2):
      tipc: use consistent GFP flags
      tipc: check for null after calling kmemdup

Taehee Yoo (1):
      amt: cancel delayed_work synchronously in amt_fini()

Tariq Toukan (1):
      net/mlx5e: kTLS, Fix crash in RX resync flow

Teng Qi (2):
      ethernet: hisilicon: hns: hns_dsaf_misc: fix a possible array
overflow in hns_dsaf_ge_srst_by_port()
      net: ethernet: dec: tulip: de4x5: fix possible array overflows
in type3_infoblock()

Tetsuo Handa (1):
      sock: fix /proc/net/sockstat underflow in sk_clone_lock()

Thomas Gleixner (1):
      net: stmmac: Fix signed/unsigned wreckage

Thomas Richter (1):
      perf test sample-parsing: Fix branch_stack entry endianness check

Thomas Wei=C3=9Fschuh (1):
      platform/x86: dell-wmi-descriptor: disable by default

Thomas Zimmermann (32):
      drm/gma500: Move helpers for struct gtt_range from gtt.c to gem.c
      drm/gma500: Use to_gtt_range() everywhere
      drm/gma500: Reimplement psb_gem_create()
      drm/gma500: Allocate GTT ranges in stolen memory with psb_gem_create(=
)
      drm/gma500: Rename psb_gtt_{pin,unpin}() to psb_gem_{pin,unpin}()
      drm/gma500: Inline psb_gtt_attach_pages() and psb_gtt_detach_pages()
      drm/gma500: Inline psb_gtt_{alloc,free}_range() into rsp callers
      drm/gma500: Set page-caching flags in GEM pin/unpin
      drm/gma500: Rewrite GTT page insert/remove without struct gtt_range
      drm/gma500: Rename struct gtt_range to struct psb_gem_object
      drm/gma500: Remove generic DRM drivers in probe function
      drm/rockchip: Implement mmap as GEM object function
      drm: Build drm_irq.o only if CONFIG_DRM_LEGACY has been set
      drm: Link several object files into drm_kms_helper.ko
      drm: Move GEM memory managers into modules
      drm: Link CMA framebuffer helpers into KMS helper library
      drm/xen: Implement mmap as GEM object function
      drm: Update documentation and TODO of gem_prime_mmap hook
      drm/format-helper: Export drm_fb_clip_offset()
      drm/format-helper: Rework format-helper memcpy functions
      drm/format-helper: Add destination-buffer pitch to drm_fb_swab()
      drm/format-helper: Rework format-helper conversion functions
      drm/format-helper: Streamline blit-helper interface
      drm/fb-helper: Allocate shadow buffer of surface height
      drm/simpledrm: Enable FB_DAMAGE_CLIPS property
      drm/simpledrm: Support virtual screen sizes
      drm: Clarify semantics of struct drm_mode_config.{min,
max}_{width, height}
      drm/cma-helper: Release non-coherent memory with dma_free_noncoherent=
()
      drm/shmem-helper: Unexport drm_gem_shmem_create_with_handle()
      drm/shmem-helper: Export dedicated wrappers for GEM object functions
      drm/shmem-helper: Pass GEM shmem object in public interfaces
      Merge drm/drm-next into drm-misc-next

Tilak Tangudu (2):
      drm/i915: Disable D3Cold in s2idle and runtime pm
      drm/i915/rpm: Enable runtime pm autosuspend by default

Tom Lendacky (1):
      KVM: x86: Assume a 64-bit hypercall for guests with protected state

Tomi Valkeinen (1):
      drm/omap: increase DSS5 max tv pclk to 192MHz

Uwe Kleine-K=C3=B6nig (1):
      powerpc/83xx/mpc8349emitx: Drop unused variable

Valentine Fatiev (1):
      net/mlx5e: nullify cq->dbg pointer in mlx5_debug_cq_remove()

Vandita Kulkarni (6):
      Revert "drm/i915/tgl/dsi: Gate the ddi clocks after pll mapping"
      drm/i915/dsi/xelpd: Fix the bit mask for wakeup GB
      drm/i915/dsi/xelpd: Add DSI transcoder support
      drm/i915/dsi/xelpd: Disable DC states in Video mode
      Revert "drm/i915/tgl/dsi: Gate the ddi clocks after pll mapping"
      drm/i915/dsi/xelpd: Fix the bit mask for wakeup GB

Vasily Gorbik (5):
      s390/setup: avoid reserving memory above identity mapping
      s390/setup: avoid using memblock_enforce_memory_limit
      s390/setup: re-arrange memblock setup
      s390/boot: simplify and fix kernel memory layout setup
      s390: wire up sys_futex_waitv system call

Ville Syrj=C3=A4l=C3=A4 (79):
      drm/i915: Move the pxp plane state computation
      drm/i915: Fix up skl_program_plane() pxp stuff
      drm/i915: Remove the drm_dbg() from the vblank evade critical section
      drm/i915: Rename intel_load_plane_csc_black()
      drm/i915: Move PCH refclock stuff into its own file
      drm/i915: Move PCH modeset code to its own file
      drm/i915: Clean up the {ilk,lpt}_pch_enable() calling convention
      drm/i915: Move LPT PCH readout code
      drm/i915: Extract ilk_pch_get_config()
      drm/i915: Move iCLKIP readout to the pch code
      drm/i915: Introduce ilk_pch_disable() and ilk_pch_post_disable()
      drm/i915: Move intel_ddi_fdi_post_disable() to fdi code
      drm/i915: Introduce lpt_pch_disable()
      drm/i915: Move function prototypes to the correct header
      drm/i915/hdmi: Split intel_hdmi_bpc_possible() to source vs. sink pai=
r
      drm/i915/hdmi: Introduce intel_hdmi_is_ycbr420()
      drm/i915/hdmi: Introduce intel_hdmi_tmds_clock()
      drm/i915/hdmi: Unify "4:2:0 also" logic between .mode_valid()
and .compute_config()
      drm/i915/hdmi: Extract intel_hdmi_output_format()
      drm/i915/psr: Disable PSR before modesets turn off all planes
      Revert "drm/i915/display: Disable audio, DRRS and PSR before planes"
      drm/i915: Disable all planes before modesetting any pipes
      drm/i915: Introduce intel_master_crtc()
      drm/i915: Simplify intel_crtc_copy_uapi_to_hw_state_nomodeset()
      drm/i915: Split PPS write from DSC enable
      drm/i915: Perform correct cpu_transcoder readout for bigjoiner
      drm/i915: Reduce bigjoiner special casing
      drm/i915: Nuke PIPE_CONFIG_QUIRK_BIGJOINER_SLAVE
      drm/i915: Fix type1 DVI DP dual mode adapter heuristic for
modern platforms
      drm/i915: Fix icl+ combo phy static lane power down setup
      drm/i915: Don't request GMBUS to generate irqs when called while
irqs are off
      drm/i915/hdmi: Turn DP++ TMDS output buffers back on in
encoder->shutdown()
      drm/i915: Stop using group access when progrmming icl combo phy TX
      drm/i915: Query the vswing levels per-lane for icl combo phy
      drm/i915: Query the vswing levels per-lane for icl mg phy
      drm/i915: Query the vswing levels per-lane for tgl dkl phy
      drm/i915: Query the vswing levels per-lane for snps phy
      drm/i915: Enable per-lane drive settings for icl+
      drm/i915: Use intel_de_rmw() for tgl dkl phy programming
      drm/i915: Use intel_de_rmw() for icl mg phy programming
      drm/i915: Use intel_de_rmw() for icl combo phy programming
      drm/i915: Reject planar formats when doing async flips
      drm/i915: Fix async flip with decryption and/or DPT
      drm/i915: Fix up the sprite namespacing
      drm/i915: Split update_plane() into update_noarm() + update_arm()
      drm/i915: Split skl+ plane update into noarm+arm pair
      drm/i915: Split pre-skl primary plane update into noarm+arm pair
      drm/i915: Split g4x+ sprite plane update into noarm+arm pair
      drm/i915: Split ivb+ sprite plane update into noarm+arm pair
      drm/i915: Split vlv/chv sprite plane update into noarm+arm pair
      drm/i915: Do vrr push before sampling the frame counter
      drm/i915: Use vblank workers for gamma updates
      drm/i915: Use unlocked register accesses for LUT loads
      drm/i915: Call intel_update_active_dpll() for both bigjoiner pipes
      drm/i915/fbc: Extract snb_fbc_program_fence()
      drm/i915/fbc: Extract {skl,glk}_fbc_program_cfb_stride()
      drm/i915/fbc: Just use params->fence_y_offset always
      drm/i915/fbc: Introduce intel_fbc_is_compressing()
      drm/i915/fbc: Extract helpers to compute FBC control register values
      drm/i915/fbc: Introduce intel_fbc_funcs
      drm/i915/fbc: Introduce .nuke() vfunc
      drm/i915/fbc: s/gen7/ivb/
      drm/i915/fbc: Introduce .program_cfb() vfunc
      drm/i915/fbc: Introduce intel_fbc_set_false_color()
      drm/i915/fbc: Nuke BDW_FBC_COMP_SEG_MASK
      drm/i915/fbc: Clean up all register defines
      drm/i915/fbc: Finish polishing FBC1 registers
      drm/i915: Relocate FBC_LLC_READ_CTRL
      drm/i915/fbc: s/dev_priv/i915/
      drm/i915/fbc: Start passing around intel_fbc
      drm/1915/fbc: Replace plane->has_fbc with a pointer to the fbc instan=
ce
      drm/i915: Move vrr push after the frame counter sampling again
      drm/i915: Do vblank evasion correctly if vrr push has already been se=
nt
      drm/i915: Fix framestart_delay commens in VRR code
      drm/i915: Declare .(de)gamma_lut_tests for icl+
      drm/i915: Disable DSB usage for now
      drm/i915: Clean up FPGA_DBG/CLAIM_ER bits
      drm/i915: Clean up DPINVGTT/VLV_DPFLIPSTAT bits
      drm/i915: Clean up CRC register defines

Vincent Bernat (1):
      platform/x86: thinkpad_acpi: fix documentation for adaptive keyboard

Vitaly Kuznetsov (6):
      KVM: arm64: Cap KVM_CAP_NR_VCPUS by kvm_arm_default_max_vcpus()
      KVM: MIPS: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
      KVM: PPC: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
      KVM: RISC-V: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
      KVM: s390: Cap KVM_CAP_NR_VCPUS by num_online_cpus()
      KVM: x86: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS

Vlad Buslov (1):
      net/mlx5e: Wait for concurrent flow deletion during neigh/fib events

Vladimir Lypak (2):
      drm/msm/a5xx: Add support for Adreno 506 GPU
      drm/msm/a5xx: Fix missing CP_PROTECT for SMMU on A540

Wang Hai (1):
      drm: fix null-ptr-deref in drm_dev_init_release()

Wang Haojun (1):
      MIPS: syscalls: Wire up futex_waitv syscall

Wang Yugui (1):
      btrfs: check-integrity: fix a warning on write caching disabled disk

Wasin Thonkaew (1):
      docs: filesystems: Fix grammatical error "with" to "which"

Wen Gu (2):
      net/smc: Transfer remaining wait queue entries during fallback
      net/smc: Make sure the link_id is unique

William Tseng (2):
      drm/i915/dsi: disable lpdt if it is not enabled
      drm/i915/dsi: transmit brightness command in HS state

Xin Ji (4):
      dt-bindings:drm/bridge:anx7625:add vendor define
      drm/bridge: anx7625: fix not correct return value
      drm/bridge: anx7625: add MIPI DPI input feature
      drm/bridge: anx7625: add HDMI audio function

Xin Long (2):
      tipc: only accept encrypted MSG_CRYPTO msgs
      net: sched: act_mirred: drop dst for the direction from egress to ing=
ress

Xing Song (1):
      mac80211: do not access the IV when it was stripped

Yang Li (4):
      drm/v3d: nullify pointer se with a NULL
      drm/panel: novatek-nt35950: remove unneeded semicolon
      gpio: virtio: remove unneeded semicolon
      drm/msm/dpu: remove node from list before freeing the node

Yevgeny Kliteynik (2):
      net/mlx5: DR, Handle eswitch manager and uplink vports separately
      net/mlx5: DR, Fix check for unsupported fields in match param

Yu Kuai (1):
      blk-cgroup: fix missing put device in error path from blkg_conf_pref(=
)

Yunfeng Ye (1):
      mm: emit the "free" trace report before freeing memory in
kmem_cache_free()

Yunsheng Lin (1):
      page_pool: Revert "page_pool: disable dma mapping support..."

Zekun Shen (1):
      atlantic: Fix OOB read and write in hw_atl_utils_fw_rpc_wait

Zhaoyu Liu (1):
      docs: ftrace: fix the wrong path of tracefs

Zou Wei (1):
      drm/nouveau/core/client: Mark nvkm_uclient_sclass with static keyword

chongjiapeng (1):
      drm/panel: make sharp_ls055d1sx04 static

hongao (1):
      drm/amdgpu: fix set scaling mode Full/Full aspect/Center not
works on vga and dvi connectors

liuguoqiang (1):
      net: return correct error code

shaoyunl (1):
      drm/amd/amdkfd: Fix kernel panic when reset failed and been
triggered again

tangchunyou (1):
      nouveau/nvkm/subdev/devinit/mcp89.c:Unneeded variable

xinhui pan (1):
      drm/ttm: Put BO in its memory manager's lru list

yangcong (1):
      drm/bridge: parade-ps8640: Fix additional suspend/resume at bootup

zhangyue (1):
      net: tulip: de4x5: fix the problem that the array 'lp->phy[8]'
may be out of bound

=C5=81ukasz Stelmach (1):
      net: ax88796c: use bit numbers insetad of bit masks

=E9=BB=84=E4=B9=90 (1):
      KVM: x86: Fix uninitialized eoi_exit_bitmap usage in
vcpu_load_eoi_exitmap()

 .mailmap
        |   11 +
 Documentation/admin-guide/laptops/thinkpad-acpi.rst
        |   12 +-
 Documentation/admin-guide/sysctl/kernel.rst
        |    2 +-
 Documentation/arm/marvell.rst
        |   48 +-
 Documentation/bpf/index.rst
        |    2 +-
 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
       |   65 +-
 Documentation/devicetree/bindings/display/bridge/nxp,ptn3460.yaml
        |  106 +++
 Documentation/devicetree/bindings/display/bridge/ptn3460.txt
        |   39 -
 Documentation/devicetree/bindings/display/bridge/sii9234.txt
        |   49 --
 Documentation/devicetree/bindings/display/bridge/sil,sii9234.yaml
        |  110 +++
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml
        |    2 +
 Documentation/devicetree/bindings/display/msm/edp.txt
        |   56 --
 Documentation/devicetree/bindings/display/panel/boe,bf060y8m-aj0.yaml
        |   81 +++
 Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
        |   69 ++
 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
        |    6 +-
 Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
        |  106 +++
 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
        |    2 +
 Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.y=
aml
|   72 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml
        |    2 +
 Documentation/doc-guide/sphinx.rst
        |   22 +-
 Documentation/filesystems/autofs.rst
        |    2 +-
 Documentation/gpu/drm-kms-helpers.rst
        |   15 +
 Documentation/gpu/drm-kms.rst
        |    2 +
 Documentation/gpu/todo.rst
        |   26 +-
 Documentation/power/energy-model.rst
        |   53 +-
 Documentation/process/changes.rst
        |    2 +-
 Documentation/process/submitting-patches.rst
        |    4 +-
 Documentation/trace/ftrace.rst
        |    9 +-
 Documentation/translations/it_IT/doc-guide/sphinx.rst
        |   23 +-
 Documentation/translations/it_IT/process/changes.rst
        |    2 +-
 Documentation/translations/zh_CN/doc-guide/sphinx.rst
        |   21 +-
 Documentation/translations/zh_CN/process/management-style.rst
        |    4 +-
 MAINTAINERS
        |   31 +-
 Makefile
        |    2 +-
 arch/arm/Kconfig
        |    1 +
 arch/arm64/kvm/arm.c
        |    9 +-
 arch/hexagon/include/asm/timer-regs.h
        |   26 -
 arch/hexagon/include/asm/timex.h
        |    3 +-
 arch/hexagon/kernel/.gitignore
        |    1 +
 arch/hexagon/kernel/time.c
        |   12 +-
 arch/hexagon/lib/io.c
        |    4 +
 arch/m68k/kernel/traps.c
        |    2 +-
 arch/mips/bcm63xx/clk.c
        |    6 +
 arch/mips/generic/yamon-dt.c
        |    2 +-
 arch/mips/kernel/syscalls/syscall_n32.tbl
        |    1 +
 arch/mips/kernel/syscalls/syscall_n64.tbl
        |    1 +
 arch/mips/kernel/syscalls/syscall_o32.tbl
        |    1 +
 arch/mips/kvm/mips.c
        |    2 +-
 arch/mips/lantiq/clk.c
        |    6 +
 arch/parisc/configs/generic-32bit_defconfig
        |    1 +
 arch/parisc/include/asm/assembly.h
        |   44 +-
 arch/parisc/include/asm/jump_label.h
        |    1 +
 arch/parisc/include/asm/rt_sigframe.h
        |    2 +-
 arch/parisc/kernel/signal.c
        |   13 +-
 arch/parisc/kernel/signal32.h
        |    2 +-
 arch/parisc/kernel/syscalls/syscall.tbl
        |    1 +
 arch/powerpc/kernel/Makefile
        |    3 +
 arch/powerpc/kernel/head_8xx.S
        |   13 +-
 arch/powerpc/kernel/signal.h
        |   10 +-
 arch/powerpc/kernel/signal_32.c
        |    2 +-
 arch/powerpc/kernel/signal_64.c
        |    4 +-
 arch/powerpc/kernel/watchdog.c
        |    6 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S
        |    4 +-
 arch/powerpc/kvm/powerpc.c
        |    4 +-
 arch/powerpc/mm/nohash/kaslr_booke.c
        |    2 +-
 arch/powerpc/mm/nohash/tlb.c
        |    4 +-
 arch/powerpc/mm/numa.c
        |   44 +-
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
        |    1 -
 arch/powerpc/platforms/pseries/iommu.c
        |   26 +-
 arch/powerpc/sysdev/xive/Kconfig
        |    1 -
 arch/powerpc/sysdev/xive/common.c
        |    3 +-
 arch/riscv/Makefile
        |    2 +
 arch/riscv/configs/defconfig
        |    2 +
 arch/riscv/configs/rv32_defconfig
        |    2 +
 arch/riscv/kvm/vcpu.c
        |    2 +-
 arch/riscv/kvm/vcpu_sbi.c
        |    2 +-
 arch/riscv/kvm/vm.c
        |    2 +-
 arch/s390/Kconfig
        |    3 +-
 arch/s390/Makefile
        |   10 +-
 arch/s390/boot/startup.c
        |   88 +--
 arch/s390/include/asm/kexec.h
        |    6 +
 arch/s390/kernel/crash_dump.c
        |    4 +-
 arch/s390/kernel/ipl.c
        |    3 +-
 arch/s390/kernel/machine_kexec_file.c
        |   18 +-
 arch/s390/kernel/setup.c
        |   22 +-
 arch/s390/kernel/syscalls/syscall.tbl
        |    1 +
 arch/s390/kernel/traps.c
        |    2 +-
 arch/s390/kernel/vdso32/Makefile
        |    2 +-
 arch/s390/kernel/vdso64/Makefile
        |    7 +-
 arch/s390/kvm/kvm-s390.c
        |    2 +
 arch/sparc/kernel/signal_32.c
        |    4 +-
 arch/sparc/kernel/windows.c
        |    2 +-
 arch/x86/Kconfig
        |    2 +-
 arch/x86/entry/vsyscall/vsyscall_64.c
        |    2 +-
 arch/x86/events/intel/core.c
        |    2 -
 arch/x86/events/intel/uncore_snbep.c
        |   12 +
 arch/x86/hyperv/hv_init.c
        |   12 +-
 arch/x86/include/asm/kvm_host.h
        |    1 +
 arch/x86/kernel/cpu/mshyperv.c
        |   20 +-
 arch/x86/kernel/cpu/sgx/main.c
        |   12 +-
 arch/x86/kernel/process.c
        |    5 +
 arch/x86/kernel/setup.c
        |   66 +-
 arch/x86/kernel/vm86_32.c
        |    2 +-
 arch/x86/kvm/cpuid.c
        |    2 +-
 arch/x86/kvm/hyperv.c
        |    4 +-
 arch/x86/kvm/mmu/mmu.c
        |    1 +
 arch/x86/kvm/svm/sev.c
        |   18 +-
 arch/x86/kvm/svm/svm.h
        |    2 +-
 arch/x86/kvm/vmx/nested.c
        |   98 ++-
 arch/x86/kvm/vmx/vmx.h
        |   10 +
 arch/x86/kvm/x86.c
        |   18 +-
 arch/x86/kvm/x86.h
        |   12 +
 arch/x86/kvm/xen.c
        |   22 +-
 block/blk-cgroup.c
        |    9 +-
 block/blk-core.c
        |    4 +-
 block/blk-flush.c
        |   12 +-
 block/blk-mq.c
        |   33 +-
 block/blk-mq.h
        |    2 +
 block/blk-sysfs.c
        |   10 -
 block/blk.h
        |    2 +-
 block/elevator.c
        |   10 +-
 block/genhd.c
        |    2 +
 block/ioprio.c
        |    9 +-
 drivers/acpi/glue.c
        |   25 -
 drivers/acpi/internal.h
        |    1 -
 drivers/acpi/scan.c
        |    6 -
 drivers/ata/ahci.c
        |    1 +
 drivers/ata/libahci.c
        |   15 +
 drivers/ata/libata-core.c
        |   11 +-
 drivers/ata/libata-sata.c
        |    2 +-
 drivers/char/agp/intel-gtt.c
        |    1 +
 drivers/clk/bcm/clk-bcm2835.c
        |   13 +-
 drivers/dma-buf/Makefile
        |    3 +-
 drivers/dma-buf/dma-buf.c
        |   32 +-
 drivers/dma-buf/dma-fence.c
        |   17 +
 drivers/dma-buf/dma-resv.c
        |   23 +
 drivers/dma-buf/selftests.h
        |    1 +
 drivers/dma-buf/st-dma-resv.c
        |  371 ++++++++++
 drivers/gpio/Kconfig
        |    1 +
 drivers/gpio/gpio-virtio.c
        |    2 +-
 drivers/gpu/drm/Kconfig
        |    8 +-
 drivers/gpu/drm/Makefile
        |   25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h
        |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
        |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
        |   36 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
        |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
        |   44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
        |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
        |   26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
        |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
        |    5 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
        |   11 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
        |    4 +-
 drivers/gpu/drm/amd/include/amd_shared.h
        |    3 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c
        |   10 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
        |    8 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c
        |   22 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
        |   13 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
        |   26 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
        |   27 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.h
        |    1 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
        |    8 +-
 drivers/gpu/drm/bridge/Kconfig
        |    1 +
 drivers/gpu/drm/bridge/adv7511/adv7511.h
        |    1 -
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
        |   15 +-
 drivers/gpu/drm/bridge/adv7511/adv7533.c
        |   20 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
        |   14 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c
        |  491 +++++++++++--
 drivers/gpu/drm/bridge/analogix/anx7625.h
        |   23 +-
 drivers/gpu/drm/bridge/display-connector.c
        |   88 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c
        |   31 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c
        |   62 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c
        |   65 +-
 drivers/gpu/drm/bridge/lvds-codec.c
        |   21 +-
 drivers/gpu/drm/bridge/parade-ps8640.c
        |  346 +++++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
        |   10 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
        |    4 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
        |    9 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
        |   13 +-
 drivers/gpu/drm/bridge/tc358768.c
        |   94 ++-
 drivers/gpu/drm/bridge/tc358775.c
        |   50 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c
        |  128 ++--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c
        |  466 ++++++++++--
 drivers/gpu/drm/drm_atomic_uapi.c
        |    4 +
 drivers/gpu/drm/drm_connector.c
        |  205 +++++-
 drivers/gpu/drm/drm_dp_helper.c
        |  261 +++++--
 drivers/gpu/drm/drm_drv.c
        |   13 +-
 drivers/gpu/drm/drm_fb_helper.c
        |    2 +-
 drivers/gpu/drm/drm_format_helper.c
        |  247 +++----
 drivers/gpu/drm/drm_gem_atomic_helper.c
        |   14 +-
 drivers/gpu/drm/drm_gem_cma_helper.c
        |   14 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c
        |  136 ++--
 drivers/gpu/drm/drm_irq.c
        |    2 -
 drivers/gpu/drm/drm_mipi_dbi.c
        |    6 +-
 drivers/gpu/drm/drm_of.c
        |   33 +
 drivers/gpu/drm/drm_privacy_screen.c
        |  467 ++++++++++++
 drivers/gpu/drm/drm_privacy_screen_x86.c
        |   86 +++
 drivers/gpu/drm/drm_probe_helper.c
        |   48 +-
 drivers/gpu/drm/drm_sysfs.c
        |   25 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c
        |   33 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
        |    4 +-
 drivers/gpu/drm/gma500/framebuffer.c
        |   52 +-
 drivers/gpu/drm/gma500/gem.c
        |  234 ++++--
 drivers/gpu/drm/gma500/gem.h
        |   28 +-
 drivers/gpu/drm/gma500/gma_display.c
        |   51 +-
 drivers/gpu/drm/gma500/gtt.c
        |  326 ++-------
 drivers/gpu/drm/gma500/gtt.h
        |   29 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c
        |    3 +-
 drivers/gpu/drm/gma500/psb_drv.c
        |   12 +
 drivers/gpu/drm/gma500/psb_intel_display.c
        |   17 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h
        |    2 +-
 drivers/gpu/drm/gud/gud_pipe.c
        |   14 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
        |   52 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
        |    5 +-
 drivers/gpu/drm/i915/Kconfig
        |    2 +-
 drivers/gpu/drm/i915/Makefile
        |    4 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c
        |  134 ++--
 drivers/gpu/drm/i915/display/icl_dsi.c
        |   23 +-
 drivers/gpu/drm/i915/display/icl_dsi.h
        |   15 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c
        |   96 ++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h
        |   23 +-
 drivers/gpu/drm/i915/display/intel_audio.c
        |  140 ++--
 drivers/gpu/drm/i915/display/intel_audio.h
        |    4 +-
 drivers/gpu/drm/i915/display/intel_bw.c
        |  213 +++++-
 drivers/gpu/drm/i915/display/intel_cdclk.c
        |    5 +
 drivers/gpu/drm/i915/display/intel_color.c
        |  130 ++--
 drivers/gpu/drm/i915/display/intel_combo_phy.c
        |    2 +-
 drivers/gpu/drm/i915/display/intel_crt.c
        |   13 +-
 drivers/gpu/drm/i915/display/intel_crtc.c
        |  107 ++-
 drivers/gpu/drm/i915/display/intel_crtc.h
        |    7 +
 drivers/gpu/drm/i915/display/intel_cursor.c
        |   69 +-
 drivers/gpu/drm/i915/display/intel_ddi.c
        |  348 ++++-----
 drivers/gpu/drm/i915/display/intel_ddi.h
        |    5 +-
 drivers/gpu/drm/i915/display/intel_display.c
        | 1920 ++++++++++---------------------------------------
 drivers/gpu/drm/i915/display/intel_display.h
        |   17 +-
 drivers/gpu/drm/i915/display/intel_display_debugfs.c
        |   69 +-
 drivers/gpu/drm/i915/display/intel_display_power.c
        |  132 +++-
 drivers/gpu/drm/i915/display/intel_display_power.h
        |  102 +--
 drivers/gpu/drm/i915/display/intel_display_types.h
        |   51 +-
 drivers/gpu/drm/i915/display/intel_dmc.h
        |    2 +
 drivers/gpu/drm/i915/display/intel_dp.c
        |  163 ++++-
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
        |   81 ++-
 drivers/gpu/drm/i915/display/intel_dp_link_training.c
        |   43 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c
        |   32 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c
        |    7 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h
        |    2 +-
 drivers/gpu/drm/i915/display/intel_dpt.c
        |   58 ++
 drivers/gpu/drm/i915/display/intel_dpt.h
        |    4 +
 drivers/gpu/drm/i915/display/intel_dsb.c
        |    4 +-
 drivers/gpu/drm/i915/display/intel_dsi.h
        |   42 --
 drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
        |    4 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c
        |    2 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.h
        |   22 +
 drivers/gpu/drm/i915/display/intel_fb.c
        |  706 +++++++++++++++---
 drivers/gpu/drm/i915/display/intel_fb.h
        |   31 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c
        |   12 +-
 drivers/gpu/drm/i915/display/intel_fbc.c
        | 1000 +++++++++++++++-----------
 drivers/gpu/drm/i915/display/intel_fbc.h
        |   11 +-
 drivers/gpu/drm/i915/display/intel_fdi.c
        |  136 +---
 drivers/gpu/drm/i915/display/intel_fdi.h
        |    2 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c
        |    2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c
        |   13 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c
        |  117 +--
 drivers/gpu/drm/i915/display/intel_lpe_audio.c
        |   42 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c
        |  501 +++++++++++++
 drivers/gpu/drm/i915/display/intel_pch_display.h
        |   27 +
 drivers/gpu/drm/i915/display/intel_pch_refclk.c
        |  648 +++++++++++++++++
 drivers/gpu/drm/i915/display/intel_pch_refclk.h
        |   21 +
 drivers/gpu/drm/i915/display/intel_psr.c
        |  125 ++--
 drivers/gpu/drm/i915/display/intel_psr.h
        |    3 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c
        |    2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c
        |  257 ++++---
 drivers/gpu/drm/i915/display/intel_sprite.h
        |    4 -
 drivers/gpu/drm/i915/display/intel_vdsc.c
        |   65 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h
        |   10 +-
 drivers/gpu/drm/i915/display/intel_vrr.c
        |   18 +-
 drivers/gpu/drm/i915/display/intel_vrr.h
        |    1 +
 drivers/gpu/drm/i915/display/skl_scaler.c
        |    1 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c
        |  462 ++++++------
 drivers/gpu/drm/i915/display/vlv_dsi.c
        |    8 +
 drivers/gpu/drm/i915/display/vlv_dsi.h
        |   19 +
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c
        |    1 +
 drivers/gpu/drm/i915/display/vlv_dsi_pll.h
        |   38 +
 drivers/gpu/drm/i915/gem/i915_gem_busy.c
        |   35 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c
        |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c
        |   96 +--
 drivers/gpu/drm/i915/gt/intel_ggtt.c
        |  266 ++++---
 drivers/gpu/drm/i915/gt/intel_gt.c
        |    2 +
 drivers/gpu/drm/i915/gt/intel_gtt.h
        |    2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
        |    4 +-
 drivers/gpu/drm/i915/{i915_drv.c =3D> i915_driver.c}
        |   43 +-
 drivers/gpu/drm/i915/i915_driver.h
        |   24 +
 drivers/gpu/drm/i915/i915_drv.h
        |   75 +-
 drivers/gpu/drm/i915/i915_iosf_mbi.h
        |   42 ++
 drivers/gpu/drm/i915/i915_irq.c
        |    2 +-
 drivers/gpu/drm/i915/i915_module.c
        |    4 +-
 drivers/gpu/drm/i915/i915_pci.c
        |   22 +-
 drivers/gpu/drm/i915/i915_reg.h
        |  362 +++++-----
 drivers/gpu/drm/i915/i915_request.c
        |   57 +-
 drivers/gpu/drm/i915/i915_request.h
        |    5 +
 drivers/gpu/drm/i915/i915_sw_fence.c
        |   53 +-
 drivers/gpu/drm/i915/i915_switcheroo.c
        |    5 +-
 drivers/gpu/drm/i915/i915_trace.h
        |   75 +-
 drivers/gpu/drm/i915/i915_vma_types.h
        |   19 +-
 drivers/gpu/drm/i915/intel_pm.c
        |   41 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c
        |    3 +
 drivers/gpu/drm/i915/intel_uncore.c
        |    2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c
        |    3 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
        |    6 +-
 drivers/gpu/drm/i915/vlv_sideband.c
        |    3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c
        |  283 ++++++--
 drivers/gpu/drm/ingenic/ingenic-ipu.c
        |  127 +++-
 drivers/gpu/drm/kmb/kmb_drv.c
        |    4 +
 drivers/gpu/drm/lima/lima_device.c
        |    1 +
 drivers/gpu/drm/lima/lima_gem.c
        |   18 +-
 drivers/gpu/drm/lima/lima_sched.c
        |    4 +-
 drivers/gpu/drm/meson/Kconfig
        |    2 +
 drivers/gpu/drm/meson/Makefile
        |    3 +-
 drivers/gpu/drm/meson/meson_drv.c
        |   71 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c
        |  342 +--------
 drivers/gpu/drm/meson/meson_encoder_cvbs.c
        |  284 ++++++++
 drivers/gpu/drm/meson/{meson_venc_cvbs.h =3D> meson_encoder_cvbs.h}
        |    2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c
        |  447 ++++++++++++
 drivers/gpu/drm/meson/meson_encoder_hdmi.h
        |   12 +
 drivers/gpu/drm/meson/meson_venc_cvbs.c
        |  293 --------
 drivers/gpu/drm/mgag200/mgag200_mode.c
        |    4 +-
 drivers/gpu/drm/msm/Kconfig
        |    1 +
 drivers/gpu/drm/msm/Makefile
        |    8 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c
        |    3 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c
        |    3 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c
        |    3 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
        |    4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c
        |   55 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c
        |   25 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c
        |   15 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h
        |   10 -
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
        |  104 ++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c
        |   10 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h
        |   11 +
 drivers/gpu/drm/msm/adreno/adreno_device.c
        |   38 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c
        |    4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h
        |    7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
        |   41 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
        |    5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
        |   38 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
        |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
        |    6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
        |    5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
        |    8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
        |   18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
        |    3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
        |   98 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
        |   44 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
        |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
        |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
        |  150 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
        |   40 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
        |   25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
        |  564 ++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
        |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
        |    4 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
        |   22 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
        |   56 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
        |   27 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
        |   14 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
        |    9 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c
        |   23 +-
 drivers/gpu/drm/msm/dp/dp_display.c
        |   59 +-
 drivers/gpu/drm/msm/dp/dp_display.h
        |    1 +
 drivers/gpu/drm/msm/dp/dp_drm.c
        |   75 ++
 drivers/gpu/drm/msm/dp/dp_hpd.c
        |    2 -
 drivers/gpu/drm/msm/dp/dp_hpd.h
        |    2 -
 drivers/gpu/drm/msm/dp/dp_link.c
        |   19 +-
 drivers/gpu/drm/msm/dsi/dsi.c
        |   64 +-
 drivers/gpu/drm/msm/dsi/dsi.h
        |    7 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c
        |   77 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c
        |   37 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
        |   13 +-
 drivers/gpu/drm/msm/edp/edp.c
        |  198 -----
 drivers/gpu/drm/msm/edp/edp.h
        |   77 --
 drivers/gpu/drm/msm/edp/edp.xml.h
        |  388 ----------
 drivers/gpu/drm/msm/edp/edp_aux.c
        |  265 -------
 drivers/gpu/drm/msm/edp/edp_bridge.c
        |  111 ---
 drivers/gpu/drm/msm/edp/edp_connector.c
        |  132 ----
 drivers/gpu/drm/msm/edp/edp_ctrl.c
        | 1373 -----------------------------------
 drivers/gpu/drm/msm/edp/edp_phy.c
        |   98 ---
 drivers/gpu/drm/msm/hdmi/hdmi.c
        |   19 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h
        |   19 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
        |   83 ++-
 drivers/gpu/drm/msm/hdmi/{hdmi_connector.c =3D> hdmi_hpd.c}
        |  158 +---
 drivers/gpu/drm/msm/msm_debugfs.c
        |  127 +++-
 drivers/gpu/drm/msm/msm_drv.c
        |  117 ++-
 drivers/gpu/drm/msm/msm_drv.h
        |   37 +-
 drivers/gpu/drm/msm/msm_fbdev.c
        |   13 +-
 drivers/gpu/drm/msm/msm_fence.h
        |   12 +
 drivers/gpu/drm/msm/msm_gem.c
        |   29 +-
 drivers/gpu/drm/msm/msm_gem_submit.c
        |    2 +-
 drivers/gpu/drm/msm/msm_gpu.c
        |   22 +-
 drivers/gpu/drm/msm/msm_gpu.h
        |   66 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c
        |   91 +--
 drivers/gpu/drm/msm/msm_kms.h
        |   11 +-
 drivers/gpu/drm/msm/msm_perf.c
        |    9 +-
 drivers/gpu/drm/msm/msm_rd.c
        |   16 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c
        |    4 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.c
        |    4 +-
 drivers/gpu/drm/nouveau/dispnv50/Kbuild
        |    1 +
 drivers/gpu/drm/nouveau/dispnv50/base907c.c
        |    6 +-
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c
        |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c
        |   64 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.h
        |    7 +-
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c
        |    8 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
        |   45 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.h
        |   40 ++
 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
        |   58 ++
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c
        |   15 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c
        |   11 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c
        |   38 +-
 drivers/gpu/drm/nouveau/dispnv50/head.h
        |    2 +
 drivers/gpu/drm/nouveau/dispnv50/head907d.c
        |    6 +
 drivers/gpu/drm/nouveau/dispnv50/head917d.c
        |    1 +
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c
        |    1 +
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c
        |    3 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c
        |   15 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.h
        |    4 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
        |    6 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c
        |    7 +-
 drivers/gpu/drm/nouveau/include/nvhw/class/cl907d.h
        |    3 +
 drivers/gpu/drm/nouveau/include/nvhw/class/clc57d.h
        |   69 ++
 drivers/gpu/drm/nouveau/nouveau_backlight.c
        |    5 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c
        |    3 +-
 drivers/gpu/drm/nouveau/nouveau_display.c
        |    5 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c
        |   48 +-
 drivers/gpu/drm/nouveau/nvkm/core/client.c
        |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
        |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
        |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigv100.c
        |    1 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
        |    2 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/base.c
        |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
        |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.c
        |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
        |   37 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm200.c
        |   31 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
        |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c
        |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
        |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h
        |    2 +
 drivers/gpu/drm/omapdrm/dss/dispc.c
        |    9 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c
        |   10 +-
 drivers/gpu/drm/omapdrm/dss/dss.c
        |    7 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
        |   14 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
        |   14 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
        |    4 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
        |    5 +-
 drivers/gpu/drm/omapdrm/dss/hdmi_phy.c
        |    5 +-
 drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
        |    4 +-
 drivers/gpu/drm/omapdrm/dss/venc.c
        |    7 +-
 drivers/gpu/drm/omapdrm/dss/video-pll.c
        |    8 +-
 drivers/gpu/drm/omapdrm/omap_dmm_priv.h
        |   10 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
        |   10 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.h
        |   10 +-
 drivers/gpu/drm/omapdrm/tcm-sita.c
        |   10 +-
 drivers/gpu/drm/panel/Kconfig
        |   41 ++
 drivers/gpu/drm/panel/Makefile
        |    4 +
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c
        |   14 +-
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
        |  445 ++++++++++++
 drivers/gpu/drm/panel/panel-dsi-cm.c
        |    4 +-
 drivers/gpu/drm/panel/panel-edp.c
        |    4 +-
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
        |   13 +-
 drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
        |   29 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
        |  265 ++++++-
 drivers/gpu/drm/panel/panel-innolux-ej030na.c
        |   14 +-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c
        |   10 +-
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
        |  323 +++++++++
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
        |    8 +-
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
        |    8 +-
 drivers/gpu/drm/panel/panel-lvds.c
        |   18 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c
        |  702 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c
        |   10 +-
 drivers/gpu/drm/panel/panel-novatek-nt39016.c
        |   20 +-
 drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
        |    8 +-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
        |    8 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
        |   21 +-
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
        |    1 +
 drivers/gpu/drm/panel/panel-samsung-sofef00.c
        |   17 +-
 drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
        |   21 +-
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
        |    8 +-
 drivers/gpu/drm/panel/panel-simple.c
        |   56 ++
 drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
        |  552 ++++++++++++++
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
        |   14 +-
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
        |   25 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c
        |    2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c
        |   20 +-
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
        |    2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c
        |    5 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c
        |    6 +-
 drivers/gpu/drm/radeon/radeon_sync.c
        |   22 +-
 drivers/gpu/drm/radeon/radeon_uvd.c
        |   13 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
        |   82 ++-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c
        |   13 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
        |    3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c
        |   44 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h
        |    7 -
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c
        |    4 +-
 drivers/gpu/drm/scheduler/sched_entity.c
        |   15 +-
 drivers/gpu/drm/scheduler/sched_main.c
        |    6 +-
 drivers/gpu/drm/sun4i/Kconfig
        |    1 +
 drivers/gpu/drm/sun4i/sun4i_drv.c
        |    2 +-
 drivers/gpu/drm/tidss/tidss_drv.c
        |   11 +-
 drivers/gpu/drm/tiny/Kconfig
        |   13 +
 drivers/gpu/drm/tiny/Makefile
        |    1 +
 drivers/gpu/drm/tiny/cirrus.c
        |   24 +-
 drivers/gpu/drm/tiny/ili9163.c
        |  225 ++++++
 drivers/gpu/drm/tiny/repaper.c
        |    2 +-
 drivers/gpu/drm/tiny/simpledrm.c
        |   37 +-
 drivers/gpu/drm/tiny/st7586.c
        |    2 +-
 drivers/gpu/drm/ttm/ttm_bo.c
        |    2 +
 drivers/gpu/drm/v3d/v3d_bo.c
        |   22 +-
 drivers/gpu/drm/v3d/v3d_gem.c
        |    4 +-
 drivers/gpu/drm/vc4/vc4_crtc.c
        |   91 ++-
 drivers/gpu/drm/vc4/vc4_debugfs.c
        |    7 +-
 drivers/gpu/drm/vc4/vc4_drv.h
        |   37 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c
        |  630 +++++++++++++---
 drivers/gpu/drm/vc4/vc4_hdmi.h
        |   37 +
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c
        |   37 +
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h
        |    8 +
 drivers/gpu/drm/vc4/vc4_hvs.c
        |   26 +-
 drivers/gpu/drm/vc4/vc4_kms.c
        |  129 +++-
 drivers/gpu/drm/vc4/vc4_plane.c
        |    5 -
 drivers/gpu/drm/vc4/vc4_txp.c
        |    4 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c
        |    4 +-
 drivers/gpu/drm/virtio/virtgpu_object.c
        |   27 +-
 drivers/gpu/drm/xen/xen_drm_front.c
        |   16 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c
        |  108 ++-
 drivers/gpu/drm/xen/xen_drm_front_gem.h
        |    7 -
 drivers/hv/hv_balloon.c
        |    2 +-
 drivers/infiniband/core/nldev.c
        |    3 +-
 drivers/infiniband/core/verbs.c
        |    3 +
 drivers/infiniband/hw/hfi1/verbs.c
        |    5 +-
 drivers/infiniband/hw/mlx4/main.c
        |   18 +-
 drivers/net/amt.c
        |    2 +-
 drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c
        |   10 +
 drivers/net/ethernet/asix/ax88796c_main.h
        |    6 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h
        |    4 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.h
        |   10 +
 drivers/net/ethernet/broadcom/bnxt/bnxt_devlink.c
        |    9 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c
        |    2 +-
 drivers/net/ethernet/dec/tulip/de4x5.c
        |   34 +-
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
        |    4 +-
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c
        |    4 +
 drivers/net/ethernet/intel/e100.c
        |   18 +-
 drivers/net/ethernet/intel/i40e/i40e.h
        |    2 +
 drivers/net/ethernet/intel/i40e/i40e_main.c
        |  160 +++--
 drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
        |  121 ++--
 drivers/net/ethernet/intel/iavf/iavf.h
        |    1 +
 drivers/net/ethernet/intel/iavf/iavf_ethtool.c
        |   30 +-
 drivers/net/ethernet/intel/iavf/iavf_main.c
        |   55 +-
 drivers/net/ethernet/lantiq_etop.c
        |   20 +-
 drivers/net/ethernet/marvell/mvmdio.c
        |    2 +
 drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
        |   17 +-
 drivers/net/ethernet/mellanox/mlx5/core/cmd.c
        |    4 +-
 drivers/net/ethernet/mellanox/mlx5/core/cq.c
        |    5 +-
 drivers/net/ethernet/mellanox/mlx5/core/debugfs.c
        |    4 +-
 drivers/net/ethernet/mellanox/mlx5/core/en/tc_ct.c
        |   26 +-
 drivers/net/ethernet/mellanox/mlx5/core/en/tc_ct.h
        |    2 +
 drivers/net/ethernet/mellanox/mlx5/core/en/tc_priv.h
        |    1 +
 drivers/net/ethernet/mellanox/mlx5/core/en/tc_tun_encap.c
        |    8 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls_rx.c
        |   23 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
        |   10 +-
 drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
        |   21 +-
 drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
        |    9 +-
 drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c
        |    2 +-
 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c
        |   28 +-
 drivers/net/ethernet/mellanox/mlx5/core/steering/dr_domain.c
        |   56 +-
 drivers/net/ethernet/mellanox/mlx5/core/steering/dr_matcher.c
        |   11 +-
 drivers/net/ethernet/mellanox/mlx5/core/steering/dr_types.h
        |    1 +
 drivers/net/ethernet/sis/sis900.c
        |    2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
        |   24 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
        |   23 +-
 drivers/net/hamradio/6pack.c
        |    1 -
 drivers/net/ipa/ipa_endpoint.c
        |    5 +
 drivers/net/ipa/ipa_resource.c
        |    2 +-
 drivers/net/tun.c
        |    5 +
 drivers/net/usb/r8152.c
        |    9 +-
 drivers/pinctrl/pinctrl-amd.c
        |   29 +-
 drivers/pinctrl/pinctrl-apple-gpio.c
        |   12 +-
 drivers/pinctrl/qcom/Kconfig
        |    2 +
 drivers/pinctrl/qcom/pinctrl-sdm845.c
        |    1 +
 drivers/pinctrl/qcom/pinctrl-sm8350.c
        |    8 +-
 drivers/pinctrl/ralink/pinctrl-mt7620.c
        |    1 +
 drivers/pinctrl/tegra/pinctrl-tegra.c
        |    4 +-
 drivers/pinctrl/tegra/pinctrl-tegra194.c
        |    1 -
 drivers/platform/mellanox/mlxreg-lc.c
        |    5 +-
 drivers/platform/x86/Kconfig
        |    4 +-
 drivers/platform/x86/dell/Kconfig
        |    2 +-
 drivers/platform/x86/hp_accel.c
        |    2 +
 drivers/platform/x86/samsung-laptop.c
        |    2 +-
 drivers/platform/x86/think-lmi.c
        |   13 +-
 drivers/platform/x86/think-lmi.h
        |    1 -
 drivers/platform/x86/thinkpad_acpi.c
        |  150 ++--
 drivers/powercap/dtpm_cpu.c
        |    9 +-
 drivers/ptp/ptp_clockmatrix.c
        |    5 +-
 drivers/ptp/ptp_ocp.c
        |    9 +-
 drivers/pwm/core.c
        |   26 +
 drivers/pwm/pwm-pxa.c
        |   16 +-
 drivers/s390/block/dasd_devmap.c
        |   76 +-
 drivers/s390/char/raw3270.c
        |   12 +-
 drivers/s390/cio/chp.c
        |    2 +-
 drivers/scsi/qla2xxx/qla_mbx.c
        |    6 +-
 drivers/scsi/scsi_sysfs.c
        |   30 +-
 drivers/scsi/scsi_transport_iscsi.c
        |    6 +-
 drivers/scsi/ufs/ufshcd.c
        |    9 +-
 drivers/spi/spi-cadence-quadspi.c
        |   24 +-
 drivers/spi/spi-fsl-lpspi.c
        |    2 +-
 drivers/spi/spi-geni-qcom.c
        |   16 +-
 drivers/spi/spi.c
        |   12 +-
 drivers/thermal/intel/int340x_thermal/Kconfig
        |    4 +-
 drivers/thermal/thermal_core.c
        |    2 +
 drivers/video/console/sticon.c
        |   12 +-
 drivers/video/fbdev/core/fbsysfs.c
        |   14 +-
 drivers/video/fbdev/efifb.c
        |   11 +
 drivers/video/fbdev/omap/omapfb_main.c
        |    1 +
 drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
        |   14 +-
 drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c
        |   18 +-
 drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c
        |   20 +-
 drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
        |   12 +-
 drivers/video/fbdev/simplefb.c
        |   11 +
 fs/attr.c
        |    4 +-
 fs/btrfs/async-thread.c
        |   14 +
 fs/btrfs/disk-io.c
        |   14 +-
 fs/btrfs/ioctl.c
        |    4 +
 fs/btrfs/lzo.c
        |   13 +-
 fs/btrfs/scrub.c
        |    4 +-
 fs/btrfs/volumes.c
        |   18 +-
 fs/cifs/cifs_swn.c
        |   16 +-
 fs/cifs/cifsproto.h
        |    1 +
 fs/cifs/connect.c
        |   16 +-
 fs/cifs/dfs_cache.c
        |    7 +-
 fs/cifs/sess.c
        |   15 +-
 fs/gfs2/bmap.c
        |    2 +-
 fs/gfs2/file.c
        |    9 +-
 fs/gfs2/glock.c
        |   12 +-
 fs/gfs2/super.c
        |   14 +-
 fs/nfsd/nfs4xdr.c
        |    7 +-
 fs/proc/vmcore.c
        |   20 +-
 fs/pstore/Kconfig
        |    1 -
 fs/pstore/blk.c
        |    2 +-
 fs/udf/dir.c
        |   32 +-
 fs/udf/namei.c
        |    3 +
 fs/udf/super.c
        |    2 +
 include/drm/drm_connector.h
        |   55 ++
 include/drm/drm_dp_helper.h
        |   35 +-
 include/drm/drm_drv.h
        |   11 +-
 include/drm/drm_format_helper.h
        |   58 +-
 include/drm/drm_gem_atomic_helper.h
        |   18 +
 include/drm/drm_gem_shmem_helper.h
        |  168 ++++-
 include/drm/drm_mode_config.h
        |   13 +
 include/drm/drm_of.h
        |    7 +
 include/drm/drm_privacy_screen_consumer.h
        |   65 ++
 include/drm/drm_privacy_screen_driver.h
        |   84 +++
 include/drm/drm_privacy_screen_machine.h
        |   46 ++
 include/drm/drm_probe_helper.h
        |    1 +
 include/drm/drm_sysfs.h
        |    1 +
 include/drm/gpu_scheduler.h
        |   12 +-
 include/drm/intel-gtt.h
        |    8 +-
 include/linux/acpi.h
        |    9 +
 include/linux/bpf.h
        |    3 +-
 include/linux/dma-buf.h
        |    4 +-
 include/linux/dma-fence.h
        |    1 +
 include/linux/dma-resv.h
        |   27 +-
 include/linux/hugetlb_cgroup.h
        |   12 +
 include/linux/ipc_namespace.h
        |   15 +
 include/linux/kvm_host.h
        |    6 +-
 include/linux/kvm_types.h
        |    7 -
 include/linux/mlx5/eswitch.h
        |    4 +-
 include/linux/mm_types.h
        |   13 +-
 include/linux/percpu.h
        |    1 -
 include/linux/printk.h
        |    4 +
 include/linux/pwm.h
        |    2 +
 include/linux/sched/signal.h
        |    1 +
 include/linux/sched/task.h
        |    2 +-
 include/linux/sdb.h
        |  160 -----
 include/linux/skbuff.h
        |    2 +-
 include/linux/trace_events.h
        |    2 +-
 include/linux/virtio_net.h
        |    7 +-
 include/net/nfc/nci_core.h
        |    1 +
 include/net/page_pool.h
        |   12 +-
 include/rdma/rdma_netlink.h
        |    2 +-
 init/Kconfig
        |    2 +-
 ipc/shm.c
        |  189 +++--
 ipc/util.c
        |    6 +-
 kernel/bpf/cgroup.c
        |    2 +
 kernel/bpf/helpers.c
        |    2 -
 kernel/bpf/syscall.c
        |   57 +-
 kernel/bpf/verifier.c
        |   27 +-
 kernel/entry/syscall_user_dispatch.c
        |    4 +-
 kernel/printk/printk.c
        |    5 +
 kernel/signal.c
        |   36 +-
 kernel/trace/bpf_trace.c
        |    2 -
 kernel/trace/trace.c
        |   16 +-
 kernel/trace/trace_events_hist.c
        |   50 +-
 lib/nmi_backtrace.c
        |    6 +
 lib/test_kasan.c
        |    2 +
 lib/zstd/Makefile
        |    2 -
 lib/zstd/common/compiler.h
        |    7 +
 lib/zstd/compress/zstd_compress_superblock.c
        |    2 +
 lib/zstd/compress/zstd_opt.c
        |   12 +
 mm/Kconfig
        |    3 +
 mm/damon/dbgfs.c
        |   20 +-
 mm/highmem.c
        |   32 +-
 mm/hugetlb.c
        |   11 +-
 mm/slab.c
        |    3 +-
 mm/slab.h
        |    2 +-
 mm/slob.c
        |    3 +-
 mm/slub.c
        |    2 +-
 mm/swap.c
        |    1 +
 net/core/devlink.c
        |    4 +-
 net/core/filter.c
        |    6 +
 net/core/page_pool.c
        |   10 +-
 net/core/sock.c
        |    6 +-
 net/ipv4/bpf_tcp_ca.c
        |    2 +
 net/ipv4/devinet.c
        |    2 +-
 net/ipv4/tcp.c
        |    3 +
 net/ipv4/udp.c
        |   11 +
 net/ipv6/esp6.c
        |    6 +
 net/mac80211/cfg.c
        |   12 +-
 net/mac80211/iface.c
        |    4 +-
 net/mac80211/led.h
        |    8 +-
 net/mac80211/rx.c
        |   12 +-
 net/mac80211/tx.c
        |   34 +-
 net/mac80211/util.c
        |    7 +-
 net/mac80211/wme.c
        |    3 +-
 net/nfc/core.c
        |   32 +-
 net/nfc/nci/core.c
        |   30 +-
 net/sched/act_mirred.c
        |   11 +-
 net/smc/af_smc.c
        |   14 +
 net/smc/smc_core.c
        |    3 +-
 net/tipc/crypto.c
        |   12 +-
 net/tipc/link.c
        |    7 +-
 net/wireless/nl80211.c
        |   34 +-
 net/wireless/nl80211.h
        |    6 +-
 net/wireless/util.c
        |    1 +
 net/xdp/xsk_buff_pool.c
        |    7 +-
 samples/Kconfig
        |   11 +-
 samples/Makefile
        |    2 +-
 samples/bpf/hbm_kern.h
        |    2 -
 samples/bpf/xdp_redirect_cpu_user.c
        |    5 +-
 samples/bpf/xdp_sample_user.c
        |   28 +-
 samples/ftrace/Makefile
        |    2 +-
 samples/ftrace/ftrace-direct-multi.c
        |   30 +
 tools/arch/x86/include/asm/cpufeatures.h
        |    2 +
 tools/arch/x86/include/uapi/asm/kvm.h
        |    4 +
 tools/bpf/runqslower/Makefile
        |    3 +-
 tools/build/feature/test-all.c
        |    1 -
 tools/include/uapi/linux/kvm.h
        |   30 +-
 tools/lib/bpf/bpf_gen_internal.h
        |    4 +-
 tools/lib/bpf/gen_loader.c
        |   47 +-
 tools/lib/bpf/libbpf.c
        |    4 +-
 tools/perf/Makefile.config
        |    3 +
 tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
        |    1 +
 tools/perf/bench/sched-messaging.c
        |    4 +
 tools/perf/builtin-report.c
        |   15 +-
 tools/perf/tests/event_update.c
        |    5 +-
 tools/perf/tests/sample-parsing.c
        |    2 +-
 tools/perf/tests/wp.c
        |    2 +-
 tools/perf/ui/hist.c
        |   28 +-
 tools/perf/util/arm-spe.c
        |   15 +
 tools/perf/util/evsel.c
        |   18 +-
 tools/perf/util/header.c
        |    8 +-
 tools/perf/util/hist.c
        |   23 +-
 tools/perf/util/hist.h
        |    1 -
 tools/perf/util/parse-events.c
        |    9 +-
 tools/perf/util/sort.c
        |   52 +-
 tools/perf/util/sort.h
        |    6 +-
 tools/perf/util/util.c
        |   14 +-
 tools/perf/util/util.h
        |    2 +-
 tools/testing/selftests/bpf/Makefile
        |    2 +-
 tools/testing/selftests/bpf/prog_tests/helper_restricted.c
        |   33 +
 tools/testing/selftests/bpf/progs/test_helper_restricted.c
        |  123 ++++
 tools/testing/selftests/bpf/test_verifier.c
        |   46 +-
 tools/testing/selftests/bpf/verifier/helper_restricted.c
        |  196 +++++
 tools/testing/selftests/bpf/verifier/map_in_map.c
        |   34 +
 tools/testing/selftests/gpio/Makefile
        |    1 +
 tools/testing/selftests/gpio/gpio-mockup-cdev.c
        |    2 +-
 tools/testing/selftests/kvm/.gitignore
        |    1 +
 tools/testing/selftests/kvm/access_tracking_perf_test.c
        |   54 +-
 tools/testing/selftests/kvm/demand_paging_test.c
        |   56 +-
 tools/testing/selftests/kvm/dirty_log_perf_test.c
        |   29 +-
 tools/testing/selftests/kvm/dirty_log_test.c
        |    6 +-
 tools/testing/selftests/kvm/include/perf_test_util.h
        |   23 +-
 tools/testing/selftests/kvm/include/test_util.h
        |   26 +
 tools/testing/selftests/kvm/kvm_page_table_test.c
        |    2 +-
 tools/testing/selftests/kvm/lib/elf.c
        |    3 +-
 tools/testing/selftests/kvm/lib/kvm_util.c
        |   44 +-
 tools/testing/selftests/kvm/lib/perf_test_util.c
        |  184 +++--
 tools/testing/selftests/kvm/lib/test_util.c
        |    5 +
 tools/testing/selftests/kvm/memslot_modification_stress_test.c
        |   38 +-
 tools/testing/selftests/kvm/x86_64/xen_shinfo_test.c
        |   75 +-
 tools/testing/selftests/net/forwarding/config
        |    1 +
 tools/testing/selftests/net/forwarding/tc_actions.sh
        |   47 +-
 tools/testing/selftests/net/gre_gso.sh
        |   16 +-
 virt/kvm/kvm_main.c
        |  100 +--
 802 files changed, 20680 insertions(+), 13354 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/bridge/nxp,ptn3460.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ptn346=
0.txt
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/sii923=
4.txt
 create mode 100644
Documentation/devicetree/bindings/display/bridge/sil,sii9234.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/edp.txt
 create mode 100644
Documentation/devicetree/bindings/display/panel/boe,bf060y8m-aj0.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.ya=
ml
 delete mode 100644 arch/hexagon/include/asm/timer-regs.h
 create mode 100644 arch/hexagon/kernel/.gitignore
 create mode 100644 drivers/dma-buf/st-dma-resv.c
 create mode 100644 drivers/gpu/drm/drm_privacy_screen.c
 create mode 100644 drivers/gpu/drm/drm_privacy_screen_x86.c
 create mode 100644 drivers/gpu/drm/i915/display/icl_dsi.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dsi_vbt.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_pch_display.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_pch_display.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_pch_refclk.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_pch_refclk.h
 create mode 100644 drivers/gpu/drm/i915/display/vlv_dsi.h
 create mode 100644 drivers/gpu/drm/i915/display/vlv_dsi_pll.h
 rename drivers/gpu/drm/i915/{i915_drv.c =3D> i915_driver.c} (97%)
 create mode 100644 drivers/gpu/drm/i915/i915_driver.h
 create mode 100644 drivers/gpu/drm/i915/i915_iosf_mbi.h
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_cvbs.c
 rename drivers/gpu/drm/meson/{meson_venc_cvbs.h =3D> meson_encoder_cvbs.h}=
 (92%)
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.h
 delete mode 100644 drivers/gpu/drm/meson/meson_venc_cvbs.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.xml.h
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_aux.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_bridge.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_connector.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_phy.c
 rename drivers/gpu/drm/msm/hdmi/{hdmi_connector.c =3D> hdmi_hpd.c} (62%)
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcc37d.h
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
 create mode 100644 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
 create mode 100644 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt35950.c
 create mode 100644 drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
 create mode 100644 drivers/gpu/drm/tiny/ili9163.c
 create mode 100644 include/drm/drm_privacy_screen_consumer.h
 create mode 100644 include/drm/drm_privacy_screen_driver.h
 create mode 100644 include/drm/drm_privacy_screen_machine.h
 delete mode 100644 include/linux/sdb.h
 create mode 100644 tools/testing/selftests/bpf/prog_tests/helper_restricte=
d.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_helper_restricte=
d.c
 create mode 100644 tools/testing/selftests/bpf/verifier/helper_restricted.=
c
