Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918BA34A7EC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 14:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5096F3C6;
	Fri, 26 Mar 2021 13:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C3B6F3C9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 13:16:12 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id x13so5592695wrs.9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 06:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=sJjzEKEFCSgNWQwDFxAKD0nT75YoJFoSXLvecMXitls=;
 b=N4rxw3RmdKBEM7LMYR7N+r3Z3e8xlrVOOhSIkxhb43AnzaC+gt92Rm7ILq5N9GIwFS
 Ipm26UDT2xLxyarlNS4G8AOYZGvQxwRZbIvEs82cEa/0slwunFUsAes0a6D5ZVJtwP82
 NWTH8QCLuxQdSVUsawJTbrW0FADITQ84M7NbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=sJjzEKEFCSgNWQwDFxAKD0nT75YoJFoSXLvecMXitls=;
 b=dbdqzdCDPb5YbYJXa8N5FgXBQsGR0FIbiIqMEq4YN3hu8lqjJtzOTkW0HGOmmg5nvx
 NaF7etlQb0Kw6SYr3cQFnjVMnl4PgUAh3dKY7K7rNoANhBlW98Fc9Sh5kQErHYzDWRlp
 TkZyHFNu3rBgtJL+rrJmJz8aeOleehdg9kyQ22DT3ZneZxRIETLTEaf7pFhl5i1Umof/
 B/pXQ5OLTdH6yF+SWmGHZxWAVxl+8sonLeLqOMrFYARJYCp3zcynP3GZPPhzgyCDaqSf
 aJMSEZyXpI0zN+ruzMH3yAwQB3N229kwXvY3NTbSLA0ahYGFOlZnbtM983vrGrzmLG7z
 vi2g==
X-Gm-Message-State: AOAM532cff/0RJvnaXiprvJ3kXBBx+W7T4D3opIloC0rQDrRdkkkPAiv
 8JDqY2EVNbB/ZEXTTHuPuJXhcQ==
X-Google-Smtp-Source: ABdhPJzWPE3BRVUzGK/4EGtzt/8rCy4CCFMEBTl0a3FlQS9lbNzmytzvZfDmaST1oCp+3uuSSFX0dg==
X-Received: by 2002:a5d:4203:: with SMTP id n3mr14353686wrq.116.1616764571320; 
 Fri, 26 Mar 2021 06:16:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i3sm12009685wra.66.2021.03.26.06.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 06:16:10 -0700 (PDT)
Date: Fri, 26 Mar 2021 14:16:04 +0100
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] topic/i915-gem-next
Message-ID: <YF24MHoOSjpKFEXA@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

topic/i915-gem-next-2021-03-26:
special i915-gem-next pull as requested

- Conversion to dma_resv_locking, obj->mm.lock is gone (Maarten, with
  help from Thomas Hellstr=F6m)
- watchdog (Tvrtko, one patch to cancel individual request from Chris)
- legacy ioctl cleanup (Jason+Ashutosh)
- i915-gem TODO and RFC process doc (me)
- i915_ prefix for vma_lookup (Liam Howlett) just because I spotted it
  and put it in here too

After this it's back to normal drm-intel-gt-next pull request flow.

The rough plan we discussed somewhat ad-hoc with Jani&Rodrigo (Joonas was
out this week, but back next) is that they send out a pull with what's
there right now. Then once both this branch here and the -gt-next pull are
in drm-next they will backmerge, and the -gt-next tree is open for
business again.

Ofc new rules apply, anything that lands in there should be cc: dri-devel
and reviewed there, but I think that's working fairly well already.

Jani/Rodrigo/Joonas, can you pls send out internal mail once that's done
since I'm on vacation next week?

Also I want to thank Maarten for sticking around for well over a year with
the dma_resv locking rework, it's a huge thing, tons of work, but finally
we have it merged.

Cheers, Daniel

The following changes since commit 06debd6e1b28029e6e77c41e59a162868f377897:

  Merge tag 'drm-intel-next-2021-03-16' of git://anongit.freedesktop.org/dr=
m/drm-intel into drm-next (2021-03-18 08:06:34 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/topic/i915-gem-next-2021-03-26

for you to fetch changes up to e1a5e6a8c48bf99ea374fb3e535661cfe226bca4:

  drm/doc: Add RFC section (2021-03-26 09:24:39 +0100)

----------------------------------------------------------------
special i915-gem-next pull as requested

- Conversion to dma_resv_locking, obj->mm.lock is gone (Maarten, with
  help from Thomas Hellstr=F6m)
- watchdog (Tvrtko, one patch to cancel individual request from Chris)
- legacy ioctl cleanup (Jason+Ashutosh)
- i915-gem TODO and RFC process doc (me)
- i915_ prefix for vma_lookup (Liam Howlett) just because I spotted it
  and put it in here too

----------------------------------------------------------------
Ashutosh Dixit (1):
      drm/i915: Disable pread/pwrite ioctl's for future platforms (v3)

Chris Wilson (1):
      drm/i915: Individual request cancellation

Daniel Vetter (2):
      drm/i915: add gem/gt TODO
      drm/doc: Add RFC section

Jason Ekstrand (2):
      drm/i915/gem: Drop legacy execbuffer support (v2)
      drm/i915/gem: Drop relocation support on all new hardware (v6)

Liam Howlett (1):
      i915_vma: Rename vma_lookup to i915_vma_lookup

Maarten Lankhorst (62):
      drm/i915: Do not share hwsp across contexts any more, v8.
      drm/i915: Pin timeline map after first timeline pin, v4.
      drm/i915: Move cmd parser pinning to execbuffer
      drm/i915: Add missing -EDEADLK handling to execbuf pinning, v2.
      drm/i915: Ensure we hold the object mutex in pin correctly.
      drm/i915: Add gem object locking to madvise.
      drm/i915: Move HAS_STRUCT_PAGE to obj->flags
      drm/i915: Rework struct phys attachment handling
      drm/i915: Convert i915_gem_object_attach_phys() to ww locking, v2.
      drm/i915: make lockdep slightly happier about execbuf.
      drm/i915: Disable userptr pread/pwrite support.
      drm/i915: No longer allow exporting userptr through dma-buf
      drm/i915: Reject more ioctls for userptr, v2.
      drm/i915: Reject UNSYNCHRONIZED for userptr, v2.
      drm/i915: Make compilation of userptr code depend on MMU_NOTIFIER.
      drm/i915: Fix userptr so we do not have to worry about obj->mm.lock, =
v7.
      drm/i915: Flatten obj->mm.lock
      drm/i915: Populate logical context during first pin.
      drm/i915: Make ring submission compatible with obj->mm.lock removal, =
v2.
      drm/i915: Handle ww locking in init_status_page
      drm/i915: Rework clflush to work correctly without obj->mm.lock.
      drm/i915: Pass ww ctx to intel_pin_to_display_plane
      drm/i915: Add object locking to vm_fault_cpu
      drm/i915: Move pinning to inside engine_wa_list_verify()
      drm/i915: Take reservation lock around i915_vma_pin.
      drm/i915: Make lrc_init_wa_ctx compatible with ww locking, v3.
      drm/i915: Make __engine_unpark() compatible with ww locking.
      drm/i915: Take obj lock around set_domain ioctl
      drm/i915: Defer pin calls in buffer pool until first use by caller.
      drm/i915: Fix pread/pwrite to work with new locking rules.
      drm/i915: Fix workarounds selftest, part 1
      drm/i915: Add igt_spinner_pin() to allow for ww locking around spinne=
r.
      drm/i915: Add ww locking around vm_access()
      drm/i915: Increase ww locking for perf.
      drm/i915: Lock ww in ucode objects correctly
      drm/i915: Add ww locking to dma-buf ops, v2.
      drm/i915: Add missing ww lock in intel_dsb_prepare.
      drm/i915: Fix ww locking in shmem_create_from_object
      drm/i915: Use a single page table lock for each gtt.
      drm/i915/selftests: Prepare huge_pages testcases for obj->mm.lock rem=
oval.
      drm/i915/selftests: Prepare client blit for obj->mm.lock removal.
      drm/i915/selftests: Prepare coherency tests for obj->mm.lock removal.
      drm/i915/selftests: Prepare context tests for obj->mm.lock removal.
      drm/i915/selftests: Prepare dma-buf tests for obj->mm.lock removal.
      drm/i915/selftests: Prepare execbuf tests for obj->mm.lock removal.
      drm/i915/selftests: Prepare mman testcases for obj->mm.lock removal.
      drm/i915/selftests: Prepare object tests for obj->mm.lock removal.
      drm/i915/selftests: Prepare object blit tests for obj->mm.lock remova=
l.
      drm/i915/selftests: Prepare igt_gem_utils for obj->mm.lock removal
      drm/i915/selftests: Prepare context selftest for obj->mm.lock removal
      drm/i915/selftests: Prepare hangcheck for obj->mm.lock removal
      drm/i915/selftests: Prepare execlists and lrc selftests for obj->mm.l=
ock removal
      drm/i915/selftests: Prepare mocs tests for obj->mm.lock removal
      drm/i915/selftests: Prepare ring submission for obj->mm.lock removal
      drm/i915/selftests: Prepare timeline tests for obj->mm.lock removal
      drm/i915/selftests: Prepare i915_request tests for obj->mm.lock remov=
al
      drm/i915/selftests: Prepare memory region tests for obj->mm.lock remo=
val
      drm/i915/selftests: Prepare cs engine tests for obj->mm.lock removal
      drm/i915/selftests: Prepare gtt tests for obj->mm.lock removal
      drm/i915: Finally remove obj->mm.lock.
      drm/i915: Keep userpointer bindings if seqcount is unchanged, v2.
      drm/i915: Move gt_revoke() slightly

Thomas Hellstr=F6m (1):
      drm/i915: Prepare for obj->mm.lock removal, v2.

Tvrtko Ursulin (6):
      drm/i915: Extract active lookup engine to a helper
      drm/i915: Restrict sentinel requests further
      drm/i915: Handle async cancellation in sentinel assert
      drm/i915: Request watchdog infrastructure
      drm/i915: Fail too long user submissions by default
      drm/i915: Allow configuring default request expiry via modparam

 Documentation/gpu/index.rst                        |   1 +
 Documentation/gpu/rfc/index.rst                    |  17 +
 drivers/gpu/drm/i915/Kconfig.profile               |  14 +
 drivers/gpu/drm/i915/Makefile                      |   1 -
 drivers/gpu/drm/i915/TODO.txt                      |  41 +
 drivers/gpu/drm/i915/display/intel_display.c       |  71 +-
 drivers/gpu/drm/i915/display/intel_display.h       |   2 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   2 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |  34 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |  15 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  73 +-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |  64 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |  72 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 335 +++++---
 drivers/gpu/drm/i915/gem/i915_gem_fence.c          |  95 ---
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h         |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  35 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |  96 ++-
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c     |   6 +
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  23 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          | 109 ++-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           | 110 ++-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.h         |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |  39 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |  39 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.h       |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |  14 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        | 902 ++++++++---------=
----
 .../gpu/drm/i915/gem/selftests/huge_gem_object.c   |   4 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |  38 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |   8 +-
 .../drm/i915/gem/selftests/i915_gem_coherency.c    |  14 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  10 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |   2 +-
 .../drm/i915/gem/selftests/i915_gem_execbuffer.c   |   2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  21 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_object.c   |   2 +-
 .../drm/i915/gem/selftests/i915_gem_object_blt.c   |   6 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c |  10 +-
 drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c |   2 +-
 drivers/gpu/drm/i915/gt/gen2_engine_cs.c           |   2 +-
 drivers/gpu/drm/i915/gt/gen6_engine_cs.c           |   8 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |  13 +-
 drivers/gpu/drm/i915/gt/intel_context_param.h      |  11 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |   4 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  38 +-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |   1 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |   4 +
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  49 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.h   |   2 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  10 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   3 +
 drivers/gpu/drm/i915/gt/intel_gt.h                 |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |  47 +-
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.h     |   5 +
 .../gpu/drm/i915/gt/intel_gt_buffer_pool_types.h   |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_requests.c        |  28 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |  11 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c                |  52 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   8 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  49 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |   3 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.c        |   2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   9 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    | 184 +++--
 drivers/gpu/drm/i915/gt/intel_timeline.c           | 426 +++-------
 drivers/gpu/drm/i915/gt/intel_timeline.h           |   2 +
 drivers/gpu/drm/i915/gt/intel_timeline_types.h     |  17 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  10 +-
 drivers/gpu/drm/i915/gt/mock_engine.c              |  22 +-
 drivers/gpu/drm/i915/gt/selftest_context.c         |   4 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |   9 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |  23 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |   8 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |  18 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c            |   5 +-
 drivers/gpu/drm/i915/gt/selftest_ring_submission.c |   4 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        | 177 ++--
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |  82 +-
 drivers/gpu/drm/i915/gt/shmem_utils.c              |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |   2 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |   2 +-
 drivers/gpu/drm/i915/i915_active.c                 |  20 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c             | 104 +--
 drivers/gpu/drm/i915/i915_debugfs.c                |   4 +-
 drivers/gpu/drm/i915/i915_drv.c                    |   2 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  18 +-
 drivers/gpu/drm/i915/i915_gem.c                    | 258 +++---
 drivers/gpu/drm/i915/i915_gem_gtt.c                |   2 +-
 drivers/gpu/drm/i915/i915_memcpy.c                 |   2 +-
 drivers/gpu/drm/i915/i915_memcpy.h                 |   2 +-
 drivers/gpu/drm/i915/i915_params.c                 |   5 +
 drivers/gpu/drm/i915/i915_params.h                 |   1 +
 drivers/gpu/drm/i915/i915_perf.c                   |  56 +-
 drivers/gpu/drm/i915/i915_request.c                | 133 ++-
 drivers/gpu/drm/i915/i915_request.h                |  47 +-
 drivers/gpu/drm/i915/i915_selftest.h               |   2 +
 drivers/gpu/drm/i915/i915_vma.c                    |  30 +-
 drivers/gpu/drm/i915/i915_vma.h                    |  20 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |  94 ++-
 drivers/gpu/drm/i915/selftests/i915_request.c      | 211 ++++-
 drivers/gpu/drm/i915/selftests/igt_spinner.c       | 136 ++--
 drivers/gpu/drm/i915/selftests/igt_spinner.h       |   5 +
 .../gpu/drm/i915/selftests/intel_memory_region.c   |  18 +-
 drivers/gpu/drm/i915/selftests/mock_region.c       |   4 +-
 include/uapi/drm/i915_drm.h                        |   1 +
 117 files changed, 2749 insertions(+), 2165 deletions(-)
 create mode 100644 Documentation/gpu/rfc/index.rst
 create mode 100644 drivers/gpu/drm/i915/TODO.txt
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_fence.c

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
