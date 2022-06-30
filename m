Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDE8562743
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 01:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DC910E148;
	Thu, 30 Jun 2022 23:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD4210E148
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 23:50:22 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ge10so1013404ejb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 16:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Si6Vg1wa/7RogX1AusbI0XgUV6cLT3cMbVhFnYF9DAM=;
 b=f1gh8kvL2CRI3T0JwQhmXBnHUIr6ajhEOmkd6OMB1ChlymB60XN/Exm5AeWTglJpax
 EHMl1965t/hUJ8/nr6gw8bXAL48vchXVqwChEpEFWe5ozXSkt8AePjJBMm/Qe6u6LNyr
 qJtY0KPJ9EeMlXOlN0kC/1gWq8OIuvB8bRkvcPsq1HmSbqX1Tga60Etj+a9sI/uaBlua
 kS6W4jTlgsr2xfjeU6U5kefF3fk8rFI+2NOE/pZTcMGJ+7jkORiphuXSjXSaEG8H/lRl
 dGhmO5BTJNKZtcnhvsLCVPDgo4zqJJqpINZm5tjQMxnNyJeVh7oLlQsJvW59j21cUmsq
 AvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Si6Vg1wa/7RogX1AusbI0XgUV6cLT3cMbVhFnYF9DAM=;
 b=3S1KEFCTgtkp0k0u9r30Y9NRaEtMVYKLSasYVtL0NPFvptZCt0m1kVMpvhhTUmVPop
 ngmleeHAfdE4IUMvF9/vXnEAhblO0pp9IMW7YLfbRjckd27aTBM+978uY9XdhDa9KJsr
 9/OtCXVHuAVoXst92IN97VWZK8tQAPQBpCHF8eTRkM8ixbfF+b+GN/YDgScuiKUF4oof
 nqvO6q1KmFkf2kSrQJDsmlrspl184A0WOou7OW0t42O7QClggmVrF7J5YtqCVaEoYd0k
 d9MMdBKawdcMddu/r6m4cfctKhP8pzIIPQnWYEHnUJBY1HCBI3C5XTrGrXBgASlxtyd7
 vf3w==
X-Gm-Message-State: AJIora+43DXFl9GmmMCalbCesUn1RlucT2CJIzLY1rZp6WBs6hGhQiTt
 wlAi+jUkD5WgB6atD5siN36qtcZIw/ebC8yj5Do=
X-Google-Smtp-Source: AGRyM1sctn6XzRu1QPPOwfXYniixV0BBVmW2j9hqKl/qHS2PbbU7KSjGrJwYX2Y2qdCPI3b7Zn3oXl0fEaTn9gG66WU=
X-Received: by 2002:a17:906:149:b0:712:502:bc62 with SMTP id
 9-20020a170906014900b007120502bc62mr11535312ejh.720.1656633020792; Thu, 30
 Jun 2022 16:50:20 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 1 Jul 2022 09:50:09 +1000
Message-ID: <CAPM=9twfRe7w=z0ZQwBw7u6QiDQUWbXi+AZO4wE=MCzNK+RByA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.19-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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

Bit quieter this week, the main thing is it pulls in the fixes for the
sysfb resource issue you were seeing. these had been queued for next
so should have had some decent testing.

Otherwise amdgpu, i915 and msm each have a few fixes, and vc4 has one.

Just to reiterate, I'm out next week (and Daniel is as well), so I'd
expect rc7 might have a bit more, I'll likely send whatever lands in
the queue early the next week.

Regards,
Dave.

drm-fixes-2022-07-01:
drm fixes for 5.19-rc5

fbdev:
- sysfb fixes/conflicting fb fixes.

amdgpu:
- GPU recovery fix
- Fix integer type usage in fourcc header for AMD modifiers
- KFD TLB flush fix for gfx9 APUs
- Display fix

i915:
- Fix ioctl argument error return
- Fix d3cold disable to allow PCI upstream bridge D3 transition
- Fix setting cache_dirty for dma-buf objects on discrete

msm:
- Fix to increment vsync_cnt before calling drm_crtc_handle_vblank so that
  userspace sees the value *after* it is incremented if waiting for vblank
  events
- Fix to reset drm_dev to NULL in dp_display_unbind to avoid a crash in
  probe/bind error paths
- Fix to resolve the smatch error of de-referencing before NULL check in
  dpu_encoder_phys_wb.c
- Fix error return to userspace if fence-id allocation fails in submit
  ioctl

vc4:
- NULL ptr dereference fix
The following changes since commit 03c765b0e3b4cb5063276b086c76f7a612856a9a:

  Linux 5.19-rc4 (2022-06-26 14:22:10 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-07-01

for you to fetch changes up to b8f0009bc9edf9186b20ae2a9e442ef0af93040e:

  Merge tag 'drm-misc-fixes-2022-06-30' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2022-07-01
09:27:55 +1000)

----------------------------------------------------------------
drm fixes for 5.19-rc5

fbdev:
- sysfb fixes/conflicting fb fixes.

amdgpu:
- GPU recovery fix
- Fix integer type usage in fourcc header for AMD modifiers
- KFD TLB flush fix for gfx9 APUs
- Display fix

i915:
- Fix ioctl argument error return
- Fix d3cold disable to allow PCI upstream bridge D3 transition
- Fix setting cache_dirty for dma-buf objects on discrete

msm:
- Fix to increment vsync_cnt before calling drm_crtc_handle_vblank so that
  userspace sees the value *after* it is incremented if waiting for vblank
  events
- Fix to reset drm_dev to NULL in dp_display_unbind to avoid a crash in
  probe/bind error paths
- Fix to resolve the smatch error of de-referencing before NULL check in
  dpu_encoder_phys_wb.c
- Fix error return to userspace if fence-id allocation fails in submit
  ioctl

vc4:
- NULL ptr dereference fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: fix adev variable used in amdgpu_device_gpu_recover()
      Revert "drm/amdgpu/display: set vblank_disable_immediate for DC"

Anshuman Gupta (1):
      drm/i915/dgfx: Disable d3cold at gfx root port

Carlos Llamas (1):
      drm/fourcc: fix integer type usage in uapi header

Dave Airlie (4):
      Merge tag 'drm-msm-fixes-2022-06-28' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'drm-intel-fixes-2022-06-29' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.19-2022-06-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2022-06-30' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Javier Martinez Canillas (3):
      firmware: sysfb: Make sysfb_create_simplefb() return a pdev pointer
      firmware: sysfb: Add sysfb_disable() helper function
      fbdev: Disable sysfb device registration when removing conflicting FBs

Kuogee Hsieh (1):
      drm/msm/dp: reset drm_dev to NULL at dp_display_unbind()

Matthew Auld (1):
      drm/i915: tweak the ordering in cpu_write_needs_clflush

Maxime Ripard (1):
      drm/vc4: perfmon: Fix variable dereferenced before check

Rob Clark (1):
      drm/msm/gem: Fix error return on fence id alloc fail

Ruili Ji (1):
      drm/amdgpu: To flush tlb for MMHUB of RAVEN series

Stephen Boyd (1):
      drm/msm/dpu: Increment vsync_cnt before waking up userspace

katrinzhou (1):
      drm/i915/gem: add missing else

sunliming (1):
      drm/msm/dpu: Fix variable dereferenced before check

 .../driver-api/firmware/other_interfaces.rst       |  6 +++
 drivers/firmware/sysfb.c                           | 58 +++++++++++++++++++---
 drivers/firmware/sysfb_simplefb.c                  | 16 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |  1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  3 --
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  5 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |  6 +--
 drivers/gpu/drm/i915/i915_driver.c                 | 34 ++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 10 ++--
 drivers/gpu/drm/msm/dp/dp_display.c                |  2 +
 drivers/gpu/drm/msm/msm_gem_submit.c               |  2 +-
 drivers/gpu/drm/vc4/vc4_perfmon.c                  |  9 ++--
 drivers/video/fbdev/core/fbmem.c                   | 12 +++++
 include/linux/sysfb.h                              | 22 ++++++--
 include/uapi/drm/drm_fourcc.h                      |  4 +-
 18 files changed, 136 insertions(+), 62 deletions(-)
