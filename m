Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D134176E8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 16:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA5989F77;
	Fri, 24 Sep 2021 14:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B67B89F77
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 14:35:40 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t7so28034555wrw.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 07:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MTOLvQ4I78zt6RY+lCR1Ik1AuZ7YtbNQ7u/8e2kSZ0A=;
 b=c1FQ2nVbCdDuu/5xwxCwl3icusEtLU09Egiz3FewB8G0JHWzcBkgPi6gAo9Di+dlKO
 l3e2jzaRKP1JnDZLnsKoAzeY6MLXW7zg7xjqYAkDB01cPzGWDZYjNDVZ0cu9K6M3ekFY
 GMMeLOWzNtEU5nfmUWNX8cuFA6493aTdssxPdYF6dafD10xe8BNORDlUQMpSnxWWc83j
 28gmUHxIFyMKMUHTzfE5n5g+74VAbIKgqARjxQcVy3QOAUDxnbBWRFfLOtIy2vTf78i/
 +dG0TAjkdyMmQ8efcBbd/GoXqxrtpRMgxOiqKKloCORoYPNjE7/9z96itOyw2E9Gtv0h
 v83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MTOLvQ4I78zt6RY+lCR1Ik1AuZ7YtbNQ7u/8e2kSZ0A=;
 b=RSMTC1UyWjWS4lejvxLRf24pW05K84ipolIXvPR46B2F9CfGlk4UxWdOaCrHx59vpt
 X0VkvCRQYs18YzDyjPBuDvlfQFV1xOG2NjgXNlu+/reaRT7Gbcd/mIpFH5zn+Y9RR4mW
 4q5jyeQZ0cRmMGA9SwtR/WyS2wnxT3vkqlw6tBrjIYbH0HzEYwELqISfh7bsppQKxuGd
 2Gg344TSD0Lg655Jf3Do6fzUmqSBwCTthhgbwWvuPX5C30NHrj/GtuZB6hRt3NbVowZa
 b7FQxKNMtXRzaFJMLHrdfBeJRQirmdTBX0RoT3KK5o7DWlrKqnkj1Am96PazJJ/r4Frr
 U/iQ==
X-Gm-Message-State: AOAM5332rKuo83CKvsoir222O6ntKZegZsKy63aW7zimZBNd8oLFQPKl
 7LKRJvS4nyVYVwa6sb79+5s=
X-Google-Smtp-Source: ABdhPJxpiQSzILkoGbsFPQV4lat9txI3cXGHbPnfRf1EBuTkMpOTFQkBL0b06XBhIYKC//RxrTZjZg==
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr2585021wmc.108.1632494139010; 
 Fri, 24 Sep 2021 07:35:39 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id c30sm8393016wrb.74.2021.09.24.07.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 07:35:38 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Fixes for v5.15-rc3
Date: Fri, 24 Sep 2021 16:35:37 +0200
Message-Id: <20210924143537.1341882-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
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

Hi Dave,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.15-rc3

for you to fetch changes up to c3dbfb9c49eef7d07904e5fd5e158dd6688bbab3:

  gpu: host1x: Plug potential memory leak (2021-09-16 18:06:52 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.15-rc3

This contains a fix for an UAPI error that happens when no IOMMU is
enabled, as well as a few build warning fixes and plugs a potential
memory leak.

----------------------------------------------------------------
Dmitry Osipenko (3):
      drm/tegra: dc: Remove unused variables
      drm/tegra: uapi: Fix wrong mapping end address in case of disabled IOMMU
      gpu/host1x: fence: Make spinlock static

Thierry Reding (1):
      gpu: host1x: Plug potential memory leak

 drivers/gpu/drm/tegra/dc.c   | 3 ---
 drivers/gpu/drm/tegra/dc.h   | 6 ------
 drivers/gpu/drm/tegra/uapi.c | 2 +-
 drivers/gpu/host1x/fence.c   | 6 ++++--
 4 files changed, 5 insertions(+), 12 deletions(-)
