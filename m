Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5417873AD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 17:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341D110E58B;
	Thu, 24 Aug 2023 15:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F1510E589
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 15:08:55 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:3c6b:f703:5ab5:f36d])
 by albert.telenet-ops.be with bizsmtp
 id dT8t2A00Y01sfPQ06T8tx9; Thu, 24 Aug 2023 17:08:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qZBwx-001dhB-Fq;
 Thu, 24 Aug 2023 17:08:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qZBx7-000Vys-55;
 Thu, 24 Aug 2023 17:08:53 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 3/8] drm/ssd130x: Use bool for ssd130x_deviceinfo flags
Date: Thu, 24 Aug 2023 17:08:41 +0200
Message-Id: <285005ff361969eff001386c5f97990f0e703838.1692888745.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692888745.git.geert@linux-m68k.org>
References: <cover.1692888745.git.geert@linux-m68k.org>
MIME-Version: 1.0
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .need_pwm and .need_chargepump fields in struct ssd130x_deviceinfo
are flags that can have only two possible values: 0 and 1.
Reduce kernel size by changing their types from int to bool.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - New.
---
 drivers/gpu/drm/solomon/ssd130x.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index 87968b3e7fb8279d..aa39b13615ebedf2 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -40,8 +40,8 @@ struct ssd130x_deviceinfo {
 	u32 default_width;
 	u32 default_height;
 	u32 page_height;
-	int need_pwm;
-	int need_chargepump;
+	bool need_pwm;
+	bool need_chargepump;
 	bool page_mode_only;
 };
 
-- 
2.34.1

