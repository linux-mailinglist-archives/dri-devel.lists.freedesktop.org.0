Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 463927DC8AC
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 09:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04D789496;
	Tue, 31 Oct 2023 08:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4644710E0E6
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 05:07:41 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9d34b2b51a5so301268866b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 22:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698728859; x=1699333659; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HAXIYCQb6BM1ZVe3jCYxwTGGPKd2TVC8B0EgFgx5d44=;
 b=ZLyRmoZPe4OVj8Y5TLeq3yU12hhXtSYllJk8W/+Lz9EoFAON3WQS1sSxH2QGKTnGa8
 6kllaf5hPEFCIEvXWBO1Af2PSFFNZdVj3R2uDT+uV3bzCAlgQJwLiNAFB1n7Hu9xlwdd
 eSMrdfBPvcFHQQEbEHw/csYbSMirYAsYj0NrvBsjYtZJ9bxA49TWCONVr5uSvrjzgNTT
 67UIPUHHL1UP7npW6eC608G5ba8ayVDrehicDwtVxVU1IllTipM4qWn+sb9xehdUafQg
 I5f7jKXjlsB16hL/sZ8JUOnYfXf5GHTeHtk8YG/TaCxeU2ZyJSvfrshVZVVISPSQrsIZ
 VmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698728859; x=1699333659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HAXIYCQb6BM1ZVe3jCYxwTGGPKd2TVC8B0EgFgx5d44=;
 b=Twghx4IOm1A1ibezOKJu2/JXQPpisJx2Xe2T3oGJqFKI+PQSv+uIPhKsoHT4R96+cF
 YBTxsF9+NViE4AcNaBweErxe0I6AsPU02KZ9B1P4f9cwWwLyMN7bFpEEmDxtAjlE2C3e
 JPZ6vQCS+RyBMMYBnY/SaMNn7xLaEG1wSD7VPxB8B9WA/Tavs2rflvidFd1YMf3CYKQh
 X34s5V62IYSwwACJb3CzhOMX8gkmc+hlylOsXdxRM4u2cKqdQs8g29HheEMGiiVKB/Ng
 1RACmd3H7tE/yYPq0JkYQNOEkvAe5VNB9idJB7omuph4Zh8rsvLOWNZw7Oapl6PqNRx5
 My5g==
X-Gm-Message-State: AOJu0Yzi3eAub/FXnMQ6xBUq4xs8J6kTM4n+97gfWoUQPyGy9BluZfN/
 wvQZhH/DuRGbII4TDp6PI0GviTTlXp+BCOqX6rA=
X-Google-Smtp-Source: AGHT+IGQR4ldXFz7Iu+Jb55100vsWfSa/4eSjlFHt0CNZS1qeBtodh+Kkba1mA1MQ/TaHajijVdYdt1YVKndBsBydcU=
X-Received: by 2002:a17:907:26c4:b0:9b2:82d2:a2db with SMTP id
 bp4-20020a17090726c400b009b282d2a2dbmr8907900ejc.28.1698728858684; Mon, 30
 Oct 2023 22:07:38 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 31 Oct 2023 15:07:23 +1000
Message-ID: <CAPM=9txd+1FtqU-R_8Zr_UePUzu7QUWsDBV1syKBo16v_gx2XQ@mail.gmail.com>
Subject: [git pull] drm for 6.7-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 31 Oct 2023 08:52:25 +0000
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

This is the main drm pull request for 6.7.

I've done a test merge do your current tree, and it has one conflict,
this might change in time, so let me know if there's any fallout.

This contains a new helper vmemdup-user-array in the core kernel,
along with a couple of core and drm users of it. Should have all
r-b/acks in place. The author has a bunch of other conversions they
will trickle into other trees once the core is in.

There is a single fix in here due to a merge conflict in drivers/usb
that I just put in my tree so I could proceed.

I think Stephen has reported an mm conflict but let me know if there
are any problems.

Now I've got a possible second PR adding support for NVIDIA's GSP
firmware to nouveau. This is late as Ben departed and I just got to
finding the last two blockers today. This would only be used on
hardware where we don't have support currently, and be optional on
hardware that is currently supported. I'm hoping that we can land it
under the, "it shouldn't break anything on older hardware", (the
refactors are all in this tree). I'll send a follow on PR in the next
day or two and see how you feel about it.

Highlights:
- AMD adds some more upcoming HW platforms
- Intel made Meteorlake stable and started adding Lunarlake
- nouveau has a bunch of display rework in prepartion for the NVIDIA
GSP firmware support
- msm adds a7xx support
- habanalabs has finished migration to accel subsystem

Summary below.

Regards,
Dave.

drm-next-2023-10-31-1:
drm for 6.7-rc1

kernel:
- add initial vmemdup-user-array

core:
- fix platform remove() to return void
- drm_file owner updated to reflect owner
- move size calcs to drm buddy allocator
- let GPUVM build as a module
- rename gpu va manager to gpuvm
- allow variable number of run-queues in scheduler

edid:
- handle bad h/v sync_end in EDIDs

panfrost:
- add Boris as maintainer

fbdev:
- use fb_ops helpers more
- only allow logo use from fbcon
- rename fb_pgproto to pgprot_framebuffer
- add HPD state to drm_connector_oob_hotplug_event
- convert to fbdev i/o mem helpers

i915:
- Enable meteorlake by default
- Early Xe2 LPD/Lunarlake display enablement
- Rework subplatforms into IP version checks
- GuC based TLB invalidation for Meteorlake
- Display rework for future Xe driver integration
- LNL FBC features
- LNL display feature capability reads
- update recommended fw versions for DG2+
- drop fastboot module parameter
- added deviceid for Arrowlake-S
- drop preproduction workarounds
- don't disable preemption for resets
- cleanup inlines in headers
- PXP firmware loading fix
- Fix sg list lengths
- DSC PPS state readout/verification
- Add more RPL P/U PCI IDs
- Add new DG2-G12 stepping
- DP enhanced framing support to state checker
- Improve shared link bandwidth management
- stop using GEM macros in display code
- refactor related code into display code
- locally enable W=3D1 warnings
- remove PSR watchdog timers on LNL

amdgpu:
- RAS/FRU EEPROM updatse
- IP discovery updatses
- GC 11.5 support
- DCN 3.5 support
- VPE 6.1 support
- NBIO 7.11 support
- DML2 support
- lots of IP updates
- use flexible arrays for bo list handling
- W=3D1 fixes
- Enable seamless boot in more cases
- Enable context type property for HDMI
- Rework GPUVM TLB flushing
- VCN IB start/size alignment fixes

amdkfd:
- GC 10/11 fixes
- GC 11.5 support
- use partial migration in GPU faults

radeon:
- W=3D1 Fixes
- fix some possible buffer overflow/NULL derefs

nouveau:
- update uapi for NO_PREFETCH
- scheduler/fence fixes
- rework suspend/resume for GSP-RM
- rework display in preparation for GSP-RM

habanalabs:
- uapi: expose tsc clock
- uapi: block access to eventfd through control device
- uapi: force dma-buf export to PAGE_SIZE alignments
- complete move to accel subsystem
- move firmware interface include files
- perform hard reset on PCIe AXI drain event
- optimise user interrupt handling

msm:
- DP: use existing helpers for DPCD
- DPU: interrupts reworked
- gpu: a7xx (a730/a740) support
- decouple msm_drv from kms for headless devices

mediatek:
- MT8188 dsi/dp/edp support
- DDP GAMMA - 12 bit LUT support
- connector dynamic selection capability

rockchip:
- rv1126 mipi-dsi/vop support
- add planar formats

ast:
- rename constants

panels:
- Mitsubishi AA084XE01
- JDI LPM102A188A
- LTK050H3148W-CTA6

ivpu:
- power management fixes

qaic:
- add detach slice bo api

komeda:
- add NV12 writeback

tegra:
- support NVSYNC/NHSYNC
- host1x suspend fixes

ili9882t:
- separate into own driver
The following changes since commit 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1=
:

  Linux 6.6-rc7 (2023-10-22 12:11:21 -1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-10-31-1

for you to fetch changes up to 631808095a82e6b6f8410a95f8b12b8d0d38b161:

  Merge tag 'amd-drm-next-6.7-2023-10-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-10-31
12:37:19 +1000)

----------------------------------------------------------------
drm for 6.7-rc1

kernel:
- add initial vmemdup-user-array

core:
- fix platform remove() to return void
- drm_file owner updated to reflect owner
- move size calcs to drm buddy allocator
- let GPUVM build as a module
- allow variable number of run-queues in scheduler

edid:
- handle bad h/v sync_end in EDIDs

panfrost:
- add Boris as maintainer

fbdev:
- use fb_ops helpers more
- only allow logo use from fbcon
- rename fb_pgproto to pgprot_framebuffer
- add HPD state to drm_connector_oob_hotplug_event
- convert to fbdev i/o mem helpers

i915:
- Enable meteorlake by default
- Early Xe2 LPD/Lunarlake display enablement
- Rework subplatforms into IP version checks
- GuC based TLB invalidation for Meteorlake
- Display rework for future Xe driver integration
- LNL FBC features
- LNL display feature capability reads
- update recommended fw versions for DG2+
- drop fastboot module parameter
- added deviceid for Arrowlake-S
- drop preproduction workarounds
- don't disable preemption for resets
- cleanup inlines in headers
- PXP firmware loading fix
- Fix sg list lengths
- DSC PPS state readout/verification
- Add more RPL P/U PCI IDs
- Add new DG2-G12 stepping
- DP enhanced framing support to state checker
- Improve shared link bandwidth management
- stop using GEM macros in display code
- refactor related code into display code
- locally enable W=3D1 warnings
- remove PSR watchdog timers on LNL

amdgpu:
- RAS/FRU EEPROM updatse
- IP discovery updatses
- GC 11.5 support
- DCN 3.5 support
- VPE 6.1 support
- NBIO 7.11 support
- DML2 support
- lots of IP updates
- use flexible arrays for bo list handling
- W=3D1 fixes
- Enable seamless boot in more cases
- Enable context type property for HDMI
- Rework GPUVM TLB flushing
- VCN IB start/size alignment fixes

amdkfd:
- GC 10/11 fixes
- GC 11.5 support
- use partial migration in GPU faults

radeon:
- W=3D1 Fixes
- fix some possible buffer overflow/NULL derefs
nouveau:
- update uapi for NO_PREFETCH
- scheduler/fence fixes
- rework suspend/resume for GSP-RM
- rework display in preparation for GSP-RM

habanalabs:
- uapi: expose tsc clock
- uapi: block access to eventfd through control device
- uapi: force dma-buf export to PAGE_SIZE alignments
- complete move to accel subsystem
- move firmware interface include files
- perform hard reset on PCIe AXI drain event
- optimise user interrupt handling

msm:
- DP: use existing helpers for DPCD
- DPU: interrupts reworked
- gpu: a7xx (a730/a740) support
- decouple msm_drv from kms for headless devices

mediatek:
- MT8188 dsi/dp/edp support
- DDP GAMMA - 12 bit LUT support
- connector dynamic selection capability

rockchip:
- rv1126 mipi-dsi/vop support
- add planar formats

ast:
- rename constants

panels:
- Mitsubishi AA084XE01
- JDI LPM102A188A
- LTK050H3148W-CTA6

ivpu:
- power management fixes

qaic:
- add detach slice bo api

komeda:
- add NV12 writeback

tegra:
- support NVSYNC/NHSYNC
- host1x suspend fixes

ili9882t:
- separate into own driver

----------------------------------------------------------------
Aaron Liu (4):
      drm/amdgpu: add golden setting for gc_11_5_0
      drm/amdgpu: add imu firmware support for gc_11_5_0
      drm/amdgpu: add mes firmware support for gc_11_5_0
      drm/amdgpu/discovery: enable DCN 3.5.0 support

Adri=C3=A1n Larumbe (6):
      drm/panfrost: Add cycle count GPU register definitions
      drm/panfrost: Add fdinfo support GPU load metrics
      drm/panfrost: Add fdinfo support for memory stats
      drm/drm_file: Add DRM obj's RSS reporting function for fdinfo
      drm/panfrost: Implement generic DRM object RSS reporting function
      Documentation/gpu: fix Panfrost documentation build warnings

Agustin Gutierrez (2):
      drm/amd/display: Optimize OLED T7 delay
      drm/amd/display: Remove power sequencing check

Alan Previn (6):
      drm/i915: Fix TLB-Invalidation seqno store
      drm/i915/pxp/mtl: intel_pxp_init_hw needs runtime-pm inside pm-comple=
te
      drm/i915/pxp: Optimize GET_PARAM:PXP_STATUS
      drm/i915/pxp/mtl: Update pxp-firmware response timeout
      drm/i915/pxp/mtl: Update pxp-firmware packet size
      drm/i915/lrc: User PXP contexts requires runalone bit in lrc

Alex Deucher (24):
      drm/amd/pm: fix debugfs pm_info output
      drm/amd/pm: fix error flow in sensor fetching
      drm/amdgpu/soc21: don't remap HDP registers for SR-IOV
      drm/amdgpu/nbio4.3: set proper rmmio_remap.reg_offset for SR-IOV
      drm/amdgpu: add vcn_doorbell_range callback for nbio 7.11
      drm/amdgpu: add remap_hdp_registers callback for nbio 7.11
      drm/amdgpu: add VPE IP discovery info to HW IP info query
      drm/amd/display: fix some style issues
      drm/amdgpu/gmc6-8: properly disable the AGP aperture
      drm/amdgpu/gmc: set a default disable value for AGP
      drm/amdgpu/gmc11: disable AGP on GC 11.5
      drm/amdkfd: reduce stack size in kfd_topology_add_device()
      drm/amdkfd: drop struct kfd_cu_info
      drm/amdgpu/gmc: add a way to force a particular placement for GART
      drm/amdgpu/gmc11: set gart placement GC11
      drm/amdgpu: add cached GPU fault structure to vm struct
      drm/amdgpu: cache gpuvm fault information for gmc7+
      drm/amdgpu: add new INFO ioctl query for the last GPU page fault
      drm/amdgpu: refine fault cache updates
      drm/amdgpu: Enable SMU 13.0.0 optimizations when ROCm is active (v2)
      drm/amdgpu/pm: update SMU 13.0.0 PMFW version check
      drm/amdgpu/mes11: remove aggregated doorbell code
      drm/amdgpu: update to the latest GC 11.5 headers
      drm/amdgpu: move buffer funcs setting up a level

Alex Hung (33):
      drm/amd/display: skip audio config for virtual signal
      drm/amd/display: Remove unwanted drm edid references
      drm/amd/display: Initialize writeback connector
      drm/amd/display: Hande writeback request from userspace
      drm/amd/display: Add writeback enable/disable in dc
      drm/amd/display: Fix writeback_info never got updated
      drm/amd/display: Validate hw_points_num before using it
      drm/amd/display: Fix writeback_info is not removed
      drm/amd/display: Add writeback enable field (wb_enabled)
      drm/amd/display: Setup for mmhubbub3_warmup_mcif with big buffer
      drm/amd/display: Add new set_fc_enable to struct dwbc_funcs
      drm/amd/display: Disable DWB frame capture to emulate oneshot
      drm/amd/display: Revert "drm/amd/display: Use drm_connector in
create_validate_stream_for_sink"
      Revert "drm/amd/display: Disable DWB frame capture to emulate oneshot=
"
      Revert "drm/amd/display: Add new set_fc_enable to struct dwbc_funcs"
      Revert "drm/amd/display: Setup for mmhubbub3_warmup_mcif with big buf=
fer"
      Revert "drm/amd/display: Add writeback enable field (wb_enabled)"
      Revert "drm/amd/display: Fix writeback_info is not removed"
      Revert "drm/amd/display: Validate hw_points_num before using it"
      Revert "drm/amd/display: Fix writeback_info never got updated"
      Revert "drm/amd/display: Add writeback enable/disable in dc"
      Revert "drm/amd/display: Hande writeback request from userspace"
      Revert "drm/amd/display: Create fake sink and stream for
writeback connector"
      Revert "drm/amd/display: Create amdgpu_dm_wb_connector"
      Revert "drm/amd/display: Use drm_connector in create_stream_for_sink"
      Revert "drm/amd/display: Return drm_connector from
find_first_crtc_matching_connector"
      Revert "drm/amd/display: Skip writeback connector when we get
amdgpu_dm_connector"
      Revert "drm/amd/display: Initialize writeback connector"
      Revert "drm/amd/display: Disable virtual links"
      Revert "drm/amd/display: Create one virtual connector in DC"
      Revert "drm/amd/display: Skip entire amdgpu_dm build if
!CONFIG_DRM_AMD_DC"
      drm/amd/display: Revert "drm/amd/display: allow edp updates for
virtual signal"
      drm/amd/display: Set emulated sink type to HDMI accordingly.

Alex Sierra (3):
      drm/amdkfd: retry after EBUSY is returned from hmm_ranges_get_pages
      drm/amdkfd: use mask to get v9 interrupt sq data bits correctly
      drm/amdkfd: remap unaligned svm ranges that have split

Alexander Stein (1):
      drm/bridge: lvds-codec: Implement atomic_get_input_bus_fmts for
LVDS encoder

Alicja Michalska (2):
      dt-bindings: display: anx7814: Add definition for anx7816
      drm/bridge/analogix/anx78xx: Add missing definition

Alvin Lee (7):
      drm/amd/display: Write flip addr to scratch reg for subvp
      drm/amd/display: Save addr update in scratch before flip
      drm/amd/display: Blank phantom OTG before enabling
      drm/amd/display: Don't lock phantom pipe on disabling
      drm/amd/display: Break after finding supported vlevel for repopulate
      drm/amd/display: Update cursor limits based on SW cursor fallback lim=
its
      drm/amd/display: Update FAMS sequence for DCN30 & DCN32

Andrzej Hajda (2):
      drm/i915: mark requests for GuC virtual engines to avoid use-after-fr=
ee
      drm/i915/gt: skip WA verification for GEN7_MISCCPCTL on DG2

Andr=C3=A9 Almeida (8):
      drm/amdgpu: Allocate coredump memory in a nonblocking way
      drm/amdgpu: Merge debug module parameters
      drm/amdgpu: Create an option to disable soft recovery
      drm/amdgpu: Rework coredump to use memory dynamically
      drm/doc: Document DRM device reset expectations
      drm/amdgpu: Encapsulate all device reset info
      drm/amdgpu: Move coredump code to amdgpu_reset file
      drm/amdgpu: Create version number for coredumps

Andy Yan (6):
      drm/rockchip: remove unused struct in vop2
      drm/rockchip: remove NR_LAYERS macro on vop2
      drm/rockchip: vop: fix format bpp calculation
      drm/rockchip: vop2: remove the unsupported format of cluster window
      drm/rockchip: vop2: Add more supported 10bit formats
      drm/rockchip: vop2: rename window formats to show window type using t=
hem

AngeloGioacchino Del Regno (17):
      drm/bridge: panel: Fix device link for DRM_BRIDGE_ATTACH_NO_CONNECTOR
      drm/mediatek: gamma: Reduce indentation in mtk_gamma_set_common()
      drm/mediatek: gamma: Support SoC specific LUT size
      drm/mediatek: gamma: Improve and simplify HW LUT calculation
      drm/mediatek: gamma: Enable the Gamma LUT table only after programmin=
g
      drm/mediatek: gamma: Use bitfield macros
      drm/mediatek: aal: Use bitfield macros
      drm/mediatek: De-commonize disp_aal/disp_gamma gamma_set functions
      drm/mediatek: gamma: Support multi-bank gamma LUT
      drm/mediatek: gamma: Add support for 12-bit LUT
      drm/mediatek: gamma: Add support for MT8195
      drm/mediatek: gamma: Make sure relay mode is disabled
      drm/mediatek: gamma: Program gamma LUT type for descending or rising
      drm/mediatek: aal: Add kerneldoc for struct mtk_disp_aal
      drm/mediatek: gamma: Add kerneldoc for struct mtk_disp_gamma
      drm/mediatek: aal: Compress of_device_id entries and add sentinel
      drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET settings/handling

Ankit Nautiyal (20):
      drm/i915/dp: Consider output_format while computing dsc bpp
      drm/i915/dp: Move compressed bpp check with 420 format inside the hel=
per
      drm/i915/dp_mst: Use output_format to get the final link bpp
      drm/i915/dp: Use consistent name for link bpp and compressed bpp
      drm/i915/dp: Update Bigjoiner interface bits for computing compressed=
 bpp
      drm/i915/intel_cdclk: Add vdsc with bigjoiner constraints on min_cdlc=
k
      drm/i915/dp: Remove extra logs for printing DSC info
      drm/i915/dp: Avoid forcing DSC BPC for MST case
      drm/i915/dp: Add functions to get min/max src input bpc with DSC
      drm/i915/dp: Check min bpc DSC limits for dsc_force_bpc also
      drm/i915/dp: Avoid left shift of DSC output bpp by 4
      drm/i915/dp: Rename helper to get DSC max pipe_bpp
      drm/i915/dp: Separate out functions for edp/DP for computing DSC bpp
      drm/i915/dp: Add DSC BPC/BPP constraints while selecting pipe bpp wit=
h DSC
      drm/i915/dp: Separate out function to get compressed bpp with joiner
      drm/i915/dp: Get optimal link config to have best compressed bpp
      drm/i915/dp: Check src/sink compressed bpp limit for edp
      drm/i915/dp: Check if force_dsc_output_format is possible
      drm/display/dp: Assume 8 bpc support when DSC is supported
      drivers/drm/i915: Honor limits->max_bpp while computing DSC max input=
 bpp

Anshuman Gupta (1):
      drm/i915/dgfx: Enable d3cold at s2idle

Anthony Koo (3):
      drm/amd/display: [FW Promotion] Release 0.0.180.0
      drm/amd/display: [FW Promotion] Release 0.0.181.0
      drm/amd/display: [FW Promotion] Release 0.0.183.0

Aric Cyr (10):
      drm/amd/display: 3.2.248
      drm/amd/display: 3.2.250
      drm/amd/display: 3.2.251
      drm/amd/display: 3.2.252
      drm/amd/display: 3.2.253
      drm/amd/display: Clean up code warnings
      drm/amd/display: 3.2.254
      drm/amd/display: Revert "drm/amd/display: remove duplicated edp
relink to fastboot"
      drm/amd/display: 3.2.255
      drm/amd/display: 3.2.256

Ariel Suller (1):
      accel/habanalabs: update boot status print

Arnd Bergmann (2):
      drm/nouveau/kms/nv50: hide unused variables
      accel/habanalabs: add missing debugfs function stubs

Artem Grishin (1):
      drm/amd/display: STREAM_MAPPER_CONTROL register offset on DCN35

Arthur Grillo (10):
      drm/tests: Test default pitch fallback
      drm/tests: Add KUnit tests for drm_fb_swab()
      drm/tests: Add KUnit tests for drm_fb_clip_offset()
      drm/tests: Add KUnit tests for drm_fb_build_fourcc_list()
      drm/tests: Add multi-plane support to conversion_buf_size()
      drm/tests: Add KUnit tests for drm_fb_memcpy()
      drm/debugfs: Add inline to drm_debugfs_dev_init() to suppres
-Wunused-function
      drm/tests: Zero initialize fourccs_out
      drm/tests: Add calls to drm_fb_blit() on supported format conversion =
tests
      drm/tests: Add new format conversion tests to better cover drm_fb_bli=
t()

Arun R Murthy (2):
      drm/i915/dp: Fix LT debug print in SDP CRC enable
      drm/i915: Remove the module parameter 'fastboot'

Arunpravin Paneer Selvam (3):
      drm/buddy: Improve contiguous memory allocation
      drm/amdgpu: Move the size computations to drm buddy
      drm/i915: Move the size computations to drm buddy

Arvind Yadav (1):
      drm/amdkfd: get doorbell's absolute offset based on the db_size

Asad Kamal (11):
      drm/amd/pm: Update SMUv13.0.6 PMFW headers
      drm/amd/pm: Add critical temp for GC v9.4.3
      drm/amd/pm: Fix critical temp unit of SMU v13.0.6
      drm/amdkfd: Replace pr_err with dev_err
      drm/amd/pm: Remove set df cstate for SMUv13.0.6
      drm/amd/pm: Update metric table for smu v13_0_6
      drm/amd/pm: Add gpu_metrics_v1_4
      drm/amd/pm: Use gpu_metrics_v1_4 for SMUv13.0.6
      drm/amdgpu: Expose ras version & schema info
      drm/amdgpu : Add hive ras recovery check
      drm/amdgpu: update retry times for psp BL wait

Ashutosh Dixit (1):
      drm/i915/perf: Remove gtt_offset from stream->oa_buffer.head/.tail

Aurabindo Pillai (10):
      drm/amd/display: Expose mall capability
      drm/amd/display: Enable runtime register offset init for DCN32 DMUB
      drm/amd/display: Fix incorrect comment
      drm/amd/display: Add debugfs interface for ODM combine info
      drm/amd/display: set default return value for ODM Combine debugfs
      drm/amd/display: Add DCHUBBUB callback to report MALL status
      drm/amd/display: Update DMUB cmd header
      drm/amd/display: Adjust code style for dmub_cmd.h
      drm/amd/display: Adjust code style for hw_sequencer.h
      drm/amd/display: add interface to query SubVP status

Austin Zheng (1):
      drm/amd/display: Add check for vrr_active_fixed

Badal Nilawar (1):
      drm/i915/gt: Update RC6 mask for mtl_drpc

Balasubramani Vivekanandan (2):
      drm/i915/lnl: Add display definitions
      drm/i915/display: Print display info inside driver display initializa=
tion

Bas Nieuwenhuizen (1):
      drm/amd/pm: Handle non-terminated overdrive commands.

Ben Skeggs (43):
      drm/nouveau/devinit/tu102-: remove attempt at loading PreOS
      drm/nouveau/imem: support allocations not preserved across suspend
      drm/nouveau/gr/gf100-: lose contents of global ctxbufs across suspend
      drm/nouveau/mmu/gp100-: always invalidate TLBs at CACHE_LEVEL_ALL
      drm/nouveau/kms/nv50-: fix mst payload alloc fail crashing evo
      drm/nouveau/disp: rearrange output methods
      drm/nouveau/disp: add output detect method
      drm/nouveau/disp: add output method to fetch edid
      drm/nouveau/disp: rename internal output acquire/release functions
      drm/nouveau/disp: shuffle to make upcoming diffs prettier
      drm/nouveau/disp: add acquire_dac()
      drm/nouveau/disp: add acquire_sor/pior()
      drm/nouveau/disp: update SOR routing immediately on acquire()
      drm/nouveau/kms/nv50-: pull some common init out of OR-specific code
      drm/nouveau/kms/nv50-: remove nv_encoder.audio.connector
      drm/nouveau/kms/nv50-: keep output state around until modeset complet=
e
      drm/nouveau/kms/nv50-: move audio enable post-modeset
      drm/nouveau/disp: add output hdmi config method
      drm/nouveau/disp: move hdmi disable out of release()
      drm/nouveau/disp: release outputs post-modeset
      drm/nouveau/disp: remove SOR routing updates from supervisor
      drm/nouveau/disp: add output backlight control methods
      drm/nouveau/disp: add output lvds config method
      drm/nouveau/disp: add hdmi audio hal function
      drm/nouveau/disp: move dp aux pwr method to HAL
      drm/nouveau/disp: add dp aux xfer method
      drm/nouveau/disp: add dp rates method
      drm/nouveau/kms/nv50-: split DP disable+enable into two modesets
      drm/nouveau/kms/nv50-: flush mst disables together
      drm/nouveau/kms/nv50-: fixup sink D3 before tearing down link
      drm/nouveau/disp: add dp train method
      drm/nouveau/disp: move link training out of supervisor
      drm/nouveau/disp: add dp sst config method
      drm/nouveau/disp: add dp mst id get/put methods
      drm/nouveau/disp: move outp/conn construction to chipset code
      drm/nouveau/disp: move outp init/fini paths to chipset code
      drm/nouveau/disp/nv50-: skip DCB_OUTPUT_TV
      drm/nouveau/kms/nv50-: create heads based on nvkm head mask
      drm/nouveau/kms/nv50-: create heads after outps/conns
      drm/nouveau/kms/nv50-: name aux channels after their connector
      drm/nouveau/kms/nv50-: create connectors based on nvkm info
      drm/nouveau/kms/nv50-: create outputs based on nvkm info
      drm/nouveau/kms/nv50-: disable dcb parsing

Benjamin Dotan (3):
      accel/habanalabs/gaudi2 : remove psoc_arc access
      accel/habanalabs: fix ETR/ETF flush logic
      accel/habanalabs: improve etf configuration

Bhawanpreet Lakha (2):
      drm/amd/display: Enable Replay for static screen use cases
      drm/amd/display: Add dirty rect support for Replay

Biju Das (13):
      drm: bridge: it66121: Extend match support for OF tables
      drm: bridge: it66121: Simplify probe()
      drm/bridge/analogix/anx78xx: Drop ID table
      drm/bridge: Drop conditionals around of_node pointers
      drm/bridge: Drop CONFIG_OF conditionals around of_node pointers
      drm: adv7511: Add struct adv7511_chip_info and use i2c_get_match_data=
()
      drm: adv7511: Add max_mode_clock_khz variable to struct adv7511_chip_=
info
      drm: adv7511: Add max_lane_freq_khz variable to struct adv7511_chip_i=
nfo
      drm: adv7511: Add supply_names and num_supplies variables to
struct adv7511_chip_info
      drm: adv7511: Add reg_cec_offset variable to struct adv7511_chip_info
      drm: adv7511: Add has_dsi variable to struct adv7511_chip_info
      drm: adv7511: Add link_config variable to struct adv7511_chip_info
      drm: adv7511: Add hpd_override_enable variable to struct adv7511_chip=
_info

Bjorn Andersson (1):
      drm: Add HPD state to drm_connector_oob_hotplug_event()

Bob Zhou (1):
      drm/amd/display: add missing NULL check for DML2

Bokun Zhang (5):
      drm/amdgpu/pm: Add notification for no DC support
      drm/amd/amdgpu/vcn: Add RB decouple feature under SRIOV - P1
      drm/amd/amdgpu/vcn: Add RB decouple feature under SRIOV - P2
      drm/amd/amdgpu/vcn: Add RB decouple feature under SRIOV - P3
      drm/amd/amdgpu/vcn: Add RB decouple feature under SRIOV - P4

Boyuan Zhang (1):
      drm/amdgpu: update ib start and size alignment

Candice Li (8):
      drm/amdgpu: Only support RAS EEPROM on dGPU platform
      drm/amdgpu: Add RREG64_PCIE_EXT/WREG64_PCIE_EXT functions
      drm/amdgpu: Update amdgpu_device_indirect_r/wreg_ext
      drm/amd: Add umc v12_0_0 ip headers
      drm/amdgpu: Add umc v12_0 ras functions
      drm/amdgpu: Log UE corrected by replay as correctable error
      drm/amdgpu: Identify data parity error corrected in replay mode
      drm/amdgpu: Retrieve CE count from ce_count_lo_chip in EccInfo table

Carlos Eduardo Gallo Filho (2):
      drm: Remove plane hsub/vsub alignment requirement for core helpers
      drm: Replace drm_framebuffer plane size functions with its equivalent=
s

Chaitanya Kumar Borah (1):
      drm/i915: Add wrapper for getting display step

Charlene Liu (9):
      drm/amd/display: correct z8_watermark 16bit to 20bit mask
      drm/amd/display: fix some non-initialized register mask and setting
      drm/amd/display: Temporarily disable clock gating
      drm/amd/display: Add z8_marks related in dml for DCN35
      drm/amd/display: Correct z8 watermark mask
      drm/amd/display: fix some non-initialized register mask and setting
      drm/amd/display: Add z8_marks in dml
      drm/amd/display: correct dml2 input and dlg_refclk
      drm/amd/display: Update pmfw_driver_if new structure

Chen Jiahao (1):
      drm/amd/amdgpu: Use kmemdup to simplify kmalloc and memcpy logic

Chiawen Huang (1):
      drm/amd/display: remove duplicated edp relink to fastboot

Chris Morgan (5):
      dt-bindings: display: newvision,nv3051d: Add Anbernic 351V
      drm/panel: nv3051d: Add Support for Anbernic 351V
      dt-bindings: vendor-prefixes: document Powkiddy
      dt-bindings: panel: Add Powkiddy RGB30 panel compatible
      drm/panel: st7703: Add Powkiddy RGB30 Panel Support

Chris Wilson (2):
      drm/i915: Lift runtime-pm acquire callbacks out of intel_wakeref.mute=
x
      drm/i915: Invalidate the TLBs on each GT

Christian K=C3=B6nig (18):
      drm/debugfs: drop debugfs_init() for the render and accel node v2
      drm/debugfs: disallow debugfs access when device isn't registered
      drm/amdgpu: fix amdgpu_cs_p1_user_fence
      drm/debugfs: rework debugfs directory creation v5
      drm/debugfs: remove dev->debugfs_list and debugfs_mutex v2
      drm/debugfs: rework drm_debugfs_create_files implementation v2
      drm/amdgpu: fix and cleanup gmc_v9_0_flush_gpu_tlb
      drm/amdgpu: rework gmc_v10_0_flush_gpu_tlb v2
      drm/amdgpu: cleanup gmc_v11_0_flush_gpu_tlb
      drm/amdgpu: fix and cleanup gmc_v7_0_flush_gpu_tlb_pasid
      drm/amdgpu: fix and cleanup gmc_v8_0_flush_gpu_tlb_pasid
      drm/amdgpu: fix and cleanup gmc_v9_0_flush_gpu_tlb_pasid
      drm/amdgpu: cleanup gmc_v10_0_flush_gpu_tlb_pasid
      drm/amdgpu: fix and cleanup gmc_v11_0_flush_gpu_tlb_pasid
      drm/amdgpu: drop error return from flush_gpu_tlb_pasid
      drm/amdgpu: rework lock handling for flush_tlb v2
      drm/amdgpu: further move TLB hw workarounds a layer up
      drm/amdgpu: add missing NULL check

Christophe JAILLET (6):
      drm/amdgpu: Explicitly add a flexible array at the end of
'struct amdgpu_bo_list'
      drm/amdgpu: Remove a redundant sanity check
      drm/amdgpu: Remove amdgpu_bo_list_array_entry()
      drm/amdgpu: Use kvzalloc() to simplify code
      accel/habanalabs/gaudi2: Fix incorrect string length computation
in gaudi2_psoc_razwi_get_engines()
      drm/rockchip: cdn-dp: Fix some error handling paths in cdn_dp_probe()

ChunTao Tso (1):
      drm/amd/display: set minimum of VBlank_nom

Clint Taylor (2):
      drm/i915/display: Remove FBC capability from fused off pipes
      drm/i915/xe2lpd: Register DE_RRMR has been removed

Colin Ian King (2):
      drm/amd: Fix spelling mistake "throtting" -> "throttling"
      drm/amd/display: Fix a handful of spelling mistakes in dml_print outp=
ut

Cong Liu (2):
      drm/amdgpu: fix a memory leak in amdgpu_ras_feature_enable
      drm/amd/display: Fix null pointer dereference in error message

Cong Yang (3):
      drm/panel: ili9882t: Break out as separate driver
      drm/panel: ili9882t: Avoid blurred screen from fast sleep
      arm64: defconfig: Enable ILITEK_ILI9882T panel

Dafna Hirschfeld (5):
      accel/habanalabs: disable events ioctls on control device
      accel/habanalabs: fix inline doc typos
      accel/habanalabs: add fw status SHUTDOWN_PREP
      accel/habanalabs: extend preboot timeout when preboot might take long=
er
      accel/habanalabs: remove wrong doc for init_phys_pg_pack_from_userptr

Dan Carpenter (4):
      drm/amdgpu: fix retry loop test
      drm/i915/gt: Prevent error pointer dereference
      drm/amd/pm: delete dead code
      drm/rockchip: Fix type promotion bug in rockchip_gem_iommu_map()

Dani Liberman (2):
      accel/habanalabs: handle arc farm razwi
      accel/habanalabs: handle f/w reserved dram space request

Daniel Miess (2):
      drm/amd/display: Port replay vblank logic to DML2
      drm/amd/display: Don't set dpms_off for seamless boot

Daniel Stone (2):
      doc: dma-buf: Rewrite intro section a little
      doc: uapi: Add document describing dma-buf semantics

Daniele Ceraolo Spurio (3):
      drm/i915/gsc: define gsc fw
      drm/i915/huc: silence injected failure in the load via GSC path
      drm/i915/guc: Enable WA 14018913170

Danilo Krummrich (7):
      drm/nouveau: sched: avoid job races between entities
      drm/nouveau: uvmm: fix unset region pointer on remap
      drm/nouveau: uapi: don't pass NO_PREFETCH flag implicitly
      drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm
      drm/gpuvm: allow building as module
      drm/nouveau: uvmm: rename 'umgr' to 'base'
      drm/gpuvm: doc: fix filename references

Dario Binacchi (1):
      drm/vc4: fix typo

Darren Powell (8):
      amdgpu/pm: Replace print_clock_levels with emit_clock_levels for arct=
urus
      amdgpu/pm: Optimize emit_clock_levels for arcturus - part 1
      amdgpu/pm: Optimize emit_clock_levels for arcturus - part 2
      amdgpu/pm: Optimize emit_clock_levels for arcturus - part 3
      amdgpu/pm: Replace print_clock_levels with emit_clock_levels for alde=
baran
      amdgpu/pm: Optimize emit_clock_levels for aldebaran - part 1
      amdgpu/pm: Optimize emit_clock_levels for aldebaran - part 2
      amdgpu/pm: Optimize emit_clock_levels for aldebaran - part 3

Dave Airlie (20):
      nouveau/u_memcpya: use vmemdup_user
      Merge tag 'drm-misc-next-2023-09-11-1' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-misc-next-2023-09-27' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-gt-next-2023-09-28' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-intel-next-2023-09-29' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-2023-10-12' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-2023-10-12' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-intel-gt-next-2023-10-12' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-habanalabs-next-2023-10-10' of
https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux into
drm-next
      Merge tag 'amd-drm-next-6.7-2023-10-13' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-2023-10-19' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-intel-gt-next-2023-10-19' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'mediatek-drm-next-6.7' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      BackMerge tag 'v6.6-rc7' into drm-next
      Merge tag 'drm-msm-next-2023-10-17' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'topic/vmemdup-user-array-2023-10-24-1' of
git://anongit.freedesktop.org/drm/drm into drm-next
      Merge tag 'amd-drm-next-6.7-2023-10-20' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      usb: typec: altmodes/displayport: fixup drm internal api change
vs new user.
      Merge tag 'drm-misc-next-2023-10-27' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-6.7-2023-10-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

David (Ming Qiang) Wu (1):
      drm/amdgpu: not to save bo in the case of RAS err_event_athub

David Francis (4):
      drm/amdkfd: Checkpoint and restore queues on GFX11
      drm/amdgpu: Handle null atom context in VBIOS info ioctl
      drm/amdgpu: Add EXT_COHERENT memory allocation flags
      drm/amdgpu: Add EXT_COHERENT support for APU and NUMA systems

David Heidelberg (2):
      drm/panel: JDI LT070ME05000 drop broken link
      drm/panel: JDI LT070ME05000 simplify with dev_err_probe()

David Meriin (1):
      accel/habanalabs: move cpucp interface to linux/habanalabs

Deepak R Varma (1):
      accel/ivpu: Delete the TODO file

Dembskiy Igor (1):
      drm/amd/display: remove useless check in should_enable_fbc()

Dillon Varone (2):
      drm/amd/display: Skip dmub memory flush when not needed
      drm/amd/display: add dp dto programming function to dccg

Diogo Ivo (2):
      dt-bindings: display: Add bindings for JDI LPM102A188A
      drm/panel: Add driver for JDI LPM102A188A

Dmitry Baryshkov (45):
      drm/msm/dpu: remove irq_idx argument from IRQ callbacks
      drm/msm/dpu: extract dpu_core_irq_is_valid() helper
      drm/msm/dpu: add helper to get IRQ-related data
      drm/msm/dpu: make the irq table size static
      drm/msm/dpu: stop using raw IRQ indices in the kernel output
      drm/msm/dpu: stop using raw IRQ indices in the kernel traces
      drm/msm/dpu: shift IRQ indices by 1
      drm/msm/dpu: inline _setup_pingpong_ops()
      drm/msm/dpu: enable PINGPONG TE operations only when supported by HW
      drm/msm/dpu: drop the DPU_PINGPONG_TE flag
      drm/msm/dpu: inline _setup_intf_ops()
      drm/msm/dpu: enable INTF TE operations only when supported by HW
      drm/msm/dpu: drop DPU_INTF_TE feature flag
      drm/msm/dpu: drop useless check from dpu_encoder_phys_cmd_te_rd_ptr_i=
rq()
      drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init
      drm/msm/dp: support setting the DP subconnector type
      drm/msm: allow passing struct msm_kms to msm_drv_probe()
      drm/msm/dpu: move resource allocation to the _probe function
      drm/msm/mdp4: move resource allocation to the _probe function
      drm/msm/mdp5: move resource allocation to the _probe function
      drm/msm/dsi: switch to devm_drm_bridge_add()
      drm/msm/hdmi: switch to devm_drm_bridge_add()
      drm/msm/dp: move pdev from struct dp_display_private to struct msm_dp
      drm/msm/dp: switch to devm_drm_bridge_add()
      drm/msm: remove msm_drm_private::bridges field
      drm/msm: drop pm ops from the headless msm driver
      drm/msm: rename msm_pm_prepare/complete to note the KMS nature
      drm/msm: remove shutdown callback from msm_platform_driver
      drm/msm: rename msm_drv_shutdown() to msm_kms_shutdown()
      drm/msm: switch to drmm_mode_config_init()
      drm/msm: only register 'kms' debug file if KMS is used
      drm/msm: make fb debugfs file available only in KMS case
      drm/msm: carve out KMS code from msm_drv.c
      drm/msm: fix fault injection support
      drm/bridge_connector: stop filtering events in
drm_bridge_connector_hpd_cb()
      drm/bridge_connector: implement oob_hotplug_event
      drm/msm/dsi: use correct lifetime device for devm_drm_bridge_add
      drm/msm/hdmi: use correct lifetime device for devm_drm_bridge_add
      drm/msm/dp: use correct lifetime device for devm_drm_bridge_add
      drm/bridge: lt9611uxc: fix the race in the error path
      drm/msm/dsi: use msm_gem_kernel_put to free TX buffer
      drm/msm/dsi: free TX buffer in unbind
      drm/msm/a7xx: actually use a7xx state registers
      drm/ci: pick up -external-fixes from the merge target repo
      drm/ci: force-enable CONFIG_MSM_MMCC_8996 as built-in

Dmitry Osipenko (1):
      MAINTAINERS: Add Boris Brezillon as Panfrost driver maintainer

Dmytro Laktyushkin (1):
      drm/amd/display: block MPO if it prevents pstate support

Dnyaneshwar Bhadane (2):
      drm/i915/rpl: Update pci ids for RPL P/U
      drm/i915: Add Wa_18022495364

Douglas Anderson (16):
      drm/bridge: Fix kernel-doc typo in desc of output_bus_cfg in
drm_bridge_state
      drm/panel: Don't store+check prepared/enabled for simple cases
      drm/panel: s6e63m0: Don't store+check prepared/enabled
      drm/panel: otm8009a: Don't double check prepared/enabled
      MAINTAINERS: Update DRM DRIVERS FOR FREESCALE IMX entry
      drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a noop
      drm/imx/ipuv3: Call drm_atomic_helper_shutdown() at shutdown/unbind t=
ime
      drm/ingenic: Call drm_atomic_helper_shutdown() at shutdown time
      drm/armada: Call drm_atomic_helper_shutdown() at shutdown time
      drm: Call drm_atomic_helper_shutdown() at shutdown time for misc driv=
ers
      drm/vc4: Call drm_atomic_helper_shutdown() at shutdown time
      drm/ssd130x: Call drm_atomic_helper_shutdown() at remove time
      drm: Call drm_atomic_helper_shutdown() at shutdown/remove time
for misc drivers
      drm/hisilicon/kirin: Call drm_atomic_helper_shutdown() at
shutdown/unbind time
      drm/imx/dcss: Call drm_atomic_helper_shutdown() at shutdown time
      MAINTAINERS: Document that the NXP i.MX 8MQ DCSS driver goes thru drm=
-misc

Duncan Ma (4):
      drm/amd/display: Fix dig register undefined
      drm/amd/display: Update driver and IPS interop
      drm/amd/display: Improve x86 and dmub ips handshake
      drm/amd/display: Update stream mask

Ethan Bitnun (2):
      drm/amd/display: Add support for 1080p SubVP to reduce idle power
      drm/amd/display: Add new logs for AutoDPMTest

Evan Quan (10):
      drm/amd/pm: correct SMU13 gfx voltage related OD settings
      drm/amd/pm: fulfill the support for SMU13 `pp_dpm_dcefclk` interface
      drm/amd/pm: introduce a new set of OD interfaces
      drm/amdgpu: revise the device initialization sequences
      drm/amd/pm: add fan temperature/pwm curve OD setting support for SMU1=
3
      drm/amd/pm: add fan acoustic limit OD setting support for SMU13
      drm/amd/pm: add fan acoustic target OD setting support for SMU13
      drm/amd/pm: add fan target temperature OD setting support for SMU13
      drm/amd/pm: add fan minimum pwm OD setting support for SMU13
      Revert "drm/amd/pm: disable the SMU13 OD feature support temporarily"

Fangzhi Zuo (1):
      drm/amd/display: Fix MST Multi-Stream Not Lighting Up on dcn35

Felix Kuehling (2):
      drm/amdgpu: Fix possible null pointer dereference
      drm/amdgpu: Reserve fences for VM update

Frank Oltmanns (1):
      drm/panel: st7703: Fix timings when entering/exiting sleep

Fudong Wang (1):
      drm/amd/display: Add smu write msg id fail retry process

Gabe Teeger (5):
      drm/amd/display: Remove wait while locked
      drm/amd/display: Add option to flip ODM optimization
      drm/amd/display: Rename DisableMinDispClkODM in dc_config
      drm/amd/display: Add Null check for DPP resource
      drm/amd/display: add check in validate_only in dml2

Geert Uytterhoeven (3):
      drm/ssd130x: Fix screen clearing
      drm/ssd130x: Use bool for ssd130x_deviceinfo flags
      drm/client: Convert drm_client_buffer_addfb() to drm_mode_addfb2()

George Shen (3):
      drm/amd/display: Refactor DPG test pattern logic for ODM cases
      drm/amd/display: Disable SubVP if test pattern is enabled
      drm/amd/display: Update SDP VSC colorimetry from DP test
automation request

Gustavo Sousa (12):
      drm/i915/display: Remove unused POWER_DOMAIN_MASK
      drm/i915/cx0: Add intel_cx0_get_owned_lane_mask()
      drm/i915: Simplify intel_cx0_program_phy_lane() with loop
      drm/i915/cx0: Enable/disable TX only for owned PHY lanes
      drm/i915/cx0: Program vswing only for owned lanes
      drm/i915/display: Remove unused POWER_DOMAIN_MODESET
      drm/i915/cx0: Check and increase msgbus timeout threshold
      drm/i915/cx0: Add step for programming msgbus timer
      drm/i915/xe2lpd: Add fake PCH
      drm/i915/xe2lpd: Handle port AUX interrupts
      drm/i915/xe2lpd: Add support for HPD
      drm/i915/irq: Clear GFX_MSTR_IRQ as part of IRQ reset

Hamza Mahfooz (11):
      drm/amd/display: fix mode scaling (RMX_.*)
      drm/amdgpu: register a dirty framebuffer callback for fbcon
      drm/amd/display: register edp_backlight_control() for DCN301
      Revert "Revert "drm/amd/display: Implement zpos property""
      Revert "drm/amd/display: Remove v_startup workaround for dcn3+"
      drm/amd/display: limit the v_startup workaround to ASICs older than D=
CN3.1
      drm/amd/display: prevent potential division by zero errors
      Revert "drm/amd: Disable S/G for APUs when 64GB or more host memory"
      drm/amd/display: fix the ability to use lower resolution modes on eDP
      drm/amd/display: switch DC over to the new DRM logging macros
      drm/amd/display: fix S/G display enablement

Hans de Goede (4):
      drm/i915/vlv_dsi: Add DMI quirk for wrong panel modeline in BIOS
on Asus TF103C (v3)
      drm/i915/vlv_dsi: Add DMI quirk for wrong I2C bus and panel size
on Lenovo Yoga Tablet 2 series (v3)
      drm/i915/vlv_dsi: Add DMI quirk for backlight control issues on
Lenovo Yoga Tab 3 (v2)
      drm/i915/dsi: Add some debug logging to mipi_exec_i2c (v2)

Harish Kasiviswanathan (2):
      drm/amdkfd: ratelimited SQ interrupt messages
      drm/amdkfd: Insert missing TLB flush on GFX10 and later

Harry Wentland (8):
      drm/amd/display: Skip entire amdgpu_dm build if !CONFIG_DRM_AMD_DC
      drm/amd/display: Create one virtual connector in DC
      drm/amd/display: Skip writeback connector when we get amdgpu_dm_conne=
ctor
      drm/amd/display: Return drm_connector from
find_first_crtc_matching_connector
      drm/amd/display: Use drm_connector in create_stream_for_sink
      drm/amd/display: Use drm_connector in create_validate_stream_for_sink
      drm/amd/display: Create amdgpu_dm_wb_connector
      drm/amd/display: Create fake sink and stream for writeback connector

Harshit Mogalapalli (1):
      drm/loongson: Fix error handling in lsdc_pixel_pll_setup()

Hawking Zhang (9):
      drm/amdgpu: Fix the return for gpu mode1_reset
      drm/amdgpu: Allow issue disable gfx ras cmd to firmware
      drm/amdgpu: Add umc_info v4_0 structure
      drm/amdgpu: Support query ecc cap for aqua_vanjaram
      drm/amdgpu: Free ras cmd input buffer properly
      drm/amdgpu: Correct se_num and reg_inst for gfx v9_4_3 ras counters
      drm/amdgpu: fallback to old RAS error message for aqua_vanjaram
      drm/amdgpu: Enable software RAS in vcn v4_0_3
      drm/amdgpu: Add UVD_VCPU_INT_EN2 to dpg sram

Helen Koike (11):
      drm/ci: uprev mesa version: fix container build & crosvm
      drm/ci: fix DEBIAN_ARCH and get amdgpu probing
      drm/ci: add helper script update-xfails.py
      drm/ci: uprev IGT and make sure core_getversion is run
      drm/ci: clean up xfails (specially flakes list)
      drm/ci: add subset-1-gfx to LAVA_TAGS and adjust shards
      drm/ci: increase i915 job timeout to 1h30m
      drm/ci: export kernel config
      drm/ci: do not automatically retry on error
      drm/ci: docs: add step about how to request privileges
      MAINTAINERS: drm/ci: add entries for xfail files

Hen Alon (1):
      accel/habanalabs: add tsc clock sampling to clock sync info

Hong-lu Cheng (1):
      drm/amd/display: Update OPP counter from new interface

Horace Chen (1):
      drm/amdkfd: use correct method to get clock under SRIOV

Huang Rui (4):
      drm/amdgpu: add VPE HW IP definition
      drm/amdgpu: add VPE RING TYPE definition
      drm/amdgpu: add VPE IP BLOCK definition
      drm/amdgpu: add VPE HW IP BLOCK definition

Hugo Hu (1):
      drm/amd/display: reprogram det size while seamless boot

Ian Chen (2):
      drm/amd/display: Refactor edp power control
      drm/amd/display: add skip_implict_edp_power_control flag for dcn32

Ian Ray (2):
      drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: switch to drm_do_get_edi=
d()
      MAINTAINERS: Update entry for megachips-stdpxxxx-ge-b850v3-fw

Icenowy Zheng (1):
      drm/amdgpu: fix SI failure due to doorbells allocation

Igor Grinberg (2):
      accel/habanalabs/gaudi2: prepare to remove soft_rst_irq
      accel/habanalabs/gaudi2: prepare to remove cpu_rst_status

Ilya Bakoulin (2):
      drm/amd/display: Fix DP2.0 timing sync
      drm/amd/display: Fix shaper using bad LUT params

Imre Deak (42):
      drm/i915: Avoid endless HPD poll detect loop via runtime suspend/resu=
me
      drm/i915: Don't change the status of forced connectors during
hotplug detect
      drm/i915: Don't change the status of forced connectors during
HPD poll detect
      drm: Add an HPD poll helper to reschedule the poll work
      drm/i915: Fix HPD polling, reenabling the output poll work as needed
      drm/i915/dp: Drop redundant AUX power get/put in intel_dp_force()
      drm/i915/mtl: Add TC port lockdep assert to AUX power well enabling
      drm/dp_mst: Fix NULL dereference during payload addition
      drm/dp_mst: Sanitize error return during payload addition
      drm/dp_mst: Tune down error message during payload addition
      drm/i915/dp_mst: Tune down error message during payload addition
      drm/i915/dp: Factor out helpers to compute the link limits
      drm/i915/dp: Track the pipe and link bpp limits separately
      drm/i915/dp: Skip computing a non-DSC link config if DSC is needed
      drm/i915/dp: Update the link bpp limits for DSC mode
      drm/i915/dp: Limit the output link bpp in DSC mode
      drm/i915: Add helper to modeset a set of pipes
      drm/i915: Rename intel_modeset_all_pipes() to
intel_modeset_all_pipes_late()
      drm/i915: Factor out a helper to check/compute all the CRTC states
      drm/i915: Add helpers for BW management on shared display links
      drm/i915/fdi: Improve FDI BW sharing between pipe B and C
      drm/i915/fdi: Recompute state for affected CRTCs on FDI links
      drm/i915/dp_mst: Make sure pbn_div is up-to-date after sink reconnect
      drm/i915/dp: Sanitize DPCD revision check in intel_dp_get_dsc_sink_ca=
p()
      drm/i915/dp: Store DSC DPCD capabilities in the connector
      drm/i915/dp_mst: Set connector DSC capabilities and decompression AUX
      drm/i915/dp: Use i915/intel connector local variables in
i915_dsc_fec_support_show()
      drm/i915/dp: Use connector DSC DPCD in i915_dsc_fec_support_show()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_dsc_compute_max_bpp()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_supports_fec()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_supports_dsc()
      drm/i915/dp: Use connector DSC DPCD in
intel_dp_dsc_max_sink_compressed_bppx16()
      drm/i915/dp: Pass connector DSC DPCD to
drm_dp_dsc_sink_supported_input_bpcs()
      drm/i915/dp: Pass only the required i915 to
intel_dp_source_dsc_version_minor()
      drm/i915/dp: Pass only the required DSC DPCD to
intel_dp_sink_dsc_version_minor()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_dsc_compute_params()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_dsc_supports_format()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_dsc_get_slice_count()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_mode_valid()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_dsc_compute_config()
      drm/i915/dp_mst: Use connector DSC DPCD in intel_dp_mst_mode_valid_ct=
x()
      drm/i915/dp: Remove unused DSC caps from intel_dp

Iswara Nagulendran (1):
      drm/amd/display: Read before writing Backlight Mode Set Register

Ivan Lipski (1):
      Revert "drm/amd/display: Enable Replay for static screen use cases"

Ivan Orlov (1):
      accel: make accel_class a static const structure

Jacek Lawrynowicz (4):
      accel/ivpu: Remove duplicated error messages
      accel/ivpu: Move ivpu_fw_load() to ivpu_fw_init()
      accel/ivpu: Move MMU register definitions to ivpu_mmu.c
      accel/ivpu: Add ivpu_bo_vaddr() and ivpu_bo_size()

Jagan Teki (4):
      dt-bindings: display: rockchip-vop: Document rv1126 vop
      drm/rockchip: vop: Add rv1126 vop_lite support
      dt-bindings: display: rockchip-dw-mipi-dsi: Document rv1126 DSI
      drm/rockchip: dsi: Add rv1126 MIPI DSI support

Jai Luthra (1):
      drm: bridge: it66121: Fix invalid connector dereference

James Zhu (1):
      drm/amdxcp: fix amdxcp unloads incompletely

Jani Nikula (77):
      drm/i915/vma: constify unbind_fence_ops
      drm/i915/regs: split out intel_color_regs.h
      drm/i915/color: move CHV CGM pipe mode read to intel_color
      drm/i915: move HSW+ gamma mode read to intel_color
      drm/i915: move ILK+ CSC mode read to intel_color
      drm/i915/color: move SKL+ gamma and CSC enable read to intel_color
      drm/i915/color: move pre-SKL gamma and CSC enable read to intel_color
      drm/i915: add minimal i915_gem_object_frontbuffer.h
      drm/edid: add drm_edid_is_digital()
      drm/i915/display: use drm_edid_is_digital()
      drm/edid: parse source physical address
      drm/cec: add drm_dp_cec_attach() as the non-edid version of set edid
      drm/i915/cec: switch to setting physical address directly
      media: cec: core: add note about *_from_edid() function usage in drm
      drm/i915/dsc: improve clarity of the pps reg read/write helpers
      drm/i915/dsc: have intel_dsc_pps_read_and_verify() return the value
      drm/i915/dsc: have intel_dsc_pps_read() return the value
      drm/i915/dsc: rename pps write to intel_dsc_pps_write()
      drm/i915/dsc: drop redundant =3D 0 assignments
      drm/i915/dsc: clean up pps comments
      drm/i915/dsc: add the PPS number to the register content macros
      drm/i915/dsc: use REG_BIT, REG_GENMASK, and friends for PPS0 and PPS1
      drm/i915/gt: rename DBG() to GTT_TRACE()
      Merge drm/drm-next into drm-intel-next
      drm: bridge: it66121: ->get_edid callback must not return err pointer=
s
      drm/i915/fbc: replace GEM_BUG_ON() to drm_WARN_ON()
      drm/i915/fb: replace GEM_WARN_ON() with drm_WARN_ON()
      drm/i915/dpt: replace GEM_BUG_ON() with drm_WARN_ON()
      drm/i915: move more of the display probe to display code
      drm/i915/display: call gmdid display probe at a higher level
      drm/i915: move intel_display_device_probe() one level higher
      MAINTAINERS: add drm_bridge_connector.[ch] files under bridge chips
      drm/i915: add a note about fec_enable with 128b/132b
      drm/mediatek/dp: fix memory leak on ->get_edid callback audio detecti=
on
      drm/mediatek/dp: fix memory leak on ->get_edid callback error path
      drm/i915/gt: remove a static inline that requires including i915_drv.=
h
      drm/i915/gem: remove inlines from i915_gem_execbuffer.c
      drm/i915/dp: refactor aux_ch_name()
      drm/i915/cx0: prefer forward declarations over includes
      drm/bridge: use drm_bridge_get_edid() instead of using ->get_edid dir=
ectly
      drm/bridge: lt9611uxc: use drm_bridge_get_edid() instead of
using ->get_edid directly
      drm/i915: Update DRIVER_DATE to 20230929
      drm/i915: define I915 during i915 driver build
      drm/i915/display: add I915 conditional build to intel_lvds.h
      drm/i915/display: add I915 conditional build to hsw_ips.h
      drm/i915/display: add I915 conditional build to i9xx_plane.h
      drm/i915/display: add I915 conditional build to intel_lpe_audio.h
      drm/i915/display: add I915 conditional build to intel_pch_refclk.h
      drm/i915/display: add I915 conditional build to intel_pch_display.h
      drm/i915/display: add I915 conditional build to intel_sprite.h
      drm/i915/display: add I915 conditional build to intel_overlay.h
      drm/i915/display: add I915 conditional build to g4x_dp.h
      drm/i915/display: add I915 conditional build to intel_dpio_phy.h
      drm/i915/display: add I915 conditional build to intel_crt.h
      drm/i915/display: add I915 conditional build to vlv_dsi.h
      drm/i915/display: add I915 conditional build to i9xx_wm.h
      drm/i915/display: add I915 conditional build to g4x_hdmi.h
      drm/i915/display: add I915 conditional build to intel_dvo.h
      drm/i915/display: add I915 conditional build to intel_sdvo.h
      drm/i915/display: add I915 conditional build to intel_tv.h
      drm/i915/display: add I915 conditional build to vlv_dsi_pll.h
      drm/i915: convert INTEL_DISPLAY_ENABLED() into a function
      drm/i915: move display info related macros to display
      drm/i915: separate display runtime info init
      drm/i915: separate subplatform init and runtime feature init
      Merge drm/drm-next into drm-intel-next
      drm/i915/mocs: use to_gt() instead of direct &i915->gt
      drm/i915: allocate i915->gt0 dynamically
      drm/i915/gt: remove i915->gt0 in favour of i915->gt[0]
      drm/dp: switch drm_dp_downstream_*() helpers to struct drm_edid
      drm/msm/dp: skip validity check for DP CTS EDID checksum
      drm/i915/gvt: remove unused to_gvt() and reduce includes
      drm/i915/gvt: don't include gvt.h from intel_gvt_mmio_table.h
      drm/i915/gvt: move struct engine_mmio to mmio_context.c
      drm/i915/gvt: move structs intel_gvt_irq_info and
intel_gvt_irq_map to interrupt.c
      drm/i915: drop -Wall and related disables from cflags as redundant
      drm/i915: enable W=3D1 warnings by default

Janne Grunau (1):
      drm/simpledrm: Add support for multiple "power-domains"

Jason-JH.Lin (12):
      drm/mediatek: Fix coverity issue with unintentional integer overflow
      drm/mediatek: Add mmsys_dev_num to mt8188 vdosys0 driver data
      drm/mediatek: Add crtc path enum for all_drm_priv array
      drm/mediatek: Fix using wrong drm private data to bind mediatek-drm
      drm/mediatek: Add encoder_index interface for mtk_ddp_comp_funcs
      drm/mediatek: Add connector dynamic selection capability
      drm/mediatek: dpi: Support dynamic connector selection
      drm/mediatek: dsi: Support dynamic connector selection
      drm/mediatek: Support dynamic selection of MT8188 VDOSYS0
      drm/mediatek: Fix iommu fault by swapping FBs after updating plane st=
ate
      drm/mediatek: Fix iommu fault during crtc enabling
      drm/mediatek: gamma: Adjust mtk_drm_gamma_set_common parameters

Javier Carrasco (1):
      drm/connector: document DRM_MODE_COLORIMETRY_COUNT

Javier Martinez Canillas (8):
      drm/ssd130x: Store the HW buffer in the driver-private CRTC state
      drm/ssd130x: Drop _helper prefix from struct drm_*_helper_funcs callb=
acks
      drm/ssd130x: Replace .page_height field in device info with a constan=
t
      drm/ssd130x: Add a controller family id to the device info data
      drm/ssd130x: Rename commands that are shared across chip families
      drm/ssd130x: Add support for the SSD132x OLED controller family
      dt-bindings: display: Split common Solomon properties in their own sc=
hema
      dt-bindings: display: Add SSD132x OLED controllers

Javier Pello (1):
      drm/i915/gt: Fix reservation address in ggtt_reserve_guc_top

Jay Cornwall (2):
      drm/amdkfd: Add missing gfx11 MQD manager callbacks
      drm/amdgpu: Improve MES responsiveness during oversubscription

Jernej Skrabec (1):
      drm/bridge: dw-hdmi-cec: Add arbitration lost event

Jesse Zhang (4):
      drm/amdgpu/pm: Remove the duplicate dpm status check
      drm/amdgpu: disable GFXOFF and PG during compute for GFX9
      drm/amdkfd:remove unused code
      drm/amdkfd: Fix shift out-of-bounds issue

Jessica Zhang (5):
      MAINTAINERS: Add Jessica as a reviewer for drm/panel
      drm/msm/dpu: Move setting of dpu_enc::wide_bus_en to atomic enable()
      drm/msm/dpu: Enable widebus for DSI INTF
      drm/msm/dsi: Add DATABUS_WIDEN MDP_CTRL2 bit
      drm/msm/dsi: Enable widebus for DSI

Jiadong Zhu (2):
      drm/amd/pm: drop unneeded dpm features disablement for SMU 14.0.0
      drm/amdgpu: add tmz support for GC IP v11.5.0

Jiapeng Chong (4):
      drm/amdgpu: clean up some inconsistent indenting
      drm/amd/display: clean up some inconsistent indenting
      drm/amdkfd: clean up some inconsistent indenting
      drm/amd/display: clean up some inconsistent indenting

Jim Cromie (1):
      drm/i915: add trailing newlines to msgs

Johannes Zink (3):
      dt-bindings: display: move LVDS data-mapping definition to separate f=
ile
      dt-bindings: display: simple: support non-default data-mapping
      drm/panel-simple: allow LVDS format override

John Harrison (5):
      drm/i915/guc: Force a reset on internal GuC error
      drm/i915/guc: Suppress 'ignoring reset notification' message
      drm/i915/guc: Update 'recommended' version to 70.12.1 for
DG2/ADL-S/ADL-P/MTL
      drm/i915/gt: More use of GT specific print helpers
      drm/i915: More use of GT specific print helpers

Johnny Liu (1):
      gpu: host1x: Correct allocated size for contexts

Jonas Karlman (7):
      drm/rockchip: vop: Fix reset of state in duplicate state crtc funcs
      drm/rockchip: vop: Use cleanup helper directly as destroy funcs
      drm/rockchip: vop: Fix call to crtc reset helper
      drm/rockchip: vop2: Don't crash for invalid duplicate_state
      drm/rockchip: vop2: Add missing call to crtc reset helper
      drm/fourcc: Add NV20 and NV30 YUV formats
      drm/rockchip: vop: Add NV15, NV20 and NV30 support

Jonathan Cavitt (9):
      drm/i915/selftests: Align igt_spinner_create_request with hangcheck
      drm/i915/gt: Wait longer for tasks in migrate selftest
      drm/i915/gem: Make i915_gem_shrinker multi-gt aware
      drm/i915: Add GuC TLB Invalidation device info flags
      drm/i915/guc: Add CT size delay helper
      drm/i915: No TLB invalidation on suspended GT
      drm/i915: No TLB invalidation on wedged GT
      drm/i915/gt: Increase sleep in gt_tlb selftest sanitycheck
      drm/i915: Enable GuC TLB invalidations for MTL

Jonathan Kim (1):
      drm/amdkfd: fix add queue process context clear without runtime enabl=
e

Jorge Maidana (1):
      drm/gma500: remove duplicate macro definitions

Joshua Ashton (2):
      drm/amd/display: Hook up 'content type' property for HDMI
      drm/amd/display: Remove unused display_content_support

Jouni H=C3=B6gander (9):
      drm/i915/psr: Apply Wa_14015648006 for all display 14 steppings
      drm/i915/fbc: Clear frontbuffer busy bits on flip
      drm/i915/psr: Clear frontbuffer busy bits on flip
      drm/i915: Add new frontbuffer tracking interface to queue flush
      drm/i915: Handle dma fences in dirtyfb callback
      drm/i915/psr: Add psr sink error status into sink status debugfs
      drm/i915: Remove runtime suspended boolean from intel_runtime_pm stru=
ct
      drm/i915: Warn on if set frontbuffer return value is not NULL on rele=
ase
      drm/i915/display: Include i915_active header in frontbuffer tracking =
code

Juerg Haefliger (1):
      accel/habanalabs/gaudi: Add MODULE_FIRMWARE macros

Juha-Pekka Heikkila (1):
      drm/i915/display: add lock while printing frontbuffer tracking
bits to debugfs

Juha-Pekka Heikkil=C3=A4 (1):
      drm/i915/xe2lpd: Enable odd size and panning for planar yuv

Juntong Deng (1):
      drm/amdgpu: Add description for AMD_IP_BLOCK_TYPE_VPE

Justin Stitt (8):
      drm/repaper: fix -Wvoid-pointer-to-enum-cast warning
      drm/nouveau/nvif: refactor deprecated strncpy
      drm/nouveau/core: refactor deprecated strncpy
      drm/nouveau/pm: refactor deprecated strncpy
      drm/i915: refactor deprecated strncpy
      drm/gma500: refactor deprecated strncpy
      accel/habanalabs: refactor deprecated strncpy to strscpy_pad
      accel/habanalabs: refactor deprecated strncpy

Karol Wachowski (2):
      accel/ivpu: Initialize context with SSID =3D 1
      accel/ivpu: Read clock rate only if device is up

Karolina Stolarek (1):
      drm/ttm/tests: Require MMU when testing

Kees Cook (11):
      drm/amd/pm: Annotate struct smu10_voltage_dependency_table with
__counted_by
      drm/amdgpu/discovery: Annotate struct ip_hw_instance with __counted_b=
y
      drm/i915/selftests: Annotate struct perf_series with __counted_by
      drm/msm/dpu: Annotate struct dpu_hw_intr with __counted_by
      drm/nouveau/pm: Annotate struct nvkm_perfdom with __counted_by
      drm/vc4: Annotate struct vc4_perfmon with __counted_by
      drm/virtio: Annotate struct virtio_gpu_object_array with __counted_by
      drm/vmwgfx: Annotate struct vmw_surface_dirty with __counted_by
      drm/v3d: Annotate struct v3d_perfmon with __counted_by
      drm/amdgpu: Annotate struct amdgpu_bo_list with __counted_by
      drm/i915/guc: Annotate struct ct_incoming_msg with __counted_by

Kenneth Feng (3):
      drm/amd/pm: add unique_id for gc 11.0.3
      drm/amd/swsmu: add smu14 ip support
      drm/amd/amdgpu: avoid to disable gfxhub interrupt when driver is unlo=
aded

Khaled Almahallawy (1):
      drm/i915/cx0: Only clear/set the Pipe Reset bit of the PHY Lanes Owne=
d

Klaus Goger (1):
      drm/panel: ltk050h3146w: add support for Leadtek LTK050H3148W-CTA6 va=
riant

Koby Elbaz (4):
      accel/habanalabs: set device status 'malfunction' while in rmmod
      accel/habanalabs: print return code when process termination fails
      accel/habanalabs: call put_pid after hpriv list is updated
      accel/habanalabs: rename fd_list to hpriv_list

Konrad Dybcio (17):
      dt-bindings: display: panel: Add Raydium RM692E5
      drm/panel: Add driver for BOE RM692E5 AMOLED panel
      dt-bindings: display/msm/gmu: Add Adreno 7[34]0 GMU
      dt-bindings: display/msm/gmu: Allow passing QMP handle
      dt-bindings: display/msm/gpu: Allow A7xx SKUs
      drm/msm/a6xx: Add missing regs for A7XX
      drm/msm/a6xx: Add skeleton A7xx support
      drm/msm/a6xx: Send ACD state to QMP at GMU resume
      drm/msm/a6xx: Mostly implement A7xx gpu_state
      drm/msm/a6xx: Add A730 support
      drm/msm/a6xx: Add A740 support
      drm/msm/a6xx: Poll for GBIF unhalt status in hw_init
      drm/msm/adreno: Fix SM6375 GPU ID
      drm/msm/a6xx: Fix unknown speedbin case
      drm/msm/adreno: Add ZAP firmware name to A635
      drm/msm/adreno: Add A635 speedbin 0xac (A643)
      drm/msm/a6xx: Fix up QMP handling

Konstantin Meskhidze (1):
      drm/radeon: possible buffer overflow

Krunoslav Kovac (2):
      drm/amd/display: PQ tail accuracy
      drm/amd/display: PQ regamma end point

Krystian Pradzynski (4):
      accel/ivpu: Move set autosuspend delay to HW specific code
      accel/ivpu: Use ratelimited warn and err in IPC/JSM
      accel/ivpu: Fix verbose version of REG_POLL macros
      accel/ivpu: Print IPC type string instead of number

Kun Liu (1):
      drm/amd/pm: Vangogh: Get average_* from average field of gpu_metrics_=
table

Kunwu.Chan (1):
      drm/amd/pm: Fix a memory leak on an error path

Lang Yu (57):
      drm/amdgpu: use 6.1.0 register offset for HDP CLK_CNTL
      drm/amdgpu: add gc headers for gc 11.5.0
      drm/amdkfd: add KFD support for GC 11.5.0
      drm/amdgpu/discovery: enable mes block for gc 11.5.0
      drm/amdgpu: add mmhub 3.3.0 headers
      drm/amdgpu: add mmhub 3.3.0 support
      drm/amdgpu: add VPE 6.1.0 header files
      drm/amdgpu: add VPE firmware header definition
      drm/amdgpu: add VPE firmware interface
      drm/amdgpu: add HWID for VPE
      drm/amdgpu: add IH CLIENT ID for VPE
      drm/amdgpu: add irq src id definitions for VPE
      drm/amdgpu: add doorbell index for VPE
      drm/amdgpu: add support for VPE firmware name decoding
      drm/amdgpu: add UCODE ID for VPE
      drm/amdgpu: add PSP FW TYPE for VPE
      drm/amdgpu: add nbio callback for VPE
      drm/amdgpu: add nbio 7.11 callback for VPE
      drm/amdgpu: add VPE 6.1.0 support
      drm/amdgpu: add PSP loading support for VPE
      drm/amdgpu: add user space CS support for VPE
      drm/amdgpu: enable VPE for VPE 6.1.0
      drm/amdgpu: add VPE FW version query support
      drm/amdgpu: fix VPE front door loading issue
      drm/amdgpu: add UMSCH 4.0 register headers
      drm/amdgpu: add UMSCH IP BLOCK TYPE definition
      drm/amdgpu: add UMSCH RING TYPE definition
      drm/amdgpu: add UMSCH firmware header definition
      drm/amdgpu: add UMSCH 4.0 api definition
      drm/amdgpu: add initial support for UMSCH
      drm/amdgpu: enable UMSCH scheduling for VPE
      drm/amdgpu: add selftest framework for UMSCH
      drm/amdgpu: add VPE queue submission test
      drm/amdgpu: reserve mmhub engine 3 for UMSCH FW
      drm/amdgpu: add PSP loading support for UMSCH
      drm/amdgpu/discovery: enable UMSCH 4.0 in IP discovery
      drm/amdgpu: add amdgpu_umsch_mm module parameter
      drm/amdgpu: update SET_HW_RESOURCES definition for UMSCH
      drm/amdgpu: fix incompatible types in conditional expression
      drm/amdgpu: fix unsigned error codes
      drm/amdgpu/vpe: fix truncation warnings
      drm/amdgpu: correct gpu clock counter query on cyan skilfish
      drm/amdgpu/vpe: remove IB end boundary requirement
      drm/amdgpu/vpe: align with mcbp changes
      drm/amdgpu/vpe: fix insert_nop ops
      drm/amdgpu/umsch: fix psp frontdoor loading
      drm/amdgpu/umsch: power on/off UMSCH by DLDO
      drm/amdgpu: add support to powerup VPE by SMU
      drm/amdgpu: add power up/down UMSCH ppt callback
      drm/amdgpu: add support to power up/down UMSCH by SMU
      drm/amdgpu/umsch: enable doorbell for umsch
      drm/amdgpu: correct NBIO v7.11 programing
      drm/amdgpu: don't use legacy invalidation on MMHUB v3.3
      drm/amdgpu/umsch: correct IP version format
      drm/amdgpu/umsch: fix missing stuff during rebase
      drm/amdgpu/umsch: add suspend and resume callback
      drm/amdgpu/vpe: correct queue stop programing

Le Ma (10):
      drm/amdgpu: update mall info v2 from discovery
      drm/amdgpu: update gc_info v2_1 from discovery
      drm/amd/pm: update pmfw headers for version 85.73.0
      drm/amd/pm: add plpd_mode in smu_context to indicate current mode
      drm/amd/pm: add xgmi plpd mode selecting interface for smu v13.0.6
      drm/amd/pm: add xgmi_plpd_policy sysfs node for user to change plpd p=
olicy
      drm/amd/pm: init plpd_mode properly for different asics
      drm/amd/pm: integrate plpd allow/disallow into
select_xgmi_plpd_policy in ppt level
      drm/amd/pm: deprecate allow_xgmi_power_down interface
      drm/amd/pm: fix the print_clk_levels issue for SMU v13.0.6

Lee Jones (8):
      drm/radeon/radeon_ttm: Remove unused variable 'rbo' from radeon_bo_mo=
ve()
      drm/amd/amdgpu/amdgpu_device: Provide suitable description for
param 'xcc_id'
      drm/amd/amdgpu/amdgpu_ras: Increase buffer size to account for
all possible values
      drm/amd/amdgpu/amdgpu_sdma: Increase buffer size to account for
all possible values
      drm/amd/amdgpu/imu_v11_0: Increase buffer size to ensure all
possible values can be stored
      drm/amd/amdgpu/amdgpu_doorbell_mgr: Correct misdocumented param
'doorbell_index'
      drm/amd/amdgpu/sdma_v6_0: Demote a bunch of half-completed
function headers
      drm/tegra: hub: Increase buffer size to ensure all possible
values can be stored

Li Ma (11):
      drm/amdgpu: add header files for MP 14.0.0
      drm/amdgpu/swsmu: add smu v14_0_0 driver if file
      drm/amd/swsmu: add smu v14_0_0 ppsmc file
      drm/amd/swsmu: add smu v14_0_0 pmfw if file
      drm/amdgpu/discovery: add SMU 14 support
      drm/amdgpu: enable GFX IP v11.5.0 CG and PG support
      drm/amd/swsmu: update smu v14_0_0 header files and metrics table
      drm/amdgpu: fix missing stuff in NBIO v7.11
      drm/amdgpu: add clockgating support for NBIO v7.7.1
      drm/amdgpu: modify if condition in nbio_v7_7.c
      drm/amd/amdgpu: fix the GPU power print error in pm info

Lijo Lazar (40):
      Documentation/gpu: Update amdgpu documentation
      drm/amdgpu: Keep reset handlers shared
      drm/amdgpu: Unset baco dummy mode on nbio v7.9
      drm/amdgpu: Add bootloader status check
      drm/amdgpu: Add bootloader wait for PSP v13
      drm/amdgpu: Add SMU v13.0.6 default reset methods
      drm/amdgpu: Add only valid firmware version nodes
      drm/amdgpu: Restrict bootloader wait to SMUv13.0.6
      drm/amdgpu: Fix refclk reporting for SMU v13.0.6
      drm/amdgpu: Use default reset method handler
      drm/amdgpu: Use function for IP version check
      drm/amd/pm: Fix clock reporting for SMUv13.0.6
      drm/amd/pm:Fix GFX deep sleep clock reporting
      Documentation/amdgpu: Modify pp_dpm_*clk details
      Revert "drm/amdgpu: Report vbios version instead of PN"
      drm/amdgpu: Fix vbios version string search
      drm/amd/pm: Round Q10 format values in SMU v13.0.6
      drm/amd/pm: Remove SMUv13.0.6 unsupported feature
      drm/amdgpu: Add more fields to IP version
      drm/amdgpu: Restore partition mode after reset
      drm/amd/pm: Add throttle limit for SMU v13.0.6
      drm/amd/pm: Add GC v9.4.3 thermal limits to hwmon
      drm/amdgpu: Move package type enum to amdgpu_smuio
      drm/amdgpu: Add more smuio v13.0.3 package types
      drm/amdgpu: Get package types for smuio v13.0
      drm/amdgpu: Add sysfs attribute to get board info
      Documentation/amdgpu: Add board info details
      drm/amdgpu: Refactor FRU product information
      drm/amdgpu: Add more FRU field information
      Documentation/amdgpu: Add FRU attribute details
      drm/amdgpu: Increase IP discovery region size
      drm/amdgpu: Read PSPv13 OS version from register
      drm/amdgpu: Avoid FRU EEPROM access on APU
      drm/amdgpu: Update PSP interface header
      drm/amdgpu: Add support to load P2S tables
      drm/amd/pm: Add P2S tables for SMU v13.0.6
      drm/amdgpu: Add API to get full IP version
      drm/amdgpu: Use discovery table's subrevision
      drm/amdgpu: Add a read to GFX v9.4.3 ring test
      drm/amdgpu: Use pcie domain of xcc acpi objects

Lin.Cao (4):
      drm/amdgpu: Return -EINVAL when MMSCH init status incorrect
      drm/amdgpu: save VCN instances init info before jpeg init
      drm/amdgpu remove restriction of sriov max_pfn on Vega10
      drm/amd: check num of link levels when update pcie param

Liu Ying (11):
      drm/bridge: panel: Add a device link between drm device and panel dev=
ice
      drm/bridge: synopsys: dw-mipi-dsi: Add dw_mipi_dsi_get_bridge() helpe=
r
      drm/bridge: synopsys: dw-mipi-dsi: Add input bus format
negotiation support
      drm/bridge: synopsys: dw-mipi-dsi: Force input bus flags
      drm/bridge: synopsys: dw-mipi-dsi: Add mode fixup support
      drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock rate to calculate =
lbcc
      drm/bridge: synopsys: dw-mipi-dsi: Set minimum lane byte clock
cycles for HSA and HBP
      drm/bridge: synopsys: dw-mipi-dsi: Disable HSTX and LPRX timeout chec=
k
      dt-bindings: display: bridge: Document Freescale i.MX93 MIPI DSI
      drm/bridge: imx: Add i.MX93 MIPI DSI support
      drm/bridge: synopsys: dw-mipi-dsi: Fix hcomponent lbcc for burst mode

Luben Tuikov (3):
      drm/amdgpu: Fix a memory leak
      drm/sched: Convert the GPU scheduler to variable number of run-queues
      MAINTAINERS: Update the GPU Scheduler email

Luca Coelho (5):
      drm/i915/tc: rename mtl_tc_port_get_pin_assignment_mask()
      drm/i915/tc: make intel_tc_port_get_lane_mask() static
      drm/i915/tc: move legacy code out of the main _max_lane_count() func
      drm/i915/tc: remove "fia" from intel_tc_port_fia_max_lane_count()
      drm/i915/xe2lpd: Read pin assignment from IOM

Lucas De Marchi (7):
      drm/i915/xelpdp: Add XE_LPDP_FEATURES
      drm/i915: Re-order if/else ladder in intel_detect_pch()
      drm/i915/display: Fix style and conventions for DP AUX regs
      drm/i915/display: Use _PICK_EVEN_2RANGES() in DP AUX regs
      drm/i915/xe2lpd: Re-order DP AUX regs
      drm/i915/xe2lpd: Extend Wa_15010685871
      drm/i915/lnl: Add gmbus/ddc support

Lyude Paul (1):
      drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state

Ma Jun (7):
      drm/amd: Simplify the bo size check funciton
      drm/amd: Fix the flag setting code for interrupt request
      drm/amd/pm: Add reset option for fan_curve on smu13_0_0
      drm/amd/pm: Add reset option for fan_ctrl interfaces
      drm/amd/pm: Add reset option for fan_ctrl on smu 13.0.7
      drm/amd/pm: Support for getting power1_cap_min value
      drm/amd/pm: Fix the return value in default case

Ma Ke (4):
      drm/panel: fix a possible null pointer dereference
      drm/panel/panel-tpo-tpg110: fix a possible null pointer dereference
      drm/radeon: fix a possible null pointer dereference
      drm/amdgpu/vkms: fix a possible null pointer dereference

Mangesh Gadre (4):
      drm/amdgpu: Remove SRAM clock gater override by driver
      drm/amdgpu: Updated TCP/UTCL1 programming
      drm/amdgpu:Expose physical id of device in XGMI hive
      Revert "drm/amdgpu: Program xcp_ctl registers as needed"

Marco Felsch (1):
      drm/bridge: samsung-dsim: add more mipi-dsi device debug information

Marek Szyprowski (1):
      drm: bridge: samsung-dsim: Fix waiting for empty cmd transfer
FIFO on older Exynos

Marek Vasut (1):
      drm: bridge: samsung-dsim: Initialize ULPS EXIT for i.MX8M DSIM

Mario Limonciello (36):
      drm/amd: Drop special case for yellow carp without discovery
      drm/amd: Move seamless boot check out of display
      drm/amd: Add a module parameter for seamless boot
      drm/amd: Enable seamless boot by default on newer ASICs
      drm/amd: Propagate failures in dc_set_power_state()
      drm/amd/display: Change dc_set_power_state() to bool instead of int
      drm/amd: Drop error message about failing to load DMUB firmware
      drm/amd: Limit seamless boot by default to APUs
      drm/amd: Drop error message about failing to load SDMA firmware
      drm/amd: Move microcode init from sw_init to early_init for SDMA v5.0
      drm/amd: Move microcode init from sw_init to early_init for SDMA v6.0
      drm/amd: Move microcode init from sw_init to early_init for SDMA v5.2
      drm/amd: Move microcode init from sw_init to early_init for SDMA v3.0
      drm/amd: Move microcode init from sw_init to early_init for SDMA v2.4
      drm/amd: Move microcode init from sw_init to early_init for CIK SDMA
      drm/amd: Fix logic error in sienna_cichlid_update_pcie_parameters()
      drm/amd: Fix detection of _PR3 on the PCIe root port
      drm/amd: Update `update_pcie_parameters` functions to use
uint8_t arguments
      drm/amd: Drop all hand-built MIN and MAX macros in the amdgpu base dr=
iver
      drm/amd: Fix UBSAN array-index-out-of-bounds for SMU7
      drm/radeon: Fix UBSAN array-index-out-of-bounds for Radeon HD 5430
      drm/amd: Fix UBSAN array-index-out-of-bounds for Polaris and Tonga
      drm/amd: Evict resources during PM ops prepare() callback
      drm/amd: Add concept of running prepare_suspend() sequence for IP blo=
cks
      drm/amd: Split up UVD suspend into prepare and suspend steps
      drm/amd/display: Catch errors from drm_atomic_helper_suspend()
      drm/amd/display: Destroy DC context while keeping DML and DML2
      drm/amd/display: make dc_set_power_state() return type `void` again
      drm/amd: Add missing kernel doc for prepare_suspend()
      drm/amd: Move microcode init step to early_init()
      drm/amd: Don't parse IMU ucode version if it won't be loaded
      drm/amd: Read IMU FW version from scratch register during hw_init
      drm/amd: Disable ASPM for VI w/ all Intel systems
      drm/amd: Disable PP_PCIE_DPM_MASK when dynamic speed switching
not supported
      drm/amd: Move AMD_IS_APU check for ASPM into top level function
      drm/amd: Explicitly disable ASPM when dynamic switching disabled

Mark Brown (9):
      drm/bridge: adv7511: Convert to use maple tree register cache
      drm/bridge: dpc3433: Convert to use maple tree register cache
      drm/bridge: tc358767: Convert to use maple tree register cache
      drm/bridge: icn6211: Convert to use maple tree register cache
      drm/bridge: lt9211: Convert to use maple tree register cache
      drm/bridge: sn65dsi83: Convert to use maple tree register cache
      drm/panel: ili9322: Remove redundant volatle_reg() operation
      drm/panel: ili9322: Convert to use maple tree register cache
      drm/rockchip: vop2: Convert to use maple tree register cache

Martin Leung (1):
      drm/amd/display: 3.2.249

Mathias Krause (2):
      drm/i915: Register engines early to avoid type confusion
      drm/i915: Clarify type evolution of uabi_node/uabi_engines

Matt Roper (24):
      drm/i915/dg2: Recognize pre-production hardware
      drm/i915/dg2: Drop pre-production display workarounds
      drm/i915/dg2: Drop pre-production GT workarounds
      drm/i915: Tidy workaround definitions
      drm/i915/dg2: Drop Wa_16011777198
      drm/i915/selftest: Simplify Y-major tiling in blit selftest
      drm/i915: Eliminate has_4tile feature flag
      drm/i915: Consolidate condition for Wa_22011802037
      drm/i915/xelpmp: Don't assume workarounds extend to future platforms
      drm/i915/xelpg: Call Xe_LPG workaround functions based on IP version
      drm/i915: Eliminate IS_MTL_GRAPHICS_STEP
      drm/i915: Eliminate IS_MTL_MEDIA_STEP
      drm/i915/mtl: Eliminate subplatforms
      drm/i915: Replace several IS_METEORLAKE with proper IP version checks
      drm/i915: Eliminate IS_MTL_DISPLAY_STEP
      drm/i915/display: Eliminate IS_METEORLAKE checks
      drm/i915/mtl: Drop Wa_14017240301
      drm/i915: Stop forcing clock gating init for future platforms
      drm/i915/adlp: Stop calling gen12lp_init_clock_gating()
      drm/i915/display: Extract display workarounds from clock gating init
      drm/i915/display: Apply workarounds during display init
      drm/i915/xe2lpd: FBC is now supported on all pipes
      drm/i915/xe2lpd: Don't try to program PLANE_AUX_DIST
      drm/i915/xe2lpd: Add DC state support

Matthew Wilcox (Oracle) (1):
      i915: Limit the length of an sg list to the requested length

Max Tseng (2):
      drm/amd/display: augment display clock in dc_cap structure
      drm/amd/display: Modify Vmin default value

Maxime Ripard (3):
      MAINTAINERS: Update gma500 git repo
      MAINTAINERS: Update drm-misc entry to match all drivers
      drm/doc: ci: Require more context for flaky tests

Melissa Wen (2):
      drm/amd/display: enable cursor degamma for DCN3+ DRM legacy gamma
      drm/amd/display: set stream gamut remap matrix to MPC for DCN3+

Michael Strauss (1):
      drm/amd/display: Disable SYMCLK32_SE RCO on DCN314

Michael Tretter (5):
      drm/bridge: samsung-dsim: reread ref clock before configuring PLL
      drm/bridge: samsung-dsim: update PLL reference clock
      drm/bridge: samsung-dsim: adjust porches by rounding up
      drm/bridge: samsung-dsim: calculate porches in Hz
      drm/rockchip: vop2: Demote message in mod_supported to drm_dbg_kms

Michel D=C3=A4nzer (3):
      drm/amd/display: Check all enabled planes in dm_check_crtc_cursor
      drm/amd/display: Refactor dm_get_plane_scale helper
      drm/amd/display: Bail from dm_check_crtc_cursor if no relevant change

Mika Kahola (1):
      drm/i915/lnl: Remove watchdog timers for PSR

Mikko Perttunen (5):
      gpu: host1x: Add locking in channel allocation
      gpu: host1x: Stop CDMA before suspending
      gpu: host1x: Enable system suspend callbacks
      gpu: host1x: Syncpoint interrupt sharding
      drm/tegra: Zero-initialize iosys_map

Miquel Raynal (1):
      dt-bindings: display: simple: Add Mitsubishi AA084XE01 panel

Moti Haimovski (1):
      accel/habanalabs/gaudi2: print power-mode changes

Mounika Adhuri (1):
      drm/amd/display: Refactor HWSS into component folder

Muhammad Ahmed (9):
      drm/amd/display: Fix MST recognizes connected displays as one
      drm/amd/display: disable clock gating logic
      drm/amd/display: Enable DCLK_DS from driver by default
      drm/amd/display: disable IPS
      drm/amd/display: Fix MST recognizes connected displays as one
      drm/amd/display: Expand DML to better support replay
      drm/amd/display: Enable DCN low mem power by default
      drm/amd/display: enable dsc_clk even if dsc_pg disabled
      drm/amd/display: Update dml ssb from pmfw clock table

Muhammad Ansari (1):
      drm/amd/display: VSIF v3 set Max Refresh Rate

Mukul Joshi (7):
      drm/amdkfd: Fix reg offset for setting CWSR grace period
      drm/amdkfd: Fix unaligned 64-bit doorbell warning
      drm/amdgpu: Store CU info from all XCCs for GFX v9.4.3
      drm/amdkfd: Update cache info reporting for GFX v9.4.3
      drm/amdkfd: Update CU masking for GFX 9.4.3
      drm/amdgpu: Rename KGD_MAX_QUEUES to AMDGPU_MAX_QUEUES
      drm/amdgpu: Fix typo in IP discovery parsing

Mustapha Ghaddar (3):
      drm/amd/display: Add DPIA Link Encoder Assignment Fix
      drm/amd/display: Fix 2nd DPIA encoder Assignment
      drm/amd/display: Add DPIA Link Encoder Assignment Fix for DCN35

Nathan Chancellor (3):
      drm/amd/display: Fix -Wuninitialized in
dm_helpers_dp_mst_send_payload_allocation()
      drm/debugfs: Fix drm_debugfs_remove_files() stub
      drm/amd/display: Respect CONFIG_FRAME_WARN=3D0 in DML2

Neil Armstrong (5):
      drm/msm/dpu: create a dpu_hw_clk_force_ctrl() helper
      drm/msm/dpu: add setup_clk_force_ctrl() op to sspp & wb
      drm/msm/dpu: move setup_force_clk_ctrl handling into plane and wb
      drm/msm/dpu: sm8550: remove unused VIG and DMA clock controls entries
      drm/msm/dpu: enable writeback on SM8550

Nemesa Garg (1):
      drm/i915/mtl: Adding DeviceID for Arrowlake-S under MTL

Nicholas Kazlauskas (3):
      drm/amd/display: Don't use fsleep for PSR exit waits
      drm/amd/display: Revert "Improve x86 and dmub ips handshake"
      drm/amd/display: Fix IPS handshake for idle optimizations

Nicholas Susanto (1):
      drm/amd/display: Fix DML calculation errors

Niko Tsirakis (1):
      drm/i915/display/lspcon: Increase LSPCON mode settle timeout

Nirmoy Das (12):
      drm/i915: Don't set PIPE_CONTROL_FLUSH_L3 for aux inval
      drm/i915: Introduce intel_gt_mcr_lock_sanitize()
      drm/i915: Introduce the intel_gt_resume_early()
      drm/i915: Clean steer semaphore on resume
      drm/i915/mtl: Skip MCR ops for ring fault register
      drm/i915: Create a kernel context for GGTT updates
      drm/i915: Implement for_each_sgt_daddr_next
      drm/i915: Parameterize binder context creation
      drm/i915: Implement GGTT update method with MI_UPDATE_GTT
      drm/i915: Toggle binder context ready status
      drm/i915: Enable GGTT updates with binder in MTL
      drm/i915: Prevent potential null-ptr-deref in engine_init_common

Oded Gabbay (14):
      accel/habanalabs: remove pdev check on idle check
      accel/habanalabs: reset device if scrubbing failed
      accel/habanalabs/gaudi2: fix missing check of kernel ctx
      accel/habanalabs: remove unused asic functions
      accel/habanalabs: minor cosmetics update to cpucp_if.h
      accel/habanalabs: minor cosmetics update to trace file
      accel/habanalabs: change Greco to Gaudi2
      accel/habanalabs/gaudi: remove unused structure definition
      accel/habanalabs: remove unused field
      accel/habanalabs: print device name when it is removed
      accel/habanalabs: remove leftover code
      accel/habanalabs/gaudi: remove define used for simulator
      accel/habanalabs: minor cosmetic update to habanalabs.h
      accel/habanalabs/gaudi2: fix spmu mask creation

Ofir Bitton (6):
      accel/habanalabs: notify user about undefined opcode event
      accel/habanalabs: stop fetching MME SBTE error cause
      accel/habanalabs: dump temperature threshold boot error
      accel/habanalabs/gaudi2: unsecure tpc count registers
      accel/habanalabs: add info ioctl for engine error reports
      accel/habanalabs/gaudi2: include block id in ECC error reporting

Ohad Sharabi (2):
      accel/habanalabs: add traces for dma mappings
      accel/habanalabs: trace dma map sgtable

Ondrej Jirman (1):
      drm/panel: st7703: Pick different reset sequence

Ovidiu Bunea (3):
      drm/amd/display: Roll back unit correction
      drm/amd/display: Use optc32 instead of optc30 in DC
      drm/amd/display: Make driver backwards-compatible with non-IPS PMFW

Paul Hsieh (1):
      drm/amd/display: support main link off before specific vertical line

Philip Yang (10):
      drm/amdkfd: Share the original BO for GTT mapping
      drm/amdkfd: Remove svm range validated_once flag
      drm/amdgpu: Increase IH soft ring size for GFX v9.4.3 dGPU
      drm/amdkfd: Don't use sw fault filter if retry cam enabled
      drm/amdkfd: Move dma unmapping after TLB flush
      drm/amdkfd: Handle errors from svm validate and map
      drm/amdgpu: ratelimited override pte flags messages
      drm/amdkfd: Fix EXT_COHERENT memory allocation crash
      Revert "drm/amdkfd:remove unused code"
      Revert "drm/amdkfd: Use partial migrations in GPU page faults"

Philipp Stanner (5):
      string.h: add array-wrappers for (v)memdup_user()
      kernel: kexec: copy user-array safely
      kernel: watch_queue: copy user-array safely
      drm_lease.c: copy user-array safely
      drm: vmwgfx_surface.c: copy user-array safely

Pranjal Ramajor Asha Kanojiya (9):
      accel/qaic: Register for PCI driver at the beginning of module init
      accel/qaic: Use devm_drm_dev_alloc() instead of drm_dev_alloc()
      accel/qaic: Remove ->size field from struct qaic_bo
      accel/qaic: Update BO metadata in a central location
      accel/qaic: Declare BO 'sliced' after all the operations are complete
      accel/qaic: Undo slicing setup done in qaic_attach_slicing_bo()
      accel/qaic: Clean up BO during flushing of transfer list
      accel/qaic: Create a function to initialize BO
      accel/qaic: Add QAIC_DETACH_SLICE_BO IOCTL

Prathap Kumar Valsan (1):
      drm/i915: Define and use GuC and CTB TLB invalidation routines

Prike Liang (8):
      drm/amdgpu: add new AMDGPU_FAMILY definition
      drm/amdgpu/soc21: add initial GC 11.5.0 soc21 support
      drm/amdgpu/discovery: enable soc21 support
      drm/amdgpu/discovery: add nbio 7.11.0 support
      drm/amdgpu/gmc11: initialize GMC for GC 11.5.0 memory support
      drm/amdgpu/gfx11: initialize gfx11.5.0
      drm/amdgpu/discovery: enable gfx11 for GC 11.5.0
      drm/amdgpu: enable gmc11 for GC 11.5.0

Qingqing Zhuo (38):
      drm/amd/display: Add dcn35 register header files
      drm/amd/display: Add DCN35 family information
      drm/amd/display: Update DCE for DCN35 support
      drm/amd/display: Update DCN10 for DCN35 support
      drm/amd/display: Update DCN20 for DCN35 support
      drm/amd/display: Update DCN30 for DCN35 support
      drm/amd/display: Update DCN31 for DCN35 support
      drm/amd/display: Update DCN314 for DCN35 support
      drm/amd/display: Update DCN32 for DCN35 support
      drm/amd/display: Update dc.h for DCN35 support
      drm/amd/display: Add DCN35 BIOS command table support
      drm/amd/display: Add DCN35 GPIO
      drm/amd/display: Add DCN35 DCCG
      drm/amd/display: Add DCN35 DIO
      drm/amd/display: Add DCN35 PG_CNTL
      drm/amd/display: Add DCN35 OPTC
      drm/amd/display: Add DCN35 OPP
      drm/amd/display: Add DCN35 DPP
      drm/amd/display: Add DCN35 DWB
      drm/amd/display: Add DCN35 HUBP
      drm/amd/display: Add DCN35 HUBBUB
      drm/amd/display: Add DCN35 MMHUBBUB
      drm/amd/display: Add DCN35 DSC
      drm/amd/display: Add DCN35 HWSEQ
      drm/amd/display: Add DCN35 CLK_MGR
      drm/amd/display: Add DCN35 IRQ
      drm/amd/display: Add DCN35 DMUB
      drm/amd/display: Add DCN35 init
      drm/amd/display: Add DCN35 Resource
      drm/amd/display: Add DCN35 DML
      drm/amd/display: Add DCN35 blocks to Makefile
      drm/amd/display: Add DCN35 CORE
      drm/amd/display: Add DCN35 DM Support
      drm/amd/display: Drop unused registers
      drm/amd/display: Add DCN35 case for dc_clk_mgr_create
      drm/amd/display: remove unused mmhub_reg_offsets
      drm/amd/display: Introduce DML2
      drm/amd/display: Add DCN35 DML2 support

Qu Huang (1):
      drm/amdgpu: Fix a null pointer access when the smc_rreg pointer is NU=
LL

Quentin Schulz (2):
      drm/panel: ltk050h3146w: add mipi_dsi_device.mode_flags to of_match_d=
ata
      dt-bindings: ltk050h3146w: add compatible for LTK050H3148W-CTA6 varia=
nt

Radhakrishna Sripada (1):
      drm/i915/mtl: Remove the 'force_probe' requirement for Meteor Lake

Rajneesh Bhardwaj (3):
      drm/amdgpu: Hide xcp partition sysfs under SRIOV
      drm/amdgpu: Rework KFD memory max limits
      drm/amdgpu: Use ttm_pages_limit to override vram reporting

Randy Dunlap (5):
      drm: bridge: for GENERIC_PHY_MIPI_DPHY also select GENERIC_PHY
      drm/amd/display: fix replay_mode kernel-doc warning
      drm/amdgpu: amdgpu_drm.h: fix comment typos
      drm/i915/uapi: fix doc typos
      iosys-map: fix kernel-doc typos

Ravi Kumar Vodapalli (1):
      drm/i915/xe2lpd: Add display power well

Reza Amini (1):
      drm/amd/display: Correct unit conversion for vstartup

Rob Clark (2):
      drm/ci: Enable CONFIG_BACKLIGHT_CLASS_DEVICE
      drm/amdgpu: Remove duplicate fdinfo fields

Rob Herring (2):
      dt-bindings: display: msm: Add missing unevaluatedProperties on
child node schemas
      dt-bindings: display: msm: Make "additionalProperties: true" explicit

Rodrigo Siqueira (13):
      drm/amd/display: Drop unused link FPGA code
      drm/amd/display: Improve code style on bios_parser2
      drm/amd/display: Move dce_calcs from DML folder
      drm/amd/display: Move custom_float from DML folder
      drm/amd/display: Move bw_fixed from DML folder
      drm/amd/display: Move dml code under CONFIG_DRM_AMD_DC_FP guard
      drm/amd/display: Reduce stack size by splitting function
      drm/amd/display: Fix stack size issue on DML2
      drm/amd/display: Set the DML2 attribute to false in all DCNs
older than version 3.5
      drm/amd/display: Fix DMUB errors introduced by DML2
      drm/amd/display: Correct enum typo
      drm/amd/display: Add prefix to amdgpu crtc functions
      drm/amd/display: Add prefix for plane functions

Rodrigo Vivi (7):
      drm/doc/rfc: No STAGING out of drivers/staging.
      drm/doc/rfc: Mark Dev_coredump as completed.
      drm/doc/rfc: Mark DRM_VM_BIND as complete.
      drm/doc/rfc: Mark GPU VA as complete.
      drm/i915: Abstract display info away during probe
      drm/i915: Add missing CCS documentation
      drm/i915: Add missing GSCCS documentation

Roman Li (1):
      drm/amd/display: Enable replay for dcn35

Ruan Jinjie (2):
      drm/panfrost: Do not check for 0 return after calling
platform_get_irq_byname()
      drm/msm: Remove unnecessary NULL values

Saaem Rizvi (1):
      drm/amd/display: Modify Pipe Selection for Policy for ODM

Saleemkhan Jamadar (9):
      drm/amdgpu: add vcn 4_0_5 header files
      drm/amdgpu: add VCN4 ip block support
      drm/amdgpu/jpeg: add jpeg support for VCN4_0_5
      drm/amdgpu: add VCN_4_0_5 firmware support
      drm/amdgpu:enable CG and PG flags for VCN
      drm/amdgpu/soc21: Add video cap query support for VCN_4_0_5
      drm/amdgpu/discovery: add VCN 4.0.5 Support
      drm/amdgpu: enable PG flags for VCN
      drm/amdgpu/jpeg: initialize number of jpeg ring

Samir Dhume (1):
      drm/amdgpu/jpeg - skip change of power-gating state for sriov

Samson Tam (5):
      drm/amd/display: add check for PMFW hard min request complete
      drm/amd/display: ensure FS is enabled before sending request to
DMUB for FS changes
      drm/amd/display: apply edge-case DISPCLK WDIVIDER changes to
master OTG pipes only
      drm/amd/display: fix num_ways overflow error
      drm/amd/display: add null check for invalid opps

Sathishkumar S (2):
      drm/amdgpu: update IP count INFO query
      drm/amdgpu: fix ip count query for xcp partitions

Sebastian Andrzej Siewior (5):
      drm/amd/display: Remove migrate_en/dis from dc_fpu_begin().
      drm/amd/display: Simplify the per-CPU usage.
      drm/amd/display: Add a warning if the FPU is used outside from
task context.
      drm/amd/display: Move the memory allocation out of
dcn21_validate_bandwidth_fp().
      drm/amd/display: Move the memory allocation out of
dcn20_validate_bandwidth_fp().

Shekhar Chauhan (4):
      drm/i915/dg2: Remove Wa_15010599737
      drm/i915: Add Wa_14015150844
      drm/i915: Add Wa_18028616096
      drm/i915: Add new DG2 PCI IDs

Sherry Wang (1):
      drm/amd/display: refactor ILR to make it work

Shiwu Zhang (3):
      drm/amdgpu: update the xgmi ta interface header
      drm/amdgpu: prepare the output buffer for GET_PEER_LINKS command
      drm/amdgpu: support the port num info based on the capability flag

Shuijing Li (8):
      dt-bindings: display: mediatek: dsi: Add compatible for MediaTek MT81=
88
      drm/mediatek: dsi: Add dsi cmdq_ctl to send panel initial code
      drm/mediatek: Add mt8188 dsi compatible to mtk_dsi.c
      dt-bindings: display: mediatek: dp: Add compatible for MediaTek MT818=
8
      drm/mediatek: dp: Add the audio packet flag to mtk_dp_data struct
      drm/mediatek: dp: Add the audio divider to mtk_dp_data struct
      drm/mediatek: dp: Add support MT8188 dp/edp function
      drm/mediatek: dsi: Add mode_valid callback to DSI bridge

Simon Ser (2):
      drm/doc: use cross-references for macros
      drm/doc: document DRM_IOCTL_MODE_CREATE_DUMB

Sridevi Arvindekar (1):
      drm/amd/display: dc cleanup for tests

Srinivasan Shanmugam (17):
      drm/amd/display: Fix unnecessary conversion to bool in
'amdgpu_dm_setup_replay'
      drm/radeon: Cleanup radeon/radeon_fence.c
      drm/amd/display: Fix useless else if in display_mode_vba_util_32.c
      drm/amdgpu: Fix kcalloc over kzalloc in 'gmc_v9_0_init_mem_ranges'
      drm/amd/pm: Fixes incorrect type in
'amdgpu_hwmon_show_power_avg() & _input()'
      drm/amd/display: Fix up kdoc format for 'dc_set_edp_power'
      drm/radeon: Remove the references of radeon_gem_ pread & pwrite ioctl=
s
      drm/amd/display: Adjust kdoc for 'optc35_set_odm_combine'
      drm/amdgpu: Use READ_ONCE() when reading the values in
'sdma_v4_4_2_ring_get_rptr'
      drm/amdgpu: Fix printk_ratelimit() with DRM_ERROR_RATELIMITED in
'amdgpu_cs_ioctl'
      drm/amdgpu: Declare array with strings as pointers constant
      drm/amdgpu: Use min_t to replace min
      drm/amd/display: Address 'srf_updates' not described in
'could_mpcc_tree_change_for_active_pipes'
      drm/amdgpu: Fix complex macros error
      drm/amdgpu: Drop unnecessary return statements
      drm/amdgpu: Address member 'gart_placement' not described in
'amdgpu_gmc_gart_location'
      drm/amdkfd: Address 'remap_list' not described in 'svm_range_add'

Stanislav Lisovskiy (3):
      drm/i915/xe2lpd: Treat cursor plane as regular plane for DDB allocati=
on
      drm/i915/lnl: Add CDCLK table
      drm/i915/lnl: Start using CDCLK through PLL

Stanislaw Gruszka (10):
      accel/ivpu: Document DRM_IVPU_PARAM_CAPABILITIES
      accel/ivpu: Make ivpu_pm_init() void
      accel/ivpu: Add information about context on failure
      accel/ivpu/37xx: Change register rename leftovers
      accel/ivpu/37xx: White space cleanup
      accel/ivpu: Print information about used workarounds
      accel/ivpu: Update debugfs to latest changes in DRM
      accel/ivpu: Compile ivpu_debugfs.c conditionally
      accel/ivpu: Do not initialize parameters on power up
      accel/ivpu/37xx: Remove support for FPGA and simics

Stanley.Yang (6):
      drm/amdgpu: Fix false positive error log
      drm/amdgpu: Fix potential null pointer derefernce
      drm/amdgpu: Workaround to skip kiq ring test during ras gpu recovery
      drm/amdgpu: Enable mca debug mode mode when ras enabled
      drm/amdgpu: Fix delete nodes that have been relesed
      drm/amdgpu: Enable RAS feature by default for APU

Stephen Boyd (9):
      drm/msm/dp: Replace open-coded drm_dp_read_dpcd_caps()
      drm/msm/dp: Use drm_dp_read_sink_count() helper
      drm/msm/dp: Remove dead code related to downstream cap info
      drm/msm/dp: Remove aux_cfg_update_done and related code
      drm/msm/dp: Simplify with drm_dp_{max_link_rate, max_lane_count}()
      drm/msm/dp: Inline dp_link_parse_sink_count()
      drm/msm/dp: Remove dp_display_is_ds_bridge()
      drm/msm/dp: Inline dp_display_is_sink_count_zero()
      drm/msm/dp: Remove error message when downstream port not connected

Stylon Wang (7):
      drm/amd/display: Remove unused DPCD declarations
      drm/amd/display: Disable virtual links
      drm/amd/display: Add missing lines of code in dc.c
      drm/amd/display: Remove brackets in macro to conform to coding style
      drm/amd/display: Add missing copyright notice in DMUB
      drm/amd/display: Fix copyright notice in DML2 code
      drm/amd/display: Fix copyright notice in DC code

Sui Jingfeng (2):
      drm/gma500: Fix call trace when psb_gem_mm_init() fails
      drm/tegra: Remove surplus else after return

Sung Joon Kim (10):
      drm/amd/display: Add pointer check before function call
      drm/amd/display: Add IPS control flag
      drm/amd/display: Add a check for idle power optimization
      drm/amd/display: Handle multiple streams sourcing same surface
      drm/amd/display: Use fixed DET Buffer Size
      drm/amd/display: Fix Chroma Surface height/width initialization
      drm/amd/display: Modify SMU message logs
      drm/amd/display: Revert "drm/amd/display: Add a check for idle
power optimization"
      drm/amd/display: Add a check for idle power optimization
      drm/amd/display: Fix HDMI framepack 3D test issue

Sung-huai Wang (1):
      drm/amd/display: fix static screen detection setting for DCN35

SungHuai Wang (1):
      drm/amd/display: fix static screen detection setting

Suraj Kandpal (22):
      drm/i915/vdsc: Fix first_line_bpg_offset calculation
      drm/i915/hdcp: Use intel_connector argument in intel_hdcp_shim
      drm/i915/hdcp: Propagate aux info in DP HDCP functions
      drm/i915/hdcp: Send the correct aux for DPMST HDCP scenario
      drm/i915/hdcp: Adjust timeout for read in DPMST Scenario
      drm/i915/hdcp: Use intel_connector as argument for hdcp_2_2_capable
      drm/i915/hdcp: Use correct aux for capability check scenario
      drm/i915/vdsc: Refactor dsc register field macro
      drm/i915/vdsc: Add a check for dsc split cases
      drm/i915/vdsc: Add func to get no. of vdsc instances per pipe
      drm/i915/vdsc: Add function to read any PPS register
      drm/i915/vdsc: Add function to write in PPS register
      drm/i915/vdsc: Remove unused dsc registers
      drm/i915/vdsc: Fill the intel_dsc_get_pps_config function
      drm/i915/display: Compare the readout dsc pps params
      drm/i915/dsc: Fix pic_width readout
      drm/i915/ddi: Remove redundant intel_connector NULL check
      drm/i915/display: Free crtc_state in verify_crtc_state
      drm/i915/display: Use intel_crtc_destroy_state instead kfree
      drm/i915/display: Use correct method to free crtc_state
      drm/i915/hdcp: Move checks for gsc health status
      drm/i915/hdcp: Move common message filling function to its own file

Swapnil Patel (2):
      drm/amd/display: Don't check registers, if using AUX BL control
      drm/amd/display: Reduce default backlight min from 5 nits to 1 nits

Swarup Laxman Kotiaklapudi (1):
      gpu: drm: amd: display: fix kernel-doc warnings

Swati Sharma (1):
      drm/i915/dg2: Add support for new DG2-G12 revid 0x1

Taimur Hassan (3):
      drm/amd/display: Add reset for SYMCLKC_FE_SRC_SEL
      drm/amd/display: Split pipe for stereo timings
      drm/amd/display: Move stereo timing check to helper

Tao Zhou (17):
      drm/amdgpu: use read-modify-write mode for gfx v9_4_3 SQ setting
      drm/amdgpu: add address conversion for UMC v12
      drm/amdgpu: add channel index table for UMC v12
      drm/amdgpu: print more address info of UMC bad page
      drm/amdgpu: print channel index for UMC bad page
      drm/amdgpu: fix value of some UMC parameters for UMC v12
      drm/amdgpu: change if condition for bad channel bitmap update
      drm/amdgpu: exit directly if gpu reset fails
      drm/amdgpu: update retry times for psp vmbx wait
      drm/amdgpu: define ras_reset_error_count function
      drm/amdgpu: replace reset_error_count with amdgpu_ras_reset_error_cou=
nt
      drm/amdgpu: add set/get mca debug mode operations
      drm/amdgpu: drop status query/reset for GCEA 9.4.3 and MMEA 1.8
      drm/amd/pm: record mca debug mode in RAS
      drm/amdgpu: enable RAS poison mode for APU
      drm/amdgpu: bypass RAS error reset in some conditions
      drm/amdgpu: get RAS poison status from DF v4_6_2

Tejas Upadhyay (1):
      drm/i915/mtl: Update workaround 14016712196

Thierry Reding (3):
      drm/tegra: rgb: Parameterize V- and H-sync polarities
      drm/tegra: gem: Do not return NULL in tegra_bo_mmap()
      drm/simpledrm: Fix power domain device link validity check

Thomas Hellstr=C3=B6m (2):
      Documentation/gpu: Add a VM_BIND async document
      drm/gpuvm: Dual-licence the drm_gpuvm code GPL-2.0 OR MIT

Thomas Weber (1):
      drm/panel: simple: Add support for Mitsubishi AA084XE01

Thomas Zimmermann (88):
      fbdev/sbus: Build sbuslib.o if CONFIG_FB_SBUS has been selected
      fbdev/sbus: Forward declare all necessary structures in header
      fbdev/sbus: Add initializer macros and Kconfig tokens for SBUS suppor=
t
      fbdev/bw2: Use initializer macro for struct fb_ops
      fbdev/cg14: Use initializer macro for struct fb_ops
      fbdev/cg3: Use initializer macro for struct fb_ops
      fbdev/cg6: Use initializer macro for struct fb_ops
      fbdev/ffb: Use initializer macro for struct fb_ops
      fbdev/leo: Use initializer macro for struct fb_ops
      fbdev/p9100: Use initializer macro for struct fb_ops
      fbdev/tcx: Use initializer macro for struct fb_ops
      fbdev/smscufx: Use fb_ops helpers for deferred I/O
      fbdev/udlfb: Use fb_ops helpers for deferred I/O
      fbdev: Add Kconfig macro FB_IOMEM_HELPERS_DEFERRED
      fbdev/hyperv_fb: Use fb_ops helpers for deferred I/O
      hid: Remove trailing whitespace
      hid/picolcd: Use fb_ops helpers for deferred I/O
      staging/fbtft: Initialize fb_op struct as static const
      staging/fbtft: Use fb_ops helpers for deferred I/O
      fbdev/au1200fb: Do not display boot-up logo
      fbdev/mmp/mmpfb: Do not display boot-up logo
      fbdev/core: Fix style of code for boot-up logo
      fbdev/core: Unexport logo helpers
      fbdev/core: Move logo functions into separate source file
      fbdev/core: Remove empty internal helpers from fb_logo.c
      fbdev/core: Clean up include statements in fbmem.c
      Merge drm/drm-next into drm-misc-next
      fbdev: Avoid file argument in fb_pgprotect()
      fbdev: Replace fb_pgprotect() with pgprot_framebuffer()
      drm/ssd130x: Fix atomic_check for disabled planes
      fbdev: Provide I/O-memory helpers as module
      fbdev/68328fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/amba-clcd: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/amifb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/arkfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/atafb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/atyfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/au1100fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/cirrusfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/cobalt-lcd: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/controlfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/cyber2000fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/dnfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/ep93xx-fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/gbefb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/hgafb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/hitfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/hpfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/i810fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/imsttfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/intelfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/matroxfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/neofb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/nvidiafb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/omapfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/pm2fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/pm3fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/pvr2fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/radeon: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/rivafb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/s1d13xxxfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/s3fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/sa1100fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/savagefb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/sisfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/sm501fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/sm712fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/stifb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/sunxvr500: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/tdfxfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/tgafb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/tridentfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/vermilionfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/vga16fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/viafb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/vt8623fb: Initialize fb_ops to fbdev I/O-memory helpers
      drm/ast: Rename AST_IO_AR_PORT_WRITE to AST_IO_VGAARI_W
      drm/ast: Rename AST_IO_MISC_PORT_WRITE to AST_IO_VGAMR_W
      drm/ast: Rename AST_IO_VGA_ENABLE_PORT to AST_IO_VGAER
      drm/ast: Rename AST_IO_SEQ_PORT to AST_IO_VGASRI
      drm/ast: Rename AST_IO_DAC_INDEX_READ to AST_IO_VGADRR
      drm/ast: Rename AST_IO_DAC_INDEX_WRITE to AST_IO_VGADWR
      drm/ast: Rename AST_IO_DAC_DATA to AST_IO_VGAPDR
      drm/ast: Rename AST_IO_GR_PORT to AST_IO_VGAGRI
      drm/ast: Rename AST_IO_CRTC_PORT to AST_IO_VGACRI
      drm/ast: Rename AST_IO_INPUT_STATUS1_READ to AST_IO_VGAIR1_R
      drm/ast: Rename AST_IO_MISC_PORT_READ to AST_IO_VGAMR_R
      drm/ast: Move register constants to ast_reg.h

Tim Huang (1):
      drm/amd/pm: wait for completion of the EnableGfxImu command

Timmy Tsai (1):
      drm/amd: Add HDP flush during jpeg init

Tomer Tayar (19):
      accel/habanalabs: prevent immediate hard reset due to 2 adjacent
H/W events
      accel/habanalabs: update pending reset flags with new reset requests
      accel/habanalabs: print task name and request code upon ioctl failure
      accel/habanalabs: print task name upon creation of a user context
      accel/habanalabs/gaudi2: un-secure register for engine cores interrup=
t
      accel/habanalabs: set default device release watchdog T/O as 30 sec
      accel/habanalabs: register compute device as an accel device
      accel/habanalabs: update sysfs-driver-habanalabs with the accel path
      accel/habanalabs: update debugfs-driver-habanalabs with the accel pat=
h
      accel/habanalabs: Move ioctls to the device specific ioctls range
      accel/habanalabs: always pass exported size to
alloc_sgt_from_device_pages()
      accel/habanalabs: use exported size from dma_buf and not from phys_pg=
_pack
      accel/habanalabs: export dma-buf only if size/offset multiples
of PAGE_SIZE
      accel/habanalabs: tiny refactor of hl_map_dmabuf()
      accel/habanalabs: fix SG table creation for dma-buf mapping
      accel/habanalabs: set hl_dmabuf_priv.device_address only when needed
      accel/habanalabs: add missing offset handling for dma-buf
      accel/habanalabs: add debug prints to dump content of SG table for dm=
a-buf
      accel/habanalabs/gaudi2: perform hard-reset upon PCIe AXI drain event

Tomi Valkeinen (15):
      drm/bridge: lt8912b: Fix bridge_detach
      drm/bridge: lt8912b: Fix crash on bridge detach
      drm/bridge: lt8912b: Manually disable HPD only if it was enabled
      drm/bridge: lt8912b: Add missing drm_bridge_attach call
      drm/bridge: tc358768: Fix use of uninitialized variable
      drm/bridge: tc358768: Default to positive h/v syncs
      drm/bridge: tc358768: Fix bit updates
      drm/bridge: tc358768: Cleanup PLL calculations
      drm/bridge: tc358768: Use struct videomode
      drm/bridge: tc358768: Print logical values, not raw register values
      drm/bridge: tc358768: Use dev for dbg prints, not priv->dev
      drm/bridge: tc358768: Rename dsibclk to hsbyteclk
      drm/bridge: tc358768: Clean up clock period code
      drm/bridge: tc358768: Fix tc358768_ns_to_cnt()
      drm/bridge: tc358768: Attempt to fix DSI horizontal timings

Tvrtko Ursulin (4):
      drm/i915: Run relevant bits of debugfs drop_caches per GT
      drm: Update file owner during use
      drm/i915: Zap some empty lines
      drm/i915: Do not disable preemption for resets

Uma Shankar (1):
      drm/i915/display: Created exclusive version of vga decode setup

Umesh Nerlige Ramappa (3):
      i915/pmu: Move execlist stats initialization to execlist specific set=
up
      i915/guc: Get runtime pm in busyness worker only if already active
      drm/i915/perf: Determine context valid in OA reports

Umio Yasuno (1):
      drm/amdgpu: Remove unused variables from amdgpu_show_fdinfo

Uros Bizjak (1):
      drm/i915/pmu: Use local64_try_cmpxchg in i915_pmu_event_read

Uwe Kleine-K=C3=B6nig (8):
      drm/imx/ipuv3: Convert to platform remove callback returning void
      drm/ingenic: Convert to platform remove callback returning void
      drm/mediatek: Convert to platform remove callback returning void
      drm/mediatek: Convert to platform remove callback returning void
      drm/msm: Convert to platform remove callback returning void
      drm/shmobile: Convert to platform remove callback returning void
      drm/ssd130x: Print the PWM's label instead of its number
      drm: exynos: dsi: Convert to platform remove callback returning void

Victor Zhao (1):
      drm/amd/pm: Disallow managing power profiles on SRIOV for gc11.0.3

Vignesh Chander (1):
      drm/amdgpu/jpeg: skip set pg for sriov

Ville Syrj=C3=A4l=C3=A4 (98):
      drm/i915/sdvo: Issue SetTargetOutput prior to GetAttachedDisplays
      drm/i915/sdvo: Protect macro args
      drm/i915/sdvo: s/sdvo_inputs_mask/sdvo_num_inputs/
      drm/i915: Don't warn about zero N/P in *_calc_dpll_params()
      drm/i915: Fully populate crtc_state->dpll
      drm/i915/sdvo: Pick the TV dotclock from adjusted_mode
      drm/i915/sdvo: Fail gracefully if the TV dotclock is out of range
      drm/i915/sdvo: Nuke attached_output tracking
      drm/i915/sdvo: Initialize the encoder earlier
      drm/i915/sdvo: Nuke the duplicate sdvo->port
      drm/i915/sdvo: Get rid of the per-connector i2c symlink
      drm/i915/sdvo: Rework DDC bus handling
      drm/i915/sdvo: Print out the i2c pin and slave address
      drm/i915: Constify LUT entries in checker
      drm/i915/dsb: Dump the DSB command buffer when DSB fails
      drm/i915/dsb: Avoid corrupting the first register write
      drm/i915/dsb: Don't use indexed writes when byte enables are not all =
set
      drm/i915: Only check eDP HPD when AUX CH is shared
      drm/i915/mst: Read out FEC state
      drm/i915: Fix FEC pipe A vs. DDI A mixup
      drm/i915: Fix FEC state dump
      drm/i915: Split some long lines in hsw_fdi_link_train()
      drm/i915: Stop spamming the logs with PLL state
      drm/i915: Reduce combo PHY log spam
      drm/i915: Introduce crtc_state->enhanced_framing
      drm: Reorder drm_sysfs_connector_remove() vs.
drm_debugfs_connector_remove()
      drm/sysfs: Register "ddc" symlink later
      drm/i915: Call the DDC bus i2c adapter "ddc"
      drm/i915/lvds: Populate connector->ddc
      drm/i915/crt: Populate connector->ddc
      drm/i915/dvo: Populate connector->ddc
      drm/i915/dp: Populate connector->ddc
      drm/i915/mst: Populate connector->ddc
      drm/i915/hdmi: Use connector->ddc everwhere
      drm/i915/hdmi: Nuke hdmi->ddc_bus
      drm/i915/hdmi: Remove old i2c symlink
      drm/i915/sdvo: Constify mapping structs
      drm/i915: Move psr unlock out from the pipe update critical section
      drm/i915: Change intel_pipe_update_{start,end}() calling convention
      drm/i915: Extract intel_crtc_vblank_evade_scanlines()
      drm/i915: Enable VRR later during fastsets
      drm/i915: Adjust seamless_m_n flag behaviour
      drm/i915: Optimize out redundant M/N updates
      drm/i915: Relocate is_in_vrr_range()
      drm/i915: Validate that the timings are within the VRR range
      drm/i915: Disable VRR during seamless M/N changes
      drm/i915: Update VRR parameters in fastset
      drm/i915: Assert that VRR is off during vblank evasion if necessary
      drm/i915: Implement transcoder LRR for TGL+
      Revert "drm/i915/mst: Populate connector->ddc"
      drm/edid: Fixup h/vsync_end instead of h/vtotal
      drm/i915/bios: Fixup h/vsync_end instead of h/vtotal
      drm/i915/dsb: Use non-locked register access
      drm/i915/dsb: Define more DSB bits
      drm/i915/dsb: Define the contents of some intstructions bit better
      drm/i915/dsb: Introduce intel_dsb_noop()
      drm/i915/dsb: Introduce intel_dsb_reg_write_masked()
      drm/i915/dsb: Add support for non-posted DSB registers writes
      drm/i915/dsb: Don't use DSB to load the LUTs during full modeset
      drm/i915/dsb: Load LUTs using the DSB during vblank
      drm/i915/dsb: Use non-posted register writes for legacy LUT
      drm/i915/dsb: Evade transcoder undelayed vblank when using DSB
      drm/i915: Introduce skl_watermark_max_latency()
      drm/i915: Introduce intel_crtc_scanline_to_hw()
      drm/i915/dsb: Use DEwake to combat PkgC latency
      drm/vblank: Warn when silently cancelling vblank works
      drm/i915: Stop requiring PLL index =3D=3D PLL ID
      drm/i915: Decouple I915_NUM_PLLS from PLL IDs
      drm/i915: Introduce for_each_shared_dpll()
      drm/i915: s/dev_priv/i915/ in the shared_dpll code
      drm/i915/fbc: Remove ancient 16k plane stride limit
      drm/i915/fbc: Split plane stride checks per-platform
      drm/i915/fbc: Split plane tiling checks per-platform
      drm/i915/fbc: Split plane rotation checks per-platform
      drm/i915/fbc: Split plane pixel format checks per-platform
      drm/i915/fbc: Remove pointless "stride is multiple of 64 bytes" check
      drm/i915/psr: Unify PSR pre/post plane update hooks
      drm/i915: Stop clobbering old crtc state during state check
      drm/i915: Constify the crtc states in the DPLL checker
      drm/i915: Simplify DPLL state checker calling convention
      drm/i915: Constify watermark state checker
      drm/i915: Simplify watermark state checker calling convention
      drm/i915: Constify the snps/c10x PLL state checkers
      drm/i915: Simplify snps/c10x DPLL state checker calling convetion
      drm/i915: Constify remainder of the state checker
      drm/i915: Simplify the state checker calling convetions
      drm/i915: s/pipe_config/crtc_state/ in the state checker
      drm/i915: s/dev_priv/i915/ in the state checker
      drm/i915: Fix VLV color state readout
      drm/i915/dsb: Allocate command buffer from local memory
      drm/i915/dsb: Correct DSB command buffer cache coherency settings
      drm/i915/dsb: Re-instate DSB for LUT updates
      drm/i915: Retry gtt fault when out of fence registers
      drm/i915/display: Clean up zero initializers
      drm/i915/hdcp: Clean up zero initializers
      drm/i915/pci: Clean up zero initializers
      drm/i915/guc: Clean up zero initializers
      drm/i915/pxp: Clean up zero initializers

Vinay Belgaumkar (1):
      drm/i915/mtl: Don't set PIPE_CONTROL_FLUSH_L3

Vinod Govindapillai (9):
      drm/i915/display: remove redundant parameter from sdp split update
      drm/i915/display: combine DP audio compute config steps
      drm/i915/display: update intel_dp_has_audio to support MST
      drm/i915/display: configure SDP split for DP-MST
      drm/i915/lnl: possibility to enable FBC on first three planes
      drm/i915/lnl: update the supported plane formats with FBC
      drm/i915/xe2lpd: display capability register definitions
      drm/i915/xe2lpd: update the dsc feature capability
      drm/i915/xe2lpd: update the scaler feature capability

Wayne Lin (5):
      drm/mst: delete unnecessary case in drm_dp_add_payload_part2()
      drm/mst: Refactor the flow for payload allocation/removement
      drm/amd/display: Adjust the MST resume flow
      drm/amd/display: fix problems in power_helper
      drm/amd/display: Fix mst hub unplug warning

Wenjing Liu (32):
      Partially revert "drm/amd/display: update add plane to context
logic with a new algorithm"
      drm/amd/display: update blank state on ODM changes
      drm/amd/display: add comments to add plane functions
      drm/amd/display: rename function to add otg master for stream
      drm/amd/display: add new resource interface for acquiring sec
opp heads and release pipe
      drm/amd/display: add new resource interfaces to update odm mpc slice =
count
      drm/amd/display: add more pipe resource interfaces
      drm/amd/display: use new pipe allocation interface in dcn32 fpu
      drm/amd/display: switch to new ODM policy for windowed MPO ODM suppor=
t
      drm/amd/display: add pipe topology update log
      drm/amd/display: fix pipe topology logging error
      drm/amd/display: always switch off ODM before committing more streams
      drm/amd/display: do not block ODM + OPM on one side of the screen
      drm/amd/display: remove a function that does complex calculation
in every frame but not used
      drm/amd/display: do not attempt ODM power optimization if
minimal transition doesn't exist
      drm/amd/display: only allow ODM power optimization if surface is
within guaranteed viewport size
      drm/amd/display: add seamless pipe topology transition check
      drm/amd/display: move odm power optimization decision after
subvp optimization
      drm/amd/display: do not skip ODM minimal transition based on new stat=
e
      drm/amd/display: minior logging improvements
      drm/amd/display: Update pipe resource interfaces for DCN35
      drm/amd/display: determine fast update only before commit
minimal transition state
      drm/amd/display: reset stream slice count for new ODM policy
      drm/amd/display: add new windowed mpo odm minimal transition sequence
      drm/amd/display: remove guaranteed viewports limitation for odm
      drm/amd/display: add missing function pointer for DCN321 resource
      drm/amd/display: add get primary dpp pipe resource interface
      drm/amd/display: add primary pipe check when building slice
table for dcn3x
      drm/amd/display: fix incorrect odm change detection logic
      drm/amd/display: use full update for clip size increase of large
plane source
      drm/amd/display: add pipe resource management callbacks to DML2
      drm/amd/display: implement map dc pipe with callback in DML2

William Tseng (1):
      drm/i915/dsi: let HW maintain CLK_POST

Xiaogang Chen (5):
      drm/amdkfd: Separate dma unmap and free of dma address array operatio=
ns
      drm/amdkfd: fix some race conditions in vram buffer alloc/free of svm=
 code
      drm/amdkfd: Fix a race condition of vram buffer unref in svm code
      drm/amdkfd: Use partial migrations in GPU page faults
      drm/amdgpu: Correctly use bo_va->ref_count in compute VMs

Xin Ji (1):
      drm/bridge: Add 200ms delay to wait FW HPD status stable

Yang Li (14):
      drm/amd/display: Remove duplicated include in dcn35_resource.c
      drm/amd/display: Remove duplicated include in dcn35_optc.c
      drm/amd/display: Remove duplicated include in dcn35_hwseq.c
      drm/amd/display: Remove duplicated include in dcn35_clk_mgr.c
      drm/amd/display: clean up one inconsistent indenting
      drm/amd/display: clean up one inconsistent indenting
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up one inconsistent indenting
      drm/rockchip: dsi: Use devm_platform_get_and_ioremap_resource()
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: Remove duplicated include in dce110_hwseq.c
      drm/amd/display: Remove unneeded semicolon
      drm/amd/display: Simplify bool conversion

Yang Wang (16):
      drm/amd/pm: update smu_v13_0_6 smu header
      drm/amd/pm: enable smu_v13_0_6 mca debug mode when UMC RAS
feature is enabled
      drm/amdgpu: add amdgpu smu mca dump feature support
      drm/amdgpu: add amdgpu mca debug sysfs support
      drm/amd/pm: update smu_v13_0_6 ppsmc header
      drm/amd/pm: add smu_13_0_6 mca dump support
      drm/amdgpu: enable FRU device for SMU v13.0.6
      drm/amdgpu: make err_data structure built-in for ras_manager
      drm/amdgpu: add ras_err_info to identify RAS error source
      drm/amdgpu: add RAS error info support for sdma_v4_4_2.
      drm/amdgpu: add RAS error info support for gfx_v9_4_3
      drm/amdgpu: add RAS error info support for mmhub_v1_8
      drm/amdgpu: add RAS error info support for umc_v12_0
      drm/amdgpu: fix typo for amdgpu ras error data print
      drm/amdgpu: fix find ras error node error
      drm/amdgpu: refine ras error kernel log print

YiPeng Chai (1):
      drm/amdgpu: Enable ras for mp0 v13_0_6 sriov

Yifan Zhang (10):
      drm/amdgpu: remove unused parameter in amdgpu_vmid_grab_idle
      drm/amd/pm: only poweron/off vcn/jpeg when they are valid.
      drm/amdgpu: calling address translation functions to simplify codes
      drm/amd/display: fix the white screen issue when >=3D 64GB DRAM
      drm/amdgpu: add type conversion for gc info
      drm/amd/display: enable S/G display for for recent APUs by default
      drm/amdgpu: add hub->ctx_distance in setup_vmid_config
      drm/amd/pm: drop most smu_cmn_get_smc_version in smu
      drm/amdgpu: flush the correct vmid tlb for specific pasid
      drm/amd/pm: call smu_cmn_get_smc_version in is_mode1_reset_supported.

YuBiao Wang (1):
      drm/amdkfd: Use gpu_offset for user queue's wptr

Yue Haibing (3):
      drm/gma500: Remove unused declarations
      drm/virtio: Remove unused function declarations
      drm/tegra: Remove two unused function declarations

ZhenGuo Yin (1):
      drm/amdgpu: access RLC_SPM_MC_CNTL through MMIO in SRIOV runtime

Zhu Wang (1):
      drm/rockchip: remove redundant of_match_ptr

baozhu.liu (2):
      drm/komeda: drop all currently held locks if deadlock happens
      drm/komeda: add NV12 format to support writeback layer type

benl (3):
      drm/amdgpu: add nbio 7.11 registers
      drm/amdgpu: add nbio 7.11 support
      drm/amdgpu: add gfxhub 11.5.0 support

farah kassabri (10):
      accel/habanalabs: fix standalone preboot descriptor request
      accel/habanalabs: Allow single timestamp registration request at a ti=
me
      accel/habanalabs: fix wait_for_interrupt abortion flow
      accel/habanalabs/gaudi2: handle eq health heartbeat check
      accel/habanalabs/gaudi2: add eq health check using irq
      accel/habanalabs: prevent sending heartbeat before events are enabled
      accel/habanalabs: fix bug in timestamp interrupt handling
      accel/habanalabs: optimize timestamp registration handler
      accel/habanalabs: split user interrupts pending list
      accel/habanalabs: fix bug in decoder wait for cs completion

 .../ABI/testing/debugfs-driver-habanalabs          |    82 +-
 Documentation/ABI/testing/sysfs-driver-habanalabs  |    64 +-
 Documentation/accel/qaic/qaic.rst                  |    10 +
 .../bindings/display/bridge/analogix,anx7814.yaml  |     1 +
 .../display/bridge/fsl,imx93-mipi-dsi.yaml         |   115 +
 .../bindings/display/lvds-data-mapping.yaml        |    84 +
 .../devicetree/bindings/display/lvds.yaml          |    77 +-
 .../bindings/display/mediatek/mediatek,dp.yaml     |     2 +
 .../bindings/display/mediatek/mediatek,dsi.yaml    |     1 +
 .../bindings/display/msm/dp-controller.yaml        |     1 +
 .../devicetree/bindings/display/msm/gmu.yaml       |    47 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |     4 +-
 .../bindings/display/msm/qcom,msm8998-mdss.yaml    |     6 +
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |     6 +
 .../bindings/display/msm/qcom,sc7180-mdss.yaml     |     8 +
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |    10 +
 .../bindings/display/msm/qcom,sc8280xp-mdss.yaml   |     4 +
 .../bindings/display/msm/qcom,sdm845-mdss.yaml     |     8 +
 .../bindings/display/msm/qcom,sm6115-mdss.yaml     |     6 +
 .../bindings/display/msm/qcom,sm6125-mdss.yaml     |     6 +
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     |     6 +
 .../bindings/display/msm/qcom,sm6375-mdss.yaml     |     6 +
 .../bindings/display/msm/qcom,sm8150-mdss.yaml     |     6 +
 .../bindings/display/msm/qcom,sm8250-mdss.yaml     |     6 +
 .../bindings/display/msm/qcom,sm8350-mdss.yaml     |     8 +
 .../bindings/display/msm/qcom,sm8450-mdss.yaml     |     8 +
 .../bindings/display/msm/qcom,sm8550-mdss.yaml     |     8 +
 .../bindings/display/panel/jdi,lpm102a188a.yaml    |    94 +
 .../display/panel/leadtek,ltk050h3146w.yaml        |     1 +
 .../bindings/display/panel/newvision,nv3051d.yaml  |     5 +-
 .../bindings/display/panel/panel-simple.yaml       |    28 +-
 .../bindings/display/panel/raydium,rm692e5.yaml    |    73 +
 .../display/panel/rocktech,jh057n00900.yaml        |     2 +
 .../display/rockchip/rockchip,dw-mipi-dsi.yaml     |     2 +
 .../bindings/display/rockchip/rockchip-vop.yaml    |     1 +
 .../bindings/display/solomon,ssd-common.yaml       |    42 +
 .../bindings/display/solomon,ssd1307fb.yaml        |    28 +-
 .../bindings/display/solomon,ssd132x.yaml          |    89 +
 .../devicetree/bindings/vendor-prefixes.yaml       |     2 +
 Documentation/driver-api/dma-buf.rst               |    32 +-
 Documentation/gpu/amdgpu/driver-misc.rst           |    18 +
 Documentation/gpu/amdgpu/thermal.rst               |    30 +
 Documentation/gpu/automated_testing.rst            |    20 +-
 Documentation/gpu/drivers.rst                      |     1 +
 Documentation/gpu/drm-kms.rst                      |     2 +
 Documentation/gpu/drm-mm.rst                       |    20 +-
 Documentation/gpu/drm-uapi.rst                     |    92 +-
 Documentation/gpu/drm-usage-stats.rst              |     1 +
 Documentation/gpu/drm-vm-bind-async.rst            |   309 +
 Documentation/gpu/i915.rst                         |    29 +-
 Documentation/gpu/implementation_guidelines.rst    |     9 +
 Documentation/gpu/index.rst                        |     1 +
 Documentation/gpu/panfrost.rst                     |    40 +
 Documentation/gpu/rfc/xe.rst                       |    93 +-
 .../userspace-api/dma-buf-alloc-exchange.rst       |   389 +
 Documentation/userspace-api/index.rst              |     1 +
 MAINTAINERS                                        |    50 +-
 arch/arm64/configs/defconfig                       |     1 +
 arch/ia64/include/asm/fb.h                         |    15 +-
 arch/m68k/include/asm/fb.h                         |    19 +-
 arch/mips/include/asm/fb.h                         |    11 +-
 arch/powerpc/include/asm/fb.h                      |    18 +-
 arch/sparc/include/asm/fb.h                        |    15 +-
 arch/x86/include/asm/fb.h                          |    10 +-
 arch/x86/video/fbdev.c                             |    15 +-
 drivers/accel/drm_accel.c                          |    56 +-
 drivers/accel/habanalabs/common/command_buffer.c   |     5 +-
 .../accel/habanalabs/common/command_submission.c   |   488 +-
 drivers/accel/habanalabs/common/context.c          |     9 +-
 drivers/accel/habanalabs/common/debugfs.c          |    22 +-
 drivers/accel/habanalabs/common/device.c           |   425 +-
 drivers/accel/habanalabs/common/firmware_if.c      |    45 +-
 drivers/accel/habanalabs/common/habanalabs.h       |   212 +-
 drivers/accel/habanalabs/common/habanalabs_drv.c   |   186 +-
 drivers/accel/habanalabs/common/habanalabs_ioctl.c |   112 +-
 drivers/accel/habanalabs/common/irq.c              |   180 +-
 drivers/accel/habanalabs/common/memory.c           |   308 +-
 drivers/accel/habanalabs/gaudi/gaudi.c             |    17 +-
 drivers/accel/habanalabs/gaudi/gaudiP.h            |     2 +-
 drivers/accel/habanalabs/gaudi/gaudi_coresight.c   |    12 +
 drivers/accel/habanalabs/gaudi2/gaudi2.c           |   487 +-
 drivers/accel/habanalabs/gaudi2/gaudi2P.h          |     4 +-
 drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c |    46 +-
 drivers/accel/habanalabs/gaudi2/gaudi2_security.c  |    21 +-
 drivers/accel/habanalabs/goya/goya.c               |    10 +-
 drivers/accel/habanalabs/goya/goyaP.h              |     2 +-
 drivers/accel/habanalabs/goya/goya_coresight.c     |    10 +
 .../accel/habanalabs/include/gaudi/gaudi_fw_if.h   |    32 -
 .../include/gaudi2/gaudi2_async_events.h           |     7 +
 .../include/gaudi2/gaudi2_async_ids_map_extended.h |    16 +-
 drivers/accel/ivpu/Makefile                        |     3 +-
 drivers/accel/ivpu/TODO                            |    11 -
 drivers/accel/ivpu/ivpu_debugfs.c                  |    50 +-
 drivers/accel/ivpu/ivpu_debugfs.h                  |     8 +-
 drivers/accel/ivpu/ivpu_drv.c                      |    89 +-
 drivers/accel/ivpu/ivpu_drv.h                      |    18 +-
 drivers/accel/ivpu/ivpu_fw.c                       |    24 +-
 drivers/accel/ivpu/ivpu_fw.h                       |     2 +-
 drivers/accel/ivpu/ivpu_fw_log.c                   |     6 +-
 drivers/accel/ivpu/ivpu_gem.c                      |    30 +-
 drivers/accel/ivpu/ivpu_gem.h                      |    22 +-
 drivers/accel/ivpu/ivpu_hw_37xx.c                  |   134 +-
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h              |   187 +-
 drivers/accel/ivpu/ivpu_hw_40xx.c                  |    15 +-
 drivers/accel/ivpu/ivpu_hw_reg_io.h                |    32 +-
 drivers/accel/ivpu/ivpu_ipc.c                      |    53 +-
 drivers/accel/ivpu/ivpu_job.c                      |     8 +-
 drivers/accel/ivpu/ivpu_jsm_msg.c                  |    82 +-
 drivers/accel/ivpu/ivpu_jsm_msg.h                  |     2 +
 drivers/accel/ivpu/ivpu_mmu.c                      |   146 +-
 drivers/accel/ivpu/ivpu_mmu_context.c              |    18 +-
 drivers/accel/ivpu/ivpu_mmu_context.h              |     2 +
 drivers/accel/ivpu/ivpu_pm.c                       |    31 +-
 drivers/accel/ivpu/ivpu_pm.h                       |     3 +-
 drivers/accel/qaic/qaic.h                          |    13 +-
 drivers/accel/qaic/qaic_data.c                     |   187 +-
 drivers/accel/qaic/qaic_drv.c                      |   119 +-
 drivers/gpu/drm/Kconfig                            |     7 +
 drivers/gpu/drm/Makefile                           |     2 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |    25 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |    39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    94 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |    40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    52 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    57 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |    18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   472 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   184 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h       |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c   |    15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    97 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |   166 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.h     |    11 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |     8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   209 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h             |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |    45 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   207 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |   186 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |    61 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   149 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   521 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |     1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |    92 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |    30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |    30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |     1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h          |    12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |    93 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |    37 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |    29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |     5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |   878 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.h       |   228 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    50 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |     4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    75 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |   656 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.h            |    91 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    58 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |    28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |     5 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |     2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v1_0.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_0.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v3_0.c            |     7 +-
 drivers/gpu/drm/amd/amdgpu/atom.c                  |    19 +-
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |     1 -
 drivers/gpu/drm/amd/amdgpu/cik.c                   |     4 -
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |    16 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/df_v4_6_2.c             |    34 +
 drivers/gpu/drm/amd/amdgpu/df_v4_6_2.h             |    31 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   132 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   180 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    89 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |     6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   142 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.c        |   516 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.h        |    29 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |     2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |    16 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |     5 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |     6 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c           |     5 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c         |     5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   270 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   213 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |    32 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |    33 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   408 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |    18 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c              |    20 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |     4 -
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |     9 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |    14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |     5 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   622 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.h           |    35 +
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |    10 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    62 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   160 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |    14 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |     4 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |     7 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c          |     7 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.c          |     5 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c            |   589 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.h            |    29 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h            |    12 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |     6 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |     8 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |   372 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.h            |    33 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |    10 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |    11 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |    19 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |    20 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |     4 +
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |     7 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |    26 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c           |     2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |    16 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |    16 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    75 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |    35 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    25 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    30 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   115 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |     2 -
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |     5 -
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        |    22 +-
 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c          |    19 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c           |    22 +
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_3.c         |     6 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    31 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    49 +-
 drivers/gpu/drm/amd/amdgpu/ta_xgmi_if.h            |    62 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   390 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |   127 +
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |    12 +-
 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c         |   424 +
 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.h         |    30 +
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |     8 +
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |     8 +
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |     8 +
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |     8 +
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |     8 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |     9 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |    14 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |    80 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |     5 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  1779 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.h            |    35 +
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |    14 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |     5 +-
 drivers/gpu/drm/amd/amdgpu/vpe_6_1_fw_if.h         |   217 +
 drivers/gpu/drm/amd/amdgpu/vpe_v6_1.c              |   291 +
 drivers/gpu/drm/amd/amdgpu/vpe_v6_1.h              |    29 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    22 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    31 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    19 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   129 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |    10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |     6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |     6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |     6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |     8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |    28 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |     3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |     4 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |     3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   194 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |     6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    44 +-
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c        |     7 +-
 drivers/gpu/drm/amd/display/Makefile               |     1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   357 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     2 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |    48 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    62 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |     1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   125 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    22 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   561 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |     2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |     4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c     |    53 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |     7 +-
 drivers/gpu/drm/amd/display/dc/basics/Makefile     |     9 +-
 .../display/dc/{dml/calcs =3D> basics}/bw_fixed.c    |    13 +-
 .../dc/{dml/calcs =3D> basics}/calcs_logger.h        |     0
 .../dc/{dml/calcs =3D> basics}/custom_float.c        |    90 +-
 .../display/dc/{dml/calcs =3D> basics}/dce_calcs.c   |     0
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |     3 +
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    46 +-
 .../amd/display/dc/bios/command_table_helper2.c    |     1 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |     8 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    18 +
 .../amd/display/dc/clk_mgr/dce120/dce120_clk_mgr.c |     2 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |     2 -
 .../gpu/drm/amd/display/dc/clk_mgr/dcn32/dalsmc.h  |    11 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    64 +
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c       |   154 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  1142 +
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.h   |    63 +
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   |   471 +
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.h   |   203 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   511 +-
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |     2 +
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    23 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  1818 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    51 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    90 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   154 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |     4 +
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    59 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |     7 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |     7 -
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |     9 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    16 +-
 drivers/gpu/drm/amd/display/dc/dce/Makefile        |     2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h       |     9 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |     4 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |     7 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |     3 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |     4 +
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.h    |     6 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |    13 +-
 drivers/gpu/drm/amd/display/dc/dce100/Makefile     |     2 +-
 .../drm/amd/display/dc/dce100/dce100_resource.c    |     4 +-
 drivers/gpu/drm/amd/display/dc/dce110/Makefile     |     2 +-
 .../drm/amd/display/dc/dce110/dce110_resource.c    |     2 +-
 drivers/gpu/drm/amd/display/dc/dce112/Makefile     |     2 +-
 .../drm/amd/display/dc/dce112/dce112_resource.c    |     2 +-
 drivers/gpu/drm/amd/display/dc/dce120/Makefile     |     1 -
 .../drm/amd/display/dc/dce120/dce120_resource.c    |     6 +-
 .../drm/amd/display/dc/dce60/dce60_hw_sequencer.c  |     4 +-
 drivers/gpu/drm/amd/display/dc/dce80/Makefile      |     2 +-
 .../gpu/drm/amd/display/dc/dce80/dce80_resource.c  |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |     2 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h    |    12 +-
 .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |     4 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |     4 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |    33 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |    30 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |     5 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |    24 +-
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |    64 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |     2 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |     9 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |    37 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.h  |     4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c  |     3 +
 drivers/gpu/drm/amd/display/dc/dcn201/Makefile     |     2 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_init.c    |     6 +-
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |     6 +-
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c  |     2 +
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |     9 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |    14 +-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |     1 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c |   104 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h   |     2 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.h   |     2 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |     8 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |    17 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h   |     1 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |     2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |     6 +-
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |     2 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |     8 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |     8 +-
 drivers/gpu/drm/amd/display/dc/dcn302/Makefile     |     2 +-
 .../gpu/drm/amd/display/dc/dcn302/dcn302_init.c    |     2 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |     4 +
 drivers/gpu/drm/amd/display/dc/dcn303/Makefile     |     2 +-
 .../gpu/drm/amd/display/dc/dcn303/dcn303_dccg.h    |    18 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.c   |    45 -
 .../gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.h   |    18 -
 .../gpu/drm/amd/display/dc/dcn303/dcn303_init.c    |    20 +-
 .../gpu/drm/amd/display/dc/dcn303/dcn303_init.h    |    18 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |    22 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.h    |    18 +
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |     4 +-
 .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.h   |    10 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |    55 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c  |     6 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.h  |     3 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |     6 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |     6 +-
 drivers/gpu/drm/amd/display/dc/dcn314/Makefile     |     2 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |     3 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h    |     6 +
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |    22 +-
 .../display/dc/dcn314/dcn314_dio_stream_encoder.h  |    40 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |     6 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |    12 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |     8 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |     4 +-
 drivers/gpu/drm/amd/display/dc/dcn32/Makefile      |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |     1 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |    14 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h    |     6 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |    12 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.h  |     4 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.h   |     2 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |    27 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.h  |     3 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   177 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |   169 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |    50 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |    54 +-
 drivers/gpu/drm/amd/display/dc/dcn35/Makefile      |    20 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c  |   796 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.h  |   190 +
 .../amd/display/dc/dcn35/dcn35_dio_link_encoder.c  |   267 +
 .../amd/display/dc/dcn35/dcn35_dio_link_encoder.h  |   137 +
 .../display/dc/dcn35/dcn35_dio_stream_encoder.c    |   528 +
 .../display/dc/dcn35/dcn35_dio_stream_encoder.h    |   326 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dpp.c   |    53 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dpp.h   |    57 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dsc.c   |    60 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dsc.h   |    59 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dwb.c   |    58 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dwb.h   |    61 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_hubbub.c    |   611 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_hubbub.h    |   155 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubp.c  |   106 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubp.h  |    61 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_init.c  |   171 +
 .../accessories/link_fpga.h =3D> dcn35/dcn35_init.h} |    16 +-
 .../gpu/drm/amd/display/dc/dcn35/dcn35_mmhubbub.c  |    59 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_mmhubbub.h  |    75 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_opp.c   |    53 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_opp.h   |    67 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c  |   290 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.h  |    74 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.c   |   541 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.h   |   195 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_resource.c  |  2126 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_resource.h  |   310 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |     5 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    31 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h   |    10 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |     2 +
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   819 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |     3 -
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |     4 -
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |    81 +
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   509 +
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.h   |    42 +
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |    93 +
 drivers/gpu/drm/amd/display/dc/dml2/cmntypes.h     |    94 +
 .../drm/amd/display/dc/dml2/display_mode_core.c    | 10315 ++++
 .../drm/amd/display/dc/dml2/display_mode_core.h    |   201 +
 .../display/dc/dml2/display_mode_core_structs.h    |  1972 +
 .../amd/display/dc/dml2/display_mode_lib_defines.h |    77 +
 .../drm/amd/display/dc/dml2/display_mode_util.c    |   798 +
 .../drm/amd/display/dc/dml2/display_mode_util.h    |    76 +
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |  1009 +
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.h    |    50 +
 .../gpu/drm/amd/display/dc/dml2/dml2_dc_types.h    |    42 +
 .../drm/amd/display/dc/dml2/dml2_internal_types.h  |   123 +
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.c    |   915 +
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.h    |    52 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c  |   310 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.h  |    47 +
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  1205 +
 .../amd/display/dc/dml2/dml2_translation_helper.h  |    41 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |   482 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.h   |   144 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   747 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |   230 +
 drivers/gpu/drm/amd/display/dc/dml2/dml_assert.h   |    32 +
 .../gpu/drm/amd/display/dc/dml2/dml_depedencies.h  |    33 +
 .../amd/display/dc/dml2/dml_display_rq_dlg_calc.c  |   585 +
 .../amd/display/dc/dml2/dml_display_rq_dlg_calc.h  |    63 +
 drivers/gpu/drm/amd/display/dc/dml2/dml_logging.h  |    31 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |     1 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |     1 +
 drivers/gpu/drm/amd/display/dc/hdcp/Makefile       |     2 +-
 drivers/gpu/drm/amd/display/dc/hwss/Makefile       |   183 +
 .../drm/amd/display/dc/{ =3D> hwss}/dce/dce_hwseq.c  |     0
 .../drm/amd/display/dc/{ =3D> hwss}/dce/dce_hwseq.h  |    20 +
 .../dce100/dce100_hwseq.c}                         |     4 +-
 .../dce100/dce100_hwseq.h}                         |     0
 .../dce110/dce110_hwseq.c}                         |    30 +-
 .../dce110/dce110_hwseq.h}                         |     0
 .../dce112/dce112_hwseq.c}                         |     4 +-
 .../dce112/dce112_hwseq.h}                         |     0
 .../dce120/dce120_hwseq.c}                         |     4 +-
 .../dce120/dce120_hwseq.h}                         |     0
 .../dce80/dce80_hwseq.c}                           |     6 +-
 .../dce80/dce80_hwseq.h}                           |     0
 .../dcn10/dcn10_hwseq.c}                           |    37 +-
 .../dcn10/dcn10_hwseq.h}                           |     0
 .../amd/display/dc/{ =3D> hwss}/dcn20/dcn20_hwseq.c  |   200 +-
 .../amd/display/dc/{ =3D> hwss}/dcn20/dcn20_hwseq.h  |    11 +-
 .../display/dc/{ =3D> hwss}/dcn201/dcn201_hwseq.c    |     2 +-
 .../display/dc/{ =3D> hwss}/dcn201/dcn201_hwseq.h    |     0
 .../amd/display/dc/{ =3D> hwss}/dcn21/dcn21_hwseq.c  |     2 +-
 .../amd/display/dc/{ =3D> hwss}/dcn21/dcn21_hwseq.h  |     0
 .../amd/display/dc/{ =3D> hwss}/dcn30/dcn30_hwseq.c  |    68 +-
 .../amd/display/dc/{ =3D> hwss}/dcn30/dcn30_hwseq.h  |     3 +
 .../display/dc/{ =3D> hwss}/dcn301/dcn301_hwseq.c    |     0
 .../display/dc/{ =3D> hwss}/dcn301/dcn301_hwseq.h    |     0
 .../display/dc/{ =3D> hwss}/dcn302/dcn302_hwseq.c    |     0
 .../display/dc/{ =3D> hwss}/dcn302/dcn302_hwseq.h    |     0
 .../drm/amd/display/dc/hwss/dcn303/dcn303_hwseq.c  |    64 +
 .../drm/amd/display/dc/hwss/dcn303/dcn303_hwseq.h  |    37 +
 .../amd/display/dc/{ =3D> hwss}/dcn31/dcn31_hwseq.c  |    13 +-
 .../amd/display/dc/{ =3D> hwss}/dcn31/dcn31_hwseq.h  |     0
 .../display/dc/{ =3D> hwss}/dcn314/dcn314_hwseq.c    |     7 +-
 .../display/dc/{ =3D> hwss}/dcn314/dcn314_hwseq.h    |     0
 .../amd/display/dc/{ =3D> hwss}/dcn32/dcn32_hwseq.c  |   150 +-
 .../amd/display/dc/{ =3D> hwss}/dcn32/dcn32_hwseq.h  |    12 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  1203 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |    87 +
 .../amd/display/dc/{inc =3D> hwss}/hw_sequencer.h    |    81 +-
 .../dc/{inc =3D> hwss}/hw_sequencer_private.h        |     2 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    39 +
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |    10 +-
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |    18 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |    14 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |     2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |     6 +
 drivers/gpu/drm/amd/display/dc/inc/hw/pg_cntl.h    |    52 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |     5 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |     1 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |     1 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   285 +-
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |     9 +
 .../amd/display/dc/irq/dce110/irq_service_dce110.c |    12 +-
 .../amd/display/dc/irq/dce120/irq_service_dce120.c |    12 +-
 .../amd/display/dc/irq/dce60/irq_service_dce60.c   |    12 +-
 .../amd/display/dc/irq/dce80/irq_service_dce80.c   |    12 +-
 .../amd/display/dc/irq/dcn10/irq_service_dcn10.c   |    14 +-
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.c   |    14 +-
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |    16 +-
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |    16 +-
 .../amd/display/dc/irq/dcn30/irq_service_dcn30.c   |    16 +-
 .../amd/display/dc/irq/dcn302/irq_service_dcn302.c |    16 +-
 .../amd/display/dc/irq/dcn303/irq_service_dcn303.c |    33 +-
 .../amd/display/dc/irq/dcn303/irq_service_dcn303.h |    19 +
 .../amd/display/dc/irq/dcn31/irq_service_dcn31.c   |    16 +-
 .../amd/display/dc/irq/dcn314/irq_service_dcn314.c |    16 +-
 .../amd/display/dc/irq/dcn315/irq_service_dcn315.c |    16 +-
 .../amd/display/dc/irq/dcn32/irq_service_dcn32.c   |    16 +-
 .../amd/display/dc/irq/dcn35/irq_service_dcn35.c   |   427 +
 .../amd/display/dc/irq/dcn35/irq_service_dcn35.h   |    34 +
 drivers/gpu/drm/amd/display/dc/irq/irq_service.h   |     2 +-
 drivers/gpu/drm/amd/display/dc/irq_types.h         |     6 +-
 drivers/gpu/drm/amd/display/dc/link/Makefile       |     4 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |   123 +-
 .../amd/display/dc/link/accessories/link_fpga.c    |    95 -
 .../drm/amd/display/dc/link/hwss/link_hwss_dpia.c  |     2 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   |     9 +
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |    60 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |     4 +-
 .../drm/amd/display/dc/link/protocols/link_ddc.c   |     2 +
 .../display/dc/link/protocols/link_dp_capability.c |    14 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |     2 +
 .../amd/display/dc/link/protocols/link_dp_phy.c    |     3 +-
 .../dc/link/protocols/link_edp_panel_control.c     |    63 +-
 .../dc/link/protocols/link_edp_panel_control.h     |     3 +
 drivers/gpu/drm/amd/display/dc/os_types.h          |     1 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    52 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   218 +-
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |     1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.c |    19 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.h |    19 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |    64 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h  |    17 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |   552 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.h  |   282 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |    93 +-
 drivers/gpu/drm/amd/display/include/dal_types.h    |     2 +
 .../drm/amd/display/include/ddc_service_types.h    |     1 +
 drivers/gpu/drm/amd/display/include/logger_types.h |   143 +-
 drivers/gpu/drm/amd/display/include/signal_types.h |     1 -
 .../drm/amd/display/modules/color/color_gamma.c    |   115 +-
 .../drm/amd/display/modules/freesync/freesync.c    |     9 +-
 .../gpu/drm/amd/display/modules/inc/mod_stats.h    |     2 +-
 .../drm/amd/display/modules/power/power_helpers.c  |    20 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |     7 +
 .../amd/include/asic_reg/dcn/dcn_3_5_0_offset.h    | 15255 +++++
 .../amd/include/asic_reg/dcn/dcn_3_5_0_sh_mask.h   | 53412 +++++++++++++++=
++
 .../drm/amd/include/asic_reg/gc/gc_11_5_0_offset.h | 10000 ++++
 .../amd/include/asic_reg/gc/gc_11_5_0_sh_mask.h    | 36579 ++++++++++++
 .../include/asic_reg/mmhub/mmhub_3_3_0_offset.h    |  1395 +
 .../include/asic_reg/mmhub/mmhub_3_3_0_sh_mask.h   |  6722 +++
 .../amd/include/asic_reg/mp/mp_13_0_6_sh_mask.h    |    28 +
 .../drm/amd/include/asic_reg/mp/mp_14_0_0_offset.h |   359 +
 .../amd/include/asic_reg/mp/mp_14_0_0_sh_mask.h    |   534 +
 .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |  9400 +++
 .../include/asic_reg/nbio/nbio_7_11_0_sh_mask.h    | 57857 +++++++++++++++=
++++
 .../amd/include/asic_reg/umc/umc_12_0_0_offset.h   |    33 +
 .../amd/include/asic_reg/umc/umc_12_0_0_sh_mask.h  |    95 +
 .../amd/include/asic_reg/vcn/vcn_4_0_0_offset.h    |   422 +
 .../amd/include/asic_reg/vcn/vcn_4_0_0_sh_mask.h   |   882 +
 .../amd/include/asic_reg/vcn/vcn_4_0_5_offset.h    |  1797 +
 .../amd/include/asic_reg/vcn/vcn_4_0_5_sh_mask.h   |  8614 +++
 .../amd/include/asic_reg/vpe/vpe_6_1_0_offset.h    |  1553 +
 .../amd/include/asic_reg/vpe/vpe_6_1_0_sh_mask.h   |  4393 ++
 .../drm/amd/include/ivsrcid/vpe/irqsrcs_vpe_6_1.h  |    40 +
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |    16 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   165 +-
 drivers/gpu/drm/amd/include/pptable.h              |     4 +-
 drivers/gpu/drm/amd/include/soc15_hw_ip.h          |     1 +
 drivers/gpu/drm/amd/include/soc15_ih_clientid.h    |     2 +
 drivers/gpu/drm/amd/include/umsch_mm_4_0_api_def.h |   437 +
 drivers/gpu/drm/amd/pm/Makefile                    |     1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    36 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   951 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    19 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |     2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h  |    16 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h   |     2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |     4 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c  |     4 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.c    |     4 +-
 .../drm/amd/pm/powerplay/hwmgr/vega20_thermal.c    |     4 +-
 drivers/gpu/drm/amd/pm/swsmu/Makefile              |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   208 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    35 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_6.h |    91 +
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h |   282 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |     6 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |    10 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_pmfw.h    |   157 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h   |   143 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    23 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |     4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |   230 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   305 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   108 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   160 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    36 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |    77 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |     8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   291 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    41 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   521 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |     2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |     2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  1061 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   468 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |    18 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/Makefile        |    30 +
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |  1727 +
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  1269 +
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.h   |    28 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |     3 +
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |     2 +-
 drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c   |     2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |     9 +
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |     7 +
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |     1 +
 .../drm/arm/display/komeda/komeda_pipeline_state.c |     9 +-
 drivers/gpu/drm/arm/hdlcd_drv.c                    |     6 +
 drivers/gpu/drm/arm/malidp_drv.c                   |     6 +
 drivers/gpu/drm/armada/armada_drv.c                |     8 +
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |     7 +
 drivers/gpu/drm/ast/ast_dp.c                       |    70 +-
 drivers/gpu/drm/ast/ast_dp501.c                    |    38 +-
 drivers/gpu/drm/ast/ast_drv.c                      |     6 +
 drivers/gpu/drm/ast/ast_drv.h                      |    83 +-
 drivers/gpu/drm/ast/ast_i2c.c                      |    20 +-
 drivers/gpu/drm/ast/ast_main.c                     |    24 +-
 drivers/gpu/drm/ast/ast_mm.c                       |     4 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   200 +-
 drivers/gpu/drm/ast/ast_post.c                     |    26 +-
 drivers/gpu/drm/ast/ast_reg.h                      |    99 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |     6 +
 drivers/gpu/drm/bridge/Kconfig                     |     2 +
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |    16 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |    14 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   108 +-
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |     7 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |    11 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |     3 +
 drivers/gpu/drm/bridge/cadence/Kconfig             |     1 +
 drivers/gpu/drm/bridge/chipone-icn6211.c           |     2 +-
 drivers/gpu/drm/bridge/imx/Kconfig                 |    11 +
 drivers/gpu/drm/bridge/imx/Makefile                |     1 +
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c        |   917 +
 drivers/gpu/drm/bridge/ite-it66121.c               |    33 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |    22 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |     2 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |    12 +-
 drivers/gpu/drm/bridge/lvds-codec.c                |    12 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |    57 +-
 drivers/gpu/drm/bridge/panel.c                     |    19 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |    80 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c      |     6 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |     2 -
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |    99 +-
 drivers/gpu/drm/bridge/tc358767.c                  |     2 +-
 drivers/gpu/drm/bridge/tc358768.c                  |   383 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |     2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |     2 +-
 drivers/gpu/drm/ci/arm.config                      |     1 +
 drivers/gpu/drm/ci/arm64.config                    |     2 +
 drivers/gpu/drm/ci/build.sh                        |     8 +-
 drivers/gpu/drm/ci/build.yml                       |     1 +
 drivers/gpu/drm/ci/gitlab-ci.yml                   |    38 +-
 drivers/gpu/drm/ci/igt_runner.sh                   |    31 +-
 drivers/gpu/drm/ci/image-tags.yml                  |     6 +-
 drivers/gpu/drm/ci/lava-submit.sh                  |     6 +-
 drivers/gpu/drm/ci/test.yml                        |    34 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |    12 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt |    20 -
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |     9 +
 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt     |    32 -
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt       |    11 -
 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt      |     1 -
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |    14 +-
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt      |    38 -
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |    17 +
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt      |    41 -
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt       |     7 +
 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt      |    25 -
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |     1 -
 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt      |     5 -
 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt      |     1 -
 .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt   |     0
 .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |     5 +-
 .../gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt   |    14 -
 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt     |    14 +-
 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt    |     4 -
 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt   |     4 -
 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt    |     2 +
 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt   |     4 -
 drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt     |    15 +-
 drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt    |    24 +-
 drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt     |    18 +-
 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |     9 +-
 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |    19 +-
 drivers/gpu/drm/ci/xfails/requirements.txt         |    17 +
 .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |     6 +
 .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt   |     9 -
 .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |    40 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |    28 +-
 drivers/gpu/drm/ci/xfails/update-xfails.py         |   204 +
 .../gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt   |     0
 drivers/gpu/drm/display/drm_dp_cec.c               |    23 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |    47 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   164 +-
 drivers/gpu/drm/drm_atomic.c                       |     4 +-
 drivers/gpu/drm/drm_atomic_helper.c                |     3 +
 drivers/gpu/drm/drm_auth.c                         |     3 +-
 drivers/gpu/drm/drm_bridge.c                       |     4 +-
 drivers/gpu/drm/drm_bridge_connector.c             |    38 +-
 drivers/gpu/drm/drm_buddy.c                        |   138 +-
 drivers/gpu/drm/drm_client.c                       |    17 +-
 drivers/gpu/drm/drm_connector.c                    |    17 +-
 drivers/gpu/drm/drm_crtc_internal.h                |     2 +-
 drivers/gpu/drm/drm_debugfs.c                      |   188 +-
 drivers/gpu/drm/drm_drv.c                          |    28 +-
 drivers/gpu/drm/drm_edid.c                         |    40 +-
 drivers/gpu/drm/drm_file.c                         |    48 +-
 drivers/gpu/drm/drm_fourcc.c                       |     8 +
 drivers/gpu/drm/drm_framebuffer.c                  |    68 +-
 drivers/gpu/drm/{drm_gpuva_mgr.c =3D> drm_gpuvm.c}   |   409 +-
 drivers/gpu/drm/drm_internal.h                     |    27 +-
 drivers/gpu/drm/drm_ioctl.c                        |     3 +
 drivers/gpu/drm/drm_lease.c                        |     4 +-
 drivers/gpu/drm/drm_mode_config.c                  |     2 -
 drivers/gpu/drm/drm_sysfs.c                        |    22 +-
 drivers/gpu/drm/drm_vblank_work.c                  |     3 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |     1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |     2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |     8 +
 drivers/gpu/drm/gma500/gma_display.h               |     1 -
 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c         |     2 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |     9 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h             |    14 -
 drivers/gpu/drm/gma500/psb_irq.c                   |     5 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |     6 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |     9 +
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |     6 +
 drivers/gpu/drm/i915/Makefile                      |    49 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |    10 +-
 drivers/gpu/drm/i915/display/g4x_dp.h              |    26 +
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |     6 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.h            |    12 +
 drivers/gpu/drm/i915/display/hsw_ips.c             |     1 +
 drivers/gpu/drm/i915/display/hsw_ips.h             |    35 +
 drivers/gpu/drm/i915/display/i9xx_plane.c          |     1 +
 drivers/gpu/drm/i915/display/i9xx_plane.h          |    23 +
 drivers/gpu/drm/i915/display/i9xx_wm.h             |    17 +
 drivers/gpu/drm/i915/display/icl_dsi.c             |    13 +-
 drivers/gpu/drm/i915/display/intel_acpi.c          |     2 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |     2 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    14 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |     6 +-
 drivers/gpu/drm/i915/display/intel_audio.h         |     3 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |    26 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   107 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   156 +-
 drivers/gpu/drm/i915/display/intel_color.h         |     2 +
 drivers/gpu/drm/i915/display/intel_color_regs.h    |   286 +
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |    17 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |     6 +-
 drivers/gpu/drm/i915/display/intel_connector.h     |     2 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    66 +-
 drivers/gpu/drm/i915/display/intel_crt.h           |    14 +
 drivers/gpu/drm/i915/display/intel_crtc.c          |   118 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |     6 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |     3 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   214 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |    17 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |    13 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |    40 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   490 +-
 drivers/gpu/drm/i915/display/intel_display.h       |     8 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |     3 +
 .../gpu/drm/i915/display/intel_display_debugfs.c   |    38 +-
 .../gpu/drm/i915/display/intel_display_device.c    |   156 +-
 .../gpu/drm/i915/display/intel_display_device.h    |    41 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |     8 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   |     4 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |    10 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |     1 -
 .../gpu/drm/i915/display/intel_display_power_map.c |    63 +-
 .../drm/i915/display/intel_display_power_well.c    |    52 +-
 .../drm/i915/display/intel_display_power_well.h    |     1 +
 drivers/gpu/drm/i915/display/intel_display_types.h |    57 +-
 drivers/gpu/drm/i915/display/intel_display_wa.c    |    48 +
 drivers/gpu/drm/i915/display/intel_display_wa.h    |    13 +
 drivers/gpu/drm/i915/display/intel_dmc.c           |     4 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  1092 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |    39 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    49 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |     4 +-
 drivers/gpu/drm/i915/display/intel_dp_aux_regs.h   |    80 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |    87 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |    14 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   222 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.h      |    96 +
 drivers/gpu/drm/i915/display/intel_dpll.c          |    57 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   987 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    33 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |     2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |     1 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |   235 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |     9 +-
 drivers/gpu/drm/i915/display/intel_dsb_regs.h      |    31 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |     3 +
 drivers/gpu/drm/i915/display/intel_dvo.c           |    13 +-
 drivers/gpu/drm/i915/display/intel_dvo.h           |     6 +
 drivers/gpu/drm/i915/display/intel_fb.c            |    63 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |     3 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   181 +-
 drivers/gpu/drm/i915/display/intel_fbc.h           |     2 +
 drivers/gpu/drm/i915/display/intel_fdi.c           |   169 +-
 drivers/gpu/drm/i915/display/intel_fdi.h           |     8 +
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |    35 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |     4 +
 drivers/gpu/drm/i915/display/intel_gmbus.c         |     7 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |    41 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |   617 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h      |     1 +
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.c  |   590 +
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.h  |    72 +
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   123 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |    87 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |    24 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |   212 +
 drivers/gpu/drm/i915/display/intel_link_bw.h       |    37 +
 drivers/gpu/drm/i915/display/intel_lpe_audio.h     |    18 +
 drivers/gpu/drm/i915/display/intel_lspcon.c        |    29 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |    33 +-
 drivers/gpu/drm/i915/display/intel_lvds.h          |    19 +
 .../gpu/drm/i915/display/intel_modeset_verify.c    |   134 +-
 .../gpu/drm/i915/display/intel_modeset_verify.h    |    11 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |     2 +
 drivers/gpu/drm/i915/display/intel_overlay.h       |    35 +
 drivers/gpu/drm/i915/display/intel_panel.c         |    19 +-
 drivers/gpu/drm/i915/display/intel_pch_display.h   |    53 +
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |     7 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.h    |    23 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c |     3 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |     2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |    82 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |     3 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   385 +-
 drivers/gpu/drm/i915/display/intel_sdvo.h          |    13 +
 drivers/gpu/drm/i915/display/intel_sdvo_regs.h     |     2 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |     9 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.h      |     3 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |     1 +
 drivers/gpu/drm/i915/display/intel_sprite.h        |     8 +
 drivers/gpu/drm/i915/display/intel_tc.c            |    66 +-
 drivers/gpu/drm/i915/display/intel_tc.h            |     3 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |     2 +-
 drivers/gpu/drm/i915/display/intel_tv.h            |     6 +
 drivers/gpu/drm/i915/display/intel_vblank.c        |    14 +
 drivers/gpu/drm/i915/display/intel_vblank.h        |     1 +
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   630 +-
 drivers/gpu/drm/i915/display/intel_vdsc_regs.h     |   397 +-
 drivers/gpu/drm/i915/display/intel_vga.c           |    18 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |    18 +-
 drivers/gpu/drm/i915/display/intel_vrr.h           |     1 +
 drivers/gpu/drm/i915/display/intel_wm.c            |     2 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    22 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |    40 +-
 drivers/gpu/drm/i915/display/skl_watermark.h       |     6 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   130 +
 drivers/gpu/drm/i915/display/vlv_dsi.h             |    13 +
 drivers/gpu/drm/i915/display/vlv_dsi_pll.h         |     9 +
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |     3 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |     4 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    24 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |     1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    89 -
 .../gpu/drm/i915/gem/i915_gem_object_frontbuffer.h |   103 +
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |     1 +
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |    44 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |    39 +-
 drivers/gpu/drm/i915/gem/selftests/mock_context.c  |     2 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |    17 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |    36 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |     2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |    74 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |     2 +-
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |     1 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |    13 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |    17 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |     4 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   265 +-
 drivers/gpu/drm/i915/gt/intel_gsc.c                |    11 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |    77 +-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |    72 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |    28 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h             |     1 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |    20 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.h              |     1 +
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |     1 -
 drivers/gpu/drm/i915/gt/intel_gt_print.h           |     3 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |    11 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c                |     5 +
 drivers/gpu/drm/i915/gt/intel_gtt.h                |     9 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |    74 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |    25 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |     9 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    60 +-
 drivers/gpu/drm/i915/gt/intel_reset.h              |     2 +
 drivers/gpu/drm/i915/gt/intel_rps.c                |     2 +-
 drivers/gpu/drm/i915/gt/intel_tlb.c                |    16 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   420 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |     2 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c             |    11 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |    33 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c          |     8 +-
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c  |    20 +-
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h  |     6 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    70 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |    39 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |     4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |    46 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h          |     2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |     2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |    63 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h        |     2 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |   249 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |     7 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |    40 +-
 drivers/gpu/drm/i915/gvt/gvt.h                     |     9 +-
 drivers/gpu/drm/i915/gvt/interrupt.c               |    17 +
 drivers/gpu/drm/i915/gvt/interrupt.h               |    31 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c            |     8 +
 drivers/gpu/drm/i915/gvt/mmio_context.h            |    10 -
 drivers/gpu/drm/i915/i915_debugfs.c                |    12 +-
 drivers/gpu/drm/i915/i915_driver.c                 |    20 +-
 drivers/gpu/drm/i915/i915_driver.h                 |     4 +-
 drivers/gpu/drm/i915/i915_drv.h                    |    88 +-
 drivers/gpu/drm/i915/i915_gem.c                    |     2 +-
 drivers/gpu/drm/i915/i915_getparam.c               |     2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |    15 +-
 drivers/gpu/drm/i915/i915_irq.c                    |     2 +
 drivers/gpu/drm/i915/i915_params.c                 |     5 -
 drivers/gpu/drm/i915/i915_params.h                 |     1 -
 drivers/gpu/drm/i915/i915_pci.c                    |     5 +-
 drivers/gpu/drm/i915/i915_perf.c                   |   122 +-
 drivers/gpu/drm/i915/i915_perf_types.h             |     6 -
 drivers/gpu/drm/i915/i915_pmu.c                    |     9 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   290 +-
 drivers/gpu/drm/i915/i915_scatterlist.h            |    10 +
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |    23 +-
 drivers/gpu/drm/i915/i915_vma.c                    |     1 +
 drivers/gpu/drm/i915/i915_vma_resource.c           |     2 +-
 drivers/gpu/drm/i915/intel_clock_gating.c          |    60 +-
 drivers/gpu/drm/i915/intel_device_info.c           |    50 -
 drivers/gpu/drm/i915/intel_device_info.h           |     6 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |     4 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |     1 -
 drivers/gpu/drm/i915/intel_runtime_pm.h            |     4 +-
 drivers/gpu/drm/i915/intel_step.c                  |     6 +
 drivers/gpu/drm/i915/intel_step.h                  |     1 +
 drivers/gpu/drm/i915/intel_wakeref.c               |    52 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |    40 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |     2 +-
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h  |     4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c         |    17 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h         |    10 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c           |     4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c            |    18 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h            |     5 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |    21 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |     9 +
 drivers/gpu/drm/i915/selftests/i915_request.c      |     2 +-
 drivers/gpu/drm/i915/selftests/igt_spinner.c       |     3 +
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |     3 +-
 drivers/gpu/drm/i915/soc/intel_gmch.c              |    14 +
 drivers/gpu/drm/i915/soc/intel_gmch.h              |     2 +
 drivers/gpu/drm/i915/soc/intel_pch.c               |    12 +-
 drivers/gpu/drm/i915/soc/intel_pch.h               |     2 +
 drivers/gpu/drm/imx/dcss/dcss-drv.c                |     8 +
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |     7 +
 drivers/gpu/drm/imx/dcss/dcss-kms.h                |     1 +
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c            |     6 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |    13 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                |     5 +-
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                |     5 +-
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c             |     5 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       |     6 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    70 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |     5 +-
 drivers/gpu/drm/lima/lima_sched.c                  |     4 +-
 drivers/gpu/drm/logicvc/logicvc_drm.c              |     9 +
 drivers/gpu/drm/loongson/lsdc_drv.c                |     6 +
 drivers/gpu/drm/loongson/lsdc_pixpll.c             |     6 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |     9 +
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |    87 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |     5 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |   203 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |    42 +-
 drivers/gpu/drm/mediatek/mtk_dp_reg.h              |    23 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |     9 +
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |    83 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h            |     6 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |    34 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |    17 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    47 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |    15 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |     9 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |    41 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |    48 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |     8 +
 drivers/gpu/drm/msm/Makefile                       |     1 +
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |     9 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   209 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |     3 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |     8 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   655 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    69 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |    65 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |    88 +
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    39 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |     7 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |    32 +-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |     4 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |     4 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |     8 -
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |    10 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |     3 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |     8 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |     3 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |     1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |     3 -
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |     1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |     1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |     8 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |     6 -
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |    13 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |    12 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |    48 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |     8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |     2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |    55 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |     6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |    62 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |     4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |    53 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |     3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |    20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   160 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |    20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |    58 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |     1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |    41 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |     3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |    21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |    12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |    23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |    21 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |     4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |    20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |     7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   145 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |    42 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |     6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |    72 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |    30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h           |     4 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   118 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   111 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |     2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |    66 +-
 drivers/gpu/drm/msm/dp/dp_display.h                |     1 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    |    21 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |     2 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |    38 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   130 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    11 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |    40 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |     5 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |     1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |    47 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |    30 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |    28 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |     5 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |    30 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                |     3 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |     6 +-
 drivers/gpu/drm/msm/msm_debugfs.c                  |    12 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   371 +-
 drivers/gpu/drm/msm/msm_drv.h                      |    17 +-
 drivers/gpu/drm/msm/msm_kms.c                      |   345 +
 drivers/gpu/drm/msm/msm_kms.h                      |     3 +
 drivers/gpu/drm/msm/msm_mdss.c                     |     6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |     5 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h               |     2 +
 drivers/gpu/drm/nouveau/Kconfig                    |     1 +
 drivers/gpu/drm/nouveau/dispnv04/disp.c            |     2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   536 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.h            |     6 +-
 drivers/gpu/drm/nouveau/dispnv50/head.h            |     1 +
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c        |    14 +
 drivers/gpu/drm/nouveau/include/nvif/conn.h        |    20 +-
 drivers/gpu/drm/nouveau/include/nvif/if0011.h      |    21 +-
 drivers/gpu/drm/nouveau/include/nvif/if0012.h      |   249 +-
 drivers/gpu/drm/nouveau/include/nvif/outp.h        |    96 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/memory.h |     1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/instmem.h  |     2 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |    90 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c             |     8 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |   251 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h        |     3 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c          |     2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |     8 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c               |   345 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |     5 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |    30 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c             |     4 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c            |     1 +
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |    42 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.h             |     8 +-
 drivers/gpu/drm/nouveau/nvif/client.c              |     2 +-
 drivers/gpu/drm/nouveau/nvif/conn.c                |    36 +-
 drivers/gpu/drm/nouveau/nvif/disp.c                |     2 +-
 drivers/gpu/drm/nouveau/nvif/outp.c                |   412 +-
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c       |     3 +-
 drivers/gpu/drm/nouveau/nvkm/core/memory.c         |    15 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c    |   146 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.c    |    10 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h    |     2 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c      |   362 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.c     |     1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c     |     1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c   |     1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c   |     2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c   |     1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.c   |     1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c   |    17 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.c   |     1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c   |    38 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c   |     2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h     |    15 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.c   |     1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c    |   182 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c    |   144 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h    |    43 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c   |     1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c   |    67 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c   |   460 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c     |    10 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c      |     7 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h      |     2 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c    |    12 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c |    19 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h |     1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c |     2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c |     2 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |     8 +
 drivers/gpu/drm/panel/Kconfig                      |    29 +
 drivers/gpu/drm/panel/Makefile                     |     3 +
 drivers/gpu/drm/panel/panel-arm-versatile.c        |     2 +
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |     9 -
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c     |     9 -
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |   371 -
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |     8 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      |   779 +
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c       |     9 -
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c      |   551 +
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |     4 -
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |    97 +-
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |     7 +
 drivers/gpu/drm/panel/panel-novatek-nt35950.c      |     9 -
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      |    12 -
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |    17 -
 drivers/gpu/drm/panel/panel-raydium-rm68200.c      |    38 -
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c      |   423 +
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |    25 -
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |    10 -
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      |     9 -
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    |    10 -
 drivers/gpu/drm/panel/panel-simple.c               |    82 +
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |   125 +-
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c      |     9 -
 .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c |    18 -
 .../gpu/drm/panel/panel-startek-kd070fhfid015.c    |    11 -
 drivers/gpu/drm/panel/panel-tpo-tpg110.c           |     2 +
 drivers/gpu/drm/panel/panel-truly-nt35597.c        |    20 -
 drivers/gpu/drm/panel/panel-visionox-r66451.c      |    16 -
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |     8 -
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c    |     9 -
 drivers/gpu/drm/panfrost/Makefile                  |     2 +
 drivers/gpu/drm/panfrost/panfrost_debugfs.c        |    21 +
 drivers/gpu/drm/panfrost/panfrost_debugfs.h        |    14 +
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |     8 +
 drivers/gpu/drm/panfrost/panfrost_devfreq.h        |     3 +
 drivers/gpu/drm/panfrost/panfrost_device.c         |     2 +
 drivers/gpu/drm/panfrost/panfrost_device.h         |    13 +
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    60 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c            |    30 +
 drivers/gpu/drm/panfrost/panfrost_gem.h            |     5 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |    45 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.h            |     4 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |    29 +-
 drivers/gpu/drm/panfrost/panfrost_job.h            |     5 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |     5 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h           |     5 +
 drivers/gpu/drm/pl111/pl111_drv.c                  |     7 +
 drivers/gpu/drm/qxl/qxl_drv.c                      |     7 +
 drivers/gpu/drm/radeon/evergreen.c                 |     7 +-
 drivers/gpu/drm/radeon/pptable.h                   |     2 +-
 drivers/gpu/drm/radeon/radeon.h                    |     4 -
 drivers/gpu/drm/radeon/radeon_connectors.c         |     2 +
 drivers/gpu/drm/radeon/radeon_drv.c                |     2 -
 drivers/gpu/drm/radeon/radeon_fence.c              |   111 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |    16 -
 drivers/gpu/drm/radeon/radeon_ttm.c                |     2 -
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c   |     6 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |    17 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |    23 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |     2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    60 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |     1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |   122 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |     3 -
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |     2 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |    57 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |   121 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |    18 +-
 drivers/gpu/drm/scheduler/sched_main.c             |    74 +-
 drivers/gpu/drm/solomon/Kconfig                    |    12 +-
 drivers/gpu/drm/solomon/ssd130x-i2c.c              |    18 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c              |    27 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |   728 +-
 drivers/gpu/drm/solomon/ssd130x.h                  |    21 +-
 drivers/gpu/drm/sti/sti_drv.c                      |     7 +
 drivers/gpu/drm/stm/drv.c                          |     7 +
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |     6 +
 drivers/gpu/drm/tegra/dc.c                         |     9 +-
 drivers/gpu/drm/tegra/drm.h                        |     3 -
 drivers/gpu/drm/tegra/dsi.c                        |     1 +
 drivers/gpu/drm/tegra/gem.c                        |    32 +-
 drivers/gpu/drm/tegra/hdmi.c                       |     3 +-
 drivers/gpu/drm/tegra/hub.c                        |     2 +-
 drivers/gpu/drm/tegra/rgb.c                        |    16 +-
 drivers/gpu/drm/tegra/sor.c                        |     1 +
 drivers/gpu/drm/tests/drm_format_helper_test.c     |  1097 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    11 +-
 drivers/gpu/drm/tiny/bochs.c                       |     6 +
 drivers/gpu/drm/tiny/cirrus.c                      |     6 +
 drivers/gpu/drm/tiny/repaper.c                     |     2 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |   105 +
 drivers/gpu/drm/tve200/tve200_drv.c                |     7 +
 drivers/gpu/drm/v3d/v3d_drv.h                      |     2 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |     5 +
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    10 +
 drivers/gpu/drm/vc4/vc4_drv.c                      |    36 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |     2 +-
 drivers/gpu/drm/vc4/vc4_regs.h                     |     2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |     9 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |     6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |     6 +-
 drivers/gpu/host1x/channel.c                       |    26 +
 drivers/gpu/host1x/channel.h                       |     4 +
 drivers/gpu/host1x/context.c                       |     4 +-
 drivers/gpu/host1x/dev.c                           |    32 +-
 drivers/gpu/host1x/dev.h                           |     3 +-
 drivers/gpu/host1x/hw/intr_hw.c                    |    46 +-
 drivers/hid/Kconfig                                |     8 +-
 drivers/hid/hid-picolcd_fb.c                       |    73 +-
 drivers/media/cec/core/cec-adap.c                  |     5 +
 drivers/media/cec/core/cec-notifier.c              |     5 +
 drivers/staging/fbtft/Kconfig                      |     6 +-
 drivers/staging/fbtft/fbtft-core.c                 |    99 +-
 drivers/usb/typec/altmodes/displayport.c           |    20 +-
 drivers/video/fbdev/68328fb.c                      |     5 +-
 drivers/video/fbdev/Kconfig                        |   128 +-
 drivers/video/fbdev/Makefile                       |    17 +-
 drivers/video/fbdev/amba-clcd.c                    |     5 +-
 drivers/video/fbdev/amifb.c                        |     2 +
 drivers/video/fbdev/arkfb.c                        |     2 +
 drivers/video/fbdev/atafb.c                        |     2 +
 drivers/video/fbdev/aty/atyfb_base.c               |     3 +
 drivers/video/fbdev/aty/radeon_base.c              |     2 +
 drivers/video/fbdev/au1100fb.c                     |     8 +-
 drivers/video/fbdev/au1200fb.c                     |     9 -
 drivers/video/fbdev/bw2.c                          |    17 +-
 drivers/video/fbdev/cg14.c                         |    19 +-
 drivers/video/fbdev/cg3.c                          |    17 +-
 drivers/video/fbdev/cg6.c                          |    17 +-
 drivers/video/fbdev/cirrusfb.c                     |     2 +
 drivers/video/fbdev/cobalt_lcdfb.c                 |     2 +
 drivers/video/fbdev/controlfb.c                    |     5 +-
 drivers/video/fbdev/core/Kconfig                   |    12 +
 drivers/video/fbdev/core/Makefile                  |     5 +-
 drivers/video/fbdev/core/fb_chrdev.c               |     3 +-
 drivers/video/fbdev/core/fb_internal.h             |    17 +
 drivers/video/fbdev/core/fb_io_fops.c              |     3 +
 drivers/video/fbdev/core/fb_logo.c                 |   508 +
 drivers/video/fbdev/core/fbcon.c                   |     2 +
 drivers/video/fbdev/core/fbmem.c                   |   542 +-
 drivers/video/fbdev/cyber2000fb.c                  |     2 +
 drivers/video/fbdev/dnfb.c                         |     2 +
 drivers/video/fbdev/ep93xx-fb.c                    |     5 +-
 drivers/video/fbdev/ffb.c                          |    17 +-
 drivers/video/fbdev/gbefb.c                        |     7 +-
 drivers/video/fbdev/hgafb.c                        |     2 +
 drivers/video/fbdev/hitfb.c                        |     4 +-
 drivers/video/fbdev/hpfb.c                         |     2 +
 drivers/video/fbdev/hyperv_fb.c                    |    48 +-
 drivers/video/fbdev/i810/i810_main.c               |     2 +
 drivers/video/fbdev/imsttfb.c                      |     2 +
 drivers/video/fbdev/intelfb/intelfbdrv.c           |     4 +-
 drivers/video/fbdev/leo.c                          |    19 +-
 drivers/video/fbdev/matrox/matroxfb_base.c         |     2 +
 drivers/video/fbdev/matrox/matroxfb_crtc2.c        |     4 +-
 drivers/video/fbdev/mmp/fb/mmpfb.c                 |     7 -
 drivers/video/fbdev/neofb.c                        |     2 +
 drivers/video/fbdev/nvidia/nvidia.c                |     2 +
 drivers/video/fbdev/omap2/omapfb/Kconfig           |     4 +-
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c     |     5 +-
 drivers/video/fbdev/p9100.c                        |    18 +-
 drivers/video/fbdev/pm2fb.c                        |     2 +
 drivers/video/fbdev/pm3fb.c                        |     2 +
 drivers/video/fbdev/pvr2fb.c                       |    14 +-
 drivers/video/fbdev/riva/fbdev.c                   |     2 +
 drivers/video/fbdev/s1d13xxxfb.c                   |    25 +-
 drivers/video/fbdev/s3fb.c                         |     2 +
 drivers/video/fbdev/sa1100fb.c                     |     5 +-
 drivers/video/fbdev/savage/savagefb_driver.c       |     6 +-
 drivers/video/fbdev/sbuslib.h                      |    37 +-
 drivers/video/fbdev/sis/sis_main.c                 |     4 +-
 drivers/video/fbdev/sm501fb.c                      |     4 +
 drivers/video/fbdev/sm712fb.c                      |     1 +
 drivers/video/fbdev/smscufx.c                      |    85 +-
 drivers/video/fbdev/stifb.c                        |     2 +
 drivers/video/fbdev/sunxvr500.c                    |     2 +
 drivers/video/fbdev/tcx.c                          |    20 +-
 drivers/video/fbdev/tdfxfb.c                       |     6 +-
 drivers/video/fbdev/tgafb.c                        |     2 +
 drivers/video/fbdev/tridentfb.c                    |     2 +
 drivers/video/fbdev/udlfb.c                        |    89 +-
 drivers/video/fbdev/vermilion/vermilion.c          |     5 +-
 drivers/video/fbdev/vga16fb.c                      |     2 +
 drivers/video/fbdev/via/viafbdev.c                 |     2 +
 drivers/video/fbdev/vt8623fb.c                     |     2 +
 include/asm-generic/fb.h                           |    12 +-
 include/drm/bridge/dw_mipi_dsi.h                   |    16 +
 include/drm/bridge/samsung-dsim.h                  |     6 +-
 include/drm/display/drm_dp_helper.h                |    18 +-
 include/drm/display/drm_dp_mst_helper.h            |    23 +-
 include/drm/drm_accel.h                            |     9 +-
 include/drm/drm_atomic.h                           |     2 +-
 include/drm/drm_bridge.h                           |     6 +-
 include/drm/drm_buddy.h                            |     6 +-
 include/drm/drm_client.h                           |     2 +-
 include/drm/drm_connector.h                        |    17 +-
 include/drm/drm_debugfs.h                          |    13 +-
 include/drm/drm_device.h                           |    14 +-
 include/drm/drm_drv.h                              |     8 +
 include/drm/drm_edid.h                             |     1 +
 include/drm/drm_file.h                             |    17 +-
 include/drm/drm_fourcc.h                           |     5 +-
 include/drm/drm_framebuffer.h                      |     5 -
 include/drm/drm_gem.h                              |     9 +
 include/drm/{drm_gpuva_mgr.h =3D> drm_gpuvm.h}       |   157 +-
 include/drm/gpu_scheduler.h                        |     9 +-
 include/drm/i915_pciids.h                          |    26 +-
 include/linux/fb.h                                 |     5 -
 .../common =3D> include/linux/habanalabs}/cpucp_if.h |    36 +-
 .../linux/habanalabs}/hl_boot_if.h                 |     7 +
 include/linux/iosys-map.h                          |     4 +-
 include/linux/string.h                             |    40 +
 include/trace/events/habanalabs.h                  |    45 +-
 include/uapi/drm/amdgpu_drm.h                      |    36 +-
 include/uapi/drm/drm.h                             |    20 +
 include/uapi/drm/drm_fourcc.h                      |     2 +
 include/uapi/drm/drm_mode.h                        |    16 +-
 include/uapi/drm/habanalabs_accel.h                |    68 +-
 include/uapi/drm/i915_drm.h                        |     8 +-
 include/uapi/drm/ivpu_accel.h                      |    18 +-
 include/uapi/drm/qaic_accel.h                      |    24 +-
 include/uapi/linux/kfd_ioctl.h                     |     3 +
 kernel/kexec.c                                     |     2 +-
 kernel/watch_queue.c                               |     2 +-
 1476 files changed, 295674 insertions(+), 20092 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
 create mode 100644
Documentation/devicetree/bindings/display/lvds-data-mapping.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
 create mode 100644
Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
 create mode 100644
Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
 create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
 create mode 100644 Documentation/gpu/implementation_guidelines.rst
 create mode 100644 Documentation/gpu/panfrost.rst
 create mode 100644 Documentation/userspace-api/dma-buf-alloc-exchange.rst
 delete mode 100644 drivers/accel/ivpu/TODO
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/df_v4_6_2.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/df_v4_6_2.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vpe_6_1_fw_if.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vpe_v6_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vpe_v6_1.h
 rename drivers/gpu/drm/amd/display/dc/{dml/calcs =3D> basics}/bw_fixed.c (=
94%)
 rename drivers/gpu/drm/amd/display/dc/{dml/calcs =3D>
basics}/calcs_logger.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml/calcs =3D>
basics}/custom_float.c (66%)
 rename drivers/gpu/drm/amd/display/dc/{dml/calcs =3D> basics}/dce_calcs.c =
(100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_=
mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_=
mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.=
c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.=
h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.c
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_link_encoder.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_link_encoder.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_stream_encoder.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_stream_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dpp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dpp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dsc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dsc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dwb.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dwb.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_init.c
 rename drivers/gpu/drm/amd/display/dc/{link/accessories/link_fpga.h
=3D> dcn35/dcn35_init.h} (85%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_mmhubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_mmhubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_opp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_opp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/cmntypes.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/display_mode_core_structs.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/display_mode_lib_defines.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mg=
mt.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mg=
mt.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_types.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_internal_types=
.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml_assert.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml_depedencies.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml_display_rq_dlg_calc.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml_display_rq_dlg_calc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml_logging.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dce/dce_hwseq.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dce/dce_hwseq.h (98%)
 rename drivers/gpu/drm/amd/display/dc/{dce100/dce100_hw_sequencer.c
=3D> hwss/dce100/dce100_hwseq.c} (98%)
 rename drivers/gpu/drm/amd/display/dc/{dce100/dce100_hw_sequencer.h
=3D> hwss/dce100/dce100_hwseq.h} (100%)
 rename drivers/gpu/drm/amd/display/dc/{dce110/dce110_hw_sequencer.c
=3D> hwss/dce110/dce110_hwseq.c} (99%)
 rename drivers/gpu/drm/amd/display/dc/{dce110/dce110_hw_sequencer.h
=3D> hwss/dce110/dce110_hwseq.h} (100%)
 rename drivers/gpu/drm/amd/display/dc/{dce112/dce112_hw_sequencer.c
=3D> hwss/dce112/dce112_hwseq.c} (98%)
 rename drivers/gpu/drm/amd/display/dc/{dce112/dce112_hw_sequencer.h
=3D> hwss/dce112/dce112_hwseq.h} (100%)
 rename drivers/gpu/drm/amd/display/dc/{dce120/dce120_hw_sequencer.c
=3D> hwss/dce120/dce120_hwseq.c} (98%)
 rename drivers/gpu/drm/amd/display/dc/{dce120/dce120_hw_sequencer.h
=3D> hwss/dce120/dce120_hwseq.h} (100%)
 rename drivers/gpu/drm/amd/display/dc/{dce80/dce80_hw_sequencer.c =3D>
hwss/dce80/dce80_hwseq.c} (94%)
 rename drivers/gpu/drm/amd/display/dc/{dce80/dce80_hw_sequencer.h =3D>
hwss/dce80/dce80_hwseq.h} (100%)
 rename drivers/gpu/drm/amd/display/dc/{dcn10/dcn10_hw_sequencer.c =3D>
hwss/dcn10/dcn10_hwseq.c} (99%)
 rename drivers/gpu/drm/amd/display/dc/{dcn10/dcn10_hw_sequencer.h =3D>
hwss/dcn10/dcn10_hwseq.h} (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn20/dcn20_hwseq.c (96=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn20/dcn20_hwseq.h (97=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn201/dcn201_hwseq.c (=
99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn201/dcn201_hwseq.h (=
100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn21/dcn21_hwseq.c (99=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn21/dcn21_hwseq.h (10=
0%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn30/dcn30_hwseq.c (95=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn30/dcn30_hwseq.h (98=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn301/dcn301_hwseq.c (=
100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn301/dcn301_hwseq.h (=
100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn302/dcn302_hwseq.c (=
100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn302/dcn302_hwseq.h (=
100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn303/dcn303_hwseq=
.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn303/dcn303_hwseq=
.h
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn31/dcn31_hwseq.c (97=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn31/dcn31_hwseq.h (10=
0%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn314/dcn314_hwseq.c (=
99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn314/dcn314_hwseq.h (=
100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn32/dcn32_hwseq.c (91=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn32/dcn32_hwseq.h (92=
%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h
 rename drivers/gpu/drm/amd/display/dc/{inc =3D> hwss}/hw_sequencer.h (93%)
 rename drivers/gpu/drm/amd/display/dc/{inc =3D>
hwss}/hw_sequencer_private.h (98%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/hw/pg_cntl.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dc=
n35.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dc=
n35.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/link/accessories/link_fp=
ga.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_5_0_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_5_0_sh_m=
ask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_5_0_offse=
t.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_5_0_sh_ma=
sk.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_3_3_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_3_3_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_14_0_0_offse=
t.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_14_0_0_sh_ma=
sk.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_11_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_11_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/umc/umc_12_0_0_off=
set.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/umc/umc_12_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_4_0_5_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_4_0_5_sh_m=
ask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vpe/vpe_6_1_0_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vpe/vpe_6_1_0_sh_m=
ask.h
 create mode 100644 drivers/gpu/drm/amd/include/ivsrcid/vpe/irqsrcs_vpe_6_1=
.h
 create mode 100644 drivers/gpu/drm/amd/include/umsch_mm_4_0_api_def.h
 create mode 100644
drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_pm=
fw.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_pp=
smc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu14/Makefile
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.h
 create mode 100644 drivers/gpu/drm/ast/ast_reg.h
 create mode 100644 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/requirements.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
 create mode 100755 drivers/gpu/drm/ci/xfails/update-xfails.py
 delete mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt
 rename drivers/gpu/drm/{drm_gpuva_mgr.c =3D> drm_gpuvm.c} (78%)
 create mode 100644 drivers/gpu/drm/i915/display/intel_color_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_wa.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_wa.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_link_bw.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_link_bw.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
 create mode 100644 drivers/gpu/drm/msm/msm_kms.c
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
 create mode 100644 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
 create mode 100644 drivers/gpu/drm/panel/panel-raydium-rm692e5.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
 create mode 100644 drivers/video/fbdev/core/fb_logo.c
 rename include/drm/{drm_gpuva_mgr.h =3D> drm_gpuvm.h} (78%)
 rename {drivers/accel/habanalabs/include/common =3D>
include/linux/habanalabs}/cpucp_if.h (98%)
 rename {drivers/accel/habanalabs/include/common =3D>
include/linux/habanalabs}/hl_boot_if.h (98%)
