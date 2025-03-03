Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D522A4CAEA
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 19:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C146910E03C;
	Mon,  3 Mar 2025 18:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="OqdJEGuF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0F110E03C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 18:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QvI3uoBBtrY63GFuz2BimKRrjmSrRphcFh9ZV4VWtho=; b=OqdJEGuFkISnTQKehCqXxKXvmh
 uZ04gWRn0+rtOAGZCya4mZwIiXOlB5i4E6iwYg7+cQBO5tabqR2KE6NvctV11i8WGc9VCjLMeODIX
 76ZvKuE0kbs4JYvmgWyvaw0JDZ+EVZ9Hri82Z1jC8XD0T7OWmJrbyMgDLrK00qd0Cw5a3puvNWm4f
 584M3qNk7hihHXiLrS3u9vuKdWnySxKugk2dqMO9PScKBdX+0KJy6qJ2vf1YQAlwB3XgIMourmhfq
 ESj3b/Tlcl2a/e7NhMIlA0f2RDBz2/bh9R9zRAReyAXpAj3mctqU5v74WsC+wKAygO4jgiqe1S3NM
 L+IlP4AQ==;
Received: from i53875a38.versanet.de ([83.135.90.56]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tpARX-0004dM-8j; Mon, 03 Mar 2025 19:23:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/rockchip: vop2: add missing bitfield.h include
Date: Mon,  3 Mar 2025 19:22:56 +0100
Message-ID: <20250303182256.1727178-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 328e6885996c ("drm/rockchip: vop2: Add platform specific callback")
moved per soc configuration code to the other per-soc data into
rockchip_vop2_reg.c, but forgot to also include bitfield.h for the used
FIELD_PREP macro. Add this missing include.

Fixes: 328e6885996c ("drm/rockchip: vop2: Add platform specific callback")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503040135.fgoyWdLB-lkp@intel.com/
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 0afef24db144..f86a30df94aa 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -4,6 +4,7 @@
  * Author: Andy Yan <andy.yan@rock-chips.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/kernel.h>
 #include <linux/component.h>
 #include <linux/mod_devicetable.h>
-- 
2.47.2

