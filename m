Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69FA4046FB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 10:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBBD6E49F;
	Thu,  9 Sep 2021 08:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7087A6E49D;
 Thu,  9 Sep 2021 08:25:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="220754518"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="220754518"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 01:25:33 -0700
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="548424295"
Received: from shishpan-mobl2.ccr.corp.intel.com (HELO [10.252.43.251])
 ([10.252.43.251])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 01:25:30 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next-fixes
Message-ID: <37c5fe2e-5be8-45c3-286b-d8d536a5cef2@linux.intel.com>
Date: Thu, 9 Sep 2021 10:25:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

drm-misc-next-fixes-2021-09-09:
drm-misc-next-fixes for v5.15:
- Make some dma-buf config options depend on DMA_SHARED_BUFFER.
- Handle multiplication overflow of fbdev xres/yres in the core.
The following changes since commit efcefc7127290e7e9fa98dea029163ad8eda8fb3:

  drm/ttm: Fix ttm_bo_move_memcpy() for subclassed struct ttm_resource (2021-08-31 10:48:26 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2021-09-09

for you to fetch changes up to 8c28051cdcbe9dfcec6bd0a4709d67a09df6edae:

  fbmem: don't allow too huge resolutions (2021-09-08 18:52:04 +0200)

----------------------------------------------------------------
drm-misc-next-fixes for v5.15:
- Make some dma-buf config options depend on DMA_SHARED_BUFFER.
- Handle multiplication overflow of fbdev xres/yres in the core.

----------------------------------------------------------------
Geert Uytterhoeven (3):
      dma-buf: DMABUF_MOVE_NOTIFY should depend on DMA_SHARED_BUFFER
      dma-buf: DMABUF_DEBUG should depend on DMA_SHARED_BUFFER
      dma-buf: DMABUF_SYSFS_STATS should depend on DMA_SHARED_BUFFER

Tetsuo Handa (1):
      fbmem: don't allow too huge resolutions

 drivers/dma-buf/Kconfig          | 4 +++-
 drivers/video/fbdev/core/fbmem.c | 6 ++++++
 2 files changed, 9 insertions(+), 1 deletion(-)
