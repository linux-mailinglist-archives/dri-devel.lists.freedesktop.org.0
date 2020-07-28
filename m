Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A7E2312B2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209F96E3B5;
	Tue, 28 Jul 2020 19:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293D589BCD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 11:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1595935101;
 bh=RjztiQu8bvOyUz2B8+6Y6utG8fBygRMWzsrfRLxaT28=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PqTJVT5/1DKAUPspO4Fwvu8KXxLwmZT9gxvwKOC/sayrFfCYOGUrAt1kKuLyuV+/2
 rmV1oZj9libk8OmI/vr47fgm+vwLQ9bE5YsWg4W6ypd68ap6fz8Ixo+NsECqvMjLde
 DmhoS6b7PQ36PJy1dHsMVQb+2gyklriznJ4flhAk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.208.215.239]) by mail.gmx.com
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mr9Bu-1kX1XH0BMs-00oDrD; Tue, 28 Jul 2020 13:18:21 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/5] drm/mediatek: config component output by device node
 port
Date: Tue, 28 Jul 2020 13:17:56 +0200
Message-Id: <20200728111800.77641-2-frank-w@public-files.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200728111800.77641-1-frank-w@public-files.de>
References: <20200728111800.77641-1-frank-w@public-files.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:YvbDIbRpFNRzU9CUvTdpvNUkk08xUKy8rbwWD1rLNM8UXAoQuK4
 eICt8UcylHTRfOGkjEX9jjTApIMznChQZ6JLB0JrsjiMAAUXmWoZWVa1uKNNAGYRlIyVrTC
 IKSqIDP+H57GVEHxo0RDq9SNxAHZIaXwDCy1xq9aaTm2FrJdcG2UEvxzlv5POKDx0mQCuV4
 VCgz/4H4bnhMAao7exzPA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5JI92cNImiA=:IU9/AVKV/YriZTpTu1OE0e
 O8SnTBpFQJaIKnhNf0ENVS71qiHFJW6fi77esT8+iPhPmyguNpqEi200P15DE396vcSD6HaRy
 jkK+um62hHmvGVD413t3Td/MBamGeZ0K/OHMaCWx9ZlhRNV3p5ddO85KGWDGbKGl3mIQy1ZDO
 gYTMhu1k/shkkXPexV8oBEFwrK1sjylI3UcDJhmVj0v7MvmpjrGSfLohzyhggLMiQrWtSXj1s
 F5lH69pJPnG6XDc6RTp9zCPFR+88z8jqreyd0iU6HGsgSLtteanA1+aosO8ehasnE2LmJs3cq
 XCQhAot6d9BA5lrJCOx3xPDXpsXRDODPrBq51F3FjzrYm0r+R+673O9haC0BJ3bgICsF0xtcB
 r68CTlvnknBcp8o/Xlu4r4mQwOP/IXmr3LOV1iBVAy3JR9UVdyiaAwDpLH0ZjmHhNBSf+kYec
 dil9AXhKdCT17ayWhX6puhITR3fzJONhT9CXwjhzytz+YkWf0A1sLUmXZMriF5HnHqmKo2pBz
 aXWk5rIooPqsAiK4rTMuZ09SbaOSfOUswgDpAdQw/UCtzfRf5HPXFDOoXiNqi988wHVgPH39d
 reopSpTbdHOZL5aeLq4WRU2g35bhX4O8jNUsrcK3R8N/USycjc62YiM/EFptwkec+4eMjw9h1
 nbFEDDoYSLOsPoTl9rzfWc1aiIRq0+Bx+rrfaf23uQPdhRmi8/YF0ZAnar8dhSEhz5Jmct+0I
 lzyhaHfFgFGPBm2i2iEsyUqzSTPEy2q1nYqtCAFMSB60D6oBkWAbWgtVo0n8KvX9Q7fRmKWo4
 9rFBYULsOB0q4GS4C1aZNkk64O39OnVdqHUOOoSVcM7LQU9XVlE35S4gDtIZdqe1EZ8z+smv5
 /+v2VHEZ4IpAf8jQzlxuEyPHyG2CtXV3AMEoA4e+/Xxxq5IL9Ve3rWkrmwxkPm8+/76Zh67e+
 +1ZrOvHoyORJHbaEJSnK3KI6l4bQuCAaMDeqcIp/GX2d8au/zlPDwHGAXlrwwhBBTZIiQ1fht
 6Hu95C5tCaeveDCNyggV4YE4oP2zSdyO+ItSIBCDFQgWj+QA3SvJGu47HvP2JOIHMXjfwmXXR
 L4G2ac3jJFcKw0n5l7Gfty4KURDLrGVL0M9vLkoIH87wz83fAxHjWg2jzQjo3foq1YKgx+XB7
 bV2ZZh1PhCqVaiMTzK6lP4oD/Okofix7b7Ru49cLd353NNBLHoYRY/S8u6Ae6RmYx+SKuRWv6
 8/3j9uIxIhbIUCnAws/QvGWYwSOpixhywPWcY6Q==
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bibby Hsieh <bibby.hsieh@mediatek.com>

We can select output component by decive node port.
Main path default output component is DSI.
External path default output component is DPI.

without this Patch i get this warning:

WARNING: CPU: 3 PID: 70 at drivers/gpu/drm/drm_mode_config.c:621 drm_mode_config_validate+0x1d8/0x258

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>

added small fixes for warnings

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 46 ++++++++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |  4 +--
 2 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6bd369434d9d..ce7abf2743d9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -24,6 +24,13 @@
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <linux/component.h>
+#include <linux/iommu.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>

 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp.h"
@@ -61,7 +68,7 @@ static const struct drm_mode_config_funcs mtk_drm_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };

-static const enum mtk_ddp_comp_id mt2701_mtk_ddp_main[] = {
+static enum mtk_ddp_comp_id mt2701_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_RDMA0,
 	DDP_COMPONENT_COLOR0,
@@ -69,12 +76,12 @@ static const enum mtk_ddp_comp_id mt2701_mtk_ddp_main[] = {
 	DDP_COMPONENT_DSI0,
 };

-static const enum mtk_ddp_comp_id mt2701_mtk_ddp_ext[] = {
+static enum mtk_ddp_comp_id mt2701_mtk_ddp_ext[] = {
 	DDP_COMPONENT_RDMA1,
 	DDP_COMPONENT_DPI0,
 };

-static const enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
+static enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_AAL0,
@@ -84,7 +91,7 @@ static const enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
 	DDP_COMPONENT_PWM0,
 };

-static const enum mtk_ddp_comp_id mt2712_mtk_ddp_ext[] = {
+static enum mtk_ddp_comp_id mt2712_mtk_ddp_ext[] = {
 	DDP_COMPONENT_OVL1,
 	DDP_COMPONENT_COLOR1,
 	DDP_COMPONENT_AAL1,
@@ -100,7 +107,7 @@ static const enum mtk_ddp_comp_id mt2712_mtk_ddp_third[] = {
 	DDP_COMPONENT_PWM2,
 };

-static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
+static enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_AAL0,
@@ -111,7 +118,7 @@ static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
 	DDP_COMPONENT_PWM0,
 };

-static const enum mtk_ddp_comp_id mt8173_mtk_ddp_ext[] = {
+static enum mtk_ddp_comp_id mt8173_mtk_ddp_ext[] = {
 	DDP_COMPONENT_OVL1,
 	DDP_COMPONENT_COLOR1,
 	DDP_COMPONENT_GAMMA,
@@ -459,6 +466,7 @@ static int mtk_drm_probe(struct platform_device *pdev)

 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(phandle->parent, node) {
+		struct device_node *port, *ep, *remote;
 		const struct of_device_id *of_id;
 		enum mtk_ddp_comp_type comp_type;
 		int comp_id;
@@ -522,6 +530,32 @@ static int mtk_drm_probe(struct platform_device *pdev)

 			private->ddp_comp[comp_id] = comp;
 		}
+
+		if (comp_type != MTK_DSI && comp_type != MTK_DPI) {
+			port = of_graph_get_port_by_id(node, 0);
+			if (!port)
+				continue;
+			ep = of_get_child_by_name(port, "endpoint");
+			of_node_put(port);
+			if (!ep)
+				continue;
+			remote = of_graph_get_remote_port_parent(ep);
+			of_node_put(ep);
+			if (!remote)
+				continue;
+			of_id = of_match_node(mtk_ddp_comp_dt_ids, remote);
+			if (!of_id)
+				continue;
+			comp_type = (enum mtk_ddp_comp_type)of_id->data;
+			for (i = 0; i < private->data->main_len - 1; i++)
+				if (private->data->main_path[i] == comp_id)
+					private->data->main_path[i + 1] =
+					mtk_ddp_comp_get_id(node, comp_type);
+			for (i = 0; i < private->data->ext_len - 1; i++)
+				if (private->data->ext_path[i] == comp_id)
+					private->data->ext_path[i + 1] =
+					mtk_ddp_comp_get_id(node, comp_type);
+		}
 	}

 	if (!private->mutex_node) {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index b5be63e53176..7fcaab648bf1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -21,9 +21,9 @@ struct drm_property;
 struct regmap;

 struct mtk_mmsys_driver_data {
-	const enum mtk_ddp_comp_id *main_path;
+	enum mtk_ddp_comp_id *main_path;
 	unsigned int main_len;
-	const enum mtk_ddp_comp_id *ext_path;
+	enum mtk_ddp_comp_id *ext_path;
 	unsigned int ext_len;
 	const enum mtk_ddp_comp_id *third_path;
 	unsigned int third_len;
--
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
