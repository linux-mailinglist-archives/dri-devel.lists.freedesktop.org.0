Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4466085B066
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 02:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F89310E04A;
	Tue, 20 Feb 2024 01:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="bZsFAB9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2088.outbound.protection.outlook.com [40.107.113.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7118910E04A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 01:16:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOG2MPU0O1OqZeG/7nnUp3QEZEZo5oh6A46OPvLEu+FnAuISLwY2Ah9Zb+LT0fYy9SOW2oKNGb4wiaRqzgJQBnxFv0+kFL/qHyvdC3vkhfNUJJusLskB20qZRKY2o9zi9z6Z7NwcHm6CrjNQVEEgkVuB8vqlK/o8/qEMvW1JTlfHDA5UPeGeLX3MZ4FEiEqLro6bVIEkd7bbQM2wEQ1t+GZWn/JG/PQiVpHLUY1oiboCH78H+ZC4ffPWY8SxNW8WhBM5rRTMZdWOPyby9s6L1AYa7Lx8ypxj+D8ATBgyScw7gZUIE4gfmRAXRi4JJmE16vIh7vL6tzJ7kOKs8g0TIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPWy+PYtnAvN+6i0I6jsdtewufqRlqn7Qxjn1KjTnik=;
 b=A/rjfCIWT7XVsWXV9kGqeLzCSxz7JQZ1Lzv9T7sH5CAqepvZNw/MzLsx2Yg6N7kD7HlR+BOh46/4eBWcP1qUk4xExGNK11mpbBBh0vqRL0lRZGc6PIf5KgPMaGiLF59hEy5dsQS6DXZ/vVXxXHvBG9udAKTFd2kALUpSvWIZLANHLWj6OOIPejZOCXcir4Do1OFpr2BQAK3ELGqwNps3xECUhWWBezk9LrAVFKdiCqpiWUeHdh8ADTV5LxcxfGa0ZUGp04ZKMM+TnwMGIc4FHtNu38yptzcOOHPPui8OZBOn0oIfzbL0RVsJ/43knX1Jp8IbbGhPN23s5+pvX+aNPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPWy+PYtnAvN+6i0I6jsdtewufqRlqn7Qxjn1KjTnik=;
 b=bZsFAB9HebwFwqY2K5fALKhoSGEgyd8Z0pqss/3FvibP1fp4VXEd/wefD8t24SgU8Bzj3Nnv+oyd81GRcxQAqyn0i79qaB28dbwHKSkdYLGLsfzJqnxYH9SiFkAGhNIxmbLIdU5IEDVh4ewNndY5zlGL14rZcGulnWKInqoY80A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10730.jpnprd01.prod.outlook.com
 (2603:1096:400:296::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 01:16:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7292.029; Tue, 20 Feb 2024
 01:16:52 +0000
Message-ID: <87y1bgj5oc.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,	=?ISO-8859-1?Q?=22Uwe_?=
 =?ISO-8859-1?Q?Kleine-K=F6nig=22?= <u.kleine-koenig@pengutronix.de>,	Alain
 Volmat <alain.volmat@foss.st.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alexandre Torgue
 <alexandre.torgue@foss.st.com>,	Alexey Brodkin <abrodkin@synopsys.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,	Andrzej Hajda
 <andrzej.hajda@intel.com>,	Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Daniel Vetter <daniel@ffwll.ch>,	Dave Stevenson
 <dave.stevenson@raspberrypi.com>,	David Airlie <airlied@gmail.com>,	Eugen
 Hristev <eugen.hristev@collabora.com>,	Florian Fainelli
 <florian.fainelli@broadcom.com>,	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Helge Deller <deller@gmx.de>,	Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jacopo Mondi <jacopo@jmondi.org>,	Jessica Zhang
 <quic_jesszhan@quicinc.com>,	Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,	Mauro Carvalho Chehab
 <mchehab@kernel.org>,	Maxime Coquelin <mcoquelin.stm32@gmail.com>,	Maxime
 Ripard <mripard@kernel.org>,	Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,	Sakari Ailus
 <sakari.ailus@linux.intel.com>,	Sam Ravnborg <sam@ravnborg.org>,	Sylwester
 Nawrocki <s.nawrocki@samsung.com>,	Thomas Zimmermann <tzimmermann@suse.de>,
 Tim Harvey <tharvey@gateworks.com>,	dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,	linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org,	linux-omap@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,	linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <874je4kkdn.wl-kuninori.morimoto.gx@renesas.com>
References: <874je4kkdn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 resend 4/4] video: fbdev: replace
 of_graph_get_next_endpoint()
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Feb 2024 01:16:52 +0000
X-ClientProxiedBy: TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10730:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d26bfcf-b8c6-486a-3238-08dc31b19ed7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Hd1cP0a9uANPQ8rFQ2g2Z4kIf8YS5a4L4DcvdTkvKh7YLP7P11ISDCgrQdSG6rXvVirh16T+pCsaEecF3wEJXf3utcJjugux+YaPWHBe5pkR8pmZew/mG4dg4lgWGScQvg8mvi8Ef+KsoniKE3D799AqZCjHuOrRsmmVCZaMsJDQgu16DaaIXtdbgaAFQk9ko6vKpmamHvIEhVHWnkx79mKunuOx7X329DeR/PluYUd2oV5/2CGrDuUjjNawVVfN44lm+1q8mFHYsDb8G8ECfucRhQZ6UG+DtE7R8MRFj6dTRsEjaza7oQ0c7Z+7DEC9cMkOg2qCYAL8dQvSoKm/32W9TbbaoNgumWOt3EFW7bMEswAz1DZyLqOrhv56lxsz25aimkln0o3VXJ3Zm+tAE0ES3QY9iaSY90QN3yCDZDWZtBVwzd4XMkURJZhOMs9PEFPSHEa3ToVIxFWVZR4TnkxjkwfniAZxbvmNk40bW4Pg9jh9yAXhuopqLgRf/O0+D6A30HEgxhiy7lGSeJvbLhZNVnt4YXHGfVwCYdNpwQm2ci2Xjao6dFoq761AA2go0xp6SlHxbTOw/m37w3KtPRgCJfPNgy1iMdngxKuPiPDB+wW740/FfiI4AxG1ug9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38350700005)(921011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i+ckKuOPcvWCQI/6LCEN7ITVi1XKEIpX/DLWvvIppzL4uZRWFsNDsfB6GEYC?=
 =?us-ascii?Q?2/VqNmGiMI8HgLDzfCnK1QDjBykI9XkY86ptXmBE9EafiBZV5krtKQvhJ7ww?=
 =?us-ascii?Q?ZhIw9SAUHvHwo2E2u0uO999C5T6BmS6ulwaP59XQALstIATSEXdbTUQ0QutK?=
 =?us-ascii?Q?7+WNbAs2BVzMJ/YvF8lf2231Cu+CAkIVk6BRSvRytP3zH4uBHjxTjL571O+w?=
 =?us-ascii?Q?Ta2L7ZL/+6H7fUplt61BBHFte+2V20Y6So7vAR+dTsMQtFFAxIZySbJTKmEr?=
 =?us-ascii?Q?TgW0t4RCOtJqz/P4riNqXPG4tHMlty7ylGx2Vnvri2GYk2kyYkN3CMtnTTl8?=
 =?us-ascii?Q?KcY7WdSxulVTjlmpy7Qru2wfXA/0h/UfW2+OIttG8QVSJgsywavDDp2Ulidy?=
 =?us-ascii?Q?fKtW5cQNk29uRSWhLK+IAXG+JMUdiIiQJi/EZ8satX3b8yMaLJMKE5UT4/Qb?=
 =?us-ascii?Q?om0tUN/MmJ7uDJ2e7EonY2NOYDRpOZKFrKIZqjz0uoxcjF/7rwr0n2KLj4mN?=
 =?us-ascii?Q?UFE54X7X7duanHAnu2py1za2bye7ruK9KRBNXTgOtQ1J9Qc6e7gto7vTvW76?=
 =?us-ascii?Q?fopB1Gk69khHJj0n13m2XernBXmBQZMwsIefyuud8jK3N9vzEM7kOFABKeCO?=
 =?us-ascii?Q?0I+mAWkyEURH6shJXts3JxrkvjqI4/zwXGjdbLExzFojHq98I/t0edelqN3e?=
 =?us-ascii?Q?63ZZSg1KjpxyLfGNCYLBO84Bb5xohvVxNJYLpIhWC6a/CFjlhAJu2xXjO8tI?=
 =?us-ascii?Q?KXRRQfDe6syD/L0bXeEemrZ5lOKLHgN0lYedgdqqz43Anr0XJUYFvK0o2ZZ2?=
 =?us-ascii?Q?chDwXSyRWVls0lnM0WYP2hCG40U7t+PGzRzcNMON0H7lQcV3h/vxRfU8H1jM?=
 =?us-ascii?Q?R0CH8gZ14zZVHp56Oo9+OPv6B+BNGmPMsHOMvDq2MWYlLnvlRgSykuFESSso?=
 =?us-ascii?Q?G6S3vELyfccg4535LB3+9TUKZqqgGMqgLQ06s3Iq6E9xptlZH/C5pPrhfBCJ?=
 =?us-ascii?Q?d5y42zSybojYh2V1DjYbo37CcS1AXqX1eyOPlWTX1HcqtErEbMq4M54psqCs?=
 =?us-ascii?Q?G7IJNCVm6x+nmciA6aMut8FChKY2Ip4h6qtmF2nNIqSkqED5SqawzZhOTL2/?=
 =?us-ascii?Q?WdJ+9jZyrI/AQsSfHYT8OWxKEpAHyt3X2y/s0YFBVONIZzJg1qOhbcEl2Y7R?=
 =?us-ascii?Q?E+gMBl4lu38HdLIlMJLC0EdrO96DH0tUEIIKuqjnihA2UogXytdgE8wiWxHO?=
 =?us-ascii?Q?fkAD4Im1zCk5U6iDJaVvk6/LgmWfOpJ1eFAkkl6Y/O//RnXYBfsZAXeCxctp?=
 =?us-ascii?Q?fNqWsvW6PSWvaCWmbtyeWS9FefJKHPgumcRXxV4hGK4WOdE8nAAQNkAju+0t?=
 =?us-ascii?Q?KH//vrWHfdw/MpXIwIGmKfUWOitaF72FqQIi1dcKC6duLHR57mtV5aIqqVQe?=
 =?us-ascii?Q?UDPCnUNk3cvEQap1YmD9NsqREavt3t6MJKs7PahcsOMpoMUbumBBHnEarXRd?=
 =?us-ascii?Q?RzryhsqVf/NtSHSkE9mN5EmxFkuDdOvO7YxcKO8eeuKhEapzMRkWAUkmlgFy?=
 =?us-ascii?Q?b5VZW4Er7Jt6A6ngjVlCiTIjnuJgR/UlyCrCnhnE+E4VBKKFw0XSWGYE2TzA?=
 =?us-ascii?Q?0vf9nd/4o1oXhhbZlZOsHbc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d26bfcf-b8c6-486a-3238-08dc31b19ed7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 01:16:52.4622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pF7DmZqmBHqrSoAGLtmP6zeXzb239ACwWPV0Y0A8GEo8yaRPG49ECNbhenuBTmYzhvhItej97nqAn3voWAGT/jtLlQ+aDZGRGPKnl80AjI1Tv+Ql/7gCgit0+PpdlxkW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10730
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

From DT point of view, in general, drivers should be asking for a
specific port number because their function is fixed in the binding.

of_graph_get_next_endpoint() doesn't match to this concept.

Simply replace

	- of_graph_get_next_endpoint(xxx, NULL);
	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);

Link: https://lore.kernel.org/r/20240202174941.GA310089-robh@kernel.org
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 20 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  3 ++-
 drivers/video/fbdev/pxafb.c                   |  2 +-
 include/video/omapfb_dss.h                    |  3 ---
 7 files changed, 10 insertions(+), 27 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbd=
ev/omap2/omapfb/dss/dsi.c
index b7eb17a16ec4..1f13bcf73da5 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -28,6 +28,7 @@
 #include <linux/debugfs.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/of_platform.h>
 #include <linux/component.h>
=20
@@ -5079,7 +5080,7 @@ static int dsi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	struct omap_dsi_pin_config pin_cfg;
=20
-	ep =3D omapdss_of_get_first_endpoint(node);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return 0;
=20
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/=
fbdev/omap2/omapfb/dss/dss-of.c
index 0282d4eef139..14965a3fd05b 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -130,24 +130,6 @@ static struct device_node *omapdss_of_get_remote_port(=
const struct device_node *
 	return np;
 }
=20
-struct device_node *
-omapdss_of_get_first_endpoint(const struct device_node *parent)
-{
-	struct device_node *port, *ep;
-
-	port =3D omapdss_of_get_next_port(parent, NULL);
-
-	if (!port)
-		return NULL;
-
-	ep =3D omapdss_of_get_next_endpoint(port, NULL);
-
-	of_node_put(port);
-
-	return ep;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_first_endpoint);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node)
 {
@@ -155,7 +137,7 @@ omapdss_of_find_source_for_first_ep(struct device_node =
*node)
 	struct device_node *src_port;
 	struct omap_dss_device *src;
=20
-	ep =3D omapdss_of_get_first_endpoint(node);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return ERR_PTR(-EINVAL);
=20
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/f=
bdev/omap2/omapfb/dss/hdmi4.c
index f05b4e35a842..8f407ec134dc 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <video/omapfb_dss.h>
@@ -529,7 +530,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	int r;
=20
-	ep =3D omapdss_of_get_first_endpoint(node);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return 0;
=20
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/video/f=
bdev/omap2/omapfb/dss/hdmi5.c
index 03292945b1d4..4ad219f522b9 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
@@ -25,6 +25,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <video/omapfb_dss.h>
@@ -561,7 +562,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	int r;
=20
-	ep =3D omapdss_of_get_first_endpoint(node);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return 0;
=20
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fb=
dev/omap2/omapfb/dss/venc.c
index c9d40e28a06f..0bd80d3b8f1b 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
@@ -24,6 +24,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/component.h>
=20
 #include <video/omapfb_dss.h>
@@ -764,7 +765,7 @@ static int venc_probe_of(struct platform_device *pdev)
 	u32 channels;
 	int r;
=20
-	ep =3D omapdss_of_get_first_endpoint(node);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return 0;
=20
diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index fa943612c4e2..2ef56fa28aff 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -2171,7 +2171,7 @@ static int of_get_pxafb_mode_info(struct device *dev,
 	u32 bus_width;
 	int ret, i;
=20
-	np =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	np =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!np) {
 		dev_err(dev, "could not find endpoint\n");
 		return -EINVAL;
diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
index e8eaac2cb7b8..a8c0c3eeeb5b 100644
--- a/include/video/omapfb_dss.h
+++ b/include/video/omapfb_dss.h
@@ -819,9 +819,6 @@ struct device_node *
 omapdss_of_get_next_endpoint(const struct device_node *parent,
 			     struct device_node *prev);
=20
-struct device_node *
-omapdss_of_get_first_endpoint(const struct device_node *parent);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node);
 #else
--=20
2.25.1

