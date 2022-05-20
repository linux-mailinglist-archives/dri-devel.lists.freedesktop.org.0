Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF152F457
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 22:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D9610E650;
	Fri, 20 May 2022 20:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FAD10E650
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 20:24:51 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id wh22so17443101ejb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 13:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=6rMPX8mUsyo3iaheF+6iJz3U2Wf9KckgyYK/6DZ7bVw=;
 b=JTZwG5H239H50Auny8sNxLSLFj9utsy568CrStcW2vVJCujdFakU2ugWfxbuD95qqi
 pg1Y2gg0OGy8O3b+LCN60H1hLNAao4OE8K2E6uIIOPeDXPvspEa7EmOOhbQuHeJ6d1CS
 SByq7ZEYpzqdV5beTQpLjvmpc4dfsc5tkJ+/2ZAGBzCaGLLRotPeMcgD/FF5TCglf0J8
 nhJfXh4ctlqezf6h6TTCoZXaPfsVFhh9hXZ2Vfe6+sv/sASXpSkw0JRlf0RvbuTENdBT
 ggPCsXvcvddoukjxikTBz4+kjEqHJbt/T+h+ICWXPiZ7FSPlOOf4KHHtV55zpr6hYMyY
 RRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=6rMPX8mUsyo3iaheF+6iJz3U2Wf9KckgyYK/6DZ7bVw=;
 b=5byGRQOqz0ieyYgt07w+YCrjd+dyzI005XBjC++hKzUV1QqPRql/jM+7yaKWqbmdmP
 y95zCqmlsnh1ZnYeADUEGMtYeAWjoBQ6fQ4hgDej0HQJWN9BnckmRSVgRrrZz3GVzn9D
 lgrO5wOkZc9cKHh/YUrMu25NzDmx1y0DRGMsKDx22QoP/44B33/M6PEmzT8NzKRB2Vjr
 TUr5K7913OkPrSfrw4Wsb51D0lIXENOi26bEAQ2Y9T8GhyUsp0rCBtxu5yGXh/UHr2RD
 ZIR2wqn1lJzl/q8OXSXZJ5V6Z0RxYDS3TLB3nTc/FGVT7xf0PTmfTo5C3+3TkHPXsV0s
 4i/g==
X-Gm-Message-State: AOAM532+VVL8m98nPSQweWWxc0TAAq0z8d4UBrw9dOMc0TwJiPwnR8lO
 I3kfzXAtvpW3M/Xs9oHqQup9rJqyLAIcQYWRx7w=
X-Google-Smtp-Source: ABdhPJxE1rbJtMSc/HTu9HH6yTuwqBnYws4BvdrX//bs1Hp4U0bTuoPHYgYaDuuR4vTjvOGErcSSeKbZoUz+LdxJPdw=
X-Received: by 2002:a17:907:1c0b:b0:6f5:64f4:91df with SMTP id
 nc11-20020a1709071c0b00b006f564f491dfmr10461256ejc.750.1653078290185; Fri, 20
 May 2022 13:24:50 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 21 May 2022 06:24:38 +1000
Message-ID: <CAPM=9tzncFLvW9htq+=r=BRT=2AiU58MEpvO0JikaBoUy3Kebw@mail.gmail.com>
Subject: [git pull] drm fixes for 5.18 final
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

Few final fixes for 5.18, one amdgpu, core dp mst leak fix, dma-buf
two fixes, and i915 has a few fixes, one for a regression on older
GM45 chipsets,

Regards,
Dave.

drm-fixes-2022-05-21:
drm fixes for 5.18 final

dma-buf:
- ioctl userspace use fix
- fix dma-buf sysfs name generation

core:
- dp/mst leak fix

amdgpu:
- suspend/resume regression fix

i915:
- fix for #5806: GPU hangs and display artifacts on 5.18-rc3 on Intel GM45
- reject DMC with out-of-spec MMIO
- correctly mark guilty contexts on GuC reset.
The following changes since commit 42226c989789d8da4af1de0c31070c96726d990c=
:

  Linux 5.18-rc7 (2022-05-15 18:08:58 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-05-21

for you to fetch changes up to 64eea6805ecf7092a113bdb4cb73860430d39de6:

  Merge tag 'drm-intel-fixes-2022-05-20' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-05-21
06:01:57 +1000)

----------------------------------------------------------------
drm fixes for 5.18 final

dma-buf:
- ioctl userspace use fix
- fix dma-buf sysfs name generation

core:
- dp/mst leak fix

amdgpu:
- suspend/resume regression fix

i915:
- fix for #5806: GPU hangs and display artifacts on 5.18-rc3 on Intel GM45
- reject DMC with out-of-spec MMIO
- correctly mark guilty contexts on GuC reset.

----------------------------------------------------------------
Anusha Srivatsa (1):
      drm/i915/dmc: Add MMIO range restrictions

Charan Teja Kalla (1):
      dma-buf: ensure unique directory name for dmabuf stats

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-5.18-2022-05-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2022-05-20' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2022-05-20' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Hangyu Hua (1):
      drm/dp/mst: fix a possible memory leak in fetch_monitor_name()

J=C3=A9r=C3=B4me Pouiller (1):
      dma-buf: fix use of DMA_BUF_SET_NAME_{A,B} in userspace

Maarten Lankhorst (1):
      drm/i915: Use i915_gem_object_ggtt_pin_ww for reloc_iomap

Mario Limonciello (1):
      drm/amd: Don't reset dGPUs if the system is going to s2idle

Umesh Nerlige Ramappa (1):
      i915/guc/reset: Make __guc_reset_context aware of guilty engines

 drivers/dma-buf/dma-buf.c                         |  8 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c          | 14 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           |  2 +-
 drivers/gpu/drm/dp/drm_dp_mst_topology.c          |  1 +
 drivers/gpu/drm/i915/display/intel_dmc.c          | 44 +++++++++++++++++++=
++++
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c    |  6 ++--
 drivers/gpu/drm/i915/gt/intel_reset.c             |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 16 ++++-----
 drivers/gpu/drm/i915/gt/uc/intel_uc.c             |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h             |  2 +-
 drivers/gpu/drm/i915/i915_reg.h                   | 16 +++++++++
 include/uapi/linux/dma-buf.h                      |  4 +--
 14 files changed, 102 insertions(+), 19 deletions(-)
