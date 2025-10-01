Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587F7BAF133
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 06:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E44410E2FB;
	Wed,  1 Oct 2025 04:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N1gtCRmK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304C110E2FB
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 04:06:23 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b07e3a77b72so107244766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 21:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759291581; x=1759896381; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/drvkWFhuWUeyRZEIawQbrI92uQ/FH66v/StfHPF82w=;
 b=N1gtCRmKzagIRGPGwzJ0imdF8whrkUG9FzW0coMqX/WA1dYi15Fy+WXMGEai/mv9qN
 jkG/H58/DsMQ3Ouin53ywIpto2TS0AEmJQjZe6QfaXPNLtdf9G0Yygz3RW0D2eDjT9lk
 y1H3vJeztHyK84XmdUYbEZkx9Mzi+5tCEqPwpF+lJPv8lqFAYNgUlFXeM84ClqAAuTAt
 jtBBBg0/9091uDLnDRYv4E9dqOPhVpoidNAuXBf8NAe32QWnpEVpPFxJHkc2pBFeKCLy
 99vTwsd+4toyrt6BLO7HXWjCbWwzAEeYmQO3vHFoXaZeRQ4emcL5pIPYzncOw1PxmZ6a
 X2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759291581; x=1759896381;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/drvkWFhuWUeyRZEIawQbrI92uQ/FH66v/StfHPF82w=;
 b=tDWBC4QeNkZQn9z3RHOOSiblroXa8kLx/pI+EUmvjBc7YY0JC9i5FvIQYsvvGzxSiz
 Uj3fzVD7hd54x3PhHFe07wbNjQ/MC0vv4eOHor/ZZ1e4D+QdkNO8Mkd2lUOb1hiBX0lI
 Q7snSO7xw3EblBexQTfuqDRnuRgZlJDVHB4sDCreS9zR97piLUC0VD2Fgp5+WZZoHqBE
 zGGu+BLgpwvw+gvGLfCuqQmRhDT5Ebt8r8Gdc2OfjB4oMGDJKFgIEUYJK6GeVVyhTWpq
 Rd55noUcdUAQU4+C/QY5IDrUY4UV8aTSQ6O0nB6W8DQbEmQ4Awis8XhxLK9QrIHKnlZ0
 gvIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzXeR7Xfwqy4qAp2TGPZLV+2mWgIHjcSZM7chaANtJQ6oopQg0Tk/y/BX+NvaV6tYiNjiRAisf2FU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF7NkFMQy0TaXRn4kRqfNycvXGEmWd6pG8liBPZpJMOwBFgBbf
 dllZNIA8S5/UcfIYgEfZxCXk5kMUawZtuzR1aVqqhjVipCTrk3rcv7EgfqXBXRMQsSWuZdMKP/4
 UL3hsaLuQYGBZHiS9IWKmq+oddWUiLNo=
X-Gm-Gg: ASbGncu6vGzmiK8620eqGC2KoKEWIN+dyQOUF9LuRVwGMp4n+2S+JC3ZG7z8Cwxq80w
 gKZpHoEe7I/8bXWmBbo5s4XXstvsxAD17/qinZJxr3nOghR+MAo9LcapfyX9QR5pE71K+7iuunQ
 a5T5phiIY4u3sK/NFYJpw4zuml+wB/Xx60snNAw6vwOSXYt3wrdY5fr1Za3LHPy+SzmZVwUKhkh
 4msyO7Z5tDeHve0Fvl3dgB9KzWvSA==
X-Google-Smtp-Source: AGHT+IF+1DyOwJuB21DSH3op4Iv5FqU74S6Lxb7LdTFoh4XWMoIOlh3HryVZQ2Sa5JkrocJl/7963l7rzMO0ufLl3p0=
X-Received: by 2002:a17:907:268b:b0:b04:3cd2:265b with SMTP id
 a640c23a62f3a-b46c35527d7mr271912866b.5.1759291580658; Tue, 30 Sep 2025
 21:06:20 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 1 Oct 2025 14:06:07 +1000
X-Gm-Features: AS18NWBvuCyQTIeiLJB9eorcx0E8jvP4hI8vAzUo9fzxdHEimDBXfM7wkXhmJ-s
Message-ID: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
Subject: [git pull] drm for 6.18-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

This is the main drm pull request for the 6.18 merge window.

Compared to last time there are only 2 xe merge conflicts when I
merged this into your tree this morning. One of them is simple, the
other a bit tricky, as all the goto cleanup should be return ret, not
sure where they get lost. Let me know if you have any problems, but
taking what is in next should be fine.

Outside the drm tree, there are i2c-hid changes and an MEI driver addition.

The other big thing here is rust stuff. There is a pin-init rework
which may also be merged in other trees (I can't remember). Then dma,
device and drm stuff. This also has updates to the nova-core, nova-drm
drivers and introduces a skeleton driver Tyr for ARM Mali, which will
be constructed upstream as the rust pieces are merged.

Other highlights:
- rocket accel driver for Rockchip NPUs
- habanalabs upstreaming has restarted
- xe support for madvise in gpusvm
- amdgpu CRIU support for gem objects

Then there is the usual insane number of patches to everything across the b=
oard.

As usual, let me know if there are any problems.

Dave.


drm-next-2025-10-01:
drm next for 6.18-rc1

cross-subsystem:
- i2c-hid: Make elan touch controllers power on after panel is enabled
- dt bindings for STM32MP25 SoC
- pci vgaarb: use screen_info helpers
- rust pin-init updates
- add MEI driver for late binding firmware update/load

uapi:
- add ioctl for reassigning GEM handles
- provide boot_display attribute on boot-up devices

core:
- document DRM_MODE_PAGE_FLIP_EVENT
- add vendor specific recovery method to drm device wedged uevent

gem:
- Simplify gpuvm locking

ttm:
- add interface to populate buffers

sched:
- Fix race condition in trace code

atomic:
- Reallow no-op async page flips

display:
- dp: Fix command length

video:
- Improve pixel-format handling for struct screen_info

rust:
- drop Opaque<> from ioctl args
- Alloc:
- BorrowedPage type and AsPageIter traits
- Implement Vmalloc::to_page() and VmallocPageIter
- DMA/Scatterlist:
- Add dma::DataDirection and type alias for dma_addr_t
- Abstraction for struct scatterlist and sg_table
- DRM:
- simplify use of generics
- add DriverFile type alias
- drop Object::SIZE
- Rust:
- pin-init tree merge
- Various methods for AsBytes and FromBytes traits

gpuvm:
- Support madvice in Xe driver

gpusvm:
- fix hmm_pfn_to_map_order usage in gpusvm

bridge:
- Improve and fix ref counting on bridge management
- cdns-dsi: Various improvements to mode setting
- Support Solomon SSD2825 plus DT bindings
- Support Waveshare DSI2DPI plus DT bindings
- Support Content Protection property
- display-connector: Improve DP display detection
- Add support for Radxa Ra620 plus DT bindings
- adv7511: Provide SPD and HDMI infoframes
- it6505: Replace crypto_shash with sha()
- synopsys: Add support for DW DPTX Controller plus DT bindings
- adv7511: Write full Audio infoframe
- ite6263: Support vendor-specific infoframes
- simple: Add support for Realtek RTD2171 DP-to-HDMI plus DT bindings

panel:
- panel-edp: Support mt8189 Chromebooks; Support BOE NV140WUM-N64;
  Support SHP LQ134Z1; Fixes
- panel-simple: Support Olimex LCD-OLinuXino-5CTS plus DT bindings
- Support Samsung AMS561RA01
- Support Hydis HV101HD1 plus DT bindings
- ilitek-ili9881c: Refactor mode setting; Add support for Bestar
  BSD1218-A101KL68 LCD plus DT bindings
- lvds: Add support for Ampire AMP19201200B5TZQW-T03 to DT bindings
- edp: Add support for additonal mt8189 Chromebook panels
- lvds: Add DT bindings for EDT ETML0700Z8DHA

amdgpu:
- add CRIU support for gem objects
- RAS updates
- VCN SRAM load fixes
- EDID read fixes
- eDP ALPM support
- Documentation updates
- Rework PTE flag generation
- DCE6 fixes
- VCN devcoredump cleanup
- MMHUB client id fixes
- VCN 5.0.1 RAS support
- SMU 13.0.x updates
- Expanded PCIe DPC support
- Expanded VCN reset support
- VPE per queue reset support
- give kernel jobs unique id for tracing
- pre-populate exported buffers
- cyan skillfish updates
- make vbios build number available in sysfs
- userq updates
- HDCP updates
- support MMIO remap page as ttm pool
- JPEG parser updates
- DCE6 DC updates
- use devm for i2c buses
- GPUVM locking updates
- Drop non-DC DCE11 code
- improve fallback handling for pixel encoding

amdkfd:
- SVM/page migration fixes
- debugfs fixes
- add CRIO support for gem objects
- SVM updates

radeon:
- use dev_warn_once in CS parsers

xe:
- add madvise interface
- add DRM_IOCTL_XE_VM_QUERY_MEMORY_RANGE_ATTRS to query VMA count
  and memory attributes
- drop L# bank mask reporting from media GT3 on Xe3+.
- add SLPC power_profile sysfs interface
- add configs attribs to add post/mid context-switch commands
- handle firmware reported hardware errors notifying userspace with
  device wedged uevent
- use same dir structure across sysfs/debugfs
- cleanup and future proof vram region init
- add G-states and PCI link states to debugfs
- Add SRIOV support for CCS surfaces on Xe2+
- Enable SRIOV PF mode by default on supported platforms
- move flush to common code
- extended core workarounds for Xe2/3
- use DRM scheduler for delayed GT TLB invalidations
- configs improvements and allow VF device enablement
- prep work to expose mmio regions to userspace
- VF migration support added
- prepare GPU SVM for THP migration
- start fixing XE_PAGE_SIZE vs PAGE_SIZE
- add PSMI support for hw validation
- resize VF bars to max possible size according to number of VFs
- Ensure GT is in C0 during resume
- pre-populate exported buffers
- replace xe_hmm with gpusvm
- add more SVM GT stats to debugfs
- improve fake pci and WA kunnit handle for new platform testing
- Test GuC to GuC comms to add debugging
- use attribute groups to simplify sysfs registration
- add Late Binding firmware code to interact with MEI

i915:
- apply multiple JSL/EHL/Gen7/Gen6 workarounds properly
- protect against overflow in active_engine()
- Use try_cmpxchg64() in __active_lookup()
- include GuC registers in error state
- get rid of dev->struct_mutex
- iopoll: generalize read_poll_timout
- lots more display refactoring
- Reject HBR3 in any eDP Panel
- Prune modes for YUV420
- Display Wa fix, additions, and updates
- DP: Fix 2.7 Gbps link training on g4x
- DP: Adjust the idle pattern handling
- DP: Shuffle the link training code a bit
- Don't set/read the DSI C clock divider on GLK
- Enable_psr kernel parameter changes
- Type-C enabled/disconnected dp-alt sink
- Wildcat Lake enabling
- DP HDR updates
- DRAM detection
- wait PSR idle on dsb commit
- Remove FBC modulo 4 restriction for ADL-P+
- panic: refactor framebuffer allocation

habanalabs:
- debug/visibility improvements
- vmalloc-backed coherent mmap support
- HLDIO infrastructure

nova-core:
- various register!() macro improvements
- minor vbios/firmware fixes/refactoring
- advance firmware boot stages; process Booter and patch signatures
- process GSP and GSP bootloader
- Add r570.144 firmware bindings and update to it
- Move GSP boot code to own module
- Use new pin-init features to store driver's private data in a single
 allocation
- Update ARef import from sync::aref

nova-drm:
- Update ARef import from sync::aref

tyr:
- initial driver skeleton for a rust driver for ARM Mali GPUs
- capable of powering up, query metadata and provide it to userspace.

msm:
- GPU and Core:
- in DT bindings describe clocks per GPU type
- GMU bandwidth voting for x1-85
- a623/a663 speedbins
- cleanup some remaining no-iommu leftovers after VM_BIND conversion
- fix GEM obj 32b size truncation
- add missing VM_BIND param validation
- IFPC for x1-85 and a750
- register xml and gen_header.py sync from mesa
- Display:
- add missing bindings for display on SC8180X
- added DisplayPort MST bindings
- conversion from round_rate() to determine_rate()

amdxdna:
- add IOCTL_AMDXDNA_GET_ARRAY
- support user space allocated buffers
- streamline PM interfaces
- Refactoring wrt. hardware contexts
- improve error reporting

nouveau:
- use GSP firmware by default
- improve error reporting
- Pre-populate exported buffers

ast:
- Clean up detection of DRAM config

exynos:
- add DSIM bridge driver support for Exynos7870
- Document Exynos7870 DSIM compatible in dt-binding

panthor:
- Print task/pid on errors
- Add support for Mali G710, G510, G310, Gx15, Gx20, Gx25
- Improve cache flushing
- Fail VM bind if BO has offset

renesas:
- convert to RUNTIME_PM_OPS

rcar-du:
- Make number of lanes configurable
- Use RUNTIME_PM_OPS
- Add support for DSI commands

rocket:
- Add driver for Rockchip NPU plus DT bindings
- Use kfree() and sizeof() correctly
- Test DMA status

rockchip:
- dsi2: Add support for RK3576 plus DT bindings
- Add support for RK3588 DPTX output

tidss:
- Use crtc_ fields for programming display mode
- Remove other drivers from aperture

pixpaper:
- Add support for Mayqueen Pixpaper plus DT bindings

v3d:
- Support querying nubmer of GPU resets for KHR_robustness

stm:
- Clean up logging
- ltdc: Add support support for STM32MP257F-EV1 plus DT bindings

sitronix:
- st7571-i2c: Add support for inverted displays and 2-bit grayscale

tidss:
- Convert to kernel's FIELD_ macros

vesadrm:
- Support 8-bit palette mode

imagination:
- Improve power management
- Add support for TH1520 GPU
- Support Risc-V architectures

v3d:
- Improve job management and locking

vkms:
- Support variants of ARGB8888, ARGB16161616, RGB565, RGB888 and P01x
- Spport YUV with 16-bit components
The following changes since commit f83ec76bf285bea5727f478a68b894f5543ca76e=
:

  Linux 6.17-rc6 (2025-09-14 14:21:14 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-10-01

for you to fetch changes up to b2ec5ca9d5c2c019e2316f7ba447596d1dcd8fde:

  Merge tag 'amd-drm-next-6.18-2025-09-26' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-09-30
09:26:31 +1000)

----------------------------------------------------------------
drm next for 6.18-rc1

cross-subsystem:
- i2c-hid: Make elan touch controllers power on after panel is enabled
- dt bindings for STM32MP25 SoC
- pci vgaarb: use screen_info helpers
- rust pin-init updates
- add MEI driver for late binding firmware update/load

uapi:
- add ioctl for reassigning GEM handles
- provide boot_display attribute on boot-up devices

core:
- document DRM_MODE_PAGE_FLIP_EVENT
- add vendor specific recovery method to drm device wedged uevent

gem:
- Simplify gpuvm locking

ttm:
- add interface to populate buffers

sched:
- Fix race condition in trace code

atomic:
- Reallow no-op async page flips

display:
- dp: Fix command length

video:
- Improve pixel-format handling for struct screen_info

rust:
- drop Opaque<> from ioctl args
- Alloc:
- BorrowedPage type and AsPageIter traits
- Implement Vmalloc::to_page() and VmallocPageIter
- DMA/Scatterlist:
- Add dma::DataDirection and type alias for dma_addr_t
- Abstraction for struct scatterlist and sg_table
- DRM:
- simplify use of generics
- add DriverFile type alias
- drop Object::SIZE
- Rust:
- pin-init tree merge
- Various methods for AsBytes and FromBytes traits

gpuvm:
- Support madvice in Xe driver

gpusvm:
- fix hmm_pfn_to_map_order usage in gpusvm

bridge:
- Improve and fix ref counting on bridge management
- cdns-dsi: Various improvements to mode setting
- Support Solomon SSD2825 plus DT bindings
- Support Waveshare DSI2DPI plus DT bindings
- Support Content Protection property
- display-connector: Improve DP display detection
- Add support for Radxa Ra620 plus DT bindings
- adv7511: Provide SPD and HDMI infoframes
- it6505: Replace crypto_shash with sha()
- synopsys: Add support for DW DPTX Controller plus DT bindings
- adv7511: Write full Audio infoframe
- ite6263: Support vendor-specific infoframes
- simple: Add support for Realtek RTD2171 DP-to-HDMI plus DT bindings

panel:
- panel-edp: Support mt8189 Chromebooks; Support BOE NV140WUM-N64;
  Support SHP LQ134Z1; Fixes
- panel-simple: Support Olimex LCD-OLinuXino-5CTS plus DT bindings
- Support Samsung AMS561RA01
- Support Hydis HV101HD1 plus DT bindings
- ilitek-ili9881c: Refactor mode setting; Add support for Bestar
  BSD1218-A101KL68 LCD plus DT bindings
- lvds: Add support for Ampire AMP19201200B5TZQW-T03 to DT bindings
- edp: Add support for additonal mt8189 Chromebook panels
- lvds: Add DT bindings for EDT ETML0700Z8DHA

amdgpu:
- add CRIU support for gem objects
- RAS updates
- VCN SRAM load fixes
- EDID read fixes
- eDP ALPM support
- Documentation updates
- Rework PTE flag generation
- DCE6 fixes
- VCN devcoredump cleanup
- MMHUB client id fixes
- VCN 5.0.1 RAS support
- SMU 13.0.x updates
- Expanded PCIe DPC support
- Expanded VCN reset support
- VPE per queue reset support
- give kernel jobs unique id for tracing
- pre-populate exported buffers
- cyan skillfish updates
- make vbios build number available in sysfs
- userq updates
- HDCP updates
- support MMIO remap page as ttm pool
- JPEG parser updates
- DCE6 DC updates
- use devm for i2c buses
- GPUVM locking updates
- Drop non-DC DCE11 code
- improve fallback handling for pixel encoding

amdkfd:
- SVM/page migration fixes
- debugfs fixes
- add CRIO support for gem objects
- SVM updates

radeon:
- use dev_warn_once in CS parsers

xe:
- add madvise interface
- add DRM_IOCTL_XE_VM_QUERY_MEMORY_RANGE_ATTRS to query VMA count
  and memory attributes
- drop L# bank mask reporting from media GT3 on Xe3+.
- add SLPC power_profile sysfs interface
- add configs attribs to add post/mid context-switch commands
- handle firmware reported hardware errors notifying userspace with
  device wedged uevent
- use same dir structure across sysfs/debugfs
- cleanup and future proof vram region init
- add G-states and PCI link states to debugfs
- Add SRIOV support for CCS surfaces on Xe2+
- Enable SRIOV PF mode by default on supported platforms
- move flush to common code
- extended core workarounds for Xe2/3
- use DRM scheduler for delayed GT TLB invalidations
- configs improvements and allow VF device enablement
- prep work to expose mmio regions to userspace
- VF migration support added
- prepare GPU SVM for THP migration
- start fixing XE_PAGE_SIZE vs PAGE_SIZE
- add PSMI support for hw validation
- resize VF bars to max possible size according to number of VFs
- Ensure GT is in C0 during resume
- pre-populate exported buffers
- replace xe_hmm with gpusvm
- add more SVM GT stats to debugfs
- improve fake pci and WA kunnit handle for new platform testing
- Test GuC to GuC comms to add debugging
- use attribute groups to simplify sysfs registration
- add Late Binding firmware code to interact with MEI

i915:
- apply multiple JSL/EHL/Gen7/Gen6 workarounds properly
- protect against overflow in active_engine()
- Use try_cmpxchg64() in __active_lookup()
- include GuC registers in error state
- get rid of dev->struct_mutex
- iopoll: generalize read_poll_timout
- lots more display refactoring
- Reject HBR3 in any eDP Panel
- Prune modes for YUV420
- Display Wa fix, additions, and updates
- DP: Fix 2.7 Gbps link training on g4x
- DP: Adjust the idle pattern handling
- DP: Shuffle the link training code a bit
- Don't set/read the DSI C clock divider on GLK
- Enable_psr kernel parameter changes
- Type-C enabled/disconnected dp-alt sink
- Wildcat Lake enabling
- DP HDR updates
- DRAM detection
- wait PSR idle on dsb commit
- Remove FBC modulo 4 restriction for ADL-P+
- panic: refactor framebuffer allocation

habanalabs:
- debug/visibility improvements
- vmalloc-backed coherent mmap support
- HLDIO infrastructure

nova-core:
- various register!() macro improvements
- minor vbios/firmware fixes/refactoring
- advance firmware boot stages; process Booter and patch signatures
- process GSP and GSP bootloader
- Add r570.144 firmware bindings and update to it
- Move GSP boot code to own module
- Use new pin-init features to store driver's private data in a single
 allocation
- Update ARef import from sync::aref

nova-drm:
- Update ARef import from sync::aref

tyr:
- initial driver skeleton for a rust driver for ARM Mali GPUs
- capable of powering up, query metadata and provide it to userspace.

msm:
- GPU and Core:
- in DT bindings describe clocks per GPU type
- GMU bandwidth voting for x1-85
- a623/a663 speedbins
- cleanup some remaining no-iommu leftovers after VM_BIND conversion
- fix GEM obj 32b size truncation
- add missing VM_BIND param validation
- IFPC for x1-85 and a750
- register xml and gen_header.py sync from mesa
- Display:
- add missing bindings for display on SC8180X
- added DisplayPort MST bindings
- conversion from round_rate() to determine_rate()

amdxdna:
- add IOCTL_AMDXDNA_GET_ARRAY
- support user space allocated buffers
- streamline PM interfaces
- Refactoring wrt. hardware contexts
- improve error reporting

nouveau:
- use GSP firmware by default
- improve error reporting
- Pre-populate exported buffers

ast:
- Clean up detection of DRAM config

exynos:
- add DSIM bridge driver support for Exynos7870
- Document Exynos7870 DSIM compatible in dt-binding

panthor:
- Print task/pid on errors
- Add support for Mali G710, G510, G310, Gx15, Gx20, Gx25
- Improve cache flushing
- Fail VM bind if BO has offset

renesas:
- convert to RUNTIME_PM_OPS

rcar-du:
- Make number of lanes configurable
- Use RUNTIME_PM_OPS
- Add support for DSI commands

rocket:
- Add driver for Rockchip NPU plus DT bindings
- Use kfree() and sizeof() correctly
- Test DMA status

rockchip:
- dsi2: Add support for RK3576 plus DT bindings
- Add support for RK3588 DPTX output

tidss:
- Use crtc_ fields for programming display mode
- Remove other drivers from aperture

pixpaper:
- Add support for Mayqueen Pixpaper plus DT bindings

v3d:
- Support querying nubmer of GPU resets for KHR_robustness

stm:
- Clean up logging
- ltdc: Add support support for STM32MP257F-EV1 plus DT bindings

sitronix:
- st7571-i2c: Add support for inverted displays and 2-bit grayscale

tidss:
- Convert to kernel's FIELD_ macros

vesadrm:
- Support 8-bit palette mode

imagination:
- Improve power management
- Add support for TH1520 GPU
- Support Risc-V architectures

v3d:
- Improve job management and locking

vkms:
- Support variants of ARGB8888, ARGB16161616, RGB565, RGB888 and P01x
- Spport YUV with 16-bit components

----------------------------------------------------------------
Aakash Deep Sarkar (1):
      drm/i915/display: Fix dma_fence_wait_timeout() return value handling

Aaron Ma (1):
      drm/i915/backlight: Honor VESA eDP backlight luminance control capabi=
lity

Abhinav Kumar (4):
      dt-bindings: display/msm: qcom,x1e80100-mdss: correct DP addresses
      dt-bindings: display/msm: dp-controller: add X1E80100
      dt-bindings: display/msm: drop assigned-clock-parents for dp controll=
er
      dt-bindings: display/msm: expand to support MST

Akhil P Oommen (21):
      drm/msm/adreno: Add speedbins for A663 GPU
      drm/msm/adreno: Add speedbin data for A623 GPU
      drm/msm: Update GMU register xml
      drm/msm: a6xx: Fix gx_is_on check for a7x family
      drm/msm/a6xx: Poll additional DRV status
      drm/msm/a6xx: Fix PDC sleep sequence
      drm/msm: a6xx: Refactor a6xx_sptprac_enable()
      drm/msm: Add an ftrace for gpu register access
      drm/msm/adreno: Add fenced regwrite support
      drm/msm/a6xx: Set Keep-alive votes to block IFPC
      drm/msm/a6xx: Switch to GMU AO counter
      drm/msm/a6xx: Poll AHB fence status in GPU IRQ handler
      drm/msm: Add support for IFPC
      drm/msm/a6xx: Fix hangcheck for IFPC
      drm/msm/adreno: Disable IFPC when sysprof is active
      drm/msm/a6xx: Make crashstate capture IFPC safe
      drm/msm/a6xx: Enable IFPC on Adreno X1-85
      drm/msm/a6xx: Enable IFPC on A750 GPU
      drm/msm: Fix bootup splat with separate_gpu_drm modparam
      drm/msm/adreno: Add a modparam to skip GPU
      drm/msm/a6xx: Add a comment to acd_probe()

Akhilesh Patil (1):
      drm: panel: orisetech: improve error handling during probe

Aleksandrs Vinarskis (3):
      dt-bindings: display: panel: samsung,atna40cu11: document ATNA40CU11
      dt-bindings: display: panel: samsung,atna40ct06: document ATNA40CT06
      drm/panel-edp: Add BOE NV140WUM-N64

Alex Deucher (33):
      Documentation: update APU and dGPU tables with MP0/1 info
      Documentation: add RDNA4 dGPUs
      drm/amdgpu: update mmhub 3.0.1 client id mappings
      drm/amdgpu: update mmhub 3.3 client id mappings
      drm/amd/display: add more cyan skillfish devices
      drm/amdgpu/discovery: fix fw based ip discovery
      drm/amdgpu: add missing vram lost check for LEGACY RESET
      drm/amdgpu/swm14: Update power limit logic
      drm/amdgpu/gfx11: set MQD as appriopriate for queue types
      drm/amdgpu/gfx12: set MQD as appriopriate for queue types
      drm/amdgpu/vcn: drop extra cancel_delayed_work_sync()
      drm/amdgpu/vpe: add ring reset support
      Revert "drm/amdgpu: fix incorrect vm flags to map bo"
      drm/amdgpu/vpe: cancel delayed work in hw_fini
      drm/amdgpu/userq: fix error handling of invalid doorbell
      drm/amdgpu/mes11: make MES_MISC_OP_CHANGE_CONFIG failure non-fatal
      drm/amdgpu: drop hw access in non-DC audio fini
      drm/amd: add more cyan skillfish PCI ids
      drm/amdgpu: add user queue reset source
      drm/amdgpu/userq: add force completion helpers
      drm/amdgpu: add ip offset support for cyan skillfish
      drm/amdgpu: add support for cyan skillfish without IP discovery
      drm/amdgpu: add support for cyan skillfish gpu_info
      drm/amdgpu: don't enable SMU on cyan skillfish
      drm/radeon: use dev_warn_once() in CS parsers
      drm/amdgpu: fix a memory leak in fence cleanup when unloading
      drm/amd/display: use udelay rather than fsleep
      drm/amdgpu: remove non-DC DCE 11 code
      drm/amdkfd: add proper handling for S0ix
      drm/amdgpu/userq: Optimize S0ix handling
      drm/amdgpu: suspend KFD and KGD user queues for S0ix
      Documentation: add initial documenation for user queues
      drm/amdgpu: update MODULE_PARM_DESC for freesync_video

Alexander Usyskin (2):
      mei: bus: add mei_cldev_mtu interface
      mei: late_bind: add late binding component driver

Alexandre Courbot (33):
      gpu: nova-core: register: add missing space in register!()
      gpu: nova-core: register: allow fields named `offset`
      gpu: nova-core: register: improve documentation for basic registers
      gpu: nova-core: register: simplify @leaf_accessor rule
      gpu: nova-core: register: remove `try_` accessors for relative regist=
ers
      gpu: nova-core: register: move OFFSET declaration to I/O impl block
      gpu: nova-core: register: fix documentation and indentation
      gpu: nova-core: register: add missing doccomments for fixed
registers I/O accessors
      gpu: nova-core: register: add fields dispatcher internal rule
      gpu: nova-core: register: improve `Debug` implementation
      gpu: nova-core: register: generate correct `Default` implementation
      gpu: nova-core: register: split @io rule into fixed and relative vers=
ions
      gpu: nova-core: register: use #[inline(always)] for all methods
      gpu: nova-core: register: redesign relative registers
      gpu: nova-core: falcon: add distinct base address for PFALCON2
      gpu: nova-core: register: add support for register arrays
      gpu: nova-core: falcon: use register arrays for FUSE registers
      gpu: nova-core: register: add support for relative array registers
      gpu: nova-core: falcon: align DMA transfers to 256 bytes
      rust: transmute: add `as_bytes` method for `AsBytes` trait
      rust: transmute: add `as_bytes_mut` method to `AsBytes` trait
      rust: transmute: add `from_bytes_copy` method to `FromBytes` trait
      gpu: nova-core: vbios: replace pci::Device with device::Device
      gpu: nova-core: vbios: store reference to Device where relevant
      gpu: nova-core: require `Send` on `FalconEngine` and `FalconHal`
      gpu: nova-core: move GSP boot code to its own module
      gpu: nova-core: add Chipset::name() method
      gpu: nova-core: firmware: move firmware request code into a function
      gpu: nova-core: firmware: add support for common firmware header
      gpu: nova-core: firmware: process Booter and patch its signature
      gpu: nova-core: firmware: process and prepare the GSP firmware
      gpu: nova-core: firmware: process the GSP bootloader
      gpu: nova-core: firmware: use 570.144 firmware

Alexandre Demers (2):
      Documentation: Remove VCE support from OLAND's features
      drm/radeon: fix typos

Alice Ryhl (3):
      drm_gem: add mutex to drm_gem_object.gpuva
      panthor: use drm_gem_object.gpuva.lock instead of gpuva_list_lock
      gpuvm: remove gem.gpuva.lock_dep_map

Alistair Popple (1):
      gpu: nova-core: Add base files for r570.144 firmware bindings

Allen Li (2):
      drm/amd/display: Read DPCD to obtain eDP capability information.
      drm/amd/display: Add fast sync field in ultra sleep more for DMUB

Alvin Lee (2):
      drm/amd/display: Add comma to last entry of enum for consistency
      drm/amd/display: Use mpc.preblend flag to indicate preblend

Amber Lin (3):
      drm/amdgpu: Add chain runlists support to GC9.4.2
      drm/amdkfd: Destroy KFD debugfs after destroy KFD wq
      drm/amdkfd: Tie UNMAP_LATENCY to queue_preemption

Andy Yan (6):
      dt-bindings: display: simple-bridge: Add ra620 compatible
      drm/bridge: simple-bridge: Add support for radxa ra620
      dt-bindings: display: rockchip: Add schema for RK3588 DPTX Controller
      drm/bridge: synopsys: Add DW DPTX Controller support library
      drm/rockchip: Add RK3588 DPTX output support
      MAINTAINERS: Add entry for DW DPTX Controller bridge

Ankit Nautiyal (4):
      Revert "drm/i915/dp: Reject HBR3 when sink doesn't support TPS4"
      drm/i915/dp: Add device specific quirk to limit eDP rate to HBR2
      drm/i915/display_wa: Add helpers to check wa
      drm/i915/gmbus: Add Wa_16025573575 for PTL/WCL for bit-bashing

Antheas Kapenekakis (6):
      drm: panel-backlight-quirks: Make EDID match optional
      drm: panel-backlight-quirks: Convert brightness quirk to generic stru=
cture
      drm: panel-backlight-quirks: Add secondary DMI match
      drm: panel-backlight-quirks: Add brightness mask quirk
      drm: panel-backlight-quirks: Add Steam Deck brightness quirk
      drm: panel-backlight-quirks: Log applied panel brightness quirks

Antonino Maniscalco (1):
      drm/msm: make sure to not queue up recovery more than once

Aradhya Bhatia (1):
      drm/bridge: cdns-dsi: Fix the _atomic_check()

Ariel Aviad (1):
      accel/habanalabs: add HL_GET_P_STATE passthrough type

Ariel Suller (1):
      accel/habanalabs/gaudi2: stringify engine/queue ids

Arnd Bergmann (1):
      drm/amdgpu: fix link error for !PM_SLEEP

Arun R Murthy (1):
      drm/i915/display: Use the recomended min_hblank values

Asad Kamal (13):
      drm/amd/pm: Add dpm interface for temp metrics
      drm/amd/pm: Add smu interface for temp metrics
      drm/amd/pm: Update pmfw header for smu_v13_0_12
      drm/amd/pm: Fetch and fill temperature metrics
      drm/amd/pm: Add temperature metrics sysfs entry
      drm/amd/pm: Enable temperature metrics caps
      drm/amd/pm: Allow to set power cap in vf mode
      drm/amd/pm: Rename amdgpu_hwmon_get_sensor_generic
      drm/amd/pm: Update pmfw headers for smu_v13_0_12
      drm/amd/pm: Allow system metrics table in 1vf mode
      drm/amd/pm: Add sysfs node for node power
      drm/amd/pm: Fetch npm data from system metrics table
      drm/amd/pm: Enable npm metrics data

Ashutosh Dixit (1):
      drm/xe/oa: Fix static checker warning about null gt

Athul Raj Kollareth (1):
      drm/virtio: clean up minor codestyle issues

Aurabindo Pillai (4):
      drm/amd/display: fix condition for setting timing_adjust_pending
      drm/amd/display: fix dmub access race condition
      drm/amd/display: more liberal vmin/vmax update for freesync
      drm/amd/display: Fix vupdate_offload_work doc

Ausef Yousof (3):
      drm/amd/display: track dpia support
      drm/amd/display: dont wait for pipe update during medupdate/highirq
      drm/amd/display: fix dml ms order of operations

Austin Zheng (2):
      drm/amd/display: Setup Second Stutter Watermark Implementation
      drm/amd/display: Add Component To Handle Bounding Box Values and IP C=
aps

Badal Nilawar (8):
      drm/xe/psmi: Add Wa_14020001231
      drm/xe/xe_late_bind_fw: Introduce xe_late_bind_fw
      drm/xe/xe_late_bind_fw: Initialize late binding firmware
      drm/xe/xe_late_bind_fw: Load late binding firmware
      drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
      drm/xe/xe_late_bind_fw: Reload late binding fw during system resume
      drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late bindi=
ng
      drm/xe/xe_late_bind_fw: Extract and print version info

Balasubramani Vivekanandan (1):
      drm/xe/devcoredump: Defer devcoredump initialization during probe

Barnab=C3=A1s Cz=C3=A9m=C3=A1n (1):
      dt-bindings: display/msm/gpu: describe A505 clocks

Beata Michalska (1):
      rust: drm: Drop the use of Opaque for ioctl arguments

Benno Lossin (6):
      rust: pin-init: examples: error: use `Error` in `fn main()`
      rust: pin-init: README: add information banner on the rename to `pin-=
init`
      rust: pin-init: rename `project` -> `project_this` in doctest
      rust: pin-init: add pin projections to `#[pin_data]`
      rust: pin-init: add code blocks to `[try_][pin_]init!` macros
      rust: pin-init: add references to previously initialized fields

Boris Brezillon (2):
      drm/gpuvm: Pass map arguments through a struct
      drm/gpuvm: Kill drm_gpuva_init()

Brahmajit Das (2):
      drm/radeon/r600_cs: clean up of dead code in r600_cs
      drm/amd/display: clean-up dead code in dml2_mall_phantom

Brian Masney (9):
      drm/msm/dsi_phy_10nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_28nm_8960: convert from round_rate() to determine_rat=
e()
      drm/msm/dsi_phy_28nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_7nm: convert from round_rate() to determine_rate()
      drm/msm/hdmi_phy_8996: convert from round_rate() to determine_rate()
      drm/msm/hdmi_phy_8998: convert from round_rate() to determine_rate()
      drm/msm/disp/mdp4/mdp4_lvds_pll: convert from round_rate() to
determine_rate()
      drm/msm/hdmi_pll_8960: convert from round_rate() to determine_rate()

Brigham Campbell (10):
      drm: Create mipi_dsi_dual* macros
      drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
      drm: Remove unused MIPI write seq and chatty functions
      drm: docs: Update task from drm TODO list
      accel/rocket: Fix Rockchip NPU compilation
      accel/rocket: Fix undeclared const rocket_pm_ops
      drm/panel: novatek-nt35560: Fix invalid return value
      drm: Add MIPI read_multi func and two write macros
      drm/panel: novatek-nt35560: Clean up driver
      accel/rocket: Fix usages of kfree() and sizeof()

Carl Vanderlip (1):
      MAINTAINERS: Update email address for Carl Vanderlip

Carlos Llamas (1):
      drm/xe: switch to local xbasename() helper

Ce Sun (7):
      drm/amdgpu: Avoid rma causes GPU duplicate reset
      drm/amdgpu: Effective health check before reset
      drm/amdgpu: Correct the counts of nr_banks and nr_errors
      drm/amdgpu: Add a mutex lock to protect poison injection
      drm/amdgpu: Correct the loss of aca bank reg info
      drm/amdgpu: Add support for dpc to a series of products
      drm/amdgpu: Add support for dpc to the product

Chaitanya Kumar Borah (4):
      drm/i915/display: Add power well mapping for WCL
      drm/i915/dp: Refactor intel_dp_in_hdr_mode() for broader reuse
      drm/i915/dp: Set min_bpp limit to 30 in HDR mode
      drm/xe/wcl: Extend L3bank mask workaround

Charlene Liu (4):
      drm/amd/display: limit one non-related log to dGPU
      drm/amd/display: Insert dccg log for easy debug
      drm/amd/display: Correct sw cache timing to ensure dispclk ramping
      drm/amd/display: Revert "correct sw cache timing to ensure
dispclk ramping"

Chen Ni (3):
      drm/panel: himax-hx8279: Remove unneeded semicolon
      drm/vesadrm: Remove unneeded semicolon
      drm/ast: ast_2100: Remove unneeded semicolon

Chenglei Xie (1):
      drm/amdgpu: refactor bad_page_work for corner case handling

Chenyuan Yang (1):
      drm/amd/display: Add null pointer check in mod_hdcp_hdcp1_create_sess=
ion()

Chia-I Wu (5):
      panthor: set owner field for driver fops
      panthor: save task pid and comm in panthor_group
      panthor: dump task pid and comm on gpu errors
      drm/bridge: it6505: select REGMAP_I2C
      drm/panthor: check bo offset alignment in vm bind

Chiang, Richard (1):
      drm/amd/display: Remove update_planes_and_stream_v1 sequence

Christian K=C3=B6nig (10):
      drm/amdgpu: rework how PTE flags are generated v3
      drm/amdgpu: add AMDGPU_IDS_FLAGS_GANG_SUBMIT
      drm/amdgpu: revert "Implement new dummy vram manager"
      drm/amdgpu: reject gang submissions under SRIOV
      drm/amdgpu: fix userq VM validation v4
      drm/amdgpu: remove check for BO reservation add assert instead
      drm/amdgpu: re-order and document VM code
      drm/amdgpu: revert to old status lock handling v3
      drm/amdgpu: remove leftover from enforcing isolation by VMID
      drm/amdgpu: revert "rework reserved VMID handling" v2

Christian S. Lima (1):
      rust: transmute: Add methods for FromBytes trait

Christoph Manszewski (2):
      drm/xe: Fix vm_bind_ioctl double free bug
      drm/xe: Untangle vm_bind_ioctl cleanup order

Christophe JAILLET (2):
      drm/msm/mdp4: Consistently use the "mdp4_" namespace
      drm/xe/hwmon: Use devm_mutex_init()

Christopher Orr (1):
      drm/panel-edp: Add SHP LQ134Z1 panel for Dell XPS 9345

Clay King (6):
      drm/amd/display: ensure committing streams is seamless
      drm/amd/display: Delete unused functions
      drm/amd/display: Multiplication result converted to larger type
      drm/amd/display: Incorrect 'not' operator usage
      drm/amd/display: Array offset used before range check
      drm/amd/display: incorrect conditions for failing dto calculations

Colin Ian King (9):
      drm/vmwgfx: fix missing assignment to ts
      drm/i915/bw: Remove space before newline
      drm/panel: Kconfig: Fix spelling mistake "pannel" -> "panel"
      drm/tidss: remove redundant assignment to variable ret
      drm/msm: remove extraneous semicolon after a statement
      drm/amd/amdgpu: Fix missing error return on kzalloc failure
      drm/sysfb: Remove double assignment to pointer crtc_state
      drm/amd/amdgpu: Fix a less than zero check on a uint32_t struct field
      drm/xe/guc: Fix spelling mistake "sheduling" -> "scheduling"

Cong Yang (1):
      drm/panel-edp: Add edp panels used by mt8189 Chromebooks

Cruise Hung (4):
      drm/amd/display: Remove check DPIA HPD status for BW Allocation
      drm/amd/display: Add debug option to control BW Allocation mode
      drm/amd/display: Reserve instance index notified by DMUB
      drm/amd/display: Add link index in AUX and dpms

Cryolitia PukNgae (1):
      drm/amdgpu: fix incorrect comment format

Dan Carpenter (8):
      drm/xe: Fix a NULL vs IS_ERR() bug in xe_i2c_register_adapter()
      drm/xe: Fix an IS_ERR() vs NULL bug in xe_tile_alloc_vram()
      drm/xe/vf: Fix IS_ERR() vs NULL check in xe_sriov_vf_ccs_init()
      drm/panel: jdi-lpm102a188a: Fix error code in jdi_panel_prepare()
      HID: i2c-hid: Fix test in i2c_hid_core_register_panel_follower()
      accel/rocket: Fix some error checking in rocket_core_init()
      drm/amdgpu: Fix error codes if copy_to_user() fails
      drm/xe: Fix a NULL vs IS_ERR() in xe_vm_add_compute_exec_queue()

Daniel Almeida (1):
      rust: drm: Introduce the Tyr driver for Arm Mali GPUs

Daniele Ceraolo Spurio (4):
      drm/xe/guc: Set RCS/CCS yield policy
      drm/i915/guc: Include the GuC registers in the error state
      drm/xe: Fix error handling if PXP fails to start
      drm/xe: Allow error injection for xe_pxp_exec_queue_add

Danilo Krummrich (16):
      drm/test: drm_exec: use kzalloc() to allocate GEM objects
      rust: page: implement BorrowedPage
      rust: alloc: vmalloc: implement Vmalloc::to_page()
      rust: alloc: implement VmallocPageIter
      rust: page: define trait AsPageIter
      rust: alloc: kbox: implement AsPageIter for VBox
      rust: alloc: layout: implement ArrayLayout::size()
      rust: alloc: kvec: implement AsPageIter for VVec
      rust: dma: implement DataDirection
      rust: dma: add type alias for bindings::dma_addr_t
      rust: scatterlist: Add abstraction for sg_table
      samples: rust: dma: add sample code for SGTable
      MAINTAINERS: rust: dma: add scatterlist files
      gpu: nova-core: take advantage of pci::Device::unbind()
      Merge drm-misc-next-2025-08-21 into drm-rust-next
      Merge tag 'pin-init-v6.18' of
https://github.com/Rust-for-Linux/linux into drm-rust-next

Danny Wang (1):
      drm/amd/display: Reset apply_eamless_boot_optimization when dpms_off

Dave Airlie (27):
      Merge tag 'drm-misc-next-2025-08-14' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2025-08-21' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2025-08-28' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-next-6.18-2025-08-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-xe-next-2025-08-29' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-intel-gt-next-2025-09-01' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-misc-next-2025-09-04' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      ttm/bo: add an API to populate a bo before exporting.
      amdgpu: populate buffers before exporting them.
      nouveau: populate buffers before exporting them.
      xe: populate buffers before exporting them.
      Merge tag 'drm-intel-next-2025-09-05' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-misc-next-2025-09-11' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-next-6.18-2025-09-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-gt-next-2025-09-12' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'v6.17-rc6' into drm-next
      Merge tag 'drm-msm-next-2025-09-12' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'exynos-drm-misc-next-for-v6.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      Merge tag 'exynos-drm-next-for-v6.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      Merge tag 'drm-rust-next-2025-09-16' of
https://gitlab.freedesktop.org/drm/rust/kernel into drm-next
      Merge tag 'drm-misc-next-fixes-2025-09-18' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-intel-next-2025-09-12' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-xe-next-2025-09-19' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'amd-drm-next-6.18-2025-09-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-fixes-2025-09-25' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-habanalabs-next-2025-09-25' of
https://github.com/HabanaAI/drivers.accel.habanalabs.kernel into
drm-next
      Merge tag 'amd-drm-next-6.18-2025-09-26' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

David (Ming Qiang) Wu (3):
      drm/amdgpu/vcn: remove unused code in vcn_v1_0.c
      drm/amdgpu/vcn: remove unused code in vcn_v4_0.c
      drm/amdgpu/vcn: add instance number to VCN version message

David Francis (6):
      drm: Add DRM prime interface to reassign GEM handle
      drm: Move drm_gem ioctl kerneldoc to uapi file
      drm/amdgpu: Allow more flags to be set on gem create.
      drm/amdgpu: Add ioctl to get all gem handles for a process
      drm/amdgpu: Add mapping info option for GEM_OP ioctl
      drm/amdgpu: Allow kfd CRIU with no buffer objects

David Rosca (2):
      drm/amdgpu/vcn4: Fix IB parsing with multiple engine info packages
      drm/amdgpu/vcn: Allow limiting ctx to instance 0 for AV1 at any time

David Yat Sin (1):
      drm/amdkfd: Fix checkpoint-restore on multi-xcc

Dibin Moolakadan Subrahmanian (2):
      drm/{i915,xe}/display: Block hpd during suspend
      drm/i915/display: Optimize panel power-on wait time

Dillon Varone (7):
      drm/amd/display: Consider sink max slice width limitation for dsc
      drm/amd/display: Disable stutter when programming watermarks on dcn32
      drm/amd/display: Add missing post flip calls
      drm/amd/display: Isolate dcn401 SMU functions
      drm/amd/display: Refactor SMU tracing
      drm/amd/display: Set wm_pending when disable stutter w/a used
      drm/amd/display: Remove wm_optimized_required

Dmitry Baryshkov (20):
      drm/display: bridge-connector: correct CEC bridge pointers in
drm_bridge_connector_init
      drm/bridge: display-connector: don't set OP_DETECT for DisplayPorts
      drm/msm: fix msm_gem_vma_new() allocations for managed GPUVMs
      dt-bindings: display/msm/gpu: account for 7xx GPUs in clocks conditio=
ns
      dt-bindings: display/msm/gpu: describe alwayson clock
      dt-bindings: display/msm/gpu: describe clocks for each Adreno GPU typ=
e
      dt-bindings: display/msm: dsi-controller-main: add SC8180X
      dt-bindings: display/msm: describe DPU on SC8180X
      dt-bindings: display/msm: describe MDSS on SC8180X
      drm/msm/dpu: use drmm_writeback_connector_init()
      drm/bridge: adv7511: provide SPD and HDMI infoframes
      dt-bindings: display/msm: dp-controller: allow eDP for SA8775P
      dt-bindings: display/msm: dp-controller: fix fallback for SM6350
      dt-bindings: display/msm: dp-controller: document DP on SM7150
      drm/msm/mdp4: stop supporting no-IOMMU configuration
      drm/msm: stop supporting no-IOMMU configuration
      drm/msm: don't return NULL from msm_iommu_new()
      drm/msm/mdp4: use msm_kms_init_vm() instead of duplicating it
      drm/bridge: adv7511: use update latch for AVI infoframes
      drm/bridge: write full Audio InfoFrame

Dmytro Laktyushkin (1):
      drm/amd/display: prepare dml 2.1 for new asic

Duncan Ma (2):
      drm/amd/display: Add eDP AUXless ALPM
      drm/amd/display: Adjust AUX-less ALPM setting

Eric Biggers (1):
      drm/bridge: it6505: Use SHA-1 library instead of crypto_shash

Eric Huang (3):
      drm/amdkfd: set uuid for each partition in topology
      drm/amdkfd: fix vram allocation failure for a special case
      drm/amdkfd: fix p2p links bug in topology

Ethan Carter Edwards (3):
      drm/amdgpu/gfx10: remove redundant repeated nested 0 check
      drm/amdgpu/gfx9: remove redundant repeated nested 0 check
      drm/amdgpu/gfx9.4.3: remove redundant repeated nested 0 check

Fangzhi Zuo (4):
      drm/amd/display: Avoid Read Remote DPCD Many Times
      drm/amd/display: Skip Check Runtime Link Setting for Specific
Branch Device
      drm/amd/display: Disable DPCD Probe Quirk
      drm/amd/display: Fix pbn_div Calculation Error

Francois Dugast (6):
      drm/pagemap: Rename drm_pagemap_device_addr to drm_pagemap_addr
      drm/pagemap: Use struct drm_pagemap_addr in mapping and copy function=
s
      drm/pagemap: DMA map folios when possible
      drm/pagemap: Allocate folios when possible
      drm/xe/migrate: Populate struct drm_pagemap_addr array
      drm/xe/svm: Migrate folios when possible

Frank Min (1):
      drm/amdgpu: Add PSP fw version check for fw reserve GFX command

Fushuai Wang (1):
      drm/xe: Use ERR_CAST instead of ERR_PTR(PTR_ERR(...))

Gabe Teeger (1):
      drm/amd/display: Revert Add HPO encoder support to Replay

Geert Uytterhoeven (2):
      drm: renesas: rz-du: mipi_dsi: Convert to RUNTIME_PM_OPS()
      drm: rcar-du: lvds: Convert to RUNTIME_PM_OPS()

Geoffrey McRae (2):
      drm/amdkfd: return -ENOTTY for unsupported IOCTLs
      drm/amd/display: remove oem i2c adapter on finish

Guangshuo Li (1):
      drm/amdgpu/atom: Check kcalloc() for WS buffer in
amdgpu_atom_execute_table_locked()

Guochun Huang (1):
      drm/rockchip: dsi2: add support rk3576

Gustavo A. R. Silva (1):
      drm/amdgpu/amdkfd: Avoid a couple hundred
-Wflex-array-member-not-at-end warnings

Gustavo Sousa (3):
      drm/i915/display: Remove unused declarations of intel_io_*
      drm/xe: Probe for tile count during device info initialization
      drm/xe: Use for_each_gt to define gt_count

Harish Chegondi (4):
      drm/xe: Remove unnecessary EU stall debug message
      drm/xe/mcr: Make xe_gt_mcr_get_dss_steering() input gt a const
      drm/xe/xe2hpg: Add Wa_18041344222 for Xe2_HPG
      drm/xe/xe3: Extend Wa_18041344222 to graphics IP versions 30.00 and 3=
0.01

Hawking Zhang (2):
      drm/amdgpu: Allocate psp fw private buffer in vram
      Revert "drm/amdgpu: Allocate psp fw private buffer in vram"

Heiko Stuebner (10):
      drm/panel: ilitek-ili9881c: turn off power-supply when init fails
      drm/panel: ilitek-ili9881c: move display_on/_off dcs calls to (un-)pr=
epare
      drm/panel: ilitek-ili9881c: convert (un-)prepare to mipi_dsi_multi_co=
ntext
      dt-bindings: vendor-prefixes: Add prefix for Shenzhen Bestar Electron=
ic
      dt-bindings: display: ili9881c: Add Bestar BSD1218-A101KL68 LCD panel
      drm/panel: ilitek-ili9881c: Add Bestar BSD1218-A101KL68 support
      dt-bindings: display: rockchip: Add rk3576 to RK3588 DW DSI2
controller schema
      accel/rocket: Fix indentation of Kconfig entry
      accel/rocket: Depend on DRM_ACCEL not just DRM
      accel/rocket: Check the correct DMA irq status to warn about

Heng Zhou (1):
      drm/amdgpu: fix nullptr err of vm_handle_moved

Himal Prasad Ghimiray (25):
      drm/gpuvm: Introduce drm_gpuvm_madvise_ops_create
      drm/gpusvm: Make drm_gpusvm_for_each_* macros public
      drm/xe/uapi: Add madvise interface
      drm/xe/vm: Add attributes struct as member of vma
      drm/xe/vma: Move pat_index to vma attributes
      drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as parame=
ter
      drm/xe/svm: Split system allocator vma incase of madvise call
      drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for mad=
vise
      drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range() for PTE zapping
      drm/xe: Implement madvise ioctl for xe
      drm/xe/svm: Add svm ranges migration policy on atomic access
      drm/xe/madvise: Update migration policy based on preferred location
      drm/xe/svm: Support DRM_XE_SVM_MEM_RANGE_ATTR_PAT memory attribute
      drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
      drm/xe/svm: Consult madvise preferred location in prefetch
      drm/xe/bo: Add attributes field to xe_bo
      drm/xe/bo: Update atomic_access attribute on madvise
      drm/xe/madvise: Skip vma invalidation if mem attr are unchanged
      drm/xe/vm: Add helper to check for default VMA memory attributes
      drm/xe: Reset VMA attributes to default in SVM garbage collector
      drm/xe: Enable madvise ioctl for xe
      drm/xe/uapi: Add UAPI for querying VMA count and memory attributes
      drm/xe/uapi: Fix kernel-doc formatting for madvise and vma_query
      drm/xe: Fix indentation in xe_zap_ptes_in_madvise_range
      drm/xe/vm: Fix error handling in xe_vm_query_vmas_attrs_ioctl()

Hsin-Yi Wang (2):
      drm_bridge: register content protect property
      drm/bridge: anx7625: register content protect property

Hugo Villeneuve (1):
      drm/panel: sitronix-st7703: fix typo in comments

Ilia Levi (2):
      drm/xe: Support for mmap-ing mmio regions
      accel/habanalabs: remove old interface variation of 'access_ok()'

Imre Deak (24):
      drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS to
TRAINING_PATTERN_SET
      drm/i915: Fix selecting CONFIG_DRM_KUNIT_TEST in debug builds
      drm/i915/dp: Fix disabling training pattern at end of UHBR link train=
ing
      drm/i915/lnl+/tc: Fix handling of an enabled/disconnected dp-alt sink
      drm/i915/icl+/tc: Cache the max lane count value
      drm/i915/lnl+/tc: Fix max lane count HW readout
      drm/i915/lnl+/tc: Use the cached max lane count value
      drm/i915/icl+/tc: Convert AUX powered WARN to a debug message
      drm/i915/tc: Use the cached max lane count value
      drm/i915/tc: Move getting the power domain before reading DFLEX regis=
ters
      drm/i915/tc: Move asserting the power state after reading TCSS_DDI_ST=
ATUS
      drm/i915/tc: Add an enum for the TypeC pin assignment
      drm/i915/tc: Pass pin assignment value around using the pin
assignment enum
      drm/i915/tc: Handle pin assignment NONE on all platforms
      drm/i915/tc: Validate the pin assignment on all platforms
      drm/i915/tc: Unify the way to get the pin assignment on all platforms
      drm/i915/tc: Unify the way to get the max lane count value on MTL+
      drm/i915/tc: Handle non-TC encoders when getting the pin assignment
      drm/i915/tc: Pass intel_tc_port to internal lane mask/count helpers
      dmc/i915/tc: Report pin assignment NONE in TBT-alt mode
      drm/i915/tc: Cache the pin assignment value
      drm/i915/tc: Debug print the pin assignment and max lane count
      drm/i915/wcl: Add display device info
      drm/i915/display: Remove power state verification before HW readout

Ivan Lipski (4):
      drm/amd/display: Support HW cursor 180 rot for any number of pipe spl=
its
      drm/amd/display: Clear the CUR_ENABLE register on DCN314 w/out DPP PG
      drm/amd/display: Allow RX6xxx & RX7700 to invoke amdgpu_irq_get/put
      drm/amd/display: Enable DTM v3 on dGPUs with DCN 3.1+

Jacek Lawrynowicz (4):
      MAINTAINERS: Add new intel_vpu maintainer
      accel/ivpu: Remove unused PLL_CONFIG_DEFAULT
      accel/ivpu: Make function parameter names consistent
      MAINTAINERS: Remove Jacek Lawrynowicz as intel_vpu maintainer

Jack Xiao (2):
      drm/amdgpu: fix incorrect vm flags to map bo
      Reapply "drm/amdgpu: fix incorrect vm flags to map bo"

James Flowers (1):
      drm/amd/display: Use kmalloc_array() instead of kmalloc()

James Zhu (4):
      drm/amdkfd: remove unused code
      drm/amdkfd: return migration pages from copy function
      Revert "drm/amdkfd: return migration pages from copy function"
      drm/amdkfd: add function svm_migrate_successful_pages

Jani Nikula (87):
      drm/i915/display: remove superfluous <linux/types.h> includes
      drm/i915/hdmi: use intel_de_wait_for_set() instead of wait_for()
      drm/i915/ddi: use intel_de_wait_custom() instead of wait_for_us()
      drm/i915/dpll: use intel_de_wait_custom() instead of wait_for_us()
      drm/i915/cdclk: use intel_de_wait_custom() instead of wait_for_us()
      drm/i915/power: use intel_de_wait_custom() instead of wait_for_us()
      drm/i915/pch: use intel_de_wait_custom() instead of wait_for_us()
      drm/i915/dsi: use intel_de_wait_custom() instead of wait_for_us()
      drm/xe/compat: remove unused platform macros
      drm/xe/compat: stop including i915_utils.h from compat i915_drv.h
      drm/xe: fix stale comment about unordered_wq usage
      drm/i915/display: hide global state iterators, remove unused
      drm/i915/display: make struct __intel_global_objs_state opaque
      drm/i915/display: keep forward declarations together
      drm/i915/display: use drm->debugfs_root for creating debugfs files
      drm/i915/gvt: use drm->debugfs_root for creating debugfs files
      drm/i915: use drm->debugfs_root for creating debugfs files
      drm/i915/vbt: split up DSI VBT defs to a separate file
      drm/i915/vbt: add anonymous structs to group DSI VBT defs
      drm/i915/vbt: flip bta_enabled to bta_disable
      drm/i915/vbt: add missing DSI VBT defs
      drm/i915/display: add intel_dig_port_alloc()
      drm/i915/connector: make intel_connector_init() static
      drm/i915: silence rpm wakeref asserts on GEN11_GU_MISC_IIR access
      drm/i915/display: pass display to HAS_PCH_*() macros
      drm/i915/fb: pass display to HAS_GMCH() and DISPLAY_VER()
      drm/i915/clockgating: pass display to for_each_pipe()
      drm/i915/clockgating: pass display to HAS_PCH_*() macros
      drm/i915/clockgating: pass display to DSPCNTR and DSPSURF register ma=
cros
      drm/i915/irq: pass display to macros that expect display
      drm/i915/dram: pass display to macros that expect display
      drm/i915/gmch: pass display to DISPLAY_VER()
      drm/i915/gem: pass display to HAS_DISPLAY()
      drm/i915/switcheroo: pass display to HAS_DISPLAY()
      drm/i915/drv: pass display to HAS_DISPLAY()
      drm/i915/uncore: pass display to HAS_FPGA_DBG_UNCLAIMED()
      drm/i915/gvt: convert mmio table to struct intel_display
      drm/i915/reg: separate VLV_DSPCLK_GATE_D from DSPCLK_GATE_D
      drm/i915/display: drop __to_intel_display() usage
      drm/i915/audio: drop irq enabled check from LPE audio setup
      drm/i915/bo: remove unnecessary include
      drm/i915/switcheroo: check for NULL before dereferencing
      drm/i915/dram: add intel_fsb_freq() and use it
      drm/i915/dram: add intel_mem_freq()
      drm/i915/rps: use intel_fsb_freq() and intel_mem_freq()
      drm/i915/dram: bypass fsb/mem freq detection on dg2 and no display
      drm/i915/dram: move fsb_freq and mem_freq to dram info
      drm/i915/dp: convert open-coded timeout to poll_timeout_us()
      drm/i915/power: drop a couple of &i915->drm usages
      drm/i915/hdmi: use generic poll_timeout_us() instead of __wait_for()
      drm/i915/hdcp: use generic poll_timeout_us() instead of __wait_for()
      drm/i915/hdcp: use generic poll_timeout_us() instead of wait_for()
      drm/i915/dsi: use generic poll_timeout_us() instead of wait_for_us()
      drm/i915/dsi-pll: use generic poll_timeout_us() instead of wait_for()
      drm/i915/gmbus: use generic poll_timeout*() instead of wait_for*()
      drm/i915/wm: use generic poll_timeout_us() instead of wait_for()
      drm/i915/cdclk: use generic poll_timeout_us() instead of wait_for()
      drm/i915/power: use generic poll_timeout_us() instead of wait_for()
      drm/i915/power-well: use generic poll_timeout_us() instead of
wait_for() for DKL PHY
      drm/i915/power-well: use generic poll_timeout_us() instead of
wait_for() for VLV/CHV
      drm/i915/dp: use generic poll_timeout_us() instead of wait_for()
      drm/i915/dp: use generic poll_timeout_us() instead of wait_for()
in link training
      drm/i915/vblank: use generic poll_timeout_us() instead of wait_for()
      drm/i915/tc: use generic poll_timeout_us() instead of wait_for()
      drm/i915/dsb: use generic poll_timeout_us() instead of wait_for()
      drm/i915/lspcon: use generic poll_timeout_us() instead of wait_for()
      drm/i915/opregion: use generic poll_timeout_us() instead of wait_for(=
)
      drm/i915/ddi: prefer poll_timeout_us() over readx_poll_timeout()
      drm/i915/pps: prefer poll_timeout_us() over read_poll_timeout()
      drm/i915/power: fix size for for_each_set_bit() in abox iteration
      drm/i915/ddi: abstract figuring out encoder name
      drm/i915/fb: add intel_framebuffer_alloc()
      drm/{i915,xe}/panic: split out intel_panic.[ch]
      drm/{i915,xe}/panic: rename intel_bo_panic_*() to intel_panic_*()
      drm/{i915,xe}/fb: add panic pointer member to struct intel_framebuffe=
r
      drm/{i915,xe}/panic: rename struct {i915,xe}_panic_data to
struct intel_panic
      drm/{i915,xe}/panic: move framebuffer allocation where it belongs
      drm/{i915,xe}/panic: convert intel_panic_finish() to struct intel_pan=
ic
      drm/{i915,xe}/panic: pass struct intel_panic to intel_panic_setup()
      drm/i915: rename range_overflows_end() to range_end_overflows()
      drm/i915: document range_overflows() and range_end_overflows() macros
      overflow: add range_overflows() and range_end_overflows()
      drm/i915/display: add intel_display_device_present()
      drm/i915: split out i915_ptr_util.h
      drm/i915: split out i915_timer_util.[ch]
      drm/i915: split out i915_list_util.h
      drm/i915: split out i915_wait_util.h

Jann Horn (1):
      drm/panthor: Fix memory leak in panthor_ioctl_group_create()

Javier Martinez Canillas (1):
      drm/sitronix/st7571-i2c: Make st7571_panel_data variables static cons=
t

Jayesh Choudhary (1):
      drm/tidss: Set crtc modesetting parameters with adjusted mode

Jesse.Zhang (22):
      drm/amdgpu: Update SDMA firmware version check for user queue support
      drm/amd/pm: Add VCN reset support check capability
      drm/amd/pm: Add VCN reset support for SMU v13.0.6
      drm/amd/vcn: Add late_init callback for VCN v4.0.3 reset handling
      drm/amd/pm: Update SMU v13.0.6 PPT caps initialization
      drm/amdgpu: fix shift-out-of-bounds in amdgpu_debugfs_jpeg_sched_mask=
_set
      drm/amdgpu: update firmware version checks for user queue support
      drm/amdgpu/sdma: bump firmware version checks for user queue support
      drm/amdgpu: Add preempt and restore callbacks to userq funcs
      drm/amd/amdgpu: Implement MES suspend/resume gang functionality for v=
12
      drm/amdgpu/mes: add front end for detect and reset hung queue
      drm/amdgpu/mes11: implement detect and reset callback
      drm/amdgpu/mes12: implement detect and reset callback
      drm/amdgpu/userq: add a detect and reset callback
      drm/amdgpu: adjust MES API used for suspend and resume
      drm/amdgpu: Switch user queues to use preempt/restore for eviction
      drm/amdgpu: Refactor VCN v5.0.1 HW init into separate instance functi=
on
      drm/amdgpu: Add ring reset support for VCN v5.0.1
      drm/amdgpu: Move VCN reset mask setup to late_init for VCN 5.0.1
      drm/amd/pm: Add VCN reset message support for SMU v13.0.12
      drm/amdgpu: Add fallback to pipe reset if KCQ ring reset fails
      drm/amdgpu: Fix fence signaling race condition in userqueue

Jessica Zhang (2):
      drm/msm/dpu: Filter modes based on adjusted mode clock
      drm/msm/dpu: Drop maxwidth from dpu_lm_sub_blks struct

Jie Zhang (1):
      dt-bindings: display/msm/gmu: Update Adreno 623 bindings

Jingwen Zhu (2):
      drm/amd/display: Add a config flag for limited_pll_vco
      drm/amd/display: limited pll vco w/a v2

Jiri Slaby (SUSE) (1):
      drm/msm: use dev_fwnode()

Joe.Wang (1):
      drm/amdgpu: Fix PRT flag for gfx12

John Harrison (9):
      drm/i915/guc: Enable CT_DEAD output in regular debug builds
      drm/xe/guc: Add more GuC load error status codes
      drm/xe/guc: Clean up of GuC 'CTL' defines
      drm/xe/guc: Fix badly worded error message
      drm/xe/guc: Update CSS header structures
      drm/xe/guc: Add firmware build type to available info
      drm/xe: Allow freeing of a managed bo
      drm/xe/guc: Add test for G2G communications
      drm/xe/guc: Return an error code if the GuC load fails

John Hubbard (1):
      gpu: nova-core: register: minor grammar and spelling fixes

John Olender (1):
      drm/amdgpu: Fix NULL ptr deref in amdgpu_device_cache_switch_state()

Jonathan Cavitt (2):
      drm/xe/xe_guc_ads: Consolidate guc_waklv_enable functions
      drm/i915/gt: Fix memory leak in hangcheck selftest

Joseph Guo (3):
      dt-bindings: display: bridge: Add waveshare DSI2DPI unit support
      dt-bindings: display: panel: Add waveshare DPI panel support
      drm: bridge: Add waveshare DSI2DPI unit driver

Jos=C3=A9 Exp=C3=B3sito (1):
      drm/vkms: Assert if vkms_config_create_*() fails

Jouni H=C3=B6gander (26):
      drm/i915/psr: Do not disable Early Transport when enable_psr is set
      drm/i915/psr: Ignore enable_psr parameter on Panel Replay
      drm/i915/psr: Add enable_panel_replay module parameter
      drm/i915/display: Write PHY_CMN1_CONTROL only when using AUXLess ALPM
      drm/i915/display: Avoid unnecessarily calling
intel_cx0_get_owned_lane_mask
      drm/i915/display: Ensure phy is accessible on lfps configuration
      drm/i915/display: Set C10_VDR_CTRL_MSGBUS_ACCESS before phy reg read
      drm/i915/dsi: Fix overflow issue in pclk parsing
      drm/i915/psr: Do not trigger Frame Change events from frontbuffer flu=
sh
      drm/i915/psr: Underrun on idle PSR wa only when pkgc latency >
delayed vblank
      drm/i915/psr: drm_WARN_ON when activating disabled PSR
      drm/i915/psr: Do not activate disabled PSR on irq_aux_error
      drm/i915/psr: Check pause counter before continuing to PSR activation
      drm/i915/psr: Check drm_dp_dpcd_read return value on PSR dpcd init
      drm/i915/psr: Do not unnecessarily remove underrun on idle PSR WA
      drm/i915/psr: Check PSR pause counter in __psr_wait_for_idle_locked
      drm/i915/bios: Remove unnecessary checks of PSR idle frames in VBT bi=
nary
      drm/i915/alpm: Calculate silence period
      drm/i915/alpm: Add own define for LFPS count
      drm/i915/alpm: Replace hardcoded LFPS cycle with proper calculation
      drm/i915/alpm: Use actual lfps cycle and silence periods in wake time
      drm/i915/psr: Pass intel_crtc_state instead of intel_dp in wait_for_i=
dle
      drm/i915/psr: Add new define for PSR idle timeout
      drm/i915/psr: New interface adding PSR idle poll into dsb commit
      drm/i915/psr: Add poll for checking PSR is idle before starting updat=
e
      drm/i915/psr: Panel Replay SU cap dpcd read return value

Juha-Pekka Heikkila (3):
      drm/i915/display: take out dead code
      drm/i915/display: log fail from intel_sdvo_enable_hotplug
      drm/i915/display: Avoid divide by zero

Julia Filipchuk (2):
      drm/xe: Extend Wa_13011645652 to PTL-H, WCL
      drm/xe/guc: Recommend GUC v70.49.4 for PTL, BMG

Jun Nie (3):
      drm/msm: Do not validate SSPP when it is not ready
      drm/msm/dpu: polish log for resource allocation
      drm/msm/dpu: decide right side per last bit

Karthi Kandasamy (3):
      drm/amd/display: Add DC EDID read policy struct
      drm/amd/display: Add control flags to force PSR / replay
      drm/amd/display: Add AVI infoframe copy in copy_stream_update_to_stre=
am

Karthik Poosa (1):
      drm/xe/hwmon: Add SW clamp for power limits writes

Karunika Choo (7):
      drm/panthor: Add panthor_hw and move gpu_info initialization into it
      drm/panthor: Simplify getting the GPU model name
      drm/panthor: Add support for Mali-G710, Mali-G510 and Mali-G310
      drm/panthor: Add support for Mali-Gx15 family of GPUs
      drm/panthor: Serialize GPU cache flush operations
      drm/panthor: Make MMU cache maintenance use FLUSH_CACHES command
      drm/panthor: Add support for Mali-Gx20 and Mali-Gx25 GPUs

Kathara Sasikumar (1):
      Documentation/gpu/amdgpu: Fix duplicate word in driver-core.rst

Kaustabh Chakraborty (17):
      dt-bindings: display: panel: document Samsung AMS561RA01 panel
with S6E8AA5X01 controller
      drm: panel: add support for Samsung AMS561RA01 panel with
S6E8AA5X01 controller
      drm/bridge: samsung-dsim: support separate LINK and DPHY status regis=
ters
      drm/bridge: samsung-dsim: add SFRCTRL register
      drm/bridge: samsung-dsim: add flag to control header FIFO wait
      drm/bridge: samsung-dsim: allow configuring bits and offsets of
CLKCTRL register
      drm/bridge: samsung-dsim: allow configuring the MAIN_VSA offset
      drm/bridge: samsung-dsim: allow configuring the VIDEO_MODE bit
      drm/bridge: samsung-dsim: allow configuring PLL_M and PLL_S offsets
      drm/bridge: samsung-dsim: allow configuring the PLL_STABLE bit
      drm/bridge: samsung-dsim: increase timeout value for PLL_STABLE
      drm/bridge: samsung-dsim: add ability to define clock names for
every variant
      dt-bindings: samsung,mipi-dsim: document exynos7870 DSIM compatible
      drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM brid=
ge
      dt-bindings: display: samsung,exynos7-decon: document iommus,
memory-region, and ports
      drm/exynos: exynos7_drm_decon: remove ctx->suspended
      drm/exynos: dsi: add support for exynos7870

Kavithesh A.S (1):
      drm/amd/display: Document num_rmcm_3dluts in mpc_color_caps

Kent Russell (1):
      drm/amdkfd: Handle lack of READ permissions in SVM mapping

Konstantin Sinyuk (5):
      accel/habanalabs: disable device access after CPLD_SHUTDOWN
      accel/habanalabs/gaudi2: use the CPLD_SHUTDOWN event handler
      accel/habanalabs: add NVMe Direct I/O (HLDIO) infrastructure
      accel/habanalabs: add debugfs interface for HLDIO testing
      accel/habanalabs/gaudi2: read preboot status after recovering
from dirty state

Krzysztof Karas (3):
      drm/i915/selftests: Do not overwrite error code after
intel_context_migrate_clear() call
      drm/i915/selftests: Do not leak vm_area_struct on early return
      drm/i915/gt: Protect against overflow in active_engine()

Krzysztof Kozlowski (4):
      drm/msm/dsi/phy: Toggle back buffer resync after preparing PLL
      drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
      drm/msm/dsi/phy_7nm: Fix missing initial VCO rate
      drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared

Kuan-Wei Chiu (1):
      drm/amd/display: Optimize remove_duplicates() from O(N^2) to O(N)

Langyan Ye (2):
      drm/panel-edp: Add disable to 100ms for MNB601LS1-4
      drm/panel-edp: Add 50ms disable delay for four panels

Leander Kieweg (1):
      drm/tiny/bochs: Convert dev_err() to drm_err()

Lee Shawn C (2):
      drm/i915/hdmi: add debugfs to contorl HDMI bpc
      drm/i915: compute pipe bpp from link bandwidth management

Leo Li (1):
      drm/amd/display: Init DCN35 clocks from pre-os HW values

LiangCheng Wang (3):
      dt-bindings: display: Add Mayqueen Pixpaper e-ink panel
      drm: tiny: Add support for Mayqueen Pixpaper e-ink panel
      drm/tiny: pixpaper: Fix missing dependency on DRM_GEM_SHMEM_HELPER

Liao Yuanhong (24):
      drm/amd/display: Remove redundant semicolons
      drm/amd/display: Use swap() to simplify code
      drm/amdgpu/fence: Remove redundant 0 value initialization
      drm/amd/display: Remove redundant header files
      drm/sched/tests: Remove redundant header files
      drm/nouveau: Replace redundant return value judgment with
PTR_ERR_OR_ZERO()
      drm/ssd130x: Remove the use of dev_err_probe()
      drm/sti: Remove redundant ternary operators
      drm/amdgpu/amdgpu_cper: Remove redundant ternary operators
      drm/amdgpu/gfx: Remove redundant ternary operators
      drm/amdgpu/gmc: Remove redundant ternary operators
      drm/amdgpu/ih: Remove redundant ternary operators
      drm/amdgpu/jpeg: Remove redundant ternary operators
      drm/amdgpu/vcn: Remove redundant ternary operators
      drm/amd/display: Remove redundant ternary operators
      amdgpu/pm/legacy: remove redundant ternary operators
      drm/amd/pm/powerplay/hwmgr/ppatomctrl: Remove redundant ternary opera=
tors
      drm/amd/pm/powerplay/smumgr: remove redundant ternary operators
      drm/radeon/atom: Remove redundant ternary operators
      drm/radeon/dpm: Remove redundant ternary operators
      drm/radeon/radeon_legacy_encoders: Remove redundant ternary operators
      drm/radeon/pm: Remove redundant ternary operators
      drm/i915/gvt: Remove redundant ternary operators
      drm/msm/mdp4: remove the use of dev_err_probe()

Lijo Lazar (33):
      drm/amdgpu: Update supported modes for GC v9.5.0
      drm/amdgpu: Update external revid for GC v9.5.0
      drm/amdgpu: Add NULL check for asic_funcs
      drm/amd/pm: Use cached metrics data on aldebaran
      drm/amd/pm: Use cached metrics data on arcturus
      drm/amd/pm: Allow static metrics table query in VF
      drm/amdgpu: Add wrapper function for dpc state
      drm/amd/pm: Make static table support conditional
      drm/amdgpu: Wait for bootloader after PSPv11 reset
      drm/amdgpu: Set dpc status appropriately
      drm/amd/pm: Add priority messages for SMU v13.0.6
      drm/amdgpu: Log reset source during recovery
      drm/amdgpu/vcn: Fix double-free of vcn dump buffer
      drm/amdgpu: Prevent hardware access in dpc state
      drm/amdgpu: Add helpers to set/get unique ids
      drm/amd/pm: Add unique ids for SMUv13.0.6 SOCs
      drm/amd/pm: Remove cache logic from SMUv13.0.12
      drm/amd/pm: Add cache logic for temperature metric
      drm/amd/pm: Add caching to SMUv13.0.12 temp metric
      drm/amd/pm: Add unique ids for SMUv13.0.12 SOCs
      drm/amdgpu: Assign unique id to compute partition
      drm/amdgpu: Save and restore switch state
      drm/amdgpu: Add description for partition commands
      drm/amd/pm: Free SMUv13.0.6 resources on failure
      drm/amdgpu: Check vcn state before profile switch
      drm/amd/pm: Make use of __free for cleanup
      drm/amd/pm: Add caching for SystemMetrics table
      drm/amdgpu: Add vbios build number interface
      drm/amdgpu: Release hive reference properly
      drm/amdgpu: Read memory vendor information
      drm/amdgpu: Add generic capability class
      drm/amdgpu: Add virtual device capabilities
      drm/amdgpu: Fix vbios build number parsing logic

Liu Ying (3):
      drm/panel: lvds: Remove unused members from main structure
      drm/bridge: ite-it6263: Support HDMI vendor specific infoframe
      drm/bridge: waveshare-dsi: Fix bailout for devm_drm_bridge_alloc()

Liu01 Tong (1):
      drm/amdgpu: fix task hang from failed job submission during process k=
ill

Lizhi Hou (6):
      accel/amdxdna: Support user space allocated buffer
      accel/amdxdna: Unify pm and rpm suspend and resume callbacks
      accel/amdxdna: Add a function to walk hardware contexts
      Documentation: accel: amdxdna: Update compiler information
      accel/amdxdna: Fix incorrect type used for a local variable
      accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY

Lo-an Chen (1):
      drm/amd/display: Init dispclk from bootup clock for DCN314

Lohita Mudimela (1):
      drm/amd/display: Refactor DPP enum for backwards compatibility

Louis Chauvet (8):
      drm/vkms: Create helpers macro to avoid code duplication in
format callbacks
      drm/vkms: Add support for ARGB8888 formats
      drm/vkms: Add support for ARGB16161616 formats
      drm/vkms: Add support for RGB565 formats
      drm/vkms: Add support for RGB888 formats
      drm/vkms: Change YUV helpers to support u16 inputs for conversion
      drm/vkms: Create helper macro for YUV formats
      drm/vkms: Add P01* formats

Luca Ceresoli (16):
      drm/bridge: add a cleanup action for scope-based
drm_bridge_put() invocation
      drm/bridge: get the bridge returned by drm_bridge_chain_get_first_bri=
dge()
      drm/mxsfb: put the bridge returned by drm_bridge_chain_get_first_brid=
ge()
      drm/atomic-helper: put the bridge returned by
drm_bridge_chain_get_first_bridge()
      drm/probe-helper: put the bridge returned by
drm_bridge_chain_get_first_bridge()
      drm/bridge: get the bridge returned by drm_bridge_get_prev_bridge()
      drm/bridge: select_bus_fmt_recursive(): put the bridge obtained
by drm_bridge_get_prev_bridge()
      drm/bridge: display-connector: put the bridge obtained by
drm_bridge_get_prev_bridge()
      drm/debugfs: bridges_show: show refcount
      list: add list_last_entry_or_null()
      drm/bridge: add drm_bridge_chain_get_last_bridge()
      drm/bridge: imx93-mipi-dsi: use drm_bridge_chain_get_last_bridge()
      drm/omapdrm: use drm_bridge_chain_get_last_bridge()
      drm/bridge: add drm_bridge_is_last()
      drm/display: bridge_connector: use drm_bridge_is_last()
      drm/display: bridge-connector: remove unused variable assignment

Luca Coelho (1):
      drm/i915: use REG_BIT on FW_BLC_SELF_* macros

Lucas De Marchi (27):
      drm/xe: Fix build without debugfs
      drm/intel/pciids: Add match on vendor/id only
      Merge drm/drm-next into drm-xe-next
      drm/xe/psmi: Add GuC flag to enable PSMI
      drm/xe/psmi: Add debugfs interface for PSMI
      drm/xe/rtp: Add match for psmi
      drm/xe/configfs: Simplify kernel doc
      drm/xe/configfs: Allow to enable PSMI
      drm/xe/configfs: Use guard() for dev->lock
      drm/xe/configfs: Use tree-like output in documentation
      drm/xe/configfs: Improve documentation steps
      drm/xe/configfs: Minor fixes to documentation
      drm/xe/configfs: Dump custom settings when binding
      Merge drm/drm-next into drm-xe-next
      drm/xe/configfs: Block runtime attribute changes
      drm/xe/configfs: Use config_group_put()
      drm/xe: Update workaround documentation
      drm/xe/configfs: Fix documentation warning
      drm/xe: Use ARRAY_SIZE in guc_waklv_init()
      drm/xe/configfs: Extract function to parse engine
      drm/xe/configfs: Allow to select by class only
      drm/xe/lrc: Allow to add user commands on context switch
      drm/xe/configfs: Add post context restore bb
      drm/xe/lrc: Allow INDIRECT_CTX for more engine classes
      drm/xe/lrc: Allow to add user commands mid context switch
      drm/xe/configfs: Add mid context restore bb
      drm/xe: Fix build with CONFIG_MODULES=3Dn

Luiz Otavio Mello (9):
      drm/i915: Move struct_mutex to drm_i915_private
      drm/i915: Remove struct_mutex in i915_irq.c
      drm/i915: Change mutex initialization in intel_guc_log
      drm/i915: Replace struct_mutex in intel_guc_log
      drm/i915/gem: Clean-up outdated struct_mutex comments
      drm/i915/display: Remove outdated struct_mutex comments
      drm/i915: Clean-up outdated struct_mutex comments
      drm/i915: Drop unused struct_mutex from drm_i915_private
      drm/i915: Remove todo and comments about struct_mutex

Lukas Bulwahn (1):
      MAINTAINERS: adjust file entry in DRM ACCEL DRIVER FOR ROCKCHIP NPU

Lukasz Laguna (2):
      drm/xe/vf: Don't register I2C devices if VF
      drm/xe/vf: Disable CSC support on VF

Lyude Paul (3):
      rust: drm: gem: Simplify use of generics
      rust: drm: gem: Add DriverFile type alias
      rust: drm: gem: Drop Object::SIZE

Maarten Lankhorst (2):
      accel/ivpu: Remove lockdep_assert_irqs_disabled()
      drm/xe: Fix oops in xe_gem_fault when running core_hotunplug test.

Mallesh Koujalagi (1):
      drm/xe/hwmon: Remove type casting

Mangesh Gadre (4):
      drm/amdgpu: Initialize jpeg v5_0_1 ras function
      drm/amdgpu: Initialize vcn v5_0_1 ras function
      drm/amdgpu: Avoid jpeg v5.0.1 poison irq call trace on sriov guest
      drm/amdgpu: Avoid vcn v5.0.1 poison irq call trace on sriov guest

Marcin Bernatowicz (1):
      drm/xe/tests: Make cross-device dma-buf BOs CPU-visible on small BAR

Marcus Folkesson (6):
      drm/st7571-i2c: correct pixel data format description
      dt-bindings: display: sitronix,st7571: add optional inverted property
      dt-bindings: display: sitronix,st7567: add optional inverted property
      drm/st7571-i2c: add support for inverted pixel format
      drm/format-helper: introduce drm_fb_xrgb8888_to_gray2()
      drm/st7571-i2c: add support for 2bit grayscale for XRGB8888

Marek Vasut (2):
      drm/rcar-du: dsi: Fix 1/2/3 lane support
      drm/rcar-du: dsi: Implement DSI command support

Mario Limonciello (28):
      drm/amd/display: Drop unnecessary 'rc' variable in
amdgpu_dm_backlight_get_level()
      drm/amd/display: Add missing SPDX license identifier
      drm/amd/display: Drop unused include
      drm/amd/display: Remove unnecessary whitespace
      drm/amd/display: Remove unnecessary includes
      drm/amd/display: Rename dcn31 string shown to user
      drm/amd: Restore cached power limit during resume
      drm/amd: Restore cached manual clock settings during resume
      drm/amd: Use drm_*() macros instead of DRM_*() for amdgpu_cs
      drm/amd/display: Revert "drm/amd/display: Fix AMDGPU_MAX_BL_LEVEL val=
ue"
      drm/amd/display: Optimize amdgpu_dm_atomic_commit_tail()
      drm/amd/display: Attach privacy screen to DRM connector
      drm/amd/display: Avoid a NULL pointer dereference
      drm/amd: Re-enable common modes for eDP and LVDS
      drm/amd/display: Optimize custom brightness curve interpolation
      drm/amd/display: Indicate when custom brightness curves are in use
      Documentation/amdgpu: Add Ryzen AI 330 series processor
      drm/amd: Duplicate DC_FEATURE_MASK and DC_DEBUG_MASK enum values into=
 kdoc
      drm/amd/display: Set up pixel encoding for YCBCR422
      drm/amd/display: Add fallback path for YCBCR422
      drm/amd: Only restore cached manual clock settings in restore if
OD enabled
      drm/amdgpu: Enable MES lr_compute_wa by default
      drm/amd/display: Handle interpolation for first data point
      drm/amd/display: Only enable common modes for eDP and LVDS
      drm/amd: Drop unnecessary check in amdgpu_connector_add_common_modes(=
)
      drm/amd: Use dynamic array size declaration for
amdgpu_connector_add_common_modes()
      drm/amd: Drop some common modes from amdgpu_connector_add_common_mode=
s()
      drm/amd: Add name to modes from amdgpu_connector_add_common_modes()

Mario Limonciello (AMD) (7):
      drm/amd/display: Drop dm_prepare_suspend() and dm_complete()
      Fix access to video_is_primary_device() when compiled without CONFIG_=
VIDEO
      PCI/VGA: Replace vga_is_firmware_default() with a screen info check
      fbcon: Use screen info to find primary device
      DRM: Add a new 'boot_display' attribute
      drm/amd: Avoid evicting resources at S5
      drm/amd: Drop unnecessary calls to smu_dpm_set_vpe_enable()

Martin Leung (1):
      Revert "drm/amd/display: Reduce Stack Usage by moving
'audio_output' into 'stream_res' v4"

Matt Atwood (2):
      drm/xe: rename XE_WA to XE_GT_WA
      drm/xe: Update function names for GT specific workarounds

Matt Roper (1):
      drm/xe: Never report L3 bank mask for media GT going forward

Matthew Auld (14):
      drm/xe/migrate: prevent infinite recursion
      drm/xe/migrate: don't overflow max copy size
      drm/xe/migrate: prevent potential UAF
      drm/xe: rework PDE PAT index selection
      drm/xe/migrate: make MI_TLB_INVALIDATE conditional
      drm/gpusvm: fix hmm_pfn_to_map_order() usage
      drm/gpusvm: use more selective dma dir in get_pages()
      drm/gpusvm: pull out drm_gpusvm_pages substructure
      drm/gpusvm: refactor core API to use pages struct
      drm/gpusvm: export drm_gpusvm_pages API
      drm/xe/vm: split userptr bits into separate file
      drm/xe/userptr: replace xe_hmm with gpusvm
      drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
      drm/xe: improve dma-resv handling for backup object

Matthew Brost (17):
      drm/xe: Explicitly mark migration queues with flag
      drm/xe: Add generic dependecy jobs / scheduler
      drm/xe: Create ordered workqueue for GT TLB invalidation jobs
      drm/xe: Add dependency scheduler for GT TLB invalidations to bind que=
ues
      drm/xe: Add GT TLB invalidation jobs
      drm/xe: Use GT TLB invalidation jobs in PT layer
      drm/xe: Remove unused GT TLB invalidation trace points
      drm/xe: Don't trigger rebind on initial dma-buf validation
      drm/xe: s/tlb_invalidation/tlb_inval
      drm/xe: Add xe_tlb_inval structure
      drm/xe: Add xe_gt_tlb_invalidation_done_handler
      drm/xe: Decouple TLB invalidations from GT
      drm/xe: Prep TLB invalidation fence before sending
      drm/xe: Add helpers to send TLB invalidations
      drm/xe: Split TLB invalidation code in frontend and backend
      drm/xe: Add clearing stats to GT debugfs
      drm/xe: Add more SVM GT stats

Matthew Schwartz (1):
      drm/amd/display: Only restore backlight after amdgpu_dm_init or dm_re=
sume

Maxime Ripard (15):
      Merge drm/drm-next into drm-misc-next
      drm/tidss: dispc: Remove unused OVR_REG_GET
      drm/tidss: dispc: Convert accessors to macros
      drm/tidss: dispc: Switch to GENMASK instead of FLD_MASK
      drm/tidss: dispc: Get rid of FLD_VAL
      drm/tidss: dispc: Get rid of FLD_GET
      drm/tidss: dispc: Get rid of FLD_MOD
      drm/tidss: dispc: Switch REG_GET to using a mask
      drm/tidss: dispc: Switch REG_FLD_MOD to using a mask
      drm/tidss: dispc: Switch VID_REG_GET to using a mask
      drm/tidss: dispc: Switch VID_REG_FLD_MOD to using a mask
      drm/tidss: dispc: Switch VP_REG_GET to using a mask
      drm/tidss: dispc: Switch VP_REG_FLD_MOD to using a mask
      drm/tidss: dispc: Switch OVR_REG_FLD_MOD to using a mask
      drm/tidss: dispc: Define field masks being used

Ma=C3=ADra Canal (8):
      drm/v3d: Add parameter to retrieve the global number of GPU resets
      drm/v3d: Add parameter to retrieve the number of GPU resets per-fd
      drm/v3d: Store a pointer to `struct v3d_file_priv` inside each job
      drm/v3d: Store the active job inside the queue's state
      drm/v3d: Replace a global spinlock with a per-queue spinlock
      drm/v3d: Address race-condition between per-fd GPU stats and fd relea=
se
      drm/v3d: Synchronous operations can't timeout
      drm/v3d: Protect per-fd reset counter against fd release

Mel Henning (3):
      drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT config
      drm/nouveau: Remove nvkm_gsp_fwif.enable
      drm/nouveau: Improve message for missing firmware

Melissa Wen (3):
      drm/amd/display: update color on atomic commit time
      drm/amd/display: change dc stream color settings only in atomic commi=
t
      drm/amd/display: remove output_tf_change flag

Meng Li (1):
      drm/amd/amdgpu: Release xcp drm memory after unplug

Michael Strauss (3):
      drm/amd/display: Move setup_stream_attribute
      drm/amd/display: Increase AUX Intra-Hop Done Max Wait Duration
      drm/amd/display: Cache streams targeting link when performing LT
automation

Michal Wajdeczko (57):
      drm/xe: Move debugfs GT attributes under tile directory
      drm/xe/pf: Enable SR-IOV PF mode by default
      drm/xe: Enable SR-IOV for ADL/ATSM
      drm/xe: Enable SR-IOV for TGL
      drm/xe: Make GGTT TLB invalidation failure message GT oriented
      drm/xe/guc: Clear whole g2h_fence during initialization
      drm/xe/configfs: Fix pci_dev reference leak
      drm/xe/configfs: Enforce canonical device names
      drm/xe/configfs: Use pci_name() for lookup
      drm/xe/hw_engine_group: Don't use drm_warn to catch missed case
      drm/xe/pf: Skip LMTT update if no LMEM was provisioned
      drm/xe/pf: Disable PF restart worker on device removal
      drm/xe/pf: Make sure PF is ready to configure VFs
      drm/xe/pf: Don't resume device from restart worker
      drm/xe: Simplify module initialization code
      drm/xe: Print module init abort code
      drm/xe/configfs: Destroy xe_configfs.su_mutex on exit/error
      drm/xe/configfs: Drop redundant init() error message
      drm/xe/configfs: Rename struct xe_config_device
      drm/xe/configfs: Rename configfs_find_group() helper
      drm/xe/configfs: Reintroduce struct xe_config_device
      drm/xe/configfs: Keep default device config settings together
      drm/xe/configfs: Only allow configurations for supported devices
      drm/xe/configfs: Allow adding configurations for future VFs
      drm/xe/kunit: Extend platform generator with PTL
      drm/xe/debugfs: Move sa_info from gt to tile directory
      drm/xe/guc: Set upper limit of H2G retries over CTB
      drm/xe/configfs: Don't touch survivability_mode on fini
      drm/xe/configfs: Prepare to filter-out configfs attributes
      drm/xe/configfs: Don't expose survivability_mode if not applicable
      drm/xe: Allow to stub lookup for graphics and media IP
      drm/xe/kunit: Update struct xe_pci_fake_data step declarations
      drm/xe/kunit: Introduce xe_pci_fake_data_desc()
      drm/xe/kunit: Drop custom struct platform_test_case
      drm/xe/kunit: Promote fake platform parameter list
      drm/xe/kunit: Drop xe_wa_test_exit
      drm/xe: Fix broken kernel-doc for the struct xe_bo
      drm/xe/guc: Rename xe_guc_register_exec_queue
      drm/xe/guc: Use proper flag definitions when registering context
      drm/xe/vf: Drop IS_VF_CCS_INIT_NEEDED macro
      drm/xe/vf: Use single check when calling VF CCS functions
      drm/xe/bo: Add xe_bo_has_valid_ccs_bb helper
      drm/xe/vf: Move VF CCS data to xe_device
      drm/xe/vf: Move VF CCS debugfs attribute
      drm/xe/debugfs: Make residencies definitions const
      drm/xe/debugfs: Don't expose dgfx residencies attributes on VF
      drm/xe/guc: Always add CT disable action during second init step
      drm/xe/guc: Don't invoke disable_ct action during replacement
      drm/xe/pf: Drop rounddown_pow_of_two fair LMEM limitation
      drm/xe: Keep xe_gt_err() macro definitions together
      drm/xe: Drop "gt_" prefix from xe_gt_WARN() macros
      drm/xe: Prepare format for GT-oriented messages in one place
      drm/xe: Add dedicated printk macros for tile and device
      drm/xe: Use tile-oriented messages in GGTT code
      drm/xe/tests: Add pre-GMDID IP descriptors to param generators
      drm/xe/vf: Don't expose sysfs attributes not applicable for VFs
      drm/xe/sysfs: Simplify sysfs registration

Michal Wilczynski (3):
      drm/imagination: Use pwrseq for TH1520 GPU power management
      dt-bindings: gpu: img,powervr-rogue: Add TH1520 GPU support
      drm/imagination: Enable PowerVR driver for RISC-V

Micha=C5=82 Winiarski (1):
      drm/xe/pf: Set VF LMEM BAR size

Michel D=C3=A4nzer (1):
      drm/amd/display: Add primary plane to commits for correct VRR handlin=
g

Mika Kahola (1):
      drm/i915/display: Fix possible overflow on tc power domain selection

Min Ma (1):
      MAINTAINERS: Update Min Ma's email for AMD XDNA driver

Moti Haimovski (1):
      accel/habanalabs: support mapping cb with vmalloc-backed coherent mem=
ory

Muhammad Ahmed (1):
      drm/amd/display: Adding interface to log hw state when underflow happ=
ens

Nathan Chancellor (3):
      drm/tidss: dispc: Explicitly include bitfield.h
      drm/bridge: cdns-dsi: Select VIDEOMODE_HELPERS
      drm/pixpaper: Fix return type of pixpaper_mode_valid()

Neil Armstrong (3):
      drm/msm: adreno: a6xx: enable GMU bandwidth voting for x1e80100 GPU
      dt-bindings: display: bridge: simple: document the Realtek
RTD2171 DP-to-HDMI bridge
      drm/bridge: simple: add Realtek RTD2171 DP-to-HDMI bridge

Nemesa Garg (2):
      drm/i915/display: WA_14011503117
      drm/i915/scaler: Fix condition for WA_14011503117

Nicholas Carbones (1):
      drm/amd/display: DC v3.2.347

Nicholas Kazlauskas (1):
      drm/amd/display: Fix DMCUB loading sequence for DCN3.2

Nitin Gote (3):
      drm/xe: Rename MCFG_MCR_SELECTOR to STEER_SEMAPHORE
      drm/xe/tuning: Apply "Disable NULL query for Anyhit Shader" to Xe2
      drm/xe: defer free of NVM auxiliary container to device release callb=
ack

Oleh Kuzhylnyi (1):
      drm/amd/display: Add HDCP policy control

Ostrowski Rafal (1):
      drm/amd/display: Update tiled to tiled copy command

Ovidiu Bunea (3):
      drm/amd/display: Revert "Add a config flag for limited_pll_vco"
      drm/amd/display: Fix dmub_cmd header alignment
      drm/amd/display: Correct sequences and delays for DCN35 PG & RCG

Paul Hsieh (2):
      drm/amd/display: update dpp/disp clock from smu clock table
      drm/amd/display: Add monitor patch to read psr cap again

Paul Kocialkowski (2):
      dt-bindings: display: simple: Add Olimex LCD-OLinuXino-5CTS
      drm/panel: simple: Add Olimex LCD-OLinuXino-5CTS support

Pavan S (1):
      accel/habanalabs: add Infineon version check

Perry Yuan (1):
      drm/amdgpu: Fix build error when CONFIG_SUSPEND is disabled

Philipp Stanner (3):
      drm/nouveau: Remove surplus struct member
      MAINTAINERS: Add website of Nova GPU driver
      drm/sched: Document race condition in drm_sched_fini()

Pierre-Eric Pelloux-Prayer (2):
      drm/amdgpu: give each kernel job a unique id
      drm/sched: Fix racy access to drm_sched_entity.dependency

Pin-yen Lin (2):
      drm/panel: Allow powering on panel follower after panel is enabled
      HID: i2c-hid: Make elan touch controllers power on after panel is ena=
bled

Piotr Pi=C3=B3rkowski (8):
      drm/xe: Use devm_ioremap_wc for VRAM mapping and drop manual unmap
      drm/xe: Use dynamic allocation for tile and device VRAM region struct=
ures
      drm/xe: Move struct xe_vram_region to a dedicated header
      drm/xe: Split xe_migrate allocation from initialization
      drm/xe: Unify the initialization of VRAM regions
      drm/xe/pf: Program LMTT directory pointer on all GTs within a tile
      drm/xe: Assign ioctl xe file handler to vm in xe_vm_create
      drm/xe: Move ASID allocation and user PT BO tracking into xe_vm_creat=
e

Pratap Nirujogi (1):
      drm/amd/amdgpu: Declare isp firmware binary file

Prike Liang (5):
      drm/amdgpu: validate userq input args
      drm/amdgpu: clean up the amdgpu_userq_active()
      drm/amdgpu: validate userq hw unmap status for destroying userq
      drm/amdgpu: validate userq buffer virtual address and size
      drm/amdgpu/userq: assign an error code for invalid userq va

Priyanka Dandamudi (1):
      drm/xe/uapi: Add documentation for DRM_XE_GEM_CREATE_FLAG_DEFER_BACKI=
NG

Qianfeng Rong (8):
      drm/amd/display: Use boolean context for pointer null checks
      drm/radeon: Use vmalloc_array and vcalloc to simplify code
      drm/amd/display: use max() to improve code
      accel/amdxdna: Use int instead of u32 to store error codes
      drm/radeon/ci_dpm: Use int type to store negative error codes
      drm/amdkfd: Fix error code sign for EINVAL in svm_ioctl()
      drm/amd/pm: use int type to store negative error codes
      drm/msm/dpu: fix incorrect type for ret

Qiang Liu (1):
      drm/amdgpu: remove duplicated argument wptr_va

Raag Jadav (3):
      drm/xe: Don't fail probe on unsupported mailbox command
      drm/xe/i2c: Introduce xe_i2c_present()
      drm/xe/i2c: Enable bus mastering

Rafal Ostrowski (2):
      drm/amd/display: Add LSDMA Linear Sub Window Copy support
      drm/amd/display: Align LSDMA commands fields

Rahul Kumar (1):
      drm/amdgpu: Use kmalloc_array() instead of kmalloc()

Rakuram Eswaran (1):
      docs: gpu: amdgpu: Fix spelling in amdgpu documentation

Raphael Gallais-Pou (10):
      drm: of: fix documentation reference
      dt-bindings: panel: lvds: Append ampire,amp19201200b5tzqw-t03 in
panel-lvds
      drm/stm: ltdc: unify log system
      dt-bindings: display: st: add two new compatibles to LTDC device
      dt-bindings: display: st,stm32-ltdc: add access-controllers property
      dt-bindings: display: st: add new compatible to LVDS device
      dt-bindings: display: st,stm32mp25-lvds: add access-controllers prope=
rty
      dt-bindings: display: st,stm32mp25-lvds: add power-domains property
      dt-bindings: arm: stm32: add required #clock-cells property
      dt-bindings: panel: lvds: Append edt,etml0700z8dha in panel-lvds

Ray Wu (2):
      drm/amd/display: Add Replay residency in debugfs
      drm/amd/display: Remove duplicated code

Relja Vojvodic (3):
      drm/amd/display: Allow for sharing of some link and audio link functi=
ons
      drm/amd/display: Increase minimum clock for TMDS 420 with pipe splitt=
ing
      drm/amd/display: Add DSC padding for OVT Support

Reza Amini (2):
      drm/amd/display: Fixing hubp programming of 3dlut fast load
      drm/amd/display: Decrease stack size in logging path

Rhys Lloyd (2):
      gpu: nova-core: vbios: use size_of instead of magic number
      gpu: nova-core: vbios: change PmuLookupTableEntry to use size_of

Riana Tauro (11):
      drm/xe: Add documentation for Xe Device Wedging
      drm: Add a vendor-specific recovery method to drm device wedged ueven=
t
      drm/xe: Set GT as wedged before sending wedged uevent
      drm/xe: Add a helper function to set recovery method
      drm/xe/xe_survivability: Refactor survivability mode
      drm/xe/xe_survivability: Add support for Runtime survivability mode
      drm/xe/doc: Document device wedged and runtime survivability
      drm/xe: Add support to handle hardware errors
      drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors
      drm/xe/xe_hw_error: Add fault injection to trigger csc error handler
      drm/xe/nvm: Use root tile mmio

Rob Clark (9):
      drm/msm: Fix obj leak in VM_BIND error path
      drm/msm: Fix missing VM_BIND offset/range validation
      drm/msm: Fix 32b size truncation
      drm/msm: Drop unneeded NULL check
      drm/msm/registers: Remove license/etc from generated headers
      drm/msm/registers: Sync gen_header.py from mesa
      drm/msm/registers: Make TPL1_BICUBIC_WEIGHTS_TABLE an array
      drm/msm/registers: Generate _HI/LO builders for reg64
      drm/msm/registers: Sync GPU registers from mesa

Rob Herring (Arm) (2):
      drm/simpledrm: Use of_reserved_mem_region_to_resource() for
"memory-region"
      drm/msm: Use of_reserved_mem_region_to_resource() for "memory-region"

Robert Mader (1):
      drm/vkms: Add writeback encoders as possible clones

Rodrigo Siqueira (18):
      drm/amdgpu/vcn: Remove unnecessary check
      drm/amdgpu/vcn: Document IRQ per-instance irq behavior for VCN 4.0.3
      drm/amdgpu/vcn: Change amdgpu_vcn_sw_fini return to void
      drm/amdgpu: Remove volatile from CSB functions
      drm/amdgpu: Remove volatile from RLC files
      drm/amdgpu: Remove volatile from ring manipulation
      drm/amdgpu: Remove volatile from amdgpu and amdgpu_ih headers
      drm/amdgpu: Remove volatile references from VCN
      drm/amd/display: Use devm_i2c_add_adapter to simplify i2c cleanup log=
ic
      drm/amdgpu/amdgpu_i2c: Use devm_i2c_add_adapter instead of i2c_add_ad=
apter
      drm/amdgpu: Use devm_i2c_add_adapter() in SMU V11
      drm/amd/pm: Use devm_i2c_add_adapter() in the i2c init
      drm/amd/pm: Use devm_i2c_add_adapter() in the Arcturus smu
      drm/amd/pm: Use devm_i2c_add_adapter() in the Navi10 smu
      drm/amd/pm: Use devm_i2c_add_adapter() in the Sienna smu
      drm/amd/pm: Use devm_i2c_add_adapter() in the V13 smu
      drm/amd/pm: Use devm_i2c_add_adapter() in the V13_0_6 smu
      drm/amd/pm: Use devm_i2c_add_adapter() in the V14_0_2 smu

Rodrigo Vivi (2):
      Merge drm/drm-next into drm-intel-next
      drm/xe: Fix circular locking dependency

Roman Li (1):
      drm/amd/display: Refine error message for vblank init failure

Ruben Wauters (3):
      drm/i915: replace DRM_DEBUG_SELFTEST with DRM_KUNIT_TEST
      drm/gud: Remove unnecessary logging
      drm/gud: Replace simple display pipe with DRM atomic helpers

Ryan Seto (1):
      drm/amd/display: Toggle for Disable Force Pstate Allow on Disable

Sakari Ailus (1):
      drm/panfrost: Remove redundant pm_runtime_mark_last_busy() calls

Salah Triki (1):
      accel/amdxdna: Delete pci_free_irq_vectors()

Sanjay Yadav (1):
      drm/xe/migrate: Remove unneeded emit_pte() when copying CCS only

Sathishkumar S (13):
      drm/amdgpu: Check vcn sram load return value
      drm/amdgpu: Fix unintended error log in VCN5_0_0
      drm/amdgpu/vcn: Add regdump helper functions
      drm/amdgpu/vcn: Register dump cleanup in VCN5
      drm/amdgpu/vcn: Register dump cleanup in VCN4_0_0
      drm/amdgpu/vcn: Register dump cleanup in VCN4_0_5
      drm/amdgpu/vcn: Register dump cleanup in VCN4_0_3
      drm/amdgpu/vcn: Register dump cleanup in VCN3_0
      drm/amdgpu/vcn: Register dump cleanup in VCN2_0_0
      drm/amdgpu/vcn: Register dump cleanup in VCN2_5
      drm/amdgpu/jpeg: Hold pg_lock before jpeg poweroff
      drm/amdgpu/vcn: Hold pg_lock before vcn power off
      drm/amdgpu/jpeg: Move parse_cs to amdgpu_jpeg.c

Satyanarayana K V P (8):
      drm/xe/vf: Create contexts for CCS read write
      drm/xe/vf: Attach and detach CCS copy commands with BO
      drm/xe/vf: Register CCS read/write contexts with Guc
      drm/xe/vf: Fix VM crash during VF driver release
      drm/xe/vf: Refactor CCS save/restore to use default migration context
      drm/xe/pm: Disable RPM for SR-IOV VFs
      drm/xe/guc: Add devm release action to safely tear down CT
      drm/xe/vf: Enable CCS save/restore only on supported GUC versions

Sebastian Andrzej Siewior (1):
      drm/i915: Don't check for atomic context on PREEMPT_RT

Sebastian Brzezinka (5):
      drm/i915: Add braces around the else block in clflush_write32()
      drm/i915: Replace empty conditional with continue in eb_relocate_vma(=
)
      drm/i915/gt: Relocate compression repacking WA for JSL/EHL
      drm/i915/gt: Relocate Gen7 context-specific workarounds
      drm/i915/gt: Relocate Gen6 context-specific workaround

Seyediman Seyedarab (1):
      drm/nouveau: replace snprintf() with scnprintf() in nvkm_snprintbf()

Shankari Anand (3):
      drm: nova: update ARef import from sync::aref
      rust: drm: update ARef and AlwaysRefCounted imports from sync::aref
      gpu: nova-core: Update ARef imports from sync::aref

Shaoyun Liu (3):
      drm/amd/include : Update MES v12 API header(INV_TLBS)
      drm/amd/amdgpu : Use the MES INV_TLBS API for tlb invalidation on gfx=
12
      drm/amd/amdgpu: Fix the mes version that support inv_tlbs

Sharley Calzolari (1):
      accel/habanalabs/gaudi2: add support for logging register
accesses from debugfs

Shuicheng Lin (4):
      drm/xe/hw_engine_group: Avoid call kfree() for drmm_kzalloc()
      drm/xe/tile: Release kobject for the failure path
      drm/xe: Misc refine for svm
      drm/xe/madvise: Fix ioctl argument check

Simon Richter (2):
      Mark xe driver as BROKEN if kernel page size is not 4kB
      drm/xe: Make page size consistent in loop

Simon Ser (1):
      drm: document DRM_MODE_PAGE_FLIP_EVENT interactions with atomic

Siyang Liu (1):
      drm/amd/display: fix a Null pointer dereference vulnerability

Sk Anirban (1):
      drm/xe/ptl: Apply Wa_16026007364

Soham Purkait (1):
      drm/xe/xe_debugfs: Exposure of G-State and pcie link state
residency counters through debugfs

Sonny Jiang (1):
      drm/amdgpu: Update amdgpu_vcn5_fw_shared for vcn_5_0_1

Sridevi Arvindekar (1):
      drm/amd/display: Fix for test crash due to power gating

Srinivasan Shanmugam (14):
      drm/amd/display: Reduce Stack Usage by moving 'audio_output'
into 'stream_res' v4
      drm/amdgpu: Fix kdoc style in amdgpu_fence.c
      drm/amd/display: Add NULL check for stream before dereference in
'dm_vupdate_high_irq'
      drm/amd/display: Add NULL pointer checks in dc_stream cursor
attribute functions
      drm/amdgpu: Fix function header names in amdgpu_connectors.c
      drm/amdgpu: Correct misnamed function in amdgpu_gem.c
      drm/ttm: Bump TTM_NUM_MEM_TYPES to 9 (Prep for AMDGPU_PL_MMIO_REMAP)
      drm/amdgpu/uapi: Introduce AMDGPU_GEM_DOMAIN_MMIO_REMAP
      drm/amdgpu/ttm: Add New AMDGPU_PL_MMIO_REMAP Placement
      drm/amdgpu: Wire up MMIO_REMAP placement and User-visible strings
      drm/amdgpu: Implement TTM handling for MMIO_REMAP placement
      drm/amdgpu/ttm: Initialize AMDGPU_PL_MMIO_REMAP Heap
      drm/amdgpu/ttm: Allocate/Free 4K MMIO_REMAP Singleton
      drm/amdgpu/gfx11: Add Cleaner Shader Support for GFX11.0.1/11.0.4 GPU=
s

Stanley.Yang (3):
      drm/amdgpu: Fix vcn v5.0.1 poison irq call trace
      drm/amdgpu: Add new error code for VCN/JPEG new chain
      drm/amdgpu: wait pmfw polling mca bank info done

Steven Price (1):
      drm/panthor: Simplify mmu_hw_do_operation_locked

Stuart Summers (3):
      drm/xe/pcode: Initialize data0 for pcode read routine
      drm/xe: Move explicit CT lock in TLB invalidation sequence
      drm/xe: Cancel pending TLB inval workers on teardown

Sunday Clement (1):
      drm/amdkfd: Allow device error to be logged

Sunil Khatri (6):
      drm/amdgpu: add more information in debugfs to pagetable dump
      drm/amdgpu: fix the formating for debugfs print
      drm/amdgpu: print root PD address in PDE format instead of GPU
      drm/amdgpu: add missing comment for the new argument
      drm/amdgpu: use hmm_pfns instead of array of pages
      drm/amdgpu: remove the redeclaration of variable i

Suraj Kandpal (10):
      drm/i915/scaler: Use intel_display as argument to skl_scaler_max_src_=
size
      drm/i915/xe3lpd: Prune modes for YUV420
      drm/i915/vblank: Change log from err to debug
      drm/i915/scaler: Fix WA_14011503117
      drm/i915/backlight: Fix divide by 0 error in i9xx_set_backlight
      drm/i915/vbt: Add eDP Data rate overrride field in VBT
      drm/i915/bios: Add function to check if edp data override is needed
      drm/i915/edp: eDP Data Overrride
      drm/i915/hdcp: Remove the encoder check in hdcp enable
      drm/i915/backlight: Disable backlight when using luminance control

Svyatoslav Ryhel (4):
      dt-bindings: display: bridge: Document Solomon SSD2825
      drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge
      dt-bindings: display: panel: Document Hydis HV101HD1 DSI panel
      drm: panel: Add support for Hydis HV101HD1 MIPI DSI panel

Taimur Hassan (17):
      drm/amd/display: [FW Promotion] Release 0.1.18.0
      drm/amd/display: Promote DAL to 3.2.341
      drm/amd/display: [FW Promotion] Release 0.1.19.0
      drm/amd/display: Promote DAL to 3.2.342
      drm/amd/display: Promote DAL to 3.2.343
      drm/amd/display: Promote DC to 3.2.344
      drm/amd/display: [FW Promotion] Release 0.1.22.0
      drm/amd/display: Promote DC to 3.2.345
      drm/amd/display: [FW Promotion] Release 0.1.23.0
      drm/amd/display: Promote DC to 3.2.346
      drm/amd/display: [FW Promotion] Release 0.1.24.0
      drm/amd/display: [FW Promotion] Release 0.1.25.0
      drm/amd/display: Promote DC to 3.2.348
      drm/amd/display: Promote DC to 3.2.349
      drm/amd/display: Promote DC to 3.2.350
      drm/amd/display: [FW Promotion] Release 0.1.28.0
      drm/amd/display: Promote DC to 3.2.351

Tangudu Tilak Tirumalesh (2):
      drm/xe: Extend wa_13012615864 to additional Xe2 and Xe3 platforms
      drm/xe: Extend Wa_22021007897 to Xe3 platforms

Tao Zhou (2):
      drm/amdgpu: add range check for RAS bad page address
      drm/amdgpu: adjust the update of RAS bad page number

Thomas Hellstr=C3=B6m (23):
      drm/xe: Defer buffer object shrinker write-backs and GPU waits
      drm/xe/vm: Don't pin the vm_resv during validation
      drm/xe/tests/xe_dma_buf: Set the drm_object::dma_buf member
      drm/xe/vm: Clear the scratch_pt pointer on error
      drm/xe: Fix incorrect migration of backed-up object to VRAM
      drm/xe: Attempt to bring bos back to VRAM after eviction
      drm/xe: Allow the pm notifier to continue on failure
      drm/xe: Block exec and rebind worker while evicting for suspend
/ hibernate
      drm/xe: Pass down drm_exec context to validation
      drm/xe: Introduce an xe_validation wrapper around drm_exec
      drm/xe: Convert xe_bo_create_user() for exhaustive eviction
      drm/xe: Convert SVM validation for exhaustive eviction
      drm/xe: Convert existing drm_exec transactions for exhaustive evictio=
n
      drm/xe: Convert the CPU fault handler for exhaustive eviction
      drm/xe/display: Convert __xe_pin_fb_vma()
      drm/xe: Convert xe_dma_buf.c for exhaustive eviction
      drm/xe: Rename ___xe_bo_create_locked()
      drm/xe: Convert xe_bo_create_pin_map_at() for exhaustive eviction
      drm/xe: Convert xe_bo_create_pin_map() for exhaustive eviction
      drm/xe: Rework instances of variants of xe_bo_create_locked()
      drm/xe: Convert pinned suspend eviction for exhaustive eviction
      drm/xe: Fix uninitialized return values
      drm/xe: Work around clang multiple goto-label error

Thomas Zimmermann (24):
      Merge drm/drm-next into drm-misc-n
      drm/repaper: Do not access GEM-DMA vaddr directly
      drm/sharp-memory: Do not access GEM-DMA vaddr directly
      fbcon: Add necessary include statements and forward declarations
      drm/panel: panel-summit: Include <linux/property.h> and
<linux/mod_devicetable.h>
      drm/panel: panel-samsung-s6e88a0-ams427ap24: Fix includes
      video: pixel_format: Add compare helpers
      video: screen_info: Add pixel-format helper for linear framebuffers
      drm/sysfb: Find screen_info format with helpers
      drm/sysfb: Blit to CRTC destination format
      drm/color-mgmt: Prepare for RGB332 palettes
      drm/format-helper: Add XRGB8888-to-RGB332 to drm_fb_blit()
      drm/vesadrm: Rename vesadrm_set_gamma_lut() to vesadrm_set_color_lut(=
)
      drm/vesadrm: Prepare color management for palette-based framebuffers
      drm/vesadrm: Support DRM_FORMAT_C8
      drm/sysfb: Do not deref unexisting CRTC state in atomic_disable
      drm/ast: Do not print DRAM info
      drm/ast: Remove unused dram_bus_width field
      drm/ast: Remove unused mclk field
      drm/ast: Remove unused SCU-MPLL and SCU-STRAP values
      drm/ast: Move DRAM info next to its only user
      drm/ast: Put AST_DRAM_ constants into enum ast_dram_layout
      drm/gma500: Do not clear framebuffer GEM objects during cleanup
      Merge drm/drm-next into drm-misc-next-fixes

Thorsten Blum (3):
      drm/i915: Replace kmalloc() + copy_from_user() with memdup_user()
      drm/amdkfd: Replace kzalloc + copy_from_user with memdup_user
      drm/amdgpu: Replace kzalloc + copy_from_user with memdup_user

Timur Krist=C3=B3f (33):
      drm/amd/display: Don't overwrite dce60_clk_mgr
      drm/amd/display: Fix DCE 6.0 and 6.4 PLL programming.
      drm/amd/display: Don't overclock DCE 6 by 15%
      drm/amd/display: Adjust DCE 8-10 clock, don't overclock by 15%
      drm/amd/display: Find first CRTC and its line time in
dce110_fill_display_configs
      drm/amd/display: Fill display clock and vblank time in
dce110_fill_display_configs
      drm/amd/display: Don't warn when missing DCE encoder caps
      drm/amd/display: Don't print errors for nonexistent connectors
      drm/amd/display: Fix fractional fb divider in set_pixel_clock_v3
      drm/amd/display: Fix DP audio DTO1 clock source on DCE 6.
      drm/amdgpu: Respect max pixel clock for HDMI and DVI-D (v2)
      drm/amdgpu: Power up UVD 3 for FW validation (v2)
      drm/amd/pm: Disable ULV even if unsupported (v3)
      drm/amd/pm: Increase SMC timeout on SI and warn (v3)
      drm/amd/pm: Fix si_upload_smc_data (v3)
      drm/amd/pm: Adjust si_upload_smc_data register programming (v3)
      drm/amd/pm: Treat zero vblank time as too short in si_dpm (v3)
      drm/amd/pm: Disable MCLK switching with non-DC at 120 Hz+ (v2)
      drm/amd/pm: Disable SCLK switching on Oland with high pixel clocks (v=
3)
      drm/amd/pm: Remove wm_low and wm_high fields from amdgpu_crtc (v2)
      drm/amd/pm: Print VCE clocks too in si_dpm (v3)
      drm/amd/display: Add pixel_clock to amd_pp_display_configuration
      drm/amd/pm: Use pm_display_cfg in legacy DPM (v2)
      drm/amd/pm: Remove unneeded legacy DPM related code.
      drm/amdgpu: Fix allocating extra dwords for rings (v2)
      drm/amd/display: Fix DVI-D/HDMI adapters
      drm/amd/display: Keep PLL0 running on DCE 6.0 and 6.4
      drm/amd/display: Disable fastboot on DCE 6 too
      drm/amd/display: Disable VRR on DCE 6
      drm/amd/display: Don't use non-registered VUPDATE on DCE 6
      drm/amd/display: Reject modes with too high pixel clock on DCE6-10
      drm/amd/display: Share dce100_validate_bandwidth with DCE6-8
      drm/amd/display: Share dce100_validate_global with DCE6-8

Timur Tabi (1):
      drm/nouveau: always set RMDevidCheckIgnore for GSP-RM

Tom Chung (1):
      drm/amd/display: Fix Xorg desktop unresponsive on Replay panel

Tomasz Lis (8):
      drm/xe/sa: Avoid caching GGTT address within the manager
      drm/xe/vf: Pause submissions during RESFIX fixups
      drm/xe: Block reset while recovering from VF migration
      drm/xe/vf: Rebase HWSP of all contexts after migration
      drm/xe/vf: Rebase MEMIRQ structures for all contexts after migration
      drm/xe/vf: Post migration, repopulate ring area for pending request
      drm/xe/vf: Refresh utilization buffer during migration recovery
      drm/xe/vf: Rebase exec queue parallel commands during migration recov=
ery

Tomer Tayar (3):
      accel/habanalabs: return ENOMEM if less than requested pages were pin=
ned
      accel/habanalabs: clarify ctx use after hl_ctx_put() in dmabuf releas=
e
      accel/habanalabs: fix typo in trace output (cms -> cmd)

Tomeu Vizoso (6):
      accel/rocket: Add registers header
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses
      dt-bindings: npu: rockchip,rknn: Add bindings

Tomi Valkeinen (15):
      drm/tidss: Fix missing includes and struct decls
      drm/tidss: Use the crtc_* timings when programming the HW
      drm/bridge: cdns-dsi: Remove extra line at the end of the file
      drm/bridge: cdns-dsi: Drop crtc_* code
      drm/bridge: cdns-dsi: Remove broken fifo emptying check
      drm/bridge: cdns-dsi: Drop checks that shouldn't be in .mode_valid()
      drm/bridge: cdns-dsi: Update htotal in cdns_dsi_mode2cfg()
      drm/bridge: cdns-dsi: Drop cdns_dsi_adjust_phy_config()
      drm/bridge: cdns-dsi: Adjust mode to negative syncs
      drm/bridge: cdns-dsi: Fix REG_WAKEUP_TIME value
      drm/bridge: cdns-dsi: Use video mode and clean up cdns_dsi_mode2cfg()
      drm/bridge: cdns-dsi: Fix event mode
      drm/bridge: cdns-dsi: Tune adjusted_mode->clock according to dsi need=
s
      drm/bridge: cdns-dsi: Don't fail on MIPI_DSI_MODE_VIDEO_BURST
      drm/tidss: Remove early fb

TungYu Lu (1):
      drm/amd/display: Wait until OTG enable state is cleared

Tvrtko Ursulin (10):
      drm/sched: Fix a race in DRM_GPU_SCHED_STAT_NO_HANG test
      drm/sched: Avoid double re-lock on the job free path
      drm/xe: Use emit_flush_imm_ggtt helper instead of open coding
      drm/xe/xelp: Implement Wa_16010904313
      drm/xe/xelp: Add Wa_18022495364
      drm/sched: Remove mention of indirect buffers
      drm/amdgpu: Use vmemdup_array_user in amdgpu_bo_create_list_entry_arr=
ay
      drm/amdgpu: Use memdup_array_user in amdgpu_cs_wait_fences_ioctl
      drm/amdgpu: Use (v)memdup_array_user in amdgpu_cs_pass1
      drm/amdgpu: Use memset32 for ring clearing

Uma Shankar (1):
      drm/i915/display: Remove FBC modulo 4 restriction for ADL-P+

Uros Bizjak (1):
      drm/i915/active: Use try_cmpxchg64() in __active_lookup()

Val Packett (1):
      drm/dp: drm_edp_backlight_set_level: do not always send 3-byte comman=
ds

Varun Gupta (1):
      drm/xe: Fix driver reference in FLR comment

Vered Yavniely (1):
      accel/habanalabs/gaudi2: fix BMON disable configuration

Ville Syrj=C3=A4l=C3=A4 (26):
      drm/i915/dp: Fix 2.7 Gbps DP_LINK_BW value on g4x
      drm/i915/dp: Don't switch to idle pattern before disable on pre-hsw
      drm/i915/dp: Clear DPCD training pattern before transmitting the
idle pattern
      drm/i915/dp: Have intel_dp_get_adjust_train() tell us if anything cha=
nged
      drm/i915/dp: Move intel_dp_training_pattern()
      drm/i915/dp: Implement .set_idle_link_train() for everyone
      drm/i915/dp: Make .set_idle_link_train() mandatory
      drm/i915/dsi: Don't set/read the DSI C clock divider on GLK
      drm/i915: Precompute plane SURF address
      drm/i915: Nuke intel_plane_ggtt_offset()
      drm/i915: Move the intel_dpt_offset() check into intel_plane_pin_fb()
      drm/i915: Use i915_vma_offset() in intel_dpt_offset()
      drm/i915: Remove unused dpt_total_entries()
      drm/i915: Don't pass crtc_state to foo_plane_ctl() & co.
      iopoll: Generalize read_poll_timeout() into poll_timeout_us()
      iopoll: Avoid evaluating 'cond' twice in poll_timeout_us()
      iopoll: Reorder the timeout handling in poll_timeout_us()
      drm/i915/hpd: Fix mtp_tc_hpd_enable_detection()
      drm/i915/dram: Populate PNV memory type accurately
      drm/i915/dram: Use intel_dram_type_str() for pnv
      drm/i915/dram: Pack dram_info better
      drm/i915/dram: s/wm_lv0.../has_16gb_dimms/
      drm/i915/dram: Move 16Gb DIMM detection fully to the skl/icl codepath=
s
      drm/i915/dram: Fix some spelling around the 16Gb DIMM w/a
      drm/i915/dram: Don't call skl_get_dram_info()/skl_get_dram_type() on =
icl
      drm/i915/dram: Print memory details even if something went wrong

Vinay Belgaumkar (2):
      drm/xe/psmi: Add Wa_16023683509
      drm/xe/guc: Add SLPC power profile interface

Vinod Govindapillai (1):
      drm/i915/fbc: fix the implementation of wa_18038517565

Vitaly Margolin (1):
      accel/habanalabs: add generic message type to get error counters

Vitaly Prosyak (1):
      drm/amdgpu: add to custom amdgpu_drm_release drm_dev_enter/exit

Wenjing Liu (1):
      drm/amd/display: Update dchubbub.h for hubbub perfmon support

Wesley Chalmers (1):
      drm/amd/display: Rename header file link.h to link_service.h

Wig Cheng (1):
      dt-bindings: vendor-prefixes: Add Mayqueen name

Xaver Hugl (2):
      amdgpu/amdgpu_discovery: increase timeout limit for IFWI init
      drm: re-allow no-op changes on non-primary planes in async flips

Xi Ruoyao (1):
      drm/amd/display/dml2: Guard
dml21_map_dc_state_into_dml_display_cfg with DC_FP_START

Xiang Liu (9):
      drm/amdgpu: Update IPID value for bad page threshold CPER
      drm/amdgpu: Skip poison aca bank from UE channel
      drm/amdgpu: Fix jpeg v4.0.3 poison irq call trace on sriov guest
      drm/amdgpu: Fix vcn v4.0.3 poison irq call trace on sriov guest
      drm/amdgpu: Generate BP threshold exceed CPER once threshold exceeded
      drm/amdgpu: Notify pmfw bad page threshold exceeded
      drm/amdgpu: Correct info field of bad page threshold exceed CPER
      drm/amdgpu: Introduce VF critical region check for RAS poison injecti=
on
      drm/amdgpu: Check VF critical region before RAS poison injection

Xichao Zhao (3):
      drm/radeon: replace min/max nesting with clamp()
      drm/amd/display: Clean up coding style
      drm/amd/display: replace min/max nesting with clamp()

Xin Wang (2):
      drm/xe: make xe_gt_idle_disable_c6() handle the forcewake internally
      drm/xe: Ensure GT is in C0 during resumes

Yang Li (1):
      drm/xe: Remove duplicate header files

Yang Wang (9):
      drm/amd/amdgpu: disable hwmon power1_cap* for gfx 11.0.3 on vf mode
      drm/amd/amdgpu: unified amdgpu ip block name
      drm/amd/pm: refine amdgpu pm sysfs node error code
      drm/amd/pm: make smu_set_temp_funcs() smu specific for smu v13.0.6
      drm/amd/pm: unified smu feature cap interface
      drm/amd/pm: unified smu feature cap for link reset
      drm/amd/pm: unified smu feature cap for sdma reset
      drm/amd/pm: unified smu feature cap for vcn reset
      drm/amd/pm: place the smu 13.0.0 pptable header into the correct fold=
er

Yann Dirson (2):
      Documentation/amdgpu: fix 'in the amdgfx' formulation
      drm/amdgpu: fix module parameter description

Yannick Fertre (2):
      drm/stm: ltdc: support new hardware version for STM32MP25 SoC
      drm/stm: ltdc: handle lvds pixel clock

YiPeng Chai (6):
      drm/amdgpu: query the allocated vram address block info
      drm/amdgpu: add command to check address validity
      drm/amdgpu: support ras critical address check
      drm/amdgpu: add critical address check for bad page retirement
      drm/amdgpu: fix vram reservation issue
      drm/amd/ras: Add rascore status definition

Yifan Zhang (4):
      drm/amdgpu: remove redundant AMDGPU_HAS_VRAM
      amd/amdkfd: correct mem limit calculation for small APUs
      amd/amdkfd: resolve a race in amdgpu_amdkfd_device_fini_sw
      amd/amdkfd: enhance kfd process check in switch partition

Yihan Zhu (1):
      drm/amd/display: wait for otg update pending latch before clock
optimization

YuanShang (1):
      drm/amdgpu: Retain job->vm in amdgpu_job_prepare_job

Yugansh Mittal (1):
      drm/amdgpu: atomfirmware.h: fix multiple spelling mistakes

Yunshui Jiang (1):
      drm/amdgpu: use kmalloc_array() instead of kmalloc()

Yunxiang Li (1):
      drm/amdgpu: skip mgpu fan boost for multi-vf

Zbigniew Kempczy=C5=84ski (1):
      drm/xe/xe_sync: avoid race during ufence signaling

Zhanjun Dong (2):
      drm/xe/uc: Fix missing unwind goto
      drm/xe/guc: Increase GuC crash dump buffer size

Zhikai Zhai (1):
      drm/amd/display: Modify the link training policy

Zhongtian Wu (1):
      drm/panel-edp: Add 4 more panels needed by mt8189 Chromebooks

Zongyao Bai (1):
      drm/xe/sysfs: Add cleanup action in xe_device_sysfs_init

 .mailmap                                           |    2 +
 Documentation/ABI/testing/sysfs-class-drm          |    8 +
 Documentation/accel/amdxdna/amdnpu.rst             |   10 +-
 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/rocket/index.rst               |   19 +
 .../bindings/arm/stm32/st,stm32-syscon.yaml        |   31 +-
 .../bindings/display/bridge/samsung,mipi-dsim.yaml |   27 +
 .../bindings/display/bridge/simple-bridge.yaml     |    2 +
 .../bindings/display/bridge/solomon,ssd2825.yaml   |  141 +
 .../bindings/display/bridge/waveshare,dsi2dpi.yaml |  103 +
 .../bindings/display/mayqueen,pixpaper.yaml        |   63 +
 .../bindings/display/msm/dp-controller.yaml        |  146 +-
 .../bindings/display/msm/dsi-controller-main.yaml  |    2 +
 .../devicetree/bindings/display/msm/gmu.yaml       |   34 +
 .../devicetree/bindings/display/msm/gpu.yaml       |  229 +-
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |   26 +-
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |   10 +-
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |    3 +-
 .../bindings/display/msm/qcom,sc8180x-dpu.yaml     |  103 +
 .../bindings/display/msm/qcom,sc8180x-mdss.yaml    |  359 ++
 .../bindings/display/msm/qcom,sm7150-mdss.yaml     |   16 +-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     |   10 +-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |   20 +-
 .../bindings/display/panel/hydis,hv101hd1.yaml     |   60 +
 .../bindings/display/panel/ilitek,ili9881c.yaml    |    1 +
 .../bindings/display/panel/panel-lvds.yaml         |    4 +
 .../bindings/display/panel/panel-simple.yaml       |    6 +
 .../bindings/display/panel/samsung,atna33xc20.yaml |    4 +
 .../panel/samsung,s6e8aa5x01-ams561ra01.yaml       |   55 +
 .../bindings/display/rockchip/rockchip,dw-dp.yaml  |  150 +
 .../rockchip/rockchip,rk3588-mipi-dsi2.yaml        |    1 +
 .../display/samsung/samsung,exynos7-decon.yaml     |   21 +
 .../bindings/display/sitronix,st7567.yaml          |    5 +
 .../bindings/display/sitronix,st7571.yaml          |    5 +
 .../devicetree/bindings/display/st,stm32-ltdc.yaml |   55 +-
 .../bindings/display/st,stm32mp25-lvds.yaml        |   13 +-
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml |   49 +-
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    |  112 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 .../gpu/amdgpu/amd-hardware-list-info.rst          |    4 +-
 Documentation/gpu/amdgpu/apu-asic-info-table.csv   |   35 +-
 Documentation/gpu/amdgpu/debugfs.rst               |    4 +-
 Documentation/gpu/amdgpu/dgpu-asic-info-table.csv  |   58 +-
 Documentation/gpu/amdgpu/display/dc-glossary.rst   |    2 +-
 .../gpu/amdgpu/display/display-contributing.rst    |    4 +-
 .../gpu/amdgpu/display/programming-model-dcn.rst   |    2 +-
 Documentation/gpu/amdgpu/driver-core.rst           |    4 +-
 Documentation/gpu/amdgpu/index.rst                 |    1 +
 Documentation/gpu/amdgpu/process-isolation.rst     |    2 +-
 Documentation/gpu/amdgpu/userq.rst                 |  203 +
 Documentation/gpu/drm-uapi.rst                     |   47 +-
 Documentation/gpu/i915.rst                         |    7 -
 Documentation/gpu/nova/core/todo.rst               |   19 -
 Documentation/gpu/todo.rst                         |   47 +-
 Documentation/gpu/xe/index.rst                     |    1 +
 Documentation/gpu/xe/xe_device.rst                 |   10 +
 Documentation/gpu/xe/xe_pcode.rst                  |    6 +-
 MAINTAINERS                                        |   50 +-
 arch/parisc/include/asm/video.h                    |    2 +-
 arch/sparc/include/asm/video.h                     |    2 +
 arch/x86/include/asm/video.h                       |    2 +
 arch/x86/video/video-common.c                      |   25 +-
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/amdxdna/Makefile                     |    1 +
 drivers/accel/amdxdna/aie2_ctx.c                   |   67 +-
 drivers/accel/amdxdna/aie2_message.c               |   21 +-
 drivers/accel/amdxdna/aie2_pci.c                   |  219 +-
 drivers/accel/amdxdna/aie2_pci.h                   |    5 +-
 drivers/accel/amdxdna/amdxdna_ctx.c                |   52 +-
 drivers/accel/amdxdna/amdxdna_ctx.h                |   10 +-
 drivers/accel/amdxdna/amdxdna_gem.c                |  139 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |  108 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h            |    7 +-
 drivers/accel/amdxdna/amdxdna_ubuf.c               |  232 ++
 drivers/accel/amdxdna/amdxdna_ubuf.h               |   19 +
 drivers/accel/habanalabs/Kconfig                   |   23 +
 drivers/accel/habanalabs/common/Makefile           |    5 +
 drivers/accel/habanalabs/common/debugfs.c          |  324 ++
 drivers/accel/habanalabs/common/device.c           |   23 +
 drivers/accel/habanalabs/common/habanalabs.h       |   56 +-
 drivers/accel/habanalabs/common/habanalabs_ioctl.c |    6 +
 drivers/accel/habanalabs/common/hldio.c            |  437 ++
 drivers/accel/habanalabs/common/hldio.h            |  146 +
 drivers/accel/habanalabs/common/memory.c           |    9 +-
 drivers/accel/habanalabs/common/memory_mgr.c       |    5 -
 drivers/accel/habanalabs/common/sysfs.c            |   11 +-
 drivers/accel/habanalabs/gaudi/gaudi.c             |   19 +
 drivers/accel/habanalabs/gaudi2/gaudi2.c           |  386 +-
 drivers/accel/habanalabs/gaudi2/gaudi2P.h          |    9 +
 drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c |    2 +-
 drivers/accel/ivpu/ivpu_fw.h                       |    2 +-
 drivers/accel/ivpu/ivpu_hw_btrs.c                  |    3 +-
 drivers/accel/ivpu/ivpu_hw_btrs.h                  |    2 +-
 drivers/accel/ivpu/ivpu_ipc.c                      |    1 -
 drivers/accel/rocket/Kconfig                       |   24 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |  110 +
 drivers/accel/rocket/rocket_core.h                 |   64 +
 drivers/accel/rocket/rocket_device.c               |   60 +
 drivers/accel/rocket/rocket_device.h               |   30 +
 drivers/accel/rocket/rocket_drv.c                  |  290 ++
 drivers/accel/rocket/rocket_drv.h                  |   32 +
 drivers/accel/rocket/rocket_gem.c                  |  181 +
 drivers/accel/rocket/rocket_gem.h                  |   34 +
 drivers/accel/rocket/rocket_job.c                  |  637 +++
 drivers/accel/rocket/rocket_job.h                  |   52 +
 drivers/accel/rocket/rocket_registers.h            | 4404 ++++++++++++++++=
++++
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |   53 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |    4 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |   34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |   41 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |  107 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  103 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  299 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  226 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h            |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.h            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c            |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   66 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h            |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h             |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |   76 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |   10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   65 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   31 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  350 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |   13 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c          |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  138 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  368 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |   44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h    |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_utils.h          |   91 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  204 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   55 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |    8 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  245 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   60 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c         |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |   31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   87 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h       |   17 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |   21 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |    5 +
 drivers/gpu/drm/amd/amdgpu/atom.c                  |   27 +
 drivers/gpu/drm/amd/amdgpu/atom.h                  |    2 +
 .../gpu/drm/amd/amdgpu/cyan_skillfish_reg_init.c   |   56 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             | 3818 ----------------=
-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    1 -
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   25 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   23 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |    7 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |    5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   26 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |   12 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   32 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   60 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   60 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   65 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   10 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   69 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |    3 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |    3 +-
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |    3 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   58 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.h             |    6 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |   27 +-
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |  144 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   37 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  112 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |   32 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |   47 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |    2 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/nv.h                    |    1 +
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c         |    5 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    1 -
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |   29 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |    6 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |    6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |    8 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  103 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  134 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  105 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  114 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  139 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  108 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  115 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.h            |    5 -
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |  171 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |    7 -
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   31 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   56 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |    7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   93 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    4 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   40 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    2 +
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c        |   56 +-
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.h        |    1 +
 drivers/gpu/drm/amd/display/Makefile               |    1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  544 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   33 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |   90 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |    1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |    1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   24 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   35 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h  |    1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   15 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h |    1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |    1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.h  |    1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_irq_params.h   |    1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   63 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |    3 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c   |    2 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |    2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h  |    1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |    3 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.h   |    1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_services.c |    5 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h    |    1 +
 drivers/gpu/drm/amd/display/dc/Makefile            |    1 +
 drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c |    2 +-
 drivers/gpu/drm/amd/display/dc/basics/vector.c     |    6 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    2 +-
 .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |    3 +
 .../amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c |    2 +-
 .../amd/display/dc/clk_mgr/dce60/dce60_clk_mgr.c   |    5 +
 .../dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c       |    2 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |   16 +
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    2 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |  144 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h |    5 +
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |    2 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    2 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    9 +-
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c       |    5 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  123 +-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |   34 +-
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.c     |  130 +-
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.h     |   10 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  191 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    2 +
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |    2 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |   10 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   51 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c      |    2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |    2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    8 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   90 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   66 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   36 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   17 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |    7 +-
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    3 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   19 +
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |   24 +-
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |   17 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_sw.c    |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |   14 +
 .../amd/display/dc/dio/dcn10/dcn10_link_encoder.c  |    2 +-
 .../display/dc/dio/dcn10/dcn10_stream_encoder.c    |    2 +-
 .../display/dc/dio/dcn20/dcn20_stream_encoder.c    |    2 +-
 .../display/dc/dio/dcn31/dcn31_dio_link_encoder.c  |    2 +-
 .../dc/dio/dcn314/dcn314_dio_stream_encoder.c      |    2 +-
 .../dc/dio/dcn32/dcn32_dio_stream_encoder.c        |    2 +-
 .../dc/dio/dcn35/dcn35_dio_stream_encoder.c        |    4 +-
 .../dc/dio/dcn401/dcn401_dio_stream_encoder.c      |    2 +-
 drivers/gpu/drm/amd/display/dc/dm_services.h       |   13 +-
 drivers/gpu/drm/amd/display/dc/dm_services_types.h |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    3 +-
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |    2 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |    2 +-
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |    2 +-
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |   24 +-
 .../gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c |    2 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |    2 +-
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |    6 +-
 .../display/dc/dml/dcn32/display_rq_dlg_calc_32.c  |    1 -
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |    2 +-
 .../drm/amd/display/dc/dml2/display_mode_core.c    |    2 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       |  421 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |    6 +-
 .../dc/dml2/dml21/inc/dml_top_dchub_registers.h    |    2 +
 .../dml2/dml21/inc/dml_top_soc_parameter_types.h   |    2 +
 .../amd/display/dc/dml2/dml21/inc/dml_top_types.h  |    8 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   28 +-
 .../dml2/dml21/src/dml2_core/dml2_core_factory.c   |    2 +-
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |   12 +
 .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c   |    2 +-
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c  |    2 +-
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c     |   21 +-
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c  |    2 +-
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |    6 +-
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.c    |    6 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |    2 +-
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h |   10 +
 .../amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c    |   36 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |    5 +
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c   |    3 +-
 drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c     |    2 +-
 .../drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.c |   31 +
 .../drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.h |    6 +
 .../drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c |    2 +
 .../drm/amd/display/dc/hubbub/dcn32/dcn32_hubbub.c |   40 +-
 .../drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.c |    2 +
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   |    2 +
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.h |    9 +-
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h |    1 +
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c |   26 +
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.h |    8 +-
 .../gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c |   15 +
 .../gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.h |    6 +-
 .../gpu/drm/amd/display/dc/hubp/dcn32/dcn32_hubp.c |    3 +
 .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.c |    3 +
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |   41 +
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h   |    8 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   15 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.h  |    7 +
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  140 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   21 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |    2 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   50 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.h    |    5 +
 .../gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c |    1 +
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |    2 +-
 .../gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c |    1 +
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |    2 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |    1 +
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |    4 +-
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |    1 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |    2 +-
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |    1 +
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |    1 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   59 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |    1 +
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |    4 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   13 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   24 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |   21 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |   26 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    1 +
 .../amd/display/dc/inc/{link.h =3D> link_service.h}  |   11 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |    1 +
 .../drm/amd/display/dc/inc/soc_and_ip_translator.h |   24 +
 .../amd/display/dc/link/accessories/link_dp_cts.c  |   17 +-
 .../amd/display/dc/link/accessories/link_dp_cts.h  |    2 +-
 .../display/dc/link/accessories/link_dp_trace.h    |    2 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |    3 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.h   |    2 +-
 .../link/hwss/link_hwss_dio_fixed_vs_pe_retimer.h  |    2 +-
 .../amd/display/dc/link/hwss/link_hwss_hpo_dp.h    |    2 +-
 .../hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.h    |    2 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |    6 +-
 .../gpu/drm/amd/display/dc/link/link_detection.h   |    2 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   14 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.h    |    2 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |    2 +
 drivers/gpu/drm/amd/display/dc/link/link_factory.h |    2 +-
 .../gpu/drm/amd/display/dc/link/link_resource.h    |    2 +-
 .../gpu/drm/amd/display/dc/link/link_validation.c  |    6 +-
 .../gpu/drm/amd/display/dc/link/link_validation.h  |    2 +-
 .../drm/amd/display/dc/link/protocols/link_ddc.h   |    2 +-
 .../display/dc/link/protocols/link_dp_capability.c |   51 +-
 .../display/dc/link/protocols/link_dp_capability.h |    8 +-
 .../amd/display/dc/link/protocols/link_dp_dpia.h   |    2 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |   71 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |    2 +-
 .../dc/link/protocols/link_dp_irq_handler.h        |    2 +-
 .../amd/display/dc/link/protocols/link_dp_phy.h    |    2 +-
 .../display/dc/link/protocols/link_dp_training.c   |   18 +-
 .../display/dc/link/protocols/link_dp_training.h   |    2 +-
 .../drm/amd/display/dc/link/protocols/link_dpcd.h  |    2 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   26 +-
 .../dc/link/protocols/link_edp_panel_control.h     |    2 +-
 .../drm/amd/display/dc/link/protocols/link_hpd.h   |    2 +-
 .../amd/display/dc/mmhubbub/dcn20/dcn20_mmhubbub.c |    2 +-
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c |    8 -
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h |    5 -
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h |    1 +
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |   18 +
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |    5 +
 .../display/dc/resource/dce100/dce100_resource.c   |   25 +-
 .../display/dc/resource/dce100/dce100_resource.h   |    9 +
 .../display/dc/resource/dce112/dce112_resource.c   |   12 +-
 .../display/dc/resource/dce120/dce120_resource.c   |    8 +-
 .../amd/display/dc/resource/dce60/dce60_resource.c |   60 +-
 .../amd/display/dc/resource/dce80/dce80_resource.c |   60 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |    2 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |    4 +-
 .../display/dc/resource/dcn302/dcn302_resource.c   |    3 +-
 .../display/dc/resource/dcn303/dcn303_resource.c   |    2 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |    1 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |    5 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |    6 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |    2 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |    5 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |    5 +-
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |    5 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |    6 +-
 .../display/dc/resource/dcn401/dcn401_resource.h   |    3 +-
 .../amd/display/dc/soc_and_ip_translator/Makefile  |   19 +
 .../dcn401/dcn401_soc_and_ip_translator.c          |  304 ++
 .../dcn401/dcn401_soc_and_ip_translator.h          |   22 +
 .../dcn42/dcn42_soc_and_ip_translator.c            |   27 +
 .../dcn42/dcn42_soc_and_ip_translator.h            |   16 +
 .../soc_and_ip_translator/soc_and_ip_translator.c  |   37 +
 .../display/dc/virtual/virtual_stream_encoder.c    |    7 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    4 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  205 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |    1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |   53 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h  |    8 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |    7 +-
 .../gpu/drm/amd/display/dmub/src/dmub_srv_stat.c   |    8 +-
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |    5 +
 .../drm/amd/display/modules/freesync/freesync.c    |    4 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c    |    5 +-
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |    1 +
 drivers/gpu/drm/amd/include/amd_shared.h           |   98 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |   30 +-
 drivers/gpu/drm/amd/include/dm_pp_interface.h      |    1 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   85 +
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |    3 +-
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |   33 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   79 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c       |   94 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  370 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    9 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm_internal.h   |    6 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |    4 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     |    9 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  126 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c         |   26 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   11 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c    |    4 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |    2 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c  |    5 +-
 .../drm/amd/pm/powerplay/smumgr/iceland_smumgr.c   |    5 +-
 .../drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c |    5 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c  |    2 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   99 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  129 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_pmfw.h   |   82 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_ppsmc.h  |    7 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |    4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    4 +-
 .../amd/pm/{ =3D> swsmu}/inc/smu_v13_0_0_pptable.h   |    0
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   21 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   19 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   19 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   17 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   19 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |  368 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  216 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |   11 +
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |   19 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   14 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   26 +
 drivers/gpu/drm/amd/ras/rascore/Makefile           |    0
 .../dce_v11_0.h =3D> ras/rascore/ras_core_status.h}  |   21 +-
 drivers/gpu/drm/ast/ast_2100.c                     |   46 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   20 +-
 drivers/gpu/drm/ast/ast_main.c                     |  126 -
 drivers/gpu/drm/bridge/Kconfig                     |   29 +-
 drivers/gpu/drm/bridge/Makefile                    |    2 +
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |    6 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   23 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   63 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    1 +
 drivers/gpu/drm/bridge/cadence/Kconfig             |    1 +
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |  211 +-
 drivers/gpu/drm/bridge/display-connector.c         |    7 +-
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c        |   12 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |   64 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   33 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |  353 +-
 drivers/gpu/drm/bridge/simple-bridge.c             |   10 +
 drivers/gpu/drm/bridge/ssd2825.c                   |  775 ++++
 drivers/gpu/drm/bridge/synopsys/Kconfig            |    7 +
 drivers/gpu/drm/bridge/synopsys/Makefile           |    1 +
 drivers/gpu/drm/bridge/synopsys/dw-dp.c            | 2095 ++++++++++
 drivers/gpu/drm/bridge/waveshare-dsi.c             |  203 +
 drivers/gpu/drm/display/drm_bridge_connector.c     |   20 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |    4 +-
 drivers/gpu/drm/drm_atomic_helper.c                |    7 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |   23 +-
 drivers/gpu/drm/drm_bridge.c                       |    7 +-
 drivers/gpu/drm/drm_color_mgmt.c                   |   34 +
 drivers/gpu/drm/drm_drv.c                          |    4 +-
 drivers/gpu/drm/drm_format_helper.c                |  111 +
 drivers/gpu/drm/drm_gem.c                          |   88 +-
 drivers/gpu/drm/drm_gpusvm.c                       |  421 +-
 drivers/gpu/drm/drm_gpuvm.c                        |  317 +-
 drivers/gpu/drm/drm_internal.h                     |    4 +
 drivers/gpu/drm/drm_ioctl.c                        |    1 +
 drivers/gpu/drm/drm_mipi_dsi.c                     |  119 +-
 drivers/gpu/drm/drm_of.c                           |    7 +-
 drivers/gpu/drm/drm_pagemap.c                      |  142 +-
 drivers/gpu/drm/drm_panel.c                        |   73 +-
 drivers/gpu/drm/drm_panel_backlight_quirks.c       |  115 +-
 drivers/gpu/drm/drm_prime.c                        |    6 +-
 drivers/gpu/drm/drm_probe_helper.c                 |    1 +
 drivers/gpu/drm/drm_sysfs.c                        |   41 +
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |   36 -
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |    9 +
 drivers/gpu/drm/gma500/fbdev.c                     |    2 -
 drivers/gpu/drm/gud/gud_connector.c                |   25 +-
 drivers/gpu/drm/gud/gud_drv.c                      |   54 +-
 drivers/gpu/drm/gud/gud_internal.h                 |   13 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |   64 +-
 drivers/gpu/drm/i915/Kconfig.debug                 |    2 +-
 drivers/gpu/drm/i915/Makefile                      |    2 +
 drivers/gpu/drm/i915/display/g4x_dp.c              |   51 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   15 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   62 +-
 drivers/gpu/drm/i915/display/i9xx_plane.h          |    1 +
 drivers/gpu/drm/i915/display/i9xx_wm.c             |   32 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   59 +-
 drivers/gpu/drm/i915/display/intel_alpm.c          |  133 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |    3 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |   46 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |  176 +-
 drivers/gpu/drm/i915/display/intel_bo.c            |   17 +-
 drivers/gpu/drm/i915/display/intel_bo.h            |    3 -
 drivers/gpu/drm/i915/display/intel_bw.c            |    2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   56 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |    2 +-
 drivers/gpu/drm/i915/display/intel_connector.h     |    1 -
 drivers/gpu/drm/i915/display/intel_crt.c           |    5 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |   28 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  142 +-
 drivers/gpu/drm/i915/display/intel_display.c       |    9 +
 .../drm/i915/display/intel_display_conversion.c    |    2 +-
 .../drm/i915/display/intel_display_conversion.h    |   12 -
 .../gpu/drm/i915/display/intel_display_debugfs.c   |    6 +-
 .../i915/display/intel_display_debugfs_params.c    |    7 +-
 .../gpu/drm/i915/display/intel_display_device.c    |   20 +-
 .../gpu/drm/i915/display/intel_display_device.h    |    8 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |    1 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   |    9 +-
 .../gpu/drm/i915/display/intel_display_params.c    |    3 +
 .../gpu/drm/i915/display/intel_display_params.h    |    1 +
 drivers/gpu/drm/i915/display/intel_display_power.c |   24 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |   57 +-
 .../drm/i915/display/intel_display_power_well.c    |   52 +-
 drivers/gpu/drm/i915/display/intel_display_regs.h  |    2 +
 drivers/gpu/drm/i915/display/intel_display_types.h |   18 +-
 drivers/gpu/drm/i915/display/intel_display_wa.c    |   35 +
 drivers/gpu/drm/i915/display/intel_display_wa.h    |   11 +
 drivers/gpu/drm/i915/display/intel_dmc.c           |    4 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  137 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |    3 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |   18 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  156 +-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |    2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   11 +-
 drivers/gpu/drm/i915/display/intel_dp_test.c       |    4 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   20 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |    4 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |   10 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |    2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt_defs.h  |  197 +
 drivers/gpu/drm/i915/display/intel_encoder.c       |   41 +
 drivers/gpu/drm/i915/display/intel_encoder.h       |    6 +
 drivers/gpu/drm/i915/display/intel_fb.c            |   24 +-
 drivers/gpu/drm/i915/display/intel_fb.h            |    3 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |   39 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   19 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   28 -
 drivers/gpu/drm/i915/display/intel_fdi.h           |    1 -
 drivers/gpu/drm/i915/display/intel_global_state.c  |   32 +-
 drivers/gpu/drm/i915/display/intel_global_state.h  |   36 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   53 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   33 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   24 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |   11 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |    2 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |   34 +-
 drivers/gpu/drm/i915/display/intel_link_bw.h       |    1 +
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |   11 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |   13 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |    3 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |   14 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |    5 +-
 drivers/gpu/drm/i915/display/intel_panic.c         |   27 +
 drivers/gpu/drm/i915/display/intel_panic.h         |   14 +
 drivers/gpu/drm/i915/display/intel_pch.h           |    4 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |   14 +-
 drivers/gpu/drm/i915/display/intel_pfit.c          |   11 +
 drivers/gpu/drm/i915/display/intel_pfit.h          |   10 +-
 drivers/gpu/drm/i915/display/intel_plane.c         |   12 +-
 drivers/gpu/drm/i915/display/intel_plane.h         |    1 -
 drivers/gpu/drm/i915/display/intel_plane_initial.c |    2 +
 drivers/gpu/drm/i915/display/intel_pps.c           |   10 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  190 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |    2 +
 drivers/gpu/drm/i915/display/intel_quirks.c        |    9 +
 drivers/gpu/drm/i915/display/intel_quirks.h        |    1 +
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   10 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |   51 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |  179 +-
 drivers/gpu/drm/i915/display/intel_tc.h            |   72 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |   16 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |   20 +-
 drivers/gpu/drm/i915/display/intel_wm.c            |    9 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |   53 +-
 drivers/gpu/drm/i915/display/skl_scaler.h          |   13 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   64 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |   20 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    4 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |   32 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   12 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   59 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   11 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   40 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |    8 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |    5 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   70 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |    1 -
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |    6 +-
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |    1 +
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |    5 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |    1 +
 drivers/gpu/drm/i915/gt/intel_rc6.c                |    2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    7 +-
 drivers/gpu/drm/i915/gt/intel_reset_types.h        |    2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |    7 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   13 +-
 drivers/gpu/drm/i915/gt/intel_timeline.h           |    1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   29 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |    2 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c             |    6 +-
 drivers/gpu/drm/i915/gt/sysfs_engines.c            |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c       |    6 +-
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c  |    2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |   14 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h          |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |   12 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |   12 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h         |    8 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h         |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |   15 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |   10 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    2 +-
 drivers/gpu/drm/i915/gvt/debugfs.c                 |   12 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c            |    6 +-
 drivers/gpu/drm/i915/i915_active.c                 |    5 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   23 +-
 drivers/gpu/drm/i915/i915_debugfs_params.c         |    4 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   18 +-
 drivers/gpu/drm/i915/i915_drv.h                    |    8 +-
 drivers/gpu/drm/i915/i915_gem.c                    |    3 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |  108 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |    1 +
 drivers/gpu/drm/i915/i915_irq.c                    |   19 +-
 drivers/gpu/drm/i915/i915_list_util.h              |   23 +
 drivers/gpu/drm/i915/i915_ptr_util.h               |   66 +
 drivers/gpu/drm/i915/i915_reg.h                    |    9 +-
 drivers/gpu/drm/i915/i915_request.h                |    5 +-
 drivers/gpu/drm/i915/i915_switcheroo.c             |    9 +-
 drivers/gpu/drm/i915/i915_timer_util.c             |   36 +
 drivers/gpu/drm/i915/i915_timer_util.h             |   23 +
 drivers/gpu/drm/i915/i915_utils.c                  |   30 -
 drivers/gpu/drm/i915/i915_utils.h                  |  210 -
 drivers/gpu/drm/i915/i915_vma.h                    |    6 +-
 drivers/gpu/drm/i915/i915_wait_util.h              |  119 +
 drivers/gpu/drm/i915/intel_clock_gating.c          |   35 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |  266 +-
 drivers/gpu/drm/i915/intel_pcode.c                 |    1 +
 drivers/gpu/drm/i915/intel_uncore.c                |   10 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |    4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c       |    8 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |    5 +-
 drivers/gpu/drm/i915/selftests/i915_selftest.c     |    2 +-
 drivers/gpu/drm/i915/selftests/igt_spinner.c       |    5 +-
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |    8 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |   97 +-
 drivers/gpu/drm/i915/soc/intel_dram.h              |   13 +-
 drivers/gpu/drm/i915/soc/intel_gmch.c              |    3 +-
 drivers/gpu/drm/i915/vlv_suspend.c                 |    5 +-
 drivers/gpu/drm/imagination/Kconfig                |    3 +-
 drivers/gpu/drm/imagination/pvr_device.c           |   22 +-
 drivers/gpu/drm/imagination/pvr_device.h           |   17 +
 drivers/gpu/drm/imagination/pvr_drv.c              |   23 +-
 drivers/gpu/drm/imagination/pvr_power.c            |  168 +-
 drivers/gpu/drm/imagination/pvr_power.h            |   15 +
 drivers/gpu/drm/imagination/pvr_vm.c               |   15 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   92 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  108 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   14 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  242 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |    3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   10 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   34 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |   44 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   13 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   21 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |   35 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h      |    3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   17 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |    1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |    4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |   10 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   29 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |    2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |    2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c      |   47 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |    2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |   16 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |   34 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |   21 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    |   32 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |   95 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c           |   16 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c           |   16 +-
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c           |   12 +-
 drivers/gpu/drm/msm/msm_drv.c                      |    1 +
 drivers/gpu/drm/msm/msm_drv.h                      |    2 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   21 +-
 drivers/gpu/drm/msm/msm_gem.h                      |    6 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |    2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |   67 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |    2 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |    9 +
 drivers/gpu/drm/msm/msm_gpu_trace.h                |   12 +
 drivers/gpu/drm/msm/msm_iommu.c                    |    8 +-
 drivers/gpu/drm/msm/msm_kms.c                      |   14 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |    3 +-
 drivers/gpu/drm/msm/msm_submitqueue.c              |    4 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |  726 ++--
 .../drm/msm/registers/adreno/a6xx_descriptors.xml  |   40 -
 .../gpu/drm/msm/registers/adreno/a6xx_enums.xml    |   50 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |   11 +
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  179 +-
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |   11 +-
 drivers/gpu/drm/msm/registers/gen_header.py        |  201 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |    4 +-
 drivers/gpu/drm/nouveau/Kconfig                    |    8 -
 drivers/gpu/drm/nouveau/nouveau_chan.h             |    2 -
 drivers/gpu/drm/nouveau/nouveau_dma.h              |    1 -
 drivers/gpu/drm/nouveau/nouveau_platform.c         |    5 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c            |   12 +
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |   11 +-
 drivers/gpu/drm/nouveau/nvkm/core/enum.c           |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c    |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c     |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h     |    1 -
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  |    3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c    |    6 +-
 drivers/gpu/drm/nova/driver.rs                     |    4 +-
 drivers/gpu/drm/nova/file.rs                       |   24 +-
 drivers/gpu/drm/nova/gem.rs                        |   10 +-
 drivers/gpu/drm/nova/nova.rs                       |    1 -
 drivers/gpu/drm/nova/uapi.rs                       |   61 -
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    6 +-
 drivers/gpu/drm/panel/Kconfig                      |   26 +-
 drivers/gpu/drm/panel/Makefile                     |    2 +
 drivers/gpu/drm/panel/panel-edp.c                  |   55 +-
 drivers/gpu/drm/panel/panel-himax-hx8279.c         |    2 +-
 drivers/gpu/drm/panel/panel-hydis-hv101hd1.c       |  188 +
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |  302 +-
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c      |  196 +-
 drivers/gpu/drm/panel/panel-lvds.c                 |    2 -
 drivers/gpu/drm/panel/panel-novatek-nt35560.c      |  198 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      |  804 ++--
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c   |    7 +-
 .../drm/panel/panel-samsung-s6e88a0-ams427ap24.c   |    2 +
 .../panel/panel-samsung-s6e8aa5x01-ams561ra01.c    |  981 +++++
 drivers/gpu/drm/panel/panel-simple.c               |   26 +
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |    2 +-
 drivers/gpu/drm/panel/panel-summit.c               |    2 +
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |    2 -
 drivers/gpu/drm/panthor/Makefile                   |    1 +
 drivers/gpu/drm/panthor/panthor_device.c           |    5 +
 drivers/gpu/drm/panthor/panthor_drv.c              |   25 +-
 drivers/gpu/drm/panthor/panthor_fw.c               |    5 +
 drivers/gpu/drm/panthor/panthor_gem.c              |    3 -
 drivers/gpu/drm/panthor/panthor_gem.h              |   12 -
 drivers/gpu/drm/panthor/panthor_gpu.c              |  100 +-
 drivers/gpu/drm/panthor/panthor_hw.c               |  125 +
 drivers/gpu/drm/panthor/panthor_hw.h               |   11 +
 drivers/gpu/drm/panthor/panthor_mmu.c              |   76 +-
 drivers/gpu/drm/panthor/panthor_regs.h             |    3 +
 drivers/gpu/drm/panthor/panthor_sched.c            |   43 +-
 drivers/gpu/drm/radeon/atombios_encoders.c         |    2 +-
 drivers/gpu/drm/radeon/ci_dpm.c                    |   14 +-
 drivers/gpu/drm/radeon/evergreen_cs.c              |  523 +--
 drivers/gpu/drm/radeon/ni_dpm.c                    |    2 +-
 drivers/gpu/drm/radeon/r100.c                      |  215 +-
 drivers/gpu/drm/radeon/r200.c                      |   34 +-
 drivers/gpu/drm/radeon/r300.c                      |   66 +-
 drivers/gpu/drm/radeon/r600_cs.c                   |  449 +-
 drivers/gpu/drm/radeon/radeon_cs.c                 |    2 +-
 drivers/gpu/drm/radeon/radeon_device.c             |    4 +-
 drivers/gpu/drm/radeon/radeon_display.c            |    4 +-
 drivers/gpu/drm/radeon/radeon_gart.c               |    8 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |   20 +-
 drivers/gpu/drm/radeon/radeon_pm.c                 |    3 +-
 drivers/gpu/drm/radeon/radeon_test.c               |    4 +-
 drivers/gpu/drm/radeon/radeon_vce.c                |    6 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |    4 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |  230 +-
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   |  133 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |    8 +-
 drivers/gpu/drm/rockchip/Kconfig                   |    9 +
 drivers/gpu/drm/rockchip/Makefile                  |    1 +
 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c   |   21 +
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c          |  150 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |    1 +
 drivers/gpu/drm/scheduler/sched_entity.c           |   14 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   69 +-
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c   |    2 +-
 drivers/gpu/drm/scheduler/tests/sched_tests.h      |    8 +-
 drivers/gpu/drm/scheduler/tests/tests_basic.c      |    4 +-
 drivers/gpu/drm/sitronix/st7571-i2c.c              |   45 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c              |    3 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |    2 +-
 drivers/gpu/drm/stm/drv.c                          |   12 +-
 drivers/gpu/drm/stm/ltdc.c                         |  197 +-
 drivers/gpu/drm/stm/ltdc.h                         |    6 +
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h           |    2 +-
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c          |   23 +-
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c      |   19 +-
 drivers/gpu/drm/sysfb/simpledrm.c                  |   15 +-
 drivers/gpu/drm/sysfb/vesadrm.c                    |  153 +-
 drivers/gpu/drm/tests/drm_exec_test.c              |   22 +-
 drivers/gpu/drm/tidss/tidss_crtc.c                 |    7 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  310 +-
 drivers/gpu/drm/tidss/tidss_dispc.h                |    3 +
 drivers/gpu/drm/tidss/tidss_dispc_regs.h           |   76 +
 drivers/gpu/drm/tidss/tidss_drv.c                  |    9 +
 drivers/gpu/drm/tidss/tidss_drv.h                  |    2 +
 drivers/gpu/drm/tidss/tidss_oldi.c                 |    1 -
 drivers/gpu/drm/tidss/tidss_plane.h                |    2 +
 drivers/gpu/drm/tidss/tidss_scale_coefs.h          |    2 +
 drivers/gpu/drm/tiny/Kconfig                       |   15 +
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/bochs.c                       |    2 +-
 drivers/gpu/drm/tiny/pixpaper.c                    | 1165 ++++++
 drivers/gpu/drm/tiny/repaper.c                     |   16 +-
 drivers/gpu/drm/tiny/sharp-memory.c                |   27 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   15 +
 drivers/gpu/drm/tyr/Kconfig                        |   19 +
 drivers/gpu/drm/tyr/Makefile                       |    3 +
 drivers/gpu/drm/tyr/driver.rs                      |  205 +
 drivers/gpu/drm/tyr/file.rs                        |   56 +
 drivers/gpu/drm/tyr/gem.rs                         |   18 +
 drivers/gpu/drm/tyr/gpu.rs                         |  219 +
 drivers/gpu/drm/tyr/regs.rs                        |  108 +
 drivers/gpu/drm/tyr/tyr.rs                         |   22 +
 drivers/gpu/drm/v3d/v3d_drv.c                      |   25 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |   33 +-
 drivers/gpu/drm/v3d/v3d_fence.c                    |   11 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |   10 +-
 drivers/gpu/drm/v3d/v3d_irq.c                      |   68 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |   86 +-
 drivers/gpu/drm/v3d/v3d_submit.c                   |    2 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |    3 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |   20 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |    4 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |    2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |    2 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c      |   51 +-
 drivers/gpu/drm/vkms/tests/vkms_format_test.c      |  143 +-
 drivers/gpu/drm/vkms/vkms_formats.c                |  327 +-
 drivers/gpu/drm/vkms/vkms_formats.h                |    4 +-
 drivers/gpu/drm/vkms/vkms_output.c                 |   13 +
 drivers/gpu/drm/vkms/vkms_plane.c                  |   13 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |    2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |    2 +-
 drivers/gpu/drm/xe/Kconfig                         |    2 +-
 drivers/gpu/drm/xe/Kconfig.debug                   |    1 +
 drivers/gpu/drm/xe/Makefile                        |   16 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h           |   11 +
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h      |    5 +
 drivers/gpu/drm/xe/abi/guc_errors_abi.h            |    3 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |   27 +
 .../xe/compat-i915-headers/gem/i915_gem_stolen.h   |   15 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |   22 -
 drivers/gpu/drm/xe/display/ext/i915_utils.c        |    1 +
 drivers/gpu/drm/xe/display/intel_bo.c              |   91 -
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |   20 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   39 +-
 drivers/gpu/drm/xe/display/xe_display_wa.c         |    2 +-
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c         |   10 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |   85 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |    8 +-
 drivers/gpu/drm/xe/display/xe_panic.c              |   80 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |   13 +-
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h   |    1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |    3 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h              |    2 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |    3 +-
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h         |   20 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h              |    1 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h            |    3 -
 drivers/gpu/drm/xe/regs/xe_pmt.h                   |   10 +
 drivers/gpu/drm/xe/tests/xe_bo.c                   |   36 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c              |   29 +-
 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c         |  776 ++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c        |    2 +
 drivers/gpu/drm/xe/tests/xe_migrate.c              |   66 +-
 drivers/gpu/drm/xe/tests/xe_pci.c                  |  232 +-
 drivers/gpu/drm/xe/tests/xe_pci_test.h             |    6 +-
 drivers/gpu/drm/xe/tests/xe_wa_test.c              |   90 +-
 drivers/gpu/drm/xe/xe_assert.h                     |    4 +-
 drivers/gpu/drm/xe/xe_bb.c                         |   35 +
 drivers/gpu/drm/xe/xe_bb.h                         |    3 +
 drivers/gpu/drm/xe/xe_bo.c                         |  916 +++-
 drivers/gpu/drm/xe/xe_bo.h                         |   82 +-
 drivers/gpu/drm/xe/xe_bo_types.h                   |   25 +-
 drivers/gpu/drm/xe/xe_configfs.c                   |  800 +++-
 drivers/gpu/drm/xe/xe_configfs.h                   |   16 +-
 drivers/gpu/drm/xe/xe_debugfs.c                    |  142 +
 drivers/gpu/drm/xe/xe_dep_job_types.h              |   29 +
 drivers/gpu/drm/xe/xe_dep_scheduler.c              |  143 +
 drivers/gpu/drm/xe/xe_dep_scheduler.h              |   21 +
 drivers/gpu/drm/xe/xe_device.c                     |  121 +-
 drivers/gpu/drm/xe/xe_device.h                     |    1 +
 drivers/gpu/drm/xe/xe_device_sysfs.c               |  104 +-
 drivers/gpu/drm/xe/xe_device_types.h               |  102 +-
 drivers/gpu/drm/xe/xe_dma_buf.c                    |   82 +-
 drivers/gpu/drm/xe/xe_eu_stall.c                   |    9 +-
 drivers/gpu/drm/xe/xe_exec.c                       |   31 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  133 +-
 drivers/gpu/drm/xe/xe_exec_queue.h                 |    5 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |   23 +-
 drivers/gpu/drm/xe/xe_execlist.c                   |   25 +-
 drivers/gpu/drm/xe/xe_execlist_types.h             |    2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       |   42 +-
 drivers/gpu/drm/xe/xe_ggtt.h                       |    5 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c              |   13 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.h              |    1 +
 drivers/gpu/drm/xe/xe_gsc.c                        |   14 +-
 drivers/gpu/drm/xe/xe_gt.c                         |   36 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |   49 +-
 drivers/gpu/drm/xe/xe_gt_freq.c                    |   28 +
 drivers/gpu/drm/xe/xe_gt_idle.c                    |   21 +-
 drivers/gpu/drm/xe/xe_gt_idle.h                    |    2 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |    6 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h                     |    3 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |   57 +-
 drivers/gpu/drm/xe/xe_gt_printk.h                  |   32 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c                |   24 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |   35 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c      |   24 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |   14 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h                |    1 +
 drivers/gpu/drm/xe/xe_gt_stats.c                   |   57 +-
 drivers/gpu/drm/xe/xe_gt_stats.h                   |    1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h             |   33 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |  596 ---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |   40 -
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h  |   32 -
 drivers/gpu/drm/xe/xe_gt_topology.c                |   48 +-
 drivers/gpu/drm/xe/xe_gt_topology.h                |    4 +
 drivers/gpu/drm/xe/xe_gt_types.h                   |   33 +-
 drivers/gpu/drm/xe/xe_guc.c                        |   95 +-
 drivers/gpu/drm/xe/xe_guc.h                        |    4 +
 drivers/gpu/drm/xe/xe_guc_ads.c                    |  123 +-
 drivers/gpu/drm/xe/xe_guc_buf.c                    |    2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                     |   63 +-
 drivers/gpu/drm/xe/xe_guc_ct.h                     |    1 +
 drivers/gpu/drm/xe/xe_guc_engine_activity.c        |   13 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h       |    4 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h                   |   37 +-
 drivers/gpu/drm/xe/xe_guc_log.h                    |    2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                     |   90 +-
 drivers/gpu/drm/xe/xe_guc_pc.h                     |    2 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h               |    2 +
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  333 +-
 drivers/gpu/drm/xe/xe_guc_submit.h                 |   12 +
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c              |  242 ++
 drivers/gpu/drm/xe/xe_guc_tlb_inval.h              |   19 +
 drivers/gpu/drm/xe/xe_guc_types.h                  |    6 +
 drivers/gpu/drm/xe/xe_heci_gsc.c                   |    2 +-
 drivers/gpu/drm/xe/xe_hmm.c                        |  325 --
 drivers/gpu/drm/xe/xe_hmm.h                        |   18 -
 drivers/gpu/drm/xe/xe_hw_engine.c                  |    2 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c            |    4 +-
 drivers/gpu/drm/xe/xe_hw_error.c                   |  182 +
 drivers/gpu/drm/xe/xe_hw_error.h                   |   15 +
 drivers/gpu/drm/xe/xe_hwmon.c                      |   53 +-
 drivers/gpu/drm/xe/xe_i2c.c                        |   20 +-
 drivers/gpu/drm/xe/xe_i2c.h                        |    2 +
 drivers/gpu/drm/xe/xe_irq.c                        |    4 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c               |  464 +++
 drivers/gpu/drm/xe/xe_late_bind_fw.h               |   17 +
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h         |   75 +
 drivers/gpu/drm/xe/xe_lmtt.c                       |   33 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |  264 +-
 drivers/gpu/drm/xe/xe_lrc.h                        |    9 +
 drivers/gpu/drm/xe/xe_migrate.c                    |  465 ++-
 drivers/gpu/drm/xe/xe_migrate.h                    |   29 +-
 drivers/gpu/drm/xe/xe_mmio.c                       |   33 -
 drivers/gpu/drm/xe/xe_mmio_gem.c                   |  226 +
 drivers/gpu/drm/xe/xe_mmio_gem.h                   |   20 +
 drivers/gpu/drm/xe/xe_module.c                     |   29 +-
 drivers/gpu/drm/xe/xe_nvm.c                        |   13 +-
 drivers/gpu/drm/xe/xe_oa.c                         |   14 +-
 drivers/gpu/drm/xe/xe_pci.c                        |  116 +-
 drivers/gpu/drm/xe/xe_pci_types.h                  |    3 +-
 drivers/gpu/drm/xe/xe_pm.c                         |   31 +-
 drivers/gpu/drm/xe/xe_printk.h                     |  129 +
 drivers/gpu/drm/xe/xe_psmi.c                       |  294 ++
 drivers/gpu/drm/xe/xe_psmi.h                       |   14 +
 drivers/gpu/drm/xe/xe_pt.c                         |  393 +-
 drivers/gpu/drm/xe/xe_pt.h                         |    3 +-
 drivers/gpu/drm/xe/xe_pt_types.h                   |    5 +-
 drivers/gpu/drm/xe/xe_pxp.c                        |    1 +
 drivers/gpu/drm/xe/xe_pxp_submit.c                 |   34 +-
 drivers/gpu/drm/xe/xe_query.c                      |   14 +-
 drivers/gpu/drm/xe/xe_res_cursor.h                 |   10 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                   |   22 +-
 drivers/gpu/drm/xe/xe_rtp.c                        |   13 +
 drivers/gpu/drm/xe/xe_rtp.h                        |    6 +
 drivers/gpu/drm/xe/xe_sa.c                         |    1 -
 drivers/gpu/drm/xe/xe_sa.h                         |   15 +-
 drivers/gpu/drm/xe/xe_sa_types.h                   |    1 -
 drivers/gpu/drm/xe/xe_sriov.c                      |   15 +
 drivers/gpu/drm/xe/xe_sriov.h                      |    1 +
 drivers/gpu/drm/xe/xe_sriov_vf.c                   |  191 +-
 drivers/gpu/drm/xe/xe_sriov_vf.h                   |    6 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c               |  410 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h               |   34 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h         |   51 +
 drivers/gpu/drm/xe/xe_sriov_vf_types.h             |   10 +
 drivers/gpu/drm/xe/xe_survivability_mode.c         |  180 +-
 drivers/gpu/drm/xe/xe_survivability_mode.h         |    5 +-
 drivers/gpu/drm/xe/xe_survivability_mode_types.h   |    8 +
 drivers/gpu/drm/xe/xe_svm.c                        |  727 +++-
 drivers/gpu/drm/xe/xe_svm.h                        |   90 +-
 drivers/gpu/drm/xe/xe_tile.c                       |   62 +-
 drivers/gpu/drm/xe/xe_tile.h                       |   14 +-
 drivers/gpu/drm/xe/xe_tile_debugfs.c               |  135 +
 drivers/gpu/drm/xe/xe_tile_debugfs.h               |   13 +
 drivers/gpu/drm/xe/xe_tile_printk.h                |  127 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c                 |   12 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c                  |  433 ++
 drivers/gpu/drm/xe/xe_tlb_inval.h                  |   46 +
 drivers/gpu/drm/xe/xe_tlb_inval_job.c              |  268 ++
 drivers/gpu/drm/xe/xe_tlb_inval_job.h              |   33 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h            |  130 +
 drivers/gpu/drm/xe/xe_trace.h                      |   40 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |   12 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |   22 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h               |    3 +-
 drivers/gpu/drm/xe/xe_tuning.c                     |    2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                      |   29 +-
 drivers/gpu/drm/xe/xe_uc_fw_abi.h                  |  130 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h                |    3 +
 drivers/gpu/drm/xe/xe_userptr.c                    |  319 ++
 drivers/gpu/drm/xe/xe_userptr.h                    |  107 +
 drivers/gpu/drm/xe/xe_validation.c                 |  278 ++
 drivers/gpu/drm/xe/xe_validation.h                 |  192 +
 drivers/gpu/drm/xe/xe_vm.c                         | 1166 +++---
 drivers/gpu/drm/xe/xe_vm.h                         |   69 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c                 |  431 ++
 drivers/gpu/drm/xe/xe_vm_madvise.h                 |   15 +
 drivers/gpu/drm/xe/xe_vm_types.h                   |  145 +-
 drivers/gpu/drm/xe/xe_vram.c                       |  211 +-
 drivers/gpu/drm/xe/xe_vram.h                       |   11 +
 drivers/gpu/drm/xe/xe_vram_freq.c                  |    4 +-
 drivers/gpu/drm/xe/xe_vram_types.h                 |   85 +
 drivers/gpu/drm/xe/xe_wa.c                         |   88 +-
 drivers/gpu/drm/xe/xe_wa.h                         |    8 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |   10 +-
 drivers/gpu/nova-core/driver.rs                    |   13 +-
 drivers/gpu/nova-core/falcon.rs                    |  113 +-
 drivers/gpu/nova-core/falcon/gsp.rs                |   16 +-
 drivers/gpu/nova-core/falcon/hal.rs                |    2 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs          |   47 +-
 drivers/gpu/nova-core/falcon/sec2.rs               |   13 +-
 drivers/gpu/nova-core/fb.rs                        |    2 +-
 drivers/gpu/nova-core/firmware.rs                  |  107 +-
 drivers/gpu/nova-core/firmware/booter.rs           |  375 ++
 drivers/gpu/nova-core/firmware/fwsec.rs            |   17 +-
 drivers/gpu/nova-core/firmware/gsp.rs              |  243 ++
 drivers/gpu/nova-core/firmware/riscv.rs            |   91 +
 drivers/gpu/nova-core/gpu.rs                       |  216 +-
 drivers/gpu/nova-core/gsp.rs                       |   22 +
 drivers/gpu/nova-core/gsp/boot.rs                  |  137 +
 drivers/gpu/nova-core/gsp/fw.rs                    |    7 +
 drivers/gpu/nova-core/gsp/fw/r570_144.rs           |   29 +
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs  |    1 +
 drivers/gpu/nova-core/nova_core.rs                 |    1 +
 drivers/gpu/nova-core/regs.rs                      |   84 +-
 drivers/gpu/nova-core/regs/macros.rs               |  789 +++-
 drivers/gpu/nova-core/util.rs                      |   20 -
 drivers/gpu/nova-core/vbios.rs                     |  176 +-
 drivers/hid/i2c-hid/i2c-hid-core.c                 |   46 +-
 drivers/hid/i2c-hid/i2c-hid-of-elan.c              |   11 +-
 drivers/misc/mei/Kconfig                           |   13 +
 drivers/misc/mei/Makefile                          |    1 +
 drivers/misc/mei/bus.c                             |   13 +
 drivers/misc/mei/mei_lb.c                          |  312 ++
 drivers/pci/vgaarb.c                               |   31 +-
 drivers/video/screen_info_generic.c                |   55 +
 include/drm/bridge/dw_dp.h                         |   20 +
 include/drm/bridge/samsung-dsim.h                  |   16 +-
 include/drm/drm_bridge.h                           |   47 +-
 include/drm/drm_buddy.h                            |    9 -
 include/drm/drm_color_mgmt.h                       |    1 +
 include/drm/drm_device.h                           |   14 +-
 include/drm/drm_format_helper.h                    |    4 +
 include/drm/drm_gem.h                              |   51 +-
 include/drm/drm_gpusvm.h                           |  136 +-
 include/drm/drm_gpuvm.h                            |   68 +-
 include/drm/drm_mipi_dsi.h                         |  153 +-
 include/drm/drm_pagemap.h                          |   50 +-
 include/drm/drm_panel.h                            |   14 +
 include/drm/drm_utils.h                            |    8 +-
 include/drm/intel/i915_component.h                 |    1 +
 include/drm/intel/intel_lb_mei_interface.h         |   70 +
 include/drm/intel/pciids.h                         |    5 +
 include/drm/ttm/ttm_bo.h                           |    2 +
 include/drm/ttm/ttm_resource.h                     |    2 +-
 include/linux/fbcon.h                              |    7 +
 include/linux/habanalabs/cpucp_if.h                |    4 +
 include/linux/hid.h                                |    2 +
 include/linux/iopoll.h                             |  170 +-
 include/linux/list.h                               |   14 +
 include/linux/mei_cl_bus.h                         |    1 +
 include/linux/overflow.h                           |   70 +
 include/linux/screen_info.h                        |    2 +
 include/trace/events/habanalabs.h                  |    2 +-
 include/uapi/drm/amdgpu_drm.h                      |   72 +-
 include/uapi/drm/amdxdna_accel.h                   |  136 +
 include/uapi/drm/drm.h                             |   63 +-
 include/uapi/drm/drm_mode.h                        |    8 +
 include/uapi/drm/panthor_drm.h                     |    3 +
 include/uapi/drm/rocket_accel.h                    |  142 +
 include/uapi/drm/v3d_drm.h                         |    2 +
 include/uapi/drm/xe_drm.h                          |  282 +-
 include/video/pixel_format.h                       |   61 +
 rust/bindings/bindings_helper.h                    |    2 +
 rust/helpers/helpers.c                             |    1 +
 rust/helpers/scatterlist.c                         |   24 +
 rust/kernel/alloc/allocator.rs                     |   52 +
 rust/kernel/alloc/allocator/iter.rs                |  102 +
 rust/kernel/alloc/allocator_test.rs                |   29 +
 rust/kernel/alloc/kbox.rs                          |   40 +-
 rust/kernel/alloc/kvec.rs                          |   40 +-
 rust/kernel/alloc/layout.rs                        |    5 +
 rust/kernel/devres.rs                              |    6 +-
 rust/kernel/dma.rs                                 |   86 +-
 rust/kernel/drm/device.rs                          |    3 +-
 rust/kernel/drm/driver.rs                          |    5 +-
 rust/kernel/drm/gem/mod.rs                         |   96 +-
 rust/kernel/drm/ioctl.rs                           |   11 +-
 rust/kernel/lib.rs                                 |    2 +
 rust/kernel/page.rs                                |   87 +-
 rust/kernel/scatterlist.rs                         |  491 +++
 rust/kernel/transmute.rs                           |  114 +-
 rust/kernel/workqueue.rs                           |    9 +-
 rust/pin-init/README.md                            |   12 +
 rust/pin-init/examples/error.rs                    |    4 +-
 rust/pin-init/src/lib.rs                           |    4 +-
 rust/pin-init/src/macros.rs                        |  239 +-
 rust/uapi/uapi_helper.h                            |    1 +
 samples/rust/rust_dma.rs                           |   35 +-
 samples/rust/rust_driver_pci.rs                    |    2 +-
 1260 files changed, 52603 insertions(+), 19325 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-drm
 create mode 100644 Documentation/accel/rocket/index.rst
 create mode 100644
Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
 create mode 100644
Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/hydis,hv101hd1.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01-ams561ra=
01.yaml
 create mode 100644
Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
 create mode 100644
Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
 create mode 100644 Documentation/gpu/amdgpu/userq.rst
 create mode 100644 Documentation/gpu/xe/xe_device.rst
 create mode 100644 drivers/accel/amdxdna/amdxdna_ubuf.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_ubuf.h
 create mode 100644 drivers/accel/habanalabs/common/hldio.c
 create mode 100644 drivers/accel/habanalabs/common/hldio.h
 create mode 100644 drivers/accel/rocket/Kconfig
 create mode 100644 drivers/accel/rocket/Makefile
 create mode 100644 drivers/accel/rocket/rocket_core.c
 create mode 100644 drivers/accel/rocket/rocket_core.h
 create mode 100644 drivers/accel/rocket/rocket_device.c
 create mode 100644 drivers/accel/rocket/rocket_device.h
 create mode 100644 drivers/accel/rocket/rocket_drv.c
 create mode 100644 drivers/accel/rocket/rocket_drv.h
 create mode 100644 drivers/accel/rocket/rocket_gem.c
 create mode 100644 drivers/accel/rocket/rocket_gem.h
 create mode 100644 drivers/accel/rocket/rocket_job.c
 create mode 100644 drivers/accel/rocket/rocket_job.h
 create mode 100644 drivers/accel/rocket/rocket_registers.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_utils.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/cyan_skillfish_reg_init.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
 rename drivers/gpu/drm/amd/display/dc/inc/{link.h =3D> link_service.h} (97=
%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/soc_and_ip_translato=
r.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/soc_and_ip_translator/Makefile
 create mode 100644
drivers/gpu/drm/amd/display/dc/soc_and_ip_translator/dcn401/dcn401_soc_and_=
ip_translator.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/soc_and_ip_translator/dcn401/dcn401_soc_and_=
ip_translator.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/soc_and_ip_translator/dcn42/dcn42_soc_and_ip=
_translator.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/soc_and_ip_translator/dcn42/dcn42_soc_and_ip=
_translator.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/soc_and_ip_translator/soc_and_ip_translator.=
c
 rename drivers/gpu/drm/amd/pm/{ =3D> swsmu}/inc/smu_v13_0_0_pptable.h (100=
%)
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/Makefile
 rename drivers/gpu/drm/amd/{amdgpu/dce_v11_0.h =3D>
ras/rascore/ras_core_status.h} (66%)
 create mode 100644 drivers/gpu/drm/bridge/ssd2825.c
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-dp.c
 create mode 100644 drivers/gpu/drm/bridge/waveshare-dsi.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dsi_vbt_defs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_panic.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_panic.h
 create mode 100644 drivers/gpu/drm/i915/i915_list_util.h
 create mode 100644 drivers/gpu/drm/i915/i915_ptr_util.h
 create mode 100644 drivers/gpu/drm/i915/i915_timer_util.c
 create mode 100644 drivers/gpu/drm/i915/i915_timer_util.h
 create mode 100644 drivers/gpu/drm/i915/i915_wait_util.h
 delete mode 100644 drivers/gpu/drm/nova/uapi.rs
 create mode 100644 drivers/gpu/drm/panel/panel-hydis-hv101hd1.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e8aa5x01-ams561ra=
01.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h
 create mode 100644 drivers/gpu/drm/rockchip/dw_dp-rockchip.c
 create mode 100644 drivers/gpu/drm/tiny/pixpaper.c
 create mode 100644 drivers/gpu/drm/tyr/Kconfig
 create mode 100644 drivers/gpu/drm/tyr/Makefile
 create mode 100644 drivers/gpu/drm/tyr/driver.rs
 create mode 100644 drivers/gpu/drm/tyr/file.rs
 create mode 100644 drivers/gpu/drm/tyr/gem.rs
 create mode 100644 drivers/gpu/drm/tyr/gpu.rs
 create mode 100644 drivers/gpu/drm/tyr/regs.rs
 create mode 100644 drivers/gpu/drm/tyr/tyr.rs
 create mode 100644 drivers/gpu/drm/xe/display/xe_panic.c
 create mode 100644 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
 create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
 create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_inval.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_inval.h
 delete mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 delete mode 100644 drivers/gpu/drm/xe/xe_hmm.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_mmio_gem.c
 create mode 100644 drivers/gpu/drm/xe/xe_mmio_gem.h
 create mode 100644 drivers/gpu/drm/xe/xe_printk.h
 create mode 100644 drivers/gpu/drm/xe/xe_psmi.c
 create mode 100644 drivers/gpu/drm/xe/xe_psmi.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_printk.h
 create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval.c
 create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval.h
 create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval_job.c
 create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval_job.h
 create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_userptr.c
 create mode 100644 drivers/gpu/drm/xe/xe_userptr.h
 create mode 100644 drivers/gpu/drm/xe/xe_validation.c
 create mode 100644 drivers/gpu/drm/xe/xe_validation.h
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h
 create mode 100644 drivers/gpu/nova-core/firmware/booter.rs
 create mode 100644 drivers/gpu/nova-core/firmware/gsp.rs
 create mode 100644 drivers/gpu/nova-core/firmware/riscv.rs
 create mode 100644 drivers/gpu/nova-core/gsp.rs
 create mode 100644 drivers/gpu/nova-core/gsp/boot.rs
 create mode 100644 drivers/gpu/nova-core/gsp/fw.rs
 create mode 100644 drivers/gpu/nova-core/gsp/fw/r570_144.rs
 create mode 100644 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
 create mode 100644 drivers/misc/mei/mei_lb.c
 create mode 100644 include/drm/bridge/dw_dp.h
 create mode 100644 include/drm/intel/intel_lb_mei_interface.h
 create mode 100644 include/uapi/drm/rocket_accel.h
 create mode 100644 rust/helpers/scatterlist.c
 create mode 100644 rust/kernel/alloc/allocator/iter.rs
 create mode 100644 rust/kernel/scatterlist.rs
