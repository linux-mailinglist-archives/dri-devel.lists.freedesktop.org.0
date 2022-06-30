Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0B05623B7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717B312B038;
	Thu, 30 Jun 2022 20:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D968E12B038
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:01:28 +0000 (UTC)
Received: from dimapc.. (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A1BAD660196E;
 Thu, 30 Jun 2022 21:01:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656619287;
 bh=bHY/wTGdwNWE0vfGLvjwkTXQsLLmekm4lElw1VQe+qg=;
 h=From:To:Cc:Subject:Date:From;
 b=C60CRvbq0hfB7n3bN1cYPypQwLwwD8bMj1QffeZcO3HLV02fCbeRi+MWt6G0RZjJA
 7USBZyoYH/ZEBIEUcl3QS5W+vxjgA8IhEXQJ7jABbKZYc2W7LcV6EO5fVn2am4M7VP
 OiHMPYJB0cqC+WSvFtGp/VNiiSsvVKkQQ2MwL0NBNKlT3ZPulCSZquXVfDSBa3AoKT
 jmhVOaQnltFq29FfqSKuNp1po4HqvUW3qMHxXXGJAx8zn6nOh05rSwo+2S25ffyA2K
 iA+2tycDexEXe3A9/wD8uFhSB5QWCKRmmpTXfvC5DfsrZ5EZMBDcsgf9hqOIfFREoh
 Pw/M4RjO27/xg==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v7 0/2] DRM-SHMEM fixes
Date: Thu, 30 Jun 2022 23:00:56 +0300
Message-Id: <20220630200058.1883506-1-dmitry.osipenko@collabora.com>
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

This series fixes two minor problems in the DRM-SHMEM helper.

Changelog:

v7: - Factored out DRM-SHMEM fixes from [1] since I'll be working on
      the dma-buf locking in a separate patchset now.

[1] https://lore.kernel.org/all/20220526235040.678984-1-dmitry.osipenko@collabora.com/

Dmitry Osipenko (2):
  drm/shmem-helper: Add missing vunmap on error
  drm/shmem-helper: Correct doc-comment of drm_gem_shmem_get_sg_table()

 drivers/gpu/drm/drm_gem_shmem_helper.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.36.1

