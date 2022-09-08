Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522AE5B2EB2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CAC10EBDA;
	Fri,  9 Sep 2022 06:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C72C10E9BD
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 12:36:34 +0000 (UTC)
X-QQ-mid: bizesmtp71t1662640584tam1w07w
Received: from localhost.localdomain ( [182.148.14.0])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 08 Sep 2022 20:36:22 +0800 (CST)
X-QQ-SSF: 0100000000200090C000B00A0000000
X-QQ-FEAT: NCCf6GxSCjvw1iXhK9qC7rQ2uhCMxKhxNDHZO29CryP9okCDowcQgOAmGUBA0
 305O50IoPtW1SUwsa0tUrHDmdwPFSiTjiHFGZ2RIBqqfxz8+FFrxu7npK2b1+vEefTyrvGk
 eQMq5gOhqz9zxgs2N4WvGcgGzh0bmcDWSsd6/ivDZ2YsUmofRqaxaoPOhVG2ZbHsvFLltRU
 scoTeY4HqGgVng8EYIIcGnJZ99Pidz9egejujj+kuW4Q5KRFSTqmNztLUEMux01Y3G6o+qY
 TJ0KgNpewgfC71emy71V1rqOEkzO3WmYGWLGo1C0WEM0GmuGyJRPXqrdb4D3D9G8a1A7tg5
 ZLorMAQUpaPwMU1mESnLg9SVq/WUMkB90caIGn78FUUK+Y8qRg=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/rockchip: fix repeated words in comments
Date: Thu,  8 Sep 2022 20:36:16 +0800
Message-Id: <20220908123616.19195-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Fri, 09 Sep 2022 06:19:19 +0000
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
Cc: wangjianli <wangjianli@cdjrlc.com>, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the redundant word 'in'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index bdd48f87d098..fab710910997 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1188,7 +1188,7 @@ static bool vop_crtc_mode_fixup(struct drm_crtc *crtc,
 	 *
 	 * Key points:
 	 *
-	 * - DRM works in in kHz.
+	 * - DRM works in kHz.
 	 * - Clock framework works in Hz.
 	 * - Rockchip's clock driver picks the clock rate that is the
 	 *   same _OR LOWER_ than the one requested.
-- 
2.36.1

