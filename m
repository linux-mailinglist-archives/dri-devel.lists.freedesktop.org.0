Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2EA67D7C6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 22:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277E810E3BF;
	Thu, 26 Jan 2023 21:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3250A10E3BF
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 21:33:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 87955617D1;
 Thu, 26 Jan 2023 21:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CB3C4339C;
 Thu, 26 Jan 2023 21:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674768806;
 bh=MygqriM2rH2FYI/oPCiP3jpsbl9aFa7SMZkVtJ8b+bA=;
 h=Date:From:To:Cc:Subject:From;
 b=nnLDS884lz7FE9URc5ncDO/TSSgElmBqkjKuuzHDma7wcBTOa+VjXhtL+8DPFn0dl
 yBi9G1TxtAJmrjRpWKRqGCfpT7Bh9tw90udlgDdHI06LqdBd0Rmhwmth+LVWLsGQWX
 G4BDYtRf0xCCPwlR0k4iWe/UBP/8e/P7JChXBbk1HSkF430YvwdNHWyZ+umzC+h0Rl
 VJoeoKpIL3F4pxTby3ljTU6M0B7Kiw2q6f47lA0MjHpnaCu6TuFe4RZH3D708I4iru
 fOgE49GsCluHGQt8iBhtrJ4Wsc+cJ6bJWxWeQTn9ggs8DQD9hL4I0T9pqqMgTLIKj3
 jqiMJM9Nx3ldw==
Date: Thu, 26 Jan 2023 23:33:17 +0200
From: Oded Gabbay <ogabbay@kernel.org>
To: airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [git pull] habanalabs pull request for kernel 6.3
Message-ID: <20230126213317.GA1520525@ogabbay-vm-u20.habana-labs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel.

This is habanalabs and accel pull request for the merge window of kernel 6.3.

First I want to say that it's been 4 years and 6 months since my last pull
request to drm-next (for amdkfd) :)

My pull request is formatted according to how Greg liked to get it. I hope the
format is acceptable and there are enough details in the tag. If there is
something wrong, please tell me and I'll send a revised pull request if it's
critical or just take notes for the next pr.

Anyway, except of moving the driver to the accel subsystem :-) there isn't
any fancy stuff to talk about. There are some minor new features and
uAPI adjustments, but most of the commits are bug fixes, refactors,
optimizations, etc.

Unfortunately, we haven't been able to implement yet the registration to the
drm as an accel device. We are working on it now so it will be queued up for
the 6.4 merge window.

Full details are in the signed tag.

Thanks,
Oded

The following changes since commit 68de345e101ce9a24e5c8849e69dd0dba2e8c9b2:

  Merge tag 'drm-misc-next-2023-01-24' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2023-01-25 12:14:08 +1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git tags/drm-habanalabs-next-2023-01-26

for you to fetch changes up to 4dc7c58023e86352abead441e2f257c752a13562:

  habanalabs: Fix list of /sys/class/habanalabs/hl<n>/status (2023-01-26 11:52:14 +0200)

----------------------------------------------------------------
This tag contains habanalabs driver and accel changes for v6.3:

- Moved the driver to the accel subsystem. Currently only the files were
  moved (including the uapi file which was also renamed). This doesn't
  include registering to the accel subsystem. This will probably be only
  in the next kernel version.

- In case of decoder error (axi error) in Gaudi2, we can now find the exact
  IP that initiated the erroneous transaction and print the details for
  better debug.

- Add more trace events. We now can trace mmio transactions and communication
  with the preboot firmware.

- Add to Gaudi2 support for abrupt reset that is done by the firmware. This
  was support so far only for Gaudi1.

- Add uAPI to flush memory transactions (to the device memory). This is
  needed by the communications library in case of doing p2p with a host NIC
  which access our HBM directly through the PCI BAR.

- Add uAPI to pass-through a request from user-space to firmware and get the
  result back to user-space. This will allow the driver code to avoid the
  need to add new packet (in the communication channel with the firmware) for
  every new request type.

- Remove the option to export dma-buf by memory allocation handle in our uAPI.
  This was planned for Gaudi2 but was never used. Instead, we will do export
  by memory address (same as Gaudi1). In addition, we added the option to
  specify an offset to the address. This is needed in Gaudi2 because there
  the user allocates the entire HBM in one allocation, but would like to
  export only small part of it.

- Multiple bug fixes, refactors and small optimizations.

----------------------------------------------------------------
Bagas Sanjaya (2):
      Documentation: accel: escape wildcard in special file path
      habanalabs: Fix list of /sys/class/habanalabs/hl<n>/status

Carmit Carmel (1):
      habanalabs/gaudi2: fix log for sob value overflow/underflow

Dani Liberman (5):
      habanalabs/gaudi2: remove use of razwi info received from f/w
      habanalabs/gaudi2: read mmio razwi information
      habanalabe/gaudi2: add cfg base when displaying razwi addresses
      habanalabs/gaudi2: print page fault axi transaction id
      habanalabs/gaudi2: fix emda range registers razwi handling

Gustavo A. R. Silva (1):
      habanalabs: Replace zero-length arrays with flexible-array members

Jeffrey Hugo (3):
      MAINTAINERS/ACCEL: Add include/drm/drm_accel.h to the accel entry
      accel: Add .mmap to DRM_ACCEL_FOPS
      docs: accel: Fix debugfs path

Koby Elbaz (5):
      habanalabs/gaudi2: avoid reconfiguring the same PB registers
      habanalabs: refactor razwi/page-fault information structures
      habanalabs: protect access to dynamic mem 'user_mappings'
      habanalabs: block soft-reset on an unusable device
      habanalabs/gaudi2: find decode error root cause

Marco Pagani (1):
      habanalabs: fix double assignment in MMU V1

Moti Haimovski (2):
      habanalabs: extend fatal messages to contain PCI info
      habanalabs: enhance info printed on FW load errors

Oded Gabbay (6):
      habanalabs/uapi: move uapi file to drm
      habanalabs: move driver to accel subsystem
      habanalabs/gaudi2: update asic register files
      habanalabs/gaudi2: update f/w files
      habanalabs: update f/w files
      habanalabs: move some prints to debug level

Ofir Bitton (10):
      habanalabs: don't notify user about clk throttling due to power
      habanalabs/gaudi2: count interrupt causes
      habanalabs/gaudi2: remove duplicated event prints
      habanalabs/gaudi2: support abrupt device reset event
      habanalabs/gaudi2: dump event description even if no cause
      habanalabs/gaudi: allow device acquire while in debug mode
      habanalabs: update device status sysfs documentation
      habanalabs: refactor user interrupt type
      habanalabs: optimize command submission completion timestamp
      habanalabs/gaudi2: unsecure tpc kernel_config registers

Ohad Sharabi (14):
      habanalabs: make set_dram_properties an ASIC function
      habanalabs: update DRAM props according to preboot data
      habanalabs: define traces for COMMS protocol
      habanalabs: trace COMMS protocol
      habanalabs: remove support to export dmabuf from handle
      habanalabs: helper function to validate export params
      habanalabs: modify export dmabuf API
      habanalabs: fix dmabuf to export only required size
      habanalabs/gaudi2: wait for preboot ready if HW state is dirty
      habanalabs: fix asic-specific functions documentation
      habanalabs: add uapi to flush inbound HBM transactions
      habanalabs: add set engines masks ASIC function
      habanalabs: define events to trace PCI LBW access
      habanalabs: trace LBW reads/writes

Tal Cohen (1):
      habanalabs: support receiving ascii message from preboot f/w

Tamir Gilad-Raz (1):
      habanalabs: adjacent timestamps should be more accurate

Tom Rix (1):
      habanalabs: remove redundant memset

Tomer Tayar (11):
      habanalabs: remove releasing of user threads from device release
      habanalabs: abort waiting user threads upon error
      habanalabs: don't allow user to destroy CB handle more than once
      habanalabs: use dev_dbg() when hl_mmap_mem_buf_get() fails
      habanalabs: skip device idle check in hpriv_release if in reset
      habanalabs: fix handling of wait CS for interrupting signals
      habanalabs: put fences in case of unexpected wait status
      habanalabs: fix dma-buf release handling if dma_buf_fd() fails
      habanalabs: verify that kernel CB is destroyed only once
      habanalabs: run error handling if scrub_device_mem fails after reset
      habanalabs: clear in_compute_reset when escalating to hard reset

XU pengfei (1):
      habanalabs: remove unnecessary (void*) conversions

farah kassabri (7):
      habanalabs: read binning info from preboot
      habanalabs: set log level for descriptor validation to debug
      habanalabs: fix wrong variable type used for vzalloc
      habanalabs: pass-through request from user to f/w
      habanalabs: check pad and reserved fields in ioctls
      habanalabs: bugs fixes in timestamps buff alloc
      habanalabs: fix bug in timestamps registration code

tal albo (1):
      habanalabs/gaudi2: fix BMON 3rd address range

 Documentation/ABI/testing/sysfs-driver-habanalabs  |   14 +-
 Documentation/accel/introduction.rst               |    6 +-
 MAINTAINERS                                        |    7 +-
 drivers/Makefile                                   |    2 +-
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/{misc => accel}/habanalabs/Kconfig         |    8 +-
 drivers/{misc => accel}/habanalabs/Makefile        |    2 +-
 drivers/{misc => accel}/habanalabs/common/Makefile |    0
 drivers/{misc => accel}/habanalabs/common/asid.c   |    0
 .../habanalabs/common/command_buffer.c             |   22 +-
 .../habanalabs/common/command_submission.c         |  133 ++-
 .../{misc => accel}/habanalabs/common/context.c    |    0
 .../{misc => accel}/habanalabs/common/debugfs.c    |    0
 .../{misc => accel}/habanalabs/common/decoder.c    |    0
 drivers/{misc => accel}/habanalabs/common/device.c |  109 +-
 .../habanalabs/common/firmware_if.c                |  189 ++-
 .../{misc => accel}/habanalabs/common/habanalabs.h |  122 +-
 .../habanalabs/common/habanalabs_drv.c             |    6 +-
 .../habanalabs/common/habanalabs_ioctl.c           |  101 +-
 .../{misc => accel}/habanalabs/common/hw_queue.c   |    0
 drivers/{misc => accel}/habanalabs/common/hwmon.c  |    0
 drivers/{misc => accel}/habanalabs/common/irq.c    |   38 +-
 drivers/{misc => accel}/habanalabs/common/memory.c |  369 +++---
 .../{misc => accel}/habanalabs/common/memory_mgr.c |    3 +-
 .../{misc => accel}/habanalabs/common/mmu/Makefile |    0
 .../{misc => accel}/habanalabs/common/mmu/mmu.c    |    2 +-
 .../{misc => accel}/habanalabs/common/mmu/mmu_v1.c |    1 -
 .../habanalabs/common/mmu/mmu_v2_hr.c              |    0
 .../{misc => accel}/habanalabs/common/pci/Makefile |    0
 .../{misc => accel}/habanalabs/common/pci/pci.c    |   10 +-
 .../{misc => accel}/habanalabs/common/security.c   |  174 +++
 drivers/accel/habanalabs/common/security.h         |  163 +++
 .../{misc => accel}/habanalabs/common/state_dump.c |    2 +-
 drivers/{misc => accel}/habanalabs/common/sysfs.c  |    0
 drivers/{misc => accel}/habanalabs/gaudi/Makefile  |    0
 drivers/{misc => accel}/habanalabs/gaudi/gaudi.c   |   27 +-
 drivers/{misc => accel}/habanalabs/gaudi/gaudiP.h  |    2 +-
 .../habanalabs/gaudi/gaudi_coresight.c             |    3 +-
 .../habanalabs/gaudi/gaudi_security.c              |    0
 drivers/{misc => accel}/habanalabs/gaudi2/Makefile |    0
 drivers/{misc => accel}/habanalabs/gaudi2/gaudi2.c | 1175 +++++++++++--------
 .../{misc => accel}/habanalabs/gaudi2/gaudi2P.h    |   39 +-
 .../habanalabs/gaudi2/gaudi2_coresight.c           |   10 +-
 .../habanalabs/gaudi2/gaudi2_coresight_regs.h      |    0
 .../habanalabs/gaudi2/gaudi2_masks.h               |    0
 .../habanalabs/gaudi2/gaudi2_security.c            |   37 +-
 drivers/{misc => accel}/habanalabs/goya/Makefile   |    0
 drivers/{misc => accel}/habanalabs/goya/goya.c     |   12 +
 drivers/{misc => accel}/habanalabs/goya/goyaP.h    |    2 +-
 .../habanalabs/goya/goya_coresight.c               |    2 +-
 .../{misc => accel}/habanalabs/goya/goya_hwmgr.c   |    0
 .../habanalabs/goya/goya_security.c                |    0
 .../habanalabs/include/common/cpucp_if.h           |   96 +-
 .../habanalabs/include/common/hl_boot_if.h         |  151 ++-
 .../habanalabs/include/common/qman_if.h            |    0
 .../include/gaudi/asic_reg/cpu_if_regs.h           |    0
 .../include/gaudi/asic_reg/dma0_core_masks.h       |    0
 .../include/gaudi/asic_reg/dma0_core_regs.h        |    0
 .../include/gaudi/asic_reg/dma0_qm_masks.h         |    0
 .../include/gaudi/asic_reg/dma0_qm_regs.h          |    0
 .../include/gaudi/asic_reg/dma1_core_regs.h        |    0
 .../include/gaudi/asic_reg/dma1_qm_regs.h          |    0
 .../include/gaudi/asic_reg/dma2_core_regs.h        |    0
 .../include/gaudi/asic_reg/dma2_qm_regs.h          |    0
 .../include/gaudi/asic_reg/dma3_core_regs.h        |    0
 .../include/gaudi/asic_reg/dma3_qm_regs.h          |    0
 .../include/gaudi/asic_reg/dma4_core_regs.h        |    0
 .../include/gaudi/asic_reg/dma4_qm_regs.h          |    0
 .../include/gaudi/asic_reg/dma5_core_regs.h        |    0
 .../include/gaudi/asic_reg/dma5_qm_regs.h          |    0
 .../include/gaudi/asic_reg/dma6_core_regs.h        |    0
 .../include/gaudi/asic_reg/dma6_qm_regs.h          |    0
 .../include/gaudi/asic_reg/dma7_core_regs.h        |    0
 .../include/gaudi/asic_reg/dma7_qm_regs.h          |    0
 .../gaudi/asic_reg/dma_if_e_n_down_ch0_regs.h      |    0
 .../gaudi/asic_reg/dma_if_e_n_down_ch1_regs.h      |    0
 .../include/gaudi/asic_reg/dma_if_e_n_regs.h       |    0
 .../gaudi/asic_reg/dma_if_e_s_down_ch0_regs.h      |    0
 .../gaudi/asic_reg/dma_if_e_s_down_ch1_regs.h      |    0
 .../include/gaudi/asic_reg/dma_if_e_s_regs.h       |    0
 .../gaudi/asic_reg/dma_if_w_n_down_ch0_regs.h      |    0
 .../gaudi/asic_reg/dma_if_w_n_down_ch1_regs.h      |    0
 .../include/gaudi/asic_reg/dma_if_w_n_regs.h       |    0
 .../gaudi/asic_reg/dma_if_w_s_down_ch0_regs.h      |    0
 .../gaudi/asic_reg/dma_if_w_s_down_ch1_regs.h      |    0
 .../include/gaudi/asic_reg/dma_if_w_s_regs.h       |    0
 .../include/gaudi/asic_reg/gaudi_blocks.h          |    0
 .../habanalabs/include/gaudi/asic_reg/gaudi_regs.h |    2 +
 .../include/gaudi/asic_reg/mme0_ctrl_regs.h        |    0
 .../include/gaudi/asic_reg/mme0_qm_masks.h         |    0
 .../include/gaudi/asic_reg/mme0_qm_regs.h          |    0
 .../include/gaudi/asic_reg/mme1_ctrl_regs.h        |    0
 .../include/gaudi/asic_reg/mme2_ctrl_regs.h        |    0
 .../include/gaudi/asic_reg/mme2_qm_regs.h          |    0
 .../include/gaudi/asic_reg/mme3_ctrl_regs.h        |    0
 .../include/gaudi/asic_reg/mmu_up_regs.h           |    0
 .../include/gaudi/asic_reg/nic0_qm0_masks.h        |    0
 .../include/gaudi/asic_reg/nic0_qm0_regs.h         |    0
 .../include/gaudi/asic_reg/nic0_qm1_regs.h         |    0
 .../include/gaudi/asic_reg/nic1_qm0_regs.h         |    0
 .../include/gaudi/asic_reg/nic1_qm1_regs.h         |    0
 .../include/gaudi/asic_reg/nic2_qm0_regs.h         |    0
 .../include/gaudi/asic_reg/nic2_qm1_regs.h         |    0
 .../include/gaudi/asic_reg/nic3_qm0_regs.h         |    0
 .../include/gaudi/asic_reg/nic3_qm1_regs.h         |    0
 .../include/gaudi/asic_reg/nic4_qm0_regs.h         |    0
 .../include/gaudi/asic_reg/nic4_qm1_regs.h         |    0
 .../include/gaudi/asic_reg/nif_rtr_ctrl_0_regs.h   |    0
 .../include/gaudi/asic_reg/nif_rtr_ctrl_1_regs.h   |    0
 .../include/gaudi/asic_reg/nif_rtr_ctrl_2_regs.h   |    0
 .../include/gaudi/asic_reg/nif_rtr_ctrl_3_regs.h   |    0
 .../include/gaudi/asic_reg/nif_rtr_ctrl_4_regs.h   |    0
 .../include/gaudi/asic_reg/nif_rtr_ctrl_5_regs.h   |    0
 .../include/gaudi/asic_reg/nif_rtr_ctrl_6_regs.h   |    0
 .../include/gaudi/asic_reg/nif_rtr_ctrl_7_regs.h   |    0
 .../include/gaudi/asic_reg/psoc_cpu_pll_regs.h     |    0
 .../include/gaudi/asic_reg/psoc_etr_regs.h         |    0
 .../gaudi/asic_reg/psoc_global_conf_masks.h        |    0
 .../include/gaudi/asic_reg/psoc_global_conf_regs.h |    0
 .../include/gaudi/asic_reg/psoc_timestamp_regs.h   |    0
 .../include/gaudi/asic_reg/sif_rtr_ctrl_0_regs.h   |    0
 .../include/gaudi/asic_reg/sif_rtr_ctrl_1_regs.h   |    0
 .../include/gaudi/asic_reg/sif_rtr_ctrl_2_regs.h   |    0
 .../include/gaudi/asic_reg/sif_rtr_ctrl_3_regs.h   |    0
 .../include/gaudi/asic_reg/sif_rtr_ctrl_4_regs.h   |    0
 .../include/gaudi/asic_reg/sif_rtr_ctrl_5_regs.h   |    0
 .../include/gaudi/asic_reg/sif_rtr_ctrl_6_regs.h   |    0
 .../include/gaudi/asic_reg/sif_rtr_ctrl_7_regs.h   |    0
 .../habanalabs/include/gaudi/asic_reg/stlb_regs.h  |    0
 .../include/gaudi/asic_reg/tpc0_cfg_masks.h        |    0
 .../include/gaudi/asic_reg/tpc0_cfg_regs.h         |    0
 .../include/gaudi/asic_reg/tpc0_qm_masks.h         |    0
 .../include/gaudi/asic_reg/tpc0_qm_regs.h          |    0
 .../include/gaudi/asic_reg/tpc1_cfg_regs.h         |    0
 .../include/gaudi/asic_reg/tpc1_qm_regs.h          |    0
 .../include/gaudi/asic_reg/tpc2_cfg_regs.h         |    0
 .../include/gaudi/asic_reg/tpc2_qm_regs.h          |    0
 .../include/gaudi/asic_reg/tpc3_cfg_regs.h         |    0
 .../include/gaudi/asic_reg/tpc3_qm_regs.h          |    0
 .../include/gaudi/asic_reg/tpc4_cfg_regs.h         |    0
 .../include/gaudi/asic_reg/tpc4_qm_regs.h          |    0
 .../include/gaudi/asic_reg/tpc5_cfg_regs.h         |    0
 .../include/gaudi/asic_reg/tpc5_qm_regs.h          |    0
 .../include/gaudi/asic_reg/tpc6_cfg_regs.h         |    0
 .../include/gaudi/asic_reg/tpc6_qm_regs.h          |    0
 .../include/gaudi/asic_reg/tpc7_cfg_regs.h         |    0
 .../include/gaudi/asic_reg/tpc7_qm_regs.h          |    0
 .../habanalabs/include/gaudi/gaudi.h               |    0
 .../habanalabs/include/gaudi/gaudi_async_events.h  |    0
 .../include/gaudi/gaudi_async_ids_map_extended.h   |    0
 .../habanalabs/include/gaudi/gaudi_coresight.h     |    0
 .../habanalabs/include/gaudi/gaudi_fw_if.h         |    0
 .../habanalabs/include/gaudi/gaudi_masks.h         |    0
 .../habanalabs/include/gaudi/gaudi_packets.h       |    0
 .../habanalabs/include/gaudi/gaudi_reg_map.h       |    0
 .../include/gaudi2/arc/gaudi2_arc_common_packets.h |  211 ++++
 .../gaudi2/asic_reg/arc_farm_arc0_acp_eng_regs.h   |    0
 .../gaudi2/asic_reg/arc_farm_arc0_aux_masks.h      |    0
 .../gaudi2/asic_reg/arc_farm_arc0_aux_regs.h       |    0
 .../asic_reg/arc_farm_arc0_dup_eng_axuser_regs.h   |    0
 .../gaudi2/asic_reg/arc_farm_arc0_dup_eng_regs.h   |    0
 .../asic_reg/arc_farm_kdma_ctx_axuser_masks.h      |    0
 .../asic_reg/arc_farm_kdma_ctx_axuser_regs.h       |    0
 .../gaudi2/asic_reg/arc_farm_kdma_ctx_masks.h      |    0
 .../gaudi2/asic_reg/arc_farm_kdma_ctx_regs.h       |    0
 .../gaudi2/asic_reg/arc_farm_kdma_kdma_cgm_regs.h  |    0
 .../include/gaudi2/asic_reg/arc_farm_kdma_masks.h  |    0
 .../include/gaudi2/asic_reg/arc_farm_kdma_regs.h   |    0
 .../include/gaudi2/asic_reg/cpu_if_regs.h          |    0
 .../gaudi2/asic_reg/dcore0_dec0_cmd_masks.h        |    0
 .../include/gaudi2/asic_reg/dcore0_dec0_cmd_regs.h |    0
 .../asic_reg/dcore0_edma0_core_ctx_axuser_regs.h   |    0
 .../gaudi2/asic_reg/dcore0_edma0_core_ctx_regs.h   |    0
 .../gaudi2/asic_reg/dcore0_edma0_core_masks.h      |    0
 .../gaudi2/asic_reg/dcore0_edma0_core_regs.h       |    0
 .../gaudi2/asic_reg/dcore0_edma0_qm_arc_aux_regs.h |    0
 .../dcore0_edma0_qm_axuser_nonsecured_regs.h       |    0
 .../gaudi2/asic_reg/dcore0_edma0_qm_cgm_regs.h     |    0
 .../gaudi2/asic_reg/dcore0_edma0_qm_masks.h        |    0
 .../include/gaudi2/asic_reg/dcore0_edma0_qm_regs.h |    0
 .../asic_reg/dcore0_edma1_core_ctx_axuser_regs.h   |    0
 .../dcore0_edma1_qm_axuser_nonsecured_regs.h       |    0
 .../gaudi2/asic_reg/dcore0_hmmu0_mmu_masks.h       |   15 +-
 .../gaudi2/asic_reg/dcore0_hmmu0_mmu_regs.h        |    0
 .../gaudi2/asic_reg/dcore0_hmmu0_stlb_masks.h      |   41 +-
 .../gaudi2/asic_reg/dcore0_hmmu0_stlb_regs.h       |    0
 .../include/gaudi2/asic_reg/dcore0_mme_acc_regs.h  |    0
 ...dcore0_mme_ctrl_lo_arch_agu_cout0_master_regs.h |    0
 .../dcore0_mme_ctrl_lo_arch_agu_cout0_slave_regs.h |    0
 ...dcore0_mme_ctrl_lo_arch_agu_cout1_master_regs.h |    0
 .../dcore0_mme_ctrl_lo_arch_agu_cout1_slave_regs.h |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in0_master_regs.h  |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in0_slave_regs.h   |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in1_master_regs.h  |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in1_slave_regs.h   |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in2_master_regs.h  |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in2_slave_regs.h   |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in3_master_regs.h  |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in3_slave_regs.h   |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in4_master_regs.h  |    0
 .../dcore0_mme_ctrl_lo_arch_agu_in4_slave_regs.h   |    0
 .../dcore0_mme_ctrl_lo_arch_base_addr_regs.h       |    0
 .../dcore0_mme_ctrl_lo_arch_non_tensor_end_regs.h  |    6 +-
 ...dcore0_mme_ctrl_lo_arch_non_tensor_start_regs.h |    0
 .../dcore0_mme_ctrl_lo_arch_tensor_a_regs.h        |    0
 .../dcore0_mme_ctrl_lo_arch_tensor_b_regs.h        |    0
 .../dcore0_mme_ctrl_lo_arch_tensor_cout_regs.h     |    0
 .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_masks.h     |    9 +-
 .../asic_reg/dcore0_mme_ctrl_lo_mme_axuser_regs.h  |    0
 .../gaudi2/asic_reg/dcore0_mme_ctrl_lo_regs.h      |    0
 .../asic_reg/dcore0_mme_qm_arc_acp_eng_regs.h      |    0
 .../gaudi2/asic_reg/dcore0_mme_qm_arc_aux_regs.h   |    0
 .../dcore0_mme_qm_arc_dup_eng_axuser_regs.h        |    0
 .../asic_reg/dcore0_mme_qm_arc_dup_eng_regs.h      |    0
 .../dcore0_mme_qm_axuser_nonsecured_regs.h         |    0
 .../asic_reg/dcore0_mme_qm_axuser_secured_regs.h   |    0
 .../gaudi2/asic_reg/dcore0_mme_qm_cgm_regs.h       |    0
 .../include/gaudi2/asic_reg/dcore0_mme_qm_regs.h   |    0
 .../gaudi2/asic_reg/dcore0_mme_sbte0_masks.h       |    0
 .../dcore0_mme_sbte0_mstr_if_axuser_regs.h         |    0
 .../asic_reg/dcore0_mme_wb0_mstr_if_axuser_regs.h  |    0
 .../gaudi2/asic_reg/dcore0_rtr0_ctrl_regs.h        |    0
 .../dcore0_rtr0_mstr_if_rr_prvt_hbw_regs.h         |    0
 .../dcore0_rtr0_mstr_if_rr_prvt_lbw_regs.h         |    0
 .../dcore0_rtr0_mstr_if_rr_shrd_hbw_regs.h         |    0
 .../dcore0_rtr0_mstr_if_rr_shrd_lbw_regs.h         |    0
 .../gaudi2/asic_reg/dcore0_sync_mngr_glbl_masks.h  |    0
 .../gaudi2/asic_reg/dcore0_sync_mngr_glbl_regs.h   |    0
 .../dcore0_sync_mngr_mstr_if_axuser_masks.h        |    0
 .../dcore0_sync_mngr_mstr_if_axuser_regs.h         |    0
 .../gaudi2/asic_reg/dcore0_sync_mngr_objs_masks.h  |    0
 .../gaudi2/asic_reg/dcore0_sync_mngr_objs_regs.h   |    0
 .../gaudi2/asic_reg/dcore0_tpc0_cfg_axuser_regs.h  |    0
 .../gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_regs.h  |    0
 .../dcore0_tpc0_cfg_kernel_tensor_0_regs.h         |    0
 .../gaudi2/asic_reg/dcore0_tpc0_cfg_masks.h        |    0
 .../gaudi2/asic_reg/dcore0_tpc0_cfg_qm_regs.h      |    0
 .../asic_reg/dcore0_tpc0_cfg_qm_sync_object_regs.h |    0
 .../asic_reg/dcore0_tpc0_cfg_qm_tensor_0_regs.h    |    0
 .../include/gaudi2/asic_reg/dcore0_tpc0_cfg_regs.h |    0
 .../gaudi2/asic_reg/dcore0_tpc0_cfg_special_regs.h |    0
 .../asic_reg/dcore0_tpc0_eml_busmon_0_regs.h       |    0
 .../gaudi2/asic_reg/dcore0_tpc0_eml_etf_regs.h     |    0
 .../gaudi2/asic_reg/dcore0_tpc0_eml_funnel_regs.h  |    0
 .../gaudi2/asic_reg/dcore0_tpc0_eml_spmu_regs.h    |    0
 .../gaudi2/asic_reg/dcore0_tpc0_eml_stm_regs.h     |    0
 .../gaudi2/asic_reg/dcore0_tpc0_qm_arc_aux_regs.h  |    0
 .../dcore0_tpc0_qm_axuser_nonsecured_regs.h        |    0
 .../gaudi2/asic_reg/dcore0_tpc0_qm_cgm_regs.h      |    0
 .../include/gaudi2/asic_reg/dcore0_tpc0_qm_regs.h  |    0
 .../dcore0_vdec0_brdg_ctrl_axuser_dec_regs.h       |    0
 ...dcore0_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h |    0
 .../dcore0_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h  |    0
 .../dcore0_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h  |    0
 .../dcore0_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h  |    0
 .../gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_masks.h |    6 +-
 .../gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_regs.h  |    0
 .../asic_reg/dcore0_vdec0_ctrl_special_regs.h      |    0
 .../gaudi2/asic_reg/dcore1_mme_ctrl_lo_regs.h      |    0
 .../gaudi2/asic_reg/dcore1_sync_mngr_glbl_regs.h   | 1203 ++++++++++++++++++++
 .../gaudi2/asic_reg/dcore3_mme_ctrl_lo_regs.h      |    0
 .../gaudi2/asic_reg/gaudi2_blocks_linux_driver.h   |    0
 .../include/gaudi2/asic_reg/gaudi2_regs.h          |    1 +
 .../include/gaudi2/asic_reg/nic0_qm0_cgm_regs.h    |    0
 .../include/gaudi2/asic_reg/nic0_qm0_regs.h        |    0
 .../gaudi2/asic_reg/nic0_qm_arc_aux0_regs.h        |    0
 .../include/gaudi2/asic_reg/nic0_qpc0_regs.h       |    0
 .../nic0_umr0_0_completion_queue_ci_1_regs.h       |    0
 .../asic_reg/nic0_umr0_0_unsecure_doorbell0_regs.h |    0
 .../include/gaudi2/asic_reg/pcie_aux_regs.h        |    0
 .../include/gaudi2/asic_reg/pcie_dbi_regs.h        |    3 +-
 .../include/gaudi2/asic_reg/pcie_dec0_cmd_masks.h  |    0
 .../include/gaudi2/asic_reg/pcie_dec0_cmd_regs.h   |    0
 .../pcie_vdec0_brdg_ctrl_axuser_dec_regs.h         |    0
 .../pcie_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h  |    0
 .../pcie_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h    |    0
 .../pcie_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h    |    0
 .../pcie_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h    |    0
 .../gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_masks.h   |    3 +-
 .../gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_regs.h    |    0
 .../gaudi2/asic_reg/pcie_vdec0_ctrl_special_regs.h |    0
 .../include/gaudi2/asic_reg/pcie_wrap_regs.h       |    0
 .../gaudi2/asic_reg/pcie_wrap_special_regs.h       |    0
 .../gaudi2/asic_reg/pdma0_core_ctx_axuser_regs.h   |    0
 .../include/gaudi2/asic_reg/pdma0_core_ctx_regs.h  |    0
 .../include/gaudi2/asic_reg/pdma0_core_masks.h     |    0
 .../include/gaudi2/asic_reg/pdma0_core_regs.h      |    0
 .../gaudi2/asic_reg/pdma0_core_special_masks.h     |    0
 .../gaudi2/asic_reg/pdma0_qm_arc_aux_regs.h        |    0
 .../asic_reg/pdma0_qm_axuser_nonsecured_regs.h     |    0
 .../gaudi2/asic_reg/pdma0_qm_axuser_secured_regs.h |    0
 .../include/gaudi2/asic_reg/pdma0_qm_cgm_regs.h    |    0
 .../include/gaudi2/asic_reg/pdma0_qm_masks.h       |    0
 .../include/gaudi2/asic_reg/pdma0_qm_regs.h        |    0
 .../gaudi2/asic_reg/pdma1_core_ctx_axuser_regs.h   |    0
 .../asic_reg/pdma1_qm_axuser_nonsecured_regs.h     |    0
 .../include/gaudi2/asic_reg/pmmu_hbw_stlb_masks.h  |    3 +-
 .../include/gaudi2/asic_reg/pmmu_hbw_stlb_regs.h   |    0
 .../include/gaudi2/asic_reg/pmmu_pif_regs.h        |    0
 .../include/gaudi2/asic_reg/psoc_etr_masks.h       |    0
 .../include/gaudi2/asic_reg/psoc_etr_regs.h        |    0
 .../gaudi2/asic_reg/psoc_global_conf_masks.h       |   27 +-
 .../gaudi2/asic_reg/psoc_global_conf_regs.h        |    0
 .../gaudi2/asic_reg/psoc_reset_conf_masks.h        |    0
 .../include/gaudi2/asic_reg/psoc_reset_conf_regs.h |    0
 .../include/gaudi2/asic_reg/psoc_timestamp_regs.h  |    0
 .../include/gaudi2/asic_reg/rot0_desc_regs.h       |    0
 .../include/gaudi2/asic_reg/rot0_masks.h           |    0
 .../include/gaudi2/asic_reg/rot0_qm_arc_aux_regs.h |    0
 .../asic_reg/rot0_qm_axuser_nonsecured_regs.h      |    0
 .../include/gaudi2/asic_reg/rot0_qm_cgm_regs.h     |    0
 .../include/gaudi2/asic_reg/rot0_qm_regs.h         |    0
 .../habanalabs/include/gaudi2/asic_reg/rot0_regs.h |    0
 .../include/gaudi2/asic_reg/xbar_edge_0_regs.h     |    0
 .../include/gaudi2/asic_reg/xbar_mid_0_regs.h      |    0
 .../habanalabs/include/gaudi2/gaudi2.h             |    0
 .../include/gaudi2/gaudi2_async_events.h           |    1 +
 .../include/gaudi2/gaudi2_async_ids_map_extended.h |    2 +
 .../habanalabs/include/gaudi2/gaudi2_coresight.h   |    0
 .../habanalabs/include/gaudi2/gaudi2_fw_if.h       |   23 +-
 .../habanalabs/include/gaudi2/gaudi2_packets.h     |    4 +-
 .../habanalabs/include/gaudi2/gaudi2_reg_map.h     |   16 +-
 .../include/gaudi2/gaudi2_special_blocks.h         |  157 +++
 .../include/goya/asic_reg/cpu_ca53_cfg_masks.h     |    0
 .../include/goya/asic_reg/cpu_ca53_cfg_regs.h      |    0
 .../habanalabs/include/goya/asic_reg/cpu_if_regs.h |    0
 .../include/goya/asic_reg/cpu_pll_regs.h           |    0
 .../include/goya/asic_reg/dma_ch_0_masks.h         |    0
 .../include/goya/asic_reg/dma_ch_0_regs.h          |    0
 .../include/goya/asic_reg/dma_ch_1_regs.h          |    0
 .../include/goya/asic_reg/dma_ch_2_regs.h          |    0
 .../include/goya/asic_reg/dma_ch_3_regs.h          |    0
 .../include/goya/asic_reg/dma_ch_4_regs.h          |    0
 .../include/goya/asic_reg/dma_macro_masks.h        |    0
 .../include/goya/asic_reg/dma_macro_regs.h         |    0
 .../include/goya/asic_reg/dma_nrtr_masks.h         |    0
 .../include/goya/asic_reg/dma_nrtr_regs.h          |    0
 .../include/goya/asic_reg/dma_qm_0_masks.h         |    0
 .../include/goya/asic_reg/dma_qm_0_regs.h          |    0
 .../include/goya/asic_reg/dma_qm_1_regs.h          |    0
 .../include/goya/asic_reg/dma_qm_2_regs.h          |    0
 .../include/goya/asic_reg/dma_qm_3_regs.h          |    0
 .../include/goya/asic_reg/dma_qm_4_regs.h          |    0
 .../habanalabs/include/goya/asic_reg/goya_blocks.h |    0
 .../habanalabs/include/goya/asic_reg/goya_masks.h  |    0
 .../habanalabs/include/goya/asic_reg/goya_regs.h   |    0
 .../habanalabs/include/goya/asic_reg/ic_pll_regs.h |    0
 .../habanalabs/include/goya/asic_reg/mc_pll_regs.h |    0
 .../include/goya/asic_reg/mme1_rtr_masks.h         |    0
 .../include/goya/asic_reg/mme1_rtr_regs.h          |    0
 .../include/goya/asic_reg/mme2_rtr_regs.h          |    0
 .../include/goya/asic_reg/mme3_rtr_regs.h          |    0
 .../include/goya/asic_reg/mme4_rtr_regs.h          |    0
 .../include/goya/asic_reg/mme5_rtr_regs.h          |    0
 .../include/goya/asic_reg/mme6_rtr_regs.h          |    0
 .../include/goya/asic_reg/mme_cmdq_masks.h         |    0
 .../include/goya/asic_reg/mme_cmdq_regs.h          |    0
 .../habanalabs/include/goya/asic_reg/mme_masks.h   |    0
 .../include/goya/asic_reg/mme_qm_masks.h           |    0
 .../habanalabs/include/goya/asic_reg/mme_qm_regs.h |    0
 .../habanalabs/include/goya/asic_reg/mme_regs.h    |    0
 .../habanalabs/include/goya/asic_reg/mmu_masks.h   |    0
 .../habanalabs/include/goya/asic_reg/mmu_regs.h    |    0
 .../include/goya/asic_reg/pci_nrtr_masks.h         |    0
 .../include/goya/asic_reg/pci_nrtr_regs.h          |    0
 .../include/goya/asic_reg/pcie_aux_regs.h          |    0
 .../include/goya/asic_reg/pcie_wrap_regs.h         |    0
 .../include/goya/asic_reg/psoc_emmc_pll_regs.h     |    0
 .../include/goya/asic_reg/psoc_etr_regs.h          |    0
 .../include/goya/asic_reg/psoc_global_conf_masks.h |    0
 .../include/goya/asic_reg/psoc_global_conf_regs.h  |    0
 .../include/goya/asic_reg/psoc_mme_pll_regs.h      |    0
 .../include/goya/asic_reg/psoc_pci_pll_regs.h      |    0
 .../include/goya/asic_reg/psoc_spi_regs.h          |    0
 .../include/goya/asic_reg/psoc_timestamp_regs.h    |    0
 .../include/goya/asic_reg/sram_y0_x0_rtr_regs.h    |    0
 .../include/goya/asic_reg/sram_y0_x1_rtr_regs.h    |    0
 .../include/goya/asic_reg/sram_y0_x2_rtr_regs.h    |    0
 .../include/goya/asic_reg/sram_y0_x3_rtr_regs.h    |    0
 .../include/goya/asic_reg/sram_y0_x4_rtr_regs.h    |    0
 .../habanalabs/include/goya/asic_reg/stlb_masks.h  |    0
 .../habanalabs/include/goya/asic_reg/stlb_regs.h   |    0
 .../include/goya/asic_reg/tpc0_cfg_masks.h         |    0
 .../include/goya/asic_reg/tpc0_cfg_regs.h          |    0
 .../include/goya/asic_reg/tpc0_cmdq_masks.h        |    0
 .../include/goya/asic_reg/tpc0_cmdq_regs.h         |    0
 .../include/goya/asic_reg/tpc0_eml_cfg_masks.h     |    0
 .../include/goya/asic_reg/tpc0_eml_cfg_regs.h      |    0
 .../include/goya/asic_reg/tpc0_nrtr_masks.h        |    0
 .../include/goya/asic_reg/tpc0_nrtr_regs.h         |    0
 .../include/goya/asic_reg/tpc0_qm_masks.h          |    0
 .../include/goya/asic_reg/tpc0_qm_regs.h           |    0
 .../include/goya/asic_reg/tpc1_cfg_regs.h          |    0
 .../include/goya/asic_reg/tpc1_cmdq_regs.h         |    0
 .../include/goya/asic_reg/tpc1_qm_regs.h           |    0
 .../include/goya/asic_reg/tpc1_rtr_regs.h          |    0
 .../include/goya/asic_reg/tpc2_cfg_regs.h          |    0
 .../include/goya/asic_reg/tpc2_cmdq_regs.h         |    0
 .../include/goya/asic_reg/tpc2_qm_regs.h           |    0
 .../include/goya/asic_reg/tpc2_rtr_regs.h          |    0
 .../include/goya/asic_reg/tpc3_cfg_regs.h          |    0
 .../include/goya/asic_reg/tpc3_cmdq_regs.h         |    0
 .../include/goya/asic_reg/tpc3_qm_regs.h           |    0
 .../include/goya/asic_reg/tpc3_rtr_regs.h          |    0
 .../include/goya/asic_reg/tpc4_cfg_regs.h          |    0
 .../include/goya/asic_reg/tpc4_cmdq_regs.h         |    0
 .../include/goya/asic_reg/tpc4_qm_regs.h           |    0
 .../include/goya/asic_reg/tpc4_rtr_regs.h          |    0
 .../include/goya/asic_reg/tpc5_cfg_regs.h          |    0
 .../include/goya/asic_reg/tpc5_cmdq_regs.h         |    0
 .../include/goya/asic_reg/tpc5_qm_regs.h           |    0
 .../include/goya/asic_reg/tpc5_rtr_regs.h          |    0
 .../include/goya/asic_reg/tpc6_cfg_regs.h          |    0
 .../include/goya/asic_reg/tpc6_cmdq_regs.h         |    0
 .../include/goya/asic_reg/tpc6_qm_regs.h           |    0
 .../include/goya/asic_reg/tpc6_rtr_regs.h          |    0
 .../include/goya/asic_reg/tpc7_cfg_regs.h          |    0
 .../include/goya/asic_reg/tpc7_cmdq_regs.h         |    0
 .../include/goya/asic_reg/tpc7_nrtr_regs.h         |    0
 .../include/goya/asic_reg/tpc7_qm_regs.h           |    0
 .../include/goya/asic_reg/tpc_pll_regs.h           |    0
 .../{misc => accel}/habanalabs/include/goya/goya.h |    0
 .../habanalabs/include/goya/goya_async_events.h    |    0
 .../habanalabs/include/goya/goya_coresight.h       |    0
 .../habanalabs/include/goya/goya_fw_if.h           |    0
 .../habanalabs/include/goya/goya_packets.h         |    0
 .../habanalabs/include/goya/goya_reg_map.h         |    0
 .../habanalabs/include/hw_ip/mmu/mmu_general.h     |    0
 .../habanalabs/include/hw_ip/mmu/mmu_v1_0.h        |    0
 .../habanalabs/include/hw_ip/mmu/mmu_v1_1.h        |    0
 .../habanalabs/include/hw_ip/mmu/mmu_v2_0.h        |    0
 .../habanalabs/include/hw_ip/pci/pci_general.h     |    0
 drivers/misc/Kconfig                               |    1 -
 drivers/misc/Makefile                              |    1 -
 .../include/gaudi2/arc/gaudi2_arc_common_packets.h |  213 ----
 include/drm/drm_accel.h                            |    3 +-
 include/trace/events/habanalabs.h                  |   75 ++
 .../{misc/habanalabs.h => drm/habanalabs_accel.h}  |   33 +-
 439 files changed, 3947 insertions(+), 1153 deletions(-)
 rename drivers/{misc => accel}/habanalabs/Kconfig (81%)
 rename drivers/{misc => accel}/habanalabs/Makefile (88%)
 rename drivers/{misc => accel}/habanalabs/common/Makefile (100%)
 rename drivers/{misc => accel}/habanalabs/common/asid.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/command_buffer.c (95%)
 rename drivers/{misc => accel}/habanalabs/common/command_submission.c (96%)
 rename drivers/{misc => accel}/habanalabs/common/context.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/debugfs.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/decoder.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/device.c (95%)
 rename drivers/{misc => accel}/habanalabs/common/firmware_if.c (93%)
 rename drivers/{misc => accel}/habanalabs/common/habanalabs.h (97%)
 rename drivers/{misc => accel}/habanalabs/common/habanalabs_drv.c (98%)
 rename drivers/{misc => accel}/habanalabs/common/habanalabs_ioctl.c (93%)
 rename drivers/{misc => accel}/habanalabs/common/hw_queue.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/hwmon.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/irq.c (94%)
 rename drivers/{misc => accel}/habanalabs/common/memory.c (92%)
 rename drivers/{misc => accel}/habanalabs/common/memory_mgr.c (99%)
 rename drivers/{misc => accel}/habanalabs/common/mmu/Makefile (100%)
 rename drivers/{misc => accel}/habanalabs/common/mmu/mmu.c (99%)
 rename drivers/{misc => accel}/habanalabs/common/mmu/mmu_v1.c (99%)
 rename drivers/{misc => accel}/habanalabs/common/mmu/mmu_v2_hr.c (100%)
 rename drivers/{misc => accel}/habanalabs/common/pci/Makefile (100%)
 rename drivers/{misc => accel}/habanalabs/common/pci/pci.c (97%)
 rename drivers/{misc => accel}/habanalabs/common/security.c (76%)
 create mode 100644 drivers/accel/habanalabs/common/security.h
 rename drivers/{misc => accel}/habanalabs/common/state_dump.c (99%)
 rename drivers/{misc => accel}/habanalabs/common/sysfs.c (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi/Makefile (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi/gaudi.c (99%)
 rename drivers/{misc => accel}/habanalabs/gaudi/gaudiP.h (99%)
 rename drivers/{misc => accel}/habanalabs/gaudi/gaudi_coresight.c (99%)
 rename drivers/{misc => accel}/habanalabs/gaudi/gaudi_security.c (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi2/Makefile (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi2/gaudi2.c (92%)
 rename drivers/{misc => accel}/habanalabs/gaudi2/gaudi2P.h (95%)
 rename drivers/{misc => accel}/habanalabs/gaudi2/gaudi2_coresight.c (99%)
 rename drivers/{misc => accel}/habanalabs/gaudi2/gaudi2_coresight_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi2/gaudi2_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/gaudi2/gaudi2_security.c (99%)
 rename drivers/{misc => accel}/habanalabs/goya/Makefile (100%)
 rename drivers/{misc => accel}/habanalabs/goya/goya.c (99%)
 rename drivers/{misc => accel}/habanalabs/goya/goyaP.h (99%)
 rename drivers/{misc => accel}/habanalabs/goya/goya_coresight.c (99%)
 rename drivers/{misc => accel}/habanalabs/goya/goya_hwmgr.c (100%)
 rename drivers/{misc => accel}/habanalabs/goya/goya_security.c (100%)
 rename drivers/{misc => accel}/habanalabs/include/common/cpucp_if.h (94%)
 rename drivers/{misc => accel}/habanalabs/include/common/hl_boot_if.h (83%)
 rename drivers/{misc => accel}/habanalabs/include/common/qman_if.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/cpu_if_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma0_core_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma0_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma0_qm_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma0_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma1_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma1_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma2_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma2_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma3_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma3_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma4_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma4_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma5_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma5_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma6_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma6_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma7_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma7_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_n_down_ch1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_n_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_s_down_ch1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_e_s_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_n_down_ch1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_n_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_s_down_ch1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/dma_if_w_s_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/gaudi_blocks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/gaudi_regs.h (99%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/mme0_ctrl_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/mme0_qm_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/mme0_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/mme1_ctrl_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/mme2_ctrl_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/mme2_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/mme3_ctrl_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/mmu_up_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic0_qm0_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic0_qm0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic0_qm1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic1_qm0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic1_qm1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic2_qm0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic2_qm1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic3_qm0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic3_qm1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic4_qm0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nic4_qm1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_2_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_3_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_4_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_5_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_6_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/nif_rtr_ctrl_7_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/psoc_cpu_pll_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/psoc_etr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/psoc_global_conf_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/psoc_global_conf_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/psoc_timestamp_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_2_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_3_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_4_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_5_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_6_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/sif_rtr_ctrl_7_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/stlb_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc0_cfg_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc0_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc0_qm_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc0_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc1_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc1_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc2_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc2_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc3_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc3_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc4_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc4_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc5_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc5_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc6_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc6_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc7_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/asic_reg/tpc7_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/gaudi.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_async_events.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_async_ids_map_extended.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_coresight.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_fw_if.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_packets.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi/gaudi_reg_map.h (100%)
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/arc/gaudi2_arc_common_packets.h
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_acp_eng_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_aux_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_aux_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_arc0_dup_eng_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_ctx_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_kdma_cgm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/arc_farm_kdma_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/cpu_if_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_dec0_cmd_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_dec0_cmd_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_ctx_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_ctx_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_arc_aux_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_axuser_nonsecured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_cgm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma0_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma1_core_ctx_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_edma1_qm_axuser_nonsecured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_mmu_masks.h (99%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_mmu_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_stlb_masks.h (97%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_hmmu0_stlb_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_acc_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0_master_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout0_slave_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1_master_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_cout1_slave_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_master_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in0_slave_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_master_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in1_slave_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_master_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in2_slave_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_master_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in3_slave_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_master_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_agu_in4_slave_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_base_addr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_non_tensor_end_regs.h (98%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_non_tensor_start_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_a_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_b_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_arch_tensor_cout_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_masks.h (99%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_mme_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_ctrl_lo_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_acp_eng_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_aux_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_arc_dup_eng_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_axuser_nonsecured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_axuser_secured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_cgm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_sbte0_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_sbte0_mstr_if_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_mme_wb0_mstr_if_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_ctrl_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_hbw_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_prvt_lbw_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_hbw_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_rtr0_mstr_if_rr_shrd_lbw_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_glbl_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_mstr_if_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_objs_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_objs_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_kernel_tensor_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_sync_object_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_qm_tensor_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_cfg_special_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_busmon_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_etf_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_funnel_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_spmu_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_eml_stm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_arc_aux_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_axuser_nonsecured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_cgm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_tpc0_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_dec_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_masks.h (99%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_brdg_ctrl_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore0_vdec0_ctrl_special_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore1_mme_ctrl_lo_regs.h (100%)
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore1_sync_mngr_glbl_regs.h
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/dcore3_mme_ctrl_lo_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/gaudi2_blocks_linux_driver.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h (99%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/nic0_qm0_cgm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/nic0_qm0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/nic0_qm_arc_aux0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/nic0_qpc0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/nic0_umr0_0_completion_queue_ci_1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/nic0_umr0_0_unsecure_doorbell0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_aux_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_dbi_regs.h (99%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_dec0_cmd_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_dec_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_abnrm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_l2c_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_nrm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_axuser_msix_vcd_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_masks.h (99%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_brdg_ctrl_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_vdec0_ctrl_special_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_wrap_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pcie_wrap_special_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_core_ctx_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_core_ctx_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_core_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_core_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_core_special_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_arc_aux_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_axuser_nonsecured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_axuser_secured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_cgm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma0_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma1_core_ctx_axuser_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pdma1_qm_axuser_nonsecured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_masks.h (99%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pmmu_hbw_stlb_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/pmmu_pif_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/psoc_etr_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/psoc_etr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/psoc_global_conf_masks.h (99%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/psoc_global_conf_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/psoc_reset_conf_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/psoc_reset_conf_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/psoc_timestamp_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/rot0_desc_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/rot0_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/rot0_qm_arc_aux_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/rot0_qm_axuser_nonsecured_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/rot0_qm_cgm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/rot0_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/rot0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/xbar_edge_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/asic_reg/xbar_mid_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2_async_events.h (99%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h (99%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2_coresight.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2_fw_if.h (82%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2_packets.h (98%)
 rename drivers/{misc => accel}/habanalabs/include/gaudi2/gaudi2_reg_map.h (83%)
 create mode 100644 drivers/accel/habanalabs/include/gaudi2/gaudi2_special_blocks.h
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/cpu_ca53_cfg_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/cpu_ca53_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/cpu_if_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/cpu_pll_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_ch_0_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_ch_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_ch_1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_ch_2_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_ch_3_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_ch_4_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_macro_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_macro_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_nrtr_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_nrtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_qm_0_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_qm_0_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_qm_1_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_qm_2_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_qm_3_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/dma_qm_4_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/goya_blocks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/goya_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/goya_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/ic_pll_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mc_pll_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme1_rtr_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme1_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme2_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme3_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme4_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme5_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme6_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme_cmdq_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme_qm_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mme_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mmu_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/mmu_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/pci_nrtr_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/pci_nrtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/pcie_aux_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/pcie_wrap_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/psoc_emmc_pll_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/psoc_etr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/psoc_global_conf_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/psoc_global_conf_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/psoc_mme_pll_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/psoc_pci_pll_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/psoc_spi_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/psoc_timestamp_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/sram_y0_x0_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/sram_y0_x1_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/sram_y0_x2_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/sram_y0_x3_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/sram_y0_x4_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/stlb_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/stlb_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_cfg_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_cmdq_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_eml_cfg_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_eml_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_nrtr_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_nrtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_qm_masks.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc0_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc1_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc1_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc1_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc1_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc2_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc2_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc2_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc2_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc3_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc3_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc3_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc3_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc4_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc4_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc4_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc4_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc5_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc5_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc5_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc5_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc6_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc6_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc6_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc6_rtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc7_cfg_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc7_cmdq_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc7_nrtr_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc7_qm_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/asic_reg/tpc_pll_regs.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/goya.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/goya_async_events.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/goya_coresight.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/goya_fw_if.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/goya_packets.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/goya/goya_reg_map.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/hw_ip/mmu/mmu_general.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/hw_ip/mmu/mmu_v1_0.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/hw_ip/mmu/mmu_v1_1.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/hw_ip/mmu/mmu_v2_0.h (100%)
 rename drivers/{misc => accel}/habanalabs/include/hw_ip/pci/pci_general.h (100%)
 delete mode 100644 drivers/misc/habanalabs/include/gaudi2/arc/gaudi2_arc_common_packets.h
 rename include/uapi/{misc/habanalabs.h => drm/habanalabs_accel.h} (98%)
