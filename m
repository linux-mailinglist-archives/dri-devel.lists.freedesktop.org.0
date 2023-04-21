Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5306B6EA0FD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 03:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384F110ED75;
	Fri, 21 Apr 2023 01:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD17E10ED75
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 01:27:58 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94f3df30043so141503866b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 18:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682040475; x=1684632475;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lIeC0t1/BFmhluSNLN28Ad8VCwxk5eUyZqlvxjSPLu4=;
 b=LQ4RSS1Up22+hXZAIhFyjo+VKRur+R3BDNWscGGAwAFEovabyF4wKGS8xx7TUTNvB2
 v6nsVblwZorZpSgkOPydBz0yN+nB6ry4pMswJ0NiY5tsJOagb4sskOxhA7FMnFwrQ3RP
 QDsXsUcfEfX4b5x2OCKJKcV6xtJ6F3KsqiM7bV/nqVOw4cg8E4wzJhkRjDVEWu7oixr8
 qkUYxpNOOJCk4YHniFHQ0h87168yo4/DXuAvRNAGqgz4IRRkQV9LQ6BRDohzW1dT7Z1R
 5/cmC6E/xT1ne9YwzRcMI1YqVDcnOTAzEXpRRO2KK5SzkdSc3x5bscLboqJWDmtDzpEo
 NgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682040475; x=1684632475;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lIeC0t1/BFmhluSNLN28Ad8VCwxk5eUyZqlvxjSPLu4=;
 b=ZQIARRkSMhFtG6J4PvOK7hCTb5A9YtbKHhAiRoSofxA9xFGCrAqt3s0cAp2Baw9AzD
 y0gnMtVjZYEObznDI8SjB6zTsl0iSabhsvHCFMgwclG1XgwZ3NLV95bB4nq0mWE4fzde
 n+rk5JYJbzUJnanFelWRkecVw3W9UpkABsa+XnaeSxOUmVSxukaM76HDqQCW0Dqfkk/5
 CGMg/EOvnyahibCIdqEQmOGdR744B3UciXB+QSfmMT2Z+bEjTsfSJl4i4YulQAr7cH1O
 6p4exTJV4/HByzWeo/LLo3yQIW0brO0gClwJSEIzVLnVP59AOn9bO4wGX3q2lvXVnB1f
 L/4g==
X-Gm-Message-State: AAQBX9fHuO5pTlJPVy76TQp0a2DlhD8O1FFw6BaOOggJNsAd6yEHAX77
 Fo0e1rV9s1EMxe+fCrCBao9lllPoFQ3BqCwLVIk=
X-Google-Smtp-Source: AKy350Z+y46IGIAeYvGSNVyE70YWs6zfP8m7E3w4PNMJNjwv1oeQ0hUqPgTtgVfGiG/HSMFdS6AREzYkDWbq1X/KkkM=
X-Received: by 2002:a17:906:fa83:b0:94f:3b83:a4d1 with SMTP id
 lt3-20020a170906fa8300b0094f3b83a4d1mr785898ejb.50.1682040474628; Thu, 20 Apr
 2023 18:27:54 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 21 Apr 2023 11:27:42 +1000
Message-ID: <CAPM=9txf3=L+t2-RRDqPaRDBw_VxKqpJqcqS49f8gz3QWcHmEw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.3 final
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

Back from my trip physically, my jet lag is still strong however so
mentally I'm probably a few more days away!

This is the regular and hopefully last round of fixes for 6.3. Pretty
small, a few amdgpu, one i915, one nouveau, one rockchip and one gpu
scheduler fix.

Dave.

drm-fixes-2023-04-21:
drm fixes for 6.3 final

nouveau:
- fix dma-resv timeout

rockchip:
- fix suspend/resume

sched:
- fix timeout handling

i915:
- Fix fast wake AUX sync len

amdgpu:
- GPU reset fix
- DCN 3.1.5 line buffer fix
- Display fix for single channel memory configs
- Fix a possible divide by 0
The following changes since commit 6a8f57ae2eb07ab39a6f0ccad60c760743051026=
:

  Linux 6.3-rc7 (2023-04-16 15:23:53 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-04-21

for you to fetch changes up to 00a4bd000e78a3a898e60bdc13e2852c8044a38c:

  Merge tag 'amd-drm-fixes-6.3-2023-04-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-04-21
11:13:25 +1000)

----------------------------------------------------------------
drm fixes for 6.3 final

nouveau:
- fix dma-resv timeout

rockchip:
- fix suspend/resume

sched:
- fix timeout handling

i915:
- Fix fast wake AUX sync len

amdgpu:
- GPU reset fix
- DCN 3.1.5 line buffer fix
- Display fix for single channel memory configs
- Fix a possible divide by 0

----------------------------------------------------------------
Alan Liu (1):
      drm/amdgpu: Fix desktop freezed after gpu-reset

Alex Hung (1):
      drm/amd/display: fix a divided-by-zero error

Daniel Miess (1):
      drm/amd/display: limit timing for single dimm memory

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2023-04-20-2' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2023-04-19' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.3-2023-04-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Dmytro Laktyushkin (1):
      drm/amd/display: set dcn315 lb bpp to 48

John Ogness (1):
      drm/nouveau: fix incorrect conversion to dma_resv_wait_timeout()

Sascha Hauer (2):
      drm/rockchip: vop2: fix suspend/resume
      drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Fix fast wake AUX sync len

Vitaly Prosyak (1):
      drm/sched: Check scheduler ready before calling timeout handling

 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c              |  3 +++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c   | 17 ++++++++++++++--=
-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_resource.c  | 20 ++++++++++++++++=
++++
 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c |  2 +-
 .../drm/amd/display/modules/power/power_helpers.c    |  4 ++++
 drivers/gpu/drm/i915/display/intel_dp_aux.c          |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c                | 18 ++++++++++++----=
--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c         |  4 ++++
 drivers/gpu/drm/scheduler/sched_main.c               |  3 ++-
 9 files changed, 61 insertions(+), 12 deletions(-)
