Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B262AB4F3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 11:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7070389857;
	Mon,  9 Nov 2020 10:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BBD89857;
 Mon,  9 Nov 2020 10:32:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5AB98ABCC;
 Mon,  9 Nov 2020 10:32:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, robdclark@gmail.com, sean@poorly.run
Subject: [PATCH 0/2] drm: Build fixes for msm and mediatek
Date: Mon,  9 Nov 2020 11:32:40 +0100
Message-Id: <20201109103242.19544-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 49a3f51dfeee ("drm/gem: Use struct dma_buf_map in GEM vmap ops and
convert GEM backends") changed DRM's internal GEM vmap callbacks. Msm and
mediatek were forgotten during the conversion.

Thomas Zimmermann (2):
  drm/msm: Use struct dma_buf_map in GEM vmap ops
  drm/mediatek: Use struct dma_buf_map in GEM vmap ops

 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 20 ++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_gem.h |  4 ++--
 drivers/gpu/drm/msm/msm_drv.h          |  4 ++--
 drivers/gpu/drm/msm/msm_gem_prime.c    | 13 ++++++++++---
 4 files changed, 26 insertions(+), 15 deletions(-)

--
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
