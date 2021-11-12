Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DB544E0C6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 04:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024C26E563;
	Fri, 12 Nov 2021 03:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EA06E563
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 03:25:42 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g14so32150297edz.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 19:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=1NweeYxTtg4+ynz3qQbTVzlhcT4fv1dH0dC6sTFuXH8=;
 b=fqe0JzUG2HncS26q2ZTcnBAUPGrIuwCah3/sr9qi6dOVDiiGdHdJBWGO+oE8yUtu1S
 EM4nP0R4A0d/kPIQUctqa/GKZiXLBgTySNiBDCamACNlkG0aucpffn4phDr8py3dlQh3
 IZNBqmsYc1CnRdsNZe905xdpj97oYHywupDWrv22FdBxPJbJSDbA9R4h5CB23Xz1BUf3
 uayio+XoWmoAJDrxzCLDbi2HC+VKsp+yCxkm+rPxzeCtBXHQEog1h9OKn3NVvO44TjBn
 8fcoiulkC4o239QLvJ2nV9r6/M1fSy4vE0ZjQJMNekAIPbMPQGRhqZ2vdlNZv227mwAW
 QBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=1NweeYxTtg4+ynz3qQbTVzlhcT4fv1dH0dC6sTFuXH8=;
 b=ikXdizDBpxdJjqqpLv9OlH4qEvc5Rv+jrE7mdxVvtgtbMnTdGGBdlX8fzI0BYTjF7L
 VtwvxFBzTjVjiKrd89Mx5eO3WB0Zi/5oS6DRHaruaNXRsY3MDaJhwaoK3pbKADhoNVv6
 ScmIo/OTGQXzIuPR0i81DNiBsf/bi52Ih2yhVkzEclqwAqxB8guvhiqIArU7IT7YfZXu
 L6ncqOPstOEeEzsUBJYYPaY4krCo0Mj0X29sCyJKKdcbKZUCfwfO5NkCsUdDPQl6bu4i
 rYDbaR5kos96FiZWTLhlSeH236Wz4jPBydbISLSdhgroQfKxcxZJphVj/aqczmQzGuVk
 dP5w==
X-Gm-Message-State: AOAM532YQQf349460YYbmD7Gb0U2YhmXpstnCzrnT43cxux0JFguqS12
 MuBFW5q0wZgqyxDi72mk4r3mp6BBWYF+f751Ulqjf6ULayM=
X-Google-Smtp-Source: ABdhPJzeVo1XrMFL03En8wxOacBDYQmBU+DnaRf9E2CWxTISb/m/gQhI7pImQJ/WX6mLdKTuzS3GK3/BnmwqQtb95B8=
X-Received: by 2002:a17:907:6da2:: with SMTP id
 sb34mr15888281ejc.509.1636687541130; 
 Thu, 11 Nov 2021 19:25:41 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 12 Nov 2021 13:25:30 +1000
Message-ID: <CAPM=9txVydO1fy8sEwVXRZF0zPfWwLYrk-UnGeKhRCEvrW4B7Q@mail.gmail.com>
Subject: [git pull] drm fixes + one missed next for 5.16-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

I missed a drm-misc-next pull for the main pull last week. It wasn't
that major and isn't the bulk of this at all. This has a bunch of
fixes all over, a lot for amdgpu and i915.

This contains a backmerge of 5.15 as we had a bunch of fixes queued up
in the past couple of days that were based on fixes that were in 5.15,
so I did a backmerge in so I could land them now instead of waiting
for post rc1. I think this also screwed up the diffstat.

Dave.


drm-next-2021-11-12:
drm next/fixes for 5.16-rc1

bridge:
- HPD improvements for lt9611uxc
- eDP aux-bus support for ps8640
- LVDS data-mapping selection support

ttm:
- remove huge page functionality (needs reworking)
- fix a race condition during BO eviction

panels:
- add some new panels

fbdev:
- fix double-free
- remove unused scrolling acceleration
- CONFIG_FB dep improvements

locking:
- improve contended locking logging
- naming collision fix

dma-buf:
- add dma_resv_for_each_fence iterator
- fix fence refcounting bug
- name locking fixesA

prime:
- fix object references during mmap

nouveau:
- various code style changes
- refcount fix
- device removal fixes
- protect client list with a mutex
- fix CE0 address calculation

i915:
- DP rates related fixes
- Revert disabling dual eDP that was causing state readout problems
- put the cdclk vtables in const data
- Fix DVO port type for older platforms
- Fix blankscreen by turning DP++ TMDS output buffers on encoder->shutdown
- CCS FBs related fixes
- Fix recursive lock in GuC submission
- Revert guc_id from i915_request tracepoint
- Build fix around dmabuf

amdgpu:
- GPU reset fix
- Aldebaran fix
- Yellow Carp fixes
- DCN2.1 DMCUB fix
- IOMMU regression fix for Picasso
- DSC display fixes
- BPC display calculation fixes
- Other misc display fixes
- Don't allow partial copy from user for DC debugfs
- SRIOV fixes
- GFX9 CSB pin count fix
- Various IP version check fixes
- DP 2.0 fixes
- Limit DCN1 MPO fix to DCN1

amdkfd:
- SVM fixes
- Fix gfx version for renoir
- Reset fixes

udl:
- timeout fix

imx:
- circular locking fix

virtio:
- NULL ptr deref fix
The following changes since commit d9bd054177fbd2c4762546aec40fc3071bfe4cc0=
:

  Merge tag 'amd-drm-next-5.16-2021-10-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-11-02
12:40:58 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2021-11-12

for you to fetch changes up to b6c24725249a6c1a889665d720cdff088f686f98:

  Merge tag 'drm-misc-fixes-2021-11-11' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next (2021-11-12
13:06:41 +1000)

----------------------------------------------------------------
drm next/fixes for 5.16-rc1

bridge:
- HPD improvments for lt9611uxc
- eDP aux-bus support for ps8640
- LVDS data-mapping selection support

ttm:
- remove huge page functionality (needs reworking)
- fix a race condition during BO eviction

panels:
- add some new panels

fbdev:
- fix double-free
- remove unused scrolling acceleration
- CONFIG_FB dep improvements

locking:
- improve contended locking logging
- naming collision fix

dma-buf:
- add dma_resv_for_each_fence iterator
- fix fence refcounting bug
- name locking fixesA

prime:
- fix object references during mmap

nouveau:
- various code style changes
- refcount fix
- device removal fixes
- protect client list with a mutex
- fix CE0 address calculation

i915:
- DP rates related fixes
- Revert disabling dual eDP that was causing state readout problems
- put the cdclk vtables in const data
- Fix DVO port type for older platforms
- Fix blankscreen by turning DP++ TMDS output buffers on encoder->shutdown
- CCS FBs related fixes
- Fix recursive lock in GuC submission
- Revert guc_id from i915_request tracepoint
- Build fix around dmabuf

amdgpu:
- GPU reset fix
- Aldebaran fix
- Yellow Carp fixes
- DCN2.1 DMCUB fix
- IOMMU regression fix for Picasso
- DSC display fixes
- BPC display calculation fixes
- Other misc display fixes
- Don't allow partial copy from user for DC debugfs
- SRIOV fixes
- GFX9 CSB pin count fix
- Various IP version check fixes
- DP 2.0 fixes
- Limit DCN1 MPO fix to DCN1

amdkfd:
- SVM fixes
- Fix gfx version for renoir
- Reset fixes

udl:
- timeout fix

imx:
- circular locking fix

virtio:
- NULL ptr deref fix

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: update RLC_PG_DELAY_3 Value to 200us for yellow carp

Alex Deucher (2):
      drm/amdgpu/powerplay: fix sysfs_emit/sysfs_emit_at handling
      drm/amdgpu: fix SI handling in amdgpu_device_asic_has_dc_support()

Alex Sierra (2):
      drm/amdkfd: avoid recursive lock in migrations back to RAM
      drm/amdkfd: lower the VAs base offset to 8KB

Alex Xu (Hello71) (1):
      drm/plane-helper: fix uninitialized variable reference

Amos Kong (1):
      drm/ttm_bo_api: update the description for @placement and @sg

Anand K Mistry (1):
      drm/prime: Fix use after free in mmap with drm_gem_ttm_mmap

Anson Jacob (2):
      drm/amd/display: Fix dcn10_log_hubp_states printf format string
      drm/amd/display: Add comment where CONFIG_DRM_AMD_DC_DCN macro ends

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.91

Aric Cyr (1):
      drm/amd/display: 3.2.160

Arnd Bergmann (1):
      drm: fb_helper: improve CONFIG_FB dependency

Aurabindo Pillai (1):
      drm/amd/display: add condition check for dmub notification

Ben Skeggs (1):
      ce/gf100: fix incorrect CE0 address calculation on some GPUs

Bing Guo (1):
      drm/amd/display: Fix bpc calculation for specific encodings

Chenyuan Mi (1):
      drm/nouveau/svm: Fix refcount leak bug and missing check against null=
 bug

Christian K=C3=B6nig (7):
      dma-buf: add dma_resv_for_each_fence v3
      dma-buf: use the new iterator in dma_buf_debug_show
      dma-buf: use the new iterator in dma_resv_poll
      drm/ttm: use the new iterator in ttm_bo_flush_all_fences
      drm/scheduler: use new iterator in
drm_sched_job_add_implicit_dependencies v2
      drm/i915: use the new iterator in i915_request_await_object v2
      drm: use new iterator in drm_gem_fence_array_add_implicit v3

Claudio Suarez (1):
      fbdev: Garbage collect fbdev scrolling acceleration, part 1
(from TODO list)

Dan Carpenter (1):
      drm/v3d: fix copy_from_user() error codes

Daniel Vetter (1):
      MAINTAINERS: dri-devel is for all of drivers/gpu

Dave Airlie (8):
      Merge tag 'drm-misc-next-2021-10-14' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-fixes-5.16-2021-11-03' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-fixes-2021-11-05' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-fixes-2021-11-09' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-fixes-2021-11-10' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-fixes-5.16-2021-11-10' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      BackMerge tag 'v5.15' into drm-next
      Merge tag 'drm-misc-fixes-2021-11-11' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next

David Heidelberg (1):
      dt-bindings: display: simple: hardware can use ddc-i2c-bus

Dmitry Baryshkov (5):
      drm/bridge/lontium-lt9611uxc: fix provided connector suport
      dt-bindings: add bindings for the Sharp LS060T1SX01 panel
      drm/panel: Add support for Sharp LS060T1SX01 panel
      dt-bindings: add bindings for the Sharp LS060T1SX01 panel
      drm/panel: Add support for Sharp LS060T1SX01 panel

Evan Quan (2):
      drm/amdgpu: correctly toggle gfx on/off around RLC_SPM_* register acc=
ess
      drm/amdgpu: fix uvd crash on Polaris12 during driver unloading

Fabio Estevam (1):
      Revert "drm/imx: Annotate dma-fence critical section in commit path"

Felipe Clark (1):
      drm/amd/display: Fix dummy p-state hang on monitors with extreme timi=
ng

Felix Kuehling (5):
      drm/amdkfd: Fix SVM_ATTR_PREFERRED_LOC
      drm/amdkfd: Avoid thrashing of stack and heap
      drm/amdkfd: Handle incomplete migration to system memory
      drm/amdgpu: Fix dangling kfd_bo pointer for shared BOs
      drm/amdkfd: Fix retry fault drain race conditions

Graham Sider (1):
      drm/amdkfd: update gfx target version for Renoir

Guangming Cao (1):
      dma-buf: acquire name lock before read/write dma_buf.name

Guchun Chen (2):
      drm/amdgpu: drop jpeg IP initialization in SRIOV case
      drm/amdgpu: add missed support for UVD IP_VERSION(3, 0, 64)

Guido G=C3=BCnther (5):
      drm/bridge: nwl-dsi: Add atomic_get_input_bus_fmts
      drm/panel: mantix: Add media bus format
      drm/panel: st7703: Add media bus format
      drm: mxsfb: Print failed bus format in hex
      drm: mxsfb: Set fallback bus format when the bridge doesn't provide o=
ne

Harry Wentland (1):
      drm/amd/display: Don't allow partial copy_from_user

Hersen Wu (1):
      drm/amd/display: dsc engine not disabled after unplug dsc mst hub

Imre Deak (4):
      drm/i915/dp: Ensure sink rate values are always valid
      drm/i915/dp: Ensure max link params are always valid
      drm/i915/fb: Fix rounding error in subsampled plane size calculation
      drm/i915/adlp/fb: Prevent the mapping of redundant trailing
padding NULL pages

Jake Wang (3):
      drm/amd/display: Added HPO HW control shutdown support
      drm/amd/display: Add MPC meory shutdown support
      drm/amd/display: Added new DMUB boot option for power optimization

James Zhu (1):
      drm/amdgpu: remove duplicated kfd_resume_iommu

Jani Nikula (4):
      drm/locking: add backtrace for locking contended locks without backof=
f
      Revert "drm/i915/bios: gracefully disable dual eDP for now"
      drm/i915/cdclk: put the cdclk vtables in const data
      drm/i915/dp: fix integer overflow in 128b/132b data rate calculation

Jason Gunthorpe (1):
      drm/ttm: remove ttm_bo_vm_insert_huge()

Jeremy Cline (3):
      drm/nouveau: use drm_dev_unplug() during device removal
      drm/nouveau: Add a dedicated mutex for the clients list
      drm/nouveau: clean up all clients on device removal

Jimmy Kizito (1):
      drm/amd/display: Clear encoder assignments when state cleared.

Jing Xiangfeng (1):
      drm/virtio: fix the missed drm_gem_object_put() in
virtio_gpu_user_framebuffer_create()

Jingwen Chen (1):
      drm/amd/amdgpu: fix bad job hw_fence use after free in advance tdr

Johan Hovold (1):
      drm/udl: fix control-message timeout

Joonas Lahtinen (1):
      drm/i915: Revert 'guc_id' from i915_request tracepoint

Karol Herbst (1):
      drm/nouveau/mmu/gp100: remove unused variable

Kent Russell (1):
      drm/amdgpu: Make sure to reserve BOs before adding or removing

Lee Jones (1):
      drm/nouveau/nouveau_bo: Remove unused variables 'dev'

Luo penghao (2):
      drm/nouveau/mmu: drop unneeded assignment in the nvkm_uvmm_mthd_page(=
)
      drm/nouveau/mmu/gp100-: drop unneeded assignment in the if condition.

Marek Vasut (3):
      drm/bridge: ti-sn65dsi83: Implement .detach callback
      dt-bindings: display: bridge: lvds-codec: Document LVDS data
mapping select
      drm/bridge: lvds-codec: Add support for LVDS data mapping select

Mario Limonciello (7):
      drm/amdgpu: Convert SMU version to decimal in debugfs
      drm/amdgpu/pm: drop pp_power_profile_mode support for yellow carp
      drm/amd/pm: Add missing mutex for pp_get_power_profile_mode
      drm/amd/pm: Adjust returns when power_profile_mode is not supported
      drm/amdgpu/pm: Don't show pp_power_profile_mode for unsupported devic=
es
      drm/amd/display: Look at firmware version to determine using dmub on =
dcn21
      drm/amd/pm: Correct DPMS disable IP version check

Matthew Auld (1):
      drm/i915/dmabuf: fix broken build

Matthew Brost (1):
      drm/i915/guc: Fix recursive lock in GuC submission

Michel D=C3=A4nzer (1):
      dma-buf/poll: Get a file reference for outstanding fence callbacks

Nicholas Kazlauskas (2):
      drm/amd/display: Don't lock connection_mutex for DMUB HPD
      drm/amd/display: Add callbacks for DMUB HPD IRQ notifications

Nikola Pavlica (2):
      dt-bindings: add vendor prefix for Vivax
      dt-bindings: display: simple: Add Vivax TPC-9150 panel

Oak Zeng (1):
      drm/amdgpu: use correct register mask to extract field

Oleksij Rempel (1):
      dt-bindings: display: simple: add Innolux G070Y2-T02 panel

Philip Chen (1):
      dt-bindings: drm/bridge: ps8640: Add aux-bus child

Randy Dunlap (1):
      drm/connector: fix all kernel-doc warnings

Roman Li (1):
      drm/amd/display: Force disable planes on any pipe split change

Sam Ravnborg (2):
      Revert "drm/panel: Add support for Sharp LS060T1SX01 panel"
      Revert "dt-bindings: add bindings for the Sharp LS060T1SX01 panel"

Shirish S (2):
      drm/amd/display: fix exit from amdgpu_dm_atomic_check() abruptly
      drm/amd/display: reject both non-zero src_x and src_y only for DCN1x

Simon Ser (1):
      drm/connector: refer to CTA-861-G in the "content type" prop docs

Stephen Rothwell (1):
      drm/locking: fix __stack_depot_* name conflict

S=C3=B8ren Andersen (1):
      drm/panel: panel-simple: add LOGIC Technologies LTTD800480070-L2RT pa=
nel

Tao Zhou (1):
      drm/amdgpu: correct xgmi ras error count reset

Tvrtko Ursulin (1):
      dma-resv: Fix dma_resv_get_fences and dma_resv_copy_fences after
conversion

Uwe Kleine-K=C3=B6nig (1):
      drm/panel: s6e63m0: Make s6e63m0_remove() return void

Ville Syrj=C3=A4l=C3=A4 (3):
      drm/i915: Extend the async flip VT-d w/a to skl/bxt
      drm/i915: Fix type1 DVI DP dual mode adapter heuristic for
modern platforms
      drm/i915/hdmi: Turn DP++ TMDS output buffers back on in
encoder->shutdown()

Vivek Kasireddy (1):
      drm/virtio: Fix NULL dereference error in virtio_gpu_poll

Wenjing Liu (1):
      drm/amd/display: fix register write sequence for LINK_SQUARE_PATTERN

Yang Yingliang (1):
      drm/nouveau/gem: remove redundant semi-colon

Yu-ting Shen (1):
      drm/amd/display: avoid link loss short pulse stuck the system

YuBiao Wang (2):
      drm/amd/amdgpu: Avoid writing GMC registers under sriov in gmc9
      drm/amd/amdgpu: Fix csb.bo pin_count leak on gfx 9

Zheyu Ma (1):
      fbdev: fbmem: Fix double free of 'fb_info->pixmap.addr'

Zhi A Wang (1):
      drm/i915/gvt: fix the usage of ww lock in gvt scheduler.

shaoyunl (2):
      drm/amd/amdkfd: Don't sent command to HWS on kfd reset
      drm/amd/amdgpu: fix the kfd pre_reset sequence in sriov

xinhui pan (1):
      drm/ttm: Double check mem_type of BO while eviction

yong yiran (1):
      drm/nouveau/nvenc: remove duplicate include in base.c

 .../bindings/display/bridge/lvds-codec.yaml        |  33 +-
 .../devicetree/bindings/display/bridge/ps8640.yaml |  19 +-
 .../bindings/display/panel/panel-simple.yaml       |   5 +
 .../bindings/display/panel/sharp,ls060t1sx01.yaml  |  56 +++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/gpu/todo.rst                         |  13 +-
 Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
 MAINTAINERS                                        |  17 +-
 Makefile                                           |   4 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts    |   2 +-
 .../boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts   |   2 +-
 .../boot/dts/freescale/imx8mm-kontron-n801x-s.dts  |   8 +-
 .../dts/freescale/imx8mm-kontron-n801x-som.dtsi    |   8 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   3 +-
 arch/arm64/net/bpf_jit_comp.c                      |   5 +
 arch/nds32/kernel/ftrace.c                         |   2 +-
 arch/nios2/platform/Kconfig.platform               |   1 +
 arch/powerpc/platforms/pseries/iommu.c             |  27 +-
 arch/riscv/Kconfig                                 |   6 +
 arch/riscv/include/asm/kasan.h                     |   3 +-
 arch/riscv/kernel/head.S                           |   1 +
 arch/riscv/mm/kasan_init.c                         |  14 +-
 arch/riscv/net/bpf_jit_core.c                      |   8 +-
 arch/s390/kvm/interrupt.c                          |   5 +-
 arch/s390/kvm/kvm-s390.c                           |   1 +
 arch/x86/crypto/sm4-aesni-avx-asm_64.S             |   6 +-
 arch/x86/crypto/sm4-aesni-avx2-asm_64.S            |   6 +-
 arch/x86/include/asm/kvm_host.h                    |   2 +-
 arch/x86/kvm/svm/sev.c                             |  15 +-
 arch/x86/kvm/x86.c                                 |  36 +-
 arch/x86/kvm/xen.c                                 |  27 +-
 block/blk-mq.c                                     |  13 +-
 block/blk-settings.c                               |  20 +-
 block/genhd.c                                      |  22 +-
 drivers/base/regmap/regcache-rbtree.c              |   7 +-
 drivers/clk/clk-composite.c                        |  10 +-
 drivers/dma-buf/dma-buf.c                          |  81 ++--
 drivers/dma-buf/dma-resv.c                         |  69 ++-
 drivers/gpio/gpio-mlxbf2.c                         |   5 +
 drivers/gpio/gpio-xgs-iproc.c                      |   2 +-
 drivers/gpu/drm/Kconfig                            |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  10 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   4 +
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   4 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   8 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |   4 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c           |  18 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |  24 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   2 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  50 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  70 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  92 ++--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  10 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 150 ++++--
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  14 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   8 +
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |  22 +
 drivers/gpu/drm/amd/display/dc/dc.h                |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   3 +
 drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h     |   4 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   6 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   3 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |   7 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   7 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |  78 ++--
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |   1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   6 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |  13 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |  14 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |   1 +
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |   1 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   4 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |   1 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |   2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   4 +
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1_ppsmc.h     |   4 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |  26 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |   8 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  10 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |   2 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.h    |  13 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |  12 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |   4 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |  14 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  13 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |  87 ----
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   9 +-
 drivers/gpu/drm/bridge/lvds-codec.c                |  76 ++-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |  35 ++
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  17 +-
 drivers/gpu/drm/drm_connector.c                    |  32 +-
 drivers/gpu/drm/drm_gem.c                          |  26 +-
 drivers/gpu/drm/drm_modeset_lock.c                 |  49 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |  12 +
 drivers/gpu/drm/drm_plane_helper.c                 |   1 -
 drivers/gpu/drm/drm_prime.c                        |   6 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   1 +
 drivers/gpu/drm/i915/display/intel_bios.c          | 132 +++---
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  44 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   1 +
 drivers/gpu/drm/i915/display/intel_display.c       |   9 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  34 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |   4 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  16 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |   7 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |   3 +-
 drivers/gpu/drm/i915/i915_request.c                |  34 +-
 drivers/gpu/drm/i915/i915_trace.h                  |   7 +-
 drivers/gpu/drm/imx/imx-drm-core.c                 |   2 -
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |   8 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   4 -
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  42 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |   5 +
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   4 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c              |   4 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |   3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c   |   1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c |   4 +-
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |   9 +
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |   3 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c  |   3 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |   4 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.h      |   2 +-
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    | 333 ++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               |  35 ++
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |   8 +
 drivers/gpu/drm/radeon/radeon_gem.c                |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  26 +-
 drivers/gpu/drm/selftests/test-drm_damage_helper.c |   1 +
 drivers/gpu/drm/ttm/ttm_bo.c                       |  19 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   1 +
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |  94 +---
 drivers/gpu/drm/udl/udl_connector.c                |   2 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |  13 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |   4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   4 -
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c         |  72 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c           |   3 -
 drivers/infiniband/core/sa_query.c                 |   5 +-
 drivers/infiniband/hw/hfi1/pio.c                   |   9 +-
 drivers/infiniband/hw/irdma/uk.c                   |   4 +-
 drivers/infiniband/hw/irdma/verbs.c                |   8 +-
 drivers/infiniband/hw/irdma/ws.c                   |  13 +-
 drivers/infiniband/hw/mlx5/mr.c                    |   2 +-
 drivers/infiniband/hw/mlx5/qp.c                    |   2 +
 drivers/infiniband/hw/qedr/qedr.h                  |   1 +
 drivers/infiniband/hw/qedr/qedr_iw_cm.c            |   2 +-
 drivers/infiniband/hw/qedr/verbs.c                 |   5 +-
 drivers/infiniband/hw/qib/qib_user_sdma.c          |  33 +-
 drivers/infiniband/sw/rdmavt/qp.c                  |   2 +-
 drivers/mmc/host/Kconfig                           |   2 +-
 drivers/mmc/host/cqhci-core.c                      |   3 +
 drivers/mmc/host/dw_mmc-exynos.c                   |  14 +
 drivers/mmc/host/mtk-sd.c                          |  38 +-
 drivers/mmc/host/sdhci-esdhc-imx.c                 |  16 +
 drivers/mmc/host/sdhci-pci-core.c                  |  29 +-
 drivers/mmc/host/sdhci.c                           |   6 +
 drivers/mmc/host/tmio_mmc_core.c                   |  17 +-
 drivers/mmc/host/vub300.c                          |  18 +-
 drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c |  16 +-
 .../ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c |  30 +-
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    |  35 +-
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.h    |   1 -
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c  |   5 +-
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_main.h  |   1 +
 drivers/net/ethernet/intel/ice/ice_lag.c           |  18 +-
 drivers/net/ethernet/intel/ice/ice_ptp.c           |   3 +
 .../ethernet/marvell/octeontx2/af/rvu_debugfs.c    | 148 ++++--
 .../net/ethernet/marvell/octeontx2/af/rvu_nix.c    |   3 +
 drivers/net/ethernet/mellanox/mlxsw/pci.c          |  25 +-
 drivers/net/ethernet/microchip/lan743x_main.c      |  35 +-
 drivers/net/ethernet/netronome/nfp/bpf/main.c      |  16 +-
 drivers/net/ethernet/netronome/nfp/bpf/main.h      |   2 +
 drivers/net/ethernet/netronome/nfp/bpf/offload.c   |  17 +-
 drivers/net/ethernet/nxp/lpc_eth.c                 |   5 +-
 drivers/net/ethernet/realtek/r8169_main.c          |   1 +
 drivers/net/phy/phy.c                              | 140 +++---
 drivers/net/usb/lan78xx.c                          |   6 +
 drivers/net/usb/usbnet.c                           |   1 +
 drivers/net/vmxnet3/vmxnet3_drv.c                  |   1 -
 drivers/net/xen-netfront.c                         |   8 +
 drivers/nfc/port100.c                              |   4 +-
 drivers/nvdimm/pmem.c                              |  33 +-
 drivers/nvme/host/tcp.c                            |   9 +-
 drivers/nvme/target/tcp.c                          |   7 +-
 drivers/reset/Kconfig                              |   4 +-
 drivers/reset/reset-brcmstb-rescal.c               |   2 +-
 drivers/reset/reset-socfpga.c                      |  26 ++
 drivers/reset/tegra/reset-bpmp.c                   |   9 +-
 drivers/scsi/ibmvscsi/ibmvfc.c                     |   3 +-
 drivers/scsi/mpt3sas/mpt3sas_scsih.c               |   9 +-
 drivers/scsi/ufs/ufs-exynos.c                      |   6 +-
 drivers/scsi/ufs/ufshcd.c                          |   7 +-
 drivers/scsi/ufs/ufshpb.c                          | 283 +-----------
 drivers/scsi/ufs/ufshpb.h                          |   2 -
 drivers/spi/spi-altera-dfl.c                       |   2 +-
 drivers/spi/spi-altera-platform.c                  |   2 +-
 drivers/spi/spi-pl022.c                            |   5 +-
 drivers/vdpa/vdpa_user/vduse_dev.c                 |  29 +-
 drivers/video/fbdev/core/bitblit.c                 |  16 -
 drivers/video/fbdev/core/fbcon.c                   | 509 +----------------=
----
 drivers/video/fbdev/core/fbcon.h                   |  59 ---
 drivers/video/fbdev/core/fbcon_ccw.c               |  28 +-
 drivers/video/fbdev/core/fbcon_cw.c                |  28 +-
 drivers/video/fbdev/core/fbcon_rotate.h            |   9 -
 drivers/video/fbdev/core/fbcon_ud.c                |  37 +-
 drivers/video/fbdev/core/fbmem.c                   |   5 +-
 drivers/video/fbdev/core/tileblit.c                |  16 -
 drivers/video/fbdev/skeletonfb.c                   |  12 +-
 drivers/virtio/virtio_ring.c                       |   2 +-
 drivers/watchdog/iTCO_wdt.c                        |  12 +-
 drivers/watchdog/ixp4xx_wdt.c                      |   2 +-
 drivers/watchdog/omap_wdt.c                        |   6 +-
 drivers/watchdog/sbsa_gwdt.c                       |   5 +-
 fs/btrfs/compression.c                             |   3 +-
 fs/btrfs/inode.c                                   |   3 +-
 fs/btrfs/lzo.c                                     |  36 +-
 fs/btrfs/zlib.c                                    |  36 +-
 fs/btrfs/zstd.c                                    |  27 +-
 fs/ocfs2/suballoc.c                                |  22 +-
 include/drm/drm_modeset_lock.h                     |   8 +
 include/drm/ttm/ttm_bo_api.h                       |   9 +-
 include/linux/bpf.h                                |   7 +-
 include/linux/bpf_types.h                          |   8 +-
 include/linux/dma-resv.h                           |  25 +-
 include/linux/fb.h                                 |   2 +-
 include/linux/filter.h                             |   1 +
 include/linux/page-flags.h                         |  23 +
 include/linux/skmsg.h                              |   1 +
 include/net/cfg80211.h                             |   2 -
 include/net/mptcp.h                                |   4 +
 include/net/sock.h                                 |   8 +-
 include/net/tls.h                                  |  11 +-
 include/net/udp.h                                  |   5 +-
 kernel/bpf/arraymap.c                              |   1 +
 kernel/bpf/core.c                                  |  24 +-
 kernel/bpf/syscall.c                               |  11 +-
 kernel/cgroup/cgroup.c                             |   4 +-
 kernel/trace/ftrace.c                              |  18 +-
 kernel/trace/trace_eprobe.c                        |   4 +-
 mm/damon/core-test.h                               |   4 +-
 mm/huge_memory.c                                   |   2 +
 mm/khugepaged.c                                    |  26 +-
 mm/memory-failure.c                                |  28 +-
 mm/memory.c                                        |   9 +
 mm/oom_kill.c                                      |  23 +-
 mm/page_alloc.c                                    |   8 +-
 mm/secretmem.c                                     |   2 +-
 mm/vmalloc.c                                       |  15 +-
 net/batman-adv/bridge_loop_avoidance.c             |   8 +-
 net/batman-adv/main.c                              |  56 ++-
 net/batman-adv/network-coding.c                    |   4 +-
 net/batman-adv/translation-table.c                 |   4 +-
 net/core/dev.c                                     |   9 +-
 net/core/net-sysfs.c                               |   4 +-
 net/core/skbuff.c                                  |  36 +-
 net/core/skmsg.c                                   |  14 +
 net/core/sock_destructor.h                         |  12 +
 net/core/sysctl_net_core.c                         |   2 +-
 net/ipv4/tcp.c                                     |   5 +-
 net/ipv4/tcp_bpf.c                                 |  27 +-
 net/ipv4/udp.c                                     |   3 +
 net/ipv4/udp_bpf.c                                 |   1 +
 net/mac80211/mesh.c                                |   9 +-
 net/mptcp/options.c                                |  39 +-
 net/sctp/sm_statefuns.c                            | 139 +++---
 net/smc/af_smc.c                                   |   2 +-
 net/smc/smc_llc.c                                  |   2 +-
 net/tipc/crypto.c                                  |  32 +-
 net/tls/tls_main.c                                 |   4 +-
 net/tls/tls_sw.c                                   |  21 +-
 net/unix/af_unix.c                                 |   4 +
 net/unix/unix_bpf.c                                |   2 +
 net/wireless/core.c                                |   2 +-
 net/wireless/core.h                                |   2 +
 net/wireless/mlme.c                                |  26 +-
 net/wireless/scan.c                                |   7 +-
 net/wireless/util.c                                |  14 +-
 tools/perf/Makefile.perf                           |   2 +
 tools/perf/arch/powerpc/util/skip-callchain-idx.c  |   2 +-
 tools/perf/builtin-script.c                        |  14 +-
 .../selftests/bpf/prog_tests/sockmap_listen.c      |  75 +--
 tools/testing/selftests/net/fcnal-test.sh          |   3 +
 tools/testing/selftests/vm/split_huge_page_test.c  |   2 +-
 309 files changed, 3186 insertions(+), 2578 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
 create mode 100644 net/core/sock_destructor.h
