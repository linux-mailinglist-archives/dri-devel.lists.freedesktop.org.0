Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14BB77A770
	for <lists+dri-devel@lfdr.de>; Sun, 13 Aug 2023 17:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF6C10E091;
	Sun, 13 Aug 2023 15:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81B910E091
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Aug 2023 15:27:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0903A6192A;
 Sun, 13 Aug 2023 15:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB43C433C7;
 Sun, 13 Aug 2023 15:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691940451;
 bh=xJYiJuaA3LSVPqhh7xJEHUAJFebjN0TG/fZeGdA6izU=;
 h=From:To:Cc:Subject:Date:From;
 b=bvAB4SVN3DQHiUalcwqKM9N5ulDXC1pWLwa5VniPee/kEyzkCHrSGA0l9yScBBfpM
 +vVVVMcoNjZndPNbl6TRenwXV2FTNv8pEywYOS0DHkhgqQEqWyhVPTKN8e1gUpsFlm
 FKArpkPdL/dn4oAbpIrILmzV2l9PebR6gZ0KUqzkk1/ieIfwKifE9pQ62GQo93rMuQ
 UOahV1B/H19zvhxMF4iuG13RJ2wHbzH3+h37s+YdUMSLJ+4bInv4LeBmiCLl3yRKMO
 r9p/cVwQ0LCkbVNILsANzlXNmIciceEJOK5t2KkkUDiSqiLGbSS9Nb/+PwO1AJEmEI
 79VCYcSMFgZ3g==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 6.6
Date: Sun, 13 Aug 2023 15:27:26 +0000
Message-Id: <20230813152726.14802-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Ruan Jinjie <ruanjinjie@huawei.com>, Lee Jones <lee@kernel.org>,
 "Nancy . Lin" <nancy.lin@mediatek.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This includes:

1. Small mtk-dpi cleanups
2. DisplayPort: support eDP and aux-bus
3. Fix uninitialized symbol
4. Do not check for 0 return after calling platform_get_irq()
5. Convert to platform remove callback returning void
6. Fix coverity issues
7. Fix potential memory leak if vmap() fail
8. Fix void-pointer-to-enum-cast warning
9. Rid W=1 warnings from GPU

Regards,
Chun-Kuang.

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.6

for you to fetch changes up to fb7e600df0a006f3661eddb424cd92bae26df350:

  drm/mediatek/mtk_disp_ccorr: Remove half completed incorrect struct header (2023-08-13 14:42:43 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.6

1. Small mtk-dpi cleanups
2. DisplayPort: support eDP and aux-bus
3. Fix uninitialized symbol
4. Do not check for 0 return after calling platform_get_irq()
5. Convert to platform remove callback returning void
6. Fix coverity issues
7. Fix potential memory leak if vmap() fail
8. Fix void-pointer-to-enum-cast warning
9. Rid W=1 warnings from GPU

----------------------------------------------------------------
AngeloGioacchino Del Regno (17):
      drm/mediatek: mtk_dpi: Simplify with devm_drm_bridge_add()
      drm/mediatek: mtk_dpi: Simplify with dev_err_probe()
      drm/mediatek: mtk_dpi: Switch to devm_drm_of_get_bridge()
      drm/mediatek: mtk_dpi: Switch to .remove_new() void callback
      drm/mediatek: mtk_dpi: Use devm_platform_ioremap_resource()
      drm/mediatek: mtk_dpi: Compress struct of_device_id entries
      drm/mediatek: dp: Add missing error checks in mtk_dp_parse_capabilities
      drm/mediatek: dp: Move AUX and panel poweron/off sequence to function
      drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
      drm/mediatek: dp: Use devm variant of drm_bridge_add()
      drm/mediatek: dp: Move AUX_P0 setting to mtk_dp_initialize_aux_settings()
      drm/mediatek: dp: Enable event interrupt only when bridge attached
      drm/mediatek: dp: Avoid mutex locks if audio is not supported/enabled
      drm/mediatek: dp: Move PHY registration to new function
      drm/mediatek: dp: Add support for embedded DisplayPort aux-bus
      drm/mediatek: dp: Add .wait_hpd_asserted() for AUX bus
      drm/mediatek: dp: Don't register HPD interrupt handler for eDP case

Jason-JH.Lin (4):
      drm/mediatek: Remove freeing not dynamic allocated memory
      drm/mediatek: Add cnt checking for coverity issue
      drm/mediatek: Fix dereference before null check
      drm/mediatek: Fix void-pointer-to-enum-cast warning

Lee Jones (2):
      drm/mediatek/mtk_disp_aal: Remove half completed incorrect struct header
      drm/mediatek/mtk_disp_ccorr: Remove half completed incorrect struct header

Nancy.Lin (1):
      drm/mediatek: Fix uninitialized symbol

Ruan Jinjie (1):
      drm/mediatek: Do not check for 0 return after calling platform_get_irq()

Sui Jingfeng (1):
      drm/mediatek: Fix potential memory leak if vmap() fail

Uwe Kleine-König (1):
      drm/mediatek: Convert to platform remove callback returning void

 drivers/gpu/drm/mediatek/Kconfig                |   1 +
 drivers/gpu/drm/mediatek/mtk_cec.c              |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c         |  11 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c       |  11 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c       |   6 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c       |   6 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c       |   6 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c         |   6 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c        |   6 +-
 drivers/gpu/drm/mediatek/mtk_dp.c               | 366 ++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_dpi.c              | 104 +++----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c         |   7 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c     |  16 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          |  13 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c          |   6 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c        |   6 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c              |   6 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c             |   5 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c         |   6 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c         |   5 +-
 21 files changed, 326 insertions(+), 274 deletions(-)
