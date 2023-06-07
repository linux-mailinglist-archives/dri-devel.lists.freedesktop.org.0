Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D525725B87
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 12:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C713E10E412;
	Wed,  7 Jun 2023 10:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EB810E412
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 10:23:27 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2001:b07:646b:e2:e4be:399f:af39:e0db])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laura.nao)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 037006606EF5;
 Wed,  7 Jun 2023 11:23:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686133405;
 bh=H9QRea/52RC21Ar3lTIH+dm/2YukdZI3RX7iffiI+wQ=;
 h=From:To:Cc:Subject:Date:From;
 b=Ao4fa02gCcp1DGDY94o1y99+iPJ2GPtsYQL/IJdK+zPPbSauEIpVP0W6+TeQuRfYE
 54mhRdKCcs+2rrJ+zn3w4KWAPdLVts1Mnk3kG3qrDy8khYzU76Sp3wHfXv6Q70ISN4
 0gt23Y4bmJnCz5q8w0v/X+DCVDJ3ofIAp/ZIFb/JFACNZCPKrgfQ/NUSOrWCDqIYGn
 SfZlRKqXOeFe/hgRu/vvQ/dVQiOmM5RpkmSx8eekb2rH23j6PwJnRsDjBLcMG2HbOx
 yYXp9s5EkVFhk+pTSZRjb05VVmv8bNdWe+eOpX3C3a8VokTpAEzGfQiEk0xf0ckIhY
 2dItHWPl51VSg==
From: Laura Nao <laura.nao@collabora.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] drm/panel-edp: Add AUO B116XAB01.4 edp panel entry
Date: Wed,  7 Jun 2023 12:21:23 +0200
Message-Id: <20230607102123.219862-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laura Nao <laura.nao@collabora.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a panel entry for the AUO B116XAB01.4 edp panel, found in the Acer
Chromebook Spin 311 (CP311-3H) laptop.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index fbd114b4f0be..5f6297531347 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1867,6 +1867,7 @@ static const struct panel_delay delay_200_500_e200 = {
 static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1062, &delay_200_500_e50, "B120XAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B116XAB01.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116XAK01.6"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133UAN01.0"),
-- 
2.30.2

