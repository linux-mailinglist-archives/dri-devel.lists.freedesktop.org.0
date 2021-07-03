Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 568BB3BA8DC
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 16:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126E589C2A;
	Sat,  3 Jul 2021 14:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458B789C2A
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jul 2021 14:13:47 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id 105BD2083B;
 Sat,  3 Jul 2021 16:13:42 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/gud: Add Raspberry Pi Pico ID
Date: Sat,  3 Jul 2021 16:13:20 +0200
Message-Id: <20210703141321.35494-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fOAXI6Se c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=gAmX6pxEAAAA:20 a=KKAkSRfTAAAA:8
 a=SJz97ENfAAAA:8 a=qtla69L1cc8Jg11Q0kEA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Peter Stuge <peter@stuge.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add VID/PID for the Raspberry Pi Pico implementation.
Source: https://github.com/notro/gud-pico

Cc: Peter Stuge <peter@stuge.se>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index d02f8e968aad..eb4e08846da4 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -660,6 +660,7 @@ static int gud_resume(struct usb_interface *intf)
 
 static const struct usb_device_id gud_id_table[] = {
 	{ USB_DEVICE_INTERFACE_CLASS(0x1d50, 0x614d, USB_CLASS_VENDOR_SPEC) },
+	{ USB_DEVICE_INTERFACE_CLASS(0x16d0, 0x10a9, USB_CLASS_VENDOR_SPEC) },
 	{ }
 };
 
-- 
2.23.0

