Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E6ED38AEC
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 01:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B193B10E27D;
	Sat, 17 Jan 2026 00:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bM8WL8/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCDD10E27D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 00:51:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E946242A5C;
 Sat, 17 Jan 2026 00:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2A3C116C6;
 Sat, 17 Jan 2026 00:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768611116;
 bh=i5NYbZPhxgD20wVMiqN2xiI5tZUHzwf8fDZZGFnHqnM=;
 h=From:To:Subject:Date:From;
 b=bM8WL8/nDTqkjg1aRQTxsFpbwDiYkyqEJ29XNwbeZJhF7ORyXzhPpBlgqsfPlibyX
 E0uN4pXRsXOj7I6hpx+Jg2uc7ICpSHm5tnIFh+n5T//9a3uVjkhPKEkvMa7EJyc2kH
 xKDHvd4/P+mX3uGrIHhTUArM4qwS/7WahbzxFXDS1MByU/aQ1CaU87Q6jtRn5b1tq2
 925ermSRbIoS02xQcZ7HdqkikQ99FjJmpJo5u/M2UYmup6oEUVqhvn6TW7HhmefU0q
 vkgCAxZn7YuEjrRXwB8DLPEJVmFDLfCXLN3KyDnllB0MjyeQcAOYXp3Uslb1/dOZti
 Z6kDUQVCCUIrw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Chen Ni <nichen@iscas.ac.cn>, Liankun Yang <liankun.yang@mediatek.com>,
 Abhishek Rajput <abhiraj21put@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [GIT PULL] mediatek drm next - 20260117
Date: Sat, 17 Jan 2026 00:51:52 +0000
Message-Id: <20260117005152.3770-1-chunkuang.hu@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Sima:

This includes:
1. mtk_hdmi_v2: Remove unneeded semicolon
2. Move DP training to hotplug thread
3. Convert legacy DRM logging to drm_* helpers in mtk_crtc.c
4. mtk_dsi: Add support for High Speed (HS) mode
5. Add HDMI support for Mediatek Genio 510/700/1200-EVK and Radxa NIO-12L boards

Regards,
Chun-Kuang.

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-20260117

for you to fetch changes up to 79643afdd985ee14f9dddd66da262314f04d1640:

  dt-bindings: phy: mediatek,hdmi-phy: Document extra clocks for MT8195 (2026-01-17 00:10:01 +0000)

----------------------------------------------------------------
Mediatek DRM Next - 20260117

1. mtk_hdmi_v2: Remove unneeded semicolon
2. Move DP training to hotplug thread
3. Convert legacy DRM logging to drm_* helpers in mtk_crtc.c
4. mtk_dsi: Add support for High Speed (HS) mode
5. Add HDMI support for Mediatek Genio 510/700/1200-EVK and Radxa NIO-12L boards

----------------------------------------------------------------
Abhishek Rajput (1):
      drm/mediatek: Convert legacy DRM logging to drm_* helpers in mtk_crtc.c

AngeloGioacchino Del Regno (2):
      drm/mediatek: mtk_dsi: Add support for High Speed (HS) mode
      dt-bindings: phy: mediatek,hdmi-phy: Fix clock output names for MT8195

Chen Ni (1):
      drm/mediatek: mtk_hdmi_v2: Remove unneeded semicolon

Liankun Yang (1):
      drm/mediatek: Move DP training to hotplug thread

Louis-Alexis Eyraud (1):
      dt-bindings: phy: mediatek,hdmi-phy: Add support for MT8188 SoC

Nícolas F. R. A. Prado (1):
      dt-bindings: phy: mediatek,hdmi-phy: Document extra clocks for MT8195

 .../devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 29 ++++++++++-
 drivers/gpu/drm/mediatek/mtk_crtc.c                | 24 +++++----
 drivers/gpu/drm/mediatek/mtk_dp.c                  | 57 ++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  4 ++
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |  6 +--
 5 files changed, 87 insertions(+), 33 deletions(-)
