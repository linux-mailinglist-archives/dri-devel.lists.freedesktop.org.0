Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51DE679D89
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 16:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C257C10E6B9;
	Tue, 24 Jan 2023 15:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F1610E6B9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 15:32:53 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ss4so39907746ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 07:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=W5dsaNfViujrd5rtY6vGRV7H1C6E8hytZM3pF5b0FV4=;
 b=J4SDNoY1W+DQJk3Ec4siCf1MHFGVCUi5ZzwOGaniAXpxN0Q9pCDcIysRByjajZi1R9
 hwI6R0YfSbYLlWG1WF0slAkE4EOIEZGnVX0DKjyP90wTuDLwNF/c8dIfxZd/sh1/3J0o
 /JPJt5MrNczjXZWVCI2oRCCwAmRlXUyFgreGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W5dsaNfViujrd5rtY6vGRV7H1C6E8hytZM3pF5b0FV4=;
 b=bs0QY4lQH1v0f2552jF3Iw22npRoTGqfkcaW+FG4oaaOZCVdEf50QKGyQNcBq2GIb1
 Ki9B1rK4kqFCVPsRkusaLbeIbcyZeleA6imeV2DKQRvTd33a9VXtre5hwqT6N11ofzF+
 rWWZWu9G1lknqxQMfxiUbp7Toln8rI4Endz7SwgSfiQKajWdGUoDHXBwMbQ219aP8L6f
 u4NYgd9wactNehGdhbEwLh7RyhXP0NQhrvZVhJJ5F3EwampAufNaT5v+6g/jnU6zqQp/
 9POhss3dVrt7ZCf6nz0ohchc3+efmN4+B057Oa0ESMaQC0wposEFOglLJOG9m4Fa5/SP
 gp4w==
X-Gm-Message-State: AFqh2krsqQVwvmdajxyTl4bI37mBizu73P2wXLF0FRk3oEL/683P3ZxO
 vR2d2mhdrTrRZ0dx1zVwh/X+Hw==
X-Google-Smtp-Source: AMrXdXuwn5ni0Y2Y4hSkbLofreZT4oqmrMtu0eW85VY3gw9HiS0OrogHosELhYE9BKzEK6syEP+4ZQ==
X-Received: by 2002:a17:906:95d2:b0:7c1:37:6d5e with SMTP id
 n18-20020a17090695d200b007c100376d5emr30268880ejy.2.1674574371942; 
 Tue, 24 Jan 2023 07:32:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n3-20020aa7c783000000b0049c3e188965sm1169220eds.23.2023.01.24.07.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 07:32:51 -0800 (PST)
Date: Tue, 24 Jan 2023 16:32:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PULL] drm-intel-gt-next
Message-ID: <Y8/6IHb8bXjAiwT+@phenom.ffwll.local>
References: <Y8fW2Ny1B1hZ5ZmF@tursulin-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y8fW2Ny1B1hZ5ZmF@tursulin-desk>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 11:24:44AM +0000, Tvrtko Ursulin wrote:
> Hi Dave, Daniel,
> 
> Here goes the first pull request for 6.3.
> 
> What sticks out most is the amount of fixes, majority of which if not all
> would have already landed via gt/next fixes pull requests though, so I
> will only mention them here briefly.
> 
> Most impactful ones are probably in the area of DG2 TLB invalidation,
> followed by eviction, both platform agnostic (userspace crashes due
> eviction failures after object locking changes) and a couple DG2 ones
> (visual glitches due CCS aux data not always handled).
> 
> Then we have a bunch of crashes and simiar issues fixed which would have
> been triggerable under more like edge conditions. On older platforms,
> RC6p gets disabled on Sandybridge to avoid GPU hangs and visual glitches.
> 
> Finally there is a bunch of log noise getting disabled, mostly over-
> zealouos log level use or misleadingly logging failures which are
> otherwise handled.
> 
> In terms of new features there isn't that much. We have some new
> workarounds which can affect performance and an improvement to suspend-
> resume times especially significant on modern slow CPU systems like some
> Chromebooks.
> 
> Outside of immediate visibility to end users, early enablement for
> Meteorlake and Ponte Vecchio is carrying on. Former especially has had
> support for loading the GSC firmware, OA and initial GT workarounds added.
> 
> And of course as always there are some random cleanups, selftest tweaks
> and misc refactorings, which feels less than the usual amount in this
> round.
> 
> Regards,
> 
> Tvrtko
> 
> drm-intel-gt-next-2023-01-18:
> Driver Changes:
> 
> Fixes/improvements/new stuff:
> 
> - Fix workarounds on Gen2-3 (Tvrtko Ursulin)
> - Fix HuC delayed load memory leaks (Daniele Ceraolo Spurio)
> - Fix a BUG caused by impendance mismatch in dma_fence_wait_timeout and GuC (Janusz Krzysztofik)
> - Add DG2 workarounds Wa_18018764978 and Wa_18019271663 (Matt Atwood)
> - Apply recommended L3 hashing mask tuning parameters (Gen12+) (Matt Roper)
> - Improve suspend / resume times with VT-d scanout workaround active (Andi Shyti, Chris Wilson)
> - Silence misleading "mailbox access failed" warning in snb_pcode_read (Ashutosh Dixit)
> - Fix null pointer dereference on HSW perf/OA (Umesh Nerlige Ramappa)
> - Avoid trampling the ring during buffer migration (and selftests) (Chris Wilson, Matthew Auld)
> - Fix DG2 visual corruption on small BAR systems by not forgetting to copy CCS aux state (Matthew Auld)
> - More fixing of DG2 visual corruption by not forgetting to copy CCS aux state of backup objects (Matthew Auld)
> - Fix TLB invalidation for Gen12.50 video and compute engines (Andrzej Hajda)
> - Limit Wa_22012654132 to just specific steppings (Matt Roper)
> - Fix userspace crashes due eviction not working under lock contention after the object locking conversion (Matthew Auld)
> - Avoid double free is user deploys a corrupt GuC firmware (John Harrison)
> - Fix 32-bit builds by using "%zu" to format size_t (Nirmoy Das)
> - Fix a possible BUG in TTM async unbind due not reserving enough fence slots (Nirmoy Das)
> - Fix potential use after free by not exposing the GEM context id to userspace too early (Rob Clark)
> - Show clamped PL1 limit to the user (hwmon) (Ashutosh Dixit)
> - Workaround unreliable reset on Jasperlake (Chris Wilson)
> - Cover rest of SVG unit MCR registers (Gustavo Sousa)
> - Avoid PXP log spam on platforms which do not support the feature (Alan Previn)
> - Re-disable RC6p on Sandy Bridge to avoid GPU hangs and visual glitches (Sasa Dragic)
> 
> Future platform enablement:
> 
> - Manage uncore->lock while waiting on MCR register (Matt Roper)
> - Enable Idle Messaging for GSC CS (Vinay Belgaumkar)
> - Only initialize GSC in tile 0 (José Roberto de Souza)
> - Media GT and Render GT share common GGTT (Aravind Iddamsetty)
> - Add dedicated MCR lock (Matt Roper)
> - Implement recommended caching policy (PVC) (Wayne Boyer)
> - Add hardware-level lock for steering (Matt Roper)
> - Check full IP version when applying hw steering semaphore (Matt Roper)
> - Enable GuC GGTT invalidation from the start (Daniele Ceraolo Spurio)
> - MTL GSC firmware support (Daniele Ceraolo Spurio, Jonathan Cavitt)
> - MTL OA support (Umesh Nerlige Ramappa)
> - MTL initial gt workarounds (Matt Roper)
> 
> Driver refactors:
> 
> - Hold forcewake and MCR lock over PPAT setup (Matt Roper)
> - Acquire fw before loop in intel_uncore_read64_2x32 (Umesh Nerlige Ramappa)
> - GuC filename cleanups and use submission API version number (John Harrison)
> - Promote pxp subsystem to top-level of i915 (Alan Previn)
> - Finish proofing the code agains object size overflows (Chris Wilson, Gwan-gyeong Mun)
> - Start adding module oriented dmesg output (John Harrison)
> 
> Miscellaneous:
> 
> - Correct kerneldoc for intel_gt_mcr_wait_for_reg() (Matt Roper)
> - Bump up sample period for busy stats selftest (Umesh Nerlige Ramappa)
> - Make GuC default_lists const data (Jani Nikula)
> - Fix table order verification to check all FW types (John Harrison)
> - Remove some limited use register access wrappers (Jani Nikula)
> - Remove struct_member macro (Andrzej Hajda)
> - Remove hardcoded value with a macro (Nirmoy Das)
> - Use helper func to find out map type (Nirmoy Das)
> - Fix a static analysis warning (John Harrison)
> - Consolidate VMA active tracking helpers (Andrzej Hajda)
> - Do not cover all future platforms in TLB invalidation (Tvrtko Ursulin)
> - Replace zero-length arrays with flexible-array members (Gustavo A. R. Silva)
> - Unwind hugepages to drop wakeref on error (Chris Wilson)
> - Remove a couple of superfluous i915_drm.h includes (Jani Nikula)
> 
> Merges:
> 
> - Merge drm/drm-next into drm-intel-gt-next (Rodrigo Vivi)
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2023-01-18

Pulled, but there was an entertaining (silent?) git merge conflict in
intel_uc_fw.c with a duplicated try_firmware_load.c. I fixed it up after
Rodrigo and dim-rerere confirmed it's not just me :-)

Thanks, Daniel

> 
> for you to fetch changes up to 378e04f7cb24aad124a8e55e7a36b689fb63ac17:
> 
>   drm/i915: remove a couple of superfluous i915_drm.h includes (2023-01-18 11:55:08 +0200)
> 
> ----------------------------------------------------------------
> Driver Changes:
> 
> Fixes/improvements/new stuff:
> 
> - Fix workarounds on Gen2-3 (Tvrtko Ursulin)
> - Fix HuC delayed load memory leaks (Daniele Ceraolo Spurio)
> - Fix a BUG caused by impendance mismatch in dma_fence_wait_timeout and GuC (Janusz Krzysztofik)
> - Add DG2 workarounds Wa_18018764978 and Wa_18019271663 (Matt Atwood)
> - Apply recommended L3 hashing mask tuning parameters (Gen12+) (Matt Roper)
> - Improve suspend / resume times with VT-d scanout workaround active (Andi Shyti, Chris Wilson)
> - Silence misleading "mailbox access failed" warning in snb_pcode_read (Ashutosh Dixit)
> - Fix null pointer dereference on HSW perf/OA (Umesh Nerlige Ramappa)
> - Avoid trampling the ring during buffer migration (and selftests) (Chris Wilson, Matthew Auld)
> - Fix DG2 visual corruption on small BAR systems by not forgetting to copy CCS aux state (Matthew Auld)
> - More fixing of DG2 visual corruption by not forgetting to copy CCS aux state of backup objects (Matthew Auld)
> - Fix TLB invalidation for Gen12.50 video and compute engines (Andrzej Hajda)
> - Limit Wa_22012654132 to just specific steppings (Matt Roper)
> - Fix userspace crashes due eviction not working under lock contention after the object locking conversion (Matthew Auld)
> - Avoid double free is user deploys a corrupt GuC firmware (John Harrison)
> - Fix 32-bit builds by using "%zu" to format size_t (Nirmoy Das)
> - Fix a possible BUG in TTM async unbind due not reserving enough fence slots (Nirmoy Das)
> - Fix potential use after free by not exposing the GEM context id to userspace too early (Rob Clark)
> - Show clamped PL1 limit to the user (hwmon) (Ashutosh Dixit)
> - Workaround unreliable reset on Jasperlake (Chris Wilson)
> - Cover rest of SVG unit MCR registers (Gustavo Sousa)
> - Avoid PXP log spam on platforms which do not support the feature (Alan Previn)
> - Re-disable RC6p on Sandy Bridge to avoid GPU hangs and visual glitches (Sasa Dragic)
> 
> Future platform enablement:
> 
> - Manage uncore->lock while waiting on MCR register (Matt Roper)
> - Enable Idle Messaging for GSC CS (Vinay Belgaumkar)
> - Only initialize GSC in tile 0 (José Roberto de Souza)
> - Media GT and Render GT share common GGTT (Aravind Iddamsetty)
> - Add dedicated MCR lock (Matt Roper)
> - Implement recommended caching policy (PVC) (Wayne Boyer)
> - Add hardware-level lock for steering (Matt Roper)
> - Check full IP version when applying hw steering semaphore (Matt Roper)
> - Enable GuC GGTT invalidation from the start (Daniele Ceraolo Spurio)
> - MTL GSC firmware support (Daniele Ceraolo Spurio, Jonathan Cavitt)
> - MTL OA support (Umesh Nerlige Ramappa)
> - MTL initial gt workarounds (Matt Roper)
> 
> Driver refactors:
> 
> - Hold forcewake and MCR lock over PPAT setup (Matt Roper)
> - Acquire fw before loop in intel_uncore_read64_2x32 (Umesh Nerlige Ramappa)
> - GuC filename cleanups and use submission API version number (John Harrison)
> - Promote pxp subsystem to top-level of i915 (Alan Previn)
> - Finish proofing the code agains object size overflows (Chris Wilson, Gwan-gyeong Mun)
> - Start adding module oriented dmesg output (John Harrison)
> 
> Miscellaneous:
> 
> - Correct kerneldoc for intel_gt_mcr_wait_for_reg() (Matt Roper)
> - Bump up sample period for busy stats selftest (Umesh Nerlige Ramappa)
> - Make GuC default_lists const data (Jani Nikula)
> - Fix table order verification to check all FW types (John Harrison)
> - Remove some limited use register access wrappers (Jani Nikula)
> - Remove struct_member macro (Andrzej Hajda)
> - Remove hardcoded value with a macro (Nirmoy Das)
> - Use helper func to find out map type (Nirmoy Das)
> - Fix a static analysis warning (John Harrison)
> - Consolidate VMA active tracking helpers (Andrzej Hajda)
> - Do not cover all future platforms in TLB invalidation (Tvrtko Ursulin)
> - Replace zero-length arrays with flexible-array members (Gustavo A. R. Silva)
> - Unwind hugepages to drop wakeref on error (Chris Wilson)
> - Remove a couple of superfluous i915_drm.h includes (Jani Nikula)
> 
> Merges:
> 
> - Merge drm/drm-next into drm-intel-gt-next (Rodrigo Vivi)
> 
> ----------------------------------------------------------------
> Alan Previn (2):
>       drm/i915/pxp: Promote pxp subsystem to top-level of i915
>       drm/i915/pxp: Use drm_dbg if arb session failed due to fw version
> 
> Andi Shyti (2):
>       drm/i915: Limit the display memory alignment to 32 bit instead of 64
>       Revert "drm/i915: Improve on suspend / resume time with VT-d enabled"
> 
> Andrzej Hajda (4):
>       drm/i915: remove struct_member macro
>       drm/i915: fix TLB invalidation for Gen12.50 video and compute engines
>       drm/i915: use proper helper in igt_vma_move_to_active_unlocked
>       drm/i915/selftest: use igt_vma_move_to_active_unlocked if possible
> 
> Aravind Iddamsetty (1):
>       drm/i915/mtl: Media GT and Render GT share common GGTT
> 
> Ashutosh Dixit (2):
>       drm/i915/hwmon: Silence "mailbox access failed" warning in snb_pcode_read
>       drm/i915/hwmon: Display clamped PL1 limit
> 
> Chris Wilson (9):
>       drm/i915: Wrap all access to i915_vma.node.start|size
>       drm/i915: Introduce guard pages to i915_vma
>       drm/i915: Refine VT-d scanout workaround
>       drm/i915/migrate: Account for the reserved_space
>       drm/i915/gem: Typecheck page lookups
>       drm/i915: Check for integer truncation on scatterlist creation
>       drm/i915: Remove truncation warning for large objects
>       drm/i915/gt: Reset twice
>       drm/i915/selftests: Unwind hugepages to drop wakeref on error
> 
> Daniele Ceraolo Spurio (8):
>       drm/i915/huc: fix leak of debug object in huc load fence on driver unload
>       drm/i915/huc: always init the delayed load fence
>       drm/i915/guc: enable GuC GGTT invalidation from the start
>       drm/i915/uc: Introduce GSC FW
>       drm/i915/gsc: Skip the version check when fetching the GSC FW
>       drm/i915/gsc: GSC firmware loading
>       drm/i915/gsc: Do a driver-FLR on unload if GSC was loaded
>       drm/i915/mtl: MTL has one GSC CS on the media GT
> 
> Gustavo A. R. Silva (1):
>       drm/i915/guc: Replace zero-length arrays with flexible-array members
> 
> Gustavo Sousa (1):
>       drm/i915/gt: Cover rest of SVG unit MCR registers
> 
> Gwan-gyeong Mun (3):
>       drm/i915: Check for integer truncation on the configuration of ttm place
>       drm/i915: Check if the size is too big while creating shmem file
>       drm/i915: Use error code as -E2BIG when the size of gem ttm object is too large
> 
> Jani Nikula (3):
>       drm/i915/guc: make default_lists const data
>       drm/i915/gt: remove some limited use register access wrappers
>       drm/i915: remove a couple of superfluous i915_drm.h includes
> 
> Janusz Krzysztofik (2):
>       drm/i915: Fix negative value passed as remaining time
>       drm/i915: Never return 0 if not all requests retired
> 
> John Harrison (7):
>       drm/i915/uc: Fix table order verification to check all FW types
>       drm/i915/uc: Rationalise delimiters in filename macros
>       drm/i915/uc: More refactoring of UC version numbers
>       drm/i915/guc: Use GuC submission API version number
>       drm/i915/guc: Fix a static analysis warning
>       drm/i915/uc: Fix two issues with over-size firmware files
>       drm/i915/gt: Start adding module oriented dmesg output
> 
> Jonathan Cavitt (1):
>       drm/i915/gsc: Disable GSC engine and power well if FW is not selected
> 
> José Roberto de Souza (1):
>       drm/i915/gsc: Only initialize GSC in tile 0
> 
> Matt Atwood (2):
>       drm/i915/dg2: Introduce Wa_18018764978
>       drm/i915/dg2: Introduce Wa_18019271663
> 
> Matt Roper (10):
>       drm/i915/gt: Manage uncore->lock while waiting on MCR register
>       drm/i915/gt: Correct kerneldoc for intel_gt_mcr_wait_for_reg()
>       drm/i915/gt: Pass gt rather than uncore to lowest-level reads/writes
>       drm/i915/gt: Add dedicated MCR lock
>       drm/i915/mcr: Hold forcewake and MCR lock over PPAT setup
>       drm/i915/mtl: Add hardware-level lock for steering
>       drm/i915/mtl: Check full IP version when applying hw steering semaphore
>       drm/i915/gen12: Apply recommended L3 hashing mask
>       drm/i915/dg2: Return Wa_22012654132 to just specific steppings
>       drm/i915/mtl: Add initial gt workarounds
> 
> Matthew Auld (5):
>       drm/i915/selftests: use live_subtests for live_migrate
>       drm/i915/selftests: exercise emit_pte() with nearly full ring
>       drm/i915/migrate: fix corner case in CCS aux copying
>       drm/i915/ttm: consider CCS for backup objects
>       drm/i915: improve the catch-all evict to handle lock contention
> 
> Nirmoy Das (4):
>       drm/i915/selftests: Remove hardcoded value with a macro
>       drm/i915: Use helper func to find out map type
>       drm/i915: Use "%zu" to format size_t
>       drm/i915: Reserve enough fence slot for i915_vma_unbind_async
> 
> Rob Clark (1):
>       drm/i915: Fix potential context UAFs
> 
> Rodrigo Vivi (1):
>       Merge drm/drm-next into drm-intel-gt-next
> 
> Sasa Dragic (1):
>       drm/i915: re-disable RC6p on Sandy Bridge
> 
> Tvrtko Ursulin (2):
>       drm/i915: Fix workarounds on Gen2-3
>       drm/i915: Do not cover all future platforms in TLB invalidation
> 
> Umesh Nerlige Ramappa (7):
>       i915/uncore: Acquire fw before loop in intel_uncore_read64_2x32
>       drm/i915/selftest: Bump up sample period for busy stats selftest
>       drm/i915/perf: Do not parse context image for HSW
>       drm/i915/mtl: Resize noa_wait BO size to save restore GPR regs
>       drm/i915/mtl: Add Wa_14015846243 to fix OA vs CS timestamp mismatch
>       drm/i915/mtl: Update OA mux whitelist for MTL
>       drm/i915/mtl: Add OA support by enabling 32 bit OAG formats for MTL
> 
> Vinay Belgaumkar (1):
>       drm/i915/mtl: Enable Idle Messaging for GSC CS
> 
> Wayne Boyer (1):
>       drm/i915/pvc: Implement recommended caching policy
> 
>  drivers/gpu/drm/i915/Makefile                      |  11 +-
>  drivers/gpu/drm/i915/display/intel_fb_pin.c        |   2 +-
>  drivers/gpu/drm/i915/display/intel_fbdev.c         |   2 +-
>  drivers/gpu/drm/i915/display/skl_universal_plane.c |   2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_context.c        |  30 +-
>  drivers/gpu/drm/i915/gem/i915_gem_create.c         |   2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c         |  15 +-
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  94 ++++--
>  drivers/gpu/drm/i915/gem/i915_gem_internal.c       |   7 +-
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   4 +-
>  drivers/gpu/drm/i915/gem/i915_gem_object.c         |   7 +-
>  drivers/gpu/drm/i915/gem/i915_gem_object.h         | 303 ++++++++++++++++---
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c          |  27 +-
>  drivers/gpu/drm/i915/gem/i915_gem_phys.c           |   4 +
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |  25 +-
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |   2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |   4 +-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  20 +-
>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |   6 +-
>  .../gpu/drm/i915/gem/selftests/huge_gem_object.c   |   6 +-
>  drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |  18 +-
>  .../drm/i915/gem/selftests/i915_gem_client_blt.c   |  23 +-
>  .../drm/i915/gem/selftests/i915_gem_coherency.c    |   2 +-
>  .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  35 +--
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  10 +-
>  .../gpu/drm/i915/gem/selftests/i915_gem_object.c   |   8 +-
>  drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c |  15 +-
>  drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.h |   2 +-
>  drivers/gpu/drm/i915/gt/gen7_renderclear.c         |   2 +-
>  drivers/gpu/drm/i915/gt/intel_engine.h             |   2 +
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  24 +-
>  drivers/gpu/drm/i915/gt/intel_engine_pm.c          |  18 ++
>  .../gpu/drm/i915/gt/intel_execlists_submission.c   |   6 +-
>  drivers/gpu/drm/i915/gt/intel_ggtt.c               | 186 ++++--------
>  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |   3 +-
>  drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c          |   1 -
>  drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |   7 +
>  drivers/gpu/drm/i915/gt/intel_gsc.c                |   8 +
>  drivers/gpu/drm/i915/gt/intel_gt.c                 | 175 +++++------
>  drivers/gpu/drm/i915/gt/intel_gt.h                 |   5 +
>  drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |   8 +-
>  drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |   2 -
>  drivers/gpu/drm/i915/gt/intel_gt_irq.c             |  11 +-
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c             | 141 ++++++++-
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.h             |   2 +
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c              |  17 +-
>  drivers/gpu/drm/i915/gt/intel_gt_print.h           |  51 ++++
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h            |  33 +-
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs.c           |   4 +-
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |  34 +--
>  drivers/gpu/drm/i915/gt/intel_gt_types.h           |  20 +-
>  drivers/gpu/drm/i915/gt/intel_gtt.c                |  34 ++-
>  drivers/gpu/drm/i915/gt/intel_gtt.h                |  30 +-
>  drivers/gpu/drm/i915/gt/intel_migrate.c            |   6 +-
>  drivers/gpu/drm/i915/gt/intel_mocs.c               |   3 +
>  drivers/gpu/drm/i915/gt/intel_renderstate.c        |   2 +-
>  drivers/gpu/drm/i915/gt/intel_reset.c              |  52 ++--
>  drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   2 +-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c        | 172 +++++++----
>  drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |   8 +-
>  drivers/gpu/drm/i915/gt/selftest_execlists.c       |  30 +-
>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |  15 +-
>  drivers/gpu/drm/i915/gt/selftest_lrc.c             |  20 +-
>  drivers/gpu/drm/i915/gt/selftest_migrate.c         | 173 ++++++++++-
>  drivers/gpu/drm/i915/gt/selftest_mocs.c            |   4 +-
>  drivers/gpu/drm/i915/gt/selftest_ring_submission.c |   2 +-
>  drivers/gpu/drm/i915/gt/selftest_rps.c             |  12 +-
>  drivers/gpu/drm/i915/gt/selftest_workarounds.c     |  20 +-
>  drivers/gpu/drm/i915/gt/shmem_utils.c              |   7 +-
>  drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h      |   6 +-
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c          | 210 +++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h          |  15 +
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c          | 137 +++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h          |  47 +++
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  16 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h             |  11 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  24 +-
>  drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c          |   2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  29 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc.h              |   3 +
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           | 333 +++++++++++++++------
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |  23 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h       |   3 +-
>  drivers/gpu/drm/i915/gvt/dmabuf.c                  |  10 +-
>  drivers/gpu/drm/i915/i915_cmd_parser.c             |   4 +-
>  drivers/gpu/drm/i915/i915_debugfs.c                |   2 +-
>  drivers/gpu/drm/i915/i915_driver.c                 |  46 +--
>  drivers/gpu/drm/i915/i915_drv.h                    |   7 +-
>  drivers/gpu/drm/i915/i915_gem.c                    |  20 +-
>  drivers/gpu/drm/i915/i915_gem_evict.c              |  88 ++++--
>  drivers/gpu/drm/i915/i915_gem_evict.h              |   4 +-
>  drivers/gpu/drm/i915/i915_gem_gtt.h                |   3 +-
>  drivers/gpu/drm/i915/i915_hwmon.c                  |  43 ++-
>  drivers/gpu/drm/i915/i915_params.c                 |   3 +
>  drivers/gpu/drm/i915/i915_params.h                 |   1 +
>  drivers/gpu/drm/i915/i915_pci.c                    |   5 +-
>  drivers/gpu/drm/i915/i915_perf.c                   |  51 +++-
>  drivers/gpu/drm/i915/i915_reg.h                    |   3 +
>  drivers/gpu/drm/i915/i915_scatterlist.c            |   9 +
>  drivers/gpu/drm/i915/i915_utils.h                  |   4 +-
>  drivers/gpu/drm/i915/i915_vma.c                    |  83 +++--
>  drivers/gpu/drm/i915/i915_vma.h                    |  52 +++-
>  drivers/gpu/drm/i915/i915_vma_resource.c           |   4 +-
>  drivers/gpu/drm/i915/i915_vma_resource.h           |  17 +-
>  drivers/gpu/drm/i915/i915_vma_types.h              |   3 +-
>  drivers/gpu/drm/i915/intel_device_info.c           |   6 +
>  drivers/gpu/drm/i915/intel_mchbar_regs.h           |   2 +
>  drivers/gpu/drm/i915/intel_region_ttm.c            |  14 +
>  drivers/gpu/drm/i915/intel_runtime_pm.h            |   2 +-
>  drivers/gpu/drm/i915/intel_uncore.c                |  59 ++++
>  drivers/gpu/drm/i915/intel_uncore.h                |  13 +
>  drivers/gpu/drm/i915/pxp/intel_pxp.c               | 128 ++++++--
>  drivers/gpu/drm/i915/pxp/intel_pxp.h               |   9 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c           |   8 +-
>  .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h |   1 +
>  drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c       |  36 ++-
>  drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h       |   4 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_huc.c           |  11 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_irq.c           |  18 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_pm.c            |   6 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |  10 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |  35 ++-
>  drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |   8 +
>  drivers/gpu/drm/i915/selftests/i915_gem.c          |   2 +
>  drivers/gpu/drm/i915/selftests/i915_gem_evict.c    |   4 +-
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   4 +
>  drivers/gpu/drm/i915/selftests/i915_request.c      |  20 +-
>  drivers/gpu/drm/i915/selftests/igt_spinner.c       |   8 +-
>  drivers/gpu/drm/i915/selftests/scatterlist.c       |   4 +
>  129 files changed, 2778 insertions(+), 993 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_print.h
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
