Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D61683CF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 08:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EFA897DC;
	Mon, 15 Jul 2019 06:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E27894FF
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 06:59:53 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id 16so14993849ljv.10
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2019 23:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1vzIGLkhKfdYb6uG3QmWWfri/+BmViT1NfvBJK4NXmc=;
 b=kSkzH+1m6UyAyddyB7xpNuQj+s5Ye1qiUT/oY40mGGpVfu6iafNXLCcj9esTrZbqzS
 OxQOUZ1xN9pjrzsIks+bLDefkC21j1cQ3KC8lhuMuGpk1GpTgIn3pm+RNPGIEqAYFSK9
 xTNZSlVaz2G/11WlxeUUcgI6jkledm3sVRHnt1jGSnfZtYa7pqegY0ocRCvfRtio66a2
 cMahgXabUKtjSX5dbwMo/5/PZS02ReuHrvYb9WD1y5bDGWOn38IZhktC1jyh3Bo5hrDZ
 L0It+X3N9lzr9Z6BdZ4Tg8n17QdM1WXDRRwnqgXkVhXK+h1M+diywsTHKXYajhp5pu/o
 T23A==
X-Gm-Message-State: APjAAAXttQzg8BkglnxfkM0Go5OLyZKrUE1g/NPa7koMs1x5wjXSpkmP
 fUn8Vb5VNz8ohv7SHVLYCdANAqMeHUVZkG1CEdY=
X-Google-Smtp-Source: APXvYqz4R74gzejbEcTlpvzSRAoB6JIMOrsI3TXdbWPJuuUeTvmac+j2JyMa9I+cAkPRMy/v0ka/h/NDA+k/p68KCxs=
X-Received: by 2002:a2e:9a10:: with SMTP id o16mr12856057lji.95.1563173991355; 
 Sun, 14 Jul 2019 23:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
In-Reply-To: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 15 Jul 2019 16:59:39 +1000
Message-ID: <CAPM=9tx+CEkzmLZ-93GZmde9xzJ_rw3PJZxFu_pjZJc7KM5f-w@mail.gmail.com>
Subject: Re:DRM pull for v5.3-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1vzIGLkhKfdYb6uG3QmWWfri/+BmViT1NfvBJK4NXmc=;
 b=A69g1OK1WuKvgd4vKLiwawU60+ldogHcHiuduenJbCOmpR29fnrwBV5W5Q3TXnZRod
 6XFRaYpp4kZbkPtWc2erI/+ez/dZ0ySQNEW4uVQZM/egVAPqHwizPn8f8orjBT0LmMI1
 q7fccsDBjxdf25Qd/blm8nbuK7plUyqewbeEWttAXypgT7uEgH76DzUpJkbUf1XUFMJT
 TsbrsO+QzAYvig/Lo0PuROpWmVFO0rXyXFhGVKMNruydV8OuoQ2uFUDZr1VIgTr2dmVq
 oSXh4hTXjUCE5lGwrvC+S8r9vFA++FzKJxxQ3VxSUAEJM6mOTE1gpR1fSKUTszlkc4Wi
 dawQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============0945371510=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0945371510==
Content-Type: multipart/alternative; boundary="0000000000007a1aac058db2ce97"

--0000000000007a1aac058db2ce97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

And of course a subject line

On Mon., 15 Jul. 2019, 16:38 Dave Airlie, <airlied@gmail.com> wrote:

> Hi Linus,
>
> Main pull request for drm for 5.3. This merge window seems to be
> conflictful and it conincides with myself and most of my family
> getting hit with a strain of influenza A, and it feels like
> freedesktop.org git is especially slow today.
>
> I was waiting for the HMM tree to land, and I now have a bunch of fun
> merge conflicts to resolve.
>
> I've created a branch
>
> https://cgit.freedesktop.org/drm/drm/log/?h=3Ddrm-next-5.3-backmerge-conf=
licts
> git://anongit.freedesktop.org/drm/drm drm-next-5.3-backmerge-conflicts
>
> Most of them are trivial enough, two probably need better explainations:
>
> VMware had some mm helpers go in via my tree (looking back I'm not
> sure Thomas really secured enough acks on these, but I'm going with it
> for now until I get push back). They conflicted with one of the mm
> cleanups in the hmm tree, I've pushed a patch to the top of my next to
> fix most of the fallout in my tree, and the resulting fixup is to pick
> the closure->ptefn hunk and apply something like in mm/memory.c
>
> @@ -2201,7 +2162,7 @@ static int apply_to_page_range_wrapper(pte_t *pte,
>         struct page_range_apply *pra =3D
>                 container_of(pter, typeof(*pra), pter);
>
> -       return pra->fn(pte, NULL, addr, pra->data);
> +       return pra->fn(pte, addr, pra->data);
>  }
>
> Then there is the one hmm merge fixup below.
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -783,7 +783,7 @@ int amdgpu_ttm_tt_get_user_pages(struct ttm_tt
> *ttm, struct page **pages)
>                                 0 : range->flags[HMM_PFN_WRITE];
>         range->pfn_flags_mask =3D 0;
>         range->pfns =3D pfns;
>  -     hmm_range_register(range, mm, start,
>  +     hmm_range_register(range, mirror, start,
>                            start + ttm->num_pages * PAGE_SIZE, PAGE_SHIFT=
);
>
> There are also a Kconfig conflict in mm, and an i915 Makefile conflict
> that standout.
>
> Feel free to just pull the resolved tree if you want, or get back to
> me if this is too messy.
>
> The biggest thing in this apart from the mm/hmm dancing, is the AMD
> Navi GPU support, this again contains a bunch of header files that are
> large. These are the new AMD RX5700 GPUs that just recently became
> available.
>
> Thanks,
> Dave.
>
> New drivers:
> ST-Ericsson MCDE driver
> Ingenic JZ47xx SoC
>
> UAPI change:
> HDR source metadata property
>
> Core:
> - HDR inforframes and EDID parsing
> - drm hdmi infoframe unpacking
> - remove prime sg_table caching into dma-buf
> - New gem vram helpers to reduce driver code
> - Lots of drmP.h removal
> - reservation fencing fix
> - documentation updates
> - drm_fb_helper_connector removed
> - mode name command handler rewrite
>
> fbcon:
> - Remove the fbcon notifiers
>
> ttm:
> - forward progress fixes
>
> dma-buf:
> - make mmap call optional
> - debugfs refcount fixes
> - dma-fence free with pending signals fix
> - each dma-buf gets an inode
>
> Panels:
> - Lots of additional panel bindings
>
> amdgpu:
> - initial navi10 support
> - avoid hw reset
> - HDR metadata support
> - new thermal sensors for vega asics
> - RAS fixes
> - use HMM rather than MMU notifier
> - xgmi topology via kfd
> - SR-IOV fixes
> - driver reload fixes
> - DC use a core bpc attribute
> - Aux fixes for DC
> - Bandwidth calc updates for DC
> - Clock handling refactor
> - kfd VEGAM support
>
> vmwgfx:
> - Coherent memory support changes
>
> i915:
> - HDR Support
> - HDMI i2c link
> - Icelake multi-segmented gamma support
> - GuC firmware update
> - Mule Creek Canyon PCH support for EHL
> - EHL platform updtes
> - move i915.alpha_support to i915.force_probe
> - runtime PM refactoring
> - VBT parsing refactoring
> - DSI fixes
> - struct mutex dependency reduction
> - GEM code reorg
>
> mali-dp:
> - Komeda driver features
>
> msm:
> - dsi vs EPROBE_DEFER fixes
> - msm8998 snapdragon 835 support
> - a540 gpu support
> - mdp5 and dpu interconnect support
>
> exynos:
> - drmP.h removal
>
> tegra:
> - misc fixes
>
> tda998x:
> - audio support improvements
> - pixel repeated mode support
> - quantisation range handling corrections
> - HDMI vendor info fix
>
> armada:
> - interlace support fix
> - overlay/video plane register handling refactor
> - add gamma support
>
> rockchip:
> - RX3328 support
>
> panfrost:
> - expose perf counters via hidden ioctls
>
> vkms:
> - enumerate CRC sources list
> ast:
> - rework BO handling
>
> mgag200:
> - rework BO handling
>
> dw-hdmi:
> - suspend/resume support
>
> rcar-du:
> - R8A774A1 Soc Support
> - LVDS dual-link mode support
> - Additional formats
> - Misc fixes
>
> omapdrm:
> - DSI command mode display support
>
> stm
> - fb modifier support
> - runtime PM support
>
> sun4i:
> - use vmap ops
>
> vc4:
> - binner bo binding rework
>
> v3d:
> - compute shader support
> - resync/sync fixes
> - job management refactoring
>
> lima:
> - NULL pointer in irq handler fix
> - scheduler default timeout
>
> virtio:
> - fence seqno support
> - trace events
>
> bochs:
> - misc fixes
>
> tc458767:
> - IRQ/HDP handling
>
> sii902x:
> - HDMI audio support
>
> atmel-hlcdc:
> - misc fixes
>
> meson:
> - zpos support
>
> drm-next-2019-07-15-1:
> drm main pull request for 5.3-rc1
> The following changes since commit
> 6116b892bd4fd0ddc5f30566a556218bb2e1a9b6:
>
>   vga_switcheroo: Depend upon fbcon being built-in, if enabled
> (2019-06-26 10:36:49 +0200)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm tags/drm-next-2019-07-15-1
>
> for you to fetch changes up to 6dfc43d3a19174faead54575c204aee106225f43:
>
>   mm: adjust apply_to_pfn_range interface for dropped token.
> (2019-07-15 15:16:20 +1000)
>
> ----------------------------------------------------------------
> drm main pull request for 5.3-rc1
>
> ----------------------------------------------------------------
> Abhinav Kumar (2):
>       drm/msm/dsi: add protection against NULL dsi device
>       drm/msm/dpu: add icc voting in dpu_mdss_init
>
> Aditya Swarup (1):
>       drm/i915/icl: Fix setting 10 bit deep color mode
>
> Aidan Wood (2):
>       drm/amd/display: Properly set DCF clock
>       drm/amd/display: Properly set u clock
>
> Alex Deucher (37):
>       drm/amdgpu/vega20: use mode1 reset for RAS and XGMI
>       drm/amdgpu: use pcie_bandwidth_available rather than open coding it
>       drm/amdgpu/soc15: skip reset on init
>       drm/amdgpu: fix a race in GPU reset with IB test (v2)
>       drm/amdgpu/display: Drop some new CONFIG_DRM_AMD_DC_DCN1_01 guards
>       Revert "drm/amdgpu: add DRIVER_SYNCOBJ_TIMELINE to amdgpu"
>       drm/amdgpu: return 0 by default in amdgpu_pm_load_smu_firmware
>       drm/amdgpu: wait to fetch the vbios until after common init
>       Revert "drm/amd/display: make clk_mgr call enable_pme_wa"
>       Revert "drm/amd/display: Add Underflow Asserts to dc"
>       Revert "drm/amd/display: move vmid determination logic out of dc"
>       Revert "drm/amd/display: Rework CRTC color management"
>       Revert "drm/amd/display: Use macro for invalid OPP ID"
>       Revert "drm/amd/display: Copy stream updates onto streams"
>       drm/amdgpu: add Navi10 pci ids
>       drm/amd/powerplay/smu11: remove smu_update_table_with_arg
>       drm/amdgpu/powerplay: add license to smu11 header
>       drm/amdgpu/powerplay/vega20: use correct table index
>       drm/amdgpu/gfx10: update to latest golden setting
>       drm/amd/display: add fast_validate parameter to
> dcn20_validate_bandwidth
>       drm/amd/display: updates for dcn20_update_bandwidth
>       drm/amd/display: update dcn2 dc_plane_cap
>       drm/amdgpu: drop unused df init callback
>       Merge branch 'drm-next' into drm-next-5.3
>       drm/amdgpu/powerplay: FEATURE_MASK is 64 bit so use ULL
>       drm/amdgpu/display: switch udelay to msleep
>       drm/amdgpu/display: drop ifdefs around comments
>       drm/amdgpu: fix warning on 32 bit
>       drm/amdgpu: drop copy/paste leftover to fix big endian
>       drm/amdgpu/gfx9: use reset default for PA_SC_FIFO_SIZE
>       drm/amdgpu/gfx10: use reset default for PA_SC_FIFO_SIZE
>       drm/amdgpu/display: fix interrupt client id for navi
>       drm/amdgpu: properly guard DC support in navi code
>       drm/amdgpu/psp11: simplify the ucode register logic
>       drm/amdgpu: add missing documentation on new module parameters
>       drm/amdgpu: properly guard the generic discovery code
>       drm/amdgpu/navi10: add uclk activity sensor
>
> Amber Lin (1):
>       drm/amdkfd: Add domain number into gpu_id
>
> Andreas Pretzsch (1):
>       drm/panel: simple: Add support for EDT ET035012DM6
>
> Andres Rodriguez (2):
>       drm/edid: parse CEA blocks embedded in DisplayID
>       drm/edid: use for_each_displayid_db where applicable
>
> Andrew F. Davis (3):
>       dma-buf: Remove leftover [un]map_atomic comments
>       dma-buf: Update [un]map documentation to match the other functions
>       dma-buf: Make mmap callback actually optional
>
> Andrey Grodzovsky (5):
>       drm/sched: Keep s_fence->parent pointer
>       drm/scheduler: Add flag to hint the release of guilty job.
>       drm/amdgpu: Avoid HW reset if guilty job already signaled.
>       drm/sched: Fix static checker warning for potential NULL ptr
>       drm/sched: Fix make htmldocs warnings.
>
> Anthony Koo (5):
>       drm/amd/display: fix multi display seamless boot case
>       drm/amd/display: do not power on eDP power rail early
>       drm/amd/display: fix issues with bad AUX reply on some displays
>       drm/amd/display: fix issue with eDP not detected on driver load
>       drm/amd/display: do not power on eDP power rail early
>
> Aric Cyr (11):
>       drm/amd/display: 3.2.28
>       drm/amd/display: 3.2.29
>       drm/amd/display: 3.2.30
>       drm/amd/display: Use VCP for extended colorimetry
>       drm/amd/display: 3.2.31
>       drm/amd/display: 3.2.32
>       drm/amd/display: program manual trigger only for bottom most pipe
>       drm/amd/display: 3.2.33
>       drm/amd/display: 3.2.34
>       drm/amd/display: 3.2.35
>       drm/amd/display: Intermittent DCN2 pipe hang on mode change
>
> Arnd Bergmann (6):
>       drm/amdgpu: fix error handling in df_v3_6_pmc_start
>       drm/komeda: fix 32-bit komeda_crtc_update_clock_ratio
>       amdgpu: make pmu support optional
>       drm/amd/display: dcn20: include linux/delay.h
>       drm/amd/powerplay: vega20: fix uninitialized variable use
>       drm/amd/display: avoid 64-bit division
>
> Ayan Halder (1):
>       drm/komeda: Make Komeda interrupts shareable
>
> Benjamin Gaignard (1):
>       drm/stm: ltdc: restore calls to clk_{enable/disable}
>
> Bhawanpreet Lakha (1):
>       drm/amd/powerplay: Fix maybe-uninitialized in get_ppfeature_status
>
> Biju Das (4):
>       dt-bindings: display: renesas: du: Document the r8a774a1 bindings
>       dt-bindings: display: renesas: lvds: Document r8a774a1 bindings
>       drm: rcar-du: Add R8A774A1 support
>       drm: rcar-du: lvds: Add r8a774a1 support
>
> Bob Yang (1):
>       drm/amd/display: fixed DCC corruption
>
> Boris Brezillon (4):
>       drm/panfrost: Move gpu_{write, read}() macros to panfrost_regs.h
>       drm/panfrost: Add a module parameter to expose unstable ioctls
>       drm/panfrost: Add an helper to check the GPU generation
>       drm/panfrost: Expose performance counters through unstable ioctls
>
> Brian Masney (2):
>       drm/msm: correct attempted NULL pointer dereference in put_iova
>       drm/msm: add dirty framebuffer helper
>
> Charlene Liu (20):
>       drm/amd/display: add SW_USE_I2C_REG request.
>       drm/amd/display: color space ycbcr709 support
>       drm/amd/display: reset retimer/redriver below 340Mhz
>       drm/amd/display: define v_total_min and max parameters
>       drm/amd/display: enabling stream after HPD low to high happened
>       drm/amd/display: add some math functions for dcn_calc_math
>       drm/amd/display: add audio related regs
>       drm/amd/display: dcn2 dmcu wait_for_loop update with dispclk.
>       drm/amd/display: fix can not turn on two displays due to
> DSC_RESOURCE failed.
>       drm/amd/display: Add hubp_init entry to hubp vtable
>       drm/amd/display: add SW_USE_I2C_REG request.
>       drm/amd/display: Create DWB resource for DCN2
>       drm/amd/display: [backport] dwb dm + efc support
>       drm/amd/display: used optimum VSTARTUP instead of MaxVStartup
>       drm/amd/display: Return UPDATE_TYPE_FULL on writeback update
>       drm/amd/display: add some parameters to validate bandwidth function=
s
>       drm/amd/display: add dwb stere caps and version
>       drm/amd/display: add p010 and ayuv plane caps
>       drm/amd/display: dcn2 use fixed clocks.
>       drm/amd/display: expose dentist_get_did_from_divider
>
> Chengming Gui (3):
>       drm/amd/powerplay: Enable "disable dpm" feature to support swSMU
> debug (v2)
>       drm/amd/powerplay: Fix code error for translating int type to
> bool type correctly
>       drm/amd/powerplay: add set_power_profile_mode for raven1_refresh
>
> Chia-I Wu (4):
>       drm/virtio: set seqno for dma-fence
>       drm/virtio: trace drm_fence_emit
>       drm/virtio: add trace events for commands
>       drm/virtio: allocate fences with GFP_KERNEL
>
> Chris Park (5):
>       drm/amd/display: Support AVI InfoFrame V3 and V4
>       drm/amd/display: Define Byte 14 on AVI InfoFrame
>       drm/amd/display: Move link functions from dc to dc_link
>       drm/amd/display: Clean up scdc_test_data struct
>       drm/amd/display: Move link functions from dc to dc_link
>
> Chris Wilson (150):
>       drm/i915: Verify workarounds immediately after application
>       drm/i915: Verify the engine workarounds stick on application
>       drm/i915: Make workaround verification *optional*
>       drm/i915: Avoid use-after-free in reporting create.size
>       drm/i915: Stop overwriting RING_IMR in rcs resume
>       drm/i915: Setup the RCS ring prior to execution
>       drm/i915: Remove unwarranted clamping for hsw/bdw
>       drm/i915: Track HAS_RPS alongside HAS_RC6 in the device info
>       drm/i915: Expose the busyspin durations for i915_wait_request
>       drm/i915/gtt: Skip clearing the GGTT under gen6+ full-ppgtt
>       drm/i915: Start writeback from the shrinker
>       dma-buf: Remove unused sync_dump()
>       drm/i915: Store the default sseu setup on the engine
>       drm/i915/selftests: Verify whitelist of context registers
>       drm/i915: Move GraphicsTechnology files under gt/
>       drm/i915: Introduce struct intel_wakeref
>       drm/i915: Pull the GEM powermangement coupling into its own file
>       drm/i915: Introduce context->enter() and context->exit()
>       drm/i915: Pass intel_context to i915_request_create()
>       drm/i915: Invert the GEM wakeref hierarchy
>       drm/i915: Explicitly pin the logical context for execbuf
>       drm/i915: Allow multiple user handles to the same VM
>       drm/i915: Disable preemption and sleeping while using the punit
> sideband
>       drm/i915: Lift acquiring the vlv punit magic to a common sb-get
>       drm/i915: Lift sideband locking for vlv_punit_(read|write)
>       drm/i915: Replace pcu_lock with sb_lock
>       drm/i915: Separate sideband declarations to intel_sideband.h
>       drm/i915: Merge sbi read/write into a single accessor
>       drm/i915: Merge sandybridge_pcode_(read|write)
>       drm/i915: Move sandybride pcode access to intel_sideband.c
>       drm/i915/ringbuffer: EMIT_INVALIDATE *before* switch context
>       drm/i915: Enable render context support for Ironlake (gen5)
>       drm/i915: Enable render context support for gen4 (Broadwater to
> Cantiga)
>       drm/i915/gvt: Pin the per-engine GVT shadow contexts
>       drm/i915: Export intel_context_instance()
>       drm/i915/selftests: Use the real kernel context for sseu isolation
> tests
>       drm/i915/selftests: Pass around intel_context for sseu
>       drm/i915: Pass intel_context to intel_context_pin_lock()
>       drm/i915: Split engine setup/init into two phases
>       drm/i915: Switch back to an array of logical per-engine HW contexts
>       drm/i915: Remove intel_context.active_link
>       drm/i915: Move i915_request_alloc into selftests/
>       drm/i915: Skip unused contexts for context_barrier_task()
>       drm/i915: Wait for the struct_mutex on idling
>       drm/i915: Move the engine->destroy() vfunc onto the engine
>       drm/i915: Complete both freed-object passes before draining the
> workqueue
>       drm/i915: Include fence signaled bit in print_request()
>       drm/i915/guc: Fix runtime suspend
>       drm/i915/execlists: Flush the tasklet on parking
>       drm/i915: Leave engine parking to the engines
>       drm/i915/hangcheck: Track context changes
>       drm/i915: Delay semaphore submission until the start of the signale=
r
>       drm/i915: Disable semaphore busywaits on saturated systems
>       drm/i915: Acquire the signaler's timeline HWSP last
>       drm/i915: Assert breadcrumbs are correctly ordered in the signal
> handler
>       drm/i915: Prefer checking the wakeref itself rather than the counte=
r
>       drm/i915: Assert the local engine->wakeref is active
>       drm/i915: Flush the switch-to-kernel-context harder for DROP_IDLE
>       drm/i915: Remove delay for idle_work
>       drm/i915: Cancel retire_worker on parking
>       drm/i915: Stop spinning for DROP_IDLE (debugfs/i915_drop_caches)
>       drm/i915: Only reschedule the submission tasklet if preemption is
> possible
>       drm/i915/execlists: Don't apply priority boost for resets
>       drm/i915: Reboot CI if forcewake fails
>       drm/i915/hangcheck: Replace hangcheck.seqno with RING_HEAD
>       drm/i915: Seal races between async GPU cancellation, retirement
> and signaling
>       drm/i915: Rearrange i915_scheduler.c
>       drm/i915: Pass i915_sched_node around internally
>       drm/i915: Check for no-op priority changes first
>       drm/i915: Mark semaphores as complete on unsubmit out if payload
> was started
>       drm/i915: Truly bump ready tasks ahead of busywaits
>       drm/i915/dp: Initialise locals for static analysis
>       drm/i915/hdcp: Use both bits for device_count
>       drm/i915: Bump signaler priority on adding a waiter
>       drm/i915: Downgrade NEWCLIENT to non-preemptive
>       drm/i915/execlists: Drop promotion on unsubmit
>       drm/i915: Restore control over ppgtt for context creation ABI
>       drm/i915: Allow a context to define its set of engines
>       drm/i915: Extend I915_CONTEXT_PARAM_SSEU to support local
> ctx->engine[]
>       drm/i915: Re-expose SINGLE_TIMELINE flags for context creation
>       drm/i915: Allow userspace to clone contexts on creation
>       drm/i915: Load balancing across a virtual engine
>       drm/i915: Apply an execution_mask to the virtual_engine
>       drm/i915: Extend execution fence to support a callback
>       drm/i915/execlists: Virtual engine bonding
>       drm/i915: Allow specification of parallel execbuf
>       drm/i915/gtt: Always acquire struct_mutex for gen6_ppgtt_cleanup
>       drm/i915/gtt: Neuter the deferred unbind callback from
> gen6_ppgtt_cleanup
>       drm/i915: Keep user GGTT alive for a minimum of 250ms
>       drm/i915: Kill the undead intel_context.c zombie
>       drm/i915: Split GEM object type definition to its own header
>       drm/i915: Pull GEM ioctls interface to its own file
>       drm/i915: Move object->pages API to i915_gem_object.[ch]
>       drm/i915: Move shmem object setup to its own file
>       drm/i915: Move phys objects to its own file
>       drm/i915: Move mmap and friends to its own file
>       drm/i915: Move GEM domain management to its own file
>       drm/i915: Move more GEM objects under gem/
>       drm/i915: Pull scatterlist utils out of i915_gem.h
>       drm/i915: Move GEM object domain management from struct_mutex to
> local
>       drm/i915: Move GEM object waiting to its own file
>       drm/i915: Move GEM object busy checking to its own file
>       drm/i915: Move GEM client throttling to its own file
>       drm/i915: Rename intel_context.active to .inflight
>       drm/i915: Drop the deferred active reference
>       drm/i915: Take a runtime pm wakeref for atomic commits
>       drm/i915: Avoid refcount_inc on known zero count
>       drm/i915/gtt: Avoid overflowing the WC stash
>       drm/i915: Drop check for non-NULL entry in llist_for_each_entry_saf=
e
>       drm/i915: Make default value for i915.mmio_debug a compile time
> option
>       drm/i915: Track the purgeable objects on a separate eviction list
>       drm/i915: Report all objects with allocated pages to the shrinker
>       drm/i915/selftests: Flush partial-tiling object once
>       drm/i915: Use unchecked writes for setting up the fences
>       drm/i915: Use unchecked uncore writes to flush the GTT
>       drm: Flush output polling on shutdown
>       drm/i915/gtt: Replace struct_mutex serialisation for allocation
>       dma-buf: Discard old fence_excl on retrying get_fences_rcu for
> realloc
>       drm/i915: Move object close under its own lock
>       drm/i915: Skip context_barrier emission for unused contexts
>       drm/i915: Report an earlier wedged event when suspending the engine=
s
>       dma-fence: Signal all callbacks from dma_fence_release()
>       drm/i915: Allow interrupts when taking the timeline->mutex
>       drm/i915: Promote i915->mm.obj_lock to be irqsafe
>       drm/i915: Pull kref into i915_address_space
>       drm/i915: Rename i915_hw_ppgtt to i915_ppgtt
>       drm/i915: Add a label for config DRM_I915_SPIN_REQUEST
>       drm/i915: Prevent lock-cycles between GPU waits and GPU resets
>       drm/i915: Combine unbound/bound list tracking for objects
>       dma-fence/reservation: Markup rcu protected access for DEBUG_MUTEXE=
S
>       drm/i915: kerneldoc warnings squelched
>       drm/i915: Move fence register tracking from i915->mm to ggtt
>       drm/i915: Enable refcount debugging for default debug levels
>       drm/i915: Discard some redundant cache domain flushes
>       drm/i915: Execute signal callbacks from no-op i915_request_wait
>       drm/i915: Refine i915_reset.lock_map
>       drm/i915: Keep contexts pinned until after the next kernel context
> switch
>       drm/i915: Stop retiring along engine
>       drm/i915: Replace engine->timeline with a plain list
>       drm/i915: Avoid tainting i915_gem_park() with wakeref.lock
>       drm/i915/gtt: Serialise both updates to PDE and our shadow
>       drm/i915/guc: Reduce verbosity on log overflows
>       drm/i915: Keep engine alive as we retire the context
>       drm/i915: Use drm_gem_object.resv
>       drm/i915: Skip shrinking already freed pages
>       drm/i915/selftests: Flush live_evict
>       drm/i915: Don't dereference request if it may have been retired
> when printing
>       drm/i915: Make the semaphore saturation mask global
>       drm/i915/execlists: Detect cross-contamination with GuC
>       drm/i915: Stop passing I915_WAIT_LOCKED to i915_request_wait()
>
> Christian K=C3=B6nig (18):
>       drm/i915: remove DRM_AUTH from IOCTLs which also have
> DRM_RENDER_ALLOW
>       drm/scheduler: rework job destruction
>       MAINTAINERS: drop Jerry as TTM maintainer
>       dma-buf: start caching of sg_table objects v2
>       drm: remove prime sg_table caching
>       drm/amdgpu: rename amdgpu_prime.[ch] into amdgpu_dma_buf.[ch]
>       drm/amdgpu: remove static GDS, GWS and OA allocation
>       drm/ttm: Make LRU removal optional v2
>       drm/ttm: return immediately in case of a signal
>       drm/ttm: remove manual placement preference
>       drm/ttm: cleanup ttm_bo_mem_space
>       drm/ttm: immediately move BOs to the new LRU v3
>       drm/ttm: fix busy memory to fail other user v10
>       drm/ttm: fix ttm_bo_unreserve
>       drm/amdgpu: drop some validation failure messages
>       drm/amdgpu: create GDS, GWS and OA in system domain
>       drm/amdgpu: stop removing BOs from the LRU v3
>       drm/amdgpu: disable concurrent flushes for Navi10 v2
>
> Chunming Zhou (2):
>       drm/amdgpu: add DRIVER_SYNCOBJ_TIMELINE to amdgpu
>       drm/amd/display: use ttm_eu_reserve_buffers instead of
> amdgpu_bo_reserve v2
>
> Claudiu Beznea (3):
>       drm: atmel-hlcdc: add config option for clock selection
>       drm: atmel-hlcdc: avoid initializing cfg with zero
>       drm/atmel-hlcdc: revert shift by 8
>
> Clinton Taylor (1):
>       drm/i915/icl: Set GCP_COLOR_INDICATION only for 10/12 bit deep colo=
r
>
> Cl=C3=A9ment P=C3=A9ron (2):
>       drm: panfrost: add optional bus_clock
>       dt-bindings: gpu: mali-midgard: Add H6 mali gpu compatible
>
> Colin Ian King (6):
>       drm/amdgpu: fix spelling mistake "retrived" -> "retrieved"
>       drm/i915/gtt: set err to -ENOMEM on memory allocation failure
>       drm/amdkfd: fix null pointer dereference on dev
>       drm/i915: fix use of uninitialized pointer vaddr
>       drm/bridge: sii902x: fix comparision of u32 with less than zero
>       drm/amd/display: fix a couple of spelling mistakes
>
> Dan Carpenter (5):
>       drm/i915: selftest_lrc: Check the correct variable
>       drm/bridge: sii902x: re-order conditions to prevent out of bounds
> read
>       drm/amdgpu: Fix bounds checking in amdgpu_ras_is_supported()
>       drm/mcde: Fix an uninitialized variable
>       drm: self_refresh: Fix a reversed condition in
> drm_self_refresh_helper_cleanup()
>
> Daniel Drake (1):
>       drm/i915/fbc: disable framebuffer compression on GeminiLake
>
> Daniel He (1):
>       drm/amd/display: Modified AUX_DPHY_RX_CONTROL0
>
> Daniel Vetter (17):
>       drm/doc: Improve docs for conn_state->best_encoder
>       drm: Some ocd in drm_file.c
>       drm/doc: More fine-tuning on userspace review requirements
>       drm/docs: More links for implicit/explicit fencing.
>       drm/crc-debugfs: User irqsafe spinlock in drm_crtc_add_crc_entry
>       drm/vkms: Forward timer right after drm_crtc_handle_vblank
>       drm/crc-debugfs: Also sprinkle irqrestore over early exits
>       Merge tag 'du-next-20190608-2' of
> git://linuxtv.org/pinchartl/media into drm-next
>       Merge tag 'omapdrm-5.3' of git://git.kernel.org/.../tomba/linux
> into drm-next
>       drm/fb: document dirty helper better
>       drm/ast: Drop fb_debug_enter/leave
>       Merge tag 'drm-misc-next-2019-06-14' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-next
>       drm/todo: Improve drm_gem_object funcs todo
>       drm/gem: Unexport drm_gem_(un)pin/v(un)map
>       drm/vkms: Move format arrays to vkms_plane.c
>       Merge v5.2-rc5 into drm-next
>       drm/todo: Update drm_gem_object_funcs todo even more
>
> Daniele Ceraolo Spurio (12):
>       drm/i915: extract intel_display_power.h/c from intel_runtime_pm.h/c
>       drm/i915: move more defs in intel_display_power.h
>       drm/i915/guc: always use Command Transport Buffers
>       drm/i915/wopcm: update default size for gen11+
>       drm/i915: prefer i915_runtime_pm in intel_runtime function
>       drm/i915: Remove rpm asserts that use i915
>       drm/i915: make enable/disable rpm assert function use the rpm
> structure
>       drm/i915: move and rename i915_runtime_pm
>       drm/i915: move a few more functions to accept the rpm structure
>       drm/i915: update rpm_get/put to use the rpm structure
>       drm/i915: update with_intel_runtime_pm to use the rpm structure
>       drm/i915: make intel_wakeref work on the rpm struct
>
> Dave Airlie (20):
>       Merge tag 'drm-misc-next-2019-05-24' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-next
>       Merge tag 'drm-intel-next-2019-05-24' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-next
>       Merge branch 'drm-next-5.3' of
> git://people.freedesktop.org/~agd5f/linux into drm-next
>       Merge tag 'drm-misc-next-2019-06-05' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-next
>       Merge branch 'drm-next-5.3' of
> git://people.freedesktop.org/~agd5f/linux into drm-next
>       Merge branch 'vmwgfx-next' of
> git://people.freedesktop.org/~thomash/linux into drm-next
>       Merge tag 'drm-misc-next-2019-06-20' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-next
>       Merge tag 'drm-intel-next-2019-06-19' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-next
>       Merge commit 'refs/for-upstream/mali-dp' of
> git://linux-arm.org/linux-ld into drm-next
>       Merge tag 'drm/tegra/for-5.3-rc1' of
> git://anongit.freedesktop.org/tegra/linux into drm-next
>       Merge tag 'for-airlie-tda998x' of
> git://git.armlinux.org.uk/~rmk/linux-arm into drm-next
>       Merge tag 'drm-next-5.3-2019-06-25' of
> git://people.freedesktop.org/~agd5f/linux into drm-next
>       Merge tag 'drm-msm-next-2019-06-25' of
> https://gitlab.freedesktop.org/drm/msm into drm-next
>       Merge tag 'exynos-drm-next-for-v5.3' of
> git://git.kernel.org/.../daeinki/drm-exynos into drm-next
>       Merge tag 'for-airlie-armada' of
> git://git.armlinux.org.uk/~rmk/linux-arm into drm-next
>       Merge tag 'drm-misc-next-fixes-2019-06-27' of
> git://anongit.freedesktop.org/drm/drm-misc into drm-next
>       Merge tag 'drm-next-5.3-2019-06-27' of
> git://people.freedesktop.org/~agd5f/linux into drm-next
>       Merge tag 'drm-next-5.3-2019-07-09' of
> git://people.freedesktop.org/~agd5f/linux into drm-next
>       Merge tag 'imx-drm-next-2019-07-05' of
> git://git.pengutronix.de/git/pza/linux into drm-next
>       mm: adjust apply_to_pfn_range interface for dropped token.
>
> David Riley (4):
>       drm/virtio: Ensure cached capset entries are valid before copying.
>       drm/virtio: Wake up all waiters when capset response comes in.
>       drm/virtio: Fix cache entry creation race.
>       drm/virtio: Add memory barriers for capset cache.
>
> Deepak Rawat (2):
>       drm/vmwgfx: Add debug message for layout change ioctl
>       drm/vmwgfx: Use VMW_DEBUG_KMS for vmwgfx mode-setting user errors
>
> Derek Lai (1):
>       drm/amd/display: add i2c_hw_Status check to make sure as HW I2c in
> use
>
> Dmytro Laktyushkin (14):
>       drm/amd/display: move signal type out of otg dlg params
>       drm/amd/display: stop external access to internal optc sync params
>       drm/amd/display: fix acquire_first_split_pipe function
>       drm/amd/display: add null checks and set update flags
>       drm/amd/display: move vmid determination logic out of dc
>       drm/amd/display: clean up validation failure log spam
>       drm/amd/display: fix dsc validation
>       drm/amd/display: fix fpga fclk programming
>       drm/amd/display: fix dcn2 mpc split decision
>       drm/amd/display: fix odm mpo disable
>       drm/amd/display: fix macro_tile_size for tiling
>       drm/amd/display: add null checks and set update flags for DCN2
>       drm/amd/display: move vmid determination logic to a module
>       drm/amd/display: add missing mod_vmid destructor
>
> Dongli Zhang (1):
>       drm/i915: remove unused IO_TLB_SEGPAGES which should be defined by
> swiotlb
>
> Dongwon Kim (1):
>       drm/i915/gen11: enable support for headerless msgs
>
> Douglas Anderson (7):
>       dt-bindings: drm/bridge/synopsys: dw-hdmi: Add "unwedge" for ddc bu=
s
>       drm/bridge/synopsys: dw-hdmi: Add "unwedge" for ddc bus
>       drm/bridge/synopsys: dw-hdmi: Fix unwedge crash when no pinctrl
> entries
>       drm: bridge: dw-hdmi: Add hook for resume
>       drm/rockchip: dw_hdmi: Handle suspend/resume
>       drm/rockchip: Properly adjust to a true clock in adjusted_mode
>       drm/rockchip: Base adjustments of the mode based on prev adjustment=
s
>
> Emil Velikov (2):
>       drm/virtio: remove irrelevant DRM_UNLOCKED flag
>       drm/omap: remove open-coded drm_invalid_op()
>
> Emily Deng (5):
>       drm/amdgpu: fix unload driver fail
>       drm/amdgpu: Need to set the baco cap before baco reset
>       drm/amdgpu:Fix the unpin warning about csb buffer
>       drm/amdgpu/sriov: Correct some register program method
>       drm/amdgpu/display: Fix reload driver error
>
> Eric Anholt (11):
>       drm/v3d: Switch the type of job-> to reduce casting.
>       drm/v3d: Refactor job management.
>       drm/v3d: Add support for compute shader dispatch.
>       drm/v3d: Drop reservation of a shared slot in the dma-buf
> reservations.
>       drm/v3d: Add missing implicit synchronization.
>       drm/doc: Allow new UAPI to be used once it's in
> drm-next/drm-misc-next.
>       drm/doc: Document expectation that userspace review looks at kernel
> uAPI.
>       drm/v3d: Fix debugfs reads of MMU regs.
>       drm/v3d: Set the correct DMA mask according to the MMU's limits.
>       drm/v3d: Dump V3D error debug registers in debugfs, and one at rese=
t.
>       drm/v3d: Fix and extend MMU error handling.
>
> Eric Bernstein (5):
>       drm/amd/display: Refactor DIO stream encoder
>       drm/amd/display: Dont aser if DP_DPHY_INTERNAL_CTRL
>       drm/amd/display: Refactor DIO stream encoder
>       drm/amd/display: Alpha plane type
>       drm/amd/display: expose enable dp output functions
>
> Eric Yang (8):
>       drm/amd/display: Set dispclk and dprefclock directly
>       drm/amd/display: move back vbios cmd table for set dprefclk
>       drm/amd/display: make clk mgr soc specific
>       drm/amd/display: Move CLK_BASE_INNER macro
>       drm/amd/display: move clk_mgr files to right place
>       drm/amd/display: Fix type of pp_smu_wm_set_range struct
>       drm/amd/display: Refactor clk_mgr functions
>       drm/amd/display: Refactor clk_mgr functions
>
> Erico Nunes (2):
>       drm/lima: add timeout to drm scheduler init
>       drm/scheduler: Fix job cleanup without timeout handler
>
> Ernst Sj=C3=B6strand (6):
>       drm/amd/amdgpu: Indent AMD_IS_APU properly
>       drm/amd/amdgpu: Fix amdgpu_set_pp_od_clk_voltage error check
>       drm/amd/amdgpu: amdgpu_hwmon_show_temp: initialize temp
>       drm/amd/amdgpu: Check stream in amdgpu_dm_commit_planes
>       drm/amd/amdgpu: Fix style issues in dcn20_resource.c
>       drm/amd/amdgpu: sdma_v4_0_start: initialize r
>
> Eryk Brol (5):
>       drm/amd/display: Disable audio stream only if it's currently enable=
d
>       drm/amd/display: Ensure DRR triggers in BP
>       drm/amd/display: Increase Backlight Gain Step Size
>       drm/amd/display: Ensure DRR triggers in BP
>       drm/amd/display: Change DCN2 vupdate start programming
>
> Evan Quan (33):
>       drm/amd/powerplay: support hotspot/memory critical limit values
>       drm/amd/powerplay: support temperature emergency max values
>       drm/amd/powerplay: support SMU metrics table on Vega12
>       drm/amd/powerplay: expose current hotspot and memory temperatures V=
2
>       drm/amd/powerplay: support hwmon temperature channel labels V2
>       drm/amd/powerplay: expose Vega12 current power
>       drm/amd/powerplay: expose Vega12 current gpu activity
>       drm/amd/powerplay: expose Vega20 realtime memory utilization
>       drm/amd/powerplay: expose Vega12 realtime memory utilization
>       drm/amd/powerplay: expose SMU7 asics realtime memory utilization
>       drm/amdgpu: add new sysfs interface for memory realtime utilization
>       drm/amdgpu: enable separate timeout setting for every ring type V4
>       drm/amd/powerplay: fix Vega10 mclk/socclk voltage link setup
>       drm/amd/powerplay: valid Vega10 DPMTABLE_OD_UPDATE_VDDC settings V2
>       drm/amd/powerplay: avoid repeat AVFS enablement/disablement
>       drm/amd/powerplay: update Vega10 power state on OD
>       drm/amd/powerplay: force to update all clock tables on OD reset
>       drm/amd/powerplay: update Vega10 ACG Avfs Gb parameters
>       drm/amd/powerplay: drop unnecessary sw smu check
>       drm/amd/powerplay: drop redundant smu call
>       drm/amd/powerplay: support ppfeatures sysfs interface on sw smu
> routine
>       drm/amd/powerplay: honor hw limit on fetching metrics data
>       drm/amd/powerplay: support uclk activity retrieve on sw smu routine
>       drm/amd/powerplay: support sw smu hotspot and memory temperature
> retrieval
>       drm/amd/powerplay: fix sw SMU wrong UVD/VCE powergate setting
>       drm/amd/powerplay: enable ppfeaturemask module parameter support on
> Vega20
>       drm/amd/powerplay: check gfxclk dpm enablement before proceeding
>       drm/amd/powerplay: check prerequisite for VCN power gating
>       drm/amd/powerplay: support runtime ppfeatures setting on Navi10
>       drm/amd/powerplay: add missing smu_get_clk_info_from_vbios() call
>       drm/amd/powerplay: no memory activity support on Vega10
>       drm/amdgpu: fix MGPU fan boost enablement for XGMI reset
>       drm/amd/powerplay: use hardware fan control if no powerplay fan tab=
le
>
> Fabien Dessenne (2):
>       drm/stm: ltdc: manage the get_irq probe defer case
>       drm/stm: ltdc: return appropriate error code during probe
>
> Fabio Estevam (4):
>       dt-bindings: Add vendor prefix for VXT Ltd
>       dt-bindings: Add VXT VL050-8048NT-C01 panel bindings
>       drm/panel: simple: Add support for VXT VL050-8048NT-C01 panel
>       drm/damage-helper: Use NULL instead of 0
>
> Felix Kuehling (10):
>       drm/amdgpu: Reserve shared fence for eviction fence
>       drm/amdgpu: Improve error handling for HMM
>       drm/amdkfd: Fix a circular lock dependency
>       drm/amdkfd: Simplify eviction state logic
>       drm/ttm: return -EBUSY if waiting for busy BO fails
>       drm/amdkfd: Print a warning when the runlist becomes oversubscribed
>       drm/amdgpu: Use FENCE_OWNER_KFD in process_sync_pds_resv
>       drm/amdgpu: Fix tracking of invalid userptrs
>       drm/amdkfd: Add chained_runlist_idle_disable flag to pm4_mes_runlis=
t
>       drm/amdkfd: Disable idle optimization for chained runlist
>
> Fernando Pacheco (5):
>       drm/i915/uc: Rename uC firmware init/fini functions
>       drm/i915/uc: Reserve upper range of GGTT
>       drm/i915/uc: Place uC firmware in upper range of GGTT
>       Revert "drm/i915/guc: Disable global reset"
>       drm/i915/selftests: Check that gpu reset is usable from atomic
> context
>
> Flora Cui (1):
>       drm/amdgpu: fix scheduler timeout calc
>
> Fuqian Huang (1):
>       drm/amdgpu: Use kmemdup rather than duplicating its implementation
>
> Gary Kattan (1):
>       drm/amd/display: Implement CM dealpha and bias interfaces
>
> Geert Uytterhoeven (2):
>       drm/i915: Grammar s/the its/its/
>       drm/amd/display: Add missing newline at end of file
>
> Gen Zhang (1):
>       drm/edid: Fix a missing-check bug in drm_load_edid_firmware()
>
> Georgi Djakov (1):
>       drm/msm/mdp5: Use the interconnect API
>
> Gerd Hoffmann (2):
>       drm/cirrus: remove leftover files
>       drm/virtio: drop framebuffer dirty tracking code
>
> Greg Hackmann (3):
>       dma-buf: give each buffer a full-fledged inode
>       dma-buf: add DMA_BUF_SET_NAME ioctls
>       dma-buf: add show_fdinfo handler
>
> Greg Kroah-Hartman (17):
>       vga_switcheroo: no need to check return value of debugfs_create
> functions
>       panel: rocktech: no need to check return value of debugfs_create
> functions
>       drm: no need to check return value of debugfs_create functions
>       sti: no need to check return value of debugfs_create functions
>       host1x: debugfs_create_dir() can never return NULL
>       radeon: no need to check return value of debugfs_create functions
>       amdgpu: no need to check return value of debugfs_create functions
>       amdkfd: no need to check return value of debugfs_create functions
>       amdgpu_dm: no need to check return value of debugfs_create function=
s
>       drm: debugfs: make drm_debugfs_create_files() never fail
>       drm/vc4: no need to check return value of debugfs_create functions
>       drm/i915: no need to check return value of debugfs_create functions
>       msm: adreno: no need to check return value of debugfs_create
> functions
>       msm: dpu1: no need to check return value of debugfs_create function=
s
>       msm: no need to check return value of debugfs_create functions
>       komeda: no need to check return value of debugfs_create functions
>       malidp: no need to check return value of debugfs_create functions
>
> Gurchetan Singh (1):
>       drm/virtio: use u64_to_user_ptr macro
>
> Gwan-gyeong Mun (6):
>       drm/i915/dp: Add a config function for YCBCR420 outputs
>       drm: Rename struct edp_vsc_psr to struct dp_sdp
>       drm/i915/dp: Program VSC Header and DB for Pixel
> Encoding/Colorimetry Format
>       drm/i915/dp: Add a support of YCBCR 4:2:0 to DP MSA
>       drm/i915/dp: Change a link bandwidth computation for DP
>       drm/i915/dp: Support DP ports YUV 4:2:0 output to GEN11
>
> Hans de Goede (7):
>       drm/i915/dsi: Call drm_connector_cleanup on vlv_dsi_init error exit
> path
>       drm/i915/dsi: Use a fuzzy check for burst mode clock check
>       drm: panel-orientation-quirks: Add quirk for GPD pocket2
>       drm: panel-orientation-quirks: Add quirk for GPD MicroPC
>       drm/i915/dsi: Move logging of DSI VBT parameters to a helper functi=
on
>       drm/i915/dsi: Move vlv/icl_dphy_param_init call out of
> intel_dsi_vbt_init (v2)
>       drm/i915/dsi: Read back pclk set by GOP and use that as pclk (v3)
>
> Hariprasad Kelam (2):
>       drm/bridge: analogix_dp: possible condition with no effect (if =3D=
=3D
> else)
>       drm/amd/display: fix compilation error
>
> Harish Kasiviswanathan (1):
>       drm/amdkfd: Fix compute profile switching
>
> Harmanprit Tatla (1):
>       drm/amd/display: Gamma logic limitations causing unintended use
> of RAM over ROM.
>
> Harry Wentland (26):
>       drm/amd/display: Add ASICREV_IS_PICASSO
>       drm/amd/display: Don't load DMCU for Raven 1 (v2)
>       drm/amd/display: Drop DCN1_01 guards
>       drm/amd/display: Read soc_bounding_box from gpu_info (v2)
>       drm/amd/display: Add DCN2 and NV ASIC ID
>       drm/amd/display: add AUX and I2C for DCN2
>       drm/amd/display: Add GPIO support for DCN2
>       drm/amd/display: Add DCN2 BIOS parsing
>       drm/amd/display: Add DCN2 IRQ handling
>       drm/amd/display: Add DCN2 changes to DML
>       drm/amd/display: Add DCN2 DIO
>       drm/amd/display: Add DCN2 clk mgr
>       drm/amd/display: Add DCN2 OPTC
>       drm/amd/display: Add DCN2 OPP
>       drm/amd/display: Add DCN2 MPC
>       drm/amd/display: Add DCN2 DPP
>       drm/amd/display: Add DCN2 HUBP and HUBBUB
>       drm/amd/display: Add DCN2 MMHUBBUB
>       drm/amd/display: Add DCN2 DWB
>       drm/amd/display: Add DCN2 IPP
>       drm/amd/display: Add DCN2 VMID
>       drm/amd/display: Add DCN2 HW Sequencer and Resource
>       drm/amd/display: Add DC core changes for DCN2
>       drm/amd/display: Hook DCN2 into amdgpu_dm and expose as config (v2)
>       drm/amdgpu: Enable DC support for Navi10
>       drm/amd/display: Add DSC support for Navi (v2)
>
> Hawking Zhang (83):
>       drm/amdgpu/psp: udpate ta_ras interface header
>       drm/amdgpu: add ATHUB 2.0 register headers
>       drm/amdgpu: add CLK 11.0 register headers
>       drm/amdgpu: add DCN 2.0 register headers
>       drm/amdgpu: add HDP 5.0 register headers
>       drm/amdgpu: add MP 11.0 register headers
>       drm/amdgpu: add NBIO 2.3 register headers
>       drm/amdgpu: add VCN 2.0 register headers
>       drm/amdgpu: add GC 10.1 register headers (v4)
>       drm/amdgpu: add MMHUB 2.0 register headers
>       drm/amdgpu: add OSS 5.0 register headers
>       drm/amdgpu: add SMUIO 11.0 register headers
>       drm/amdgpu: add navi10 enums header
>       drm/amdgpu: atomfirmware.h updates for navi10
>       drm/amdgpu: add doorbell assignement for navi10
>       drm/amdgpu: add navi10 ip offset header
>       drm/amdgpu: Add GDDR6 in vram_name arrary
>       drm/amdgpu: add gfx10 specific config in amdgpu_gfx_config
>       drm/amdgpu: add gfx10 specific new member
> pa_sc_tile_steering_override
>       drm/amdgpu: add gpu_info_firmware v1_1 structure for navi10
>       drm/amdgpu: parse the new members added by gpu_info ucode v1_1
>       drm/amdgpu: add sdma v5 packet header file
>       drm/amdgpu: add navi pm4 header
>       drm/amdgpu: query vram type from atomfirmware vram_info
>       drm/amdgpu: query vram_width from vram_info table
>       drm/amdgpu: add nbio v2.3 for navi10 (v4)
>       drm/amdgpu/gfx10: new approach to load pfp fw (v4)
>       drm/amdgpu/gfx10: new approach to load ce fw (v4)
>       drm/amdgpu/gfx10: new approach to load gfx10 me fw (v4)
>       drm/amdgpu: add members in amdgpu_me for gfx queue
>       drm/amdgpu: acquire available gfx queues
>       drm/amdgpu: add helper function for gfx queue/bitmap transition
>       drm/amdgpu: rename amdgpu_gfx_compute_mqd_sw_init
>       drm/amdgpu: Move common code to amdgpu_gfx.c
>       drm/amdgpu: enable gfx eop interrupt per gfx pipe
>       drm/amdgpu: add module parameter for async_gfx_ring enablement
>       drm/amdgpu: create mqd for gfx queues on navi10
>       drm/amdgpu: add new HDP CG flags
>       drm/amdgpu: add flag to support IH clock gating
>       drm/amdgpu: correct pte mtype field for navi
>       drm/amd/gmc9: rename AMDGPU_PTE_MTYPE to AMDGPU_PTE_MTYPE_VG10
>       drm/amdgpu: add gfxhub v2.0 block for navi10 (v4)
>       drm/amdgpu: add mmhub v2 block for navi10 (v4)
>       drm/amdgpu: add gmc v10 ip block for navi10 (v6)
>       drm/amdgpu: add irq sources for gfx v10_1
>       drm/amdgpu: add irq sources for sdma v5_0
>       drm/amdgpu: add irq sources for vcn v2_0 (v2)
>       drm/amd/display: move dcn v1_0 irq source header to ivsrcid/dcn/
>       drm/amdgpu: add navi10 ih ip block (v3)
>       drm/amdgpu: add structure to support build-in toc to psp sos
>       drm/amdgpu/psp: support init psp sos microcode with build-in toc
>       drm/amdgpu: use rlc toc from psp sos binary
>       drm/amdgpu: rename rlc autoload to backdoor autoload
>       drm/amdgpu: add helper function to print psp hdr
>       drm/amdgpu/psp: print out psp v11 ucode hdr in drm debug mode
>       drm/amdgpu/psp: support print out psp firmware header v1_1 info
>       drm/amdgpu/psp: add structure to support load toc in psp (v2)
>       drm/amdgpu/psp: add support to load TOC to psp
>       drm/amdgpu/psp: start rlc autoload after psp recieved all gfx
> firmware
>       drm/amdgpu/psp: switch to use sos_offset_bytes member as sys_bin_si=
ze
>       drm/amdgpu/psp: perform tmr_init and asd_init after loading
> sysdrv/sos
>       drm/amdgpu/psp: update psp gfx interface to match with psp fw (v2)
>       drm/amdgpu/psp: initialize autoload_supported flag in psp_sw_init
>       drm/amd/amdgpu: add flag to mark whether autoload is supported or n=
ot
>       drm/amdgpu/psp: skip mec jt when autoload is enabled
>       drm/amdgpu: enable psp front door loading by default on navi10
>       drm/amdgpu: declare navi10 asd firmware
>       drm/amdgpu/psp11: skip ta firmware for navi10
>       drm/amdgpu: add pa_sc_tile_steering_override to
> drm_amdgpu_info_device
>       drm/amdgpu: set the default value of pa_sc_tile_steering_override
>       drm/amdgpu: add initial support for sdma v5.0 (v6)
>       drm/amdgpu: add gfx v10 implementation (v10)
>       drm/amdgpu: avoid to use SOC15_REG_OFFSET in static array for navi1=
0
>       drm/amdgpu: add navi10 common ip block (v3)
>       drm/amdgpu: Add navi10 kfd support for amdgpu (v3)
>       drm/amdgpu: update golden setting programming logic
>       drm/amdgpu: enable sw smu driver for navi10 by default
>       drm/amd/powerplay: remove uvd_gated/vce_gated from smu_power_contex=
t
> (v2)
>       drm/amd/powerplay: move get_thermal_temperature_range to ppt funcs
>       drm/amd/powerplay: fix no statements in function returning non-void
>       drm/amdgpu: initialize THM & CLK IP registers base address
>       drm/amd/display: enable DSC support by default
>       drm/amdgpu: fix modprobe failure for uvd_4/5/6
>
> Huang Rui (40):
>       drm/amdgpu: add navi10 asic type
>       drm/amdgpu: add NV series gpu family id
>       drm/amdgpu: add GDDR6 vram type
>       drm/amdgpu: add navi10 gpu info firmware
>       drm/amdgpu: add v10 structs header (v2)
>       drm/amdgpu: add gfx v10 clear state header v2
>       drm/amdgpu: set navi10's fw loading type as direct
>       drm/amdgpu: load smc ucode at first with psp while rlc auto load
> is supported
>       drm/amdgpu: add to set navi ip blocks
>       drm/amd/powerplay: update smu v11 ppsmc header
>       drm/amd/powerplay: update smu 11 driver if header for navi10
>       drm/amd/powerplay: fix the mp/smuio header for navi10
>       drm/amd/powerplay: introduce the navi10 pptable implementation
>       drm/amd/powerplay: set smu v11 funcs for navi10
>       drm/amd/powerplay: add navi10 smc ucode init and navi10 ppt
> functions setting
>       drm/amd/powerplay: move bootup value before read pptable from vbios
>       drm/amd/powerplay: update smu11 driver if header for navi10 (v2)
>       drm/amdgpu: bump smc firmware header version to v2 (v2)
>       drm/amdgpu: fix the issue of checking on message mapping
>       drm/amd/powerplay: smu needs to be initialized after rlc in direct
> mode
>       drm/amd/powerplay: introduce the function to load the soft
> pptable for navi10 (v2)
>       drm/amd/powerplay: modify the feature mask to enable gfx/soc dpm
>       drm/amd/powerplay: skip od feature on navi10 for the moment
>       drm/amd/powerplay: introduce smu clk type to handle ppclk for each
> asic
>       drm/amd/powerplay: introduce smu feature type to handle feature
> mask for each asic
>       drm/amd/powerplay: introduce smu table id type to handle the smu
> table for each asic
>       drm/amd/powerplay: init table_count for smu tables on asic level
>       drm/amd/powerplay: add tables_init interface for each asic
>       drm/amd/powerplay: modify smu_update_table to use SMU_TABLE_xxx
> as the input
>       drm/amd/powerplay: use the table size member in the structure
> instead of getting directly
>       drm/amd/powerplay: move PPTable_t uses into asic level
>       drm/amd/powerplay: move SmuMetrics_t uses into asic level
>       drm/amd/powerplay: move Watermarks_t uses into asic level
>       drm/amd/powerplay: introduce smu power source type to handle
> AC/DC source for each asic
>       drm/amd/powerplay: move getting MAX_FAN_RPM value to asic level
>       drm/amd/powerplay: don't include the smu11 driver if header in
> smu v11 (v2)
>       drm/amd/powerplay: do not set dpm_enabled flag before VCN/DCN
> DPM is workable
>       drm/amd/powerplay: set dpm_enabled flag but don't enable vcn dpm
>       drm/amd/powerplay: make mmhub pg bit configured by pg_flags
>       drm/amd/powerplay: make athub pg bit configured by pg_flags
>
> Hugo Hu (1):
>       drm/amd/display: Don't use ROM for output TF if GAMMA_CS_TFM_1D
>
> Icenowy Zheng (1):
>       dt-bindings: gpu: add bus clock for Mali Midgard GPUs
>
> Ilya Bakoulin (8):
>       drm/amd/display: Add writeback_config to VBA vars
>       drm/amd/display: Add writeback_config to VBA vars
>       drm/amd/display: Fix DCFCLK and SOCCLK not set
>       drm/amd/display: Fix ODM combine data format
>       drm/amd/display: Fix LB BPP and Cursor width
>       drm/amd/display: Drive-by fixes for display_mode_vba
>       drm/amd/display: Fix incorrect DML output_bpp value
>       drm/amd/display: Fix incorrect vba type
>
> Imre Deak (19):
>       drm/i915/icl: Fix MG_DP_MODE() register programming
>       drm/i915/icl: Factor out combo PHY lane power setup helper
>       drm/i915/icl: Add missing combo PHY lane power setup
>       drm/i915: Tune down WARN about incorrect VBT TC legacy flag
>       drm/i915/icl: More workaround for port F detection due to broken VB=
Ts
>       drm/i915: Add support for tracking wakerefs w/o power-on guarantee
>       drm/i915: Force printing wakeref tacking during pm_cleanup
>       drm/i915: Verify power domains state during suspend in all cases
>       drm/i915: Add support for asynchronous display power disabling
>       drm/i915: Disable power asynchronously during DP AUX transfers
>       drm/i915: WARN for eDP encoders in intel_dp_detect_dpcd()
>       drm/i915: Remove the unneeded AUX power ref from intel_dp_detect()
>       drm/i915: Remove the unneeded AUX power ref from intel_dp_hpd_pulse=
()
>       drm/i915: Replace use of PLLS power domain with DISPLAY_CORE domain
>       drm/i915: Avoid taking the PPS lock for non-eDP/VLV/CHV
>       drm/i915: Assert that TypeC ports are not used for eDP
>       drm/i915/icl: Fix AUX-B HW not done issue w/o AUX-A
>       drm/mst: Fix MST sideband up-reply failure handling
>       drm/i915/icl: Ensure port A combo PHY HW state is correct
>
> Jack Xiao (51):
>       drm/amdgpu/gfx10: add special unmap_queues packet for preemption
>       drm/amdgpu: enable async gfx ring by default
>       drm/amdgpu/athub2: enable athub2 clock gating
>       drm/amdgpu: refine the PTE encoding of PRT for navi10
>       drm/amdgpu: add the trailing fence per ring
>       drm/amdgpu: add mcbp driver parameter
>       drm/amdgpu: enable the static csa when mcbp enabled
>       drm/amdgpu: add ib preemption status in amdgpu_job (v2)
>       drm/amdgpu/sdma: allocate CSA per sdma ring
>       drm/amdgpu: program for resuming preempted ib
>       drm/amdgpu: add mcbp unit test in debugfs (v3)
>       drm/amdgpu: mark the partial job as preempted in mcbp unit test
>       drm/amdgpu/mes: add amdgpu_mes driver parameter
>       drm/amdgpu/mes: add mes header file and definition
>       drm/amdgpu/mes: add definitions of ip callback function
>       drm/amdgpu/mes: enable mes on navi10 and later asic
>       drm/amdgpu/mes10.1: add ip block mes10.1 (v2)
>       drm/amdgpu/gfx10: fix issues for suspend/resume
>       drm/amdgpu/vcn2: notify SMU power up/down VCN
>       drm/amdgpu/vcn2: don't access register when power gated
>       drm/amdgpu: enable vcn dpm scheme for navi
>       drm/amdgpu/nv: set vcn pg flag
>       drm/amdgpu/sdma5: incorrect variable type for gpu address
>       drm/amdgpu/ucode: add the definitions of MES ucode and ucode data
>       drm/amdgpu/ucode: add mes firmware file support
>       drm/amdgpu/mes10.1: add mes firmware info fields
>       drm/amdgpu/mes10.1: load mes firmware file to CPU buffer
>       drm/amdgpu/mes10.1: implement ucode CPU buffer destruction
>       drm/amdgpu/mes10.1: upload mes ucode to gpu buffer
>       drm/amdgpu/mes10.1: upload mes data ucode to gpu buffer
>       drm/amdgpu/mes10.1: implement ucode buffers destruction
>       drm/amdgpu/mes10.1: implement MES firmware backdoor loading
>       drm/amdgpu/mes10.1: implement mes enablement function
>       drm/amdgpu/mes10.1: enable mes FW backdoor loading
>       drm/amd/powerplay/smu11: disable PLL shutdown when gfxoff enabled
>       drm/amdgpu: RLC must be disabled after SMU when S3 on navi
>       drm/amdgpu/gfx10: remove unnecessary waiting on gfx inactive
>       drm/amdgpu/gfx10: require to pin/unpin CSIB BO when suspend/resume
>       drm/amd: the data retured from PRT is expected to be 0
>       drm/amdgpu/psp: add new VCN RAM ucode id to psp
>       drm/amdgpu: add corresponding vcn ram ucode id
>       drm/amdgpu/psp: convert ucode id to psp ucode id
>       drm/amdgpu/psp: add new psp interface for vcn updating sram
>       drm/amd/powerplay: update smu11_driver_if_navi10.h
>       drm/amd/powerplay: disable fw dstate when gfxoff is enabled
>       drm/amd/powerplay: enable BACO feature as WAR
>       drm/amdgpu: add field indicating if has PCIE atomics support
>       drm/amdgpu: enable PCIE atomics ops support
>       drm/amdkfd: remove duplicated PCIE atomics request
>       drm/amdkfd: remove an unused variable
>       drm/amd/powerplay: increase waiting time for smu response
>
> Jack Zhang (1):
>       drm/amdgpu/sriov: fix Tonga load driver failed
>
> Jagadeesh Pagadala (1):
>       gpu/drm: Remove duplicate headers
>
> Jagan Teki (4):
>       dt-bindings: display: Document FriendlyELEC HD702E LCD panel
>       drm/panel: simple: Add FriendlyELEC HD702E 800x1280 LCD panel
>       drm/sun4i: sun6i_mipi_dsi: Support DSI GENERIC_SHORT_WRITE_2 transf=
er
>       drm/panel: st7701: Swap vertical front and back porch timings
>
> James Clarke (1):
>       drm: Fix drm.h uapi header for GNU/kFreeBSD
>
> James Zhu (6):
>       drm/amdgpu: add EDC counter register
>       drm/amdgpu: add gfx9 gpr EDC workaround when RAS is enabled
>       drm/amdgpu: Fix S3 test issue
>       drm/amdgpu: Fixed missing to clear some EDC count
>       drm/amdgpu: Add GDS clearing workaround in later init for gfx9
>       drm/amdgpu: explicitly set mmGDS_VMID0_BASE to 0
>
> Jani Nikula (69):
>       Merge drm/drm-next into drm-intel-next-queued
>       drm/i915: ensure more headers remain self-contained
>       drm/i915: make intel_bios.h self-contained
>       drm/i915/dvo: rename dvo.h to intel_dvo_dev.h and make self-contain=
ed
>       drm/i915: make intel_dpll_mgr.h self-contained
>       drm/i915: move dsi init functions to intel_dsi.h
>       drm/i915: extract intel_fifo_underrun.h from intel_drv.h
>       drm/i915: extract intel_dp_link_training.h from intel_drv.h
>       drm/i915: extract intel_dp_aux_backlight.h from intel_drv.h
>       drm/i915: extract i915_irq.h from intel_drv.h and i915_drv.h
>       drm/i915: extract intel_hotplug.h from intel_drv.h and i915_drv.h
>       drm/i915: extract intel_bios.h functions from i915_drv.h
>       drm/i915: extract intel_quirks.h from intel_drv.h
>       drm/i915: extract intel_overlay.h from intel_drv.h and i915_drv.h
>       drm/i915: extract intel_vdsc.h from intel_drv.h and i915_drv.h
>       drm/i915: extract intel_dp_mst.h from intel_drv.h
>       drm/i915: extract intel_dsi_dcs_backlight.h from intel_drv.h
>       drm/i915: extract intel_atomic.h from intel_drv.h
>       drm/i915: extract intel_runtime_pm.h from intel_drv.h
>       drm/i915: move some leftovers to intel_pm.h from i915_drv.h
>       drm/i915: extract intel_combo_phy.h from i915_drv.h
>       drm/i915/csr: alpha_support doesn't depend on csr or vice versa
>       drm/i915: add single combo phy init/unit functions
>       drm/i915/dvo: move DVO chip types to intel_dvo.c
>       drm/i915/dsi: move operation mode types to intel_dsi.h
>       drm/i915: move ranges to intel_display.c
>       drm/i915: remove unused/stale macros and comments from intel_drv.h
>       drm/i915/csr: move CSR version macros to intel_csr.h
>       drm/i915: extract intel_dpio_phy.h from i915_drv.h
>       drm/i915: extract intel_lpe_audio.h from i915_drv.h
>       drm/i915: extract intel_acpi.h from i915_drv.h
>       drm/i915: extract i915_debugfs.h from i915_drv.h
>       drm/i915: move i915_vgacntrl_reg() where needed
>       drm/i915: make i915_utils.h self-contained
>       drm/i915: move more generic utils to i915_utils.h
>       drm/i915: extract intel_gmbus.h from i915_drv.h and rename
> intel_i2c.c
>       drm/dp: drmP.h include removal
>       drm/edid: drmP.h include removal
>       drm/i915: Update DRIVER_DATE to 20190523
>       drm/i915: remove duplicate typedef for intel_wakeref_t
>       drm/i915: Update DRIVER_DATE to 20190524
>       drm/i915: make REG_BIT() and REG_GENMASK() work with variables
>       Merge drm/drm-next into drm-intel-next-queued
>       Revert "drm/i915: Expand subslice mask"
>       drm/i915: add force_probe module parameter to replace alpha_support
>       drm/i915/bios: make child device order the priority order
>       drm/i915/bios: store child device pointer in DDI port info
>       drm/i915/bios: refactor DDC pin and AUX CH sanitize functions
>       drm/i915/bios: use port info child pointer to determine HPD invert
>       drm/i915/bios: use port info child pointer to determine LSPCON
> presence
>       drm/i915/bios: clean up VBT port info debug logging
>       drm/i915/bios: remove unused, obsolete VBT definitions
>       drm/i915/bios: reserve struct bdb_ prefix for BDB blocks
>       drm/i915/bios: add BDB block comments before definitions
>       drm/i915/bios: sort BDB block definitions using block ID
>       drm/i915/bios: add VBT swing bit to child device definition
>       drm/i915/bios: add more LFP options
>       drm/i915/bios: add an enum for BDB block IDs
>       Documentation/i915: Fix kernel-doc references to moved gem files
>       drm/i915: fix documentation build warnings
>       drm/i915: move pm related declarations to intel_pm.h
>       drm/i915: remove some unused declarations from intel_drv.h
>       drm/i915: move more atomic plane declarations to intel_atomic_plane=
.h
>       drm/i915/frontbuffer: remove obsolete comment about mark busy/idle
>       drm/i915: make intel_sdvo_regs.h self-contained
>       drm/i915: move modesetting output/encoder code under display/
>       drm/i915: move modesetting core code under display/
>       Documentation/i915: fix file references after display/ subdir renam=
es
>       drm/i915: Update DRIVER_DATE to 20190619
>
> Janusz Krzysztofik (2):
>       drm/i915: Use drm_dev_unplug()
>       drm/i915: Split off pci_driver.remove() tail to drm_driver.release(=
)
>
> Jay Cornwall (5):
>       drm/amdkfd: Fix gfx8 MEM_VIOL exception handler
>       drm/amdkfd: Preserve wave state after instruction fetch MEM_VIOL
>       drm/amdkfd: Fix gfx9 XNACK state save/restore
>       drm/amdkfd: Preserve ttmp[4:5] instead of ttmp[14:15]
>       drm/amdkfd: Implement queue priority controls for gfx9
>
> Jayant Shekhar (3):
>       drm/msm/dpu: clean up references of DPU custom bus scaling
>       drm/msm/dpu: Integrate interconnect API in MDSS
>       dt-bindings: msm/disp: Introduce interconnect bindings for MDSS on
> SDM845
>
> Jeffrey Hugo (6):
>       drm/msm/mdp5: Fix mdp5_cfg_init error return
>       dt-bindings: msm/dsi: Add 10nm phy for msm8998 compatible
>       drm/msm/dsi: Add support for MSM8998 10nm dsi phy
>       drm/msm/dsi: Add old timings quirk for 10nm phy
>       drm/msm/dsi: Add support for MSM8998 DSI controller
>       drm/msm/adreno: Add A540 support
>
> Jerome Brunet (1):
>       drm/meson: imply dw-hdmi i2s audio for meson hdmi
>
> John Harrison (3):
>       drm/i915: Support flags in whitlist WAs
>       drm/i915: Support whitelist workarounds on all engines
>       drm/i915: Add whitelist workarounds for ICL
>
> Jonas Karlman (1):
>       drm: Add reference counting on HDR metadata blob
>
> Jonathan Bakker (1):
>       dt-bindings: panel: Add Samsung S6E63M0 panel documentation
>
> Jonathan Kim (4):
>       drm/amdgpu: add df perfmon regs and funcs for xgmi
>       drm/amdgpu: update df_v3_6 for xgmi perfmons (v2)
>       drm/amdgpu: add pmu counters
>       drm/amdgpu:  add sw_init to df_v1_7
>
> Jordan Crouse (7):
>       drm/msm/adreno: Enable 64 bit mode by default on a5xx and a6xx
> targets
>       drm/msm: Print all 64 bits of the faulting IOMMU address
>       drm/msm: Pass the MMU domain index in struct msm_file_private
>       drm/msm/dpu: Fix error recovery after failing to enable clocks
>       drm/msm/dpu: Avoid a null de-ref while recovering from kms init fai=
l
>       drm/msm/adreno: Call pm_runtime_force_suspend() during unbind
>       drm/msm/adreno: Ensure that the zap shader region is big enough
>
> Jordan Lazare (1):
>       drm/amd/display: Remove superflous error message
>
> Joshua Aberback (8):
>       drm/amd/display: Program VTG params after programming Global Sync
>       drm/amd/display: Rename EDID_BLOCK_SIZE to DC_EDID_BLOCK_SIZE
>       drm/amd/display: Program VTG params after programming Global Sync
> for DCN2
>       drm/amd/display: Remove dependency on pipe->plane for immedaite
> flip status
>       drm/amd/display: Optimize bandwidth validation by adding early retu=
rn
>       drm/amd/display: Add profiling tools for bandwidth validation
>       drm/amd/display: Remove OPP clock programming on plane disable
>       drm/amd/display: Set test pattern on blank when using Visual Confir=
m
>
> Josip Pavic (1):
>       drm/amd/display: enable abm on dcn2
>
> Jos=C3=A9 Roberto de Souza (1):
>       drm/i915/psr: Force manual PSR exit in older gens
>
> Jun Lei (10):
>       drm/amd/display: add support for disconnected eDP panels
>       drm/amd/display: dont set  otg offset
>       drm/amd/display: Add min_dcfclk_mhz field to bb overrides
>       drm/amd/display: update calculated bounding box logic for NV
>       drm/amd/display: fix pstate allow handling in dcn2
>       drm/amd/display: always use 4 dp lanes for dml
>       drm/amd/display: Add missing VM conversion from hw values
>       drm/amd/display: add support for forcing DCFCLK without
> affecting watermarks
>       drm/amd/display: making DCN20 WM table non-overlapping
>       drm/amd/display: update DCN2 uclk switch time
>
> Justin Swartz (1):
>       drm/rockchip: dw_hdmi: add basic rk3228 support
>
> Jyri Sarha (7):
>       dt-bindings: drm/panel: simple: Add binding for TFC S9700RTWV43TR-0=
1B
>       drm/panel: simple: Add TFC S9700RTWV43TR-01B 800x480 panel support
>       drm/bridge: sii902x: Set output mode to HDMI or DVI according to ED=
ID
>       drm/bridge: sii902x: pixel clock unit is 10kHz instead of 1kHz
>       dt-bindings: display: sii902x: Remove trailing white space
>       dt-bindings: display: sii902x: Add HDMI audio bindings
>       drm/bridge: sii902x: Implement HDMI audio support
>
> J=C3=A9r=C3=B4me Glisse (1):
>       dma-buf: balance refcount inbalance
>
> Kefeng Wang (1):
>       drm/omap: Use dev_get_drvdata()
>
> Kenneth Feng (15):
>       drm/amd/powerplay: enable backdoor smu fw loading (v2)
>       drm/amd/powerplay: enable power features
>       drm/amd: add gfxoff support on navi10
>       drm/amd/amdgpu: fw version check with gfxoff
>       drm/amd/powerplay: gfxoff-seperate the Vega20 case
>       drm/amd/powerplay: enable DCEFCLK dpm support
>       drm/amd/powerplay: fix the incorrect type of pptable
>       drm/amd/powerplay: update smu11_driver_if_navi10.h
>       drm/amd/powerplay: enable vcn powergating v2
>       drm/amd/powerplay: add new interface for vcn powergating
>       amd/powerplay: fix the issue of uclk dpm
>       amd/powerplay: enable uclk dpm
>       amd/powerplay: update the vcn pg
>       drm/amd/powerplay: enable gfxclk ds,dcefclk ds and fw dstate on
> navi10
>       drm/amd/powerplay: enable ac/dc feature on navi10
>
> Kent Russell (8):
>       drm/amdgpu: Add replay counter defines to NBIO headers
>       drm/amdgpu: Add PCIe replay count sysfs file
>       drm/amdgpu: Fix CIK references in gmc_v8
>       drm/amdkfd: Cosmetic cleanup
>       drm/amdkfd: Add VegaM support
>       drm/amdgpu: Add Unique Identifier sysfs file unique_id v2
>       drm/amdgpu: Add CHIP_VEGAM to amdgpu_amdkfd_device_probe
>       drm/amdkfd: Add procfs-style information for KFD processes
>
> Kevin Wang (62):
>       drm/amd/powerplay: add helper function to get smu firmware & if
> version
>       drm/amd/powerplay: move the funciton of conv_profile_to_workload
> to asic file
>       drm/amd/powerplay: move the function of get[set]_power_profile
> to asic file
>       drm/amd/powerplay: move the function of uvd&vce dpm to asic file
>       drm/amd/powerplay: move the function of read_sensor to asic file
>       drm/amd/powerplay: move the function of is_dpm_running to asic file
>       drm/amd/powerplay: add smu11 smu_if_version check for navi10
>       drm/amd/powerplay: implement smc firmware v2.1 for smu11
>       drm/amd/powerplay: remove duplicate code from smu hw init
>       drm/amd/powerplay: optimization feature mask function for asic
>       drm/amd/powerplay: add allowed feature mask for navi10
>       drm/amd/powerplay: add function get current clock freq interface
> for navi10
>       drm/amd/powerplay: add helper function to get dpm freq informations
>       drm/amd/powerplay: add function print_clk_levels for navi10
>       drm/amd/powerplay: add helper function of smu_get_dpm_freq_range
>       drm/amd/powerplay: add helper function of smu_set_soft_freq_range
>       drm/amd/powerplay: add helper function of smu_set_hard_freq_range
>       drm/amd/powerplay: add function force_clk_levels for navi10
>       drm/amd/powerplay: add function populate_umd_state_clk for navi10
>       drm/amd/powerplay: add function get_clock_by_type_with_latency for
> navi10
>       drm/amd/powerplay: add function pre_display_config_changed for navi=
10
>       drm/amd/powerplay: add function display_configuration_changed for
> navi10
>       drm/amd/powerplay: add funciton force_dpm_limit for navi10
>       drm/amd/powerplay: add function unforce_dpm_levels for navi10
>       drm/amd/powerplay: add function get_gpu_power for navi10
>       drm/amd/powerplay: add function get_current_activity_percent for
> navi10
>       drm/amd/powerplay: move read sensor of UVD[VCE]_POWER to amdgpu_smu
> file
>       drm/amd/powerplay: add function is_dpm_running for navi10
>       drm/amd/powerplay: add function set_thermal_fan_table for navi10
>       drm/amd/powerplay: add function get_fan_speed_percent for navi10
>       drm/amd/powerplay: remove upload_dpm_level function for vega20
>       drm/amd/powerplay: add function get_workload_type_map for swsmu
>       drm/amd/powerplay: add funciton get[set]_power_profile_mode for
> navi10 (v2)
>       drm/amd/powerplay: add function get_profiling_clk_mask for navi10
>       drm/amd/powerplay: add function notify_smc_display_config_change
> for navi10
>       drm/amd/powerplay: add function set_watermarks_table function for
> navi10
>       drm/amd/powerplay: add function read_sensor for navi10
>       drm/amd/powerplay: fix dpm freq unit error (10KHz -> Mhz)
>       drm/amd/powerplay: simplify the interface of
> get_current_activity_percent
>       drm/amd/powerplay: simplify the interface of get_gpu_power
>       drm/amd/powerplay: fix amdgpu_pm_info show gpu load error
>       drm/amd/powerplay: add sclk sysfs interface support for navi10
>       drm/amd/powerplay: enable uclk dpm default on navi10
>       drm/amd/powerplay: move power_dpm_force_performance_level to
> amdgpu_smu file
>       drm/amd/powerplay: move function get_metrics_table to vega20_ppt
>       drm/amd/powerplay: move function thermal_get_temperature to
> veag20_ppt
>       drm/amd/powerplay: add thermal ctf support for navi10
>       drm/amd/powerplay: remove smu mutex lock in smu_hw_init
>       drm/amd/powerplay: remove smu callback funciton get_mclk(get_sclk)
>       drm/amd/powerplay: fix deadlock issue for smu_force_performance_lev=
el
>       drm/amd/powerplay: fix clk type name error OD_SCLK OD_MCLK
>       drm/amd/powerplay: move od8_setting helper function to vega20_ppt
>       drm/amd/powerplay: move od_default_setting callback to asic file
>       drm/amd/powerplay: simplified od_settings for each asic
>       drm/amd/powerplay: use pp_feature_mask to control uclk(mclk) dpm
> enabled
>       drm/amd/powerplay: remove unsupport function
> set_thermal_fan_table for navi10
>       drm/amd/powerplay: fix fan speed show error (for hwmon pwm)
>       drm/amd/powerplay: print smu versions only if version mismatch
>       drm/amd/powerplay: add feature check in unforce_dpm_levels function
> (v2)
>       drm/amd/powerplay: add baco smu reset function for smu11
>       drm/amdgpu: add mode1 (psp) reset for navi asic
>       drm/amd/powerplay: add temperature sensor support for navi10
>
> Kieran Bingham (1):
>       drm: rcar-du: writeback: include interface header
>
> Krunoslav Kovac (3):
>       drm/amd/display: Add GSL source select registers
>       drm/amd/display: CS_TFM_1D only applied post EOTF
>       drm/amd/display: fix gamma logic breaking driver unload
>
> Laurent Pinchart (11):
>       drm: bridge: Add dual_link field to the drm_bridge_timings structur=
e
>       dt-bindings: display: bridge: thc63lvd1024: Document dual-link
> operation
>       drm: bridge: thc63: Report input bus mode through bridge timings
>       dt-bindings: display: renesas: lvds: Add renesas,companion property
>       drm: rcar-du: lvds: Remove LVDS double-enable checks
>       drm: rcar-du: lvds: Add support for dual-link mode
>       drm: rcar-du: Skip LVDS1 output on Gen3 when using dual-link LVDS
> mode
>       drm: rcar-du: Add support for missing 32-bit RGB formats
>       drm: rcar-du: Add support for missing 16-bit RGB4444 formats
>       drm: rcar-du: Add support for missing 16-bit RGB1555 formats
>       drm: Add drm_atomic_get_(old|new)_connector_for_encoder() helpers
>
> Le.Ma (3):
>       drm/amdgpu: add structures for buffer allocate/release for rlc
> autoload
>       drm/amdgpu: add fw load type flag for rlc autoload
>       drm/amdgpu: enable virtual display feature for navi10
>
> Leo (Hanghong) Ma (2):
>       drm/amd/display: Expose send immediate sdp message interface
>       drm/amd/display: Expose send immediate sdp message interface
>
> Leo Li (5):
>       drm/amdgpu: Split gpu_info_soc_bounding_box out from amdgpu_ucode.h
>       drm/amd/display: Disconnect DCN2 mpcc when changing tg
>       drm/amd/display: Clean up locking in dcn*_apply_ctx_for_surface()
>       drm/amd/display: Guard DML_FAIL_DSC_VALIDATION_FAILURE
>       drm/amd/display: Properly guard display_mode_vba with DCN2
>
> Leo Liu (23):
>       drm/amdgpu: add no_user_fence flag to ring funcs
>       drm/amdgpu/UVD: set no_user_fence flag to true
>       drm/amdgpu/VCE: set no_user_fence flag to true
>       drm/amdgpu/VCN: set no_user_fence flag to true
>       drm/amdgpu: check no_user_fence flag for engines
>       drm/amdgpu: move the VCN DPG mode read and write to VCN
>       drm/amdgpu: make VCN DPG pause mode detached from general VCN
>       drm/amdgpu: add nbio callbacks for vcn doorbell support
>       drm/amdgpu: add Navi10 VCN firmware support
>       drm/amdgpu: add VCN2.0 decode ring test
>       drm/amdgpu: add VCN2.0 decode ib test
>       drm/amdgpu: add JPEG2.0 decode ring test
>       drm/amdgpu: add JPEG2.0 decode ring ib test
>       drm/amdgpu: add initial VCN2.0 support (v2)
>       drm/amdgpu/VCN2.0: remove powergating for UVDW tile
>       drm/amdgpu/VCN2.0 remove unused Macro and declaration
>       drm/amdgpu/VCN2.0: add direct SRAM read and write
>       drm/amdgpu/VCN2.0: add DPG mode start and stop (v2)
>       drm/amdgpu/VCN2.0: add DPG pause mode
>       drm/amdgpu: enable VCN2.0 DPG mode
>       drm/amdgpu/VCN: add buffer for indirect SRAM usage
>       drm/amdgpu/VCN: implement indirect DPG SRAM mode
>       drm/amdgpu/VCN: enable indirect DPG SRAM mode
>
> Linus Walleij (4):
>       drm/atomic-helper: Bump vblank timeout to 100 ms
>       drm/mcde: Add new driver for ST-Ericsson MCDE
>       drm/bridge: analogix-anx78xx: Drop of_gpio.h include
>       drm/bridge: analogix_dp: Convert to GPIO descriptors
>
> Lionel Landwerlin (1):
>       drm/i915/perf: fix whitelist on Gen10+
>
> Liviu Dudau (1):
>       arm/komeda: Convert dp_wait_cond() to return an error code.
>
> Louis Li (1):
>       drm/amdgpu: fix ring test failure issue during s3 in vce 3.0 (V2)
>
> Lowry Li (Arm Technology China) (10):
>       drm/komeda: Creates plane alpha and blend mode properties
>       drm/komeda: Clear enable bit in CU_INPUTx_CONTROL
>       drm/komeda: Add rotation support on Komeda driver
>       drm/komeda: Adds limitation check for AFBC wide block not support
> Rot90
>       drm/komeda: Update HW up-sampling on D71
>       drm/komeda: Enable color-encoding (YUV format) support
>       drm/komeda: Adds SMMU support
>       dt/bindings: drm/komeda: Adds SMMU support for D71 devicetree
>       drm/komeda: Adds zorder support
>       drm/komeda: Add slave pipeline support
>
> Lubomir Rintel (1):
>       drm/armada: replace the simple-framebuffer
>
> Lucas De Marchi (16):
>       drm/i915/icl: fix step numbers in icl_display_core_init()
>       drm/i915: reorder if chain to have last gen first
>       drm/i915: do not mix workaround with normal flow
>       drm/i915/dmc: protect against reading random memory
>       drm/i915/icl: use ranges for voltage level lookup
>       drm/i915/cnl: use ranges for voltage level lookup
>       drm/i915/skl: use ranges for voltage level lookup
>       drm/i915/dmc: use kernel types
>       drm/i915/dmc: extract fw_info and table walk from
> intel_package_header
>       drm/i915/dmc: add support for package_header with version 2
>       drm/i915/dmc: extract function to parse css header
>       drm/i915/dmc: extract function to parse package_header
>       drm/i915/dmc: extract function to parse dmc_header
>       drm/i915/dmc: add support to load dmc_header version 3
>       drm/i915/dmc: remove redundant return in parse_csr_fw()
>       drm/i915/dmc: protect against loading wrong firmware
>
> Lukasz Majewski (2):
>       dt-bindings: display/panel: Add KOE tx14d24vm1bpa display descripti=
on
>       drm/panel: simple: Add KOE tx14d24vm1bpa display support (320x240)
>
> Lyude Paul (1):
>       drm/amdgpu: Don't skip display settings in hwmgr_resume()
>
> Maarten Lankhorst (16):
>       drm/atomic: Create __drm_atomic_helper_crtc_reset() for
> subclassing crtc_state.
>       drm/docs: Fix typo in _

--0000000000007a1aac058db2ce97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">And of course a subject line</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon., 15 Jul. 2019, 16:38 =
Dave Airlie, &lt;<a href=3D"mailto:airlied@gmail.com">airlied@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Linus,<br>
<br>
Main pull request for drm for 5.3. This merge window seems to be<br>
conflictful and it conincides with myself and most of my family<br>
getting hit with a strain of influenza A, and it feels like<br>
<a href=3D"http://freedesktop.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">freedesktop.org</a> git is especially slow today.<br>
<br>
I was waiting for the HMM tree to land, and I now have a bunch of fun<br>
merge conflicts to resolve.<br>
<br>
I&#39;ve created a branch<br>
<a href=3D"https://cgit.freedesktop.org/drm/drm/log/?h=3Ddrm-next-5.3-backm=
erge-conflicts" rel=3D"noreferrer noreferrer" target=3D"_blank">https://cgi=
t.freedesktop.org/drm/drm/log/?h=3Ddrm-next-5.3-backmerge-conflicts</a><br>
git://<a href=3D"http://anongit.freedesktop.org/drm/drm" rel=3D"noreferrer =
noreferrer" target=3D"_blank">anongit.freedesktop.org/drm/drm</a> drm-next-=
5.3-backmerge-conflicts<br>
<br>
Most of them are trivial enough, two probably need better explainations:<br=
>
<br>
VMware had some mm helpers go in via my tree (looking back I&#39;m not<br>
sure Thomas really secured enough acks on these, but I&#39;m going with it<=
br>
for now until I get push back). They conflicted with one of the mm<br>
cleanups in the hmm tree, I&#39;ve pushed a patch to the top of my next to<=
br>
fix most of the fallout in my tree, and the resulting fixup is to pick<br>
the closure-&gt;ptefn hunk and apply something like in mm/memory.c<br>
<br>
@@ -2201,7 +2162,7 @@ static int apply_to_page_range_wrapper(pte_t *pte,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct page_range_apply *pra =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 container_of(pter, =
typeof(*pra), pter);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return pra-&gt;fn(pte, NULL, addr, pra-&gt;data=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return pra-&gt;fn(pte, addr, pra-&gt;data);<br>
=C2=A0}<br>
<br>
Then there is the one hmm merge fixup below.<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
@@ -783,7 +783,7 @@ int amdgpu_ttm_tt_get_user_pages(struct ttm_tt<br>
*ttm, struct page **pages)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 : range-&gt;flags[HMM_PFN_WRITE];<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 range-&gt;pfn_flags_mask =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 range-&gt;pfns =3D pfns;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0hmm_range_register(range, mm, start,<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0hmm_range_register(range, mirror, start,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0start + ttm-&gt;num_pages * PAGE_SIZE, PAGE_SHIFT);=
<br>
<br>
There are also a Kconfig conflict in mm, and an i915 Makefile conflict<br>
that standout.<br>
<br>
Feel free to just pull the resolved tree if you want, or get back to<br>
me if this is too messy.<br>
<br>
The biggest thing in this apart from the mm/hmm dancing, is the AMD<br>
Navi GPU support, this again contains a bunch of header files that are<br>
large. These are the new AMD RX5700 GPUs that just recently became<br>
available.<br>
<br>
Thanks,<br>
Dave.<br>
<br>
New drivers:<br>
ST-Ericsson MCDE driver<br>
Ingenic JZ47xx SoC<br>
<br>
UAPI change:<br>
HDR source metadata property<br>
<br>
Core:<br>
- HDR inforframes and EDID parsing<br>
- drm hdmi infoframe unpacking<br>
- remove prime sg_table caching into dma-buf<br>
- New gem vram helpers to reduce driver code<br>
- Lots of drmP.h removal<br>
- reservation fencing fix<br>
- documentation updates<br>
- drm_fb_helper_connector removed<br>
- mode name command handler rewrite<br>
<br>
fbcon:<br>
- Remove the fbcon notifiers<br>
<br>
ttm:<br>
- forward progress fixes<br>
<br>
dma-buf:<br>
- make mmap call optional<br>
- debugfs refcount fixes<br>
- dma-fence free with pending signals fix<br>
- each dma-buf gets an inode<br>
<br>
Panels:<br>
- Lots of additional panel bindings<br>
<br>
amdgpu:<br>
- initial navi10 support<br>
- avoid hw reset<br>
- HDR metadata support<br>
- new thermal sensors for vega asics<br>
- RAS fixes<br>
- use HMM rather than MMU notifier<br>
- xgmi topology via kfd<br>
- SR-IOV fixes<br>
- driver reload fixes<br>
- DC use a core bpc attribute<br>
- Aux fixes for DC<br>
- Bandwidth calc updates for DC<br>
- Clock handling refactor<br>
- kfd VEGAM support<br>
<br>
vmwgfx:<br>
- Coherent memory support changes<br>
<br>
i915:<br>
- HDR Support<br>
- HDMI i2c link<br>
- Icelake multi-segmented gamma support<br>
- GuC firmware update<br>
- Mule Creek Canyon PCH support for EHL<br>
- EHL platform updtes<br>
- move i915.alpha_support to i915.force_probe<br>
- runtime PM refactoring<br>
- VBT parsing refactoring<br>
- DSI fixes<br>
- struct mutex dependency reduction<br>
- GEM code reorg<br>
<br>
mali-dp:<br>
- Komeda driver features<br>
<br>
msm:<br>
- dsi vs EPROBE_DEFER fixes<br>
- msm8998 snapdragon 835 support<br>
- a540 gpu support<br>
- mdp5 and dpu interconnect support<br>
<br>
exynos:<br>
- drmP.h removal<br>
<br>
tegra:<br>
- misc fixes<br>
<br>
tda998x:<br>
- audio support improvements<br>
- pixel repeated mode support<br>
- quantisation range handling corrections<br>
- HDMI vendor info fix<br>
<br>
armada:<br>
- interlace support fix<br>
- overlay/video plane register handling refactor<br>
- add gamma support<br>
<br>
rockchip:<br>
- RX3328 support<br>
<br>
panfrost:<br>
- expose perf counters via hidden ioctls<br>
<br>
vkms:<br>
- enumerate CRC sources list<br>
ast:<br>
- rework BO handling<br>
<br>
mgag200:<br>
- rework BO handling<br>
<br>
dw-hdmi:<br>
- suspend/resume support<br>
<br>
rcar-du:<br>
- R8A774A1 Soc Support<br>
- LVDS dual-link mode support<br>
- Additional formats<br>
- Misc fixes<br>
<br>
omapdrm:<br>
- DSI command mode display support<br>
<br>
stm<br>
- fb modifier support<br>
- runtime PM support<br>
<br>
sun4i:<br>
- use vmap ops<br>
<br>
vc4:<br>
- binner bo binding rework<br>
<br>
v3d:<br>
- compute shader support<br>
- resync/sync fixes<br>
- job management refactoring<br>
<br>
lima:<br>
- NULL pointer in irq handler fix<br>
- scheduler default timeout<br>
<br>
virtio:<br>
- fence seqno support<br>
- trace events<br>
<br>
bochs:<br>
- misc fixes<br>
<br>
tc458767:<br>
- IRQ/HDP handling<br>
<br>
sii902x:<br>
- HDMI audio support<br>
<br>
atmel-hlcdc:<br>
- misc fixes<br>
<br>
meson:<br>
- zpos support<br>
<br>
drm-next-2019-07-15-1:<br>
drm main pull request for 5.3-rc1<br>
The following changes since commit 6116b892bd4fd0ddc5f30566a556218bb2e1a9b6=
:<br>
<br>
=C2=A0 vga_switcheroo: Depend upon fbcon being built-in, if enabled<br>
(2019-06-26 10:36:49 +0200)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://anongit.freedesktop.org/drm/drm" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">anongit.freedesktop.org/drm/drm</a> ta=
gs/drm-next-2019-07-15-1<br>
<br>
for you to fetch changes up to 6dfc43d3a19174faead54575c204aee106225f43:<br=
>
<br>
=C2=A0 mm: adjust apply_to_pfn_range interface for dropped token.<br>
(2019-07-15 15:16:20 +1000)<br>
<br>
----------------------------------------------------------------<br>
drm main pull request for 5.3-rc1<br>
<br>
----------------------------------------------------------------<br>
Abhinav Kumar (2):<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm/dsi: add protection against NULL dsi device<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/msm/dpu: add icc voting in dpu_mdss_init<br>
<br>
Aditya Swarup (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/icl: Fix setting 10 bit deep color mode<br>
<br>
Aidan Wood (2):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Properly set DCF clock<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Properly set u clock<br>
<br>
Alex Deucher (37):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/vega20: use mode1 reset for RAS and XGMI<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: use pcie_bandwidth_available rather than o=
pen coding it<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/soc15: skip reset on init<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: fix a race in GPU reset with IB test (v2)<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/display: Drop some new CONFIG_DRM_AMD_DC_DC=
N1_01 guards<br>
=C2=A0 =C2=A0 =C2=A0 Revert &quot;drm/amdgpu: add DRIVER_SYNCOBJ_TIMELINE t=
o amdgpu&quot;<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: return 0 by default in amdgpu_pm_load_smu_=
firmware<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: wait to fetch the vbios until after common=
 init<br>
=C2=A0 =C2=A0 =C2=A0 Revert &quot;drm/amd/display: make clk_mgr call enable=
_pme_wa&quot;<br>
=C2=A0 =C2=A0 =C2=A0 Revert &quot;drm/amd/display: Add Underflow Asserts to=
 dc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 Revert &quot;drm/amd/display: move vmid determination =
logic out of dc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 Revert &quot;drm/amd/display: Rework CRTC color manage=
ment&quot;<br>
=C2=A0 =C2=A0 =C2=A0 Revert &quot;drm/amd/display: Use macro for invalid OP=
P ID&quot;<br>
=C2=A0 =C2=A0 =C2=A0 Revert &quot;drm/amd/display: Copy stream updates onto=
 streams&quot;<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add Navi10 pci ids<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay/smu11: remove smu_update_table_with_=
arg<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/powerplay: add license to smu11 header<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/powerplay/vega20: use correct table index<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/gfx10: update to latest golden setting<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: add fast_validate parameter to dcn20_=
validate_bandwidth<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: updates for dcn20_update_bandwidth<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: update dcn2 dc_plane_cap<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: drop unused df init callback<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;drm-next&#39; into drm-next-5.3<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/powerplay: FEATURE_MASK is 64 bit so use UL=
L<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/display: switch udelay to msleep<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/display: drop ifdefs around comments<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: fix warning on 32 bit<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: drop copy/paste leftover to fix big endian=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/gfx9: use reset default for PA_SC_FIFO_SIZE=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/gfx10: use reset default for PA_SC_FIFO_SIZ=
E<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/display: fix interrupt client id for navi<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: properly guard DC support in navi code<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp11: simplify the ucode register logic<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add missing documentation on new module pa=
rameters<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: properly guard the generic discovery code<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/navi10: add uclk activity sensor<br>
<br>
Amber Lin (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: Add domain number into gpu_id<br>
<br>
Andreas Pretzsch (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/panel: simple: Add support for EDT ET035012DM6<br>
<br>
Andres Rodriguez (2):<br>
=C2=A0 =C2=A0 =C2=A0 drm/edid: parse CEA blocks embedded in DisplayID<br>
=C2=A0 =C2=A0 =C2=A0 drm/edid: use for_each_displayid_db where applicable<b=
r>
<br>
Andrew F. Davis (3):<br>
=C2=A0 =C2=A0 =C2=A0 dma-buf: Remove leftover [un]map_atomic comments<br>
=C2=A0 =C2=A0 =C2=A0 dma-buf: Update [un]map documentation to match the oth=
er functions<br>
=C2=A0 =C2=A0 =C2=A0 dma-buf: Make mmap callback actually optional<br>
<br>
Andrey Grodzovsky (5):<br>
=C2=A0 =C2=A0 =C2=A0 drm/sched: Keep s_fence-&gt;parent pointer<br>
=C2=A0 =C2=A0 =C2=A0 drm/scheduler: Add flag to hint the release of guilty =
job.<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Avoid HW reset if guilty job already signa=
led.<br>
=C2=A0 =C2=A0 =C2=A0 drm/sched: Fix static checker warning for potential NU=
LL ptr<br>
=C2=A0 =C2=A0 =C2=A0 drm/sched: Fix make htmldocs warnings.<br>
<br>
Anthony Koo (5):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: fix multi display seamless boot case<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: do not power on eDP power rail early<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: fix issues with bad AUX reply on some=
 displays<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: fix issue with eDP not detected on dr=
iver load<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: do not power on eDP power rail early<=
br>
<br>
Aric Cyr (11):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: 3.2.28<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: 3.2.29<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: 3.2.30<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Use VCP for extended colorimetry<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: 3.2.31<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: 3.2.32<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: program manual trigger only for botto=
m most pipe<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: 3.2.33<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: 3.2.34<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: 3.2.35<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Intermittent DCN2 pipe hang on mode c=
hange<br>
<br>
Arnd Bergmann (6):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: fix error handling in df_v3_6_pmc_start<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/komeda: fix 32-bit komeda_crtc_update_clock_ratio<=
br>
=C2=A0 =C2=A0 =C2=A0 amdgpu: make pmu support optional<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: dcn20: include linux/delay.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: vega20: fix uninitialized variable =
use<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: avoid 64-bit division<br>
<br>
Ayan Halder (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/komeda: Make Komeda interrupts shareable<br>
<br>
Benjamin Gaignard (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/stm: ltdc: restore calls to clk_{enable/disable}<b=
r>
<br>
Bhawanpreet Lakha (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: Fix maybe-uninitialized in get_ppfe=
ature_status<br>
<br>
Biju Das (4):<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: display: renesas: du: Document the r8a774=
a1 bindings<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: display: renesas: lvds: Document r8a774a1=
 bindings<br>
=C2=A0 =C2=A0 =C2=A0 drm: rcar-du: Add R8A774A1 support<br>
=C2=A0 =C2=A0 =C2=A0 drm: rcar-du: lvds: Add r8a774a1 support<br>
<br>
Bob Yang (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: fixed DCC corruption<br>
<br>
Boris Brezillon (4):<br>
=C2=A0 =C2=A0 =C2=A0 drm/panfrost: Move gpu_{write, read}() macros to panfr=
ost_regs.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/panfrost: Add a module parameter to expose unstabl=
e ioctls<br>
=C2=A0 =C2=A0 =C2=A0 drm/panfrost: Add an helper to check the GPU generatio=
n<br>
=C2=A0 =C2=A0 =C2=A0 drm/panfrost: Expose performance counters through unst=
able ioctls<br>
<br>
Brian Masney (2):<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm: correct attempted NULL pointer dereference in=
 put_iova<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm: add dirty framebuffer helper<br>
<br>
Charlene Liu (20):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: add SW_USE_I2C_REG request.<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: color space ycbcr709 support<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: reset retimer/redriver below 340Mhz<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: define v_total_min and max parameters=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: enabling stream after HPD low to high=
 happened<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: add some math functions for dcn_calc_=
math<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: add audio related regs<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: dcn2 dmcu wait_for_loop update with d=
ispclk.<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: fix can not turn on two displays due =
to<br>
DSC_RESOURCE failed.<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add hubp_init entry to hubp vtable<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: add SW_USE_I2C_REG request.<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Create DWB resource for DCN2<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: [backport] dwb dm + efc support<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: used optimum VSTARTUP instead of MaxV=
Startup<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Return UPDATE_TYPE_FULL on writeback =
update<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: add some parameters to validate bandw=
idth functions<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: add dwb stere caps and version<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: add p010 and ayuv plane caps<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: dcn2 use fixed clocks.<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: expose dentist_get_did_from_divider<b=
r>
<br>
Chengming Gui (3):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: Enable &quot;disable dpm&quot; feat=
ure to support swSMU<br>
debug (v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: Fix code error for translating int =
type to<br>
bool type correctly<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add set_power_profile_mode for rave=
n1_refresh<br>
<br>
Chia-I Wu (4):<br>
=C2=A0 =C2=A0 =C2=A0 drm/virtio: set seqno for dma-fence<br>
=C2=A0 =C2=A0 =C2=A0 drm/virtio: trace drm_fence_emit<br>
=C2=A0 =C2=A0 =C2=A0 drm/virtio: add trace events for commands<br>
=C2=A0 =C2=A0 =C2=A0 drm/virtio: allocate fences with GFP_KERNEL<br>
<br>
Chris Park (5):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Support AVI InfoFrame V3 and V4<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Define Byte 14 on AVI InfoFrame<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Move link functions from dc to dc_lin=
k<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Clean up scdc_test_data struct<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Move link functions from dc to dc_lin=
k<br>
<br>
Chris Wilson (150):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Verify workarounds immediately after applica=
tion<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Verify the engine workarounds stick on appli=
cation<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Make workaround verification *optional*<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Avoid use-after-free in reporting create.siz=
e<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Stop overwriting RING_IMR in rcs resume<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Setup the RCS ring prior to execution<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Remove unwarranted clamping for hsw/bdw<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Track HAS_RPS alongside HAS_RC6 in the devic=
e info<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Expose the busyspin durations for i915_wait_=
request<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/gtt: Skip clearing the GGTT under gen6+ full-=
ppgtt<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Start writeback from the shrinker<br>
=C2=A0 =C2=A0 =C2=A0 dma-buf: Remove unused sync_dump()<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Store the default sseu setup on the engine<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/i915/selftests: Verify whitelist of context regist=
ers<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Move GraphicsTechnology files under gt/<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Introduce struct intel_wakeref<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Pull the GEM powermangement coupling into it=
s own file<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Introduce context-&gt;enter() and context-&g=
t;exit()<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Pass intel_context to i915_request_create()<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Invert the GEM wakeref hierarchy<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Explicitly pin the logical context for execb=
uf<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Allow multiple user handles to the same VM<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Disable preemption and sleeping while using =
the punit sideband<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Lift acquiring the vlv punit magic to a comm=
on sb-get<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Lift sideband locking for vlv_punit_(read|wr=
ite)<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Replace pcu_lock with sb_lock<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Separate sideband declarations to intel_side=
band.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Merge sbi read/write into a single accessor<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Merge sandybridge_pcode_(read|write)<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Move sandybride pcode access to intel_sideba=
nd.c<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/ringbuffer: EMIT_INVALIDATE *before* switch c=
ontext<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Enable render context support for Ironlake (=
gen5)<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Enable render context support for gen4 (Broa=
dwater to Cantiga)<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/gvt: Pin the per-engine GVT shadow contexts<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Export intel_context_instance()<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/selftests: Use the real kernel context for ss=
eu isolation tests<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/selftests: Pass around intel_context for sseu=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Pass intel_context to intel_context_pin_lock=
()<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Split engine setup/init into two phases<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Switch back to an array of logical per-engin=
e HW contexts<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Remove intel_context.active_link<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Move i915_request_alloc into selftests/<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Skip unused contexts for context_barrier_tas=
k()<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Wait for the struct_mutex on idling<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Move the engine-&gt;destroy() vfunc onto the=
 engine<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Complete both freed-object passes before dra=
ining the workqueue<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Include fence signaled bit in print_request(=
)<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/guc: Fix runtime suspend<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/execlists: Flush the tasklet on parking<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Leave engine parking to the engines<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/hangcheck: Track context changes<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Delay semaphore submission until the start o=
f the signaler<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Disable semaphore busywaits on saturated sys=
tems<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Acquire the signaler&#39;s timeline HWSP las=
t<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Assert breadcrumbs are correctly ordered in =
the signal handler<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Prefer checking the wakeref itself rather th=
an the counter<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Assert the local engine-&gt;wakeref is activ=
e<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Flush the switch-to-kernel-context harder fo=
r DROP_IDLE<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Remove delay for idle_work<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Cancel retire_worker on parking<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Stop spinning for DROP_IDLE (debugfs/i915_dr=
op_caches)<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Only reschedule the submission tasklet if pr=
eemption is possible<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/execlists: Don&#39;t apply priority boost for=
 resets<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Reboot CI if forcewake fails<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/hangcheck: Replace hangcheck.seqno with RING_=
HEAD<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Seal races between async GPU cancellation, r=
etirement<br>
and signaling<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Rearrange i915_scheduler.c<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Pass i915_sched_node around internally<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Check for no-op priority changes first<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Mark semaphores as complete on unsubmit out =
if payload<br>
was started<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Truly bump ready tasks ahead of busywaits<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dp: Initialise locals for static analysis<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/hdcp: Use both bits for device_count<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Bump signaler priority on adding a waiter<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Downgrade NEWCLIENT to non-preemptive<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/execlists: Drop promotion on unsubmit<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Restore control over ppgtt for context creat=
ion ABI<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Allow a context to define its set of engines=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Extend I915_CONTEXT_PARAM_SSEU to support lo=
cal ctx-&gt;engine[]<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Re-expose SINGLE_TIMELINE flags for context =
creation<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Allow userspace to clone contexts on creatio=
n<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Load balancing across a virtual engine<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Apply an execution_mask to the virtual_engin=
e<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Extend execution fence to support a callback=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/execlists: Virtual engine bonding<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Allow specification of parallel execbuf<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/gtt: Always acquire struct_mutex for gen6_ppg=
tt_cleanup<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/gtt: Neuter the deferred unbind callback from=
 gen6_ppgtt_cleanup<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Keep user GGTT alive for a minimum of 250ms<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Kill the undead intel_context.c zombie<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Split GEM object type definition to its own =
header<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Pull GEM ioctls interface to its own file<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Move object-&gt;pages API to i915_gem_object=
.[ch]<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Move shmem object setup to its own file<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Move phys objects to its own file<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Move mmap and friends to its own file<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Move GEM domain management to its own file<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Move more GEM objects under gem/<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Pull scatterlist utils out of i915_gem.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Move GEM object domain management from struc=
t_mutex to local<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Move GEM object waiting to its own file<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Move GEM object busy checking to its own fil=
e<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Move GEM client throttling to its own file<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Rename intel_context.active to .inflight<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Drop the deferred active reference<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Take a runtime pm wakeref for atomic commits=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Avoid refcount_inc on known zero count<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/gtt: Avoid overflowing the WC stash<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Drop check for non-NULL entry in llist_for_e=
ach_entry_safe<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Make default value for i915.mmio_debug a com=
pile time option<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Track the purgeable objects on a separate ev=
iction list<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Report all objects with allocated pages to t=
he shrinker<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/selftests: Flush partial-tiling object once<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Use unchecked writes for setting up the fenc=
es<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Use unchecked uncore writes to flush the GTT=
<br>
=C2=A0 =C2=A0 =C2=A0 drm: Flush output polling on shutdown<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/gtt: Replace struct_mutex serialisation for a=
llocation<br>
=C2=A0 =C2=A0 =C2=A0 dma-buf: Discard old fence_excl on retrying get_fences=
_rcu for realloc<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Move object close under its own lock<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Skip context_barrier emission for unused con=
texts<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Report an earlier wedged event when suspendi=
ng the engines<br>
=C2=A0 =C2=A0 =C2=A0 dma-fence: Signal all callbacks from dma_fence_release=
()<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Allow interrupts when taking the timeline-&g=
t;mutex<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Promote i915-&gt;mm.obj_lock to be irqsafe<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Pull kref into i915_address_space<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Rename i915_hw_ppgtt to i915_ppgtt<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Add a label for config DRM_I915_SPIN_REQUEST=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Prevent lock-cycles between GPU waits and GP=
U resets<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Combine unbound/bound list tracking for obje=
cts<br>
=C2=A0 =C2=A0 =C2=A0 dma-fence/reservation: Markup rcu protected access for=
 DEBUG_MUTEXES<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: kerneldoc warnings squelched<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Move fence register tracking from i915-&gt;m=
m to ggtt<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Enable refcount debugging for default debug =
levels<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Discard some redundant cache domain flushes<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Execute signal callbacks from no-op i915_req=
uest_wait<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Refine i915_reset.lock_map<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Keep contexts pinned until after the next ke=
rnel context switch<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Stop retiring along engine<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Replace engine-&gt;timeline with a plain lis=
t<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Avoid tainting i915_gem_park() with wakeref.=
lock<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/gtt: Serialise both updates to PDE and our sh=
adow<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/guc: Reduce verbosity on log overflows<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Keep engine alive as we retire the context<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Use drm_gem_object.resv<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Skip shrinking already freed pages<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/selftests: Flush live_evict<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Don&#39;t dereference request if it may have=
 been retired<br>
when printing<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Make the semaphore saturation mask global<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/i915/execlists: Detect cross-contamination with Gu=
C<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Stop passing I915_WAIT_LOCKED to i915_reques=
t_wait()<br>
<br>
Christian K=C3=B6nig (18):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: remove DRM_AUTH from IOCTLs which also have =
DRM_RENDER_ALLOW<br>
=C2=A0 =C2=A0 =C2=A0 drm/scheduler: rework job destruction<br>
=C2=A0 =C2=A0 =C2=A0 MAINTAINERS: drop Jerry as TTM maintainer<br>
=C2=A0 =C2=A0 =C2=A0 dma-buf: start caching of sg_table objects v2<br>
=C2=A0 =C2=A0 =C2=A0 drm: remove prime sg_table caching<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: rename amdgpu_prime.[ch] into amdgpu_dma_b=
uf.[ch]<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: remove static GDS, GWS and OA allocation<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/ttm: Make LRU removal optional v2<br>
=C2=A0 =C2=A0 =C2=A0 drm/ttm: return immediately in case of a signal<br>
=C2=A0 =C2=A0 =C2=A0 drm/ttm: remove manual placement preference<br>
=C2=A0 =C2=A0 =C2=A0 drm/ttm: cleanup ttm_bo_mem_space<br>
=C2=A0 =C2=A0 =C2=A0 drm/ttm: immediately move BOs to the new LRU v3<br>
=C2=A0 =C2=A0 =C2=A0 drm/ttm: fix busy memory to fail other user v10<br>
=C2=A0 =C2=A0 =C2=A0 drm/ttm: fix ttm_bo_unreserve<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: drop some validation failure messages<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: create GDS, GWS and OA in system domain<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: stop removing BOs from the LRU v3<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: disable concurrent flushes for Navi10 v2<b=
r>
<br>
Chunming Zhou (2):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add DRIVER_SYNCOBJ_TIMELINE to amdgpu<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: use ttm_eu_reserve_buffers instead of=
<br>
amdgpu_bo_reserve v2<br>
<br>
Claudiu Beznea (3):<br>
=C2=A0 =C2=A0 =C2=A0 drm: atmel-hlcdc: add config option for clock selectio=
n<br>
=C2=A0 =C2=A0 =C2=A0 drm: atmel-hlcdc: avoid initializing cfg with zero<br>
=C2=A0 =C2=A0 =C2=A0 drm/atmel-hlcdc: revert shift by 8<br>
<br>
Clinton Taylor (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/icl: Set GCP_COLOR_INDICATION only for 10/12 =
bit deep color<br>
<br>
Cl=C3=A9ment P=C3=A9ron (2):<br>
=C2=A0 =C2=A0 =C2=A0 drm: panfrost: add optional bus_clock<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: gpu: mali-midgard: Add H6 mali gpu compat=
ible<br>
<br>
Colin Ian King (6):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: fix spelling mistake &quot;retrived&quot; =
-&gt; &quot;retrieved&quot;<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/gtt: set err to -ENOMEM on memory allocation =
failure<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: fix null pointer dereference on dev<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: fix use of uninitialized pointer vaddr<br>
=C2=A0 =C2=A0 =C2=A0 drm/bridge: sii902x: fix comparision of u32 with less =
than zero<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: fix a couple of spelling mistakes<br>
<br>
Dan Carpenter (5):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: selftest_lrc: Check the correct variable<br>
=C2=A0 =C2=A0 =C2=A0 drm/bridge: sii902x: re-order conditions to prevent ou=
t of bounds read<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Fix bounds checking in amdgpu_ras_is_suppo=
rted()<br>
=C2=A0 =C2=A0 =C2=A0 drm/mcde: Fix an uninitialized variable<br>
=C2=A0 =C2=A0 =C2=A0 drm: self_refresh: Fix a reversed condition in<br>
drm_self_refresh_helper_cleanup()<br>
<br>
Daniel Drake (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/fbc: disable framebuffer compression on Gemin=
iLake<br>
<br>
Daniel He (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Modified AUX_DPHY_RX_CONTROL0<br>
<br>
Daniel Vetter (17):<br>
=C2=A0 =C2=A0 =C2=A0 drm/doc: Improve docs for conn_state-&gt;best_encoder<=
br>
=C2=A0 =C2=A0 =C2=A0 drm: Some ocd in drm_file.c<br>
=C2=A0 =C2=A0 =C2=A0 drm/doc: More fine-tuning on userspace review requirem=
ents<br>
=C2=A0 =C2=A0 =C2=A0 drm/docs: More links for implicit/explicit fencing.<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/crc-debugfs: User irqsafe spinlock in drm_crtc_add=
_crc_entry<br>
=C2=A0 =C2=A0 =C2=A0 drm/vkms: Forward timer right after drm_crtc_handle_vb=
lank<br>
=C2=A0 =C2=A0 =C2=A0 drm/crc-debugfs: Also sprinkle irqrestore over early e=
xits<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;du-next-20190608-2&#39; of<br>
git://<a href=3D"http://linuxtv.org/pinchartl/media" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">linuxtv.org/pinchartl/media</a> into drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;omapdrm-5.3&#39; of git://<a href=3D"ht=
tp://git.kernel.org/.../tomba/linux" rel=3D"noreferrer noreferrer" target=
=3D"_blank">git.kernel.org/.../tomba/linux</a><br>
into drm-next<br>
=C2=A0 =C2=A0 =C2=A0 drm/fb: document dirty helper better<br>
=C2=A0 =C2=A0 =C2=A0 drm/ast: Drop fb_debug_enter/leave<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;drm-misc-next-2019-06-14&#39; of<br>
git://<a href=3D"http://anongit.freedesktop.org/drm/drm-misc" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">anongit.freedesktop.org/drm/drm-misc</a>=
 into drm-next<br>
=C2=A0 =C2=A0 =C2=A0 drm/todo: Improve drm_gem_object funcs todo<br>
=C2=A0 =C2=A0 =C2=A0 drm/gem: Unexport drm_gem_(un)pin/v(un)map<br>
=C2=A0 =C2=A0 =C2=A0 drm/vkms: Move format arrays to vkms_plane.c<br>
=C2=A0 =C2=A0 =C2=A0 Merge v5.2-rc5 into drm-next<br>
=C2=A0 =C2=A0 =C2=A0 drm/todo: Update drm_gem_object_funcs todo even more<b=
r>
<br>
Daniele Ceraolo Spurio (12):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_display_power.h/c from intel_r=
untime_pm.h/c<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: move more defs in intel_display_power.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/guc: always use Command Transport Buffers<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/wopcm: update default size for gen11+<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: prefer i915_runtime_pm in intel_runtime func=
tion<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Remove rpm asserts that use i915<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: make enable/disable rpm assert function use =
the rpm structure<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: move and rename i915_runtime_pm<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: move a few more functions to accept the rpm =
structure<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: update rpm_get/put to use the rpm structure<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: update with_intel_runtime_pm to use the rpm =
structure<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: make intel_wakeref work on the rpm struct<br=
>
<br>
Dave Airlie (20):<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;drm-misc-next-2019-05-24&#39; of<br>
git://<a href=3D"http://anongit.freedesktop.org/drm/drm-misc" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">anongit.freedesktop.org/drm/drm-misc</a>=
 into drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;drm-intel-next-2019-05-24&#39; of<br>
git://<a href=3D"http://anongit.freedesktop.org/drm/drm-intel" rel=3D"noref=
errer noreferrer" target=3D"_blank">anongit.freedesktop.org/drm/drm-intel</=
a> into drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;drm-next-5.3&#39; of<br>
git://<a href=3D"http://people.freedesktop.org/~agd5f/linux" rel=3D"norefer=
rer noreferrer" target=3D"_blank">people.freedesktop.org/~agd5f/linux</a> i=
nto drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;drm-misc-next-2019-06-05&#39; of<br>
git://<a href=3D"http://anongit.freedesktop.org/drm/drm-misc" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">anongit.freedesktop.org/drm/drm-misc</a>=
 into drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;drm-next-5.3&#39; of<br>
git://<a href=3D"http://people.freedesktop.org/~agd5f/linux" rel=3D"norefer=
rer noreferrer" target=3D"_blank">people.freedesktop.org/~agd5f/linux</a> i=
nto drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;vmwgfx-next&#39; of<br>
git://<a href=3D"http://people.freedesktop.org/~thomash/linux" rel=3D"noref=
errer noreferrer" target=3D"_blank">people.freedesktop.org/~thomash/linux</=
a> into drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;drm-misc-next-2019-06-20&#39; of<br>
git://<a href=3D"http://anongit.freedesktop.org/drm/drm-misc" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">anongit.freedesktop.org/drm/drm-misc</a>=
 into drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;drm-intel-next-2019-06-19&#39; of<br>
git://<a href=3D"http://anongit.freedesktop.org/drm/drm-intel" rel=3D"noref=
errer noreferrer" target=3D"_blank">anongit.freedesktop.org/drm/drm-intel</=
a> into drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge commit &#39;refs/for-upstream/mali-dp&#39; of<br=
>
git://<a href=3D"http://linux-arm.org/linux-ld" rel=3D"noreferrer noreferre=
r" target=3D"_blank">linux-arm.org/linux-ld</a> into drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;drm/tegra/for-5.3-rc1&#39; of<br>
git://<a href=3D"http://anongit.freedesktop.org/tegra/linux" rel=3D"norefer=
rer noreferrer" target=3D"_blank">anongit.freedesktop.org/tegra/linux</a> i=
nto drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;for-airlie-tda998x&#39; of<br>
git://<a href=3D"http://git.armlinux.org.uk/~rmk/linux-arm" rel=3D"noreferr=
er noreferrer" target=3D"_blank">git.armlinux.org.uk/~rmk/linux-arm</a> int=
o drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;drm-next-5.3-2019-06-25&#39; of<br>
git://<a href=3D"http://people.freedesktop.org/~agd5f/linux" rel=3D"norefer=
rer noreferrer" target=3D"_blank">people.freedesktop.org/~agd5f/linux</a> i=
nto drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;drm-msm-next-2019-06-25&#39; of<br>
<a href=3D"https://gitlab.freedesktop.org/drm/msm" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://gitlab.freedesktop.org/drm/msm</a> into drm=
-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;exynos-drm-next-for-v5.3&#39; of<br>
git://<a href=3D"http://git.kernel.org/.../daeinki/drm-exynos" rel=3D"noref=
errer noreferrer" target=3D"_blank">git.kernel.org/.../daeinki/drm-exynos</=
a> into drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;for-airlie-armada&#39; of<br>
git://<a href=3D"http://git.armlinux.org.uk/~rmk/linux-arm" rel=3D"noreferr=
er noreferrer" target=3D"_blank">git.armlinux.org.uk/~rmk/linux-arm</a> int=
o drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;drm-misc-next-fixes-2019-06-27&#39; of<=
br>
git://<a href=3D"http://anongit.freedesktop.org/drm/drm-misc" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">anongit.freedesktop.org/drm/drm-misc</a>=
 into drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;drm-next-5.3-2019-06-27&#39; of<br>
git://<a href=3D"http://people.freedesktop.org/~agd5f/linux" rel=3D"norefer=
rer noreferrer" target=3D"_blank">people.freedesktop.org/~agd5f/linux</a> i=
nto drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;drm-next-5.3-2019-07-09&#39; of<br>
git://<a href=3D"http://people.freedesktop.org/~agd5f/linux" rel=3D"norefer=
rer noreferrer" target=3D"_blank">people.freedesktop.org/~agd5f/linux</a> i=
nto drm-next<br>
=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;imx-drm-next-2019-07-05&#39; of<br>
git://<a href=3D"http://git.pengutronix.de/git/pza/linux" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">git.pengutronix.de/git/pza/linux</a> into dr=
m-next<br>
=C2=A0 =C2=A0 =C2=A0 mm: adjust apply_to_pfn_range interface for dropped to=
ken.<br>
<br>
David Riley (4):<br>
=C2=A0 =C2=A0 =C2=A0 drm/virtio: Ensure cached capset entries are valid bef=
ore copying.<br>
=C2=A0 =C2=A0 =C2=A0 drm/virtio: Wake up all waiters when capset response c=
omes in.<br>
=C2=A0 =C2=A0 =C2=A0 drm/virtio: Fix cache entry creation race.<br>
=C2=A0 =C2=A0 =C2=A0 drm/virtio: Add memory barriers for capset cache.<br>
<br>
Deepak Rawat (2):<br>
=C2=A0 =C2=A0 =C2=A0 drm/vmwgfx: Add debug message for layout change ioctl<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/vmwgfx: Use VMW_DEBUG_KMS for vmwgfx mode-setting =
user errors<br>
<br>
Derek Lai (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: add i2c_hw_Status check to make sure =
as HW I2c in use<br>
<br>
Dmytro Laktyushkin (14):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: move signal type out of otg dlg param=
s<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: stop external access to internal optc=
 sync params<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: fix acquire_first_split_pipe function=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: add null checks and set update flags<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: move vmid determination logic out of =
dc<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: clean up validation failure log spam<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: fix dsc validation<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: fix fpga fclk programming<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: fix dcn2 mpc split decision<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: fix odm mpo disable<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: fix macro_tile_size for tiling<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: add null checks and set update flags =
for DCN2<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: move vmid determination logic to a mo=
dule<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: add missing mod_vmid destructor<br>
<br>
Dongli Zhang (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: remove unused IO_TLB_SEGPAGES which should b=
e defined by swiotlb<br>
<br>
Dongwon Kim (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/gen11: enable support for headerless msgs<br>
<br>
Douglas Anderson (7):<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: drm/bridge/synopsys: dw-hdmi: Add &quot;u=
nwedge&quot; for ddc bus<br>
=C2=A0 =C2=A0 =C2=A0 drm/bridge/synopsys: dw-hdmi: Add &quot;unwedge&quot; =
for ddc bus<br>
=C2=A0 =C2=A0 =C2=A0 drm/bridge/synopsys: dw-hdmi: Fix unwedge crash when n=
o pinctrl entries<br>
=C2=A0 =C2=A0 =C2=A0 drm: bridge: dw-hdmi: Add hook for resume<br>
=C2=A0 =C2=A0 =C2=A0 drm/rockchip: dw_hdmi: Handle suspend/resume<br>
=C2=A0 =C2=A0 =C2=A0 drm/rockchip: Properly adjust to a true clock in adjus=
ted_mode<br>
=C2=A0 =C2=A0 =C2=A0 drm/rockchip: Base adjustments of the mode based on pr=
ev adjustments<br>
<br>
Emil Velikov (2):<br>
=C2=A0 =C2=A0 =C2=A0 drm/virtio: remove irrelevant DRM_UNLOCKED flag<br>
=C2=A0 =C2=A0 =C2=A0 drm/omap: remove open-coded drm_invalid_op()<br>
<br>
Emily Deng (5):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: fix unload driver fail<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Need to set the baco cap before baco reset=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu:Fix the unpin warning about csb buffer<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/sriov: Correct some register program method=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/display: Fix reload driver error<br>
<br>
Eric Anholt (11):<br>
=C2=A0 =C2=A0 =C2=A0 drm/v3d: Switch the type of job-&gt; to reduce casting=
.<br>
=C2=A0 =C2=A0 =C2=A0 drm/v3d: Refactor job management.<br>
=C2=A0 =C2=A0 =C2=A0 drm/v3d: Add support for compute shader dispatch.<br>
=C2=A0 =C2=A0 =C2=A0 drm/v3d: Drop reservation of a shared slot in the dma-=
buf reservations.<br>
=C2=A0 =C2=A0 =C2=A0 drm/v3d: Add missing implicit synchronization.<br>
=C2=A0 =C2=A0 =C2=A0 drm/doc: Allow new UAPI to be used once it&#39;s in dr=
m-next/drm-misc-next.<br>
=C2=A0 =C2=A0 =C2=A0 drm/doc: Document expectation that userspace review lo=
oks at kernel uAPI.<br>
=C2=A0 =C2=A0 =C2=A0 drm/v3d: Fix debugfs reads of MMU regs.<br>
=C2=A0 =C2=A0 =C2=A0 drm/v3d: Set the correct DMA mask according to the MMU=
&#39;s limits.<br>
=C2=A0 =C2=A0 =C2=A0 drm/v3d: Dump V3D error debug registers in debugfs, an=
d one at reset.<br>
=C2=A0 =C2=A0 =C2=A0 drm/v3d: Fix and extend MMU error handling.<br>
<br>
Eric Bernstein (5):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Refactor DIO stream encoder<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Dont aser if DP_DPHY_INTERNAL_CTRL<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Refactor DIO stream encoder<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Alpha plane type<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: expose enable dp output functions<br>
<br>
Eric Yang (8):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Set dispclk and dprefclock directly<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: move back vbios cmd table for set dpr=
efclk<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: make clk mgr soc specific<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Move CLK_BASE_INNER macro<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: move clk_mgr files to right place<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Fix type of pp_smu_wm_set_range struc=
t<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Refactor clk_mgr functions<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Refactor clk_mgr functions<br>
<br>
Erico Nunes (2):<br>
=C2=A0 =C2=A0 =C2=A0 drm/lima: add timeout to drm scheduler init<br>
=C2=A0 =C2=A0 =C2=A0 drm/scheduler: Fix job cleanup without timeout handler=
<br>
<br>
Ernst Sj=C3=B6strand (6):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/amdgpu: Indent AMD_IS_APU properly<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/amdgpu: Fix amdgpu_set_pp_od_clk_voltage error=
 check<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/amdgpu: amdgpu_hwmon_show_temp: initialize tem=
p<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/amdgpu: Check stream in amdgpu_dm_commit_plane=
s<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/amdgpu: Fix style issues in dcn20_resource.c<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/amd/amdgpu: sdma_v4_0_start: initialize r<br>
<br>
Eryk Brol (5):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Disable audio stream only if it&#39;s=
 currently enabled<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Ensure DRR triggers in BP<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Increase Backlight Gain Step Size<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Ensure DRR triggers in BP<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Change DCN2 vupdate start programming=
<br>
<br>
Evan Quan (33):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: support hotspot/memory critical lim=
it values<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: support temperature emergency max v=
alues<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: support SMU metrics table on Vega12=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: expose current hotspot and memory t=
emperatures V2<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: support hwmon temperature channel l=
abels V2<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: expose Vega12 current power<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: expose Vega12 current gpu activity<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: expose Vega20 realtime memory utili=
zation<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: expose Vega12 realtime memory utili=
zation<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: expose SMU7 asics realtime memory u=
tilization<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add new sysfs interface for memory realtim=
e utilization<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: enable separate timeout setting for every =
ring type V4<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: fix Vega10 mclk/socclk voltage link=
 setup<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: valid Vega10 DPMTABLE_OD_UPDATE_VDD=
C settings V2<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: avoid repeat AVFS enablement/disabl=
ement<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: update Vega10 power state on OD<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: force to update all clock tables on=
 OD reset<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: update Vega10 ACG Avfs Gb parameter=
s<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: drop unnecessary sw smu check<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: drop redundant smu call<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: support ppfeatures sysfs interface =
on sw smu routine<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: honor hw limit on fetching metrics =
data<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: support uclk activity retrieve on s=
w smu routine<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: support sw smu hotspot and memory t=
emperature retrieval<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: fix sw SMU wrong UVD/VCE powergate =
setting<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: enable ppfeaturemask module paramet=
er support on Vega20<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: check gfxclk dpm enablement before =
proceeding<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: check prerequisite for VCN power ga=
ting<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: support runtime ppfeatures setting =
on Navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add missing smu_get_clk_info_from_v=
bios() call<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: no memory activity support on Vega1=
0<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: fix MGPU fan boost enablement for XGMI res=
et<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: use hardware fan control if no powe=
rplay fan table<br>
<br>
Fabien Dessenne (2):<br>
=C2=A0 =C2=A0 =C2=A0 drm/stm: ltdc: manage the get_irq probe defer case<br>
=C2=A0 =C2=A0 =C2=A0 drm/stm: ltdc: return appropriate error code during pr=
obe<br>
<br>
Fabio Estevam (4):<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: Add vendor prefix for VXT Ltd<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: Add VXT VL050-8048NT-C01 panel bindings<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/panel: simple: Add support for VXT VL050-8048NT-C0=
1 panel<br>
=C2=A0 =C2=A0 =C2=A0 drm/damage-helper: Use NULL instead of 0<br>
<br>
Felix Kuehling (10):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Reserve shared fence for eviction fence<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Improve error handling for HMM<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: Fix a circular lock dependency<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: Simplify eviction state logic<br>
=C2=A0 =C2=A0 =C2=A0 drm/ttm: return -EBUSY if waiting for busy BO fails<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: Print a warning when the runlist becomes o=
versubscribed<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Use FENCE_OWNER_KFD in process_sync_pds_re=
sv<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Fix tracking of invalid userptrs<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: Add chained_runlist_idle_disable flag to p=
m4_mes_runlist<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: Disable idle optimization for chained runl=
ist<br>
<br>
Fernando Pacheco (5):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/uc: Rename uC firmware init/fini functions<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/i915/uc: Reserve upper range of GGTT<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/uc: Place uC firmware in upper range of GGTT<=
br>
=C2=A0 =C2=A0 =C2=A0 Revert &quot;drm/i915/guc: Disable global reset&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/selftests: Check that gpu reset is usable fro=
m atomic context<br>
<br>
Flora Cui (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: fix scheduler timeout calc<br>
<br>
Fuqian Huang (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Use kmemdup rather than duplicating its im=
plementation<br>
<br>
Gary Kattan (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Implement CM dealpha and bias interfa=
ces<br>
<br>
Geert Uytterhoeven (2):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Grammar s/the its/its/<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add missing newline at end of file<br=
>
<br>
Gen Zhang (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/edid: Fix a missing-check bug in drm_load_edid_fir=
mware()<br>
<br>
Georgi Djakov (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm/mdp5: Use the interconnect API<br>
<br>
Gerd Hoffmann (2):<br>
=C2=A0 =C2=A0 =C2=A0 drm/cirrus: remove leftover files<br>
=C2=A0 =C2=A0 =C2=A0 drm/virtio: drop framebuffer dirty tracking code<br>
<br>
Greg Hackmann (3):<br>
=C2=A0 =C2=A0 =C2=A0 dma-buf: give each buffer a full-fledged inode<br>
=C2=A0 =C2=A0 =C2=A0 dma-buf: add DMA_BUF_SET_NAME ioctls<br>
=C2=A0 =C2=A0 =C2=A0 dma-buf: add show_fdinfo handler<br>
<br>
Greg Kroah-Hartman (17):<br>
=C2=A0 =C2=A0 =C2=A0 vga_switcheroo: no need to check return value of debug=
fs_create functions<br>
=C2=A0 =C2=A0 =C2=A0 panel: rocktech: no need to check return value of debu=
gfs_create functions<br>
=C2=A0 =C2=A0 =C2=A0 drm: no need to check return value of debugfs_create f=
unctions<br>
=C2=A0 =C2=A0 =C2=A0 sti: no need to check return value of debugfs_create f=
unctions<br>
=C2=A0 =C2=A0 =C2=A0 host1x: debugfs_create_dir() can never return NULL<br>
=C2=A0 =C2=A0 =C2=A0 radeon: no need to check return value of debugfs_creat=
e functions<br>
=C2=A0 =C2=A0 =C2=A0 amdgpu: no need to check return value of debugfs_creat=
e functions<br>
=C2=A0 =C2=A0 =C2=A0 amdkfd: no need to check return value of debugfs_creat=
e functions<br>
=C2=A0 =C2=A0 =C2=A0 amdgpu_dm: no need to check return value of debugfs_cr=
eate functions<br>
=C2=A0 =C2=A0 =C2=A0 drm: debugfs: make drm_debugfs_create_files() never fa=
il<br>
=C2=A0 =C2=A0 =C2=A0 drm/vc4: no need to check return value of debugfs_crea=
te functions<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: no need to check return value of debugfs_cre=
ate functions<br>
=C2=A0 =C2=A0 =C2=A0 msm: adreno: no need to check return value of debugfs_=
create functions<br>
=C2=A0 =C2=A0 =C2=A0 msm: dpu1: no need to check return value of debugfs_cr=
eate functions<br>
=C2=A0 =C2=A0 =C2=A0 msm: no need to check return value of debugfs_create f=
unctions<br>
=C2=A0 =C2=A0 =C2=A0 komeda: no need to check return value of debugfs_creat=
e functions<br>
=C2=A0 =C2=A0 =C2=A0 malidp: no need to check return value of debugfs_creat=
e functions<br>
<br>
Gurchetan Singh (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/virtio: use u64_to_user_ptr macro<br>
<br>
Gwan-gyeong Mun (6):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dp: Add a config function for YCBCR420 output=
s<br>
=C2=A0 =C2=A0 =C2=A0 drm: Rename struct edp_vsc_psr to struct dp_sdp<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dp: Program VSC Header and DB for Pixel<br>
Encoding/Colorimetry Format<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dp: Add a support of YCBCR 4:2:0 to DP MSA<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dp: Change a link bandwidth computation for D=
P<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dp: Support DP ports YUV 4:2:0 output to GEN1=
1<br>
<br>
Hans de Goede (7):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dsi: Call drm_connector_cleanup on vlv_dsi_in=
it error exit path<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dsi: Use a fuzzy check for burst mode clock c=
heck<br>
=C2=A0 =C2=A0 =C2=A0 drm: panel-orientation-quirks: Add quirk for GPD pocke=
t2<br>
=C2=A0 =C2=A0 =C2=A0 drm: panel-orientation-quirks: Add quirk for GPD Micro=
PC<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dsi: Move logging of DSI VBT parameters to a =
helper function<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dsi: Move vlv/icl_dphy_param_init call out of=
<br>
intel_dsi_vbt_init (v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dsi: Read back pclk set by GOP and use that a=
s pclk (v3)<br>
<br>
Hariprasad Kelam (2):<br>
=C2=A0 =C2=A0 =C2=A0 drm/bridge: analogix_dp: possible condition with no ef=
fect (if =3D=3D else)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: fix compilation error<br>
<br>
Harish Kasiviswanathan (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: Fix compute profile switching<br>
<br>
Harmanprit Tatla (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Gamma logic limitations causing unint=
ended use<br>
of RAM over ROM.<br>
<br>
Harry Wentland (26):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add ASICREV_IS_PICASSO<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Don&#39;t load DMCU for Raven 1 (v2)<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Drop DCN1_01 guards<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Read soc_bounding_box from gpu_info (=
v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DCN2 and NV ASIC ID<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: add AUX and I2C for DCN2<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add GPIO support for DCN2<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DCN2 BIOS parsing<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DCN2 IRQ handling<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DCN2 changes to DML<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DCN2 DIO<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DCN2 clk mgr<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DCN2 OPTC<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DCN2 OPP<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DCN2 MPC<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DCN2 DPP<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DCN2 HUBP and HUBBUB<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DCN2 MMHUBBUB<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DCN2 DWB<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DCN2 IPP<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DCN2 VMID<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DCN2 HW Sequencer and Resource<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DC core changes for DCN2<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Hook DCN2 into amdgpu_dm and expose a=
s config (v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Enable DC support for Navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add DSC support for Navi (v2)<br>
<br>
Hawking Zhang (83):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp: udpate ta_ras interface header<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add ATHUB 2.0 register headers<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add CLK 11.0 register headers<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add DCN 2.0 register headers<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add HDP 5.0 register headers<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add MP 11.0 register headers<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add NBIO 2.3 register headers<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add VCN 2.0 register headers<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add GC 10.1 register headers (v4)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add MMHUB 2.0 register headers<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add OSS 5.0 register headers<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add SMUIO 11.0 register headers<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add navi10 enums header<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: atomfirmware.h updates for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add doorbell assignement for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add navi10 ip offset header<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Add GDDR6 in vram_name arrary<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add gfx10 specific config in amdgpu_gfx_co=
nfig<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add gfx10 specific new member pa_sc_tile_s=
teering_override<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add gpu_info_firmware v1_1 structure for n=
avi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: parse the new members added by gpu_info uc=
ode v1_1<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add sdma v5 packet header file<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add navi pm4 header<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: query vram type from atomfirmware vram_inf=
o<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: query vram_width from vram_info table<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add nbio v2.3 for navi10 (v4)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/gfx10: new approach to load pfp fw (v4)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/gfx10: new approach to load ce fw (v4)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/gfx10: new approach to load gfx10 me fw (v4=
)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add members in amdgpu_me for gfx queue<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: acquire available gfx queues<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add helper function for gfx queue/bitmap t=
ransition<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: rename amdgpu_gfx_compute_mqd_sw_init<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Move common code to amdgpu_gfx.c<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: enable gfx eop interrupt per gfx pipe<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add module parameter for async_gfx_ring en=
ablement<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: create mqd for gfx queues on navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add new HDP CG flags<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add flag to support IH clock gating<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: correct pte mtype field for navi<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/gmc9: rename AMDGPU_PTE_MTYPE to AMDGPU_PTE_MT=
YPE_VG10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add gfxhub v2.0 block for navi10 (v4)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add mmhub v2 block for navi10 (v4)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add gmc v10 ip block for navi10 (v6)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add irq sources for gfx v10_1<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add irq sources for sdma v5_0<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add irq sources for vcn v2_0 (v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: move dcn v1_0 irq source header to iv=
srcid/dcn/<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add navi10 ih ip block (v3)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add structure to support build-in toc to p=
sp sos<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp: support init psp sos microcode with bu=
ild-in toc<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: use rlc toc from psp sos binary<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: rename rlc autoload to backdoor autoload<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add helper function to print psp hdr<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp: print out psp v11 ucode hdr in drm deb=
ug mode<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp: support print out psp firmware header =
v1_1 info<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp: add structure to support load toc in p=
sp (v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp: add support to load TOC to psp<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp: start rlc autoload after psp recieved =
all gfx firmware<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp: switch to use sos_offset_bytes member =
as sys_bin_size<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp: perform tmr_init and asd_init after lo=
ading sysdrv/sos<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp: update psp gfx interface to match with=
 psp fw (v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp: initialize autoload_supported flag in =
psp_sw_init<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/amdgpu: add flag to mark whether autoload is s=
upported or not<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp: skip mec jt when autoload is enabled<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: enable psp front door loading by default o=
n navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: declare navi10 asd firmware<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp11: skip ta firmware for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add pa_sc_tile_steering_override to drm_am=
dgpu_info_device<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: set the default value of pa_sc_tile_steeri=
ng_override<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add initial support for sdma v5.0 (v6)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add gfx v10 implementation (v10)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: avoid to use SOC15_REG_OFFSET in static ar=
ray for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add navi10 common ip block (v3)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Add navi10 kfd support for amdgpu (v3)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: update golden setting programming logic<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: enable sw smu driver for navi10 by default=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: remove uvd_gated/vce_gated from smu=
_power_context (v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move get_thermal_temperature_range =
to ppt funcs<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: fix no statements in function retur=
ning non-void<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: initialize THM &amp; CLK IP registers base=
 address<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: enable DSC support by default<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: fix modprobe failure for uvd_4/5/6<br>
<br>
Huang Rui (40):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add navi10 asic type<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add NV series gpu family id<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add GDDR6 vram type<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add navi10 gpu info firmware<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add v10 structs header (v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add gfx v10 clear state header v2<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: set navi10&#39;s fw loading type as direct=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: load smc ucode at first with psp while rlc=
 auto load<br>
is supported<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add to set navi ip blocks<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: update smu v11 ppsmc header<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: update smu 11 driver if header for =
navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: fix the mp/smuio header for navi10<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: introduce the navi10 pptable implem=
entation<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: set smu v11 funcs for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add navi10 smc ucode init and navi1=
0 ppt<br>
functions setting<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move bootup value before read pptab=
le from vbios<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: update smu11 driver if header for n=
avi10 (v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: bump smc firmware header version to v2 (v2=
)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: fix the issue of checking on message mappi=
ng<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: smu needs to be initialized after r=
lc in direct mode<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: introduce the function to load the =
soft<br>
pptable for navi10 (v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: modify the feature mask to enable g=
fx/soc dpm<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: skip od feature on navi10 for the m=
oment<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: introduce smu clk type to handle pp=
clk for each asic<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: introduce smu feature type to handl=
e feature<br>
mask for each asic<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: introduce smu table id type to hand=
le the smu<br>
table for each asic<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: init table_count for smu tables on =
asic level<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add tables_init interface for each =
asic<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: modify smu_update_table to use SMU_=
TABLE_xxx<br>
as the input<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: use the table size member in the st=
ructure<br>
instead of getting directly<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move PPTable_t uses into asic level=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move SmuMetrics_t uses into asic le=
vel<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move Watermarks_t uses into asic le=
vel<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: introduce smu power source type to =
handle<br>
AC/DC source for each asic<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move getting MAX_FAN_RPM value to a=
sic level<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: don&#39;t include the smu11 driver =
if header in<br>
smu v11 (v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: do not set dpm_enabled flag before =
VCN/DCN<br>
DPM is workable<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: set dpm_enabled flag but don&#39;t =
enable vcn dpm<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: make mmhub pg bit configured by pg_=
flags<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: make athub pg bit configured by pg_=
flags<br>
<br>
Hugo Hu (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Don&#39;t use ROM for output TF if GA=
MMA_CS_TFM_1D<br>
<br>
Icenowy Zheng (1):<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: gpu: add bus clock for Mali Midgard GPUs<=
br>
<br>
Ilya Bakoulin (8):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add writeback_config to VBA vars<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add writeback_config to VBA vars<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Fix DCFCLK and SOCCLK not set<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Fix ODM combine data format<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Fix LB BPP and Cursor width<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Drive-by fixes for display_mode_vba<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Fix incorrect DML output_bpp value<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Fix incorrect vba type<br>
<br>
Imre Deak (19):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/icl: Fix MG_DP_MODE() register programming<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/i915/icl: Factor out combo PHY lane power setup he=
lper<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/icl: Add missing combo PHY lane power setup<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Tune down WARN about incorrect VBT TC legacy=
 flag<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/icl: More workaround for port F detection due=
 to broken VBTs<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Add support for tracking wakerefs w/o power-=
on guarantee<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Force printing wakeref tacking during pm_cle=
anup<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Verify power domains state during suspend in=
 all cases<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Add support for asynchronous display power d=
isabling<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Disable power asynchronously during DP AUX t=
ransfers<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: WARN for eDP encoders in intel_dp_detect_dpc=
d()<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Remove the unneeded AUX power ref from intel=
_dp_detect()<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Remove the unneeded AUX power ref from intel=
_dp_hpd_pulse()<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Replace use of PLLS power domain with DISPLA=
Y_CORE domain<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Avoid taking the PPS lock for non-eDP/VLV/CH=
V<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Assert that TypeC ports are not used for eDP=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/icl: Fix AUX-B HW not done issue w/o AUX-A<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/mst: Fix MST sideband up-reply failure handling<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/i915/icl: Ensure port A combo PHY HW state is corr=
ect<br>
<br>
Jack Xiao (51):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/gfx10: add special unmap_queues packet for =
preemption<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: enable async gfx ring by default<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/athub2: enable athub2 clock gating<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: refine the PTE encoding of PRT for navi10<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add the trailing fence per ring<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add mcbp driver parameter<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: enable the static csa when mcbp enabled<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add ib preemption status in amdgpu_job (v2=
)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/sdma: allocate CSA per sdma ring<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: program for resuming preempted ib<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add mcbp unit test in debugfs (v3)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: mark the partial job as preempted in mcbp =
unit test<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/mes: add amdgpu_mes driver parameter<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/mes: add mes header file and definition<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/mes: add definitions of ip callback functio=
n<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/mes: enable mes on navi10 and later asic<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/mes10.1: add ip block mes10.1 (v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/gfx10: fix issues for suspend/resume<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/vcn2: notify SMU power up/down VCN<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/vcn2: don&#39;t access register when power =
gated<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: enable vcn dpm scheme for navi<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/nv: set vcn pg flag<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/sdma5: incorrect variable type for gpu addr=
ess<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/ucode: add the definitions of MES ucode and=
 ucode data<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/ucode: add mes firmware file support<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/mes10.1: add mes firmware info fields<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/mes10.1: load mes firmware file to CPU buff=
er<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/mes10.1: implement ucode CPU buffer destruc=
tion<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/mes10.1: upload mes ucode to gpu buffer<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/mes10.1: upload mes data ucode to gpu buffe=
r<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/mes10.1: implement ucode buffers destructio=
n<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/mes10.1: implement MES firmware backdoor lo=
ading<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/mes10.1: implement mes enablement function<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/mes10.1: enable mes FW backdoor loading<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay/smu11: disable PLL shutdown when gfx=
off enabled<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: RLC must be disabled after SMU when S3 on =
navi<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/gfx10: remove unnecessary waiting on gfx in=
active<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/gfx10: require to pin/unpin CSIB BO when su=
spend/resume<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd: the data retured from PRT is expected to be 0=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp: add new VCN RAM ucode id to psp<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add corresponding vcn ram ucode id<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp: convert ucode id to psp ucode id<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/psp: add new psp interface for vcn updating=
 sram<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: update smu11_driver_if_navi10.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: disable fw dstate when gfxoff is en=
abled<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: enable BACO feature as WAR<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add field indicating if has PCIE atomics s=
upport<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: enable PCIE atomics ops support<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: remove duplicated PCIE atomics request<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: remove an unused variable<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: increase waiting time for smu respo=
nse<br>
<br>
Jack Zhang (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/sriov: fix Tonga load driver failed<br>
<br>
Jagadeesh Pagadala (1):<br>
=C2=A0 =C2=A0 =C2=A0 gpu/drm: Remove duplicate headers<br>
<br>
Jagan Teki (4):<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: display: Document FriendlyELEC HD702E LCD=
 panel<br>
=C2=A0 =C2=A0 =C2=A0 drm/panel: simple: Add FriendlyELEC HD702E 800x1280 LC=
D panel<br>
=C2=A0 =C2=A0 =C2=A0 drm/sun4i: sun6i_mipi_dsi: Support DSI GENERIC_SHORT_W=
RITE_2 transfer<br>
=C2=A0 =C2=A0 =C2=A0 drm/panel: st7701: Swap vertical front and back porch =
timings<br>
<br>
James Clarke (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm: Fix drm.h uapi header for GNU/kFreeBSD<br>
<br>
James Zhu (6):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add EDC counter register<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add gfx9 gpr EDC workaround when RAS is en=
abled<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Fix S3 test issue<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Fixed missing to clear some EDC count<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Add GDS clearing workaround in later init =
for gfx9<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: explicitly set mmGDS_VMID0_BASE to 0<br>
<br>
Jani Nikula (69):<br>
=C2=A0 =C2=A0 =C2=A0 Merge drm/drm-next into drm-intel-next-queued<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: ensure more headers remain self-contained<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/i915: make intel_bios.h self-contained<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dvo: rename dvo.h to intel_dvo_dev.h and make=
 self-contained<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: make intel_dpll_mgr.h self-contained<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: move dsi init functions to intel_dsi.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_fifo_underrun.h from intel_drv=
.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_dp_link_training.h from intel_=
drv.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_dp_aux_backlight.h from intel_=
drv.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract i915_irq.h from intel_drv.h and i915=
_drv.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_hotplug.h from intel_drv.h and=
 i915_drv.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_bios.h functions from i915_drv=
.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_quirks.h from intel_drv.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_overlay.h from intel_drv.h and=
 i915_drv.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_vdsc.h from intel_drv.h and i9=
15_drv.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_dp_mst.h from intel_drv.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_dsi_dcs_backlight.h from intel=
_drv.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_atomic.h from intel_drv.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_runtime_pm.h from intel_drv.h<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: move some leftovers to intel_pm.h from i915_=
drv.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_combo_phy.h from i915_drv.h<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/i915/csr: alpha_support doesn&#39;t depend on csr =
or vice versa<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: add single combo phy init/unit functions<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dvo: move DVO chip types to intel_dvo.c<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dsi: move operation mode types to intel_dsi.h=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: move ranges to intel_display.c<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: remove unused/stale macros and comments from=
 intel_drv.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/csr: move CSR version macros to intel_csr.h<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_dpio_phy.h from i915_drv.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_lpe_audio.h from i915_drv.h<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_acpi.h from i915_drv.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract i915_debugfs.h from i915_drv.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: move i915_vgacntrl_reg() where needed<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: make i915_utils.h self-contained<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: move more generic utils to i915_utils.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: extract intel_gmbus.h from i915_drv.h and re=
name intel_i2c.c<br>
=C2=A0 =C2=A0 =C2=A0 drm/dp: drmP.h include removal<br>
=C2=A0 =C2=A0 =C2=A0 drm/edid: drmP.h include removal<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Update DRIVER_DATE to 20190523<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: remove duplicate typedef for intel_wakeref_t=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Update DRIVER_DATE to 20190524<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: make REG_BIT() and REG_GENMASK() work with v=
ariables<br>
=C2=A0 =C2=A0 =C2=A0 Merge drm/drm-next into drm-intel-next-queued<br>
=C2=A0 =C2=A0 =C2=A0 Revert &quot;drm/i915: Expand subslice mask&quot;<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: add force_probe module parameter to replace =
alpha_support<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/bios: make child device order the priority or=
der<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/bios: store child device pointer in DDI port =
info<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/bios: refactor DDC pin and AUX CH sanitize fu=
nctions<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/bios: use port info child pointer to determin=
e HPD invert<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/bios: use port info child pointer to determin=
e LSPCON presence<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/bios: clean up VBT port info debug logging<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/i915/bios: remove unused, obsolete VBT definitions=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/bios: reserve struct bdb_ prefix for BDB bloc=
ks<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/bios: add BDB block comments before definitio=
ns<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/bios: sort BDB block definitions using block =
ID<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/bios: add VBT swing bit to child device defin=
ition<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/bios: add more LFP options<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/bios: add an enum for BDB block IDs<br>
=C2=A0 =C2=A0 =C2=A0 Documentation/i915: Fix kernel-doc references to moved=
 gem files<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: fix documentation build warnings<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: move pm related declarations to intel_pm.h<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/i915: remove some unused declarations from intel_d=
rv.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: move more atomic plane declarations to intel=
_atomic_plane.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/frontbuffer: remove obsolete comment about ma=
rk busy/idle<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: make intel_sdvo_regs.h self-contained<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: move modesetting output/encoder code under d=
isplay/<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: move modesetting core code under display/<br=
>
=C2=A0 =C2=A0 =C2=A0 Documentation/i915: fix file references after display/=
 subdir renames<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Update DRIVER_DATE to 20190619<br>
<br>
Janusz Krzysztofik (2):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Use drm_dev_unplug()<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Split off pci_driver.remove() tail to drm_dr=
iver.release()<br>
<br>
Jay Cornwall (5):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: Fix gfx8 MEM_VIOL exception handler<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: Preserve wave state after instruction fetc=
h MEM_VIOL<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: Fix gfx9 XNACK state save/restore<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: Preserve ttmp[4:5] instead of ttmp[14:15]<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: Implement queue priority controls for gfx9=
<br>
<br>
Jayant Shekhar (3):<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm/dpu: clean up references of DPU custom bus sca=
ling<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm/dpu: Integrate interconnect API in MDSS<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: msm/disp: Introduce interconnect bindings=
 for MDSS on SDM845<br>
<br>
Jeffrey Hugo (6):<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm/mdp5: Fix mdp5_cfg_init error return<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: msm/dsi: Add 10nm phy for msm8998 compati=
ble<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm/dsi: Add support for MSM8998 10nm dsi phy<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm/dsi: Add old timings quirk for 10nm phy<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm/dsi: Add support for MSM8998 DSI controller<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/msm/adreno: Add A540 support<br>
<br>
Jerome Brunet (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/meson: imply dw-hdmi i2s audio for meson hdmi<br>
<br>
John Harrison (3):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Support flags in whitlist WAs<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Support whitelist workarounds on all engines=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: Add whitelist workarounds for ICL<br>
<br>
Jonas Karlman (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm: Add reference counting on HDR metadata blob<br>
<br>
Jonathan Bakker (1):<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: panel: Add Samsung S6E63M0 panel document=
ation<br>
<br>
Jonathan Kim (4):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add df perfmon regs and funcs for xgmi<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: update df_v3_6 for xgmi perfmons (v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add pmu counters<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu:=C2=A0 add sw_init to df_v1_7<br>
<br>
Jordan Crouse (7):<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm/adreno: Enable 64 bit mode by default on a5xx =
and a6xx targets<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm: Print all 64 bits of the faulting IOMMU addre=
ss<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm: Pass the MMU domain index in struct msm_file_=
private<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm/dpu: Fix error recovery after failing to enabl=
e clocks<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm/dpu: Avoid a null de-ref while recovering from=
 kms init fail<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm/adreno: Call pm_runtime_force_suspend() during=
 unbind<br>
=C2=A0 =C2=A0 =C2=A0 drm/msm/adreno: Ensure that the zap shader region is b=
ig enough<br>
<br>
Jordan Lazare (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Remove superflous error message<br>
<br>
Joshua Aberback (8):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Program VTG params after programming =
Global Sync<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Rename EDID_BLOCK_SIZE to DC_EDID_BLO=
CK_SIZE<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Program VTG params after programming =
Global Sync for DCN2<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Remove dependency on pipe-&gt;plane f=
or immedaite<br>
flip status<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Optimize bandwidth validation by addi=
ng early return<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add profiling tools for bandwidth val=
idation<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Remove OPP clock programming on plane=
 disable<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Set test pattern on blank when using =
Visual Confirm<br>
<br>
Josip Pavic (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: enable abm on dcn2<br>
<br>
Jos=C3=A9 Roberto de Souza (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/psr: Force manual PSR exit in older gens<br>
<br>
Jun Lei (10):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: add support for disconnected eDP pane=
ls<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: dont set=C2=A0 otg offset<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add min_dcfclk_mhz field to bb overri=
des<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: update calculated bounding box logic =
for NV<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: fix pstate allow handling in dcn2<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: always use 4 dp lanes for dml<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add missing VM conversion from hw val=
ues<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: add support for forcing DCFCLK withou=
t<br>
affecting watermarks<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: making DCN20 WM table non-overlapping=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: update DCN2 uclk switch time<br>
<br>
Justin Swartz (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/rockchip: dw_hdmi: add basic rk3228 support<br>
<br>
Jyri Sarha (7):<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: drm/panel: simple: Add binding for TFC S9=
700RTWV43TR-01B<br>
=C2=A0 =C2=A0 =C2=A0 drm/panel: simple: Add TFC S9700RTWV43TR-01B 800x480 p=
anel support<br>
=C2=A0 =C2=A0 =C2=A0 drm/bridge: sii902x: Set output mode to HDMI or DVI ac=
cording to EDID<br>
=C2=A0 =C2=A0 =C2=A0 drm/bridge: sii902x: pixel clock unit is 10kHz instead=
 of 1kHz<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: display: sii902x: Remove trailing white s=
pace<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: display: sii902x: Add HDMI audio bindings=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/bridge: sii902x: Implement HDMI audio support<br>
<br>
J=C3=A9r=C3=B4me Glisse (1):<br>
=C2=A0 =C2=A0 =C2=A0 dma-buf: balance refcount inbalance<br>
<br>
Kefeng Wang (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/omap: Use dev_get_drvdata()<br>
<br>
Kenneth Feng (15):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: enable backdoor smu fw loading (v2)=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: enable power features<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd: add gfxoff support on navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/amdgpu: fw version check with gfxoff<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: gfxoff-seperate the Vega20 case<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: enable DCEFCLK dpm support<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: fix the incorrect type of pptable<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: update smu11_driver_if_navi10.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: enable vcn powergating v2<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add new interface for vcn powergati=
ng<br>
=C2=A0 =C2=A0 =C2=A0 amd/powerplay: fix the issue of uclk dpm<br>
=C2=A0 =C2=A0 =C2=A0 amd/powerplay: enable uclk dpm<br>
=C2=A0 =C2=A0 =C2=A0 amd/powerplay: update the vcn pg<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: enable gfxclk ds,dcefclk ds and fw =
dstate on navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: enable ac/dc feature on navi10<br>
<br>
Kent Russell (8):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Add replay counter defines to NBIO headers=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Add PCIe replay count sysfs file<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Fix CIK references in gmc_v8<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: Cosmetic cleanup<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: Add VegaM support<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Add Unique Identifier sysfs file unique_id=
 v2<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Add CHIP_VEGAM to amdgpu_amdkfd_device_pro=
be<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdkfd: Add procfs-style information for KFD proce=
sses<br>
<br>
Kevin Wang (62):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add helper function to get smu firm=
ware &amp; if version<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move the funciton of conv_profile_t=
o_workload<br>
to asic file<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move the function of get[set]_power=
_profile<br>
to asic file<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move the function of uvd&amp;vce dp=
m to asic file<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move the function of read_sensor to=
 asic file<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move the function of is_dpm_running=
 to asic file<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add smu11 smu_if_version check for =
navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: implement smc firmware v2.1 for smu=
11<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: remove duplicate code from smu hw i=
nit<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: optimization feature mask function =
for asic<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add allowed feature mask for navi10=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function get current clock freq=
 interface<br>
for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add helper function to get dpm freq=
 informations<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function print_clk_levels for n=
avi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add helper function of smu_get_dpm_=
freq_range<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add helper function of smu_set_soft=
_freq_range<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add helper function of smu_set_hard=
_freq_range<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function force_clk_levels for n=
avi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function populate_umd_state_clk=
 for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function get_clock_by_type_with=
_latency for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function pre_display_config_cha=
nged for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function display_configuration_=
changed for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add funciton force_dpm_limit for na=
vi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function unforce_dpm_levels for=
 navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function get_gpu_power for navi=
10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function get_current_activity_p=
ercent for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move read sensor of UVD[VCE]_POWER =
to amdgpu_smu file<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function is_dpm_running for nav=
i10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function set_thermal_fan_table =
for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function get_fan_speed_percent =
for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: remove upload_dpm_level function fo=
r vega20<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function get_workload_type_map =
for swsmu<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add funciton get[set]_power_profile=
_mode for<br>
navi10 (v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function get_profiling_clk_mask=
 for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function notify_smc_display_con=
fig_change<br>
for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function set_watermarks_table f=
unction for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add function read_sensor for navi10=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: fix dpm freq unit error (10KHz -&gt=
; Mhz)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: simplify the interface of get_curre=
nt_activity_percent<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: simplify the interface of get_gpu_p=
ower<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: fix amdgpu_pm_info show gpu load er=
ror<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add sclk sysfs interface support fo=
r navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: enable uclk dpm default on navi10<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move power_dpm_force_performance_le=
vel to<br>
amdgpu_smu file<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move function get_metrics_table to =
vega20_ppt<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move function thermal_get_temperatu=
re to veag20_ppt<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add thermal ctf support for navi10<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: remove smu mutex lock in smu_hw_ini=
t<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: remove smu callback funciton get_mc=
lk(get_sclk)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: fix deadlock issue for smu_force_pe=
rformance_level<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: fix clk type name error OD_SCLK OD_=
MCLK<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move od8_setting helper function to=
 vega20_ppt<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: move od_default_setting callback to=
 asic file<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: simplified od_settings for each asi=
c<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: use pp_feature_mask to control uclk=
(mclk) dpm enabled<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: remove unsupport function<br>
set_thermal_fan_table for navi10<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: fix fan speed show error (for hwmon=
 pwm)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: print smu versions only if version =
mismatch<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add feature check in unforce_dpm_le=
vels function (v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add baco smu reset function for smu=
11<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add mode1 (psp) reset for navi asic<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/powerplay: add temperature sensor support for =
navi10<br>
<br>
Kieran Bingham (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm: rcar-du: writeback: include interface header<br>
<br>
Krunoslav Kovac (3):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Add GSL source select registers<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: CS_TFM_1D only applied post EOTF<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: fix gamma logic breaking driver unloa=
d<br>
<br>
Laurent Pinchart (11):<br>
=C2=A0 =C2=A0 =C2=A0 drm: bridge: Add dual_link field to the drm_bridge_tim=
ings structure<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: display: bridge: thc63lvd1024: Document d=
ual-link operation<br>
=C2=A0 =C2=A0 =C2=A0 drm: bridge: thc63: Report input bus mode through brid=
ge timings<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: display: renesas: lvds: Add renesas,compa=
nion property<br>
=C2=A0 =C2=A0 =C2=A0 drm: rcar-du: lvds: Remove LVDS double-enable checks<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm: rcar-du: lvds: Add support for dual-link mode<br>
=C2=A0 =C2=A0 =C2=A0 drm: rcar-du: Skip LVDS1 output on Gen3 when using dua=
l-link LVDS mode<br>
=C2=A0 =C2=A0 =C2=A0 drm: rcar-du: Add support for missing 32-bit RGB forma=
ts<br>
=C2=A0 =C2=A0 =C2=A0 drm: rcar-du: Add support for missing 16-bit RGB4444 f=
ormats<br>
=C2=A0 =C2=A0 =C2=A0 drm: rcar-du: Add support for missing 16-bit RGB1555 f=
ormats<br>
=C2=A0 =C2=A0 =C2=A0 drm: Add drm_atomic_get_(old|new)_connector_for_encode=
r() helpers<br>
<br>
Le.Ma (3):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add structures for buffer allocate/release=
 for rlc autoload<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add fw load type flag for rlc autoload<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: enable virtual display feature for navi10<=
br>
<br>
Leo (Hanghong) Ma (2):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Expose send immediate sdp message int=
erface<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Expose send immediate sdp message int=
erface<br>
<br>
Leo Li (5):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Split gpu_info_soc_bounding_box out from a=
mdgpu_ucode.h<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Disconnect DCN2 mpcc when changing tg=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Clean up locking in dcn*_apply_ctx_fo=
r_surface()<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Guard DML_FAIL_DSC_VALIDATION_FAILURE=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/amd/display: Properly guard display_mode_vba with =
DCN2<br>
<br>
Leo Liu (23):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add no_user_fence flag to ring funcs<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/UVD: set no_user_fence flag to true<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/VCE: set no_user_fence flag to true<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/VCN: set no_user_fence flag to true<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: check no_user_fence flag for engines<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: move the VCN DPG mode read and write to VC=
N<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: make VCN DPG pause mode detached from gene=
ral VCN<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add nbio callbacks for vcn doorbell suppor=
t<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add Navi10 VCN firmware support<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add VCN2.0 decode ring test<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add VCN2.0 decode ib test<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add JPEG2.0 decode ring test<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add JPEG2.0 decode ring ib test<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: add initial VCN2.0 support (v2)<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/VCN2.0: remove powergating for UVDW tile<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/VCN2.0 remove unused Macro and declaration<=
br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/VCN2.0: add direct SRAM read and write<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/VCN2.0: add DPG mode start and stop (v2)<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/VCN2.0: add DPG pause mode<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: enable VCN2.0 DPG mode<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/VCN: add buffer for indirect SRAM usage<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/VCN: implement indirect DPG SRAM mode<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu/VCN: enable indirect DPG SRAM mode<br>
<br>
Linus Walleij (4):<br>
=C2=A0 =C2=A0 =C2=A0 drm/atomic-helper: Bump vblank timeout to 100 ms<br>
=C2=A0 =C2=A0 =C2=A0 drm/mcde: Add new driver for ST-Ericsson MCDE<br>
=C2=A0 =C2=A0 =C2=A0 drm/bridge: analogix-anx78xx: Drop of_gpio.h include<b=
r>
=C2=A0 =C2=A0 =C2=A0 drm/bridge: analogix_dp: Convert to GPIO descriptors<b=
r>
<br>
Lionel Landwerlin (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/perf: fix whitelist on Gen10+<br>
<br>
Liviu Dudau (1):<br>
=C2=A0 =C2=A0 =C2=A0 arm/komeda: Convert dp_wait_cond() to return an error =
code.<br>
<br>
Louis Li (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: fix ring test failure issue during s3 in v=
ce 3.0 (V2)<br>
<br>
Lowry Li (Arm Technology China) (10):<br>
=C2=A0 =C2=A0 =C2=A0 drm/komeda: Creates plane alpha and blend mode propert=
ies<br>
=C2=A0 =C2=A0 =C2=A0 drm/komeda: Clear enable bit in CU_INPUTx_CONTROL<br>
=C2=A0 =C2=A0 =C2=A0 drm/komeda: Add rotation support on Komeda driver<br>
=C2=A0 =C2=A0 =C2=A0 drm/komeda: Adds limitation check for AFBC wide block =
not support Rot90<br>
=C2=A0 =C2=A0 =C2=A0 drm/komeda: Update HW up-sampling on D71<br>
=C2=A0 =C2=A0 =C2=A0 drm/komeda: Enable color-encoding (YUV format) support=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/komeda: Adds SMMU support<br>
=C2=A0 =C2=A0 =C2=A0 dt/bindings: drm/komeda: Adds SMMU support for D71 dev=
icetree<br>
=C2=A0 =C2=A0 =C2=A0 drm/komeda: Adds zorder support<br>
=C2=A0 =C2=A0 =C2=A0 drm/komeda: Add slave pipeline support<br>
<br>
Lubomir Rintel (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/armada: replace the simple-framebuffer<br>
<br>
Lucas De Marchi (16):<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/icl: fix step numbers in icl_display_core_ini=
t()<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: reorder if chain to have last gen first<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915: do not mix workaround with normal flow<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dmc: protect against reading random memory<br=
>
=C2=A0 =C2=A0 =C2=A0 drm/i915/icl: use ranges for voltage level lookup<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/cnl: use ranges for voltage level lookup<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/skl: use ranges for voltage level lookup<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dmc: use kernel types<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dmc: extract fw_info and table walk from inte=
l_package_header<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dmc: add support for package_header with vers=
ion 2<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dmc: extract function to parse css header<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dmc: extract function to parse package_header=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dmc: extract function to parse dmc_header<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dmc: add support to load dmc_header version 3=
<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dmc: remove redundant return in parse_csr_fw(=
)<br>
=C2=A0 =C2=A0 =C2=A0 drm/i915/dmc: protect against loading wrong firmware<b=
r>
<br>
Lukasz Majewski (2):<br>
=C2=A0 =C2=A0 =C2=A0 dt-bindings: display/panel: Add KOE tx14d24vm1bpa disp=
lay description<br>
=C2=A0 =C2=A0 =C2=A0 drm/panel: simple: Add KOE tx14d24vm1bpa display suppo=
rt (320x240)<br>
<br>
Lyude Paul (1):<br>
=C2=A0 =C2=A0 =C2=A0 drm/amdgpu: Don&#39;t skip display settings in hwmgr_r=
esume()<br>
<br>
Maarten Lankhorst (16):<br>
=C2=A0 =C2=A0 =C2=A0 drm/atomic: Create __drm_atomic_helper_crtc_reset() fo=
r<br>
subclassing crtc_state.<br>
=C2=A0 =C2=A0 =C2=A0 drm/docs: Fix typo in _</blockquote></div>

--0000000000007a1aac058db2ce97--

--===============0945371510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0945371510==--
