Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048244E605C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 09:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE58E10E85A;
	Thu, 24 Mar 2022 08:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BA510E0E4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 02:30:17 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id h1so4034828edj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=ByAkedaj5S2L82eqlteJLljF8NeIZBTqckN1YVAUR/U=;
 b=ECn4K2rj2aQUYTHsfDeGU3kbcm38z0KZlW/QyWBA3YrcQN4KZTVP3TgMWT9tKIbAbc
 P4enwknMSbFndVF+p8m99rMaLMaSDpVoer/7piJnaFTjMFRWoDndRNBaWoLbjwRW/Vk9
 Yz7tbQYo3SEWDyt8wKNUHMPItGAPbkg/gEJIAbjFaQmToVQrTw7TvC6qRRemuB5kH3ux
 E+LBWmaE6gzrUXLT3OILAVU6DoCYWBVufI5oPejPioMO2sA8MjXTBnCcxdlDmImKc301
 ynaEnhN6SmIfIGO8Jh+lP4EimgL9MttBMLrc8FuZcUGS27m7OD6tu91H21QjQoJ2AvzZ
 rD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=ByAkedaj5S2L82eqlteJLljF8NeIZBTqckN1YVAUR/U=;
 b=Kx/Ehdp5U5Nh8Y8tLo4SW4P47YWp77NcleW6G1IM3b77oNp4HjtNC9bHTEKS8aD2gy
 Fgn3AHiec9J2/DtEZkAp6jjrdZt/Iwj0Bl8Gp3B3Z59rVLIVzm2PwKh2u1FU5aIwJ711
 HTv+ryW17P7PH/Z7NLMyrv3HOQk8A2B2lB4yC7G4SgJ11ZP0K74UvS3HVrvW6q0vXczp
 T39QrzwAkEombRGntEhLKAI/e336ME3lnYtKCOpGL4swET0p/iezZoqRK+wMXV7O0YsM
 PgjTlsiCB/OTXQwDLYG93pDNdHVfeZTuJQd/IlFlX6KiN9pXZJCEUdsTqTO88E1n6aGv
 Bp3A==
X-Gm-Message-State: AOAM530PDudvXD3yPNTP/cFXzvpAZ84FPp8bmvWLmqsEV8WIK+XmG1l3
 rdWInoBHoHcO4yeCzEsMSa2ecabi60WvijEFRpc=
X-Google-Smtp-Source: ABdhPJzVZhTVqIWpP2XhM8W320VkQrJfqMO5nHbtCimP2uyXtOdccJYc6G7/grguabgt5Os1Y0g6pq7n9OZa39UivE4=
X-Received: by 2002:a05:6402:847:b0:419:7fb0:9e29 with SMTP id
 b7-20020a056402084700b004197fb09e29mr3957953edz.45.1648089014875; Wed, 23 Mar
 2022 19:30:14 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 24 Mar 2022 12:30:02 +1000
Message-ID: <CAPM=9tytg5jd_i3z3C5Y1dii2-cgO11Gjgvaq8qoWn3CGfCreg@mail.gmail.com>
Subject: [git pull] drm for 5.18-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 24 Mar 2022 08:32:17 +0000
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

This is the main drm pull request for 5.18.

The summary changelog is below, lots of work all over,
Intel improving DG2 support, amdkfd CRIU support, msm
new hw support, and faster fbdev support.

Conflicts:
I did a merge into your tree this morning, couple of Kconfig
clashes, drm_cache.c needs an ioport.h include to avoid a build
fail due to other header refactoring. I think you should be able
to handle it.

External interactions:
- dma-buf-map gets renamed to iosys-map
- this adds a yes/no helper to the strings helpers, and it's used
  in some other code.
- platform driver for chromeos privacy screen

Let me know if there are any issues.

Regards,
Dave.

drm-next-2022-03-24:
drm for 5.18-rc1

dma-buf:
- rename dma-buf-map to iosys-map

core:
- move buddy allocator to core
- add pci/platform init macros
- improve EDID parser deep color handling
- EDID timing type 7 support
- add GPD Win Max quirk
- add yes/no helpers to string_helpers
- flatten syncobj chains
- add nomodeset support to lots of drivers
- improve fb-helper clipping support
- add default property value interface

fbdev:
- improve fbdev ops speed

ttm:
- add a backpointer from ttm bo->ttm resource

dp:
- move displayport headers
- add a dp helper module

bridge:
- anx7625 atomic support, HDCP support

panel:
- split out panel-lvds and lvds bindings
- find panels in OF subnodes

privacy:
- add chromeos privacy screen support

fb:
- hot unplug fw fb on forced removal

simpledrm:
- request region instead of marking ioresource busy
- add panel oreintation property

udmabuf:
- fix oops with 0 pages

amdgpu:
- power management code cleanup
- Enable freesync video mode by default
- RAS code cleanup
- Improve VRAM access for debug using SDMA
- SR-IOV rework special register access and fixes
- profiling power state request ioctl
- expose IP discovery via sysfs
- Cyan skillfish updates
- GC 10.3.7, SDMA 5.2.7, DCN 3.1.6 updates
- expose benchmark tests via debugfs
- add module param to disable XGMI for testing
- GPU reset debugfs register dumping support

amdkfd:
- CRIU support
- SDMA queue fixes

radeon:
- UVD suspend fix
- iMac backlight fix

i915:
- minimal parallel submission for execlists
- DG2-G12 subplatform added
- DG2 programming workarounds
- DG2 accelerated migration support
- flat CCS and CCS engine support for XeHP
- initial small BAR support
- drop fake LMEM support
- ADL-N PCH support
- bigjoiner updates
- introduce VMA resources and async unbinding
- register definitions cleanups
- multi-FBC refactoring
- DG1 OPROM over SPI support
- ADL-N platform enabling
- opregion mailbox #5 support
- DP MST ESI improvements
- drm device based logging
- async flip optimisation for DG2
- CPU arch abstraction fixes
- improve GuC ADS init to work on aarch64
- tweak TTM LRU priority hint
- GuC 69.0.3 support
- remove short term execbuf pins

nouveau:
- higher DP/eDP bitrates
- backlight fixes

msm:
- dpu + dp support for sc8180x
- dp support for sm8350
- dpu + dsi support for qcm2290
- 10nm dsi phy tuning support
- bridge support for dp encoder
- gpu support for additional 7c3 SKUs

ingenic:
- HDMI support for JZ4780
- aux channel EDID support

ast:
- AST2600 support
- add wide screen support
- create DP/DVI connectors

omapdrm:
- fix implicit dma_buf fencing

vc4:
- add CSC + full range support
- better display firmware handoff

panfrost:
- add initial dual-core GPU support

stm:
- new revision support
- fb handover support

mediatek:
- transfer display binding document to yaml format.
- add mt8195 display device binding.
- allow commands to be sent during video mode.
- add wait_for_event for crtc disable by cmdq.

tegra:
- YUV format support

rcar-du:
- LVDS support for M3-W+ (R8A77961)

exynos:
- BGR pixel format for FIMD device
The following changes since commit 7e57714cd0ad2d5bb90e50b5096a0e671dec1ef3=
:

  Linux 5.17-rc6 (2022-02-27 14:36:33 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-03-24

for you to fetch changes up to c6e90a1c660874736bd09c1fec6312b4b4c2ff7b:

  Merge tag 'amd-drm-next-5.18-2022-03-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-03-21
13:48:20 +1000)

----------------------------------------------------------------
drm for 5.18-rc1

dma-buf:
- rename dma-buf-map to iosys-map

core:
- move buddy allocator to core
- add pci/platform init macros
- improve EDID parser deep color handling
- EDID timing type 7 support
- add GPD Win Max quirk
- add yes/no helpers to string_helpers
- flatten syncobj chains
- add nomodeset support to lots of drivers
- improve fb-helper clipping support
- add default property value interface

fbdev:
- improve fbdev ops speed

ttm:
- add a backpointer from ttm bo->ttm resource

dp:
- move displayport headers
- add a dp helper module

bridge:
- anx7625 atomic support, HDCP support

panel:
- split out panel-lvds and lvds bindings
- find panels in OF subnodes

privacy:
- add chromeos privacy screen support

fb:
- hot unplug fw fb on forced removal

simpledrm:
- request region instead of marking ioresource busy
- add panel oreintation property

udmabuf:
- fix oops with 0 pages

amdgpu:
- power management code cleanup
- Enable freesync video mode by default
- RAS code cleanup
- Improve VRAM access for debug using SDMA
- SR-IOV rework special register access and fixes
- profiling power state request ioctl
- expose IP discovery via sysfs
- Cyan skillfish updates
- GC 10.3.7, SDMA 5.2.7, DCN 3.1.6 updates
- expose benchmark tests via debugfs
- add module param to disable XGMI for testing
- GPU reset debugfs register dumping support

amdkfd:
- CRIU support
- SDMA queue fixes

radeon:
- UVD suspend fix
- iMac backlight fix

i915:
- minimal parallel submission for execlists
- DG2-G12 subplatform added
- DG2 programming workarounds
- DG2 accelerated migration support
- flat CCS and CCS engine support for XeHP
- initial small BAR support
- drop fake LMEM support
- ADL-N PCH support
- bigjoiner updates
- introduce VMA resources and async unbinding
- register definitions cleanups
- multi-FBC refactoring
- DG1 OPROM over SPI support
- ADL-N platform enabling
- opregion mailbox #5 support
- DP MST ESI improvements
- drm device based logging
- async flip optimisation for DG2
- CPU arch abstraction fixes
- improve GuC ADS init to work on aarch64
- tweak TTM LRU priority hint
- GuC 69.0.3 support
- remove short term execbuf pins

nouveau:
- higher DP/eDP bitrates
- backlight fixes

msm:
- dpu + dp support for sc8180x
- dp support for sm8350
- dpu + dsi support for qcm2290
- 10nm dsi phy tuning support
- bridge support for dp encoder
- gpu support for additional 7c3 SKUs

ingenic:
- HDMI support for JZ4780
- aux channel EDID support

ast:
- AST2600 support
- add wide screen support
- create DP/DVI connectors

omapdrm:
- fix implicit dma_buf fencing

vc4:
- add CSC + full range support
- better display firmware handoff

panfrost:
- add initial dual-core GPU support

stm:
- new revision support
- fb handover support

mediatek:
- transfer display binding document to yaml format.
- add mt8195 display device binding.
- allow commands to be sent during video mode.
- add wait_for_event for crtc disable by cmdq.

tegra:
- YUV format support

rcar-du:
- LVDS support for M3-W+ (R8A77961)

exynos:
- BGR pixel format for FIMD device

----------------------------------------------------------------
Aaron Liu (4):
      drm/amdgpu: convert code name to ip version for athub
      drm/amdgpu: add 1.3.1/2.4.0 athub CG support
      drm/amdgpu: add utcl2_harvest to gc 10.3.1
      drm/amdgpu: check the GART table before invalidating TLB

Abdiel Janulgue (1):
      drm/i915/lmem: Enable lmem for platforms with Flat CCS

Agustin Gutierrez (1):
      drm/amd/display: Update watermark values for DCN301

Akhil P Oommen (4):
      drm/msm: Use generic name for gpu resources
      drm/msm/adreno: Generate name from chipid for 7c3
      drm/msm/a6xx: Add support for 7c3 SKUs
      drm/msm/adreno: Expose speedbin to userspace

Alex Bee (1):
      dt-bindings: gpu: mali-bifrost: describe clocks for the rk356x gpu

Alex Deucher (44):
      drm/amdgpu/swsmu: make sienna cichlid function static
      drm/amdgpu/pm: move additional logic into
amdgpu_dpm_force_performance_level
      drm/amdgpu: invert the logic in amdgpu_device_should_recover_gpu()
      drm/amdgpu: don't do resets on APUs which don't support it
      drm/amdgpu: drop flags check for CHIP_IP_DISCOVERY
      drm/amdgpu: filter out radeon secondary ids as well
      drm/amdgpu/display: adjust msleep limit in
dp_wait_for_training_aux_rd_interval
      drm/amdgpu/display: use msleep rather than udelay for long delays
      drm/amdgpu/pm/smu7: drop message about VI performance levels
      drm/amdgpu: set APU flag based on IP discovery table
      drm/amdgpu: move PX checking into amdgpu_device_ip_early_init
      drm/amdgpu: move runtime pm init after drm and fbdev init
      drm/amdgpu: handle BACO synchronization with secondary funcs
      drm/amdgpu: convert amdgpu_display_supported_domains() to IP versions
      drm/amdgpu/swsmu/i2c: return an error if the SMU is not running
      drm/amdgpu/UAPI: add new CTX OP to get/set stable pstates
      drm/amdgpu: bump driver version for new CTX OP to set/get stable psta=
tes
      drm/amdgpu: drop experimental flag on aldebaran
      drm/amdgpu/display: change pipe policy for DCN 2.0
      drm/amdgpu: add missing license to dpcs_3_0_0 headers
      drm/amdgpu: move dpcs_3_0_0 headers from dcn to dpcs
      drm/amdgpu: move dpcs_3_0_3 headers from dcn to dpcs
      drm/amdgpu/sdma5.2: Adjust the name string for firmware
      drm/amdgpu: make cyan skillfish support code more consistent
      drm/amdgpu/smu11.5: restore cclks in vangogh_set_performance_level
      drm/amdkfd: make CRAT table missing message informational only
      drm/amdgpu/benchmark: use dev_info rather than DRM macros for logging
      drm/amdgpu: plumb error handling though amdgpu_benchmark()
      drm/amdgpu: print the selected benchmark test in the log
      drm/amdgpu: add a benchmark mutex
      drm/amdgpu: expose benchmarks via debugfs
      drm/amdgpu: drop benchmark module parameter
      drm/amdgpu: drop testing module parameter
      drm/amdgpu/display: split dmcu and gpuvm handling logic
      drm/amdgpu: derive GTT display support from DM
      drm/amdgpu: use kernel BO API for benchmark buffer management
      drm/amdgpu: use ktime rather than jiffies for benchmark results
      drm/amdgpu: fix typo in amdgpu_discovery.c
      drm/amdgpu: Use IP versions in convert_tiling_flags_to_modifier()
      drm/amdgpu: remove unused gpu_info firmwares
      drm/amdgpu/gfx10: drop unused cyan skillfish firmware
      drm/amdgpu/sdma5: drop unused cyan skillfish firmware
      drm/amdgpu/display: enable scatter/gather display for DCN 3.1.6
      drm/amdgpu: only check for _PR3 on dGPUs

Alex Sierra (2):
      drm/amdkfd: replace err by dbg print at svm vram migration
      drm/amdgpu: Add use_xgmi_p2p module parameter

Alexander Stein (4):
      drm/bridge: ti-sn65dsi83: Make enable GPIO optional
      dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc supply bindings
      drm/bridge: ti-sn65dsi83: Add vcc supply regulator support
      drm: mxsfb: Use dev_err_probe() helper

Alexey Sheplyakov (1):
      drm/panfrost: initial dual core group GPUs support

Allen Chen (1):
      drm/bridge: add it6505 driver

Alvin Lee (1):
      drm/amd/display: Driver support for MCLK query tool

Alyssa Rosenzweig (4):
      drm/panfrost: Update create_bo flags comment
      drm/panfrost: Remove features meant for userspace
      drm/panfrost: Merge some feature lists
      drm/panfrost: Handle IDVS_GROUP_SIZE feature

Andi Shyti (2):
      drm/i915: Remove unused i915->ggtt
      drm/i915: fix header file inclusion for might_alloc()

Andrey Grodzovsky (16):
      drm/amdgpu: Introduce reset domain
      drm/amdgpu: Move scheduler init to after XGMI is ready
      drm/amdgpu: Serialize non TDR gpu recovery with TDRs
      drm/amd/virt: For SRIOV send GPU reset directly to TDR queue.
      drm/amdgpu: Drop hive->in_reset
      drm/amdgpu: Drop concurrent GPU reset protection for device
      drm/amdgpu: Rework reset domain to be refcounted.
      drm/amdgpu: Move reset sem into reset_domain
      drm/amdgpu: Move in_gpu_reset into reset_domain
      drm/amdgpu: Rework amdgpu_device_lock_adev
      drm/amdgpu: Revert 'drm/amdgpu: annotate a false positive
recursive locking'
      drm/amdgpu: Fix compile error.
      drm/amdgpu: Fix htmldoc warning
      drm/amdgpu: Exclude PCI reset method for now.
      drm/amdgpu: Fix sigsev when accessing MMIO on hot unplug.
      drm/amdgpu: Bump minor version for hot plug tests enabling.

Andy Shevchenko (1):
      drm/i915/dsi: Drop double check ACPI companion device for NULL

AngeloGioacchino Del Regno (6):
      drm/bridge: parade-ps8640: Link device to ensure suspend/resume order
      drm/msm/dpu1: Add DMA2, DMA3 clock control to enum
      drm/msm/dpu1: Add MSM8998 to hw catalog
      dt-bindings: display: msm: Add binding for msm8998 dpu
      drm/msm/dpu: Add a function to retrieve the current CTL status
      drm/msm/dpu: Fix timeout issues on command mode panels

Anisse Astier (2):
      drm/i915/opregion: add support for mailbox #5 EDID
      drm: Add orientation quirk for GPD Win Max

Anthony Koo (8):
      drm/amd/display: [FW Promotion] Release 0.0.100.0
      drm/amd/display: [FW Promotion] Release 0.0.101.0
      drm/amd/display: [FW Promotion] Release 0.0.102.0
      drm/amd/display: [FW Promotion] Release 0.0.103.0
      drm/amd/display: [FW Promotion] Release 0.0.104.0
      drm/amd/display: [FW Promotion] Release 0.0.106.0
      drm/amd/display: [FW Promotion] Release 0.0.107.0
      drm/amd/display: [FW Promotion] Release 0.0.108.0

Antonio Borneo (3):
      drm/stm: dsi: move lane capability detection in probe()
      drm/bridge/synopsys: dsi: extend the prototype of mode_valid()
      drm/stm: dsi: provide the implementation of mode_valid()

Anusha Srivatsa (1):
      drm/i915/rpl-s: Add stepping info

Aric Cyr (11):
      drm/amd/display: 3.2.168
      drm/amd/display: 3.2.169
      drm/amd/display: 3.2.170
      drm/amd/display: Remove unnecessary function definition
      drm/amd/display: 3.2.171
      drm/amd/display: 3.2.172
      drm/amd/display: 3.2.173
      drm/amd/display: 3.2.174
      drm/amd/display: 3.2.175
      drm/amd/display: 3.2.176
      drm/amd/display: 3.2.177

Arunpravin (11):
      drm: move the buddy allocator from i915 into common drm
      drm: improve drm_buddy_alloc function
      drm: implement top-down allocation method
      drm: implement a method to free unused pages
      drm/selftests: Move i915 buddy selftests into drm
      drm/selftests: add drm buddy alloc limit testcase
      drm/selftests: add drm buddy alloc range testcase
      drm/selftests: add drm buddy optimistic testcase
      drm/selftests: add drm buddy pessimistic testcase
      drm/selftests: add drm buddy smoke testcase
      drm/selftests: add drm buddy pathological testcase

Aun-Ali Zaidi (1):
      drm/amd/display: Force link_rate as LINK_RATE_RBR2 for 2018 15"
Apple Retina panels

Bas Nieuwenhuizen (4):
      drm/amd/display: Fix FP start/end for dcn30_internal_validate_bw.
      drm/amd/display: Wrap dcn301_calculate_wm_and_dlg for FPU.
      drm/amdgpu/display: Remove t_srx_delay_us.
      drm/amd/display: Protect update_bw_bounding_box FPU code.

Becle Lee (1):
      drm/amd/display: Wait for hubp read line for Pollock

Ben Skeggs (8):
      drm/nouveau/disp: remove some remnant of a rework
      drm/nouveau/disp/dp: explicitly control scrambling when setting patte=
rn
      drm/nouveau/disp/dp: generate supported link rates table at detect ti=
me
      drm/nouveau/disp/dp: add support for tps4
      drm/nouveau/disp/dp: fixup cr/eq delays for 1.4
      drm/nouveau/disp/dp: add support for lttprs
      drm/nouveau/disp/dp: add support for hbr3
      drm/nouveau/disp/dp: add support for eDP link rates

Bing Guo (1):
      drm/amdgpu/display/dc: do blocked MST topology discovery at
resume from S3/S4

Bjorn Andersson (5):
      drm/msm/dp: Move debugfs files into subdirectory
      drm/msm/dp: Add sc8180x DP controllers
      drm/msm/dp: Add DisplayPort controller for SM8350
      drm/msm/dpu: Add INTF_5 interrupts
      drm/msm/dpu: Only create debugfs for PRIMARY minor

Bokun Zhang (1):
      drm/amdgpu: Add interface to load SRIOV cap FW

Boyuan Zhang (2):
      drm/amdgpu/vcn: add vcn support for vcn 3.1.2
      drm/amdgpu: enable vcn pg and cg for vcn 3.1.2

Bruce Chang (1):
      drm/i915/dg2: Add Wa_22011100796

CHANDAN VURDIGERE NATARAJ (1):
      drm/amdgpu: Enable recovery on yellow carp

CQ Tang (1):
      drm/i915/xehpsdv: Add has_flat_ccs to device info

Cai Huoqing (1):
      drm/nouveau: Remove the unused header file nvif/list.h

Changcheng Deng (5):
      drm/amd/pm: Replace one-element array with flexible-array member
      drm/amdgpu: remove duplicate include in 'amdgpu_device.c'
      drm/amd/pm: remove duplicate include in 'arcturus_ppt.c'
      drm/amdkfd: Replace zero-length array with flexible-array member
      drm/msm: replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUT=
E

Charlene Liu (9):
      drm/amd/display: update dml to rev.99 and smu clk_table w/a
      drm/amd/display: make sure pipe power gating reach requested hw state
      drm/amd/display: add debug option to bypass ssinfo from bios.
      drm/amd/display: add verify_link_cap back for hdmi
      drm/amd/display: add debug option to bypass ssinfo from bios for dcn3=
15
      drm/amd/display: fix the clock source contruct for dcn315
      drm/amd/display: merge two duplicated clock_source_create
      drm/amd/display: enable dcn315/316 s0i2 support
      drm/amd/display: Add save/restore PANEL_PWRSEQ_REF_DIV2

Chen Gong (1):
      drm/amdgpu: do not enable asic reset for raven2

Chris Park (3):
      drm/amd/display: DCEFCLK DS on CLK init
      drm/amd/display: Reset VIC if HDMI_VIC is present
      drm/amd/display: Add NULL check

Christian K=C3=B6nig (36):
      drm/radeon: fix error handling in radeon_driver_open_kms
      drm/amdgpu: remove excl as shared workarounds
      dma-buf: drop excl_fence parameter from dma_resv_get_fences
      drm/amdgpu: remove gart.ready flag
      drm/radeon: use ttm_resource_manager_debug
      drm/amdgpu: use ttm_resource_manager_debug
      drm/ttm: add ttm_resource_fini v2
      drm/ttm: add back a reference to the bdev to the res manager
      drm/ttm: add a weak BO reference to the resource v3
      drm/vmwgfx: remove vmw_wait_dma_fence
      drm/amdgpu: fix logic inversion in check
      drm/amdgpu: lower BUG_ON into WARN_ON for AMDGPU_PL_PREEMPT
      drm/amdgpu: rework GART copy window handling
      drm/amdgpu: restructure amdgpu_fill_buffer v2
      drm/amdgpu: add some lockdep checks to the VM code
      drm/amdgpu: rename amdgpu_vm_bo_rmv to _del
      drm/amdgpu: move lockdep assert to the right place.
      drm/amdgpu: reserve the pd while cleaning up PRTs
      dma-buf: consolidate dma_fence subclass checking
      dma-buf: warn about dma_fence_array container rules v2
      dma-buf: Warn about dma_fence_chain container rules v2
      dma-buf: warn about containers in dma_resv object
      dma-buf: add dma_fence_chain_contained helper
      drm/amdgpu: use dma_fence_chain_contained
      drm/syncobj: flatten dma_fence_chains on transfer
      drm/ttm: fix resource manager size type and description
      drm/ttm: add common accounting to the resource mgr v3
      drm/amdgpu: remove GTT accounting v2
      drm/amdgpu: remove PL_PREEMPT accounting
      drm/amdgpu: remove VRAM accounting v2
      drm/radeon: remove resource accounting v2
      drm/amdgpu: install ctx entities with cmpxchg
      drm/amdgpu: header cleanup
      drm/amdgpu: use job and ib structures directly in CS parsers
      drm/amdgpu: properly embed the IBs into the job
      drm/amdgpu: initialize the vmid_wait with the stub fence

Christophe JAILLET (5):
      drm/bridge: sn65dsi83: Fix an error handling path in sn65dsi83_probe(=
)
      drm/bridge: lt9611: Fix an error handling path in lt9611_probe()
      drm/msm/dp: Simplify dp_debug_init() and dp_debug_get()
      gpu: host1x: Fix an error handling path in 'host1x_probe()'
      gpu: host1x: Fix a memory leak in 'host1x_remove()'

Chuansheng Liu (1):
      drm/i915/dg1: Update DMC_DEBUG3 register

Claudio Suarez (2):
      mock a drm_plane in igt_check_plane_state to make the test more robus=
t
      drm: fix error found in some cases after the patch d1af5cd86997

Clint Taylor (3):
      drm/i915/dg1: Read OPROM via SPI controller
      drm/i915/snps: vswing value refined for SNPS phys
      drm/i915/dg2: add Wa_14014947963

Colin Ian King (8):
      drm/bridge: adv7533: make array clock_div_by_lanes static const
      drm/vc4: remove redundant assignment of variable size
      i915: make array flex_regs static const
      video: fbdev: asiliantfb: remove redundant assignment to variable Fta=
rget
      video: fbdev: s3c-fb: remove redundant initialization of pointer bufs
      drm/radeon: remove redundant assignment to reg
      drm/amd/display: fix spelling mistake: synatpics -> synaptics
      drm/ssd130x: remove redundant initialization of pointer mode

Dale Zhao (2):
      drm/amd/display: Add signal type check when verify stream backends sa=
me
      drm/amd/display: Add new enum for EDID status

Dan Carpenter (6):
      drm/i915/overlay: Prevent divide by zero bugs in scaling
      drm/i915: delete shadow "ret" variable
      drm/amdkfd: CRIU fix a NULL vs IS_ERR() check
      drm/amdkfd: CRIU return -EFAULT for copy_to_user() failure
      drm/msm/adreno: fix cast in adreno_get_param()
      drm/amd/pm: fix indenting in __smu_cmn_reg_print_error()

Daniel Thompson (2):
      drm/msm/dsi: Remove spurious IRQF_ONESHOT flag
      drm/msm/hdmi: Remove spurious IRQF_ONESHOT flag

Daniel Vetter (4):
      drm/doc: overview before functions for drm_writeback.c
      drm/docs: Document where the C8 color lut is stored
      dma-resv: some doc polish for iterators
      drm/todo: Update panic handling todo

Daniele Ceraolo Spurio (6):
      drm/i915/wopcm: Handle pre-programmed WOPCM registers
      drm/i915/guc: Update guc shim control programming on newer platforms
      drm/i915/guc: Initialize GuC submission locks and queues early
      drm/i915/xehp: compute engine pipe_control
      drm/i915/xehp/guc: enable compute engine inside GuC
      drm/i915/xehp: handle fused off CCS engines

Danijel Slivka (2):
      amdgpu/pm: Disable managing hwmon sysfs attributes for ONEVF mode
      drm/amd/pm: new v3 SmuMetrics data structure for Sienna Cichlid

Darren Powell (3):
      amdgpu/pm: Implement new API function "emit" that accepts buffer
base and write offset
      amdgpu/pm: Implement emit_clk_levels for navi10
      amdgpu/pm: Add emit_clock_levels calls

Dave Airlie (21):
      Merge tag 'drm-misc-next-2022-01-27' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-2022-02-08' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-5.18-2022-02-11-1' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Backmerge tag 'v5.17-rc4' of
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into
drm-next
      Merge tag 'amd-drm-next-5.18-2022-02-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-2022-02-23' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-2022-02-23' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'mediatek-drm-next-5.18' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Backmerge tag 'v5.17-rc6' into drm-next
      Merge tag 'amd-drm-next-5.18-2022-02-25' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm/tegra/for-5.18-rc1' of
https://gitlab.freedesktop.org/drm/tegra into drm-next
      Merge tag 'du-next-20220303' of
git://linuxtv.org/pinchartl/media into drm-next
      Merge tag 'drm-misc-next-2022-03-03' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-gt-next-2022-03-03' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-msm-next-2022-03-01' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'exynos-drm-next-v5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      Merge tag 'drm-msm-next-2022-03-08' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'amd-drm-next-5.18-2022-03-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-fixes-2022-03-10' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-intel-next-fixes-2022-03-17' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-5.18-2022-03-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

Dave Stevenson (3):
      drm/object: Add drm_object_property_get_default_value() function
      drm/object: Add default zpos value at reset
      drm/object: Add default color encoding and range value at reset

David Galiffi (2):
      drm/amd/display: Fix disabling dccg clocks
      drm/amd/display: Disable physym clock

David Yat Sin (13):
      drm/amdkfd: CRIU Implement KFD unpause operation
      drm/amdkfd: CRIU add queues support
      drm/amdkfd: CRIU restore queue ids
      drm/amdkfd: CRIU restore sdma id for queues
      drm/amdkfd: CRIU restore queue doorbell id
      drm/amdkfd: CRIU checkpoint and restore queue mqds
      drm/amdkfd: CRIU checkpoint and restore queue control stack
      drm/amdkfd: CRIU checkpoint and restore events
      drm/amdkfd: CRIU implement gpu_id remapping
      drm/amdkfd: Fix for possible integer overflow
      drm/amdkfd: CRIU remove sync and TLB flush on restore
      drm/amdkfd: CRIU Refactor restore BO function
      drm/amdkfd: CRIU export dmabuf handles for GTT BOs

David Yu (1):
      drm/amdgpu: Add DFC CAP support for aldebaran

Dillon Varone (3):
      drm/amd/display: Add frame alternate 3D & restrict HW packed on dongl=
es
      drm/amd/display: Modify plane removal sequence to avoid hangs.
      drm/amd/display: Add minimal pipe split transition state

Dmitry Baryshkov (28):
      drm/msm: drop register logging support
      drm/msm: drop dbgname argument from msm_ioremap*()
      drm/msm: move msm_readl/_writel to msm_drv.h
      drm/msm: reduce usage of round_pixclk callback
      drm/msm: move utility functions from msm_drv.c
      drm/msm/dsi: move DSI host powerup to modeset time
      drm/msm/dsi/phy: fix 7nm v4.0 settings for C-PHY mode
      drm/msm/dpu: drop unused lm_max_width from RM
      drm/msm/dpu: add DSPP blocks teardown
      drm/msm/dpu: get INTF blocks directly rather than through RM
      drm/msm/dpu: stop embedding dpu_hw_blk into dpu_hw_intf
      drm/msm/dpu: fix error handling in dpu_rm_init
      drm/msm/dpu: drop unused access macros
      drm/msm/dpu: fix dp audio condition
      drm/msm: move struct msm_display_info to dpu driver
      drm/msm/dpu: remove msm_dp cached in dpu_encoder_virt
      drm/msm/dpu: drop bus_scaling_client field
      drm/msm/dpu: encoder: drop unused mode_fixup callback
      drm/msm/dpu: switch dpu_encoder to use atomic_mode_set
      drm/msm/dpu: pull connector from dpu_encoder_phys to dpu_encoder_virt
      drm/msm/dpu: simplify clocks handling
      drm/msm/dp: fix panel bridge attachment
      drm/msm/dp: support attaching bridges to the DP encoder
      drm/msm/dp: support finding next bridge even for DP interfaces
      Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu',
'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi' and
'msm-next-lumag-mdp5' into msm-next-lumag
      drm/msm/dpu: wire up MSM8998's DSPP blocks
      Merge branches 'msm-next-lumag-dpu' and 'msm-next-lumag-dsi'
into msm-next-lumag
      dt-bindings: display/msm: add missing brace in dpu-qcm2290.yaml

Dmitry Osipenko (1):
      drm/tegra: Use dev_err_probe()

Dmytro Laktyushkin (4):
      drm/amd/display: limit unbounded requesting to 5k
      drm/amd/display: fix yellow carp wm clamping
      drm/amd/display: limit unbounded requesting to 5k
      drm/amd/display: revert populating dcn315 clk table based on dcfclk

Douglas Anderson (5):
      drm/panel-edp: Allow querying the detected panel via sysfs
      Revert "drm/panel-edp: Allow querying the detected panel via sysfs"
      drm/bridge: ti-sn65dsi86: Use drm_bridge_connector
      drm: Plumb debugfs_init through to panels
      drm/panel-edp: Allow querying the detected panel via debugfs

Drew Davenport (1):
      drm: bridge: it66121: Remove redundant check

Duncan Ma (2):
      drm/amd/display: Set compbuf size to min at prep prevent overbook crb
      drm/amd/display: Set compbuf size to min at prep prevent overbook crb

Eric Bernstein (2):
      drm/amd/display: Fix for variable may be used uninitialized error
      drm/amd/display: remove static from optc31_set_drr

Eric Huang (2):
      drm/amdkfd: enable heavy-weight TLB flush on Arcturus
      drm/amdkfd: enable heavy-weight TLB flush on Vega20

Eric Yang (6):
      drm/amd/display: adjust bit comparison to be more type safe
      drm/amd/display: support new PMFW interface to disable Z9 only
      drm/amd/display: fix zstate allow interface to PMFW
      drm/amd/display: add debug option for z9 disable interface
      drm/amd/display: enable z9 denial interface by default
      drm/amd/display: Block zstate when more than one plane enabled

Erico Nunes (1):
      drm/lima: avoid error task dump attempt when not enabled

Evan Quan (44):
      drm/amd/pm: do not expose implementation details to other blocks
out of power
      drm/amd/pm: do not expose power implementation details to amdgpu_pm.c
      drm/amd/pm: do not expose power implementation details to display
      drm/amd/pm: do not expose those APIs used internally only in amdgpu_d=
pm.c
      drm/amd/pm: do not expose those APIs used internally only in si_dpm.c
      drm/amd/pm: do not expose the API used internally only in kv_dpm.c
      drm/amd/pm: create a new holder for those APIs used only by
legacy ASICs(si/kv)
      drm/amd/pm: move pp_force_state_enabled member to amdgpu_pm structure
      drm/amd/pm: optimize the amdgpu_pm_compute_clocks() implementations
      drm/amd/pm: move those code piece used by Stoney only to smu8_hwmgr.c
      drm/amd/pm: drop redundant or unused APIs and data structures
      drm/amd/pm: do not expose the smu_context structure used
internally in power
      drm/amd/pm: relocate the power related headers
      drm/amd/pm: drop unnecessary gfxoff controls
      drm/amd/pm: revise the performance level setting APIs
      drm/amd/pm: unified lock protections in amdgpu_dpm.c
      drm/amdgpu: wrap those atombios APIs used by SI under CONFIG_DRM_AMDG=
PU_SI
      drm/amd/pm: drop those unrealistic thermal_type checks
      drm/amd/pm: correct the checks for fan attributes support
      drm/amdgpu: suppress the warning about enum value 'AMD_IP_BLOCK_TYPE_=
NUM'
      drm/amd/pm: drop unneeded lock protection smu->mutex
      drm/amd/pm: drop unneeded vcn/jpeg_gate_lock
      drm/amd/pm: drop unneeded smu->metrics_lock
      drm/amd/pm: drop unneeded smu->sensor_lock
      drm/amd/pm: drop unneeded smu_baco->mutex
      drm/amd/pm: drop unneeded feature->mutex
      drm/amd/pm: drop unneeded hwmgr->smu_lock
      drm/amd/pm: correct the MGpuFanBoost support for Beige Goby
      drm/amd/pm: fix the deadlock observed on performance_level setting
      drm/amd/pm: correct the way for retrieving enabled ppfeatures on Reno=
ir
      drm/amd/pm: unify the interface for retrieving enabled ppfeatures
      drm/amd/pm: update the data type for retrieving enabled ppfeatures
      drm/amd/pm: correct the usage for 'supported' member of
smu_feature structure
      drm/amd/pm: drop the cache for enabled ppfeatures
      drm/amd/pm: avoid consecutive retrieving for enabled ppfeatures
      drm/amd/pm: revise the implementation of
smu_cmn_disable_all_features_with_exception
      drm/amd/pm: fix enabled features retrieving on Renoir and Cyan Skillf=
ish
      drm/amd/pm: correct UMD pstate clocks for Dimgrey Cavefish and Beige =
Goby
      drm/amd/pm: fulfill the support for DriverSmuConfig table
      drm/amd/pm: correct the default DriverSmuConfig table settings
      drm/amd/pm: fulfill Navi1x implementations for DriverSmuConfig settin=
g
      drm/amd/pm: fulfill Sienna_Cichlid implementations for
DriverSmuConfig setting
      drm/amdgpu: disable MMHUB PG for Picasso
      drm/amd/pm: fix some OEM SKU specific stability issues

Fangzhi Zuo (6):
      drm/amd/display: Add Synaptics Fifo Reset Workaround
      drm/amd/display: Retrieve MST Downstream Port Status
      drm/amd/display: Add DSC Enable for Synaptics Hub
      drm/amd/display: Add Missing HPO Stream Encoder Function Hook
      drm/amd/display: Trigger DP2 Sequence With Uncertified Cable
      drm/amd/display: Ignore Transitional Invalid Link Rate Error Message

Felipe Clark (1):
      drm/amd/display: Fix black screen issue on memory clock switch en

Felix Kuehling (4):
      drm/amdgpu: Wipe all VRAM on free when RAS is enabled
      drm/amdkfd: Replace zero-length array with flexible-array member
      drm/amdkfd: Fix criu_restore_bo error handling
      drm/amdkfd: Use real device for messages

Flora Cui (1):
      drm/amd/pm: fix null ptr access

George Shen (3):
      drm/amd/display: Refactor fixed VS logic for non-transparent mode
      drm/amd/display: Refactor fixed VS w/a for PHY tests
      drm/amd/display: Clean up fixed VS PHY test w/a function

Graham Sider (1):
      drm/amdkfd: Fix indentation on switch statement

Guchun Chen (10):
      locking/rwsem: drop redundant semicolon of down_write_nest_lock
      drm/amdgpu: drop redundant check of ip discovery_bin
      drm/amdgpu: apply vcn harvest quirk
      drm/amdgpu: drop WARN_ON in amdgpu_gart_bind/unbind
      drm/amd/pm: use dev_*** to print output in multiple GPUs
      drm/amdgpu: drop flood print in rlcg reg access function
      drm/amdgpu: no rlcg legacy read in SRIOV case
      Revert "drm/amdgpu: add modifiers in amdgpu_vkms_plane_init()"
      drm/amdgpu: bypass tiling flag check in virtual display case (v2)
      drm/amdgpu: read harvest bit per IP data on legacy GPUs

Guenter Roeck (1):
      drm/i915/gvt: Use list_entry to access list members

Gustavo A. R. Silva (2):
      drm/i915/guc: Use struct_size() helper in kmalloc()
      nouveau/svm: Use struct_size() helper in nouveau_pfns_map()

H. Nikolaus Schaller (1):
      drm/ingenic: prepare ingenic drm for later addition of JZ4780

Hans de Goede (4):
      drm/i915/backlight: Make ext_pwm_disable_backlight() call
intel_backlight_set_pwm_level()
      drm/i915: Remove unused intel_gmbus_set_speed() function
      drm/privacy-screen: Fix sphinx warning
      drm/simpledrm: Add "panel orientation" property on non-upright
mounted LCD panels

Hansen Dsouza (3):
      drm/amd/display: Add DCN316 resource and SMU clock manager
      drm/amd/display: Remove invalid RDPCS Programming in DAL
      drm/amd/display: fix deep color ratio

Harish Chegondi (1):
      drm/i915: Fix possible NULL pointer dereferences in i9xx_update_wm()

Harish Kasiviswanathan (2):
      drm/amdkfd: Print bdf in peer map failure message
      drm/amdgpu: Set correct DMA mask for aldebaran

Hawking Zhang (11):
      drm/amdgpu: add helper to query rlcg reg access flag
      drm/amdgpu: switch to get_rlcg_reg_access_flag for gfx9
      drm/amdgpu: switch to get_rlcg_reg_access_flag for gfx10
      drm/amdgpu: add structures for rlcg indirect reg access
      drm/amdgpu: init rlcg_reg_access_ctrl for gfx9
      drm/amdgpu: init rlcg_reg_access_ctrl for gfx10
      drm/amdgpu: add helper for rlcg indirect reg access
      drm/amdgpu: switch to amdgpu_sriov_rreg/wreg
      drm/amdgpu: retire rlc callbacks sriov_rreg/wreg
      drm/amdgpu: switch to common helper to read bios from rom
      drm/amdgpu: drop xmgi23 error query/reset support

Hersen Wu (2):
      drm/amd/display: dsc mst re-compute pbn for changes on hub
      drm/amd/display: add dsc mst stream pbn log for debug

Hsin-Yi Wang (5):
      drm/bridge: anx7625: Convert to use devm_kzalloc
      drm/bridge: anx7625: Support reading edid through aux channel
      dt-bindings: drm/bridge: anx7625: Add aux-bus node
      drm/bridge: it6505: Fix the read buffer array bound
      drm/bridge: Clear the DP_AUX_I2C_MOT bit passed in aux read command.

Ian Chen (2):
      drm/amd/display: modify SMU_TIMEOUT macro.
      drm/amd/display: Change return type of dm_helpers_dp_mst_stop_top_mgr

Ilya (2):
      drm/amd/display: Fix DP LT sequence on EQ fail
      drm/amd/display: Fix wrong resolution with DP/VGA adapter

Imre Deak (4):
      drm/i915/adlp: Fix TypeC PHY-ready status readout
      drm/i915: Disable unused power wells left enabled by BIOS
      drm/i915: Disconnect PHYs left connected by BIOS on disabled ports
      drm/i915/adlp: Add TypeC PHY TBT->DP-alt/legacy mode switch workaroun=
d

Ira Weiny (1):
      drm/gma: Remove calls to kmap()

Isabella Basso (1):
      drm/amd/display: move calcs folder into DML

Ivaylo Dimitrov (1):
      drm: omapdrm: Fix implicit dma_buf fencing

Jagan Teki (9):
      drm/bridge: chipone-icn6211: Switch to atomic operations
      drm/bridge: chipone-icn6211: Add mode_set API
      drm: exynos: dsi: Convert to bridge driver
      drm: exynos: dsi: Add mode_set function
      drm: bridge: adv7511: Fix ADV7535 HPD enablement
      Revert "drm: exynos: dsi: Convert to bridge driver"
      drm: bridge: nwl-dsi: Drop panel_bridge from nwl_dsi
      drm/bridge: dw-mipi-dsi: Switch to atomic operations
      drm: of: Lookup if child node has panel or bridge

Jani Nikula (85):
      drm/i915/cdclk: turn around i915_drv.h and intel_cdclk.h dependency
      drm/i915/cdclk: move struct intel_cdclk_funcs to intel_cdclk.c
      drm/i915/bios: fix slab-out-of-bounds access
      drm/i915: stop including i915_irq.h from i915_drv.h
      drm/i915: split out i915_getparam.h from i915_drv.h
      drm/i915: split out i915_cmd_parser.h from i915_drv.h
      drm/i915: split out i915_gem_evict.h from i915_drv.h
      drm/i915: split out gem/i915_gem_userptr.h from i915_drv.h
      drm/i915: split out gem/i915_gem_tiling.h from i915_drv.h
      drm/i915: split out PCI config space registers from i915_reg.h
      drm/i915: split out vlv sideband registers from i915_reg.h
      drm/dp: note that DPCD 0x2002-0x2003 match 0x200-0x201
      drm/mst: use DP_GET_SINK_COUNT() for sink count in ESI
      drm/i915/dp: make intel_dp_pack_aux() static again
      drm/i915/pcode: rename sandybridge_pcode_* to snb_pcode_*
      drm/i915/psr: remove unused lines_to_wait vbt info
      drm/i915/dpll: make intel_shared_dpll_funcs internal to intel_dpll_mg=
r.c
      drm/locking: fix drm_modeset_acquire_ctx kernel-doc
      drm/i915: split out i915_reg_read_ioctl() to i915_ioctl.[ch]
      drm/i915/mst: fix intel_dp_mst_hpd_irq() indentation
      drm/i915/mst: abstract intel_dp_ack_sink_irq_esi()
      drm/i915/mst: debug log 4 bytes of ESI right after reading
      drm/i915/mst: abstract handling of link status in DP MST
      drm/i915/mst: read link status only when requested by sink in ESI
      drm/i915/mst: ack sink irq ESI for link status changes
      drm/i915/mst: only ack the ESI we actually handled
      drm/i915: nuke local versions of WARN_ON/WARN_ON_ONCE
      drm/i915/snps: convert to drm device based logging
      drm/i915/pps: convert to drm device based logging
      drm/i915/hotplug: convert to drm device based logging
      drm/i915/dp: convert to drm device based logging
      drm/i915/plane: convert to drm device based logging and WARN
      drm/i915/sprite: convert to drm device based logging
      drm/i915/lspcon: convert to drm device based logging
      drm/i915/cdclk: update intel_dump_cdclk_config() logging
      drm/i915/cdclk: convert to drm device based logging
      drm/edid: improve non-desktop quirk logging
      drm/i915/vga: switch to use VGA definitions from video/vga.h
      drm/i915: remove VGA register definitions
      drm/i915: group i915_drv.h forward declarations together
      drm/i915/color: hide struct intel_color_funcs
      drm/i915/hpd: hide struct intel_hotplug_funcs
      drm/i915/fdi: hide struct intel_fdi_funcs
      drm/i915/dpll: add intel_dpll_crtc_compute_clock()
      drm/i915/dpll: hide struct intel_dpll_funcs
      drm/i915/pm: hide struct drm_i915_clock_gating_funcs
      drm/i915: move intel_hws_csb_write_index() out of i915_drv.h
      drm/i915: move the DRIVER_* macros to i915_driver.[ch]
      drm/i915/opregion: check port number bounds for SWSCI display power s=
tate
      drm/i915/opregion: abstract the check for valid swsci function
      drm/i915/opregion: early exit from encoder notify if SWSCI isn't ther=
e
      drm/i915/opregion: handle SWSCI Mailbox #2 obsoletion
      drm/i915/opregion: debug log about Mailbox #2 for backlight
      drm/dp: add drm_dp_128b132b_read_aux_rd_interval()
      drm/dp: add 128b/132b link status helpers from DP 2.0 E11
      drm/dp: add some new DPCD macros from DP 2.0 E11
      drm/i915/dp: move intel_dp_prepare_link_train() call
      drm/i915/dp: rewrite DP 2.0 128b/132b link training based on errata
      drm/i915/dp: add 128b/132b support to link status checks
      drm/i915/mst: update slot information for 128b/132b
      drm/i915: split out i915_gem_internal.h from i915_drv.h
      drm/i915: remove leftover i915_gem_pm.h declarations from i915_drv.h
      drm/i915: split out gem/i915_gem_dmabuf.h from i915_drv.h
      drm/i915: split out gem/i915_gem_create.h from i915_drv.h
      drm/i915: split out gem/i915_gem_domain.h from i915_drv.h
      drm/i915: move i915_cache_level_str() static in i915_debugfs.c
      drm/i915: move i915_gem_vm_lookup() where it's used
      drm/i915: move i915_reset_count()/i915_reset_engine_count() out
of i915_drv.h
      drm/i915: split out i915_file_private.h from i915_drv.h
      drm/i915: don't include drm_cache.h in i915_drv.h
      drm/i915: include shmem_fs.h only where needed
      drm/i915: include some drm headers only where needed
      drm/i915: axe lots of unnecessary includes from i915_drv.h
      drm/i915: fix drm_i915.h include grouping and sorting
      drm/i915/gvt: #include drm_edid.h for drm_edid_block_valid()
      drm/i915/fbdev: add intel_fbdev_framebuffer() helper
      drm/i915/fbdev: hide struct intel_fbdev in intel_fbdev.c
      drm/i915/lrc: move lrc_get_runtime() to intel_lrc.c
      drm/i915/lrc: replace include with forward declarations
      drm/i915/dp: remove accidental static on what should be a local varia=
ble
      drm/i915/dsi: disassociate VBT video transfer mode from register valu=
es
      drm/i915/dsi: add separate init timer mask definition for ICL DSI
      drm/i915/reg: split out vlv_dsi_regs.h and vlv_dsi_pll_regs.h
      drm/i915/reg: split out icl_dsi_regs.h
      drm/i915/pxp: prefer forward declaration over includes

Jarif Aftab (1):
      drm/amd/display: Disabled seamless boots on DP and renamed
power_down_display_on_boot

Jasdeep Dhillon (2):
      drm/amd/display: move FPU associated DCN302 code to DML folder (#2266=
)
      drm/amd/display: move FPU associated DCN303 code to DML folder

Jasmine Newsome (1):
      drm/i915/gem: Use local pointer ttm for __i915_ttm_move

Javier Martinez Canillas (46):
      video: vga16fb: Fix logic that checks for the display standard
      drm: Provide platform module-init macro
      drm/imx/dcss: Replace module initialization with DRM helpers
      drm/komeda: Replace module initialization with DRM helpers
      drm/arm/hdlcd: Replace module initialization with DRM helpers
      drm/malidp: Replace module initialization with DRM helpers
      drivers/firmware: Don't mark as busy the simple-framebuffer IO resour=
ce
      drm/hisilicon/hibmc: Allow to be built if COMPILE_TEST is enabled
      drm/aspeed: Use drm_module_platform_driver() to register the driver
      drm/atmel-hlcdc: Use drm_module_platform_driver() to register the dri=
ver
      drm/fsl-dcu: Use drm_module_platform_driver() to register the driver
      drm/hisilicon/kirin: Use drm_module_platform_driver() to
register the driver
      drm/kmb: Use drm_module_platform_driver() to register the driver
      drm/meson: Use drm_module_platform_driver() to register the driver
      drm: mxsfb: Use drm_module_platform_driver() to register the driver
      drm/shmobile: Use drm_module_platform_driver() to register the driver
      drm/stm: Use drm_module_platform_driver() to register the driver
      drm/sun4i: Use drm_module_platform_driver() to register the driver
      drm/tidss: Use drm_module_platform_driver() to register the driver
      drm/arc: Use drm_module_platform_driver() to register the driver
      drm/tve200: Use drm_module_platform_driver() to register the driver
      drm/xlnx: Use drm_module_platform_driver() to register the driver
      drm/armada: Add support for the nomodeset kernel parameter
      drm/exynos: Add support for the nomodeset kernel parameter
      drm/gma500: Add support for the nomodeset kernel parameter
      drm/hyperv: Add support for the nomodeset kernel parameter
      drm/imx: Add support for the nomodeset kernel parameter
      drm/ingenic: Add support for the nomodeset kernel parameter
      drm/mcde: Add support for the nomodeset kernel parameter
      drm/mediatek: Add support for the nomodeset kernel parameter
      drm/msm: Add support for the nomodeset kernel parameter
      drm/omap: Add support for the nomodeset kernel parameter
      drm: rcar-du: Add support for the nomodeset kernel parameter
      drm/rockchip: Add support for the nomodeset kernel parameter
      drm/sprd: Add support for the nomodeset kernel parameter
      drm/sti: Add support for the nomodeset kernel parameter
      drm/tegra: Add support for the nomodeset kernel parameter
      drm/tilcdc: Add support for the nomodeset kernel parameter
      drm/xen: Add support for the nomodeset kernel parameter
      drm/format-helper: Add drm_fb_xrgb8888_to_gray8_line()
      drm/format-helper: Add drm_fb_xrgb8888_to_mono_reversed()
      drm: Add driver for Solomon SSD130x OLED displays
      drm/solomon: Add SSD130x OLED displays I2C support
      MAINTAINERS: Add entry for Solomon SSD130x OLED displays DRM driver
      dt-bindings: display: ssd1307fb: Add myself as binding co-maintainer
      drm/repaper: Use format helper for xrgb8888 to monochrome conversion

Jiapeng Chong (2):
      drm/amd/display: Remove redundant initialization of dpg_width
      drm/amd/pm: remove useless if

Jiasheng Jiang (2):
      drm/v3d/v3d_drv: Check for error num after setting mask
      drm/panfrost: Check for error num after setting mask

Jiawei Gu (1):
      drm/sched: Add device pointer to drm_gpu_scheduler

Jimmy Kizito (1):
      drm/amd/display: Add work around to enforce TBT3 compatibility.

JinZe.Xu (1):
      drm/amd/display: Add I2C escape to support query device exist.

Jing Zhou (2):
      drm/amd/display: Update engine ddc
      drm/amd/display: Add null pointer filter

Jingwen Chen (2):
      drm/amd/amdgpu: fixing read wrong pf2vf data in SRIOV
      drm/amd/amdgpu: set disabled vcn to no_schduler

Jingwen Zhu (1):
      drm/amd/display: add gamut coefficient set A and B

Jiri Vanek (1):
      drm/bridge/tc358775: Fix for dual-link LVDS

Jocelyn Falempe (1):
      mgag200 fix memmapsl configuration in GCTL6 register

John Harrison (7):
      drm/i915/guc: Report error on invalid reset notification
      drm/i915/guc: Check for wedged before doing stuff
      drm/i915/guc: Temporarily bump the GuC load timeout
      drm/i915/guc: Update to GuC version 69.0.3
      drm/i915/guc: Improve GuC loading status check/error reports
      drm/i915/guc: Fix flag query helper function to not modify state
      drm/i915/guc: Do not complain about stale reset notifications

Jonathan Gray (1):
      drm/radeon: use kernel is_power_of_2 rather than local version

Jonathan Kim (6):
      drm/amdgpu: improve debug VRAM access performance using sdma
      drm/amdgpu: cleanup ttm debug sdma vram access function
      drm/amdgpu: fix broken debug sdma vram access function
      drm/amdkfd: remove unneeded unmap single queue option
      drm/amdkfd: navi2x requires extended engines to map and unmap sdma qu=
eues
      drm/amdgpu: fix aldebaran xgmi topology for vf

Joonas Lahtinen (2):
      Merge drm/drm-next into drm-intel-gt-next
      Merge tag 'gvt-next-2022-03-07' of
https://github.com/intel/gvt-linux into drm-intel-next-fixes

Josip Pavic (1):
      drm/amd/display: do not compare integers of different widths

Jos=C3=A9 Exp=C3=B3sito (9):
      drm/plane: Make format_mod_supported truly optional
      drm/plane: Fix typo in format_mod_supported documentation
      drm/vkms: refactor overlay plane creation
      drm/vkms: add support for multiple overlay planes
      drm/vkms: drop "Multiple overlay planes" TODO
      drm/stm: ltdc: Drop format_mod_supported function
      drm/doc: Fix TTM acronym
      drm/selftests/test-drm_dp_mst_helper: Fix memory leak in
sideband_msg_req_encode_decode
      drm/bridge: chipone-icn6211: switch to devm_drm_of_get_bridge

Jos=C3=A9 Roberto de Souza (10):
      drm/i915/display/ehl: Update voltage swing table
      drm/i915/display/adlp: Implement new step in the TC voltage
swing prog sequence
      drm/i915/display/tgl+: Implement new PLL programming step
      drm/i915/display: Group PSR2 prog sequences and workarounds
      drm/i915/display: Implement Wa_16013835468
      drm/i915/tgl: Simply subplatform detection
      drm/i915/rps/tgl+: Remove RPS interrupt support
      drm/i915: Check stolen memory size before calling drm_mm_init
      drm/i915/display: Fix HPD short pulse handling for eDP
      drm/i915/display: Do not re-enable PSR after it was marked as not rel=
iable

Jouni H=C3=B6gander (1):
      drm/i915: Fix for PHY_MISC_TC1 offset

Julia Lawall (3):
      drm/amd/pm: fix typos in comments
      drm/amdgpu: fix typos in comments
      drm/amdgpu/dc: fix typos in comments

Julian Braha (1):
      drm: bridge: fix unmet dependency on DRM_KMS_HELPER for DRM_PANEL_BRI=
DGE

Julien STEPHAN (1):
      drm/mediatek: Allow commands to be sent during video mode

Juston Li (2):
      drm/i915/pxp: Hold RPM wakelock during PXP unbind
      drm/i915/pxp: Hold RPM wakelock during PXP unbind

Kees Cook (2):
      drm/dp: Fix off-by-one in register cache size
      drm/dp: Fix OOB read when handling Post Cursor2 register

Ken Xue (1):
      drm/amdgpu: remove ctx->lock

Kent Russell (1):
      drm/amdkfd: Drop IH ring overflow message to dbg

Kevin Tang (3):
      drm/sprd: remove the selected DRM_KMS_CMA_HELPER in kconfig
      drm/sprd: fix potential NULL dereference
      drm/sprd: check the platform_get_resource() return value

KuoHsiang Chou (2):
      drm/ast: Enable the supporting of wide screen on AST2600
      drm/ast: Create threshold values for AST2600

Kuogee Hsieh (8):
      drm/msm/dp: do not initialize phy until plugin interrupt received
      drm/msm/dp: populate connector of struct dp_panel
      drm/msm/dp: add support of tps4 (training pattern 4) for HBR3
      drm/msm/dp: stop link training after link training 2 failed
      drm/msm/dp: always add fail-safe mode into connector mode list
      drm/msm/dp: add connector type to enhance debug messages
      drm/msm/dp: enhance debug info related to dp phy
      drm/msm: populate intf_audio_select() base on hardware capability

Lad Prabhakar (5):
      drm/exynos/exynos7_drm_decon: Use platform_get_irq_byname() to
get the interrupt
      drm/exynos: mixer: Use platform_get_irq() to get the interrupt
      drm/exynos/exynos_drm_fimd: Use platform_get_irq_byname() to get
the interrupt
      drm/exynos/fimc: Use platform_get_irq() to get the interrupt
      drm/exynos: gsc: Use platform_get_irq() to get the interrupt

Lang Yu (7):
      drm/amdgpu: enable amdgpu_dc module parameter
      drm/amd/pm: add get_dpm_ultimate_freq function for cyan skillfish
      drm/amd/pm: use existing fini_smc_tables function for cyan skillfish
      drm/amdgpu: fix a potential GPU hang on cyan skillfish
      drm/amdgpu: add support for GC 10.1.4
      drm/amdgpu: fix a wrong ib reference
      drm/amdgpu: only allow secure submission on rings which support that

Laurent Pinchart (4):
      dt-bindings: display: bridge: sn65dsi83: Make enable GPIO optional
      drm: rcar-du: Drop LVDS device tree backward compatibility
      drm: rcar-du: Don't select VSP1 sink on Gen3
      drm: rcar-du: Don't restart group when enabling plane on Gen3

Leo (Hanghong) Ma (3):
      drm/amd/display: add infoframe update sequence debug trace
      drm/amd/display: Add link dp trace support
      drm/amd/display: Add function to get the pipe from the stream context

Leo Li (5):
      drm/amd/include: Add register headers for DCN 3.1.6
      drm/amd/include: Add MP 13.0.8 register headers
      drm/amd/display: Add DMUB support for DCN316
      drm/amd/display: Fix DC definition of PMFW Pstate table for DCN316
      drm/amd/display: Fix compile error from TO_CLK_MGR_INTERNAL

Leung, Martin (1):
      drm/amd/display: cleaning up smu_if to add future flexibility

Lijo Lazar (5):
      drm/amdgpu: Fix uninitialized variable use warning
      drm/amd/pm: Fix missing prototype warning
      drm/amdgpu: Refactor mode2 reset logic for v13.0.2
      drm/amdgpu: Disable baco dummy mode
      drm/amd/pm: Send message when resp status is 0xFC

Linus Walleij (4):
      drm/panel: Extend ACX424AKP bindings to ACX424AKM
      drm/panel: Rename Sony ACX424 to Novatek NT35560
      drm/panel: nt35560: Support more panel IDs
      drm/panel: nt35560: Support also ACX424AKM

Liu Ying (1):
      drm/bridge: nwl-dsi: Remove superfluous write to NWL_DSI_IRQ_MASK reg=
ister

Loic Poulain (5):
      drm/msm/dsi: Allow to specify dsi config as pdata
      drm/msm/dsi: Add support for qcm2290 dsi controller
      dt-bindings: msm/dsi: Add qcm2290 dsi controller binding
      drm/msm: add support for QCM2290 MDSS
      dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings

Luben Tuikov (12):
      drm/amd: Expose the FRU SMU I2C bus
      drm/amd: Enable FRU EEPROM for Sienna Cichlid
      drm/amdgpu: Print once if RAS unsupported
      drm/amdgpu: Nerf "buff" to "buf"
      drm/amdgpu: Don't offset by 2 in FRU EEPROM
      drm/amdgpu: Prevent random memory access in FRU code
      drm/amdgpu: Set FRU bus for Aldebaran and Vega 20
      drm/amdgpu: Show IP discovery in sysfs
      drm/amdgpu: Add "harvest" to IP discovery sysfs
      drm/amdgpu: Fix ARM compilation warning
      drm/amdgpu: Dynamically initialize IP instance attributes
      drm/amd/display: Don't fill up the logs

Lucas De Marchi (30):
      dma-buf-map: Fix dot vs comma in example
      drm/i915: Do not spam log with missing arch support
      drm/i915: Fix header test for !CONFIG_X86
      drm: Stop spamming log with drm_cache message
      drm/i915: Fix trailing semicolon
      lib/string_helpers: Consolidate string helpers implementation
      drm/amd/display: Use str_yes_no()
      drm/gem: Sort includes alphabetically
      drm: Convert open-coded yes/no strings to yesno()
      tomoyo: Use str_yes_no()
      dma-buf-map: Rename to iosys-map
      drm/i915/guc: Prepare for error propagation
      drm/i915/guc: Use a single pass to calculate regset
      drm/i915: Kill the fake lmem support
      iosys-map: Add offset to iosys_map_memcpy_to()
      iosys-map: Add a few more helpers
      drm/i915/gt: Add helper for shmem copy to iosys_map
      drm/i915/guc: Keep iosys_map of ads_blob around
      drm/i915/guc: Add read/write helpers for ADS blob
      drm/i915/guc: Convert golden context init to iosys_map
      drm/i915/guc: Convert policies update to iosys_map
      drm/i915/guc: Convert engine record to iosys_map
      drm/i915/guc: Convert guc_ads_private_data_reset to iosys_map
      drm/i915/guc: Convert golden context prep to iosys_map
      drm/i915/guc: Replace check for golden context size
      drm/i915/guc: Convert mapping table to iosys_map
      drm/i915/guc: Convert capture list to iosys_map
      drm/i915/guc: Convert guc_mmio_reg_state_init to iosys_map
      drm/i915/guc: Convert __guc_ads_init to iosys_map
      drm/i915/guc: Remove plain ads_blob pointer

Lukas Fink (1):
      drm/amdgpu: Fix rejecting Tahiti GPUs

Lyude Paul (2):
      drm/nouveau/backlight: Fix LVDS backlight detection on some laptops
      drm/nouveau/backlight: Just set all backlight types as RAW

Maarten Lankhorst (9):
      drm/i915: Call i915_gem_evict_vm in vm_fault_gtt to prevent new
ENOSPC errors, v2.
      drm/i915: Add locking to i915_gem_evict_vm(), v3.
      drm/i915: Add object locking to i915_gem_evict_for_node and
i915_gem_evict_something, v2.
      drm/i915: Add i915_vma_unbind_unlocked, and take obj lock for
i915_vma_unbind, v2.
      drm/i915: Remove support for unlocked i915_vma unbind
      drm/i915: Remove short-term pins from execbuf, v6.
      drm/i915: Lock dpt_obj around set_cache_level, v2.
      drm/i915: Allow dead vm to unbind vma's without lock.
      Merge remote-tracking branch 'drm/drm-next' into drm-misc-next

Madhumitha Tolakanahalli Pradeep (1):
      drm/i915/dmc: Eliminate remnant GEN<n> references

Magali Lemes (5):
      drm/amd/display: Use NULL pointer instead of plain integer
      drm/amd/display: Adjust functions documentation
      drm/amd/display: Add conditional around function
      drm/amd/display: Use NULL instead of 0
      drm/amd/display: Turn functions into static

Manasi Navare (1):
      drm/i915/display/vrr: Reset VRR capable property on a long hpd

Marek Szyprowski (2):
      drm/exynos: Don't fail if no TE-gpio is defined for DSI driver
      drm/exynos: Search for TE-gpio in DSI panel's node

Marek Vasut (5):
      dt-bindings: display: bridge: lvds-codec: Document TI DS90CF364A deco=
der
      drm: mxsfb: Shutdown the display on remove
      drm: mxsfb: Shutdown the display on system shutdown
      dt-bindings: display: simple: Add Multi-Inno Technology MI0700S4T-6 p=
anel
      drm/panel: simple: add Multi-Inno Technology MI0700S4T-6

Marijn Suijten (1):
      drm/msm/dsi: Use "ref" fw clock instead of global name for VCO parent

Marina Nikolic (1):
      drm/amd/pm: Enable sysfs required by rocm-smi tool for One VF mode

Mario Limonciello (11):
      drm/amd/display: Revert W/A for hard hangs on DCN20/DCN21
      drm/amd: Fix MSB of SMU version printing
      display/amd: decrease message verbosity about watermarks table failur=
e
      drm/amd: Warn users about potential s0ix problems
      drm/amd: add support to check whether the system is set to s3
      drm/amd: Only run s3 or s0ix if system is configured properly
      drm/amd: avoid suspend on dGPUs w/ s2idle support when runtime PM ena=
bled
      drm/amd: smu7: downgrade voltage error to info
      drm/amd: Check if ASPM is enabled from PCIe subsystem
      drm/amd: Refactor `amdgpu_aspm` to be evaluated per device
      drm/amd: Use amdgpu_device_should_use_aspm on navi umd pstate switchi=
ng

Martin Blumenstingl (2):
      drm/meson: osd_afbcd: Add an exit callback to struct meson_afbcd_ops
      drm/meson: Fix error handling when afbcd.ops->init fails

Martin J=C3=BCcker (1):
      drm/exynos: fimd: add BGR support for exynos4/5

Martin Tsai (2):
      drm/amd/display: add protection in link encoder matching logic
      drm/amd/display: handle null link encoder

Mastan Katragadda (1):
      drm/i915/gem: add missing boundary check in vm_access

Matt Roper (42):
      drm/i915: Use parameterized GPR register definitions everywhere
      drm/i915: Parameterize PWRCTX_MAXCNT
      drm/i915: Parameterize ECOSKPD
      drm/i915: Use RING_PSMI_CTL rather than per-engine macros
      drm/i915: Replace GFX_MODE_GEN7 with RING_MODE_GEN7
      drm/i915: Introduce i915_reg_defs.h
      drm/i915/gt: Move engine registers to their own header
      drm/i915: Move SNPS PHY registers to their own header
      drm/i915: Move combo PHY registers to their own header
      drm/i915: Move TC PHY registers to their own header
      drm/i915: Drop unused _PORT3 and _PORT4 TC phy register offsets
      drm/i915/dg2: Add Wa_18018781329
      drm/i915/dg2: Add Wa_14015227452
      drm/i915/dg2: s/engine->i915/i915/ for engine workarounds
      drm/i915: Introduce G12 subplatform of DG2
      drm/i915/perf: Move OA regs to their own header
      drm/i915/perf: Express OA register ranges with i915_range
      drm/i915: Parameterize R_PWR_CLK_STATE register definition
      drm/i915: Parameterize MI_PREDICATE registers
      drm/i915: Move GT registers to their own header file
      drm/i915: Only include i915_reg.h from .c files
      drm/i915: Move [more] GT registers to their own header file
      drm/i915/gt: Drop duplicate register definition for VDBOX_CGCTL3F18
      drm/i915/gt: Move SFC lock bits to intel_engine_regs.h
      drm/i915/gt: Use parameterized RING_MI_MODE
      drm/i915/gt: Cleanup spacing of intel_gt_regs.h
      drm/i915/gt: Use consistent offset notation in intel_gt_regs.h
      drm/i915/gt: Order GT registers by MMIO offset
      drm/i915: Define MCH registers relative to MCHBAR_MIRROR_BASE
      drm/i915: Move MCHBAR registers to their own header
      drm/i915: Add missing intel_mchbar_regs.h
      drm/i915/dg2: Print PHY name properly on calibration error
      drm/i915/dg2: Drop 38.4 MHz MPLLB tables
      drm/i915/dg2: Enable 5th port
      drm/i915/xehp: Define compute class and engine
      drm/i915/xehp: CCS shares the render reset domain
      drm/i915/xehp: Add Compute CS IRQ handlers
      drm/i915/xehp: CCS should use RCS setup functions
      drm/i915: Move context descriptor fields to intel_lrc.h
      drm/i915/xehp: Define context scheduling attributes in lrc descriptor
      drm/i915/xehp: Enable ccs/dual-ctx in RCU_MODE
      drm/i915/xehp: Add compute workarounds

Matthew Auld (27):
      drm/i915: remove writeback hook
      drm/i915: clean up shrinker_release_pages
      drm/i915: don't call free_mmap_offset when purging
      drm/i915/ttm: only fault WILLNEED objects
      drm/i915/ttm: add unmap_virtual callback
      drm/i915/ttm: ensure we unmap when purging
      drm/i915/ttm: tweak priority hint selection
      drm/i915: enforce min GTT alignment for discrete cards
      drm/i915: support 64K GTT pages for discrete cards
      drm/i915/gtt: allow overriding the pt alignment
      drm/i915/gtt: add xehpsdv_ppgtt_insert_entry
      drm/i915/migrate: add acceleration support for DG2
      drm/i915/uapi: document behaviour for DG2 64K support
      drm/i915/ttm: fixup the mock_bo
      drm/i915: apply PM_EARLY for non-GTT mappable objects
      drm/i915: add io_size plumbing
      drm/i915/ttm: require mappable by default
      drm/i915: add I915_BO_ALLOC_GPU_ONLY
      drm/i915/buddy: track available visible size
      drm/i915/buddy: adjust res->start
      drm/i915/buddy: tweak 2big check
      drm/i915/selftests: mock test io_size
      drm/i915/ttm: make eviction mappable aware
      drm/i915/ttm: mappable migration on fault
      drm/i915/selftests: handle allocation failures
      drm/i915/selftests: exercise mmap migration
      drm/i915/gtt: reduce overzealous alignment constraints for GGTT

Matthew Brost (12):
      drm/i915/execlists: Weak parallel submission support for execlists
      drm/i915: Fix possible uninitialized variable in parallel extension
      drm/i915: Increment composite fence seqno
      drm/i915/selftests: Add a cancel request selftest that triggers a res=
et
      drm/i915/guc: Remove hacks for reset and schedule disable G2H
being received out of order
      drm/i915: Allocate intel_engine_coredump_alloc with ALLOW_FAIL
      drm/i915/guc: Add work queue to trigger a GT reset
      drm/i915/guc: Flush G2H handler during a GT reset
      drm/i915: Lock timeline mutex directly in error path of eb_pin_timeli=
ne
      drm/i915/guc: Ensure multi-lrc fini breadcrumb math is correct
      drm/i915/selftests: Use less in contexts steal guc id test
      drm/i915/xehp: Don't support parallel submission on compute / render

Maxime Ripard (27):
      firmware: raspberrypi: Add RPI_FIRMWARE_NOTIFY_DISPLAY_DONE
      drm/vc4: Support nomodeset
      drm/vc4: Remove conflicting framebuffers before callind bind_all
      drm/vc4: Notify the firmware when DRM is in charge
      drm/edid: Rename drm_hdmi_avi_infoframe_colorspace to _colorimetry
      drm/edid: Don't clear formats if using deep color
      drm/edid: Split deep color modes between RGB and YUV444
      drm/connector: Fix typo in output format
      drm/vc4: hdmi: Add full range RGB helper
      drm/vc4: hdmi: Use full range helper in csc functions
      drm/vc4: hdmi: Move XBAR setup to csc_setup
      drm/vc4: hdmi: Replace CSC_CTL hardcoded value by defines
      drm/vc4: hdmi: Define colorspace matrices
      drm/vc4: hdmi: Change CSC callback prototype
      drm/edid: Clear EDID Deep Color Modes in drm_reset_display_info()
      drm/vc4: hdmi: Simplify the connector state retrieval
      dt-bindings: display: Turn lvds.yaml into a generic schema
      dt-bindings: panel: Introduce a panel-lvds binding
      drm/connector: Fix typo in documentation
      drm/omap: plane: Fix zpos initial value mismatch
      drm/msm/mdp5: Remove redundant zpos initialisation
      drm/nouveau/kms: Remove redundant zpos initialisation
      drm/omap: plane: Remove redundant zpos initialisation
      drm/rcar: plane: Remove redundant zpos initialisation
      drm/sti: plane: Remove redundant zpos initialisation
      drm/sun4i: layer: Remove redundant zpos initialisation
      drm/omap: plane: Remove redundant color encoding and range initialisa=
tion

Ma=C3=ADra Canal (10):
      drm/amd/pm: add missing prototypes to amdgpu_dpm_internal
      drm/amdgpu: Change amdgpu_ras_block_late_init_default function scope
      drm/amdgpu: Remove unused get_umc_v8_7_channel_index function
      drm/amd/display: Remove unused temp variable
      drm/amd/display: Remove unused dcn316_smu_set_voltage_via_phyclk func=
tion
      drm/amd/display: Remove vupdate_int_entry definition
      drm/amd/display: Remove unused dmub_outbox_irq_info_funcs variable
      drm/amd/display: Remove unused variable
      drm/amd/display: Add missing prototypes to dcn201_init
      drm/amd/display: Turn global functions into static functions

Meenakshikumar Somasundaram (1):
      drm/amd/display: Fix for dmub outbox notification enable

Melissa Wen (4):
      drm/v3d: centralize error handling when init scheduler fails
      drm/amd/display: move FPU-related code from dcn20 to dml folder
      drm/amd/display: move FPU operations from dcn21 to dml/dcn20 folder
      drm/amd/display: move FPU code from dcn10 to dml/dcn10 folder

Meng Tang (1):
      gpu/amd: vega10_hwmgr: fix inappropriate private variable name

Miaoqian Lin (5):
      drm/bridge: Fix free wrong object in sii8620_init_rcp_input_dev
      drm/bridge: anx7625: Fix null vs IS_ERR() checking in
anx7625_register_i2c_dummy_clients
      drm/bridge: Add missing pm_runtime_disable() in __dw_mipi_dsi_probe
      drm/bridge: nwl-dsi: Fix PM disable depth imbalance in nwl_dsi_probe
      drm/tegra: Fix reference leak in tegra_dsi_ganged_probe

Michael Strauss (1):
      drm/amd/display: Pass HostVM enable flag into DCN3.1 DML

Micha=C5=82 Winiarski (5):
      drm/i915/gt: Use to_gt() helper for GGTT accesses
      drm/i915: Use to_gt() helper for GGTT accesses
      drm/i915/gem: Use to_gt() helper for GGTT accesses
      drm/i915/display: Use to_gt() helper for GGTT accesses
      drm/i915/selftests: Use to_gt() helper for GGTT accesses

Michel D=C3=A4nzer (1):
      drm/amd/display: For vblank_disable_immediate, check PSR is really us=
ed

Minghao Chi (2):
      drm/gma500: remove redundant ret variable
      amdgpu/amdgpu_psp: remove unneeded ret variable

Minghao Chi (CGEL ZTE) (1):
      drm/vc4: Use of_device_get_match_data()

Mukul Joshi (3):
      drm/amdkfd: Fix TLB flushing in KFD SVM with no HWS
      drm/amdkfd: Remove unused old debugger implementation
      drm/amdkfd: Consolidate MQD manager functions

Nancy.Lin (2):
      dt-bindings: display: mediatek: add vdosys1 MERGE property for mt8195
      dt-bindings: display: mediatek: add ethdr definition for mt8195

Nathan Chancellor (2):
      drm/amdkfd: Use proper enum in pm_unmap_queues_v9()
      drm/stm: Avoid using val uninitialized in ltdc_set_ycbcr_config()

Neil Armstrong (2):
      drm/bridge: sii902x: add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
      drm/bridge: dw-hdmi: use safe format when first in bridge chain

Nicholas Bishop (1):
      drm/radeon: Fix backlight control on iMac 12,1

Nicholas Kazlauskas (7):
      drm/amd/display: Only set PSR version when valid
      drm/amd/display: Use PSR version selected during set_psr_caps
      drm/amd/display: Call dc_stream_release for remove link enc assignmen=
t
      drm/amd/display: Fix stream->link_enc unassigned during stream remova=
l
      drm/amd/display: Make functional resource functions non-static
      drm/amd/display: Fix double free during GPU reset on DC streams
      drm/amd/display: Add pstate verification and recovery for DCN31

Nikita Yushchenko (2):
      dt-bindings: display: bridge: renesas,lvds: Document r8a77961 binding=
s
      drm: rcar-du: lvds: Add r8a77961 support

Nishanth Menon (1):
      drm/bridge: cdns-dsi: Make sure to to create proper aliases for dt

Noralf Tr=C3=B8nnes (5):
      dt-bindings: display: add bindings for MIPI DBI compatible SPI panels
      drm/modes: Remove trailing whitespace
      drm/modes: Add of_get_drm_panel_display_mode()
      drm/mipi-dbi: Add driver_private member to struct mipi_dbi_dev
      drm/tiny: Add MIPI DBI compatible SPI driver

Oliver Logush (1):
      drm/amd/display: extend dcn201 support

Paul Boddie (2):
      drm/ingenic: Add support for JZ4780 and HDMI output
      drm/ingenic: Fix support for JZ4780 HDMI output

Paul Hsieh (3):
      drm/amd/display: watermark latencies is not enough on DCN31
      drm/amd/display: change fastboot timing validation
      drm/amd/display: lock/un-lock cursor if odm pipe split used

Paul Menzel (2):
      drm/amdgpu: Fix typo in *whether* in comment
      drm/amdgpu: Use ternary operator in `vcn_v1_0_start()`

Pavel Skripkin (1):
      udmabuf: validate ubuf->pagecount

Philip Yang (10):
      drm/amdkfd: Don't take process mutex for svm ioctls
      drm/amdkfd: Ensure mm remain valid in svm deferred_list work
      drm/amdkfd: svm range restore work deadlock when process exit
      drm/amdkfd: Fix variable set but not used warning
      Revert "drm/amdkfd: process_info lock not needed for svm"
      drm/amdkfd: Correct SMI event read size
      drm/amdkfd: Add SMI add event helper
      drm/amdkfd: Add format attribute to kfd_smi_event_add
      drm/amdgpu: Move reset domain init before calling RREG32
      drm/amdkfd: evict svm bo worker handle error

Philipp Zabel (2):
      drm/edid: support Microsoft extension for HMDs and specialized monito=
rs
      drm/edid: remove non_desktop quirk for HPN-3515 and LEN-B800.

Pin-Yen Lin (1):
      drm/bridge: anx7625: Fix overflow issue on reading EDID

Po Ting Chen (1):
      drm/amd/display: Refactor PSR DPCD caps detection

Prike Liang (19):
      drm/amdgpu/discovery: add nbio sw func for 7.5.1 nbio
      drm/amdgpu/discovery: Add 13.0.9 SMUIO block
      drm/amdgpu/discovery: set sw common init for GC 10.3.7
      drm/amdgpu: set new revision id for 10.3.7 GC
      drm/amdgpu/gmc10: add support for GC 10.3.7
      drm/amdgpu/psp: Add support for MP0 13.0.8
      drm/amd/pm: Add support for MP1 13.0.8
      drm/amdgpu/sdma5.2: add support for SDMA 5.2.7
      drm/amdgpu/gfx10: Add GC 10.3.7 Support
      drm/amd/display: configure dc hw resource for DCN 3.1.6
      drm/amdgpu/discovery: Add sw DM function for 3.1.6 DCE
      drm/amdgpu: enable TMZ option for onwards asic
      drm/amd/pm: validate SMU feature enable message for getting
feature enabled mask
      drm/amdgpu/nv: enable gfx10.3.7 clock gating support
      drm/amdgpu/nv: set mode2 reset for MP1 13.0.8
      drm/amdgpu: enable gfx clock gating control for GC 10.3.7
      drm/amdgpu/nv: enable clock gating for GC 10.3.7 subblock
      drm/amdgpu: enable gfx power gating for GC 10.3.7
      drm/amdgpu: enable gfxoff routine for GC 10.3.7

Qiang Ma (1):
      drm/radeon: fix UVD suspend error

Qiang Yu (2):
      drm/amdgpu: check vm ready by amdgpu_vm->evicting flag
      drm/amdgpu: fix suspend/resume hang regression

Qingqing Zhuo (11):
      drm/amd/include: add DCN 3.1.5 registers
      drm/amd/display: Add DCN315 family information
      drm/amd/display: Add DCN315 CLK_MGR
      drm/amd/display: Add DCN315 GPIO
      drm/amd/display: Add DCN315 IRQ
      drm/amd/display: Add DCN315 DMUB
      drm/amd/display: Add DCN315 Resource
      drm/amd/display: Add DCN315 Command Table Helper
      drm/amd/display: Add DCN315 blocks to Makefile
      drm/amd/display: Add DCN315 CORE
      drm/amd/display: Add DCN315 DM Support

Rahul T R (1):
      drm/panel: simple: Initialize bpc in RK101II01D-CT panel descriptor

Rajat Jain (3):
      drm/privacy_screen: Add drvdata in drm_privacy_screen
      platform/chrome: Add driver for ChromeOS privacy-screen
      drm/privacy_screen_x86: Add entry for ChromeOS privacy-screen

Rajeev Nandan (3):
      dt-bindings: msm/dsi: Add 10nm dsi phy tuning properties
      drm/msm/dsi: Add dsi phy tuning configuration support
      drm/msm/dsi: Add 10nm dsi phy tuning configuration support

Rajib Mahapatra (2):
      drm/amd/display: Not to call dpcd_set_source_specific_data during res=
ume.
      drm/amdgpu: skipping SDMA hw_init and hw_fini for S0ix.

Rajneesh Bhardwaj (21):
      drm/amdkfd: CRIU Introduce Checkpoint-Restore APIs
      drm/amdkfd: CRIU Implement KFD process_info ioctl
      drm/amdkfd: CRIU Implement KFD checkpoint ioctl
      drm/amdkfd: CRIU Implement KFD restore ioctl
      drm/amdkfd: CRIU Implement KFD resume ioctl
      drm/amdkfd: CRIU export BOs as prime dmabuf objects
      drm/amdkfd: CRIU checkpoint and restore xnack mode
      drm/amdkfd: CRIU allow external mm for svm ranges
      drm/amdkfd: use user_gpu_id for svm ranges
      drm/amdkfd: CRIU Discover svm ranges
      drm/amdkfd: CRIU Save Shared Virtual Memory ranges
      drm/amdkfd: CRIU prepare for svm resume
      drm/amdkfd: CRIU resume shared virtual memory ranges
      drm/amdkfd: Bump up KFD API version for CRIU
      drm/amdgpu: Fix recursive locking warning
      drm/amdkfd: CRIU fix extra whitespace and block comment warnings
      drm/amdkfd: Fix prototype warning for get_process_num_bos
      drm/amdgpu: Fix some kerneldoc warnings
      drm/amdkfd: update SPDX license header
      drm/amdkfd: Fix leftover errors and warnings
      drm/amdgpu: Fix a kerneldoc warning

Ramalingam C (5):
      drm/i915/dg2: Add Wa_22011450934
      drm/i915: align the plane_vma to min_page_size of stolen mem
      drm/i915: More gt idling time with guc submission
      drm/i915/perf: Skip the i915_perf_init for dg2
      drm/i915: add needs_compact_pt flag

Randy Dunlap (1):
      drm/amd/display: don't use /** for non-kernel-doc comments

Raphael Gallais-Pou (1):
      drm/stm: ltdc: add support for CRC hashing feature

Reza Amini (1):
      drm/amd/display: Update VSC HDR infoPacket on TF change

Rikard Falkeborn (9):
      drm/i915/gvt: Constify intel_gvt_gtt_gma_ops
      drm/i915/gvt: Constify intel_gvt_gtt_pte_ops
      drm/i915/gvt: Constify intel_gvt_irq_ops
      drm/i915/gvt: Constify intel_gvt_sched_policy_ops
      drm/i915/gvt: Constify gvt_mmio_block
      drm/i915/gvt: Constify cmd_interrupt_events
      drm/i915/gvt: Constify formats
      drm/i915/gvt: Constify gtt_type_table_entry
      drm/i915/gvt: Constify vgpu_types

Rob Clark (13):
      drm/msm/rd: Add chip-id
      drm/msm/dpu: Add SC8180x to hw catalog
      drm/msm/gpu: Add ctx to get_param()
      drm/msm/gpu: Track global faults per address-space
      drm/msm: Avoid dirtyfb stalls on video mode displays (v2)
      drm/msm: Update generated headers
      drm/msm: Add SET_PARAM ioctl
      drm/msm: Add SYSPROF param (v2)
      drm/msm/a6xx: Zap counters across context switch
      drm/msm: Add MSM_SUBMIT_FENCE_SN_IN
      drm/msm/a6xx: Fix missing ARRAY_SIZE() check
      drm/msm: Fix dirtyfb refcounting
      drm/msm/gpu: Fix crash on devices without devfreq support (v2)

Rob Herring (1):
      dt-bindings: display/msm: Drop bogus interrupt flags cell on MDSS nod=
es

Robert Beckett (1):
      drm/i915: add gtt misalignment test

Roberto Sassu (1):
      drm/virtio: Ensure that objs is not NULL in virtio_gpu_array_put_free=
()

Robin Chen (1):
      drm/amd/display: Pass deep sleep disabled allow info to dmub fw

Rodrigo Vivi (3):
      Merge tag 'gvt-next-2022-01-12' of
https://github.com/intel/gvt-linux into drm-intel-next
      Merge drm/drm-next into drm-intel-next
      Merge tag 'drm-intel-gt-next-2022-02-17' of
git://anongit.freedesktop.org/drm/drm-intel into drm-intel-next

Roman Li (3):
      drm/amd/display: Cap pflip irqs per max otg number
      drm/amd/display: Add affected crtcs to atomic state for dsc mst unplu=
g
      drm/amd/display: Add dsc pre-validation in atomic check

Roy Chan (1):
      drm/amd/display: Support synchronized indirect reg access

Ruijing Dong (2):
      drm/amdgpu/vcn: Update fw shared data structure
      drm/amdgpu/vcn: Add vcn firmware log

Sam Ravnborg (1):
      dt-bindings: display: Add ingenic,jz4780-dw-hdmi DT Schema

Sankeerth Billakanti (2):
      dt-bindings: display: simple: Add sharp LQ140M1JW46 panel
      drm/panel-edp: Add eDP sharp panel support

Sathishkumar S (1):
      drm/amdgpu: update vcn/jpeg PG flags for VCN 3.1.1

Sebastian Andrzej Siewior (1):
      drm/i915: Depend on !PREEMPT_RT.

Shah Dharati (1):
      drm/amd/display: Adding a dc_debug option and dmub setting to
use PHY FSM for PSR

Shen, George (2):
      drm/amd/display: Add Cable ID support for native DP
      drm/amd/display: Add link enc null ptr check for cable ID (#2597)

Simon Ser (1):
      drm: document struct drm_mode_fb_cmd2

Solomon Chiu (1):
      drm/amd/display: Enable Freesync Video Mode by default

Somalapuram Amaranath (3):
      drm/amdgpu: limit the number of dst address in trace
      drm/amdgpu: add debugfs for reset registers list
      drm/amdgpu: add reset register dump trace on GPU

Srinivasan Shanmugam (2):
      drm/i915/dg2: Move misplaced 'ctx' & 'gt' wa's to engine wa list
      drm/i915/xehpsdv: Move render/compute engine reset domains
related workarounds

Stanislav Lisovskiy (4):
      drm/i915: Pass plane to watermark calculation functions
      drm/i915: Introduce do_async_flip flag to intel_plane_state
      drm/i915: Use wm0 only during async flips for DG2
      drm/i915: Don't allocate extra ddb during async flip for DG2

Stanley.Yang (10):
      drm/amdgpu: handle denied inject error into critical regions v2
      drm/amdgpu: remove unused variable warning
      drm/amdgpu: fix convert bad page retiremt
      drm/amdgpu: fix channel index mapping for SIENNA_CICHLID
      drm/amdgpu: Reset OOB table error count info
      drm/amdgpu: adjust register address calculation
      drm/amdgpu: print more error info
      drm/amd/pm: add send bad channel info function
      drm/amdgpu: message smu to update bad channel info
      drm/amd/pm: use pm mutex to protect ecc info table

Sung Joon Kim (4):
      drm/amd/display: remove PHY repeater count check for LTTPR mode
      drm/amd/display: reset lane settings after each PHY repeater LT
      drm/amd/display: increasing DRAM BW percent for DCN315
      drm/amd/display: disable HPD SW timer for passive dongle type 1 only

Surbhi Kakarya (1):
      drm/amdgpu: Handle the GPU recovery failure in SRIOV environment.

Tao Zhou (9):
      drm/amdgpu: add umc_fill_error_record to make code more simple
      drm/amdgpu: increase bad page number for umc ras query
      drm/amdgpu: update algorithm of umc address conversion
      drm/amdgpu: get hash bit for CH4 in umc channel index
      drm/amdgpu: fix list add issue in vram reserve
      drm/amdkfd: rename kfd_process_vm_fault to kfd_dqm_evict_pasid
      drm/amdkfd: use unmap all queues for poison consumption
      drm/amdgpu: loose check for umc poison mode
      drm/amdkfd: add return value check for queue eviction

Tejas Upadhyay (3):
      drm/i915/adl-n: Enable ADL-N platform
      drm/i915/gt: use get_reset_domain() helper
      drm/i915/adl-n: Add PCH Support for Alder Lake N

Thierry Reding (3):
      drm/tegra: Fix planar formats on Tegra186 and later
      drm/tegra: Support semi-planar formats on Tegra114+
      drm/tegra: Support YVYU, VYUY and YU24 formats

Thomas Hellstr=C3=B6m (10):
      drm/i915: Initial introduction of vma resources
      drm/i915: Use the vma resource as argument for gtt binding / unbindin=
g
      drm/i915: Don't pin the object pages during pending vma binds
      drm/i915: Use vma resources for async unbinding
      drm/i915: Asynchronous migration selftest
      drm/i915: Use struct vma_resource instead of struct vma_snapshot
      drm/i915: Fix vma resource freeing
      drm/i915: Fix a race between vma / object destruction and unbinding
      drm/i915/ttm: Return some errors instead of trying memcpy move
      drm/i915: Clarify vma lifetime

Thomas Zimmermann (55):
      drm/mipi-dbi: Fix source-buffer address in mipi_dbi_buf_copy
      agp: Remove trailing whitespaces
      agp: Include "compat_ioctl.h" where necessary
      agp: Documentation fixes
      agp/ati: Return error from ati_create_page_map()
      agp/nvidia: Declare value returned by readl() as unused
      agp/sworks: Remove unused variable 'current_size'
      agp/via: Remove unused variable 'current_size'
      drm/dp_mst: Remove trailing whitespace.
      drm/dp: Move DP declarations into separate header file
      drm/dp: Move DisplayPort helpers into separate helper module
      drm/dp: Move public DisplayPort headers into dp/
      drm/dp: Move DisplayPort AUX bus helpers into dp/
      drm/selftests: Select DRM_DP_HELPER
      drm/msm: Fix include statements for DisplayPort
      drm: Provide PCI module-init macros
      drm/ast: Replace module-init boiler-plate code with DRM helpers
      drm/bochs: Replace module-init boiler-plate code with DRM helpers
      drm/cirrus: Replace module-init boiler-plate code with DRM helpers
      drm/hisilicon/hibmc: Replace module initialization with DRM helpers
      drm: Update docs after moving DisplayPort helpers around
      fbdev: Hot-unplug firmware fb devices on forced removal
      drm/simpledrm: Request memory region in driver
      fbdev/simplefb: Request memory region in driver
      drm: Add TODO item for requesting memory regions
      drm/mgag200: Replace module-init boiler-plate code with DRM helpers
      drm/qxl: Move ioctl array next to its only user
      drm/qxl: Replace module-init boiler-plate code with DRM helpers
      drm/vboxvideo: Replace module-init boiler-plate code with DRM helpers
      drm/vmwgfx: Replace module-init boiler-plate code with DRM helpers
      drm/fb-helper: Mark screen buffers in system memory with FBINFO_VIRTF=
B
      drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP
      drm/ast: Fail if connector initialization fails
      drm/ast: Move connector mode_valid function to CRTC
      drm/ast: Remove AST_TX_ITE66121 constant
      drm/ast: Remove unused value dp501_maxclk
      drm/ast: Rename struct ast_connector to struct ast_vga_connector
      drm/ast: Initialize encoder and connector for VGA in helper function
      drm/ast: Read encoder possible-CRTC mask from drm_crtc_mask()
      drm/ast: Move DP501-based connector code into separate helpers
      drm/ast: Move SIL164-based connector code into separate helpers
      drm/fb-helper: Fix clip rectangle height
      drm/fb-helper: Fix vertical damage clipping
      drm/fb-helper: Calculate damaged area in separate helper
      drm/fb-helper: Clip damage area to written memory range
      drm/fb-helper: Clip damage area horizontally
      drm/gem-shmem: Set vm_ops in static initializer
      drm/gem-shmem: Don't store mmap'ed buffers in core dumps
      fbdev/defio: Early-out if page is already enlisted
      fbdev: Don't sort deferred-I/O pages by default
      fbdev: Improve performance of sys_fillrect()
      fbdev: Improve performance of sys_imageblit()
      fbdev: Remove trailing whitespaces from cfbimgblt.c
      fbdev: Improve performance of cfb_imageblit()
      drm: Add TODO item for optimizing format helpers

Tianci Yin (1):
      drm/amdgpu/vcn: fix vcn ring test failure in igt reload test

Tianci.Yin (3):
      drm/amdgpu: Fix an error message in rmmod
      drm/amd/display: fix dp kvm can't light up
      drm/amd: fix gfx hang on renoir in IGT reload test

Tim Huang (4):
      drm/amdgpu: convert to NBIO IP version checking
      drm/amdgpu: convert to UVD IP version checking
      drm/amd/display: convert to DCE IP version checking
      drm/amd/display: Fix unused variable warning

Tom Rix (8):
      drm/amd/pm: return -ENOTSUPP if there is no get_dpm_ultimate_freq fun=
ction
      drm/amd/pm: fix error handling
      drm/amdkfd: fix freeing an unset pointer
      drm/amdkfd: fix loop error handling
      drm/amdgpu: check return status before using stable_pstate
      drm/amdgpu: fix amdgpu_ras_block_late_init error handler
      drm/panfrost: cleanup comments
      drm/amdgpu: Fix realloc of ptr

Tom St Denis (1):
      drm/amd/amdgpu: Add APU flag to gca_config debugfs data (v3)

Tommy Haung (2):
      drm/aspeed: Update INTR_STS handling
      drm/aspeed: Add AST2600 chip support

Tomohito Esaki (4):
      drm: introduce fb_modifiers_not_supported flag in mode_config
      drm: add support modifiers for drivers whose planes only support
linear layout
      drm: remove allow_fb_modifiers
      drm/sprd: remove allow_fb_modifiers setting

Tong Zhang (1):
      drm/i915: fix build issue when using clang

Tvrtko Ursulin (2):
      Merge drm/drm-next into drm-intel-gt-next
      Merge drm/drm-next into drm-intel-gt-next

Umesh Nerlige Ramappa (2):
      drm/i915/pmu: Use PM timestamp instead of RING TIMESTAMP for referenc=
e
      drm/i915/pmu: Fix KMD and GuC race on accessing busyness

Varone (1):
      drm/amd/display: Change error to warning when hpd remains low for eDP

Victor Skvortsov (1):
      drm/amdgpu: Fix wait for RLCG command completion

Victor Zhao (1):
      drm/amdgpu: add determine passthrough under arm64

Ville Syrj=C3=A4l=C3=A4 (129):
      drm/i915/fbc: Parametrize FBC register offsets
      drm/i915/fbc: Loop through FBC instances in various places
      drm/i915/fbc: Introduce device info fbc_mask
      drm/i915/fbc: Register per-crtc debugfs files
      drm/dbi: Use a static inline stub for mipi_dbi_debugfs_init()
      drm: Always include the debugfs dentry in drm_crtc
      drm/i915/fbc: Remember to update FBC state even when not reallocating=
 CFB
      drm/i915: Sipmplify PLANE_STRIDE masking
      drm/i915: Use REG_BIT() & co. for universal plane bits
      drm/i915: Clean up ivb+ sprite plane registers
      drm/i915: Clean up g4x+ sprite plane registers
      drm/i915: Clean up cursor registers
      drm/i915: Extract skl_plane_aux_dist()
      drm/i915: Declutter color key register stuff
      drm/i915: Nuke pointless middle men for skl+ plane programming
      drm/i915: Remove zombie async flip vt-d w/a
      drm/i915/bios: Introduce has_ddi_port_info()
      drm/i915/bios: Use i915->vbt.ports[] on CHV
      drm/i915/bios: Use i915->vbt.ports[] for all g4x+
      drm/i915/bios: Throw out the !has_ddi_port_info() codepaths
      drm/i915/bios: Nuke DEVICE_TYPE_DP_DUAL_MODE_BITS
      drm/i915/hdmi: Ignore DP++ TMDS clock limit for native HDMI ports
      drm/i915: Clean up vlv/chv sprite plane registers
      drm/i915: Clean up pre-skl primary plane registers
      drm/i915/hdmi: Clean up TMDS clock limit exceeding user mode handling
      drm/i915: Nuke dg2_ddi_pre_enable_dp()
      drm/i915: Introduce ilk_pch_pre_enable()
      drm/i915: Skip dsc readout if the transcoder is disabled
      drm/i915: Simplify intel_dsc_source_support()
      drm/i915: Use per-device debugs for bigjoiner stuff
      drm/i915: Extract hsw_configure_cpu_transcoder()
      drm/i915: Move dsc/joiner enable into hsw_crtc_enable()
      drm/i915: Fix up pixel_rate vs. clock confusion in wm calculations
      drm/i915: Use the correct plane source width in watermark calculation=
s
      drm/i915: Use single_enabled_crtc() in i9xx_update_wm()
      drm/i915: Bump DSL linemask to 20 bits
      drm/i915: Clean up PIPEMISC register defines
      drm/i915: Clean up SKL_BOTTOM_COLOR defines
      drm/i915: Clean up PIPECONF bit defines
      drm/i915: Clean up PCH_TRANSCONF/TRANS_DP_CTL bit defines
      drm/i915: Clean up PIPESRC defines
      drm/i915: Extract intel_{get,set}_m_n()
      drm/i915: Clean up M/N register defines
      drm/i915: s/gmch_{m,n}/data_{m,n}/
      drm/i915: Move drrs hardware bit frobbing to small helpers
      drm/i915: Fix oops due to missing stack depot
      drm/i915: Enable rpm wakeref tracking whether runtime pm is enabled o=
r not
      drm/i915: Nuke intel_dp_set_m_n()
      drm/i915: Nuke intel_dp_get_m_n()
      drm/i915: Nuke ilk_get_fdi_m_n_config()
      drm/i915: Split intel_cpu_transcoder_set_m_n() into M1/N1 vs.
M2/N2 variants
      drm/i915: Split intel_cpu_transcoder_get_m_n() into M1/N1 vs.
M2/N2 variants
      drm/i915: Pass crtc+cpu_transcoder to intel_cpu_transcoder_set_m_n()
      drm/i915: Move PCH transcoder M/N setup into the PCH code
      drm/i915: Move M/N setup to a more logical place on ddi platforms
      drm/i915: Extract {i9xx,ilk}_configure_cpu_transcoder()
      drm/i915: Disable DRRS on IVB/HSW port !=3D A
      drm/i915: Extract can_enable_drrs()
      drm/i915: Fix transcoder_has_m2_n2()
      drm/i915: Clear DP M2/N2 when not doing DRRS
      drm/i915: Program pch transcoder m2/n2
      drm/i915: Dump dp_m2_n2 always
      drm/i915: Always check dp_m2_n2 on pre-bdw
      drm/i915: Document BDW+ DRRS M/N programming requirements
      drm/i915: s/GRAPHICS_VER/DISPLAY_VER/ where appropriate
      drm/i915: Allow !join_mbus cases for adlp+ dbuf configuration
      drm/i915: Populate pipe dbuf slices more accurately during readout
      drm/i915: Workaround broken BIOS DBUF configuration on TGL/RKL
      drm/i915: Fix dbuf slice config lookup
      drm/i915: Fix mbus join config lookup
      drm/i915: Move vblank waits out from IPS code
      drm/i915: Change IPS calling convention
      drm/i915: Hoover the IPS enable/disable calls into the pre/post
update hooks
      drm/i915: Move the IPS code to its own file
      drm/i915: Extract hsw_ips_get_config()
      drm/i915: Fix IPS disable in intel_plane_disable_noatomic()
      drm/i915/fbc: Fix the plane end Y offset check
      drm/i915/selftests: Disable runtime pm wakeref tracking for the
mock device
      drm/i915: Drop pointless dev_priv argument
      drm/i915: Extract skl_ddb_entry_init()
      drm/i915: Fix plane relative_data_rate calculation
      drm/i915: Introduce skl_plane_ddb_iter
      drm/i915: Extract skl_allocate_plane_ddb()
      drm/i915: Extract skl_crtc_calc_dbuf_bw()
      drm/i915/hdmi: Simplify intel_hdmi_mode_clock_valid()
      drm/i915/dp: Reuse intel_hdmi_tmds_clock()
      drm/i915: Flag crtc scaling_filter changes as modeset
      drm/i915: Fix bigjoiner state copy fails
      drm/i915: Remove weird code from intel_atomic_check_bigjoiner()
      drm/i915: Clean up the bigjoiner state copy logic
      drm/i915: Nuke some dead code
      drm/i915: Introduce intel_crtc_is_bigjoiner_{slave,master}()
      drm/i915: Convert for_each_intel_crtc_mask() to take a pipe mask inst=
ead
      drm/i915: Use for_each_intel_crtc_in_pipe_mask() more
      drm/i915: Return both master and slave pipes from
enabled_bigjoiner_pipes()
      drm/i915: Change bigjoiner state tracking to use the pipe bitmask
      drm/modes: Fix drm_mode_copy() docs
      drm/i915: Move intel_plane_atomic_calc_changes() & co. out
      drm/i915: Introduce scaled_planes bitmask
      drm/i915: Use {active,scaled}_planes to compute ilk watermarks
      drm/i915: Add REG_GENMASK64() and REG_FIELD_GET64()
      drm/i915: Widen the QGV point mask
      drm/i915: Unconfuse pre-icl vs. icl+ intel_sagv_{pre,post}_plane_upda=
te()
      drm/i915: Clean up SSKPD/MLTR defines
      drm/i915: Introduce intel_crtc_planes_update_arm()
      drm/i915: Polish ilk+ wm register bits
      drm/i915: Move PIPE_CHICKEN RMW out from the vblank evade critical se=
ction
      drm/i915: Make the pipe/output CSC register writes lockless
      drm/i915: Make the CHV CGM CSC register writes lockless
      drm/i915: Drop pointless i830 PIPECONF read
      drm/i915: Correctly populate use_sagv_wm for all pipes
      drm/i915: Fix bw atomic check when switching between SAGV vs. no SAGV
      drm/i915: Split pre-icl vs. icl+ SAGV hooks apart
      drm/i915: Pimp icl+ sagv pre/post update
      drm/vc4: Use drm_mode_copy()
      Revert "drm/i915/display/vrr: Reset VRR capable property on a long hp=
d"
      drm/i915: Dump the crtc hw state always
      drm/i915: Dump hw.enable and pipe_mode
      drm/i915: Remove odd any_ms=3Dtrue assignment
      drm/i915: Properly clear crtc state when disabling it fully, again
      drm/i915: Extract icl_qgv_points_mask()
      drm/i915: Extract intel_bw_check_data_rate()
      drm/i915: Avoid negative shift due to bigjoiner_pipes=3D=3D0
      drm/i915: Don't skip ddb allocation if data_rate=3D=3D0
      drm/i915: Check async flip capability early on
      drm/i915: Fix the async flip wm0/ddb optimization
      drm/amdgpu: Remove pointless on stack mode copies
      drm/radeon: Use drm_mode_copy()
      drm/amdgpu: Use drm_mode_copy()

Vinay Belgaumkar (2):
      drm/i915/guc/slpc: Correct the param count for unset param
      drm/i915/guc/slpc: Use wrapper for reading RP_STATE_CAP

Vinod Koul (3):
      drm/msm/dpu: Remove set but unused variables
      drm/msm/dpu: Update the comment style
      drm/msm/dpu: Update function parameter documentation

Wayne Lin (5):
      drm/amd/display: Don't update drm connector when read local EDID
      drm/amd/display: Reset preferred training settings immediately
      drm/amd/display: clear remote dc_sink when stop mst
      drm/amd/display: Fix a few parts in debugfs entry
      drm/amd/display: Retry when fail reading lane status during LT

Weiguo Li (1):
      drm/amdgpu: remove redundant null check

Wenjing Liu (17):
      drm/amd/display: factor out dp detection link training and mst
top detection
      drm/amd/display: Drop DCN for DP2.x logic
      drm/amd/display: abstract encoder related hwseq across different type=
s
      drm/amd/display: add more link_hwss types and method to decide which =
one
      drm/amd/display: rename dc_link_hwss struct to link_hwss
      drm/amd/display: fix a coding error causing set throttled vcp
size skipped for dpia
      drm/amd/display: allow set dp drive setting when stream is not presen=
t
      drm/amd/display: add setup/reset stream encoder to link_hwss
      drm/amd/display: refactor destructive verify link cap sequence
      drm/amd/display: add enable/disable dp link output to link_hwss
      drm/amd/display: add set dp link test pattern to link_hwss
      drm/amd/display: add set dp lane settings to link_hwss
      drm/amd/display: temporarly move non link_hwss code to dc_link_dp
      drm/amd/display: move get_link_hwss to dc_resource
      drm/amd/display: move link_hwss to link folder and break down to file=
s
      drm/amd/display: add cable ID support for usb c connector
      drm/amd/display: handle DP2.0 RX with UHBR20 but not UHBR13.5 support

Wesley Chalmers (1):
      drm/amd/display: Program OPP before ODM

Wyatt Wood (2):
      drm/amd/display: Improve dce_aux_transfer_with_retries logging
      drm/amd/display: Release AUX engine after failed acquire

Xiang wangx (1):
      drm/tilcdc: add const to of_device_id

Xiaogang Chen (1):
      drm/amdgpu: config HDP_MISC_CNTL.READ_BUFFER_WATERMARK

Xiaojian Du (3):
      drm/amdgpu: add vram check function for GMC
      drm/amdgpu: modify a pair of functions for the pcie port wreg/rreg
      drm/amdgpu: fix the page fault caused by uninitialized variables

Xin Ji (6):
      drm/bridge: anx7625: Check GPIO description to avoid crash
      drm/bridge: anx7625: Add bridge helper atomic conversion
      drm/bridge: anx7625: add HDCP support
      drm/bridge: anx7625: add audio codec .get_eld support
      drm/bridge: anx7625: send DPCD command to downstream
      drm/bridge: anx7625: Fix release wrong workqueue

Xin Xiong (1):
      drm/amd/amdgpu/amdgpu_cs: fix refcount leak of a dma_fence obj

Yang Li (5):
      drm/amdgpu: remove unneeded semicolon
      drm/amdgpu: clean up some inconsistent indenting
      drm/amd/display: clean up some inconsistent indenting
      drm/amd/display: clean up some inconsistent indenting
      drm/msm/dpu: clean up some inconsistent indenting

Yang Wang (4):
      drm/amd/pm: drm/amd/pm: disable GetPptLimit message in sriov mode
      drm/amd/pm: fix hwmon node of power1_label create issue
      drm/amd/pm: correct hwmon power label name
      drm/amdgpu: fix gmc init fail in sriov mode

Yannick Fertre (7):
      drm/stm: remove conflicting framebuffers
      drm/stm: ltdc: support of new hardware version
      drm/stm: ltdc: switch to regmap
      drm/stm: ltdc: add YCbCr 422 output support
      drm/stm: ltdc: add per plane update support
      drm/stm: ltdc: add support of flexible pixel formats
      drm/stm: ltdc: add support of ycbcr pixel formats

Yaroslav Bolyukin (1):
      drm/edid: Support type 7 timings

Yifan Zha (1):
      drm/amdgpu: Move CAP firmware loading to the beginning of PSP
firmware list

Yifan Zhang (24):
      drm/amd/pm: correct the sequence of sending gpu reset msg
      drm/amdgpu: add nv common init for gc 10.3.6
      drm/amdgpu: add Clock and Power Gating support for gc 10.3.6
      drm/amdgpu: add support for gmc10 for gc 10.3.6
      drm/amdgpu: add gc 10.3.6 support
      drm/amdgpu: add support for sdma 5.2.6
      drm/amdgpu: add support for nbio 7.3.0
      drm/amdgpu: add smuio support for smuio 13.0.10
      drm/amdgpu: add support for psp 13.0.5
      drm/admgpu/pm: add smu 13.0.5 driver interface headers
      drm/amd/pm: update smc message sequence for smu 13.0.5
      drm/amd/pm: add smu_v13_0_5_ppt implementation
      drm/amdgpu: add mp 13.0.5 header files
      drm/amdgpu: add dm ip block for dcn 3.1.5
      drm/amdgpu: add mode2 reset support for smu 13.0.5
      drm/amd/pm: fix mode2 reset fail for smu 13.0.5
      drm/amd/pm: refine smu 13.0.5 pp table code
      drm/amdgpu: add gfxoff support for smu 13.0.5
      drm/amdgpu: move amdgpu_gmc_noretry_set after ip_versions populated
      drm/amdgpu: convert code name to ip version for noretry set
      drm/amdkfd: judge get_atc_vmid_pasid_mapping_info before call
      drm/amdkfd: implement get_atc_vmid_pasid_mapping_info for gfx10.3
      drm/amdkfd: bail out early if no get_atc_vmid_pasid_mapping_info
      drm/amdgpu: change registers in error checking for smu 13.0.5

Yiqing Yao (1):
      drm/amd/pm: enable pm sysfs write for one VF mode

Yongqiang Sun (2):
      drm/amdgpu: Merge get_reserved_allocation to get_vbios_allocations.
      drm/amdgpu: Add stolen reserved memory for MI25 SRIOV.

Yongzhi Liu (4):
      drm/amdgpu: Add missing pm_runtime_put_autosuspend
      drm/amd/display: Fix memory leak
      drm/bridge: Add missing pm_runtime_put_sync
      drm/v3d: fix missing unlock

Yunlong Jia (1):
      gpu: drm: panel-edp: Add panels planned for sc7180-trogdor-pazquel

Yury Norov (1):
      drm: replace bitmap_weight with bitmap_empty where appropriate

Zack Rusin (4):
      drm/vmwgfx: Fix a size_t/long int format specifier mismatch
      drm/vmwgfx: Remove explicit transparent hugepages support
      drm/vmwgfx: Remove unused compile options
      drm/vmwgfx: Fix possible usage of an uninitialized variable

Zhan Liu (4):
      drm/amd/display: Correct MPC split policy for DCN301
      drm/amd/display: change FIFO reset condition to embedded display only
      drm/amd/display: revert "Reset fifo after enable otg"
      drm/amd/display: keep eDP Vdd on when eDP stream is already enabled

Zhenyu Wang (1):
      drm/i915/gvt: Fix cmd parser error for Passmark9

Zhi Wang (1):
      drm/i915/gvt: add the missing mdev attribute "name"

Zhiming Liu (1):
      drm/bridge: Remove extra device acquisition method of i2c client
in lt9611 driver

Zhou Qingyang (3):
      drm/nouveau/acr: Fix undefined behavior in nvkm_acr_hsfw_load_bl()
      drm/amd/display/dc/calcs/dce_calcs: Fix a memleak in calculate_bandwi=
dth()
      drm/amd/display: Fix a NULL pointer dereference in
amdgpu_dm_connector_add_common_modes()

chiminghao (1):
      drm/tegra: dpaux: Remove unneeded variable

huangqu (1):
      drm/amdgpu: Wrong order for config and counter_id parameters

jason-jh.lin (5):
      dt-bindings: display: mediatek: disp: split each block to individual =
yaml
      dt-bindings: display: mediatek: dsc: add yaml for mt8195 SoC binding
      dt-bindings: display: mediatek: merge: add additional prop for mt8195
      dt-bindings: display: mediatek: add mt8195 SoC binding for vdosys0
      drm/mediatek: Add wait_for_event for crtc disable by cmdq

jinzh (1):
      drm/amd/display: refine the EDID override

mziya (4):
      drm/amd/pm: Update smu driver interface for sienna cichlid
      drm/amdgpu: add new query interface for umc_v8_7 block
      drm/amd/pm: add message smu to get ecc_table
      drm/amdgpu: remove unused variable

owen (1):
      drm/bridge: anx7625: Return -EPROBE_DEFER if the dsi host was not fou=
nd

shaoyunl (1):
      drm/amdgpu: Disable FRU EEPROM access for SRIOV

tangmeng (1):
      drm/amd/amdgpu: fix spelling mistake "disbale" -> "disable"

yangcong (1):
      drm/panel: Update Boe-tv110c9m initial code

yipechai (59):
      drm/amdgpu: Unify ras block interface for each ras block
      drm/amdgpu: Modify the compilation failed problem when other ras
blocks' .h include amdgpu_ras.h
      drm/amdgpu: Modify gfx block to fit for the unified ras block data an=
d ops
      drm/amdgpu: Modify xgmi block to fit for the unified ras block
data and ops
      drm/amdgpu: Modify hdp block to fit for the unified ras block data an=
d ops
      drm/amdgpu: Modify mmhub block to fit for the unified ras block
data and ops
      drm/amdgpu: Modify nbio block to fit for the unified ras block
data and ops
      drm/amdgpu: Modify umc block to fit for the unified ras block data an=
d ops
      drm/amdgpu: Modify sdma block to fit for the unified ras block
data and ops
      drm/amdgpu: Modify mca block to fit for the unified ras block data an=
d ops
      drm/amdgpu: Adjust error inject function code style in amdgpu_ras.c
      drm/amdgpu: Removed redundant ras code
      drm/amdgpu: Add ras supported check for register_ras_block
      drm/amdgpu: No longer insert ras blocks into ras_list if it
already exists in ras_list
      drm/amdgpu: Use ARRAY_SIZE to get array length
      drm/amdgpu: fix compile warning for ras_block_match_default
      drm/amdgpu: Fix the code style warnings in amdgpu_ras
      drm/amdgpu: Fix the code style warnings in gfx
      drm/amdgpu: Fix the code style warnings in gmc
      drm/amdgpu: Fix the code style warnings in sdma
      drm/amdgpu: Fix the code style warnings in hdp xgmi mca and umc
      drm/amdgpu: Remove repeated calls
      drm/amdgpu: Move xgmi ras initialization from .late_init to .early_in=
it
      Revert "drm/amdgpu: No longer insert ras blocks into ras_list if
it already exists in ras_list"
      drm/amdgpu: Add judgement to avoid infinite loop
      drm/amdgpu: Fixed the defect of soft lock caused by infinite loop
      Revert "drm/amdgpu: Add judgement to avoid infinite loop"
      drm/amdgpu: Optimize xxx_ras_late_init/xxx_ras_late_fini for
each ras block
      drm/amdgpu: Optimize
amdgpu_gfx_ras_late_init/amdgpu_gfx_ras_fini function code
      drm/amdgpu: Optimize
amdgpu_hdp_ras_late_init/amdgpu_hdp_ras_fini function code
      drm/amdgpu: Optimize
amdgpu_mca_ras_late_init/amdgpu_mca_ras_fini function code
      drm/amdgpu: Optimize
amdgpu_mmhub_ras_late_init/amdgpu_mmhub_ras_fini function code
      drm/amdgpu: Optimize
amdgpu_nbio_ras_late_init/amdgpu_nbio_ras_fini function code
      drm/amdgpu: Optimize
amdgpu_sdma_ras_late_init/amdgpu_sdma_ras_fini function code
      drm/amdgpu: Optimize
amdgpu_umc_ras_late_init/amdgpu_umc_ras_fini function code
      drm/amdgpu: Optimize
amdgpu_xgmi_ras_late_init/amdgpu_xgmi_ras_fini function code
      drm/amdgpu: Optimize operating sysfs and interrupt function
interface in amdgpu_ras.c
      drm/amdgpu: Merge amdgpu_ras_late_init/amdgpu_ras_late_fini to
amdgpu_ras_block_late_init/amdgpu_ras_block_late_fini
      drm/amdgpu: Modify .ras_late_init function pointer parameter
      drm/amdgpu: Remove redundant calls of ras_late_init in hdp ras block
      drm/amdgpu: Remove redundant calls of ras_late_init in mmhub ras bloc=
k
      drm/amdgpu: Remove redundant calls of ras_late_init in mca ras block
      drm/amdgpu: Optimize xxx_ras_late_init function of each ras block
      drm/amdgpu: define amdgpu_ras_late_init to call all ras blocks'
.ras_late_init
      drm/amdgpu: Remove redundant .ras_late_init initialization in
some ras blocks
      drm/amdgpu: Fixed warning reported by kernel test robot
      drm/amdgpu: Modify .ras_fini function pointer parameter
      drm/amdgpu: Optimize xxx_ras_fini function of each ras block
      drm/amdgpu: centrally calls the .ras_fini function of all ras blocks
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini
in gfx ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini
in mmhub ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini
in nbio ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini
in umc ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini
in xgmi ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini
in hdp ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini
in sdma ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini
in mca ras block
      drm/amdgpu: Remove redundant .ras_fini initialization in some ras blo=
cks
      drm/amdgpu: fixed the warnings reported by kernel test robot

zhanglianjie (2):
      drm/radeon/uvd: Fix forgotten unmap buffer objects
      drm/amd/amdgpu/amdgpu_uvd: Fix forgotten unmap buffer object

 .../bindings/display/bridge/analogix,anx7625.yaml  |     17 +
 .../display/bridge/ingenic,jz4780-hdmi.yaml        |     82 +
 .../bindings/display/bridge/lvds-codec.yaml        |      3 +-
 .../bindings/display/bridge/renesas,lvds.yaml      |      1 +
 .../bindings/display/bridge/ti,sn65dsi83.yaml      |      5 +-
 .../bindings/display/{panel =3D> }/lvds.yaml         |     35 +-
 .../bindings/display/mediatek/mediatek,aal.yaml    |     77 +
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |     76 +
 .../bindings/display/mediatek/mediatek,color.yaml  |     86 +
 .../bindings/display/mediatek/mediatek,disp.txt    |    219 -
 .../bindings/display/mediatek/mediatek,dither.yaml |     76 +
 .../bindings/display/mediatek/mediatek,dsc.yaml    |     71 +
 .../bindings/display/mediatek/mediatek,ethdr.yaml  |    147 +
 .../bindings/display/mediatek/mediatek,gamma.yaml  |     77 +
 .../bindings/display/mediatek/mediatek,merge.yaml  |    110 +
 .../bindings/display/mediatek/mediatek,mutex.yaml  |     83 +
 .../bindings/display/mediatek/mediatek,od.yaml     |     53 +
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml |     88 +
 .../bindings/display/mediatek/mediatek,ovl.yaml    |    103 +
 .../display/mediatek/mediatek,postmask.yaml        |     69 +
 .../bindings/display/mediatek/mediatek,rdma.yaml   |    117 +
 .../bindings/display/mediatek/mediatek,split.yaml  |     58 +
 .../bindings/display/mediatek/mediatek,ufoe.yaml   |     61 +
 .../bindings/display/mediatek/mediatek,wdma.yaml   |     86 +
 .../bindings/display/msm/dp-controller.yaml        |      1 +
 .../bindings/display/msm/dpu-msm8998.yaml          |    219 +
 .../bindings/display/msm/dpu-qcm2290.yaml          |    215 +
 .../bindings/display/msm/dsi-controller-main.yaml  |      5 +-
 .../bindings/display/msm/dsi-phy-10nm.yaml         |     36 +
 .../display/panel/advantech,idk-1110wr.yaml        |     19 +-
 .../display/panel/innolux,ee101ia-01d.yaml         |     23 +-
 .../display/panel/mitsubishi,aa104xd12.yaml        |     19 +-
 .../display/panel/mitsubishi,aa121td01.yaml        |     19 +-
 .../bindings/display/panel/panel-lvds.yaml         |     57 +
 .../bindings/display/panel/panel-mipi-dbi-spi.yaml |    126 +
 .../bindings/display/panel/panel-simple.yaml       |      4 +
 .../bindings/display/panel/sgd,gktw70sdae4se.yaml  |     19 +-
 .../bindings/display/panel/sony,acx424akp.yaml     |     11 +-
 .../bindings/display/solomon,ssd1307fb.yaml        |      1 +
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |     15 +
 Documentation/driver-api/device-io.rst             |      9 +
 Documentation/driver-api/dma-buf.rst               |      9 -
 Documentation/gpu/drm-internals.rst                |      6 +
 Documentation/gpu/drm-kms-helpers.rst              |     26 +-
 Documentation/gpu/drm-kms.rst                      |      6 +-
 Documentation/gpu/drm-mm.rst                       |      2 +-
 Documentation/gpu/i915.rst                         |      1 +
 Documentation/gpu/todo.rst                         |     82 +-
 Documentation/gpu/vkms.rst                         |      2 -
 MAINTAINERS                                        |     40 +-
 arch/x86/kernel/early-quirks.c                     |      1 +
 drivers/char/agp/ati-agp.c                         |      8 +-
 drivers/char/agp/backend.c                         |      2 +
 drivers/char/agp/frontend.c                        |      4 +-
 drivers/char/agp/nvidia-agp.c                      |      3 +-
 drivers/char/agp/sworks-agp.c                      |      5 +-
 drivers/char/agp/via-agp.c                         |      3 -
 drivers/dma-buf/dma-buf.c                          |     22 +-
 drivers/dma-buf/dma-fence-array.c                  |     14 +
 drivers/dma-buf/dma-fence-chain.c                  |     15 +-
 drivers/dma-buf/dma-resv.c                         |     82 +-
 drivers/dma-buf/heaps/cma_heap.c                   |     10 +-
 drivers/dma-buf/heaps/system_heap.c                |     10 +-
 drivers/dma-buf/st-dma-resv.c                      |     26 +-
 drivers/dma-buf/udmabuf.c                          |      4 +
 drivers/firmware/sysfb_simplefb.c                  |      2 +-
 drivers/gpu/drm/Kconfig                            |     18 +
 drivers/gpu/drm/Makefile                           |     15 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |      6 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |     68 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    161 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |      7 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |      3 -
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |      3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |     24 -
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |     35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c  |     96 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c  |     24 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |     28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |     10 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |     76 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |      2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h       |     22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c      |    244 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |     38 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |      8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |     33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h             |     80 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |    140 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    164 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    468 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    683 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |     43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    149 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |     43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |     53 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |     36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h           |     15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |      8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |     73 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |     25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    166 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |     14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |     59 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |     14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |     12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |     12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |      9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    126 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |     45 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |     20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c          |     68 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |     14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |      5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |     47 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |     12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |     10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c    |     65 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    131 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |      9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    548 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |     80 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |     60 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |      4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |     64 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |     40 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |      6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |     65 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |     16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |     53 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |     15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |      5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_test.c           |    250 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |     21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.c   |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    419 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |     21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |      3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |    114 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |     24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |     39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.h            |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    117 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h            |      7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    142 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |     30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    151 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |     26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |     15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |     63 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    143 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |     10 +-
 drivers/gpu/drm/amd/amdgpu/athub_v1_0.c            |     13 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_0.c            |      1 +
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.c            |      1 +
 drivers/gpu/drm/amd/amdgpu/atom.c                  |      4 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |      2 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |      2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |      4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |      4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |      3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |      4 +-
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |      6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    353 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    230 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c              |     24 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.h              |      2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |     25 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.h            |      2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |     56 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |     12 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |     13 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |     13 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    104 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |     18 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.h              |      2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |      9 +-
 drivers/gpu/drm/amd/amdgpu/mca_v3_0.c              |    108 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |     10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.h            |      2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |     10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.h            |      2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |      1 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |     10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.h            |      2 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |     19 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |     19 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |     13 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |     48 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |     34 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.h             |      2 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |    129 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |      1 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |      4 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |     15 +
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |      1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |      1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |      1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |     67 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4.c             |     25 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4.h             |      2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |      9 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |     29 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |      2 +-
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c         |     81 +-
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.h         |      6 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |     62 +-
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |      8 +-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |      3 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_1.c              |     30 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_1.h              |      2 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |    225 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.h              |     25 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_7.c              |    166 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_7.h              |      2 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |     14 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |     17 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |     25 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |     23 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |     53 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |      2 +-
 drivers/gpu/drm/amd/amdkfd/Makefile                |      2 -
 drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c   |      2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   1593 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |      8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.h              |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c            |    845 -
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.h            |    230 -
 drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.c            |    158 -
 drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.h            |    293 -
 drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c           |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |     67 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    274 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |     62 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_cik.c  |      3 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v10.c  |     12 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |      3 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_vi.c   |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |    316 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.h            |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |     11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c         |     11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c             |     15 +-
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.h             |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.h      |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |     53 +-
 drivers/gpu/drm/amd/amdkfd/kfd_module.c            |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |     67 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |     44 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |    126 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |    155 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |    175 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |    151 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |     11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |     52 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c |     29 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pasid.c             |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers.h       |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h    |      3 +-
 .../gpu/drm/amd/amdkfd/kfd_pm4_headers_aldebaran.h |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_diq.h   |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_vi.h    |      7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_opcodes.h       |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    196 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |     95 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |    375 +-
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |     77 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h        |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    467 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |     39 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |      9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |      3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    196 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     15 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    136 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |      4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    203 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    293 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |     14 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c   |    248 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |     64 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |      8 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |      2 -
 .../gpu/drm/amd/display/dc/bios/command_table.c    |      6 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |      4 -
 .../amd/display/dc/bios/command_table_helper2.c    |      2 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |     19 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |     37 +-
 .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |      2 +
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       |      3 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |     18 +-
 .../dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c       |      9 +-
 .../dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.h       |     67 +-
 .../dc/clk_mgr/dcn30/dcn30_smu11_driver_if.h       |     74 +
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |      8 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |     21 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.h   |      2 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |    620 +
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.h |     49 +
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |    338 +
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.h |    128 +
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    717 +
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.h |     49 +
 .../drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c |    338 +
 .../drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.h |    139 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |     97 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    917 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |      5 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   1713 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c |      2 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |     31 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |    917 -
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    111 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |     37 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |     48 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |     88 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |     60 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |      1 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |     62 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |      8 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |      7 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |      5 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c   |      2 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |    117 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |      9 +
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c       |     26 +
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c.h       |      6 +
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |     17 +-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.h  |      3 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c   |     25 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.h   |      4 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |      5 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |    156 +-
 .../drm/amd/display/dc/dce112/dce112_resource.c    |      2 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c    |      1 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |     15 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h  |      4 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |     27 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |     18 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |      3 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |     77 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.h  |      4 +
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |     25 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |     15 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |     21 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |     63 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   1374 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.h  |     31 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_init.c    |      1 +
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |     25 -
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |    564 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.h  |     11 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c    |      2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.c    |      1 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |      7 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |     11 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_hubbub.c  |      1 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |      4 +-
 drivers/gpu/drm/amd/display/dc/dcn302/Makefile     |     12 -
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |    320 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.h    |      3 +
 drivers/gpu/drm/amd/display/dc/dcn303/Makefile     |     26 -
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |    331 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.h    |      3 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |    106 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h  |      6 +
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |      9 -
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |     11 +
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h |      9 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |     60 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |     28 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |      2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h  |      2 +
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |      5 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |     17 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |      5 +
 .../drm/amd/display/dc/{calcs =3D> dcn315}/Makefile  |     36 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   2284 +
 .../drm/amd/display/dc/dcn315/dcn315_resource.h    |     42 +
 drivers/gpu/drm/amd/display/dc/dcn316/Makefile     |     56 +
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |   2285 +
 .../drm/amd/display/dc/dcn316/dcn316_resource.h    |     42 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |      9 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |     16 +-
 .../drm/amd/display/dc/{ =3D> dml}/calcs/bw_fixed.c  |      0
 .../amd/display/dc/{ =3D> dml}/calcs/calcs_logger.h  |      0
 .../amd/display/dc/{ =3D> dml}/calcs/custom_float.c  |      0
 .../drm/amd/display/dc/{ =3D> dml}/calcs/dce_calcs.c |     48 +-
 .../amd/display/dc/{ =3D> dml}/calcs/dcn_calc_auto.c |      0
 .../amd/display/dc/{ =3D> dml}/calcs/dcn_calc_auto.h |      0
 .../amd/display/dc/{ =3D> dml}/calcs/dcn_calc_math.c |      0
 .../drm/amd/display/dc/{ =3D> dml}/calcs/dcn_calcs.c |      0
 .../gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.c   |    123 +
 .../gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h   |     30 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   1926 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h   |     51 +
 .../gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c |    357 +
 .../gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.h |     32 +
 .../gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c |    362 +
 .../gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.h |     32 +
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |     29 +-
 .../drm/amd/display/dc/dml/display_mode_structs.h  |      1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |     24 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |      3 +
 .../gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c   |      2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |      2 +-
 drivers/gpu/drm/amd/display/dc/gpio/Makefile       |      8 +
 .../amd/display/dc/gpio/dcn30/hw_factory_dcn30.c   |      4 +-
 .../amd/display/dc/gpio/dcn30/hw_translate_dcn30.c |      4 +-
 .../amd/display/dc/gpio/dcn315/hw_factory_dcn315.c |    260 +
 .../amd/display/dc/gpio/dcn315/hw_factory_dcn315.h |     31 +
 .../display/dc/gpio/dcn315/hw_translate_dcn315.c   |    374 +
 .../display/dc/gpio/dcn315/hw_translate_dcn315.h   |     33 +
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c |      6 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |      5 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |      5 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     13 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |     56 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |      4 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |      2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |      1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |      2 -
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |      5 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/panel_cntl.h |      1 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |      6 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |      2 -
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |      3 +-
 drivers/gpu/drm/amd/display/dc/inc/link_dpcd.h     |      2 +-
 drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h  |      8 +
 drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |     86 +-
 drivers/gpu/drm/amd/display/dc/inc/reg_helper.h    |     34 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |     16 +-
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |      8 +
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.c   |      2 +-
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |      5 -
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |     14 -
 .../amd/display/dc/irq/dcn30/irq_service_dcn30.c   |      6 +-
 .../amd/display/dc/irq/dcn315/irq_service_dcn315.c |    438 +
 .../amd/display/dc/irq/dcn315/irq_service_dcn315.h |     34 +
 drivers/gpu/drm/amd/display/dc/link/Makefile       |     30 +
 .../gpu/drm/amd/display/dc/link/link_dp_trace.c    |    146 +
 .../gpu/drm/amd/display/dc/link/link_dp_trace.h    |     57 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dio.c    |    137 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dio.h    |     53 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dpia.c   |     51 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dpia.h   |     34 +
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |    254 +
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.h |     35 +
 .../drm/amd/display/dc/link/link_hwss_hpo_frl.c    |     43 +
 .../drm/amd/display/dc/link/link_hwss_hpo_frl.h    |     34 +
 drivers/gpu/drm/amd/display/dc/os_types.h          |      2 +-
 drivers/gpu/drm/amd/display/dc/virtual/Makefile    |      2 +-
 .../amd/display/dc/virtual/virtual_link_encoder.c  |      3 +-
 .../drm/amd/display/dc/virtual/virtual_link_hwss.c |     43 +
 .../drm/amd/display/dc/virtual/virtual_link_hwss.h |     34 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |      2 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    153 +-
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |      2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |      2 +-
 .../dmub/src/dmub_dcn315.c}                        |     74 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn315.h |     68 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn316.c |     62 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn316.h |     33 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |     11 +-
 .../drm/amd/display/include/bios_parser_types.h    |      2 -
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     13 +-
 drivers/gpu/drm/amd/display/include/dal_types.h    |      2 +
 .../drm/amd/display/include/ddc_service_types.h    |      7 +
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |      6 +-
 .../amd/display/include/grph_object_ctrl_defs.h    |     22 -
 .../gpu/drm/amd/display/include/grph_object_defs.h |      2 -
 .../gpu/drm/amd/display/include/grph_object_id.h   |      2 -
 .../drm/amd/display/include/link_service_types.h   |     12 -
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    |      2 +-
 .../drm/amd/display/modules/inc/mod_info_packet.h  |      3 +-
 .../amd/display/modules/info_packet/info_packet.c  |     25 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |      3 +-
 .../amd/include/asic_reg/dcn/dcn_3_1_5_offset.h    |  15191 ++
 .../amd/include/asic_reg/dcn/dcn_3_1_5_sh_mask.h   |  62061 ++++++++
 .../amd/include/asic_reg/dcn/dcn_3_1_6_offset.h    |  15682 ++
 .../amd/include/asic_reg/dcn/dcn_3_1_6_sh_mask.h   |  62717 ++++++++
 .../asic_reg/{dcn =3D> dpcs}/dpcs_3_0_0_offset.h     |      7 +
 .../asic_reg/{dcn =3D> dpcs}/dpcs_3_0_0_sh_mask.h    |      7 +
 .../asic_reg/{dcn =3D> dpcs}/dpcs_3_0_3_offset.h     |      0
 .../asic_reg/{dcn =3D> dpcs}/dpcs_3_0_3_sh_mask.h    |      0
 .../amd/include/asic_reg/dpcs/dpcs_4_2_2_offset.h  |  11957 ++
 .../amd/include/asic_reg/dpcs/dpcs_4_2_2_sh_mask.h | 103633 +++++++++++++
 .../amd/include/asic_reg/dpcs/dpcs_4_2_3_offset.h  |  11969 ++
 .../amd/include/asic_reg/dpcs/dpcs_4_2_3_sh_mask.h | 136141 ++++++++++++++=
++++
 .../drm/amd/include/asic_reg/hdp/hdp_4_0_sh_mask.h |      2 +
 .../drm/amd/include/asic_reg/mp/mp_13_0_5_offset.h |    455 +
 .../amd/include/asic_reg/mp/mp_13_0_5_sh_mask.h    |    672 +
 .../drm/amd/include/asic_reg/mp/mp_13_0_8_offset.h |    410 +
 .../amd/include/asic_reg/mp/mp_13_0_8_sh_mask.h    |    603 +
 .../amd/include/asic_reg/umc/umc_6_7_0_offset.h    |      6 +
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |      9 -
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |     13 +-
 drivers/gpu/drm/amd/pm/Makefile                    |     13 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   2537 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c       |     95 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    619 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    374 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm_internal.h   |     32 +
 drivers/gpu/drm/amd/pm/legacy-dpm/Makefile         |     32 +
 .../drm/amd/pm/{powerplay =3D> legacy-dpm}/cik_dpm.h |      0
 .../drm/amd/pm/{powerplay =3D> legacy-dpm}/kv_dpm.c  |     37 +-
 .../drm/amd/pm/{powerplay =3D> legacy-dpm}/kv_dpm.h  |      0
 .../drm/amd/pm/{powerplay =3D> legacy-dpm}/kv_smc.c  |      0
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     |   1081 +
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.h     |     38 +
 .../drm/amd/pm/{powerplay =3D> legacy-dpm}/ppsmc.h   |      0
 .../amd/pm/{powerplay =3D> legacy-dpm}/r600_dpm.h    |      0
 .../drm/amd/pm/{powerplay =3D> legacy-dpm}/si_dpm.c  |    188 +-
 .../drm/amd/pm/{powerplay =3D> legacy-dpm}/si_dpm.h  |     15 +-
 .../drm/amd/pm/{powerplay =3D> legacy-dpm}/si_smc.c  |      0
 .../pm/{powerplay =3D> legacy-dpm}/sislands_smc.h    |      0
 drivers/gpu/drm/amd/pm/powerplay/Makefile          |      4 -
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |    400 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |      8 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |     10 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |     68 +-
 .../drm/amd/pm/{ =3D> powerplay}/inc/amd_powerplay.h |      0
 .../gpu/drm/amd/pm/{ =3D> powerplay}/inc/cz_ppsmc.h  |      0
 .../drm/amd/pm/{ =3D> powerplay}/inc/fiji_ppsmc.h    |      0
 .../amd/pm/{ =3D> powerplay}/inc/hardwaremanager.h   |      0
 drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/hwmgr.h |      4 -
 .../pm/{ =3D> powerplay}/inc/polaris10_pwrvirus.h    |      0
 .../drm/amd/pm/{ =3D> powerplay}/inc/power_state.h   |      0
 .../gpu/drm/amd/pm/{ =3D> powerplay}/inc/pp_debug.h  |      0
 .../gpu/drm/amd/pm/{ =3D> powerplay}/inc/pp_endian.h |      0
 .../drm/amd/pm/{ =3D> powerplay}/inc/pp_thermal.h    |      0
 .../drm/amd/pm/{ =3D> powerplay}/inc/ppinterrupt.h   |      0
 .../gpu/drm/amd/pm/{ =3D> powerplay}/inc/rv_ppsmc.h  |      0
 drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu10.h |      0
 .../amd/pm/{ =3D> powerplay}/inc/smu10_driver_if.h   |      0
 .../amd/pm/{ =3D> powerplay}/inc/smu11_driver_if.h   |      0
 drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu7.h  |      0
 drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu71.h |      0
 .../amd/pm/{ =3D> powerplay}/inc/smu71_discrete.h    |      0
 drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu72.h |      0
 .../amd/pm/{ =3D> powerplay}/inc/smu72_discrete.h    |      0
 drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu73.h |      0
 .../amd/pm/{ =3D> powerplay}/inc/smu73_discrete.h    |      0
 drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu74.h |      0
 .../amd/pm/{ =3D> powerplay}/inc/smu74_discrete.h    |      0
 drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu75.h |      0
 .../amd/pm/{ =3D> powerplay}/inc/smu75_discrete.h    |      0
 .../drm/amd/pm/{ =3D> powerplay}/inc/smu7_common.h   |      0
 .../drm/amd/pm/{ =3D> powerplay}/inc/smu7_discrete.h |      0
 .../drm/amd/pm/{ =3D> powerplay}/inc/smu7_fusion.h   |      0
 .../drm/amd/pm/{ =3D> powerplay}/inc/smu7_ppsmc.h    |      0
 drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu8.h  |      0
 .../drm/amd/pm/{ =3D> powerplay}/inc/smu8_fusion.h   |      0
 drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu9.h  |      0
 .../amd/pm/{ =3D> powerplay}/inc/smu9_driver_if.h    |      0
 .../amd/pm/{ =3D> powerplay}/inc/smu_ucode_xfer_cz.h |      2 +-
 .../amd/pm/{ =3D> powerplay}/inc/smu_ucode_xfer_vi.h |      0
 .../gpu/drm/amd/pm/{ =3D> powerplay}/inc/smumgr.h    |      0
 .../drm/amd/pm/{ =3D> powerplay}/inc/tonga_ppsmc.h   |      0
 .../drm/amd/pm/{ =3D> powerplay}/inc/vega10_ppsmc.h  |      0
 .../pm/{ =3D> powerplay}/inc/vega12/smu9_driver_if.h |      0
 .../drm/amd/pm/{ =3D> powerplay}/inc/vega12_ppsmc.h  |      0
 .../drm/amd/pm/{ =3D> powerplay}/inc/vega20_ppsmc.h  |      0
 .../gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c    |      4 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/smu10_smumgr.c |      4 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c  |     11 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/smu9_smumgr.c  |      2 +-
 .../drm/amd/pm/powerplay/smumgr/vega20_smumgr.c    |      8 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    691 +-
 .../gpu/drm/amd/pm/{ =3D> swsmu}/inc/amdgpu_smu.h    |     66 +-
 .../{inc =3D> swsmu/inc/pmfw_if}/aldebaran_ppsmc.h   |      3 +-
 .../pm/{inc =3D> swsmu/inc/pmfw_if}/arcturus_ppsmc.h |      0
 .../inc/pmfw_if}/smu11_driver_if_arcturus.h        |      0
 .../inc/pmfw_if}/smu11_driver_if_cyan_skillfish.h  |      0
 .../inc/pmfw_if}/smu11_driver_if_navi10.h          |      0
 .../inc/pmfw_if}/smu11_driver_if_sienna_cichlid.h  |     82 +-
 .../inc/pmfw_if}/smu11_driver_if_vangogh.h         |      0
 .../{inc =3D> swsmu/inc/pmfw_if}/smu12_driver_if.h   |      0
 .../inc/pmfw_if}/smu13_driver_if_aldebaran.h       |      0
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_5.h |    140 +
 .../inc/pmfw_if}/smu13_driver_if_yellow_carp.h     |      0
 .../{inc =3D> swsmu/inc/pmfw_if}/smu_v11_0_7_ppsmc.h |      0
 .../{inc =3D> swsmu/inc/pmfw_if}/smu_v11_0_ppsmc.h   |      0
 .../pm/{inc =3D> swsmu/inc/pmfw_if}/smu_v11_5_pmfw.h |      0
 .../{inc =3D> swsmu/inc/pmfw_if}/smu_v11_5_ppsmc.h   |      0
 .../pm/{inc =3D> swsmu/inc/pmfw_if}/smu_v11_8_pmfw.h |      0
 .../{inc =3D> swsmu/inc/pmfw_if}/smu_v11_8_ppsmc.h   |      0
 .../{inc =3D> swsmu/inc/pmfw_if}/smu_v12_0_ppsmc.h   |      0
 .../{inc =3D> swsmu/inc/pmfw_if}/smu_v13_0_1_pmfw.h  |      0
 .../{inc =3D> swsmu/inc/pmfw_if}/smu_v13_0_1_ppsmc.h |      0
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_5_pmfw.h    |    126 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_5_ppsmc.h   |     74 +
 .../amd/pm/{ =3D> swsmu}/inc/smu_11_0_cdr_table.h    |      0
 drivers/gpu/drm/amd/pm/{ =3D> swsmu}/inc/smu_types.h |      6 +-
 drivers/gpu/drm/amd/pm/{ =3D> swsmu}/inc/smu_v11_0.h |      0
 .../amd/pm/{ =3D> swsmu}/inc/smu_v11_0_7_pptable.h   |      0
 .../drm/amd/pm/{ =3D> swsmu}/inc/smu_v11_0_pptable.h |      0
 drivers/gpu/drm/amd/pm/{ =3D> swsmu}/inc/smu_v12_0.h |      0
 drivers/gpu/drm/amd/pm/{ =3D> swsmu}/inc/smu_v13_0.h |      1 +
 .../drm/amd/pm/{ =3D> swsmu}/inc/smu_v13_0_pptable.h |      0
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |    102 +-
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |     80 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |    476 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    475 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |     70 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |     79 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |     28 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |     10 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile        |      2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |    133 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |     81 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |   1057 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.h   |     29 +
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |     38 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |    264 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |     16 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |     10 +-
 .../gpu/drm/arm/display/komeda/d71/d71_component.c |     12 +-
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |      3 +-
 drivers/gpu/drm/arm/hdlcd_drv.c                    |      3 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |      3 +-
 drivers/gpu/drm/armada/armada_drv.c                |      3 +
 drivers/gpu/drm/aspeed/aspeed_gfx.h                |      1 +
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |     18 +-
 drivers/gpu/drm/ast/ast_dp501.c                    |     58 -
 drivers/gpu/drm/ast/ast_drv.c                      |     18 +-
 drivers/gpu/drm/ast/ast_drv.h                      |     39 +-
 drivers/gpu/drm/ast/ast_main.c                     |      2 +
 drivers/gpu/drm/ast/ast_mode.c                     |    426 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |      3 +-
 drivers/gpu/drm/bridge/Kconfig                     |     13 +
 drivers/gpu/drm/bridge/Makefile                    |      1 +
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |      1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |     31 +-
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |      2 +-
 drivers/gpu/drm/bridge/analogix/Kconfig            |      4 +
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |      2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |      2 +-
 .../gpu/drm/bridge/analogix/analogix-i2c-dptx.c    |      2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |      4 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |      2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    577 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |     79 +-
 drivers/gpu/drm/bridge/cadence/Kconfig             |      1 +
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |     20 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |      2 +-
 drivers/gpu/drm/bridge/cdns-dsi.c                  |      1 +
 drivers/gpu/drm/bridge/chipone-icn6211.c           |     46 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   3352 +
 drivers/gpu/drm/bridge/ite-it66121.c               |      3 -
 drivers/gpu/drm/bridge/lontium-lt9611.c            |     10 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |      4 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |     40 +-
 drivers/gpu/drm/bridge/panel.c                     |     12 +
 drivers/gpu/drm/bridge/parade-ps8640.c             |     33 +-
 drivers/gpu/drm/bridge/sii902x.c                   |    129 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |      2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |     21 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |     25 +-
 drivers/gpu/drm/bridge/tc358767.c                  |      2 +-
 drivers/gpu/drm/bridge/tc358775.c                  |      4 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |     53 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |     76 +-
 drivers/gpu/drm/dp/Makefile                        |      9 +
 drivers/gpu/drm/{drm_dp_helper.c =3D> dp/drm_dp.c}   |     94 +-
 drivers/gpu/drm/{ =3D> dp}/drm_dp_aux_bus.c          |      4 +-
 drivers/gpu/drm/{ =3D> dp}/drm_dp_aux_dev.c          |      6 +-
 drivers/gpu/drm/{ =3D> dp}/drm_dp_cec.c              |      2 +-
 drivers/gpu/drm/{ =3D> dp}/drm_dp_dual_mode_helper.c |      2 +-
 drivers/gpu/drm/dp/drm_dp_helper_internal.h        |     33 +
 drivers/gpu/drm/dp/drm_dp_helper_mod.c             |     22 +
 drivers/gpu/drm/{ =3D> dp}/drm_dp_mst_topology.c     |      8 +-
 .../drm/{ =3D> dp}/drm_dp_mst_topology_internal.h    |      2 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          |     25 +
 drivers/gpu/drm/drm_bridge_connector.c             |     15 +
 drivers/gpu/drm/drm_buddy.c                        |    785 +
 drivers/gpu/drm/drm_cache.c                        |     27 +-
 drivers/gpu/drm/drm_client.c                       |      9 +-
 drivers/gpu/drm/drm_client_modeset.c               |      3 +-
 drivers/gpu/drm/drm_color_mgmt.c                   |      4 +
 drivers/gpu/drm/drm_crtc_helper_internal.h         |     27 -
 drivers/gpu/drm/drm_debugfs.c                      |      3 +
 drivers/gpu/drm/drm_dsc.c                          |      2 +-
 drivers/gpu/drm/drm_edid.c                         |    107 +-
 drivers/gpu/drm/drm_fb_helper.c                    |     90 +-
 drivers/gpu/drm/drm_format_helper.c                |    141 +-
 drivers/gpu/drm/drm_framebuffer.c                  |      6 +-
 drivers/gpu/drm/drm_gem.c                          |     33 +-
 drivers/gpu/drm/drm_gem_cma_helper.c               |      9 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |     16 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |     22 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c               |      4 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |     25 +-
 drivers/gpu/drm/drm_internal.h                     |      6 +-
 drivers/gpu/drm/drm_ioctl.c                        |      2 +-
 drivers/gpu/drm/drm_kms_helper_common.c            |     14 -
 drivers/gpu/drm/drm_mipi_dbi.c                     |      8 +-
 drivers/gpu/drm/drm_mode_object.c                  |     53 +-
 drivers/gpu/drm/drm_modes.c                        |     53 +-
 drivers/gpu/drm/drm_of.c                           |     17 +
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |      6 +
 drivers/gpu/drm/drm_plane.c                        |     32 +-
 drivers/gpu/drm/drm_prime.c                        |      4 +-
 drivers/gpu/drm/drm_privacy_screen.c               |      6 +-
 drivers/gpu/drm/drm_privacy_screen_x86.c           |     17 +
 drivers/gpu/drm/drm_syncobj.c                      |     61 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h              |      2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |      8 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |      3 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |      2 +-
 drivers/gpu/drm/exynos/Kconfig                     |      1 +
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |     12 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |      3 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |     19 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           |     13 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |     55 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |     10 +-
 drivers/gpu/drm/exynos/exynos_mixer.c              |     14 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |      3 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |     14 +-
 drivers/gpu/drm/gma500/gma_display.c               |      6 +-
 drivers/gpu/drm/gma500/intel_bios.c                |      2 +-
 drivers/gpu/drm/gma500/mmu.c                       |      8 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |      3 +
 drivers/gpu/drm/gud/gud_pipe.c                     |      4 +-
 drivers/gpu/drm/hisilicon/hibmc/Kconfig            |      2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |      3 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |      3 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |      3 +
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |      5 +-
 drivers/gpu/drm/i915/Kconfig                       |      3 +
 drivers/gpu/drm/i915/Kconfig.unstable              |      8 -
 drivers/gpu/drm/i915/Makefile                      |      8 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |     18 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.h            |      2 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |    271 +
 drivers/gpu/drm/i915/display/hsw_ips.h             |     26 +
 drivers/gpu/drm/i915/display/i9xx_plane.c          |    105 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |     21 +-
 drivers/gpu/drm/i915/display/icl_dsi_regs.h        |    342 +
 drivers/gpu/drm/i915/display/intel_atomic.c        |     14 +-
 drivers/gpu/drm/i915/display/intel_atomic.h        |      2 -
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    226 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |     15 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |      3 +
 drivers/gpu/drm/i915/display/intel_bios.c          |    223 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |    167 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |     67 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |      9 +-
 drivers/gpu/drm/i915/display/intel_color.c         |    119 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |      1 +
 .../gpu/drm/i915/display/intel_combo_phy_regs.h    |    162 +
 drivers/gpu/drm/i915/display/intel_crt.h           |      2 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |      5 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |     25 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |    176 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |      2 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |     44 +-
 drivers/gpu/drm/i915/display/intel_de.h            |      1 -
 drivers/gpu/drm/i915/display/intel_display.c       |   1579 +-
 drivers/gpu/drm/i915/display/intel_display.h       |     47 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |     46 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |     46 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |      2 +-
 drivers/gpu/drm/i915/display/intel_display_trace.h |      1 +
 drivers/gpu/drm/i915/display/intel_display_types.h |     55 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |     14 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |      2 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |    246 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |      2 -
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |      8 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.h        |      4 -
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |      4 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |    307 +-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |      6 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |     35 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |     12 +
 drivers/gpu/drm/i915/display/intel_dpll.h          |      1 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |     80 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |     49 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |     37 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |    107 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |      2 +
 drivers/gpu/drm/i915/display/intel_dsb.h           |      2 +-
 drivers/gpu/drm/i915/display/intel_dsi.h           |      4 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |     40 +-
 drivers/gpu/drm/i915/display/intel_dvo_dev.h       |      2 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |      9 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |    240 +-
 drivers/gpu/drm/i915/display/intel_fbc.h           |      7 +
 drivers/gpu/drm/i915/display/intel_fbdev.c         |     29 +-
 drivers/gpu/drm/i915/display/intel_fbdev.h         |      7 +
 drivers/gpu/drm/i915/display/intel_fdi.c           |      5 +
 drivers/gpu/drm/i915/display/intel_gmbus.c         |     23 +-
 drivers/gpu/drm/i915/display/intel_gmbus.h         |      1 -
 drivers/gpu/drm/i915/display/intel_hdcp.c          |      3 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |    145 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |      7 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |     21 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |    148 +-
 drivers/gpu/drm/i915/display/intel_lvds.h          |      2 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |    119 +-
 drivers/gpu/drm/i915/display/intel_opregion.h      |     10 +
 drivers/gpu/drm/i915/display/intel_overlay.c       |      2 +
 drivers/gpu/drm/i915/display/intel_pch_display.c   |     88 +-
 drivers/gpu/drm/i915/display/intel_pch_display.h   |      8 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c |     14 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |     28 +-
 drivers/gpu/drm/i915/display/intel_pps.h           |      2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |    121 +-
 drivers/gpu/drm/i915/display/intel_sdvo.h          |      2 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |    238 +-
 drivers/gpu/drm/i915/display/intel_snps_phy_regs.h |     75 +
 drivers/gpu/drm/i915/display/intel_sprite.c        |     65 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |      2 +
 drivers/gpu/drm/i915/display/intel_tc_phy_regs.h   |    280 +
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |     34 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |     54 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h          |      1 -
 drivers/gpu/drm/i915/display/intel_vga.c           |      9 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    195 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |     34 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |      1 +
 drivers/gpu/drm/i915/display/vlv_dsi_pll_regs.h    |    109 +
 drivers/gpu/drm/i915/display/vlv_dsi_regs.h        |    480 +
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |      2 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |     37 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h        |      2 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |      3 +
 drivers/gpu/drm/i915/gem/i915_gem_create.h         |     17 +
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |      9 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.h         |     18 +
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |      5 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.h         |     15 +
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    242 +-
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |      1 +
 drivers/gpu/drm/i915/gem/i915_gem_internal.h       |     23 +
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |     41 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |     25 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |      4 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |     68 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |     15 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |      3 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |     16 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |     22 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |     30 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |     27 +-
 drivers/gpu/drm/i915/gem/i915_gem_throttle.c       |      1 +
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |     17 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.h         |     18 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |    140 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |     13 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |      1 +
 drivers/gpu/drm/i915/gem/i915_gem_userptr.h        |     14 +
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |    106 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |     28 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |     12 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |      6 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  |    192 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |    362 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_object.c   |      2 +-
 drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c |      1 +
 drivers/gpu/drm/i915/gem/selftests/mock_context.c  |      1 +
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c   |      6 +-
 drivers/gpu/drm/i915/gt/gen2_engine_cs.c           |      2 +
 drivers/gpu/drm/i915/gt/gen6_engine_cs.c           |      1 +
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |     23 +-
 drivers/gpu/drm/i915/gt/gen7_renderclear.c         |      1 +
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |     37 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |    193 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |      4 +-
 drivers/gpu/drm/i915/gt/intel_context_sseu.c       |      1 +
 drivers/gpu/drm/i915/gt/intel_engine.h             |      5 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |    182 +-
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |    246 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |     11 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |      5 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |     53 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |    134 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |     10 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |     15 +
 drivers/gpu/drm/i915/gt/intel_gt.c                 |     43 +-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |      3 +-
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |      1 +
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |      2 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |     17 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |     11 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c          |      1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |   1506 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |     36 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |     54 +-
 drivers/gpu/drm/i915/gt/intel_llc.c                |     11 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |     59 +-
 drivers/gpu/drm/i915/gt/intel_lrc.h                |     63 +-
 drivers/gpu/drm/i915/gt/intel_lrc_reg.h            |     15 -
 drivers/gpu/drm/i915/gt/intel_migrate.c            |    196 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |      2 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |     39 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |     16 +-
 drivers/gpu/drm/i915/gt/intel_rc6.h                |      2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |    142 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.h        |      3 -
 drivers/gpu/drm/i915/gt/intel_renderstate.c        |      2 +
 drivers/gpu/drm/i915/gt/intel_reset.c              |     29 +-
 drivers/gpu/drm/i915/gt/intel_ring.c               |      2 +
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |     16 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |     13 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |     20 +-
 drivers/gpu/drm/i915/gt/intel_sseu.h               |      4 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |      1 +
 drivers/gpu/drm/i915/gt/intel_timeline.c           |      5 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |    179 +-
 drivers/gpu/drm/i915/gt/intel_workarounds_types.h  |      2 +-
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c       |      1 +
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |      1 +
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |      1 +
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |      4 +-
 drivers/gpu/drm/i915/gt/selftest_llc.c             |      5 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |      2 +
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |      2 +
 drivers/gpu/drm/i915/gt/selftest_reset.c           |      2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |      8 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |      1 +
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |      1 +
 drivers/gpu/drm/i915/gt/shmem_utils.c              |     32 +
 drivers/gpu/drm/i915/gt/shmem_utils.h              |      3 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |     80 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h  |      1 -
 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h    |     23 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h      |     82 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    128 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |     27 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |    424 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h         |      3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |    143 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |     39 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |     69 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |     32 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h         |      3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h         |      9 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |     12 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |    203 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |      1 +
 drivers/gpu/drm/i915/gt/uc/intel_huc.h             |      2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |     31 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |     46 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |      2 +-
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |      2 +-
 .../gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c    |      4 +
 drivers/gpu/drm/i915/gvt/aperture_gm.c             |      3 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |      4 +-
 drivers/gpu/drm/i915/gvt/display.c                 |     17 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |     26 +-
 drivers/gpu/drm/i915/gvt/edid.c                    |      1 +
 drivers/gpu/drm/i915/gvt/execlist.c                |      2 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |     49 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |     70 +-
 drivers/gpu/drm/i915/gvt/gtt.h                     |      4 +-
 drivers/gpu/drm/i915/gvt/gvt.h                     |      2 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |     38 +-
 drivers/gpu/drm/i915/gvt/interrupt.c               |     11 +-
 drivers/gpu/drm/i915/gvt/interrupt.h               |      4 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |     17 +
 drivers/gpu/drm/i915/gvt/mmio.c                    |      3 +
 drivers/gpu/drm/i915/gvt/mmio_context.c            |      6 +-
 drivers/gpu/drm/i915/gvt/mmio_context.h            |      2 +-
 drivers/gpu/drm/i915/gvt/reg.h                     |      1 -
 drivers/gpu/drm/i915/gvt/sched_policy.c            |      2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |      2 +
 drivers/gpu/drm/i915/gvt/scheduler.h               |      2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                    |      4 +-
 drivers/gpu/drm/i915/i915_buddy.c                  |    466 -
 drivers/gpu/drm/i915/i915_buddy.h                  |    143 -
 drivers/gpu/drm/i915/i915_cmd_parser.c             |     78 +-
 drivers/gpu/drm/i915/i915_cmd_parser.h             |     26 +
 drivers/gpu/drm/i915/i915_debugfs.c                |     20 +-
 drivers/gpu/drm/i915/i915_driver.c                 |     46 +-
 drivers/gpu/drm/i915/i915_driver.h                 |      5 +
 drivers/gpu/drm/i915/i915_drv.h                    |    446 +-
 drivers/gpu/drm/i915/i915_file_private.h           |    108 +
 drivers/gpu/drm/i915/i915_gem.c                    |     45 +-
 drivers/gpu/drm/i915/i915_gem_evict.c              |    102 +-
 drivers/gpu/drm/i915/i915_gem_evict.h              |     28 +
 drivers/gpu/drm/i915/i915_gem_gtt.c                |     17 +-
 drivers/gpu/drm/i915/i915_gem_gtt.h                |      4 +
 drivers/gpu/drm/i915/i915_getparam.c               |      4 +-
 drivers/gpu/drm/i915/i915_getparam.h               |     15 +
 drivers/gpu/drm/i915/i915_gpu_error.c              |     91 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |     11 +
 drivers/gpu/drm/i915/i915_ioc32.c                  |      1 +
 drivers/gpu/drm/i915/i915_ioctl.c                  |     94 +
 drivers/gpu/drm/i915/i915_ioctl.h                  |     14 +
 drivers/gpu/drm/i915/i915_irq.c                    |     25 +-
 drivers/gpu/drm/i915/i915_irq.h                    |      1 +
 drivers/gpu/drm/i915/i915_mitigations.c            |      1 +
 drivers/gpu/drm/i915/i915_mm.h                     |      3 +-
 drivers/gpu/drm/i915/i915_module.c                 |      7 +-
 drivers/gpu/drm/i915/i915_params.c                 |      5 -
 drivers/gpu/drm/i915/i915_params.h                 |      1 -
 drivers/gpu/drm/i915/i915_pci.c                    |     29 +-
 drivers/gpu/drm/i915/i915_perf.c                   |    152 +-
 drivers/gpu/drm/i915/i915_perf_oa_regs.h           |    137 +
 drivers/gpu/drm/i915/i915_perf_types.h             |      2 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |      2 +
 drivers/gpu/drm/i915/i915_reg.h                    |   5306 +-
 drivers/gpu/drm/i915/i915_reg_defs.h               |    128 +
 drivers/gpu/drm/i915/i915_request.c                |     14 +-
 drivers/gpu/drm/i915/i915_request.h                |      6 +-
 drivers/gpu/drm/i915/i915_scatterlist.c            |     11 +-
 drivers/gpu/drm/i915/i915_suspend.c                |      1 +
 drivers/gpu/drm/i915/i915_sysfs.c                  |      1 +
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |    186 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h      |     19 +-
 drivers/gpu/drm/i915/i915_utils.h                  |     15 -
 drivers/gpu/drm/i915/i915_vgpu.c                   |      2 +-
 drivers/gpu/drm/i915/i915_vma.c                    |    654 +-
 drivers/gpu/drm/i915/i915_vma.h                    |     37 +-
 drivers/gpu/drm/i915/i915_vma_resource.c           |    418 +
 drivers/gpu/drm/i915/i915_vma_resource.h           |    234 +
 drivers/gpu/drm/i915/i915_vma_snapshot.c           |    134 -
 drivers/gpu/drm/i915/i915_vma_snapshot.h           |    112 -
 drivers/gpu/drm/i915/i915_vma_types.h              |     19 +-
 drivers/gpu/drm/i915/intel_device_info.c           |     39 +-
 drivers/gpu/drm/i915/intel_device_info.h           |     14 +-
 drivers/gpu/drm/i915/intel_dram.c                  |      8 +-
 drivers/gpu/drm/i915/intel_mchbar_regs.h           |    228 +
 drivers/gpu/drm/i915/intel_memory_region.c         |     10 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |      7 +-
 drivers/gpu/drm/i915/intel_pch.c                   |      1 +
 drivers/gpu/drm/i915/intel_pch.h                   |      1 +
 drivers/gpu/drm/i915/intel_pci_config.h            |     85 +
 drivers/gpu/drm/i915/intel_pcode.c                 |     32 +-
 drivers/gpu/drm/i915/intel_pcode.h                 |     12 +-
 drivers/gpu/drm/i915/intel_pm.c                    |    715 +-
 drivers/gpu/drm/i915/intel_pm.h                    |      1 -
 drivers/gpu/drm/i915/intel_region_ttm.c            |     21 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |      2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.h            |      1 +
 drivers/gpu/drm/i915/intel_sbi.c                   |      1 +
 drivers/gpu/drm/i915/intel_step.c                  |     17 +-
 drivers/gpu/drm/i915/intel_uncore.c                |     75 +-
 drivers/gpu/drm/i915/intel_uncore.h                |      2 +-
 drivers/gpu/drm/i915/intel_wopcm.c                 |     42 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c           |      1 +
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h            |      2 +-
 drivers/gpu/drm/i915/selftests/i915_buddy.c        |    787 -
 drivers/gpu/drm/i915/selftests/i915_gem.c          |     11 +-
 drivers/gpu/drm/i915/selftests/i915_gem_evict.c    |     29 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |    430 +-
 .../gpu/drm/i915/selftests/i915_mock_selftests.h   |      1 -
 drivers/gpu/drm/i915/selftests/i915_request.c      |    120 +-
 drivers/gpu/drm/i915/selftests/i915_selftest.c     |      1 +
 drivers/gpu/drm/i915/selftests/i915_vma.c          |     31 +-
 drivers/gpu/drm/i915/selftests/igt_flush_test.c    |      2 +-
 drivers/gpu/drm/i915/selftests/igt_spinner.c       |      1 +
 .../gpu/drm/i915/selftests/intel_memory_region.c   |    172 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |     13 +-
 drivers/gpu/drm/i915/selftests/mock_gtt.c          |     21 +-
 drivers/gpu/drm/i915/selftests/mock_gtt.h          |      3 +-
 drivers/gpu/drm/i915/selftests/mock_region.c       |     13 +-
 drivers/gpu/drm/i915/selftests/mock_region.h       |      3 +-
 drivers/gpu/drm/i915/vlv_sideband.c                |      1 +
 drivers/gpu/drm/i915/vlv_sideband.h                |      2 +
 drivers/gpu/drm/i915/vlv_sideband_reg.h            |    180 +
 drivers/gpu/drm/i915/vlv_suspend.c                 |      2 +
 drivers/gpu/drm/imx/dcss/dcss-drv.c                |      3 +-
 drivers/gpu/drm/imx/imx-drm-core.c                 |      3 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |     75 +-
 drivers/gpu/drm/ingenic/ingenic-drm.h              |     38 +
 drivers/gpu/drm/kmb/kmb_drv.c                      |      3 +-
 drivers/gpu/drm/lib/drm_random.c                   |      3 +-
 drivers/gpu/drm/lib/drm_random.h                   |      2 +
 drivers/gpu/drm/lima/lima_gem.c                    |      4 +-
 drivers/gpu/drm/lima/lima_sched.c                  |      9 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |      3 +
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |     12 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |      3 +
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |      7 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.h             |      5 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |     33 +-
 drivers/gpu/drm/meson/meson_drv.c                  |     28 +-
 drivers/gpu/drm/meson/meson_osd_afbcd.c            |     41 +-
 drivers/gpu/drm/meson/meson_osd_afbcd.h            |      1 +
 drivers/gpu/drm/mgag200/mgag200_drv.c              |     20 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |      9 +-
 drivers/gpu/drm/msm/Kconfig                        |     10 +-
 drivers/gpu/drm/msm/Makefile                       |      3 +-
 drivers/gpu/drm/msm/adreno/a2xx.xml.h              |     26 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |      1 +
 drivers/gpu/drm/msm/adreno/a3xx.xml.h              |     30 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |      1 +
 drivers/gpu/drm/msm/adreno/a4xx.xml.h              |    112 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |      1 +
 drivers/gpu/drm/msm/adreno/a5xx.xml.h              |     63 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |      1 +
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |    674 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |     26 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |     62 +-
 drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |     31 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |      1 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |     55 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |      8 +-
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |     46 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |     23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h      |      6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |     22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |    100 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |     28 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |     19 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |     39 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |     36 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    610 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |     21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |      6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |      7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |     10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |      1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |     11 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |      4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |     68 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |      5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           |     28 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |      5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |      3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |    107 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |     19 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |     37 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |      2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |     19 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |     37 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |      8 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |      9 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h           |      5 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c          |      4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |     37 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |      2 +-
 drivers/gpu/drm/msm/disp/mdp_common.xml.h          |     37 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  |      2 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                    |      2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |     14 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |      2 +-
 .../{disp/dpu1/dpu_io_util.c =3D> dp/dp_clk_util.c}  |     69 +-
 .../{disp/dpu1/dpu_io_util.h =3D> dp/dp_clk_util.h}  |      8 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |    104 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |      8 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                  |     28 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |    196 +-
 drivers/gpu/drm/msm/dp/dp_display.h                |      2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |     21 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |      5 +
 drivers/gpu/drm/msm/dp/dp_parser.c                 |     38 +-
 drivers/gpu/drm/msm/dp/dp_parser.h                 |      4 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |      4 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |     37 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |     23 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |      3 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |      8 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |     65 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |     37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |     37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |     37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |     37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |     37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_5nm.xml.h          |    480 -
 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |     43 +-
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |     37 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |     14 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |      4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |    122 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |      4 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |      4 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    |      4 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |     26 +-
 drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |     37 +-
 drivers/gpu/drm/msm/edp/edp.h                      |     77 +
 drivers/gpu/drm/msm/edp/edp_ctrl.c                 |   1373 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |      7 +-
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |     37 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |     11 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |      2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c           |      7 +-
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c           |      2 +-
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |     37 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |     15 -
 drivers/gpu/drm/msm/msm_debugfs.c                  |      6 +-
 drivers/gpu/drm/msm/msm_drv.c                      |    194 +-
 drivers/gpu/drm/msm/msm_drv.h                      |     50 +-
 drivers/gpu/drm/msm/msm_fb.c                       |     43 +-
 drivers/gpu/drm/msm/msm_gem.h                      |      3 +
 drivers/gpu/drm/msm/msm_gem_prime.c                |      6 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |     42 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |     16 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |     37 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |     30 +-
 drivers/gpu/drm/msm/msm_io_utils.c                 |    126 +
 drivers/gpu/drm/msm/msm_rd.c                       |      8 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |      2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c              |     39 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |     15 +-
 drivers/gpu/drm/nouveau/Kconfig                    |      1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |      2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |      2 -
 drivers/gpu/drm/nouveau/include/nvif/list.h        |    353 -
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |      6 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h        |      2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |      6 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c               |     17 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |      4 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c              |      3 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h              |      3 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c              |      4 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |     13 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c      |    317 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h      |     35 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c  |     13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/sorga102.c    |      4 +
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgf119.c    |     14 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgm107.c    |     18 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c     |      9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c      |      5 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |      3 +
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c          |      1 +
 drivers/gpu/drm/omapdrm/omap_plane.c               |     22 +-
 drivers/gpu/drm/panel/Kconfig                      |     24 +-
 drivers/gpu/drm/panel/Makefile                     |      2 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |      8 +-
 drivers/gpu/drm/panel/panel-edp.c                  |    102 +-
 drivers/gpu/drm/panel/panel-novatek-nt35560.c      |    561 +
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |      4 +-
 drivers/gpu/drm/panel/panel-simple.c               |     34 +
 drivers/gpu/drm/panel/panel-sony-acx424akp.c       |    490 -
 drivers/gpu/drm/panfrost/panfrost_drv.c            |      2 +-
 drivers/gpu/drm/panfrost/panfrost_features.h       |    215 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c            |      1 +
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c   |      2 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |     35 +-
 drivers/gpu/drm/panfrost/panfrost_issues.h         |      2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |      2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |      2 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |     13 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h           |      3 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |      8 +-
 drivers/gpu/drm/qxl/qxl_draw.c                     |      6 +-
 drivers/gpu/drm/qxl/qxl_drv.c                      |     31 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |     23 +-
 drivers/gpu/drm/qxl/qxl_ioctl.c                    |     41 +-
 drivers/gpu/drm/qxl/qxl_object.c                   |      8 +-
 drivers/gpu/drm/qxl/qxl_object.h                   |      4 +-
 drivers/gpu/drm/qxl/qxl_prime.c                    |      4 +-
 drivers/gpu/drm/radeon/atom.c                      |      3 +-
 drivers/gpu/drm/radeon/atombios_dp.c               |      2 +-
 drivers/gpu/drm/radeon/cik.c                       |      2 +-
 drivers/gpu/drm/radeon/evergreen.c                 |      2 +-
 drivers/gpu/drm/radeon/ni.c                        |      2 +-
 drivers/gpu/drm/radeon/r600.c                      |      2 +-
 drivers/gpu/drm/radeon/radeon.h                    |      2 -
 drivers/gpu/drm/radeon/radeon_connectors.c         |      8 +-
 drivers/gpu/drm/radeon/radeon_device.c             |     19 +-
 drivers/gpu/drm/radeon/radeon_display.c            |      2 +
 drivers/gpu/drm/radeon/radeon_dp_mst.c             |      2 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |      1 +
 drivers/gpu/drm/radeon/radeon_kms.c                |      7 +-
 drivers/gpu/drm/radeon/radeon_mode.h               |      4 +-
 drivers/gpu/drm/radeon/radeon_object.c             |     34 +-
 drivers/gpu/drm/radeon/radeon_object.h             |      4 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |     22 +-
 drivers/gpu/drm/radeon/radeon_uvd.c                |      5 +-
 drivers/gpu/drm/radeon/rv770.c                     |      2 +-
 drivers/gpu/drm/radeon/si.c                        |      2 +-
 drivers/gpu/drm/rcar-du/Makefile                   |      6 -
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |     18 +-
 drivers/gpu/drm/rcar-du/rcar_du_of.c               |    323 -
 drivers/gpu/drm/rcar-du/rcar_du_of.h               |     20 -
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts    |     69 -
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts    |     43 -
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts    |     43 -
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts    |     43 -
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts    |     43 -
 drivers/gpu/drm/rcar-du/rcar_du_plane.c            |     13 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |     10 -
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |      1 +
 drivers/gpu/drm/rockchip/Kconfig                   |      2 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |      4 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |      2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.h             |      2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |      3 +
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |      9 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h        |      5 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |      2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |      2 +-
 drivers/gpu/drm/scheduler/sched_main.c             |      9 +-
 drivers/gpu/drm/selftests/Makefile                 |      3 +-
 drivers/gpu/drm/selftests/drm_buddy_selftests.h    |     15 +
 drivers/gpu/drm/selftests/test-drm_buddy.c         |    992 +
 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c |      8 +-
 drivers/gpu/drm/selftests/test-drm_framebuffer.c   |      1 -
 drivers/gpu/drm/selftests/test-drm_plane_helper.c  |      4 +
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |      3 +-
 drivers/gpu/drm/solomon/Kconfig                    |     21 +
 drivers/gpu/drm/solomon/Makefile                   |      2 +
 drivers/gpu/drm/solomon/ssd130x-i2c.c              |    116 +
 drivers/gpu/drm/solomon/ssd130x.c                  |    843 +
 drivers/gpu/drm/solomon/ssd130x.h                  |     76 +
 drivers/gpu/drm/sprd/Kconfig                       |      1 -
 drivers/gpu/drm/sprd/sprd_dpu.c                    |      5 +
 drivers/gpu/drm/sprd/sprd_drm.c                    |      6 +-
 drivers/gpu/drm/sprd/sprd_dsi.c                    |      5 +
 drivers/gpu/drm/sti/sti_cursor.c                   |      2 +-
 drivers/gpu/drm/sti/sti_drv.c                      |      3 +
 drivers/gpu/drm/sti/sti_gdp.c                      |      2 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |      2 +-
 drivers/gpu/drm/sti/sti_plane.c                    |      6 -
 drivers/gpu/drm/sti/sti_plane.h                    |      1 -
 drivers/gpu/drm/stm/drv.c                          |      8 +-
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |    114 +-
 drivers/gpu/drm/stm/ltdc.c                         |    915 +-
 drivers/gpu/drm/stm/ltdc.h                         |     15 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |      3 +-
 drivers/gpu/drm/sun4i/sun4i_layer.c                |     16 +-
 drivers/gpu/drm/tegra/Kconfig                      |      1 +
 drivers/gpu/drm/tegra/dc.c                         |     50 +-
 drivers/gpu/drm/tegra/dc.h                         |      7 +
 drivers/gpu/drm/tegra/dp.c                         |     13 +-
 drivers/gpu/drm/tegra/dpaux.c                      |      7 +-
 drivers/gpu/drm/tegra/drm.c                        |      3 +
 drivers/gpu/drm/tegra/dsi.c                        |      4 +-
 drivers/gpu/drm/tegra/gem.c                        |     10 +-
 drivers/gpu/drm/tegra/hdmi.c                       |     34 +-
 drivers/gpu/drm/tegra/hub.c                        |     24 +-
 drivers/gpu/drm/tegra/plane.c                      |     73 +-
 drivers/gpu/drm/tegra/plane.h                      |      2 +-
 drivers/gpu/drm/tegra/sor.c                        |      2 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |      3 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |      7 +-
 drivers/gpu/drm/tiny/Kconfig                       |     15 +
 drivers/gpu/drm/tiny/Makefile                      |      1 +
 drivers/gpu/drm/tiny/arcpgu.c                      |      3 +-
 drivers/gpu/drm/tiny/bochs.c                       |     20 +-
 drivers/gpu/drm/tiny/cirrus.c                      |     25 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |      7 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |    398 +
 drivers/gpu/drm/tiny/repaper.c                     |     24 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |     25 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |     23 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c            |      4 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |    113 +-
 drivers/gpu/drm/ttm/ttm_sys_manager.c              |      3 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |      8 +-
 drivers/gpu/drm/tve200/tve200_drv.c                |      3 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |      3 +-
 drivers/gpu/drm/v3d/v3d_bo.c                       |      1 +
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |     11 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |      8 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |      6 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |     50 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |     20 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |      4 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |      2 -
 drivers/gpu/drm/vc4/vc4_drv.c                      |     33 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |      7 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    158 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |      5 +-
 drivers/gpu/drm/vc4/vc4_regs.h                     |      3 +
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |      4 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c               |      3 +
 drivers/gpu/drm/virtio/virtgpu_object.c            |      1 +
 drivers/gpu/drm/vkms/vkms_composer.c               |      4 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |      8 +-
 drivers/gpu/drm/vkms/vkms_output.c                 |     29 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |      2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |      2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |     24 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |      2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |     46 -
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.h              |      3 -
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |      4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c     |      3 +-
 drivers/gpu/drm/xen/xen_drm_front.c                |      3 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c            |      7 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.h            |      6 +-
 drivers/gpu/drm/xlnx/Kconfig                       |      1 +
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |      2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |      3 +-
 drivers/gpu/host1x/dev.c                           |      8 +-
 .../media/common/videobuf2/videobuf2-dma-contig.c  |      8 +-
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |      9 +-
 drivers/media/common/videobuf2/videobuf2-vmalloc.c |     11 +-
 drivers/misc/fastrpc.c                             |      4 +-
 drivers/platform/chrome/Kconfig                    |     11 +
 drivers/platform/chrome/Makefile                   |      1 +
 drivers/platform/chrome/chromeos_privacy_screen.c  |    153 +
 drivers/platform/x86/thinkpad_acpi.c               |      2 +-
 drivers/staging/fbtft/fbtft-core.c                 |      1 +
 drivers/video/fbdev/asiliantfb.c                   |      2 +-
 drivers/video/fbdev/broadsheetfb.c                 |      1 +
 drivers/video/fbdev/core/cfbimgblt.c               |    107 +-
 drivers/video/fbdev/core/fb_defio.c                |     48 +-
 drivers/video/fbdev/core/fbmem.c                   |     29 +-
 drivers/video/fbdev/core/sysfillrect.c             |     16 +-
 drivers/video/fbdev/core/sysimgblt.c               |     49 +-
 drivers/video/fbdev/metronomefb.c                  |      1 +
 drivers/video/fbdev/s3c-fb.c                       |      2 +-
 drivers/video/fbdev/simplefb.c                     |     65 +-
 drivers/video/fbdev/udlfb.c                        |      1 +
 drivers/video/fbdev/vga16fb.c                      |      5 +
 include/drm/bridge/dw_mipi_dsi.h                   |      4 +-
 include/drm/{ =3D> dp}/drm_dp_aux_bus.h              |      0
 include/drm/{ =3D> dp}/drm_dp_dual_mode_helper.h     |      0
 include/drm/{ =3D> dp}/drm_dp_helper.h               |     35 +-
 include/drm/{ =3D> dp}/drm_dp_mst_helper.h           |      2 +-
 include/drm/drm_bridge.h                           |      7 +
 include/drm/drm_buddy.h                            |    159 +
 include/drm/drm_cache.h                            |      6 +-
 include/drm/drm_client.h                           |      7 +-
 include/drm/drm_connector.h                        |     25 +-
 include/drm/drm_crtc.h                             |     12 +-
 include/drm/drm_dsc.h                              |      2 +-
 include/drm/drm_edid.h                             |      4 +-
 include/drm/drm_format_helper.h                    |      4 +
 include/drm/drm_gem.h                              |      6 +-
 include/drm/drm_gem_atomic_helper.h                |      6 +-
 include/drm/drm_gem_cma_helper.h                   |      6 +-
 include/drm/drm_gem_framebuffer_helper.h           |      8 +-
 include/drm/drm_gem_shmem_helper.h                 |     14 +-
 include/drm/drm_gem_ttm_helper.h                   |      6 +-
 include/drm/drm_gem_vram_helper.h                  |      9 +-
 include/drm/drm_mipi_dbi.h                         |     10 +-
 include/drm/drm_mode_config.h                      |     18 +-
 include/drm/drm_mode_object.h                      |      7 +
 include/drm/drm_modes.h                            |      8 +
 include/drm/drm_modeset_lock.h                     |      1 +
 include/drm/drm_module.h                           |    125 +
 include/drm/drm_panel.h                            |      8 +
 include/drm/drm_plane.h                            |      5 +-
 include/drm/drm_prime.h                            |      6 +-
 include/drm/drm_privacy_screen_driver.h            |     13 +-
 include/drm/gpu_scheduler.h                        |      3 +-
 include/drm/i915_pciids.h                          |      6 +
 include/drm/ttm/ttm_bo_api.h                       |     10 +-
 include/drm/ttm/ttm_kmap_iter.h                    |     10 +-
 include/drm/ttm/ttm_resource.h                     |     35 +-
 include/linux/dma-buf-map.h                        |      4 +-
 include/linux/dma-buf.h                            |     12 +-
 include/linux/dma-fence-array.h                    |     15 +-
 include/linux/dma-fence-chain.h                    |     18 +-
 include/linux/dma-fence.h                          |     38 +
 include/linux/dma-resv.h                           |     17 +-
 include/linux/fb.h                                 |      2 +
 include/linux/iosys-map.h                          |    459 +
 include/linux/rwsem.h                              |      2 +-
 include/linux/string_helpers.h                     |     20 +
 include/soc/bcm2835/raspberrypi-firmware.h         |      1 +
 include/uapi/drm/amdgpu_drm.h                      |     21 +-
 include/uapi/drm/drm_mode.h                        |     88 +-
 include/uapi/drm/i915_drm.h                        |     45 +-
 include/uapi/drm/msm_drm.h                         |     32 +-
 include/uapi/drm/panfrost_drm.h                    |      4 +-
 include/uapi/linux/kfd_ioctl.h                     |     98 +-
 include/video/samsung_fimd.h                       |      4 +
 security/tomoyo/audit.c                            |      2 +-
 security/tomoyo/common.c                           |     19 +-
 security/tomoyo/common.h                           |      1 -
 1471 files changed, 487577 insertions(+), 33898 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
 rename Documentation/devicetree/bindings/display/{panel =3D> }/lvds.yaml (=
84%)
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_test.c
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.h
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.c
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_smu11_driver_if.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_sm=
u.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_sm=
u.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_sm=
u.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_sm=
u.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
 rename drivers/gpu/drm/amd/display/dc/{calcs =3D> dcn315}/Makefile (57%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn316/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dml}/calcs/bw_fixed.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dml}/calcs/calcs_logger.h (10=
0%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dml}/calcs/custom_float.c (10=
0%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dml}/calcs/dce_calcs.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dml}/calcs/dcn_calc_auto.c (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dml}/calcs/dcn_calc_auto.h (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dml}/calcs/dcn_calc_math.c (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dml}/calcs/dcn_calcs.c (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/gpio/dcn315/hw_factory_dcn315.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/gpio/dcn315/hw_factory_dcn315.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/gpio/dcn315/hw_translate_dcn315.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/gpio/dcn315/hw_translate_dcn315.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_trace.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_trace.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hwss_dio.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hwss_dio.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hwss_dpia.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hwss_dpia.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_frl.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_frl.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/virtual/virtual_link_hws=
s.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/virtual/virtual_link_hws=
s.h
 rename drivers/gpu/drm/amd/{amdgpu/amdgpu_hdp.c =3D>
display/dmub/src/dmub_dcn315.c} (50%)
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn315.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn316.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn316.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_1_5_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_1_5_sh_m=
ask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_1_6_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_1_6_sh_m=
ask.h
 rename drivers/gpu/drm/amd/include/asic_reg/{dcn =3D>
dpcs}/dpcs_3_0_0_offset.h (99%)
 rename drivers/gpu/drm/amd/include/asic_reg/{dcn =3D>
dpcs}/dpcs_3_0_0_sh_mask.h (99%)
 rename drivers/gpu/drm/amd/include/asic_reg/{dcn =3D>
dpcs}/dpcs_3_0_3_offset.h (100%)
 rename drivers/gpu/drm/amd/include/asic_reg/{dcn =3D>
dpcs}/dpcs_3_0_3_sh_mask.h (100%)
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_2_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_2_sh_mask.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_3_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_3_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_5_offse=
t.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_5_sh_ma=
sk.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_8_offse=
t.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_8_sh_ma=
sk.h
 create mode 100644 drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c
 create mode 100644 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm_internal.h
 create mode 100644 drivers/gpu/drm/amd/pm/legacy-dpm/Makefile
 rename drivers/gpu/drm/amd/pm/{powerplay =3D> legacy-dpm}/cik_dpm.h (100%)
 rename drivers/gpu/drm/amd/pm/{powerplay =3D> legacy-dpm}/kv_dpm.c (99%)
 rename drivers/gpu/drm/amd/pm/{powerplay =3D> legacy-dpm}/kv_dpm.h (100%)
 rename drivers/gpu/drm/amd/pm/{powerplay =3D> legacy-dpm}/kv_smc.c (100%)
 create mode 100644 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c
 create mode 100644 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.h
 rename drivers/gpu/drm/amd/pm/{powerplay =3D> legacy-dpm}/ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{powerplay =3D> legacy-dpm}/r600_dpm.h (100%=
)
 rename drivers/gpu/drm/amd/pm/{powerplay =3D> legacy-dpm}/si_dpm.c (98%)
 rename drivers/gpu/drm/amd/pm/{powerplay =3D> legacy-dpm}/si_dpm.h (99%)
 rename drivers/gpu/drm/amd/pm/{powerplay =3D> legacy-dpm}/si_smc.c (100%)
 rename drivers/gpu/drm/amd/pm/{powerplay =3D> legacy-dpm}/sislands_smc.h (=
100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/amd_powerplay.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/cz_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/fiji_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/hardwaremanager.h (100=
%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/hwmgr.h (99%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/polaris10_pwrvirus.h (=
100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/power_state.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/pp_debug.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/pp_endian.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/pp_thermal.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/ppinterrupt.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/rv_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu10.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu10_driver_if.h (100=
%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu11_driver_if.h (100=
%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu7.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu71.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu71_discrete.h (100%=
)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu72.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu72_discrete.h (100%=
)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu73.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu73_discrete.h (100%=
)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu74.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu74_discrete.h (100%=
)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu75.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu75_discrete.h (100%=
)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu7_common.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu7_discrete.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu7_fusion.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu7_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu8.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu8_fusion.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu9.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu9_driver_if.h (100%=
)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu_ucode_xfer_cz.h (9=
9%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smu_ucode_xfer_vi.h (1=
00%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/smumgr.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/tonga_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/vega10_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D>
powerplay}/inc/vega12/smu9_driver_if.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/vega12_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> powerplay}/inc/vega20_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> swsmu}/inc/amdgpu_smu.h (96%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/aldebaran_ppsmc.h (98%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/arcturus_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu11_driver_if_arcturus.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu11_driver_if_cyan_skillfish.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu11_driver_if_navi10.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu11_driver_if_sienna_cichlid.h (96%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu11_driver_if_vangogh.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu12_driver_if.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu13_driver_if_aldebaran.h (100%)
 create mode 100644
drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_5.h
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu13_driver_if_yellow_carp.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu_v11_0_7_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu_v11_0_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu_v11_5_pmfw.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu_v11_5_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu_v11_8_pmfw.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu_v11_8_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu_v12_0_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu_v13_0_1_pmfw.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc =3D>
swsmu/inc/pmfw_if}/smu_v13_0_1_ppsmc.h (100%)
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_5_pm=
fw.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_5_pp=
smc.h
 rename drivers/gpu/drm/amd/pm/{ =3D> swsmu}/inc/smu_11_0_cdr_table.h (100%=
)
 rename drivers/gpu/drm/amd/pm/{ =3D> swsmu}/inc/smu_types.h (98%)
 rename drivers/gpu/drm/amd/pm/{ =3D> swsmu}/inc/smu_v11_0.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> swsmu}/inc/smu_v11_0_7_pptable.h (100=
%)
 rename drivers/gpu/drm/amd/pm/{ =3D> swsmu}/inc/smu_v11_0_pptable.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> swsmu}/inc/smu_v12_0.h (100%)
 rename drivers/gpu/drm/amd/pm/{ =3D> swsmu}/inc/smu_v13_0.h (99%)
 rename drivers/gpu/drm/amd/pm/{ =3D> swsmu}/inc/smu_v13_0_pptable.h (100%)
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.h
 create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c
 create mode 100644 drivers/gpu/drm/dp/Makefile
 rename drivers/gpu/drm/{drm_dp_helper.c =3D> dp/drm_dp.c} (97%)
 rename drivers/gpu/drm/{ =3D> dp}/drm_dp_aux_bus.c (99%)
 rename drivers/gpu/drm/{ =3D> dp}/drm_dp_aux_dev.c (98%)
 rename drivers/gpu/drm/{ =3D> dp}/drm_dp_cec.c (99%)
 rename drivers/gpu/drm/{ =3D> dp}/drm_dp_dual_mode_helper.c (99%)
 create mode 100644 drivers/gpu/drm/dp/drm_dp_helper_internal.h
 create mode 100644 drivers/gpu/drm/dp/drm_dp_helper_mod.c
 rename drivers/gpu/drm/{ =3D> dp}/drm_dp_mst_topology.c (99%)
 rename drivers/gpu/drm/{ =3D> dp}/drm_dp_mst_topology_internal.h (94%)
 create mode 100644 drivers/gpu/drm/drm_buddy.c
 create mode 100644 drivers/gpu/drm/i915/display/hsw_ips.c
 create mode 100644 drivers/gpu/drm/i915/display/hsw_ips.h
 create mode 100644 drivers/gpu/drm/i915/display/icl_dsi_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_combo_phy_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_snps_phy_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_tc_phy_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/vlv_dsi_pll_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/vlv_dsi_regs.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_create.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_domain.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_internal.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_tiling.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_userptr.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_engine_regs.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_regs.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.c
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.h
 create mode 100644 drivers/gpu/drm/i915/i915_cmd_parser.h
 create mode 100644 drivers/gpu/drm/i915/i915_file_private.h
 create mode 100644 drivers/gpu/drm/i915/i915_gem_evict.h
 create mode 100644 drivers/gpu/drm/i915/i915_getparam.h
 create mode 100644 drivers/gpu/drm/i915/i915_ioctl.c
 create mode 100644 drivers/gpu/drm/i915/i915_ioctl.h
 create mode 100644 drivers/gpu/drm/i915/i915_perf_oa_regs.h
 create mode 100644 drivers/gpu/drm/i915/i915_reg_defs.h
 create mode 100644 drivers/gpu/drm/i915/i915_vma_resource.c
 create mode 100644 drivers/gpu/drm/i915/i915_vma_resource.h
 delete mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.c
 delete mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.h
 create mode 100644 drivers/gpu/drm/i915/intel_mchbar_regs.h
 create mode 100644 drivers/gpu/drm/i915/intel_pci_config.h
 delete mode 100644 drivers/gpu/drm/i915/selftests/i915_buddy.c
 create mode 100644 drivers/gpu/drm/i915/vlv_sideband_reg.h
 rename drivers/gpu/drm/msm/{disp/dpu1/dpu_io_util.c =3D> dp/dp_clk_util.c}=
 (61%)
 rename drivers/gpu/drm/msm/{disp/dpu1/dpu_io_util.h =3D> dp/dp_clk_util.h}=
 (85%)
 delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_5nm.xml.h
 create mode 100644 drivers/gpu/drm/msm/edp/edp.h
 create mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
 create mode 100644 drivers/gpu/drm/msm/msm_io_utils.c
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/list.h
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt35560.c
 delete mode 100644 drivers/gpu/drm/panel/panel-sony-acx424akp.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
 create mode 100644 drivers/gpu/drm/selftests/drm_buddy_selftests.h
 create mode 100644 drivers/gpu/drm/selftests/test-drm_buddy.c
 create mode 100644 drivers/gpu/drm/solomon/Kconfig
 create mode 100644 drivers/gpu/drm/solomon/Makefile
 create mode 100644 drivers/gpu/drm/solomon/ssd130x-i2c.c
 create mode 100644 drivers/gpu/drm/solomon/ssd130x.c
 create mode 100644 drivers/gpu/drm/solomon/ssd130x.h
 create mode 100644 drivers/gpu/drm/tiny/panel-mipi-dbi.c
 create mode 100644 drivers/platform/chrome/chromeos_privacy_screen.c
 rename include/drm/{ =3D> dp}/drm_dp_aux_bus.h (100%)
 rename include/drm/{ =3D> dp}/drm_dp_dual_mode_helper.h (100%)
 rename include/drm/{ =3D> dp}/drm_dp_helper.h (98%)
 rename include/drm/{ =3D> dp}/drm_dp_mst_helper.h (99%)
 create mode 100644 include/drm/drm_buddy.h
 create mode 100644 include/drm/drm_module.h
 create mode 100644 include/linux/iosys-map.h
