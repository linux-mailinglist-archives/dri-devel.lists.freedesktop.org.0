Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BA9417DBB
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 00:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C266EE84;
	Fri, 24 Sep 2021 22:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1A26EE84
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 22:22:25 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 35E4C4015E; 
 Fri, 24 Sep 2021 22:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632522143;
 bh=s7NAl5BrbFi3IzEIAE8SRfLu7xxGL8BY3hza4BKEYzk=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=DfJQdzMu6XeK/TGgo7xtYAzrUVSJZ9G5sA69oRVG/AmxS5tPIp4mjdREw+9WNP0YR
 OB3T0JWR43ojE3i8IGaZhXjIcMicNep6J3nYuC5+aQpIYGY49x1J7MgIVdwjddKrlE
 WVROohEfvbxqyLVyEXuFmphQ1PBih9vJrGzAaoVAGbf4mX5NC3STolhi4H6rJ3GU51
 4H5SYdBXdXvonDOslnM0shUxH2PrN8dJEGy/a3pBzGIkzrm/MpZ6XPu97RQYS24gqG
 Xo9U5DwIuWEP1uRXYWBl65fDUo0huuRCuEsWGePT/6E1VK+t7a1SKKibBESFBYXvE5
 TSTu/P3YbqS0Q==
From: Colin King <colin.king@canonical.com>
To: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] video: fbdev: via: Fix spelling mistake "bellow" -> "below"
Date: Fri, 24 Sep 2021 23:22:22 +0100
Message-Id: <20210924222222.141645-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a debug message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/video/fbdev/via/lcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/via/lcd.c b/drivers/video/fbdev/via/lcd.c
index 088b962076b5..beec5c8d4d08 100644
--- a/drivers/video/fbdev/via/lcd.c
+++ b/drivers/video/fbdev/via/lcd.c
@@ -543,7 +543,7 @@ void viafb_lcd_set_mode(const struct fb_var_screeninfo *var, u16 cxres,
 	/* Get panel table Pointer */
 	panel_crt_table = viafb_get_best_mode(panel_hres, panel_vres, 60);
 	viafb_fill_var_timing_info(&panel_var, panel_crt_table);
-	DEBUG_MSG(KERN_INFO "bellow viafb_lcd_set_mode!!\n");
+	DEBUG_MSG(KERN_INFO "below viafb_lcd_set_mode!!\n");
 	if (VT1636_LVDS == plvds_chip_info->lvds_chip_name)
 		viafb_init_lvds_vt1636(plvds_setting_info, plvds_chip_info);
 	clock = PICOS2KHZ(panel_crt_table->pixclock) * 1000;
-- 
2.32.0

