Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D10A99F1D39
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 09:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5F710E373;
	Sat, 14 Dec 2024 08:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="phVFip/P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 91A5410E373
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 08:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=w1t+Y
 xVGo3C7adso2ew9kchvYon/DvfCqltU1uP0Uy4=; b=phVFip/Pw/wVGjOzww4MX
 ynJB5+BySB8dZMfStynNyJtRnCyipiiVOndjv6QPWPAlB2X6xusG1kovatB06pk1
 bqg0ufZGM/JrjqZsFcl4Go2oJppvx3zeqJALSkMYThstNbMAR4nC3VHACr5MV586
 pnsdEpSSg46mJcM1I5JFIU=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wD3vwGjPl1n3T_wAQ--.16730S9; 
 Sat, 14 Dec 2024 16:15:41 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, Min-Hua Chen <minhuadotchen@gmail.com>,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v6 07/16] drm/rockchip: vop2: include rockchip_drm_drv.h
Date: Sat, 14 Dec 2024 16:15:15 +0800
Message-ID: <20241214081529.3330243-8-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214081529.3330243-1-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
 <20241214081529.3330243-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3vwGjPl1n3T_wAQ--.16730S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyxKw45Wr48JrWfuF4fAFb_yoW8CFW5pF
 s8AFWUZrWxKFWjqr1DAF9xCr4Fy3ZFkayxGas7G3ZxZF12gF1DGwnrW3s5JrZrXr47ZF42
 krs3J34UCF42vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jj9a9UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g+1XmddMGzhNQAAsE
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

From: Min-Hua Chen <minhuadotchen@gmail.com>

Move rockchip_drm_drv.h in rockchip_drm_vop2.h to fix the follow
sparse warning:

ARCH=arm64 LLVM=1 make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
mrproper defconfig all  -j12

drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:502:24: sparse:
warning: symbol 'vop2_platform_driver' was not declared. Should it
be static?

It is also beneficial for the upcoming support for rk3576.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>

---

(no changes since v3)

Changes in v3:
- Split it from 10/15, as it fix a exiting compile warning.

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 1 -
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 85d281edfbfe..b5f35839d5e8 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -35,7 +35,6 @@
 #include <uapi/linux/videodev2.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 
-#include "rockchip_drm_drv.h"
 #include "rockchip_drm_gem.h"
 #include "rockchip_drm_vop2.h"
 #include "rockchip_rgb.h"
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index f4724a402ac2..29cc7fb8f6d8 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -9,6 +9,7 @@
 
 #include <linux/regmap.h>
 #include <drm/drm_modes.h>
+#include "rockchip_drm_drv.h"
 #include "rockchip_drm_vop.h"
 
 #define VOP2_VP_FEATURE_OUTPUT_10BIT        BIT(0)
-- 
2.34.1

