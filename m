Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B803F91EE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 03:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A956E044;
	Fri, 27 Aug 2021 01:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC396E044
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 01:33:23 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id dm15so7512823edb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 18:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=nSXe9rX6v6uDff/hiJgbs7WLqhmATWd08mn19C/ZjvQ=;
 b=JKxJQ7CNJfHupIOTgSdUo9SXYlK7dCWKBkYtbx0eygD5lPwWyS+y77vO53QfqV2pLn
 Cr8xhnh3GA7N15k5KWpAk1/JhGHExQQnCYpAxkbngbaSF2ZwkwKA9DMK4ftG0zpmVTtJ
 Na4sZaqdJlNARk5/Icg3VFV4BGm/LAO5MIe2EzJOdMHs+HelBvIwURa16MMYzUOaSclN
 9fX/Yt7MdtKr6px1nIU3NmrpYgP1NNzjUtGdnlzov4yIX7zU1Oz7mcBCvC0ycdDenOau
 Bnf1sFEgmdWe3aHOMJWvEbI5dTV40n4WmztpJ9aJfEYCZNRLZ727cxs1RV1gfONRjTcP
 EFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=nSXe9rX6v6uDff/hiJgbs7WLqhmATWd08mn19C/ZjvQ=;
 b=BqnUcBCJ2o6FcPTG8CgJNM8Q7kHEZ0HGSMu5o8hzE+HcPwz+COxaRyhkgI4VsBW02e
 jkPbViOWc7iWv+J0QRAjsGElRHNVUQrs7AS+kSsvm4Z2ad923pKEUnWBjM5Aqoth79CU
 eQB0mTY9KDi7EUHDin95IPwekAn0CP4KXHpWets8z619aNwDvrGsc+7L1lbsoTe1cdf8
 iM5QIGC1oVWYt6PZSCWpEJLIVwRJu8JREI9GNLM6qO/Ev8zYpZOTSokQAalskVSwmS2P
 goKk6u5jHw6DgNPqdhdRk7Crxpwct9ZQs1k3Bqfb1fXs9Bs66DKzR1mSWRyQRaYUKk1A
 iEXg==
X-Gm-Message-State: AOAM530HbT+pTlBthdzAAfmm19XdG4nYPsWqL1jf2Wi67tznghUalW0u
 mzdE6YsVz5KH+i4dp1dFxZnLECuSvvX2zeesK1s=
X-Google-Smtp-Source: ABdhPJzKcdR/HgeUwFSP56h1WVjDk/1TlCm/ATslUOmvePbRRIezXAXuw01wD3UikNZwGDkLKOfDrK1vKgrV/q7yovg=
X-Received: by 2002:a50:8dcd:: with SMTP id s13mr7264468edh.383.1630028001600; 
 Thu, 26 Aug 2021 18:33:21 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 27 Aug 2021 11:33:10 +1000
Message-ID: <CAPM=9tysyOYAeKLF0o2FU-9dmjzosykd61Of7hzbYjBZ4homyQ@mail.gmail.com>
Subject: [git pull] drm fixes for 5.14-rc8/final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hi Linus,

Last set of fixes for 5.14, nothing major a couple of i915, couple of
imx and a few amdgpu. All pretty small.

Dave.

drm-fixes-2021-08-27:
drm fixes for 5.14-rc8/final

i915:
- Fix syncmap memory leak
- Drop redundant display port debug print

amdgpu:
- Fix for pinning display buffers multiple times
- Fix delayed work handling for GFXOFF
- Fix build when CONFIG_SUSPEND is not set

imx:
- fix planar offset calculations
- fix accidental partial revert
The following changes since commit e22ce8eb631bdc47a4a4ea7ecf4e4ba499db4f93=
:

  Linux 5.14-rc7 (2021-08-22 14:24:56 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-08-27

for you to fetch changes up to 9fe4f5a24fdac99c484daf29eded9c6685fa2020:

  Merge tag 'imx-drm-fixes-2021-08-18' of
git://git.pengutronix.de/pza/linux into drm-fixes (2021-08-27 10:49:53
+1000)

----------------------------------------------------------------
drm fixes for 5.14-rc8/final

i915:
- Fix syncmap memory leak
- Drop redundant display port debug print

amdgpu:
- Fix for pinning display buffers multiple times
- Fix delayed work handling for GFXOFF
- Fix build when CONFIG_SUSPEND is not set

imx:
- fix planar offset calculations
- fix accidental partial revert

----------------------------------------------------------------
Borislav Petkov (1):
      drm/amdgpu: Fix build with missing pm_suspend_target_state module exp=
ort

Christian K=C3=B6nig (1):
      drm/amdgpu: use the preferred pin domain after the check

Dave Airlie (3):
      Merge tag 'drm-intel-fixes-2021-08-26' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.14-2021-08-25' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'imx-drm-fixes-2021-08-18' of
git://git.pengutronix.de/pza/linux into drm-fixes

Krzysztof Ha=C5=82asa (1):
      gpu: ipu-v3: Fix i.MX IPU-v3 offset calculations for
(semi)planar U/V formats

Matthew Brost (1):
      drm/i915: Fix syncmap memory leak

Michel D=C3=A4nzer (1):
      drm/amdgpu: Cancel delayed work when GFXOFF is disabled

Philipp Zabel (1):
      drm/imx: ipuv3-plane: fix accidental partial revert of 8 pixel
alignment fix

Swati Sharma (1):
      drm/i915/dp: Drop redundant debug print

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 +++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 36 +++++++++++++++++++++-----=
----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 10 ++++-----
 drivers/gpu/drm/i915/display/intel_dp.c    |  9 ++------
 drivers/gpu/drm/i915/gt/intel_timeline.c   |  9 ++++++++
 drivers/gpu/drm/imx/ipuv3-plane.c          |  2 +-
 drivers/gpu/ipu-v3/ipu-cpmem.c             | 30 ++++++++++++-------------
 8 files changed, 63 insertions(+), 46 deletions(-)
