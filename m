Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C94B870F2E0
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 11:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B62010E5C8;
	Wed, 24 May 2023 09:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944E910E5C8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 09:34:23 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 608966602B7B;
 Wed, 24 May 2023 10:34:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1684920861;
 bh=a0EL23vvvIql72p1r/4NKLcSB4WiPqmju45rIVviM68=;
 h=From:To:Cc:Subject:Date:From;
 b=ZP5a327h5yCff5ZXdwT2PhCRIiWKVrLGL6pB/6yDmbhFk9LVZjUpotpTzwphtKI8I
 4Zef0ZrvJR3ggmSITFsYBPYGwV7gVTQ+LsfeIMP77I9JFMAgphxxmYD+puW04GCRno
 k3ybG/WKIdxUm8n/hG/xL1VoNw75mwN305REL6VLAKtiinVPe+KiUsFAJK1BumaMr/
 yhNLv/M2Sde4LXH/NC1EU3xpr52o5D7BKD2Xj+8L5mw/Wva/cO+RVBKripiJNjkQl+
 FPm7DoVy9yfrKSmoSeHqc99cuD4JJQ8n/wtaBPe5tRHgb3mkqv3GIF8RnE6hMMvWla
 ZxQsCu7VSlHWw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v1 0/4] MediaTek DRM - DSI driver cleanups
Date: Wed, 24 May 2023 11:34:08 +0200
Message-Id: <20230524093412.92211-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series performs some cleanups for mtk_dsi, enhancing human
readability, using kernel provided macros where possible and
also reducing code size.

Tested on MT8173 and MT8192 Chromebooks (using a DSI<->DP bridge)
and on MT6795 Sony Xperia M5 (DSI video mode panel).

Please note:
This series depends and can be applied only on top of [1].

[1]: https://lore.kernel.org/lkml/20230523104234.7849-1-angelogioacchino.delregno@collabora.com/

AngeloGioacchino Del Regno (4):
  drm/mediatek: dsi: Use GENMASK() for register mask definitions
  drm/mediatek: dsi: Cleanup functions mtk_dsi_ps_control{_vact}()
  drm/mediatek: dsi: Use bitfield macros where useful
  drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ

 drivers/gpu/drm/mediatek/mtk_dsi.c | 198 +++++++++++++----------------
 1 file changed, 88 insertions(+), 110 deletions(-)

-- 
2.40.1

