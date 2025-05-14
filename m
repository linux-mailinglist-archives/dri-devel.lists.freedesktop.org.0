Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA990AB7975
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 01:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C68410E040;
	Wed, 14 May 2025 23:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kxjrv8qo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CFE10E040
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:36:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4C65C4A0CE;
 Wed, 14 May 2025 23:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7B3C4CEE3;
 Wed, 14 May 2025 23:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747265811;
 bh=e/UzKf6Tf3n1PZqopATSUBunyUSvZ+piJc7LAnSV1hY=;
 h=From:To:Subject:Date:From;
 b=Kxjrv8qocEX9jhv8LsAFYqilY7EgKEGjr5GP49/deIVYCt7fYlzLjyWGKTkP7cUtB
 GVJ3/KkgLybE5a8ibiHWdlMfKzs+zhCAsjHHlxvmK2ztEW0/l/jVaOOSjzx7BD2mst
 QDtDh0rotyW0CAZ/h1rgNbV76Pf35s8TBbrrWAZV49sjuNHEMnF8E+LXDc/xGpF2Y6
 oGQwd+G6cgf4jM2U+SxFNaduIeJdgR9nTzH9uKWhOThG0iGKOXMP5KCvtBp/dbYfAi
 BQ0j/k3RdB0cuTitFTFEboOnz/Xp05wHXWRst7LnOhKtYamOBh46DfOKoyu81XTjae
 bdZwqi/qCY33w==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Guillaume Ranquet <granquet@baylibre.com>,
 Tang Dongxing <tang.dongxing@zte.com.cn>
Subject: [GIT PULL] mediatek drm next - 20250515
Date: Wed, 14 May 2025 23:36:47 +0000
Message-Id: <20250514233647.15907-1-chunkuang.hu@kernel.org>
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
1. Prepare for support MT8195/88 HDMIv2 and DDCv2
2. DPI: Cleanups and add support for more formats
3. Cleanups and sanitization
4. Replace custom compare_dev with component_compare_of

Regards,
Chun-Kuang.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-20250515

for you to fetch changes up to 07c39476a75bf2541dbdb37815b60cc134cf9aff:

  drm/mediatek: Replace custom compare_dev with component_compare_of (2025-05-14 23:12:24 +0000)

----------------------------------------------------------------
Mediatek DRM Next - 20250515

1. Prepare for support MT8195/88 HDMIv2 and DDCv2
2. DPI: Cleanups and add support for more formats
3. Cleanups and sanitization
4. Replace custom compare_dev with component_compare_of

----------------------------------------------------------------
AngeloGioacchino Del Regno (20):
      dt-bindings: display: mediatek: Add binding for HDMIv2 DDC
      dt-bindings: display: mediatek: Add binding for MT8195 HDMI-TX v2
      drm/mediatek: mtk_cec: Switch to register as module_platform_driver
      drm/mediatek: mtk_hdmi_ddc: Switch to register as module_platform_driver
      drm/mediatek: mtk_hdmi: Convert to module_platform_driver macro
      drm/mediatek: mtk_hdmi: Disgregate function mtk_hdmi_audio_set_param()
      drm/mediatek: mtk_hdmi: Move audio params selection to new function
      drm/mediatek: mtk_hdmi: Move plugged_cb/codec_dev setting to new function
      drm/mediatek: mtk_hdmi: Move N/CTS setting to new function
      drm/mediatek: mtk_hdmi: Use dev_err_probe() in mtk_hdmi_dt_parse_pdata()
      drm/mediatek: mtk_hdmi: Move CEC device parsing in new function
      drm/mediatek: mtk_hdmi: Move output init to mtk_hdmi_register_audio_driver()
      drm/mediatek: mtk_dpi: Use switch in mtk_dpi_config_color_format()
      drm/mediatek: mtk_dpi: Add local helpers for bus format parameters
      drm/mediatek: mtk_dpi: Add support for additional output formats
      drm/mediatek: mtk_dpi: Allow additional output formats on MT8195/88
      drm/mediatek: mtk_dpi: Rename output fmts array for MT8195 DP_INTF
      drm/mediatek: mtk_drm_drv: Fix kobject put for mtk_mutex device ptr
      drm/mediatek: Fix kobject put for component sub-drivers
      drm/mediatek: mtk_drm_drv: Unbind secondary mmsys components on err

Guillaume Ranquet (1):
      drm/mediatek: hdmi: Use regmap instead of iomem for main registers

Krzysztof Kozlowski (1):
      drm/mediatek/hdmi: Use syscon_regmap_lookup_by_phandle_args

Tang Dongxing (1):
      drm/mediatek: Replace custom compare_dev with component_compare_of

 .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml |  41 +++
 .../display/mediatek/mediatek,mt8195-hdmi.yaml     | 151 ++++++++
 drivers/gpu/drm/mediatek/Makefile                  |   8 +-
 drivers/gpu/drm/mediatek/mtk_cec.c                 |   7 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |   7 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 | 117 +++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  31 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                | 410 +++++++++------------
 drivers/gpu/drm/mediatek/mtk_hdmi.h                |  14 -
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |   2 +-
 10 files changed, 497 insertions(+), 291 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi.h
