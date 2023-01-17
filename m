Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1364E66E32C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6186110E57F;
	Tue, 17 Jan 2023 16:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15ECE10E57D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 16:12:44 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id s21so1542663edi.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 08:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i7mDOxAjSFUe2nD/WdjW//2gllqVfjGFZtHzqP1qrPU=;
 b=ARsk4YyzH1XWOcW9foVQhxSLwjekEwFi0CU4BS2ljwand1+NidUGVxZk4hVs6AVCwK
 rT2JX8JwNldJu4mnud2UIjOIhjA93uCOOaEmpBMudj/yZegoBF44shTDNxxFMzQypwPI
 jqDVyZFCbQCtwtD+N+xoQyt9/9U2tZbafiKEFGK2t8/eTiy9Y5Hq1CAO+HcM5DfVPzkW
 hzpm12XoUnmDrbo78sYqGwHy2ZLVt3nHxP3bgdEASrNrNwJH4THmjlmjhFBsoYYWXoAS
 y5qQ3hIX4fxgttWwCxGFVd/ImzPpcdNyHVfnjM2rY54ex9gkKGefhzK5OrioNcu1+PuB
 dqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i7mDOxAjSFUe2nD/WdjW//2gllqVfjGFZtHzqP1qrPU=;
 b=QEQsqYv1kqUjK9cuzFb4DImkWl7a68klZ1jAH7XXPkvNxCYgC49mUUDM5jpzvKAnLc
 Kd0jDgySLGUuoRn6/wdOBgUGBqSGAiUOSACXh0iu9dqAitSkoHA4VYx533ku61x+Rguw
 tjO1AeSN5Ms25M43YN1AAaJ4ZgO738xPWlCwzz204Q+7MvlfJh6qHNUi8tE36GnLih/8
 hpjXp9n9xqkMPqtNioxKt0bUYSB9kdMRmHSoXlzXs/4bteaFM3TWYpXHx7BwfJZb6BbI
 OrSTWZDqVW47nlMVyS8CaZaDk1rIwkuIyCZbPNm4j1q/NeysyznVFDKq8lbWjBhsSBXB
 dhEw==
X-Gm-Message-State: AFqh2kp5nomIaEghS86JxQRqOuw7xdvdj16zw1vXfPumgcTnpbZ4FIoB
 OlWMJSEXXQ2n33xvJJBxvMxgHqbd6Oe9sOZWw/eUXWrmmJhP7T2Y
X-Google-Smtp-Source: AMrXdXulPTqjnGklVa3vnH/aGMk9K3TaftZdK+rt0VPGq/2xrDU6H8E5IidrAsaVs+N6KSQ0qaBmjuSbcht321x/rAA=
X-Received: by 2002:a05:6402:414f:b0:49d:f456:7969 with SMTP id
 x15-20020a056402414f00b0049df4567969mr309746eda.329.1673971962345; Tue, 17
 Jan 2023 08:12:42 -0800 (PST)
MIME-Version: 1.0
References: <20221222222127.34560-1-matthew.brost@intel.com>
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 17 Jan 2023 10:12:30 -0600
Message-ID: <CAOFGe96d4BFMhGrBmNhu78VzQTgdwCCAKhe424LbXnBT5R528w@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC PATCH 00/20] Initial Xe driver submission
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: multipart/alternative; boundary="0000000000002e13af05f277f8a7"
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000002e13af05f277f8a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2022 at 4:29 PM Matthew Brost <matthew.brost@intel.com>
wrote:

> Hello,
>
> This is a submission for Xe, a new driver for Intel GPUs that supports bo=
th
> integrated and discrete platforms starting with Tiger Lake (first platfor=
m
> with
> Intel Xe Architecture). The intention of this new driver is to have a
> fresh base
> to work from that is unencumbered by older platforms, whilst also taking
> the
> opportunity to rearchitect our driver to increase sharing across the drm
> subsystem, both leveraging and allowing us to contribute more towards oth=
er
> shared components like TTM and drm/scheduler. The memory model is based o=
n
> VM
> bind which is similar to the i915 implementation. Likewise the execbuf
> implementation for Xe is very similar to execbuf3 in the i915 [1].
>
> The code is at a stage where it is already functional and has experimenta=
l
> support for multiple platforms starting from Tiger Lake, with initial
> support
> implemented in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as
> well
> as in NEO (for OpenCL and Level0). A Mesa MR has been posted [2] and NEO
> implementation will be released publicly early next year. We also have a
> suite
> of IGTs for XE that will appear on the IGT list shortly.
>
> It has been built with the assumption of supporting multiple architecture=
s
> from
> the get-go, right now with tests running both on X86 and ARM hosts. And w=
e
> intend to continue working on it and improving on it as part of the kerne=
l
> community upstream.
>
> The new Xe driver leverages a lot from i915 and work on i915 continues as
> we
> ready Xe for production throughout 2023.
>
> As for display, the intent is to share the display code with the i915
> driver so
> that there is maximum reuse there. Currently this is being done by
> compiling the
> display code twice, but alternatives to that are under consideration and
> we want
> to have more discussion on what the best final solution will look like
> over the
> next few months. Right now, work is ongoing in refactoring the display
> codebase
> to remove as much as possible any unnecessary dependencies on i915
> specific data
> structures there..
>
> We currently have 2 submission backends, execlists and GuC. The execlist =
is
> meant mostly for testing and is not fully functional while GuC backend is
> fully
> functional. As with the i915 and GuC submission, in Xe the GuC firmware i=
s
> required and should be placed in /lib/firmware/xe.
>
> The GuC firmware can be found in the below location:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.g=
it/tree/i915
>
> The easiest way to setup firmware is:
> cp -r /lib/firmware/i915 /lib/firmware/xe
>
> The code has been organized such that we have all patches that touch area=
s
> outside of drm/xe first for review, and then the actual new driver in a
> separate
> commit. The code which is outside of drm/xe is included in this RFC while
> drm/xe is not due to the size of the commit. The drm/xe is code is
> available in
> a public repo listed below.
>
> Xe driver commit:
>
> https://cgit.freedesktop.org/drm/drm-xe/commit/?h=3Ddrm-xe-next&id=3D9cb0=
16ebbb6a275f57b1cb512b95d5a842391ad7


Drive-by comment here because I don't see any actual xe patches on the list=
:

You probably want to drop DRM_XE_SYNC_DMA_BUF from the uAPI.  Now that
we've landed the new dma-buf ioctls for sync_file import/export, there's
really no reason to have it as part of submit.  Dropping it should also
make locking a tiny bit easier.

--Jason



> Xe kernel repo:
> https://cgit.freedesktop.org/drm/drm-xe/
>
> There's a lot of work still to happen on Xe but we're very excited about
> it and
> wanted to share it early and welcome feedback and discussion.
>
> Cheers,
> Matthew Brost
>
> [1] https://patchwork.freedesktop.org/series/105879/
> [2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20418
>
> Maarten Lankhorst (12):
>   drm/amd: Convert amdgpu to use suballocation helper.
>   drm/radeon: Use the drm suballocation manager implementation.
>   drm/i915: Remove gem and overlay frontbuffer tracking
>   drm/i915/display: Neuter frontbuffer tracking harder
>   drm/i915/display: Add more macros to remove all direct calls to uncore
>   drm/i915/display: Remove all uncore mmio accesses in favor of intel_de
>   drm/i915: Rename find_section to find_bdb_section
>   drm/i915/regs: Set DISPLAY_MMIO_BASE to 0 for xe
>   drm/i915/display: Fix a use-after-free when intel_edp_init_connector
>     fails
>   drm/i915/display: Remaining changes to make xe compile
>   sound/hda: Allow XE as i915 replacement for sound
>   mei/hdcp: Also enable for XE
>
> Matthew Brost (5):
>   drm/sched: Convert drm scheduler to use a work queue rather than
>     kthread
>   drm/sched: Add generic scheduler message interface
>   drm/sched: Start run wq before TDR in drm_sched_start
>   drm/sched: Submit job before starting TDR
>   drm/sched: Add helper to set TDR timeout
>
> Thomas Hellstr=C3=B6m (3):
>   drm/suballoc: Introduce a generic suballocation manager
>   drm: Add a gpu page-table walker helper
>   drm/ttm: Don't print error message if eviction was interrupted
>
>  drivers/gpu/drm/Kconfig                       |   5 +
>  drivers/gpu/drm/Makefile                      |   4 +
>  drivers/gpu/drm/amd/amdgpu/Kconfig            |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  26 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  14 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  12 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        |   5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  23 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |   3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c        | 320 +-----------------
>  drivers/gpu/drm/drm_pt_walk.c                 | 159 +++++++++
>  drivers/gpu/drm/drm_suballoc.c                | 301 ++++++++++++++++
>  drivers/gpu/drm/i915/Makefile                 |   2 +-
>  drivers/gpu/drm/i915/display/hsw_ips.c        |   7 +-
>  drivers/gpu/drm/i915/display/i9xx_plane.c     |   1 +
>  drivers/gpu/drm/i915/display/intel_atomic.c   |   2 +
>  .../gpu/drm/i915/display/intel_atomic_plane.c |  25 +-
>  .../gpu/drm/i915/display/intel_backlight.c    |   2 +-
>  drivers/gpu/drm/i915/display/intel_bios.c     |  71 ++--
>  drivers/gpu/drm/i915/display/intel_bw.c       |  36 +-
>  drivers/gpu/drm/i915/display/intel_cdclk.c    |  68 ++--
>  drivers/gpu/drm/i915/display/intel_color.c    |   1 +
>  drivers/gpu/drm/i915/display/intel_crtc.c     |  14 +-
>  drivers/gpu/drm/i915/display/intel_cursor.c   |  14 +-
>  drivers/gpu/drm/i915/display/intel_de.h       |  38 +++
>  drivers/gpu/drm/i915/display/intel_display.c  | 155 +++++++--
>  drivers/gpu/drm/i915/display/intel_display.h  |   9 +-
>  .../gpu/drm/i915/display/intel_display_core.h |   5 +-
>  .../drm/i915/display/intel_display_debugfs.c  |   8 +
>  .../drm/i915/display/intel_display_power.c    |  40 ++-
>  .../drm/i915/display/intel_display_power.h    |   6 +
>  .../i915/display/intel_display_power_map.c    |   7 +
>  .../i915/display/intel_display_power_well.c   |  24 +-
>  .../drm/i915/display/intel_display_reg_defs.h |   4 +
>  .../drm/i915/display/intel_display_trace.h    |   6 +
>  .../drm/i915/display/intel_display_types.h    |  32 +-
>  drivers/gpu/drm/i915/display/intel_dmc.c      |  17 +-
>  drivers/gpu/drm/i915/display/intel_dp.c       |  11 +-
>  drivers/gpu/drm/i915/display/intel_dp_aux.c   |   6 +
>  drivers/gpu/drm/i915/display/intel_dpio_phy.c |   9 +-
>  drivers/gpu/drm/i915/display/intel_dpio_phy.h |  15 +
>  drivers/gpu/drm/i915/display/intel_dpll.c     |   8 +-
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   4 +
>  drivers/gpu/drm/i915/display/intel_drrs.c     |   1 +
>  drivers/gpu/drm/i915/display/intel_dsb.c      | 124 +++++--
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  26 +-
>  drivers/gpu/drm/i915/display/intel_fb.c       | 108 ++++--
>  drivers/gpu/drm/i915/display/intel_fb_pin.c   |   6 -
>  drivers/gpu/drm/i915/display/intel_fbc.c      |  49 ++-
>  drivers/gpu/drm/i915/display/intel_fbdev.c    | 108 +++++-
>  .../gpu/drm/i915/display/intel_frontbuffer.c  | 103 +-----
>  .../gpu/drm/i915/display/intel_frontbuffer.h  |  67 +---
>  drivers/gpu/drm/i915/display/intel_gmbus.c    |   2 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     |   9 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |   1 -
>  .../gpu/drm/i915/display/intel_lpe_audio.h    |   8 +
>  .../drm/i915/display/intel_modeset_setup.c    |  11 +-
>  drivers/gpu/drm/i915/display/intel_opregion.c |   2 +-
>  drivers/gpu/drm/i915/display/intel_overlay.c  |  14 -
>  .../gpu/drm/i915/display/intel_pch_display.h  |  16 +
>  .../gpu/drm/i915/display/intel_pch_refclk.h   |   8 +
>  drivers/gpu/drm/i915/display/intel_pipe_crc.c |   1 +
>  .../drm/i915/display/intel_plane_initial.c    |   3 +-
>  drivers/gpu/drm/i915/display/intel_psr.c      |   1 +
>  drivers/gpu/drm/i915/display/intel_sprite.c   |  21 ++
>  drivers/gpu/drm/i915/display/intel_vbt_defs.h |   2 +-
>  drivers/gpu/drm/i915/display/intel_vga.c      |   5 +
>  drivers/gpu/drm/i915/display/skl_scaler.c     |   2 +
>  .../drm/i915/display/skl_universal_plane.c    |  52 ++-
>  drivers/gpu/drm/i915/display/skl_watermark.c  |  25 +-
>  drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   4 -
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c    |   7 -
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 -
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  25 --
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  22 --
>  drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   4 -
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   3 +-
>  drivers/gpu/drm/i915/i915_driver.c            |   1 +
>  drivers/gpu/drm/i915/i915_gem.c               |   8 -
>  drivers/gpu/drm/i915/i915_gem_gtt.c           |   1 -
>  drivers/gpu/drm/i915/i915_reg_defs.h          |   8 +
>  drivers/gpu/drm/i915/i915_vma.c               |  12 -
>  drivers/gpu/drm/radeon/radeon.h               |  55 +--
>  drivers/gpu/drm/radeon/radeon_ib.c            |  12 +-
>  drivers/gpu/drm/radeon/radeon_object.h        |  25 +-
>  drivers/gpu/drm/radeon/radeon_sa.c            | 314 ++---------------
>  drivers/gpu/drm/radeon/radeon_semaphore.c     |   6 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 182 +++++++---
>  drivers/gpu/drm/ttm/ttm_bo.c                  |   3 +-
>  drivers/misc/mei/hdcp/Kconfig                 |   2 +-
>  drivers/misc/mei/hdcp/mei_hdcp.c              |   3 +-
>  include/drm/drm_pt_walk.h                     | 161 +++++++++
>  include/drm/drm_suballoc.h                    | 112 ++++++
>  include/drm/gpu_scheduler.h                   |  41 ++-
>  sound/hda/hdac_i915.c                         |  17 +-
>  sound/pci/hda/hda_intel.c                     |  56 +--
>  sound/soc/intel/avs/core.c                    |  13 +-
>  sound/soc/sof/intel/hda.c                     |   7 +-
>  98 files changed, 2076 insertions(+), 1325 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_pt_walk.c
>  create mode 100644 drivers/gpu/drm/drm_suballoc.c
>  create mode 100644 include/drm/drm_pt_walk.h
>  create mode 100644 include/drm/drm_suballoc.h
>
> --
> 2.37.3
>
>

--0000000000002e13af05f277f8a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Dec 22, 2022 at 4:29 PM Matthew Brost &lt;<a href=3D"mailto:=
matthew.brost@intel.com">matthew.brost@intel.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
This is a submission for Xe, a new driver for Intel GPUs that supports both=
<br>
integrated and discrete platforms starting with Tiger Lake (first platform =
with<br>
Intel Xe Architecture). The intention of this new driver is to have a fresh=
 base<br>
to work from that is unencumbered by older platforms, whilst also taking th=
e<br>
opportunity to rearchitect our driver to increase sharing across the drm<br=
>
subsystem, both leveraging and allowing us to contribute more towards other=
<br>
shared components like TTM and drm/scheduler. The memory model is based on =
VM<br>
bind which is similar to the i915 implementation. Likewise the execbuf<br>
implementation for Xe is very similar to execbuf3 in the i915 [1].<br>
<br>
The code is at a stage where it is already functional and has experimental<=
br>
support for multiple platforms starting from Tiger Lake, with initial suppo=
rt<br>
implemented in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as w=
ell<br>
as in NEO (for OpenCL and Level0). A Mesa MR has been posted [2] and NEO<br=
>
implementation will be released publicly early next year. We also have a su=
ite<br>
of IGTs for XE that will appear on the IGT list shortly.<br>
<br>
It has been built with the assumption of supporting multiple architectures =
from<br>
the get-go, right now with tests running both on X86 and ARM hosts. And we<=
br>
intend to continue working on it and improving on it as part of the kernel<=
br>
community upstream.<br>
<br>
The new Xe driver leverages a lot from i915 and work on i915 continues as w=
e<br>
ready Xe for production throughout 2023.<br>
<br>
As for display, the intent is to share the display code with the i915 drive=
r so<br>
that there is maximum reuse there. Currently this is being done by compilin=
g the<br>
display code twice, but alternatives to that are under consideration and we=
 want<br>
to have more discussion on what the best final solution will look like over=
 the<br>
next few months. Right now, work is ongoing in refactoring the display code=
base<br>
to remove as much as possible any unnecessary dependencies on i915 specific=
 data<br>
structures there..<br>
<br>
We currently have 2 submission backends, execlists and GuC. The execlist is=
<br>
meant mostly for testing and is not fully functional while GuC backend is f=
ully<br>
functional. As with the i915 and GuC submission, in Xe the GuC firmware is<=
br>
required and should be placed in /lib/firmware/xe.<br>
<br>
The GuC firmware can be found in the below location:<br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-f=
irmware.git/tree/i915" rel=3D"noreferrer" target=3D"_blank">https://git.ker=
nel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915</a><=
br>
<br>
The easiest way to setup firmware is:<br>
cp -r /lib/firmware/i915 /lib/firmware/xe<br>
<br>
The code has been organized such that we have all patches that touch areas<=
br>
outside of drm/xe first for review, and then the actual new driver in a sep=
arate<br>
commit. The code which is outside of drm/xe is included in this RFC while<b=
r>
drm/xe is not due to the size of the commit. The drm/xe is code is availabl=
e in<br>
a public repo listed below.<br>
<br>
Xe driver commit:<br>
<a href=3D"https://cgit.freedesktop.org/drm/drm-xe/commit/?h=3Ddrm-xe-next&=
amp;id=3D9cb016ebbb6a275f57b1cb512b95d5a842391ad7" rel=3D"noreferrer" targe=
t=3D"_blank">https://cgit.freedesktop.org/drm/drm-xe/commit/?h=3Ddrm-xe-nex=
t&amp;id=3D9cb016ebbb6a275f57b1cb512b95d5a842391ad7</a></blockquote><div><b=
r></div><div>Drive-by comment here because I don&#39;t see any actual xe pa=
tches on the list:</div><div><br></div><div>You probably want to drop DRM_X=
E_SYNC_DMA_BUF from the uAPI.=C2=A0 Now that we&#39;ve landed the new dma-b=
uf ioctls for sync_file import/export, there&#39;s really no reason to have=
 it as part of submit.=C2=A0 Dropping it should also make locking a tiny bi=
t easier.</div><div><br></div><div>--Jason</div><div><br></div><div>=C2=A0<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Xe kernel repo:<br>
<a href=3D"https://cgit.freedesktop.org/drm/drm-xe/" rel=3D"noreferrer" tar=
get=3D"_blank">https://cgit.freedesktop.org/drm/drm-xe/</a><br>
<br>
There&#39;s a lot of work still to happen on Xe but we&#39;re very excited =
about it and<br>
wanted to share it early and welcome feedback and discussion.<br>
<br>
Cheers,<br>
Matthew Brost<br>
<br>
[1] <a href=3D"https://patchwork.freedesktop.org/series/105879/" rel=3D"nor=
eferrer" target=3D"_blank">https://patchwork.freedesktop.org/series/105879/=
</a><br>
[2] <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20=
418" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/me=
sa/mesa/-/merge_requests/20418</a><br>
<br>
Maarten Lankhorst (12):<br>
=C2=A0 drm/amd: Convert amdgpu to use suballocation helper.<br>
=C2=A0 drm/radeon: Use the drm suballocation manager implementation.<br>
=C2=A0 drm/i915: Remove gem and overlay frontbuffer tracking<br>
=C2=A0 drm/i915/display: Neuter frontbuffer tracking harder<br>
=C2=A0 drm/i915/display: Add more macros to remove all direct calls to unco=
re<br>
=C2=A0 drm/i915/display: Remove all uncore mmio accesses in favor of intel_=
de<br>
=C2=A0 drm/i915: Rename find_section to find_bdb_section<br>
=C2=A0 drm/i915/regs: Set DISPLAY_MMIO_BASE to 0 for xe<br>
=C2=A0 drm/i915/display: Fix a use-after-free when intel_edp_init_connector=
<br>
=C2=A0 =C2=A0 fails<br>
=C2=A0 drm/i915/display: Remaining changes to make xe compile<br>
=C2=A0 sound/hda: Allow XE as i915 replacement for sound<br>
=C2=A0 mei/hdcp: Also enable for XE<br>
<br>
Matthew Brost (5):<br>
=C2=A0 drm/sched: Convert drm scheduler to use a work queue rather than<br>
=C2=A0 =C2=A0 kthread<br>
=C2=A0 drm/sched: Add generic scheduler message interface<br>
=C2=A0 drm/sched: Start run wq before TDR in drm_sched_start<br>
=C2=A0 drm/sched: Submit job before starting TDR<br>
=C2=A0 drm/sched: Add helper to set TDR timeout<br>
<br>
Thomas Hellstr=C3=B6m (3):<br>
=C2=A0 drm/suballoc: Introduce a generic suballocation manager<br>
=C2=A0 drm: Add a gpu page-table walker helper<br>
=C2=A0 drm/ttm: Don&#39;t print error message if eviction was interrupted<b=
r>
<br>
=C2=A0drivers/gpu/drm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0drivers/gpu/drm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 26 +-<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c=C2=A0 =C2=A0|=C2=A0 14 +-=
<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_device.c=C2=A0 =C2=A0 |=C2=A0 12 +-=
<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 +-<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_object.h=C2=A0 =C2=A0 |=C2=A0 23 +-=
<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A03 +-<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3=
20 +-----------------<br>
=C2=A0drivers/gpu/drm/drm_pt_walk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 159 +++++++++<br>
=C2=A0drivers/gpu/drm/drm_suballoc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 301 ++++++++++++++++<br>
=C2=A0drivers/gpu/drm/i915/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0drivers/gpu/drm/i915/display/hsw_ips.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A07 +-<br>
=C2=A0drivers/gpu/drm/i915/display/i9xx_plane.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
=C2=A0drivers/gpu/drm/i915/display/intel_atomic.c=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0.../gpu/drm/i915/display/intel_atomic_plane.c |=C2=A0 25 +-<br>
=C2=A0.../gpu/drm/i915/display/intel_backlight.c=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0drivers/gpu/drm/i915/display/intel_bios.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
71 ++--<br>
=C2=A0drivers/gpu/drm/i915/display/intel_bw.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 36 +-<br>
=C2=A0drivers/gpu/drm/i915/display/intel_cdclk.c=C2=A0 =C2=A0 |=C2=A0 68 ++=
--<br>
=C2=A0drivers/gpu/drm/i915/display/intel_color.c=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0drivers/gpu/drm/i915/display/intel_crtc.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
14 +-<br>
=C2=A0drivers/gpu/drm/i915/display/intel_cursor.c=C2=A0 =C2=A0|=C2=A0 14 +-=
<br>
=C2=A0drivers/gpu/drm/i915/display/intel_de.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 38 +++<br>
=C2=A0drivers/gpu/drm/i915/display/intel_display.c=C2=A0 | 155 +++++++--<br=
>
=C2=A0drivers/gpu/drm/i915/display/intel_display.h=C2=A0 |=C2=A0 =C2=A09 +-=
<br>
=C2=A0.../gpu/drm/i915/display/intel_display_core.h |=C2=A0 =C2=A05 +-<br>
=C2=A0.../drm/i915/display/intel_display_debugfs.c=C2=A0 |=C2=A0 =C2=A08 +<=
br>
=C2=A0.../drm/i915/display/intel_display_power.c=C2=A0 =C2=A0 |=C2=A0 40 ++=
-<br>
=C2=A0.../drm/i915/display/intel_display_power.h=C2=A0 =C2=A0 |=C2=A0 =C2=
=A06 +<br>
=C2=A0.../i915/display/intel_display_power_map.c=C2=A0 =C2=A0 |=C2=A0 =C2=
=A07 +<br>
=C2=A0.../i915/display/intel_display_power_well.c=C2=A0 =C2=A0|=C2=A0 24 +-=
<br>
=C2=A0.../drm/i915/display/intel_display_reg_defs.h |=C2=A0 =C2=A04 +<br>
=C2=A0.../drm/i915/display/intel_display_trace.h=C2=A0 =C2=A0 |=C2=A0 =C2=
=A06 +<br>
=C2=A0.../drm/i915/display/intel_display_types.h=C2=A0 =C2=A0 |=C2=A0 32 +-=
<br>
=C2=A0drivers/gpu/drm/i915/display/intel_dmc.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
17 +-<br>
=C2=A0drivers/gpu/drm/i915/display/intel_dp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 11 +-<br>
=C2=A0drivers/gpu/drm/i915/display/intel_dp_aux.c=C2=A0 =C2=A0|=C2=A0 =C2=
=A06 +<br>
=C2=A0drivers/gpu/drm/i915/display/intel_dpio_phy.c |=C2=A0 =C2=A09 +-<br>
=C2=A0drivers/gpu/drm/i915/display/intel_dpio_phy.h |=C2=A0 15 +<br>
=C2=A0drivers/gpu/drm/i915/display/intel_dpll.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A08 +-<br>
=C2=A0drivers/gpu/drm/i915/display/intel_dpll_mgr.c |=C2=A0 =C2=A04 +<br>
=C2=A0drivers/gpu/drm/i915/display/intel_drrs.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
=C2=A0drivers/gpu/drm/i915/display/intel_dsb.c=C2=A0 =C2=A0 =C2=A0 | 124 ++=
+++--<br>
=C2=A0drivers/gpu/drm/i915/display/intel_dsi_vbt.c=C2=A0 |=C2=A0 26 +-<br>
=C2=A0drivers/gpu/drm/i915/display/intel_fb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
08 ++++--<br>
=C2=A0drivers/gpu/drm/i915/display/intel_fb_pin.c=C2=A0 =C2=A0|=C2=A0 =C2=
=A06 -<br>
=C2=A0drivers/gpu/drm/i915/display/intel_fbc.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
49 ++-<br>
=C2=A0drivers/gpu/drm/i915/display/intel_fbdev.c=C2=A0 =C2=A0 | 108 +++++-<=
br>
=C2=A0.../gpu/drm/i915/display/intel_frontbuffer.c=C2=A0 | 103 +-----<br>
=C2=A0.../gpu/drm/i915/display/intel_frontbuffer.h=C2=A0 |=C2=A0 67 +---<br=
>
=C2=A0drivers/gpu/drm/i915/display/intel_gmbus.c=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0drivers/gpu/drm/i915/display/intel_hdcp.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A09 +-<br>
=C2=A0drivers/gpu/drm/i915/display/intel_hdmi.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A01 -<br>
=C2=A0.../gpu/drm/i915/display/intel_lpe_audio.h=C2=A0 =C2=A0 |=C2=A0 =C2=
=A08 +<br>
=C2=A0.../drm/i915/display/intel_modeset_setup.c=C2=A0 =C2=A0 |=C2=A0 11 +-=
<br>
=C2=A0drivers/gpu/drm/i915/display/intel_opregion.c |=C2=A0 =C2=A02 +-<br>
=C2=A0drivers/gpu/drm/i915/display/intel_overlay.c=C2=A0 |=C2=A0 14 -<br>
=C2=A0.../gpu/drm/i915/display/intel_pch_display.h=C2=A0 |=C2=A0 16 +<br>
=C2=A0.../gpu/drm/i915/display/intel_pch_refclk.h=C2=A0 =C2=A0|=C2=A0 =C2=
=A08 +<br>
=C2=A0drivers/gpu/drm/i915/display/intel_pipe_crc.c |=C2=A0 =C2=A01 +<br>
=C2=A0.../drm/i915/display/intel_plane_initial.c=C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +-<br>
=C2=A0drivers/gpu/drm/i915/display/intel_psr.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0drivers/gpu/drm/i915/display/intel_sprite.c=C2=A0 =C2=A0|=C2=A0 21 ++=
<br>
=C2=A0drivers/gpu/drm/i915/display/intel_vbt_defs.h |=C2=A0 =C2=A02 +-<br>
=C2=A0drivers/gpu/drm/i915/display/intel_vga.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A05 +<br>
=C2=A0drivers/gpu/drm/i915/display/skl_scaler.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +<br>
=C2=A0.../drm/i915/display/skl_universal_plane.c=C2=A0 =C2=A0 |=C2=A0 52 ++=
-<br>
=C2=A0drivers/gpu/drm/i915/display/skl_watermark.c=C2=A0 |=C2=A0 25 +-<br>
=C2=A0drivers/gpu/drm/i915/gem/i915_gem_clflush.c=C2=A0 =C2=A0|=C2=A0 =C2=
=A04 -<br>
=C2=A0drivers/gpu/drm/i915/gem/i915_gem_domain.c=C2=A0 =C2=A0 |=C2=A0 =C2=
=A07 -<br>
=C2=A0.../gpu/drm/i915/gem/i915_gem_execbuffer.c=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 -<br>
=C2=A0drivers/gpu/drm/i915/gem/i915_gem_object.c=C2=A0 =C2=A0 |=C2=A0 25 --=
<br>
=C2=A0drivers/gpu/drm/i915/gem/i915_gem_object.h=C2=A0 =C2=A0 |=C2=A0 22 --=
<br>
=C2=A0drivers/gpu/drm/i915/gem/i915_gem_phys.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 -<br>
=C2=A0drivers/gpu/drm/i915/gt/intel_gt_regs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A03 +-<br>
=C2=A0drivers/gpu/drm/i915/i915_driver.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0drivers/gpu/drm/i915/i915_gem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 -<br>
=C2=A0drivers/gpu/drm/i915/i915_gem_gtt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0drivers/gpu/drm/i915/i915_reg_defs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A08 +<br>
=C2=A0drivers/gpu/drm/i915/i915_vma.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 12 -<br>
=C2=A0drivers/gpu/drm/radeon/radeon.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 55 +--<br>
=C2=A0drivers/gpu/drm/radeon/radeon_ib.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 12 +-<br>
=C2=A0drivers/gpu/drm/radeon/radeon_object.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 25 +-<br>
=C2=A0drivers/gpu/drm/radeon/radeon_sa.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 314 ++---------------<br>
=C2=A0drivers/gpu/drm/radeon/radeon_semaphore.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A06 +-<br>
=C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
82 +++++++---<br>
=C2=A0drivers/gpu/drm/ttm/ttm_bo.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0drivers/misc/mei/hdcp/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0drivers/misc/mei/hdcp/mei_hdcp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0include/drm/drm_pt_walk.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 161 +++++++++<br>
=C2=A0include/drm/drm_suballoc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 112 ++++++<br>
=C2=A0include/drm/gpu_scheduler.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 41 ++-<br>
=C2=A0sound/hda/hdac_i915.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 17 +-<br>
=C2=A0sound/pci/hda/hda_intel.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 56 +--<br>
=C2=A0sound/soc/intel/avs/core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 +-<br>
=C2=A0sound/soc/sof/intel/hda.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +-<br>
=C2=A098 files changed, 2076 insertions(+), 1325 deletions(-)<br>
=C2=A0create mode 100644 drivers/gpu/drm/drm_pt_walk.c<br>
=C2=A0create mode 100644 drivers/gpu/drm/drm_suballoc.c<br>
=C2=A0create mode 100644 include/drm/drm_pt_walk.h<br>
=C2=A0create mode 100644 include/drm/drm_suballoc.h<br>
<br>
-- <br>
2.37.3<br>
<br>
</blockquote></div></div>

--0000000000002e13af05f277f8a7--
