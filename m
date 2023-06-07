Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 600B87263AE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8207110E501;
	Wed,  7 Jun 2023 15:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6080110E501
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 15:06:56 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2001:b07:646b:e2:e4be:399f:af39:e0db])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laura.nao)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B2D096606F02;
 Wed,  7 Jun 2023 16:06:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686150413;
 bh=y+PbL+Fg/8DzH+orsPMxQq0SAzHS4gXdy7ZEMk+P5Dg=;
 h=From:To:Cc:Subject:Date:From;
 b=kIN66jByGdnm2ZFVf3wYpNEWvvZaMhUV0DvodJcaFyyL4BcflSYUFviUo0l1U8qFY
 KMTe3cByCbI83ur6igB0/GYKoHjKR8IKkzxl/OJ1lowUIZTgNiSmR8C+QFDdCzSoEa
 BvIf+LLlKbQSGhoIWcJTMI4EU94szUW2r/YUZZ3if7AwDOWpliiOl1oddCVb3+R2Qt
 FW47BAqknSNbM+ILAecSi5Qir32/NZvzE3b4RXY3ZEJVFFwCcvNNAlZ3mLT6uFVsDt
 cTCfqPdNjp9+/IoY7ruDtFzz3bRq0GcMaQ+WR0kAS5A2X6oH5Fghjb3Q0R/k7HCNst
 rpr0mRIkee+Ag==
From: Laura Nao <laura.nao@collabora.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2] drm/panel-edp: Add AUO B116XAB01.4 edp panel entry
Date: Wed,  7 Jun 2023 17:06:15 +0200
Message-Id: <20230607150615.241542-1-laura.nao@collabora.com>
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

Changes in v2:
- Sorted by product ID

 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index fbd114b4f0be..df7e3cff004c 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1866,6 +1866,7 @@ static const struct panel_delay delay_200_500_e200 = {
  */
 static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1062, &delay_200_500_e50, "B120XAN01.0"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B116XAB01.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116XAK01.6"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01"),
-- 
2.30.2

