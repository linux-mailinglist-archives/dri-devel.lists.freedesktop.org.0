Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B333A5623D2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8569012B130;
	Thu, 30 Jun 2022 20:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC46B12B12E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:06:29 +0000 (UTC)
Received: from dimapc.. (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 97EEF660196E;
 Thu, 30 Jun 2022 21:06:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656619588;
 bh=xsvNmDMcGVOkoQTugF/axTWFHna4KKvMOUF9W1Ml/Ts=;
 h=From:To:Cc:Subject:Date:From;
 b=he14SaaKl2bzQgvd1kFoJEyysf31ZtW+VEza3/RtUAROyqjVLuzgHz4E/Ht1kmMRU
 I6Ypda7X+uAYmUuwmdnG+8aDEO0lzhMNiNmaXdulb0AyrQ+iLSlL6b5PWl2p6u6mnH
 e54mCVnjgwmn2I4lgavXrBkeIgOw4ckqDs/F+8tb9CCwvfX5oJZCuNCygdekOz7IW8
 XMDdYkRl/c+Aujg+GKjIZ7F+LRDIjS7Xd8J3Xlc2aCoDYCjCubDpGNAagYCoMg5Jan
 +mssW5cc9NW1vaLhhACKIWFHcySbG++8cWhXpmf67j425rwIptqL/vElc46C60nK03
 6zErqHhqeytpg==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Clark <robdclark@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v7 0/2] Panfrost driver fixes
Date: Thu, 30 Jun 2022 23:05:59 +0300
Message-Id: <20220630200601.1884120-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes two minor bugs in the Panfrost driver.

Changelog:

v7: - Factored out Panfrost fixes from [1] since I'll be working on
      the dma-buf locking in a separate patchset now.

[1] https://lore.kernel.org/all/20220526235040.678984-1-dmitry.osipenko@collabora.com/

Dmitry Osipenko (2):
  drm/panfrost: Put mapping instead of shmem obj on
    panfrost_mmu_map_fault_addr() error
  drm/panfrost: Fix shrinker list corruption by madvise IOCTL

 drivers/gpu/drm/panfrost/panfrost_drv.c | 4 ++--
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.36.1

