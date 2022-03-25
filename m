Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F75C4E6C6A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 03:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E52710EA57;
	Fri, 25 Mar 2022 02:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EDB10EA52
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 02:13:33 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id x34so7657709ede.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 19:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=x/SKwnS2wQi9dJJ6CWGROEW1ewpvhEn8StiIdhWUEWI=;
 b=iDMYY7FwsUa++dMovFKpAJmACqJEFzXM6eEjeuDTd0+cClHJfPUKyh7ELo3liADDQ0
 /NBQ9+Cu+un/PYWM8BKpXk7Kq/DoKsnMSDekvfwW9Yqu4XEfEAM0r6Ga8Qp0fauo5zq4
 3ZtUSOqkOR5ovCNp4c1IE55cdeco21MLx9T1SKyW8RqP9FzjiAEFlNRYMz5rEj94b0o+
 6M1sLAGijkffXKrDHia5CctnMQlNPjA1HT8ZMZEMpFO3n74T8TBzvbw1zeUQHupzneRD
 0CysiYfcjx9NUGxEV1mIZJ63WEan1TDEEzitAKRafWOve4KAvJIwNfJQ7JITKVEmL16W
 caQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=x/SKwnS2wQi9dJJ6CWGROEW1ewpvhEn8StiIdhWUEWI=;
 b=H5vbNGjxV8Uab8FbxRoL2UiBvo4/vC5t2Bdqvr1jv6GMupBeOI9oNgVnmr0bk6qx+U
 q53gOZISiAiTjQm54/rJxn/BYmPQxrbjwgRBmx1B52PelRGmyHko9TRAlpnljDsEOSQh
 dhB8zkSW9SelaQSk4kkSCESgI5+SowCD44z+Q8ACY8VEfnnWY2AfqDKnKQVYEu1w+lQv
 OlYTQfGuEtIh+DdWaM/5jr7Eoom+yEqqx2WT/ylS1BFaHw91XzOumZnfSWlM88n4GJnp
 e7VpBaXYozAH+25PYY8Z13OdWSQEjG5lGscLvHUE5rgSpYftG5LNc6UtTW/NfwrHsryQ
 V1qg==
X-Gm-Message-State: AOAM5311vfJ3Yn3dDxRjpcjNGmalbw/9L2C6OHdqRrbWvGuJNKnXnv7P
 hFRGePljcXp/BW6HvOmRbOxGEtGnHyXosFiFmBc=
X-Google-Smtp-Source: ABdhPJyOinrH+nfJItL/ZWM2gMcQcwufOzrDZXE42o6EdU71rXSuPvg6bKQEeYRFLPshtt3PqR1zwwOFW1hzs85F9tA=
X-Received: by 2002:a05:6402:354b:b0:419:4af8:c5c9 with SMTP id
 f11-20020a056402354b00b004194af8c5c9mr10326050edd.91.1648174411417; Thu, 24
 Mar 2022 19:13:31 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 25 Mar 2022 12:13:20 +1000
Message-ID: <CAPM=9ty8CYpuQ05BjgB9_CBRUjiL5PMTF-irHRXKOWtOrgxxZA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.18-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Some fixes were queued up in and in light of the fbdev regressions,
I've pulled those in as well,
I think the mediatek one is going to be a bit more painful, since now
you have a merge and I need to have the mediatek stuff get rebased and
retested onto that merge point, but I'll make sure they get to you
ASAP.

Thomas, cc'ed, I pulled your fbdev fixes from patchwork, since they
were a clear regression fix, don't bother queueing them up in our
trees now.

Dave.

drm-next-2022-03-25:
drm fixes for 5.18-rc1

core:
- Make audio and color plane support checking only happen
  when a CEA extension block is found.
- Small selftest fix.

fbdev:
- two regressions fixes from speedup patches.

ttm:
- Fix a small regression from ttm_resource_fini()

i915:
- Reject unsupported TMDS rates on ICL+
- Treat SAGV block time 0 as SAGV disabled
- Fix PSF GV point mask when SAGV is not possible
- Fix renamed INTEL_INFO->media.arch/ver field
The following changes since commit c6e90a1c660874736bd09c1fec6312b4b4c2ff7b=
:

  Merge tag 'amd-drm-next-5.18-2022-03-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-03-21
13:48:20 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-03-25

for you to fetch changes up to 2a81dba4b577099717cea86d429f053e85e74d96:

  fbdev: Fix cfb_imageblit() for arbitrary image widths (2022-03-25
09:55:54 +1000)

----------------------------------------------------------------
drm fixes for 5.18-rc1

core:
- Make audio and color plane support checking only happen
  when a CEA extension block is found.
- Small selftest fix.

fbdev:
- two regressions fixes from speedup patches.

ttm:
- Fix a small regression from ttm_resource_fini()

i915:
- Reject unsupported TMDS rates on ICL+
- Treat SAGV block time 0 as SAGV disabled
- Fix PSF GV point mask when SAGV is not possible
- Fix renamed INTEL_INFO->media.arch/ver field

----------------------------------------------------------------
Cooper Chiou (1):
      drm/edid: check basic audio support on CEA extension block

Dave Airlie (2):
      Merge tag 'drm-intel-next-fixes-2022-03-24' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-fixes-2022-03-24-1' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next

Jani Nikula (1):
      drm/edid: fix CEA extension byte #3 parsing

Lucas De Marchi (1):
      drm/i915: Fix renamed struct field

Nathan Chancellor (1):
      drm/selftest: plane_helper: Put test structures in static storage

Thomas Zimmermann (2):
      fbdev: Fix sys_imageblit() for arbitrary image widths
      fbdev: Fix cfb_imageblit() for arbitrary image widths

Ville Syrj=C3=A4l=C3=A4 (3):
      drm/i915: Reject unsupported TMDS rates on ICL+
      drm/i915: Treat SAGV block time 0 as SAGV disabled
      drm/i915: Fix PSF GV point mask when SAGV is not possible

Zack Rusin (1):
      drm/ttm: Fix a kernel oops due to an invalid read

 drivers/gpu/drm/drm_edid.c                        | 15 ++++++++----
 drivers/gpu/drm/i915/display/intel_bw.c           |  3 ++-
 drivers/gpu/drm/i915/display/intel_hdmi.c         |  9 +++++++
 drivers/gpu/drm/i915/i915_drv.h                   |  2 +-
 drivers/gpu/drm/i915/intel_pm.c                   | 10 ++++----
 drivers/gpu/drm/selftests/test-drm_plane_helper.c |  8 +++----
 drivers/gpu/drm/ttm/ttm_range_manager.c           |  2 +-
 drivers/video/fbdev/core/cfbimgblt.c              | 28 ++++++++++++++++++-=
---
 drivers/video/fbdev/core/sysimgblt.c              | 29 +++++++++++++++++++=
----
 9 files changed, 82 insertions(+), 24 deletions(-)
