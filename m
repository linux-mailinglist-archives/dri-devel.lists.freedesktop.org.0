Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D227C60E1DA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 15:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D39A10E52D;
	Wed, 26 Oct 2022 13:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2413 seconds by postgrey-1.36 at gabe;
 Wed, 26 Oct 2022 13:17:31 UTC
Received: from tartarus.angband.pl (tartarus.angband.pl [51.83.246.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28AE10E044
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 13:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=angband.pl; 
 s=tartarus;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=llPUghCPVreD7EpBEqpPyjdhFdd4NaYKksytbZvlSNE=; b=nUoTegT5y0L1eTDjphXggT2rlw
 Mzl++GtwSxdSLdAqRuVSV9yy1O8PvK2p79ZtOMi1MAGpnb62jw9AwQqMsNGrekc/qhdAdUQXh2nGF
 rTJy5+SJOSsN9z5FdeytXuWcngXpGTXxCE4Ao0M5UOcWZbcPkVSlAOy5dnUIutq7kP0g=;
Received: from localhost ([127.0.0.1] helo=valinor.angband.pl)
 by tartarus.angband.pl with smtp (Exim 4.94.2)
 (envelope-from <kilobyte@valinor.angband.pl>)
 id 1onfeM-00AvEN-2T; Wed, 26 Oct 2022 14:36:50 +0200
Received: (nullmailer pid 42767 invoked by uid 1000);
 Wed, 26 Oct 2022 12:36:49 -0000
From: Adam Borowski <kilobyte@angband.pl>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alexey Brodkin <abrodkin@synopsys.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/arc: disambiguate Synopsys ARC in Kconfig labels
Date: Wed, 26 Oct 2022 14:36:40 +0200
Message-Id: <20221026123640.42731-1-kilobyte@angband.pl>
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: kilobyte@valinor.angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
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
Cc: Adam Borowski <kilobyte@angband.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's Intel Arc now which is what most folks will be looking for.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 drivers/gpu/drm/tiny/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 565957264875..51b60c1a2bea 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 config DRM_ARCPGU
-	tristate "ARC PGU"
+	tristate "Synopsys ARC PGU"
 	depends on DRM && OF
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	help
-	  Choose this option if you have an ARC PGU controller.
+	  Choose this option if you have a Synopsys ARC PGU controller.
 
 	  If M is selected the module will be called arcpgu.
 
-- 
2.37.2.609.g9ff673ca1a

