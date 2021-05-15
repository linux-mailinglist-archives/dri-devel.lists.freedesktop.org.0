Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1499381971
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 16:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619186E0AD;
	Sat, 15 May 2021 14:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C244C6E0AD
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 14:54:10 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v4 0/3] Add option to mmap GEM buffers cached
Date: Sat, 15 May 2021 15:53:56 +0100
Message-Id: <20210515145359.64802-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rework of this morning's v3 patchset.

The drm_gem_cma_prime_mmap() function that was added in v3 is now
replaced, instead we pass a "private" parameter to the
__drm_gem_cma_create() function.

Patches 2/3 and 3/3 are unmodified since v3.

Cheers,
-Paul

Paul Cercueil (3):
  drm: Add support for GEM buffers backed by non-coherent memory
  drm: Add and export function drm_gem_cma_sync_data
  drm/ingenic: Add option to alloc cached GEM buffers

 drivers/gpu/drm/drm_gem_cma_helper.c      | 93 ++++++++++++++++++++---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 56 +++++++++++++-
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 18 ++++-
 include/drm/drm_gem_cma_helper.h          |  8 ++
 4 files changed, 160 insertions(+), 15 deletions(-)

-- 
2.30.2

