Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165E66084EC
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 08:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211B410E0CA;
	Sat, 22 Oct 2022 06:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62E510E0CA
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 06:06:06 +0000 (UTC)
X-QQ-mid: bizesmtp85t1666418758tyusmhdu
Received: from localhost.localdomain ( [182.148.15.254])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 22 Oct 2022 14:05:57 +0800 (CST)
X-QQ-SSF: 01000000000000C0E000000A0000000
X-QQ-FEAT: mhDoKBI5A3ATK8ywXlCpoa1WQWXf6h02BTkLcofe/Cg10W02z6GQMH5yEeuCs
 4AA0A9hwr5YUyJ2m8OtRtQm4uDjSjonZduer1En4GDCRUmBeTs8r5PT0Ez3Aiyoc6BkMDbz
 CozbV/ZtcmCn93t3xFzWF0l7CQgnGsc96lloRlFEvzuywwxfa7kCWcdkCZA5eEil1jqbJPw
 X/pFiXQ+jsJo9NY3B/4r3RwQ7zrFh4T9E0YcDaGFN7j2pkBh+yaDPwQ5iVYWxiKV/+fDuvW
 dp4iddf19HmtC8lDOs5Re6na7dOVmUTVU8WKj4zjVAgsLUNmsK56R4QRAH76HDvA4wMqDg0
 +cQC97ZqwLySKxS3uk1uT06/Zr8ixMeHBdrsVKdvf6YG18j+mU=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] gpu/drm: fix repeated words in comments
Date: Sat, 22 Oct 2022 14:05:51 +0800
Message-Id: <20221022060551.56918-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
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
Cc: wangjianli <wangjianli@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the redundant word 'the'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index c40bde96cfdf..ae12cca8b123 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -605,7 +605,7 @@ int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi)
 EXPORT_SYMBOL(mipi_dsi_turn_on_peripheral);
 
 /*
- * mipi_dsi_set_maximum_return_packet_size() - specify the maximum size of the
+ * mipi_dsi_set_maximum_return_packet_size() - specify the maximum size of
  *    the payload in a long packet transmitted from the peripheral back to the
  *    host processor
  * @dsi: DSI peripheral device
-- 
2.36.1

