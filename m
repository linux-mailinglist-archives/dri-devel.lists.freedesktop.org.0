Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC7547060E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 17:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5BF10E2BC;
	Fri, 10 Dec 2021 16:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54F8910E2BC
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 16:43:30 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vislmYA0XYYTXvisnmI449; Fri, 10 Dec 2021 17:36:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639154189; bh=mkGS2q8RyS56q3UnbtIPVxrl5TGGrT8hrrl5YrYfP2k=;
 h=From:To:Subject:Date:MIME-Version;
 b=no+2oMBBM5eBQnF/85/1wZQZ12o0WXrflSnOXOj35vzUVUan0foeWBaoU2ZL7Xow+
 36YgZaHTDxqf8u1vIXkFt2YNidupKSnOJJH+vQDL79erWvKIQgtaJoF9NEX7TmmhQt
 DQkAcVviGylciLeUpjVRATSHKYrXwlRcBkuRn0+fSsAvaxNs2uW3nxe56bmlDiE18F
 Zz5ZpYEYnzGI7bB2HouPj0eaDKFckQWa7j1vAO7jtxVn4CSnjILDMiFpzND/5QeWRM
 Vgor7x9lMcWsVVoB2jiRuoPMY3yxg9MdjGbXyfO7kaL8kTXyBx4CYnTHkK2oBaMjlU
 t205FNDfxEjwA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/2] drm/panel: panel-simple: add bus_format and
 connector_type to cdtech_s070wv95_ct16 panel
Date: Fri, 10 Dec 2021 17:36:23 +0100
Message-Id: <20211210163623.1063057-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210163623.1063057-1-giulio.benetti@benettiengineering.com>
References: <20211210163623.1063057-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJNrrbQYla2HqVHWbA09kx4xx3WwZymz1asPPI3y7ILhWC40d7HUBXZ+sPF+SMjUOtAvRq0r0IYp36jyc0d9vBE32Ur9ESJSB27c0yuW5F9MM2sURGcF
 Iay99tUvuchhNxgAuADlVvVUJeNy92m3BPnEHX+woQ4fvTiRmAOWuG5QKAPPSQg5HZRFqxlWn92IkkyWaXZnFz+W6snqCljiSNyS6h8cMSyMnesenqQiXptP
 Pkki+VLrgovwk/U5AtgBG+UwxWNJn0SxQLD8Clfejx87gHZEhZ9lpbqM7Ss8pDsZygT4ZoyciY5H/AmmCy6QBP7pYjffOy2FVfaDYDDFCwv+Fkwd3uYN+rmw
 TXrGR1eZ8ZHtBuQsTRnds3i9LGJsyY2oUF8/4fv+HTJX3+Ea6yjrRSiN2a4IMb40DocSr4pIBvsJtHcQZ72CxI3tXh4xiw==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bus_format and connector_type to cdtech_s070wv95_ct16 panel.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index c8ad713865cb..dc300ace4d68 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1295,6 +1295,8 @@ static const struct panel_desc cdtech_s070wv95_ct16 = {
 		.width = 154,
 		.height = 85,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
 static const struct display_timing chefree_ch101olhlwh_002_timing = {
-- 
2.25.1

