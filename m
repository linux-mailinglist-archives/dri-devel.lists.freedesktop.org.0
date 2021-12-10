Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E9847060D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 17:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C30B10E224;
	Fri, 10 Dec 2021 16:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 420 seconds by postgrey-1.36 at gabe;
 Fri, 10 Dec 2021 16:43:30 UTC
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5605510E2C6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 16:43:30 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vislmYA0XYYTXvismmI42k; Fri, 10 Dec 2021 17:36:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639154189; bh=7QfRhQQnlCEgknaEeOJk7injUfpmrQE+35+P/xSdOb8=;
 h=From:To:Subject:Date:MIME-Version;
 b=QcWgMSTG4+C25Mom93z0+9Ug8/89dCVcmRzyXbjDksFrcD2Ko8vj1xHQETBTBZdNQ
 yye0BFqgyuCJUYMr9FCsuWKY8zfrVwlqW35mmrEKUcI9sfqJceDDS7KQk+5Uykr4QM
 Tnw1bkWW1hkC4+n1koLQrKT3gvKeFsRcfR520bcDZBV+HHRxQqM4aEDn/dQIlrKkVG
 xHW8zrZxRw1PokY3BTc93vVXAQ1I6+1mELNhHSctSxDVu1He/4AlPyTVo+qIUbdvk7
 1I371tv0JjT83PTg7jzbPEgGrFdHbJ8NMSswprG7Wx9Smx1jLl8VwQyP2c1fyJkc85
 lB+/S3dsfoVVw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] drm/panel: panel-simple: add bus_format and
 connector_type to cdtech_s043wq26h_ct7 panel
Date: Fri, 10 Dec 2021 17:36:22 +0100
Message-Id: <20211210163623.1063057-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
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

Add bus_format and connector_type to cdtech_s043wq26h_ct7 panel.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index eb475a3a774b..c8ad713865cb 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1215,7 +1215,9 @@ static const struct panel_desc cdtech_s043wq26h_ct7 = {
 		.width = 95,
 		.height = 54,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
 /* S070PWS19HP-FC21 2017/04/22 */
-- 
2.25.1

