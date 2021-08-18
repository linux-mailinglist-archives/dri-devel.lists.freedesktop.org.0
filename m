Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 869473F147D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 09:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B636E94B;
	Thu, 19 Aug 2021 07:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 492 seconds by postgrey-1.36 at gabe;
 Wed, 18 Aug 2021 21:57:14 UTC
Received: from mail.manjaro.org (mail.manjaro.org [IPv6:2a01:4f8:c0c:51f3::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4D9892BE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 21:56:37 +0000 (UTC)
From: Dan Johansen <strit@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1629323338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ueTgIx4j7wz09XfOVsuTpOpc05lXon2W8L53pROMBbE=;
 b=sPly4mfQsMnslE4SnYXtmngfxzTft5b+lSFKxIWDty3gAzCjuEZb76CKdhWEtbFNKOaH9p
 Y/6TpH8TRenLBdsobi3emyOLwgUEAAoHiDXoCIqlQonlUGfIw4kueIsJ8YR/T/MSfb7dVn
 9uGnf3LZd7pDCKdnk7fThWB3RwYa3wNT1XXeVn2t2lY+OmkoAwYvwa2ND3dNRTwTfDoRJj
 qut3UpW6vmkQQNa76PcgVZ71PtDLRItP23PbipInP3D3BaUaYLdMmL1D1qe59u3LV0zuZJ
 e0fMMEtivPnCuBmTjVzoRyciWm5l5gqtLqBy0MQtVtTfgR+eL853C7zY27pvhw==
To: thierry.reding@gmail.com,
	sam@ravnborg.org
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 Dan Johansen <strit@manjaro.org>, Marius Gripsgard <marius@ubports.com>
Subject: [PATCH] drm/panel:Adjust sync values for Feixin K101-IM2BYL02 panel
Date: Wed, 18 Aug 2021 23:48:18 +0200
Message-Id: <20210818214818.298089-1-strit@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=strit@manjaro.org smtp.mailfrom=strit@manjaro.org
X-Mailman-Approved-At: Thu, 19 Aug 2021 07:45:59 +0000
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

This adjusts sync values according to the datasheet

Fixes: 	1c243751c095bb95e2795f076ea7a0bcdd60a93a ("drm/panel: ilitek-ili9881c: add support for Feixin K101-IM2BYL02 panel")
Co-developed-by: Marius Gripsgard <marius@ubports.com>
Signed-off-by: Dan Johansen <strit@manjaro.org>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 0145129d7c66..534dd7414d42 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -590,14 +590,14 @@ static const struct drm_display_mode k101_im2byl02_default_mode = {
 	.clock		= 69700,
 
 	.hdisplay	= 800,
-	.hsync_start	= 800 + 6,
-	.hsync_end	= 800 + 6 + 15,
-	.htotal		= 800 + 6 + 15 + 16,
+	.hsync_start	= 800 + 52,
+	.hsync_end	= 800 + 52 + 8,
+	.htotal		= 800 + 52 + 8 + 48,
 
 	.vdisplay	= 1280,
-	.vsync_start	= 1280 + 8,
-	.vsync_end	= 1280 + 8 + 48,
-	.vtotal		= 1280 + 8 + 48 + 52,
+	.vsync_start	= 1280 + 16,
+	.vsync_end	= 1280 + 16 + 6,
+	.vtotal		= 1280 + 16 + 6 + 15,
 
 	.width_mm	= 135,
 	.height_mm	= 217,
-- 
2.32.0

