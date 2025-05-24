Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D64FAC2F75
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 13:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A65A10E214;
	Sat, 24 May 2025 11:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LtxkyS3Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEE910E21C
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 11:48:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 462B45C5478;
 Sat, 24 May 2025 11:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 058C1C4CEF8;
 Sat, 24 May 2025 11:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748087325;
 bh=eHBYIf5NbtgRccmvXhdOxhwbZsizTYF1aR36WSqYoS4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=LtxkyS3ZuDeVyUx8yS+OxicTD/mo0+soydGgVHcDZBQ4eXD09dqmnhdsK8XD8+mTV
 IvXLbCjZoeOwpDUSdJfcUrQ5sJ3AGYW4Vqb8sljdfaok2wSaKJ9kbUEf/91mK7saTl
 fZYhyOsKY3cHvbSdI2V+xIEmX3klt7D1E0hhqoUsJxXW+LCoufqe+zy7O5WiOhr3v2
 NVCkzb1KO1FqYoTjx6Sz7B8C3BSR/uLzujO8jZoH3/lGCu4rszV1xktxevLX2A+Oc4
 VgOLaF5/PPiouU/SUBrjdNnwpIxyUR0jusEVZF90RmD1B5KVn+ZF4dT8zkECXo9LLu
 PCR5TdbqktAFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id EA2E0C5AD49;
 Sat, 24 May 2025 11:48:44 +0000 (UTC)
From: Jens Glathe via B4 Relay
 <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 24 May 2025 13:48:38 +0200
Subject: [PATCH v4 3/5] usb: misc: onboard_usb_dev: Add Bison Electronics
 Inc. Integrated Camera
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-tb16-dt-v4-3-2c1e6018d3f0@oldschoolsolutions.biz>
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
In-Reply-To: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748087323; l=2558;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=Nf3v/6LRLg57RjwhplrovE4DP5a0Ez2PkQJ5KdkIkUk=;
 b=eUSx1oThLWzJ16fgshk3BgufrCsmXTBs5m9vj+ePcwaZDn3TEyjLMCaZ4ZOgxX/8yk9R4ZqQa
 bC5JEtVtETuBqjEYFDAzS1oQ3Yrk7HPwd+JMfSHjw+gshubaXWcNiyd
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
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
Reply-To: jens.glathe@oldschoolsolutions.biz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The Camera is built into the Thinkbook 16 G7 QOY and directly attached on the
usb_2 controller (dwc3 USB2 only). It has a separate power supply that needs
to be controlled for PM.

Add the support for this device for the power supply.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/usb/misc/onboard_usb_dev.c | 2 ++
 drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 1048e3912068ced166c76838cf7306d86e192fe4..17b1f345b6b65bf25e68e77b0a345936825e1d04 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -569,6 +569,7 @@ static struct platform_driver onboard_dev_driver = {
 #define VENDOR_ID_TI		0x0451
 #define VENDOR_ID_VIA		0x2109
 #define VENDOR_ID_XMOS		0x20B1
+#define VENDOR_ID_BISON		0x5986
 
 /*
  * Returns the onboard_dev platform device that is associated with the USB
@@ -677,6 +678,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 HUB */
 	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_XMOS, 0x0013) }, /* XMOS XVF3500 Voice Processor */
+	{ USB_DEVICE(VENDOR_ID_BISON, 0x1198) }, /* Bison Electronics Inc. Integrated Camera */
 	{}
 };
 MODULE_DEVICE_TABLE(usb, onboard_dev_id_table);
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index e017b8e22f936be66da73789abb4f620e6af4d6a..816d9ce71eaddc7ab0cb4517558dd44a591d6c28 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -115,6 +115,13 @@ static const struct onboard_dev_pdata xmos_xvf3500_data = {
 	.is_hub = false,
 };
 
+static const struct onboard_dev_pdata bison_intcamera_data = {
+	.reset_us = 1000,
+	.num_supplies = 1,
+	.supply_names = { "vdd" },
+	.is_hub = false,
+};
+
 static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb424,2412", .data = &microchip_usb424_data, },
 	{ .compatible = "usb424,2514", .data = &microchip_usb2514_data, },
@@ -144,6 +151,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb20b1,0013", .data = &xmos_xvf3500_data, },
+	{ .compatible = "usb5986,1198", .data = &bison_intcamera_data, },
 	{}
 };
 

-- 
2.48.1


