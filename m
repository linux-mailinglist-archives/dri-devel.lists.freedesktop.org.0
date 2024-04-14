Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E008A4234
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 14:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2E010EAB3;
	Sun, 14 Apr 2024 12:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="cR5Oet6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 86568 seconds by postgrey-1.36 at gabe;
 Sun, 14 Apr 2024 12:09:03 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id EFCDC10EAB3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=HNiS1
 KMxrrJC1nczoSnnrRUJUsfXNR6TsxaQz8HCQsY=; b=cR5Oet6S0/nyjW/jd9cSl
 Rl4NYL6vCrDFVGIBRN9+95M19ppZFYYI88fgtE+3DFbeIfWpOWEWS5tQvrbXBbKN
 kCx26AO7Bcb8wmuCe13C1/1PG4wUpQX3/3jm87BKIRcH9/WjeUxlTczI3MFeZstY
 zE9dTqFtzJcXZ6u3fzKyTU=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mta-g1-5 (Coremail) with SMTP id _____wDn7yFKxxtmItV9BA--.26437S2;
 Sun, 14 Apr 2024 20:08:46 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: tzimmermann@suse.de, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: lvds: Remove include of drm_dp_helper.h
Date: Sun, 14 Apr 2024 20:08:41 +0800
Message-Id: <20240414120841.837661-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn7yFKxxtmItV9BA--.26437S2
X-Coremail-Antispam: 1Uf129KBjvkXoW8ZrW5Jryxtw1kKr4kAw1Dp5X_Zr45panxCr
 yUJrWfGFWjq3WqkFnayrZ0ya1kAa97Kr97W3ZrZ3W7tFy7Gwn5uwn5XrnxXr47Za1Y9rZr
 Ja45AF47Zw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy29KBj
 DUYxBIdaVFxhVjvjDU0xZFpf9x07jV89tUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h3AXmWXxJbtmgABsH
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

From: Andy Yan <andy.yan@rock-chips.com>

drm_dp_helper.h is not used by lvds driver

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_lvds.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 77b76cff1adb..9a01aa450741 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -17,7 +17,6 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
-- 
2.34.1

