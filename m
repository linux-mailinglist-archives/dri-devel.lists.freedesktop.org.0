Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHl2LYoLf2lziwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 09:15:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539AEC532D
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 09:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA10F10E09C;
	Sun,  1 Feb 2026 08:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Jxs4GulN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C8210E0CF
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Feb 2026 08:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=PS
 OwGDUdVdduIta+j2KKb1RKHKHSYr2bnlnBAZBE19k=; b=Jxs4GulNiuuEZxf5uL
 mQ1t6YRz/A3fJAjuZFtb9JXef29b5e2s5oSd2CYQzJuN1zdh7PbizWtj8ivsdlz+
 mfWzqAjyZGJ1ojhCiUGNiTn9F1LKOAQ2STGELgY1IDSZqHyIaiAKB+8wc7ongEM0
 lnNfFaVB45IIUaKbSRO55TUPo=
Received: from ProDesk-480.. (unknown [])
 by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id
 _____wD3Hz40C39pmxGTKQ--.55310S4; 
 Sun, 01 Feb 2026 16:13:48 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: alchark@gmail.com, andrzej.hajda@intel.com, conor+dt@kernel.org,
 cristian.ciocaltea@collabora.com, airlied@gmail.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, kever.yang@rock-chips.com,
 krzk+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, nicolas.frattaroli@collabora.com,
 robh@kernel.org, rfoss@kernel.org, hjc@rock-chips.com,
 sebastian.reichel@collabora.com, simona@ffwll.ch, tzimmermann@suse.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 2/5] drm/bridge: synopsys: dw-dp: Set pixel mode by
 platform data
Date: Sun,  1 Feb 2026 16:13:28 +0800
Message-ID: <20260201081338.407999-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260201081338.407999-1-andyshrk@163.com>
References: <20260201081338.407999-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3Hz40C39pmxGTKQ--.55310S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF4UXFyDtF47tr1xJF4Utwb_yoWrAw4rpF
 WxJFW5KrWkKF4Y9a48ArWkCFn0yw1q9ayxJa1xGw4Ik34fKFn5Xr9Ivr15Wrn7XF9xur13
 CrsrJrW8ZF1jkrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jmrWwUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7RwMaml-CzxsDAAA3W
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:heiko@sntech.de,m:alchark@gmail.com,m:andrzej.hajda@intel.com,m:conor+dt@kernel.org,m:cristian.ciocaltea@collabora.com,m:airlied@gmail.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:kever.yang@rock-chips.com,m:krzk+dt@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:nicolas.frattaroli@collabora.com,m:robh@kernel.org,m:rfoss@kernel.org,m:hjc@rock-chips.com,m:sebastian.reichel@collabora.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:andy.yan@rock-chips.com,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,kernel.org,collabora.com,kwiboo.se,rock-chips.com,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rock-chips.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 539AEC532D
X-Rspamd-Action: no action

From: Andy Yan <andy.yan@rock-chips.com>

In the implementation and integration of the SoC, the DW DisplayPort
hardware block can be configured to work in single, dual, quad pixel
mode on differnt platforms, so make the pixel mode set by plat_data
to support the upcoming rk3576 variant.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>

---

Changes in v2:
- Commit message improve: The pixel mode is determined during the IC
  integration stage

 drivers/gpu/drm/bridge/synopsys/dw-dp.c   |  8 +-------
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 19 +++++++++++++++----
 include/drm/bridge/dw_dp.h                |  7 +++++++
 3 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 82aaf74e1bc0..eccf6299bdb7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -352,12 +352,6 @@ enum {
 	DW_DP_YCBCR420_16BIT,
 };
 
-enum {
-	DW_DP_MP_SINGLE_PIXEL,
-	DW_DP_MP_DUAL_PIXEL,
-	DW_DP_MP_QUAD_PIXEL,
-};
-
 enum {
 	DW_DP_SDP_VERTICAL_INTERVAL = BIT(0),
 	DW_DP_SDP_HORIZONTAL_INTERVAL = BIT(1),
@@ -1984,7 +1978,7 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 		return ERR_CAST(dp);
 
 	dp->dev = dev;
-	dp->pixel_mode = DW_DP_MP_QUAD_PIXEL;
+	dp->pixel_mode = plat_data->pixel_mode;
 
 	dp->plat_data.max_link_rate = plat_data->max_link_rate;
 	bridge = &dp->bridge;
diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 25ab4e46301e..89d614d53596 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -75,7 +75,7 @@ static const struct drm_encoder_helper_funcs dw_dp_encoder_helper_funcs = {
 static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct dw_dp_plat_data plat_data;
+	const struct dw_dp_plat_data *plat_data;
 	struct drm_device *drm_dev = data;
 	struct rockchip_dw_dp *dp;
 	struct drm_encoder *encoder;
@@ -89,7 +89,10 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 	dp->dev = dev;
 	platform_set_drvdata(pdev, dp);
 
-	plat_data.max_link_rate = 810000;
+	plat_data = of_device_get_match_data(dev);
+	if (!plat_data)
+		return -ENODEV;
+
 	encoder = &dp->encoder.encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev, dev->of_node);
 	rockchip_drm_encoder_set_crtc_endpoint_id(&dp->encoder, dev->of_node, 0, 0);
@@ -99,7 +102,7 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 		return ret;
 	drm_encoder_helper_add(encoder, &dw_dp_encoder_helper_funcs);
 
-	dp->base = dw_dp_bind(dev, encoder, &plat_data);
+	dp->base = dw_dp_bind(dev, encoder, plat_data);
 	if (IS_ERR(dp->base)) {
 		ret = PTR_ERR(dp->base);
 		return ret;
@@ -134,8 +137,16 @@ static void dw_dp_remove(struct platform_device *pdev)
 	component_del(dp->dev, &dw_dp_rockchip_component_ops);
 }
 
+static const struct dw_dp_plat_data rk3588_dp_plat_data = {
+	.max_link_rate = 810000,
+	.pixel_mode = DW_DP_MP_QUAD_PIXEL,
+};
+
 static const struct of_device_id dw_dp_of_match[] = {
-	{ .compatible = "rockchip,rk3588-dp", },
+	{
+		.compatible = "rockchip,rk3588-dp",
+		.data = &rk3588_dp_plat_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, dw_dp_of_match);
diff --git a/include/drm/bridge/dw_dp.h b/include/drm/bridge/dw_dp.h
index d05df49fd884..25363541e69d 100644
--- a/include/drm/bridge/dw_dp.h
+++ b/include/drm/bridge/dw_dp.h
@@ -11,8 +11,15 @@
 struct drm_encoder;
 struct dw_dp;
 
+enum {
+	DW_DP_MP_SINGLE_PIXEL,
+	DW_DP_MP_DUAL_PIXEL,
+	DW_DP_MP_QUAD_PIXEL,
+};
+
 struct dw_dp_plat_data {
 	u32 max_link_rate;
+	u8 pixel_mode;
 };
 
 struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
-- 
2.43.0

