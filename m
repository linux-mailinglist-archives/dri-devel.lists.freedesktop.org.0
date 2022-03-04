Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1282F4CCC50
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 04:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C677A10E11B;
	Fri,  4 Mar 2022 03:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AE710E11B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 03:34:49 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id f8so9118632edf.10
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 19:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=WcXHhklBNGyAi1Fm2zsLjVuAug9s+ql0EDjZsbPKYAI=;
 b=E1FpFJLB7abJxZed1WCMQcULZn9hQTMbGxiNPi0CCVnGiIdUpD+xXROcHfApd0/lhy
 Fj8d3Tr13RwSsb2kdxmdA2eb2hZRt4zK1ql7T4hz1+YKU36UXfm141BQ8dAfNWF9unc+
 XzFCDq2JChZ6YhsZxAz4pOLc8l6nuIuu4cjDXLs4EOuoK9lhb+ayiN1eBrOaUNLwohVq
 QMbQKbEMuHG87cggJq/oVgE8YdyOPZZga7JQMPOs2dCT4KD10W9joDxIKV6BQMpwJPXs
 8IcXc+FPkt5hzKMTw5xGyka1VDAoxaBX2m8/m7Ikqstkdd+fN1mjXZ5WG7aMkNLfO7qF
 OCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=WcXHhklBNGyAi1Fm2zsLjVuAug9s+ql0EDjZsbPKYAI=;
 b=yD7r1vgGa1BrvXYdrfCjwU+Pulvjdk+k4j4mjabR7/5qmnreaW1I9uJZWOY2Jfvc+c
 VEg0lCD/JdkLTucrkKiTHhoMUWMIJmMboud4h8gVIaBfBnrN41VPuBUgxHpmkbY+j58V
 o2ORVT4iPdlDyOWxaxwyfCi2+jxDPq1GvHSJwQ8rvcE3t1GSfCsSiN5zRsyKhwIbCb8a
 HJBzdoA2xtPlghgVq3+uK1/bPalRKlrzv4GapfZpdyvzGIX+fOeKbydEUo3pdcw1+13G
 pAeRp0XHSjLs+mQQQAx5lWRjTMOJ3EKZSn7K8R21NAfSChk++e3fsJZ34ne3c8hlvKwN
 GEaQ==
X-Gm-Message-State: AOAM531szBjjdTz/MNmE/jdHDA7m/35uVGSlL8/eVzBXiVIpKda6QgK9
 rOU8EXzh5lliV/Q/jIx2urlgVDDy3N76nWzOOJK4kwqWIRM=
X-Google-Smtp-Source: ABdhPJyXRTi7eberRDwVlKzM1WsiDZWyFjob4oE6YkzfUlvwNJGcVLVLAZaRhQfnUp4HRm6+9FZDwJgMnGvbfsNN/+s=
X-Received: by 2002:a05:6402:f0b:b0:415:ec3c:68aa with SMTP id
 i11-20020a0564020f0b00b00415ec3c68aamr4186570eda.86.1646364887656; Thu, 03
 Mar 2022 19:34:47 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 4 Mar 2022 13:34:36 +1000
Message-ID: <CAPM=9txdUAqhJOhz+09qtFLJNOThDMNQxLu6kV-v6o1bopXhNA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.17-rc7
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

Things are quieting down as expected, just a small set of fixes, i915,
exynos, amdgpu, vrr, bridge and hdlcd. Nothing scary at all.

Dave.

drm-fixes-2022-03-04:
drm fixes for 5.17-rc7

i915:
- Fix GuC SLPC unset command
- Fix misidentification of some Apple MacBook Pro laptops as Jasper Lake.

amdgpu:
- Suspend regression fix

exynos:
- irq handling fixes.
- Fix two regressions to TE-gpio handling.

arm/hdlcd:
- Select DRM_GEM_CMEA_HELPER for HDLCD

bridge:
- ti-sn65dsi86: Properly undo autosuspend

vrr:
- Fix potential NULL-pointer deref
The following changes since commit 7e57714cd0ad2d5bb90e50b5096a0e671dec1ef3=
:

  Linux 5.17-rc6 (2022-02-27 14:36:33 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-03-04

for you to fetch changes up to 8fdb19679722a02fe21642d39710c701d2ed567a:

  Merge tag 'drm-misc-fixes-2022-03-03' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2022-03-04
13:04:11 +1000)

----------------------------------------------------------------
drm fixes for 5.17-rc7

i915:
- Fix GuC SLPC unset command
- Fix misidentification of some Apple MacBook Pro laptops as Jasper Lake.

amdgpu:
- Suspend regression fix

exynos:
- irq handling fixes.
- Fix two regressions to TE-gpio handling.

arm/hdlcd:
- Select DRM_GEM_CMEA_HELPER for HDLCD

bridge:
- ti-sn65dsi86: Properly undo autosuspend

vrr:
- Fix potential NULL-pointer deref

----------------------------------------------------------------
Carsten Haitzler (1):
      drm/arm: arm hdlcd select DRM_GEM_CMA_HELPER

Dave Airlie (4):
      Merge tag 'exynos-drm-fixes-v5.17-rc6' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes
      Merge tag 'drm-intel-fixes-2022-03-03' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.17-2022-03-02' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2022-03-03' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Douglas Anderson (1):
      drm/bridge: ti-sn65dsi86: Properly undo autosuspend

Lad Prabhakar (5):
      drm/exynos/exynos7_drm_decon: Use platform_get_irq_byname() to
get the interrupt
      drm/exynos: mixer: Use platform_get_irq() to get the interrupt
      drm/exynos/exynos_drm_fimd: Use platform_get_irq_byname() to get
the interrupt
      drm/exynos/fimc: Use platform_get_irq() to get the interrupt
      drm/exynos: gsc: Use platform_get_irq() to get the interrupt

Manasi Navare (1):
      drm/vrr: Set VRR capable prop only if it is attached to connector

Marek Szyprowski (2):
      drm/exynos: Don't fail if no TE-gpio is defined for DSI driver
      drm/exynos: Search for TE-gpio in DSI panel's node

Qiang Yu (1):
      drm/amdgpu: fix suspend/resume hang regression

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: s/JSP2/ICP2/ PCH

Vinay Belgaumkar (1):
      drm/i915/guc/slpc: Correct the param count for unset param

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  3 ++-
 drivers/gpu/drm/arm/Kconfig                 |  1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c       |  5 +++--
 drivers/gpu/drm/drm_connector.c             |  3 +++
 drivers/gpu/drm/exynos/exynos7_drm_decon.c  | 12 +++---------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  6 ++++--
 drivers/gpu/drm/exynos/exynos_drm_fimc.c    | 13 +++++--------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c    | 13 ++++---------
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     | 10 +++-------
 drivers/gpu/drm/exynos/exynos_mixer.c       | 14 ++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c |  2 +-
 drivers/gpu/drm/i915/intel_pch.c            |  2 +-
 drivers/gpu/drm/i915/intel_pch.h            |  2 +-
 13 files changed, 37 insertions(+), 49 deletions(-)
