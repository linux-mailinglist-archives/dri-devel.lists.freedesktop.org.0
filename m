Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C809C6D793D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 12:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08B410E07F;
	Wed,  5 Apr 2023 10:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F79410E07F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 10:05:10 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5DC4C6603157;
 Wed,  5 Apr 2023 11:05:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680689108;
 bh=ObyV7hKkZslSNWezuym/OfrPt5Q0xH7sUk6WqSQsj/8=;
 h=From:To:Cc:Subject:Date:From;
 b=KKf0uGWbBglqYSE/+HyzS07SzdMFiU0+MklDHI38v/BG9mMyrjFYjtiARaIAMWkK1
 LmQSheLnkZij9hxww/m4hPhadawGIuj01LCxuQnsw2uyFP99n4OQLSQLlkdRIlQKrh
 XYuGSKsb7U6FYK3jYyAD0mg0sxkyzS6piFiOjYLIDmUMaZU3TAgqCHEh6MA2aA/FLC
 JFfRxcuXl16eFGMpKK8ib24KeljKTQm6sJcJzjBA6uZk8G/RT9pbD+EKBKXg8YhLqc
 AzPvzNQKOOGg5Kl9HxuCcXaQmNZPRWJwVH+//UcctRVrKgfaTafZ6OXdaYobApWssb
 HjrjZ7fMyKy4Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dianders@chromium.org
Subject: [PATCH] drm/panel-edp: Add AUO NE135FBM-N41 v8.1 panel entry
Date: Wed,  5 Apr 2023 12:04:52 +0200
Message-Id: <20230405100452.44225-1-angelogioacchino.delregno@collabora.com>
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
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a panel entry with delay_200_500_e50 for the AUO NE135FBM-N41
version 8.1, found on a number of ACER laptops, including the
Swift 3 (SF313-52, SF313-53), Chromebook Spin 513 (CP513-2H) and
others.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 926906ca2304..e23ddab2126e 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1879,6 +1879,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d1, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x082d, &boe_nv133fhm_n61.delay, "NV133FHM-N62"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116WHM-N21"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
-- 
2.40.0

