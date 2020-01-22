Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2450145E2E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 22:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DE46F904;
	Wed, 22 Jan 2020 21:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FCB6F901
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 21:37:27 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id n184so541406ywc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 13:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=qk+nYUbAhXfC1rJu3pYBHWtrahU4BzkSf6ZowkQfGIQ=;
 b=b6KbnKuY+Dpi2cvyND0YCkm/dIgFYDbr1HESZUb7Lh6y68F51Aw+l/9+f86Ju5297j
 0GPQ8V1B0G2/YGcE2jxid8+FOUclcvGbY0R70b/WlChLUWpeVy5+FfE1ae230ZAagmbd
 fWOaXskcvlHHSVZgvHdKrkj3KC50Khcfk/O5MKNlcc0l5SGc+efvmzD1XhuhmT0JP557
 SliwwXlSkk5ZH987PeNnmLF6Qfv6nCx8nlP5oVtl9HENWihScD46Sa6qg+EssBYOPbZN
 xMFIIMK/jm+S/0YUQGDvCiJZk2B21Bo1q7Y3iZT3aKkZFidJ2ygC8a7GqJ331XU7Npfu
 QCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=qk+nYUbAhXfC1rJu3pYBHWtrahU4BzkSf6ZowkQfGIQ=;
 b=bCsM4omX32Uj3emLLhMTf3ITTg/oh4VZNYNp+K7QaMR856a8DlnpB4CHrc8ApkR0P8
 3BzUaUGRyP8PcJPM8yocqDhXlQoBzy1NqiaiVcxTcUE15gRF3On2NHWH+77ftanZXzDD
 na4+AIKeDAsNbdifWi0HEIlnQ8DQxUK0kCzfTlat0G6aIuynM8Ou1gc6+TDlxS/eVwdZ
 L5yeCOZwbkC2Ng3Fpkb0SD+N/AVrpMCavQxGcc17Q1hrdiA96Misa9hE5/17LY1phm4e
 /yhDkiaNbWU3331B9TSkMXDsXScMdh4Vmilb5ntbPaYzKMJJC6rhywv+aMNdUnL2WgxJ
 lTMA==
X-Gm-Message-State: APjAAAXEUQFizCRKWwVhBIYwbjlCxBYDJjUk5voEFh34qCuKk0mna15U
 CHukAOET4SiiRbtyTZEnUgNjseAcBjacGw==
X-Google-Smtp-Source: APXvYqx2b6Zejp9ppQPCDQzwvF1/e4DoAcknRHLt2dFSCNXztFz5K0MKfqrmFfaV64OD9Xs5pNrp2Q==
X-Received: by 2002:a81:334a:: with SMTP id z71mr8709975ywz.238.1579729047129; 
 Wed, 22 Jan 2020 13:37:27 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id h193sm18848102ywc.88.2020.01.22.13.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 13:37:26 -0800 (PST)
Date: Wed, 22 Jan 2020 16:37:25 -0500
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20200122213725.GA22099@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dim-tools@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>,
 dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave and Daniel,
Back with what might be my last -misc pull request :-(

Just a couple fixes. We have our customary MST fix from AMD and a panfrost fix.

Please pull!

drm-misc-fixes-2020-01-22-1:
-mst: Fix SST branch device handling (Wayne)
-panfrost: Fix mapping of globally visible BO's (Boris)

Cc: Wayne Lin <Wayne.Lin@amd.com>
CC: Boris Brezillon <boris.brezillon@collabora.com>

Cheers, Sean


The following changes since commit 5a64967a2f3bbc01cc708ee43c7b0893089c61c4:

  drm/dp_mst: Have DP_Tx send one msg at a time (2020-01-15 17:01:21 -0500)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-01-22-1

for you to fetch changes up to bdefca2d8dc0f80bbe49e08bf52a717146490706:

  drm/panfrost: Add the panfrost_gem_mapping concept (2020-01-21 10:32:55 -0600)

----------------------------------------------------------------
-mst: Fix SST branch device handling (Wayne)
-panfrost: Fix mapping of globally visible BO's (Boris)

Cc: Wayne Lin <Wayne.Lin@amd.com>
CC: Boris Brezillon <boris.brezillon@collabora.com>

----------------------------------------------------------------
Boris Brezillon (1):
      drm/panfrost: Add the panfrost_gem_mapping concept

Wayne Lin (1):
      drm/dp_mst: Handle SST-only branch device case

 drivers/gpu/drm/drm_dp_mst_topology.c            | 140 +++++++++++++----------
 drivers/gpu/drm/panfrost/panfrost_drv.c          |  91 +++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_gem.c          | 124 +++++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_gem.h          |  41 ++++++-
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c |   3 +-
 drivers/gpu/drm/panfrost/panfrost_job.c          |  13 ++-
 drivers/gpu/drm/panfrost/panfrost_job.h          |   1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c          |  61 +++++-----
 drivers/gpu/drm/panfrost/panfrost_mmu.h          |   6 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c      |  34 ++++--
 10 files changed, 380 insertions(+), 134 deletions(-)

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
