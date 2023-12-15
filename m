Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317CF815372
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 23:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8748B10EA99;
	Fri, 15 Dec 2023 22:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6D210EA7B;
 Fri, 15 Dec 2023 22:20:32 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-54c77e0835bso1412815a12.2; 
 Fri, 15 Dec 2023 14:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702678830; x=1703283630; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XjAPaK0+Gbm9oV9IZbKgFxQVkUmOdopkD1tm+YhL+/s=;
 b=IfI9t7XoRZzM8mfrTuqlM3Ysj6KRS+UUbmIGkXIgnY5mh78yfoCxgj/6m8sS8dwLUw
 YVDIxby1EdqJnyqBL8XpFsWKmanHfdt6nmWsHLJgv3d5bqFYzlgrEDDYrrvGyAl/qtj6
 r12ttFyRluVnaGT6zLni/IHuZfcUwB8Kp8pI2Hxxd/BJm4O5AGepxRw2Scn80OzMmcMN
 qtl9gd01uCwhrfmlxWM86wJlVTV1sQ3PvmMIlhXc0IpGJTL6FafvVykRoaACJVKxxQ3e
 kUin7I+3e3BHDZuM2kgLLCXYHhTyTlYxXCzhjxsFF+BHSEKxKVOE0hpMdMFt1ZjVSBAZ
 K6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702678830; x=1703283630;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XjAPaK0+Gbm9oV9IZbKgFxQVkUmOdopkD1tm+YhL+/s=;
 b=jNAmPam4uvDHfSKLCldzJNTzaioatXJVQXQvTuUukg/hmnMYhKoIY22Rn0ef6/suhZ
 zwYqiz7NwULx8x6dv6DEpuvRW6Mzsv4HNhVLlgRlhAtQ60sbxnqvhoUGrCU2h2F+IgyV
 IURwkQCH1oidOT08QKgw8tvJNj+q3XoEqqbP/gkAyESNxlcswYO3ijOPjJywGELtSsU4
 +Qx7adGM+SYJWh0v+KnjAoyy5i+Wa3Q+6B/3Hu7eOOJmZXEsJp2Z3q5Wr8/EpGsxtiwB
 faI63qLB7cH3X30sOqtV4uSSal+6P97cUmN+XLuoerNUM3/K0csS2GVkO9SRtQPvUOCB
 Ftgg==
X-Gm-Message-State: AOJu0Ywcxsy4locmMOThlM2eN2Pn3v9NH4r9eUF7P5LdR18kktcHMq4Z
 YSHWZrqjlG9cp3j8wkoal/YjjpQnlRM20oWgMA8=
X-Google-Smtp-Source: AGHT+IHW9eb1EFg0wr0C1n6PBWsXVj87VQ+R52r/CSPK5OpG4P2Z56YQDHXmLkjBymjkV8z5ZCgYXyf0ZUq7H+LpbJA=
X-Received: by 2002:a50:aad0:0:b0:551:d59d:52c8 with SMTP id
 r16-20020a50aad0000000b00551d59d52c8mr2707113edc.37.1702678829810; Fri, 15
 Dec 2023 14:20:29 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 15 Dec 2023 14:20:16 -0800
Message-ID: <CAF6AEGs9auYqmo-7NSd9FsbNBCDf7aBevd=4xkcF3A5G_OGvMQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2023-12-15 for v6.8
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
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

This is the pull for v6.8, see below for description.  Sorry the
git-request-pull output looks a bit strange, I had to backmerge
drm-misc-next mid-way thru so everything merged between v6.7-rc1 and
-rc3 shows up.  The real diffstat is somewhat smaller than that.

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86=
:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2023-12-15

for you to fetch changes up to d4ca26ac4be0d9aea7005c40df75e6775749671b:

  drm/msm/dp: call dp_display_get_next_bridge() during probe
(2023-12-14 09:27:46 +0200)

----------------------------------------------------------------
Updates for v6.8:

Core:
- Add support for SDM670, SM8650
- Handle the CFG interconnect to fix the obscure hangs / timeouts
  on register write
- Kconfig fix for QMP dependency
- DT schema fixes

DPU:
- Add support for SDM670, SM8650
- Enable SmartDMA on SM8350 and SM8450
- Correct UBWC settings for SC8280XP
- Fix catalog settings for SC8180X
- Actually make use of the version to switch between QSEED3/3LITE/4
  scalers
- Use devres-managed and drm-managed allocations where appropriate
- misc other fixes
- Enabled YUV writeback on SC7280, SM8250
- Enabled writeback on SM8350, SM8450
- CRC fix when encoder is selected as the input source
- other misc fixes

MDP4:
- Use devres-managed and drm-managed allocations where appropriate
- flush vblank event on CRTC disable

MDP5:
- Use devres-managed and drm-managed allocations where appropriate

DP:
- Add support for SM8650
- Enable PM runtime support
- Merge msm-specific debugfs dir with the generic one
- Described DisplayPort on SM8150 in DeviceTree bindings
- Moved dp_display_get_next_bridge() to probe()

DSI:
- Add support for SM8650
- Enable PM runtime support

GPU/GEM:
- demote userspace triggerable warnings to debug
- add GEM object metadata UAPI
- move GPU devcoredumps to GPU device
- fix hangcheck to skip retired submits
- expose UBWC config to userspace
- fix a680 chip-id
- drm_exec conversion
- drm/ci: remove rebase-merge directory (to unblock CI)

----------------------------------------------------------------
Abel Vesa (2):
      drm/msm/dp: don't touch DP subconnector property in eDP case
      drm/panel-edp: Add SDC ATNA45AF01

Abel Wu (1):
      sched/eevdf: Fix vruntime adjustment on reweight

Abhinav Kumar (19):
      drm/msm/dpu: try multirect based on mdp clock limits
      drm/msm/dpu: enable smartdma on sm8350
      drm: improve the documentation of connector hpd ops
      drm: remove drm_bridge_hpd_disable() from drm_bridge_connector_destro=
y()
      drm/msm/dpu: add formats check for writeback encoder
      drm/msm/dpu: rename dpu_encoder_phys_wb_setup_cdp to match its
functionality
      drm/msm/dpu: fix writeback programming for YUV cases
      drm/msm/dpu: move csc matrices to dpu_hw_util
      drm/msm/dpu: add cdm blocks to sc7280 dpu_hw_catalog
      drm/msm/dpu: add cdm blocks to sm8250 dpu_hw_catalog
      drm/msm/dpu: add dpu_hw_cdm abstraction for CDM block
      drm/msm/dpu: add cdm blocks to RM
      drm/msm/dpu: add support to allocate CDM from RM
      drm/msm/dpu: add CDM related logic to dpu_hw_ctl layer
      drm/msm/dpu: add an API to setup the CDM block for writeback
      drm/msm/dpu: plug-in the cdm related bits to writeback setup
      drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output
      drm/msm/dpu: introduce separate wb2_format arrays for rgb and yuv
      drm/msm/dpu: add cdm blocks to dpu snapshot

Abhinav Singh (1):
      drm/nouveau/fence:: fix warning directly dereferencing a rcu pointer

Ajit Pal Singh (1):
      accel/qaic: Add support for periodic timesync

Alex Bee (1):
      dt-bindings: gpu: mali-utgard: Add Rockchip RK3128 compatible

Alex Deucher (5):
      drm/amdgpu/gmc11: fix logic typo in AGP check
      drm/amdgpu: add a module parameter to control the AGP aperture
      drm/amdgpu/gmc11: disable AGP aperture
      drm/amdgpu/gmc10: disable AGP aperture
      drm/amdgpu/gmc9: disable AGP aperture

Alex Elder (1):
      net: ipa: fix one GSI register field width

Alex Pakhunov (2):
      tg3: Move the [rt]x_dropped counters to tg3_napi
      tg3: Increment tx_dropped in tg3_tso_bug()

Alexander Stein (1):
      usb: dwc3: Fix default mode initialization

Alexei Starovoitov (2):
      Merge branch 'bpf-control-flow-graph-and-precision-backtrack-fixes'
      Merge branch
'verify-callbacks-as-if-they-are-called-unknown-number-of-times'

Amir Goldstein (2):
      ovl: fix misformatted comment
      ovl: fix memory leak in ovl_parse_param()

Anastasia Belova (1):
      cifs: spnego: add ';' in HOST_KEY_LEN

Anders Roxell (1):
      selftests: bpf: xskxceiver: ksft_print_msg: fix format type error

Andrew Davis (1):
      drm/omapdrm: Improve check for contiguous buffers

Andrii Nakryiko (5):
      bpf: handle ldimm64 properly in check_cfg()
      bpf: fix precision backtracking instruction iteration
      selftests/bpf: add edge case backtracking logic test
      bpf: fix control-flow graph checking in privileged mode
      selftests/bpf: add more test cases for check_cfg()

Andrzej Hajda (1):
      drm/i915: do not clean GT table on error path

Andrzej Kacprowski (4):
      accel/ivpu: Add support for VPU_JOB_FLAGS_NULL_SUBMISSION_MASK
      accel/ivpu/40xx: Capture D0i3 entry host and device timestamps
      accel/ivpu: Pass D0i3 residency time to the VPU firmware
      accel/ivpu: Add support for delayed D0i3 entry message

Andr=C3=A9 Almeida (1):
      drm: Refuse to async flip with atomic prop changes

Andy Shevchenko (10):
      platform/x86: intel_telemetry: Fix kernel doc descriptions
      drm/i915/dsi: Replace while(1) with one with clear exit condition
      drm/i915/dsi: Get rid of redundant 'else'
      drm/i915/dsi: Replace check with a (missing) MIPI sequence name
      drm/i915/dsi: Extract common soc_gpio_set_value() helper
      drm/i915/dsi: Replace poking of VLV GPIOs behind the driver's back
      drm/i915/dsi: Prepare soc_gpio_set_value() to distinguish GPIO commun=
ities
      drm/i915/dsi: Replace poking of CHV GPIOs behind the driver's back
      drm/i915/dsi: Combine checks in mipi_exec_gpio()
      drm/i915/iosf: Drop unused APIs

AngeloGioacchino Del Regno (10):
      drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()
      drm/panfrost: Perform hard reset to recover GPU if soft reset fails
      drm/panfrost: Tighten polling for soft reset and power on
      drm/panfrost: Implement ability to turn on/off GPU clocks in suspend
      drm/panfrost: Set clocks on/off during system sleep on MediaTek SoCs
      drm/panfrost: Implement ability to turn on/off regulators in suspend
      drm/panfrost: Set regulators on/off during system sleep on MediaTek S=
oCs
      drm/panfrost: Ignore core_mask for poweroff and disable PWRTRANS irq
      drm/panfrost: Add gpu_irq, mmu_irq to struct panfrost_device
      drm/panfrost: Synchronize and disable interrupts before powering off

Ani Sinha (1):
      hv/hv_kvp_daemon: Some small fixes for handling NM keyfiles

Animesh Manna (6):
      drm/panelreplay: dpcd register definition for panelreplay
      drm/i915/panelreplay: Initializaton and compute config for panel repl=
ay
      drm/i915/panelreplay: Enable panel replay dpcd initialization for DP
      drm/i915/panelreplay: enable/disable panel replay
      drm/i915/panelreplay: Debugfs support for panel replay
      drm/i915/dsb: DSB code refactoring

Ankit Nautiyal (5):
      drm/display/dp: Add helper function to get DSC bpp precision
      drm/i915/display: Store compressed bpp in U6.4 format
      drm/i915/display: Consider fractional vdsc bpp while computing m_n va=
lues
      drm/i915/audio: Consider fractional vdsc bpp while computing tu_data
      drm/i915/dp: Iterate over output bpp with fractional step size

Anthony Iliopoulos (1):
      xfs: fix again select in kconfig XFS_ONLINE_SCRUB_STATS

Aoba K (1):
      HID: multitouch: Add quirk for HONOR GLO-GXXX touchpad

Aradhya Bhatia (2):
      dt-bindings: display: ti: Add support for am62a7 dss
      drm/tidss: Add support for AM62A7 DSS

Arkadiusz Kubalewski (3):
      ice: dpll: fix initial lock status of dpll
      ice: dpll: fix check for dpll input priority range
      ice: dpll: fix output pin capabilities

Arnd Bergmann (9):
      accel/ivpu: avoid build failure with CONFIG_PM=3Dn
      stackleak: add declarations for global functions
      accel/ivpu: avoid build failure with CONFIG_PM=3Dn
      drm/rockchip: rk3066_hdmi: include drm/drm_atomic.h
      nvme: target: fix nvme_keyring_id() references
      nvme: target: fix Kconfig select statements
      nvme: tcp: fix compile-time checks for TLS mode
      drm/msm/a6xx: add QMP dependency
      drm/imagination: move update_logtype() into ifdef section

Arseniy Krasnov (1):
      vsock/test: fix SEQPACKET message bounds test

Asad Kamal (2):
      drm/amd/pm: Update metric table for smu v13_0_6
      drm/amd/pm: Fill pcie error counters for gpu v1_4

Asuna Yang (1):
      USB: serial: option: add Luat Air72*U series products

Badhri Jagan Sridharan (2):
      usb: typec: tcpm: Skip hard reset when in error recovery
      usb: typec: tcpm: Fix sink caps op current check

Bagas Sanjaya (1):
      x86/Documentation: Indent 'note::' directive for protocol
version number note

Baruch Siach (2):
      net: stmmac: fix rx budget limit check
      net: stmmac: avoid rx queue overrun

Bert Karwatzki (1):
      drm/sched: Partial revert of "Qualify drm_sched_wakeup() by
drm_sched_entity_is_ready()"

Bibo Mao (1):
      LoongArch: Implement constant timer shutdown interface

Bjorn Andersson (3):
      drm/msm/dpu: Add missing safe_lut_tbl in sc8280xp catalog
      drm/msm/dpu: Add missing safe_lut_tbl in sc8180x catalog
      drm/msm/adreno: Fix A680 chip id

Bj=C3=B6rn T=C3=B6pel (1):
      riscv, qemu_fw_cfg: Add support for RISC-V architecture

Bob Peterson (1):
      Remove myself as maintainer of GFS2

Boris Brezillon (1):
      drm/gpuvm: Let drm_gpuvm_bo_put() report when the vm_bo object
is destroyed

Boris Burkov (1):
      btrfs: make OWNER_REF_KEY type value smallest among inline refs

Borislav Petkov (AMD) (2):
      x86/microcode: Remove the driver announcement and version
      x86/microcode: Rework early revisions reporting

Breno Leitao (2):
      selftests/mm: restore number of hugepages
      selftests/mm: add hugetlb_fault_after_madv to .gitignore

Brenton Simpson (1):
      drm: panel-orientation-quirks: Add quirk for Lenovo Legion Go

Brett Raye (1):
      HID: glorious: fix Glorious Model I HID report

Carl Vanderlip (4):
      accel/qaic: Enable 1 MSI fallback mode
      accel/qaic: Quiet array bounds check on DMA abort message
      accel/qaic: Increase number of in_reset states
      accel/qaic: Expand DRM device lifecycle

Chaitanya Kumar Borah (1):
      drm/i915/mtl: Support HBR3 rate with C10 phy and eDP in MTL

Chandradeep Dey (1):
      ALSA: hda/realtek - Enable internal speaker of ASUS K6500ZC

Charles Mirabile (1):
      io_uring/fs: consider link->flags when getting path for LINKAT

Charles Yi (1):
      HID: fix HID device resource race between HID core and debugging supp=
ort

Chen Ni (1):
      ata: pata_isapnp: Add missing error check for devm_ioport_map()

Chen Yu (1):
      tools/power/turbostat: Enable the C-state Pre-wake printing

Chengming Zhou (1):
      block/null_blk: Fix double blk_mq_start_request() warning

Chris Morgan (14):
      dt-bindings: display: nv3051d: Update NewVision NV3051D compatibles
      drm/panel: nv3051d: Hold panel in reset for unprepare
      drm/panel: nv3051d: Add Powkiddy RK2023 Panel Support
      drm/panel-elida-kd35t133: trival: update panel size from 5.5 to 3.5
      drm/panel-elida-kd35t133: hold panel in reset for unprepare
      drm/panel-elida-kd35t133: drop drm_connector_set_orientation_from_pan=
el
      drm/panel-elida-kd35t133: Drop shutdown logic
      drm/panel-elida-kd35t133: Drop prepare/unprepare logic
      drm/panel: himax-hx8394: Drop prepare/unprepare tracking
      drm/panel: himax-hx8394: Drop shutdown logic
      dt-bindings: display: Document Himax HX8394 panel rotation
      drm/panel: himax-hx8394: Add Panel Rotation Support
      dt-bindings: display: himax-hx8394: Add Powkiddy X55 panel
      drm/panel: himax-hx8394: Add Support for Powkiddy X55 panel

Christian K=C3=B6nig (1):
      dma-buf: add dma_fence_timestamp helper

Christoph Hellwig (7):
      xfs: only remap the written blocks in xfs_reflink_end_cow_extent
      blk-mq: make sure active queue usage is held for bio_integrity_prep()
      filemap: add a per-mapping stable writes flag
      block: update the stable_writes flag in bdev_add
      xfs: clean up FS_XFLAG_REALTIME handling in xfs_ioctl_setattr_xflags
      xfs: respect the stable writes flag on the RT device
      nvmet: nul-terminate the NQNs passed in the connect command

Christophe JAILLET (1):
      USB: typec: tps6598x: Fix a memory leak in an error handling path

Chuck Lever (4):
      NFSD: Update nfsd_cache_append() to use xdr_stream
      NFSD: Fix "start of NFS reply" pointer passed to nfsd_cache_update()
      NFSD: Fix checksum mismatches in the duplicate reply cache
      libfs: getdents() should return 0 after reaching EOD

ChunHao Lin (2):
      r8169: add handling DASH when DASH is disabled
      r8169: fix network lost after resume on DASH systems

Chunfeng Yun (1):
      usb: xhci-mtk: fix in-ep's start-split check failure

Colin Ian King (2):
      bcache: remove redundant assignment to variable cur_idx
      drm/imagination: Fix a couple of spelling mistakes in literal strings

Coly Li (5):
      bcache: avoid oversize memory allocation by small stripe_size
      bcache: check return value from btree_node_alloc_replacement()
      bcache: replace a mistaken IS_ERR() by IS_ERR_OR_NULL() in
btree_gc_coalesce()
      bcache: add code comments for bch_btree_node_get() and
__bch_btree_node_alloc()
      bcache: avoid NULL checking to c->root in run_cache_set()

Cong Yang (1):
      drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02 panel HFP and H=
BP

Connor Abbott (2):
      drm/msm: Refactor UBWC config setting
      drm/msm: Add param for the highest bank bit

D. Wythe (1):
      net/smc: avoid data corruption caused by decline

Damien Le Moal (1):
      block: Remove blk_set_runtime_active()

Dan Carpenter (16):
      vhost-vdpa: fix use after free in vhost_vdpa_probe()
      btrfs: directly return 0 on no error code in btrfs_insert_raid_extent=
()
      scsi: scsi_debug: Fix some bugs in sdebug_error_write()
      scsi: scsi_debug: Delete some bogus error checking
      netfilter: nf_tables: fix pointer math issue in nft_byteorder_eval()
      nouveau/gsp/r535: uninitialized variable in r535_gsp_acpi_mux_id()
      nouveau/gsp/r535: Fix a NULL vs error pointer bug
      mm/damon/sysfs: eliminate potential uninitialized variable warning
      drm/msm: remove unnecessary NULL check
      drm/imagination: Fix error codes in pvr_device_clk_init()
      drm/imagination: Fix IS_ERR() vs NULL bug in pvr_request_firmware()
      drm/imagination: fix off by one in pvr_vm_mips_init() error handling
      drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
      drm/bridge: nxp-ptn3460: simplify some error checking
      drm/msm/dp: Fix platform_get_irq() check
      drm/imagination: Move dereference after NULL check in
pvr_mmu_backing_page_init()

Dan Nowlin (1):
      ice: fix DDP package download for packages without signature segment

Daniel Borkmann (6):
      net, vrf: Move dstats structure to core
      net: Move {l,t,d}stats allocation to core and convert veth & vrf
      netkit: Add tstats per-CPU traffic counters
      bpf, netkit: Add indirect call wrapper for fetching peer dev
      selftests/bpf: De-veth-ize the tc_redirect test case
      selftests/bpf: Add netkit to tc_redirect selftest

Daniel J Blueman (1):
      bcachefs: Fix potential sleeping during mount

Daniel Vetter (6):
      Merge tag 'drm-misc-fixes-2023-11-16' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-6.7-2023-11-17' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-next-2023-11-17' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-misc-next-2023-11-23' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-2023-11-23' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge v6.7-rc3 into drm-next

Danilo Krummrich (20):
      drm/sched: implement dynamic job-flow control
      drm/gpuvm: convert WARN() to drm_WARN() variants
      drm/gpuvm: don't always WARN in drm_gpuvm_check_overflow()
      drm/gpuvm: export drm_gpuvm_range_valid()
      drm/nouveau: make use of drm_gpuvm_range_valid()
      drm/gpuvm: add common dma-resv per struct drm_gpuvm
      drm/nouveau: make use of the GPUVM's shared dma-resv
      drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
      drm/nouveau: separately allocate struct nouveau_uvmm
      drm/gpuvm: reference count drm_gpuvm structures
      drm/gpuvm: add an abstraction for a VM / BO combination
      drm/gpuvm: track/lock/validate external/evicted objects
      drm/nouveau: use GPUVM common infrastructure
      drm/nouveau: implement 1:1 scheduler - entity relationship
      drm/nouveau: enable dynamic job-flow control
      drm/imagination: vm: prevent duplicate drm_gpuvm_bo instances
      drm/imagination: vm: check for drm_gpuvm_range_valid()
      drm/imagination: vm: fix drm_gpuvm reference count
      drm/gpuvm: fall back to drm_exec_lock_obj()
      drm/imagination: vm: make use of GPUVM's drm_exec helper

Danylo Piliaiev (2):
      drm/msm/a6xx: Add missing BIT(7) to REG_A6XX_UCHE_CLIENT_PF
      drm/msm/a690: Fix reg values for a690

Dapeng Mi (1):
      perf/x86/intel: Correct incorrect 'or' operation for PMU capabilities

Dario Binacchi (2):
      drm/panel: nt35510: fix typo
      drm/bridge: Fix typo in post_disable() description

Darrick J. Wong (2):
      xfs: clean up dqblk extraction
      xfs: dquot recovery does not validate the recovered dquot

Dave Airlie (6):
      nouveau: use an rwlock for the event lock.
      nouveau: don't fail driver load if no display hw present.
      nouveau/gsp: allocate enough space for all channel ids.
      Merge tag 'drm-msm-fixes-2023-11-21' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'drm-misc-fixes-2023-11-23' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2023-11-23' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Dave Chinner (2):
      xfs: inode recovery does not validate the recovered inode
      xfs: recovery should not clear di_flushiter unconditionally

David Howells (8):
      rxrpc: Fix some minor issues with bundle tracing
      rxrpc: Fix RTT determination to use any ACK as a source
      rxrpc: Defer the response to a PING ACK until we've parsed it
      afs: Fix afs_server_list to be cleaned up with RCU
      afs: Make error on cell lookup failure consistent with OpenAFS
      afs: Return ENOENT if no cell DNS record can be found
      afs: Fix file locking on R/O volumes to operate in local mode
      afs: Mark a superblock for an R/O or Backup volume as SB_RDONLY

David S. Miller (2):
      Merge branch 'hns3-fixes'
      Merge branch 'rxrpc-ack-fixes'

David Woodhouse (2):
      ACPI: processor_idle: use raw_safe_halt() in acpi_idle_play_dead()
      PM: tools: Fix sleepgraph syntax error

Denis Benato (2):
      HID: hid-asus: add const to read-only outgoing usb buffer
      HID: hid-asus: reset the backlight brightness level on resume

Dmitry Baryshkov (72):
      drm/msm: remove exra drm_kms_helper_poll_init() call
      drm/msm/dp: attach the DP subconnector property
      drm/msm: don't create GPU-related debugfs files with no GPU present
      drm/msm/dpu: enable SmartDMA on SM8450
      drm/msm/dp: cleanup debugfs handling
      drm/msm/mdp5: use devres-managed allocation for configuration data
      drm/msm/mdp5: use devres-managed allocation for CTL manager data
      drm/msm/mdp5: use devres-managed allocation for mixer data
      drm/msm/mdp5: use devres-managed allocation for pipe data
      drm/msm/mdp5: use devres-managed allocation for SMP data
      drm/msm/mdp5: use devres-managed allocation for INTF data
      drm/msm/mdp5: use drmm-managed allocation for mdp5_crtc
      drm/msm/mdp5: use drmm-managed allocation for mdp5_encoder
      drm/msm/mdp4: use bulk regulators API for LCDC encoder
      drm/msm/mdp4: use drmm-managed allocation for mdp4_crtc
      drm/msm/mdp4: use drmm-managed allocation for mdp4_dsi_encoder
      drm/msm/mdp4: use drmm-managed allocation for mdp4_dtv_encoder
      drm/msm/mdp4: use drmm-managed allocation for mdp4_lcdc_encoder
      drm/msm/mdp4: flush vblank event on disable
      drm/drv: propagate errors from drm_modeset_register_all()
      drm/bridge: add transparent bridge helper
      phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
      usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
      drm/bridge: implement generic DP HPD bridge
      soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
      usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
      drm/encoder: register per-encoder debugfs dir
      drm/bridge: migrate bridge_chains to per-encoder file
      Revert "drm/atomic: Loosen FB atomic checks"
      Revert "drm/atomic: Move framebuffer checks to helper"
      Revert "drm/atomic: Add solid fill data to plane state dump"
      Revert "drm/atomic: Add pixel source to plane state dump"
      Revert "drm: Add solid fill pixel source"
      Revert "drm: Introduce solid fill DRM plane property"
      Revert "drm: Introduce pixel_source DRM plane property"
      drm/msm/dpu: populate SSPP scaler block version
      drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
      drm/msm/dpu: drop the `smart_dma_priority' field from struct
dpu_sspp_sub_blks
      drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
      drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
      drm/msm/dpu: rewrite scaler and CSC presense checks
      drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3, QSEED3LITE, QSEED4
      drm/msm/gpu: drop duplicating VIG feature masks
      drm/msm/mdss: switch mdss to use devm_of_icc_get()
      drm/msm/mdss: inline msm_mdss_icc_request_bw()
      drm/msm/mdss: Handle the reg bus ICC path
      drm/atomic: add private obj state to state dump
      drm/msm/dpu: cleanup dpu_kms_hw_init error path
      drm/msm/dpu: remove IS_ERR_OR_NULL for dpu_hw_intr_init() error handl=
ing
      drm/msm/dpu: use devres-managed allocation for interrupts data
      drm/msm/dpu: use devres-managed allocation for VBIF data
      drm/msm/dpu: use devres-managed allocation for MDP TOP
      drm/msm/dpu: use devres-managed allocation for HW blocks
      drm/msm/dpu: drop unused dpu_plane::lock
      drm/msm/dpu: remove QoS teardown on plane destruction
      drm/msm/dpu: use drmm-managed allocation for dpu_plane
      drm/msm/dpu: use drmm-managed allocation for dpu_crtc
      drm/msm/dpu: use drmm-managed allocation for dpu_encoder_phys
      drm/msm/dpu: drop dpu_encoder_phys_ops::destroy
      drm/msm/dpu: use drmm-managed allocation for dpu_encoder_virt
      drm/msm/dpu: correct clk bit for WB2 block
      drm/msm/dpu: drop MSM_ENC_VBLANK support
      drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
      drm/vkms: move wb's atomic_check from encoder to connector
      drm/ci: remove rebase-merge directory
      drm/msm/dpu: move encoder status to standard encoder debugfs dir
      drm/msm/dpu: enable writeback on SM8350
      drm/msm/dpu: enable writeback on SM8450
      dt-bindings: display: msm: dp: declare compatible string for sm8150
      drm/msm/dpu: remove extra drm_encoder_cleanup from the error path
      drm/msm/dpu: move CSC tables to dpu_hw_util.c
      drm/msm/dp: call dp_display_get_next_bridge() during probe

Dmitry Osipenko (1):
      drm/virtio: Fix return value for VIRTGPU_CONTEXT_PARAM_DEBUG_NAME

Donald Robson (9):
      drm/gpuvm: Helper to get range of unmap from a remap op.
      drm/imagination: Add GEM and VM related code
      drm/imagination: Numerous documentation fixes.
      drm/imagination: Fixed warning due to implicit cast to bool
      drm/imagination: Fixed missing header in pvr_fw_meta
      drm/imagination: pvr_device_process_active_queues now static
      drm/imagination: pvr_gpuvm_free() now static
      drm/imagination: Removed unused function to_pvr_vm_gpuva()
      drm/imagination: Removed unused functions in pvr_fw_trace

Duncan Ma (1):
      drm/amd/display: Negate IPS allow and commit bits

Dust Li (1):
      net/mlx5e: fix double free of encap_header

Eduard Zingerman (11):
      selftests/bpf: track tcp payload offset as scalar in xdp_synproxy
      selftests/bpf: track string payload offset as scalar in strobemeta
      selftests/bpf: fix bpf_loop_bench for new callback verification schem=
e
      bpf: extract __check_reg_arg() utility function
      bpf: extract setup_func_entry() utility function
      bpf: verify callbacks as if they are called unknown number of times
      selftests/bpf: tests for iterating callbacks
      bpf: widening for callback iterators
      selftests/bpf: test widening for iterating callbacks
      bpf: keep track of max number of bpf_loop callback iterations
      selftests/bpf: check if max number of bpf_loop iterations is tracked

Ekaterina Esina (1):
      cifs: fix check of rc in function generate_smb3signingkey

Emma Anholt (1):
      MAINTAINERS: Drop Emma Anholt from all M lines.

Erez Shitrit (1):
      net/mlx5: DR, Allow old devices to use multi destination FTE

Eric Dumazet (5):
      ipvlan: add ipvlan_route_v6_outbound() helper
      ptp: annotate data-race around q->head and q->tail
      bonding: stop the device in bond_setup_by_slave()
      af_unix: fix use-after-free in unix_stream_read_actor()
      wireguard: use DEV_STATS_INC()

Eymen Yigit (1):
      ALSA: hda/realtek: Enable Mute LED on HP 255 G8

Fang Xiang (1):
      irqchip/gic-v3-its: Flush ITS tables correctly in non-coherent GIC de=
signs

Fangzhi Zuo (1):
      drm/amd/display: Fix DSC not Enabled on Direct MST Sink

Ferry Meng (1):
      erofs: simplify erofs_read_inode()

Filipe Manana (4):
      btrfs: use u64 for buffer sizes in the tree search ioctls
      btrfs: fix error pointer dereference after failure to allocate fs dev=
ices
      btrfs: fix race between accounting qgroup extents and removing a qgro=
up
      btrfs: fix qgroup record leaks when using simple quotas

Frank Binns (1):
      MAINTAINERS: Document Imagination PowerVR driver patches go via drm-m=
isc

Gal Pressman (1):
      net: Fix undefined behavior in netdev name allocation

Gao Xiang (1):
      MAINTAINERS: erofs: add EROFS webpage

Gavin Li (1):
      net/mlx5e: fix double free of encap_header in update funcs

Geliang Tang (1):
      mptcp: add validity check for sending RM_ADDR

Gerd Bayer (1):
      s390/ism: ism driver implies smc protocol

Gil Fine (1):
      thunderbolt: Set lane bonding bit only for downstream port

Greg Kroah-Hartman (2):
      Merge tag 'thunderbolt-for-v6.7-rc3' of
git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into
usb-linus
      Merge tag 'usb-serial-6.7-rc3' of
https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into
usb-linus

Gurchetan Singh (2):
      drm/virtio: use uint64_t more in virtio_gpu_context_init_ioctl
      drm/uapi: add explicit virtgpu context debug name

Gustavo A. R. Silva (3):
      bcachefs: Use DECLARE_FLEX_ARRAY() helper and fix multiple
-Warray-bounds warnings
      bcachefs: Fix multiple -Warray-bounds warnings
      xen: privcmd: Replace zero-length array with flex-array member
and use __counted_by

Haiyang Zhang (2):
      hv_netvsc: fix race of netvsc and VF register_netdevice
      hv_netvsc: Fix race of register_netdevice_notifier and VF register

Hamish Martin (2):
      HID: mcp2221: Set driver data before I2C adapter add
      HID: mcp2221: Allow IO to start during probe

Hannes Reinecke (5):
      nvme-tcp: only evaluate 'tls' option if TLS is selected
      nvme: catch errors from nvme_configure_metadata()
      nvme: blank out authentication fabrics options if not configured
      nvmet-tcp: always initialize tls_handshake_tmo_work
      nvme: move nvme_stop_keep_alive() back to original position

Hans de Goede (7):
      ACPI: PM: Add acpi_device_fix_up_power_children() function
      ACPI: video: Use acpi_device_fix_up_power_children()
      ACPI: resource: Skip IRQ override on ASUS ExpertBook B1402CVA
      MAINTAINERS: Drop Mark Gross as maintainer for x86 platform drivers
      usb: misc: ljca: Fix enumeration error on Dell Latitude 9420
      drm/i915/dsi: Remove GPIO lookup table at the end of
intel_dsi_vbt_gpio_init()
      drm/i915/dsi: Fix wrong initial value for GPIOs in bxt_gpio_set_value=
()

Hao Ge (1):
      dpll: Fix potential msg memleak when genlmsg_put_reply failed

Harshit Mogalapalli (6):
      platform/x86: hp-bioscfg: Simplify return check in
hp_add_other_attributes()
      platform/x86: hp-bioscfg: move mutex_lock() down in
hp_add_other_attributes()
      platform/x86: hp-bioscfg: Fix error handling in hp_add_other_attribut=
es()
      platform/x86: hp-bioscfg: Remove unused obj in hp_add_other_attribute=
s()
      drm/msm/dp: add a missing unlock in dp_hpd_plug_handle()
      drm/v3d: Fix missing error code in v3d_submit_cpu_ioctl()

Heikki Krogerus (1):
      usb: typec: tipd: Supply also I2C driver data

Heiko Carstens (2):
      s390: remove odd comment
      scripts/checkstack.pl: match all stack sizes for s390

Heiner Kallweit (1):
      Revert "net: r8169: Disable multicast filter for RTL8168H and RTL8107=
E"

Helge Deller (12):
      parisc: fix mmap_base calculation when stack grows upwards
      parisc/power: Fix power soft-off when running on qemu
      prctl: Disable prctl(PR_SET_MDWE) on parisc
      parisc: Mark ex_table entries 32-bit aligned in assembly.h
      parisc: Mark ex_table entries 32-bit aligned in uaccess.h
      parisc: Mark altinstructions read-only and 32-bit aligned
      parisc: Mark jump_table naturally aligned
      parisc: Mark lock_aligned variables 16-byte aligned on SMP
      parisc: Ensure 32-bit alignment on parisc unwind section
      parisc: Use natural CPU alignment for bug_table
      parisc: Drop the HP-UX ENOSYM and EREMOTERELEASE error codes
      parisc: Reduce size of the bug_table on 64-bit kernel by half

Hsin-Yi Wang (6):
      drm/panel-edp: drm/panel-edp: Fix AUO B116XAK01 name and timing
      drm/panel-edp: drm/panel-edp: Fix AUO B116XTN02 name
      drm/panel-edp: drm/panel-edp: Add several generic edp panels
      drm/panel-edp: Add override_edid_mode quirk for generic edp
      drm/panel-edp: Add auo_b116xa3_mode
      drm/panel-edp: Avoid adding multiple preferred modes

Huacai Chen (3):
      LoongArch: Add __percpu annotation for __percpu_read()/__percpu_write=
()
      LoongArch: Silence the boot warning about 'nokaslr'
      LoongArch: Mark {dmw,tlb}_virt_to_page() exports as non-GPL

Hyeongtak Ji (1):
      mm/damon/core.c: avoid unintentional filtering out of schemes

Iago Toral Quiroga (4):
      drm/v3d: update UAPI to match user-space for V3D 7.x
      drm/v3d: fix up register addresses for V3D 7.x
      dt-bindings: gpu: v3d: Add BCM2712's compatible
      drm/v3d: add brcm,2712-v3d as a compatible V3D device

Ian Kent (1):
      autofs: add: new_inode check in autofs_fill_super()

Imre Deak (43):
      drm/i915/dp_mst: Disable DSC on ICL MST outputs
      drm/i915/dp_mst: Fix race between connector registration and setup
      drm/dp_mst: Add helper to determine if an MST port is downstream
of another port
      drm/dp_mst: Factor out a helper to check the atomic state of a
topology manager
      drm/dp_mst: Swap the order of checking root vs. non-root port BW
limitations
      drm/dp_mst: Allow DSC in any Synaptics last branch device
      drm/dp: Add DP_HBLANK_EXPANSION_CAPABLE and DSC_PASSTHROUGH_EN DPCD f=
lags
      drm/dp_mst: Add HBLANK expansion quirk for Synaptics MST hubs
      drm/dp: Add helpers to calculate the link BW overhead
      drm/i915/dp_mst: Enable FEC early once it's known DSC is needed
      drm/i915/dp: Specify the FEC overhead as an increment vs. a remainder
      drm/i915/dp: Pass actual BW overhead to m_n calculation
      drm/i915/dp_mst: Account for FEC and DSC overhead during BW allocatio=
n
      drm/i915/dp_mst: Add atomic state for all streams on pre-tgl platform=
s
      drm/i915/dp_mst: Program the DSC PPS SDP for each stream
      drm/i915/dp: Make sure the DSC PPS SDP is disabled whenever DSC
is disabled
      drm/i915/dp_mst: Add missing DSC compression disabling
      drm/i915/dp: Rename intel_ddi_disable_fec_state() to
intel_ddi_disable_fec()
      drm/i915/dp: Wait for FEC detected status in the sink
      drm/i915/dp: Disable FEC ready flag in the sink
      drm/i915/dp_mst: Handle the Synaptics HBlank expansion quirk
      drm/i915/dp_mst: Enable decompression in the sink from the MST
encoder hooks
      drm/i915/dp: Enable DSC via the connector decompression AUX
      drm/i915/dp_mst: Enable DSC passthrough
      drm/i915/dp_mst: Enable MST DSC decompression for all streams
      drm/i915: Factor out function to clear pipe update flags
      drm/i915/dp_mst: Force modeset CRTC if DSC toggling requires it
      drm/i915/dp_mst: Improve BW sharing between MST streams
      drm/i915/dp_mst: Check BW limitations only after all streams are comp=
uted
      drm/i915/dp: Tune down FEC detection timeout error message
      drm/i915: Fix fractional bpp handling in intel_link_bw_reduce_bpp()
      drm/i915/dp_mst: Fix race between connector registration and setup
      drm/dp_mst: Store the MST PBN divider value in fixed point format
      drm/dp_mst: Fix PBN divider calculation for UHBR rates
      drm/dp_mst: Add kunit tests for drm_dp_get_vc_payload_bw()
      drm/i915/dp: Replace intel_dp_is_uhbr_rate() with drm_dp_is_uhbr_rate=
()
      drm/i915/dp: Account for channel coding efficiency on UHBR links
      drm/i915/dp: Fix UHBR link M/N values
      drm/i915/dp_mst: Calculate the BW overhead in
intel_dp_mst_find_vcpi_slots_for_bpp()
      drm/i915/dp_mst: Fix PBN / MTP_TU size calculation for UHBR rates
      drm/i915/dp: Report a rounded-down value as the maximum data rate
      drm/i915/dp: Simplify intel_dp_max_data_rate()
      drm/i915/dp: Reuse intel_dp_{max,effective}_data_rate in
intel_link_compute_m_n()

Itamar Gozlan (1):
      Revert "net/mlx5: DR, Supporting inline WQE when possible"

Ivan Vecera (1):
      i40e: Fix adding unsupported cloud filters

Jacek Lawrynowicz (9):
      accel/ivpu: Simplify MMU SYNC command
      accel/ivpu: Rename VPU to NPU in product strings
      accel/ivpu: Fix compilation with CONFIG_PM=3Dn
      accel/ivpu: Allocate vpu_addr in gem->open() callback
      accel/ivpu: Fix locking in ivpu_bo_remove_all_bos_from_context()
      accel/ivpu: Remove support for uncached buffers
      accel/ivpu: Use GEM shmem helper for all buffers
      accel/ivpu: Use threaded IRQ to handle JOB done messages
      accel/ivpu/37xx: Fix hangs related to MMIO reset

Jacob Keller (3):
      ice: remove ptp_tx ring parameter flag
      ice: unify logic for programming PFINT_TSYN_MSK
      ice: restore timestamp configuration after device reset

Jakub Kicinski (13):
      Revert "ptp: Fixes a null pointer dereference in ptp_ioctl"
      Merge branch 'fix-large-frames-in-the-gemini-ethernet-driver'
      Merge branch 'r8169-fix-dash-devices-network-lost-issue'
      Merge branch 'pds_core-fix-irq-index-bug-and-compiler-warnings'
      Merge branch '100GbE' of
git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue
      Merge branch 'mptcp-misc-fixes-for-v6-7'
      Merge https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf
      Merge branch 'mlx5-fixes-2023-11-13-manual'
      net: fill in MODULE_DESCRIPTION()s for SOCK_DIAG modules
      docs: netdev: try to guide people on dealing with silence
      Merge tag 'for-netdev' of
https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf
      tools: ynl: fix header path for nfsd
      tools: ynl: fix duplicate op name in devlink

Jakub Sitnicki (1):
      virtio_pci: Switch away from deprecated irq_set_affinity_hint

Jan Bottorff (1):
      i2c: designware: Fix corrupted memory seen in the ISR

Jan H=C3=B6ppner (1):
      s390/dasd: protect device queue against concurrent access

Jan Kiszka (2):
      net: ti: icssg-prueth: Add missing icss_iep_put to error path
      net: ti: icssg-prueth: Fix error cleanup on failing
pruss_request_mem_region

Jani Nikula (29):
      drm/i915: drop gt/intel_gt.h include from skl_universal_plane.c
      drm/i915/aux: add separate register macros and functions for VLV/CHV
      drm/i915/aux: rename dev_priv to i915
      drm/i915: stop including i915_utils.h from intel_runtime_pm.h
      drm/i915/sprite: move sprite_name() to intel_sprite.c
      drm/i915: fix Makefile sort and indent
      drm/i915: move Makefile display debugfs files next to display
      drm/i915: move display mutex inits to display code
      drm/i915: move display spinlock init to display code
      drm/edid: split out drm_eld.h from drm_edid.h
      drm/eld: replace uint8_t with u8
      drm/edid: include drm_eld.h only where required
      drm/edid: use a temp variable for sads to drop one level of dereferen=
ces
      drm/edid: add helpers to get/set struct cea_sad from/to 3-byte sad
      drm/eld: add helpers to modify the SADs of an ELD
      drm/i915: abstract plane protection check
      drm/i915: remove excess functions from plane protection check
      MAINTAINERS: update drm/i915 W: and B: entries
      drm/i915: update in-source bug filing URLs
      drm/i915/display: keep struct intel_display members sorted
      drm/i915: move *_crtc_clock_get() to intel_dpll.c
      drm/i915: add vlv_pipe_to_phy() helper to replace DPIO_PHY()
      drm/i915: convert vlv_dpio_read()/write() from pipe to phy
      drm/edid/firmware: drop drm_kms_helper.edid_firmware backward compat
      drm/i915/dsi: assume BXT gpio works for non-native GPIO
      drm/i915/dsi: switch mipi_exec_gpio() from dev_priv to i915
      drm/i915/dsi: clarify GPIO exec sequence
      drm/i915/dsi: rename platform specific *_exec_gpio() to *_gpio_set_va=
lue()
      drm/i915/dsi: bxt/icl GPIO set value do not need gpio source

Jann Horn (1):
      tls: fix NULL deref on tls_sw_splice_eof() with empty record

Javier Martinez Canillas (7):
      dt-bindings: display: ssd132x: Remove '-' before compatible enum
      drm/ssd130x: Fix possible uninitialized usage of crtc_state variable
      drm: Allow drivers to indicate the damage helpers to ignore damage cl=
ips
      drm/virtio: Disable damage clipping if FB changed since last page-fli=
p
      drm/vmwgfx: Disable damage clipping if FB changed since last page-fli=
p
      drm/plane: Extend damage tracking kernel-doc
      drm/todo: Add entry about implementing buffer age for damage tracking

Jean Delvare (2):
      stmmac: dwmac-loongson: Add architecture dependency
      drm/loongson: Add platform dependency

Jeffrey Hugo (1):
      accel/qaic: Update MAX_ORDER use to be inclusive

Jens Axboe (3):
      io_uring/fdinfo: remove need for sqpoll lock for thread/pid retrieval
      Merge tag 'md-fixes-20231120' of
https://git.kernel.org/pub/scm/linux/kernel/git/song/md into block-6.7
      Merge tag 'nvme-6.7-2023-11-22' of git://git.infradead.org/nvme
into block-6.7

Jessica Zhang (9):
      drm: Introduce pixel_source DRM plane property
      drm: Introduce solid fill DRM plane property
      drm: Add solid fill pixel source
      drm/atomic: Add pixel source to plane state dump
      drm/atomic: Add solid fill data to plane state dump
      drm/atomic: Move framebuffer checks to helper
      drm/atomic: Loosen FB atomic checks
      drm/msm/dpu: Set input_sel bit for INTF
      drm/msm/dpu: Drop enable and frame_count parameters from
dpu_hw_setup_misr()

Jian Shen (2):
      net: hns3: fix add VLAN fail issue
      net: hns3: fix incorrect capability bit display for copper port

Jianbo Liu (1):
      net/mlx5e: Don't modify the peer sent-to-vport rules for IPSec offloa=
d

Jiapeng Chong (1):
      bcachefs: make bch2_target_to_text_sb static

Jiawen Wu (1):
      net: wangxun: fix kernel panic due to null pointer

Jijie Shao (2):
      net: hns3: fix VF reset fail issue
      net: hns3: fix VF wrong speed and duplex issue

Jingbo Xu (1):
      erofs: fix NULL dereference of dif->bdev_handle in fscache mode

Jiri Kosina (1):
      Revert "HID: logitech-dj: Add support for a new lightspeed
receiver iteration"

Jithu Joseph (1):
      MAINTAINERS: Remove stale entry for SBL platform driver

Johan Hovold (11):
      Revert "phy: realtek: usb: Add driver for the Realtek SoC USB 3.0 PHY=
"
      Revert "phy: realtek: usb: Add driver for the Realtek SoC USB 2.0 PHY=
"
      Revert "usb: phy: add usb phy notify port status API"
      dt-bindings: usb: hcd: add missing phy name to example
      USB: xhci-plat: fix legacy PHY double init
      dt-bindings: usb: qcom,dwc3: fix example wakeup interrupt types
      USB: dwc3: qcom: fix wakeup after probe deferral
      USB: dwc3: qcom: simplify wakeup interrupt setup
      USB: dwc3: qcom: fix resource leaks on probe deferral
      USB: dwc3: qcom: fix software node leak on probe errors
      USB: dwc3: qcom: fix ACPI platform device leak

Johan Jonker (2):
      drm/rockchip: rk3066_hdmi: Remove useless mode_fixup
      drm/rockchip: rk3066_hdmi: Switch encoder hooks to atomic

Johannes Weiner (1):
      sched: psi: fix unprivileged polling against cgroups

Johnathan Mantey (1):
      Revert ncsi: Propagate carrier gain/loss events to the NCSI controlle=
r

Jonas Karlman (2):
      drm/rockchip: vop: Fix color for RGB888/BGR888 format on VOP full
      drm/rockchip: vop2: Add NV20 and NV30 support

Jonathan Marek (1):
      drm/msm/dsi: use the correct VREG_CTRL_1 value for 4nm cphy

Jose Ignacio Tornos Martinez (1):
      net: usb: ax88179_178a: fix failed operations during ax88179_reset

Josef Bacik (1):
      btrfs: get correct owning_root when dropping snapshot

Jos=C3=A9 Pekkarinen (1):
      drm/amd/display: fix NULL dereference

Jouni H=C3=B6gander (29):
      drm/i915/display: Move releasing gem object away from fb tracking
      drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base
      drm/i915/display: Add framework to add parameters specific to display
      drm/i915/display: Dump also display parameters
      drm/i915/display: Move enable_fbc module parameter under display
      drm/i915/display: Move psr related module parameters under display
      drm/i915/display: Move vbt_firmware module parameter under display
      drm/i915/display: Move lvds_channel_mode module parameter under displ=
ay
      drm/i915/display: Move panel_use_ssc module parameter under display
      drm/i915/display: Move vbt_sdvo_panel_type module parameter under dis=
play
      drm/i915/display: Move enable_dc module parameter under display
      drm/i915/display: Move enable_dpt module parameter under display
      drm/i915/display: Move enable_sagv module parameter under display
      drm/i915/display: Move disable_power_well module parameter under disp=
lay
      drm/i915/display: Move enable_ips module parameter under display
      drm/i915/display: Move invert_brightness module parameter under displ=
ay
      drm/i915/display: Move edp_vswing module parameter under display
      drm/i915/display: Move enable_dpcd_backlight module parameter
under display
      drm/i915/display: Move load_detect_test parameter under display
      drm/i915/display: Move force_reset_modeset_test parameter under displ=
ay
      drm/i915/display: Move disable_display parameter under display
      drm/i915/display: Use device parameters instead of module in
I915_STATE_WARN
      drm/i915/display: Move verbose_state_checks under display
      drm/i915/display: Move nuclear_pageflip under display
      drm/i915/display: Move enable_dp_mst under display
      drm/i915/display: Use dma_fence interfaces instead of i915_sw_fence
      drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base
      drm/i915/psr: Move psr specific dpcd init into own function
      drm/i915/display: Do not check psr2 if psr/panel replay is not suppor=
ted

Jozsef Kadlecsik (1):
      netfilter: ipset: fix race condition between swap/destroy and
kernel side add/del/test

Juergen Gross (8):
      xen/events: avoid using info_for_irq() in xen_send_IPI_one()
      xen/events: fix delayed eoi list handling
      xen/events: remove unused functions
      xen/events: reduce externally visible helper functions
      xen/events: remove some simple helpers from events_base.c
      xen/events: drop xen_allocate_irqs_dynamic()
      xen/events: modify internal [un]bind interfaces
      xen/events: remove some info_for_irq() calls in pirq handling

Juha-Pekka Heikkila (3):
      drm/i915/display: Separate xe and i915 common dpt code into own file
      drm/i915/display: in skl_surf_address check for dpt-vma
      drm/i915/display: In intel_framebuffer_init switch to use
intel_bo_to_drm_bo

Kailang Yang (1):
      ALSA: hda/realtek - Add Dell ALC295 to pin fall back table

Karol Wachowski (5):
      accel/ivpu: Remove reset from power up sequence
      accel/ivpu: Change test_mode module param to bitmask
      accel/ivpu: Introduce ivpu_ipc_send_receive_active()
      accel/ivpu: Print CMDQ errors after consumer timeout
      accel/ivpu: Make DMA allocations for MMU600 write combined

Kees Cook (4):
      gcc-plugins: randstruct: Only warn about true flexible arrays
      MAINTAINERS: Add netdev subsystem profile link
      parisc: Replace strlcpy() with strscpy()
      dma-buf: Replace strlcpy() with strscpy()

Keisuke Nishimura (1):
      sched/fair: Fix the decision for load balance

Keith Busch (2):
      swiotlb-xen: provide the "max_mapping_size" method
      io_uring: fix off-by one bvec index

Kent Overstreet (18):
      bcachefs: Use correct fgf_t type as function argument
      bcachefs: Fix null ptr deref in bch2_backpointer_get_node()
      bcachefs: Guard against insufficient devices to create stripes
      bcachefs: Split out btree_key_cache_types.h
      bcachefs: Run btree key cache shrinker less aggressively
      bcachefs: btree_trans->write_locked
      bcachefs: Make sure to drop/retake btree locks before reclaim
      bcachefs: Check for nonce offset inconsistency in data_update path
      bcachefs: Kill journal pre-reservations
      bcachefs: Fix iterator leak in may_delete_deleted_inode()
      bcachefs: Fix error path in bch2_mount()
      bcachefs: Fix missing transaction commit
      bcachefs: Disable debug log statements
      bcachefs: Don't decrease BTREE_ITER_MAX when LOCKDEP=3Dy
      bcachefs: Fix bch2_check_nlinks() for snapshots
      bcachefs: Fix no_data_io mode checksum check
      bcachefs: six locks: Fix lost wakeup
      bcachefs: Fix missing locking for dentry->d_parent access

Khaled Almahallawy (1):
      drm/display/dp: Add the remaining Square PHY patterns DPCD
register definitions

Kirill A. Shutemov (1):
      MAINTAINERS: Add Intel TDX entry

Konrad Dybcio (5):
      dt-bindings: display: msm: qcm2290-mdss: Use the non-deprecated DSI c=
ompat
      dt-bindings: display: msm: Add reg bus and rotator interconnects
      drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
      drm/msm/dsi: Enable runtime PM
      drm/msm/mdss: Rename path references to mdp_path

Konstantin Runov (1):
      gcc-plugins: latent_entropy: Fix typo (args -> argc) in plugin descri=
ption

Krystian Pradzynski (2):
      accel/ivpu: Update FW API
      accel/ivpu/40xx: Allow to change profiling frequency

Krzysztof Kozlowski (2):
      dt-bindings: display/msm: qcom, sm8250-mdss: add DisplayPort
controller node
      dt-bindings: display/msm: qcom, sm8150-mdss: correct DSI PHY compatib=
le

Kunwu Chan (2):
      drm/atomic-helper: Fix spelling mistake "preceeding" -> "preceding"
      ipv4: Correct/silence an endian warning in __ip_do_redirect

Kuogee Hsieh (7):
      drm/msm/dp: tie dp_display_irq_handler() with dp driver
      drm/msm/dp: rename is_connected with link_ready
      drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes
      drm/msm/dp: move parser->parse() and dp_power_client_init() to probe
      drm/msm/dp: incorporate pm_runtime framework into DP driver
      drm/msm/dp: delete EV_HPD_INIT_SETUP
      drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()

Le Ma (1):
      drm/amdgpu: finalizing mem_partitions at the end of GMC v9 sw_fini

Leah Rumancik (1):
      xfs: up(ic_sema) if flushing data device fails

Lech Perczak (2):
      USB: serial: option: don't claim interface 4 for ZTE MF290
      net: usb: qmi_wwan: claim interface 4 for ZTE MF290

Len Brown (2):
      tools/power/turbostat: bugfix "--show IPC"
      tools/power turbostat: version 2023.11.07

Lewis Huang (1):
      drm/amd/display: Change the DMCUB mailbox memory location from FB to =
inbox

Li Nan (4):
      nbd: fold nbd config initialization into nbd_alloc_config()
      nbd: factor out a helper to get nbd_config without holding 'config_lo=
ck'
      nbd: fix null-ptr-dereference while accessing 'nbd->config'
      nbd: pass nbd_sock to nbd_read_reply() instead of index

Lijo Lazar (1):
      drm/amd/pm: Don't send unload message for reset

Linkui Xiao (1):
      netfilter: nf_conntrack_bridge: initialize err to 0

Linus Torvalds (58):
      drm/ci: make github dependabot happy again
      Merge tag 'for-6.7-rc1-tag' of
git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
      Merge tag 'zstd-linus-v6.7-rc2' of https://github.com/terrelln/linux
      Merge tag 'hardening-v6.7-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux
      Merge tag 'for_linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost
      Merge tag 'for-linus-6.7a-rc2-tag' of
git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip
      Merge tag 'net-6.7-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
      Merge tag 'audit-pr-20231116' of
git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit
      Merge tag 'sound-6.7-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
      Merge tag 'ovl-fixes-6.7-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/overlayfs/vfs
      Merge tag 'drm-fixes-2023-11-17' of git://anongit.freedesktop.org/drm=
/drm
      Merge tag 'io_uring-6.7-2023-11-17' of git://git.kernel.dk/linux
      Merge tag 'block-6.7-2023-11-17' of git://git.kernel.dk/linux
      Merge tag 'mm-hotfixes-stable-2023-11-17-14-04' of
git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
      Merge tag 'bcachefs-2023-11-17' of https://evilpiepirate.org/git/bcac=
hefs
      Merge tag 'turbostat-2023.11.07' of
git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux
      Merge tag 'i2c-for-6.7-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux
      Merge tag 'for-6.7/dm-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm
      Merge tag '6.7-rc1-smb3-client-fixes' of
git://git.samba.org/sfrench/cifs-2.6
      Merge tag 'nfsd-6.7-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
      Merge tag 'xfs-6.7-fixes-1' of
git://git.kernel.org/pub/scm/fs/xfs/xfs-linux
      Merge tag 'parisc-for-6.7-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
      Merge tag 'scsi-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
      Merge tag 'perf_urgent_for_v6.7_rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
      Merge tag 'locking_urgent_for_v6.7_rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
      Merge tag 'sched_urgent_for_v6.7_rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
      Merge tag 'timers_urgent_for_v6.7_rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
      Merge tag 'x86_urgent_for_v6.7_rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
      Merge tag 'irq_urgent_for_v6.7_rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
      Merge tag 'kbuild-fixes-v6.7' of
git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
      Linux 6.7-rc2
      Merge tag 'erofs-for-6.7-rc3-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs
      Merge tag 'platform-drivers-x86-v6.7-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
      asm-generic: qspinlock: fix queued_spin_value_unlocked() implementati=
on
      Merge tag 'hyperv-fixes-signed-20231121' of
git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux
      Merge tag 'loongarch-fixes-6.7-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson
      Merge tag 'net-6.7-rc3' of
git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
      Merge tag 'for-linus-2023112301' of
git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid
      Merge tag 'io_uring-6.7-2023-11-23' of git://git.kernel.dk/linux
      Merge tag 'block-6.7-2023-11-23' of git://git.kernel.dk/linux
      Merge tag 'ata-6.7-rc3' of
git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata
      Merge tag 'drm-fixes-2023-11-24' of git://anongit.freedesktop.org/drm=
/drm
      Merge tag 'vfs-6.7-rc3.fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
      Merge tag 'afs-fixes-20231124' of
git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs
      Merge tag 'pm-6.7-rc3' of
git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
      Merge tag 'acpi-6.7-rc3' of
git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
      Merge tag 's390-6.7-3' of
git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
      Merge tag 'for-linus-6.7a-rc3-tag' of
git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip
      Merge tag 'arm64-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
      Merge tag 'xfs-6.7-fixes-3' of
git://git.kernel.org/pub/scm/fs/xfs/xfs-linux
      Merge tag 'usb-6.7-rc3' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
      Merge tag '6.7-rc2-smb3-client-fixes' of
git://git.samba.org/sfrench/cifs-2.6
      Merge tag 'locking-urgent-2023-11-26' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
      Merge tag 'perf-urgent-2023-11-26' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
      Merge tag 'x86-urgent-2023-11-26' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
      Merge tag 'parisc-for-6.7-rc3' of
git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
      Merge tag 'trace-v6.7-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
      Linux 6.7-rc3

Linus Walleij (3):
      net: ethernet: cortina: Fix max RX frame define
      net: ethernet: cortina: Handle large frames
      net: ethernet: cortina: Fix MTU max setting

Liu Ying (1):
      drm/bridge: imx93-mipi-dsi: Fix a couple of building warnings

Long Li (3):
      xfs: factor out xfs_defer_pending_abort
      xfs: abort intent items when recovery intents fail
      hv_netvsc: Mark VF as slave before exposing it to user-mode

Lorenzo Bianconi (1):
      net: veth: fix ethtool stats reporting

Luben Tuikov (9):
      drm/sched: Don't disturb the entity when in RR-mode scheduling
      drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()
      drm/sched: Define pr_fmt() for DRM using pr_*()
      Revert "drm/sched: Define pr_fmt() for DRM using pr_*()"
      drm/print: Handle NULL drm device in __drm_printk()
      drm/sched: Fix bounds limiting when given a malformed entity
      drm/sched: Rename priority MIN to LOW
      drm/sched: Reverse run-queue priority enumeration
      drm/sched: Fix compilation issues with DRM priority rename

Lucas De Marchi (4):
      drm/i915/lnl: Extend C10/C20 phy
      drm/i915/lnl: Fix check for TC phy
      drm/i915/display: Abstract C10/C20 pll hw readout
      drm/i915/display: Abstract C10/C20 pll calculation

Lukas Bulwahn (1):
      linux/export: clean up the IA-64 KSYM_FUNC macro

MD Danish Anwar (1):
      MAINTAINERS: add entry for TI ICSSG Ethernet driver

Maarten Lankhorst (1):
      ALSA: hda: i915: Alays handle -EPROBE_DEFER

Maher Sanalla (1):
      net/mlx5: Free used cpus mask when an IRQ is released

Mahmoud Adam (1):
      nfsd: fix file memleak on client_opens_release

Marco Felsch (1):
      drm/panel: ilitek-ili9881c: make use of prepare_prev_first

Marco Pagani (2):
      drm/test: rearrange test entries in Kconfig and Makefile
      drm/test: add a test suite for GEM objects backed by shmem

Marek Beh=C3=BAn (1):
      net: mdio: fix typo in header

Marek Szyprowski (1):
      drm/debugfs: fix potential NULL pointer dereference

Marek Vasut (2):
      drm/panel: simple: Fix Innolux G101ICE-L01 bus flags
      drm/panel: simple: Fix Innolux G101ICE-L01 timings

Marijn Suijten (2):
      drm/msm/dpu: Drop unused get_scaler_ver callback from SSPP
      drm/msm/dpu: Drop unused qseed_type from catalog dpu_caps

Mario Limonciello (1):
      drm/amd/display: fix a NULL pointer dereference in amdgpu_dm_i2c_xfer=
()

Mark Brown (1):
      kselftest/arm64: Fix output formatting for za-fork

Mark O'Donovan (2):
      nvme-auth: unlock mutex in one place only
      nvme-auth: set explanation code for failure2 msgs

Martin K. Petersen (1):
      Merge branch '6.7/scsi-staging' into 6.7/scsi-fixes

Martin KaFai Lau (1):
      Merge branch 'bpf_redirect_peer fixes'

Masahiro Yamada (4):
      modpost: fix section mismatch message for RELA
      kconfig: fix memory leak from range properties
      LoongArch: Add dependency between vmlinuz.efi and vmlinux.efi
      arm64: add dependency between vmlinuz.efi and Image

Mathieu Desnoyers (1):
      MAINTAINERS: TRACING: Add Mathieu Desnoyers as Reviewer

Matt Coster (1):
      sizes.h: Add entries between SZ_32G and SZ_64T

Matthew Brost (6):
      drm/sched: Add drm_sched_wqueue_* helpers
      drm/sched: Convert drm scheduler to use a work queue rather than kthr=
ead
      drm/sched: Split free_job into own work item
      drm/sched: Add drm_sched_start_timeout_unlocked helper
      drm/sched: Add a helper to queue TDR immediately
      drm/doc/rfc: Mark long running workload as complete.

Matthew Wilcox (Oracle) (1):
      XFS: Update MAINTAINERS to catch all XFS documentation

Matus Malych (1):
      ALSA: hda/realtek: Enable Mute LED on HP 255 G10

Maxime Ripard (3):
      drm/tests: Remove slow tests
      drm/todo: Add entry to clean up former seltests suites
      Merge drm/drm-next into drm-misc-next

Ma=C3=ADra Canal (15):
      drm/v3d: wait for all jobs to finish before unregistering
      drm/v3d: Implement show_fdinfo() callback for GPU usage stats
      drm/v3d: Expose the total GPU usage stats on sysfs
      MAINTAINERS: Add Maira to V3D maintainers
      drm/v3d: Don't allow two multisync extensions in the same job
      drm/v3d: Decouple job allocation from job initiation
      drm/v3d: Use v3d_get_extensions() to parse CPU job data
      drm/v3d: Create tracepoints to track the CPU job
      drm/v3d: Enable BO mapping
      drm/v3d: Create a CPU job extension for a indirect CSD job
      drm/v3d: Create a CPU job extension for the timestamp query job
      drm/v3d: Create a CPU job extension for the reset timestamp job
      drm/v3d: Create a CPU job extension to copy timestamp query to a buff=
er
      drm/v3d: Create a CPU job extension for the reset performance query j=
ob
      drm/v3d: Create a CPU job extension for the copy performance query jo=
b

Melissa Wen (6):
      drm/v3d: Remove unused function header
      drm/v3d: Move wait BO ioctl to the v3d_bo file
      drm/v3d: Detach job submissions IOCTLs to a new specific file
      drm/v3d: Simplify job refcount handling
      drm/v3d: Add a CPU job submission
      drm/v3d: Detach the CSD job BO setup

Michael Banack (1):
      drm: Introduce documentation for hotspot properties

Michael S. Tsirkin (1):
      virtio_pci: move structure to a header

Michael Walle (2):
      dt-bindings: display: simple: add Evervision VGG644804 panel
      drm/panel-simple: add Evervision VGG644804 panel entry

Micha=C5=82 Winiarski (1):
      iosys-map: Rename locals used inside macros

Mika Kahola (5):
      drm/i915/display: Reset message bus after each read/write operation
      drm/i915/display: Support PSR entry VSC packet to be transmitted
one frame earlier
      drm/i915/mtl: C20 state verification
      drm/i915/display: Use int for entry setup frames
      drm/i915/display: Use int type for entry_setup_frames

Mika Westerberg (2):
      thunderbolt: Send uevent after asymmetric/symmetric switch
      thunderbolt: Only add device router DP IN to the head of the DP
resource list

Mike Christie (1):
      scsi: sd: Fix sshdr use in sd_suspend_common()

Mikhail Zaslonko (1):
      s390/ipl: add missing IPL_TYPE_ECKD_DUMP case to ipl_init()

Mikulas Patocka (6):
      dm-delay: fix a race between delay_presuspend and delay_bio
      dm-delay: fix bugs introduced by kthread mode
      dm-delay: avoid duplicate logic
      dm-bufio: fix no-sleep mode
      dm-verity: don't use blocking calls from tasklets
      dm-crypt: start allocating with MAX_ORDER

Ming Lei (3):
      blk-throttle: fix lockdep warning of "cgroup_mutex or RCU read
lock required!"
      blk-cgroup: avoid to warn !rcu_read_lock_held() in blkg_lookup()
      blk-cgroup: bypass blkcg_deactivate_policy after destroying

Mingzhe Zou (3):
      bcache: fixup init dirty data errors
      bcache: fixup lock c->root error
      bcache: fixup multi-threaded bch_sectors_dirty_init() wake-up race

Muhammad Ahmed (1):
      drm/amd/display: Add null checks for 8K60 lightup

Muhammad Muzammil (1):
      s390/dasd: resolve spelling mistake

Muhammad Usama Anjum (2):
      selftests: mm: skip whole test instead of failure
      selftests: mm: fix some build warnings

Naohiro Aota (2):
      btrfs: zoned: drop no longer valid write pointer check
      btrfs: zoned: wait for data BG to be finished on direct IO allocation

Naomi Chu (1):
      scsi: ufs: core: Expand MCQ queue slot to DeviceQueueDepth + 1

Nathan Chancellor (3):
      usb: typec: nb7vpq904m: Only select DRM_AUX_BRIDGE with OF
      usb: typec: qcom-pmic-typec: Only select DRM_AUX_HPD_BRIDGE with OF
      drm/bridge: Return NULL instead of plain 0 in
drm_dp_hpd_bridge_register() stub

Neil Armstrong (11):
      scsi: ufs: qcom-ufs: dt-bindings: Document the SM8650 UFS Controller
      dt-bindings: display: msm-dsi-phy-7nm: document the SM8650 DSI PHY
      dt-bindings: display: msm-dsi-controller-main: document the
SM8650 DSI Controller
      dt-bindings: display: msm: document the SM8650 DPU
      dt-bindings: display: msm: document the SM8650 Mobile Display Subsyst=
em
      drm/msm/dpu: add support for SM8650 DPU
      drm/msm: mdss: add support for SM8650
      drm/msm: dsi: add support for DSI-PHY on SM8650
      drm/msm: dsi: add support for DSI 2.8.0
      dt-bindings: display: msm: dp-controller: document SM8650 compatible
      drm/msm/dp: Add DisplayPort controller for SM8650

Nguyen Dinh Phi (1):
      nfc: virtual_ncidev: Add variable to check if ndev is running

Nicholas Kazlauskas (1):
      drm/amd/display: Guard against invalid RPTR/WPTR being set

Nicholas Susanto (1):
      drm/amd/display: Fix encoder disable logic

Nick Terrell (1):
      zstd: Fix array-index-out-of-bounds UBSAN warning

Niklas Neronin (1):
      usb: config: fix iteration issue in 'usb_get_bos_descriptor()'

Niklas S=C3=B6derlund (1):
      dt-bindings: net: ethernet-controller: Fix formatting error

Nirmoy Das (2):
      drm/i915/mtl: Apply notify_guc to all GTs
      drm/i915/tc: Fix -Wformat-truncation in intel_tc_port_init

Oliver Neukum (3):
      usb: aqc111: check packet for fixup for true limit
      HID: add ALWAYS_POLL quirk for Apple kb
      USB: dwc2: write HCINT with INTMASK applied

Omar Sandoval (2):
      xfs: fix internal error from AGFL exhaustion
      iov_iter: fix copy_page_to_iter_nofault()

Pablo Neira Ayuso (2):
      netfilter: nf_tables: bogus ENOENT when destroying element which
does not exist
      netfilter: nf_tables: split async and sync catchall in two functions

Paloma Arellano (2):
      drm/msm/dpu: Capture dpu snapshot when frame_done_timer timeouts
      drm/msm/dpu: Add mutex lock in control vblank irq

Paolo Abeni (9):
      mptcp: deal with large GSO size
      mptcp: fix possible NULL pointer dereference on close
      mptcp: fix setsockopt(IP_TOS) subflow locking
      selftests: mptcp: fix fastclose with csum failure
      Merge tag 'nf-23-11-15' of
git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf
      kselftest: rtnetlink: fix ip route command typo
      Merge branch 'hv_netvsc-fix-race-of-netvsc-vf-register-and-slave-bit'
      Merge branch 'amd-xgbe-fixes-to-handle-corner-cases'
      Merge branch 'ice-restore-timestamp-config-after-reset'

Paul Hsieh (1):
      drm/amd/display: Clear dpcd_sink_ext_caps if not set

Paul Moore (1):
      audit: don't WARN_ON_ONCE(!current->mm) in audit_exe_compare()

Paulo Alcantara (4):
      smb: client: implement ->query_reparse_point() for SMB1
      smb: client: introduce ->parse_reparse_point()
      smb: client: set correct file type from NFS reparse points
      smb: client: introduce cifs_sfu_make_node()

Pawel Laszczak (1):
      usb: cdnsp: Fix deadlock issue during using NCM gadget

Peilin Ye (2):
      veth: Use tstats per-CPU traffic counters
      bpf: Fix dev's rx stats for bpf_redirect_peer traffic

Peter Wang (1):
      scsi: ufs: core: Fix racing issue between ufshcd_mcq_abort() and ISR

Peter Zijlstra (3):
      futex: Fix hardcoded flags
      perf/core: Fix cpuctx refcounting
      lockdep: Fix block chain corruption

Philipp Zabel (2):
      dt-bindings: ili9881c: Add Ampire AM8001280G LCD panel
      drm/panel: ilitek-ili9881c: Add Ampire AM8001280G LCD panel

Pin-yen Lin (2):
      drm/edp-panel: Sort the panel entries
      drm/edp-panel: Move the KDC panel to a separate group

Pranjal Ramajor Asha Kanojiya (2):
      accel/qaic: Support MHI QAIC_TIMESYNC channel
      accel/qaic: Support for 0 resize slice execution in BO

Puliang Lu (1):
      USB: serial: option: fix FM101R-GL defines

Qu Wenruo (1):
      btrfs: make found_logical_ret parameter mandatory for function
queue_scrub_stripe()

Quinn Tran (1):
      scsi: qla2xxx: Fix system crash due to bad pointer access

Rafael J. Wysocki (1):
      Merge branches 'acpi-video' and 'acpi-processor' into acpi

Rahul Rameshbabu (7):
      net/mlx5: Decouple PHC .adjtime and .adjphase implementations
      net/mlx5e: Avoid referencing skb after free-ing in drop path of
mlx5e_sq_xmit_wqe
      net/mlx5e: Track xmit submission to PTP WQ after populating metadata =
map
      net/mlx5e: Update doorbell for port timestamping CQ before the
software counter
      net/mlx5: Increase size of irq name buffer
      net/mlx5e: Check return value of snprintf writing to fw_version buffe=
r
      net/mlx5e: Check return value of snprintf writing to fw_version
buffer for representors

Rajneesh Bhardwaj (1):
      drm/ttm: Schedule delayed_delete worker closer

Raju Rangoju (3):
      amd-xgbe: handle corner-case during sfp hotplug
      amd-xgbe: handle the corner-case during tx completion
      amd-xgbe: propagate the correct speed and duplex status

Ramesh Errabolu (1):
      dma-buf: Correct the documentation of name and exp_name symbols

Rand Deeb (1):
      bcache: prevent potential division by zero error

Randy Dunlap (1):
      xen/shbuf: eliminate 17 kernel-doc warnings

Ravi Gunasekaran (1):
      MAINTAINERS: net: Update reviewers for TI's Ethernet drivers

Ricardo Ribalda (1):
      usb: dwc3: set the dma max_seg_size

Richard Acayan (6):
      fbdev/simplefb: Suppress error on missing power domains
      dt-bindings: display/msm: dsi-controller-main: add SDM670 compatible
      dt-bindings: display/msm: sdm845-dpu: Describe SDM670
      dt-bindings: display: msm: Add SDM670 MDSS
      drm/msm: mdss: add support for SDM670
      drm/msm/dpu: Add hw revision 4.1 (SDM670)

Rick Edgecombe (1):
      x86/shstk: Delay signal entry SSP write until after user accesses

Ritvik Budhiraja (1):
      cifs: fix use after free for iface while disabling secondary channels

Rob Clark (20):
      drm/msm/gpu: Move gpu devcore's to gpu device
      drm/msm: Reduce fallout of fence signaling vs reclaim hangs
      drm/msm/gpu: Skip retired submits in recover worker
      drm/msm: Small uabi fixes
      drm/msm/gem: Add metadata
      drm/msm/gem: Demote userspace errors to DRM_UT_DRIVER
      drm/msm/gem: Demote allocations to __GFP_NOWARN
      drm/syncobj: Add deadline support for syncobj waits
      dma-buf/sync_file: Add SET_DEADLINE ioctl
      dma-buf/sw_sync: Add fence deadline support
      drm/msm/dpu: Correct UBWC settings for sc8280xp
      Merge remote-tracking branch 'drm-misc/drm-misc-next' into msm-next
      drm/msm/gem: Remove "valid" tracking
      drm/msm/gem: Remove submit_unlock_unpin_bo()
      drm/msm/gem: Don't queue job to sched in error cases
      drm/msm/gem: Split out submit_unpin_objects() helper
      drm/msm/gem: Cleanup submit_cleanup_bo()
      drm/exec: Pass in initial # of objects
      drm/msm/gem: Convert to drm_exec
      drm/msm/dpu: Ratelimit framedone timeout msgs

Rob Herring (2):
      drm: Use device_get_match_data()
      drm/bridge: aux-hpd: Replace of_device.h with explicit include

Robert Marko (1):
      Revert "i2c: pxa: move to generic GPIO recovery"

Rodrigo Vivi (4):
      drm/doc/rfc: Mark drm_scheduler as completed
      drm/doc/rfc: Move Xe 'ASYNC VM_BIND' to the 'completed' section
      drm/doc/rfc: Move userptr integration and vm_bind to the
'completed' section
      drm/doc/rfc: Xe is using drm_exec, so mark as completed

Roger Pau Monne (1):
      acpi/processor: sanitize _OSC/_PDC capabilities for Xen dom0

Roman Gushchin (1):
      mm: kmem: drop __GFP_NOFAIL when allocating objcg vectors

Ryan Roberts (1):
      mm: more ptep_get() conversion

Saeed Mahameed (1):
      net/mlx5e: Reduce the size of icosq_str

Samuel Holland (2):
      i2c: ocores: Move system PM hooks to the NOIRQ phase
      net: axienet: Fix check for partial TX checksum

Sarah Walker (17):
      dt-bindings: gpu: Add Imagination Technologies PowerVR/IMG GPU
      drm/imagination/uapi: Add PowerVR driver UAPI
      drm/imagination: Add skeleton PowerVR driver
      drm/imagination: Get GPU resources
      drm/imagination: Add GPU register headers
      drm/imagination: Add firmware and MMU related headers
      drm/imagination: Add FWIF headers
      drm/imagination: Add GPU ID parsing and firmware loading
      drm/imagination: Implement power management
      drm/imagination: Implement firmware infrastructure and META FW suppor=
t
      drm/imagination: Implement MIPS firmware processor and MMU support
      drm/imagination: Implement free list and HWRT create and destroy ioct=
ls
      drm/imagination: Implement context creation/destruction ioctls
      drm/imagination: Implement job submission and scheduling
      drm/imagination: Add firmware trace header
      drm/imagination: Add firmware trace to debugfs
      drm/imagination: Add driver documentation

Saurabh Sengar (1):
      x86/hyperv: Fix the detection of E820_TYPE_PRAM in a Gen2 VM

SeongJae Park (3):
      mm/damon/sysfs: check error from damon_sysfs_update_target()
      mm/damon/sysfs-schemes: handle tried regions sysfs directory
allocation failure
      mm/damon/sysfs-schemes: handle tried region directory allocation fail=
ure

Shannon Nelson (2):
      pds_core: use correct index to mask irq
      pds_core: fix up some format-truncation complaints

Sheng-Liang Pan (1):
      drm/panel-edp: Add AUO B116XTN02, BOE NT116WHM-N21,836X2,
NV116WHM-N49 V8.0

Shigeru Yoshida (2):
      tty: Fix uninit-value access in ppp_sync_receive()
      tipc: Fix kernel-infoleak due to uninitialized TLV value

Shiwu Zhang (1):
      drm/amdgpu: add and populate the port num into xgmi topology info

Shyam Prasad N (2):
      cifs: fix leak of iface for primary channel
      cifs: fix lock ordering while disabling multichannel

Shyam Sundar S K (1):
      platform/x86/amd/pmc: adjust getting DRAM size behavior

Simon Glass (1):
      kbuild: Move the single quotes for image name

Simon Horman (1):
      MAINTAINERS: Add indirect_call_wrapper.h to NETWORKING [GENERAL]

Simon Ser (5):
      drm: extract closefb logic in separate function
      drm: introduce CLOSEFB IOCTL
      drm/doc: describe PATH format for DP MST
      drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
      drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP

Simon Trimmer (1):
      ALSA: hda: cs35l56: Enable low-power hibernation mode on i2c

Song Liu (1):
      md: fix bi_status reporting in md_end_clone_io

Srinivas Pandruvada (1):
      tools/power/turbostat: Move process to root cgroup

Srinivasan Shanmugam (1):
      drm/amdgpu: Address member 'ring' not described in 'amdgpu_ vce,
uvd_entity_init()'

Stanislav Fomichev (1):
      net: set SOCK_RCU_FREE before inserting socket into hashtable

Stanislav Lisovskiy (1):
      drm/i915: Query compressed bpp properly using correct DPCD and
DP Spec info

Stanislaw Gruszka (9):
      accel/ivpu: Remove unneeded drm_driver declaration
      accel/ivpu/37xx: Print warning when VPUIP is not idle during power do=
wn
      accel/ivpu: Assure device is off if power up sequence fail
      accel/ivpu: Stop job_done_thread on suspend
      accel/ivpu: Abort pending rx ipc on reset
      accel/ivpu: Rename cons->rx_msg_lock
      accel/ivpu: Do not use irqsave in ivpu_ipc_dispatch
      accel/ivpu: Do not use cons->aborted for job_done_thread
      accel/ivpu: Use dedicated work for job timeout detection

Stanley Chang (1):
      usb: dwc3: add missing of_node_put and platform_device_put

Stefan Berger (1):
      fs: Pass AT_GETATTR_NOSEC flag to getattr interface function

Stefan Binding (2):
      ALSA: hda/realtek: Add quirks for ASUS 2024 Zenbooks
      ALSA: hda/realtek: Add quirks for HP Laptops

Stefan Eichenberger (5):
      dt-bindings: usb: microchip,usb5744: Add second supply
      usb: misc: onboard-hub: add support for Microchip USB5744
      drm/bridge: lt8912b: Add suspend/resume support
      dt-bindings: display: bridge: lt8912b: Add power supplies
      drm/bridge: lt8912b: Add power supplies

Stefan Roesch (1):
      mm: fix for negative counter: nr_file_hugepages

Stefano Garzarella (1):
      vdpa_sim_blk: allocate the buffer zeroed

Stefano Stabellini (1):
      arm/xen: fix xen_vcpu_info allocation alignment

Steven Price (1):
      drm/panfrost: Remove incorrect IS_ERR() check

Steven Rostedt (Google) (6):
      eventfs: Remove expectation that ei->is_freed means ei->dentry =3D=3D=
 NULL
      eventfs: Do not invalidate dentry in create_file/dir_dentry()
      eventfs: Use GFP_NOFS for allocation when eventfs_mutex is held
      eventfs: Move taking of inode_lock into dcache_dir_open_wrapper()
      eventfs: Do not allow NULL parent to eventfs_start_creating()
      eventfs: Make sure that parent->d_inode is locked in creating files/d=
irs

Stuart Hayhurst (1):
      platform/x86: ideapad-laptop: Set max_brightness before using it

Suman Ghosh (2):
      octeontx2-pf: Fix memory leak during interface down
      octeontx2-pf: Fix ntuple rule creation to direct packet to VF
with higher Rx queue than its PF

Sumeet Pawnikar (2):
      tools/power/turbostat: Add initial support for ArrowLake
      tools/power/turbostat: Add initial support for LunarLake

Suraj Kandpal (3):
      drm/i915/hdcp: Rename HCDP 1.4 enablement function
      drm/i915/hdcp: Convert intel_hdcp_enable to a blanket function
      drm/i915/hdcp: Add more conditions to enable hdcp

Sven Auhagen (1):
      net: mvneta: fix calls to page_pool_get_stats

Swati Sharma (2):
      drm/i915/dsc: Add debugfs entry to validate DSC fractional bpp
      drm/i915/dsc: Allow DSC only with fractional bpp when forced from deb=
ugfs

Thierry Reding (2):
      fbdev/simplefb: Support memory-region property
      fbdev/simplefb: Add support for generic power-domains

Thomas Gleixner (1):
      hrtimers: Push pending hrtimers away from outgoing CPU earlier

Thomas Hellstr=C3=B6m (1):
      Documentation/gpu: VM_BIND locking document

Thomas Richter (1):
      s390/pai: cleanup event initialization

Thomas Zimmermann (74):
      drm/format-helper: Cache buffers with struct drm_format_conv_state
      drm/atomic-helper: Add format-conversion state to shadow-plane state
      drm/format-helper: Pass format-conversion state to helpers
      drm/ofdrm: Preallocate format-conversion buffer in atomic_check
      drm/simpledrm: Preallocate format-conversion buffer in atomic_check
      drm/ssd130x: Preallocate format-conversion buffer in atomic_check
      drm: Remove struct drm_flip_task from DRM interfaces
      drm: Fix flip-task docs
      drm/client: Do not acquire module reference
      drm/ast: Disconnect BMC if physical connector is connected
      Merge drm/drm-next into drm-misc-next
      drm/ast: Turn ioregs_lock to modeset_lock
      drm/ast: Rework I/O register setup
      drm/ast: Retrieve I/O-memory ranges without ast device
      drm/ast: Add I/O helpers without ast device
      drm/ast: Enable VGA without ast device instance
      drm/ast: Enable MMIO without ast device instance
      drm/ast: Partially implement POST without ast device instance
      drm/ast: Add enum ast_config_mode
      drm/ast: Detect ast device type and config mode without ast device
      drm/ast: Move detection code into PCI probe helper
      fbdev/acornfb: Fix name of fb_ops initializer macro
      fbdev/sm712fb: Use correct initializer macros for struct fb_ops
      fbdev/vfb: Set FBINFO_VIRTFB flag
      fbdev/vfb: Initialize fb_ops with fbdev macros
      fbdev/arcfb: Set FBINFO_VIRTFB flag
      fbdev/arcfb: Use generator macros for deferred I/O
      auxdisplay/cfag12864bfb: Set FBINFO_VIRTFB flag
      auxdisplay/cfag12864bfb: Initialize fb_ops with fbdev macros
      auxdisplay/ht16k33: Set FBINFO_VIRTFB flag
      auxdisplay/ht16k33: Initialize fb_ops with fbdev macros
      hid/picolcd_fb: Set FBINFO_VIRTFB flag
      fbdev/sh_mobile_lcdcfb: Set FBINFO_VIRTFB flag
      fbdev/sh_mobile_lcdcfb: Initialize fb_ops with fbdev macros
      fbdev/smscufx: Select correct helpers
      fbdev/udlfb: Select correct helpers
      fbdev/au1200fb: Set FBINFO_VIRTFB flag
      fbdev/au1200fb: Initialize fb_ops with fbdev macros
      fbdev/ps3fb: Set FBINFO_VIRTFB flag
      fbdev/ps3fb: Initialize fb_ops with fbdev macros
      media/ivtvfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/clps711x-fb: Initialize fb_ops with fbdev macros
      fbdev/vt8500lcdfb: Initialize fb_ops with fbdev macros
      fbdev/wm8505fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/cyber2000fb: Initialize fb_ops with fbdev macros
      staging/sm750fb: Declare fb_ops as constant
      staging/sm750fb: Initialize fb_ops with fbdev macros
      fbdev: Rename FB_SYS_FOPS token to FB_SYSMEM_FOPS
      fbdev: Remove trailing whitespaces
      fbdev: Push pgprot_decrypted() into mmap implementations
      fbdev: Move default fb_mmap code into helper function
      fbdev: Warn on incorrect framebuffer access
      fbdev: Remove default file-I/O implementations
      drm: Fix TODO list mentioning non-KMS drivers
      drm: Include <drm/drm_auth.h>
      drm/i915: Include <drm/drm_auth.h>
      accel: Include <drm/drm_auth.h>
      drm: Include <drm/drm_device.h>
      drm/radeon: Do not include <drm/drm_legacy.h>
      drm: Remove entry points for legacy ioctls
      drm: Remove the legacy DRM_IOCTL_MODESET_CTL ioctl
      drm: Remove support for legacy drivers
      drm: Remove locking for legacy ioctls and DRM_UNLOCKED
      drm: Remove source code for non-KMS drivers
      char/agp: Remove frontend code
      drm: Remove Kconfig option for legacy support (CONFIG_DRM_LEGACY)
      drm/plane-helper: Move drm_plane_helper_atomic_check() into udl
      drm/amdgpu: Do not include <drm/drm_plane_helper.h>
      drm/loongson: Do not include <drm/drm_plane_helper.h>
      drm/shmobile: Do not include <drm/drm_plane_helper.h>
      drm/solomon: Do not include <drm/drm_plane_helper.h>
      drm/ofdrm: Do not include <drm/drm_plane_helper.h>
      drm/simpledrm: Do not include <drm/drm_plane_helper.h>
      drm/xlnx: Do not include <drm/drm_plane_helper.h>

Tianci Yin (1):
      drm/amd/display: Enable fast plane updates on DCN3.2 and above

Tomasz Rusinowicz (1):
      accel/ivpu: Add dvfs_mode file to debugfs

Tomi Valkeinen (19):
      Revert "drm/tidss: Annotate dma-fence critical section in commit path=
"
      Revert "drm/omapdrm: Annotate dma-fence critical section in commit pa=
th"
      drm/tilcdc: Fix irq free on unload
      drm/tidss: Use pm_runtime_resume_and_get()
      drm/tidss: Use PM autosuspend
      drm/tidss: Drop useless variable init
      drm/tidss: Move reset to the end of dispc_init()
      drm/tidss: Return error value from from softreset
      drm/tidss: Check for K2G in in dispc_softreset()
      drm/tidss: Add simple K2G manual reset
      drm/tidss: Fix dss reset
      drm/tidss: IRQ code cleanup
      drm/tidss: Fix atomic_flush check
      drm/tidss: Use DRM_PLANE_COMMIT_ACTIVE_ONLY
      drm/drm_file: fix use of uninitialized variable
      drm/framebuffer: Fix use of uninitialized variable
      drm/bridge: cdns-mhdp8546: Fix use of uninitialized variable
      drm/bridge: tc358767: Fix return value on error case
      drm/mipi-dsi: Fix detach call without attach

Tony Lindgren (2):
      dt-bindings: display: simple: Add boe,bp101wx1-100 panel
      drm/panel: simple: Add BOE BP101WX1-100 panel

Tvrtko Ursulin (8):
      drm/sched: Rename drm_sched_get_cleanup_job to be more descriptive
      drm/sched: Move free worker re-queuing out of the if block
      drm/sched: Rename drm_sched_free_job_queue to be more descriptive
      drm/sched: Rename drm_sched_run_job_queue_if_ready and clarify kernel=
doc
      drm/sched: Drop suffix from drm_sched_wakeup_if_can_queue
      drm/i915: Remove unused for_each_uabi_class_engine
      drm/i915: Move for_each_engine* out of i915_drv.h
      drm: Do not round to megabytes for greater than 1MiB sizes in fdinfo =
stats

Uros Bizjak (1):
      x86/hyperv: Use atomic_try_cmpxchg() to micro-optimize hv_nmi_unknown=
()

Uwe Kleine-K=C3=B6nig (17):
      drm/bridge: tpd12s015: Drop buggy __exit annotation for remove functi=
on
      drm/arcpgu: Convert to platform remove callback returning void
      drm/armada: Convert to platform remove callback returning void
      drm/bridge: cdns-mhdp8546: Improve error reporting in remove callback
      drm/bridge: cdns-mhdp8546: Convert to platform remove callback
returning void
      drm/bridge: tpd12s015: Convert to platform remove callback returning =
void
      drm/etnaviv: Convert to platform remove callback returning void
      drm/imx/dcss: Convert to platform remove callback returning void
      drm/imx: lcdc: Convert to platform remove callback returning void
      drm/kmb: Convert to platform remove callback returning void
      drm/mediatek: Convert to platform remove callback returning void
      drm/meson: Convert to platform remove callback returning void
      drm/nouveau: Convert to platform remove callback returning void
      drm/sprd: Convert to platform remove callback returning void
      drm/tilcdc: Convert to platform remove callback returning void
      drm/bridge: ti-sn65dsi86: Simplify using pm_runtime_resume_and_get()
      drm/imx/lcdc: Fix double-free of driver data

Vandita Kulkarni (1):
      drm/i915/dsc/mtl: Add support for fractional bpp

Victor Fragoso (1):
      USB: serial: option: add Fibocom L7xx modules

Victor Lu (1):
      drm/amdgpu: Do not program VF copy regs in mmhub v1.8 under SRIOV (v2=
)

Ville Syrj=C3=A4l=C3=A4 (40):
      drm/i915/bios: Clamp VBT HDMI level shift on BDW
      drm/i915: Use named initializers for DPLL info
      drm/i915: Abstract the extra JSL/EHL DPLL4 power domain better
      drm/i915: Move the DPLL extra power domain handling up one level
      drm/i915: Extract _intel_{enable,disable}_shared_dpll()
      drm/i915: Move the g45 PEG band gap HPD workaround to the HPD code
      drm/i915/mst: Swap TRANSCONF vs. FECSTALL_DIS_DPTSTREAM_DPTTG disable
      drm/i915/mst: Disable transcoder before deleting the payload
      drm/i915/mst: Clear ACT just before triggering payload allocation
      drm/i915/mst: Always write CHICKEN_TRANS
      drm/i915: Bump GLK CDCLK frequency when driving multiple pipes
      drm/i915: Extract hsw_chicken_trans_reg()
      drm/i915: Stop using a 'reg' variable
      drm/i915: Extract mchbar_reg()
      drm/i915/dsi: Remove dead GLK checks
      drm/i915/dsi: Extract port_ctrl_reg()
      drm/dp_mst: Fix fractional DSC bpp handling
      drm/i915: Drop redundant !modeset check
      drm/i915: Split intel_update_crtc() into two parts
      drm/i915: Do plane/etc. updates more atomically across pipes
      drm/i915/gvt: Clean up zero initializers
      drm/i915: Also check for VGA converter in eDP probe
      drm/i915/fbc: Split plane size vs. surface size checks apart
      drm/i915/fbc: Bump max surface size to 8kx4k on icl+
      drm/i915/fbc: Bump ivb FBC max surface size to 4kx4k
      drm/i915: Check pipe active state in {planes,vrr}_{enabling,disabling=
}()
      drm/i915: Call intel_pre_plane_updates() also for pipes getting enabl=
ed
      drm/i915: Polish some RMWs
      drm/i915: Push audio enable/disable further out
      drm/i915: Wrap g4x+ DP/HDMI audio enable/disable
      drm/i915: Split g4x+ DP audio presence detect from port enable
      drm/i915: Split g4x+ HDMI audio presence detect from port enable
      drm/i915: Convert audio enable/disable into encoder vfuncs
      drm/i915: Hoist the encoder->audio_{enable,disable}() calls higher up
      drm/i915: Push audio_{enable,disable}() to the pre/post pane update s=
tage
      drm/i915: Implement audio fastset
      drm: Fix color LUT rounding
      drm/i915: Adjust LUT rounding rules
      drm/i915: s/clamp()/min()/ in i965_lut_11p6_max_pack()
      drm/i915: Fix glk+ degamma LUT conversions

Vinod Govindapillai (3):
      drm/i915/display: debugfs entry to list display capabilities
      drm/i915: remove display device info from i915 capabilities
      drm/i915/xe2lpd: implement WA for underruns while enabling FBC

Vlad Buslov (2):
      net/mlx5e: Fix pedit endianness
      macvlan: Don't propagate promisc change to lower dev in passthru

WANG Rui (2):
      LoongArch: Explicitly set -fdirect-access-external-data for vmlinux
      LoongArch: Record pc instead of offset in la_abs relocation

Wentong Wu (1):
      usb: misc: ljca: Drop _ADR support to get ljca children devices

Will Deacon (1):
      arm64: mm: Fix "rodata=3Don" when CONFIG_RODATA_FULL_DEFAULT_ENABLED=
=3Dy

Willem de Bruijn (2):
      net: gso_test: support CONFIG_MAX_SKB_FRAGS up to 45
      ppp: limit MRU to 64K

Xin Ji (2):
      Revert "drm/bridge: Add 200ms delay to wait FW HPD status stable"
      drm/bridge: anx7625: Fix Set HPD irq detect window to 2ms

Xin Long (1):
      net: sched: do not offload flows with a helper in act_ct

Xuxin Xiong (1):
      drm/panel: auo,b101uan08.3: Fine tune the panel power sequence

Yang Li (4):
      netfilter: nft_set_rbtree: Remove unused variable nft_net
      drm/nouveau/fifo: Remove duplicated include in chan.c
      drm/imagination: Remove unneeded semicolon
      drm/imagination: Remove unneeded semicolon

Yang Wang (1):
      drm/amdgpu: fix ras err_data null pointer issue in amdgpu_ras.c

Yanteng Si (2):
      Docs/LoongArch: Update links in LoongArch introduction.rst
      Docs/zh_CN/LoongArch: Update links in LoongArch introduction.rst

Yihong Cao (1):
      HID: apple: add Jamesdonkey and A3R to non-apple keyboards list

Yonghong Song (1):
      bpf: Do not allocate percpu memory at init stage

Yonglong Liu (3):
      net: hns3: add barrier in vf mailbox reply process
      net: hns3: fix out-of-bounds access may occur when coalesce info
is read via debugfs
      net: hns3: fix variable may not initialized problem in
hns3_init_mac_addr()

YuanShang (1):
      drm/amdgpu: correct chunk_ptr to a pointer to chunk.

Yuran Pereira (2):
      ptp: Fixes a null pointer dereference in ptp_ioctl
      drm/nouveau: Removes unnecessary args check in nouveau_uvmm_sm_prepar=
e

Zack Rusin (8):
      drm: Disable the cursor plane on atomic contexts with virtualized dri=
vers
      drm/atomic: Add support for mouse hotspots
      drm/vmwgfx: Use the hotspot properties from cursor planes
      drm/qxl: Use the hotspot properties from cursor planes
      drm/vboxvideo: Use the hotspot properties from cursor planes
      drm/virtio: Use the hotspot properties from cursor planes
      drm: Remove legacy cursor hotspot code
      drm: Introduce DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT

Zhang Rui (81):
      tools/power/turbostat: Fix failure with new uncore sysfs
      tools/power/turbostat: Fix a knl bug
      tools/power/turbostat: Enable TCC Offset on more models
      tools/power/turbostat: Support alternative graphics sysfs knobs
      tools/power/turbostat: Replace raw value cpu model with Macro
      tools/power/turbostat: Remove redundant duplicates
      tools/power/turbostat: Remove pseudo check for two models
      tools/power/turbostat: Add skeleton support for table driven
feature enumeration
      tools/power/turbostat: Abstract MSR_MISC_FEATURE_CONTROL support
      tools/power/turbostat: Abstract MSR_MISC_PWR_MGMT support
      tools/power/turbostat: Abstract BCLK frequency support
      tools/power/turbostat: Abstract Package cstate limit decoding support
      tools/power/turbostat: Abstract Nehalem MSRs support
      tools/power/turbostat: Remove a redundant check
      tools/power/turbostat: Rename some functions
      tools/power/turbostat: Abstract Turbo Ratio Limit MSRs support
      tools/power/turbostat: Rename some TRL functions
      tools/power/turbostat: Abstract Config TDP MSRs support
      tools/power/turbostat: Abstract TCC Offset bits support
      tools/power/turbostat: Abstract Perf Limit Reasons MSRs support
      tools/power/turbostat: Abstract Automatic Cstate Conversion support
      tools/power/turbostat: Abstract hardcoded Crystal Clock frequency
      tools/power/turbostat: Redefine RAPL macros
      tools/power/turbostat: Simplify the logic for RAPL enumeration
      tools/power/turbostat: Abstract RAPL MSRs support
      tools/power/turbostat: Abstract Per Core RAPL support
      tools/power/turbostat: Abstract RAPL divisor support
      tools/power/turbostat: Abstract fixed DRAM Energy unit support
      tools/power/turbostat: Abstract hardcoded TDP value
      tools/power/turbostat: Remove unused family/model parameters for
RAPL functions
      tools/power/turbostat: Abstract TSC tweak support
      tools/power/turbostat: Add skeleton support for cstate enumeration
      tools/power/turbostat: Adjust cstate for models with .has_nhm_msrs se=
t
      tools/power/turbostat: Adjust cstate for has_snb_msrs() models
      tools/power/turbostat: Adjust cstate for models with .cst_limit set
      tools/power/turbostat: Adjust cstate for has_snb_msrs() models
      tools/power/turbostat: Adjust cstate for has_slv_msrs() models
      tools/power/turbostat: Adjust cstate for is_jvl() models
      tools/power/turbostat: Adjust cstate for is_dnv() models
      tools/power/turbostat: Adjust cstate for is_skx()/is_icx()/is_spr() m=
odels
      tools/power/turbostat: Adjust cstate for is_bdx() models
      tools/power/turbostat: Adjust cstate for has_c8910_msrs() models
      tools/power/turbostat: Adjust cstate for
is_slm()/is_knl()/is_cnl()/is_ehl() models
      tools/power/turbostat: Use fine grained IRTL output
      tools/power/turbostat: Abstract IRTL support
      tools/power/turbostat: Abstract MSR_CORE_C1_RES support
      tools/power/turbostat: Abstract MSR_MODULE_C6_RES_MS support
      tools/power/turbostat: Abstract MSR_CC6/MC6_DEMOTION_POLICY_CONFIG su=
pport
      tools/power/turbostat: Abstract MSR_ATOM_PKG_C6_RESIDENCY support
      tools/power/turbostat: Abstract MSR_KNL_CORE_C6_RESIDENCY support
      tools/power/turbostat: Abstract extended cstate MSRs support
      tools/power/turbostat: Abstract aperf/mperf multiplier support
      tools/power/turbostat: Abstract cstate prewake bit support
      tools/power/turbostat: Delete intel_model_duplicates()
      tools/power/turbostat: Improve probe_platform_features() logic
      tools/power/turbostat: Relocate cstate probing code
      tools/power/turbostat: Relocate pstate probing code
      tools/power/turbostat: Rename uncore probing function
      tools/power/turbostat: Rename rapl probing function
      tools/power/turbostat: Relocate graphics probing code
      tools/power/turbostat: Relocate lpi probing code
      tools/power/turbostat: Relocate thermal probing code
      tools/power/turbostat: Reorder some functions
      tools/power/turbostat: Relocate more probing related code
      tools/power/turbostat: Introduce probe_pm_features()
      tools/power/turbostat: Enable MSR_CORE_C1_RES on recent Intel
client platforms
      tools/power/turbostat: Remove PC7/PC9 support on ADL/RPL
      tools/power/turbostat: Introduce cpu_allowed_set
      tools/power/turbostat: Obey allowed CPUs when accessing CPU counters
      tools/power/turbostat: Obey allowed CPUs during startup
      tools/power/turbostat: Abstract several functions
      tools/power/turbostat: Obey allowed CPUs for primary thread/core dete=
ction
      tools/power/turbostat: Obey allowed CPUs for system summary
      tools/power/turbostat: Handle offlined CPUs in cpu_subset
      tools/power/turbostat: Abstrct function for parsing cpu string
      tools/power/turbostat: Handle cgroup v2 cpu limitation
      tools/power/turbostat: Add MSR_CORE_C1_RES support for spr_features
      tools/power/turbostat: Add initial support for GraniteRapids
      tools/power/turbostat: Add initial support for SierraForest
      tools/power/turbostat: Add initial support for GrandRidge
      x86/acpi: Ignore invalid x2APIC entries

Ziwei Xiao (1):
      gve: Fixes for napi_poll when budget is 0

heminhong (1):
      drm/qxl: remove unused declaration

 Documentation/accel/qaic/aic100.rst                |   11 +-
 Documentation/accel/qaic/qaic.rst                  |   37 +-
 Documentation/arch/loongarch/introduction.rst      |    4 +-
 Documentation/arch/x86/boot.rst                    |    2 +-
 Documentation/core-api/pin_user_pages.rst          |    2 +
 .../bindings/display/bridge/lontium,lt8912b.yaml   |   21 +
 .../bindings/display/msm/dp-controller.yaml        |    2 +
 .../bindings/display/msm/dsi-controller-main.yaml  |    3 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |    1 +
 .../bindings/display/msm/mdss-common.yaml          |   18 +-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |   21 +-
 .../bindings/display/msm/qcom,sc7180-mdss.yaml     |   14 +-
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |   14 +-
 .../bindings/display/msm/qcom,sdm670-mdss.yaml     |  292 +
 .../bindings/display/msm/qcom,sdm845-dpu.yaml      |    4 +-
 .../bindings/display/msm/qcom,sm6115-mdss.yaml     |   10 +
 .../bindings/display/msm/qcom,sm6125-mdss.yaml     |    8 +-
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     |    8 +-
 .../bindings/display/msm/qcom,sm6375-mdss.yaml     |    8 +-
 .../bindings/display/msm/qcom,sm8150-mdss.yaml     |    6 +-
 .../bindings/display/msm/qcom,sm8250-mdss.yaml     |   10 +
 .../bindings/display/msm/qcom,sm8450-mdss.yaml     |   13 +-
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  127 +
 .../bindings/display/msm/qcom,sm8650-mdss.yaml     |  328 ++
 .../bindings/display/panel/himax,hx8394.yaml       |    3 +
 .../bindings/display/panel/ilitek,ili9881c.yaml    |    1 +
 .../bindings/display/panel/newvision,nv3051d.yaml  |    2 +-
 .../bindings/display/panel/panel-simple.yaml       |    4 +
 .../bindings/display/ti/ti,am65x-dss.yaml          |   14 +
 .../devicetree/bindings/gpu/arm,mali-utgard.yaml   |    1 +
 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      |    1 +
 .../devicetree/bindings/gpu/img,powervr.yaml       |   73 +
 .../bindings/net/ethernet-controller.yaml          |    4 +-
 .../devicetree/bindings/ufs/qcom,ufs.yaml          |    2 +
 .../devicetree/bindings/usb/microchip,usb5744.yaml |    7 +-
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |    4 +-
 Documentation/devicetree/bindings/usb/usb-hcd.yaml |    2 +-
 Documentation/filesystems/erofs.rst                |    4 +
 Documentation/gpu/drivers.rst                      |    2 +
 Documentation/gpu/drm-kms-helpers.rst              |    6 +
 Documentation/gpu/drm-kms.rst                      |    8 +
 Documentation/gpu/drm-mm.rst                       |   10 +
 Documentation/gpu/drm-vm-bind-locking.rst          |  582 ++
 Documentation/gpu/imagination/index.rst            |   13 +
 Documentation/gpu/imagination/uapi.rst             |  171 +
 Documentation/gpu/implementation_guidelines.rst    |    1 +
 Documentation/gpu/rfc/xe.rst                       |  132 +-
 Documentation/gpu/todo.rst                         |   47 +-
 Documentation/process/maintainer-netdev.rst        |   20 +-
 .../zh_CN/arch/loongarch/introduction.rst          |    4 +-
 MAINTAINERS                                        |   64 +-
 Makefile                                           |    2 +-
 arch/arm/xen/enlighten.c                           |    3 +-
 arch/arm64/Makefile                                |    2 +-
 arch/arm64/include/asm/setup.h                     |   17 +-
 arch/arm64/mm/pageattr.c                           |    7 +-
 arch/loongarch/Makefile                            |    3 +
 arch/loongarch/include/asm/asmmacro.h              |    3 +-
 arch/loongarch/include/asm/percpu.h                |   11 +-
 arch/loongarch/include/asm/setup.h                 |    2 +-
 arch/loongarch/kernel/relocate.c                   |   10 +-
 arch/loongarch/kernel/time.c                       |   23 +-
 arch/loongarch/mm/pgtable.c                        |    4 +-
 arch/parisc/Kconfig                                |   13 +-
 arch/parisc/include/asm/alternative.h              |    9 +-
 arch/parisc/include/asm/assembly.h                 |    1 +
 arch/parisc/include/asm/bug.h                      |   38 +-
 arch/parisc/include/asm/elf.h                      |   10 +-
 arch/parisc/include/asm/jump_label.h               |    8 +-
 arch/parisc/include/asm/ldcw.h                     |    2 +-
 arch/parisc/include/asm/processor.h                |    2 +
 arch/parisc/include/asm/uaccess.h                  |    1 +
 arch/parisc/include/uapi/asm/errno.h               |    2 -
 arch/parisc/kernel/processor.c                     |    2 +-
 arch/parisc/kernel/sys_parisc.c                    |    2 +-
 arch/parisc/kernel/vmlinux.lds.S                   |    1 +
 arch/s390/include/asm/processor.h                  |    1 -
 arch/s390/kernel/ipl.c                             |    1 +
 arch/s390/kernel/perf_pai_crypto.c                 |   11 +-
 arch/s390/kernel/perf_pai_ext.c                    |    1 -
 arch/x86/events/intel/core.c                       |    2 +-
 arch/x86/hyperv/hv_init.c                          |   25 +-
 arch/x86/include/asm/acpi.h                        |   14 +
 arch/x86/include/asm/xen/hypervisor.h              |    9 +
 arch/x86/kernel/acpi/boot.c                        |   34 +-
 arch/x86/kernel/cpu/microcode/amd.c                |   39 +-
 arch/x86/kernel/cpu/microcode/core.c               |   15 +-
 arch/x86/kernel/cpu/microcode/intel.c              |   17 +-
 arch/x86/kernel/cpu/microcode/internal.h           |   14 +-
 arch/x86/kernel/cpu/mshyperv.c                     |    5 +-
 arch/x86/kernel/signal_64.c                        |    6 +-
 block/bdev.c                                       |    2 +
 block/blk-cgroup.c                                 |   13 +
 block/blk-cgroup.h                                 |    2 -
 block/blk-mq.c                                     |   75 +-
 block/blk-pm.c                                     |   33 +-
 block/blk-throttle.c                               |    2 +
 drivers/accel/drm_accel.c                          |    1 +
 drivers/accel/ivpu/Kconfig                         |   11 +-
 drivers/accel/ivpu/ivpu_debugfs.c                  |   57 +
 drivers/accel/ivpu/ivpu_drv.c                      |   49 +-
 drivers/accel/ivpu/ivpu_drv.h                      |   18 +-
 drivers/accel/ivpu/ivpu_fw.c                       |   79 +-
 drivers/accel/ivpu/ivpu_fw.h                       |    1 +
 drivers/accel/ivpu/ivpu_gem.c                      |  678 +--
 drivers/accel/ivpu/ivpu_gem.h                      |   75 +-
 drivers/accel/ivpu/ivpu_hw.h                       |   20 +
 drivers/accel/ivpu/ivpu_hw_37xx.c                  |  105 +-
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h              |    2 +
 drivers/accel/ivpu/ivpu_hw_40xx.c                  |   69 +-
 drivers/accel/ivpu/ivpu_ipc.c                      |  251 +-
 drivers/accel/ivpu/ivpu_ipc.h                      |   33 +-
 drivers/accel/ivpu/ivpu_job.c                      |   99 +-
 drivers/accel/ivpu/ivpu_job.h                      |    4 +-
 drivers/accel/ivpu/ivpu_jsm_msg.c                  |   38 +
 drivers/accel/ivpu/ivpu_jsm_msg.h                  |    1 +
 drivers/accel/ivpu/ivpu_mmu.c                      |   44 +-
 drivers/accel/ivpu/ivpu_mmu_context.c              |  153 +-
 drivers/accel/ivpu/ivpu_mmu_context.h              |   11 +-
 drivers/accel/ivpu/ivpu_pm.c                       |   75 +-
 drivers/accel/ivpu/ivpu_pm.h                       |    3 +
 drivers/accel/ivpu/vpu_boot_api.h                  |   90 +-
 drivers/accel/ivpu/vpu_jsm_api.h                   |  309 +-
 drivers/accel/qaic/Makefile                        |    3 +-
 drivers/accel/qaic/mhi_controller.c                |   44 +-
 drivers/accel/qaic/mhi_controller.h                |    2 +-
 drivers/accel/qaic/qaic.h                          |   21 +-
 drivers/accel/qaic/qaic_control.c                  |    7 +-
 drivers/accel/qaic/qaic_data.c                     |  147 +-
 drivers/accel/qaic/qaic_drv.c                      |   98 +-
 drivers/accel/qaic/qaic_timesync.c                 |  395 ++
 drivers/accel/qaic/qaic_timesync.h                 |   11 +
 drivers/acpi/acpi_video.c                          |    2 +-
 drivers/acpi/device_pm.c                           |   13 +
 drivers/acpi/processor_idle.c                      |    2 +-
 drivers/acpi/resource.c                            |    7 +
 drivers/ata/pata_isapnp.c                          |    3 +
 drivers/auxdisplay/Kconfig                         |   10 +-
 drivers/auxdisplay/cfag12864bfb.c                  |   10 +-
 drivers/auxdisplay/ht16k33.c                       |   10 +-
 drivers/block/nbd.c                                |  117 +-
 drivers/block/null_blk/main.c                      |   25 +-
 drivers/char/agp/Makefile                          |    6 -
 drivers/char/agp/agp.h                             |    9 -
 drivers/char/agp/backend.c                         |   11 -
 drivers/char/agp/compat_ioctl.c                    |  291 -
 drivers/char/agp/compat_ioctl.h                    |  106 -
 drivers/char/agp/frontend.c                        | 1068 ----
 drivers/dma-buf/dma-buf.c                          |    4 +-
 drivers/dma-buf/dma-fence.c                        |    3 +-
 drivers/dma-buf/sw_sync.c                          |   82 +
 drivers/dma-buf/sync_debug.h                       |    2 +
 drivers/dma-buf/sync_file.c                        |   19 +
 drivers/dpll/dpll_netlink.c                        |   17 +-
 drivers/firmware/Kconfig                           |    2 +-
 drivers/firmware/qemu_fw_cfg.c                     |    2 +-
 drivers/gpu/drm/Kconfig                            |   36 +-
 drivers/gpu/drm/Makefile                           |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    1 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    7 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   33 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    8 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   36 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   18 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |    6 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    3 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   10 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    1 +
 .../display/dc/dcn35/dcn35_dio_stream_encoder.c    |   10 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |    3 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   22 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   50 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |   10 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   10 +-
 drivers/gpu/drm/armada/armada_crtc.c               |   29 +-
 drivers/gpu/drm/armada/armada_drv.c                |    5 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |   10 +-
 drivers/gpu/drm/ast/ast_drv.c                      |  263 +-
 drivers/gpu/drm/ast/ast_drv.h                      |  114 +-
 drivers/gpu/drm/ast/ast_main.c                     |  244 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   88 +-
 drivers/gpu/drm/ast/ast_post.c                     |   73 +-
 drivers/gpu/drm/ast/ast_reg.h                      |   12 +-
 drivers/gpu/drm/bridge/Kconfig                     |   17 +
 drivers/gpu/drm/bridge/Makefile                    |    2 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   54 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |    4 +
 drivers/gpu/drm/bridge/aux-bridge.c                |  140 +
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |  163 +
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   22 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c    |    3 +-
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c        |    4 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   58 +
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |    6 +-
 drivers/gpu/drm/bridge/tc358767.c                  |    2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |    6 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |    6 +-
 drivers/gpu/drm/ci/build.sh                        |    3 +
 drivers/gpu/drm/ci/xfails/requirements.txt         |    6 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |  161 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  234 +-
 drivers/gpu/drm/drm_agpsupport.c                   |  451 --
 drivers/gpu/drm/drm_atomic.c                       |    9 +
 drivers/gpu/drm/drm_atomic_helper.c                |   20 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          |   14 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |   97 +-
 drivers/gpu/drm/drm_auth.c                         |    8 +-
 drivers/gpu/drm/drm_bridge.c                       |   44 -
 drivers/gpu/drm/drm_bridge_connector.c             |    6 -
 drivers/gpu/drm/drm_bufs.c                         | 1627 -----
 drivers/gpu/drm/drm_client.c                       |   12 +-
 drivers/gpu/drm/drm_connector.c                    |    6 +
 drivers/gpu/drm/drm_context.c                      |  513 --
 drivers/gpu/drm/drm_crtc_helper.c                  |    7 +-
 drivers/gpu/drm/drm_crtc_internal.h                |    4 +-
 drivers/gpu/drm/drm_damage_helper.c                |    3 +-
 drivers/gpu/drm/drm_debugfs.c                      |   65 +-
 drivers/gpu/drm/drm_dma.c                          |  178 -
 drivers/gpu/drm/drm_drv.c                          |   27 +-
 drivers/gpu/drm/drm_edid.c                         |   43 +-
 drivers/gpu/drm/drm_edid_load.c                    |   16 -
 drivers/gpu/drm/drm_eld.c                          |   55 +
 drivers/gpu/drm/drm_encoder.c                      |    4 +
 drivers/gpu/drm/drm_exec.c                         |   13 +-
 drivers/gpu/drm/drm_file.c                         |   68 +-
 drivers/gpu/drm/drm_flip_work.c                    |   27 +-
 drivers/gpu/drm/drm_format_helper.c                |  215 +-
 drivers/gpu/drm/drm_framebuffer.c                  |   77 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |    9 +
 drivers/gpu/drm/drm_gpuvm.c                        | 1168 +++-
 drivers/gpu/drm/drm_hashtab.c                      |  203 -
 drivers/gpu/drm/drm_internal.h                     |   23 +-
 drivers/gpu/drm/drm_ioc32.c                        |  613 +-
 drivers/gpu/drm/drm_ioctl.c                        |   96 +-
 drivers/gpu/drm/drm_irq.c                          |  204 -
 drivers/gpu/drm/drm_kms_helper_common.c            |   32 -
 drivers/gpu/drm/drm_legacy.h                       |  290 -
 drivers/gpu/drm/drm_legacy_misc.c                  |  105 -
 drivers/gpu/drm/drm_lock.c                         |  373 --
 drivers/gpu/drm/drm_memory.c                       |  138 -
 drivers/gpu/drm/drm_mipi_dbi.c                     |   19 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |   17 +-
 drivers/gpu/drm/drm_mode_object.c                  |    2 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |    6 +
 drivers/gpu/drm/drm_pci.c                          |  204 +-
 drivers/gpu/drm/drm_plane.c                        |  150 +-
 drivers/gpu/drm/drm_plane_helper.c                 |   32 -
 drivers/gpu/drm/drm_scatter.c                      |  220 -
 drivers/gpu/drm/drm_syncobj.c                      |   64 +-
 drivers/gpu/drm/drm_vblank.c                       |  101 -
 drivers/gpu/drm/drm_vm.c                           |  665 ---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |    6 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |    2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |    7 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |    9 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |   30 +-
 drivers/gpu/drm/i915/Kconfig                       |    2 +-
 drivers/gpu/drm/i915/Makefile                      |  180 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |   46 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   66 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |    4 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |    2 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   10 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |    3 -
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   83 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |   17 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |    9 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |   32 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |    5 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   70 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    4 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |    1 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  160 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |   16 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  177 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |    5 +
 drivers/gpu/drm/i915/display/intel_display.c       |  560 +-
 drivers/gpu/drm/i915/display/intel_display.h       |    9 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   20 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   98 +
 .../i915/display/intel_display_debugfs_params.c    |  176 +
 .../i915/display/intel_display_debugfs_params.h    |   13 +
 .../gpu/drm/i915/display/intel_display_device.c    |   13 +-
 .../gpu/drm/i915/display/intel_display_device.h    |    1 +
 .../gpu/drm/i915/display/intel_display_driver.c    |    7 +
 .../gpu/drm/i915/display/intel_display_params.c    |  217 +
 .../gpu/drm/i915/display/intel_display_params.h    |   61 +
 drivers/gpu/drm/i915/display/intel_display_power.c |   14 +-
 .../drm/i915/display/intel_display_power_well.c    |   23 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |    2 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   31 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  502 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |   26 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |   99 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |    4 +-
 drivers/gpu/drm/i915/display/intel_dp_aux_regs.h   |   14 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  662 ++-
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |    5 +
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |  171 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.h      |    5 +
 drivers/gpu/drm/i915/display/intel_dpll.c          |  270 +-
 drivers/gpu/drm/i915/display/intel_dpll.h          |    9 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  187 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    6 +
 drivers/gpu/drm/i915/display/intel_dpt.c           |   24 -
 drivers/gpu/drm/i915/display/intel_dpt.h           |    2 -
 drivers/gpu/drm/i915/display/intel_dpt_common.c    |   34 +
 drivers/gpu/drm/i915/display/intel_dpt_common.h    |   13 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |   98 +-
 drivers/gpu/drm/i915/display/intel_dsb_buffer.c    |   82 +
 drivers/gpu/drm/i915/display/intel_dsb_buffer.h    |   29 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |  353 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |    8 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   57 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |    8 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |    2 -
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   37 +-
 drivers/gpu/drm/i915/display/intel_hdcp.h          |    8 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   10 -
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |   16 +
 drivers/gpu/drm/i915/display/intel_link_bw.c       |   30 +-
 drivers/gpu/drm/i915/display/intel_link_bw.h       |    1 +
 drivers/gpu/drm/i915/display/intel_lvds.c          |    4 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |    6 +
 .../gpu/drm/i915/display/intel_modeset_verify.c    |    2 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |    2 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |    4 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |    1 +
 drivers/gpu/drm/i915/display/intel_pps.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  369 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |    7 +
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |    2 +
 drivers/gpu/drm/i915/display/intel_qp_tables.c     |    3 -
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   24 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |    7 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   29 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   28 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |    5 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   21 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    1 +
 .../gpu/drm/i915/gem/i915_gem_object_frontbuffer.h |    1 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.h          |    1 +
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   11 -
 drivers/gpu/drm/i915/gt/intel_gt.h                 |   14 +
 drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c |    2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    2 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |    6 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |    3 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    4 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   12 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   20 +-
 drivers/gpu/drm/i915/i915_gem.c                    |    2 -
 drivers/gpu/drm/i915/i915_gpu_error.c              |    5 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |    2 +
 drivers/gpu/drm/i915/i915_params.c                 |   89 -
 drivers/gpu/drm/i915/i915_params.h                 |   22 -
 drivers/gpu/drm/i915/i915_reg.h                    |    2 -
 drivers/gpu/drm/i915/i915_utils.h                  |    2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.h            |    2 -
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |    2 +
 drivers/gpu/drm/i915/soc/intel_gmch.c              |   27 +-
 drivers/gpu/drm/i915/vlv_sideband.c                |   29 +-
 drivers/gpu/drm/i915/vlv_sideband.h                |    9 +-
 drivers/gpu/drm/imagination/Kconfig                |   18 +
 drivers/gpu/drm/imagination/Makefile               |   35 +
 drivers/gpu/drm/imagination/pvr_ccb.c              |  645 ++
 drivers/gpu/drm/imagination/pvr_ccb.h              |   71 +
 drivers/gpu/drm/imagination/pvr_cccb.c             |  267 +
 drivers/gpu/drm/imagination/pvr_cccb.h             |  110 +
 drivers/gpu/drm/imagination/pvr_context.c          |  464 ++
 drivers/gpu/drm/imagination/pvr_context.h          |  205 +
 drivers/gpu/drm/imagination/pvr_debugfs.c          |   53 +
 drivers/gpu/drm/imagination/pvr_debugfs.h          |   29 +
 drivers/gpu/drm/imagination/pvr_device.c           |  658 +++
 drivers/gpu/drm/imagination/pvr_device.h           |  721 +++
 drivers/gpu/drm/imagination/pvr_device_info.c      |  255 +
 drivers/gpu/drm/imagination/pvr_device_info.h      |  186 +
 drivers/gpu/drm/imagination/pvr_drv.c              | 1501 +++++
 drivers/gpu/drm/imagination/pvr_drv.h              |  129 +
 drivers/gpu/drm/imagination/pvr_free_list.c        |  625 ++
 drivers/gpu/drm/imagination/pvr_free_list.h        |  195 +
 drivers/gpu/drm/imagination/pvr_fw.c               | 1489 +++++
 drivers/gpu/drm/imagination/pvr_fw.h               |  509 ++
 drivers/gpu/drm/imagination/pvr_fw_info.h          |  135 +
 drivers/gpu/drm/imagination/pvr_fw_meta.c          |  555 ++
 drivers/gpu/drm/imagination/pvr_fw_meta.h          |   14 +
 drivers/gpu/drm/imagination/pvr_fw_mips.c          |  252 +
 drivers/gpu/drm/imagination/pvr_fw_mips.h          |   48 +
 drivers/gpu/drm/imagination/pvr_fw_startstop.c     |  306 +
 drivers/gpu/drm/imagination/pvr_fw_startstop.h     |   13 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c         |  471 ++
 drivers/gpu/drm/imagination/pvr_fw_trace.h         |   78 +
 drivers/gpu/drm/imagination/pvr_gem.c              |  414 ++
 drivers/gpu/drm/imagination/pvr_gem.h              |  170 +
 drivers/gpu/drm/imagination/pvr_hwrt.c             |  549 ++
 drivers/gpu/drm/imagination/pvr_hwrt.h             |  166 +
 drivers/gpu/drm/imagination/pvr_job.c              |  786 +++
 drivers/gpu/drm/imagination/pvr_job.h              |  161 +
 drivers/gpu/drm/imagination/pvr_mmu.c              | 2640 +++++++++
 drivers/gpu/drm/imagination/pvr_mmu.h              |  108 +
 drivers/gpu/drm/imagination/pvr_params.c           |  147 +
 drivers/gpu/drm/imagination/pvr_params.h           |   72 +
 drivers/gpu/drm/imagination/pvr_power.c            |  433 ++
 drivers/gpu/drm/imagination/pvr_power.h            |   41 +
 drivers/gpu/drm/imagination/pvr_queue.c            | 1432 +++++
 drivers/gpu/drm/imagination/pvr_queue.h            |  169 +
 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h    | 6193 ++++++++++++++++=
++++
 .../gpu/drm/imagination/pvr_rogue_cr_defs_client.h |  159 +
 drivers/gpu/drm/imagination/pvr_rogue_defs.h       |  179 +
 drivers/gpu/drm/imagination/pvr_rogue_fwif.h       | 2188 +++++++
 drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h |  493 ++
 .../gpu/drm/imagination/pvr_rogue_fwif_client.h    |  373 ++
 .../drm/imagination/pvr_rogue_fwif_client_check.h  |  133 +
 .../gpu/drm/imagination/pvr_rogue_fwif_common.h    |   60 +
 .../gpu/drm/imagination/pvr_rogue_fwif_dev_info.h  |  113 +
 .../imagination/pvr_rogue_fwif_resetframework.h    |   28 +
 drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h    | 1648 ++++++
 .../gpu/drm/imagination/pvr_rogue_fwif_shared.h    |  258 +
 .../drm/imagination/pvr_rogue_fwif_shared_check.h  |  108 +
 .../gpu/drm/imagination/pvr_rogue_fwif_stream.h    |   78 +
 .../gpu/drm/imagination/pvr_rogue_heap_config.h    |  113 +
 drivers/gpu/drm/imagination/pvr_rogue_meta.h       |  356 ++
 drivers/gpu/drm/imagination/pvr_rogue_mips.h       |  335 ++
 drivers/gpu/drm/imagination/pvr_rogue_mips_check.h |   58 +
 drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h   |  136 +
 drivers/gpu/drm/imagination/pvr_stream.c           |  285 +
 drivers/gpu/drm/imagination/pvr_stream.h           |   75 +
 drivers/gpu/drm/imagination/pvr_stream_defs.c      |  351 ++
 drivers/gpu/drm/imagination/pvr_stream_defs.h      |   16 +
 drivers/gpu/drm/imagination/pvr_sync.c             |  289 +
 drivers/gpu/drm/imagination/pvr_sync.h             |   84 +
 drivers/gpu/drm/imagination/pvr_vm.c               | 1092 ++++
 drivers/gpu/drm/imagination/pvr_vm.h               |   66 +
 drivers/gpu/drm/imagination/pvr_vm_mips.c          |  237 +
 drivers/gpu/drm/imagination/pvr_vm_mips.h          |   22 +
 drivers/gpu/drm/imx/dcss/dcss-drv.c                |    6 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                |    9 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |   15 +-
 drivers/gpu/drm/kmb/kmb_drv.c                      |    5 +-
 drivers/gpu/drm/lima/lima_device.c                 |    2 +-
 drivers/gpu/drm/lima/lima_sched.c                  |    4 +-
 drivers/gpu/drm/loongson/Kconfig                   |    1 +
 drivers/gpu/drm/loongson/lsdc_plane.c              |    1 -
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |    5 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |    5 +-
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |    6 +-
 drivers/gpu/drm/msm/Kconfig                        |    2 +
 drivers/gpu/drm/msm/Makefile                       |    1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   21 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  122 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    8 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |    3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |    9 +
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  457 ++
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   17 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   17 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |  104 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   17 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |   18 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |    8 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |   32 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   17 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |    7 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   11 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |    4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |    7 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |   51 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   16 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |   26 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   51 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   33 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  186 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   21 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   75 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   55 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  130 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  223 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   72 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c         |  247 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h         |  142 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   52 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   28 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |   12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |    7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |   16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h        |   12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |   20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h     |   13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   37 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   37 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |    8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |   70 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c        |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |    8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   79 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  105 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  141 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   13 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   42 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c   |   32 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c   |   37 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |   87 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |   24 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |    1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   30 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c           |   21 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h           |    1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c       |   29 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   28 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c         |   10 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h         |    4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c          |   10 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h          |    4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |   19 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h           |    1 -
 drivers/gpu/drm/msm/dp/dp_aux.c                    |   39 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                  |   69 +-
 drivers/gpu/drm/msm/dp/dp_debug.h                  |   23 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  384 +-
 drivers/gpu/drm/msm/dp/dp_display.h                |    4 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   33 +-
 drivers/gpu/drm/msm/dp/dp_power.c                  |   32 +-
 drivers/gpu/drm/msm/dp/dp_power.h                  |   11 -
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   17 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   10 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |   29 +-
 drivers/gpu/drm/msm/msm_debugfs.c                  |   41 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   96 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   15 +-
 drivers/gpu/drm/msm/msm_gem.c                      |    7 +-
 drivers/gpu/drm/msm/msm_gem.h                      |   17 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c             |    2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |  235 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   44 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |    2 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |  106 +-
 drivers/gpu/drm/msm/msm_mdss.h                     |    1 +
 drivers/gpu/drm/msm/msm_rd.c                       |    3 +
 drivers/gpu/drm/msm/msm_ringbuffer.c               |    5 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |   10 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   10 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/event.h  |    4 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |   19 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.h            |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   15 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h               |    5 +
 drivers/gpu/drm/nouveau/nouveau_display.c          |    5 +
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   36 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |   19 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c             |   68 +-
 drivers/gpu/drm/nouveau/nouveau_exec.h             |    6 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   10 +-
 drivers/gpu/drm/nouveau/nouveau_platform.c         |    5 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c            |  207 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h            |   43 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |  380 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.h             |   12 +-
 drivers/gpu/drm/nouveau/nv04_fence.c               |    2 +-
 drivers/gpu/drm/nouveau/nvkm/core/event.c          |   12 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c    |    1 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |    6 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c                |    4 +-
 drivers/gpu/drm/omapdrm/dss/dss.c                  |    5 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    9 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |   14 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |    9 +-
 drivers/gpu/drm/panel/panel-edp.c                  |  138 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |   37 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |  180 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |  225 +
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |   57 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |    2 +-
 drivers/gpu/drm/panel/panel-simple.c               |   75 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         |   81 +-
 drivers/gpu/drm/panfrost/panfrost_device.h         |   23 +
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    5 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c           |   12 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |  119 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.h            |    1 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |   30 +-
 drivers/gpu/drm/panfrost/panfrost_job.h            |    1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |   32 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.h            |    1 +
 drivers/gpu/drm/panfrost/panfrost_regs.h           |    1 +
 drivers/gpu/drm/qxl/qxl_display.c                  |   14 +-
 drivers/gpu/drm/qxl/qxl_drv.c                      |    2 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |    7 -
 drivers/gpu/drm/radeon/radeon_audio.c              |    1 +
 drivers/gpu/drm/radeon/radeon_drv.h                |    1 -
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c |    1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   45 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   14 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |    5 +
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |    2 +
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h    |    2 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |   18 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  492 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |   38 +-
 drivers/gpu/drm/solomon/ssd130x.h                  |    1 -
 drivers/gpu/drm/sprd/sprd_dpu.c                    |    6 +-
 drivers/gpu/drm/sprd/sprd_drm.c                    |    5 +-
 drivers/gpu/drm/sprd/sprd_dsi.c                    |    6 +-
 drivers/gpu/drm/tegra/hdmi.c                       |    1 +
 drivers/gpu/drm/tegra/sor.c                        |    1 +
 drivers/gpu/drm/tests/Makefile                     |    5 +-
 drivers/gpu/drm/tests/drm_buddy_test.c             |  465 --
 drivers/gpu/drm/tests/drm_dp_mst_helper_test.c     |  166 +-
 drivers/gpu/drm/tests/drm_exec_test.c              |   16 +-
 drivers/gpu/drm/tests/drm_format_helper_test.c     |   72 +-
 drivers/gpu/drm/tests/drm_gem_shmem_test.c         |  383 ++
 drivers/gpu/drm/tests/drm_mm_test.c                | 2016 +------
 drivers/gpu/drm/tidss/tidss_crtc.c                 |   12 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  138 +-
 drivers/gpu/drm/tidss/tidss_dispc.h                |    3 +
 drivers/gpu/drm/tidss/tidss_drv.c                  |   16 +-
 drivers/gpu/drm/tidss/tidss_irq.c                  |   54 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |    6 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |   11 +-
 drivers/gpu/drm/tiny/arcpgu.c                      |    6 +-
 drivers/gpu/drm/tiny/cirrus.c                      |    3 +-
 drivers/gpu/drm/tiny/ili9225.c                     |   10 +-
 drivers/gpu/drm/tiny/ofdrm.c                       |   17 +-
 drivers/gpu/drm/tiny/repaper.c                     |   10 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |   44 +-
 drivers/gpu/drm/tiny/st7586.c                      |   19 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |    8 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |    6 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |   19 +-
 drivers/gpu/drm/v3d/Makefile                       |    4 +-
 drivers/gpu/drm/v3d/v3d_bo.c                       |   51 +
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |  178 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |   50 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |  165 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |  779 +--
 drivers/gpu/drm/v3d/v3d_irq.c                      |   93 +-
 drivers/gpu/drm/v3d/v3d_regs.h                     |   94 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |  397 +-
 drivers/gpu/drm/v3d/v3d_submit.c                   | 1320 +++++
 drivers/gpu/drm/v3d/v3d_sysfs.c                    |   69 +
 drivers/gpu/drm/v3d/v3d_trace.h                    |   57 +
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |    4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |    5 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   41 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   18 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |   25 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   20 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |    1 -
 drivers/hid/hid-apple.c                            |    2 +
 drivers/hid/hid-asus.c                             |   27 +-
 drivers/hid/hid-core.c                             |   12 +-
 drivers/hid/hid-debug.c                            |    3 +
 drivers/hid/hid-glorious.c                         |   16 +-
 drivers/hid/hid-ids.h                              |   12 +-
 drivers/hid/hid-logitech-dj.c                      |   11 +-
 drivers/hid/hid-mcp2221.c                          |    4 +-
 drivers/hid/hid-multitouch.c                       |    5 +
 drivers/hid/hid-picolcd_fb.c                       |    1 +
 drivers/hid/hid-quirks.c                           |    1 +
 drivers/i2c/busses/i2c-designware-common.c         |   16 +-
 drivers/i2c/busses/i2c-ocores.c                    |    4 +-
 drivers/i2c/busses/i2c-pxa.c                       |   76 +-
 drivers/irqchip/irq-gic-v3-its.c                   |   16 +-
 drivers/md/bcache/bcache.h                         |    1 +
 drivers/md/bcache/btree.c                          |   11 +-
 drivers/md/bcache/super.c                          |    4 +-
 drivers/md/bcache/sysfs.c                          |    2 +-
 drivers/md/bcache/writeback.c                      |   24 +-
 drivers/md/dm-bufio.c                              |   87 +-
 drivers/md/dm-crypt.c                              |    2 +-
 drivers/md/dm-delay.c                              |  112 +-
 drivers/md/dm-verity-fec.c                         |    4 +-
 drivers/md/dm-verity-target.c                      |   23 +-
 drivers/md/dm-verity.h                             |    2 +-
 drivers/md/md.c                                    |    3 +-
 drivers/media/pci/ivtv/Kconfig                     |    4 +-
 drivers/media/pci/ivtv/ivtvfb.c                    |    6 +-
 drivers/net/bonding/bond_main.c                    |    6 +
 drivers/net/ethernet/amd/pds_core/adminq.c         |    2 +-
 drivers/net/ethernet/amd/pds_core/core.h           |    2 +-
 drivers/net/ethernet/amd/pds_core/dev.c            |    8 +-
 drivers/net/ethernet/amd/pds_core/devlink.c        |    2 +-
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c           |   14 +
 drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c       |   11 +-
 drivers/net/ethernet/amd/xgbe/xgbe-mdio.c          |   14 +-
 drivers/net/ethernet/broadcom/tg3.c                |   42 +-
 drivers/net/ethernet/broadcom/tg3.h                |    4 +-
 drivers/net/ethernet/cortina/gemini.c              |   45 +-
 drivers/net/ethernet/cortina/gemini.h              |    4 +-
 drivers/net/ethernet/google/gve/gve_main.c         |    8 +-
 drivers/net/ethernet/google/gve/gve_rx.c           |    4 -
 drivers/net/ethernet/google/gve/gve_tx.c           |    4 -
 drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c |    9 +-
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c    |    2 +-
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    |   33 +-
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c  |   25 +-
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_main.h  |    1 +
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c   |    7 +
 drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c |   16 +-
 drivers/net/ethernet/intel/ice/ice_ddp.c           |  103 +-
 drivers/net/ethernet/intel/ice/ice_dpll.c          |   21 +-
 drivers/net/ethernet/intel/ice/ice_dpll.h          |    1 -
 drivers/net/ethernet/intel/ice/ice_main.c          |   12 +-
 drivers/net/ethernet/intel/ice/ice_ptp.c           |  144 +-
 drivers/net/ethernet/intel/ice/ice_ptp.h           |    5 +-
 drivers/net/ethernet/intel/ice/ice_ptp_hw.c        |   54 +
 drivers/net/ethernet/intel/ice/ice_ptp_hw.h        |    2 +
 drivers/net/ethernet/intel/ice/ice_txrx.c          |    3 -
 drivers/net/ethernet/intel/ice/ice_txrx.h          |    1 -
 drivers/net/ethernet/marvell/mvneta.c              |   28 +-
 .../ethernet/marvell/octeontx2/nic/otx2_flows.c    |   20 +-
 .../net/ethernet/marvell/octeontx2/nic/otx2_pf.c   |    2 +
 drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c   |   20 +-
 .../ethernet/mellanox/mlx5/core/en/reporter_rx.c   |    4 +-
 .../net/ethernet/mellanox/mlx5/core/en/tc_tun.c    |   30 +-
 .../net/ethernet/mellanox/mlx5/core/en_ethtool.c   |   13 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_rep.c   |   12 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c    |   60 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_tx.c    |    4 +-
 drivers/net/ethernet/mellanox/mlx5/core/eq.c       |   25 +-
 .../ethernet/mellanox/mlx5/core/eswitch_offloads.c |    3 +-
 .../net/ethernet/mellanox/mlx5/core/irq_affinity.c |   42 -
 .../net/ethernet/mellanox/mlx5/core/lib/clock.c    |    7 +-
 drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c  |    6 +-
 drivers/net/ethernet/mellanox/mlx5/core/pci_irq.h  |    3 +
 .../mellanox/mlx5/core/steering/dr_action.c        |    3 +-
 .../ethernet/mellanox/mlx5/core/steering/dr_send.c |  115 +-
 drivers/net/ethernet/realtek/r8169_main.c          |   46 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |    2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |    3 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c       |   15 +-
 drivers/net/ethernet/wangxun/libwx/wx_hw.c         |    8 +-
 drivers/net/ethernet/wangxun/ngbe/ngbe_main.c      |    4 +-
 drivers/net/ethernet/wangxun/txgbe/txgbe_main.c    |    4 +-
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c  |    2 +-
 drivers/net/hyperv/netvsc_drv.c                    |   66 +-
 drivers/net/ipa/reg/gsi_reg-v5.0.c                 |    2 +-
 drivers/net/ipvlan/ipvlan_core.c                   |   41 +-
 drivers/net/macvlan.c                              |    2 +-
 drivers/net/netkit.c                               |   22 +-
 drivers/net/ppp/ppp_synctty.c                      |    6 +-
 drivers/net/usb/aqc111.c                           |    8 +-
 drivers/net/usb/ax88179_178a.c                     |    4 +-
 drivers/net/usb/qmi_wwan.c                         |    1 +
 drivers/net/veth.c                                 |   46 +-
 drivers/net/vrf.c                                  |   38 +-
 drivers/net/wireguard/device.c                     |    4 +-
 drivers/net/wireguard/receive.c                    |   12 +-
 drivers/net/wireguard/send.c                       |    3 +-
 drivers/nfc/virtual_ncidev.c                       |    7 +-
 drivers/nvme/host/auth.c                           |    5 +-
 drivers/nvme/host/core.c                           |   21 +-
 drivers/nvme/host/fabrics.c                        |    2 +
 drivers/nvme/host/fc.c                             |   19 +-
 drivers/nvme/host/rdma.c                           |    1 +
 drivers/nvme/host/tcp.c                            |   32 +-
 drivers/nvme/target/Kconfig                        |    4 +-
 drivers/nvme/target/configfs.c                     |    2 +-
 drivers/nvme/target/fabrics-cmd.c                  |    4 +
 drivers/nvme/target/tcp.c                          |    4 +-
 drivers/parisc/power.c                             |    2 +-
 drivers/phy/Kconfig                                |    1 -
 drivers/phy/Makefile                               |    1 -
 drivers/phy/qualcomm/Kconfig                       |    2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          |   44 +-
 drivers/phy/realtek/Kconfig                        |   32 -
 drivers/phy/realtek/Makefile                       |    3 -
 drivers/phy/realtek/phy-rtk-usb2.c                 | 1325 -----
 drivers/phy/realtek/phy-rtk-usb3.c                 |  761 ---
 drivers/platform/x86/amd/pmc/pmc.c                 |   31 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       |   26 +-
 drivers/platform/x86/ideapad-laptop.c              |   11 +-
 drivers/platform/x86/intel/telemetry/core.c        |    4 +-
 drivers/ptp/ptp_chardev.c                          |    3 +-
 drivers/ptp/ptp_clock.c                            |    5 +-
 drivers/ptp/ptp_private.h                          |    8 +-
 drivers/ptp/ptp_sysfs.c                            |    3 +-
 drivers/s390/block/dasd.c                          |   24 +-
 drivers/s390/block/dasd_int.h                      |    2 +-
 drivers/s390/net/Kconfig                           |    3 +-
 drivers/s390/net/ism_drv.c                         |   93 +-
 drivers/scsi/qla2xxx/qla_os.c                      |   12 +-
 drivers/scsi/scsi_debug.c                          |    9 +-
 drivers/scsi/sd.c                                  |   53 +-
 drivers/soc/qcom/Kconfig                           |    1 +
 drivers/soc/qcom/pmic_glink_altmode.c              |   33 +-
 drivers/staging/sm750fb/sm750.c                    |   65 +-
 drivers/thunderbolt/switch.c                       |    6 +-
 drivers/thunderbolt/tb.c                           |   12 +-
 drivers/ufs/core/ufs-mcq.c                         |    5 +-
 drivers/usb/cdns3/cdnsp-ring.c                     |    3 +
 drivers/usb/core/config.c                          |    3 +-
 drivers/usb/core/hub.c                             |   23 -
 drivers/usb/dwc2/hcd_intr.c                        |   15 +-
 drivers/usb/dwc3/core.c                            |    2 +
 drivers/usb/dwc3/drd.c                             |    2 +-
 drivers/usb/dwc3/dwc3-qcom.c                       |   69 +-
 drivers/usb/dwc3/dwc3-rtk.c                        |    8 +-
 drivers/usb/host/xhci-mtk-sch.c                    |   13 +-
 drivers/usb/host/xhci-mtk.h                        |    2 +
 drivers/usb/host/xhci-plat.c                       |   50 +-
 drivers/usb/misc/onboard_usb_hub.c                 |    2 +
 drivers/usb/misc/onboard_usb_hub.h                 |    7 +
 drivers/usb/misc/usb-ljca.c                        |   17 +-
 drivers/usb/serial/option.c                        |   11 +-
 drivers/usb/typec/mux/Kconfig                      |    2 +-
 drivers/usb/typec/mux/nb7vpq904m.c                 |   44 +-
 drivers/usb/typec/tcpm/Kconfig                     |    1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |   41 +-
 drivers/usb/typec/tcpm/tcpm.c                      |   12 +-
 drivers/usb/typec/tipd/core.c                      |   14 +-
 drivers/vdpa/vdpa_sim/vdpa_sim_blk.c               |    4 +-
 drivers/vhost/vdpa.c                               |    1 -
 drivers/video/fbdev/Kconfig                        |   50 +-
 drivers/video/fbdev/acornfb.c                      |    2 +-
 drivers/video/fbdev/amba-clcd.c                    |    2 +
 drivers/video/fbdev/arcfb.c                        |  114 +-
 drivers/video/fbdev/au1100fb.c                     |    2 +
 drivers/video/fbdev/au1200fb.c                     |   11 +-
 drivers/video/fbdev/clps711x-fb.c                  |    4 +-
 drivers/video/fbdev/core/Kconfig                   |    7 +-
 drivers/video/fbdev/core/Makefile                  |    2 +-
 drivers/video/fbdev/core/cfbcopyarea.c             |    3 +
 drivers/video/fbdev/core/cfbfillrect.c             |    3 +
 drivers/video/fbdev/core/cfbimgblt.c               |    3 +
 drivers/video/fbdev/core/fb_chrdev.c               |   68 +-
 drivers/video/fbdev/core/fb_defio.c                |    2 +
 drivers/video/fbdev/core/fb_io_fops.c              |   36 +
 drivers/video/fbdev/core/fb_sys_fops.c             |    6 +
 drivers/video/fbdev/core/syscopyarea.c             |    3 +
 drivers/video/fbdev/core/sysfillrect.c             |    3 +
 drivers/video/fbdev/core/sysimgblt.c               |    3 +
 drivers/video/fbdev/cyber2000fb.c                  |    9 +-
 drivers/video/fbdev/ep93xx-fb.c                    |    2 +
 drivers/video/fbdev/gbefb.c                        |    2 +
 drivers/video/fbdev/omap/omapfb_main.c             |    2 +
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c     |    2 +
 drivers/video/fbdev/ps3fb.c                        |   11 +-
 drivers/video/fbdev/sa1100fb.c                     |    2 +
 drivers/video/fbdev/sbuslib.c                      |    5 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c             |   16 +-
 drivers/video/fbdev/simplefb.c                     |  132 +-
 drivers/video/fbdev/sm712fb.c                      |    6 +-
 drivers/video/fbdev/smscufx.c                      |    2 +
 drivers/video/fbdev/udlfb.c                        |    2 +
 drivers/video/fbdev/vermilion/vermilion.c          |    2 +
 drivers/video/fbdev/vfb.c                          |   10 +-
 drivers/video/fbdev/vt8500lcdfb.c                  |    4 +-
 drivers/video/fbdev/wm8505fb.c                     |    2 +
 drivers/virtio/virtio_pci_common.c                 |    6 +-
 drivers/virtio/virtio_pci_modern_dev.c             |    7 +-
 drivers/xen/events/events_2l.c                     |    8 +-
 drivers/xen/events/events_base.c                   |  576 +-
 drivers/xen/events/events_internal.h               |    1 -
 drivers/xen/pcpu.c                                 |   22 +
 drivers/xen/privcmd.c                              |    2 +-
 drivers/xen/swiotlb-xen.c                          |    1 +
 drivers/xen/xen-front-pgdir-shbuf.c                |   34 +-
 fs/afs/dynroot.c                                   |    4 +-
 fs/afs/internal.h                                  |    1 +
 fs/afs/server_list.c                               |    2 +-
 fs/afs/super.c                                     |    4 +
 fs/afs/vl_rotate.c                                 |   10 +
 fs/autofs/inode.c                                  |   56 +-
 fs/bcachefs/backpointers.c                         |   10 +-
 fs/bcachefs/bcachefs.h                             |    2 +-
 fs/bcachefs/btree_iter.c                           |    2 -
 fs/bcachefs/btree_key_cache.c                      |   37 +-
 fs/bcachefs/btree_key_cache_types.h                |   34 +
 fs/bcachefs/btree_trans_commit.c                   |  169 +-
 fs/bcachefs/btree_types.h                          |   35 +-
 fs/bcachefs/btree_update_interior.c                |   30 -
 fs/bcachefs/btree_update_interior.h                |    1 -
 fs/bcachefs/data_update.c                          |   28 +
 fs/bcachefs/disk_groups.c                          |    4 +-
 fs/bcachefs/ec.c                                   |   16 +-
 fs/bcachefs/fs-io-pagecache.c                      |    2 +-
 fs/bcachefs/fs-io-pagecache.h                      |    2 +-
 fs/bcachefs/fs.c                                   |    8 +-
 fs/bcachefs/fsck.c                                 |    2 +-
 fs/bcachefs/inode.c                                |    8 +-
 fs/bcachefs/io_write.c                             |    2 +-
 fs/bcachefs/journal.c                              |   31 -
 fs/bcachefs/journal.h                              |   98 -
 fs/bcachefs/journal_io.c                           |    7 +
 fs/bcachefs/journal_reclaim.c                      |   42 +-
 fs/bcachefs/journal_types.h                        |   26 -
 fs/bcachefs/six.c                                  |    7 +-
 fs/bcachefs/subvolume_types.h                      |    2 +-
 fs/bcachefs/trace.h                                |   11 +-
 fs/bcachefs/xattr.c                                |    9 +
 fs/btrfs/ctree.c                                   |    2 +-
 fs/btrfs/delayed-ref.c                             |    4 +-
 fs/btrfs/extent-tree.c                             |   25 +-
 fs/btrfs/extent-tree.h                             |    3 +-
 fs/btrfs/inode.c                                   |    7 +
 fs/btrfs/ioctl.c                                   |   10 +-
 fs/btrfs/qgroup.c                                  |   10 +-
 fs/btrfs/raid-stripe-tree.c                        |    2 +-
 fs/btrfs/scrub.c                                   |   10 +-
 fs/btrfs/volumes.c                                 |    6 +-
 fs/btrfs/zoned.c                                   |    7 -
 fs/ecryptfs/inode.c                                |   12 +-
 fs/erofs/Kconfig                                   |    2 +-
 fs/erofs/data.c                                    |    5 +-
 fs/erofs/inode.c                                   |   98 +-
 fs/inode.c                                         |    2 +
 fs/libfs.c                                         |   14 +-
 fs/nfsd/cache.h                                    |    4 +-
 fs/nfsd/nfs4state.c                                |    2 +-
 fs/nfsd/nfscache.c                                 |   87 +-
 fs/nfsd/nfssvc.c                                   |   14 +-
 fs/overlayfs/inode.c                               |   10 +-
 fs/overlayfs/overlayfs.h                           |    8 +
 fs/overlayfs/params.c                              |   11 +-
 fs/overlayfs/util.c                                |    2 +-
 fs/smb/client/cifs_spnego.c                        |    4 +-
 fs/smb/client/cifsglob.h                           |   14 +-
 fs/smb/client/cifspdu.h                            |    4 +-
 fs/smb/client/cifsproto.h                          |   14 +-
 fs/smb/client/cifssmb.c                            |  193 +-
 fs/smb/client/connect.c                            |    6 +
 fs/smb/client/inode.c                              |   74 +-
 fs/smb/client/readdir.c                            |    6 +-
 fs/smb/client/sess.c                               |   24 +-
 fs/smb/client/smb1ops.c                            |  153 +-
 fs/smb/client/smb2inode.c                          |    2 +-
 fs/smb/client/smb2ops.c                            |  227 +-
 fs/smb/client/smb2transport.c                      |    5 +-
 fs/stat.c                                          |    6 +-
 fs/tracefs/event_inode.c                           |   65 +-
 fs/tracefs/inode.c                                 |   13 +-
 fs/xfs/Kconfig                                     |    2 +-
 fs/xfs/libxfs/xfs_alloc.c                          |   27 +-
 fs/xfs/libxfs/xfs_defer.c                          |   28 +-
 fs/xfs/libxfs/xfs_defer.h                          |    2 +-
 fs/xfs/libxfs/xfs_inode_buf.c                      |    3 +
 fs/xfs/xfs_dquot.c                                 |    5 +-
 fs/xfs/xfs_dquot_item_recover.c                    |   21 +-
 fs/xfs/xfs_inode.h                                 |    8 +
 fs/xfs/xfs_inode_item_recover.c                    |   46 +-
 fs/xfs/xfs_ioctl.c                                 |   30 +-
 fs/xfs/xfs_iops.c                                  |    7 +
 fs/xfs/xfs_log.c                                   |   23 +-
 fs/xfs/xfs_log_recover.c                           |    2 +-
 fs/xfs/xfs_reflink.c                               |    1 +
 include/acpi/acpi_bus.h                            |    1 +
 include/asm-generic/qspinlock.h                    |    2 +-
 include/drm/bridge/aux-bridge.h                    |   37 +
 include/drm/display/drm_dp.h                       |   28 +
 include/drm/display/drm_dp_helper.h                |   32 +
 include/drm/display/drm_dp_mst_helper.h            |   16 +-
 include/drm/drm_atomic_helper.h                    |    5 +-
 include/drm/drm_auth.h                             |   22 -
 include/drm/drm_bridge.h                           |    4 +-
 include/drm/drm_color_mgmt.h                       |   19 +-
 include/drm/drm_device.h                           |   71 +-
 include/drm/drm_drv.h                              |   28 +-
 include/drm/drm_edid.h                             |  153 -
 include/drm/drm_eld.h                              |  164 +
 include/drm/drm_encoder.h                          |   16 +-
 include/drm/drm_exec.h                             |    2 +-
 include/drm/drm_file.h                             |   17 +-
 include/drm/drm_flip_work.h                        |   20 +-
 include/drm/drm_format_helper.h                    |   81 +-
 include/drm/drm_framebuffer.h                      |   12 -
 include/drm/drm_gem.h                              |   32 +-
 include/drm/drm_gem_atomic_helper.h                |   10 +
 include/drm/drm_gpuvm.h                            |  532 +-
 include/drm/drm_ioctl.h                            |   11 -
 include/drm/drm_legacy.h                           |  331 --
 include/drm/drm_mipi_dbi.h                         |    4 +-
 include/drm/drm_mipi_dsi.h                         |    2 +
 include/drm/drm_modeset_helper_vtables.h           |   10 +
 include/drm/drm_plane.h                            |   24 +
 include/drm/drm_plane_helper.h                     |    2 -
 include/drm/drm_print.h                            |    2 +-
 include/drm/gpu_scheduler.h                        |   56 +-
 include/linux/blk-pm.h                             |    1 -
 include/linux/bpf.h                                |   10 +-
 include/linux/bpf_verifier.h                       |   16 +
 include/linux/cpuhotplug.h                         |    1 +
 include/linux/dma-buf.h                            |   11 +-
 include/linux/export-internal.h                    |    4 +-
 include/linux/fb.h                                 |   16 +-
 include/linux/hid.h                                |    3 +
 include/linux/hrtimer.h                            |    4 +-
 include/linux/iosys-map.h                          |   44 +-
 include/linux/mdio.h                               |    2 +-
 include/linux/netdevice.h                          |   30 +-
 include/linux/pagemap.h                            |   17 +
 include/linux/perf_event.h                         |   13 +-
 include/linux/sizes.h                              |    9 +
 include/linux/stackleak.h                          |    6 +
 include/linux/usb/phy.h                            |   13 -
 include/linux/virtio_pci_modern.h                  |    7 -
 include/net/netfilter/nf_tables.h                  |    4 +-
 include/net/netkit.h                               |    6 +
 include/net/tc_act/tc_ct.h                         |    9 +
 include/trace/events/rxrpc.h                       |    2 +-
 include/uapi/drm/drm.h                             |   72 +-
 include/uapi/drm/drm_mode.h                        |   19 +
 include/uapi/drm/ivpu_accel.h                      |    2 +-
 include/uapi/drm/msm_drm.h                         |    3 +
 include/uapi/drm/pvr_drm.h                         | 1295 ++++
 include/uapi/drm/qaic_accel.h                      |    5 +-
 include/uapi/drm/v3d_drm.h                         |  245 +-
 include/uapi/drm/virtgpu_drm.h                     |    2 +
 include/uapi/linux/btrfs_tree.h                    |   24 +-
 include/uapi/linux/fcntl.h                         |    3 +
 include/uapi/linux/sync_file.h                     |   22 +
 include/uapi/linux/virtio_pci.h                    |   11 +
 include/xen/events.h                               |    8 +-
 io_uring/fdinfo.c                                  |    9 +-
 io_uring/fs.c                                      |    2 +-
 io_uring/rsrc.c                                    |    2 +-
 io_uring/sqpoll.c                                  |   12 +-
 kernel/audit_watch.c                               |    2 +-
 kernel/bpf/core.c                                  |    8 +-
 kernel/bpf/verifier.c                              |  489 +-
 kernel/cgroup/cgroup.c                             |   12 -
 kernel/cpu.c                                       |    8 +-
 kernel/events/core.c                               |   17 +
 kernel/futex/core.c                                |    9 +-
 kernel/locking/lockdep.c                           |    3 +-
 kernel/sched/fair.c                                |  161 +-
 kernel/sys.c                                       |    4 +
 kernel/time/hrtimer.c                              |   33 +-
 lib/errname.c                                      |    6 -
 lib/iov_iter.c                                     |    2 +-
 lib/zstd/common/fse_decompress.c                   |    2 +-
 mm/damon/core.c                                    |    2 +-
 mm/damon/sysfs-schemes.c                           |    5 +
 mm/damon/sysfs.c                                   |    6 +-
 mm/filemap.c                                       |    2 +-
 mm/huge_memory.c                                   |   16 +-
 mm/ksm.c                                           |    2 +-
 mm/memcontrol.c                                    |    3 +-
 mm/page-writeback.c                                |    2 +-
 mm/userfaultfd.c                                   |    2 +-
 mm/util.c                                          |   10 +
 net/bridge/netfilter/nf_conntrack_bridge.c         |    2 +-
 net/core/dev.c                                     |   61 +-
 net/core/filter.c                                  |   19 +-
 net/core/gso_test.c                                |   14 +-
 net/ipv4/inet_diag.c                               |    1 +
 net/ipv4/inet_hashtables.c                         |    2 +-
 net/ipv4/raw_diag.c                                |    1 +
 net/ipv4/route.c                                   |    2 +-
 net/ipv4/tcp_diag.c                                |    1 +
 net/ipv4/udp_diag.c                                |    1 +
 net/mptcp/mptcp_diag.c                             |    1 +
 net/mptcp/pm_netlink.c                             |    5 +-
 net/mptcp/protocol.c                               |   11 +-
 net/mptcp/sockopt.c                                |    3 +
 net/ncsi/ncsi-aen.c                                |    5 -
 net/netfilter/ipset/ip_set_core.c                  |   14 +-
 net/netfilter/nf_tables_api.c                      |   60 +-
 net/netfilter/nft_byteorder.c                      |    5 +-
 net/netfilter/nft_meta.c                           |    2 +-
 net/netfilter/nft_set_rbtree.c                     |    2 -
 net/packet/diag.c                                  |    1 +
 net/rxrpc/conn_client.c                            |    7 +-
 net/rxrpc/input.c                                  |   61 +-
 net/sched/act_ct.c                                 |    3 +
 net/sctp/diag.c                                    |    1 +
 net/smc/af_smc.c                                   |    8 +-
 net/smc/smc_diag.c                                 |    1 +
 net/tipc/diag.c                                    |    1 +
 net/tipc/netlink_compat.c                          |    1 +
 net/tls/tls_sw.c                                   |    3 +
 net/unix/af_unix.c                                 |    9 +-
 net/unix/diag.c                                    |    1 +
 net/vmw_vsock/diag.c                               |    1 +
 net/xdp/xsk_diag.c                                 |    1 +
 scripts/Makefile.lib                               |    4 +-
 scripts/checkstack.pl                              |    3 +-
 scripts/gcc-plugins/latent_entropy_plugin.c        |    4 +-
 scripts/gcc-plugins/randomize_layout_plugin.c      |   10 -
 scripts/kconfig/symbol.c                           |   14 +-
 scripts/mod/modpost.c                              |    6 +-
 sound/core/pcm_drm_eld.c                           |    1 +
 sound/pci/hda/cs35l56_hda_i2c.c                    |    4 +
 sound/pci/hda/hda_intel.c                          |    3 +
 sound/pci/hda/patch_realtek.c                      |   29 +-
 sound/soc/codecs/hdac_hdmi.c                       |    1 +
 sound/soc/codecs/hdmi-codec.c                      |    1 +
 sound/x86/intel_hdmi_audio.c                       |    1 +
 tools/arch/parisc/include/uapi/asm/errno.h         |    2 -
 tools/hv/hv_kvp_daemon.c                           |   20 +-
 tools/hv/hv_set_ifconfig.sh                        |    4 +-
 tools/net/ynl/Makefile.deps                        |    2 +-
 tools/net/ynl/generated/devlink-user.c             |    2 +-
 tools/net/ynl/ynl-gen-c.py                         |    6 +
 tools/power/pm-graph/sleepgraph.py                 |    2 +-
 tools/power/x86/turbostat/turbostat.c              | 3074 +++++-----
 tools/testing/selftests/arm64/fp/za-fork.c         |    2 +-
 .../testing/selftests/bpf/prog_tests/tc_redirect.c |  317 +-
 tools/testing/selftests/bpf/prog_tests/verifier.c  |    2 +
 tools/testing/selftests/bpf/progs/bpf_loop_bench.c |   13 +-
 tools/testing/selftests/bpf/progs/cb_refs.c        |    1 +
 .../testing/selftests/bpf/progs/exceptions_fail.c  |    2 +
 tools/testing/selftests/bpf/progs/strobemeta.h     |   78 +-
 tools/testing/selftests/bpf/progs/verifier_cfg.c   |   62 +
 .../bpf/progs/verifier_iterating_callbacks.c       |  242 +
 .../testing/selftests/bpf/progs/verifier_loops1.c  |    9 +-
 .../selftests/bpf/progs/verifier_precision.c       |   40 +
 .../bpf/progs/verifier_subprog_precision.c         |   86 +-
 .../selftests/bpf/progs/xdp_synproxy_kern.c        |   84 +-
 tools/testing/selftests/bpf/verifier/calls.c       |    6 +-
 tools/testing/selftests/bpf/verifier/ld_imm64.c    |    8 +-
 tools/testing/selftests/bpf/xskxceiver.c           |   19 +-
 tools/testing/selftests/mm/.gitignore              |    1 +
 tools/testing/selftests/mm/pagemap_ioctl.c         |   23 +-
 tools/testing/selftests/mm/run_vmtests.sh          |    3 +
 tools/testing/selftests/net/mptcp/mptcp_join.sh    |    2 +-
 tools/testing/selftests/net/rtnetlink.sh           |    2 +-
 tools/testing/vsock/vsock_test.c                   |   19 +-
 1161 files changed, 61703 insertions(+), 26262 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml
 create mode 100644 Documentation/gpu/drm-vm-bind-locking.rst
 create mode 100644 Documentation/gpu/imagination/index.rst
 create mode 100644 Documentation/gpu/imagination/uapi.rst
 create mode 100644 drivers/accel/qaic/qaic_timesync.c
 create mode 100644 drivers/accel/qaic/qaic_timesync.h
 delete mode 100644 drivers/char/agp/compat_ioctl.c
 delete mode 100644 drivers/char/agp/compat_ioctl.h
 delete mode 100644 drivers/char/agp/frontend.c
 create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.c
 delete mode 100644 drivers/gpu/drm/drm_agpsupport.c
 delete mode 100644 drivers/gpu/drm/drm_bufs.c
 delete mode 100644 drivers/gpu/drm/drm_context.c
 delete mode 100644 drivers/gpu/drm/drm_dma.c
 create mode 100644 drivers/gpu/drm/drm_eld.c
 delete mode 100644 drivers/gpu/drm/drm_hashtab.c
 delete mode 100644 drivers/gpu/drm/drm_irq.c
 delete mode 100644 drivers/gpu/drm/drm_legacy.h
 delete mode 100644 drivers/gpu/drm/drm_legacy_misc.c
 delete mode 100644 drivers/gpu/drm/drm_lock.c
 delete mode 100644 drivers/gpu/drm/drm_memory.c
 delete mode 100644 drivers/gpu/drm/drm_scatter.c
 delete mode 100644 drivers/gpu/drm/drm_vm.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_debugfs_para=
ms.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_debugfs_para=
ms.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_params.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_params.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpt_common.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpt_common.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dsb_buffer.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dsb_buffer.h
 create mode 100644 drivers/gpu/drm/imagination/Kconfig
 create mode 100644 drivers/gpu/drm/imagination/Makefile
 create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_cccb.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_cccb.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_context.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_context.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_drv.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_drv.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_info.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_gem.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_gem.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_job.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_job.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_mmu.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_mmu.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_queue.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_queue.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs_client.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check=
.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_common.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_dev_info.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_resetframewo=
rk.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_shared_check=
.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_stream.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_heap_config.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_meta.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream_defs.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_sync.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_sync.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
 create mode 100644 drivers/gpu/drm/tests/drm_gem_shmem_test.c
 create mode 100644 drivers/gpu/drm/v3d/v3d_submit.c
 create mode 100644 drivers/gpu/drm/v3d/v3d_sysfs.c
 delete mode 100644 drivers/phy/realtek/Kconfig
 delete mode 100644 drivers/phy/realtek/Makefile
 delete mode 100644 drivers/phy/realtek/phy-rtk-usb2.c
 delete mode 100644 drivers/phy/realtek/phy-rtk-usb3.c
 create mode 100644 fs/bcachefs/btree_key_cache_types.h
 create mode 100644 include/drm/bridge/aux-bridge.h
 create mode 100644 include/drm/drm_eld.h
 delete mode 100644 include/drm/drm_legacy.h
 create mode 100644 include/uapi/drm/pvr_drm.h
 create mode 100644
tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c
