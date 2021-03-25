Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD3F348E95
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 12:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80266EB57;
	Thu, 25 Mar 2021 11:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17637.qiye.163.com (mail-m17637.qiye.163.com
 [59.111.176.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597A56EB57
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 11:10:41 +0000 (UTC)
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id C58D29803E4;
 Thu, 25 Mar 2021 19:10:33 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Wan Jiabing <wanjiabing@vivo.com>, Jyri Sarha <jsarha@ti.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] drivers: gpu: drm: Remove duplicate declaration
Date: Thu, 25 Mar 2021 19:10:24 +0800
Message-Id: <20210325111028.864628-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTx9MTx8eSR0aTB4fVkpNSk1NTEtNSE9LQ05VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pio6PCo*Aj8VKD4NKw9CCigR
 TQ8KCjdVSlVKTUpNTUxLTUhPT0NNVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFJSEhPNwY+
X-HM-Tid: 0a7869143022d992kuwsc58d29803e4
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
Cc: kael_w@yeah.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct dss_device has been declared. Remove the duplicate.
And sort these forward declarations alphabetically.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
Changelog:
v2:
- Sort forward declarations alphabetically.
---
 drivers/gpu/drm/omapdrm/dss/omapdss.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index a40abeafd2e9..040d5a3e33d6 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -48,16 +48,15 @@
 #define DISPC_IRQ_ACBIAS_COUNT_STAT3	(1 << 29)
 #define DISPC_IRQ_FRAMEDONE3		(1 << 30)
 
-struct dss_device;
-struct omap_drm_private;
-struct omap_dss_device;
 struct dispc_device;
+struct drm_connector;
 struct dss_device;
 struct dss_lcd_mgr_config;
+struct hdmi_avi_infoframe;
+struct omap_drm_private;
+struct omap_dss_device;
 struct snd_aes_iec958;
 struct snd_cea_861_aud_if;
-struct hdmi_avi_infoframe;
-struct drm_connector;
 
 enum omap_display_type {
 	OMAP_DISPLAY_TYPE_NONE		= 0,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
