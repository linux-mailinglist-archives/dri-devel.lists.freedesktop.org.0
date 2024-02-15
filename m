Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB8D856A8C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2DD10E9F9;
	Thu, 15 Feb 2024 17:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lPVRb1d8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C58010E5B9;
 Thu, 15 Feb 2024 17:07:07 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5620c778052so1446726a12.0; 
 Thu, 15 Feb 2024 09:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708016826; x=1708621626; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NaFZCKNRyy9AI0T22Z2pSTOZSHkLFwL4nJxKMKuEj5w=;
 b=lPVRb1d80zRdTKAhEheduJRwQKFwbU/M8J7BMqGG2NcJH7oaLeL4yd+v6jO4fDJUQv
 cGlRaf3KF3tOM2oFwi9Dzb9YUyqNwnaM/ZnsA6akeQf3Q+EAE5TzK82FdhoFOtn8pEmY
 zHBjXvbhBxXREz3V1jlfh/CA6hSxqq7dTdcGithRadhqA0DTWNkkyagfdH830FSiXHQn
 5fBApj6ZTuXB7vEu5eYubP7NbS9jKUBG1fHEs3zi8w/zEGphPc9wYvFncW1UoGOyi2v0
 QBm+2Mew78RXHNh8LSY6mqqTEd8AbborKpFmCus4oyVMKGxa+0yBwEZVoU/dDsdISnDh
 lh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708016826; x=1708621626;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NaFZCKNRyy9AI0T22Z2pSTOZSHkLFwL4nJxKMKuEj5w=;
 b=bu1NBCn3eKrQ6UwWv93gqPyNdcF0FuvzXBFNmWrk+BgPpCVW3xYdpP8kJELpr9hRHC
 0uyNqFtXxshTO5kDl+UPEoTpN3a0BpFAmUklplR3JAtaqWJhdaMsHvHsEmh6VqD6/bwt
 E+034edzNdM0KMp52d8AkCoNSNYL7g9DgiklQsDMGuBebOF1mltgsRT25xx4eMeD6+qC
 t+REl/dVo2HoTB11ZKzhVZXLdPjpMHQknaPIt8QoJVa6tHeavW2je+QQUCoiUrxKrYwj
 IfT8mZzWc7xnSi7px0ggZYPW0XbV5WMp+9GhxKawTp1UAzWofTUSEPAEQ8iAgyu0vWUP
 eVgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKn362y7zyO/ZDuQ6s4fVkHJ77d/tuQjQaY8b1koT4prvrqkDHJllyH1TQDkmV3znM7YiSox1VmttgeWvsHvd15t6xX80W8vBS6p78df7X
X-Gm-Message-State: AOJu0YxY0qhFO1ISbvirJziEGmhyC7FRSEm2IRRjbhtLyZakJORpI/U8
 Ms5KfC1EZ1dqp+2LPTTyjYOdFQeHD0O+hKd/CdUlg5ETaEHDiVZFGi/p+iMPn4zZxIbx5tx98BR
 PG6fYPvwfPrDYt/rlNx4amGDMIFQ=
X-Google-Smtp-Source: AGHT+IHQnssP+8eYTlr7x1l/6mWdxxayrT6Dpil17YQWLjvn/WEv95g6hveEQFy6V7FoCfJZi+1coBgfQdZsV9QNqNw=
X-Received: by 2002:a05:6402:268f:b0:563:cb4d:80a6 with SMTP id
 w15-20020a056402268f00b00563cb4d80a6mr1039139edd.16.1708016825489; Thu, 15
 Feb 2024 09:07:05 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 Feb 2024 09:06:53 -0800
Message-ID: <CAF6AEGszDSiw66+a=ttBr-hat+zrcBtfc_cZ4LQqXu89DJ0UeQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2024-02-15 for v6.8-rc5
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Hi Dave,

Another fixes pull, this time actually including the GPU fixes left
out of last week's fixes due to miss-applied label, plus addition of a
tlb invalidation fix.  Description below.

The following changes since commit 8d35217149daa33358c284aca6a56d5ab92cfc6c:

  drm/msm/mdss: specify cfg bandwidth for SDM670 (2024-01-25 14:36:04 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2024-02-15

for you to fetch changes up to 8c7bfd8262319fd3f127a5380f593ea76f1b88a2:

  drm/msm: Wire up tlb ops (2024-02-15 08:51:31 -0800)

----------------------------------------------------------------
Fixes for v6.8-rc5

GPU:
- dmabuf vmap fix
- a610 UBWC corruption fix (incorrect hbb)
- revert a commit that was making GPU recovery unreliable
- tlb invalidation fix

----------------------------------------------------------------
Dmitry Baryshkov (1):
      drm/msm/a6xx: set highest_bank_bit to 13 for a610

Rob Clark (3):
      drm/msm/gem: Fix double resv lock aquire
      Revert "drm/msm/gpu: Push gpu lock down past runpm"
      drm/msm: Wire up tlb ops

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_gem_prime.c   |  4 ++--
 drivers/gpu/drm/msm/msm_gpu.c         | 11 +++++------
 drivers/gpu/drm/msm/msm_iommu.c       | 32 +++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_ringbuffer.c  |  7 +++++--
 5 files changed, 42 insertions(+), 14 deletions(-)
