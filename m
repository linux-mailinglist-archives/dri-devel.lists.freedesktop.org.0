Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA39DB0175A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 11:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BA910E9EE;
	Fri, 11 Jul 2025 09:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ge/OURZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E655710E9EF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 09:12:12 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso19606755e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 02:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752225131; x=1752829931; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Wnt/Z++MbdZU9XOrfATZ/FINeW1LQRc4CZfb34tf/pc=;
 b=ge/OURZNVXwHDnOluCdzNpS5h39fiPxLWrtbhtHXjHoYynZQ7QdlcafprBmWOoSpE9
 50hI54VJqD8d5t+m1ncMZdLyxmpOL3buO0ZlyOWJvF1IEF6yzEudUyXET2OtnegS4xgo
 4mXP1C9AQj8ztmvFLHjAl7W7aykbbOusZ9s5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752225131; x=1752829931;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wnt/Z++MbdZU9XOrfATZ/FINeW1LQRc4CZfb34tf/pc=;
 b=Eh4off7vR2g+YxItCvJi3iN90RlF0wl82FTztvL3XbCFCjessRGDmwPGLlCdb2XhOo
 4m/ztqd1gUN/j1+E8Uo3G9rxMzzqutchVC/3Q75AGj726d/iqtVtE9xZZQEdcHEwqqL7
 HwqXNu9aV4ZTC2AZAOgxmFHo0CXCnNeFq+mql4iqeV0P9Pdf1v37+4Lg8diVMu4sLFEq
 RR6g3oniUcS8jpW8jP3caM79XirnQrvztfY5U/vnrrBvWywCCBqtplPFxqf8H7vg90yg
 zLXARKaFpYBM6BqreH6jjYCQ1/J1R0u254V25KePH0FkO6ViuYbB7E5hWEtrEgX/jhzM
 fWkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIuwXzyIosKnTQalxDID7qTKsV7etQW1GBC//jVEoZ9IVWUeDSvWW0y3xBaK5H/2PtrdyDBDYRwIw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAxD/WAM1WzXzuG+Oc3HVJ2n3SsSgDvMrstXbh1ymypYYIkxsa
 UI5OZrbCkcqc39MvIeLo+aHEctiHprQcHATG2piKNNJlEHqxi0lhbc8Ti7iFyo4auy8=
X-Gm-Gg: ASbGncsL5Dw6qDlBMMRuNKsGfN2/LV/USK5iCUpBHdUig3Jd9laaCJZY9Q4tUe91l8B
 52FFwSiMn8KB0/YpyNaV/OBY3EthztQtWhFlpYmXRa/Vj2RVZeBpW2CfiU9EadCF0FrMrH3A3uA
 TBlBRCHXy1+KPBKkINfbk6/RJjL4jwMH5ZdSPWtlXtUsaPgy4xh0nJLUQqiemXmRsi3NXlCxpFL
 R/eZ3zOsC/KSf9nr+eVdYvkrWoS7C51WZudbbe0769AoH63iA+7/mqVm7191FIboBcqu5aY/uDF
 n8OwoC+WqDRb+OsSEHbIu+S0q/Pn6iqYYNHnZqUOdSMJ5cwQRPYAd83NN/qzqZoOw9Yr41cHHCa
 sWPYU27UZ+3+RH9XI3R/pZssK1DOwldrTf7qePlTXUvRn
X-Google-Smtp-Source: AGHT+IGejZ9PuS+S4VGy2OMVsaTkYjO1ldHB8NhkOmFdCBLYtKakgtjnT3SY9AhbFHZzGN4W9cVfUg==
X-Received: by 2002:a05:600c:628e:b0:450:cff7:62f9 with SMTP id
 5b1f17b1804b1-454ec2769e7mr19273705e9.22.1752225131270; 
 Fri, 11 Jul 2025 02:12:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cdb549absm80844415e9.1.2025.07.11.02.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 02:12:10 -0700 (PDT)
Date: Fri, 11 Jul 2025 11:12:08 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-xe-next
Message-ID: <aHDVaGY7v6L1JnRh@phenom.ffwll.local>
References: <aHA7184UnWlONORU@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aHA7184UnWlONORU@intel.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Thu, Jul 10, 2025 at 06:16:55PM -0400, Rodrigo Vivi wrote:
> Hi Dave and Sima,
> 
> Here goes our drm-xe-next towards 6.17.
> I'm still considering an extra small one in the beginning
> of next week if possible.
> 
> Before going to the details of what this pull request contains,
> I'd like to say that I had to bypass the new dim rule that checks
> for proper Acks in the patches. But only because they are in the DRM subsystem
> for the restructure of migration in preparation for multi-device. I hope this
> is okay by you, but please let me know if I should remove the patches and resend.
> Here are the patches without DRM ack from you:
> 
> ccfb15b8158c ("drm/xe/bmg: Add one additional PCI ID"): Mandatory Maintainer Acked-by missing.
> b58701687831 ("drm/xe: Implement and use the drm_pagemap populate_mm op"): Mandatory Maintainer Acked-by missing.
> 2ef19be2a545 ("drm/pagemap: Add a populate_mm op"): Mandatory Maintainer Acked-by missing.
> f86ad0ed620c ("drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap"): Mandatory Maintainer Acked-by missing.
> 
> Regarding the changes itself, please notice that this pull request includes
> some cross-subsystem patches for both MTD and i2c, but all with the proper Acks
> in place. They are needed for BMG features.
> 
> As for the other Xe highlights, we have a new platform (WildCat Lake),
> the removal of the force_probe protection for Panther Lake, new GuC version,
> and a lot of SRIOV enabling work, specially targeting enabling it soon on BMG.
> 
> Thanks,
> Rodrigo.
> 
> drm-xe-next-2025-07-10:
> UAPI Changes:
>  - Documentation fixes (Shuicheng)
> 
> Cross-subsystem Changes:
>  - MTD intel-dg driver for dgfx non-volatile memory device (Sasha)
>  - i2c: designware changes to allow i2c integration with BMG (Heikki)
> 
> Core Changes:
>  - Restructure migration in preparation for multi-device (Brost, Thomas)
>  - Expose fan control and voltage regulator version on sysfs (Raag)
> 
> Driver Changes:
>  - Add WildCat Lake support (Roper)
>  - Add aux bus child device driver for NVM on DGFX (Sasha)
>  - Some refactor and fixes to allow cleaner BMG w/a (Lucas, Maarten, Auld)
>  - BMG w/a (Vinay)
>  - Improve handling of aborted probe (Michal)
>  - Do not wedge device on killed exec queues (Brost)
>  - Init changes for flicker-free boot (Maarten)
>  - Fix out-of-bounds field write in MI_STORE_DATA_IMM (Jia)
>  - Enable the GuC Dynamic Inhibit Context Switch optimization (Daniele)
>  - Drop bo->size (Brost)
>  - Builds and KConfig fixes (Harry, Maarten)
>  - Consolidate LRC offset calculations (Tvrtko)
>  - Fix potential leak in hw_engine_group (Michal)
>  - Future-proof for multi-tile + multi-GT cases (Roper)
>  - Validate gt in pmu event (Riana)
>  - SRIOV PF: Clear all LMTT pages on alloc (Michal)
>  - Allocate PF queue size on pow2 boundary (Brost)
>  - SRIOV VF: Make multi-GT migration less error prone (Tomasz)
>  - Revert indirect ring state patch to fix random LRC context switches failures (Brost)
>  - Fix compressed VRAM handling (Auld)
>  - Add one additional BMG PCI ID (Ravi)
>  - Recommend GuC v70.46.2 for BMG, LNL, DG2 (Julia)
>  - Add GuC and HuC to PTL (Daniele)
>  - Drop PTL force_probe requirement (Atwood)
>  - Fix error flow in display suspend (Shuicheng)
>  - Disable GuC communication on hardware initialization error (Zhanjun)
>  - Devcoredump fixes and clean up (Shuicheng)
>  - SRIOV PF: Downgrade some info to debug (Michal)
>  - Don't allocate temporary GuC policies object (Michal)
>  - Support for I2C attached MCUs (Heikki, Raag, Riana)
>  - Add GPU memory bo trace points (Juston)
>  - SRIOV VF: Skip some W/a (Michal)
>  - Correct comment of xe_pm_set_vram_threshold (Shuicheng)
>  - Cancel ongoing H2G requests when stopping CT (Michal)
> The following changes since commit 36c52fb703e90388285963fc8f03cf60f76cbe4c:
> 
>   Merge tag 'drm-intel-next-2025-06-18' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2025-06-23 10:49:27 +1000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-07-10

Pulled into drm-next, thanks!
-Sima

> 
> for you to fetch changes up to 94de94d24ea8cf567ec7254a723c3192c72c2ca6:
> 
>   drm/xe/guc: Cancel ongoing H2G requests when stopping CT (2025-07-10 21:46:29 +0200)
> 
> ----------------------------------------------------------------
> UAPI Changes:
>  - Documentation fixes (Shuicheng)
> 
> Cross-subsystem Changes:
>  - MTD intel-dg driver for dgfx non-volatile memory device (Sasha)
>  - i2c: designware changes to allow i2c integration with BMG (Heikki)
> 
> Core Changes:
>  - Restructure migration in preparation for multi-device (Brost, Thomas)
>  - Expose fan control and voltage regulator version on sysfs (Raag)
> 
> Driver Changes:
>  - Add WildCat Lake support (Roper)
>  - Add aux bus child device driver for NVM on DGFX (Sasha)
>  - Some refactor and fixes to allow cleaner BMG w/a (Lucas, Maarten, Auld)
>  - BMG w/a (Vinay)
>  - Improve handling of aborted probe (Michal)
>  - Do not wedge device on killed exec queues (Brost)
>  - Init changes for flicker-free boot (Maarten)
>  - Fix out-of-bounds field write in MI_STORE_DATA_IMM (Jia)
>  - Enable the GuC Dynamic Inhibit Context Switch optimization (Daniele)
>  - Drop bo->size (Brost)
>  - Builds and KConfig fixes (Harry, Maarten)
>  - Consolidate LRC offset calculations (Tvrtko)
>  - Fix potential leak in hw_engine_group (Michal)
>  - Future-proof for multi-tile + multi-GT cases (Roper)
>  - Validate gt in pmu event (Riana)
>  - SRIOV PF: Clear all LMTT pages on alloc (Michal)
>  - Allocate PF queue size on pow2 boundary (Brost)
>  - SRIOV VF: Make multi-GT migration less error prone (Tomasz)
>  - Revert indirect ring state patch to fix random LRC context switches failures (Brost)
>  - Fix compressed VRAM handling (Auld)
>  - Add one additional BMG PCI ID (Ravi)
>  - Recommend GuC v70.46.2 for BMG, LNL, DG2 (Julia)
>  - Add GuC and HuC to PTL (Daniele)
>  - Drop PTL force_probe requirement (Atwood)
>  - Fix error flow in display suspend (Shuicheng)
>  - Disable GuC communication on hardware initialization error (Zhanjun)
>  - Devcoredump fixes and clean up (Shuicheng)
>  - SRIOV PF: Downgrade some info to debug (Michal)
>  - Don't allocate temporary GuC policies object (Michal)
>  - Support for I2C attached MCUs (Heikki, Raag, Riana)
>  - Add GPU memory bo trace points (Juston)
>  - SRIOV VF: Skip some W/a (Michal)
>  - Correct comment of xe_pm_set_vram_threshold (Shuicheng)
>  - Cancel ongoing H2G requests when stopping CT (Michal)
> 
> ----------------------------------------------------------------
> Alexander Usyskin (7):
>       mtd: add driver for intel graphics non-volatile memory device
>       mtd: intel-dg: implement region enumeration
>       mtd: intel-dg: implement access functions
>       mtd: intel-dg: register with mtd
>       mtd: intel-dg: align 64bit read and write
>       drm/xe/nvm: add on-die non-volatile memory device
>       drm/xe/nvm: add support for access mode
> 
> Daniele Ceraolo Spurio (5):
>       Revert "drm/xe/ptl: Apply Wa_16026007364"
>       drm/xe/guc: Enable extended CAT error reporting
>       drm/xe/guc: Enable the Dynamic Inhibit Context Switch optimization
>       drm/xe/ptl: Add GuC FW definition for PTL
>       drm/xe/ptl: Add HuC FW definition for PTL
> 
> Harry Austen (1):
>       drm/xe: Allow dropping kunit dependency as built-in
> 
> Heikki Krogerus (3):
>       i2c: designware: Use polling by default when there is no irq resource
>       i2c: designware: Add quirk for Intel Xe
>       drm/xe: Support for I2C attached MCUs
> 
> Jia Yao (1):
>       drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM
> 
> Julia Filipchuk (1):
>       drm/xe/guc: Recommend GuC v70.46.2 for BMG, LNL, DG2
> 
> Juston Li (1):
>       drm/xe/bo: add GPU memory trace points
> 
> Lucas De Marchi (3):
>       drm/xe/guc_pc: Add _locked variant for min/max freq
>       drm/xe/xe_guc_pc: Lock once to update stashed frequencies
>       drm/xe: Split xe_device_td_flush()
> 
> Maarten Lankhorst (13):
>       drm/xe: Move DSB l2 flush to a more sensible place
>       drm/xe: Defer memirq init until needed
>       drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
>       drm/xe: Simplify GuC early initialization
>       drm/xe: Make it possible to read instance0 MCR registers after xe_gt_mcr_init_early
>       drm/xe: Only dump PAT when xe_hw_engines_init_early fails
>       drm/xe: Rename gt_init sub-functions
>       drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
>       drm/xe: Move xe_ttm_sys_mgr_init() downwards.
>       drm/xe: Remove xe_uc_init_hwconfig()
>       drm/xe: Remove xe_uc_fini_hw
>       drm/xe: Rename xe_uc_init_hw to xe_uc_load_hw
>       drm/xe: Fix typo in Kconfig
> 
> Matt Atwood (1):
>       drm/xe/ptl: Drop force_probe requirement
> 
> Matt Roper (9):
>       drm/xe/xe3: Add support for graphics IP version 30.03
>       drm/xe/xe3: Add support for media IP version 30.02
>       drm/xe: Add Wildcat Lake device IDs to PTL list
>       drm/xe: Export xe_step_name for kunit tests
>       drm/xe: Track maximum GTs per tile on a per-platform basis
>       drm/xe/tests/pci: Ensure all platforms have a valid GT/tile count
>       drm/xe: Assign GT IDs properly on multi-tile + multi-GT platforms
>       drm/xe: Don't compare GT ID to GT count when determining valid GTs
>       drm/xe/xe_query: Use separate iterator while filling GT list
> 
> Matthew Auld (2):
>       drm/xe: move DPT l2 flush to a more sensible place
>       drm/xe/bmg: fix compressed VRAM handling
> 
> Matthew Brost (5):
>       drm/xe: Do not wedge device on killed exec queues
>       drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap
>       drm/xe: Drop bo->size
>       drm/xe: Allocate PF queue size on pow2 boundary
>       Revert "drm/xe/xe2: Enable Indirect Ring State support for Xe2"
> 
> Michal Wajdeczko (11):
>       drm/xe: Process deferred GGTT node removals on device unwind
>       drm/xe/guc: Explicitly exit CT safe mode on unwind
>       drm/xe/hw_engine_group: Fix potential leak
>       drm/xe/pf: Clear all LMTT pages on alloc
>       drm/xe/pf: Print runtime registers using debug printer
>       drm/xe/pf: Print configuration KLVs using debug printer
>       drm/xe/guc: Don't allocate temporary policies object
>       drm/xe/bmg: Don't use WA 16023588340 and 22019338487 on VF
>       drm/xe/guc: Rename CT state change helper
>       drm/xe/guc: Move state change logger to helper
>       drm/xe/guc: Cancel ongoing H2G requests when stopping CT
> 
> Raag Jadav (2):
>       drm/xe: Expose fan control and voltage regulator version
>       drm/xe/pm: Wire up suspend/resume for I2C controller
> 
> Reuven Abliyev (1):
>       drm/xe/nvm: add support for non-posted erase
> 
> Riana Tauro (2):
>       drm/xe/xe_pmu: Validate gt in event supported
>       drm/xe/xe_i2c: Add support for i2c in survivability mode
> 
> Rodrigo Vivi (1):
>       Merge drm/drm-next into drm-xe-next
> 
> Shuicheng Lin (5):
>       drm/xe/uapi: Correct sync type definition in comments
>       drm/xe/pm: Restore display pm if there is error after display suspend
>       drm/xe: Remove unused code in devcoredump_snapshot()
>       drm/xe: Release runtime pm for error path of xe_devcoredump_read()
>       drm/xe/pm: Correct comment of xe_pm_set_vram_threshold()
> 
> Thomas Hellström (2):
>       drm/pagemap: Add a populate_mm op
>       drm/xe: Implement and use the drm_pagemap populate_mm op
> 
> Tomasz Lis (1):
>       drm/xe/vf: Make multi-GT migration less error prone
> 
> Tvrtko Ursulin (1):
>       drm/xe: Consolidate LRC offset calculations
> 
> Vinay Belgaumkar (1):
>       drm/xe/bmg: Update Wa_22019338487
> 
> Vodapalli, Ravi Kumar (1):
>       drm/xe/bmg: Add one additional PCI ID
> 
> Zhanjun Dong (1):
>       drm/xe/uc: Disable GuC communication on hardware initialization error
> 
> sanirban (1):
>       drm/xe/ptl: Apply Wa_16026007364
> 
>  Documentation/gpu/rfc/gpusvm.rst            |  12 +-
>  MAINTAINERS                                 |   7 +
>  drivers/gpu/drm/Makefile                    |   6 +-
>  drivers/gpu/drm/drm_gpusvm.c                | 762 +------------------------
>  drivers/gpu/drm/drm_pagemap.c               | 838 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/Kconfig                  |  16 +-
>  drivers/gpu/drm/xe/Makefile                 |   2 +
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   4 +
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h       |  28 +
>  drivers/gpu/drm/xe/display/xe_dsb_buffer.c  |  11 +-
>  drivers/gpu/drm/xe/display/xe_fb_pin.c      |   7 +-
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c    |   2 +-
>  drivers/gpu/drm/xe/regs/xe_gsc_regs.h       |   4 +
>  drivers/gpu/drm/xe/regs/xe_i2c_regs.h       |  20 +
>  drivers/gpu/drm/xe/regs/xe_irq_regs.h       |   1 +
>  drivers/gpu/drm/xe/regs/xe_pmt.h            |   2 +-
>  drivers/gpu/drm/xe/regs/xe_regs.h           |   2 +
>  drivers/gpu/drm/xe/tests/xe_bo.c            |   2 +-
>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |   4 +-
>  drivers/gpu/drm/xe/tests/xe_migrate.c       |  52 +-
>  drivers/gpu/drm/xe/tests/xe_pci.c           |  31 +
>  drivers/gpu/drm/xe/tests/xe_pci_test.c      |  12 +
>  drivers/gpu/drm/xe/tests/xe_pci_test.h      |   1 +
>  drivers/gpu/drm/xe/xe_bo.c                  |  37 +-
>  drivers/gpu/drm/xe/xe_bo.h                  |  17 +-
>  drivers/gpu/drm/xe/xe_bo_types.h            |   4 +-
>  drivers/gpu/drm/xe/xe_devcoredump.c         |  50 +-
>  drivers/gpu/drm/xe/xe_device.c              | 121 ++--
>  drivers/gpu/drm/xe/xe_device.h              |  47 +-
>  drivers/gpu/drm/xe/xe_device_sysfs.c        | 143 ++++-
>  drivers/gpu/drm/xe/xe_device_types.h        |  22 +-
>  drivers/gpu/drm/xe/xe_drm_client.c          |   2 +-
>  drivers/gpu/drm/xe/xe_eu_stall.c            |   6 +-
>  drivers/gpu/drm/xe/xe_exec_queue.c          |   2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c                |  25 +-
>  drivers/gpu/drm/xe/xe_gsc.c                 |   6 +-
>  drivers/gpu/drm/xe/xe_gt.c                  |  80 ++-
>  drivers/gpu/drm/xe/xe_gt.h                  |   1 -
>  drivers/gpu/drm/xe/xe_gt_mcr.c              |  47 +-
>  drivers/gpu/drm/xe/xe_gt_pagefault.c        |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  26 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c |   2 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |   1 -
>  drivers/gpu/drm/xe/xe_gt_types.h            |   2 +
>  drivers/gpu/drm/xe/xe_guc.c                 | 147 ++++-
>  drivers/gpu/drm/xe/xe_guc.h                 |   2 +
>  drivers/gpu/drm/xe/xe_guc_ads.c             |  31 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c              |  81 ++-
>  drivers/gpu/drm/xe/xe_guc_ct.h              |   1 +
>  drivers/gpu/drm/xe/xe_guc_log.c             |   2 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c              | 283 +++++++---
>  drivers/gpu/drm/xe/xe_guc_pc.h              |   2 +
>  drivers/gpu/drm/xe/xe_guc_pc_types.h        |   2 +
>  drivers/gpu/drm/xe/xe_guc_submit.c          |  31 +-
>  drivers/gpu/drm/xe/xe_heci_gsc.c            |   5 +-
>  drivers/gpu/drm/xe/xe_huc.c                 |   2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c           |   3 +-
>  drivers/gpu/drm/xe/xe_hw_engine_group.c     |  19 +-
>  drivers/gpu/drm/xe/xe_i2c.c                 | 329 +++++++++++
>  drivers/gpu/drm/xe/xe_i2c.h                 |  62 ++
>  drivers/gpu/drm/xe/xe_irq.c                 |   2 +
>  drivers/gpu/drm/xe/xe_lmtt.c                |  15 +-
>  drivers/gpu/drm/xe/xe_lrc.c                 |  41 +-
>  drivers/gpu/drm/xe/xe_lrc_types.h           |   2 +-
>  drivers/gpu/drm/xe/xe_migrate.c             |  50 +-
>  drivers/gpu/drm/xe/xe_mmio.c                |  16 +-
>  drivers/gpu/drm/xe/xe_nvm.c                 | 167 ++++++
>  drivers/gpu/drm/xe/xe_nvm.h                 |  15 +
>  drivers/gpu/drm/xe/xe_oa.c                  |  10 +-
>  drivers/gpu/drm/xe/xe_pci.c                 |  77 +--
>  drivers/gpu/drm/xe/xe_pci_types.h           |  41 ++
>  drivers/gpu/drm/xe/xe_pcode_api.h           |  15 +
>  drivers/gpu/drm/xe/xe_pm.c                  |  20 +-
>  drivers/gpu/drm/xe/xe_pmu.c                 |   7 +-
>  drivers/gpu/drm/xe/xe_query.c               |  29 +-
>  drivers/gpu/drm/xe/xe_sriov_vf.c            | 195 +++----
>  drivers/gpu/drm/xe/xe_step.c                |   2 +
>  drivers/gpu/drm/xe/xe_survivability_mode.c  |  19 +-
>  drivers/gpu/drm/xe/xe_svm.c                 | 125 +++--
>  drivers/gpu/drm/xe/xe_svm.h                 |  10 +-
>  drivers/gpu/drm/xe/xe_tile.c                |   7 +
>  drivers/gpu/drm/xe/xe_tile.h                |  11 +
>  drivers/gpu/drm/xe/xe_trace_bo.h            |   4 +-
>  drivers/gpu/drm/xe/xe_uc.c                  |  78 +--
>  drivers/gpu/drm/xe/xe_uc.h                  |   5 +-
>  drivers/gpu/drm/xe/xe_uc_fw.c               |   8 +-
>  drivers/gpu/drm/xe/xe_vm.c                  |   8 +-
>  drivers/gpu/drm/xe/xe_wa.c                  |  16 +
>  drivers/gpu/drm/xe/xe_wa_oob.rules          |  10 +-
>  drivers/i2c/busses/i2c-designware-platdrv.c |  18 +-
>  drivers/mtd/devices/Kconfig                 |  11 +
>  drivers/mtd/devices/Makefile                |   1 +
>  drivers/mtd/devices/mtd_intel_dg.c          | 830 +++++++++++++++++++++++++++
>  include/drm/drm_gpusvm.h                    |  96 ----
>  include/drm/drm_pagemap.h                   | 135 +++++
>  include/drm/intel/pciids.h                  |   5 +-
>  include/linux/intel_dg_nvm_aux.h            |  32 ++
>  include/uapi/drm/xe_drm.h                   |   8 +-
>  98 files changed, 3981 insertions(+), 1630 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_pagemap.c
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
>  create mode 100644 drivers/gpu/drm/xe/xe_i2c.h
>  create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
>  create mode 100644 drivers/mtd/devices/mtd_intel_dg.c
>  create mode 100644 include/linux/intel_dg_nvm_aux.h

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
