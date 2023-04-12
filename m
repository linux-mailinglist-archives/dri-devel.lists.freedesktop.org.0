Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C43456DF440
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862F110E794;
	Wed, 12 Apr 2023 11:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369B610E794
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:52:56 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 52D9266031FE;
 Wed, 12 Apr 2023 12:52:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681300375;
 bh=8iaiiDcFwWvEikKyBM/EHvngwZZN5lPfvgSCIoQUJv0=;
 h=From:To:Cc:Subject:Date:From;
 b=HHHKkgfyhj8S7yhY+Yhqg5BII5aB2y4NIJHNgD+UjIk95Qs4+XnnnbmvVgE6gcy5B
 VUkR5cIoL6Qz7QKfOgOknbZKRJAKvrQ9LIg7FNPrdgXhaVff43Uxp9OfiPiF1IhswS
 2IWH/up5QzCII5y3wzkkDi+ZX/wZO2D4tp27kk3WJNpwSj4ScylG+oGjAWgtKvCB0s
 T8I6atAlXtuPgL4qZMlujWS6wFGf4dxa0mJCx9UcF1WDYRQKNJ4Uoht5S8YvsQdneo
 B2qmRBiJov9X8jsAX72k0C9alFpSGqjl7tflXp7cV+u1z03CrJGOaLVBXqCPUQVIGK
 5ufVyt/9cF+nA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 0/4] drm/mediatek: Small mtk-dpi cleanups
Date: Wed, 12 Apr 2023 13:52:46 +0200
Message-Id: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
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

This is a small cleanup of the mtk-dpi driver, switching it to devm
variants where possible and where it made sense, and reducing lines
while retaining and improving human readability.

AngeloGioacchino Del Regno (4):
  drm/mediatek: mtk_dpi: Simplify with devm_drm_bridge_add()
  drm/mediatek: mtk_dpi: Simplify with dev_err_probe()
  drm/mediatek: mtk_dpi: Switch to devm_drm_of_get_bridge()
  drm/mediatek: mtk_dpi: Use devm_platform_get_and_ioremap_resource()

 drivers/gpu/drm/mediatek/mtk_dpi.c | 59 +++++++++++-------------------
 1 file changed, 21 insertions(+), 38 deletions(-)

-- 
2.40.0

