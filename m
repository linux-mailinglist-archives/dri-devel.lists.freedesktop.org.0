Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8C380CF40
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 16:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BD710E47C;
	Mon, 11 Dec 2023 15:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF34810E477
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 15:15:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 23C2BB80E9B;
 Mon, 11 Dec 2023 15:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99742C433C8;
 Mon, 11 Dec 2023 15:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702307716;
 bh=SkUYDHmoavBKDRYVMUWlwJYgwpCDbiZN63M2msaRJLc=;
 h=From:To:Subject:Date:From;
 b=I1hpFZsrl++EoIP1B+g3fmELWbGol2rnd3ItM9DWyug3A0rsqKvPSlABl+uJj1iaf
 9qwiPN3nqKeiASJ3rrQuHP/N3eRR+Lw66owau4iJBur2/XDNSUZ2Q8Q7jM8HYXomKD
 EWVQS6lqKEUaskxrKjrxtA2vWI24zSh+DCOvNkc9lkRjKNAAVIaKqtfGaAZ+Du7i8J
 tD/8novJoZtIGaY26ZcON9cgKUdR53hIYd0UKsRrbLxYe/ulWbYyW64s0TFcLnZV5T
 ESeRCZasVVTmcTuaohelSh80xJP8BVdSZgmNRYulDeV10LwXHc8cfzXtTrtYc3VgdG
 ckBtDmVchApSw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Walle <mwalle@kernel.org>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Stuart Lee <stuart.lee@mediatek.com>
Subject: [GIT PULL] mediatek drm fixes 20231211
Date: Mon, 11 Dec 2023 15:15:10 +0000
Message-Id: <20231211151510.6749-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
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

Hi, Dave & Daniel:

This includes:

1. mtk_disp_gamma: Fix breakage due to merge issue
2. fix kernel oops if no crtc is found
3. Add spinlock for setting vblank event in atomic_begin
4. Fix access violation in mtk_drm_crtc_dma_dev_get

Regards,
Chun-Kuang.

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20231211

for you to fetch changes up to b6961d187fcd138981b8707dac87b9fcdbfe75d1:

  drm/mediatek: Fix access violation in mtk_drm_crtc_dma_dev_get (2023-12-11 14:40:05 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20231211

1. mtk_disp_gamma: Fix breakage due to merge issue
2. fix kernel oops if no crtc is found
3. Add spinlock for setting vblank event in atomic_begin
4. Fix access violation in mtk_drm_crtc_dma_dev_get

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      drm/mediatek: mtk_disp_gamma: Fix breakage due to merge issue

Jason-JH.Lin (1):
      drm/mediatek: Add spinlock for setting vblank event in atomic_begin

Michael Walle (1):
      drm/mediatek: fix kernel oops if no crtc is found

Stuart Lee (1):
      drm/mediatek: Fix access violation in mtk_drm_crtc_dma_dev_get

 drivers/gpu/drm/mediatek/mtk_disp_gamma.c |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c   | 14 +++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c    |  5 ++++-
 3 files changed, 18 insertions(+), 3 deletions(-)
