Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FCD281ACC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 20:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426806E9C2;
	Fri,  2 Oct 2020 18:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E841E6E9BF;
 Fri,  2 Oct 2020 18:24:10 +0000 (UTC)
IronPort-SDR: Atzydlap39mQ0DMev8e88r220oBoVPJjG9duhem9bpDq8QY/bonWhuAxHVJoc47GHcG9sGCCuc
 5Iz0yjHfNOcA==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="143042257"
X-IronPort-AV: E=Sophos;i="5.77,328,1596524400"; d="scan'208";a="143042257"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 11:24:10 -0700
IronPort-SDR: QyS0U/EEq67VPlhDEd8EmIUWAzbCd+my57cYX+7WgshhnEJrb/xbZQ8FAeaALuWWBBqDTpooWw
 uzrQ9T8b3UJw==
X-IronPort-AV: E=Sophos;i="5.77,328,1596524400"; d="scan'208";a="342052510"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 11:24:10 -0700
Date: Fri, 2 Oct 2020 14:26:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20201002182610.GA2204465@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
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

Hi Dave and Daniel,

Here goes our first next-fixes. Please be aware this includes
both drm-intel-next and drm-intel-gt-next.

Also, most of patches from drm-intel-gt-next were accumulated
for not being part of current drm-intel-fixes flow while we
are defining the new split and flow.

So, there are many important fixes for the next and current release
and also for previous stable branches.

drm-intel-next-fixes-2020-10-02:

Thanks,
Rodrigo.

Propagated from drm-intel-next-queued:
- Fix CRTC state checker (Ville)

Propated from drm-intel-gt-next:
- Avoid implicit vmpa for highmem on 32b (Chris)
- Prevent PAT attriutes for writecombine if CPU doesn't support PAT (Chris)
- Clear the buffer pool age before use. (Chris)
- Fix error code (Dan)
- Break up error capture compression loops (Chris)
- Fix uninitialized variable in context_create_request (Maarten)
- Check for errors on i915_vm_alloc_pt_stash to avoid NULL dereference (Mat=
t)
- Serialize debugfs i915_gem_objects with ctx->mutex (Chris)
- Fix a rebase mistake caused during drm-intel-gt-next creation (Chris)
- Hold request reference for canceling an active context (Chris)
- Heartbeats fixes (Chris)
- Use usigned during batch copies (Chris)
The following changes since commit 32e4d9df60f71d641fbe628a9afbe2f44d7e9a37:

  agp: use semicolons rather than commas to separate statements (2020-09-28=
 06:06:52 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-202=
0-10-02

for you to fetch changes up to c60b93cd4862d108214a14e655358ea714d7a12a:

  drm/i915: Avoid mixing integer types during batch copies (2020-09-30 14:2=
4:54 -0400)

----------------------------------------------------------------
Propagated from drm-intel-next-queued:
- Fix CRTC state checker (Ville)

Propated from drm-intel-gt-next:
- Avoid implicit vmpa for highmem on 32b (Chris)
- Prevent PAT attriutes for writecombine if CPU doesn't support PAT (Chris)
- Clear the buffer pool age before use. (Chris)
- Fix error code (Dan)
- Break up error capture compression loops (Chris)
- Fix uninitialized variable in context_create_request (Maarten)
- Check for errors on i915_vm_alloc_pt_stash to avoid NULL dereference (Mat=
t)
- Serialize debugfs i915_gem_objects with ctx->mutex (Chris)
- Fix a rebase mistake caused during drm-intel-gt-next creation (Chris)
- Hold request reference for canceling an active context (Chris)
- Heartbeats fixes (Chris)
- Use usigned during batch copies (Chris)

----------------------------------------------------------------
Chris Wilson (11):
      drm/i915/gem: Avoid implicit vmap for highmem on x86-32
      drm/i915/gem: Prevent using pgprot_writecombine() if PAT is not suppo=
rted
      drm/i915/gt: Clear the buffer pool age before use
      drm/i915: Break up error capture compression loops with cond_resched()
      drm/i915/gem: Serialise debugfs i915_gem_objects with ctx->mutex
      drm/i915: Redo "Remove i915_request.lock requirement for execution ca=
llbacks"
      drm/i915/gem: Hold request reference for canceling an active context
      drm/i915: Cancel outstanding work after disabling heartbeats on an en=
gine
      drm/i915/gt: Always send a pulse down the engine after disabling hear=
tbeat
      drm/i915/gem: Always test execution status on closing the context
      drm/i915: Avoid mixing integer types during batch copies

Dan Carpenter (1):
      drm/i915: Fix an error code i915_gem_object_copy_blt()

Maarten Lankhorst (1):
      drm/i915: Fix uninitialised variable in intel_context_create_request.

Matthew Auld (1):
      drm/i915: check i915_vm_alloc_pt_stash for errors

Ville Syrj=E4l=E4 (1):
      drm/i915: Fix state checker hw.active/hw.enable readout

 drivers/gpu/drm/i915/display/intel_display.c     |  15 ++--
 drivers/gpu/drm/i915/gem/i915_gem_context.c      |  73 +++++++---------
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c   |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c   |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c        |  30 ++++++-
 drivers/gpu/drm/i915/gt/intel_context.c          |   1 +
 drivers/gpu/drm/i915/gt/intel_engine.h           |   9 ++
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 106 ++++++++++++++-----=
----
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c   |   2 +
 drivers/gpu/drm/i915/i915_cmd_parser.c           |  10 +--
 drivers/gpu/drm/i915/i915_debugfs.c              |   2 +
 drivers/gpu/drm/i915/i915_drv.h                  |   4 +-
 drivers/gpu/drm/i915/i915_gpu_error.c            |   3 +
 drivers/gpu/drm/i915/i915_request.c              |  17 ++--
 drivers/gpu/drm/i915/i915_vma.c                  |   8 +-
 15 files changed, 175 insertions(+), 114 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
