Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCC/FPw5qWka3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F4520D319
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A4F10EB3D;
	Thu,  5 Mar 2026 08:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Z7Ud8yuh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A69310EA87;
 Wed,  4 Mar 2026 18:00:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYnIKmpxnKgCS7IzI3LmkIR8JAym13uWkk8eQuTTYaAYi5VJAi3zKNewWXH1p5R+CU18KVDuWfK4IO/+XNIoufL+0xXUVFpbjGW17KO12m0da08M4FeyvwFR5xf5OLLxRuuyE378+XF2YsJfqcq1dfCqKI3krrdtK5663gUH5mOomKE5PZ2Bo7RP1Ieb6TdBCGr8I7dPJgIF0YBZklMw2UUZL7cfW3151T6eUh92AgNvccU2BKmWO96Grj5mUq2miuFLd6M3u3vq0sW1QomzMI2+/tjQ8TMKw5TQuU8wtPE2acBacLwpx88IBkxbw6qiscfe4sWVCSynx8tjWwaeZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98t7KSAu7hu0ZhRzgwEuNtpJhrWNqwTeCGnmFuRS7Ns=;
 b=a+anO0yoXb8OPaYxTBM1NW6nrRQ1J+AAvBO2JTvVXlOyTKmaLHpwImE+PyWBqydd/crygg5riMn8w3zhUHcwzxkO0acqYzDeDdEgS/QpNosrnZX/5zudn0H7VgPesf0JGvzclsKgNwc4+6RshlvrgAaN2JDmlDG7UVKHEojqVGgBqL8TxbD26+M/35eM2N2N0/okkHf3maZWpxKu48YmfTHOh9od7diiPXtcrrvGUA25iGElCP3+GXZz0zMcbU3EHqQv5ZABecyPE3zgOPDbTbqbaTRAUHvM1ruKEHuY4mMQAkQsyN8d1EIVa496neR0O8VuM13cTHE3bhwTlvrUWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98t7KSAu7hu0ZhRzgwEuNtpJhrWNqwTeCGnmFuRS7Ns=;
 b=Z7Ud8yuh9YGLZi5KquXlKT9bERtua1frjLK4oHidzON5G6lXEyXs5ogcUo+YbLSwA+DJUh2u11gyShecjJj7Bi6yetzzA4xG0gU5Gn5+penRKKQAq8YcnpHOWgucgFF7f0seglcY2k2XB+yn+vJR7Htgcctali+U4QAkObkcGxbfETWxIXNMcc+phIJxrfy8ZkFt64dndFYmriDXpXAbT8gsK6Ft6YIgStstKn+3w7bkXq/Tp15estA4holOg6EIPGftHSCOBs5ZnPAJQhDwNNbIAKN1/CfP/9d9wGxSoyxG7b0zeFj2nWhzjeBzPnXUExyvrlx5kBgoPkubVDPTmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 18:00:19 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:00:19 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
Subject: [PATCH phy-next 12/22] phy: move provider API out of public
 <linux/phy/phy.h>
Date: Wed,  4 Mar 2026 19:57:25 +0200
Message-ID: <20260304175735.2660419-13-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::19) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GV1PR04MB10275:EE_
X-MS-Office365-Filtering-Correlation-Id: 667ea857-348d-4f65-88bb-08de7a17e5bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|10070799003|19092799006|1800799024|366016|18082099003|13003099007;
X-Microsoft-Antispam-Message-Info: wMefgahLmtMX6xyyJVOE0MW7Jxk09xPOdB3qhhdWDa3ifWXpdFaZmOXW0M+dP4JCyFcQeKvd2qLUTzivD4/zCdUg8kquQGIZYAqT+zb4lB0jvgfxs11PYXHucqVBxMOMyB7VOLqg7tokSLJfd6cRB/rlTdaE+xacSdHRFnlrjBGRcO+HC+lNWt+JXTuvZ/7pDWiaw4CAScOVOgjvIzOJK/RZANpOfb6wjm3EYL2vXvf/l8QN+sCl3oeD30VuC+V7/yCa6uN9ht9zc08binGxPSnWtzk3m4frOP3mYuYghafavfBw7m+awTbsOBdu+D0PvRZ/Iw9tyUkMzvpWi4OaLxzn/r9DizSV9t+AFPtloDmf/xaclVKWbpv3ab4VsQuC87EscQgPMm1R9pZur/QeTLe8uH4ElEPmmbWbPUdygB2Imyw6l1/YUJn/7iqJFhvNYJAIqGRsgNJuJ+iFm7ZLEYcYCiLH/Y73SEOFxtCjfRug+ghaLXoB+pfFrUhgwGQYmwWN5436iD6m4JU40hEp1hG2gzUcVtrp5QyTEp4Q9rvKCb3SN3MGJlxNXY8vVtTCoYta3YZoZpxIYFIoqRFmMyDzEhmfrGFXVF/+6qLVH2Em5p0wTLxN96f3b9+R1bKL64vNxake7e7oHoRGPAvBg+dtbrYFjOJNyPL1neXvYtMb8GuhSEpZhrFLEayNmo/U
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(10070799003)(19092799006)(1800799024)(366016)(18082099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0plq4FvQLG+6qJW+3pbhXcILKq9SnRHUe/HN8qDOhtyaWIv9FSV+qisglFAh?=
 =?us-ascii?Q?OO0WM6T/ud+ems/QYDiAgbz5uMindMBmZWv4PvzFsiN7p2s0ulaROj/UuKa1?=
 =?us-ascii?Q?kFVeKMThoMhFSXurO6vWlaWWLdHO6c33DAfWziDXaVN86LIRw6mbgz2tgh9z?=
 =?us-ascii?Q?nyt2JVLtrrZ1VpQyJGajb+C6l8YPI0op1aqvPQ9BjEoUcNllUT/n4cY6yr/6?=
 =?us-ascii?Q?A/+F1Dek7xkEbMMoF0Ge46yeo8uLlORakurYBxfv9y6Lz1E10gvnuif7HrRm?=
 =?us-ascii?Q?GkOZM8ZErSH0DgF5E6NL1gvvjQ+WmLHL+IBDBtj5hqOakl3VxLIOVnQFPpKn?=
 =?us-ascii?Q?Q1j+7O6odHXJOWn97jyF7+poDQcnwp/+ZKpM50FS+wajNkSkbXm4JVuCr9Mb?=
 =?us-ascii?Q?+lQt32iyQimAbdzr8XcrrWi5BJ0Qz7z5K+4urzQZ57QRLOdRG1/zDrdiZzlt?=
 =?us-ascii?Q?UxD6mgQ2bVEFoGdH3ibvASGyCZWqZY0PAjpjSiutxIkR+HNAU5X3nks+g14t?=
 =?us-ascii?Q?N23oQBZuBJLYTvjQiAeDIAMlIKhHz9d2VOQuodeAvV1CIb8wIU/EoePl5T1G?=
 =?us-ascii?Q?kqg4TaFzwenwp5TDzN/akmI7YW/ttCKtG5aqAVaOZUBIdwQeHOuIC/YEAV8v?=
 =?us-ascii?Q?YgjU3w3LSS8HwYt4WCfawyDXPor/PJ0ddjPwbWwjOn+yvjOhwmnMF8OetO/2?=
 =?us-ascii?Q?WhdEKGjFqNg9ydm+La3GJBtxSQLXh+KV17vvhvUAniQPGcJ8PPM8ka3TBUEG?=
 =?us-ascii?Q?bhSCHRdm/d9v0K1rgqb5nbbYesW/ahhRhj1EDFS3HgZJ8ezJiZfOCf180x0V?=
 =?us-ascii?Q?uF2j8L8OVvU4jqaBzGtu3U+kFJGZcJucJazPtNNpsPeDjcvYSiO04yjTIzXa?=
 =?us-ascii?Q?ukKJjsmPyB1DR67LRFazdCCa+gojfzwiVl1mVdWCJ2IPfdOqsZh01xi8eny3?=
 =?us-ascii?Q?coB5rp5yUTYHtPlAimG/w/R/9Ms64j87jFgUv02M0SM9WVYZIVztdxacjJMd?=
 =?us-ascii?Q?QQPASrVncu/zkPc4JQYB+VdMadmZm5S6ovyEPuvKMvU/FmR8E/ycCjf7qH5C?=
 =?us-ascii?Q?qPj6mWfKorYEC14l2ZlivJ1NJkBUOuti6iNEJS8AMBzrmygMeosLpLx9Zn+x?=
 =?us-ascii?Q?/tn0ljFHxZCblUJmdbbFFuU7T3h8KYxXk3Bas0uuq4yWYnkwcBQN2MsGJkuB?=
 =?us-ascii?Q?h6C28Wf5bGN2UxF9u4LU+GlQMRATRGJ4gb3YpGnWmknPs85nnJFZaC7aGxNf?=
 =?us-ascii?Q?4NpoVFnxoHC2qHXmYTXf7cYNxDCOLb0KspDSltuoRfOzrK39i6Le9A5Z5zzX?=
 =?us-ascii?Q?D89dNKYLPlSoWvVK0Pp1y0GT7g46/ilHYOv+SbBxWPWPCw4vVAfYx1m2Rogd?=
 =?us-ascii?Q?urec5LUDBBeoGwgE5SGRjJn0wrj48CNM9UJgBHs5ncqlcuyt7nIZ0sOKHGqn?=
 =?us-ascii?Q?af8EGu2yXAHzq9XOkxnvRfjxhwl9jAV3c6irfFOhabPiQud6OsxTjJpvH1+P?=
 =?us-ascii?Q?feGxci1gHk0GADxowQa1MyLRJ3j3Q9CeI93CPkvAOIHnhw+PTXrc92ZYAK11?=
 =?us-ascii?Q?Sbd8sZcSpC0bLOwlKlZGRLeqOlKw4Mw7v7OiM8VsGoFC+koOtBdERYJrupex?=
 =?us-ascii?Q?vgM7CDVDKkU5BK5Vs/LoszwUNgrgS9t63FMSM+smCEmIzrTnL/WS/tcim7nr?=
 =?us-ascii?Q?VPN2Gru1dvMuksvB6EaKu9pu3EGfHsewMymVMEr2vXrZA+LBkD1F3IOBFnzD?=
 =?us-ascii?Q?GfneXEvWg/cJgTIPjUu3jh5KgI3gWBlEtf2hY3y/IpOemeXQCwDkL74rVjnS?=
X-MS-Exchange-AntiSpam-MessageData-1: T7hTskSWSvRlQb9WPdXwsUdTVZ6Yf6bvK34=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 667ea857-348d-4f65-88bb-08de7a17e5bd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:00:19.3571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Or6R1V4somw7u/7DA+mDCKJttnvI5nvmNytfipkIXsQLrtpDtHTJU9vPp3fDO6kEUrqPgYllJlkglNFzzakU4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275
X-Mailman-Approved-At: Thu, 05 Mar 2026 08:07:47 +0000
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
X-Rspamd-Queue-Id: D8F4520D319
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,ti.com:url,ti.com:email]
X-Rspamd-Action: no action

The major goal is to hide the contents of struct phy from consumer
drivers.

The idea with "phy-props.h" is that both consumers and providers make
use of some data types. So both headers include "phy-props.h".

Two slight points of contention.

1. phy_set_bus_width(): Vinod explains that despite the current caller
   situation (9 providers, 1 consumer), it is a consumer API function.

   The use case is that the controller (for example UFS) may have
   limitations and should set the expected lanes to be used and width on
   those lanes. A number of Generic PHYs can support multiple lanes and
   multiple width so this is way for controller telling I am using this
   configuration.

2. phy-provider.h should go to include/linux/phy/ or to drivers/phy/?
   We do have 3 PHY providers outside of drivers/phy/:

   drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
   drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
   drivers/pinctrl/tegra/pinctrl-tegra-xusb.c

   but the practice is not encouraged, and with time, these should be
   moved to the subsystem. This is not something that I can do now.

For temporary compatibility, keep including the provider header. This
will be removed when abuses are all gotten rid of.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/phy/phy-core.c        |  34 +++
 drivers/phy/phy-provider.h    | 256 +++++++++++++++++
 include/linux/phy/phy-props.h |  75 +++++
 include/linux/phy/phy.h       | 499 +++++++---------------------------
 4 files changed, 458 insertions(+), 406 deletions(-)
 create mode 100644 drivers/phy/phy-provider.h
 create mode 100644 include/linux/phy/phy-props.h

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 21aaf2f76e53..a1aff00fba7c 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -20,6 +20,22 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
+#define	to_phy(a)	(container_of((a), struct phy, dev))
+
+/**
+ * struct phy_lookup - PHY association in list of phys managed by the phy driver
+ * @node: list node
+ * @dev_id: the device of the association
+ * @con_id: connection ID string on device
+ * @phy: the phy of the association
+ */
+struct phy_lookup {
+	struct list_head node;
+	const char *dev_id;
+	const char *con_id;
+	struct phy *phy;
+};
+
 static void phy_release(struct device *dev);
 static const struct class phy_class = {
 	.name = "phy",
@@ -606,6 +622,24 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 }
 EXPORT_SYMBOL_GPL(phy_validate);
 
+enum phy_mode phy_get_mode(struct phy *phy)
+{
+	return phy->attrs.mode;
+}
+EXPORT_SYMBOL_GPL(phy_get_mode);
+
+int phy_get_bus_width(struct phy *phy)
+{
+	return phy->attrs.bus_width;
+}
+EXPORT_SYMBOL_GPL(phy_get_bus_width);
+
+void phy_set_bus_width(struct phy *phy, int bus_width)
+{
+	phy->attrs.bus_width = bus_width;
+}
+EXPORT_SYMBOL_GPL(phy_set_bus_width);
+
 /**
  * _of_phy_get() - lookup and obtain a reference to a phy by phandle
  * @np: device_node for which to get the phy
diff --git a/drivers/phy/phy-provider.h b/drivers/phy/phy-provider.h
new file mode 100644
index 000000000000..0637278a2d8d
--- /dev/null
+++ b/drivers/phy/phy-provider.h
@@ -0,0 +1,256 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * phy-provider.h -- Generic PHY provider API
+ *
+ * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
+ *
+ * Author: Kishon Vijay Abraham I <kishon@ti.com>
+ */
+#ifndef __PHY_PROVIDER_H
+#define __PHY_PROVIDER_H
+
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/phy/phy-props.h>
+
+struct phy;
+
+/**
+ * struct phy_ops - set of function pointers for performing phy operations
+ * @init: operation to be performed for initializing phy
+ * @exit: operation to be performed while exiting
+ * @power_on: powering on the phy
+ * @power_off: powering off the phy
+ * @set_mode: set the mode of the phy
+ * @set_media: set the media type of the phy (optional)
+ * @set_speed: set the speed of the phy (optional)
+ * @reset: resetting the phy
+ * @calibrate: calibrate the phy
+ * @notify_phystate: notify and configure the phy for a particular state
+ * @release: ops to be performed while the consumer relinquishes the PHY
+ * @owner: the module owner containing the ops
+ */
+struct phy_ops {
+	int	(*init)(struct phy *phy);
+	int	(*exit)(struct phy *phy);
+	int	(*power_on)(struct phy *phy);
+	int	(*power_off)(struct phy *phy);
+	int	(*set_mode)(struct phy *phy, enum phy_mode mode, int submode);
+	int	(*set_media)(struct phy *phy, enum phy_media media);
+	int	(*set_speed)(struct phy *phy, int speed);
+
+	/**
+	 * @configure:
+	 *
+	 * Optional.
+	 *
+	 * Used to change the PHY parameters. phy_init() must have
+	 * been called on the phy.
+	 *
+	 * Returns: 0 if successful, an negative error code otherwise
+	 */
+	int	(*configure)(struct phy *phy, union phy_configure_opts *opts);
+
+	/**
+	 * @validate:
+	 *
+	 * Optional.
+	 *
+	 * Used to check that the current set of parameters can be
+	 * handled by the phy. Implementations are free to tune the
+	 * parameters passed as arguments if needed by some
+	 * implementation detail or constraints. It must not change
+	 * any actual configuration of the PHY, so calling it as many
+	 * times as deemed fit by the consumer must have no side
+	 * effect.
+	 *
+	 * Returns: 0 if the configuration can be applied, an negative
+	 * error code otherwise
+	 */
+	int	(*validate)(struct phy *phy, enum phy_mode mode, int submode,
+			    union phy_configure_opts *opts);
+	int	(*reset)(struct phy *phy);
+	int	(*calibrate)(struct phy *phy);
+
+	/* notify phy connect status change */
+	int	(*connect)(struct phy *phy, int port);
+	int	(*disconnect)(struct phy *phy, int port);
+
+	int	(*notify_phystate)(struct phy *phy, union phy_notify state);
+	void	(*release)(struct phy *phy);
+	struct module *owner;
+};
+
+/**
+ * struct phy_attrs - represents phy attributes
+ * @bus_width: Data path width implemented by PHY
+ * @max_link_rate: Maximum link rate supported by PHY (units to be decided by producer and consumer)
+ * @mode: PHY mode
+ */
+struct phy_attrs {
+	u32			bus_width;
+	u32			max_link_rate;
+	enum phy_mode		mode;
+};
+
+/**
+ * struct phy - represents the phy device
+ * @dev: phy device
+ * @id: id of the phy device
+ * @ops: function pointers for performing phy operations
+ * @mutex: mutex to protect phy_ops
+ * @lockdep_key: lockdep information for this mutex
+ * @init_count: used to protect when the PHY is used by multiple consumers
+ * @power_count: used to protect when the PHY is used by multiple consumers
+ * @attrs: used to specify PHY specific attributes
+ * @pwr: power regulator associated with the phy
+ * @debugfs: debugfs directory
+ */
+struct phy {
+	struct device		dev;
+	int			id;
+	const struct phy_ops	*ops;
+	struct mutex		mutex;
+	struct lock_class_key	lockdep_key;
+	int			init_count;
+	int			power_count;
+	struct phy_attrs	attrs;
+	struct regulator	*pwr;
+	struct dentry		*debugfs;
+};
+
+/**
+ * struct phy_provider - represents the phy provider
+ * @dev: phy provider device
+ * @children: can be used to override the default (dev->of_node) child node
+ * @owner: the module owner having of_xlate
+ * @list: to maintain a linked list of PHY providers
+ * @of_xlate: function pointer to obtain phy instance from phy pointer
+ */
+struct phy_provider {
+	struct device		*dev;
+	struct device_node	*children;
+	struct module		*owner;
+	struct list_head	list;
+	struct phy *(*of_xlate)(struct device *dev,
+				const struct of_phandle_args *args);
+};
+
+#define	of_phy_provider_register(dev, xlate)	\
+	__of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate))
+
+#define	devm_of_phy_provider_register(dev, xlate)	\
+	__devm_of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate))
+
+#define of_phy_provider_register_full(dev, children, xlate) \
+	__of_phy_provider_register(dev, children, THIS_MODULE, xlate)
+
+#define devm_of_phy_provider_register_full(dev, children, xlate) \
+	__devm_of_phy_provider_register(dev, children, THIS_MODULE, xlate)
+
+static inline void phy_set_drvdata(struct phy *phy, void *data)
+{
+	dev_set_drvdata(&phy->dev, data);
+}
+
+static inline void *phy_get_drvdata(struct phy *phy)
+{
+	return dev_get_drvdata(&phy->dev);
+}
+
+#if IS_ENABLED(CONFIG_GENERIC_PHY)
+struct phy *phy_create(struct device *dev, struct device_node *node,
+		       const struct phy_ops *ops);
+struct phy *devm_phy_create(struct device *dev, struct device_node *node,
+			    const struct phy_ops *ops);
+void phy_destroy(struct phy *phy);
+void devm_phy_destroy(struct device *dev, struct phy *phy);
+
+struct phy_provider *
+__of_phy_provider_register(struct device *dev, struct device_node *children,
+			   struct module *owner,
+			   struct phy *(*of_xlate)(struct device *dev,
+						   const struct of_phandle_args *args));
+struct phy_provider *
+__devm_of_phy_provider_register(struct device *dev, struct device_node *children,
+				struct module *owner,
+				struct phy *(*of_xlate)(struct device *dev,
+							const struct of_phandle_args *args));
+void of_phy_provider_unregister(struct phy_provider *phy_provider);
+void devm_of_phy_provider_unregister(struct device *dev,
+				     struct phy_provider *phy_provider);
+int phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id);
+void phy_remove_lookup(struct phy *phy, const char *con_id, const char *dev_id);
+struct phy *of_phy_simple_xlate(struct device *dev,
+				const struct of_phandle_args *args);
+#else
+static inline struct phy *phy_create(struct device *dev,
+				     struct device_node *node,
+				     const struct phy_ops *ops)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+static inline struct phy *devm_phy_create(struct device *dev,
+					  struct device_node *node,
+					  const struct phy_ops *ops)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+static inline void phy_destroy(struct phy *phy)
+{
+}
+
+static inline void devm_phy_destroy(struct device *dev, struct phy *phy)
+{
+}
+
+static inline struct phy_provider *
+__of_phy_provider_register(struct device *dev, struct device_node *children,
+			   struct module *owner,
+			   struct phy *(*of_xlate)(struct device *dev,
+						   const struct of_phandle_args *args))
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+static inline struct phy_provider *
+__devm_of_phy_provider_register(struct device *dev, struct device_node *children,
+				struct module *owner,
+				struct phy *(*of_xlate)(struct device *dev,
+							const struct of_phandle_args *args))
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+static inline void of_phy_provider_unregister(struct phy_provider *phy_provider)
+{
+}
+
+static inline void devm_of_phy_provider_unregister(struct device *dev,
+						   struct phy_provider *phy_provider)
+{
+}
+
+static inline int phy_create_lookup(struct phy *phy, const char *con_id,
+				    const char *dev_id)
+{
+	return 0;
+}
+
+static inline void phy_remove_lookup(struct phy *phy, const char *con_id,
+				     const char *dev_id)
+{
+}
+
+static inline struct phy *of_phy_simple_xlate(struct device *dev,
+					      const struct of_phandle_args *args)
+{
+	return ERR_PTR(-ENOSYS);
+}
+#endif /* IS_ENABLED(CONFIG_GENERIC_PHY) */
+
+#endif /* __PHY_PROVIDER_H */
diff --git a/include/linux/phy/phy-props.h b/include/linux/phy/phy-props.h
new file mode 100644
index 000000000000..11f36738165f
--- /dev/null
+++ b/include/linux/phy/phy-props.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * phy-provider.h -- Generic PHY properties
+ *
+ * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
+ *
+ * Author: Kishon Vijay Abraham I <kishon@ti.com>
+ */
+#ifndef __PHY_PROPS_H
+#define __PHY_PROPS_H
+
+#include <linux/phy/phy-dp.h>
+#include <linux/phy/phy-hdmi.h>
+#include <linux/phy/phy-lvds.h>
+#include <linux/phy/phy-mipi-dphy.h>
+
+enum phy_mode {
+	PHY_MODE_INVALID,
+	PHY_MODE_USB_HOST,
+	PHY_MODE_USB_HOST_LS,
+	PHY_MODE_USB_HOST_FS,
+	PHY_MODE_USB_HOST_HS,
+	PHY_MODE_USB_HOST_SS,
+	PHY_MODE_USB_DEVICE,
+	PHY_MODE_USB_DEVICE_LS,
+	PHY_MODE_USB_DEVICE_FS,
+	PHY_MODE_USB_DEVICE_HS,
+	PHY_MODE_USB_DEVICE_SS,
+	PHY_MODE_USB_OTG,
+	PHY_MODE_UFS_HS_A,
+	PHY_MODE_UFS_HS_B,
+	PHY_MODE_PCIE,
+	PHY_MODE_ETHERNET,
+	PHY_MODE_MIPI_DPHY,
+	PHY_MODE_SATA,
+	PHY_MODE_LVDS,
+	PHY_MODE_DP,
+	PHY_MODE_HDMI,
+};
+
+enum phy_media {
+	PHY_MEDIA_DEFAULT,
+	PHY_MEDIA_SR,
+	PHY_MEDIA_DAC,
+};
+
+enum phy_ufs_state {
+	PHY_UFS_HIBERN8_ENTER,
+	PHY_UFS_HIBERN8_EXIT,
+};
+
+union phy_notify {
+	enum phy_ufs_state ufs_state;
+};
+
+/**
+ * union phy_configure_opts - Opaque generic phy configuration
+ *
+ * @mipi_dphy:	Configuration set applicable for phys supporting
+ *		the MIPI_DPHY phy mode.
+ * @dp:		Configuration set applicable for phys supporting
+ *		the DisplayPort protocol.
+ * @lvds:	Configuration set applicable for phys supporting
+ *		the LVDS phy mode.
+ * @hdmi:	Configuration set applicable for phys supporting
+ *		the HDMI phy mode.
+ */
+union phy_configure_opts {
+	struct phy_configure_opts_mipi_dphy	mipi_dphy;
+	struct phy_configure_opts_dp		dp;
+	struct phy_configure_opts_lvds		lvds;
+	struct phy_configure_opts_hdmi		hdmi;
+};
+
+#endif /* __PHY_PROPS_H */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288a..36307e47760d 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -1,246 +1,38 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * phy.h -- generic phy header file
+ * phy.h -- Generic PHY consumer API
  *
  * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
  *
  * Author: Kishon Vijay Abraham I <kishon@ti.com>
  */
 
-#ifndef __DRIVERS_PHY_H
-#define __DRIVERS_PHY_H
+#ifndef __PHY_CONSUMER_H
+#define __PHY_CONSUMER_H
 
-#include <linux/err.h>
-#include <linux/of.h>
-#include <linux/device.h>
-#include <linux/pm_runtime.h>
-#include <linux/regulator/consumer.h>
+#include <linux/phy/phy-props.h>
 
-#include <linux/phy/phy-dp.h>
-#include <linux/phy/phy-hdmi.h>
-#include <linux/phy/phy-lvds.h>
-#include <linux/phy/phy-mipi-dphy.h>
+#include "../../drivers/phy/phy-provider.h"
 
+struct device;
+struct device_node;
 struct phy;
 
-enum phy_mode {
-	PHY_MODE_INVALID,
-	PHY_MODE_USB_HOST,
-	PHY_MODE_USB_HOST_LS,
-	PHY_MODE_USB_HOST_FS,
-	PHY_MODE_USB_HOST_HS,
-	PHY_MODE_USB_HOST_SS,
-	PHY_MODE_USB_DEVICE,
-	PHY_MODE_USB_DEVICE_LS,
-	PHY_MODE_USB_DEVICE_FS,
-	PHY_MODE_USB_DEVICE_HS,
-	PHY_MODE_USB_DEVICE_SS,
-	PHY_MODE_USB_OTG,
-	PHY_MODE_UFS_HS_A,
-	PHY_MODE_UFS_HS_B,
-	PHY_MODE_PCIE,
-	PHY_MODE_ETHERNET,
-	PHY_MODE_MIPI_DPHY,
-	PHY_MODE_SATA,
-	PHY_MODE_LVDS,
-	PHY_MODE_DP,
-	PHY_MODE_HDMI,
-};
-
-enum phy_media {
-	PHY_MEDIA_DEFAULT,
-	PHY_MEDIA_SR,
-	PHY_MEDIA_DAC,
-};
-
-enum phy_ufs_state {
-	PHY_UFS_HIBERN8_ENTER,
-	PHY_UFS_HIBERN8_EXIT,
-};
-
-union phy_notify {
-	enum phy_ufs_state ufs_state;
-};
-
-/**
- * union phy_configure_opts - Opaque generic phy configuration
- *
- * @mipi_dphy:	Configuration set applicable for phys supporting
- *		the MIPI_DPHY phy mode.
- * @dp:		Configuration set applicable for phys supporting
- *		the DisplayPort protocol.
- * @lvds:	Configuration set applicable for phys supporting
- *		the LVDS phy mode.
- * @hdmi:	Configuration set applicable for phys supporting
- *		the HDMI phy mode.
- */
-union phy_configure_opts {
-	struct phy_configure_opts_mipi_dphy	mipi_dphy;
-	struct phy_configure_opts_dp		dp;
-	struct phy_configure_opts_lvds		lvds;
-	struct phy_configure_opts_hdmi		hdmi;
-};
-
-/**
- * struct phy_ops - set of function pointers for performing phy operations
- * @init: operation to be performed for initializing phy
- * @exit: operation to be performed while exiting
- * @power_on: powering on the phy
- * @power_off: powering off the phy
- * @set_mode: set the mode of the phy
- * @set_media: set the media type of the phy (optional)
- * @set_speed: set the speed of the phy (optional)
- * @reset: resetting the phy
- * @calibrate: calibrate the phy
- * @notify_phystate: notify and configure the phy for a particular state
- * @release: ops to be performed while the consumer relinquishes the PHY
- * @owner: the module owner containing the ops
- */
-struct phy_ops {
-	int	(*init)(struct phy *phy);
-	int	(*exit)(struct phy *phy);
-	int	(*power_on)(struct phy *phy);
-	int	(*power_off)(struct phy *phy);
-	int	(*set_mode)(struct phy *phy, enum phy_mode mode, int submode);
-	int	(*set_media)(struct phy *phy, enum phy_media media);
-	int	(*set_speed)(struct phy *phy, int speed);
-
-	/**
-	 * @configure:
-	 *
-	 * Optional.
-	 *
-	 * Used to change the PHY parameters. phy_init() must have
-	 * been called on the phy.
-	 *
-	 * Returns: 0 if successful, an negative error code otherwise
-	 */
-	int	(*configure)(struct phy *phy, union phy_configure_opts *opts);
-
-	/**
-	 * @validate:
-	 *
-	 * Optional.
-	 *
-	 * Used to check that the current set of parameters can be
-	 * handled by the phy. Implementations are free to tune the
-	 * parameters passed as arguments if needed by some
-	 * implementation detail or constraints. It must not change
-	 * any actual configuration of the PHY, so calling it as many
-	 * times as deemed fit by the consumer must have no side
-	 * effect.
-	 *
-	 * Returns: 0 if the configuration can be applied, an negative
-	 * error code otherwise
-	 */
-	int	(*validate)(struct phy *phy, enum phy_mode mode, int submode,
-			    union phy_configure_opts *opts);
-	int	(*reset)(struct phy *phy);
-	int	(*calibrate)(struct phy *phy);
-
-	/* notify phy connect status change */
-	int	(*connect)(struct phy *phy, int port);
-	int	(*disconnect)(struct phy *phy, int port);
-
-	int	(*notify_phystate)(struct phy *phy, union phy_notify state);
-	void	(*release)(struct phy *phy);
-	struct module *owner;
-};
-
-/**
- * struct phy_attrs - represents phy attributes
- * @bus_width: Data path width implemented by PHY
- * @max_link_rate: Maximum link rate supported by PHY (units to be decided by producer and consumer)
- * @mode: PHY mode
- */
-struct phy_attrs {
-	u32			bus_width;
-	u32			max_link_rate;
-	enum phy_mode		mode;
-};
-
-/**
- * struct phy - represents the phy device
- * @dev: phy device
- * @id: id of the phy device
- * @ops: function pointers for performing phy operations
- * @mutex: mutex to protect phy_ops
- * @lockdep_key: lockdep information for this mutex
- * @init_count: used to protect when the PHY is used by multiple consumers
- * @power_count: used to protect when the PHY is used by multiple consumers
- * @attrs: used to specify PHY specific attributes
- * @pwr: power regulator associated with the phy
- * @debugfs: debugfs directory
- */
-struct phy {
-	struct device		dev;
-	int			id;
-	const struct phy_ops	*ops;
-	struct mutex		mutex;
-	struct lock_class_key	lockdep_key;
-	int			init_count;
-	int			power_count;
-	struct phy_attrs	attrs;
-	struct regulator	*pwr;
-	struct dentry		*debugfs;
-};
-
-/**
- * struct phy_provider - represents the phy provider
- * @dev: phy provider device
- * @children: can be used to override the default (dev->of_node) child node
- * @owner: the module owner having of_xlate
- * @list: to maintain a linked list of PHY providers
- * @of_xlate: function pointer to obtain phy instance from phy pointer
- */
-struct phy_provider {
-	struct device		*dev;
-	struct device_node	*children;
-	struct module		*owner;
-	struct list_head	list;
-	struct phy * (*of_xlate)(struct device *dev,
-				 const struct of_phandle_args *args);
-};
-
-/**
- * struct phy_lookup - PHY association in list of phys managed by the phy driver
- * @node: list node
- * @dev_id: the device of the association
- * @con_id: connection ID string on device
- * @phy: the phy of the association
- */
-struct phy_lookup {
-	struct list_head node;
-	const char *dev_id;
-	const char *con_id;
-	struct phy *phy;
-};
-
-#define	to_phy(a)	(container_of((a), struct phy, dev))
-
-#define	of_phy_provider_register(dev, xlate)	\
-	__of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate))
-
-#define	devm_of_phy_provider_register(dev, xlate)	\
-	__devm_of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate))
-
-#define of_phy_provider_register_full(dev, children, xlate) \
-	__of_phy_provider_register(dev, children, THIS_MODULE, xlate)
-
-#define devm_of_phy_provider_register_full(dev, children, xlate) \
-	__devm_of_phy_provider_register(dev, children, THIS_MODULE, xlate)
-
-static inline void phy_set_drvdata(struct phy *phy, void *data)
-{
-	dev_set_drvdata(&phy->dev, data);
-}
-
-static inline void *phy_get_drvdata(struct phy *phy)
-{
-	return dev_get_drvdata(&phy->dev);
-}
-
 #if IS_ENABLED(CONFIG_GENERIC_PHY)
+struct phy *phy_get(struct device *dev, const char *string);
+struct phy *devm_phy_get(struct device *dev, const char *string);
+struct phy *devm_phy_optional_get(struct device *dev, const char *string);
+struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
+			    const char *con_id);
+struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
+				     const char *con_id);
+struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
+				     int index);
+void of_phy_put(struct phy *phy);
+void phy_put(struct device *dev, struct phy *phy);
+void devm_phy_put(struct device *dev, struct phy *phy);
+struct phy *of_phy_get(struct device_node *np, const char *con_id);
+
 int phy_pm_runtime_get(struct phy *phy);
 int phy_pm_runtime_get_sync(struct phy *phy);
 void phy_pm_runtime_put(struct phy *phy);
@@ -257,59 +49,69 @@ int phy_set_speed(struct phy *phy, int speed);
 int phy_configure(struct phy *phy, union phy_configure_opts *opts);
 int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 		 union phy_configure_opts *opts);
-
-static inline enum phy_mode phy_get_mode(struct phy *phy)
-{
-	return phy->attrs.mode;
-}
+enum phy_mode phy_get_mode(struct phy *phy);
 int phy_reset(struct phy *phy);
 int phy_calibrate(struct phy *phy);
 int phy_notify_connect(struct phy *phy, int port);
 int phy_notify_disconnect(struct phy *phy, int port);
 int phy_notify_state(struct phy *phy, union phy_notify state);
-static inline int phy_get_bus_width(struct phy *phy)
+int phy_get_bus_width(struct phy *phy);
+void phy_set_bus_width(struct phy *phy, int bus_width);
+#else
+static inline struct phy *phy_get(struct device *dev, const char *string)
 {
-	return phy->attrs.bus_width;
+	return ERR_PTR(-ENOSYS);
 }
-static inline void phy_set_bus_width(struct phy *phy, int bus_width)
+
+static inline struct phy *devm_phy_get(struct device *dev, const char *string)
 {
-	phy->attrs.bus_width = bus_width;
+	return ERR_PTR(-ENOSYS);
 }
-struct phy *phy_get(struct device *dev, const char *string);
-struct phy *devm_phy_get(struct device *dev, const char *string);
-struct phy *devm_phy_optional_get(struct device *dev, const char *string);
-struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
-			    const char *con_id);
-struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
-				     const char *con_id);
-struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
-				     int index);
-void of_phy_put(struct phy *phy);
-void phy_put(struct device *dev, struct phy *phy);
-void devm_phy_put(struct device *dev, struct phy *phy);
-struct phy *of_phy_get(struct device_node *np, const char *con_id);
-struct phy *of_phy_simple_xlate(struct device *dev,
-				const struct of_phandle_args *args);
-struct phy *phy_create(struct device *dev, struct device_node *node,
-		       const struct phy_ops *ops);
-struct phy *devm_phy_create(struct device *dev, struct device_node *node,
-			    const struct phy_ops *ops);
-void phy_destroy(struct phy *phy);
-void devm_phy_destroy(struct device *dev, struct phy *phy);
-struct phy_provider *__of_phy_provider_register(struct device *dev,
-	struct device_node *children, struct module *owner,
-	struct phy * (*of_xlate)(struct device *dev,
-				 const struct of_phandle_args *args));
-struct phy_provider *__devm_of_phy_provider_register(struct device *dev,
-	struct device_node *children, struct module *owner,
-	struct phy * (*of_xlate)(struct device *dev,
-				 const struct of_phandle_args *args));
-void of_phy_provider_unregister(struct phy_provider *phy_provider);
-void devm_of_phy_provider_unregister(struct device *dev,
-	struct phy_provider *phy_provider);
-int phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id);
-void phy_remove_lookup(struct phy *phy, const char *con_id, const char *dev_id);
-#else
+
+static inline struct phy *devm_phy_optional_get(struct device *dev,
+						const char *string)
+{
+	return NULL;
+}
+
+static inline struct phy *devm_of_phy_get(struct device *dev,
+					  struct device_node *np,
+					  const char *con_id)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+static inline struct phy *devm_of_phy_optional_get(struct device *dev,
+						   struct device_node *np,
+						   const char *con_id)
+{
+	return NULL;
+}
+
+static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
+						   struct device_node *np,
+						   int index)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+static inline void of_phy_put(struct phy *phy)
+{
+}
+
+static inline void phy_put(struct device *dev, struct phy *phy)
+{
+}
+
+static inline void devm_phy_put(struct device *dev, struct phy *phy)
+{
+}
+
+static inline struct phy *of_phy_get(struct device_node *np, const char *con_id)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline int phy_pm_runtime_get(struct phy *phy)
 {
 	if (!phy)
@@ -388,61 +190,61 @@ static inline int phy_set_speed(struct phy *phy, int speed)
 	return -ENODEV;
 }
 
-static inline enum phy_mode phy_get_mode(struct phy *phy)
-{
-	return PHY_MODE_INVALID;
-}
-
-static inline int phy_reset(struct phy *phy)
+static inline int phy_configure(struct phy *phy,
+				union phy_configure_opts *opts)
 {
 	if (!phy)
 		return 0;
+
 	return -ENOSYS;
 }
 
-static inline int phy_calibrate(struct phy *phy)
+static inline int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
+			       union phy_configure_opts *opts)
 {
 	if (!phy)
 		return 0;
+
 	return -ENOSYS;
 }
 
-static inline int phy_notify_connect(struct phy *phy, int index)
+static inline enum phy_mode phy_get_mode(struct phy *phy)
+{
+	return PHY_MODE_INVALID;
+}
+
+static inline int phy_reset(struct phy *phy)
 {
 	if (!phy)
 		return 0;
 	return -ENOSYS;
 }
 
-static inline int phy_notify_disconnect(struct phy *phy, int index)
+static inline int phy_calibrate(struct phy *phy)
 {
 	if (!phy)
 		return 0;
 	return -ENOSYS;
 }
 
-static inline int phy_notify_state(struct phy *phy, union phy_notify state)
+static inline int phy_notify_connect(struct phy *phy, int index)
 {
 	if (!phy)
 		return 0;
 	return -ENOSYS;
 }
 
-static inline int phy_configure(struct phy *phy,
-				union phy_configure_opts *opts)
+static inline int phy_notify_disconnect(struct phy *phy, int index)
 {
 	if (!phy)
 		return 0;
-
 	return -ENOSYS;
 }
 
-static inline int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
-			       union phy_configure_opts *opts)
+static inline int phy_notify_state(struct phy *phy, union phy_notify state)
 {
 	if (!phy)
 		return 0;
-
 	return -ENOSYS;
 }
 
@@ -453,122 +255,7 @@ static inline int phy_get_bus_width(struct phy *phy)
 
 static inline void phy_set_bus_width(struct phy *phy, int bus_width)
 {
-	return;
-}
-
-static inline struct phy *phy_get(struct device *dev, const char *string)
-{
-	return ERR_PTR(-ENOSYS);
-}
-
-static inline struct phy *devm_phy_get(struct device *dev, const char *string)
-{
-	return ERR_PTR(-ENOSYS);
-}
-
-static inline struct phy *devm_phy_optional_get(struct device *dev,
-						const char *string)
-{
-	return NULL;
-}
-
-static inline struct phy *devm_of_phy_get(struct device *dev,
-					  struct device_node *np,
-					  const char *con_id)
-{
-	return ERR_PTR(-ENOSYS);
-}
-
-static inline struct phy *devm_of_phy_optional_get(struct device *dev,
-						   struct device_node *np,
-						   const char *con_id)
-{
-	return NULL;
-}
-
-static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
-						   struct device_node *np,
-						   int index)
-{
-	return ERR_PTR(-ENOSYS);
-}
-
-static inline void of_phy_put(struct phy *phy)
-{
-}
-
-static inline void phy_put(struct device *dev, struct phy *phy)
-{
-}
-
-static inline void devm_phy_put(struct device *dev, struct phy *phy)
-{
-}
-
-static inline struct phy *of_phy_get(struct device_node *np, const char *con_id)
-{
-	return ERR_PTR(-ENOSYS);
-}
-
-static inline struct phy *of_phy_simple_xlate(struct device *dev,
-					      const struct of_phandle_args *args)
-{
-	return ERR_PTR(-ENOSYS);
-}
-
-static inline struct phy *phy_create(struct device *dev,
-				     struct device_node *node,
-				     const struct phy_ops *ops)
-{
-	return ERR_PTR(-ENOSYS);
-}
-
-static inline struct phy *devm_phy_create(struct device *dev,
-					  struct device_node *node,
-					  const struct phy_ops *ops)
-{
-	return ERR_PTR(-ENOSYS);
-}
-
-static inline void phy_destroy(struct phy *phy)
-{
-}
-
-static inline void devm_phy_destroy(struct device *dev, struct phy *phy)
-{
-}
-
-static inline struct phy_provider *__of_phy_provider_register(
-	struct device *dev, struct device_node *children, struct module *owner,
-	struct phy * (*of_xlate)(struct device *dev,
-				 const struct of_phandle_args *args))
-{
-	return ERR_PTR(-ENOSYS);
-}
-
-static inline struct phy_provider *__devm_of_phy_provider_register(struct device
-	*dev, struct device_node *children, struct module *owner,
-	struct phy * (*of_xlate)(struct device *dev,
-				 const struct of_phandle_args *args))
-{
-	return ERR_PTR(-ENOSYS);
-}
-
-static inline void of_phy_provider_unregister(struct phy_provider *phy_provider)
-{
-}
-
-static inline void devm_of_phy_provider_unregister(struct device *dev,
-	struct phy_provider *phy_provider)
-{
-}
-static inline int
-phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id)
-{
-	return 0;
 }
-static inline void phy_remove_lookup(struct phy *phy, const char *con_id,
-				     const char *dev_id) { }
-#endif
+#endif /* IS_ENABLED(CONFIG_GENERIC_PHY) */
 
-#endif /* __DRIVERS_PHY_H */
+#endif /* __PHY_CONSUMER_H */
-- 
2.43.0

