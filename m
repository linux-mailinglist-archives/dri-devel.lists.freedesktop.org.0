Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE8081A061
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 14:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFA610E5B2;
	Wed, 20 Dec 2023 13:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C6010E5A3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 13:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1703080650;
 bh=A/T2H3Pnav/kaeyTjGJkiaCPRjpVDZjbOaOAd/HTgyA=;
 h=From:To:Cc:Subject:Date:From;
 b=zD0ufCVArTV94xPzQevsEKioHG68COMsHhrrur7IiyWtk/BwkHD/6NMGfi4lR2FGA
 YJVL2VvS+bMVo+fTlTfT9jcuxc9vvNRIRhLC0eWfSxoz6PZYSbeK/VQ8cRuGwA1S9o
 3dfzyJkXuNoyll8t0N1PK5CYQ22DjUtCLwURD8lvXDK4f1mkp0yCafDIVtr9QIu5qT
 te0jFwxBO35GAMGFYcI1RkBDNhYLM8jKwqUVIqfnz4ECcw/kZM/odugQI+atSFPXyn
 yAUZWEkHqu9mHMvyzjItYTbcAcUb6+LLAPHVxnxz9F3aJsL7wwlAV4JsDff4WRt1QH
 lG9+ZhtfSIB0g==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id CA04A3781F8C;
 Wed, 20 Dec 2023 13:57:29 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 0/4] MediaTek DRM - DSI driver cleanups
Date: Wed, 20 Dec 2023 14:57:18 +0100
Message-ID: <20231220135722.192080-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
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
 kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in v2:
 - Rebased over next-20231213

This series performs some cleanups for mtk_dsi, enhancing human
readability, using kernel provided macros where possible and
also reducing code size.

Tested on MT8173 and MT8192 Chromebooks (using a DSI<->DP bridge)
and on MT6795 Sony Xperia M5 (DSI video mode panel).

AngeloGioacchino Del Regno (4):
  drm/mediatek: dsi: Use GENMASK() for register mask definitions
  drm/mediatek: dsi: Cleanup functions mtk_dsi_ps_control{_vact}()
  drm/mediatek: dsi: Use bitfield macros where useful
  drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ

 drivers/gpu/drm/mediatek/mtk_dsi.c | 198 +++++++++++++----------------
 1 file changed, 88 insertions(+), 110 deletions(-)

-- 
2.43.0

