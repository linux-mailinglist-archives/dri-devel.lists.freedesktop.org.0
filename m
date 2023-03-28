Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816DC6CCD44
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 00:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7373210E4A5;
	Tue, 28 Mar 2023 22:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF1710E4A5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 22:34:14 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 f19-20020a9d5f13000000b00693ce5a2f3eso7251562oti.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680042853;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LQkDgg9vRxmw6OR2ZcWKh/O2EZ+U208KlBquhlXylKk=;
 b=lJbb7OKeGfSEi9V5+N2I0ScWhsHffGoOv4pJ2AxMX3zd8SMyEnOKU6HHw75B0uNTou
 iC3LHUwMWDxs4QeT46toqjrLWUj7RlZRz7mV1hsg3xs1GE0c7lMIX+0Nj5rLGcewZ0Rk
 cHgpvfi/U8Dy1g1MEZUXnU1djnhYcElvBy1SGa2eX1Qs/Tjn/NVtGCGtS0SwnAUjoQIf
 vTjPBMXGzcU0sb2KA+SqcGUjv455PYBUu0iQ0pkQMdLJq0b+kqt9UtHEdTE3yE+0SjR0
 7HCbhRt6VVW3LXtfck2jN0HdYXLlp+fgYOTZtwjQumyzUxLNSjoxErmTO+tmEENn1Qcw
 5g1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680042853;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LQkDgg9vRxmw6OR2ZcWKh/O2EZ+U208KlBquhlXylKk=;
 b=J4bcDc5SKtPHEqZpxLNX1qAnGW4QrG3gPCD+APqQP/hJMibNee4ZZ8LLXuv7jx96UG
 0IZRXPHGDGuf4PvYJ7escJWlZtrf6GODPSWzU0BWDl7JsDNCavC1j5ZxCqDUZeoY+1D6
 DdYZdOEjtHHJFSKzCVYQppIkQR29rFA8mOww5l7+MHu1vV3BQa1Tdt2AIYm+1B8UauG8
 Snv09DhFce0/WQ6gN3xlPeJ0oA/kkHlScDzih3Qa+t1s9rPi8qGVanolXYsGJbbbAZJO
 ScMm3BeUDPNhmVD3IwdohmQqa/P9i7GIfEudF3BODXZQuQSDbvkM/Rxtkm3fZKiMj3hi
 fzhg==
X-Gm-Message-State: AO0yUKVeD4/kf3VjQXcLlT8JU8dFSF3L8en/baSJuERPFr3Agv6CTuzv
 JBqO9l09wdWphSIFPJchel/ZCXZrrU8ucEncHwg/T1TBCNM=
X-Google-Smtp-Source: AK7set8tvdwF8ZdoVo5bXcV3/xC2jpDyF11C+vSLHDAxnOuyLEsUpC4swbAUBD1WnDRBJrSvWP/XtbmFiHhzZJ8xmlw=
X-Received: by 2002:a9d:67d0:0:b0:68b:cd1e:1ef1 with SMTP id
 c16-20020a9d67d0000000b0068bcd1e1ef1mr5904971otn.7.1680042853372; Tue, 28 Mar
 2023 15:34:13 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Mar 2023 15:34:02 -0700
Message-ID: <CAF6AEGt5nDQpa6J86V1oFKPA30YcJzPhAVpmF7N1K1g2N3c=Zg@mail.gmail.com>
Subject: [pull] drm: dma-fence-deadline for v6.4
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here is the series for dma-fence deadline hint, without driver
specific patches, or UAPI, with the intent that it can be merged into
drm-next as well as -driver next trees to enable landing driver
specific support through their corresponding -next trees.

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/dma-fence-deadline

for you to fetch changes up to d39e48ca80c0960b039cb38633957f0040f63e1a:

  drm/atomic-helper: Set fence deadline for vblank (2023-03-28 14:52:59 -0700)

----------------------------------------------------------------
This series adds a deadline hint to fences, so realtime deadlines
such as vblank can be communicated to the fence signaller for power/
frequency management decisions.

This is partially inspired by a trick i915 does, but implemented
via dma-fence for a couple of reasons:

1) To continue to be able to use the atomic helpers
2) To support cases where display and gpu are different drivers

See https://patchwork.freedesktop.org/series/93035/

This does not yet add any UAPI, although this will be needed in
a number of cases:

1) Workloads "ping-ponging" between CPU and GPU, where we don't
   want the GPU freq governor to interpret time stalled waiting
   for GPU as "idle" time
2) Cases where the compositor is waiting for fences to be signaled
   before issuing the atomic ioctl, for example to maintain 60fps
   cursor updates even when the GPU is not able to maintain that
   framerate.

----------------------------------------------------------------
Rob Clark (8):
      dma-buf/dma-fence: Add deadline awareness
      dma-buf/fence-array: Add fence deadline support
      dma-buf/fence-chain: Add fence deadline support
      dma-buf/dma-resv: Add a way to set fence deadline
      dma-buf/sync_file: Surface sync-file uABI
      drm/scheduler: Add fence deadline support
      drm/vblank: Add helper to get next vblank time
      drm/atomic-helper: Set fence deadline for vblank

 Documentation/driver-api/dma-buf.rst    | 16 +++++++--
 drivers/dma-buf/dma-fence-array.c       | 11 ++++++
 drivers/dma-buf/dma-fence-chain.c       | 12 +++++++
 drivers/dma-buf/dma-fence.c             | 59 +++++++++++++++++++++++++++++++++
 drivers/dma-buf/dma-resv.c              | 22 ++++++++++++
 drivers/gpu/drm/drm_atomic_helper.c     | 37 +++++++++++++++++++++
 drivers/gpu/drm/drm_vblank.c            | 53 ++++++++++++++++++++++++-----
 drivers/gpu/drm/scheduler/sched_fence.c | 46 +++++++++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
 include/drm/drm_vblank.h                |  1 +
 include/drm/gpu_scheduler.h             | 17 ++++++++++
 include/linux/dma-fence.h               | 22 ++++++++++++
 include/linux/dma-resv.h                |  2 ++
 include/uapi/linux/sync_file.h          | 37 +++++++++------------
 14 files changed, 303 insertions(+), 34 deletions(-)
