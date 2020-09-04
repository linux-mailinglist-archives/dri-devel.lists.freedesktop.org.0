Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCEA25E389
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 23:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3886ECDE;
	Fri,  4 Sep 2020 21:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352516ECDE;
 Fri,  4 Sep 2020 21:59:50 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id b79so8011979wmb.4;
 Fri, 04 Sep 2020 14:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=U3spfXQmO2BRaJHGudjEyITOjhah8je6NW5iKf3Fh4I=;
 b=KDlxzvn+rzpjApnqElJuPXhCljKoqyBKG8f9WahNk8FJP53EPszdWs4t0tUp47I5LK
 h8ZU0d/IJdzanRthbzPkmPvhkv9nKflt7eXoaKINWiv4OECggyf4IxXx6Rw0ir1rycJU
 ufwzMfgnzZILJP6rQIq0MCEcaWPwySvaUln+Bvou7nflu3Em3fxFHkab9HFc/nCR94dO
 lQa2XCQylWTs3VYDOsI0PtJJfrIxh5lyceNr7s/psh0FZeEy1LVYpZDFiQdtoGpDDe2M
 ADvu3ouE4OnQlpB0Cs903L9F++qyXfWOmQN2z4kdHbyOqYStcZubrcJejSSS6pCgSo7m
 3ABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=U3spfXQmO2BRaJHGudjEyITOjhah8je6NW5iKf3Fh4I=;
 b=kl4xwZSMcuGES8Zsg3OpjZ/AGV9PzSjjtw2H3eQ5uqQgnB6svlZIwRodAYAQaKsFCz
 qs9KOjIycSnyE56rI8dlIqK31VsKWjCyweAVGYowd4RfsRNvZjxV0ElFuedu1shNlCnm
 Fu2fKGW6geq1DvPTHIELh5QThEqkIDb3Wo6U0HuvvTdlJMKMiQnFhkM1rSi/ArNcHDyW
 nG0/nW+HrZd6ojoiJvd0YhwEoyAFj8QqMiMztOjtmri9wcHCnzjizqspw/7YFxEuDoDk
 sG1udyBUg3VIAAstiTagh+pjuAqRvvHGjyGE62g+3b0SpawClULcgNw1nWVoutQFQbib
 Js8g==
X-Gm-Message-State: AOAM533juGqncB4tPVRMrdZrul4Ac6/SXwA867xLk0TA/Cc3KbtQof9O
 6bvcsjWSSqQs3Gtly6nHUdmDxr1cT+g2oYmcTkg=
X-Google-Smtp-Source: ABdhPJzQSXMefTwCwfsJ62JIXHVJSF1qjBmc0EIMobb5Rax3AVQbmJefcrTwN92VWnLnNYppDlINyPj2nR+DcvuvCfM=
X-Received: by 2002:a1c:2dcb:: with SMTP id t194mr9134014wmt.94.1599256788672; 
 Fri, 04 Sep 2020 14:59:48 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 4 Sep 2020 15:00:44 -0700
Message-ID: <CAF6AEGvnr6Nhz2J0sjv2G+j7iceVtaDiJDT8T88uW6jiBfOGKQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2020-09-04
To: Dave Airlie <airlied@gmail.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

A few fixes for a potential RPTR corruption issue.

The following changes since commit 5e0c22d4a9ddae4e784a3e171b9d3d452b37aeb2:

  drm/msm/a6xx: fix frequency not always being restored on GMU resume
(2020-08-22 10:56:45 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2020-09-04

for you to fetch changes up to f6828e0c4045f03f9cf2df6c2a768102641183f4:

  drm/msm: Disable the RPTR shadow (2020-09-04 12:14:15 -0700)

----------------------------------------------------------------
Jordan Crouse (4):
      drm/msm: Split the a5xx preemption record
      drm/msm: Enable expanded apriv support for a650
      drm/msm: Disable preemption on all 5xx targets
      drm/msm: Disable the RPTR shadow

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c     |  5 +++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c     | 10 ++++++++++
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c     | 10 ++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 14 +++++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 25 ++++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 13 ++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 27 ++-------------------------
 drivers/gpu/drm/msm/msm_gpu.c             |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h             | 11 +++++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c      |  4 ++--
 11 files changed, 85 insertions(+), 37 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
