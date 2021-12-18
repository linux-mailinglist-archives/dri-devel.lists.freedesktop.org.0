Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C460E479DD5
	for <lists+dri-devel@lfdr.de>; Sat, 18 Dec 2021 22:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27A410FB62;
	Sat, 18 Dec 2021 21:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C15311A98D
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 21:51:35 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BILIYdR016168;
 Sat, 18 Dec 2021 22:51:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=nSPGt6I8VV7/YSD60i8l6RqPpL6L3XSfjxlu2Bgb9HU=;
 b=26aqrgVJgTxA/05sCb3QwUGEBuf7Ebn/h1VcHDH7/HR5RFrzBMaHcd1JAx1AfgFwuAia
 Zkqi4rVpNe8aFkMd8L/5IqSOxViynybqULtd4FcnDA34qYsnT9HQWI28eGxXzbxELayv
 MQRMOs+svl3SRPCUEUgwEP3IpO4MR4BJoWtcM201/L9wDUN81ToAY/bg+8+MGv766wbx
 8ADcoHMeVCEhSr5cy5pV9er3Owgg11ulscWkEnWsSFMQ5G5dw574MBkBdMahrbWwPeH5
 2dSe+LJTYoPm9o2Mg2f82l86aYhR161oa9Owgf0Tv7QWKZ9TjxehQ1yRp3Bvbq6G8L/E 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3d15xmaqj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 18 Dec 2021 22:51:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 30B6D100034;
 Sat, 18 Dec 2021 22:51:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 25173209F5E;
 Sat, 18 Dec 2021 22:51:16 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Sat, 18 Dec 2021 22:51:15
 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Andrzej
 Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/3] drm/bridge/synopsys: dsi: extend the prototype of
 mode_valid()
Date: Sat, 18 Dec 2021 22:50:53 +0100
Message-ID: <20211218215055.212421-2-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211218215055.212421-1-antonio.borneo@foss.st.com>
References: <20211218215055.212421-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-18_08,2021-12-16_01,2021-12-02_01
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
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To evaluate the validity of a video mode, some additional internal
value has to be passed to the platform implementation.

Extend the prototype of mode_valid().

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
To: David Airlie <airlied@linux.ie>
To: Daniel Vetter <daniel@ffwll.ch>
To: Andrzej Hajda <a.hajda@samsung.com>
To: Neil Armstrong <narmstrong@baylibre.com>
To: Robert Foss <robert.foss@linaro.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>
To: Philippe Cornu <philippe.cornu@foss.st.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
To: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 5 ++++-
 include/drm/bridge/dw_mipi_dsi.h              | 4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index e44e18a0112a..3f6564762e24 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -998,7 +998,10 @@ dw_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	enum drm_mode_status mode_status = MODE_OK;
 
 	if (pdata->mode_valid)
-		mode_status = pdata->mode_valid(pdata->priv_data, mode);
+		mode_status = pdata->mode_valid(pdata->priv_data, mode,
+						dsi->mode_flags,
+						dw_mipi_dsi_get_lanes(dsi),
+						dsi->format);
 
 	return mode_status;
 }
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
index bda8aa7c2280..5286a53a1875 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -51,7 +51,9 @@ struct dw_mipi_dsi_plat_data {
 	unsigned int max_data_lanes;
 
 	enum drm_mode_status (*mode_valid)(void *priv_data,
-					   const struct drm_display_mode *mode);
+					   const struct drm_display_mode *mode,
+					   unsigned long mode_flags,
+					   u32 lanes, u32 format);
 
 	const struct dw_mipi_dsi_phy_ops *phy_ops;
 	const struct dw_mipi_dsi_host_ops *host_ops;
-- 
2.34.1

