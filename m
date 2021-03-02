Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1E6329F73
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 13:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A18A6E93E;
	Tue,  2 Mar 2021 12:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9288F6E93E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 12:49:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1614688971; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=FF5GwOFbVjRhJqJErMdD+9jWbXkGYVwkZGwfZ42C1bnR5anu8aj5vejU2dOPGoZ1ki
 ScjIDTkKRmEdGhm9AP+ty6DrkS0ZlyZZrj+SAPU7L0QfhOs35e+dUuY29sROz7bzsJAg
 maTMDRsZjWL7nTSwiCdSoOfVs6wGQicClRS+3uFwhHHKeHoeYI+GWzEUmVVUoZVEKNgU
 P3jnDDhn5lbtPv6vZcJyOF3sjEK2SNnFZxpZpi4ZYmsjsKccGrA7YZTyNxnCurPAYKF8
 vNYP5+G36dPjfGTt9vqM9JxyGmuCkO/WDV7famXzKdiflb9vvoiHqIGOCuOWuIzsdG3u
 NnOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1614688971;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=M0joGJvVjkLtNUFWRb3GQ9CRUi9TJEmtHMRhbe4S2cw=;
 b=QTtYZP1hkAN9hOw400/TAB0zXFI077PWm2UUw6HZWLoNZz4aZR8iAVRO1AZ8bby8On
 ejPWX2BssQ+hXbetDYOtgyizW7FBnmmZOhKrw0XlZamOJOxJiEPIAjh/yrPjnK38QxZO
 NSlj17UTw7o24Js5HYxPFCDCH3lFH/HRHlp2YGOaaMdhwr5ZcqPQCnIi1iON93xW53Ua
 0X9GHlunl9r0vvGQmD1mjLm/8yHJbS+CDpdBC1jZXD6wmdDiepGup99+1ZSmOQfRkR5a
 Yd/ZX1tXPW4zcyazuEntJohI1k0OF/kDNGpBlbryilMqaItzUkZO2QM86coaCA6LdqY9
 SHBA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1614688971;
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=M0joGJvVjkLtNUFWRb3GQ9CRUi9TJEmtHMRhbe4S2cw=;
 b=P6ygV2kn0wugpEuzjnVy/kAoc4uZBO/F378TFoA6XjCN9dNH4ZqShr/LuS3vqrT84O
 K93pJ/EkkAkNSrupReYpz3TUJzrKXrrhBjKc1t/Tgk4WLIlvXukH4IGRo7QsJfpVSrDu
 jao8RfGcBlJRm9vnwLvf03wc8uzg/s+lA4bmh5HEn0smTvnSKUu7Nj0778Bu1G/VHIz+
 ehRVWMBgGs+PMnGe6mcfkIRpMrQlWBGY5kQn0q2Al0TPcAlrj6Z7CjyZCYhi4FIo671Y
 w23tqbjMf78XxjiV1LGwu2hbljZ81J97U9ZPCsrjQyne8aHtRE4KYGvhZ4PyMcrTHSS0
 AF+w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7Nk1d30M="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.20.2 DYNA|AUTH)
 with ESMTPSA id d08e86x22Cgo8sA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 2 Mar 2021 13:42:50 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: panel-simple: fix missing DRM_MODE_CONNECTOR_DPI for
 Ortustech com37h3m
Date: Tue,  2 Mar 2021 13:42:49 +0100
Message-Id: <ff968cde9b64538101395cc660b7af3fda0945b4.1614688968.git.hns@goldelico.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Without we get an "Specify missing connector_type" warning.

Fixes: ddb8e853dc85 ("drm/panel: panel-simple: validate panel description")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4e2dad314c7953..502b5f1c4fd16c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3226,6 +3226,7 @@ static const struct panel_desc ortustech_com37h3m = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
 		     DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
 static const struct drm_display_mode ortustech_com43h4m85ulc_mode  = {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
