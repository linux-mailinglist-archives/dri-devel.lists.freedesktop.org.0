Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7CF4F7D58
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 12:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C323510E9E2;
	Thu,  7 Apr 2022 10:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3975010E9D7;
 Thu,  7 Apr 2022 10:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649328992; x=1680864992;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=k2bgQS5XVDuWGUk97XidIy3K5t+y12mnp6gAJ2/OG3I=;
 b=SJGDUZBAAOHuHHZ2bgUlhMex5DyvwMWX9b+Lcrks73C8/o3z35n6pFBR
 qyDpkgtRowyc+nMVs2DHgKPuVWNYDbCvabQ9UAkX06hkvQypxj6QSYLKn
 eqcnbELdt+GAz6JoysRJCnV+9RIwGBeeJ1RW9ppXKqZ1nVXmkgbFvB0H4
 BwmDKaFxinlQ1kN3YCgnPPgvtQd1YIwj6op6YGHjHJEV2M+3D65m+qbcb
 g+zS3Gnvbz8QYSvr7nuu9KdCX1izPCFjjysOBcSbBc8BkTR2joyzFQ9qR
 GcS0CUsUhyPmd4WSJvFg1z6wYp37ofAZ6mbuqG+D9hK5R4DHljqBhVfC4 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="243424992"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="243424992"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 03:56:31 -0700
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="549997496"
Received: from dzinchen-mobl1.ccr.corp.intel.com (HELO [10.252.52.87])
 ([10.252.52.87])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 03:56:29 -0700
Message-ID: <3b8e6439-612e-f640-e380-51e834393e94@linux.intel.com>
Date: Thu, 7 Apr 2022 12:56:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-next-fixes-2022-04-07:
drm-misc-next-fixes for v5.18-rc2:
- fix warning about fence containers
- fix logic error in new fence merge code
- handle empty dma_fence_arrays gracefully
- Try all possible cases for bridge/panel detection.
The following changes since commit 7344bad7fb6daa4877a1c064b52c7d5f9182c41b:

  drm/edid: fix CEA extension byte #3 parsing (2022-03-24 11:41:14 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2022-04-07

for you to fetch changes up to 67bae5f28c895f8737a1974c3f31cf12b9170b14:

  drm: of: Properly try all possible cases for bridge/panel detection (2022-03-30 10:16:05 +0200)

----------------------------------------------------------------
drm-misc-next-fixes for v5.18-rc2:
- fix warning about fence containers
- fix logic error in new fence merge code
- handle empty dma_fence_arrays gracefully
- Try all possible cases for bridge/panel detection.

----------------------------------------------------------------
Christian König (5):
      dma-buf: Add dma_fence_array_for_each (v2)
      dma-buf: add dma_fence_unwrap v2
      dma-buf/sync-file: fix warning about fence containers
      dma-buf/sync-file: fix logic error in new fence merge code
      dma-buf: handle empty dma_fence_arrays gracefully

Paul Kocialkowski (1):
      drm: of: Properly try all possible cases for bridge/panel detection

 Documentation/driver-api/dma-buf.rst  |   6 +
 drivers/dma-buf/Makefile              |   1 +
 drivers/dma-buf/dma-fence-array.c     |  32 +++++
 drivers/dma-buf/selftests.h           |   1 +
 drivers/dma-buf/st-dma-fence-unwrap.c | 261 ++++++++++++++++++++++++++++++++++
 drivers/dma-buf/sync_file.c           | 141 +++++++++---------
 drivers/gpu/drm/drm_of.c              |  99 ++++++-------
 include/linux/dma-fence-array.h       |  19 +++
 include/linux/dma-fence-chain.h       |   2 +
 include/linux/dma-fence-unwrap.h      |  95 +++++++++++++
 10 files changed, 540 insertions(+), 117 deletions(-)
 create mode 100644 drivers/dma-buf/st-dma-fence-unwrap.c
 create mode 100644 include/linux/dma-fence-unwrap.h
