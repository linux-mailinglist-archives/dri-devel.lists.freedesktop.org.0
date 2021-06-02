Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B4939801B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 06:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4589E6E029;
	Wed,  2 Jun 2021 04:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DD66E029;
 Wed,  2 Jun 2021 04:17:40 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id dg27so1201526edb.12;
 Tue, 01 Jun 2021 21:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n6du5oeWZ5d7CgK19Vmrn0p0dvu3xk+iBuUEqH4Lpag=;
 b=uLEt7G1zI9ks3Tf9sF7EsL1dWEpKbY1bxWWNA7gyh5gqZk5t+t0tWHHFdvxBuR1PKl
 JsiiaHqPDO4sLu8fO8HXoGVh20bj1W2tiANtXeXVd4UeTuEmJp4ZQgeqUMvedRDf37IV
 S/KINMoZVBRw3pm2XAqAotxQzx/ONnyKQSkefZbZhwwNHCf9NQZRWG7wTmJDnTmb5X4L
 ncxZbv1jABJZ/Xn0tSCY1UP5FiNC8u5k3/BlI4PwJALkhGk9QWi8bExCZY9ygV8QL0hA
 ZmpaVWXDhm31Ha6e16QhNCS4F89DTqUV1gN8Ygee82KN1yQY4c9dmGLOE02thvq9gele
 RYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n6du5oeWZ5d7CgK19Vmrn0p0dvu3xk+iBuUEqH4Lpag=;
 b=snmXeeLmT9yid34ZD7YKWrEdv8IpbtRpfvsCG18ZYDW4sTAvkpGgVzEpyEfLlSNkBf
 Av0hl4F3ioowysjeaudDXfLHX/zdq97MMb/L66SNYDO7AEWWHWEQ+WO4ysyH31EcM/f8
 97iLiCoE2w62lqQFnjgyucHM0/5fknu+Qg5vCcVafarBl2NcuBidAYSiqvM1z/N/oPdM
 yrPt+Ji1PLbeOrJ8na9ZpVXkkxkn0MqRlv2T6nDlGs6bY/tJkINzOnmV/9t0UbwoRNtj
 luoge7PpbFuIhm9mAPO94I872SM9IdBgE0MeN6qP70ffygjuDAl6nNWaHbvn3DbEGc9f
 nX7A==
X-Gm-Message-State: AOAM531Cx8J268Q02NdG25AOiEQfeS9jju0ApPoF6Af7w5kpqsaGWjLc
 R6NLm0EFfiROORu5SFdZ4mds+pc4QK1VZDPkzto=
X-Google-Smtp-Source: ABdhPJyEKBOrR5iSqPcuEHnhg2LYLTNYJR06qJAt4PyHJj1UE94WxqfX+HcehSBS8ewJqcKur3CN+ziKK77p8IDqLjw=
X-Received: by 2002:a05:6402:2049:: with SMTP id
 bc9mr16520470edb.298.1622607459012; 
 Tue, 01 Jun 2021 21:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <YLCbBR22BsQ/dpJB@jlahtine-mobl.ger.corp.intel.com>
 <162218682866.9100.50543809230103499@jlahtine-mobl.ger.corp.intel.com>
 <CAPM=9twwritR-5-iN-D4AvMMnng9PkCfZmsU3zhZZBFkGGx9Ww@mail.gmail.com>
In-Reply-To: <CAPM=9twwritR-5-iN-D4AvMMnng9PkCfZmsU3zhZZBFkGGx9Ww@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 2 Jun 2021 14:17:27 +1000
Message-ID: <CAPM=9tyb-PffapqXE4c1Ow0wVeT2a-r88VkEurUox5AFsQrfbA@mail.gmail.com>
Subject: Re: [PULL] drm-intel-gt-next
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Jun 2021 at 10:28, Dave Airlie <airlied@gmail.com> wrote:
>
> This has these two patches applied, and it doesn't build.
>
>   drm/i915: drop the __i915_active_call pointer packing
>   drm/i915: Fix crash in auto_retire
>
> The latter patch shouldn't be necessary after the former, please fix
> that up and resend and please build test trees before I get them in
> future.

Oh maybe this is an unresolved conflict, not sure why drm-tip doesn't
catch this though, or is this next tree not in next?

That would explain it then.

I've pulled it with an fix in the merge commit.

Dave.

>
> Dave.
>
>
> On Fri, 28 May 2021 at 17:27, Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com> wrote:
> >
> > Quoting Joonas Lahtinen (2021-05-28 10:25:57)
> > > Hi Dave & Daniel,
> > >
> > > Here's drm-intel-gt-next pull request.
> > >
> > > Most notably it has the reworked DG1 uAPI (behind CONFIG_BROKEN)
> > > as requested. Important fix for Gitlab issues #3293 and #3450 and
> > > one another kernel crash. Adds missing workarounds for Gen11 and
> > > Gen12. Hiding of modparams for compiled-out features. Conversion
> > > to use trylock shrinking for BSW VT-d and BXT.
> > >
> > > Then there are the uAPI kerneldoc improvements as part of the DG1
> > > uAPI rework. Usual amount smaller fixes, code refactoring and
> > > cleanups as prep for upcoming patches.
> >
> > And includes tag 'topic/intel-gen-to-ver-2021-04-19' (but that is
> > already merged to drm-next).
> >
> > Regards, Joonas
> >
> > > Regards, Joonas
> > >
> > > ***
> > >
> > > drm-intel-gt-next-2021-05-28:
> > >
> > > UAPI Changes:
> > > - Add reworked uAPI for DG1 behind CONFIG_BROKEN (Matt A, Abdiel)
> > >
> > > Driver Changes:
> > >
> > > - Fix for Gitlab issues #3293 and #3450:
> > >   Avoid kernel crash on older L-shape memory machines
> > >
> > > - Hide modparams for compiled-out features (Tvrtko)
> > > - Add Wa_14010733141 (VDBox SFC reset) for Gen11+ (Aditya)
> > > - Fix crash in auto_retire active retire callback due to
> > >   misalignment (Stephane)
> > > - Use trylock in shrinker for GGTT on BSW VT-d and BXT (Maarten)
> > > - Fix overlay active retire callback alignment (Tvrtko)
> > > - Eliminate need to align active retire callbacks (Matt A, Ville,
> > >   Daniel)
> > > - Program FF_MODE2 tuning value for all Gen12 platforms (Caz)
> > > - Add Wa_14011060649 for TGL,RKL,DG1 and ADLS (Swathi)
> > > - Create stolen memory region from local memory on DG1 (CQ)
> > > - Place PD in LMEM on dGFX (Matt A)
> > > - Use WC when default state object is allocated in LMEM (Venkata)
> > > - Determine the coherent map type based on object location (Venkata)
> > > - Use lmem physical addresses for fb_mmap() on discrete (Mohammed)
> > > - Bypass aperture on fbdev when LMEM is available (Anusha)
> > > - Return error value when displayable BO not in LMEM for dGFX (Mohamm=
ed)
> > > - Do release kernel context if breadcrumb measure fails (Janusz)
> > > - Apply Wa_22010271021 for all Gen11 platforms (Caz)
> > > - Fix unlikely ref count race in arming the watchdog timer (Tvrtko)
> > > - Check actual RC6 enable status in PMU (Tvrtko)
> > > - Fix a double free in gen8_preallocate_top_level_pdp (Lv)
> > > - Remove erroneous i915_is_ggtt check for
> > >   I915_GEM_OBJECT_UNBIND_VM_TRYLOCK (Maarten)
> > >
> > > - Convert uAPI headers to real kerneldoc (Matt A)
> > > - Clean up kerneldoc warnings headers (Matt A, Maarten)
> > > - Fail driver if LMEM training failed (Matt R)
> > > - Avoid div-by-zero on Gen2 (Ville)
> > > - Read C0DRB3/C1DRB3 as 16 bits again and add _BW suffix (Ville)
> > > - Remove reference to struct drm_device.pdev (Thomas)
> > > - Increase separation between GuC and execlists code (Chris, Matt B)
> > >
> > > - Use might_alloc() (Bernard)
> > > - Split DGFX_FEATURES from GEN12_FEATURES (Lucas)
> > > - Deduplicate Wa_22010271021 programming on (Jose)
> > > - Drop duplicate WaDisable4x2SubspanOptimization:hsw (Tvrtko)
> > > - Selftest improvements (Chris, Hsin-Yi, Tvrtko)
> > > - Shuffle around init_memory_region for stolen (Matt)
> > > - Typo fixes (wengjianfeng)
> > >
> > > The following changes since commit 425390c5dce6da76578389629d19517fcd=
79c959:
> > >
> > >   drm/i915: split dgfx features from gen 12 (2021-04-14 13:05:06 +030=
0)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-=
2021-05-28
> > >
> > > for you to fetch changes up to 5b26d57fdb499c2363f3d895ef008e73ec02eb=
9b:
> > >
> > >   drm/i915: Add Wa_14010733141 (2021-05-27 11:05:09 -0700)
> > >
> > > ----------------------------------------------------------------
> > > UAPI Changes:
> > > - Add reworked uAPI for DG1 behind CONFIG_BROKEN (Matt A, Abdiel)
> > >
> > > Driver Changes:
> > >
> > > - Fix for Gitlab issues #3293 and #3450:
> > >   Avoid kernel crash on older L-shape memory machines
> > >
> > > - Add Wa_14010733141 (VDBox SFC reset) for Gen11+ (Aditya)
> > > - Fix crash in auto_retire active retire callback due to
> > >   misalignment (Stephane)
> > > - Fix overlay active retire callback alignment (Tvrtko)
> > > - Eliminate need to align active retire callbacks (Matt A, Ville,
> > >   Daniel)
> > > - Program FF_MODE2 tuning value for all Gen12 platforms (Caz)
> > > - Add Wa_14011060649 for TGL,RKL,DG1 and ADLS (Swathi)
> > > - Create stolen memory region from local memory on DG1 (CQ)
> > > - Place PD in LMEM on dGFX (Matt A)
> > > - Use WC when default state object is allocated in LMEM (Venkata)
> > > - Determine the coherent map type based on object location (Venkata)
> > > - Use lmem physical addresses for fb_mmap() on discrete (Mohammed)
> > > - Bypass aperture on fbdev when LMEM is available (Anusha)
> > > - Return error value when displayable BO not in LMEM for dGFX (Mohamm=
ed)
> > > - Do release kernel context if breadcrumb measure fails (Janusz)
> > > - Hide modparams for compiled-out features (Tvrtko)
> > > - Apply Wa_22010271021 for all Gen11 platforms (Caz)
> > > - Fix unlikely ref count race in arming the watchdog timer (Tvrtko)
> > > - Check actual RC6 enable status in PMU (Tvrtko)
> > > - Fix a double free in gen8_preallocate_top_level_pdp (Lv)
> > > - Use trylock in shrinker for GGTT on BSW VT-d and BXT (Maarten)
> > > - Remove erroneous i915_is_ggtt check for
> > >   I915_GEM_OBJECT_UNBIND_VM_TRYLOCK (Maarten)
> > >
> > > - Convert uAPI headers to real kerneldoc (Matt A)
> > > - Clean up kerneldoc warnings headers (Matt A, Maarten)
> > > - Fail driver if LMEM training failed (Matt R)
> > > - Avoid div-by-zero on Gen2 (Ville)
> > > - Read C0DRB3/C1DRB3 as 16 bits again and add _BW suffix (Ville)
> > > - Remove reference to struct drm_device.pdev (Thomas)
> > > - Increase separation between GuC and execlists code (Chris, Matt B)
> > >
> > > - Use might_alloc() (Bernard)
> > > - Split DGFX_FEATURES from GEN12_FEATURES (Lucas)
> > > - Deduplicate Wa_22010271021 programming on (Jose)
> > > - Drop duplicate WaDisable4x2SubspanOptimization:hsw (Tvrtko)
> > > - Selftest improvements (Chris, Hsin-Yi, Tvrtko)
> > > - Shuffle around init_memory_region for stolen (Matt)
> > > - Typo fixes (wengjianfeng)
> > >
> > > ----------------------------------------------------------------
> > > Abdiel Janulgue (1):
> > >       drm/i915/query: Expose memory regions through the query uAPI
> > >
> > > Aditya Swarup (1):
> > >       drm/i915: Add Wa_14010733141
> > >
> > > Anusha Srivatsa (1):
> > >       drm/i915/lmem: Bypass aperture when lmem is available
> > >
> > > Bernard Zhao (1):
> > >       drm/i915: Use might_alloc()
> > >
> > > CQ Tang (2):
> > >       drm/i915: Create stolen memory region from local memory
> > >       drm/i915/stolen: enforce the min_page_size contract
> > >
> > > Caz Yokoyama (2):
> > >       drm/i915/gen12: Add recommended hardware tuning value
> > >       drm/i915/icl: add Wa_22010271021 for all gen11
> > >
> > > Chris Wilson (6):
> > >       drm/i915/selftests: Skip aperture remapping selftest where ther=
e is no aperture
> > >       drm/i915/selftests: Only query RAPL for integrated power measur=
ements
> > >       drm/i915/gem: Pin the L-shape quirked object as unshrinkable
> > >       drm/i915/gt: Move engine setup out of set_default_submission
> > >       drm/i915/gt: Move submission_method into intel_gt
> > >       drm/i915/gt: Move CS interrupt handler to the backend
> > >
> > > Hsin-Yi Wang (1):
> > >       drm/i915/selftests: Rename pm_ prefixed functions names
> > >
> > > Janusz Krzysztofik (1):
> > >       drm/i915/gt: Do release kernel context if breadcrumb measure fa=
ils
> > >
> > > Joonas Lahtinen (1):
> > >       Merge tag 'topic/intel-gen-to-ver-2021-04-19' of git://anongit.=
freedesktop.org/drm/drm-intel into drm-intel-gt-next
> > >
> > > Jos=C3=A9 Roberto de Souza (1):
> > >       drm/i915: Move Wa_16011163337 to gen12_ctx_workarounds_init()
> > >
> > > Lv Yunlong (1):
> > >       drm/i915/gt: Fix a double free in gen8_preallocate_top_level_pd=
p
> > >
> > > Maarten Lankhorst (4):
> > >       drm/i915: Fix docbook descriptions for i915_gem_shrinker
> > >       drm/i915: Fix docbook descriptions for i915_cmd_parser
> > >       drm/i915: Use trylock in shrinker for ggtt on bsw vt-d and bxt,=
 v2.
> > >       drm/i915: Remove erroneous i915_is_ggtt check for I915_GEM_OBJE=
CT_UNBIND_VM_TRYLOCK
> > >
> > > Matt Roper (1):
> > >       drm/i915/lmem: Fail driver init if LMEM training failed
> > >
> > > Matthew Auld (19):
> > >       drm/i915/uapi: fix kernel doc warnings
> > >       drm/i915/uapi: convert i915_user_extension to kernel doc
> > >       drm/i915/uapi: convert i915_query and friend to kernel doc
> > >       drm/doc: add section for driver uAPI
> > >       drm/i915/stolen: treat stolen local as normal local memory
> > >       drm/i915/stolen: actually mark as contiguous
> > >       drm/i915/gtt: map the PD up front
> > >       drm/i915/gtt/dgfx: place the PD in LMEM
> > >       drm/doc/rfc: i915 DG1 uAPI
> > >       drm/i915: mark stolen as private
> > >       drm/i915: rework gem_create flow for upcoming extensions
> > >       drm/i915/uapi: introduce drm_i915_gem_create_ext
> > >       drm/i915/uapi: implement object placement extension
> > >       drm/i915/lmem: support optional CPU clearing for special intern=
al use
> > >       drm/i915/gem: clear userspace buffers for LMEM
> > >       drm/i915/gem: hide new uAPI behind CONFIG_BROKEN
> > >       drm/i915: drop the __i915_active_call pointer packing
> > >       drm/i915/stolen: shuffle around init_memory_region
> > >       drm/doc/rfc: drop the i915_gem_lmem.h header
> > >
> > > Mohammed Khajapasha (2):
> > >       drm/i915/fbdev: Use lmem physical addresses for fb_mmap() on di=
screte
> > >       drm/i915: Return error value when bo not in LMEM for discrete
> > >
> > > St=C3=A9phane Marchesin (1):
> > >       drm/i915: Fix crash in auto_retire
> > >
> > > Swathi Dhanavanthri (1):
> > >       drm/i915: Add Wa_14011060649
> > >
> > > Thomas Zimmermann (1):
> > >       drm/i915/gem: Remove reference to struct drm_device.pdev
> > >
> > > Tvrtko Ursulin (6):
> > >       drm/i915: Take request reference before arming the watchdog tim=
er
> > >       drm/i915/pmu: Check actual RC6 status
> > >       drm/i915/overlay: Fix active retire callback alignment
> > >       drm/i915/selftests: Fix active retire callback alignment
> > >       drm/i915: Drop duplicate WaDisable4x2SubspanOptimization:hsw
> > >       drm/i915/params: Align visibility of device level and global mo=
dparams
> > >
> > > Venkata Ramana Nayana (1):
> > >       drm/i915/dg1: Fix mapping type for default state object
> > >
> > > Venkata Sandeep Dhanalakota (1):
> > >       drm/i915: Update the helper to set correct mapping
> > >
> > > Ville Syrj=C3=A4l=C3=A4 (3):
> > >       drm/i915: Avoid div-by-zero on gen2
> > >       drm/i915: Read C0DRB3/C1DRB3 as 16 bits again
> > >       drm/i915: Give C0DRB3/C1DRB3 a _BW suffix
> > >
> > > wengjianfeng (1):
> > >       drm/i915/gt: fix typo issue
> > >
> > >  Documentation/gpu/driver-uapi.rst                  |   8 +
> > >  Documentation/gpu/index.rst                        |   1 +
> > >  Documentation/gpu/rfc/i915_gem_lmem.rst            | 131 +++++++
> > >  Documentation/gpu/rfc/index.rst                    |   4 +
> > >  drivers/gpu/drm/i915/display/intel_display.c       |  10 +
> > >  drivers/gpu/drm/i915/display/intel_fbdev.c         |  51 ++-
> > >  drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   4 +-
> > >  drivers/gpu/drm/i915/display/intel_overlay.c       |   5 +-
> > >  drivers/gpu/drm/i915/gem/i915_gem_context.c        |   3 +-
> > >  drivers/gpu/drm/i915/gem/i915_gem_create.c         | 345 +++++++++++=
+++++--
> > >  drivers/gpu/drm/i915/gem/i915_gem_ioctls.h         |   2 +
> > >  drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |  20 +-
> > >  drivers/gpu/drm/i915/gem/i915_gem_lmem.h           |   5 +
> > >  drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   2 +-
> > >  drivers/gpu/drm/i915/gem/i915_gem_object.c         |   3 +
> > >  drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  14 +-
> > >  drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   2 +
> > >  drivers/gpu/drm/i915/gem/i915_gem_region.c         |  22 ++
> > >  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |  14 +-
> > >  drivers/gpu/drm/i915/gem/i915_gem_stolen.c         | 159 +++++++--
> > >  drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |   3 +-
> > >  .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  11 +-
> > >  drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  26 ++
> > >  drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |  13 +-
> > >  drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  32 +-
> > >  drivers/gpu/drm/i915/gt/intel_context.c            |   3 +-
> > >  drivers/gpu/drm/i915/gt/intel_engine.h             |   8 +-
> > >  drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  21 +-
> > >  drivers/gpu/drm/i915/gt/intel_engine_pm.c          |   2 +-
> > >  drivers/gpu/drm/i915/gt/intel_engine_types.h       |  14 +-
> > >  .../gpu/drm/i915/gt/intel_execlists_submission.c   |  95 +++--
> > >  .../gpu/drm/i915/gt/intel_execlists_submission.h   |   3 -
> > >  drivers/gpu/drm/i915/gt/intel_ggtt.c               |  10 +-
> > >  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |   6 +-
> > >  drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |   3 +-
> > >  drivers/gpu/drm/i915/gt/intel_gt_irq.c             |  82 ++---
> > >  drivers/gpu/drm/i915/gt/intel_gt_irq.h             |  23 ++
> > >  drivers/gpu/drm/i915/gt/intel_gt_types.h           |   7 +
> > >  drivers/gpu/drm/i915/gt/intel_gtt.c                |  91 +++--
> > >  drivers/gpu/drm/i915/gt/intel_gtt.h                |  12 +-
> > >  drivers/gpu/drm/i915/gt/intel_lrc.c                |   4 +-
> > >  drivers/gpu/drm/i915/gt/intel_ppgtt.c              |   7 +-
> > >  drivers/gpu/drm/i915/gt/intel_reset.c              | 201 +++++++----
> > >  drivers/gpu/drm/i915/gt/intel_ring.c               |  11 +-
> > >  drivers/gpu/drm/i915/gt/intel_ring_submission.c    |  12 +-
> > >  drivers/gpu/drm/i915/gt/intel_rps.c                |   2 +-
> > >  drivers/gpu/drm/i915/gt/intel_timeline.c           |   4 +-
> > >  drivers/gpu/drm/i915/gt/intel_workarounds.c        | 100 ++++--
> > >  drivers/gpu/drm/i915/gt/mock_engine.c              |   2 +-
> > >  drivers/gpu/drm/i915/gt/selftest_context.c         |   3 +-
> > >  .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |   2 +-
> > >  drivers/gpu/drm/i915/gt/selftest_execlists.c       |   2 +-
> > >  drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |   4 +-
> > >  drivers/gpu/drm/i915/gt/selftest_lrc.c             |   4 +-
> > >  drivers/gpu/drm/i915/gt/selftest_rc6.c             |  32 +-
> > >  drivers/gpu/drm/i915/gt/selftest_ring_submission.c |   2 +-
> > >  drivers/gpu/drm/i915/gt/selftest_rps.c             |   6 +-
> > >  drivers/gpu/drm/i915/gt/shmem_utils.c              |   4 +-
> > >  drivers/gpu/drm/i915/gt/uc/intel_guc.c             |   4 +-
> > >  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  64 ++--
> > >  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h  |   1 -
> > >  drivers/gpu/drm/i915/gt/uc/intel_huc.c             |   4 +-
> > >  drivers/gpu/drm/i915/i915_active.c                 |  11 +-
> > >  drivers/gpu/drm/i915/i915_active.h                 |  11 +-
> > >  drivers/gpu/drm/i915/i915_active_types.h           |   5 -
> > >  drivers/gpu/drm/i915/i915_cmd_parser.c             |  18 +-
> > >  drivers/gpu/drm/i915/i915_debugfs.c                |   4 +-
> > >  drivers/gpu/drm/i915/i915_drv.c                    |   1 +
> > >  drivers/gpu/drm/i915/i915_drv.h                    |  29 +-
> > >  drivers/gpu/drm/i915/i915_gem.c                    |  25 +-
> > >  drivers/gpu/drm/i915/i915_irq.c                    |  10 +-
> > >  drivers/gpu/drm/i915/i915_params.h                 |   8 +-
> > >  drivers/gpu/drm/i915/i915_pci.c                    |   2 +-
> > >  drivers/gpu/drm/i915/i915_perf.c                   |  10 +-
> > >  drivers/gpu/drm/i915/i915_pmu.c                    |   4 +-
> > >  drivers/gpu/drm/i915/i915_query.c                  |  62 ++++
> > >  drivers/gpu/drm/i915/i915_reg.h                    |  17 +-
> > >  drivers/gpu/drm/i915/i915_request.c                |   5 +-
> > >  drivers/gpu/drm/i915/i915_vma.c                    |  31 +-
> > >  drivers/gpu/drm/i915/intel_memory_region.c         |  29 +-
> > >  drivers/gpu/drm/i915/intel_memory_region.h         |  18 +-
> > >  drivers/gpu/drm/i915/intel_uncore.c                |  12 +
> > >  drivers/gpu/drm/i915/selftests/i915_active.c       |   2 +-
> > >  drivers/gpu/drm/i915/selftests/i915_gem.c          |  20 +-
> > >  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |  10 +-
> > >  drivers/gpu/drm/i915/selftests/i915_perf.c         |   3 +-
> > >  drivers/gpu/drm/i915/selftests/i915_vma.c          |   3 +
> > >  drivers/gpu/drm/i915/selftests/igt_spinner.c       |   4 +-
> > >  .../gpu/drm/i915/selftests/intel_memory_region.c   |  87 ++++-
> > >  drivers/gpu/drm/i915/selftests/librapl.c           |  10 +
> > >  drivers/gpu/drm/i915/selftests/librapl.h           |   4 +
> > >  include/uapi/drm/i915_drm.h                        | 393 +++++++++++=
++++++++--
> > >  92 files changed, 2018 insertions(+), 575 deletions(-)
> > >  create mode 100644 Documentation/gpu/driver-uapi.rst
> > >  create mode 100644 Documentation/gpu/rfc/i915_gem_lmem.rst
