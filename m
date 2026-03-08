Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qZYBDJmGrWky4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B05230A99
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4387810E16C;
	Sun,  8 Mar 2026 14:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="iqg2Vmh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA4D10E123;
 Sun,  8 Mar 2026 11:43:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTL9WyEvwqEPvvNHbHcPePpYFFTSx4id/Ftc5fng8RjxukrunHnjbColPjFCxk5Qg2/aCMYpx4vwsBu30S0NAZ25XqqkmbFOamZ/qs5MaNPKMuMMkc1D1kLxBltARVE1GImfbde7aIfiY6P2UKQNaJXVRk7KJAyRUSqwMYsQUUXTILp3fGj5Xxdx9DD+8TmbAfAWKIxOQU7qAP5KjMFMmwWHeAY1eFNzFSUqpbXLYQhZ9zWzDRN7IslvHqEqeHTvdvfcelQDgQnVKiQWihq4R/E377pjC7sgvWANQoqkPTdv/UZZN2IEQBCh0V3QpDs72vVnbRY0HBES2PLpa3O+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3D8QhRMyNoPURqKNCZDZJH1l59IW+yXmoKnLaTTOPY=;
 b=nJK1Xr13Y4GKmGu8iK1HHZWLme08OdFo68On5XooD2gGrAaHEYkuwFy/1f/A/EdkksU0CMQT/YCQjN51wdPd6cjOntJBJ8/I8sWeMnRqGPKc/9WTpgpxjSOJBLP/vBV8vSGgDDTtzZbowbV72ULmTFERdV3AqQvrMBnlbd0ZVAldssDlNTxzq1kVPaxQzfbRe98BBa78+/eS4hBWDjuLojRfgULolpLIy1Ke4/js/QCDAySbi5Y8ohOarD+4X/h1i1kY8jEj0klF/hlYSAab5gJKCbWcChVPasf2aup14H59r99An6qpw3a6bmJH7ZWtYcqM+zaA6ICGsooTQYtqvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3D8QhRMyNoPURqKNCZDZJH1l59IW+yXmoKnLaTTOPY=;
 b=iqg2Vmh3OdNztV1/VILyBMwpn3kFYIMN2ZrVHBqdampqxp8PeSFkek90C5sAUqsi6Slkra78lJYQyRm416jQLGlFzfJVPsMeVYAlhoy0bQj7JtqUSfZfaa1s0FFPCmy++XBqwAKpca98dhrafXVsI+5InhaVUTybxw8pVOYj9oNOQAcI4bTRIOH62v4EWqAfE32yMHU1bSTUr8ww+Km4Y60TQb3nip42BcuH+rI1QszPgVdRXxIIHoGIA0J4xsVuocvIY9PLTTAF2aydnakNuItFyu3ubbSytxWXWDLZ23F85dlHrUEMjg+z1o5y9osatCOXCCRkcHP9ryWPZh4KhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB12426.eurprd04.prod.outlook.com (2603:10a6:10:614::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Sun, 8 Mar
 2026 11:43:19 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:19 +0000
From: vladimir.oltean@nxp.com
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
 spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 phy-next 12/24] phy: move provider API out of public
 <linux/phy/phy.h>
Date: Sun,  8 Mar 2026 13:39:57 +0200
Message-ID: <20260308114009.2546587-13-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0102CA0090.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::31) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB12426:EE_
X-MS-Office365-Filtering-Correlation-Id: e0a101ad-686c-4a4d-4fa5-08de7d07e512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|19092799006|10070799003|1800799024|18082099003|13003099007;
X-Microsoft-Antispam-Message-Info: DA13h9cY0bguc5iGFp3L4xkTwmiz/Jh29DvaK6E+5+b9k34FBQu5AyV6D+KJbOFjXV6xus8GyL3AYY07ZfqSzTmIhf+Wwna/mroST/nlbXrzv3bu/7haRtwRWiqXO4ynmWhdVCE5CpJ3GxmKl8uqQDdkQy0tXTwBhSJKSevGMjVbaNyYxqDQf28zo6VaOaaxaNkxAD/J8Eq8071QKqimzll/h4HRe5Ml8/H1C8UVkLS9erFRt7mNKGJD/B9YfDJkPmrgN/s8C+6d4bP9QsF9PIGgWygdjISzdRuM0xGgibK9iZFlwWsGwqzOrOWD4dcpqp807g7hov5Y9avbwTRqC0z2mtDI1KVDH3Vhx7yDK3N+ZCdMO12jZkSnmb4C9U7rmR3KaYrgrRqBRASripx0JUsUbOWsSkZgBI+g1XudCf4zEB+XJikZGH+qAlYdbLMZZimwf5yk7d6cI3UvywQ2f3yH8Pn952tSYJwQzF36LicItwLmbmes22ydqMiPHZOQUjCM+G3bdY5uhJAhS3166pCZ0EA75yxEyzD5K52h0yoYsVMioKzE5A6nrDEw+zAXfwW2dXQlpbqp1GQyCftkBOkpShp7CZYg/cL3XHenTXE2GNrO/iVUFI0/oZ3QO/I3wP9GVHH3+SaDhXayDE0ghi0MXjkOfSHUMGJ3NN1/+XwLS6qAwVbSHAr88In+kvzy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(19092799006)(10070799003)(1800799024)(18082099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kaBDme/RDvYPAHPqIXWBF6D/wGYYJJY7+QK5WPCj89E4P81WbedwRN9DvsTV?=
 =?us-ascii?Q?7+7mnSkdpPbl55LAQES6ewB8hqHFKLeCZm7u3Kh3zD+RlxDybUSOcChsRVIm?=
 =?us-ascii?Q?j3a00ILZ1uZn3KSa3vBHk8fSCndR4iQOiiCj4fPiJFQEylRRWWyzpHOR36b7?=
 =?us-ascii?Q?QtJNQbgFapXlJi4gSIkRPQ7XgFyLQbKvrfbZlyjLldLf4M5yQAMwE6YumFMX?=
 =?us-ascii?Q?DDoC97wOghsxGfVhvfnYJOaIj5ZK+PLOOBtS3QcXLvSGrn8md1i0TI1BsWqW?=
 =?us-ascii?Q?y2x8CJFBrmzfFTLnPVXg5zoXaIVHMcNTTvOL05WPQ/VPXNoYEBlZVH3UQWLA?=
 =?us-ascii?Q?u5uVhlm5753lSjMIyZxo8FXMHNQRz34V95zW+ZHFo9zzbyArWmVPp4cBXzIM?=
 =?us-ascii?Q?vL0WRmYKeDqm9x2Na6wgt9vnVM7t5RlDUSdB7RUCzFbHW0zIZkp2Yfwp+xWF?=
 =?us-ascii?Q?eB2JnFQmhPV1WJtk2HYSPPD5l+GNc8Ss85DgL8Cz+tmGpCqXyBI3QbMwqcBp?=
 =?us-ascii?Q?p/DSqTPfLlR9kjrtza+YJamyZbUB6NQQ+tdpSgm8MojN7OyX/B/k7VrGW+GT?=
 =?us-ascii?Q?wj6hk2msdq+VKwD2o3GFtk6KXPSgnk4DrYDmGqxNe5kPo/mqDhe7Mp33JC6n?=
 =?us-ascii?Q?ioyr6MR5mMVWct4P2hup06PIAGwSUEI8/H9W7hgzhYt82pNN3GJL8zohhS7Y?=
 =?us-ascii?Q?Why+dTk3beBKPYknkxvxuoi7LkupABGoiaW+aPcGzA1S19oE03b0huouxyGl?=
 =?us-ascii?Q?L/WuE/lDxzhAvzNYi3lN9T1okmJl7UEJfrzyQ+ome+yBMsPLU00azPOQOHw6?=
 =?us-ascii?Q?r7eB6AQHISfPb6cOUM4g9NuIdT8yp+bwajKFmkGkLgBxaNqUXzTzKTlLVrUD?=
 =?us-ascii?Q?fwarQGVCrf663FOnjOqU2CH7svCm5yWwv60jlL2kQyuFai+D0uKODfQWxyq0?=
 =?us-ascii?Q?BoaKlzVsbJrn1c9GpIkiuBBfQDc20OPmiZho8mAQS6fhoTtfufU56N3cdQKV?=
 =?us-ascii?Q?7waQbeehIif9Xuqht0xT/jj3rbbcC4xl0TqHlcW5RNpi2ova1CigsC0EzeIY?=
 =?us-ascii?Q?X46y6ic/qwMPIPz4KSgWZC8rXOnSoifAxbtrlTrrhwC2rayHVCmMBGheFlNi?=
 =?us-ascii?Q?BE+5RK0h5ph9J/KNCt3qqHrBV3nK3/ajJEiUbN72NNHV0PIUFmAoqIF85iKp?=
 =?us-ascii?Q?XLqPeM83bmXKJyLSH+2Zu5aoJ7I3TIghI/jzhXHaABJMkNkrkpvRBnECUcxt?=
 =?us-ascii?Q?hiZ33zmfQSGT+gU75jhDn5eONd/NtaS/gk+ZEKBljaOV3QRPPpgI0L3sqTkK?=
 =?us-ascii?Q?qtp7v3SBP2ufSQvRAB3BVzsMBixfHGbNx6D2doX3r3/52gzxnFuw3UjdBkgZ?=
 =?us-ascii?Q?qeNyskgDm99bFOJtoo/ac7Ezi2aRZ0y6y5aDWn+nFllFxLNECVI4HXWMcW7j?=
 =?us-ascii?Q?FLmR8xbwc54fgcPUIX/GgHr/FsoUN96RG48MKnQJ9yStQDTUg1CsWmbkPF0g?=
 =?us-ascii?Q?za7i78oO1JoFFB6V/qXbTfwD5zqAtanuuHy7eQH23Ca6PO7XIhs1q5oQL7LA?=
 =?us-ascii?Q?dnOIEGNhZm3Hdy488Fx6GqFEQjLOhBOrM+41Wc7TKNvtfODRJMwr6IGvFtNC?=
 =?us-ascii?Q?Yqugsg8/LDzAc08GUc6p+6KPG7bllQ6Vi6dlDJ8FwXvY1Gb9bGXoElK5aOZp?=
 =?us-ascii?Q?Js69FCCzPPq5i+WRio+SNac9C3S0ryFx7xVSqxiQMDrzp7rlnJMrb6JGJQGA?=
 =?us-ascii?Q?AmizMXwKU/Mk9ouwyxOmGGZv0cP+CHA0146nYaWNyh9wAEq3KtGT0y28r/oI?=
X-MS-Exchange-AntiSpam-MessageData-1: q8zjaErjWyccU6F4c9nY+I8fAgbgsz3lUA8=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a101ad-686c-4a4d-4fa5-08de7d07e512
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:19.6560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPrV2HuWTT3dXJaJIAtZQFNPwAnouUrNEG1FQW5kwUd6qd8YjP+wTYcncnPbgR7jZilisi4syftwcV8EjWyCPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB12426
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: 56B05230A99
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid,qualcomm.com:email]
X-Rspamd-Action: no action

The major goal is to hide the contents of struct phy from consumer
drivers.

The idea with "phy-props.h" is that both consumers and providers make
use of some data types. So both headers include "phy-props.h".

Some slight points of contention.

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

3. We can no longer tolerate static inline helpers. Allowing these would
   make it impossible to hide the struct phy definition from consumers.
   I've made phy_get_mode(), phy_get_bus_width(), phy_set_bus_width()
   exported symbols in drivers/phy/phy-core.c.

4. This is not a change without side effects. In the transition we are
   no longer providing <linux/pm_runtime.h> at all, and
   <linux/regulator/consumer.h> to PHY consumer drivers. However, the
   in-tree dependencies should all have been resolved. Also, the
   movement of phy-provider.h to drivers/phy/ is at least "interesting"
   for out of tree PHY provider drivers (this header is not deployed by
   make headers_install). However, it seems to be what Vinod is looking
   to see.

For temporary compatibility, keep including the provider header. This
will be removed when abuses are all gotten rid of.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
v1->v2:
- collect tag
- fix path to phy-provider.h
- update commit message with the 4th point of contention
---
 drivers/phy/phy-core.c        |  34 +++
 drivers/phy/phy-provider.h    | 256 +++++++++++++++++
 include/linux/phy/phy-props.h |  75 +++++
 include/linux/phy/phy.h       | 497 +++++++---------------------------
 4 files changed, 456 insertions(+), 406 deletions(-)
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
index ea47975e288a..f208edd25afe 100644
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
+#include "../../../drivers/phy/phy-provider.h"
 
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
@@ -388,61 +190,59 @@ static inline int phy_set_speed(struct phy *phy, int speed)
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
 	return -ENOSYS;
 }
 
-static inline int phy_calibrate(struct phy *phy)
+static inline int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
+			       union phy_configure_opts *opts)
 {
 	if (!phy)
 		return 0;
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
 
@@ -453,122 +253,7 @@ static inline int phy_get_bus_width(struct phy *phy)
 
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

