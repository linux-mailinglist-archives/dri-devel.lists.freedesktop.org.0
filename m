Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGmqG/I5qWkd3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D7320D2C3
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E59410EB5E;
	Thu,  5 Mar 2026 08:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Efp0etpu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013009.outbound.protection.outlook.com
 [40.107.162.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BCF10EA85;
 Wed,  4 Mar 2026 18:00:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYo60mfXneU+EHeAqC32hhSkd8Ixjt/rF1qXykI6rRdvlOWQ0D8wnwvO+zGteLh3QrQc7HvNeTGuP46ffBUoxbw/2yJvvKMThB5q4ICvOw0jkta9qPTguRz9wKcvFNW1NcE9hqGgF0WtACvUb+0H9IDWV+PA9OZJSv/gNnIQi8Qppsda6elAcaAc8y40HJPhX3GKi6X4Vpt4UHaO61v1Th9omVoBidXbsuPVPtIQ0cg6LhF13BOJ+9YSIlDz7bATz/t/p7qoELgYqGNlfy4se5sZrs48fo5zaU/IMJX+jdJuacvpsn027SV9KSFndWiiQhgyWowb4UqlMJfPCQx/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+ENmtcN2vm008rqaDnjgAckXB4jrzTjhI2lXiEf8Nw=;
 b=sSHox4HWRpD7LE9VVw0E0muCmfzuPfeMGiGMATwHUP/ce+FPhpjSokIhPY7tvDPz1mslon6CGgfaQox0kyBJE73eyXvqNh39sv4YWpFmEp/34RepOVF/OgkOZxATgUISrsIiwkSnu/u1GctZ9QgPF8Ka22suo0LeG0b1TPs/ojTsnnzG4rV1eV+D1qpEVpBrXkPKx2WxJTB1BDzRNfZzFvAaB72CRMZKOJkGMU8i/3s9qwM6sZAPuVoQsO2bBCAtmb2ys9J0PHcM4qhXJ6sCHwF4tp/s2OX4pv61WD2AW0Hht5L6IK/lvxWx9P3TQX3dY7zp2U4jaRjMB6aG0MfUMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+ENmtcN2vm008rqaDnjgAckXB4jrzTjhI2lXiEf8Nw=;
 b=Efp0etpuDbA6xgs7YxkIFM3kIsQB7QFtKtSFeeVsNFkRXx3bZzv0M+rbGfs0fPdGGm27IY6Iw7XDqna4bZVlvpTWbsrfHkvMWaAwniKzGGO16r1g6oX/XDPNsV05oTDu3iQWm++p5Q40XoS3+YJmSGYI7ltExeJ9ZclZM5AUF+4U0IkYKm1+uN4ad9QjRvgbHLHcQsuECHI3bOVzgqU2d6SBr0nfpN3zcn2yHC8sKBnQKkYq460rfsMZDV4xBEAKWLsuFg7C6TC612sRPtJDu38zf7A2QXLmcp9LA5LuBfB7RHISYmLsJIhQgHHjrwbhXW2yKYTcqBs9s0/6QQGyKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8778.eurprd04.prod.outlook.com (2603:10a6:20b:409::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 17:59:57 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 17:59:57 +0000
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
 spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com,
 Peter Chen <peter.chen@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH phy-next 03/22] usb: add missing headers transitively included
 by <linux/phy/phy.h>
Date: Wed,  4 Mar 2026 19:57:16 +0200
Message-ID: <20260304175735.2660419-4-vladimir.oltean@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: 98f18fd5-6421-46ff-cbf8-08de7a17d8b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|52116014|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: htylMzJ+s1JcrccsEVLX3so82tDAisDGfY2ON6Qv2t0cU4P6B2/+ots18Mk90Rbi+iOVlzshAgXA1ENFgkTfpaBHGAjRXnzlftCMDmMvB6SpJdlewC4YWbZeStXSQZHGD4cnp5ffLpe8Mv58T0a24qZ4Fa5dbmwIT359vmzcGaqa3qNYU0jEceo0BwJTekPvtIQ478ed/we+apvXQKZxE9hbSqfscjbQhuuKQM4WpnOzK5iFhFs8HUT0eLr28osHsgbLgYfg+qlKKCW3RF1bInGVyWBnIIZpRZReZs6LHMEz/NewX3NuML+OuaObn+dj76KJfxSYONRm9bNTFAq+BtOXaOwB75YHz2mAQZzsluc/ixKjJqqL2CbaryMj5shCXxJ41xAvO2iqhDdZuFX9MHtmS3mCsiqGUCJ8EcDdtPuhcrvClFUPo4RmunIU7tdAYx3FzwjgA6RYwiNhsVCEcHuKPolY9Ay5ghyB+gOoQbbThHXt754N5/RZ8SXTs0o2K9hA+dlKTm48iVLcI27viYQid/dIAnN6riL+gVUgw2oZWXR5/wU7MDdVcQ+pAdMuABWhnFgHTX/lK7Hy9e6xAt7j2uJ6YDb7lVhmAOW76f7HanaPj7KnJqDe3Yfxpc8h9dYP8t65RHDahKdmNz1l4OCjA0GKsloIbjDHMpGkNrsUdxvsXXfeL/dPefEGGH97pH5BDSCL9GbClcALys2oifRIo066nejKJLc84/Z9XHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(366016)(1800799024)(10070799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kl+Zb5CBKP6xL5GMmhXgwV5OXJig4DDgsvl52EFtKAO98Nh06CbgY+UBqZTx?=
 =?us-ascii?Q?eLiQif14lLqspksllzu6M4X9lmXbM2ohWL/4Rzc19p8o8N6RJiUqFJDSkJXO?=
 =?us-ascii?Q?ligLxnPygMclOicaR4Rd5ixE8BqUlTec+2YMBm5JnVB0TKCBoDDwcd1n68Cp?=
 =?us-ascii?Q?tF7CMfLuq2eUDJHmqBnvPCSVHf4x+jN2MJTJMokv6X6u5JqM3yt5Q8qyMT85?=
 =?us-ascii?Q?KToRNP+3Ni94bdkoaVDQze7n8Go+Y5W6p4Di626wxa1Jiw7KIhDpGKXP74P+?=
 =?us-ascii?Q?vMQHF+8Gq0cMmncsgg5Lpi+PeuI87+yTfhPpZ4lMw8WGNPiPKysNEBhQVCDt?=
 =?us-ascii?Q?BY3xNAQqvOJdpzHW+cQ9vx1sEiy99swgghhYCE55MMnjNP8IeOR7k8UMIlMQ?=
 =?us-ascii?Q?kBChZXOvtOW9jc0Pmv3gHy2VXj2VN63lIbmd4gukRShrhuRD2DrUNswosSwl?=
 =?us-ascii?Q?DZ8Q5RT5bCcu36SSThmBCbflszKskVRc/k7PgrR44xbQD1uMzv7E0KXUd15W?=
 =?us-ascii?Q?DZoQDNmusjNcyc4cUGEjY41c6mrFCZcOBtI2qRO5ECGg70tbzQd/i2qxKEpi?=
 =?us-ascii?Q?pIZANwM051+/L93whaER0MbsZcJ9FclxTETGMMW0yfJCoUUy9lvZH3OconLY?=
 =?us-ascii?Q?6cKPC/8FAJMA2APu7EkQedvWiGZqJkt5iu7Yx/C6uRsGmRWbCrE3TQ53Vfyi?=
 =?us-ascii?Q?qeFhDn+3oMSlOk+4tP3li+3fhkj73jUYPMdUIwmnR2ykvA+t9unfrdbjcnu/?=
 =?us-ascii?Q?kgbVQst6tbLVffzfdI+yzVRAwqm6ydvFlNM79NLctvn33YnO7V6cKwFKCQl8?=
 =?us-ascii?Q?5R5QRCzgvZa6BsfC4WAznVvLlwICMxjLe5HGsjSFN9M3b+dTRuMQ5QXidl08?=
 =?us-ascii?Q?BqZoTrz1oCI+PE1OQB3oOY4SDhSIU8nq8IC+V3sXNtdu/6jnveZ5jIrSLyI0?=
 =?us-ascii?Q?bp1JnPXr5pqZAPWM+u6oAB7givkD3Ha89fTtWdOYH8dtWIfX2LL4a+rqf0lv?=
 =?us-ascii?Q?GHAG29xVT8swV0JzMezvPKTXnB6cfDDeU7eE1B14YXehfur1DQN4PKM6mH7w?=
 =?us-ascii?Q?TDYFBu/ZYTUWUtKhfLGBDxAiSpXtfNrKaYY7FBM1RsRi5/1gM8fM4nGQGjuR?=
 =?us-ascii?Q?uqHuDG7WJtNKmoWihVDxsqy+SUJp3YejS3HpUGfd8yhZjKn8IzyTDHXurX+C?=
 =?us-ascii?Q?8rTRiSYZpJcFAd8SZe/wbXnFcipBPxqGviSBiJCH1DGJhBOSDlVqgcD7xGMe?=
 =?us-ascii?Q?iClXfmpOx1g+HpQM7oIj2x81bk5KxMu4N/BELOI4ByG/0e/IH+3O7jPLoCZl?=
 =?us-ascii?Q?9pr/EUTbxkAe6L+Hk7bnmRRuXia5Yw0sTOMwkKsTV36T3HpGK9yZbU40uDOk?=
 =?us-ascii?Q?AGMHh90k2iDXJCyX04Ww1ijv0yBUTObi8nyzfXh8kIZBxSvmBWluZAW/8RXq?=
 =?us-ascii?Q?TwklMmkorknZVXlmqDrICwgsqnekyQAtuPoaTcKgSxwLZ4MVwR3QTzKVMHC8?=
 =?us-ascii?Q?+oBSgt4Ac2DlAvOnF6A9NhEVVs/k6/RS8ebLYxL/lLG0DUxHejCiGYOHpk1C?=
 =?us-ascii?Q?4ms1sMzKTl1yKutzYrHHJSnHVO7/r0v8Ni8ml6f2+q3rfPcOthSSZNVmAICW?=
 =?us-ascii?Q?o0PG+jeUgfJzymPHHpoqFOUuRGWYyK7KqurYELRC1h4WaIcfTVaFeRL/DRw/?=
 =?us-ascii?Q?UVYHogKVUddid/AmaLpaGMSU+KZRW28/mLjzkwvvrAisAoJhXPBSo2I66u0d?=
 =?us-ascii?Q?XoNl7zzC5YFROn8g0ob6gEbsnMkJmLABWY4NeUT8AYUBkh1EG5Gu6PR+htIa?=
X-MS-Exchange-AntiSpam-MessageData-1: lv6dG1zXtakhVEam5gnNDqbaoHET1XvzmNM=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f18fd5-6421-46ff-cbf8-08de7a17d8b5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:59:57.3658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CXg+Ya/eQhGeJttUNF0RzadVi/JgIKvMYmuRkFIKBinoaoKkSwiKEiimJuQVqbKIzmG51XsYbBOxGMAL02fxLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8778
X-Mailman-Approved-At: Thu, 05 Mar 2026 08:07:48 +0000
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
X-Rspamd-Queue-Id: C3D7320D2C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,linuxfoundation.org,nxp.com,pengutronix.de,gmail.com,synopsys.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,pengutronix.de:email,linuxfoundation.org:email]
X-Rspamd-Action: no action

The chipidea ci_hdrc_imx driver uses regulator consumer API like
regulator_enable() but does not include <linux/regulator/consumer.h>.

The core USB HCD driver calls invalidate_kernel_vmap_range() and
flush_kernel_vmap_range(), but does not include <linux/highmem.h>.

The DWC3 gadget driver calls:
- device_property_present()
- device_property_count_u8()
- device_property_read_u8_array()
but does not include <linux/property.h>

The dwc3-generic-plat driver uses of_device_get_match_data() but does
not include <linux/of.h>.

In all these cases, the necessary includes were still provided somehow,
directly or indirectly, through <linux/phy/phy.h>. The latter header
wants to drop those includes, so fill in the required headers to avoid
any breakage.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c   | 1 +
 drivers/usb/core/hcd.c               | 1 +
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 drivers/usb/dwc3/gadget.c            | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 56d2ba824a0b..0a21d7cc5f5a 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -17,6 +17,7 @@
 #include <linux/clk.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_qos.h>
+#include <linux/regulator/consumer.h>
 
 #include "ci.h"
 #include "ci_hdrc_imx.h"
diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index dee842ea6931..7a3261f72463 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/bcd.h>
+#include <linux/highmem.h>
 #include <linux/module.h>
 #include <linux/version.h>
 #include <linux/kernel.h>
diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index e846844e0023..2ee1bb9d7199 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/regmap.h>
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 0a688904ce8c..d06171af6870 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -10,6 +10,7 @@
 
 #include <linux/kernel.h>
 #include <linux/delay.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/platform_device.h>
-- 
2.43.0

