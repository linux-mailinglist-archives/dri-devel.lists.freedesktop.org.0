Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B5D6C9004
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 19:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849DE10E057;
	Sat, 25 Mar 2023 18:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A3810E057
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Mar 2023 18:25:08 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-177ca271cb8so5148877fac.2
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Mar 2023 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679768708;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Zv2AOLFAYteFp+AowBRja2dl0J96TUiqgF3Bi/Fb/iM=;
 b=IIKdUHOjAQX4LSgoR6mF8epmQ26sbpuWHLIo1NIGRoCpGYOoCTb8H8F4UP3vOWDh7I
 N1PqE7GPZMFm862LujqB66zncE5JU41xzs1R3PJfvgMMdezeO/Kp1az7VCs3Pjx8qbCi
 qIXIc2N9Mj2Ou97l+fYvjb4KPyLnY145TN+n3Hj2KK5If4b2zVfPWyIM7lpG7QdpC5Vb
 YdQ/CkzwFpXt0AC6H6Wzb8xEQPF0/a4zrVscL7RIHgjISiNHnsBIRRC14SWYRPFya4Cm
 ShhpARY/FMyqU6jN/KOD5UmDd+MwNngCuqlaMXGYp1pclAYiy6TU2ppIFKWZDs4AI+zr
 P3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679768708;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zv2AOLFAYteFp+AowBRja2dl0J96TUiqgF3Bi/Fb/iM=;
 b=a9XwafaLiflTEHZ1tB2BmqPnJ8Wa99Djj3eBoX4LUKTYJGIXf3ZQ8/K0q5Ji6b1yXk
 Msr4x5nUI6Y4Fomwz+LyZAl2Ud9kDgOPzXIARV0MuLpsmxD85/cQOD9TqJPtjT4AqWF0
 VLw9p631Nlw4MeoXKHG2+gGthi3M2cVd2WrS62PntWa+DC7VvKQwNg5Rwu383jZo26WP
 bmmZFxMug62nE3mEFPh0gDthZRDS2V0dXFUIuMyY+3498KXZroJci5GrCUjEKXB8JTSY
 JA14VjSNzA9AH8VugWUYLyyDxPOqZbJwnuc3j8LEcXleAAlfv/ofkwlVCScj33ef5rev
 XIVQ==
X-Gm-Message-State: AAQBX9erEJfdWOMSiyrHcuLJE2WkBepoeP7v4DzZMupz+VDSmpoHQHBs
 V/vGitg5RvYwL5qIbl8eDBxTI3EGrF/o3sVh9Ho=
X-Google-Smtp-Source: AK7set8beFZbRr14YJRguqanD0yyv+oDy45SsA6pNydyVUekyzmjilf6dFPjjqWR7JHEVeM8c9W17aU3QDUHeG91zug=
X-Received: by 2002:a05:6870:f816:b0:177:aa31:79d6 with SMTP id
 fr22-20020a056870f81600b00177aa3179d6mr4559574oab.4.1679768707685; Sat, 25
 Mar 2023 11:25:07 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 25 Mar 2023 11:24:56 -0700
Message-ID: <CAF6AEGvoP9_FERdL6U8S2O-BVt-oAUgAytbE6RvygsoAOwOHvw@mail.gmail.com>
Subject: [pull] drm: dma-fence-deadline-core for v6.4
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
specific patches, with the intent that it can be merged into drm-next
as well as -driver next trees to enable landing driver specific
support through their corresponding -next trees.

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/dma-fence-deadline-core

for you to fetch changes up to 0bcc8f52a8d9d1f9cd5af7f88c6599a89e64284a:

  drm/atomic-helper: Set fence deadline for vblank (2023-03-25 10:55:08 -0700)

----------------------------------------------------------------
Immutable branch with dma-fence deadline hint support between drm-next
and driver -next trees.

----------------------------------------------------------------
Rob Clark (11):
      dma-buf/dma-fence: Add deadline awareness
      dma-buf/fence-array: Add fence deadline support
      dma-buf/fence-chain: Add fence deadline support
      dma-buf/dma-resv: Add a way to set fence deadline
      dma-buf/sync_file: Surface sync-file uABI
      dma-buf/sync_file: Add SET_DEADLINE ioctl
      dma-buf/sw_sync: Add fence deadline support
      drm/scheduler: Add fence deadline support
      drm/syncobj: Add deadline support for syncobj waits
      drm/vblank: Add helper to get next vblank time
      drm/atomic-helper: Set fence deadline for vblank

 Documentation/driver-api/dma-buf.rst    | 16 ++++++-
 drivers/dma-buf/dma-fence-array.c       | 11 +++++
 drivers/dma-buf/dma-fence-chain.c       | 12 +++++
 drivers/dma-buf/dma-fence.c             | 60 ++++++++++++++++++++++++
 drivers/dma-buf/dma-resv.c              | 22 +++++++++
 drivers/dma-buf/sw_sync.c               | 81 +++++++++++++++++++++++++++++++++
 drivers/dma-buf/sync_debug.h            |  2 +
 drivers/dma-buf/sync_file.c             | 19 ++++++++
 drivers/gpu/drm/drm_atomic_helper.c     | 37 +++++++++++++++
 drivers/gpu/drm/drm_syncobj.c           | 64 ++++++++++++++++++++------
 drivers/gpu/drm/drm_vblank.c            | 53 +++++++++++++++++----
 drivers/gpu/drm/scheduler/sched_fence.c | 46 +++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
 include/drm/drm_vblank.h                |  1 +
 include/drm/gpu_scheduler.h             | 17 +++++++
 include/linux/dma-fence.h               | 22 +++++++++
 include/linux/dma-resv.h                |  2 +
 include/uapi/drm/drm.h                  | 17 +++++++
 include/uapi/linux/sync_file.h          | 59 +++++++++++++++---------
 19 files changed, 496 insertions(+), 47 deletions(-)
