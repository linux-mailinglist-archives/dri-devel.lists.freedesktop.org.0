Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF6C416A5E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 05:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D64A6EDDA;
	Fri, 24 Sep 2021 03:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41EF6EDDA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 03:18:17 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id u27so30041423edi.9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 20:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=CMQqIkvwp/0qGyW1Blu6mOY2iiopgNoaJkg6GhARr7c=;
 b=Z/92IUZunYXouB8yycJDrviFQIJjhE82uNqj4g/X+X1PIMihb4JFLMAhdhz1HTmxRl
 Heb6ioALbsWMhDOLhgGl767DMNnLlJt6wy6C07db5+ChDbyJMqFP7tdxZth9+Bncr+hg
 /grrGKAxkhJm2Y1xIFK9DzGm057jQOr/4Es/5R1hlRWGUVOT5IKvZTrwIPCkXwWpEX8c
 kpJUah7EvmV5kV44UHvL7VVfAI7YAydHJhyCWvtECh/ykeCCsqIbSn5+9sr8x3KaavY6
 9T+N9tCdnfZJf1rSDzxpeeA3R7U7SpDV4QOP1vWpb+Qj5Tay4yAzUfY3C1q4OpcE5dhI
 WslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=CMQqIkvwp/0qGyW1Blu6mOY2iiopgNoaJkg6GhARr7c=;
 b=ORiIF6Ka6Z3WSjVDjmwEXYC+YGxHl+TQzG/UfNdyDD/cFP5ZLgag2qy/QA4PQUWVM/
 s0dwP7ccm/51ljRMStDyrp4a01/szJhcjsPLg+/ldlmCxIGyiw8c+OFlKVgcYW7iVyIx
 X/2XMO4Hy20bVBNGsjFx5bfNPH5fLnkONRul4TKPaIUnDF/NLORkO8Mkf2WXfEXxRHTT
 7STWjjMS0oHntGtX4o2ULoQFD8VSuZmndexD8sXMDmkNXIbfxrh9do5TaK0whXqPHlX+
 oA1FLvZDNKvlSfdDoUG1L993BydPF/uQM00NcGjxmyQTHxYU2MMvDX8yupWD7wvBWPOv
 jTpg==
X-Gm-Message-State: AOAM532H1OrKyfGVctxTGGHedEMg/XRYXIbulrZ1F4Wwn7NbatpwaZ19
 OOUlBr1lBq/edvvMEqiRv4zLWDI+mEdYInIUBfk=
X-Google-Smtp-Source: ABdhPJzPquP7nIvCEF5iQzVs4Va1x0GoxAO9I1S2nVbL6m8BLjM5iBfaop97x7jLdaJ5BjqynoZreUhFzo/XwZOCzU8=
X-Received: by 2002:a17:906:7847:: with SMTP id
 p7mr8518155ejm.335.1632453496131; 
 Thu, 23 Sep 2021 20:18:16 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 24 Sep 2021 13:18:05 +1000
Message-ID: <CAPM=9twLyUfPDxjmJ_+s8G5-JmET36vvGpuWM2TBDNUqEowXDQ@mail.gmail.com>
Subject: [git pull] drm fixes for 5.15-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Linus,

quiet week this week, just some i915 and amd fixes, just getting ready
for my all nighter maintainer summit!

Dave.

drm-fixes-2021-09-24:
drm fixes for 5.15-rc3

i915:
- Fix ADL-P memory bandwidth parameters
- Fix memory corruption due to a double free
- Fix memory leak in DMC firmware handling

amdgpu:
- Update MAINTAINERS entry for powerplay
- Fix empty macros
- SI DPM fix

amdkfd:
- SVM fixes
- DMA mapping fix
The following changes since commit e4e737bb5c170df6135a127739a9e6148ee3da82:

  Linux 5.15-rc2 (2021-09-19 17:28:22 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-09-24

for you to fetch changes up to ef88d7a8a5c94d063311a5581d9a8f0c0e3a99cb:

  Merge tag 'drm-intel-fixes-2021-09-23' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2021-09-24
09:39:17 +1000)

----------------------------------------------------------------
drm fixes for 5.15-rc3

i915:
- Fix ADL-P memory bandwidth parameters
- Fix memory corruption due to a double free
- Fix memory leak in DMC firmware handling

amdgpu:
- Update MAINTAINERS entry for powerplay
- Fix empty macros
- SI DPM fix

amdkfd:
- SVM fixes
- DMA mapping fix

----------------------------------------------------------------
Alex Deucher (1):
      MAINTAINERS: fix up entry for AMD Powerplay

Arnd Bergmann (1):
      drm/amd/display: fix empty debug macros

Chris Wilson (1):
      drm/i915: Free all DMC payloads

Dave Airlie (2):
      Merge tag 'amd-drm-fixes-5.15-2021-09-23' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2021-09-23' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Lijo Lazar (1):
      drm/amd/pm: Update intermediate power state for SI

Maarten Lankhorst (1):
      drm/i915: Move __i915_gem_free_object to ttm_bo_destroy

Philip Yang (4):
      drm/amdkfd: SVM map to gpus check vma boundary
      drm/amdkfd: fix dma mapping leaking warning
      drm/amdkfd: handle svm migrate init error
      drm/amdkfd: fix svm_migrate_fini warning

Radhakrishna Sripada (1):
      drm/i915: Update memory bandwidth parameters

 MAINTAINERS                                  |  4 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_device.c      |  1 -
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c     | 16 +++++++---------
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h     |  5 -----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c         | 24 +++++++++++++++++++-----
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c |  4 ++--
 drivers/gpu/drm/amd/pm/powerplay/si_dpm.c    |  2 ++
 drivers/gpu/drm/i915/display/intel_bw.c      | 19 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dmc.c     |  5 ++++-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  9 +++++----
 10 files changed, 57 insertions(+), 32 deletions(-)
