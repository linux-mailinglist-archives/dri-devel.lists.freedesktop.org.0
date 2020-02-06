Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F068D154A34
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 18:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7676FAD0;
	Thu,  6 Feb 2020 17:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115EC6FAD0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 17:27:59 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id b17so1000936wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 09:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GoPHJNkYrWrAAYhDknAJRzG2TQROB7g+UrDNyYdeF6I=;
 b=j20XkOpbb521H8AmSZohb+SUmlpF2+iQ1dSFIoOgpjLopwZAR051IT2dIx+E0Bpe/g
 Q6mJ4PK5KtZYUwDjV4ii9PE5OO6FScXy1bGO5C+kyvqd+RQtbjJqRdKgcz+lNC0bfahs
 IClYgc6QCiG0xrDGith5AIFHF+UKPyTo+Nrj7/PqpnH9XgKTRDZrAvB2PD5sEastmS+X
 /0ppjNqyD716zM2VQYZpsVbNPSxWWb7eHQkj9L90xe9k5DRHRAeoqd1fip68egXdAWkl
 whUoCyOWw2F4V59y/LpcwizN3Bz57+IzWO3Z4vs+tQeZ5OEUCY8LPrdm4Qkbi7QCNyyH
 96oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GoPHJNkYrWrAAYhDknAJRzG2TQROB7g+UrDNyYdeF6I=;
 b=QgnYm1KD8ZDrceG1VMgzfimq4Gvfof4pUu2jRY5qdb35CvVFHyu7GtjRlQw1+x+BDe
 lFG54diC2Yjg9hhM7Gc5gPOwDcsTnQXxK39AVKMQa24f7/5J/X/qXZYDKGLl2OanPsI/
 1fMTSNYYO5t+ZaNUFeqNOHEpxiLyGmfcBWmuuzxwc1EB3zY1NJ5tY/7mdojMzW1LXmX8
 bPu+bMdLtlphMNxBINPOq7zf1uUzls/zETyhy/PJKMwg7C7EGzxTq9Qd/zcQxzYhLmjU
 I5jNyH3N1qeGUq5I34H7Eo2S/FEN8YA0MMBFgKG9v8zvfIGy7gBynYA0h5ESLvRtDF1Z
 Q7Wg==
X-Gm-Message-State: APjAAAW/3TifyJ246F1WR35TKc/jTruCl4q92jzat4ReMVaTCCFOR6F6
 SsfL4R5CdAUFvab/4kYK7nM=
X-Google-Smtp-Source: APXvYqwaOeI4fa6bruuHqRk00hB1htVU++pE61frXxam4Oa7kGCIpB5yOx295HFAD/APhEMrcIYoaw==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr5828873wmi.116.1581010077707; 
 Thu, 06 Feb 2020 09:27:57 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
 by smtp.gmail.com with ESMTPSA id w1sm5280224wro.72.2020.02.06.09.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 09:27:56 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL] drm/tegra: Fixes for v5.6-rc1
Date: Thu,  6 Feb 2020 18:27:53 +0100
Message-Id: <20200206172753.2185390-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

The following changes since commit 033ccdb7f6b11701623507339646013b4ce389d3:

  gpu: host1x: Remove dev_err() on platform_get_irq() failure (2020-01-10 17:05:12 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.6-rc1-fixes

for you to fetch changes up to 98ae41adb252866158dd4e998551dfa85e612bed:

  gpu: host1x: Set DMA direction only for DMA-mapped buffer objects (2020-02-06 18:23:12 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.6-rc1

These are a couple of quick fixes for regressions that were found during
the first two weeks of the merge window.

----------------------------------------------------------------
Thierry Reding (6):
      drm/tegra: sor: Suspend on clock registration failure
      drm/tegra: sor: Disable runtime PM on probe failure
      drm/tegra: sor: Initialize runtime PM before use
      drm/tegra: Relax IOMMU usage criteria on old Tegra
      drm/tegra: Reuse IOVA mapping where possible
      gpu: host1x: Set DMA direction only for DMA-mapped buffer objects

 drivers/gpu/drm/tegra/drm.c   | 49 ++++++++++++++++++++++++++++---------------
 drivers/gpu/drm/tegra/gem.c   | 10 ++++++++-
 drivers/gpu/drm/tegra/plane.c | 44 +++++++++++++++++++++-----------------
 drivers/gpu/drm/tegra/sor.c   | 49 ++++++++++++++++++++++++-------------------
 drivers/gpu/host1x/job.c      | 34 ++++++++++++++++++++++++++----
 5 files changed, 123 insertions(+), 63 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
