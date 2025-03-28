Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F190A74515
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 09:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3AD10E997;
	Fri, 28 Mar 2025 08:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kw9TK5aX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9019D10E96F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:53:36 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ac289147833so306285866b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 19:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743130415; x=1743735215; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5uS/bW+C+aeFmaNz8mxFVV6kKLOa+59TDYNH+Xc+tak=;
 b=kw9TK5aXRN8DFJRoIBTNM3MqDgEU69JUBMJkzI4fTQtBcS6ES8eYjA7iyi6Ttiijmh
 a5zCNxUDTbIqB31geDT6YXjqNAgxpJZlpuFztshaTbvoACmOLmjX2AXLatN+mH1gONwQ
 lv9Hax6fFI3XScygO0qoQ9ddkkRnw5gp5nb8LvAnR5iG27ijEEtOe805p0WquBA0eTg1
 SiFnPqyZyzTwzPLmFyi/un+C8O5WBi7jF/Kqh+dSw4wBQV3ks1fKHWyzgLz9wg/uRy86
 e0DnlX4ECbmC5ln7SL4c+lX5d1jKf44nYw2G+6o+wM/I70w8RsdZiY7PNj4sw/wD6UHA
 7lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743130415; x=1743735215;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5uS/bW+C+aeFmaNz8mxFVV6kKLOa+59TDYNH+Xc+tak=;
 b=WyIeOJ2sGArDsDiAFTm2jJb2T35sYUTqb0KxfA2fr5j6DucchKA1pMgGrjsIFTrC8X
 T7Xz52R9k0vswQcfs5STKxutZaupJy8dK0YehlahZtc2PHCJFB1NUcwL2AYi+bWqIJXZ
 6DCYFKrE9v3dr6cK677YowcltAQnGW5tpkW/NLO3um9tHzL9GHP9RyewnXjkwqE+6p5o
 xmohb3YrRjF/iD0UV6j9Wl3CK0jqdy5QKvRdu+HGgPpkmDL4AYnqTxHRunUgys9Sj18u
 Ld0QXr/WYq8AxkT2k00zd44eWt9cUp3utCQP8CHucjDid9xCjNYDn2aLTnePOW0ri7dN
 OliA==
X-Gm-Message-State: AOJu0Yyz7Ndt84zUrNpoh0nCpRi/NJ1hJNSY/55iKEK8WQ9QEGKzhiUC
 KcROY02iT1XegcXPJCJ5z3qwSynghmFuWN2m+qK13HTA5EpMHnxoZJAd0Zsrlv0QqeePxttFut0
 5qGy3Qa378JU6UBulMhZxi1rovDbTrtUv
X-Gm-Gg: ASbGnctSxJ6mqeiuG72g5PdtqOn7FvNcw1tEjc8k5YIgJgk8qLGTtK/yzgPBB96aV+8
 lE3JIcFVfnXiMSi6oBy8HToo7JICNMDhXlexTZmv2EPD8uJ6s2xzBPocIkVLllGRIHm9Nci8/so
 zsaRorrF9Op4ftqCidJJ/B2PuApjoB/q84uKE=
X-Google-Smtp-Source: AGHT+IFtSwPTfSjUwaUtrFJ6aLNJd/40GHbt2IHk4EFGpQrvhR1R/ZwDAJ/cjh5toxgzT1Vf6Rk28hESssExOfoXpfA=
X-Received: by 2002:a17:907:c25:b0:ac2:d1bd:3293 with SMTP id
 a640c23a62f3a-ac6faea15fdmr450920166b.19.1743130413648; Thu, 27 Mar 2025
 19:53:33 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 28 Mar 2025 12:53:20 +1000
X-Gm-Features: AQ5f1JrsVkycq-WqoAXSS-hGXyHEX2oMjbT6wPtkFnJHLbCI2J1MQBVs4nftYaY
Message-ID: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
Subject: [git pull] drm for 6.15-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, simona.vetter@ffwll.ch
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 28 Mar 2025 08:10:26 +0000
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

This is the main drm pull request for 6.15. Bit late, but my wife was
away getting a PhD and kids took over my writing summaries time, and
fd.o was offline last week which slowed me down a small bit.

I've done a test merge against your tree from a couple of days ago,
there were a couple of conflicts then (xe and i915) and I know there
is a conflict with the driver core tree in rust area.

links to all the ones I've seen:
https://lore.kernel.org/dri-devel/20250324140606.7b87b0a2@canb.auug.org.au/
https://lore.kernel.org/dri-devel/20250313141253.0c5a7520@canb.auug.org.au/
https://lore.kernel.org/dri-devel/Z9qnl2bxFZ-Q5Al4@pollux/
https://lore.kernel.org/dri-devel/20250311201726.3f45cc67@canb.auug.org.au/

I think that should be enough info to solve the rust conflict, which
might be the first one you've seen, if you see it.

Outside of drm there are some rust patches from Danilo who maintains
that area in here, and some pieces for drm header check tests.

The major things in here are a new driver supporting the touchbar
displays on M1/M2, the nova-core stub driver which is just the vehicle
for adding rust abstractions and start developing a real driver inside
of. xe adds support for SVM with a non-driver specific SVM core
abstraction that will hopefully be useful for other drivers, along
with support for shrinking for TTM devices. I'm sure xe and AMD
support new devices, but the pipeline depth on these things is hard to
know what they end up being in the marketplace!

Let me know if there are any problems on your side of if there are
some other merge issues I didn't see here.

Thanks,
Dave.

drm-next-2025-03-28:
drm for 6.15-rc1

uapi:
- add mediatek tiled fourcc
- add support for notifying userspace on device wedged

new driver:
- appletbdrm: support for Apple Touchbar displays on m1/m2
- nova-core: skeleton rust driver to develop nova inside of

firmware:
- add some rust firmware pieces

rust:
- add 'LocalModule' type alias

component:
- add helper to query bound status

fbdev:
- fbtft: remove access to page->index

media:
- cec: tda998x: import driver from drm

dma-buf:
- add fast path for single fence merging

tests:
- fix lockdep warnings

atomic:
- allow full modeset on connector changes
- clarify semantics of allow_modeset and drm_atomic_helper_check
- async-flip: support on arbitary planes
- writeback: fix UAF
- Document atomic-state history

format-helper:
- support ARGB8888 to ARGB4444 conversions

buddy:
- fix multi-root cleanup

ci:
- update IGT

dp:
- support extended wake timeout
- mst: fix RAD to string conversion
- increase DPCD eDP control CAP size to 5 bytes
- add DPCD eDP v1.5 definition
- add helpers for LTTPR transparent mode

panic:
- encode QR code according to Fido 2.2

scheduler:
- add parameter struct for init
- improve job peek/pop operations
- optimise drm_sched_job struct layout

ttm:
- refactor pool allocation
- add helpers for TTM shrinker

panel-orientation:
- add a bunch of new quirks

panel:
- convert panels to multi-style functions
- edp: Add support for B140UAN04.4, BOE NV140FHM-NZ, CSW MNB601LS1-3,
  LG LP079QX1-SP0V, MNE007QS3-7, STA 116QHD024002, Starry 116KHD024006,
  Lenovo T14s Gen6 Snapdragon
- himax-hx83102: Add support for CSOT PNA957QT1-1, Kingdisplay
  kd110n11-51ie, Starry 2082109qfh040022-50e
- visionox-r66451: use multi-style MIPI-DSI functions
- raydium-rm67200: Add driver for Raydium RM67200
- simple: Add support for BOE AV123Z7M-N17, BOE AV123Z7M-N17
- sony-td4353-jdi: Use MIPI-DSI multi-func interface
- summit: Add driver for Apple Summit display panel
- visionox-rm692e5: Add driver for Visionox RM692E5

bridge:
- pass full atomic state to various callbacks
- adv7511: Report correct capabilities
- it6505: Fix HDCP V compare
- snd65dsi86: fix device IDs
- nwl-dsi: set bridge type
- ti-sn65si83: add error recovery and set bridge type
- synopsys: add HDMI audio support

xe:
- support device-wedged event
- add mmap support for PCI memory barrier
- perf pmu integration and expose per-engien activity
- add EU stall sampling support
- GPU SVM and Xe SVM implementation
- use TTM shrinker
- add survivability mode to allow the driver to do
  firmware updates in critical failure states
- PXP HWDRM support for MTL and LNL
- expose package/vram temps over hwmon
- enable DP tunneling
- drop mmio_ext abstraction
- Reject BO evcition if BO is bound to current VM
- Xe suballocator improvements
- re-use display vmas when possible
- add GuC Buffer Cache abstraction
- PCI ID update for Panther Lake and Battlemage
- Enable SRIOV for Panther Lake
- Refactor VRAM manager location

i915:
- enable extends wake timeout
- support device-wedged event
- Enable DP 128b/132b SST DSC
- FBC dirty rectangle support for display version 30+
- convert i915/xe to drm client setup
- Compute HDMI PLLS for rates not in fixed tables
- Allow DSB usage when PSR is enabled on LNL+
- Enable panel replay without full modeset
- Enable async flips with compressed buffers on ICL+
- support luminance based brightness via DPCD for eDP
- enable VRR enable/disable without full modeset
- allow GuC SLPC default strategies on MTL+ for performance
- lots of display refactoring in move to struct intel_display

amdgpu:
- add device wedged event
- support async page flips on overlay planes
- enable broadcast RGB drm property
- add info ioctl for virt mode
- OEM i2c support for RGB lights
- GC 11.5.2 + 11.5.3 support
- SDMA 6.1.3 support
- NBIO 7.9.1 + 7.11.2 support
- MMHUB 1.8.1 + 3.3.2 support
- DCN 3.6.0 support
- Add dynamic workload profile switching for GC 10-12
- support larger VBIOS sizes
- Mark gttsize parameters as deprecated
- Initial JPEG queue resset support

amdkfd:
- add KFD per process flags for setting precision
- sync pasid values between KGD and KFD
- improve GTT/VRAM handling for APUs
- fix user queue validation on GC7/8
- SDMA queue reset support

raedeon:
- rs400 hyperz fix

i2c:
- td998x: drop platform_data, split driver into media and bridge

ast:
- transmitter chip detection refactoring
- vbios display mode refactoring
- astdp: fix connection status and filter unsupported modes
- cursor handling refactoring

imagination:
- check job dependencies with sched helper

ivpu:
- improve command queue handling
- use workqueue for IRQ handling
- add support HW fault injection
- locking fixes

mgag200:
- add support for G200eH5

msm:
- dpu: add concurrent writeback support for DPU 10.x+
- use LTTPR helpers
- GPU:
  - Fix obscure GMU suspend failure
  - Expose syncobj timeline support
  - Extend GPU devcoredump with pagetable info
  - a623 support
  - Fix a6xx gen1/gen2 indexed-register blocks in gpu snapshot / devcoredum=
p
- Display:
  - Add cpu-cfg interconnect paths on SM8560 and SM8650
  - Introduce KMS OMMU fault handler, causing devcoredump snapshot
  - Fixed error pointer dereference in msm_kms_init_aspace()
- DPU:
  - Fix mode_changing handling
  - Add writeback support on SM6150 (QCS615)
  - Fix DSC programming in 1:1:1 topology
  - Reworked hardware resource allocation, moving it to the CRTC code
  - Enabled support for Concurrent WriteBack (CWB) on SM8650
  - Enabled CDM blocks on all relevant platforms
  - Reworked debugfs interface for BW/clocks debugging
  - Clear perf params before calculating bw
  - Support YUV formats on writeback
  - Fixed double inclusion
  - Fixed writeback in YUV formats when using cloned output, Dropped
    wb2_formats_rgb
  - Corrected dpu_crtc_check_mode_changed and struct dpu_encoder_virt
    kerneldocs
  - Fixed uninitialized variable in dpu_crtc_kickoff_clone_mode()
- DSI:
  - DSC-related fixes
  - Rework clock programming
- DSI PHY:
  - Fix 7nm (and lower) PHY programming
  - Add proper DT schema definitions for DSI PHY clocks
- HDMI:
  - Rework the driver, enabling the use of the HDMI Connector framework
- Bindings:
  - Added eDP PHY on SA8775P

nouveau:
- move drm_slave_encoder interface into driver
- nvkm: refactor GSP RPC
- use LTTPR helpers

mediatek:
- HDMI fixup and refinement
- add MT8188 dsc compatible
- MT8365 SoC support

panthor:
- Expose sizes of intenral BOs via fdinfo
- Fix race between reset and suspend
- Improve locking

qaic:
- Add support for AIC200

renesas:
- Fix limits in DT bindings

rockchip:
- support rk3562-mali
- rk3576: Add HDMI support
- vop2: Add new display modes on RK3588 HDMI0 up to 4K
- Don't change HDMI reference clock rate
- Fix DT bindings
- analogix_dp: add eDP support
- fix shutodnw

solomon:
- Set SPI device table to silence warnings
- Fix pixel and scanline encoding

v3d:
- handle clock

vc4:
- Use drm_exec
- Use dma-resv for wait-BO ioctl
- Remove seqno infrastructure

virtgpu:
- Support partial mappings of GEM objects
- Reserve VGA resources during initialization
- Fix UAF in virtgpu_dma_buf_free_obj()
- Add panic support

vkms:
- Switch to a managed modesetting pipeline
- Add support for ARGB8888
- fix UAf

xlnx:
- Set correct DMA segment size
- use mutex guards
- Fix error handling
- Fix docs
The following changes since commit 80e54e84911a923c40d7bee33a34c1b4be148d7a=
:

  Linux 6.14-rc6 (2025-03-09 13:45:25 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-03-28

for you to fetch changes up to cf05922d63e2ae6a9b1b52ff5236a44c3b29f78c:

  Merge tag 'drm-intel-gt-next-2025-03-12' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
(2025-03-25 08:21:07 +1000)

----------------------------------------------------------------
drm for 6.15-rc1

uapi:
- add mediatek tiled fourcc
- add support for notifying userspace on device wedged

new driver:
- appletbdrm: support for Apple Touchbar displays on m1/m2
- nova-core: skeleton rust driver to develop nova inside off

firmware:
- add some rust firmware pieces

rust:
- add 'LocalModule' type alias

component:
- add helper to query bound status

fbdev:
- fbtft: remove access to page->index

media:
- cec: tda998x: import driver from drm

dma-buf:
- add fast path for single fence merging

tests:
- fix lockdep warnings

atomic:
- allow full modeset on connector changes
- clarify semantics of allow_modeset and drm_atomic_helper_check
- async-flip: support on arbitary planes
- writeback: fix UAF
- Document atomic-state history

format-helper:
- support ARGB8888 to ARGB4444 conversions

buddy:
- fix multi-root cleanup

ci:
- update IGT

dp:
- support extended wake timeout
- mst: fix RAD to string conversion
- increase DPCD eDP control CAP size to 5 bytes
- add DPCD eDP v1.5 definition
- add helpers for LTTPR transparent mode

panic:
- encode QR code according to Fido 2.2

scheduler:
- add parameter struct for init
- improve job peek/pop operations
- optimise drm_sched_job struct layout

ttm:
- refactor pool allocation
- add helpers for TTM shrinker

panel-orientation:
- add a bunch of new quirks

panel:
- convert panels to multi-style functions
- edp: Add support for B140UAN04.4, BOE NV140FHM-NZ, CSW MNB601LS1-3,
  LG LP079QX1-SP0V, MNE007QS3-7, STA 116QHD024002, Starry 116KHD024006,
  Lenovo T14s Gen6 Snapdragon
- himax-hx83102: Add support for CSOT PNA957QT1-1, Kingdisplay
  kd110n11-51ie, Starry 2082109qfh040022-50e
- visionox-r66451: use multi-style MIPI-DSI functions
- raydium-rm67200: Add driver for Raydium RM67200
- simple: Add support for BOE AV123Z7M-N17, BOE AV123Z7M-N17
- sony-td4353-jdi: Use MIPI-DSI multi-func interface
- summit: Add driver for Apple Summit display panel
- visionox-rm692e5: Add driver for Visionox RM692E5

bridge:
- pass full atomic state to various callbacks
- adv7511: Report correct capabilities
- it6505: Fix HDCP V compare
- snd65dsi86: fix device IDs
- nwl-dsi: set bridge type
- ti-sn65si83: add error recovery and set bridge type
- synopsys: add HDMI audio support

xe:
- support device-wedged event
- add mmap support for PCI memory barrier
- perf pmu integration and expose per-engien activity
- add EU stall sampling support
- GPU SVM and Xe SVM implementation
- use TTM shrinker
- add survivability mode to allow the driver to do
  firmware updates in critical failure states
- PXP HWDRM support for MTL and LNL
- expose package/vram temps over hwmon
- enable DP tunneling
- drop mmio_ext abstraction
- Reject BO evcition if BO is bound to current VM
- Xe suballocator improvements
- re-use display vmas when possible
- add GuC Buffer Cache abstraction
- PCI ID update for Panther Lake and Battlemage
- Enable SRIOV for Panther Lake
- Refactor VRAM manager location

i915:
- enable extends wake timeout
- support device-wedged event
- Enable DP 128b/132b SST DSC
- FBC dirty rectangle support for display version 30+
- convert i915/xe to drm client setup
- Compute HDMI PLLS for rates not in fixed tables
- Allow DSB usage when PSR is enabled on LNL+
- Enable panel replay without full modeset
- Enable async flips with compressed buffers on ICL+
- support luminance based brightness via DPCD for eDP
- enable VRR enable/disable without full modeset
- allow GuC SLPC default strategies on MTL+ for performance
- lots of display refactoring in move to struct intel_display

amdgpu:
- add device wedged event
- support async page flips on overlay planes
- enable broadcast RGB drm property
- add info ioctl for virt mode
- OEM i2c support for RGB lights
- GC 11.5.2 + 11.5.3 support
- SDMA 6.1.3 support
- NBIO 7.9.1 + 7.11.2 support
- MMHUB 1.8.1 + 3.3.2 support
- DCN 3.6.0 support
- Add dynamic workload profile switching for GC 10-12
- support larger VBIOS sizes
- Mark gttsize parameters as deprecated
- Initial JPEG queue resset support

amdkfd:
- add KFD per process flags for setting precision
- sync pasid values between KGD and KFD
- improve GTT/VRAM handling for APUs
- fix user queue validation on GC7/8
- SDMA queue reset support

raedeon:
- rs400 hyperz fix

i2c:
- td998x: drop platform_data, split driver into media and bridge

ast:
- transmitter chip detection refactoring
- vbios display mode refactoring
- astdp: fix connection status and filter unsupported modes
- cursor handling refactoring

imagination:
- check job dependencies with sched helper

ivpu:
- improve command queue handling
- use workqueue for IRQ handling
- add support HW fault injection
- locking fixes

mgag200:
- add support for G200eH5

msm:
- dpu: add concurrent writeback support for DPU 10.x+
- use LTTPR helpers
- GPU:
  - Fix obscure GMU suspend failure
  - Expose syncobj timeline support
  - Extend GPU devcoredump with pagetable info
  - a623 support
  - Fix a6xx gen1/gen2 indexed-register blocks in gpu snapshot / devcoredum=
p
- Display:
  - Add cpu-cfg interconnect paths on SM8560 and SM8650
  - Introduce KMS OMMU fault handler, causing devcoredump snapshot
  - Fixed error pointer dereference in msm_kms_init_aspace()
- DPU:
  - Fix mode_changing handling
  - Add writeback support on SM6150 (QCS615)
  - Fix DSC programming in 1:1:1 topology
  - Reworked hardware resource allocation, moving it to the CRTC code
  - Enabled support for Concurrent WriteBack (CWB) on SM8650
  - Enabled CDM blocks on all relevant platforms
  - Reworked debugfs interface for BW/clocks debugging
  - Clear perf params before calculating bw
  - Support YUV formats on writeback
  - Fixed double inclusion
  - Fixed writeback in YUV formats when using cloned output, Dropped
    wb2_formats_rgb
  - Corrected dpu_crtc_check_mode_changed and struct dpu_encoder_virt
    kerneldocs
  - Fixed uninitialized variable in dpu_crtc_kickoff_clone_mode()
- DSI:
  - DSC-related fixes
  - Rework clock programming
- DSI PHY:
  - Fix 7nm (and lower) PHY programming
  - Add proper DT schema definitions for DSI PHY clocks
- HDMI:
  - Rework the driver, enabling the use of the HDMI Connector framework
- Bindings:
  - Added eDP PHY on SA8775P

nouveau:
- move drm_slave_encoder interface into driver
- nvkm: refactor GSP RPC
- use LTTPR helpers

mediatek:
- HDMI fixup and refinement
- add MT8188 dsc compatible
- MT8365 SoC support

panthor:
- Expose sizes of intenral BOs via fdinfo
- Fix race between reset and suspend
- Improve locking

qaic:
- Add support for AIC200

renesas:
- Fix limits in DT bindings

rockchip:
- support rk3562-mali
- rk3576: Add HDMI support
- vop2: Add new display modes on RK3588 HDMI0 up to 4K
- Don't change HDMI reference clock rate
- Fix DT bindings
- analogix_dp: add eDP support
- fix shutodnw

solomon:
- Set SPI device table to silence warnings
- Fix pixel and scanline encoding

v3d:
- handle clock

vc4:
- Use drm_exec
- Use dma-resv for wait-BO ioctl
- Remove seqno infrastructure

virtgpu:
- Support partial mappings of GEM objects
- Reserve VGA resources during initialization
- Fix UAF in virtgpu_dma_buf_free_obj()
- Add panic support

vkms:
- Switch to a managed modesetting pipeline
- Add support for ARGB8888
- fix UAf

xlnx:
- Set correct DMA segment size
- use mutex guards
- Fix error handling
- Fix docs

----------------------------------------------------------------
Abel Vesa (4):
      drm/dp: Add helper to set LTTPRs in transparent mode
      drm/nouveau/dp: Use the generic helper to control LTTPR transparent m=
ode
      drm/i915/dp: Use the generic helper to control LTTPR transparent mode
      drm/msm/dp: Add support for LTTPR handling

Abhinav Kumar (6):
      drm: allow encoder mode_set even when connectors change for crtc
      drm/msm: register a fault handler for display mmu faults
      drm/msm/iommu: rename msm_fault_handler to msm_gpu_fault_handler
      drm/msm/iommu: introduce msm_iommu_disp_new() for msm_kms
      drm/msm: switch msm_kms to use msm_iommu_disp_new()
      drm/msm/dpu: rate limit snapshot capture for mmu faults

Adri=C3=A1n Larumbe (7):
      Documentation/gpu: Clarify format of driver-specific fidnfo keys
      drm/file: Add fdinfo helper for printing regions with prefix
      drm/panthor: Expose size of driver internal BO's over fdinfo
      Documentation/gpu: Add fdinfo meanings of panthor-*-memory tags
      drm/panthor: Fix race condition when gathering fdinfo group samples
      drm/panthor: Replace sleep locks with spinlocks in fdinfo path
      drm/panthor: Avoid sleep locking in the internal BO size path

Ahmad Rehman (2):
      drm/amdgpu: Add support to load PSP TA v13.0.12 for SRIOV
      drm/amdgpu/sdam: Skip SDMA queue reset for SRIOV

Akhil P Oommen (1):
      drm/msm/a6xx: Fix stale rpmh votes from GPU

Alex Deucher (108):
      drm/amd/display/dm: drop extra parameters to create_i2c()
      drm/amd/display/dm: drop hw_support check in amdgpu_dm_i2c_xfer()
      drm/amd/display/dc: add a new helper to fetch the OEM ddc_service
      drm/amd/display/dm: handle OEM i2c buses in i2c functions
      drm/amd/display/dm: add support for OEM i2c bus
      drm/amd/display/dc: add support for oem i2c in atom_firmware_info_v3_=
1
      drm/amd/display/dc: enable oem i2c support for DCE 12.x
      drm/amdgpu/atombios: drop empty function
      drm/amdgpu: rework i2c init and fini
      drm/amdgpu: add OEM i2c bus for polaris chips
      drm/amdgpu/gfx: add ring helpers for setting workload profile
      drm/amdgpu: add dynamic workload profile switching for gfx10
      drm/amdgpu: add dynamic workload profile switching for gfx11
      drm/amdgpu: add dynamic workload profile switching for gfx12
      drm/amdgpu/swsmu: set workload profile to bootup default
      drm/amdgpu: update and cleanup PM4 headers
      drm/amdgpu/sdma4: drop gfxoff calls in dump ip state
      drm/amdgpu/gfx: add amdgpu_gfx_off_ctrl_immediate()
      drm/amdgpu/gfx9: use amdgpu_gfx_off_ctrl_immediate() for PG
      drm/amdkfd: add a new flag to manage where VRAM allocations go
      drm/amdkfd: use GTT for VRAM on APUs only if GTT is larger
      drm/amdgpu/vcn2.5: split code along instances
      drm/amdgpu/mes11: fix set_hw_resources_1 calculation
      drm/amdgpu/mes: Add cleaner shader fence address handling in MES for =
GFX12
      drm/amdgpu/gfx: only call mes for enforce isolation if supported
      drm/amdgpu/umsch: declare umsch firmware
      drm/amdgpu/umsch: fix ucode check
      drm/amdgpu/umsch: tidy up the ucode name string handling
      drm/amdgpu/vcn5.0.1: use correct dpm helper
      drm/amdgpu/vcn5.0.1: drop dpm power helpers
      drm/amdgpu/vcn4.0.3: drop dpm power helpers
      drm/amdgpu/mes11: allocate hw_resource_1 buffer once
      drm/amdgpu/mes12: allocate hw_resource_1 buffer once
      drm/amdgpu: disable BAR resize on Dell G5 SE
      MAINTAINERS: update amdgpu maintainers list
      drm/amdgpu/mes: keep enforce isolation up to date
      drm/amdgpu/vcn2.5: fix VCN stop logic
      drm/amdgpu/vcn3.0: split code along instances
      drm/amdgpu/vcn4.0: split code along instances
      drm/amdgpu/vcn4.0.3: split code along instances
      drm/amdgpu/vcn4.0.5: split code along instances
      drm/amdgpu/vcn5.0.0: split code along instances
      drm/amdgpu/vcn5.0.1: split code along instances
      drm/amdgpu/vcn: switch work handler to be per instance
      drm/amdgpu/vcn: make powergating status per instance
      drm/amdgpu/vcn: move more instanced data to vcn_instance
      drm/amdgpu/vcn: switch vcn helpers to be instance based
      drm/amdgpu/vcn3.0: convert internal functions to use vcn_inst
      drm/amdgpu/vcn1.0: convert internal functions to use vcn_inst
      drm/amdgpu/vcn2.0: convert internal functions to use vcn_inst
      drm/amdgpu/vcn2.5: convert internal functions to use vcn_inst
      drm/amdgpu/vcn4.0: convert internal functions to use vcn_inst
      drm/amdgpu/vcn4.0.3: convert internal functions to use vcn_inst
      drm/amdgpu/vcn4.0.5: convert internal functions to use vcn_inst
      drm/amdgpu/vcn5.0.0: convert internal functions to use vcn_inst
      drm/amdgpu/vcn5.0.1: convert internal functions to use vcn_inst
      drm/amdgpu/vcn: adjust pause_dpg_mode function signature
      drm/amdgpu/vcn: add new per instance callback for powergating
      drm/amdgpu/vcn1.0: add set_pg_state callback
      drm/amdgpu/vcn2.0: add set_pg_state callback
      drm/amdgpu/vcn2.5: add set_pg_state callback
      drm/amdgpu/vcn3.0: add set_pg_state callback
      drm/amdgpu/vcn4.0: add set_pg_state callback
      drm/amdgpu/vcn4.0.3: add set_pg_state callback
      drm/amdgpu/vcn4.0.5: add set_pg_state callback
      drm/amdgpu/vcn5.0.0: add set_pg_state callback
      drm/amdgpu/vcn5.0.1: add set_pg_state callback
      drm/amdgpu/vcn: use per instance callbacks for idle work handler
      drm/amdgpu/vcn: add a generic helper for set_power_gating_state
      drm/amdgpu/vcn1.0: use generic set_power_gating_state helper
      drm/amdgpu/vcn2.0: use generic set_power_gating_state helper
      drm/amdgpu/vcn2.5: use generic set_power_gating_state helper
      drm/amdgpu/vcn3.0: use generic set_power_gating_state helper
      drm/amdgpu/vcn4.0: use generic set_power_gating_state helper
      drm/amdgpu/vcn4.0.3: use generic set_power_gating_state helper
      drm/amdgpu/vcn4.0.5: use generic set_power_gating_state helper
      drm/amdgpu/vcn5.0.0: use generic set_power_gating_state helper
      drm/amdgpu/vcn5.0.1: use generic set_power_gating_state helper
      drm/amdgpu/vcn: optimize firmware storage
      drm/amdgpu/vcn: use dev_info() for firmware information
      drm/amdgpu/mes12: drop amdgpu_mes_suspend()/amdgpu_mes_resume() calls
      drm/amdgpu/mes11: drop amdgpu_mes_suspend()/amdgpu_mes_resume() calls
      Documentation/gpu: remove duplicate entries in different glossaries
      drm/amdgpu/vcn: fix idle work handler for VCN 2.5
      drm/amdgpu/vce2: fix ip block reference
      drm/amdgpu/gfx11: don't read registers in mqd init
      drm/amdgpu/gfx12: don't read registers in mqd init
      drm/amdgpu/pm: wire up hwmon fan speed for smu 14.0.2
      drm/amdgpu/pm: add VCN activity for renoir
      drm/amdgpu/pm: add VCN activity for SMU 13.0.0/7
      drm/amdgpu/pm: add VCN activity for SMU 14.0.2
      drm/amdgpu/pm: enable vcn busy sysfs for additional GC 11.x
      drm/amdgpu/pm: enable vcn busy sysfs for GC 12.x
      drm/amdgpu/pm: enable vcn busy sysfs for GC 9.3.0
      drm/amdgpu: drop drm_firmware_drivers_only()
      drm/amdgpu: adjust drm_firmware_drivers_only() handling
      drm/amdgpu: don't free conflicting apertures for non-display devices
      drm/amdgpu/gfx: fix ref counting for ring based profile handling
      drm/amdgpu/vcn: fix ref counting for ring based profile handling
      drm/amdgpu/gfx: adjust workload profile handling
      drm/amdgpu/vcn: adjust workload profile handling
      drm/amdgpu/sdma: fix engine reset handling
      drm/amdgpu/sdma: guilty tracking is per instance
      drm/amdgpu/mes: optimize compute loop handling
      drm/amdgpu/mes: drop MES 10.x leftovers
      drm/amdgpu/mes: enable compute pipes across all MEC
      drm/amdgpu/mes: clean up SDMA HQD loop
      drm/amdgpu/discovery: optionally use fw based ip discovery

Alex Hung (7):
      drm/amd/display: Replace pr_info in dc_validate_boot_timing()
      drm/amd/display: Print seamless boot message in mark_seamless_boot_st=
ream
      drm/amd/display: update incorrect cursor buffer size
      drm/amd/display: Check NULL connector before it is used
      drm/amd/display: Assign normalized_pix_clk when color depth =3D 14
      drm/amd/display: Remove incorrect macro guard
      drm/amd/display: Check pipe->stream before passing it to a function

Alex Lanzano (1):
      MAINTAINERS: Update maintainer of repaper and mi0283qt

Alex Sierra (1):
      drm/amdkfd: clear F8_MODE for gfx950

Alexander Stein (3):
      drm/bridge: ti-sn65dsi83: Set bridge type
      drm/bridge: nwl-dsi: Set bridge type
      drm/bridge: ti-sn65dsi83: Support negative DE polarity

Alexandre Demers (10):
      drm/amdgpu: fix spelling typos
      drm/radeon: fix spelling typos
      drm/amdgpu: fix spelling typos in SI
      drm/amdgpu: add some comments in DCE6
      drm/amdgpu: fix style in DCE6
      drm/amdgpu: add dce_v6_0_soft_reset() to DCE6
      drm/amdgpu: add defines for pin_offsets in DCE8
      drm/amdgpu: prepare DCE6 uniformisation with DCE8 and DCE10
      drm/amdgpu: fix SI's GB_ADDR_CONFIG_GOLDEN values and wire up
sid.h in GFX6
      drm/amdgpu: finish wiring up sid.h in DCE6

Aliaksei Urbanski (1):
      drm/amd/display: fix missing .is_two_pixels_per_container

Amber Lin (3):
      drm/amdgpu: Set noretry default for GC 9.5.0
      drm/amdgpu: Remove extra checks for CPX
      drm/amdkfd: Correct F8_MODE for gfx950

Andi Shyti (1):
      drm/i915/gt: Replace kmap with its safer kmap_local_page counterpart

Andrew Kreimer (1):
      drm/tidss: Fix typos

Andrew Martin (1):
      drm/amdkfd: Fix NULL Pointer Dereference in KFD queue

Andrew Wyatt (5):
      drm: panel-orientation-quirks: Add support for AYANEO 2S
      drm: panel-orientation-quirks: Add quirks for AYA NEO Flip DS and KB
      drm: panel-orientation-quirks: Add quirk for AYA NEO Slide
      drm: panel-orientation-quirks: Add new quirk for GPD Win 2
      drm: panel-orientation-quirks: Add quirk for OneXPlayer Mini (Intel)

Andrzej Kacprowski (2):
      accel/ivpu: Add missing locks around mmu queues
      accel/ivpu: Prevent runtime suspend during context abort work

Andr=C3=A9 Almeida (7):
      drm/amdgpu: Use device wedged event
      drm/atomic: Let drivers decide which planes to async flip
      drm/amdgpu: Enable async flip on overlay planes
      drm/amdgpu: Log the creation of a coredump file
      drm/amdgpu: Log after a successful ring reset
      drm/amdgpu: Create a debug option to disable ring reset
      drm/amdgpu: Trigger a wedged event for ring reset

Andy Yan (17):
      drm/rockchip: dw_hdmi_qp: Add platform ctrl callback
      dt-bindings: display: rockchip: Add rk3576 hdmi controller
      drm/rockchip: dw_hdmi_qp: Add basic RK3576 HDMI output support
      drm/panel-edp: Add BOE NV140FHM-NZ panel entry
      drm/rockchip: vop2: use devm_regmap_field_alloc for cluster-regs
      drm/rockchip: vop2: Remove AFBC from TRANSFORM_OFFSET register macro
      drm/rockchip: vop2: Add platform specific callback
      drm/rockchip: vop2: Merge vop2_cluster/esmart_init function
      drm/rockchip: vop2: Support for different layer select
configuration between VPs
      drm/rockchip: vop2: Introduce vop hardware version
      drm/rockchip: vop2: Register the primary plane and overlay plane
separately
      drm/rockchip: vop2: Set plane possible crtcs by possible vp mask
      drm/rockchip: vop2: Add uv swap for cluster window
      dt-bindings: display: vop2: describe constraint SoC by SoC
      dt-bindings: display: vop2: Add missing rockchip,grf property for rk3=
566/8
      dt-bindings: display: vop2: Add rk3576 support
      drm/rockchip: vop2: Add support for rk3576

AngeloGioacchino Del Regno (21):
      drm/mediatek: mtk_hdmi: Unregister audio platform device on failure
      drm/mediatek: mtk_hdmi: Fix typo for aud_sampe_size member
      drm/mediatek: mtk_hdmi: Compress of_device_id array entries
      drm/mediatek: mtk_hdmi: Move vendor/product strings to drm_bridge
      drm/mediatek: mtk_hdmi: Remove unused members of struct mtk_hdmi
      drm/mediatek: mtk_hdmi: Use devm managed version of drm_bridge_add
      drm/mediatek: mtk_hdmi: Remove ifdef for CONFIG_PM_SLEEP
      drm/mediatek: mtk_hdmi: Remove goto in mtk_hdmi_clk_enable_audio()
      drm/mediatek: mtk_hdmi: Remove driver bound to HDMI print
      drm/mediatek: mtk_hdmi: Cleanup function mtk_hdmi_resume()
      dt-bindings: display: mediatek: dpi: Add MT8195 and MT8188 compat
      drm/mediatek: mtk_dpi: Add support for Pattern Generator in debugfs
      drm/mediatek: mtk_dpi: Use an array for pixclk factor calculation
      drm/mediatek: mtk_dpi: Move pixel clock setting flow to function
      drm/mediatek: mtk_dpi: Add checks for reg_h_fre_con existence
      drm/mediatek: mtk_dpi: Move the input_2p_en bit to platform data
      drm/mediatek: mtk_dpi: Add support for DPI input clock from HDMI
      drm/mediatek: mtk_dpi: Support AFIFO 1T1P output and conversion
      drm/mediatek: mtk_dpi: Explicitly manage TVD clock in power on/off
      drm/mediatek: Add support for MT8195 Digital Parallel Interface
      dt-bindings: display: mediatek: dsc: Add MT8188 compatible

Ankit Nautiyal (10):
      drm/i915/dsc: Use helper to calculate range_bpg_offset
      drm/i915/dsc: Remove old comment about DSC 444 support
      drm/i915/dp: Correct max compressed bpp bounds by using link bpp
      drm/i915/display: Add support for SNPS PHY HDMI PLL algorithm for DG2
      drm/i915/snps_phy: Use HDMI PLL algorithm for DG2
      drm/i915/cx0_phy_regs: Add C10 registers bits
      drm/i915/intel_snps_hdmi_pll: Compute C10 HDMI PLLs with algorithm
      drm/i915/cx0_phy: Use HDMI PLL algorithm for C10 PHY
      drm/i915/dp: fix the Adaptive sync Operation mode for SDP
      drm/i915/dp: Return min bpc supported by source instead of 0

Anusha Srivatsa (6):
      drm/aspeed: move to devm_platform_ioremap_resource() usage
      drm/mediatek: move to devm_platform_ioremap_resource() usage
      drm/stm: move to devm_platform_ioremap_resource() usage
      drm/tiny: move to devm_platform_ioremap_resource() usage
      drm/vc4: move to devm_platform_ioremap_resource() usage
      drm/mediatek: Move to devm_platform_ioremap_resource() usage

Aradhya Bhatia (2):
      drm/xe: Add Wa_16021333562 and Wa_14016712196
      drm/xe/oa: Refactor WAs to use XE_WA() macro

Aric Cyr (4):
      drm/amd/display: 3.2.317
      drm/amd/display: 3.2.318
      drm/amd/display: Request HW cursor on DCN3.2 with SubVP
      drm/amd/display: Request HW cursor on DCN3.2 with SubVP

Arnd Bergmann (1):
      drm/panel: fix Visionox RM692E5 dependencies

Arun R Murthy (1):
      drm/i915/dp: Guarantee a minimum HBlank time

Arunpravin Paneer Selvam (1):
      drm/buddy: Add a testcase to verify the multiroot fini

Asad Kamal (25):
      drm/amd/pm: Populate pmfw version for SMU v13.0.12
      drm/amd/pm: Fill ip version for SMU v13.0.12
      drm/amd/pm: Update metrics tbl struct for smu_v_13.0.6
      drm/amd/pm: Add metrics table header for smu_v13_0_12
      drm/amd/pm: Add SMUv13.0.12 PPT interface
      drm/amd/pm: Add metrics support for smuv13.0.12
      drm/amd/pm: Skip showing MCLK_OD level
      drm/amd/pm: Update pm attr for gc_9_5_0
      drm/amd/pm: Skip P2S load for SMU v13.0.12
      drm/amdgpu: Add flags to distinguish vf/pf/pt mode
      drm/amd/pm: Rename pmfw message SetPstatePolicy
      drm/amd/pm: Limit jpeg rings as per max for jpeg_v_4_0_3
      drm/amd/pm: Update pmfw headers for smu_v13_0_12
      drm/amd/pm: Add GetStaticMetricTable message
      drm/amd/pm: Fetch static metrics table
      drm/amd/pm: Fetch fru product info for smu_v13_0_12
      drm/amd/pm: Use separate metrics table for smu_v13_0_12
      drm/amd/pm: Get metrics table version for smu_v13_0_12
      drm/amd/amdgpu: Add support for xgmi_v6_4_1
      drm/amdgpu: Set PG state to gating for vcn_v_5_0_1
      drm/amd/pm: Fix indentation issue
      drm/amd/pm: Update feature list for smu_v13_0_12
      drm/amd/pm: Remove unnecessay UQ10 to UINT conversion
      drm/amd/pm: Remove unnecessay UQ10 to UINT conversion
      drm/amd/pm: Update feature list for smu_v13_0_6

Asbj=C3=B8rn Sloth T=C3=B8nnesen (1):
      drm/i915: implement vmap/vunmap GEM object functions

Ashley Smith (1):
      drm/panthor: Update CS_STATUS_ defines to correct values

Ashutosh Dixit (3):
      drm/xe/oa: Add missing VISACTL mux registers
      drm/xe/oa: Preserve oa_ctrl unused bits
      drm/xe/oa: Set stream->pollin in xe_oa_buffer_check_unlocked

Assadian, Navid (1):
      drm/amd/display: Fix mismatch type comparison

Aurabindo Pillai (7):
      drm/amd/display: Make dcn401_program_pipe non static
      drm/amd/display: Add log for MALL entry on DCN32x
      drm/amd/display: fix an indent issue in DML21
      MAINTAINERS: Update AMDGPU DML maintainers info
      drm/amd/display: Temporarily disable hostvm on DCN31
      drm/amd/display: Add workaround for a panel
      drm/amd/display: use drm_* instead of DRM_ in apply_edid_quirks()

Ausef Yousof (1):
      drm/amd/display: limit coverage of optimization skip

Austin Zheng (3):
      drm/amd/display: Use Nominal vBlank If Provided Instead Of Capping It
      drm/amd/display: Account For OTO Prefetch Bandwidth When
Calculating Urgent Bandwidth
      drm/amd/display: DML21 Reintegration

Bart Van Assche (1):
      drm: zynqmp_dp: Fix a deadlock in zynqmp_dp_ignore_hpd_set()

Benjamin Chan (1):
      drm/amdgpu: Add amdisp pinctrl MFD resource

Boris Brezillon (1):
      drm/panthor: Fix a race between the reset and suspend path

Brandon Syu (1):
      Revert "drm/amd/display: Exit idle optimizations before attempt
to access PHY"

Brendan Tam (1):
      drm/amd/display: add workaround flag to link to force FFE preset

Brian Geffon (1):
      drm/i915: Fix page cleanup on DMA remap failure

Candice Li (4):
      drm/amdgpu: Enable ACA by default for psp v13_0_12
      drm/amdgpu: Optimize the enablement of GECC
      drm/amdgpu: Add EEPROM I2C address support for smu v13_0_12
      drm/amdgpu: Add active_umc_mask to ras init_flags

Charlene Liu (7):
      drm/amd/display: Exclude clkoffset and ips setting for dcn351 specifi=
c
      drm/amd/display: pass calculated dram_speed_mts to dml2
      drm/amd/display: fix dcn4x init failed
      drm/amd/display: assume VBIOS supports DSC as default
      drm/amd/display: remove minimum Dispclk and apply oem panel timing.
      drm/amd/display: Update static soc table
      drm/amd/display: Use DPM table clk setting for dml2 soc dscclk

Charles Han (3):
      drm: xlnx: zynqmp_dpsub: Add NULL check in zynqmp_audio_init
      drm/gma500: fix inconsistent indenting warning
      drm/amdgpu: fix inconsistent indenting warning

Christian K=C3=B6nig (11):
      dma-buf: add selftest for fence order after merge
      drm/amdgpu: remove all KFD fences from the BO on release
      drm/amdgpu: grab an additional reference on the gang fence v2
      drm/amdgpu: use GFP_NOWAIT for memory allocations
      drm/amdgpu: overwrite signaled fence in amdgpu_sync
      drm/amdgpu: rework how isolation is enforced v2
      drm/amdgpu: rework how the cleaner shader is emitted v3
      drm/amdgpu: stop reserving VMIDs to enforce isolation
      drm/amdgpu: add isolation trace point
      drm/amdgpu: add cleaner shader trace point
      drm/amdgpu: remove invalid usage of sched.ready

Colin Ian King (5):
      drm/amd/display: remove extraneous ; after statements
      drm/amd/display: Fix spelling mistake "oustanding" -> "outstanding"
      drm/xe: Fix uninitialized pointer def
      drm/amdgpu: Fix spelling mistake "initiailize" -> "initialize" and gr=
ammar
      drm/bridge: Fix spelling mistake "gettin" -> "getting"

Cristian Ciocaltea (6):
      dt-bindings: display: vop2: Add optional PLL clock properties
      drm/rockchip: vop2: Drop unnecessary if_pixclk_rate computation
      drm/rockchip: vop2: Improve display modes handling on RK3588 HDMI0
      drm/bridge: dw-hdmi: Sync comment block with actual bus formats order
      drm/rockchip: vop2: Improve display modes handling on RK3588 HDMI1
      drm/rockchip: vop2: Consistently use dev_err_probe()

Cruise Hung (2):
      drm/amd/display: Add tunneling IRQ handler
      drm/amd/display: Change notification of link BW allocation

Damon Ding (4):
      drm/edp-panel: Add LG Display panel model LP079QX1-SP0V
      dt-bindings: display: rockchip: Fix label name of hdptxphy for
RK3588 HDMI TX Controller
      drm/rockchip: analogix_dp: Use formalized struct definition for grf f=
ield
      drm/rockchip: analogix_dp: Expand device data to support
multiple edp display

Dan Carpenter (10):
      drm/tests: Fix a test in drm_test_check_valid_clones()
      drm: writeback: Fix use after free in drm_writeback_connector_cleanup=
()
      drm/nouveau: Fix error pointer dereference in r535_gsp_msgq_recv()
      drm/msm/gem: Fix error code msm_parse_deps()
      drm/vc4: hdmi: Fix some NULL vs IS_ERR() bugs
      drm/msm/dpu: fix error pointer dereference in msm_kms_init_aspace()
      drm/msm/dpu: Fix uninitialized variable in dpu_crtc_kickoff_clone_mod=
e()
      drm/amdgpu/gfx: delete stray tabs
      drm/amdkfd: delete stray tab in kfd_dbg_set_mes_debug_mode()
      drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer()

Daniel Gomez (1):
      drm/xe: xe_gen_wa_oob: replace program_invocation_short_name

Daniele Ceraolo Spurio (17):
      drm/i915/guc: Debug print LRC state entries only if the context is pi=
nned
      drm/xe/pxp: Initialize PXP structure and KCR reg
      drm/xe/pxp: Allocate PXP execution resources
      drm/xe/pxp: Add VCS inline termination support
      drm/xe/pxp: Add GSC session invalidation support
      drm/xe/pxp: Handle the PXP termination interrupt
      drm/xe/pxp: Add GSC session initialization support
      drm/xe/pxp: Add PXP queue tracking and session start
      drm/xe/pxp/uapi: Add userspace and LRC support for PXP-using queues
      drm/xe/pxp/uapi: Add a query for PXP status
      drm/xe/pxp/uapi: Add API to mark a BO as using PXP
      drm/xe/pxp: add PXP PM support
      drm/xe/pxp: Add PXP debugfs support
      drm/xe/pxp: Enable PXP for MTL and LNL
      drm/xe/pxp: Fail the load if PXP fails to initialize
      drm/xe/pxp: Don't use 0 to indicate NULL
      drm/xe/pxp: Don't kill queues while holding PXP locks

Danila Tikhonov (1):
      dt-bindings: display: panel: Add Visionox RM692E5

Danilo Krummrich (5):
      rust: module: add type `LocalModule`
      rust: firmware: introduce `firmware::ModInfoBuilder`
      rust: firmware: add `module_firmware!` macro
      gpu: nova-core: add initial driver stub
      gpu: nova-core: add initial documentation

Danny Wang (1):
      drm/amd/display: Do not enable replay when vtotal update is pending.

Dave Airlie (22):
      Merge tag 'amd-drm-fixes-6.14-2025-01-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-2025-02-12' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2025-02-20' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'v6.14-rc4' into drm-next
      Merge tag 'amd-drm-next-6.15-2025-02-21' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-2025-02-24' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-xe-next-2025-02-24' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-misc-next-2025-02-27' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2025-03-06' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-next-6.15-2025-03-07' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-msm-next-2025-03-09' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'drm-xe-next-2025-03-07' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-intel-next-2025-03-10' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Backmerge tag 'v6.14-rc6' into drm-next
      Merge tag 'nova-next-6.15-2025-03-09' of
gitlab.freedesktop.org:drm/nova into drm-next
      Merge tag 'drm-intel-gt-next-2025-02-26' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'mediatek-drm-next-6.15-v2' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-xe-next-fixes-2025-03-12' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-misc-next-fixes-2025-03-13' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-next-6.15-2025-03-14' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'amd-drm-next-6.15-2025-03-21' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-gt-next-2025-03-12' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next

David Belanger (1):
      drm/amdgpu: Restore uncached behaviour on GFX12

David Rosca (5):
      drm/amdgpu/display: Allow DCC for video formats on GFX12
      drm/amdgpu: Fix MPEG2, MPEG4 and VC1 video caps max size
      drm/amdgpu: Fix JPEG video caps max size for navi1x and raven
      drm/amdgpu: Remove JPEG from vega and carrizo video caps
      drm/amdgpu: Update SRIOV video codec caps

David Yat Sin (2):
      drm/amdkfd: Preserve cp_hqd_pq_control on update_mqd
      drm/amdkfd: clamp queue size to minimum

Derek Foreman (1):
      drm/rockchip: Don't change hdmi reference clock rate

Dillon Varone (7):
      drm/amd/display: Populate register address for dentist for dcn401
      drm/amd/display: Ammend DCPG IP control sequences to align with
HW guidance
      drm/amd/display: Fixes for mcache programming in DML21
      drm/amd/display: Fix p-state type when p-state is unsupported
      drm/amd/display: Fix DMUB reset sequence for DCN401
      drm/amd/display: Add Support for reg inbox0 for host->DMUB CMDs
      drm/amd/display: Revert "Support for reg inbox0 for host->DMUB CMDs"

Dmitry Baryshkov (44):
      drm/encoder_slave: make mode_valid accept const struct drm_display_mo=
de
      drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
      drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode_idx=
()
      drm/connector: make mode_valid_ctx take a const struct drm_display_mo=
de
      drm/connector: make mode_valid take a const struct drm_display_mode
      drm/nouveau: incorporate I2C TV encoder drivers
      drm/nouveau: vendor in drm_encoder_slave API
      drm/atomic-helper: document drm_atomic_helper_check() restrictions
      drm/i2c: tda998x: drop support for platform_data
      media: cec: move driver for TDA9950 from drm/i2c
      drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge
      drm: drop i2c subdir from Makefile
      drm/msm/dpu: don't use active in atomic_check()
      drm/msm/dpu: move needs_cdm setting to dpu_encoder_get_topology()
      drm/msm/dpu: simplify dpu_encoder_get_topology() interface
      drm/msm/dpu: don't set crtc_state->mode_changed from atomic_check()
      drm/msm/dpu: fill CRTC resources in dpu_crtc.c
      drm/msm/dpu: move resource allocation to CRTC
      drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocati=
on
      drm/msm/hdmi: switch to atomic bridge callbacks
      drm/msm/hdmi: program HDMI timings during atomic_pre_enable
      drm/msm/hdmi: make use of the drm_connector_hdmi framework
      drm/msm/hdmi: get rid of hdmi_mode
      drm/msm/hdmi: update HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
      drm/msm/hdmi: also send the SPD and HDMI Vendor Specific InfoFrames
      drm/msm/hdmi: use DRM HDMI Audio framework
      drm/msm/dpu: rename CDM block definition
      drm/msm/dpu: enable CDM_0 for DPUs 5.x+
      drm/msm/dpu: enable CDM_0 for DPUs 1.x - 4.x
      drm/msm/dpu: enable CDM_0 for SC8280XP platform
      drm/msm/dpu: enable CDM_0 for X Elite platform
      drm/msm/dpu: extract bandwidth aggregation function
      drm/msm/dpu: remove duplicate code calculating sum of bandwidths
      drm/msm/dpu: change ib values to u32
      drm/msm/dpu: make fix_core_ab_vote consistent with fix_core_ib_vote
      drm/msm/dpu: also use KBps for bw_ctl output
      drm/msm/dpu: rename average bandwidth-related debugfs files
      drm/msm/dpu: drop core_clk_rate overrides from _dpu_core_perf_calc_cr=
tc
      drm/msm/dpu: handle perf mode in _dpu_core_perf_crtc_update_bus()
      MAINTAINERS: use kernel.org alias
      mailmap: remap all addresses to kernel.org alias
      drm/msm/dpu: correct dpu_crtc_check_mode_changed docs
      drm/msm/dpu: correct struct dpu_encoder_virt docs
      drm/msm/dpu: drop wb2_formats_rgb

Dmitry Osipenko (2):
      drm/virtio: Set missing bo->attached flag
      drm/virtio: Factor out common dmabuf unmapping code

Dmytro (1):
      drm/amd/display: Allow reuse of of DCN4x code

Dnyaneshwar Bhadane (2):
      drm/i915/display: Add MTL subplatforms definition
      drm/i915/cx0_phy: Update HDMI TMDS C20 algorithm value

Dominik Kaszewski (1):
      drm/amdgpu: Add debug masks for HDCP LC FW testing

Douglas Anderson (2):
      drm/panel-edp: Add Starry 116KHD024006
      drm/mediatek: dp: drm_err =3D> dev_err in HPD path to avoid NULL ptr

Dr. David Alan Gilbert (30):
      drm/i915/gvt: Remove intel_gvt_ggtt_h2g<->index
      drm/i915/gvt: Remove unused intel_vgpu_decode_sprite_plane
      drm/i915/gvt: Remove unused intel_gvt_in_force_nonpriv_whitelist
      drm/omap: Remove hdmi5_core_handle_irqs()
      drm/i915: Remove unused live_context_for_engine
      drm/amdkfd: Remove unused functions
      drm/amd/display: Remove unused mpc1_is_mpcc_idle
      drm/amd/display: Remove unused freesync functions
      drm/amd/display: Remove unused dc_stream_get_crtc_position
      drm/amd/display: Remove unused get_clock_requirements_for_state
      drm/amd/display: Remove unused hubbub1_toggle_watermark_change_req
      drm/amd/display: Remove unused get_max_support_fbc_buffersize
      drm/amd/display: Remove unused link_enc_cfg_get_link_enc_used_by_stre=
am
      drm/amdgpu: Remove unused nbif_v6_3_1_sriov_funcs
      drm/amd/display: Remove unused optc3_fpu_set_vrr_m_const
      drm/vboxvideo: Remove unused hgsmi_cursor_position
      gpu: host1x: Remove unused host1x_debug_dump_syncpts
      gpu: ipu-v3: ipu-ic: Remove unused ipu_ic_task_graphics_init
      gpu: ipu-v3: Remove unused ipu_rot_mode_to_degrees
      gpu: ipu-v3: Remove unused ipu_idmac_channel_busy
      gpu: ipu-v3: Remove unused ipu_image_convert_* functions
      gpu: ipu-v3: Remove unused ipu_vdi_unsetup
      gpu: ipu-v3: ipu-csi: Remove unused functions
      gpu: ipu-v3 ipu-cpmem: Remove unused functions
      drm/amdgpu: Remove ppatomfwctrl deadcode
      drm/amdgpu: Remove phm_powerdown_uvd
      drm/amdgpu: Remove powerdown_uvd member
      drm/amdgpu: Remove unused pre_surface_trace
      drm/amdgpu: Remove unused print__rq_dlg_params_st
      drm/amdgpu: Remove unused pqm_get_kernel_queue

Ellen Pan (1):
      drm/amdgpu: Enable amdgpu_ras_resume for gfx 9.5.0

Emily Deng (4):
      drm/amdgpu: Fix missing drain retry fault the last entry
      drm/amdgpu: Fix the race condition for draining retry fault
      drm/amdgpu: Add amdgpu_sriov_multi_vf_mode function
      drm/amdgpu: set CP_HQD_PQ_DOORBELL_CONTROL.DOORBELL_MODE to 1
for sriov multiple vf.

Eric Huang (1):
      drm/amdkfd: fix missing L2 cache info in topology

Eric R. Smith (1):
      drm: add modifiers for MediaTek tiled formats

Ethan Carter Edwards (4):
      drm/amd/display: change kzalloc to kcalloc in dcn30_validate_bandwidt=
h()
      drm/amd/display: change kzalloc to kcalloc in dcn31_validate_bandwidt=
h()
      drm/amd/display: change kzalloc to kcalloc in dcn314_validate_bandwid=
th()
      drm/amd/display: change kzalloc to kcalloc in dml1_validate()

Eugene Lepshy (2):
      drm/msm/dsi: Allow values of 10 and 12 for bits per component
      drm/panel: Add Visionox RM692E5 panel driver

Fabien Parent (2):
      dt-bindings: display: mediatek: dpi: add power-domains example
      drm/mediatek: add MT8365 SoC support

Fange Zhang (1):
      drm/msm/dpu: Add writeback support for SM6150

FengWei (1):
      drm/radeon/uvd: Replace nested max() with single max3()

Flora Cui (3):
      drm/amdgpu: release xcp_mgr on exit
      drm/amdgpu/discovery: check ip_discovery fw file available
      drm/amdgpu/discovery: use specific ip_discovery.bin for legacy asics

Florent Tomasin (1):
      drm/panthor: Remove dead code

Francois Dugast (7):
      drm/xe/xe3: Generate and store the L3 bank mask
      drm/xe: Add missing SPDX license identifiers
      drm/xe/gt_pagefault: Print engine class string
      drm/xe: Add stats for vma page faults
      drm/xe/gt_stats: Use atomic64_t for counters
      drm/xe/gt_pagefault: Change vma_pagefault unit to kilobyte
      drm/xe: Allow fault injection in exec queue IOCTLs

Geert Uytterhoeven (1):
      drm/bridge: ti-sn65dsi86: Fix multiple instances

George Shen (5):
      drm/amd/display: Update CR AUX RD interval interpretation
      drm/amd/display: Read LTTPR ALPM caps during link cap retrieval
      drm/amd/display: Skip checking FRL_MODE bit for PCON BW determination
      drm/amd/display: Remove unused struct definition
      drm/amd/display: Implement PCON regulated autonomous mode handling

Giedrius Statkevi=C4=8Dius (1):
      drm/i915/lspcon: do not hardcode settle timeout

Guenter Roeck (1):
      drm/i915/backlight: Return immediately when scale() finds
invalid parameters

Gustavo A. R. Silva (1):
      drm/nouveau: Avoid multiple -Wflex-array-member-not-at-end warnings

Gustavo Sousa (22):
      drm/i915/dmc_wl: Use enum values for enable_dmc_wl
      drm/i915/dmc_wl: Show description string for enable_dmc_wl
      drm/i915/dmc_wl: Allow enable_dmc_wl=3D2 to mean "match any register"
      drm/i915/dmc_wl: Allow enable_dmc_wl=3D3 to mean "always locked"
      drm/i915/display: Use display MMIO functions in intel_display_irq.c
      drm/i915/display: Wrap IRQ-specific uncore functions
      drm/i915/dmc_wl: Track pipe interrupt registers
      drm/i915/cmtg: Disable the CMTG
      drm/xe: Fix sort order of .o lists in Makefile
      drm/i915/dmc_wl: Track INITIATE_PM_DMD_REQ for DC5
      drm/i915/dmc_wl: Do not check for DMC payload
      drm/i915/display: Use IP version check for Wa_14020863754
      drm/i915/audio: Extend Wa_14020863754 to Xe3_LPD
      drm/i915/display: Use explicit base values in POWER_DOMAIN_*() macros
      drm/i915/display: Make POWER_DOMAIN_*() always result in enum
intel_display_power_domain
      drm/xe: Set IP names in functions handling IP version
      drm/xe: Disambiguate GMDID-based IP names
      drm/xe: Rename gmdid_map to xe_ip
      drm/xe: Define xe_ip instances before xe_device_desc
      drm/xe: Convert pre-GMDID IPs to struct xe_ip
      drm/xe: Re-use feature descriptors for pre-GMDID IPs
      drm/xe: Simplify setting release info in xe->info

Gwenael Georgeault (1):
      drm/mgag200: Added support for the new device G200eH5

Hansen Dsouza (2):
      drm/amd/display: Add boot option to reduce PHY SSC for HBR3
      drm/amd/display: read mso dpcd caps

Haoxiang Li (1):
      drm/msm/dsi: Add check for devm_kstrdup()

Harish Chegondi (8):
      drm/xe/topology: Add a function to find the index of the last
enabled DSS in a mask
      drm/xe/uapi: Introduce API for EU stall sampling
      drm/xe/eustall: Add support to init, enable and disable EU stall samp=
ling
      drm/xe/eustall: Add support to read() and poll() EU stall data
      drm/xe/eustall: Add support to handle dropped EU stall data
      drm/xe/eustall: Add EU stall sampling support for Xe2
      drm/xe/uapi: Add a device query to get EU stall sampling information
      drm/xe/eustall: Add workaround 22016596838 which applies to PVC.

Harish Kasiviswanathan (8):
      drm/amdgpu: Set snoop bit for SDMA for MI series
      drm/amdkfd: Set per-process flags only once cik/vi
      drm/amdkfd: Set per-process flags only once for gfx9/10/11/12
      drm/amdkfd: Add support for more per-process flag
      drm/amdkfd: Add pm_config_dequeue_wait_counts API
      drm/amd/pm: add unique_id for gfx12
      drm/amdgpu: Reduce dequeue retry timeout for gfx9 family
      drm/amdkfd: Fix bug in config_dequeue_wait_counts

Harry VanZyllDeJong (1):
      drm/amd/display: Add support for disconnected eDP streams

Harry Wentland (1):
      drm/amd/display: Don't treat wb connector as physical in
create_validate_stream_for_sink

Hawking Zhang (6):
      drm/amdgpu: Update usage for bad page threshold
      drm/amd/include: Add amd cper header
      drm/amdgpu: Introduce funcs for populating CPER
      drm/amdgpu: Include ACA error type in aca bank
      drm/amdgpu: Introduce funcs for generating cper record
      drm/amdgpu: Generate cper records

Heiko Stuebner (6):
      drivers: base: component: add function to query the bound status
      drm/rockchip: Fix shutdown when no drm-device is set up
      drm/rockchip: vop2: add missing bitfield.h include
      drm/rockchip: lvds: move pclk preparation in with clk_get
      drm/rockchip: lvds: Hide scary error messages on probe deferral
      drm/rockchip: lvds: lower log severity for missing pinctrl settings

Hermes Wu (1):
      drm/bridge: it6505: fix HDCP V match check is not performed correctly

Herve Codina (5):
      dt-bindings: display: bridge: sn65dsi83: Add interrupt
      drm/atomic-helper: Introduce drm_atomic_helper_reset_crtc()
      drm/vc4: hdmi: Use drm_atomic_helper_reset_crtc()
      drm: bridge: ti-sn65dsi83: Add error recovery mechanism
      drm/atomic-helper: Add a note in drm_atomic_helper_reset_crtc() kerne=
l-doc

Ian Chen (1):
      drm/amd/display: Add AS SDP programming for UHBR link rate.

Ilia Levi (2):
      drm/xe: s/xe_mmio_init/xe_mmio_probe_early
      drm/xe: Add xe_mmio_init() initialization function

Ilya Bakoulin (2):
      drm/amd/display: Don't try AUX transactions on disconnected link
      drm/amd/display: Fix BT2020 YCbCr limited/full range input

Imre Deak (23):
      drm/xe/dp: Enable DP tunneling
      drm/xe/dp: Fix non-display builds with DP tunnelling incorrectly enab=
led
      drm/i915/dp_mst: Fix error handling while adding a connector
      drm/i915/dp_mst: Use intel_connector vs. drm_connector pointer
in intel_dp_mst.c
      drm/i915/dp_mst: Simplify using to_intel_display() passing it an
intel_connector pointer
      drm/i915/dp_mst: Simplify getting a drm_device pointer needed by to_i=
915()
      drm/i915/dp_mst: Use intel_display::platform.alderlake_p instead
of IS_ALDERLAKE_P()
      drm/i915/dp_mst: Fix getting display pointer in
intel_dp_mst_compute_min_hblank()
      drm/i915/dp_mst: Fix disabling the minimum HBlank time
      drm/i915/dsi: Use TRANS_DDI_FUNC_CTL's own port width macro
      drm/i915/ddi: Fix HDMI port width programming in DDI_BUF_CTL
      drm/i915/ddi: Make all the PORT_WIDTH macros work the same way
      drm/i915/ddi: Set missing TC DP PHY lane stagger delay in DDI_BUF_CTL
      drm/i915/ddi: Simplify the port enabling via DDI_BUF_CTL
      drm/i915/ddi: Simplify the port disabling via DDI_BUF_CTL
      drm/i915/ddi: Simplify waiting for a port to get active/idle via
DDI_BUF_CTL
      drm/i915/ddi: Move platform checks within
mtl_ddi_enable/disable_d2d_link()
      drm/i915/ddi: Unify the platform specific functions disabling a port
      drm/i915/ddi: Add a helper to enable a port
      drm/i915/ddi: Sanitize DDI_BUF_CTL register definitions
      drm/i915/dp: Fix error handling during 128b/132b link training
      drm/i915/dp: Fix disabling the transcoder function in 128b/132b mode
      drm/i915/dp_mst: Fix encoder HW state readout for UHBR MST

Jacek Lawrynowicz (4):
      accel/ivpu: Enable HWS by default on all platforms
      MAINTAINERS: Update intel_vpu maintainer list
      accel/ivpu: Add support for hardware fault injection
      accel/ivpu: Update last_busy in IRQ handler

Jakub Kolakowski (1):
      drm/xe/pf: Add runtime registers for graphics gen >=3D 30

James Zhu (1):
      drm/amdkfd: remove unnecessary cpu domain validation

Jani Nikula (107):
      drm/i915/gvt: store virtual_dp_monitor_edid in rodata
      drm/i915/audio: convert to struct intel_display
      drm/i915/audio: convert LPE audio to struct intel_display
      drm/i915/audio: rename function prefixes from i915 to intel
      drm/i915/dp: constify struct link_config_limits pointers
      drm/i915/dp: change the order of intel_dp_mtp_tu_compute_config() par=
ams
      drm/i915/mst: change where lane_count and port_clock are set
      drm/i915/mst: handle mst pbn_div in intel_dp_mtp_tu_compute_config()
      drm/i915/mst: remove unnecessary mst_stream_find_vcpi_slots_for_bpp()
      drm/i915/mst: use min_array() and max_array() instead of hand-rolling
      drm/i915/dp: Iterate DSC BPP from high to low on all platforms
      drm/i915/dp: Add intel_dp_dsc_bpp_step_x16() helper to get DSC
BPP precision
      drm/i915/dp: Rename some variables in xelpd_dsc_compute_link_config()
      drm/i915/dp: Pass .4 BPP values to {icl,xelpd}_dsc_compute_link_confi=
g()
      drm/i915/dp: Move max DSC BPP reduction one level higher
      drm/i915/dp: Change icl_dsc_compute_link_config() DSC BPP iteration
      drm/i915/dp: Move force_dsc_fractional_bpp_en check to
intel_dp_dsc_valid_bpp()
      drm/i915/dp: Unify DSC link config functions
      drm/i915/dp: Inline do_dsc_compute_compressed_bpp()
      drm/i915/dp: Simplify input BPP checks in intel_dp_dsc_compute_pipe_b=
pp()
      drm/i915/dp: Use int for compressed BPP in dsc_compute_link_config()
      drm/i915/dp: Drop compute_pipe_bpp parameter from
intel_dp_dsc_compute_config()
      drm/i915/dp: Pass connector state all the way to dsc_compute_link_con=
fig()
      drm/i915/mst: Convert intel_dp_mtp_tu_compute_config() to .4 format
      drm/i915/mst: fix INT_MAX to .4 fixed point conversion mistake
      drm/i915/dp: Fix potential infinite loop in 128b/132b SST
      drm/i915/dp: Add support for DP UHBR SST DSC
      Merge drm/drm-next into drm-intel-next
      drm/i915/hdmi: move declarations for hsw_read/write_infoframe()
to the right place
      drm/i915/lspcon: add intel_lspcon_active() and use it
      drm/i915/lspcon: change signature of lspcon_detect_hdr_capability()
      drm/i915/lspcon: change signature of lspcon_wait_pcon_mode()
      drm/i915/lspcon: remove dp_to_lspcon(), hide enc_to_intel_lspcon()
      drm/i915/lspcon: rename interfaces to intel_lspcon_* to unify
      drm/i915/display: convert intel_ddi_buf_trans.c to struct intel_displ=
ay
      drm/i915/cdclk: switch to new platform checks
      drm/i915/cx0: convert to struct intel_display based platform checks
      drm/i915/backlight: convert to use struct intel_display
      drm/i915/psr: clarify intel_psr_pre_plane_update() conditions
      drm/i915/hdcp: Move HDCP debugfs to intel_hdcp.c
      drm/i915/hdcp: rename intel_connector to connector
      drm/i915/hdcp: Convert platform checks to use display->platform
      drm/i915/hdcp: Make some functions static
      drm/client: include types.h to make drm_client_event.h self-contained
      drm: ensure drm headers are self-contained and pass kernel-doc
      drm/i915/pch: Make LPT LP a dedicated PCH type
      drm/i915/pch: Hide PCH device IDs
      drm/i915/pch: Remove unused i915->pch_id
      drm/i915/dp: convert g4x_dp.[ch] to struct intel display
      drm/i915/hdmi: convert g4x_hdmi.[ch] to struct intel_display
      drm/i915/ips: convert hsw_ips.c to struct intel_display
      drm/i915/display: convert assert_transcoder*() to struct intel_displa=
y
      drm/i915/display: convert assert_port_valid() to struct intel_display
      drm/i915/hpd: drop dev_priv parameter from intel_hpd_pin_default()
      drm/i915/display: convert
intel_set_{cpu,pch}_fifo_underrun_reporting() to intel_display
      drm/i915/sdvo: convert intel_sdvo.[ch] to struct intel_display
      drm/i915/display: convert intel_cpu_transcoder_mode_valid() to
intel_display
      drm/i915/display: convert intel_mode_valid_max_plane_size() to
intel_display
      drm/i915/dsi: convert platform checks to
display->platform.<platform> style
      drm/i915/combo-phy: convert intel_combo_phy.[ch] to struct intel_disp=
lay
      drm/i915/display: convert intel_fifo_underrun.[ch] to struct intel_di=
splay
      drm/i915/display: convert i915_pipestat_enable_mask() to struct
intel_display
      drm/i915/power: move runtime power status info to power debugfs
      drm/i915/mst: update max stream count to match number of pipes
      drm/i915/display: remove leftover struct drm_i915_private
forward declarations
      drm/i915/debugfs: continue display debugfs struct intel_display conve=
rsion
      drm/i915/tdf: convert intel_tdf.[ch] to struct intel_display
      drm/i915/snps: convert intel_snps_phy.[ch] to struct intel_display
      drm/i915/dkl: convert intel_dkl_phy.[ch] to struct intel_display
      drm/i915/drrs: convert intel_drrs.[ch] to struct intel_display
      drm/i915/display: convert the M/N functions to struct intel_display
      drm/i915/dpt: convert intel_dpt.[ch] interfaces to struct intel_displ=
ay
      drm/i915/fbc: convert intel_fbc.[ch] to struct intel_display
      drm/i915/rps: convert intel_display_rps.[ch] to struct intel_display
      drm/i915/ddi: convert intel_wait_ddi_buf_idle() to struct intel_displ=
ay
      drm/i915/fdi: convert intel_fdi.[ch] to struct intel_display
      drm/i915/pfit: rename intel_panel_fitting() to intel_pfit_compute_con=
fig()
      drm/i915/pfit: move ilk and i9xx pfit code to intel_pfit.[ch]
      drm/i915/pfit: fix comment style for moved comments
      drm/i915/pfit: convert moved code to struct intel_display
      drm/i915/pfit: split out intel_pfit_regs.h
      Merge drm/drm-next into drm-intel-next
      drm/i915/mst: add mst sub-struct to struct intel_dp
      drm/i915/mst: add mst sub-struct to struct intel_connector
      drm/i915/hdcp: add hdcp sub-struct to struct intel_digital_port
      drm/i915/pxp & drm/xe/pxp: Figure out pxp instance from the gem objec=
t
      drm/i915: relocate intel_plane_ggtt_offset() to intel_atomic_plane.c
      drm/i915: split out i915_gtt_view_types.h from i915_vma_types.h
      drm/mipi-dsi: stop passing non struct drm_device to drm_err() and fri=
ends
      drm/rockchip: stop passing non struct drm_device to drm_err() and fri=
ends
      drm/sched: stop passing non struct drm_device to drm_err() and friend=
s
      drm/print: require struct drm_device for drm_err() and friends
      drm/i915/display: convert display reset to struct intel_display *
      drm/i915: move pending_fb_pin to struct intel_display
      drm/i915/reset: add intel_gt_gpu_reset_clobbers_display() helper
      drm/i915/reset: add intel_display_reset_test()
      drm/i915/reset: remove I915_RESET_MODESET flag
      drm/i915/reset: decide whether display reset is needed on gt side
      drm/i915/reset: pass test only parameter to intel_display_reset_finis=
h()
      drm/i915/reset: add modeset_stuck callback to
intel_display_reset_prepare()
      drm/i915/display: convert various port/phy helpers to struct intel_di=
splay
      drm/i915/display: convert some intel_display.[ch] functions to
struct intel_display
      drm/i915/display: convert intel_has_pending_fb_unpin() to struct
intel_display
      drm/i915/display: remove dupe intel_update_watermarks() declaration
      drm/i915/display: convert intel_display.c to struct intel_display
      drm/xe/compat: refactor compat i915_drv.h
      drm/i915/plane: convert intel_atomic_plane.[ch] to struct intel_displ=
ay

Jason-JH Lin (1):
      drm/mediatek: Fix config_updating flag never false when no mbox chann=
el

Javier Martinez Canillas (1):
      drm/ssd130x: Set SPI .id_table to prevent an SPI core warning

Jay Cornwall (1):
      drm/amdkfd: Fix instruction hazard in gfx12 trap handler

Jeff Hugo (4):
      accel/qaic: Add config structs for supported cards
      accel/qaic: Add AIC200 support
      MAINTAINERS: Update my email address
      bus: mhi: host: Avoid possible uninitialized fw_load_type

Jesse Van Gavere (1):
      drm/bridge: adv7511: Switch to atomic operations

Jesse.zhang@amd.com (17):
      drm/amdgpu/gfx10: implement queue reset via MMIO
      drm/amdgpu/gfx10: implement gfx queue reset via MMIO
      drm/amdgpu/kfd: Add shared SDMA reset functionality with callback sup=
port
      drm/amdgpu/sdma: Refactor SDMA reset functionality and add
callback support
      drm/amdgpu: Introduce conditional user queue suspension for SDMA rese=
ts
      drm/amdgpu: Introduce cached_rptr and is_guilty callback in amdgpu_ri=
ng
      drm/amdgpu/sdma: Introduce is_guilty callbacks for sdma GFX and PAGE =
rings
      drm/amdgpu: Improve SDMA reset logic with guilty queue tracking
      drm/amdgpu: Add reset function pointer for SDMA v4.4.2 page ring
      drm/amd/pm: add support for checking SDMA reset capability
      drm/amdgpu: Update amdgpu_job_timedout to check if the ring is guilty
      drm/amdgpu: update SDMA sysfs reset mask in late_init
      drm/amdgpu: Update SDMA scheduler mask handling to include page queue
      drm/amdgpu: Fix SDMA engine reset logic
      drm/amd/amdgpu: Increase max rings to enable SDMA page ring
      drm/amdgpu: Optimize VM invalidation engine allocation and
synchronize GPU TLB flush
      drm/amdgpu/sdma_v4_4_2: update VM flush implementation for SDMA

Jessica Zhang (19):
      drm/tests: Add test for drm_atomic_helper_commit_modeset_disables()
      drm: add clone mode check for CRTC
      drm/tests: Add test for drm_crtc_in_clone_mode()
      drm: Add valid clones check
      drm/tests: Add test for drm_atomic_helper_check_modeset()
      drm/msm/dpu: Add CWB to msm_display_topology
      drm/msm/dpu: Require modeset if clone mode status changes
      drm/msm/dpu: Fail atomic_check if multiple outputs request CDM block
      drm/msm/dpu: Reserve resources for CWB
      drm/msm/dpu: Configure CWB in writeback encoder
      drm/msm/dpu: Support CWB in dpu_hw_ctl
      drm/msm/dpu: Adjust writeback phys encoder setup for CWB
      drm/msm/dpu: Start frame done timer after encoder kickoff
      drm/msm/dpu: Skip trigger flush and start for CWB
      drm/msm/dpu: Reorder encoder kickoff for CWB
      drm/msm/dpu: Set possible clones for all encoders
      drm/msm/dpu: Clear perf params before calculating bw
      drm/msm/dpu: Support YUV formats on writeback for DPU 5.x+
      drm/msm/dpu: Adjust CDM_MUX to support CWB PINGPONG

Jiang Liu (2):
      amdgpu/soc15: enable asic reset for dGPU in case of suspend abort
      drm/amdgpu: reset psp->cmd to NULL after releasing the buffer

Jiapeng Chong (2):
      drm: adp: Remove unnecessary print function dev_err()
      drm/msm/dpu: Remove duplicate dpu_hw_cwb.h header

Jie Zhang (4):
      drm/msm/a6xx: Split out gpucc register block
      drm/msm/a6xx: Fix gpucc register block for A621
      drm/msm/a6xx: Add support for Adreno 623
      dt-bindings: display/msm/gmu: Add Adreno 623 GMU

Jing Zhou (1):
      drm/amd/display: Guard against setting dispclk low for dcn31x

Jinjie Ruan (1):
      drm: zynqmp_dp: Use devm_platform_ioremap_resource_byname()

Jocelyn Falempe (2):
      drm/ast: Fix ast_dp connection status
      drm/panic: Better binary encoding in QR code

John Harrison (4):
      drm/i915: Add debug print about hw config table size
      drm/xe/guc: Drop error messages about missing GuC logs
      drm/i915/uc: Include requested frequency in slow firmware load messag=
es
      drm/xe: Upgrade complaint about missing slice info

John Keeping (3):
      drm/ssd130x: fix ssd132x encoding
      drm/ssd130x: ensure ssd132x pitch is correct
      drm/panel: ilitek-ili9882t: fix GPIO name in error message

Jonathan Kim (6):
      drm/amdkfd: enable cooperative launch on gfx12
      drm/amdgpu: simplify xgmi peer info calls
      drm/amdkfd: implement per queue sdma reset for gfx 9.4+
      drm/amdkfd: flag per-sdma queue reset supported to user space
      drm/amdkfd: remove unused debug gws support status variable
      drm/amdkfd: set precise mem ops caps to disabled for gfx 11 and 12

Joshua Aberback (2):
      drm/amd/display: Increase block_sequence array size
      drm/amd/display: Add more debug data to dmub_srv

Josip Pavic (1):
      drm/amd/display: log destination of vertical interrupt

Jos=C3=A9 Exp=C3=B3sito (1):
      drm/vkms: Fix use after free and double free on init error

Jos=C3=A9 Roberto de Souza (2):
      drm/xe: Make GUC binaries dump consistent with other binaries in
devcoredump
      drm/i915: Increase I915_PARAM_MMAP_GTT_VERSION version to
indicate support for partial mmaps

Jouni H=C3=B6gander (18):
      drm/i915/psr: Add new function for writing sink panel replay enable b=
it
      drm/i915/psr: Enable Panel Replay on sink always when it's supported
      drm/i915/psr: Make intel_psr_enable_sink as local static function
      drm/i915/psr: Allow changing Panel Replay mode without full modeset
      drm/i915/psr: Use PSR2_MAN_TRK_CTL CFF bit only to send full update
      drm/i915/psr: Rename psr_force_hw_tracking_exit as intel_psr_force_up=
date
      drm/i915/psr: Split setting sff and cff bits away from
intel_psr_force_update
      drm/i915/psr: Add register definitions for SFF_CTL and CFF_CTL regist=
ers
      drm/i915/psr: Use SFF_CTL on invalidate/flush for LunarLake onwards
      drm/i915/psr: Allow writing PSR2_MAN_TRK_CTL using DSB
      drm/i915/psr: Write PSR2_MAN_TRK_CTL on DSB commit as well
      drm/i915/display: Warn on use_dsb in non-dsb pipe update functions
      drm/i915/psr: Remove DSB_SKIP_WAITS_EN chicken bit
      drm/i915/display: Evade scanline 0 as well if PSR1 or PSR2 is enabled
      drm/i915/psr: Add function for triggering "Frame Change" event
      drm/i915/display: Ensure we have "Frame Change" event in DSB commit
      drm/i915/psr: Allow DSB usage when PSR is enabled
      drm/i915/psr: Fix drm_WARN_ON in intel_psr_disable

Juha-Pekka Heikkila (1):
      drm/i915/gt: add wait on depth stall done bit handling

Karol Wachowski (17):
      accel/ivpu: Separate DB ID and CMDQ ID allocations from CMDQ allocati=
on
      accel/ivpu: Add API for command queue create/destroy/submit
      accel/ivpu: Abort all jobs after command queue unregister
      accel/ivpu: Dump only first MMU fault from single context
      accel/ivpu: Move parts of MMU event IRQ handling to thread handler
      accel/ivpu: Fix missing MMU events from reserved SSID
      accel/ivpu: Set command queue management capability based on HWS
      accel/ivpu: Fix locking order in ivpu_cmdq_destroy_ioctl
      accel/ivpu: Fix locking order in ivpu_job_submit
      accel/ivpu: Add handling of VPU_JSM_STATUS_MVNCI_CONTEXT_VIOLATION_HW
      accel/ivpu: Add platform detection for presilicon
      accel/ivpu: Fix missing MMU events if file_priv is unbound
      accel/ivpu: Turn on HWS by default on all platforms
      accel/ivpu: Move recovery work to system_unbound_wq
      accel/ivpu: Add debugfs interface for setting HWS priority bands
      accel/ivpu: Add test modes to toggle clock relinquish disable
      accel/ivpu: Implement D0i2 disable test mode

Kenneth Feng (5):
      drm/amd/pm: disable gfxoff on the specific sku
      drm/amd/pm: add fan abnormal detection
      drm/amd/pm: always allow ih interrupt from fw
      drm/amd/amdgpu: shorten the gfx idle worker timeout
      drm/amd/amdgpu: Revert "drm/amd/amdgpu: shorten the gfx idle
worker timeout"

Kerem Karabay (2):
      drm/format-helper: Add conversion from XRGB8888 to BGR888
      drm/tiny: add driver for Apple Touch Bars in x86 Macs

Kever Yang (1):
      dt-bindings: gpu: Add rockchip,rk3562-mali compatible

Krunoslav Kovac (1):
      drm/amd/display: Remove unused header

Krzysztof Karas (2):
      drm/i915/selftests: avoid using uninitialized context
      drm/i915/gt: Use spin_lock_irqsave() in interruptible context

Krzysztof Kozlowski (18):
      drm/omap/dss: Use of_property_present() to test existence of DT prope=
rty
      drm/omap/dss: Use syscon_regmap_lookup_by_phandle_args
      dt-bindings: display: renesas,du: narrow interrupts and resets
per variants
      dt-bindings: display: renesas,du: add top-level constraints
      drm/msm/dpu: Simplify using local 'ctl' variable
      drm/msm: Use str_enable_disable-like helpers
      dt-bindings: display/msm/dsi-phy: Add header with exposed clock IDs
      drm/msm/dsi/phy: Use the header with clock IDs
      drm/msm/dsi/phy: Program clock inverters in correct register
      drm/msm/dsi: Drop redundant NULL-ifying of clocks on error paths
      drm/msm/dsi: Simplify with dev_err_probe()
      drm/msm/dsi: Minor whitespace and style cleanup
      drm/msm/dsi: Drop unnecessary -ENOMEM message
      drm/msm/dsi/phy: Use dsi_pll_cmn_clk_cfg1_update() when registering P=
LL
      drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01] bitfields and simplify sa=
ving
      dt-bindings: display/msm: qcom, sa8775p-mdss: Add missing eDP phy
      dt-bindings: display/msm: dsi-controller-main: Combine if:then: entri=
es
      dt-bindings: display/msm: dsi-controller-main: Add missing minItems

Langyan Ye (9):
      drm/panel-edp: Add B140UAN04.4 and MNE007QS3-7
      drm/panel-edp: Add CSW MNB601LS1-3
      drm/panel-edp: Add STA 116QHD024002
      dt-bindings: vendor-prefixes: add csot
      dt-bindings: display: panel: Add compatible for CSOT PNA957QT1-1
      drm/panel: panel-himax-hx83102: support for csot-pna957qt1-1
MIPI-DSI panel
      dt-bindings: display: panel: Add KD110N11-51IE and 2082109QFH040022-5=
0E
      drm/panel: panel-himax-hx83102: support for
kingdisplay-kd110n11-51ie MIPI-DSI panel
      drm/panel: panel-himax-hx83102: support for
starry-2082109qfh040022-50e MIPI-DSI panel

Le Ma (2):
      drm/amdgpu: read harvest info from harvest table for gfx950
      drm/amdgpu: add sdma page queue irq processing for sdma442

Leo Li (1):
      drm/amd/display: Disable unneeded hpd interrupts during dm_init

Leo Zeng (4):
      drm/amd/display: add new IRQ enum for underflows
      Revert "drm/amd/display: Request HW cursor on DCN3.2 with SubVP"
      drm/amd/display: Added visual confirm for DCC
      drm/amd/display: Fix visual confirm color not updating

Leon Huang (1):
      drm/amd/display: Fix incorrect DPCD configs while Replay/PSR switch

Lijo Lazar (34):
      drm/amdgpu: Add VCN v4.0.3 RRMT register offset
      drm/amdgpu: Check RRMT status for VCN v4.0.3
      drm/amdgpu: Check RRMT status for JPEG v4.0.3
      drm/amdgpu: Use active umc info from discovery
      drm/amdgpu: Pass IP instance/hwid as parameters
      drm/amdgpu: Use version to figure out harvest info
      drm/amdgpu: Clean up GFX v9.4.3 IP version checks
      drm/amdgpu: Clean up IP version checks in gmcv9.0
      drm/amd/pm: Limit to 8 jpeg rings per instance
      drm/amdgpu: Clean up atom header file inclusion
      drm/amd/pm: Add APIs for device access checks
      drm/amd/pm: Fix get_if_active usage
      drm/amd/pm: Remove unnecessary device state checks
      drm/amdgpu: Add wrapper for freeing vbios memory
      drm/amdgpu: Add VBIOS flags
      drm/amdgpu: Add flag to make VBIOS read optional
      drm/amdgpu: Make VBIOS image read optional
      drm/amd/pm: Fetch current power limit from PMFW
      drm/amdgpu: Use firmware supported NPS modes
      drm/amdgpu: Remove redundant logic in GC v9.4.3
      drm/amdgpu: Fix logic to fetch supported NPS modes
      drm/amdgpu: Move xgmi definitions to xgmi header
      drm/amdgpu: Add xgmi speed/width related info
      drm/amdgpu: Initialize RRMT status on VCN v5.0.1
      drm/amdgpu: Add offset normalization in VCN v5.0.1
      drm/amdgpu: Initialize RRMT status on JPEG v5.0.1
      drm/amdgpu: Avoid HDP flush on JPEG v5.0.1
      drm/amdgpu: Use the right struct for VCN v5.0.1
      drm/amdgpu: Reinit FW shared flags on VCN v5.0.1
      drm/amdgpu: Remove unsupported xgmi versions
      drm/amdgpu: Calculate IP specific xgmi bandwidth
      drm/amdgpu: Use wafl version for xgmi
      drm/amd/pm: Add debug bit for smu pool allocation
      Documentation/amdgpu: Add debug_mask documentation

Likun Gao (1):
      drm/amdgpu: correct the name of mes_pipe structure

Lin.Cao (1):
      drm/buddy: fix issue that force_merge cannot free all roots

Lizhi Hou (5):
      accel/amdxdna: Return error when setting clock failed for npu1
      accel/amdxdna: Remove casting mailbox payload pointer
      accel/amdxdna: Declare sched_ops as static
      accel/amdxdna: Refactor hardware context destroy routine
      accel/amdxdna: Check interrupt register before mailbox_rx_worker exit=
s

Lo-an Chen (1):
      drm/amd/display: Fix incorrect fw_state address in dmub_srv

Louis Chauvet (12):
      drm/vkms: Switch to managed for connector
      drm/vkms: Switch to managed for encoder
      drm/managed: Add DRM-managed alloc_ordered_workqueue
      drm/vkms: Switch to managed for crtc
      drm: writeback: Create an helper for drm_writeback_connector
initialization
      drm: writeback: Add missing cleanup in case of initialization failure
      drm: writeback: Create drmm variants for drm_writeback_connector
initialization
      drm/vkms: Switch to managed for writeback connector
      drm/vkms: Switch to dynamic allocation for connector
      drm/vkms: Switch to dynamic allocation for encoder
      drm/vkms: Switch to dynamic allocation for CRTC
      drm: writeback: Fix kernel doc name

Luan Arcanjo (1):
      drm/amd/display/dc: Refactor remove duplications

Luca Ceresoli (15):
      drm/drm_mode_object: fix typo in kerneldoc
      drm/atomic-helper: improve CRTC enabled/connectors mismatch
logging message
      drm/panel: remove unnecessary forward declaration
      drm/bridge: nxp-ptn3460: remove unused drm_panel.h include
      drm/bridge: parade-ps8622: remove unused drm_panel.h include
      drm/bridge: parade-ps8640: remove unused drm_panel.h include
      drm/bridge: tc358762: remove unused drm_panel.h include, add drm_brid=
ge.h
      drm/bridge: tc358775: remove unused drm_panel.h include
      drm/bridge: ti-sn65dsi83: remove unused drm_panel.h include
      drm/bridge: ti-sn65dsi86: remove unused drm_panel.h include
      drm/debugfs: fix printk format for bridge index
      drm: of: drm_of_find_panel_or_bridge: move misplaced comment
      drm/bridge: panel: use drm_bridge_is_panel() instead of open code
      drm/bridge: panel: drm_panel_bridge_remove: warn when called on
non-panel bridge
      drm/bridge: panel: forbid initializing a panel with unknown connector=
 type

Lucas De Marchi (40):
      drm/i915/pmu: Remove i915_pmu_event_event_idx()
      MAINTAINERS: Also exclude xe for drm-misc
      drm/xe/pmu: Assert max gt
      drm/xe/pmu: Extract xe_pmu_event_update()
      drm/xe/pmu: Get/put runtime pm on event init
      drm/xe/pmu: Add attribute skeleton
      drm/xe/devcoredump: Move exec queue snapshot to Contexts section
      drm/xe: Fix and re-enable xe_print_blob_ascii85()
      drm/xe/guc: Fix size_t print format
      Merge drm/drm-next into drm-xe-next
      drm/xe: Remove xe_dummy_exit()
      drm/i915/pmu: Drop custom hotplug code
      drm/xe/debugfs: Add node to dump guc log to dmesg
      drm/xe: Add callback support for driver remove
      drm/xe: Fix xe_display_fini() calls
      drm/xe: Fix error handling in xe_irq_install()
      drm/xe: Fix xe_tile_init_noalloc() error propagation
      drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
      drm/xe: Remove leftover pxp comment
      drm/xe: Cleanup unwind of gt initialization
      drm/xe: Cleanup extra calls to xe_hw_fence_irq_finish()
      drm/xe/oa: Move fini to xe_oa
      drm/xe: Move drm_dev_unplug() out of display function
      drm/xe/oa: Handle errors in xe_oa_register()
      drm/xe/pmu: Fail probe if xe_pmu_register() fails
      drm/xe/hwmon: Stop ignoring errors on probe
      drivers: base: devres: Allow to release group on device release
      drivers: base: devres: Fix find_group() documentation
      drivers: base: component: Add debug message for unbind
      drm/xe: Stop setting drvdata to NULL
      drm/xe: Switch from xe to devm actions
      drm/xe: Drop remove callback support
      drm/xe/display: Drop xe_display_driver_remove()
      drm/xe: Move survivability entirely to xe_pci
      drm/xe: Stop ignoring errors from xe_heci_gsc_init()
      drm/xe: Rename update_device_info() after sriov
      drm/xe: Stop ignoring errors from xe_ttm_sys_mgr_init()
      Merge drm/drm-next into drm-xe-next
      drm/gpusvm: Fix kernel-doc
      drm/xe/rtp: Drop sentinels from arg to xe_rtp_process_to_sr()

Ma Ke (1):
      drm/amd/display: Fix null check for pipe_ctx->plane_state in
resource_build_scaling_params

Maarten Lankhorst (9):
      drm/xe/display: Re-use display vmas when possible
      drm/xe: Do not attempt to bootstrap VF in execlists mode
      drm/xe: Move suballocator init to after display init
      drm/xe: Remove double pageflip
      drm/xe/display: Add intel_plane_initial_vblank_wait
      drm/xe: Defer irq init until after xe_display_init_noaccel
      drm/xe/display: Use a single early init call for display
      drm/xe/display: Clarify XE_IOCTL_DBG message
      drm/xe/display: Fix fbdev GGTT mapping handling.

Maciej Falkowski (2):
      accel/ivpu: Expose NPU memory utilization info in sysfs
      accel/ivpu: Use workqueue for IRQ handling

Maciej Patelczyk (2):
      drm/xe: introduce xe_gt_reset and xe_gt_wait_for_reset
      drm/xe: make change ccs_mode a synchronous action

Mangesh Gadre (5):
      drm/amdgpu: Add support for umc 12.5.0/mmhub 1.8.1
      drm/amdgpu: Add support for smu 13.0.12
      drm/amdgpu: Add support for nbio 7.9.1
      drm/amdgpu: Add support for smuio 13.0.11
      drm/amd/pm: handling of set performance level

Marcin Bernatowicz (2):
      drm/xe/vf: Return EOPNOTSUPP for DRM_XE_DEVICE_QUERY_ENGINE_CYCLES if=
 VF
      drm/xe/client: Skip show_run_ticks if unable to read timestamp

Marek Ol=C5=A1=C3=A1k (1):
      drm/amd/display: allow 256B DCC max compressed block sizes on gfx12

Marijn Suijten (4):
      drm/msm/dpu: Fall back to a single DSC encoder (1:1:1) on small SoCs
      drm/msm/dsi: Use existing per-interface slice count in DSC timing
      drm/msm/dsi: Set PHY usescase (and mode) before registering DSI host
      drm/msm/dpu: Remove arbitrary limit of 1 interface in DSC topology

Mario Limonciello (32):
      drm/amd/display: Add debug messages for dc_validate_boot_timing()
      drm/amd/display: Decrease message about seamless boot enabled to debu=
g
      drm/amd/display: Add new log type `DC_LOG_INFO`
      drm/amd: Mark amdgpu.gttsize parameter as deprecated and show
warnings on use
      drm/amd/display: Refactor mark_seamless_boot_stream()
      drm/amd: Refactor find_system_memory()
      drm/amd/display: Change amdgpu_dm_irq_suspend() to void
      drm/amd/display: Drop `ret` variable from dm_suspend()
      drm/amd/display: Catch failures for amdgpu_dm_commit_zero_streams()
      drm/amd/display: Use _free() macro for amdgpu_dm_commit_zero_streams(=
)
      drm/amd/display: Use drm_err() instead of DRM_ERROR in dm_resume()
      drm/amd/display: Use scoped guard for dm_resume()
      drm/amd/display: Change amdgpu_dm_irq_resume_*() to use drm_dbg()
      drm/amd/display: Change amdgpu_dm_irq_resume_*() to void
      drm/amd/display: Use _free(kfree) for dm_gpureset_commit_state()
      drm/amd/display: Use scoped guard for
amdgpu_dm_update_connector_after_detect()
      drm/amd/display: Use _free() macro for
amdgpu_dm_update_connector_after_detect()
      drm/amd/display: Use scoped guards for handle_hpd_irq_helper()
      drm/amd/display: Use drm_err() for handle_hpd_irq_helper()
      drm/amd: Copy entire structure in amdgpu_acpi_get_backlight_caps()
      drm/amd: Pass luminance data to amdgpu_dm_backlight_caps
      drm/amd/display: Avoid operating on copies of backlight caps
      drm/amd/display: Add support for custom brightness curve
      drm/amd/display: Add a new dcdebugmask to allow turning off
brightness curve
      drm/amd: Keep display off while going into S4
      drm/amd/display: fix default brightness
      drm/amd/display: Restore correct backlight brightness after a GPU res=
et
      drm/amd/display: Add and use new dm_prepare_suspend() callback
      drm/amd/display: Fix slab-use-after-free on hdcp_work
      drm/amd/display: Add scoped mutexes for amdgpu_dm_dhcp
      drm/amd/display: Drop unnecessary ret variable for enable_assr()
      drm/amd/display: Use HW lock mgr for PSR1 when only one eDP

Markus Theil (1):
      drm/i915/selftests: use prandom in selftest

Martin Tsai (1):
      drm/amd/display: Support multiple options during psr entry.

Matt Atwood (1):
      drm/xe/ptl: Update the PTL pci id table

Matt Roper (3):
      drm/xe: Remove unused "mmio_ext" code
      drm/xe: Drop unnecessary GT lookup in xe_exec_queue_create_ioctl()
      drm/xe: Eliminate usage of TIMESTAMP_OVERRIDE

Matthew Auld (5):
      drm/tests/buddy: fix build with unused prng
      drm/xe/userptr: restore invalidation list on error
      drm/xe/userptr: fix EFAULT handling
      drm/xe/userptr: remove tmp_evict list
      drm/xe/userptr: properly setup pfn_flags_mask

Matthew Brost (30):
      drm/xe: Mark ComputeCS read mode as UC on iGPU
      drm/xe: Add staging tree for VM binds
      drm/xe: Retry BO allocation
      mm/migrate: Add migrate_device_pfns
      mm/migrate: Trylock device page in do_swap_page
      drm/gpusvm: Add support for GPU Shared Virtual Memory
      drm/xe: Select DRM_GPUSVM Kconfig
      drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR
      drm/xe: Add SVM init / close / fini to faulting VMs
      drm/xe: Nuke VM's mapping upon close
      drm/xe: Add SVM range invalidation and page fault
      drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
      drm/xe: Add (re)bind to SVM page fault handler
      drm/xe: Add SVM garbage collector
      drm/xe: Add unbind to SVM garbage collector
      drm/xe: Do not allow CPU address mirror VMA unbind if
      drm/xe: Enable CPU address mirror uAPI
      drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
      drm/xe: Add migrate layer functions for SVM support
      drm/xe: Add SVM device memory mirroring
      drm/xe: Add drm_gpusvm_devmem to xe_bo
      drm/xe: Add GPUSVM device memory copy vfunc functions
      drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
      drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
      drm/xe: Add SVM VRAM migration
      drm/xe: Basic SVM BO eviction
      drm/xe: Add SVM debug
      drm/xe: Add modparam for SVM notifier size
      drm/xe: Add always_migrate_to_vram modparam
      drm/doc: gpusvm: Add GPU SVM documentation

Matthew Leung (2):
      bus: mhi: host: Refactor BHI/BHIe based firmware loading
      bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL

Matthew Wilcox (Oracle) (1):
      fbtft: Remove access to page->index

Maud Spierings (4):
      dt-bindings: display: simple: add BOE AV101HDT-A10 panel
      dt-bindings: display: simple: Add BOE AV123Z7M-N17 panel
      drm/panel: simple: add BOE AV101HDT-A10 panel
      drm/panel: simple: Add BOE AV123Z7M-N17 panel

Maxime Ripard (29):
      Merge drm/drm-next into drm-misc-next
      drm/atomic: Document history of drm_atomic_state
      drm/bridge: Pass full state to atomic_pre_enable
      drm/bridge: Pass full state to atomic_enable
      drm/bridge: Pass full state to atomic_disable
      drm/bridge: Pass full state to atomic_post_disable
      drm/atomic-helper: Fix commit_tail state variable name
      drm/atomic-helper: Change parameter name of
drm_atomic_helper_wait_for_dependencies()
      drm/atomic-helper: Change parameter name of
drm_atomic_helper_commit_tail()
      drm/atomic-helper: Change parameter name of
drm_atomic_helper_commit_tail_rpm()
      drm/atomic-helper: Change parameter name of
drm_atomic_helper_modeset_disables()
      drm/atomic-helper: Change parameter name of disable_outputs()
      drm/bridge: Change parameter name of drm_atomic_bridge_chain_disable(=
)
      drm/bridge: Change parameter name of
drm_atomic_bridge_chain_post_disable()
      drm/atomic-helper: Change parameter name of
drm_atomic_helper_update_legacy_modeset_state()
      drm/atomic-helper: Change parameter name of crtc_set_mode()
      drm/atomic-helper: Change parameter name of
drm_atomic_helper_commit_planes()
      drm/atomic-helper: Change parameter name of
drm_atomic_helper_commit_modeset_enables()
      drm/bridge: Change parameter name of drm_atomic_bridge_chain_pre_enab=
le()
      drm/bridge: Change parameter name of drm_atomic_bridge_chain_enable()
      drm/atomic-helper: Change parameter name of
drm_atomic_helper_commit_writebacks()
      drm/atomic-helper: Change parameter name of
drm_atomic_helper_fake_vblank()
      drm/atomic-helper: Change parameter name of
drm_atomic_helper_commit_hw_done()
      drm/atomic-helper: Change parameter name of
drm_atomic_helper_wait_for_vblanks()
      drm/atomic-helper: Change parameter name of
drm_atomic_helper_cleanup_planes()
      drm/atomic-helper: Change parameter name of
drm_atomic_helper_commit_cleanup_done()
      drm/atomic-helper: Change parameter name of
drm_atomic_helper_wait_for_flip_done()
      drm/doc: Document KUnit expectations
      drm/tests: Drop drm_kunit_helper_acquire_ctx_alloc()

Ma=C3=ADra Canal (4):
      drm/v3d: Remove `v3d->cpu_job`
      drm/vc4: Use DRM Execution Contexts
      drm/vc4: Use DMA Resv to implement VC4 wait BO IOCTL
      drm/vc4: Remove BOs seqnos

Melissa Wen (1):
      drm/amd/display: restore edid reading from a given i2c adapter

Michael Strauss (1):
      drm/amd/display: Update FIXED_VS Link Rate Toggle Workaround Usage

Michal Wajdeczko (24):
      drm/xe: Always setup GT MMIO adjustment data
      drm/xe/vf: Perform early GT MMIO initialization to read GMDID
      drm/xe/sa: Always call drm_suballoc_manager_fini()
      drm/xe/sa: Drop redundant NULL assignments
      drm/xe/sa: Improve error message on init failure
      drm/xe/sa: Tidy up coding style in init()
      drm/xe/sa: Allow making suballocations using custom gfp flags
      drm/xe/sa: Allow creating suballocator with custom guard size
      drm/xe/sa: Minor header cleanups
      drm/xe/guc: Introduce the GuC Buffer Cache
      drm/xe/pf: Use GuC Buffer Cache during VFs provisioning
      drm/xe/kunit: Allow to replace xe_managed_bo_create_pin_map()
      drm/xe/kunit: Add KUnit tests for GuC Buffer Cache
      drm/xe/pf: Fix migration initialization
      drm/xe/guc: Fix sizeof(32) typo
      drm/xe/pf: Use GuC Buffer Cache during policy provisioning
      drm/xe/pf: Move VFs reprovisioning to worker
      drm/xe/pf: Don't send BEGIN_ID if VF has no context/doorbells
      drm/xe/pf: Reset GuC VF config when unprovisioning critical resource
      drm/xe/relay: Don't use GFP_KERNEL for new transactions
      drm/xe/vf: Don't try to trigger a full GT reset if VF
      drm/xe: Don't treat SR-IOV platforms as reclaim unsafe
      drm/xe: Enable SR-IOV for PTL
      drm/xe/pf: Release all VFs configs on device removal

Mika Kahola (2):
      drm/i915/display: Drop crtc_state from C10/C20 pll programming
      drm/i915/display: Allow display PHYs to reset power state

Mike Katsnelson (1):
      drm/amd/display: stop DML2 from removing pipes based on planes

Mingcong Bai (1):
      drm/xe/regs: remove a duplicate definition for RING_CTL_SIZE(size)

Mitul Golani (14):
      drm/i915/scaler: Add and compute scaling factors
      drm/i915/scaler: Use crtc_state to setup plane or pipe scaler
      drm/i915/scaler: Refactor max_scale computation
      drm/i915/scaler: Compute scaling factors for pipe scaler
      drm/i915/scaler: Limit pipe scaler downscaling factors for YUV420
      drm/i915/scaler: Check if vblank is sufficient for scaler
      drm/i915/dsc: Check if vblank is sufficient for dsc prefill
      drm/i915/vrr: Add crtc_state dump for vrr.vsync params
      drm/i915/vrr: Compute vrr.vsync_{start, end} during full modeset
      drm/i915/dp: Compute as_sdp.vtotal based on vrr timings
      drm/i915/dp: Compute as_sdp based on if vrr possible
      drm/i915/display: Move as sdp params change to fastset
      drm/i915/display: Skip state checker for AS SDP infoframe enable
      Revert "drm/i915/dp: Compute as_sdp based on if vrr possible"

Muhammad Ahmed (1):
      drm/amd/display: Enable odm 4:1 when debug key is set

Natalie Vock (1):
      drm/amdgpu: NULL-check BO's backing store when determining GFX12 PTE =
flags

Nathan Chancellor (2):
      drm/amd/display: Reapply 2fde4fdddc1f
      drm/appletbdrm: Fix format specifier for size_t variables

Navid Assadian (2):
      drm/amd/display: Add opp recout adjustment
      drm/amd/display: Add SPL namespace

Neil Armstrong (2):
      dt-bindings: display: qcom,sm8550-mdss: explicitly document
mdp0-mem and cpu-cfg interconnect paths
      dt-bindings: display: qcom,sm8650-mdss: explicitly document
mdp0-mem and cpu-cfg interconnect paths

Nemesa Garg (1):
      drm/i915/display: Add WA_14018221282

Nicholas Kazlauskas (5):
      drm/amd/display: Guard against setting dispclk low when active
      drm/amd/display: Apply DCN35 DML2 state policy for DCN36 too
      drm/amd/display: Increase halt timeout for DMCUB to 1s
      drm/amd/display: Revert "Increase halt timeout for DMCUB to 1s"
      drm/amd/display: Ensure DMCUB idle before reset on DCN31/DCN35

Nikita Zhandarovich (3):
      drm/radeon/ci_dpm: Remove needless NULL checks of dpm tables
      drm/repaper: fix integer overflows in repeat functions
      drm/radeon: fix uninitialized size issue in radeon_vce_cs_parse()

Nirmoy Das (2):
      drm/xe/ptl: Apply Wa_14023061436
      drm/xe: Carve out wopcm portion from the stolen memory

Nitin Gote (8):
      drm/i915/gt: fix typos in i915/gt files.
      drm/i915/gvt: fix typos in i915/gvt files
      drm/i915/gem: fix typos in i915/gem files
      drm/i915/pxp: fix typos in i915/pxp files
      drm/i915/selftests: fix typos in i915/selftests files
      drm/i915/soc: fix typos in i915/soc files
      drm/i915/display: fix typos in i915/display files
      drm/i915: fix typos in drm/i915 files

Noralf Tr=C3=B8nnes (1):
      MAINTAINERS: Remove Noralf Tr=C3=B8nnes as driver maintainer

Oak Zeng (5):
      drm/xe: Reject BO eviction if BO is bound to current VM
      drm/xe: trace bo create
      drm/xe: Print vm flags in xe_vm trace print
      drm/xe: Print vm parameter in xe_vma trace
      drm/xe: Fix a typo in xe_vm_doc.h

Oleh Kuzhylnyi (1):
      drm/amd/display: Add total_num_dpps_required field to
informative structure

Olivier Moysan (3):
      drm: bridge: adv7511: fill stream capabilities
      ASoC: hdmi-codec: allow to refine formats actually supported
      drm: bridge: adv7511: remove s32 format from i2s capabilities

Ovidiu Bunea (1):
      drm/amd/display: Exit idle optimizations before accessing PHY

Patel, Swapnil (1):
      drm/amd/display: Refactor DCN4x and related code

Paz Zcharya (1):
      drm/vkms: Add support for ABGR8888 pixel format

Peichen Huang (5):
      drm/amd/display: refactor dio link encoder assigning
      drm/amd/display: dpia should avoid encoder used by dp2
      drm/amd/display: replace dio encoder access
      drm/amd/display: misc for dio encoder refactor
      drm/amd/display: not abort link train when bw is low

Peterson Guo (1):
      drm/amd/display: Reverse the visual confirm recouts

Philip Yang (7):
      drm/amdgpu: Unlocked unmap only clear page table leaves
      drm/amdkfd: Fix user queue validation on Gfx7/8
      drm/amdkfd: Remove kfd_process_hw_exception worker
      drm/amdkfd: KFD release_work possible circular locking
      drm/amdkfd: Fix mode1 reset crash issue
      drm/amdkfd: Fix pqm_destroy_queue race with GPU reset
      drm/amdkfd: debugfs hang_hws skip GPU with MES

Philipp Stanner (4):
      MAINTAINERS: Update DRM GPU Scheduler section
      MAINTAINERS: Add DRM GPU Scheduler reviewer
      drm/sched: Use struct for drm_sched_init() params
      drm/sched: drm_sched_job_cleanup(): correct false doc

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: init return value in amdgpu_ttm_clear_buffer

Piotr Pi=C3=B3rkowski (3):
      drm/xe/pf: Use an explicit check to see if the device has LMTT
      drm/xe: Rename struct xe_mem_region to struct xe_vram_region
      drm/xe: Move VRAM manager to struct xe_vram_region

Pratap Nirujogi (1):
      drm/amdgpu: Replace DRM_ERROR() with drm_err()

Priyanka Dandamudi (1):
      drm/xe: Add fault injection for xe_sync_entry_parse

Raag Jadav (6):
      drm/i915/selftest: Change throttle criteria for rps
      drm/xe/hwmon: expose package and vram temperature
      drm: Introduce device wedged event
      drm/doc: Document device wedged event
      drm/xe: Use device wedged event
      drm/i915: Use device wedged event

Rafal Ostrowski (1):
      drm/amd/display: ACPI Re-timer Programming

Randy Dunlap (1):
      drm/panthor: fix all mmu kernel-doc comments

Ranu Maurya (1):
      drm/i915: Add Wa_22010465259 in its respective WA list

Ravi Kumar Vodapalli (1):
      drm/i915/display: Update DBUF_TRACKER_STATE_SERVICE only on
appropriate platforms

Riana Tauro (9):
      drm/xe: Add functions and sysfs for boot survivability
      drm/xe: Enable Boot Survivability mode
      drm/xe: Initialize mei-gsc and vsec in survivability mode
      drm/xe: Skip survivability mode for VF
      drm/xe: Add engine activity support
      drm/xe/trace: Add trace for engine activity
      drm/xe/guc: Expose engine activity only for supported GuC version
      drm/xe/xe_pmu: Add PMU support for engine activity
      drm/xe/xe_pmu: Acquire forcewake on event init for engine events

Richard Thier (1):
      drm/radeon: Fix rs400_gpu_init for ATI mobility radeon Xpress 200M

Rob Clark (3):
      drm/msm: Expose DRIVER_SYNCOBJ_TIMELINE
      drm/msm: Extend gpu devcore dumps with pgtbl info
      drm/msm/a6xx: Fix a6xx indexed-regs in devcoreduump

Rob Herring (Arm) (1):
      drm/panthor: Convert IOCTL defines to an enum

Rodrigo Siqueira (7):
      drm/amd/display: Add DCC/Tiling reset helper for DCN and DCE
      drm/amd/display: Rename panic function
      drm/amd/display: Add clear DCC and Tiling callback for DCN
      drm/amd/display: Add clear DCC and Tiling callback for DCE
      Documentation/gpu: Add acronyms for some firmware components
      MAINTAINERS: Change my role from Maintainer to Reviewer
      mailmap: Add entry for Rodrigo Siqueira

Rodrigo Vivi (12):
      drm/i915/guc/slpc: Allow GuC SLPC default strategies on MTL+
      drm/i915/guc/slpc: Print more SLPC debug status information
      drm/xe: Introduce GuC PC debugfs
      drm/xe/lnl: Enable GuC SLPC DCC task
      drm/xe/uapi: Fix documentation indentation
      Revert "drm/xe/lnl: Enable GuC SLPC DCC task"
      drm/xe: Fix PVC RPe and RPa information
      drm/xe/display: Add missing watermark ipc update at runtime resume
      drm/xe/display: Remove hpd cancel work sync from runtime pm path
      drm/{i915, xe}/display: Move dsm registration under intel_driver
      drm/xe/display: Spin-off xe_display runtime/d3cold sequences
      drm/xe/guc_pc: Remove duplicated pc_start call

Roman Li (1):
      drm/amd/display: Fix HPD after gpu reset

Ryan Seto (2):
      drm/amd/display: Prevent VStartup Overflow
      drm/amd/display: Prevent VStartup Overflow

Ryosuke Yasuoka (1):
      drm/virtio: Add drm_panic support

Sai Teja Pottumuttu (2):
      drm/xe: Refactor dma_mask_size
      drm/xe: Refactor max_remote_tiles

Saleemkhan Jamadar (2):
      drm/amdgpu/vcn: enable TMZ support for vcn 4_0_5
      drm/amdgpu/umsch: remove vpe test from umsch

Samson Tam (8):
      drm/amd/display: Move SPL to a new path
      drm/amd/display: use s1_12 filter tables in SPL
      drm/amd/display: remove TF check for LLS policy
      drm/amd/display: add s1_12 filter tables
      drm/amd/display: sspl: cleanup filter code
      drm/amd/display: Fix mismatch type comparison in custom_float
      drm/amd/display: fix check for identity ratio
      drm/amd/display: Fix unit test failure

Sasha Finkelstein (5):
      drm/virtio: Support partial maps of GEM objects
      drm: panel: Add a panel driver for the Summit display
      dt-bindings: display: Add Apple pre-DCP display controller
      drm: adp: Add Apple Display Pipe driver
      MAINTAINERS: Add entries for touchbar display driver

Sathishkumar S (25):
      drm/amdgpu: increase amdgpu max rings limit
      drm/amdgpu: Add a func for core specific reg offset
      drm/amdgpu: Add helper funcs for jpeg devcoredump
      drm/amdgpu: Enable devcoredump for JPEG4_0_3
      drm/amdgpu: Enable devcoredump for JPEG5_0_1
      drm/amdgpu: Enable devcoredump for JPEG4_0_0
      drm/amdgpu: Enable devcoredump for JPEG4_0_5
      drm/amdgpu: Enable devcoredump for JPEG3_0_0
      drm/amdgpu: Enable devcoredump for JPEG2_0_0
      drm/amdgpu: Enable devcoredump for JPEG2_5_0
      drm/amdgpu: Enable devcoredump for JPEG5_0_0
      drm/amdgpu: Per-instance init func for JPEG4_0_3
      drm/amdgpu: Add ring reset callback for JPEG4_0_0
      drm/amdgpu: Add ring reset callback for JPEG3_0_0
      drm/amdgpu: Per-instance init func for JPEG2_5_0
      drm/amdgpu: Add ring reset callback for JPEG2_5_0
      drm/amdgpu: Add ring reset callback for JPEG2_0_0
      drm/amdgpu: Add JPEG4_0_3 core reset control reg
      drm/amdgpu: Add ring reset callback for JPEG4_0_3
      drm/amdgpu: Do not poweroff UVDJ in JPEG4_0_3
      drm/amdgpu: Per-instance init func for JPEG5_0_1
      drm/amdgpu: Add core reset registers for JPEG5_0_1
      drm/amdgpu: Add ring reset callback for JPEG5_0_1
      drm/amdgpu: Fix core reset sequence for JPEG4_0_3
      drm/amdgpu: Fix core reset sequence for JPEG5_0_1

Satyanarayana K V P (3):
      drm/xe: Suppress printing of mode when running in non-sriov mode
      drm/xe/pf: Create a link between PF and VF devices
      drm/xe/vf: Retry sending MMIO request to GUC on timeout error

Sean Anderson (1):
      drm: zynqmp_dp: Use scope-based mutex helpers

Sebastian Brzezinka (1):
      Revert "drm/i915/gt: Log reason for setting TAINT_WARN at reset"

Sebastian Reichel (3):
      drm/edp-panel: Add panel used by T14s Gen6 Snapdragon
      dt-bindings: display: panel: Add Raydium RM67200
      drm/panel: add Raydium RM67200 panel driver

Shaoyun Liu (3):
      drm/amd/include : MES v11 and v12 API header update
      drm/amd/include : Update MES v12 API for fence update
      drm/amd/amdgpu: Fix MES init sequence

Shekhar Chauhan (1):
      drm/xe/bmg: Add new PCI IDs

Shiwu Zhang (4):
      drm/amdgpu: enlarge the VBIOS binary size limit
      drm/amdgpu: Enable IFWI update support with PSPv13.0.12
      drm/amdgpu: retire ip init code specific for A0 rev
      drm/amdgpu: fix the gb_addr_config_fields init value mismatch

Shixiong Ou (2):
      drm/bridge: convert to use devm_platform_ioremap_resource()
      drm/bridge: analogix_dp: Use devm_platform_ioremap_resource()

Shuicheng Lin (3):
      drm/xe/debugfs: Add missing xe_pm_runtime_put in wedge_mode_set
      drm/xe/devcoredump: Fix print typo of offset
      drm/xe/devcoredump: Remove IS_ERR_OR_NULL check for kzalloc

Simona Vetter (1):
      drm/atomic: clarify the rules around drm_atomic_state->allow_modeset

Sk Anirban (2):
      drm/i915/selftests: Correct frequency handling in RPS power measureme=
nt
      drm/i915/guc/slpc: Add helper function slpc_measure_power

Srinivasan Shanmugam (13):
      drm/amdgpu/gfx10: Add cleaner shader for GFX10.1.10
      drm/amdgpu/gfx10: Enable cleaner shader for GFX10.1.1/10.1.2 GPUs
      drm/amdgpu/mes: Add cleaner shader fence address handling in MES for =
GFX11
      drm/amdgpu: Rename VCN clock gating function for consistency
      drm/amdgpu: Replace Mutex with Spinlock for RLCG register access
to avoid Priority Inversion in SRIOV
      drm/amdkfd: Fix error handling for missing PASID in
'kfd_process_device_init_vm'
      drm/amdgpu: Fix correct parameter desc for VCN idle check functions
      drm/amdkfd: Fix Circular Locking Dependency in
'svm_range_cpu_invalidate_pagetables'
      drm/amdgpu: Fix parameter annotations for VCN clock gating functions
      drm/amdgpu: Fix parameter annotation in vcn_v5_0_0_is_idle
      drm/amdgpu: Fix annotation for dce_v6_0_line_buffer_adjust function
      drm/amdgpu/gfx11: Add Cleaner Shader Support for GFX11.5 GPUs
      drm/amdgpu: Add parameter documentation for amdgpu_sync_fence

Stefan Wahren (1):
      drm/v3d: Add clock handling

Steven Price (1):
      drm/panthor: Clean up FW version information display

Sugar Zhang (1):
      drm/bridge: synopsys: Add audio support for dw-hdmi-qp

Sung Lee (1):
      drm/amd/display: Guard Possible Null Pointer Dereference

Sunil Khatri (2):
      drm/amdgpu: update the handle ptr in get_clockgating_state
      drm/amdgpu: update the handle ptr in is_idle

Suraj Kandpal (24):
      drm/i915/hdcp: Fix Repeater authentication during topology change
      drm/i915/hdcp: Use correct function to check if encoder is HDMI
      drm/i915/cx0: Set ssc_enabled for c20 too
      drm/dp: Add the DPCD register required for Extended wake timeout
      drm/display/dp: Define function to setup Extended wake time
      drm/i915/lttpr: Enable Extended Wake Timeout
      drm/dp: Add eDP 1.5 bit definition
      drm/dp: Increase eDP display control capability size
      drm/i915/backlight: Use proper interface based on eDP version
      drm/i915/backlight: Check Luminance based brightness control for VESA
      drm/i915/backlight: Modify function to get VESA brightness in Nits
      drm/i915/backlight: Add function to change brightness in nits for VES=
A
      drm/i915/backlight: Setup nits based luminance via VESA
      drm/i915/backlight: Enable nits based luminance
      drm/i915: Use intel_display wherever possible
      drm/i915/dpll: Change param to intel_display in for_each_shared_dpll
      drm/i915/dpll: Use intel_display for dpll dump and compare hw state
      drm/i915/dpll: Use intel_display possible in shared_dpll_mgr hooks
      drm/i915/dpll: Use intel_display for asserting pll
      drm/i915/dpll: Use intel_display for update_refclk hook
      drm/i915/dpll: Accept intel_display as argument for shared_dpll_init
      drm/i915/dpll: Replace all other leftover drm_i915_private
      drm/i915/hdcp: Create force_hdcp14 debug fs entry
      drm/i915/vdsc: intel_display conversions

Taimur Hassan (8):
      drm/amd/display: 3.2.319
      drm/amd/display: 3.2.320
      drm/amd/display: 3.2.321
      drm/amd/display: [FW Promotion] Release 0.0.255.0
      drm/amd/display: Promote DAL to 3.2.322
      drm/amd/display: Promote DAL to 3.2.323
      drm/amd/display: Promote DAL to 3.2.324
      drm/amd/display: 3.2.325

Tao Zhou (7):
      drm/amdgpu: add RAS CPER ring buffer
      drm/amdgpu: read CPER ring via debugfs
      drm/amdgpu: add data write function for CPER ring
      drm/amdgpu: add mutex lock for cper ring
      drm/amdgpu: increase AMDGPU_MAX_RINGS
      drm/amdgpu: increase RAS bad page threshold
      drm/amdgpu: format old RAS eeprom data into V3 version

Tejas Upadhyay (7):
      drm/xe/mmap: Add mmap support for PCI memory barrier
      drm/xe/client: bo->client does not need bos_lock
      drm/xe: Fix typo in xe_job_ptrs
      drm/xe/wa: Limit char per line to 100
      drm/xe: cancel pending job timer before freeing scheduler
      drm/xe/xe3lpg: Add Wa_13012615864
      drm/xe/uapi: Use hint for guc to set GT frequency

Tejas Vipin (6):
      drm/panel: ebbg-ft8719: transition to mipi_dsi wrapped functions
      drm/panel: xinpeng-xpp055c272: transition to mipi_dsi wrapped functio=
ns
      drm/panel: samsung-s6e88a0-ams452ef01: transition to mipi_dsi
wrapped functions
      drm/panel: sharp-ls060t1sx01: transition to mipi_dsi wrapped function=
s
      drm/panel: visionox-r66451: transition to mipi_dsi wrapped functions
      drm/mipi-dsi: extend "multi" functions and use them in sony-td4353-jd=
i

Thadeu Lima de Souza Cascardo (1):
      drm/amd/display: avoid NPD when ASIC does not support DMUB

Thomas Hellstr=C3=B6m (20):
      drm/ttm: Balance ttm_resource_cursor_init() and ttm_resource_cursor_f=
ini()
      drm/ttm/pool: Restructure the pool allocation code
      MAINTAINERS: Add TTM reviewers
      drm/xe/vm: Validate userptr during gpu vma prefetching
      drm/xe/vm: Fix a misplaced #endif
      drm/xe: Fix fault mode invalidation with unbind
      drm/xe/hmm: Style- and include fixes
      drm/xe/hmm: Don't dereference struct page pointers without notifier l=
ock
      drm/xe/userptr: Unmap userptrs in the mmu notifier
      drm/ttm: Provide a shmem backup implementation
      drm/ttm/pool, drm/ttm/tt: Provide a helper to shrink pages
      drm/ttm: Use fault-injection to test error paths
      drm/ttm: Add a macro to perform LRU iteration
      drm/ttm: Add helpers for shrinking
      drm/xe: Add a shrinker for xe bos
      drm/xe: Increase the XE_PL_TT watermark
      drm/pagemap: Add DRM pagemap
      drm/xe/bo: Introduce xe_bo_put_async
      drm/xe: Add dma_addr res cursor
      drm/xe: Add drm_pagemap ops to SVM

Thomas Zimmermann (58):
      drm/probe-helper: Call connector detect functions in single helper
      drm/ast: Detect wide-screen support before creating modeset pipeline
      drm/ast: Detect DRAM before TX-chip
      drm/ast: Refactor ast_post_gpu() by Gen
      drm/ast: Initialize ASTDP in ast_post_gpu()
      drm/ast: Hide Gens 1 to 3 TX detection in branch
      drm/ast: Align Gen1 DVO detection to register manual
      drm/ast: Merge TX-chip detection code for Gen4 and later
      drm/ast: Only warn about unsupported TX chips on Gen4 and later
      drm/ast: Remove 1152x864 from list of widescreen resolutions
      drm/ast: Align naming in widescreen detection code to manual
      drm/ast: Rename support_wide_screen to support_wsxga_p
      drm/ast: Reorganize widescreen test around hardware Gens
      drm/ast: Add support_fullhd flag to struct ast_device
      drm/ast: Add support_wuxga flag to struct ast_device
      drm/ast: Always validate H/V sync flags
      drm/ast: Find VBIOS mode from regular display size
      drm/ast: Add empty initializer for VBIOS modes
      drm/ast: Add helpers for VBIOS mode lookup
      drm/ast: Validate DRM display modes against VBIOS modes
      drm/ast: Inline ast_get_vbios_mode_info()
      drm/ast: astdp: Rework display-mode setting
      drm/ast: astdp: Look up mode index from table
      drm/ast: Remove struct ast_vbios_mode_info
      drm/ast: Only look up VBIOS mode on full modesets
      drm/ast: astdp: Add connector state
      drm/ast: astdp: Inline mode-index calculation
      drm/ast: astdp: Store mode index in connector state
      drm/ast: astdp: Validate display modes
      Merge drm/drm-next into drm-misc-next
      drm/ast: cursor: Calculate checksum in helper
      drm/ast: cursor: Move format conversion to shared helper
      drm/ast: cursor: Add support for ARGB4444
      drm/ast: cursor: Move implementation to separate source file
      Merge drm/drm-next into drm-misc-next
      drm/{i915, xe}: Suspend/resume fbdev emulation via client interfaces
      drm/client: Add client-hotplug helper
      drm/client: Send pending hotplug events after resume
      drm/i915/display: Remove fbdev suspend and hotplug tracking
      drm/i915/display: fbdev: Move custom restore code to new callback
      drm/i915/display: fbdev: Move custom suspend code to new callback
      drm/i915/display: Remove preferred_bpp from struct intel_fbdev
      drm/i915/display: Remove struct drm_fb_helper from struct intel_fbdev
      drm/i915/display: Move fbdev code around
      drm/{i915,xe}: Run DRM default client setup
      drm/i915/display: Remove compile guard around fbdev debugfs output
      drm/fb-helper: Remove struct drm_fb_helper.fb_probe
      drm/gem: Test for imported GEM buffers with helper
      drm/gem-dma: Test for imported buffers with drm_gem_is_imported()
      drm/gem-dma: Use dma_buf from GEM object instance
      drm/gem-shmem: Test for imported buffers with drm_gem_is_imported()
      drm/gem-shmem: Use dma_buf from GEM object instance
      drm/gem-framebuffer: Test for imported buffers with drm_gem_is_import=
ed()
      drm/gem-framebuffer: Use dma_buf from GEM object instance
      drm/fb-dma-helper: Test for imported buffers with drm_gem_is_imported=
()
      drm/mipi-dbi: Test for imported buffers with drm_gem_is_imported()
      drm/prime: Use dma_buf from GEM object instance
      drm/appletbdrm: Fix ref-counting on dmadev

Thorsten Blum (1):
      drm/gma500: Replace deprecated strncpy() with strscpy()

Tim Huang (8):
      drm/amdgpu: add support for GC IP version 11.5.3
      drm/amdgpu: add support for SDMA IP version 6.1.3
      drm/amdgpu: add support for NBIO IP version 7.11.2
      drm/amdgpu: add support for MMHUB IP version 3.3.2
      drm/amdgpu: enable VCN/JPEG CGPG for GC IP version 11.5.3
      drm/amdgpu: add support for SMU IP version 14.0.5
      drm/amdgpu: add support for PSP IP version 14.0.5
      drm/amdgpu: add discovery support for DCN IP version 3.6.0

Timur Tabi (1):
      drm/nouveau: fix kernel-doc comments

Tom Chung (4):
      drm/amd/display: Initial psr_version with correct setting
      drm/amd/display: Disable PSR-SU on some OLED panel
      drm/amd/display: Revert "Disable PSR-SU on some OLED panel"
      drm/amd/display: Disable PSR-SU on eDP panels

Tom St Denis (1):
      drm/amd/amdgpu: Add missing GC 11.5.0 register

Tomasz Paku=C5=82a (1):
      drm/amdgpu/pm: Handle SCLK offset correctly in overdrive for smu 14.0=
.2

Tomasz Rusinowicz (2):
      accel/ivpu: Enable recovery and adjust timeouts for fpga
      accel/ivpu: Allow to import single buffer into multiple contexts

Tomi Valkeinen (3):
      drm: xlnx: zynqmp_dpsub: Fix kernel doc
      MAINTAINERS: Update drm/rcar-du maintainers
      drm: xlnx: zynqmp: Fix max dma segment size

Tony Yi (2):
      drm/amdgpu: Update headers for CPER support on SRIOV
      drm/amdgpu: Add support for CPERs on virtualization

Tvrtko Ursulin (23):
      dma-fence: Add a single fence fast path for fence merging
      dma-fence: Add some more fence-merge-unwrap tests
      drm/sched: Delete unused update_job_credits
      drm/sched: Remove weak paused submission checks
      drm/sched: Add helper to check job dependencies
      drm/imagination: Use the drm_sched_job_has_dependency helper
      Merge drm/drm-next into drm-intel-gt-next
      drm/scheduler: Remove some unused prototypes
      drm/sched: Add internal job peek/pop API
      drm/amdgpu: Pop jobs from the queue more robustly
      drm/sched: Remove a hole from struct drm_sched_job
      drm/sched: Move drm_sched_entity_is_ready to internal header
      drm/sched: Move internal prototypes to internal header
      drm/sched: Group exported prototypes by object type
      drm/xe: Fix GT "for each engine" workarounds
      drm/xe/xelp: Move Wa_16011163337 from tunings to workarounds
      drm/xe/xelp: Add Wa_1604555607
      drm/xe/xelp: L3 recommended hashing mask
      drm/xe: Add performance tunings to debugfs
      drm/xe: Fix MOCS debugfs LNCF readout
      drm/xe: Fix ring flush invalidation
      drm/xe: Pass flags directly to emit_flush_imm_ggtt
      drm/xe: Use correct type width for alignment in fb pinning code

Umesh Nerlige Ramappa (3):
      drm/i915/pmu: Fix zero delta busyness issue
      drm/xe/oa: Ensure that polled read returns latest data
      drm/xe/oa: Allow oa_exponent value of 0

Uwe Kleine-K=C3=B6nig (1):
      drm/bridge: ti-sn65dsi86: Check for CONFIG_PWM using IS_REACHABLE()

Victor Lu (3):
      drm/amdgpu: Do not program AGP BAR regs under SRIOV in gfxhub_v1_0.c
      drm/amdgpu: Do not write to GRBM_CNTL if Aldebaran SRIOV
      drm/amdgpu: Do not set power brake sequence for Aldebaran SRIOV

Victor Skvortsov (2):
      drm/amdgpu: Skip err_count sysfs creation on VF unsupported RAS block=
s
      drm/amdgpu: Skip pcie_replay_count sysfs creation for VF

Vignesh Raman (4):
      drm/ci: uprev IGT
      drm/ci: uprev mesa
      drm/ci: update gitlab rules
      drm/ci: update expectation files

Ville Syrj=C3=A4l=C3=A4 (142):
      drm/i915/scaler: Extract skl_scaler_min_src_size()
      drm/i915/scaler: Extract skl_scaler_max_src_size()
      drm/i915/scaler: Extract skl_scaler_min_dst_size()
      drm/i915/scaler: Extract skl_scaler_max_dst_size()
      drm/i915/scaler: Nuke redundant code
      drm/i915/scaler: Pimp scaler debugs
      drm/i915/scaler: s/excdeed/exceed/
      drm/i915/scaler: Add scaler tracepoints
      drm/i915/fb: Relax clear color alignment to 64 bytes
      drm/i915/fb: Add debug spew for misaligned CC plane
      drm/i915/fb: Check that the clear color fits within the BO
      drm/i915: Extract intel_crtc_vblank_delay()
      drm/i915: Check vblank delay validity
      drm/i915: Fix include order
      drm/i915: Introduce intel_vrr_{vmin,vmax}_vtotal()
      drm/i915: Move framestart/etc. state dump to a better spot
      drm/i915: Include the vblank delay in the state dump
      drm/i915/vrr: Improve VRR state dump
      drm/i915: Include the scanline offset in the state dump
      drm/i915: Extract intel_mode_vblank_delay()
      drm/i915: Consolidate intel_pre_commit_crtc_state()
      drm/i915: Extract intel_crtc_active_timings()
      drm/i915/vrr: Introduce intel_vrr_vblank_delay()
      drm/i915/vrr: Drop the extra vmin adjustment for ADL+
      drm/i915/vrr: Fix vmin/vmax/flipline on TGL when using vblank delay
      drm/i915/vrr: Add extra vblank delay to estimates
      drm/i915/vrr: Plumb the DSB into intel_vrr_send_push()
      drm/i915: Allow async flips with render compression on TGL+
      drm/i915: Allow async flips with compression on ICL
      drm/i915: Introduce plane->can_async_flip()
      drm/i915: Use plane->can_async_flip() for alignment exceptions
      drm/i915: Reuse vlv_primary_min_alignment() for sprites as well
      drm/i915: Disable scanout VT-d workaround for TGL+
      drm/i915: Nuke ADL pre-production Wa_22011186057
      drm/i915: Relocate xe AUX hack
      drm/i915: Carve up skl_get_plane_caps()
      drm/i915: Keep TRANS_VBLANK.vblank_start=3D=3D0 on ADL+ even when
doing LRR updates
      drm/i915: Handle interlaced modes in intel_set_transcoder_timings_lrr=
()
      drm/i915: Update TRANS_SET_CONTEXT_LATENCY during LRR updates
      drm/i915: Warn if someone tries to use
intel_set_transcoder_timings*() on DSI outputs
      drm/i915: Extract lrr_params_changed()
      drm/i915: Allow fastboot to fix up the vblank delay
      drm/i915/dsb: Add support for triggering VRR push with DSB
      drm/i915/dsb: Allow DSB to perform commits when VRR is enabled
      drm/i915: Drop 64bpp YUV formats from ICL+ SDR planes
      drm/i915: Drop the extra "plane" from tracepoints
      drm/i915: Pass the plane state explicitly to tracepoints
      drm/i915: Include pixel format in plane tracepoints
      drm/i915: Give i915 and xe each their own display tracepoints
      drm/i915: Move VT-d alignment into plane->min_alignment()
      drm/i915: Use more optimal VTd alignment for planes
      drm/i915: Calculate the VT-d guard size in the display code
      drm/i915: Use per-plane VT-d guard numbers
      drm/i915/fbdev: Use fb->normal_view.gtt
      drm/i915: Pass intel_display to intel_scanout_needs_vtd_wa()
      drm/i915: Decouple i915_gem_dumb_create() from the display a bit
      drm/i915: Decouple intel_fb_bo.h interfaces from driver specific type=
s
      drm/i915: Convert intel_crtc.c to struct intel_display
      drm/i915: Convert intel_fb.c to struct intel_display
      drm/i915: Convert intel_display_power_{get,put}*() to intel_display
      drm/i915: Convert i9xx_plane.c to struct intel_display
      drm/i915: Finish intel_sprite.c struct intel_display conversion
      drm/i915: Convert intel_cursor.c to struct intel_display
      drm/i915: Convert skl_univeral_plane.c to struct intel_display
      drm/i915: Use DRM_RECT_FMT & co. for plane debugs
      drm/i915: Pimp plane debugs
      drm/i915: Fix CONFIG_DRM_I915_DEBUG_RUNTIME_PM=3Dn build
      drm/i915: Continue intel_display_power struct intel_display conversio=
n
      drm/i915/dsb: Move the +1 usec adjustment into dsb_wait_usec()
      drm/i915/vrr: Don't send push for legacy cursor updates
      drm/i915/vrr: Account for TRANS_PUSH delay
      drm/i915/dsb: Compute use_dsb earlier
      drm/i915/dsb: Introduce intel_dsb_poll()
      drm/i915/vrr: Reorder the DSB "wait for safe window" vs. TRANS_PUSH
      drm/i915/vrr: Check that the push send bit is clear after delayed vbl=
ank
      drm/i915/dsb: Decode DSB error interrupts
      drm/i915: Make sure all planes in use by the joiner have their
crtc included
      Revert "drm/i915: Fix NULL ptr deref by checking new_crtc_state"
      drm/i915: Rework joiner and Y plane dependency handling
      drm/i915: s/planar_slave/is_y_plane/
      drm/i915: Extract unlink_nv12_plane()
      drm/i915: Remove pointless visible check in unlink_nv12_plane()
      drm/i915: Extract link_nv12_planes()
      drm/i915: Rename the variables in icl_check_nv12_planes()
      drm/i915: Move icl+ nv12 plane register mangling into
skl_universal_plane.c
      drm/i915: Relocate intel_atomic_check_planes()
      drm/i915: Move modeset_retry stuff into intel_connector.c
      drm/i915: Always initialize connector->modeset_retry_work
      drm/i915: Extract intel_connector_cancel_modeset_retry_work()
      drm/i915: Extract intel_hdcp_cancel_works()
      drm/i915: Move intel_hpd_poll_fini() into intel_hotplug.c
      drm/i915: Move intel_plane_destroy() into intel_atomic_plane.c
      drm/i915: Relocate vlv_wait_port_ready()
      drm/i915: Simplify vlv_wait_port_ready() arguments
      drm/i915: Relocate intel_plane_uses_fence()
      drm/i915: Relocate intel_{rotation,remapped}_info_size()
      drm/i915: Relocate some other plane fb related stuff into intel_fb.c
      drm/i915: s/state/plane_state/
      drm/i915: Add missing else to the if ladder in missing else
      drm/i915: Introduce a minimal plane error state
      drm/i915: Pimp display fault reporting
      drm/i915: Hook in display GTT faults for IVB/HSW
      drm/i915: Hook in display GTT faults for ILK/SNB
      drm/i915: Introduce i915_error_regs
      drm/i915: Un-invert {i9xx,i965}_error_mask()
      drm/i915: Hook up display fault interrupts for VLV/CHV
      drm/i915: Fix pipeDMC and ATS fault handling
      drm/i915/dsb: Allow DSB based updates without planes
      drm/i915/dsb: Plumb dsb into plane scaler functions
      drm/i915/dsb: Allow DSB based commits when scalers are in use
      drm/i915: Bump RING_FAULT engine ID bits
      drm/i915: Relocate RING_FAULT bits
      drm/i915: Use REG_BIT() & co. for ring fault registers
      drm/i915: Document which RING_FAULT bits apply to which platforms
      drm/i915: Introduce RING_FAULT_VADDR_MASK
      drm/i915: Extract gen8_report_fault()
      drm/i915: Use REG_BIT() & co. for CHV EU/slice fuse bits
      drm/i915: Reoder CHV EU/slice fuse bits
      drm/i915: Use REG_BIT() & co. for BDW+ EU/slice fuse bits
      drm/i915: Reoder BDW+ EU/slice fuse bits
      drm/i915: Use REG_BIT() & co. for gen9+ timestamp freq registers
      drm/i915: Reoder gen9+ timestamp freq register bits
      drm/i915/cdclk: Do cdclk post plane programming later
      drm/i915: Program CURSOR_PROGRAM and COEFF_POLARITY for icl+ combo PH=
Ys
      drm/i915: Drop redundant shared_dpll=3DNULL assignments
      drm/i915: Don't clobber crtc_state->cpu_transcoder for inactive crtcs
      drm/i915: Use intel_plane_set_invisible() in
intel_plane_disable_noatomic()
      drm/i915: Extract intel_cdclk_crtc_disable_noatomic()
      drm/i915: Extract skl_wm_crtc_disable_noatomic()
      drm/i915: clean up pipe's ddb usage in intel_crtc_disable_noatomic()
      drm/i915: Add skl_wm_plane_disable_noatomic()
      drm/i915: Extract intel_bw_crtc_disable_noatomic()
      drm/i915: Extract intel_cdclk_update_hw_state()
      drm/i915: Extract intel_bw_update_hw_state()
      drm/i915: Update bw_state->active_pipes during readout
      drm/i915: Skip some bw_state readout on pre-icl
      sem/i915: Simplify intel_cdclk_update_hw_state()
      drm/i915: Simplify cdclk_disable_noatomic()
      drm/i915: Split wm sanitize from readout
      drm/i915: Do wm readout ealier for skl+
      drm/i915: Move dbuf_state->active_pipes into skl_wm_get_hw_state()
      drm/i915: Relocate intel_bw_crtc_update()

Vinay Belgaumkar (5):
      drm/xe: Add locks in gtidle code
      drm/xe/ptl: Apply Wa_13011645652
      drm/xe/pmu: Enable PMU interface
      drm/xe/pmu: Add GT C6 events
      drm/i915/slpc: Add sysfs for SLPC power profiles

Vinod Govindapillai (9):
      drm/i915/fbc: remove one duplicate forward declaration
      drm/damage-helper: add const qualifier in
drm_atomic_helper_damage_merged()
      drm/i915/display: update and store the plane damage clips
      drm/i915/fbc: add register definitions for fbc dirty rect support
      drm/i915/fbc: introduce HAS_FBC_DIRTY_RECT() for FBC dirty rect suppo=
rt
      drm/i915/fbc: avoid calling fbc activate if fbc is active
      drm/i915/fbc: dirty rect support for FBC
      drm/i915/fbc: disable FBC if PSR2 selective fetch is enabled
      drm/i915/fbc: handle dirty rect coords for the first frame

Vitalii Mordan (1):
      gpu: cdns-mhdp8546: fix call balance of mhdp->clk handling routines

Vitaliy Shevtsov (1):
      drm/amd/display: fix type mismatch in CalculateDynamicMetadataParamet=
ers()

Vivek Kasireddy (3):
      drm/virtio: Fix UAF in virtgpu_dma_buf_free_obj()
      drm/virtio: Lock the VGA resources during initialization
      drm/virtio: Don't return error if virtio-gpu PCI dev is not found

Wayne Lin (14):
      drm/dp_mst: Fix drm RAD print
      drm/dp_mst: Add helper to get port number at specific LCT from RAD
      drm/amd/display: Add dcn36 register header files
      drm/amd/display: Add DCN36 version identifiers
      drm/amd/display: Add DCN36 BIOS command table support
      drm/amd/display: Add DCN36 IRQ
      drm/amd/display: Add DCN36 Resource
      drm/amd/display: Add DCN36 GPIO
      drm/amd/display: Add DCN36 DML2 support
      drm/amd/display: Add DCN36 DMCUB
      drm/amd/display: Support DCN36 DSC
      drm/amd/display: Support DCN36 HDCP
      drm/amd/display: Add DCN36 CORE
      drm/amd/display: Add DCN36 DM Support

Wentao Liang (2):
      drm/amdgpu: handle amdgpu_cgs_create_device() errors in
amd_powerplay_create()
      drm/amdgpu/gfx12: correct cleanup of 'me' field with gfx_v12_0_me_fin=
i()

Xiang Liu (15):
      drm/amdgpu: Get timestamp from system time
      drm/amdgpu: Commit CPER entry
      drm/amdgpu: Generate bad page threshold cper records
      drm/amdgpu: Check aca enabled inside cper init/fini func
      drm/amdgpu: Remove redundant check of adev
      drm/amdgpu: Check if CPER enabled when generating CPER
      drm/amdgpu: Set CPER enabled flag after ring initiailized
      drm/amdgpu: Disable fru_id field in CPER section
      drm/amdgpu: Report generic instead of unknown boot time errors
      drm/amdgpu: Decode deferred error type in aca bank parser
      drm/amdgpu: Free CPER entry after committing to ring
      drm/amdgpu: Use unique CPER record id across devices
      drm/amdgpu: Enable ACA by default for psp v13_0_6/v13_0_14
      drm/amdgpu: Fix computation for remain size of CPER ring
      drm/amdgpu: Decode deferred error type in gfx aca bank parser

Xiaogang Chen (3):
      drm/amdkfd: Have kfd driver use same PASID values from graphic driver
      drm/amdkfd: Fix pasid value leak
      drm/amdkfd: remove kfd_pasid.c from amdgpu driver build

Xin Wang (1):
      drm/xe/debugfs: fixed the return value of wedged_mode_set

Yan Li (1):
      drm/amd/display: Support "Broadcast RGB" drm property

Yang Wang (1):
      drm/amdgpu: refine smu send msg debug log format

Yifan Zha (2):
      drm/amd/pm: Update smu_v13_0_0 SRIOV VF flag in msg mapping table
      drm/amd/amdkfd: Evict all queues even HWS remove queue failed

Yihan Zhu (1):
      drm/amd/display: handle max_downscale_src_width fail check

Yilin Chen (2):
      drm/amd/display: add a quirk to enable eDP0 on DP1
      drm/amd/display: Fix message for support_edp0_on_dp1

Ying Li (2):
      drm/amd/pm: add support for IP version 11.5.2
      drm/amd/amdgpu: add support for IP version 11.5.2

Youssef Samir (4):
      accel/qaic: Change aic100_image_table definition
      accel/qaic: Allocate an exact number of MSIs
      accel/qaic: Add support for MSI-X
      accel/qaic: Mask out SR-IOV PCI resources

Yuichiro Tsuji (1):
      drm/i915/gt/uc: Fix typo in a comment

Zaeem Mohamed (2):
      drm/amd/display: Expose 3 secondary planes for supported ASICs
      drm/amd/display: docstring definitions MAX_SURFACES and MAX_PLANES

Zhaoyu Liu (1):
      drm/ttm: use ttm_resource_unevictable() to replace pin_count and swap=
ped

Zhenyu Wang (1):
      MAINTAINERS: switch my mail address for GVT driver

Zhi Wang (15):
      drm/nouveau: add a kernel doc to introduce the GSP RPC
      drm/nouveau: rename "repc" to "gsp_rpc_len" on the GSP message recv p=
ath
      drm/nouveau: rename "argv" to what it represents on the GSP
message send path
      drm/nouveau: remove unused param repc in *rm_alloc_push()
      drm/nouveau: rename "argv" to what it represents in *rm_{alloc, ctrl}=
_*()
      drm/nouveau: rename "argc" to what it represents in GSP RPC routines
      drm/nouveau: fix the broken marco GSP_MSG_MAX_SIZE
      drm/nouveau: remove the magic number in r535_gsp_rpc_push()
      drm/nouveau: refine the variable names in r535_gsp_rpc_push()
      drm/nouveau: refine the variable names in r535_gsp_msg_recv()
      drm/nouveau: rename the variable "cmd" to "msg" in
r535_gsp_cmdq_{get, push}()
      drm/nouveau: factor out r535_gsp_msgq_peek()
      drm/nouveau: factor out r535_gsp_msgq_recv_one_elem()
      drm/nouveau: support handling the return of large GSP message
      drm/nouveau: consume the return of large GSP message

Zhikai Zhai (2):
      drm/amd/display: Update Cursor request mode to the beginning
prefetch always
      drm/amd/display: calculate the remain segments for all pipes

Zhongwei Zhang (1):
      drm/amd/display: Correct timing_adjust_pending flag setting.

chr[] (1):
      amdgpu/pm/legacy: fix suspend/resume issues

ganglxie (4):
      drm/amdgpu: Save nps to eeprom
      drm/amdgpu: Refine bad page adding
      drm/amdgpu: Change page/record number calculation based on nps
      drm/amdgpu: Save PA of bad pages for old asics

luoqing (1):
      selftests: i915: Use struct_size() helper in kmalloc()

 .mailmap                                           |    12 +-
 CREDITS                                            |     4 +
 .../ABI/testing/sysfs-driver-intel-xe-hwmon        |    16 +
 .../display/apple,h7-display-pipe-mipi.yaml        |    83 +
 .../bindings/display/apple,h7-display-pipe.yaml    |    88 +
 .../bindings/display/bridge/ti,sn65dsi83.yaml      |     3 +
 .../bindings/display/mediatek/mediatek,dpi.yaml    |     7 +
 .../bindings/display/mediatek/mediatek,dsc.yaml    |     3 +
 .../bindings/display/msm/dsi-controller-main.yaml  |    70 +-
 .../bindings/display/msm/dsi-phy-common.yaml       |     2 +
 .../devicetree/bindings/display/msm/gmu.yaml       |     1 +
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |    32 +-
 .../bindings/display/msm/qcom,sm8550-mdss.yaml     |    14 +-
 .../bindings/display/msm/qcom,sm8650-mdss.yaml     |    13 +-
 .../bindings/display/panel/apple,summit.yaml       |    58 +
 .../bindings/display/panel/himax,hx83102.yaml      |     6 +
 .../panel/panel-simple-lvds-dual-ports.yaml        |     2 +
 .../bindings/display/panel/panel-simple.yaml       |     2 +
 .../bindings/display/panel/raydium,rm67200.yaml    |    72 +
 .../bindings/display/panel/visionox,rm692e5.yaml   |    77 +
 .../devicetree/bindings/display/renesas,du.yaml    |    36 +-
 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml       |     3 +-
 .../bindings/display/rockchip/rockchip-vop2.yaml   |   115 +-
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |     1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |     2 +
 Documentation/gpu/amdgpu/amdgpu-glossary.rst       |    45 +-
 Documentation/gpu/amdgpu/display/dc-glossary.rst   |     6 -
 Documentation/gpu/drivers.rst                      |     2 +
 Documentation/gpu/drm-internals.rst                |     7 +
 Documentation/gpu/drm-uapi.rst                     |   116 +-
 Documentation/gpu/drm-usage-stats.rst              |     5 +-
 Documentation/gpu/nouveau.rst                      |    29 +
 Documentation/gpu/nova/core/guidelines.rst         |    24 +
 Documentation/gpu/nova/core/todo.rst               |   446 +
 Documentation/gpu/nova/guidelines.rst              |    69 +
 Documentation/gpu/nova/index.rst                   |    30 +
 Documentation/gpu/panthor.rst                      |    10 +
 Documentation/gpu/rfc/gpusvm.rst                   |   112 +
 Documentation/gpu/rfc/index.rst                    |     4 +
 Kbuild                                             |     1 +
 MAINTAINERS                                        |    74 +-
 arch/arm/configs/multi_v7_defconfig                |     4 +-
 arch/parisc/configs/generic-32bit_defconfig        |     4 +-
 arch/parisc/configs/generic-64bit_defconfig        |     4 +-
 drivers/accel/amdxdna/aie2_ctx.c                   |    73 +-
 drivers/accel/amdxdna/aie2_error.c                 |     8 +-
 drivers/accel/amdxdna/aie2_message.c               |    10 +-
 drivers/accel/amdxdna/aie2_pci.h                   |    10 +-
 drivers/accel/amdxdna/aie2_smu.c                   |     2 +
 drivers/accel/amdxdna/amdxdna_ctx.c                |     2 +
 drivers/accel/amdxdna/amdxdna_ctx.h                |     3 +
 drivers/accel/amdxdna/amdxdna_mailbox.c            |    23 +-
 drivers/accel/amdxdna/amdxdna_mailbox.h            |     2 +-
 drivers/accel/amdxdna/amdxdna_mailbox_helper.c     |     6 +-
 drivers/accel/amdxdna/amdxdna_mailbox_helper.h     |     2 +-
 drivers/accel/ivpu/ivpu_debugfs.c                  |    89 +
 drivers/accel/ivpu/ivpu_drv.c                      |    90 +-
 drivers/accel/ivpu/ivpu_drv.h                      |    14 +-
 drivers/accel/ivpu/ivpu_fw.c                       |     9 +-
 drivers/accel/ivpu/ivpu_gem.c                      |    43 +
 drivers/accel/ivpu/ivpu_gem.h                      |     1 +
 drivers/accel/ivpu/ivpu_hw.c                       |   110 +-
 drivers/accel/ivpu/ivpu_hw.h                       |    14 +-
 drivers/accel/ivpu/ivpu_hw_btrs.c                  |    10 +-
 drivers/accel/ivpu/ivpu_hw_btrs.h                  |     1 +
 drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h          |     1 +
 drivers/accel/ivpu/ivpu_hw_ip.c                    |     4 +-
 drivers/accel/ivpu/ivpu_hw_reg_io.h                |    62 +-
 drivers/accel/ivpu/ivpu_ipc.c                      |     7 +-
 drivers/accel/ivpu/ivpu_ipc.h                      |     2 +-
 drivers/accel/ivpu/ivpu_job.c                      |   522 +-
 drivers/accel/ivpu/ivpu_job.h                      |     8 +-
 drivers/accel/ivpu/ivpu_jsm_msg.c                  |    29 +-
 drivers/accel/ivpu/ivpu_mmu.c                      |   121 +-
 drivers/accel/ivpu/ivpu_mmu.h                      |     2 +
 drivers/accel/ivpu/ivpu_mmu_context.c              |    13 -
 drivers/accel/ivpu/ivpu_mmu_context.h              |     2 -
 drivers/accel/ivpu/ivpu_pm.c                       |    10 +-
 drivers/accel/ivpu/ivpu_pm.h                       |     2 +-
 drivers/accel/ivpu/ivpu_sysfs.c                    |    35 +-
 drivers/accel/qaic/mhi_controller.c                |   360 +-
 drivers/accel/qaic/mhi_controller.h                |     2 +-
 drivers/accel/qaic/qaic.h                          |    14 +-
 drivers/accel/qaic/qaic_drv.c                      |    97 +-
 drivers/accel/qaic/qaic_timesync.c                 |     2 +-
 drivers/accel/qaic/sahara.c                        |    43 +-
 drivers/base/component.c                           |    17 +
 drivers/base/devres.c                              |    12 +-
 drivers/bus/mhi/host/boot.c                        |   203 +-
 drivers/bus/mhi/host/init.c                        |     2 +-
 drivers/bus/mhi/host/internal.h                    |     7 +
 drivers/dma-buf/dma-fence-unwrap.c                 |    11 +-
 drivers/dma-buf/st-dma-fence-unwrap.c              |   268 +-
 drivers/gpu/Makefile                               |     1 +
 drivers/gpu/drm/Kconfig                            |    24 +-
 drivers/gpu/drm/Makefile                           |    22 +-
 drivers/gpu/drm/adp/Kconfig                        |    17 +
 drivers/gpu/drm/adp/Makefile                       |     5 +
 drivers/gpu/drm/adp/adp-mipi.c                     |   276 +
 drivers/gpu/drm/adp/adp_drv.c                      |   612 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |    70 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h            |    28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    15 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |     3 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |     5 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c    |    18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |    37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h |     7 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c |     7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |    44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |     7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   124 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |    44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h       |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |    20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |     8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |   581 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h           |   105 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |     4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   289 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   196 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    51 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |    25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   140 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c            |    19 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |    65 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h            |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h             |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    69 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |    84 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |    16 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |     8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    87 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   308 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   105 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |    21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   128 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   201 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |    19 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |    44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h           |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |    32 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |    42 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |     7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |   465 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   486 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    57 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   169 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |    25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |     5 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |     1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   108 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |    70 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |    40 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |     8 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |     2 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.h           |     2 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |     2 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                |     4 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/cikd.h                  |     9 +
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                 |     4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   162 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    16 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   104 +-
 .../gpu/drm/amd/amdgpu/gfx_v10_0_cleaner_shader.h  |    35 +
 .../drm/amd/amdgpu/gfx_v10_1_10_cleaner_shader.asm |   126 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   109 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |    97 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |    21 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    10 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    24 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c              |     1 -
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   122 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |    10 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |    22 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |    37 -
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |     9 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |    27 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |     8 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    93 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |     1 -
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |     1 -
 drivers/gpu/drm/amd/amdgpu/hdp_v5_2.c              |     1 -
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c              |     1 -
 drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c              |     1 -
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            |     4 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |     6 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |     6 +-
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |     6 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |     1 +
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c            |    57 +-
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.h            |     4 +-
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            |    54 +-
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.h            |     5 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |    43 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   148 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |    43 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |    47 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   346 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h           |     1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |    31 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |    28 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |   255 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.h           |    74 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    86 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |    56 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |    25 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |    31 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c            |     1 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |    31 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |    14 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |     2 +
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c           |    47 -
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h           |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c             |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |     1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |     1 -
 drivers/gpu/drm/amd/amdgpu/nv.c                    |    43 +-
 drivers/gpu/drm/amd/amdgpu/nvd.h                   |   208 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |     1 +
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |    10 +
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |     8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    10 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   264 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |     8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |     8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |     7 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |    76 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |     6 +-
 drivers/gpu/drm/amd/amdgpu/si_enums.h              |    12 -
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 |     6 +-
 drivers/gpu/drm/amd/amdgpu/sid.h                   |   369 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    36 +-
 drivers/gpu/drm/amd/amdgpu/soc15d.h                |   139 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    46 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |     7 +-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |     1 +
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |     1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |    10 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |     7 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |     8 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |    10 +-
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |    10 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |    10 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   201 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   221 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  1175 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   663 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   693 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   643 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.h            |     9 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   686 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |   610 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |   605 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.h            |     3 +
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/vega10_sdma_pkt_open.h  |    70 +
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |    49 +-
 drivers/gpu/drm/amd/amdkfd/Makefile                |     1 -
 drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c   |    18 +-
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |   703 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm |    82 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    38 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    28 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |    26 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    20 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   339 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |    18 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_cik.c  |    75 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v10.c  |    45 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v11.c  |    47 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v12.c  |    47 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |    45 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_vi.c   |    83 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |    43 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |    27 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |    38 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |    88 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c |     7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pasid.c             |    70 -
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    45 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   154 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |    41 +-
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |    12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    62 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    71 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |    18 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   400 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    31 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |     2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |    44 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    16 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |    78 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.h  |     6 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |     9 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    22 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |     2 +-
 drivers/gpu/drm/amd/display/dc/basics/dc_common.c  |     3 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    15 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |    56 +-
 .../drm/amd/display/dc/bios/command_table_helper.c |   104 +
 .../drm/amd/display/dc/bios/command_table_helper.h |     8 +
 .../amd/display/dc/bios/command_table_helper2.c    |     4 +-
 .../dc/bios/dce110/command_table_helper_dce110.c   |   104 -
 .../dc/bios/dce112/command_table_helper2_dce112.c  |   106 +-
 .../dc/bios/dce112/command_table_helper_dce112.c   |   104 -
 .../dc/bios/dce60/command_table_helper_dce60.c     |   104 -
 .../dc/bios/dce80/command_table_helper_dce80.c     |   104 -
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |    22 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    15 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |    50 +-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |     2 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   193 +-
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |   120 -
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    78 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |    27 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |    15 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   311 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |     3 +-
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |    31 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    38 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   139 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |     2 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    97 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |     2 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |     5 +-
 drivers/gpu/drm/amd/display/dc/dc_plane.h          |     4 +-
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |     1 -
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    12 -
 drivers/gpu/drm/amd/display/dc/dc_types.h          |     9 +-
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.h |    94 +-
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |    26 +-
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.h   |    41 +-
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |     3 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |    15 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |     4 +
 .../drm/amd/display/dc/dce110/dce110_compressor.c  |    13 -
 .../drm/amd/display/dc/dce110/dce110_compressor.h  |     2 -
 .../drm/amd/display/dc/dce60/dce60_hw_sequencer.c  |     1 +
 .../amd/display/dc/dce60/dce60_timing_generator.c  |     1 +
 .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |     7 +-
 .../display/dc/dio/dcn10/dcn10_stream_encoder.c    |     3 +-
 .../dc/dio/dcn30/dcn30_dio_stream_encoder.c        |     2 +-
 .../dc/dio/dcn30/dcn30_dio_stream_encoder.h        |     6 +-
 .../display/dc/dio/dcn35/dcn35_dio_link_encoder.c  |    50 +-
 .../display/dc/dio/dcn35/dcn35_dio_link_encoder.h  |    23 +
 .../dc/dio/dcn401/dcn401_dio_stream_encoder.c      |    17 +-
 .../dc/dio/dcn401/dcn401_dio_stream_encoder.h      |    23 +
 drivers/gpu/drm/amd/display/dc/dm_services.h       |     7 +
 drivers/gpu/drm/amd/display/dc/dm_services_types.h |    26 +
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |    76 -
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h   |     3 -
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |    12 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |     3 +
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |     1 +
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |     4 +-
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |     1 +
 .../amd/display/dc/dml/display_rq_dlg_helpers.c    |    11 -
 .../amd/display/dc/dml/display_rq_dlg_helpers.h    |     1 -
 .../drm/amd/display/dc/dml2/display_mode_core.c    |     2 +
 .../display/dc/dml2/display_mode_core_structs.h    |     1 +
 .../drm/amd/display/dc/dml2/dml21/dml21_utils.c    |     1 -
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |    14 +
 .../amd/display/dc/dml2/dml21/inc/dml_top_types.h  |    10 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c   |    33 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.h   |     3 -
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   134 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_shared.c | 12413 ----
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |    14 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.c  |     3 +-
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c   |     4 +-
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h   |     2 -
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c  |     2 +-
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |    20 +
 .../dml2/dml21/src/dml2_top/dml2_top_interfaces.c  |     1 -
 .../dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c    |     8 -
 .../display/dc/dml2/dml21/src/dml2_top/dml_top.c   |   354 -
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.c |     5 -
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.h |     6 +-
 .../dml21/src/inc/dml2_internal_shared_types.h     |     6 -
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |    26 -
 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c  |     1 +
 .../amd/display/dc/dml2/dml2_translation_helper.c  |     6 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |    10 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |     1 +
 .../gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp.h   |     1 -
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |    11 +-
 .../gpu/drm/amd/display/dc/dpp/dcn32/dcn32_dpp.h   |     1 -
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h |   148 +-
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c |    19 +-
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.h |     7 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |     1 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |     1 +
 .../dc/hpo/dcn31/dcn31_hpo_dp_link_encoder.c       |    10 +-
 .../dc/hpo/dcn31/dcn31_hpo_dp_link_encoder.h       |     6 +
 .../dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.c     |     3 +-
 .../dc/hpo/dcn32/dcn32_hpo_dp_link_encoder.c       |     2 +-
 .../dc/hpo/dcn32/dcn32_hpo_dp_link_encoder.h       |     4 +
 .../drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.c |    18 -
 .../drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h |     3 -
 .../drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.c |    14 +-
 .../drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.h |    16 +
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h |     5 +-
 .../gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c |     2 +-
 .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.c |     2 +-
 .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.h |     1 +
 .../gpu/drm/amd/display/dc/hwss/dce/dce_hwseq.h    |     9 +
 .../drm/amd/display/dc/hwss/dce100/dce100_hwseq.c  |    30 +
 .../drm/amd/display/dc/hwss/dce100/dce100_hwseq.h  |     4 +
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |    23 +-
 .../drm/amd/display/dc/hwss/dce120/dce120_hwseq.c  |     2 +
 .../drm/amd/display/dc/hwss/dce80/dce80_hwseq.c    |     1 +
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   109 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.h    |     4 +
 .../gpu/drm/amd/display/dc/hwss/dcn10/dcn10_init.c |     1 +
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |    30 +-
 .../gpu/drm/amd/display/dc/hwss/dcn20/dcn20_init.c |     1 +
 .../drm/amd/display/dc/hwss/dcn201/dcn201_init.c   |     1 +
 .../gpu/drm/amd/display/dc/hwss/dcn21/dcn21_init.c |     1 +
 .../gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c |     1 +
 .../drm/amd/display/dc/hwss/dcn301/dcn301_init.c   |     1 +
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |    12 +-
 .../gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c |     1 +
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |     1 +
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |     5 +-
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |     1 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |     3 +-
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |     1 +
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |     1 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |    99 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |     7 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |     3 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |    12 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     7 +-
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |     1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |     6 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h       |    30 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    30 +
 drivers/gpu/drm/amd/display/dc/inc/hw/transform.h  |     2 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h          |     4 +-
 drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h  |     5 -
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |     8 +-
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |     9 +
 .../amd/display/dc/irq/dcn36/irq_service_dcn36.c   |   408 +
 .../amd/display/dc/irq/dcn36/irq_service_dcn36.h   |    12 +
 drivers/gpu/drm/amd/display/dc/irq_types.h         |     1 +
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |    71 +-
 .../link/hwss/link_hwss_dio_fixed_vs_pe_retimer.c  |     5 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dpia.c  |    60 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |     5 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |    32 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |     1 -
 .../display/dc/link/protocols/link_dp_capability.c |   141 +-
 .../display/dc/link/protocols/link_dp_capability.h |     1 +
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |   211 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |    28 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |    43 +-
 .../amd/display/dc/link/protocols/link_dp_phy.c    |    24 +-
 .../amd/display/dc/link/protocols/link_dp_phy.h    |     3 +-
 .../display/dc/link/protocols/link_dp_training.c   |    30 +-
 .../display/dc/link/protocols/link_dp_training.h   |     2 +
 .../dc/link/protocols/link_dp_training_128b_132b.c |     4 +-
 .../dc/link/protocols/link_dp_training_128b_132b.h |     1 +
 .../dc/link/protocols/link_dp_training_8b_10b.c    |    12 +-
 .../dc/link/protocols/link_dp_training_8b_10b.h    |     3 +-
 .../dc/link/protocols/link_dp_training_auxless.c   |     1 +
 .../dc/link/protocols/link_dp_training_dpia.c      |    14 +-
 .../link_dp_training_fixed_vs_pe_retimer.c         |     3 +-
 .../dc/link/protocols/link_edp_panel_control.c     |    25 +-
 drivers/gpu/drm/amd/display/dc/mmhubbub/Makefile   |     2 +-
 drivers/gpu/drm/amd/display/dc/mpc/Makefile        |     2 +-
 .../gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c   |    16 -
 .../gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.h   |     4 -
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c |     4 +-
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h |    28 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c |     7 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |   213 +-
 .../gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c |     1 +
 .../drm/amd/display/dc/optc/dcn201/dcn201_optc.c   |     1 +
 .../gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c |     1 +
 .../drm/amd/display/dc/optc/dcn301/dcn301_optc.c   |     1 +
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c |    71 +
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.h |     7 +-
 .../drm/amd/display/dc/optc/dcn314/dcn314_optc.c   |     1 +
 .../drm/amd/display/dc/optc/dcn314/dcn314_optc.h   |     4 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |     1 +
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h |     3 +-
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |     1 +
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.h |     3 +-
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |    23 +-
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.h   |    22 +-
 drivers/gpu/drm/amd/display/dc/resource/Makefile   |     8 +
 .../display/dc/resource/dce120/dce120_resource.c   |    17 +
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |     5 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |     6 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |     3 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |     5 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |     3 +-
 .../display/dc/resource/dcn315/dcn315_resource.c   |    40 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |     3 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |     3 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |     7 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.h |     3 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |     7 +-
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |  2171 +
 .../amd/display/dc/resource/dcn36/dcn36_resource.h |    73 +
 .../display/dc/resource/dcn401/dcn401_resource.c   |    17 +-
 .../display/dc/resource/dcn401/dcn401_resource.h   |     3 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.h        |    18 -
 .../drm/amd/display/dc/spl/dc_spl_scl_filters.h    |    22 -
 .../gpu/drm/amd/display/dc/{spl =3D> sspl}/Makefile  |     2 +-
 .../gpu/drm/amd/display/dc/{spl =3D> sspl}/dc_spl.c  |   102 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h       |    27 +
 .../amd/display/dc/{spl =3D> sspl}/dc_spl_filters.c  |     0
 .../amd/display/dc/{spl =3D> sspl}/dc_spl_filters.h  |     0
 .../dc/{spl =3D> sspl}/dc_spl_isharp_filters.c       |   458 +-
 .../dc/{spl =3D> sspl}/dc_spl_isharp_filters.h       |    18 +-
 .../dc/{spl =3D> sspl}/dc_spl_scl_easf_filters.c     |  1056 +-
 .../dc/{spl =3D> sspl}/dc_spl_scl_easf_filters.h     |     9 +-
 .../display/dc/{spl =3D> sspl}/dc_spl_scl_filters.c  |   232 +-
 .../drm/amd/display/dc/sspl/dc_spl_scl_filters.h   |    13 +
 .../amd/display/dc/{spl =3D> sspl}/dc_spl_types.h    |    12 +-
 .../display/dc/{spl =3D> sspl}/spl_custom_float.c    |     0
 .../display/dc/{spl =3D> sspl}/spl_custom_float.h    |     0
 .../drm/amd/display/dc/{spl =3D> sspl}/spl_debug.h   |     0
 .../amd/display/dc/{spl =3D> sspl}/spl_fixpt31_32.c  |     2 +-
 .../amd/display/dc/{spl =3D> sspl}/spl_fixpt31_32.h  |     4 +-
 .../amd/display/dc/{spl =3D> sspl}/spl_os_types.h    |     0
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    12 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   131 +-
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |     1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |    75 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h  |     2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |    99 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |     2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |    86 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h  |     2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |    85 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.h  |     2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn36.c  |    34 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn36.h  |    13 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c |   132 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.h |     5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |    19 +-
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     1 +
 drivers/gpu/drm/amd/display/include/dal_types.h    |     1 +
 .../gpu/drm/amd/display/include/logger_interface.h |     5 -
 drivers/gpu/drm/amd/display/include/logger_types.h |     1 +
 .../drm/amd/display/modules/freesync/freesync.c    |   137 -
 .../gpu/drm/amd/display/modules/inc/mod_freesync.h |    26 -
 .../amd/display/modules/info_packet/info_packet.c  |     4 +-
 drivers/gpu/drm/amd/include/amd_acpi.h             |     4 +-
 drivers/gpu/drm/amd/include/amd_cper.h             |   269 +
 drivers/gpu/drm/amd/include/amd_shared.h           |    20 +-
 .../amd/include/asic_reg/dcn/dcn_3_6_0_offset.h    | 15485 +++++
 .../amd/include/asic_reg/dcn/dcn_3_6_0_sh_mask.h   | 61940 +++++++++++++++=
++++
 .../drm/amd/include/asic_reg/gc/gc_11_5_0_offset.h |     2 +
 .../drm/amd/include/asic_reg/gc/gc_9_4_3_sh_mask.h |     2 +
 .../include/asic_reg/mmhub/mmhub_9_4_1_offset.h    |    32 +
 .../include/asic_reg/mmhub/mmhub_9_4_1_sh_mask.h   |    48 +
 .../amd/include/asic_reg/vcn/vcn_4_0_3_offset.h    |    37 +-
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |     7 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |     3 +-
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |    42 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    27 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   670 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |     4 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |     2 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |     2 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |     7 +-
 .../drm/amd/pm/powerplay/hwmgr/hardwaremanager.c   |    10 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.c  |    78 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h  |     3 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |     1 -
 .../amd/pm/powerplay/hwmgr/smu7_clockpowergating.c |     2 +-
 .../amd/pm/powerplay/hwmgr/smu7_clockpowergating.h |     1 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |     1 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |     1 -
 .../gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h |     1 -
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |     1 -
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    71 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |     5 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_pmfw.h   |   281 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_ppsmc.h  |   143 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |   115 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |     9 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    13 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    12 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |     6 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile        |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |     5 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |    21 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |   490 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   306 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |    24 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    11 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |    54 +
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |   106 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |     3 +-
 drivers/gpu/drm/arm/Kconfig                        |     1 +
 .../drm/arm/display/komeda/komeda_wb_connector.c   |     2 +-
 drivers/gpu/drm/arm/malidp_mw.c                    |     2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |     4 +-
 drivers/gpu/drm/ast/Makefile                       |     2 +
 drivers/gpu/drm/ast/ast_cursor.c                   |   309 +
 drivers/gpu/drm/ast/ast_dp.c                       |   269 +-
 drivers/gpu/drm/ast/ast_drv.c                      |     8 +-
 drivers/gpu/drm/ast/ast_drv.h                      |    73 +-
 drivers/gpu/drm/ast/ast_main.c                     |   215 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   588 +-
 drivers/gpu/drm/ast/ast_post.c                     |    51 +-
 drivers/gpu/drm/ast/ast_reg.h                      |    31 +-
 drivers/gpu/drm/ast/ast_tables.h                   |   187 +-
 drivers/gpu/drm/ast/ast_vbios.c                    |   241 +
 drivers/gpu/drm/ast/ast_vbios.h                    |   108 +
 drivers/gpu/drm/bridge/Kconfig                     |     8 +
 drivers/gpu/drm/bridge/Makefile                    |     4 +
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |     5 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |    16 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |    29 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |     8 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |    19 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |     7 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |     5 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |     7 +-
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |    10 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |    21 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |     5 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |    10 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |     8 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |    11 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |    16 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |     5 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |     5 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |    18 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |     7 -
 drivers/gpu/drm/bridge/microchip-lvds.c            |     3 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |    11 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |     1 -
 drivers/gpu/drm/bridge/panel.c                     |    16 +-
 drivers/gpu/drm/bridge/parade-ps8622.c             |     1 -
 drivers/gpu/drm/bridge/parade-ps8640.c             |     5 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |     8 +-
 drivers/gpu/drm/bridge/sii902x.c                   |     6 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   494 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |     9 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |     6 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |     6 +-
 drivers/gpu/drm/bridge/tc358762.c                  |    11 +-
 drivers/gpu/drm/bridge/tc358767.c                  |    20 +-
 drivers/gpu/drm/bridge/tc358775.c                  |     1 -
 drivers/gpu/drm/{i2c =3D> bridge}/tda998x_drv.c      |    49 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |     6 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |   153 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |    19 +-
 drivers/gpu/drm/bridge/ti-tdp158.c                 |     6 +-
 drivers/gpu/drm/ci/build.sh                        |     2 +-
 drivers/gpu/drm/ci/build.yml                       |   104 +-
 drivers/gpu/drm/ci/container.yml                   |    22 +-
 drivers/gpu/drm/ci/gitlab-ci.yml                   |   197 +-
 drivers/gpu/drm/ci/igt_runner.sh                   |    13 +-
 drivers/gpu/drm/ci/image-tags.yml                  |    11 +-
 drivers/gpu/drm/ci/lava-submit.sh                  |   100 +-
 drivers/gpu/drm/ci/test.yml                        |    37 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |     8 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt |    21 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt  |     5 +
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |    20 +-
 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt     |    14 +
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt      |     1 +
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt       |     8 +-
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |    22 +-
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt      |     7 +
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt       |     1 +
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |    31 +-
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt      |     7 +
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt       |   298 +
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt       |    18 +-
 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt      |    15 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt       |   112 +
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |    55 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt       |    13 +
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt       |    15 +-
 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt      |     7 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |     7 +-
 .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt   |     7 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-skips.txt    |     5 +
 .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |    12 +-
 .../gpu/drm/ci/xfails/mediatek-mt8183-skips.txt    |     5 +
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |     3 +
 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |     1 -
 .../msm-sc7180-trogdor-kingoftown-flakes.txt       |    14 +
 .../xfails/msm-sc7180-trogdor-kingoftown-skips.txt |     5 +
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |     1 -
 .../msm-sc7180-trogdor-lazor-limozeen-skips.txt    |     5 +
 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |     2 -
 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |     5 +
 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt |     5 -
 .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |    26 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |    13 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |    56 +
 .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt    |     5 +
 .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt    |     5 +
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt      |    10 +-
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt      |   543 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |     2 +-
 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c  |     4 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |   119 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |    31 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |     2 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   333 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  |    37 +-
 drivers/gpu/drm/drm_bridge.c                       |    79 +-
 drivers/gpu/drm/drm_buddy.c                        |    11 +-
 drivers/gpu/drm/drm_client_event.c                 |    41 +-
 drivers/gpu/drm/drm_crtc.c                         |    20 +
 drivers/gpu/drm/drm_crtc_helper_internal.h         |     2 +-
 drivers/gpu/drm/drm_damage_helper.c                |     2 +-
 drivers/gpu/drm/drm_debugfs.c                      |     2 +-
 drivers/gpu/drm/drm_drv.c                          |    68 +
 drivers/gpu/drm/drm_fb_dma_helper.c                |     2 +-
 drivers/gpu/drm/drm_fb_helper.c                    |    20 +-
 drivers/gpu/drm/drm_file.c                         |    26 +-
 drivers/gpu/drm/drm_format_helper.c                |   123 +
 drivers/gpu/drm/drm_gem.c                          |     4 +-
 drivers/gpu/drm/drm_gem_dma_helper.c               |     4 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |    12 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |    30 +-
 drivers/gpu/drm/drm_gpusvm.c                       |  2250 +
 drivers/gpu/drm/drm_managed.c                      |     8 +
 drivers/gpu/drm/drm_mipi_dbi.c                     |     2 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |    54 +-
 drivers/gpu/drm/drm_of.c                           |     2 +-
 drivers/gpu/drm/drm_panel.c                        |     5 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |    46 +-
 drivers/gpu/drm/drm_panic.c                        |     2 +-
 drivers/gpu/drm/drm_panic_qr.rs                    |   108 +-
 drivers/gpu/drm/drm_prime.c                        |     8 +-
 drivers/gpu/drm/drm_probe_helper.c                 |    35 +-
 drivers/gpu/drm/drm_writeback.c                    |   222 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |    20 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |     2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |     2 +-
 drivers/gpu/drm/gma500/cdv_device.c                |     2 +-
 drivers/gpu/drm/gma500/cdv_intel_crt.c             |     2 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |     5 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |     2 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |     2 +-
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |     2 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h             |     2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |     2 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |     2 +-
 drivers/gpu/drm/i2c/Kconfig                        |    36 -
 drivers/gpu/drm/i2c/Makefile                       |    10 -
 drivers/gpu/drm/i915/Makefile                      |     2 +
 drivers/gpu/drm/i915/display/dvo_ch7017.c          |     2 +-
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c          |     2 +-
 drivers/gpu/drm/i915/display/dvo_ivch.c            |     2 +-
 drivers/gpu/drm/i915/display/dvo_ns2501.c          |     4 +-
 drivers/gpu/drm/i915/display/dvo_sil164.c          |     2 +-
 drivers/gpu/drm/i915/display/dvo_tfp410.c          |     2 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |   114 +-
 drivers/gpu/drm/i915/display/g4x_dp.h              |    14 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   172 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.h            |     6 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |    26 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   372 +-
 drivers/gpu/drm/i915/display/i9xx_plane.h          |    10 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |    24 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |    40 +-
 drivers/gpu/drm/i915/display/intel_acpi.c          |     2 +
 drivers/gpu/drm/i915/display/intel_atomic.h        |     1 -
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   444 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |     9 +
 drivers/gpu/drm/i915/display/intel_audio.c         |   500 +-
 drivers/gpu/drm/i915/display/intel_audio.h         |    14 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |   496 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |     5 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |    74 +-
 drivers/gpu/drm/i915/display/intel_bw.h            |     6 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   204 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |     4 +-
 drivers/gpu/drm/i915/display/intel_cmtg.c          |   189 +
 drivers/gpu/drm/i915/display/intel_cmtg.h          |    13 +
 drivers/gpu/drm/i915/display/intel_cmtg_regs.h     |    21 +
 drivers/gpu/drm/i915/display/intel_color.c         |    11 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |   180 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.h     |     8 +-
 .../gpu/drm/i915/display/intel_combo_phy_regs.h    |     2 +
 drivers/gpu/drm/i915/display/intel_connector.c     |    46 +-
 drivers/gpu/drm/i915/display/intel_connector.h     |     2 +
 drivers/gpu/drm/i915/display/intel_crt.c           |    46 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |    78 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |     7 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |    28 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |   212 +-
 drivers/gpu/drm/i915/display/intel_cursor.h        |     4 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   299 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |     2 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |    33 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   516 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |     4 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |    58 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h |     1 -
 drivers/gpu/drm/i915/display/intel_display.c       |  2230 +-
 drivers/gpu/drm/i915/display/intel_display.h       |    67 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |     4 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   289 +-
 .../gpu/drm/i915/display/intel_display_debugfs.h   |     6 +-
 .../gpu/drm/i915/display/intel_display_device.c    |    13 +
 .../gpu/drm/i915/display/intel_display_device.h    |    14 +
 .../gpu/drm/i915/display/intel_display_driver.c    |    38 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |   789 +-
 drivers/gpu/drm/i915/display/intel_display_irq.h   |     8 +-
 .../gpu/drm/i915/display/intel_display_params.c    |     2 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   134 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |    78 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |     2 +
 .../drm/i915/display/intel_display_power_well.c    |    28 +-
 .../drm/i915/display/intel_display_power_well.h    |     4 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |    75 +-
 drivers/gpu/drm/i915/display/intel_display_reset.h |    12 +-
 drivers/gpu/drm/i915/display/intel_display_rps.c   |     4 +-
 drivers/gpu/drm/i915/display/intel_display_rps.h   |     4 +-
 drivers/gpu/drm/i915/display/intel_display_trace.h |   150 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   100 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.c       |    62 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.h       |    12 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |     7 +-
 drivers/gpu/drm/i915/display/intel_dmc_wl.c        |    76 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   376 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |     5 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |     5 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |   183 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |     8 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |    31 +-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |     1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   514 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |     3 +-
 drivers/gpu/drm/i915/display/intel_dp_test.c       |     6 +-
 drivers/gpu/drm/i915/display/intel_dp_tunnel.c     |     3 +-
 drivers/gpu/drm/i915/display/intel_dp_tunnel.h     |     5 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |    36 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.h      |     6 +
 drivers/gpu/drm/i915/display/intel_dpll.c          |    41 +-
 drivers/gpu/drm/i915/display/intel_dpll.h          |     5 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  1044 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    29 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |    29 +-
 drivers/gpu/drm/i915/display/intel_dpt.h           |     7 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |    45 +-
 drivers/gpu/drm/i915/display/intel_drrs.h          |    10 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |   126 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |     3 +
 drivers/gpu/drm/i915/display/intel_dsi.c           |    10 +-
 drivers/gpu/drm/i915/display/intel_dsi.h           |     2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |     2 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |    10 +-
 drivers/gpu/drm/i915/display/intel_dvo_dev.h       |     4 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |   410 +-
 drivers/gpu/drm/i915/display/intel_fb.h            |    31 +-
 drivers/gpu/drm/i915/display/intel_fb_bo.c         |    18 +-
 drivers/gpu/drm/i915/display/intel_fb_bo.h         |     8 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |    33 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.h        |     4 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   270 +-
 drivers/gpu/drm/i915/display/intel_fbc.h           |    10 +-
 drivers/gpu/drm/i915/display/intel_fbc_regs.h      |     9 +
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   352 +-
 drivers/gpu/drm/i915/display/intel_fbdev.h         |    25 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   483 +-
 drivers/gpu/drm/i915/display/intel_fdi.h           |    23 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |   183 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.h |    18 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |    14 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |    10 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   291 +-
 drivers/gpu/drm/i915/display/intel_hdcp.h          |    11 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |    31 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |    10 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |    31 +-
 drivers/gpu/drm/i915/display/intel_hotplug.h       |     4 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |     2 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |     3 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |   118 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.h     |    18 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |    30 +-
 drivers/gpu/drm/i915/display/intel_lspcon.h        |    25 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |    23 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |    74 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |     3 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |    28 +-
 drivers/gpu/drm/i915/display/intel_overlay.h       |     1 -
 drivers/gpu/drm/i915/display/intel_panel.c         |     1 +
 drivers/gpu/drm/i915/display/intel_pch_display.c   |    84 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |    34 +-
 drivers/gpu/drm/i915/display/intel_pfit.c          |   170 +-
 drivers/gpu/drm/i915/display/intel_pfit.h          |    10 +-
 drivers/gpu/drm/i915/display/intel_pfit_regs.h     |    79 +
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |     5 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.h      |     1 -
 drivers/gpu/drm/i915/display/intel_plane_initial.c |     7 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.h |     2 +
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |     2 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |    34 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |   230 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |    10 +-
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |    10 +
 drivers/gpu/drm/i915/display/intel_quirks.c        |     2 +
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   302 +-
 drivers/gpu/drm/i915/display/intel_sdvo.h          |    10 +-
 drivers/gpu/drm/i915/display/intel_sdvo_regs.h     |     2 +-
 drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c |   364 +
 drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.h |    17 +
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   114 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.h      |     7 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |   178 +-
 drivers/gpu/drm/i915/display/intel_sprite.h        |     6 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |    90 +-
 drivers/gpu/drm/i915/display/intel_tdf.h           |     6 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |     8 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |    86 +-
 drivers/gpu/drm/i915/display/intel_vblank.h        |     6 +
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   249 +-
 drivers/gpu/drm/i915/display/intel_vga.c           |     5 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |   172 +-
 drivers/gpu/drm/i915/display/intel_vrr.h           |     9 +-
 drivers/gpu/drm/i915/display/intel_wm.c            |     6 +
 drivers/gpu/drm/i915/display/intel_wm.h            |     1 +
 drivers/gpu/drm/i915/display/skl_scaler.c          |   390 +-
 drivers/gpu/drm/i915/display/skl_scaler.h          |     7 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   703 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.h |    14 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |   169 +-
 drivers/gpu/drm/i915/display/skl_watermark.h       |     7 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    18 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |    14 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.h         |    16 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |     6 +-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |     6 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |    17 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |     6 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |     5 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |    26 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |     4 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |     2 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |     2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |     2 +-
 drivers/gpu/drm/i915/gem/selftests/mock_context.c  |    38 -
 drivers/gpu/drm/i915/gem/selftests/mock_context.h  |     3 -
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c   |     3 +-
 drivers/gpu/drm/i915/gt/gen2_engine_cs.c           |     2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |    15 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |     4 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |     7 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |    89 +-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |    10 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |     2 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |     7 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |     8 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |   139 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |    47 +
 drivers/gpu/drm/i915/gt/intel_migrate.c            |     4 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |     2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    52 +-
 drivers/gpu/drm/i915/gt/intel_reset.h              |     2 +
 drivers/gpu/drm/i915/gt/intel_reset_types.h        |     3 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |     2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |     4 +
 drivers/gpu/drm/i915/gt/intel_rps_types.h          |     4 +-
 drivers/gpu/drm/i915/gt/intel_sa_media.c           |     2 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |    58 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |    21 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |     2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |     2 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |     2 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c             |     2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |    15 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |    17 +-
 drivers/gpu/drm/i915/gt/shaders/README             |     6 +-
 .../gpu/drm/i915/gt/shaders/clear_kernel/hsw.asm   |     2 +-
 .../gpu/drm/i915/gt/shaders/clear_kernel/ivb.asm   |     2 +-
 drivers/gpu/drm/i915/gt/shmem_utils.c              |     8 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h  |     5 +
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h      |     4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |     2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |     2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |    11 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |     2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c    |     3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |   104 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h        |     1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h  |     3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |    11 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |    12 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |     2 +-
 .../gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c    |     2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    15 +-
 drivers/gpu/drm/i915/gvt/display.c                 |     2 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |     2 +-
 drivers/gpu/drm/i915/gvt/edid.c                    |     2 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |   117 -
 drivers/gpu/drm/i915/gvt/fb_decoder.h              |     2 -
 drivers/gpu/drm/i915/gvt/gtt.c                     |    68 +-
 drivers/gpu/drm/i915/gvt/gvt.h                     |    14 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |    23 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |     2 +-
 drivers/gpu/drm/i915/gvt/mmio.h                    |     3 -
 drivers/gpu/drm/i915/gvt/mmio_context.c            |     6 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |    11 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                    |     6 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |     3 -
 drivers/gpu/drm/i915/i915_driver.c                 |    23 +-
 drivers/gpu/drm/i915/i915_drv.h                    |     1 -
 drivers/gpu/drm/i915/i915_gem.c                    |     6 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |     2 -
 drivers/gpu/drm/i915/i915_gtt_view_types.h         |    59 +
 drivers/gpu/drm/i915/i915_irq.c                    |    69 +-
 drivers/gpu/drm/i915/i915_irq.h                    |     4 +
 drivers/gpu/drm/i915/i915_module.c                 |     4 +-
 drivers/gpu/drm/i915/i915_perf.c                   |    19 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |   120 +-
 drivers/gpu/drm/i915/i915_pmu.h                    |    13 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   145 +-
 drivers/gpu/drm/i915/i915_reg_defs.h               |     8 +
 drivers/gpu/drm/i915/i915_request.c                |     2 +-
 drivers/gpu/drm/i915/i915_request.h                |     4 +-
 drivers/gpu/drm/i915/i915_vma.c                    |    10 +-
 drivers/gpu/drm/i915/i915_vma_types.h              |    52 +-
 drivers/gpu/drm/i915/intel_clock_gating.c          |     2 +-
 drivers/gpu/drm/i915/intel_gvt.c                   |     2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |     3 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |     2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.h            |     2 +-
 drivers/gpu/drm/i915/intel_uncore.c                |     2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |     6 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |     4 +-
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h  |     2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |     2 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c          |     9 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |    21 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c          |    15 +-
 drivers/gpu/drm/i915/soc/intel_pch.c               |    44 +-
 drivers/gpu/drm/i915/soc/intel_pch.h               |    45 +-
 drivers/gpu/drm/imagination/pvr_job.c              |    12 +-
 drivers/gpu/drm/imagination/pvr_queue.c            |    18 +-
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                |     2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |     4 +-
 drivers/gpu/drm/lima/lima_sched.c                  |    16 +-
 drivers/gpu/drm/loongson/lsdc_plane.c              |     3 +-
 drivers/gpu/drm/mediatek/mtk_crtc.c                |     7 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |     4 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |     4 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c          |     4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |     4 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |     4 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |    12 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   343 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h            |     9 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    10 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |    18 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   117 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |     4 +-
 drivers/gpu/drm/mediatek/mtk_plane.c               |     2 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |     5 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |     5 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |     5 +-
 drivers/gpu/drm/mgag200/Makefile                   |     1 +
 drivers/gpu/drm/mgag200/mgag200_drv.c              |     4 +
 drivers/gpu/drm/mgag200/mgag200_drv.h              |     3 +
 drivers/gpu/drm/mgag200/mgag200_g200eh5.c          |   204 +
 drivers/gpu/drm/msm/Kconfig                        |     2 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |    29 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |    82 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |     8 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    15 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |    17 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |    10 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |     5 +
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |     5 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |     1 +
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |     1 +
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |     1 +
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |     1 +
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |     1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |     1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |     1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |     1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |     1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |     5 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |     5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |     5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |    19 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |     5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |     2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |     5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |     5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |     5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |     2 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |     1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |     5 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |     2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |     5 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |     5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |   140 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h      |    10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   233 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |     3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   476 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |    12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |     7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |     5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |    16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    40 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c         |     4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |    30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |    15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |     2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   298 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |    14 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    |     2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c           |     3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |     2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |    25 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |    47 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |    24 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |     6 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   193 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |    32 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |     5 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |     1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |     1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |     1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    |     1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |    21 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |   120 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |    31 +-
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c              |   122 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   334 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |    15 +-
 drivers/gpu/drm/msm/msm_drv.c                      |     1 +
 drivers/gpu/drm/msm/msm_dsc_helper.h               |    11 -
 drivers/gpu/drm/msm/msm_gem_submit.c               |     2 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |     9 +
 drivers/gpu/drm/msm/msm_gpu.h                      |     8 +
 drivers/gpu/drm/msm/msm_iommu.c                    |    54 +-
 drivers/gpu/drm/msm/msm_kms.c                      |    19 +-
 drivers/gpu/drm/msm/msm_kms.h                      |    10 +
 drivers/gpu/drm/msm/msm_mmu.h                      |     4 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |    17 +-
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |     1 +
 drivers/gpu/drm/msm/registers/display/hdmi.xml     |     2 +-
 drivers/gpu/drm/nouveau/Kconfig                    |    18 +
 drivers/gpu/drm/nouveau/dispnv04/Kbuild            |     3 +
 drivers/gpu/drm/nouveau/dispnv04/dfp.c             |    17 +-
 drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild        |     5 +
 .../drm/{ =3D> nouveau/dispnv04}/i2c/ch7006_drv.c    |    32 +-
 .../drm/{ =3D> nouveau/dispnv04}/i2c/ch7006_mode.c   |     8 +-
 .../drm/{ =3D> nouveau/dispnv04}/i2c/ch7006_priv.h   |    11 +-
 .../drm/{ =3D> nouveau/dispnv04}/i2c/sil164_drv.c    |    35 +-
 .../dispnv04/nouveau_i2c_encoder.c}                |    95 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |    24 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |     6 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |     2 +-
 .../gpu/drm/nouveau/include/dispnv04}/i2c/ch7006.h |     4 +-
 .../drm/nouveau/include/dispnv04/i2c/encoder_i2c.h |   123 +-
 .../gpu/drm/nouveau/include/dispnv04}/i2c/sil164.h |     4 +-
 drivers/gpu/drm/nouveau/include/nvif/ioctl.h       |    32 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |     8 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |    12 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c               |    17 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |     2 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |    13 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c            |    16 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c              |     4 +-
 drivers/gpu/drm/nouveau/nvif/object.c              |    12 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |   735 +-
 drivers/gpu/drm/omapdrm/dss/dss.c                  |    14 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |     5 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                |     5 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.c           |    17 -
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.h           |     1 -
 drivers/gpu/drm/panel/Kconfig                      |    31 +
 drivers/gpu/drm/panel/Makefile                     |     3 +
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c          |    67 +-
 drivers/gpu/drm/panel/panel-edp.c                  |    23 +
 drivers/gpu/drm/panel/panel-himax-hx83102.c        |   380 +
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      |     2 +-
 drivers/gpu/drm/panel/panel-raydium-rm67200.c      |   499 +
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |    91 +-
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    |    59 +-
 drivers/gpu/drm/panel/panel-simple.c               |    64 +
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c      |   107 +-
 drivers/gpu/drm/panel/panel-summit.c               |   132 +
 drivers/gpu/drm/panel/panel-visionox-r66451.c      |   181 +-
 drivers/gpu/drm/panel/panel-visionox-rm692e5.c     |   442 +
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   |   174 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |    20 +-
 drivers/gpu/drm/panthor/panthor_device.c           |    22 +-
 drivers/gpu/drm/panthor/panthor_drv.c              |    14 +
 drivers/gpu/drm/panthor/panthor_fw.c               |    10 +-
 drivers/gpu/drm/panthor/panthor_fw.h               |     6 +-
 drivers/gpu/drm/panthor/panthor_gem.h              |     5 -
 drivers/gpu/drm/panthor/panthor_heap.c             |    54 +-
 drivers/gpu/drm/panthor/panthor_heap.h             |     2 +
 drivers/gpu/drm/panthor/panthor_mmu.c              |   114 +-
 drivers/gpu/drm/panthor/panthor_mmu.h              |     3 +
 drivers/gpu/drm/panthor/panthor_sched.c            |   115 +-
 drivers/gpu/drm/panthor/panthor_sched.h            |     3 +
 drivers/gpu/drm/qxl/qxl_display.c                  |     2 +-
 drivers/gpu/drm/radeon/atombios_dp.c               |     2 +-
 drivers/gpu/drm/radeon/ci_dpm.c                    |    34 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |    10 +-
 drivers/gpu/drm/radeon/radeon_device.c             |     6 +-
 drivers/gpu/drm/radeon/radeon_fence.c              |     2 +-
 drivers/gpu/drm/radeon/radeon_mode.h               |     2 +-
 drivers/gpu/drm/radeon/radeon_uvd.c                |     2 +-
 drivers/gpu/drm/radeon/radeon_vce.c                |     2 +-
 drivers/gpu/drm/radeon/si.c                        |     2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |     5 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |     4 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |     5 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   114 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |     2 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |    16 +-
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |   250 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |     4 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |     2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |     6 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |     2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  1592 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |   278 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |    80 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |  1798 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |    25 +-
 drivers/gpu/drm/scheduler/sched_fence.c            |     2 +
 drivers/gpu/drm/scheduler/sched_internal.h         |    91 +
 drivers/gpu/drm/scheduler/sched_main.c             |   131 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c              |     7 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |     6 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |     2 +-
 drivers/gpu/drm/sti/sti_hda.c                      |    12 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |     2 +-
 drivers/gpu/drm/stm/ltdc.c                         |     4 +-
 drivers/gpu/drm/stm/lvds.c                         |     5 +-
 drivers/gpu/drm/tegra/dc.c                         |     3 +-
 drivers/gpu/drm/tegra/dsi.c                        |     2 +-
 drivers/gpu/drm/tegra/hdmi.c                       |     2 +-
 drivers/gpu/drm/tegra/sor.c                        |     2 +-
 drivers/gpu/drm/tests/Makefile                     |     1 +
 drivers/gpu/drm/tests/drm_atomic_state_test.c      |   379 +
 drivers/gpu/drm/tests/drm_buddy_test.c             |    30 +-
 drivers/gpu/drm/tests/drm_format_helper_test.c     |    81 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |   254 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |    41 -
 drivers/gpu/drm/tidss/tidss_dispc_regs.h           |     2 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |     2 +-
 drivers/gpu/drm/tiny/Kconfig                       |    12 +
 drivers/gpu/drm/tiny/Makefile                      |     1 +
 drivers/gpu/drm/tiny/appletbdrm.c                  |   840 +
 drivers/gpu/drm/tiny/arcpgu.c                      |     4 +-
 drivers/gpu/drm/tiny/repaper.c                     |     4 +-
 drivers/gpu/drm/ttm/Makefile                       |     2 +-
 drivers/gpu/drm/ttm/ttm_backup.c                   |   207 +
 drivers/gpu/drm/ttm/ttm_bo.c                       |     3 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   250 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |   776 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |    50 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |    83 +
 drivers/gpu/drm/v3d/v3d_drv.c                      |    25 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |     1 -
 drivers/gpu/drm/v3d/v3d_sched.c                    |    67 +-
 drivers/gpu/drm/vboxvideo/hgsmi_base.c             |    37 -
 drivers/gpu/drm/vboxvideo/vboxvideo_guest.h        |     2 -
 drivers/gpu/drm/vc4/Kconfig                        |     1 +
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     |    46 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |    33 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |    27 -
 drivers/gpu/drm/vc4/vc4_dsi.c                      |     9 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |   183 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   111 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |     2 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |     2 +-
 drivers/gpu/drm/vc4/vc4_validate.c                 |    11 -
 drivers/gpu/drm/virtio/virtgpu_display.c           |     2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    41 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |    11 +
 drivers/gpu/drm/virtio/virtgpu_gem.c               |    14 +
 drivers/gpu/drm/virtio/virtgpu_plane.c             |    96 +
 drivers/gpu/drm/virtio/virtgpu_prime.c             |    36 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |   154 +
 drivers/gpu/drm/virtio/virtgpu_vram.c              |     9 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |    35 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |    24 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |    11 +-
 drivers/gpu/drm/vkms/vkms_formats.c                |    32 +
 drivers/gpu/drm/vkms/vkms_output.c                 |    61 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |     1 +
 drivers/gpu/drm/vkms/vkms_writeback.c              |    37 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |     2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |     2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |     2 +-
 drivers/gpu/drm/xe/Kconfig                         |    24 +
 drivers/gpu/drm/xe/Kconfig.profile                 |     1 +
 drivers/gpu/drm/xe/Makefile                        |    28 +-
 drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h      |    41 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h           |     1 +
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h      |     3 +
 .../xe/compat-i915-headers/gem/i915_gem_object.h   |    15 +
 .../xe/compat-i915-headers/gem/i915_gem_stolen.h   |     5 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |     8 -
 .../xe/compat-i915-headers/i915_gtt_view_types.h   |     7 +
 .../xe/compat-i915-headers/i915_scheduler_types.h  |    13 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h  |     3 +
 .../drm/xe/compat-i915-headers/i915_vma_types.h    |    74 -
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |     2 +
 .../gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h |    19 +-
 drivers/gpu/drm/xe/display/ext/i915_irq.c          |    23 +
 drivers/gpu/drm/xe/display/intel_bo.c              |     2 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.c           |    11 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |     4 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   201 +-
 drivers/gpu/drm/xe/display/xe_display.h            |    11 +-
 drivers/gpu/drm/xe/display/xe_display_rps.c        |     2 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |    68 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |    21 +-
 drivers/gpu/drm/xe/display/xe_tdf.c                |     6 +-
 drivers/gpu/drm/xe/instructions/xe_instr_defs.h    |     1 +
 drivers/gpu/drm/xe/instructions/xe_mfx_commands.h  |    28 +
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h   |     5 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |     1 +
 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h         |    29 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |    13 +-
 drivers/gpu/drm/xe/regs/xe_irq_regs.h              |     8 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h           |     3 +
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h            |     2 +
 drivers/gpu/drm/xe/regs/xe_pxp_regs.h              |    23 +
 drivers/gpu/drm/xe/regs/xe_reg_defs.h              |    28 +-
 drivers/gpu/drm/xe/regs/xe_regs.h                  |     4 -
 drivers/gpu/drm/xe/tests/xe_bo.c                   |     6 +-
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c        |   334 +
 drivers/gpu/drm/xe/tests/xe_pci.c                  |    26 +-
 drivers/gpu/drm/xe/tests/xe_rtp_test.c             |     2 +-
 drivers/gpu/drm/xe/xe_bo.c                         |   431 +-
 drivers/gpu/drm/xe/xe_bo.h                         |    64 +
 drivers/gpu/drm/xe/xe_bo_types.h                   |    10 +
 drivers/gpu/drm/xe/xe_debugfs.c                    |     6 +-
 drivers/gpu/drm/xe/xe_devcoredump.c                |     8 +-
 drivers/gpu/drm/xe/xe_device.c                     |   253 +-
 drivers/gpu/drm/xe/xe_device.h                     |     5 +
 drivers/gpu/drm/xe/xe_device_sysfs.c               |     6 -
 drivers/gpu/drm/xe/xe_device_types.h               |    66 +-
 drivers/gpu/drm/xe/xe_drm_client.c                 |     8 +
 drivers/gpu/drm/xe/xe_eu_stall.c                   |   960 +
 drivers/gpu/drm/xe/xe_eu_stall.h                   |    24 +
 drivers/gpu/drm/xe/xe_exec.c                       |     6 +
 drivers/gpu/drm/xe/xe_exec_queue.c                 |    77 +-
 drivers/gpu/drm/xe/xe_exec_queue.h                 |     5 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |    10 +
 drivers/gpu/drm/xe/xe_execlist.c                   |    17 +-
 drivers/gpu/drm/xe/xe_gen_wa_oob.c                 |     6 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c              |    17 +-
 drivers/gpu/drm/xe/xe_gsc.c                        |     9 -
 drivers/gpu/drm/xe/xe_gsc.h                        |     1 -
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |    63 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.h                  |     1 -
 drivers/gpu/drm/xe/xe_gsc_types.h                  |     1 +
 drivers/gpu/drm/xe/xe_gt.c                         |    73 +-
 drivers/gpu/drm/xe/xe_gt.h                         |     1 -
 drivers/gpu/drm/xe/xe_gt_clock.c                   |    53 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |    11 +
 drivers/gpu/drm/xe/xe_gt_idle.c                    |    23 +-
 drivers/gpu/drm/xe/xe_gt_idle.h                    |     1 +
 drivers/gpu/drm/xe/xe_gt_idle_types.h              |     3 +
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |     8 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |    29 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c                |    49 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |   161 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h         |     1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c         |    50 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c        |    28 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h          |    10 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |    28 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h                |     1 +
 drivers/gpu/drm/xe/xe_gt_stats.c                   |     8 +-
 drivers/gpu/drm/xe/xe_gt_stats_types.h             |     2 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |    22 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |     2 +
 drivers/gpu/drm/xe/xe_gt_topology.c                |    16 +-
 drivers/gpu/drm/xe/xe_gt_topology.h                |    13 +
 drivers/gpu/drm/xe/xe_gt_types.h                   |    15 +-
 drivers/gpu/drm/xe/xe_guc.c                        |    18 +-
 drivers/gpu/drm/xe/xe_guc_ads.c                    |     2 +-
 drivers/gpu/drm/xe/xe_guc_buf.c                    |   176 +
 drivers/gpu/drm/xe/xe_guc_buf.h                    |    47 +
 drivers/gpu/drm/xe/xe_guc_buf_types.h              |    28 +
 drivers/gpu/drm/xe/xe_guc_debugfs.c                |    28 +
 drivers/gpu/drm/xe/xe_guc_engine_activity.c        |   373 +
 drivers/gpu/drm/xe/xe_guc_engine_activity.h        |    19 +
 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h  |    92 +
 drivers/gpu/drm/xe/xe_guc_fwif.h                   |    19 +
 drivers/gpu/drm/xe/xe_guc_log.c                    |     8 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                     |    97 +-
 drivers/gpu/drm/xe/xe_guc_pc.h                     |     2 +
 drivers/gpu/drm/xe/xe_guc_relay.c                  |     2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |     8 +
 drivers/gpu/drm/xe/xe_guc_types.h                  |     7 +
 drivers/gpu/drm/xe/xe_heci_gsc.c                   |    40 +-
 drivers/gpu/drm/xe/xe_heci_gsc.h                   |     3 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  |     6 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c            |     1 +
 drivers/gpu/drm/xe/xe_hwmon.c                      |    91 +-
 drivers/gpu/drm/xe/xe_hwmon.h                      |     4 +-
 drivers/gpu/drm/xe/xe_irq.c                        |    20 +-
 drivers/gpu/drm/xe/xe_lmtt.c                       |     4 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |    18 +-
 drivers/gpu/drm/xe/xe_lrc.h                        |     7 +-
 drivers/gpu/drm/xe/xe_migrate.c                    |   175 +
 drivers/gpu/drm/xe/xe_migrate.h                    |    10 +
 drivers/gpu/drm/xe/xe_mmio.c                       |    77 +-
 drivers/gpu/drm/xe/xe_mmio.h                       |     4 +-
 drivers/gpu/drm/xe/xe_mocs.c                       |     4 +-
 drivers/gpu/drm/xe/xe_module.c                     |    12 +-
 drivers/gpu/drm/xe/xe_module.h                     |     2 +
 drivers/gpu/drm/xe/xe_oa.c                         |   125 +-
 drivers/gpu/drm/xe/xe_oa.h                         |     4 +-
 drivers/gpu/drm/xe/xe_observation.c                |    14 +
 drivers/gpu/drm/xe/xe_pci.c                        |   302 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c                  |    51 +
 drivers/gpu/drm/xe/xe_pci_types.h                  |    20 +-
 drivers/gpu/drm/xe/xe_pcode_api.h                  |    14 +
 drivers/gpu/drm/xe/xe_pm.c                         |    41 +-
 drivers/gpu/drm/xe/xe_pmu.c                        |   531 +
 drivers/gpu/drm/xe/xe_pmu.h                        |    18 +
 drivers/gpu/drm/xe/xe_pmu_types.h                  |    39 +
 drivers/gpu/drm/xe/xe_pt.c                         |   399 +-
 drivers/gpu/drm/xe/xe_pt.h                         |     5 +
 drivers/gpu/drm/xe/xe_pt_types.h                   |     2 +
 drivers/gpu/drm/xe/xe_pxp.c                        |   919 +
 drivers/gpu/drm/xe/xe_pxp.h                        |    35 +
 drivers/gpu/drm/xe/xe_pxp_debugfs.c                |   120 +
 drivers/gpu/drm/xe/xe_pxp_debugfs.h                |    13 +
 drivers/gpu/drm/xe/xe_pxp_submit.c                 |   588 +
 drivers/gpu/drm/xe/xe_pxp_submit.h                 |    22 +
 drivers/gpu/drm/xe/xe_pxp_types.h                  |   135 +
 drivers/gpu/drm/xe/xe_query.c                      |    82 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c              |     4 +-
 drivers/gpu/drm/xe/xe_res_cursor.h                 |   123 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                   |    34 +-
 drivers/gpu/drm/xe/xe_rtp.c                        |     6 +-
 drivers/gpu/drm/xe/xe_rtp.h                        |     2 +-
 drivers/gpu/drm/xe/xe_sa.c                         |    51 +-
 drivers/gpu/drm/xe/xe_sa.h                         |    30 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h            |     4 +-
 drivers/gpu/drm/xe/xe_shrinker.c                   |   258 +
 drivers/gpu/drm/xe/xe_shrinker.h                   |    18 +
 drivers/gpu/drm/xe/xe_sriov.c                      |     2 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c         |   237 +
 drivers/gpu/drm/xe/xe_survivability_mode.h         |    17 +
 drivers/gpu/drm/xe/xe_survivability_mode_types.h   |    35 +
 drivers/gpu/drm/xe/xe_svm.c                        |   946 +
 drivers/gpu/drm/xe/xe_svm.h                        |   150 +
 drivers/gpu/drm/xe/xe_sync.c                       |     1 +
 drivers/gpu/drm/xe/xe_tile.c                       |    23 +-
 drivers/gpu/drm/xe/xe_tile.h                       |     1 +
 drivers/gpu/drm/xe/xe_trace.h                      |    30 +
 drivers/gpu/drm/xe/xe_trace_bo.h                   |    19 +-
 drivers/gpu/drm/xe/xe_trace_guc.h                  |    49 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |    17 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h             |     2 +-
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c                |     3 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |     3 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h         |     4 -
 drivers/gpu/drm/xe/xe_tuning.c                     |    84 +-
 drivers/gpu/drm/xe/xe_tuning.h                     |     3 +
 drivers/gpu/drm/xe/xe_uc.c                         |    16 +-
 drivers/gpu/drm/xe/xe_uc.h                         |     1 -
 drivers/gpu/drm/xe/xe_vm.c                         |   540 +-
 drivers/gpu/drm/xe/xe_vm.h                         |    23 +-
 drivers/gpu/drm/xe/xe_vm_doc.h                     |     2 +-
 drivers/gpu/drm/xe/xe_vm_types.h                   |    58 +
 drivers/gpu/drm/xe/xe_wa.c                         |    39 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |    11 +
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |   165 +-
 drivers/gpu/drm/xlnx/zynqmp_dp_audio.c             |     4 +
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |     2 +
 drivers/gpu/host1x/debug.c                         |     9 -
 drivers/gpu/host1x/debug.h                         |     1 -
 drivers/gpu/ipu-v3/ipu-common.c                    |    38 -
 drivers/gpu/ipu-v3/ipu-cpmem.c                     |    23 -
 drivers/gpu/ipu-v3/ipu-csi.c                       |   108 -
 drivers/gpu/ipu-v3/ipu-ic.c                        |    73 -
 drivers/gpu/ipu-v3/ipu-image-convert.c             |    48 -
 drivers/gpu/ipu-v3/ipu-prv.h                       |     2 -
 drivers/gpu/ipu-v3/ipu-vdi.c                       |    11 -
 drivers/gpu/nova-core/Kconfig                      |    14 +
 drivers/gpu/nova-core/Makefile                     |     3 +
 drivers/gpu/nova-core/driver.rs                    |    47 +
 drivers/gpu/nova-core/firmware.rs                  |    45 +
 drivers/gpu/nova-core/gpu.rs                       |   199 +
 drivers/gpu/nova-core/nova_core.rs                 |    20 +
 drivers/gpu/nova-core/regs.rs                      |    55 +
 drivers/gpu/nova-core/util.rs                      |    21 +
 drivers/media/cec/i2c/Kconfig                      |     9 +
 drivers/media/cec/i2c/Makefile                     |     1 +
 drivers/{gpu/drm =3D> media/cec}/i2c/tda9950.c       |     0
 drivers/staging/fbtft/fbtft-core.c                 |     4 +-
 drivers/video/Kconfig                              |     1 +
 include/Kbuild                                     |     1 +
 include/drm/Makefile                               |    18 +
 include/drm/display/drm_dp.h                       |    17 +-
 include/drm/display/drm_dp_dual_mode_helper.h      |     2 +-
 include/drm/display/drm_dp_helper.h                |     3 +
 include/drm/display/drm_dp_mst_helper.h            |     7 +
 include/drm/display/drm_hdmi_state_helper.h        |     2 +-
 include/drm/drm_atomic.h                           |    54 +-
 include/drm/drm_atomic_helper.h                    |     2 +
 include/drm/drm_bridge.h                           |     8 +-
 include/drm/drm_client.h                           |     8 +
 include/drm/drm_client_event.h                     |     2 +
 include/drm/drm_crtc.h                             |     2 +-
 include/drm/drm_damage_helper.h                    |     2 +-
 include/drm/drm_device.h                           |     8 +
 include/drm/drm_drv.h                              |     1 +
 include/drm/drm_fb_helper.h                        |    44 +-
 include/drm/drm_file.h                             |     5 +
 include/drm/drm_format_helper.h                    |     6 +
 include/drm/drm_gem.h                              |    14 +
 include/drm/drm_gem_shmem_helper.h                 |     2 +-
 include/drm/drm_gpusvm.h                           |   509 +
 include/drm/drm_gpuvm.h                            |     5 +
 include/drm/drm_kunit_helpers.h                    |     2 -
 include/drm/drm_managed.h                          |    12 +
 include/drm/drm_mipi_dsi.h                         |     2 +-
 include/drm/drm_mode_object.h                      |     2 +-
 include/drm/drm_modeset_helper_vtables.h           |    11 +-
 include/drm/drm_pagemap.h                          |   107 +
 include/drm/drm_panel.h                            |     1 -
 include/drm/drm_print.h                            |    41 +-
 include/drm/drm_writeback.h                        |     6 +
 include/drm/gpu_scheduler.h                        |   180 +-
 include/drm/i2c/tda998x.h                          |    40 -
 include/drm/intel/pciids.h                         |    18 +-
 include/drm/ttm/ttm_backup.h                       |    74 +
 include/drm/ttm/ttm_bo.h                           |    93 +
 include/drm/ttm/ttm_pool.h                         |     8 +
 include/drm/ttm/ttm_resource.h                     |    11 +-
 include/drm/ttm/ttm_tt.h                           |    69 +-
 include/dt-bindings/clock/qcom,dsi-phy-28nm.h      |     9 +
 include/linux/component.h                          |     4 +-
 include/linux/migrate.h                            |     1 +
 include/sound/hdmi-codec.h                         |     1 +
 include/uapi/drm/amdgpu_drm.h                      |    10 +
 include/uapi/drm/drm_fourcc.h                      |    41 +
 include/uapi/drm/ivpu_accel.h                      |    84 +
 include/uapi/drm/panthor_drm.h                     |    86 +-
 include/uapi/drm/xe_drm.h                          |   240 +-
 include/uapi/linux/kfd_ioctl.h                     |    10 +-
 include/uapi/linux/kfd_sysfs.h                     |     3 +
 include/video/imx-ipu-image-convert.h              |    32 -
 include/video/imx-ipu-v3.h                         |    14 -
 mm/memory.c                                        |    13 +-
 mm/migrate_device.c                                |   120 +-
 rust/kernel/firmware.rs                            |   216 +
 rust/macros/module.rs                              |     4 +
 sound/soc/codecs/hdmi-codec.c                      |     4 +
 1624 files changed, 143198 insertions(+), 41372 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
 create mode 100644
Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/apple,summit.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
 create mode 100644 Documentation/gpu/nouveau.rst
 create mode 100644 Documentation/gpu/nova/core/guidelines.rst
 create mode 100644 Documentation/gpu/nova/core/todo.rst
 create mode 100644 Documentation/gpu/nova/guidelines.rst
 create mode 100644 Documentation/gpu/nova/index.rst
 create mode 100644 Documentation/gpu/rfc/gpusvm.rst
 create mode 100644 drivers/gpu/drm/adp/Kconfig
 create mode 100644 drivers/gpu/drm/adp/Makefile
 create mode 100644 drivers/gpu/drm/adp/adp-mipi.c
 create mode 100644 drivers/gpu/drm/adp/adp_drv.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v10_1_10_cleaner_shader.=
asm
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_pasid.c
 delete mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
 delete mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dc=
n36.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dc=
n36.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.h
 rename drivers/gpu/drm/amd/display/dc/{spl =3D> sspl}/Makefile (96%)
 rename drivers/gpu/drm/amd/display/dc/{spl =3D> sspl}/dc_spl.c (96%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h
 rename drivers/gpu/drm/amd/display/dc/{spl =3D> sspl}/dc_spl_filters.c (10=
0%)
 rename drivers/gpu/drm/amd/display/dc/{spl =3D> sspl}/dc_spl_filters.h (10=
0%)
 rename drivers/gpu/drm/amd/display/dc/{spl =3D>
sspl}/dc_spl_isharp_filters.c (62%)
 rename drivers/gpu/drm/amd/display/dc/{spl =3D>
sspl}/dc_spl_isharp_filters.h (61%)
 rename drivers/gpu/drm/amd/display/dc/{spl =3D>
sspl}/dc_spl_scl_easf_filters.c (60%)
 rename drivers/gpu/drm/amd/display/dc/{spl =3D>
sspl}/dc_spl_scl_easf_filters.h (79%)
 rename drivers/gpu/drm/amd/display/dc/{spl =3D> sspl}/dc_spl_scl_filters.c=
 (87%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_filters.=
h
 rename drivers/gpu/drm/amd/display/dc/{spl =3D> sspl}/dc_spl_types.h (98%)
 rename drivers/gpu/drm/amd/display/dc/{spl =3D> sspl}/spl_custom_float.c (=
100%)
 rename drivers/gpu/drm/amd/display/dc/{spl =3D> sspl}/spl_custom_float.h (=
100%)
 rename drivers/gpu/drm/amd/display/dc/{spl =3D> sspl}/spl_debug.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{spl =3D> sspl}/spl_fixpt31_32.c (99=
%)
 rename drivers/gpu/drm/amd/display/dc/{spl =3D> sspl}/spl_fixpt31_32.h (99=
%)
 rename drivers/gpu/drm/amd/display/dc/{spl =3D> sspl}/spl_os_types.h (100%=
)
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn36.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn36.h
 create mode 100644 drivers/gpu/drm/amd/include/amd_cper.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_6_0_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_6_0_sh_m=
ask.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_p=
mfw.h
 create mode 100644
drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_ppsmc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c
 create mode 100644 drivers/gpu/drm/ast/ast_cursor.c
 create mode 100644 drivers/gpu/drm/ast/ast_vbios.c
 create mode 100644 drivers/gpu/drm/ast/ast_vbios.h
 rename drivers/gpu/drm/{i2c =3D> bridge}/tda998x_drv.c (97%)
 create mode 100644 drivers/gpu/drm/drm_gpusvm.c
 delete mode 100644 drivers/gpu/drm/i2c/Kconfig
 delete mode 100644 drivers/gpu/drm/i2c/Makefile
 create mode 100644 drivers/gpu/drm/i915/display/intel_cmtg.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_cmtg.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_cmtg_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_pfit_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.h
 create mode 100644 drivers/gpu/drm/i915/i915_gtt_view_types.h
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh5.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild
 rename drivers/gpu/drm/{ =3D> nouveau/dispnv04}/i2c/ch7006_drv.c (94%)
 rename drivers/gpu/drm/{ =3D> nouveau/dispnv04}/i2c/ch7006_mode.c (98%)
 rename drivers/gpu/drm/{ =3D> nouveau/dispnv04}/i2c/ch7006_priv.h (97%)
 rename drivers/gpu/drm/{ =3D> nouveau/dispnv04}/i2c/sil164_drv.c (92%)
 rename drivers/gpu/drm/{drm_encoder_slave.c =3D>
nouveau/dispnv04/nouveau_i2c_encoder.c} (54%)
 rename {include/drm =3D>
drivers/gpu/drm/nouveau/include/dispnv04}/i2c/ch7006.h (97%)
 rename include/drm/drm_encoder_slave.h =3D>
drivers/gpu/drm/nouveau/include/dispnv04/i2c/encoder_i2c.h (59%)
 rename {include/drm =3D>
drivers/gpu/drm/nouveau/include/dispnv04}/i2c/sil164.h (96%)
 create mode 100644 drivers/gpu/drm/panel/panel-raydium-rm67200.c
 create mode 100644 drivers/gpu/drm/panel/panel-summit.c
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm692e5.c
 create mode 100644 drivers/gpu/drm/scheduler/sched_internal.h
 create mode 100644 drivers/gpu/drm/tests/drm_atomic_state_test.c
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup.c
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_obj=
ect.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gtt_view_ty=
pes.h
 create mode 100644
drivers/gpu/drm/xe/compat-i915-headers/i915_scheduler_types.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_pxp_regs.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_pxp.c
 create mode 100644 drivers/gpu/drm/xe/xe_pxp.h
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.c
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.h
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h
 create mode 100644 drivers/gpu/nova-core/Kconfig
 create mode 100644 drivers/gpu/nova-core/Makefile
 create mode 100644 drivers/gpu/nova-core/driver.rs
 create mode 100644 drivers/gpu/nova-core/firmware.rs
 create mode 100644 drivers/gpu/nova-core/gpu.rs
 create mode 100644 drivers/gpu/nova-core/nova_core.rs
 create mode 100644 drivers/gpu/nova-core/regs.rs
 create mode 100644 drivers/gpu/nova-core/util.rs
 rename drivers/{gpu/drm =3D> media/cec}/i2c/tda9950.c (100%)
 create mode 100644 include/Kbuild
 create mode 100644 include/drm/Makefile
 create mode 100644 include/drm/drm_gpusvm.h
 create mode 100644 include/drm/drm_pagemap.h
 delete mode 100644 include/drm/i2c/tda998x.h
 create mode 100644 include/drm/ttm/ttm_backup.h
 create mode 100644 include/dt-bindings/clock/qcom,dsi-phy-28nm.h
