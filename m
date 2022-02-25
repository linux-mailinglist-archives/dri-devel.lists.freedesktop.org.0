Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF92E4C3B17
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 02:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C169B10E558;
	Fri, 25 Feb 2022 01:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D8510E558
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 01:40:48 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id m11so3470842pls.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 17:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id;
 bh=phQZiyLejGYMxTHbFa3xsON6Zgny1a16s0pfLEAdZkM=;
 b=oiVW6KNbjFFYE1lzVrrYqB+7sjJYxbDIY5N+0p3bpHroJqMRUSvmzBBGpHVNCaxkbz
 sMYbtiQpVo+KtmjX0yT77R0lQgu7PCZapKgmgdDJ6Goo4t0o1E5N48nGi02RZUDbKIzi
 xXd0oUn6u4M4d0bBcYKYraMnYqNPCEtKrqHPuX2fVhCOQrqCZ6ZLjEoxFCihCE9adTwL
 pwpgSkUrekagtHQTYIB4/nH2WgqkEC3mrTHvUClYMj31NxXpu/DYfoeSIm/dh34HhvJ5
 5C1BSRvoL3yL+BJG4hYItge4L/3A8rl2IbrGOSoVha9fKTVkjP2su1vg0ubgh/XBFFMS
 EAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=phQZiyLejGYMxTHbFa3xsON6Zgny1a16s0pfLEAdZkM=;
 b=rkrFHKVjjMBLk4kSEv1ymn+k13hMVYn7fLl/GZfsZOoeWOve9BF5HNlcS3QRBa4JiW
 QrWO+LPQ/MWaVBoZbZoWSnn5y1CLdzLUDlwaTA3/j1iCh1Sv5j3MGMzZC0u+kjDWmDkn
 UOTokf1ip7MVVH37gh5EMzKeFzW7ecjgcZGTgsg8IbOdT3gRaYzwDnBowFlTqgWqk+s/
 K2TYde7KDz900nlYBOl2XAvQSg3sIltzlpNXans1UpyT0NeT2q3OQYIgDsDHa5BicFdC
 yPlWClm6DbOQ3peuqWA2kMGhiXKEqtNzbzpd2R08N1j3B9fBevOZOUtf0lCZJBJXcdex
 ILRQ==
X-Gm-Message-State: AOAM530DTVSHmJqk/ffC0+D8UeoMGKVUDHZ9inXrQ9g7NT5C77sajE3l
 d83mQxLBg3O5MK608+Eab6o=
X-Google-Smtp-Source: ABdhPJx5zYpoEwJCNB8v96rzpLBDXunQhLDTbX2ldAtWjEf32VrmXXu+ORb0mQQ6ro7onrDOFgegAw==
X-Received: by 2002:a17:90a:5213:b0:1b9:c042:3b35 with SMTP id
 v19-20020a17090a521300b001b9c0423b35mr867972pjh.160.1645753248286; 
 Thu, 24 Feb 2022 17:40:48 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 ng5-20020a17090b1a8500b001b8d841f252sm515606pjb.13.2022.02.24.17.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 17:40:47 -0800 (PST)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel.vetter@ffwll.ch
Subject: [GIT PULL] exynos-drm-fixes for rc6
Date: Fri, 25 Feb 2022 10:40:42 +0900
Message-Id: <20220225014042.17637-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

   Just fixups series.

   Ps. my previous git-pull request[1] isn't merged so I'm sending it again
       after rebasing on top of drm-fixes.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

[1] https://www.spinics.net/lists/dri-devel/msg333237.html

The following changes since commit ecf8a99f4807c17fa310a83067a95964cedd9ac1:

  Merge tag 'drm-intel-fixes-2022-02-24' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-02-25 05:51:04 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-v5.17-rc6

for you to fetch changes up to 4188db23285e28d9e9b9096f856cdcd7868005ee:

  drm/exynos: Search for TE-gpio in DSI panel's node (2022-02-25 09:50:48 +0900)

----------------------------------------------------------------
Fixups
- Make display controller drivers for Exynos series to use
  platform_get_irq and platform_get_irq_byname functions
  to get the interrupt, which prevents irq chaning from messed up
  when using hierarchical interrupt domains which use "interrupts"
  property in the node.
- Fix two regressions to TE-gpio handling.

----------------------------------------------------------------
Lad Prabhakar (5):
      drm/exynos/exynos7_drm_decon: Use platform_get_irq_byname() to get the interrupt
      drm/exynos: mixer: Use platform_get_irq() to get the interrupt
      drm/exynos/exynos_drm_fimd: Use platform_get_irq_byname() to get the interrupt
      drm/exynos/fimc: Use platform_get_irq() to get the interrupt
      drm/exynos: gsc: Use platform_get_irq() to get the interrupt

Marek Szyprowski (2):
      drm/exynos: Don't fail if no TE-gpio is defined for DSI driver
      drm/exynos: Search for TE-gpio in DSI panel's node

 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 12 +++---------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c    |  6 ++++--
 drivers/gpu/drm/exynos/exynos_drm_fimc.c   | 13 +++++--------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 13 ++++---------
 drivers/gpu/drm/exynos/exynos_drm_gsc.c    | 10 +++-------
 drivers/gpu/drm/exynos/exynos_mixer.c      | 14 ++++++--------
 6 files changed, 25 insertions(+), 43 deletions(-)
