Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BD7C66288
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 21:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC5110E1D5;
	Mon, 17 Nov 2025 20:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b1OBhXmZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F5510E1CE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 20:56:53 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-8b0f54370ecso480492585a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763413012; x=1764017812; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ISU+0z8/4+zmWNh+iSGO9mIjr0yYVY3n2sP2TXlPC+k=;
 b=b1OBhXmZhyQNJPSgO30nDtD5Vg+8vCjHXr3tS9vOCIrGr+JIVZ52G3dlw0WkhplUhg
 IVVG7HGOLG4ffgQNj7xj4foqwXKJWq8gUoTzojSKw+rvLcdHpd37KTUXTWJr0G/at6ou
 KOp9VDGK2Fr0KP8BVHgg97oweuL0zJlOf29sxVMis5eyHBCWwmO/99l2yZDDaHEUqDsE
 rYDazSeprY7AFJoF62DsOpLT/Rqb+AIg/dkDlAqkOSD1ETqJsEHAEiVSVwPih+7nnwqB
 6W8f71euXyPGXGJJaQtSjvcX/yiL50bFoqvDvkraxEbfrevlWqxKjFSYWyoh/qFMlk+d
 E5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763413012; x=1764017812;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ISU+0z8/4+zmWNh+iSGO9mIjr0yYVY3n2sP2TXlPC+k=;
 b=TsHoq6ae+kmSn4YQAK4IU3IQlhwulMHdK9aSpwNnLu2/y56j0NRJDEZUPop7VWAKXF
 JBzycuIKbNkCOFCJL2GjZmKVuXiJT0B3L6DVF+uuiKjcLPjlbiSGGtNJZpHSaa2jbY3X
 E4toyGm+krNJHSGSB+9uWvNDNNaKnXQKlHzV+S507Jq9vkQazq6mLXMCQATS+/gSR8mN
 +g88CjYPs1V/Va0/uvuHkknvapRV2crLU84zd4Zp00lN/bwKfzuec1Tl+Vlfugb0g7bi
 JWT3jLpjSV2EwWNgOl0Cy/5G2kTArNCyOxmvftOW6iiSNn0xNeWECKwho+DSuuIEPOOb
 Ai6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWda6MbwjU03mrRL94usZGeOIDjhObFC94quFLfPmKRjfU1S7Fi+aP6HQ5ZIUF6qFlOseLqQJHtjs0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxh27UwaebcUHGkQyqnGFyEdprIDm0U84qdP23ke7LM5xygOaN3
 pAL/PFe751Atyeblx0O/D7+tVRCl0gwpDWAtpl9G2ubUgxdYk3wxPXqIVONDTdgJuHoRPw6Ye87
 a16lIohrtcUKwCafvQO4cIiKdaGvWiJU=
X-Gm-Gg: ASbGncvw9vZ7M+7J6z5wU9NV6rbwiBrfI8meGgcpGUqD22nKPmUfNwlbIOxCybvjYti
 5abkzMgQSFkqntkPCnfivj6zlwHLzTgG0Wh0ANOTPKmnwqweS+kXEz29+6rNDV8QEF/1VM4d0Xu
 Qvebo8lUSGt9rYGq4guYtwViFSH9TJvaQoPuA7IZiKBhjggE4wO8Op4H0o6DiP1F132WyiFVYKh
 2mfL3BU5zS22P97sJ1u15qBaxWAOgoLHUHVSMPd6qdUICd1OOMUl0kL0y/4EAb2znHK/g==
X-Google-Smtp-Source: AGHT+IGD4QU1lMs4EaP4WuNY124UzZwJ6lDT6UoQH9dwZiAPGyRG8CtxXsuaQdtK38GikpdlutqP+jZGa5s7dbsUMQg=
X-Received: by 2002:a05:620a:458b:b0:8b1:5f62:a5d5 with SMTP id
 af79cd13be357-8b2c31da139mr1822873385a.62.1763413011907; Mon, 17 Nov 2025
 12:56:51 -0800 (PST)
MIME-Version: 1.0
References: <aRcJOrisG2qPbucE@fedora>
In-Reply-To: <aRcJOrisG2qPbucE@fedora>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 18 Nov 2025 06:56:40 +1000
X-Gm-Features: AWmQ_bmMemlRqfWPvp8z_uNqJUS6z3cdQzNjt6szUhfijLFDWUsRY0stdd7FNpg
Message-ID: <CAPM=9tyYymc6g-9S33PCzFj5__nsaFvKm3PZuWwvJg0b1O7MrQ@mail.gmail.com>
Subject: Re: [PULL] drm-xe-next
To: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
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

On Fri, 14 Nov 2025 at 20:50, Thomas Hellstrom
<thomas.hellstrom@linux.intel.com> wrote:
>
> Hi Dave, Simona
>
> This is the last feature drm-xe-next PR towards 6.19.
>
> Note that the PR of 25-11-05 was never pulled, so this one
> incorporates that one as well. Please let me know if you want
> this done another way.

Just for future reference, just let me know I've missed one in the
next one, and treat them as separate, as I'll just go back and do them
in order.

This is fine this time, I just edited out the overlap from the commit msg.

Dave.

>
> Thanks,
> Thomas
>
> drm-xe-next-2025-11-14:
> UAPI Changes:
>
> Limit number of jobs per exec queue (Shuicheng)
> Add sriov_admin sysfs tree (Michal)
>
> Driver Changes:
>
> Fix an uninitialized value (Thomas)
> Expose a residency counter through debugfs (Mohammed Thasleem)
> Workaround enabling and improvement (Tapani, Tangudu)
> More Crescent Island-specific support (Sk Anirban, Lucas)
> PAT entry dump improvement (Xin)
> Inline gt_reset in the worker (Lucas)
> Synchronize GT reset with device unbind (Balasubramani)
> Do clean shutdown also when using flr (Jouni)
> Fix serialization on burst of unbinds (Matt Brost)
> Pagefault Refactor (Matt Brost)
> Remove some unused code (Gwan-gyeong)
> Avoid TOCTOU when montoring throttle reasons (Lucas)
> Add/extend workaround (Nitin)
> SRIOV migration work / plumbing (Michal Wajdeczko, Michal Winiarski, Luka=
sz)
> Drop debug flag requirement for VF resource fixup
> Fix MTL vm_max_level (Rodrigo)
> Changes around TILE_ADDR_RANGE for platform compatibility
> (Fei, Lucas)
> Add runtime registers for GFX ver >=3D 35 (Piotr)
> Kerneldoc fix (Kriish)
> Rework pcode error mapping (Lucas)
> Allow lockdown the PF (Michal)
> Eliminate GUC code caching of some frequency values (Sk)
> Improvements around forcewake referencing (Matt Roper)
> The following changes since commit 4504e780689245f01bee6ee4c19c74051bd875=
93:
>
>   drm/xe/pf: Access VF's register using dedicated MMIO view (2025-10-27 1=
7:22:18 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-=
11-14
>
> for you to fetch changes up to 6bcb180f6f4585554cefbe8c412aa8879b15f07a:
>
>   drm/xe/oa: Store forcewake reference in stream structure (2025-11-13 14=
:05:51 -0800)
>
> ----------------------------------------------------------------
> UAPI Changes:
>
> Limit number of jobs per exec queue (Shuicheng)
> Add sriov_admin sysfs tree (Michal)
>
> Driver Changes:
>
> Fix an uninitialized value (Thomas)
> Expose a residency counter through debugfs (Mohammed Thasleem)
> Workaround enabling and improvement (Tapani, Tangudu)
> More Crescent Island-specific support (Sk Anirban, Lucas)
> PAT entry dump improvement (Xin)
> Inline gt_reset in the worker (Lucas)
> Synchronize GT reset with device unbind (Balasubramani)
> Do clean shutdown also when using flr (Jouni)
> Fix serialization on burst of unbinds (Matt Brost)
> Pagefault Refactor (Matt Brost)
> Remove some unused code (Gwan-gyeong)
> Avoid TOCTOU when montoring throttle reasons (Lucas)
> Add/extend workaround (Nitin)
> SRIOV migration work / plumbing (Michal Wajdeczko, Michal Winiarski, Luka=
sz)
> Drop debug flag requirement for VF resource fixup
> Fix MTL vm_max_level (Rodrigo)
> Changes around TILE_ADDR_RANGE for platform compatibility
> (Fei, Lucas)
> Add runtime registers for GFX ver >=3D 35 (Piotr)
> Kerneldoc fix (Kriish)
> Rework pcode error mapping (Lucas)
> Allow lockdown the PF (Michal)
> Eliminate GUC code caching of some frequency values (Sk)
> Improvements around forcewake referencing (Matt Roper)
>
> ----------------------------------------------------------------
> Balasubramani Vivekanandan (2):
>       drm/xe/gt: Synchronize GT reset with device unbind
>       drm/xe/guc: Synchronize Dead CT worker with unbind
>
> Fei Yang (1):
>       drm/xe: Use SG_TILE_ADDR_RANGE instead of TILE_ADDR_RANGE
>
> Gwan-gyeong Mun (1):
>       drm/xe: Remove never used code in xe_vm_create()
>
> Jouni H=C3=B6gander (1):
>       drm/xe: Do clean shutdown also when using flr
>
> Kriish Sharma (1):
>       drm/xe: fix kernel-doc function name mismatch in xe_pm.c
>
> Lucas De Marchi (10):
>       drm/xe/gt_throttle: Tidy up perf reasons reading
>       drm/xe/gt_throttle: Always read and mask
>       drm/xe/gt_throttle: Add throttle_to_gt()
>       drm/xe/gt_throttle: Tidy up attribute definition
>       drm/xe: Improve freq and throttle documentation
>       drm/xe/gt_throttle: Drop individual show functions
>       drm/xe: Inline gt_reset in the worker
>       drm/xe/gt_throttle: Avoid TOCTOU when monitoring reasons
>       drm/xe/vram: Move forcewake down to get_flat_ccs_offset()
>       drm/xe/pcode: Rework error mapping
>
> Lukasz Laguna (2):
>       drm/xe/pf: Add helper to retrieve VF's LMEM object
>       drm/xe/migrate: Add function to copy of VRAM data in chunks
>
> Matt Roper (3):
>       drm/xe/forcewake: Improve kerneldoc
>       drm/xe/eustall: Store forcewake reference in stream structure
>       drm/xe/oa: Store forcewake reference in stream structure
>
> Matthew Brost (13):
>       drm/xe: Enforce correct user fence signaling order using
>       drm/xe: Attach last fence to TLB invalidation job queues
>       drm/xe: Decouple bind queue last fence from TLB invalidations
>       drm/xe: Skip TLB invalidation waits in page fault binds
>       drm/xe: Disallow input fences on zero batch execs and zero binds
>       drm/xe: Remove last fence dependency check from binds and execs
>       drm/xe: Stub out new pagefault layer
>       drm/xe: Implement xe_pagefault_init
>       drm/xe: Implement xe_pagefault_reset
>       drm/xe: Implement xe_pagefault_handler
>       drm/xe: Implement xe_pagefault_queue_work
>       drm/xe: Add xe_guc_pagefault layer
>       drm/xe: Remove unused GT page fault code
>
> Michal Wajdeczko (22):
>       drm/xe/pf: Prepare sysfs for SR-IOV admin attributes
>       drm/xe/pf: Take RPM during calls to SR-IOV attr.store()
>       drm/xe/pf: Add _locked variants of the VF EQ config functions
>       drm/xe/pf: Add _locked variants of the VF PT config functions
>       drm/xe/pf: Allow change PF and VFs EQ/PT using sysfs
>       drm/xe/pf: Relax report helper to accept PF in bulk configs
>       drm/xe/pf: Fix signature of internal config helpers
>       drm/xe/pf: Add functions to bulk configure EQ/PT on GT
>       drm/xe/pf: Add functions to bulk provision EQ/PT
>       drm/xe/pf: Allow bulk change all VFs EQ/PT using sysfs
>       drm/xe/pf: Add functions to provision scheduling priority
>       drm/xe/pf: Allow bulk change all VFs priority using sysfs
>       drm/xe/pf: Allow change PF scheduling priority using sysfs
>       drm/xe/pf: Promote xe_pci_sriov_get_vf_pdev
>       drm/xe/pf: Add sysfs device symlinks to enabled VFs
>       drm/xe/pf: Allow to stop the VF using sysfs
>       drm/xe/pf: Add documentation for sriov_admin attributes
>       drm/xe/pf: Use migration-friendly context IDs auto-provisioning
>       drm/xe/pf: Use migration-friendly doorbells auto-provisioning
>       drm/xe/tests: Add KUnit tests for PF fair provisioning
>       drm/xe/pf: Allow to lockdown the PF using custom guard
>       drm/xe/pf: Use migration-friendly GGTT auto-provisioning
>
> Micha=C5=82 Winiarski (23):
>       drm/xe/vf: Enable VF resource fixup unconditionally
>       drm/xe/pf: Remove GuC version check for migration support
>       drm/xe: Move migration support to device-level struct
>       drm/xe/pf: Convert control state to bitmap
>       drm/xe/pf: Add save/restore control state stubs and connect to debu=
gfs
>       drm/xe/pf: Add data structures and handlers for migration rings
>       drm/xe/pf: Add helpers for migration data packet allocation / free
>       drm/xe/pf: Add support for encap/decap of bitstream to/from packet
>       drm/xe/pf: Add minimalistic migration descriptor
>       drm/xe/pf: Expose VF migration data size over debugfs
>       drm/xe: Add sa/guc_buf_cache sync interface
>       drm/xe: Allow the caller to pass guc_buf_cache size
>       drm/xe/pf: Increase PF GuC Buffer Cache size and use it for VF migr=
ation
>       drm/xe/pf: Remove GuC migration data save/restore from GT debugfs
>       drm/xe/pf: Don't save GuC VF migration data on pause
>       drm/xe/pf: Switch VF migration GuC save/restore to struct migration=
 data
>       drm/xe/pf: Handle GuC migration data as part of PF control
>       drm/xe/pf: Add helpers for VF GGTT migration data handling
>       drm/xe/pf: Handle GGTT migration data as part of PF control
>       drm/xe/pf: Handle MMIO migration data as part of PF control
>       drm/xe/pf: Handle VRAM migration data as part of PF control
>       drm/xe/pf: Add wait helper for VF FLR
>       drm/intel/bmg: Allow device ID usage with single-argument macros
>
> Mohammed Thasleem (1):
>       drm/xe/xe_debugfs: Expose G7 package state residency counter throug=
h debugfs
>
> Nitin Gote (1):
>       drm/xe/xe3lpg: Extend Wa_15016589081 for xe3lpg
>
> Piotr Pi=C3=B3rkowski (1):
>       drm/xe/pf: Add runtime registers for GFX ver >=3D 35
>
> Rodrigo Vivi (1):
>       drm/xe: Fix MTL vm_max_level
>
> Shuicheng Lin (1):
>       drm/xe: Limit number of jobs per exec queue
>
> Sk Anirban (3):
>       drm/xe/cri: Add new performance limit reasons bits
>       drm/xe/guc: Eliminate RPe caching for SLPC parameter handling
>       drm/xe/guc: Eliminate RPa frequency caching
>
> Tangudu Tilak Tirumalesh (1):
>       drm/xe/xe3: Extend wa_14023061436
>
> Tapani P=C3=A4lli (1):
>       drm/xe/xe3: Apply wa_14024997852
>
> Thomas Hellstr=C3=B6m (1):
>       drm/xe: Fix uninitialized return value from xe_validation_guard()
>
> Xin Wang (1):
>       drm/xe: highlight reserved PAT entries in dump output
>
>  .../ABI/testing/sysfs-driver-intel-xe-sriov        |  159 +++
>  Documentation/gpu/xe/xe_gt_freq.rst                |    3 +
>  drivers/gpu/drm/xe/Makefile                        |    6 +-
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h               |   14 +-
>  drivers/gpu/drm/xe/regs/xe_pmt.h                   |    1 +
>  drivers/gpu/drm/xe/regs/xe_regs.h                  |    2 +
>  .../gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c |  208 ++++
>  drivers/gpu/drm/xe/xe_debugfs.c                    |    1 +
>  drivers/gpu/drm/xe/xe_device.c                     |   23 +-
>  drivers/gpu/drm/xe/xe_device_types.h               |   11 +
>  drivers/gpu/drm/xe/xe_eu_stall.c                   |    8 +-
>  drivers/gpu/drm/xe/xe_exec.c                       |   14 +-
>  drivers/gpu/drm/xe/xe_exec_queue.c                 |  124 ++-
>  drivers/gpu/drm/xe/xe_exec_queue.h                 |   23 +-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h           |   17 +
>  drivers/gpu/drm/xe/xe_force_wake_types.h           |   26 +-
>  drivers/gpu/drm/xe/xe_ggtt.c                       |  104 ++
>  drivers/gpu/drm/xe/xe_ggtt.h                       |    3 +
>  drivers/gpu/drm/xe/xe_ggtt_types.h                 |    2 +
>  drivers/gpu/drm/xe/xe_gt.c                         |   44 +-
>  drivers/gpu/drm/xe/xe_gt_freq.c                    |   30 +-
>  drivers/gpu/drm/xe/xe_gt_pagefault.c               |  679 ------------
>  drivers/gpu/drm/xe/xe_gt_pagefault.h               |   19 -
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |  351 +++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h         |   16 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c        |  650 +++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h        |   10 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h  |   34 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c        |   47 -
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c      | 1112 ++++++++++++++=
+-----
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h      |   46 +-
>  .../gpu/drm/xe/xe_gt_sriov_pf_migration_types.h    |   34 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c        |   21 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h          |    5 +-
>  drivers/gpu/drm/xe/xe_gt_throttle.c                |  375 +++----
>  drivers/gpu/drm/xe/xe_gt_types.h                   |   65 --
>  drivers/gpu/drm/xe/xe_guard.h                      |  119 +++
>  drivers/gpu/drm/xe/xe_guc.c                        |   13 +-
>  drivers/gpu/drm/xe/xe_guc_buf.c                    |   57 +-
>  drivers/gpu/drm/xe/xe_guc_buf.h                    |    2 +
>  drivers/gpu/drm/xe/xe_guc_ct.c                     |    9 +-
>  drivers/gpu/drm/xe/xe_guc_pagefault.c              |   95 ++
>  drivers/gpu/drm/xe/xe_guc_pagefault.h              |   15 +
>  drivers/gpu/drm/xe/xe_guc_pc.c                     |  100 +-
>  drivers/gpu/drm/xe/xe_guc_pc_types.h               |    4 -
>  drivers/gpu/drm/xe/xe_migrate.c                    |  142 ++-
>  drivers/gpu/drm/xe/xe_migrate.h                    |   16 +
>  drivers/gpu/drm/xe/xe_oa.c                         |   54 +-
>  drivers/gpu/drm/xe/xe_oa_types.h                   |   11 +
>  drivers/gpu/drm/xe/xe_pagefault.c                  |  445 ++++++++
>  drivers/gpu/drm/xe/xe_pagefault.h                  |   19 +
>  drivers/gpu/drm/xe/xe_pagefault_types.h            |  136 +++
>  drivers/gpu/drm/xe/xe_pat.c                        |   15 +-
>  drivers/gpu/drm/xe/xe_pat.h                        |    5 +
>  drivers/gpu/drm/xe/xe_pci.c                        |    2 +-
>  drivers/gpu/drm/xe/xe_pci_sriov.c                  |   62 +-
>  drivers/gpu/drm/xe/xe_pci_sriov.h                  |    1 +
>  drivers/gpu/drm/xe/xe_pcode.c                      |   40 +-
>  drivers/gpu/drm/xe/xe_pcode_api.h                  |    6 -
>  drivers/gpu/drm/xe/xe_pm.c                         |    2 +-
>  drivers/gpu/drm/xe/xe_pt.c                         |   80 +-
>  drivers/gpu/drm/xe/xe_reg_whitelist.c              |    7 +
>  drivers/gpu/drm/xe/xe_sa.c                         |   21 +
>  drivers/gpu/drm/xe/xe_sa.h                         |    1 +
>  drivers/gpu/drm/xe/xe_sched_job.c                  |   19 +-
>  drivers/gpu/drm/xe/xe_sched_job.h                  |    1 -
>  drivers/gpu/drm/xe/xe_sriov_packet.c               |  520 +++++++++
>  drivers/gpu/drm/xe/xe_sriov_packet.h               |   30 +
>  drivers/gpu/drm/xe/xe_sriov_packet_types.h         |   75 ++
>  drivers/gpu/drm/xe/xe_sriov_pf.c                   |  107 ++
>  drivers/gpu/drm/xe/xe_sriov_pf.h                   |    4 +
>  drivers/gpu/drm/xe/xe_sriov_pf_control.c           |  128 +++
>  drivers/gpu/drm/xe/xe_sriov_pf_control.h           |    5 +
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c           |  131 +++
>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h           |   16 +
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c         |  342 ++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.h         |   29 +
>  drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h   |   37 +
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c         |  284 +++++
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.h         |   14 +
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c             |  647 ++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h             |   16 +
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h             |   21 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c                   |    8 -
>  drivers/gpu/drm/xe/xe_svm.c                        |    3 +-
>  drivers/gpu/drm/xe/xe_sync.c                       |   95 +-
>  drivers/gpu/drm/xe/xe_sync.h                       |    3 +
>  drivers/gpu/drm/xe/xe_sync_types.h                 |    3 +
>  drivers/gpu/drm/xe/xe_tlb_inval_job.c              |   31 +-
>  drivers/gpu/drm/xe/xe_tlb_inval_job.h              |    5 +-
>  drivers/gpu/drm/xe/xe_trace.h                      |   23 +
>  drivers/gpu/drm/xe/xe_validation.h                 |    8 +-
>  drivers/gpu/drm/xe/xe_vm.c                         |  101 +-
>  drivers/gpu/drm/xe/xe_vm_types.h                   |    6 +-
>  drivers/gpu/drm/xe/xe_vram.c                       |   26 +-
>  drivers/gpu/drm/xe/xe_wa.c                         |    7 +
>  include/drm/intel/pciids.h                         |    2 +-
>  97 files changed, 6762 insertions(+), 1751 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.=
c
>  delete mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.c
>  delete mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guard.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h
