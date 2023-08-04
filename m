Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A02C76FB26
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 09:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0124F10E6B2;
	Fri,  4 Aug 2023 07:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A8F10E6AD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 07:29:12 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D8D766071C2;
 Fri,  4 Aug 2023 08:29:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691134150;
 bh=eOGxKFVDezkCZBwW2hUee7R5nYDwDHZk82jsXyRXIgQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cB9BjZ+Uh0lMovSOzN0a/Ugu0u79UdFA39R9jOkGWpsGAIuE/yvVPkSaK9yGjcD1A
 atqx7Bn/kZGL3XX2lgxbpyhURUD4/G2snCvNmr3pdr0EXiKC3UFNVQo9+jtvZvi3pd
 BNZDHv3q9fSSm/Q7r97fR/tmZN0xbjxL59PpWye9XAcVASV28skJwuhd/xv2hftjpA
 zj90iUOorcQrN+C3ygC7ChzInMNnuznvohNKXV7RqxZivGFYmKuuahD6ZX+irw0VL7
 BN1kawNtm1oeJC1xd1EkeUde0ybauzjNS6iq5jhYwkorvdjp8/UvWmzxFQ6c1TB5TB
 rE/jinzzjd+Ag==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v10 16/16] drm/mediatek: aal: Compress of_device_id entries
 and add sentinel
Date: Fri,  4 Aug 2023 09:28:50 +0200
Message-ID: <20230804072850.89365-17-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
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
 linux-mediatek@lists.infradead.org, ehristev@collabora.com, wenst@chromium.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compress the entry for mediatek,mt8173-disp-aal, as it fits in one
line, and fix the style; while at it, also add the usual sentinel
comment to the last entry.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index e6ab3eaa1126..70de5f3007e4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -212,10 +212,9 @@ static const struct mtk_disp_aal_data mt8173_aal_driver_data = {
 };
 
 static const struct of_device_id mtk_disp_aal_driver_dt_match[] = {
-	{ .compatible = "mediatek,mt8173-disp-aal",
-	  .data = &mt8173_aal_driver_data},
-	{ .compatible = "mediatek,mt8183-disp-aal"},
-	{},
+	{ .compatible = "mediatek,mt8173-disp-aal", .data = &mt8173_aal_driver_data },
+	{ .compatible = "mediatek,mt8183-disp-aal" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_aal_driver_dt_match);
 
-- 
2.41.0

