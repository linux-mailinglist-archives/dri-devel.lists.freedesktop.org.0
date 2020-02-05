Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F464152552
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 04:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1AB6E1E2;
	Wed,  5 Feb 2020 03:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A309E6E188;
 Wed,  5 Feb 2020 03:49:03 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id r67so366815pjb.0;
 Tue, 04 Feb 2020 19:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xixvHYvIkLFZvO6qPeg86tn6UQatr2aa3culU6iJC14=;
 b=q/vjlpQqPwdHWgCCZx0aK7E+LNzRHbtBQmoQwbc+ndwcBpqgtkWWzEwaf3HozvL1VY
 774e1P48FG6CH07VtBWlxE1JWRU4T5dDmPQ0MGWus+tpVR8X8xs37XB/VSgVWxsA/zof
 x7O/I3BxYMZLGLM5XV85xgsUyjxOO46ojPOJMhlBDW1VkR8JLHPREW6gW36juq/DWtMw
 t6nx/vTFQDEMr26QbIj+RFNe4ExcRO78P1YwR/Vklj7DPPYG6C+bWgrVSwf3PpO/UJVb
 iHFmdzsKYMe2i7ucdMkweykq3Ipei145b/bV6FN+DmYtfqBPawE10EwRtrdwAM2i3P0Z
 VFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xixvHYvIkLFZvO6qPeg86tn6UQatr2aa3culU6iJC14=;
 b=Qz7j7nQYORtqIdsAweH9edRQcK31HyrlJefI+8VIzsiAA26EIJUCLFyHN6xz9aWzW4
 G8KUpySakxEzBJ6h2BB2Q83tE7FO+Rlz+LFlt1gdCUgIQwhKfUXJVcmRm/WIHAxta4/F
 7SsohmxMeL2cFr5vzcDsnMQJazNLuKlwa2KwabaJVq+3mtCKHV74H5G5BGHTcsfUmkvi
 ByA++nkziax8xxIa/ShmltPfEs01tW4E5kpS8w6a7aVkYxsgVmKqjZCM2bZ1liGh2mO+
 LOUaA+DyocN++NH/XL0c+agR0+0rjownDF5XDhIsUvtcKGA1Iquqv7K53ndtdOLjgyeY
 qJxQ==
X-Gm-Message-State: APjAAAWXqXgvSg/C2yLDJReoR9qhOczMkHTik5UzHsyttEX7fM80beym
 9Fwi3HN+kTGJtxJY69VQPN1DeUji
X-Google-Smtp-Source: APXvYqxNNb+ZXnw8eDTqSivWo9FcGoInQe1wuDwrPm8i3JNXg8rWhuWe/P9GRQv7IL+gP1HBWQ6G8w==
X-Received: by 2002:a17:90a:178f:: with SMTP id
 q15mr3248914pja.132.1580874542683; 
 Tue, 04 Feb 2020 19:49:02 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id 200sm25320292pfz.121.2020.02.04.19.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 19:49:02 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/14] amdgpu: remove load and unload callbacks
Date: Tue,  4 Feb 2020 22:48:38 -0500
Message-Id: <20200205034852.4157-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are deprecated and the drm will soon start warning when drivers still
use them.  It was a long and twisty road, but seems to work.

Alex Deucher (14):
  drm/amdgpu: rename amdgpu_debugfs_preempt_cleanup
  drm/amdgpu/ttm: move debugfs init into core amdgpu debugfs
  drm/amdgpu/pm: move debugfs init into core amdgpu debugfs
  drm/amdgpu/sa: move debugfs init into core amdgpu debugfs
  drm/amdgpu/fence: move debugfs init into core amdgpu debugfs
  drm/amdgpu/gem: move debugfs init into core amdgpu debugfs
  drm/amdgpu/regs: move debugfs init into core amdgpu debugfs
  drm/amdgpu/firmware: move debugfs init into core amdgpu debugfs
  drm/amdgpu: don't call drm_connector_register for non-MST ports
  drm/amdgpu/display: move debugfs init into core amdgpu debugfs
  drm/amd/display: move dpcd debugfs members setup
  drm/amdgpu/display: add a late register connector callback
  drm/amdgpu/ring: move debugfs init into core amdgpu debugfs
  drm/amdgpu: drop legacy drm load and unload callbacks

 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 67 ++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 17 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 13 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        |  7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c        |  9 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h        |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      | 15 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |  4 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 14 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  3 +
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c      |  1 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 +++----
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  3 +
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 -
 18 files changed, 112 insertions(+), 78 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
