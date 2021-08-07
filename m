Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A78D3E36AB
	for <lists+dri-devel@lfdr.de>; Sat,  7 Aug 2021 20:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064E189C61;
	Sat,  7 Aug 2021 18:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD09D89C49;
 Sat,  7 Aug 2021 18:33:54 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id c16so11702358plh.7;
 Sat, 07 Aug 2021 11:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F+e3SooHzk+LlYQaG9v32P5P5RuC1GzjFNDE7bWnXxU=;
 b=YfI6lxfAOG2OET1bh5zLHcADMAbiMkPadAy7+H7riBVXl5spMBcXo/HISjFdEUQtYB
 3JrS0bUFUY5TgelVHFfCnfpSPIDWIeFgO8Un0u+dCCpfWSvvWUo5dWu6PZn3eL673Xmu
 0fVtGhMcoTjJ8CjS5oT3j2x3quVjSFLOssCTIL62/ZZPwYeQb6RYiOkcJOJeU9sVJxhf
 fMq+Dx8Ni0k6gRoxgfYw/IyqUGE5shZ105uPamGO7/y/uILu6ztFAtavZb8UVRcn16Lr
 OCeGpxYtLmS+Je8nCGmlplld7jrDcgNIyOI65SDgDW0MdLDfatAxyaOrZFl0XiIoiqkH
 jADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F+e3SooHzk+LlYQaG9v32P5P5RuC1GzjFNDE7bWnXxU=;
 b=TcRvwrSjs3K1XFQoMEmWxOERCl4DMzea1prHItuJ+aPvqt9ddfyILwhbL2Fi1j8Yiu
 mTE545lonh1yoHjjCKskO47yBXjKcFxJv0shB5MFdSbEazVnjZQ3yuKnh/au7mTjD25S
 w7JTbTM0vtMh8NMi4RmbyPa8TAm0SyRpYA86CSjgUqjppDrNTd7hTRI2+0em41uQ+vvd
 nZRNd75IyceE4lCTEc4QixiNcBDwvxLBhamU1//HdGhXbX6ocC5mpH2mZUCuZUBnAfsC
 H9t8+5T17YTCI8aWInFvvKk9gqz6e+f3H2OPlyj7mRjTxaNqUBhtsq8VNZsTo5ZuMSqL
 oD2Q==
X-Gm-Message-State: AOAM530sx1E91Wsi6omy+6bgwB6TBQPzgWx8Sx2vdsXHpYMQmpohh1wA
 ph1SlDqHXJ5dpCZ+GWP1qQwCLYbcLMOvExg0
X-Google-Smtp-Source: ABdhPJzS73oVEfLet7XYlKo2tM804kuGxGgyBQG8GiyiEdJG6r6bk27S0ruQMTqD/d+FDHRA4bcakw==
X-Received: by 2002:a63:4f51:: with SMTP id p17mr139787pgl.29.1628361233656;
 Sat, 07 Aug 2021 11:33:53 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 n33sm16516858pgm.55.2021.08.07.11.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 11:33:52 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>, Jack Zhang <Jack.Zhang1@amd.com>,
 Lee Jones <lee.jones@linaro.org>,
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK), 
 linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
 Luben Tuikov <luben.tuikov@amd.com>, Steven Price <steven.price@arm.com>,
 Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH v2 0/5] dma-fence: Deadline awareness
Date: Sat,  7 Aug 2021 11:37:54 -0700
Message-Id: <20210807183804.459850-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Rob Clark <robdclark@chromium.org>

Based on discussion from a previous series[1] to add a "boost" mechanism
when, for example, vblank deadlines are missed.  Instead of a boost
callback, this approach adds a way to set a deadline on the fence, by
which the waiter would like to see the fence signalled.

I've not yet had a chance to re-work the drm/msm part of this, but
wanted to send this out as an RFC in case I don't have a chance to
finish the drm/msm part this week.

Original description:

In some cases, like double-buffered rendering, missing vblanks can
trick the GPU into running at a lower frequence, when really we
want to be running at a higher frequency to not miss the vblanks
in the first place.

This is partially inspired by a trick i915 does, but implemented
via dma-fence for a couple of reasons:

1) To continue to be able to use the atomic helpers
2) To support cases where display and gpu are different drivers

[1] https://patchwork.freedesktop.org/series/90331/

v1: https://patchwork.freedesktop.org/series/93035/
v2: Move filtering out of later deadlines to fence implementation
    to avoid increasing the size of dma_fence

Rob Clark (5):
  dma-fence: Add deadline awareness
  drm/vblank: Add helper to get next vblank time
  drm/atomic-helper: Set fence deadline for vblank
  drm/scheduler: Add fence deadline support
  drm/msm: Add deadline based boost support

 drivers/dma-buf/dma-fence.c             | 20 +++++++
 drivers/gpu/drm/drm_atomic_helper.c     | 36 ++++++++++++
 drivers/gpu/drm/drm_vblank.c            | 31 ++++++++++
 drivers/gpu/drm/msm/msm_fence.c         | 76 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_fence.h         | 20 +++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  1 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 20 +++++++
 drivers/gpu/drm/scheduler/sched_fence.c | 25 ++++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  3 +
 include/drm/drm_vblank.h                |  1 +
 include/drm/gpu_scheduler.h             |  6 ++
 include/linux/dma-fence.h               | 16 ++++++
 12 files changed, 255 insertions(+)

-- 
2.31.1

