Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5489442A444
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 14:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BB76E950;
	Tue, 12 Oct 2021 12:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269656E847
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 11:54:03 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CBqHki010546; 
 Tue, 12 Oct 2021 11:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2021-07-09; bh=GOvdf50VyIqyVyyskw2X4oyOo7gaVVfLw8MH7DW22do=;
 b=TTy2tFud9/lhTKr2Ivkqm5YD4SgO4kmY3mMsohTFDI6AuaeJxvEqUFj/LGtH9sqs9yxo
 MnfBp8DNcz/N6plQjHD6wVOIEOpN8Au+xl8TQ6XIoE1XdO7A8Aiz+5BKLxWYFzAjKYnG
 4DiyG93YR+pNDoZxSQzw7ueo4EIuKQf4eGqsr1z7z/dnlHySuexivPhg1zoA0QFN92oC
 3WYjN/hHnfpogyqqnIDn1PmcGhSQYXvkqyaeyJgGJ2/+DYFsogG7AJRL1/iL+pMCqZXB
 BmrJtsZxZVKIFJDGLU+AY7VLyWpsEtehlXaJBE2d1G6eUpguBo6v2E4Z7f+pwrtzR7iK ww== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bmq29q7wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 11:53:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19CBoPYu156819;
 Tue, 12 Oct 2021 11:53:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 3bkyxrj1ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 11:53:34 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 19CBq7kS167266;
 Tue, 12 Oct 2021 11:53:33 GMT
Received: from t460.home (dhcp-10-175-26-251.vpn.oracle.com [10.175.26.251])
 by aserp3030.oracle.com with ESMTP id 3bkyxrj19q-1;
 Tue, 12 Oct 2021 11:53:33 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Stefan Mavrodiev <stefan@olimex.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] drm/panel: olimex-lcd-olinuxino: select CRC32
Date: Tue, 12 Oct 2021 13:52:42 +0200
Message-Id: <20211012115242.10325-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.23.0.718.g5ad94255a8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5erpPMEU2r0ZG6OyF1FKTHOIhRW-UxED
X-Proofpoint-GUID: 5erpPMEU2r0ZG6OyF1FKTHOIhRW-UxED
X-Mailman-Approved-At: Tue, 12 Oct 2021 12:21:56 +0000
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

Fix the following build/link error by adding a dependency on the CRC32
routines:

  ld: drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.o: in function `lcd_olinuxino_probe':
  panel-olimex-lcd-olinuxino.c:(.text+0x303): undefined reference to `crc32_le'

Fixes: 17fd7a9d324fd ("drm/panel: Add support for Olimex LCD-OLinuXino panel")
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 drivers/gpu/drm/panel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index beb581b96ecdc..418638e6e3b0a 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -295,6 +295,7 @@ config DRM_PANEL_OLIMEX_LCD_OLINUXINO
 	depends on OF
 	depends on I2C
 	depends on BACKLIGHT_CLASS_DEVICE
+	select CRC32
 	help
 	  The panel is used with different sizes LCDs, from 480x272 to
 	  1280x800, and 24 bit per pixel.
-- 
2.23.0.718.g5ad94255a8

