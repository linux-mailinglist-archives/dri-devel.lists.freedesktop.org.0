Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8709D3D970C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 22:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400466E1F6;
	Wed, 28 Jul 2021 20:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4A36E1B2;
 Wed, 28 Jul 2021 20:48:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so2515348wmg.4; 
 Wed, 28 Jul 2021 13:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=551JLf4qkCIkFNPA0Ob7V07KiCMSizDSmiG+dlVt4JM=;
 b=kfQE7nB8u8dzYzo+hiTJbRyWXFI/3gCqNjtJSQ10P4RMrxzqUeOlyYi7/ni7LLFaAu
 a4BGADbORUT7BIR0lnkbwosqRYGVv8kmQziHKuGxk7lRL6Zwcd0OggZXbJwKVI+8G4ai
 +Pu8lqF3Wdnw9FiJcN+4DKAM5R5jOzwydeRj7yY9az8gqus9GTZEARLlT9Cid3Qy1rO8
 eD/qdzFYnaIDgCazhCb7oy4xnjpmZPCzlm5ufSanRZEhp2FV/SEV5PiN74a3CsqZXZGa
 E2TkokZrDGDruLrx6Mrcgfdl0SzhqUwyQTbeAQTBVUtlFC7Aw1OOz4cMkDRx8s8EyYKK
 j4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=551JLf4qkCIkFNPA0Ob7V07KiCMSizDSmiG+dlVt4JM=;
 b=AaRiHeXjn/0UAQWqsn74e9Cztl5+7k4VkFp1AKmgZVf5SecvdYsO7mafEs/6gEkkEl
 fCLMT8CHbzNOaHXGX6qXQLkV4Ttwi4tc+YulJkUOYtbDGcsz0apZeNxCRrJmnVK5sUt6
 MA7B9GTd7ZpBj+l4K1WUgcU8I5P3ubQ4N656rCZjhdPo6+Eh2nAQUETf+jQiqFAnICEN
 3INT842uE7E//QnFU1BP0nKP6Yp2HuWzp7pLjJLI40//CZUid5ptq5Qjb48dIwdq2219
 G5RAd9M3NNQnNykUgpTA4K3RhKk6jBBhy2vj7+GZgEfqbCCgt5/CKMqkwfhtWMowE1NO
 TTrw==
X-Gm-Message-State: AOAM531dHNz8fZbLSrYaaKxNOw+RMU3EVg7bUageqwS8C75fzptjrkwr
 ONfPBFtc77pwHTVEv9sU+5Q8fqCtbFNygnuJnTRdln6djOpcQA==
X-Google-Smtp-Source: ABdhPJwouLvhME8/x0uZtoF54DhLPEB9DXJ10yPUymnb4k09k+KAbp5Zsrws2GUQ7HnHVAkgkgXWRnBFA//zK0futiE=
X-Received: by 2002:a05:600c:19cb:: with SMTP id
 u11mr1356981wmq.175.1627505312189; 
 Wed, 28 Jul 2021 13:48:32 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 Jul 2021 13:52:42 -0700
Message-ID: <CAF6AEGumRk7H88bqV=H9Fb1SM0zPBo5B7NsCU3jFFKBYxf5k+Q@mail.gmail.com>
Subject: [early pull] drm/msm: drm-msm-next-2021-07-28 for v5.15
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

An early pull for v5.15 (there'll be more coming in a week or two),
consisting of the drm/scheduler conversion and a couple other small
series that one was based one.  Mostly sending this now because IIUC
danvet wanted it in drm-next so he could rebase on it.  (Daniel, if
you disagree then speak up, and I'll instead include this in the main
pull request once that is ready.)

This also has a core patch to drop drm_gem_object_put_locked() now
that the last use of it is removed.

The following changes since commit ff1176468d368232b684f75e82563369208bc371:

  Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-07-28

for you to fetch changes up to 4541e4f2225c30b0e9442be9eb2fb8b7086cdd1f:

  drm/msm/gem: Mark active before pinning (2021-07-28 09:19:00 -0700)

----------------------------------------------------------------
Rob Clark (18):
      drm/msm: Let fences read directly from memptrs
      drm/msm: Signal fences sooner
      drm/msm: Split out devfreq handling
      drm/msm: Split out get_freq() helper
      drm/msm: Devfreq tuning
      drm/msm: Docs and misc cleanup
      drm/msm: Small submitqueue creation cleanup
      drm/msm: drop drm_gem_object_put_locked()
      drm: Drop drm_gem_object_put_locked()
      drm/msm/submit: Simplify out-fence-fd handling
      drm/msm: Consolidate submit bo state
      drm/msm: Track "seqno" fences by idr
      drm/msm: Return ERR_PTR() from submit_create()
      drm/msm: Conversion to drm scheduler
      drm/msm: Drop submit bo_list
      drm/msm: Drop struct_mutex in submit path
      drm/msm: Utilize gpu scheduler priorities
      drm/msm/gem: Mark active before pinning

 drivers/gpu/drm/drm_gem.c                   |  22 --
 drivers/gpu/drm/msm/Kconfig                 |   1 +
 drivers/gpu/drm/msm/Makefile                |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
 drivers/gpu/drm/msm/msm_drv.c               |  30 ++-
 drivers/gpu/drm/msm/msm_fence.c             |  53 +----
 drivers/gpu/drm/msm/msm_fence.h             |  44 +++-
 drivers/gpu/drm/msm/msm_gem.c               |  94 +-------
 drivers/gpu/drm/msm/msm_gem.h               |  47 ++--
 drivers/gpu/drm/msm/msm_gem_submit.c        | 344 +++++++++++++++++-----------
 drivers/gpu/drm/msm/msm_gpu.c               | 220 ++++--------------
 drivers/gpu/drm/msm/msm_gpu.h               | 139 ++++++++++-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c       | 203 ++++++++++++++++
 drivers/gpu/drm/msm/msm_rd.c                |   6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c        |  69 +++++-
 drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
 drivers/gpu/drm/msm/msm_submitqueue.c       |  53 +++--
 include/drm/drm_gem.h                       |   2 -
 include/uapi/drm/msm_drm.h                  |  14 +-
 26 files changed, 865 insertions(+), 536 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_gpu_devfreq.c
