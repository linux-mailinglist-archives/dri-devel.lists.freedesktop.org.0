Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1765FA4D9E4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F1210E559;
	Tue,  4 Mar 2025 10:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="g3OhoYgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4772B10E307
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 10:14:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BquACvqguzh/NTaxYo7bGd879igaVHrPv9b5yZsqYy9xEs0XEjb8C8dsZOOBqIQYhQkAOU6yPATsdgvv8gUBHid9+3M21SIAmX4ezQHY0vCX24nWEyXYItK8qUUCXRKtqvo2dkigRbrchZ8kcNpaUoQHtA2pwcyaXFkiI8Cl73CKvDn+KzRWQz6CL47oAKZMI/dNUYtKshJb7CFs5ptScwCV+lQkjZirHeUsQ0dDF+6I3Yb9bla30dFv3HRKP1TOOsLgIQ08MUaFFvC0AgKmUaJAHnV/DrJnmhBw2GWQ0R0H+AjQklGPc6oXd4wH9I5KcxhkrRbVbqtkIqV6/PuNHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEnXwmmvpi0hAcKM1/oDGaFVFL8fqv5GR8PQZTvYynE=;
 b=mu1daeLDX/FsWNNPgMzKp5Q/2q32W3UHIwzxD4QukKeh8AbHDP9dJx38/sQJIv1PsY7QRggP/MEQjFwl8QQI52QGyHwEkz1WGt9TLLOo3+YDxEip7Of+vvzTJSOnwRlJc/3GMwuDVed2nhXiwQkALrHnHsZWmfu3rlJfcr/yaECsOw+65FW/UXPSjiGjfhcsMiAyEpdy0+6KhVaE5mn8bKg0BLJGZDBoI89Km+AuM/ZiqpYcz+BXekGUmgmEYioCaCjOGbm/jvKbYDor99dANmNxhnWv5e+tr1M0wfbLAWCNv3E0SpzJ9XOruwmRe00KdeOg5ND13MoqJxNkQ1XTIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEnXwmmvpi0hAcKM1/oDGaFVFL8fqv5GR8PQZTvYynE=;
 b=g3OhoYgV8/Ib80cixF8McgSGdRsR8hLklhAB/PBCbThlCk4MOFvFModxQ8pK87Y+NP4MKV4i9MOJA73W3kdcyeRXfNgYIZWOuFBFE5HIuxPDdJqOqMcQKyZ7mIjtXbl6/1AXyXd7CcRpBFuI5XT8jpdPKzeREaCdHmW7qCvJjv1hG1D2OnSPQ1TCrUA/eZmPrFh3j+WoHQVrQDeN04WZORiT/dRj4MYTc8QKkr8uvdIyPJVct3RekEN5J3ap5hvLlE1z8zR3YiPn3TYGAndSmmDwOW8X3BIPM84cq9k5Y5bRyue8z4N6hehTAo09SUPNXugC83hWPldVRgK7bj3KhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9868.eurprd04.prod.outlook.com (2603:10a6:10:4c3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 10:14:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:14:43 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH 2/5] drm/of: Add drm_of_dpi_get_color_coding()
Date: Tue,  4 Mar 2025 18:15:27 +0800
Message-Id: <20250304101530.969920-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304101530.969920-1-victor.liu@nxp.com>
References: <20250304101530.969920-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0188.apcprd04.prod.outlook.com
 (2603:1096:4:14::26) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9868:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a90a58-a318-4366-72e6-08dd5b0561fc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|7416014|1800799024|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gObhO2ncgqFatWEifwnflKgxb5wyMtDhCfckoXhWDlhgIUIVEnNbg8aC6iU9?=
 =?us-ascii?Q?GdeU4dZL86JhpyKF1j71dsVsvQI6N3ed2l3wwwKotM2rRmObGsBYLARzJOdv?=
 =?us-ascii?Q?NKY7utTSF9Z1fHBKnDuEgUPO/LNLwRbNx2bRV02DXRty3jPL1TB8Ch/jLxM/?=
 =?us-ascii?Q?0+W5tJepqo/LjpeESlZtsYTtpOOuCrqlWGKGeJNr+dx4gpMremX+ZKq9KDYC?=
 =?us-ascii?Q?MGBNWi5aAiglzSDbfmlMSXmsuNLnXaRl36PWcNzaRfXXYdJnbhfd+FwbctuY?=
 =?us-ascii?Q?nx2EJlT4VvAFRWhfP3LQo0/DmIn/GuWr/juldyrTjeh/k9eMzMPa4wXH5PGM?=
 =?us-ascii?Q?E5SQmsXdO7niOXudDse+ow5kemqffruyVDyFEwu/BFbkwnBy5YWEA2OfWTt2?=
 =?us-ascii?Q?YaXUCbXY+EKVP9ltZ94fA/VvmgbtjuTNEaOt4j6bPIEUtm3ibfaCGBrQ/5rY?=
 =?us-ascii?Q?XzLzbx+9UZRvX6aUGrKrhLXVeNzTotUDluLg3pIECi3YeXyM49AKmfpSrHWb?=
 =?us-ascii?Q?YQJ/A9o00HvAoY0+msLNQQ4qzduqBGDjhEYmm8qUPbG0/pr4wEsPqIkqi9qI?=
 =?us-ascii?Q?ILQnhsMCyNOU4qczN4sSSUtvQa8u+uBFq0RHUxfV8nQ2DH/fa9e/v1oYz2yq?=
 =?us-ascii?Q?KQ9NkCwg1H9565pOzI+u/DD9N8AHxsDkplW/NCk2dtAVEVct5ZqtmClAoMij?=
 =?us-ascii?Q?AwtEqPyPUlqikoRkeRadkk/MkRcHYePhkib2LmtaRHi++2O3Q7/d2qY0Im0x?=
 =?us-ascii?Q?DvJPJWEiSIbo4EBjJy0LQOlao6WFTIm2KWYxGl6l6KZAzT4uLnuZxZoytzUJ?=
 =?us-ascii?Q?ee5BjjAYSYzJmmu1ONrqLJPpG1E3e8IXk1JWdLEyQ1+Xa1AuunhdQEAIK6CH?=
 =?us-ascii?Q?acXvmGhf8AOcpSobv+oX2g3ZISHArLLNGtOECccT/jgakGtEiDebkfMiY75H?=
 =?us-ascii?Q?ybVNFI015LyzCRr+Ld2O3QxMUIDDaUH4IdQiNexMZfWsUXqkeK41rDfN6JSA?=
 =?us-ascii?Q?pWQWpWdutonZqMV6dHYYxLOHWdA8jbPM5eopWDclzVKyelHgkIQhFShWlK1w?=
 =?us-ascii?Q?IycOeyC/yYsJBfZ9AI6Sy1wx0EgrQyx1USj2WBCaWNFGXn0Xyao1Y2H/IMgZ?=
 =?us-ascii?Q?Fi2XB1cl6GLNhuaXG2JQm2vK+YomsfBLvhkNY0zkR3/Jc6JNqNhfsrEsuTnO?=
 =?us-ascii?Q?fwDCIAo+Vey7DCRYrorC2VFbGYmmIf8ndyFKAAbED/5YyKoAJFBhtVL77Fnk?=
 =?us-ascii?Q?WgDWyLu1ZBjJCCbyOW942RUkj5N5RrbjvTaVuIZEmTrL1if9pP1P9bJZHoF7?=
 =?us-ascii?Q?TUPPoN9vXpUTP9iaxbsliZIWXVekJxZi4g9c6nroLs39RVp0Ew1dVClJmwbG?=
 =?us-ascii?Q?ZnwRve1trHYSl6/3vMMyla5k7GK5Hsn7EhoW8JuBrApWO31mBVaFg/5S4UW0?=
 =?us-ascii?Q?/7GrDWnLmNrClV5Rfa5rGDgY+L+ujdtL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(7416014)(1800799024)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0RRXg32AT54ahYoyOGr3axIIWgPVSc+NCTRPi1yCq9RWWguTzzWXtbdrG68R?=
 =?us-ascii?Q?qYJghUGST74R4KyVkXAKglBN/QuPzNI7D0N6bNHfMFNfXWhJ3naDymedFsUf?=
 =?us-ascii?Q?kiVvB7pRhJAVlydEdc7/C3sAmOd8mWD1IxYqhSrU4fz4+eRh1t9M+/J6vNr8?=
 =?us-ascii?Q?XmLNKsl2ZrcXACjpB/dR1EZVAQ8J4nuwpSV/fmk969D8PxWa/Mi4kbX4YF+l?=
 =?us-ascii?Q?b3OrfTmSmTbr16RKS5Ep7WbAYFD32OuixdfSJx8CCefsL3jcAzTCw7FbUbO2?=
 =?us-ascii?Q?LdjNOLAqfs8hJOgRxL3PR4uVsA1WeH73KFYAgelIgG5KgJLMJ7Y/IEYU5/Xs?=
 =?us-ascii?Q?gPbGoq2ntgMRaJ8WuOrbm7/aaR/IeOZP52Cam4Nx3I7YbP1KWA5c7UgRj33k?=
 =?us-ascii?Q?7p1TMTG6EasaZt8P2PLp1ZQ4Ezaci5OMIXOfVePvUZ+F+NPWvF8lGdkuKLcL?=
 =?us-ascii?Q?3pkSuYA2DE8qXy1QMKX5wq6I1EANNzmYZxbnY5JI17NRuL82Tv9LHwgURxKd?=
 =?us-ascii?Q?/C7Lev8uGHnz6sEaNew4OEU6zP+QISbwVf2dfWjViqoCc8kVTiWuS/BRS4xn?=
 =?us-ascii?Q?iIcGronT8MOTAdiIZQxIhcdgZ78O2HAEn2bz77m4sGO/cv1G3MsDY9snoIxt?=
 =?us-ascii?Q?DUO0qvFaRAzyKbFrfsccS0vIFBHQWYoRgGFNmTDibNCHpBETDpcIjJQk7qQd?=
 =?us-ascii?Q?xY8n9CabgExGvHXITyVefyibVEsEWpJ/s9dHe4AHbjyk6sNssUGjoCHCAPHd?=
 =?us-ascii?Q?WtmLQJLiIe5BP0RBv8Vk4VqmkDb+U09JTqWEicZZ0WDp75orTLRI6eCeD0yR?=
 =?us-ascii?Q?3bCgo4nztWmo2Bq3jjqcHcAR01h64Fa6fo5W60Bi3catYmkTm77IDfqEAvRG?=
 =?us-ascii?Q?bz1Y3IFef3O+OKlB/+tdVXrtW7G0sQz/mwNJ1RGbUqZV5+NO9dte8mVFh6B8?=
 =?us-ascii?Q?dvF08f/sPlC0fUB5RBOXWipAG07erc89YYnwxSNETKGnN4vfW0GaGwxjBE6c?=
 =?us-ascii?Q?DzkVO+leNRA5pa9dIX3ceD/Efo4+aYl4U5+XKyLTLjTUpNLDHOTEawlVZ2Pp?=
 =?us-ascii?Q?7CjH/gzICih1xTkOZLjyU87iSTpDYp1aNI7bDwHeFRCA2PhJthqKzxJcmJGc?=
 =?us-ascii?Q?4Hb3Z+c7iXNRy8rWJ+VaIND6A2NVXC0apZgijmPWzNrpQpCz9eDt3EzXKpuO?=
 =?us-ascii?Q?tfJ98bD8spuMumWgMhMydCQaCv/Ppt8m7Auye62UkpcaONrxMt8YWbeLRWKb?=
 =?us-ascii?Q?2pFckZVqSf6p3u6VQrDiVmlH6fT6WmXMtkwO3+jQzfQ0riFJ7IkDgP1TZfIn?=
 =?us-ascii?Q?svhxjbPnO1xlmMwgX3WnQ4cxnuspP88QsZRbt2/uYgD+5U/AesXHYi4ntTlU?=
 =?us-ascii?Q?bXua9ISOt4NPU2KkyLJbgHkt/qQcJr6SCD4ihEmpkMH2AoaSGCjJmsDGLvUV?=
 =?us-ascii?Q?GPvZLTuEhzoMXVgH5LI4kdcC8MhzBoF89yNc7i1n/QKgN8odp3EcThOExfDj?=
 =?us-ascii?Q?N5uOpyLdGbezSAxfv4pDVYwc4+8+OzMlt50bDvgwYcv8t5i3ogb0+oBxn8Tu?=
 =?us-ascii?Q?cuYGAGX6PcsN8dSdIdR+e3C6F5e5qC557BHC2ix3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a90a58-a318-4366-72e6-08dd5b0561fc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:14:43.6496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: og5nD9dxSJgtOKmQfWTKsbiDUG601wRqJW1ewvPrK5jRhjGRHWnSOvqNo4kHDgljknVcm0zBoM9Fv6FkFp4oCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9868
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

Add helper function drm_of_dpi_get_color_coding() to get media bus format
value from MIPI DPI color coding string.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/drm_of.c | 43 ++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_of.h     |  7 +++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index d0183dea7703..6e2e19275b99 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -285,6 +285,49 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
 
+/**
+ * drm_of_dpi_get_color_coding - Get DPI color coding
+ * @endpoint: DT endpoint node of the DPI source or sink
+ *
+ * Convert DT "dpi-color-coding" property string value into media bus format
+ * value.
+ *
+ * Return:
+ * * MEDIA_BUS_FMT_RGB565_1X16 - dpi-color-coding is "16bit-configuration1"
+ * * MEDIA_BUS_FMT_RGB565_1X24_CPADHI - dpi-color-coding is
+ *                                      "16bit-configuration2"
+ * * MEDIA_BUS_FMT_RGB666_1X18 - dpi-color-coding is "18bit-configuration1"
+ * * MEDIA_BUS_FMT_BGR666_1X24_CPADHI - dpi-color-coding is
+ *                                      "18bit-configuration2"
+ * * MEDIA_BUS_FMT_RGB888_1X24 - dpi-color-coding is "24bit"
+ * * -EINVAL - the "dpi-color-coding" property is unsupported
+ * * -ENODEV - the "dpi-color-coding" property is missing
+ */
+int drm_of_dpi_get_color_coding(const struct device_node *endpoint)
+{
+	const char *coding;
+	int ret;
+
+	ret = of_property_read_string(endpoint, "dpi-color-coding", &coding);
+	if (ret < 0)
+		return -ENODEV;
+
+	/* TODO: Add 16bit-configuration3 support. */
+	if (!strcmp(coding, "16bit-configuration1"))
+		return MEDIA_BUS_FMT_RGB565_1X16;
+	if (!strcmp(coding, "16bit-configuration2"))
+		return MEDIA_BUS_FMT_RGB565_1X24_CPADHI;
+	if (!strcmp(coding, "18bit-configuration1"))
+		return MEDIA_BUS_FMT_RGB666_1X18;
+	if (!strcmp(coding, "18bit-configuration2"))
+		return MEDIA_BUS_FMT_BGR666_1X24_CPADHI;
+	if (!strcmp(coding, "24bit"))
+		return MEDIA_BUS_FMT_RGB888_1X24;
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(drm_of_dpi_get_color_coding);
+
 enum drm_of_lvds_pixels {
 	DRM_OF_LVDS_EVEN = BIT(0),
 	DRM_OF_LVDS_ODD = BIT(1),
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 7f0256dae3f1..0a827f3b3a55 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -50,6 +50,7 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				int port, int endpoint,
 				struct drm_panel **panel,
 				struct drm_bridge **bridge);
+int drm_of_dpi_get_color_coding(const struct device_node *endpoint);
 int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 					  const struct device_node *port2);
 int drm_of_lvds_get_dual_link_pixel_order_sink(struct device_node *port1,
@@ -104,6 +105,12 @@ static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
 	return -EINVAL;
 }
 
+static inline int
+drm_of_dpi_get_color_coding(const struct device_node *endpoint)
+{
+	return -EINVAL;
+}
+
 static inline int
 drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 				      const struct device_node *port2)
-- 
2.34.1

