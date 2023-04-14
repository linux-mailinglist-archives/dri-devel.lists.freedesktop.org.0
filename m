Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E666E2848
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 18:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC44610EE19;
	Fri, 14 Apr 2023 16:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2254 seconds by postgrey-1.36 at gabe;
 Fri, 14 Apr 2023 16:26:25 UTC
Received: from tartarus.angband.pl (tartarus.angband.pl [51.83.246.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3748C10EE19
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=angband.pl; 
 s=tartarus;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ea4vcu8itYFcYuNH+YqWPwH8xpB0Q5e+uByqCgWDU2A=; b=kYQfgpoKpp31B+B/+d2vDhdpxO
 APZdG77Kuim7XZ7NT/ugGAuVTR51eCX1SIMOiq9iV0ngKUUdOP/rqf5E8osa7Sc+EeDhDDO/t9m0Q
 mFDgy5YRnUXuC4921vsbC0JEF+/Rin9paKKopYlRY0DqJepIEaaNDUkiqy7ULBETWQz8=;
Received: from localhost ([127.0.0.1] helo=valinor.angband.pl)
 by tartarus.angband.pl with smtp (Exim 4.96)
 (envelope-from <kilobyte@valinor.angband.pl>) id 1pnLey-00EWQK-1R;
 Fri, 14 Apr 2023 17:48:24 +0200
Received: (nullmailer pid 30593 invoked by uid 1000);
 Fri, 14 Apr 2023 15:48:23 -0000
From: Adam Borowski <kilobyte@angband.pl>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH PING] drm/arc: disambiguate Synopsys ARC in Kconfig labels
Date: Fri, 14 Apr 2023 17:48:14 +0200
Message-Id: <20230414154814.30549-1-kilobyte@angband.pl>
X-Mailer: git-send-email 2.40.0
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
Cc: Adam Borowski <kilobyte@angband.pl>, Alexey Brodkin <abrodkin@synopsys.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's Intel Arc now which is what most folks will be looking for.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/tiny/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

v2: added Alexey's ACK.

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index f6889f649bc1..efeead65030a 100644
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
2.40.0

