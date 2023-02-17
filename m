Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A7169A3CD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 03:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB1B10E0D2;
	Fri, 17 Feb 2023 02:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1337710E0D2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 02:16:49 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w3so10175740edc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 18:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7fleu3eWQmq1EyyJbxNWRjiNo9YtMIm/LD1NXhbIpFI=;
 b=WzUDtfVQZCfZkov7p2aFlIp3CvIx/XJ6F9HK/Ke2SQKK4tGDA/M1at8A3Qw5xiRCNZ
 1yboXzdF3Y6YTwVgb52fCxEN70XT99MLMDBAew+R0uZJ84TMPHVZXno3SLgmXoV5pWlI
 Wx5Ba4jSWDx18xwjXqQpMOj37IBVz3ni1nUOIU5OPo94w5g/Jb0/yyfRrVtFzSlNI0mv
 kD1oZRT+oWpljE+XsUS1lhjx53N874DflBcduNYcgD27WBLO8tk5zJGXcAc8zieGyjHe
 TlyJs7/cwoQRoq+JBPHSBFgIRTBV28i+bWVM532emTgkPkSJ00KsdjOmp0ZYhbzXfQoY
 MKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7fleu3eWQmq1EyyJbxNWRjiNo9YtMIm/LD1NXhbIpFI=;
 b=3aydYK1ldVQokwz3bWOmps8Pn/BrsVzZwq7USf9ytO0rQTmKGhhVuzNCjIHCbFQjtu
 ns4LWx2erA3wklxOEExwTOhxDciv9M7EQfk07EWz1NavMD1TWYBqKXOLfNUHUVGzuVG0
 O3l8YusPmj9TaUWxgdQqhgRWYP6tV0jpW23vqMp/PglvPe7RkgjaSp5Yp4GaKvf9kx+c
 74h3rPAPA4oCP+sObgg8CKZGiJVQ18vq2EYW8fxuQNK2E7V/cKaTCZydi5xW1boXxJhC
 C0v15Xi3NganWXsETj903FujJSa8pVFZQWA3r5Wk3w2Ih3nn5EomX6uHsIxhCs0mnE7U
 qO+Q==
X-Gm-Message-State: AO0yUKWVRtDfD6oLUJYic89tNgIuqDpzb//2DFLfBI9O4GZvuAZP9cXz
 h27uAHYrrzs18JTRYoUdMXA8D9JyPNUJ6QzllpQ=
X-Google-Smtp-Source: AK7set/bNjGZtw3xbyJD/URRlSVf+tyyUs/+md4k0sWA36DxWiPq1X8ItmEQ3pCbfxYpVn841dD1plqIS7faRsZmzsw=
X-Received: by 2002:a17:907:3d91:b0:8af:2e89:83df with SMTP id
 he17-20020a1709073d9100b008af2e8983dfmr3052167ejc.6.1676600207241; Thu, 16
 Feb 2023 18:16:47 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 17 Feb 2023 12:16:34 +1000
Message-ID: <CAPM=9tyvvUJiuADGfPznEKCNBmwGzPEKE7Oob_9BduxE6Od4TQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.2 final
To: Linus Torvalds <torvalds@linux-foundation.org>,
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

Just a final collection of misc fixes, the biggest disables the
recently added dynamic debugging support, it has a regression that
needs some bigger fixes. Otherwise a bunch of fixes across the board,
vc4, amdgpu and vmwgfx mostly, with some smaller i915 and ast fixes.

Dave.

drm-fixes-2023-02-17:
drm fixes for 6.2 final

drm:
- dynamic debug disable for now

fbdev:
- deferred i/o device close fix

amdgpu:
- Fix GC11.x suspend warning
- Fix display warning

vc4:
- YUV planes fix
- hdmi display fix
- crtc reduced blanking fix

ast:
- fix start address computation

vmwgfx:
- fix bo/handle races

i915:
- gen11 WA fix
The following changes since commit ceaa837f96adb69c0df0397937cd74991d5d821a=
:

  Linux 6.2-rc8 (2023-02-12 14:10:17 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-02-17

for you to fetch changes up to f7597e3c58eeb9ce534993f53c982f2e91e6dd4d:

  Merge tag 'drm-intel-fixes-2023-02-16' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2023-02-17
09:50:06 +1000)

----------------------------------------------------------------
drm fixes for 6.2 final

drm:
- dynamic debug disable for now

fbdev:
- deferred i/o device close fix

amdgpu:
- Fix GC11.x suspend warning
- Fix display warning

vc4:
- YUV planes fix
- hdmi display fix
- crtc reduced blanking fix

ast:
- fix start address computation

vmwgfx:
- fix bo/handle races

i915:
- gen11 WA fix

----------------------------------------------------------------
Dave Airlie (3):
      Merge tag 'amd-drm-fixes-6.2-2023-02-15' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2023-02-16' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2023-02-16' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Dave Stevenson (1):
      drm/vc4: Fix YUV plane handling when planes are in different buffers

Dom Cobley (2):
      drm/vc4: hdmi: Always enable GCP with AVMUTE cleared
      drm/vc4: crtc: Increase setup cost in core clock calculation to
handle extreme reduced blanking

Jack Xiao (1):
      drm/amd/amdgpu: fix warning during suspend

Jocelyn Falempe (1):
      drm/ast: Fix start address computation

Leo Li (1):
      drm/amd/display: Fail atomic_check early on normalize_zpos error

Matt Roper (1):
      drm/i915/gen11: Wa_1408615072/Wa_1407596294 should be on GT list

Takashi Iwai (1):
      fbdev: Fix invalid page access after closing deferred I/O devices

Ville Syrj=C3=A4l=C3=A4 (1):
      drm: Disable dynamic debug as broken

Zack Rusin (2):
      drm/vmwgfx: Stop accessing buffer objects which failed init
      drm/vmwgfx: Do not drop the reference to the handle too soon

 drivers/gpu/drm/Kconfig                           |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        |  3 +++
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c            |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +++++-
 drivers/gpu/drm/ast/ast_mode.c                    |  4 ++--
 drivers/gpu/drm/i915/gt/intel_workarounds.c       | 14 +++++++-------
 drivers/gpu/drm/vc4/vc4_crtc.c                    |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                    | 18 +++++++++---------
 drivers/gpu/drm/vc4/vc4_plane.c                   |  6 ++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                | 12 ++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c           |  2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c               |  8 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c               |  4 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c           |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c            |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c           | 10 ++++++----
 drivers/video/fbdev/core/fb_defio.c               | 10 +++++++++-
 drivers/video/fbdev/core/fbmem.c                  |  4 ++++
 include/linux/fb.h                                |  1 +
 19 files changed, 73 insertions(+), 38 deletions(-)
