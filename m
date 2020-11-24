Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ADB2C2626
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A14C6E32F;
	Tue, 24 Nov 2020 12:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E576E314
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:47:19 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOClDJi032893;
 Tue, 24 Nov 2020 06:47:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222033;
 bh=4iGLsyiFsan1/GKhoF7NEGll/zJz85IgNrAf7PnDxWM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=KFXaoskIWybcZO80GWxQ7YA01WQeo/urDVBseCdZ+FlvMvrx4YJPWgVr5qG3J44ba
 hEWLNLWsdHfiT6/rX4wUKO3C/yCHhtXCCP7NGnyzn8eN9Wsah34d/LrfZNeloO+A2r
 EVXk68/TZCovkYgSl9fJt6JUZ6un/h++tbnjlXvs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOClD9q044082
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:47:13 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:47:13 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:47:12 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpM040922;
 Tue, 24 Nov 2020 06:47:10 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 33/80] drm/omap: drop omapdss-boot-init
Date: Tue, 24 Nov 2020 14:44:51 +0200
Message-ID: <20201124124538.660710-34-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124124538.660710-1-tomi.valkeinen@ti.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Reichel <sebastian.reichel@collabora.com>

The table of compatible values needed to be prefixed with "omapdss,"
is empty, so all of this code is doing nothing now. Let's drop it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/Kconfig           |   4 -
 drivers/gpu/drm/omapdrm/dss/Makefile          |   2 -
 .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   | 228 ------------------
 3 files changed, 234 deletions(-)
 delete mode 100644 drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c

diff --git a/drivers/gpu/drm/omapdrm/dss/Kconfig b/drivers/gpu/drm/omapdrm/dss/Kconfig
index fd7dfa28ce97..6ec80771af3d 100644
--- a/drivers/gpu/drm/omapdrm/dss/Kconfig
+++ b/drivers/gpu/drm/omapdrm/dss/Kconfig
@@ -1,7 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config OMAP2_DSS_INIT
-	bool
-
 config OMAP_DSS_BASE
 	tristate
 
@@ -9,7 +6,6 @@ menuconfig OMAP2_DSS
 	tristate "OMAP2+ Display Subsystem support"
 	select OMAP_DSS_BASE
 	select VIDEOMODE_HELPERS
-	select OMAP2_DSS_INIT
 	select HDMI
 	help
 	  OMAP2+ Display Subsystem support.
diff --git a/drivers/gpu/drm/omapdrm/dss/Makefile b/drivers/gpu/drm/omapdrm/dss/Makefile
index f967e6948f2e..811966cd7468 100644
--- a/drivers/gpu/drm/omapdrm/dss/Makefile
+++ b/drivers/gpu/drm/omapdrm/dss/Makefile
@@ -1,6 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_OMAP2_DSS_INIT) += omapdss-boot-init.o
-
 obj-$(CONFIG_OMAP_DSS_BASE) += omapdss-base.o
 omapdss-base-y := base.o display.o output.o
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
deleted file mode 100644
index 18560ca4bbb0..000000000000
--- a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
+++ /dev/null
@@ -1,228 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
- * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
- */
-
-/*
- * As omapdss panel drivers are omapdss specific, but we want to define the
- * DT-data in generic manner, we convert the compatible strings of the panel and
- * encoder nodes from "panel-foo" to "omapdss,panel-foo". This way we can have
- * both correct DT data and omapdss specific drivers.
- *
- * When we get generic panel drivers to the kernel, this file will be removed.
- */
-
-#include <linux/kernel.h>
-#include <linux/of.h>
-#include <linux/of_graph.h>
-#include <linux/slab.h>
-#include <linux/list.h>
-
-static struct list_head dss_conv_list __initdata;
-
-static const char prefix[] __initconst = "omapdss,";
-
-struct dss_conv_node {
-	struct list_head list;
-	struct device_node *node;
-	bool root;
-};
-
-static int __init omapdss_count_strings(const struct property *prop)
-{
-	const char *p = prop->value;
-	int l = 0, total = 0;
-	int i;
-
-	for (i = 0; total < prop->length; total += l, p += l, i++)
-		l = strlen(p) + 1;
-
-	return i;
-}
-
-static void __init omapdss_update_prop(struct device_node *node, char *compat,
-	int len)
-{
-	struct property *prop;
-
-	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
-	if (!prop)
-		return;
-
-	prop->name = "compatible";
-	prop->value = compat;
-	prop->length = len;
-
-	of_update_property(node, prop);
-}
-
-static void __init omapdss_prefix_strcpy(char *dst, int dst_len,
-	const char *src, int src_len)
-{
-	size_t total = 0;
-
-	while (total < src_len) {
-		size_t l = strlen(src) + 1;
-
-		strcpy(dst, prefix);
-		dst += strlen(prefix);
-
-		strcpy(dst, src);
-		dst += l;
-
-		src += l;
-		total += l;
-	}
-}
-
-/* prepend compatible property strings with "omapdss," */
-static void __init omapdss_omapify_node(struct device_node *node)
-{
-	struct property *prop;
-	char *new_compat;
-	int num_strs;
-	int new_len;
-
-	prop = of_find_property(node, "compatible", NULL);
-
-	if (!prop || !prop->value)
-		return;
-
-	if (strnlen(prop->value, prop->length) >= prop->length)
-		return;
-
-	/* is it already prefixed? */
-	if (strncmp(prefix, prop->value, strlen(prefix)) == 0)
-		return;
-
-	num_strs = omapdss_count_strings(prop);
-
-	new_len = prop->length + strlen(prefix) * num_strs;
-	new_compat = kmalloc(new_len, GFP_KERNEL);
-
-	omapdss_prefix_strcpy(new_compat, new_len, prop->value, prop->length);
-
-	omapdss_update_prop(node, new_compat, new_len);
-}
-
-static void __init omapdss_add_to_list(struct device_node *node, bool root)
-{
-	struct dss_conv_node *n = kmalloc(sizeof(*n), GFP_KERNEL);
-	if (n) {
-		n->node = node;
-		n->root = root;
-		list_add(&n->list, &dss_conv_list);
-	}
-}
-
-static bool __init omapdss_list_contains(const struct device_node *node)
-{
-	struct dss_conv_node *n;
-
-	list_for_each_entry(n, &dss_conv_list, list) {
-		if (n->node == node)
-			return true;
-	}
-
-	return false;
-}
-
-static void __init omapdss_walk_device(struct device_node *node, bool root)
-{
-	struct device_node *n;
-
-	omapdss_add_to_list(node, root);
-
-	/*
-	 * of_graph_get_remote_port_parent() prints an error if there is no
-	 * port/ports node. To avoid that, check first that there's the node.
-	 */
-	n = of_get_child_by_name(node, "ports");
-	if (!n)
-		n = of_get_child_by_name(node, "port");
-	if (!n)
-		return;
-
-	of_node_put(n);
-
-	n = NULL;
-	while ((n = of_graph_get_next_endpoint(node, n)) != NULL) {
-		struct device_node *pn;
-
-		pn = of_graph_get_remote_port_parent(n);
-
-		if (!pn)
-			continue;
-
-		if (!of_device_is_available(pn) || omapdss_list_contains(pn)) {
-			of_node_put(pn);
-			continue;
-		}
-
-		omapdss_walk_device(pn, false);
-	}
-}
-
-static const struct of_device_id omapdss_of_match[] __initconst = {
-	{ .compatible = "ti,omap2-dss", },
-	{ .compatible = "ti,omap3-dss", },
-	{ .compatible = "ti,omap4-dss", },
-	{ .compatible = "ti,omap5-dss", },
-	{ .compatible = "ti,dra7-dss", },
-	{},
-};
-
-static const struct of_device_id omapdss_of_fixups_whitelist[] __initconst = {
-	{},
-};
-
-static void __init omapdss_find_children(struct device_node *np)
-{
-	struct device_node *child;
-
-	for_each_available_child_of_node(np, child) {
-		if (!of_find_property(child, "compatible", NULL))
-			continue;
-
-		omapdss_walk_device(child, true);
-
-		if (of_device_is_compatible(child, "ti,sysc"))
-			omapdss_find_children(child);
-	}
-}
-
-static int __init omapdss_boot_init(void)
-{
-	struct device_node *dss;
-
-	INIT_LIST_HEAD(&dss_conv_list);
-
-	dss = of_find_matching_node(NULL, omapdss_of_match);
-
-	if (dss == NULL || !of_device_is_available(dss))
-		goto put_node;
-
-	omapdss_walk_device(dss, true);
-	omapdss_find_children(dss);
-
-	while (!list_empty(&dss_conv_list)) {
-		struct dss_conv_node *n;
-
-		n = list_first_entry(&dss_conv_list, struct dss_conv_node,
-			list);
-
-		if (of_match_node(omapdss_of_fixups_whitelist, n->node))
-			omapdss_omapify_node(n->node);
-
-		list_del(&n->list);
-		of_node_put(n->node);
-		kfree(n);
-	}
-
-put_node:
-	of_node_put(dss);
-	return 0;
-}
-
-subsys_initcall(omapdss_boot_init);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
