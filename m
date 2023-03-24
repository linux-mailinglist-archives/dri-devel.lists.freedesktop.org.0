Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F876C873B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 22:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E565310E1AF;
	Fri, 24 Mar 2023 21:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E16B10E1AF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 21:05:29 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3edc2294fb4so1365535e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 14:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1679691928;
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1pPjU5KnyikUMF+lx33QxblA95ieb7EwJHRyBP/Ocfg=;
 b=XFPDvgeIGg+BDsDfkuj7TY/WTvWfa0cHkM0HxbaxomoV4m7rqoUhGMQOrv7mUCfveu
 kLu+/VKc/ze4MKc8DmW6JhmyvbNXKE8xeY4adJGuJwQ5G5wfhcz7DAsJ4ey1RAbw45ZZ
 2pUW1ptmX7o4acYg5SEbOnjzWZA/hPvKX6d68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679691928;
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1pPjU5KnyikUMF+lx33QxblA95ieb7EwJHRyBP/Ocfg=;
 b=DQq7XbCLyX3kcNy5Jz0tl73xtGjjaoAIAP6ph9Myq8umqaJoWtKt39wCa6Y9t3AnIh
 NXYHbGSnHSW5OGHqyIyx41saSnYARYMBauGBWEYOeu6LB1KjrFC6IPkM8Lc2HRkKF0FE
 tuCXnIAaG4ds96iuulNi5obsTTdk8BdPqN3D5XMyPiP4OXRqWOnzboCQKLk0wPHaa32d
 eicVvoRGCXmxiwVEtiXmoyGfBD8BJmpbjb2/by1fQFjRg5GGhJgkX7pqhEBQLelxnIo4
 aXlAGQvTA73NxFru82xDBZZHmk1mEgPvsxa7jqRCYh5s2aPmTl6O8Hr4kfhVJv+bf4AS
 80vA==
X-Gm-Message-State: AAQBX9fh72/nBBMT7lNMUeG7r7jur8TjLjb3AzhkNwQNP/5kOs59yqE3
 BDGZl2NymcfmLZIC9xHLVPG0iw==
X-Google-Smtp-Source: AKy350YIGM60B+Z53WzJPoMzuX5U/dRfoV8LFYtgbBM93Y287EISSn7mPOCAyrW5rwLrDCDgJM4Y1A==
X-Received: by 2002:a5d:4482:0:b0:2d2:9c19:f75 with SMTP id
 j2-20020a5d4482000000b002d29c190f75mr1825789wrq.1.1679691928290; 
 Fri, 24 Mar 2023 14:05:28 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 n12-20020adfe34c000000b002da75c5e143sm6749071wrj.29.2023.03.24.14.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 14:05:27 -0700 (PDT)
Date: Fri, 24 Mar 2023 22:05:25 +0100
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] drm-fixes for 6.3-rc4
Message-ID: <ZB4QlRqxz93s/Pgp@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Operating-System: Linux phenom 6.1.0-6-amd64 
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
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Dave is already on vacations, should be back 17th April in time for the
merge window.

This includes the host1x once more, I only realized you applied it already
after I pushed my tree out.

We also discussed a bit what to improve, because there should be a pile of
fallbacks in place:
- maintainer as per MAINTAINERS
- regular reviewers, which is why we strongly encourage peer review and
  also group maintainering so that all regular reviewers can actually push
  patches forward
- big subtree maintainers, big drivers (amd, intel, ...) and drm-misc as
  fallback
- Dave&me, but if it gets to this something broke, there's no way we can
  keep up with all the mail

Now get_maintainers does pick up reviewers and they did reviewer, but none
of them were co-maintainers or had commit rights, which isn't good. I'm
working to volunteer someone else from nvidia, we only have one.

drm-misc maintainers would have been the fallback here, but they didn't
get cc'ed. We discussed a bit on irc whether fixing that makes sense, but
the resulting flood (even if we exclude the big drivers) is probably too
much for the volunteer maintainers here and they'd see the problems as
well as right now. Patchwork for better tracking is also not a fix because
it's clogged with outdated/invalid patches. Which get auto-archived, and
that's the exact crack this patch fell through too.

Another failure mode that happened a few times and also here is that the
driver maintainer picks up the patch, it lands in linux-next (for this one
already in Jan), and all developers are happy because it's in linux-next.
But then the pull request never materializes. Consensus is that small
drivers with very low bus factor really should push at least their fixes
through drm-misc with its regular pull request train, and that was the
plan for tegra too. Just a case of people are busy and it hasn't happened
yet.

Anyway, nothing extraordinary, improving process is just a lot of detail
work. I figured might be useful if I typed this up, and the PR mail seemed
like as good as place as any other.

With that, the actual fixes.

drm-fixes-2023-03-24:
drm-fixes for 6.3-rc4

- usual pile of fixes for amdgpu&i915
- probe error handling fixes for meson, lt8912b bridge
- the host1x patch from Arnd
- panel-orientation fix for Lenovo Book X90F

Cheers, Daniel

The following changes since commit e8d018dd0257f744ca50a729e3d042cf2ec9da65:

  Linux 6.3-rc3 (2023-03-19 13:27:55 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-03-24

for you to fetch changes up to 08570b7c8db6d9185deccf5bcda773bd6f17172f:

  gpu: host1x: fix uninitialized variable use (2023-03-24 10:46:12 +0100)

----------------------------------------------------------------
drm-fixes for 6.3-rc4

- usual pile of fixes for amdgpu&i915
- probe error handling fixes for meson, lt8912b bridge
- the host1x patch from Arnd
- panel-orientation fix for Lenovo Book X90F

----------------------------------------------------------------
Alex Hung (1):
      drm/amd/display: remove outdated 8bpc comments

Andrzej Hajda (1):
      drm/i915/gt: perform uc late init after probe error injection

Arnd Bergmann (1):
      gpu: host1x: fix uninitialized variable use

Ashutosh Dixit (1):
      Revert "drm/i915/hwmon: Enable PL1 power limit"

Badal Nilawar (1):
      drm/i915/mtl: Disable MC6 for MTL A step

Daniel Vetter (3):
      Merge tag 'drm-misc-fixes-2023-03-23' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2023-03-23' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.3-2023-03-23' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Hans de Goede (1):
      drm: panel-orientation-quirks: Add quirk for Lenovo Yoga Book X90F

Hersen Wu (2):
      drm/amd/display: fix wrong index used in dccg32_set_dpstreamclk
      drm/amd/display: Set dcn32 caps.seamless_odm

Jane Jian (1):
      drm/amdgpu/gfx: set cg flags to enter/exit safe mode

Johan Hovold (1):
      drm/meson: fix missing component unbind on bind errors

John Harrison (1):
      drm/i915/guc: Fix missing ecodes

Kai-Heng Feng (1):
      drm/amdgpu/nv: Apply ASPM quirk on Intel ADL + AMD Navi

Matheus Castello (1):
      drm/bridge: lt8912b: return EPROBE_DEFER if bridge is not found

Nirmoy Das (1):
      drm/i915/active: Fix missing debug object activation

Radhakrishna Sripada (1):
      drm/i915/mtl: Fix Wa_16015201720 implementation

Tejas Upadhyay (1):
      drm/i915/fbdev: lock the fbdev obj before vma pin

Tim Huang (2):
      drm/amdgpu: reposition the gpu reset checking for reuse
      drm/amdgpu: skip ASIC reset for APUs when go to S4

Tong Liu01 (1):
      drm/amdgpu: add mes resume when do gfx post soft reset

Ville Syrjälä (2):
      drm/i915: Preserve crtc_state->inherited during state clearing
      drm/i915: Update vblank timestamping stuff on seamless M/N change

Vinay Belgaumkar (1):
      drm/i915: Fix format for perf_limit_reasons

YuBiao Wang (1):
      drm/amdgpu: Force signal hw_fences that are embedded in non-sched jobs

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  5 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           | 41 ++++++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 15 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  5 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  9 +++++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             | 14 ++++++++
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  2 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    | 17 +--------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  1 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |  3 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |  1 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |  4 +--
 drivers/gpu/drm/drm_panel_orientation_quirks.c     | 13 +++++--
 drivers/gpu/drm/i915/display/intel_crtc.c          |  8 +++++
 drivers/gpu/drm/i915/display/intel_display.c       |  1 +
 drivers/gpu/drm/i915/display/intel_dmc.c           | 26 +++++++++++---
 drivers/gpu/drm/i915/display/intel_fbdev.c         | 24 +++++++++----
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  4 +--
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              | 27 --------------
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |  2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |  8 +++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     | 22 ++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c          | 13 +------
 drivers/gpu/drm/i915/i915_active.c                 |  3 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  |  5 ---
 drivers/gpu/drm/i915/i915_reg.h                    | 17 +++------
 drivers/gpu/drm/meson/meson_drv.c                  | 13 ++++---
 drivers/gpu/host1x/dev.c                           |  5 ++-
 28 files changed, 182 insertions(+), 126 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
