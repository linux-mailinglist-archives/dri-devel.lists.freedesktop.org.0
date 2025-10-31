Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEE5C26764
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 18:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CC210E2F9;
	Fri, 31 Oct 2025 17:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="gKsD1YA3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AE410E2F9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 17:46:55 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b6d855ca585so548976966b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761932814; x=1762537614; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/U74qDhWtRZ2/GEt0OgV6FI8TLhf3YNClD+a4qkyCyc=;
 b=gKsD1YA3kRKMgQkpuFoLFgFw+TzChqzLMQES7Pqzyt/Ehd3wFl4/ZQd9RyiMujVpXF
 RByCE69FsnZHVubaz+aGo/PvTeuoZKjdmyjkWdyBo0Teuhjrd1V4R6t2l3jtFLl60Pup
 l+g1eRUN9X26aU0gE6DoMhne/z/lynony/aQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761932814; x=1762537614;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/U74qDhWtRZ2/GEt0OgV6FI8TLhf3YNClD+a4qkyCyc=;
 b=eVKtRbekxxbTevWDw3kMczhg+Os9Jm96zBAHErGZeoBOaA6USWPuxirFP050kSw3CQ
 FiEef9rjCCg7BwOQsugFQbCrob2SQaB5i6shhfyZRDHyOc8MLh9ougQ2sVeuokR9LkpT
 DWAIxYFsY+OxRIe5O8PwZo2FH2WaYqixWHZuGX5G/2QN2YG2ZBDVhR2iDasCMUEJ3+X4
 uphF/lle1QLudPTbZeZX2QOPfF09ZzePxI+YddNcVwfOF5W0n6olN2uHrWeZWn2F6OFf
 JyYzhFc0x3gr4KUhd6w5WmiXmNjdpKV2Z+I1cwh/WDPIBjylNcTGCv/0hGCMBOGQHfxz
 oyoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbc6F7yfua86MC1dJAHwgqSUsV+JgLueFc15nKQeAWqMMVj1X+v75O+mICB5Ci+dXaGjuriwjidkY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeTkBCYj5wArlh3MXvZzUMeAp+wxwO6kUlNDfPfmXmRxYz9NZ3
 JqPjGLG0253W1MT7tfBJFccNOG2GXici7z+8dHTsfxx12SiAHuZclnm3cKFXMR8ELEY=
X-Gm-Gg: ASbGnctyhle0yqdjKUUt22Xs1uBlcRpZfUuOeoYQAOQtNANlaGxBFpLXatGTPylZZji
 N23snLmDcGM2uCd/Gw34Mc5jGjUEbRkKVDpYEVhQK9E6UMbtuFZQfigH+qoAlP6KtS4cP0fQh5+
 qg7zZZtB+2JcmRlgSPSz81e/noU1N8px7TXlr/fSrYwIEk6cvTUvIobax57f3vprQe/4dM63uFj
 Qp8YFxKD9tMUsDODsc0TNxS/IwS+7oZHGcXSaYZ8512yoJhCsWLsaSlgTwWxiz0NzMd85tOCaJ8
 JfPNlh8hQy1C8hMkfnTTbp04xxEnQFgHDg/AFBZVkM8owIJpwFCZFyu5s2eiAczh4KCzXjrVw09
 YPMYuafYwHImD0FPmGmpvC1FySAeIVbGLUsC/y39KLnqQMwf9Mi/1wMp9Fu/U90jHuunD20nLk9
 G59qLeOqir8C0dEz8gWAni8g==
X-Google-Smtp-Source: AGHT+IF9FGeHOiBrOmfXVtaVLh47pAXMMNvGpvR4PtefXoKPk1p0EH9vsTbNtl1+JtB019yoDDIA4Q==
X-Received: by 2002:a17:907:1c93:b0:b40:8deb:9cbe with SMTP id
 a640c23a62f3a-b70700bad7dmr509520766b.2.1761932814193; 
 Fri, 31 Oct 2025 10:46:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7077c3ec52sm230828166b.43.2025.10.31.10.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 10:46:53 -0700 (PDT)
Date: Fri, 31 Oct 2025 18:46:51 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-xe-next
Message-ID: <aQT2C_cJMjYbZL0T@phenom.ffwll.local>
References: <aQCl9uJxN6CWJ8Vg@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQCl9uJxN6CWJ8Vg@fedora>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Tue, Oct 28, 2025 at 12:16:06PM +0100, Thomas Hellstrom wrote:
> Hi Dave, Simona!
> 
> This weeks drm-xe-next PR.
> 
> drm-xe-next-2025-10-28:
> Driver Changes:
> More xe3p support (Harish, Brian, Balasubramani, Matt Roper)
> Make panic support work on VRAM for display (Maarten)
> Fix stolen size check (Shuicheng)
> xe_pci_test update (Gustavo)
> VF migration updates (Tomasz)
> A couple of fixes around allocation and PM references (Matt Brost)
> Migration update for the MEM_COPY instruction (Matt Auld)
> Initial CRI support (Balasubramani, Matt Roper)
> Use SVM range helpers in PT layer (Matt Brost)
> Drop MAX_GT_TYPE_CHARS constant (Matt Roper)
> Fix spelling and typos (Sanjay)
> Fix VF FLR synchronization between all GTs (Michal)
> Add a Workaround (Nitin)
> Access VF's register using dedicated MMIO view (Michal)
> The following changes since commit d104d7ea864c1b9d8ffb3d93a58d49f9395be670:
> 
>   drm/xe/xe3p: Add xe3p EU stall data format (2025-10-18 19:45:14 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-10-28
> 
> for you to fetch changes up to 4504e780689245f01bee6ee4c19c74051bd87593:
> 
>   drm/xe/pf: Access VF's register using dedicated MMIO view (2025-10-27 17:22:18 +0100)

Pulled into drm-next, thanks!
-Sima

> 
> ----------------------------------------------------------------
> Driver Changes:
> More xe3p support (Harish, Brian, Balasubramani, Matt Roper)
> Make panic support work on VRAM for display (Maarten)
> Fix stolen size check (Shuicheng)
> xe_pci_test update (Gustavo)
> VF migration updates (Tomasz)
> A couple of fixes around allocation and PM references (Matt Brost)
> Migration update for the MEM_COPY instruction (Matt Auld)
> Initial CRI support (Balasubramani, Matt Roper)
> Use SVM range helpers in PT layer (Matt Brost)
> Drop MAX_GT_TYPE_CHARS constant (Matt Roper)
> Fix spelling and typos (Sanjay)
> Fix VF FLR synchronization between all GTs (Michal)
> Add a Workaround (Nitin)
> Access VF's register using dedicated MMIO view (Michal)
> 
> ----------------------------------------------------------------
> Balasubramani Vivekanandan (2):
>       drm/xe/xe3p_lpm: Add special check in Media GT for Main GAMCTRL
>       drm/xe/cri: Add CRI platform definition
> 
> Brian Welty (1):
>       drm/xe/xe3p_lpm: Configure MAIN_GAMCTRL_QUEUE_SELECT
> 
> Gustavo Sousa (2):
>       drm/xe/tests/pci: Convert GT count check to general device check
>       drm/xe/tests/pci: Check dma_mask_size, va_bits and vm_max_level
> 
> Maarten Lankhorst (2):
>       drm/xe: Extract xe_bo_is_visible_vram
>       drm/xe/display: Make panic support work on vram.
> 
> Matt Roper (4):
>       drm/xe/cri: Setup MOCS table
>       drm/xe/xe3p_xpc: Treat all PSMI MCR ranges as "INSTANCE0"
>       drm/xe/xe3p_xpc: Add MCR steering for NODE and L3BANK ranges
>       drm/xe/configfs: Drop MAX_GT_TYPE_CHARS constant
> 
> Matthew Auld (7):
>       drm/xe/migrate: fix offset and len check
>       drm/xe/migrate: rework size restrictions for sram pte emit
>       drm/xe/migrate: fix chunk handling for 2M page emit
>       drm/xe/migrate: fix batch buffer sizing
>       drm/xe/migrate: trim batch buffer sizing
>       drm/xe/migrate: support MEM_COPY instruction
>       drm/xe/migrate: skip bounce buffer path on xe2
> 
> Matthew Brost (4):
>       drm/xe: Check return value of GGTT workqueue allocation
>       drm/xe: Do not wake device during a GT reset
>       drm/xe: Avoid PM wake reference during VF migration
>       drm/xe: Use SVM range helpers in PT layer
> 
> Michal Wajdeczko (2):
>       drm/xe/pf: Fix VF FLR synchronization between all GTs
>       drm/xe/pf: Access VF's register using dedicated MMIO view
> 
> Nitin Gote (1):
>       drm/xe/xe3: Add WA_14024681466 for Xe3_LPG
> 
> Sanjay Yadav (1):
>       drm/xe: Fix spelling and typos across Xe driver files
> 
> Shuicheng Lin (1):
>       drm/xe: Fix stolen size check to allow equal WOPCM size
> 
> Tomasz Lis (4):
>       drm/xe/vf: Revert logic of vf.migration.enabled
>       drm/xe/vf: Fix GuC FW check for VF migration support
>       drm/xe: Assert that VF will never use fixed placement of BOs
>       drm/xe/vf: Do not disable VF migration on ATS-M
> 
>  drivers/gpu/drm/xe/display/xe_panic.c             |  50 +++++---
>  drivers/gpu/drm/xe/instructions/xe_gpu_commands.h |   6 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h              |  10 ++
>  drivers/gpu/drm/xe/tests/xe_pci_test.c            |  16 ++-
>  drivers/gpu/drm/xe/xe_bo.c                        |  29 ++++-
>  drivers/gpu/drm/xe/xe_bo.h                        |   1 +
>  drivers/gpu/drm/xe/xe_bo_doc.h                    |   8 +-
>  drivers/gpu/drm/xe/xe_configfs.c                  |   5 +-
>  drivers/gpu/drm/xe/xe_device.c                    |   2 +-
>  drivers/gpu/drm/xe/xe_device_types.h              |  10 +-
>  drivers/gpu/drm/xe/xe_exec.c                      |   2 +-
>  drivers/gpu/drm/xe/xe_force_wake_types.h          |   4 +-
>  drivers/gpu/drm/xe/xe_ggtt.c                      |   3 +
>  drivers/gpu/drm/xe/xe_gt.c                        |  19 ++--
>  drivers/gpu/drm/xe/xe_gt_freq.c                   |   2 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.c                    |  35 +++---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c               |  36 ++----
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c       |   2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c               |   7 +-
>  drivers/gpu/drm/xe/xe_gt_topology.c               |   7 ++
>  drivers/gpu/drm/xe/xe_gt_topology.h               |   2 +
>  drivers/gpu/drm/xe/xe_gt_types.h                  |   9 +-
>  drivers/gpu/drm/xe/xe_guc.c                       |  46 ++++++++
>  drivers/gpu/drm/xe/xe_guc.h                       |   1 +
>  drivers/gpu/drm/xe/xe_guc_ads.c                   |   6 +-
>  drivers/gpu/drm/xe/xe_guc_ads_types.h             |   2 +-
>  drivers/gpu/drm/xe/xe_guc_ct_types.h              |   2 +-
>  drivers/gpu/drm/xe/xe_guc_fwif.h                  |   1 +
>  drivers/gpu/drm/xe/xe_guc_log_types.h             |   2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c                |   2 +-
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c             |   2 +-
>  drivers/gpu/drm/xe/xe_map.h                       |   4 +-
>  drivers/gpu/drm/xe/xe_migrate.c                   | 132 ++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_migrate_doc.h               |   2 +-
>  drivers/gpu/drm/xe/xe_mmio.c                      |  29 +++++
>  drivers/gpu/drm/xe/xe_mmio.h                      |   4 +
>  drivers/gpu/drm/xe/xe_mocs.c                      |  26 +++++
>  drivers/gpu/drm/xe/xe_pci.c                       |  20 ++++
>  drivers/gpu/drm/xe/xe_pci_types.h                 |   1 +
>  drivers/gpu/drm/xe/xe_platform_types.h            |   1 +
>  drivers/gpu/drm/xe/xe_pm.c                        |   2 +-
>  drivers/gpu/drm/xe/xe_preempt_fence_types.h       |   2 +-
>  drivers/gpu/drm/xe/xe_pt.c                        |  28 ++---
>  drivers/gpu/drm/xe/xe_range_fence.h               |   4 +-
>  drivers/gpu/drm/xe/xe_sched_job.c                 |   6 +-
>  drivers/gpu/drm/xe/xe_sched_job.h                 |  12 +-
>  drivers/gpu/drm/xe/xe_sched_job_types.h           |   2 +-
>  drivers/gpu/drm/xe/xe_sriov_vf.c                  |  39 +++----
>  drivers/gpu/drm/xe/xe_sriov_vf.h                  |   1 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c              |  46 +++++++-
>  drivers/gpu/drm/xe/xe_sriov_vf_types.h            |   6 +-
>  drivers/gpu/drm/xe/xe_svm.c                       |   2 +-
>  drivers/gpu/drm/xe/xe_tlb_inval.h                 |   2 +-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c            |   2 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h        |   4 +-
>  drivers/gpu/drm/xe/xe_uc_fw_types.h               |   6 +-
>  drivers/gpu/drm/xe/xe_uc_types.h                  |   2 +-
>  drivers/gpu/drm/xe/xe_validation.h                |   6 +-
>  drivers/gpu/drm/xe/xe_vm.c                        |  10 +-
>  drivers/gpu/drm/xe/xe_vm_doc.h                    |   8 +-
>  drivers/gpu/drm/xe/xe_vm_types.h                  |   4 +-
>  drivers/gpu/drm/xe/xe_wa.c                        |   4 +
>  include/drm/intel/pciids.h                        |   4 +
>  63 files changed, 534 insertions(+), 216 deletions(-)

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
