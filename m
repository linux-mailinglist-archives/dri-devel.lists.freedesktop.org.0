Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKBpMZmGrWky4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72108230ACE
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222FE10E467;
	Sun,  8 Mar 2026 14:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="j05iBtnw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C3010E12D;
 Sun,  8 Mar 2026 11:43:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8QSA9Va6HGG57sbWv3faffZUWPPw/Xxl+MQTU8ChHvXIv3RedZcf6vsxIaGuyyjIeQ39ED/E9Pluzf4/mI01nbm+div1qghyPIdYJFq8VkE6LO1vV29HoxJ7KQFDMjVZuPXsGfea18RpS+d/P1HeZ4IvxiIog/vrf8PAHDEROqW1wuUDhVRBaMi7u/I/4LzMiRnxCakgo/tJrg7TlCQC+LEY4afTwsJpnGF+tYoda/pnlJpElAbnP19B4groj6Z0S5Nl70uquxWrsCYRZFhqwxNeYmMOfsOpNtWUrEp2NEC9BSVirgTQF2Rqk39bgzjCIZ2yr8b8O5CLbJiSCVbkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnUYqhzEPYye2t4UYR3i7pEhpncG76KqWYQhHIv7pAc=;
 b=w8ngntCMmw9N3jDDHqEYk4Kunk+qnQ3se4sGpTGagKTDcADizMAk6Esfs3Tt5NqdqLiLTsNwvFE1okb1RTu0uI4L9JBMdR9YkRkzfVtO11xsP2u+ufuv1cRDiYnxSe3Nj+40UJzR5bRktiH+TNrFzg9XcWqAVGO7XSUMkaaLwRZPcFlBnQFZIZQJXHKFriT4Kba6EmgCMuNC5FLc6MBE/kYUrf1bvxFMh9NUYVFPhIxhExubS/jjpKWO9ADgOM0wyt5Fs9baLFSaZbXF7WAnBhrTuXWaJGaKwkfmY00Thcv3N2tgMPDsugTptErNc65CON0IMP2i3aw/KhFiWQRd4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnUYqhzEPYye2t4UYR3i7pEhpncG76KqWYQhHIv7pAc=;
 b=j05iBtnwFy7faokJiCFK24nGEll5y93vXOVTT/1k7bo1DhiafN/DDyXrcQZaLypfT7QCRg5PahduLmPZAHN5+7F8OOWx2Ggw8+eHW67zSzHeLIh0O2A1lb6d9+Eb9u/DfIserfjQ3fcO6tklXvp7ZbYaq53mdiiIBAPwS4+/eYuc6Ibp7VrNtXV5Axr+dIukVqJqNziru+HINChRlKpjW5+X23avN0jEPIQVX8v8F4UZYLXWNQGf7TYPHrlJ1f6SdW5eDsbNWhRicipM/NcWzxNLkHIno2ht0lKBGIMKKekOhTwEzYoLRR73BnHNXkq5MdRTLaM+HclTf4wAVQfPuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8211.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Sun, 8 Mar
 2026 11:43:41 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:41 +0000
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
Subject: [PATCH v2 phy-next 23/24] phy: remove temporary provider
 compatibility from consumer header
Date: Sun,  8 Mar 2026 13:40:08 +0200
Message-ID: <20260308114009.2546587-24-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::20) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 8984ae6a-889f-4fd5-9f3d-08de7d07f1f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|19092799006|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: 7R+lPYBd0tu/cjw7n12ebPbOkf7hwdG7bp5739dox7KKRLhbqd/wIhgKLxnq9Xett/1880/QeuqSJz8YJjkZ+mlHmzUEWh24PMInhyyAbSLK3lbzjaSOnT3n8oe4yE5YgadMn/1dhDPJ2nDxi6127+UdDf92uIyGnEwIIVt4nQUN+fvsWTNOtOXV5LyQWS8+udRAzqISIE0YGCkWR13J4tU3awIY/eNNjstNV6XZJLN7wuaEE6MtBiMzZfi5cH0SGcOpgJmTIdhUTtf0BNOdF4yKEvBHumsIVw5I9Qn4b2a351brwAVxcClAzHQxBTNJFlAmllFfugyk8jJWmqSXgK7rgEn3qCM86xR0Kg3dEE5QkdJqH6RNH4eEJ0NS70sYBAgZFKsA8mtf3cPHV1F/rEH5f0xSGMytI4eLTSNaCfLMXR6L3XPVnK05D1bIMZnLRlEw9fw4e4cAkAt3HxvM2eRfchXnW5LRaDeTKtedB4efqYewPJeFi+TcSHPkSjrv29um5KaPPMYZmunTM91fNCwrlctAnF/oTYZqr++/NpThPjCEcLi9eJoBNF/tgAtBNSmiRwhs6fULaNewhbYZ/79OylL2yz3qSqzecalW+ZcQQQQpxnCs+HvUIdCLpWVAYX6QzGxo6mRhRrHZjUGx+7PlvWs/XkbvxDPM7FkJFjhPSDGyL1I8wbODY1Dk+rzXEhuG4E9SM+nRWo+KqJRiLQDowZLV6iVe4KRaRxlO0Ro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(19092799006)(7416014)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KOt8rGx6vgT5hIOsKm/YIaZndyN5AiIdXp5kJkWSdpYn6MqtV5c5sNHNX3Rs?=
 =?us-ascii?Q?0sTaaXEnKZ4p5wdDIUO7tfsK7V+LRqprs2SMo2aOfPOtNYVm7F9tTJFIbIZI?=
 =?us-ascii?Q?BGXc/M/s5dlEMIGPBxwsBtr9JRXNnOhMIhfKlkBZZBOVNUqdpHrVNXuCkGgZ?=
 =?us-ascii?Q?aL+JGxjSRL9Av56q/YeSimPeYbt09nBvjDwiffcb5ZwF4RGQ1c5NH9+Ade3f?=
 =?us-ascii?Q?XARyXOO/1tb7qPcdVFRO4KXPYgncPxQ3bJK1mq7BpNkp5Vqal8mzlj50bk+g?=
 =?us-ascii?Q?xSiFrBvrYpF4ZLYhXSWcGb3g3O167RL6KmwkMwaC72Urkx7dElGEXRAk5EB2?=
 =?us-ascii?Q?8bNCJteXrTIXIszBI6cvANpsa+xq8eYzh0nfTAxmYISZCGq2/jKq8jWUWJld?=
 =?us-ascii?Q?JLFmG4U92KP+mOcmxFzZ2M50r+ls3VaQlYgMWzra2iPlqr4qhzZRjTwmywDm?=
 =?us-ascii?Q?AZGHT0rMy9gjKEd5+6eIMHG7yc0fIWqU9yc0OmM7PBH2rKfBMikaOgXjMo9x?=
 =?us-ascii?Q?cF3YNE1/1oB7POVhMDInl6Yv3ij0oJStqhmzyrqh4JoqJ0E9SKWyuNkrwr5i?=
 =?us-ascii?Q?jVwPhB5BZLKzsuBtHAOL5S7j9+rp1AF0Lok1yHdRmutKYL+91bDSCGeQM6yT?=
 =?us-ascii?Q?bbEJ/Rv3ju66zIEspRL0U9JcQdDhptJ6A8YuQkOMmlbOTBWCizedqRsTwuA1?=
 =?us-ascii?Q?+yLj0E7bn3JxDO0opm1R8nofAX9pAPzePH4PJiCertT4rhmb71s/RGiEmQNd?=
 =?us-ascii?Q?q1Oc63tzs6Hfrf9teJkLzdlUpY4cmxfZ4p1h/1yo86qE9+VEFKOAzQVcRCgP?=
 =?us-ascii?Q?FRPqYF7FwVcFpmZrxU1H7rQEkT3hbZCfS8XbLjKZTdIe8ldvbKK3xRgFlxYW?=
 =?us-ascii?Q?AIhisAGOEg3dhBn/HKRsbUG0ocKX14b+oE2xc8LC+Ha9rZVHoQyuUuulTYlt?=
 =?us-ascii?Q?NHkvEMVQxfks9A8o7LE2TgxOoaXwgQ3eSRWgN6hXhjBIG4pRkHFeNQzSVMsI?=
 =?us-ascii?Q?UionPj6nVXkto17iml4CbeEHLvtCFN6tYxNeZW89Oawa7iyIHSdctC2Ekl8F?=
 =?us-ascii?Q?cmv8NmjgexTHBEC2cBgQyU8USz0MoGnZm9sbJ+rx/f8N1/jy93ZYVJ9+Usb5?=
 =?us-ascii?Q?DSQdTYh/gnaHulwiTWbB4Klbks6X/oKzrJrUIakhcpUHYsfMgzMcjc4V+0Oj?=
 =?us-ascii?Q?j6RsAmaiTWY/h2gTK5a9KG7xmsUfqnKglXYsa0+CWit86W86JVMAHI9rmzoX?=
 =?us-ascii?Q?IGBU0/wE5DFEz3H/7qwyVptxUTWxd2Ipxbcd7b+hcSnj90s+GTWJXWV8gOn9?=
 =?us-ascii?Q?et8rnjgxMiYdx15pzuw6pXl/oWI9/VndiHk8pd6NZKBWBKTEtTv9rNB2kCB1?=
 =?us-ascii?Q?rzR9asP4TaQ19SKRka8tx2M4n0hoHM7KC5kZ30kfBREap+cCapntNIUad1xM?=
 =?us-ascii?Q?z5A6Zkm+PF5BVEzkd5S3SOM6Z+3U/Mgx3kz+Ispqel41lACVBxRPASSBsYUD?=
 =?us-ascii?Q?oVOuaisjLiLut72B+z/sDz8d35TxtyijfDiJwrWoQqFZ16djHEL6AG4JW4sd?=
 =?us-ascii?Q?QxR/HScB8yKkZtPhp9pgjTAPA2DULDcBzvVnAk1Z5gopATDYHyx2YHzPsFe+?=
 =?us-ascii?Q?ffG3adoKWaURoSRYuw+HbPmHe6tYfWAhjYtgORpl31FGj4ZMdsdcxCud/M31?=
 =?us-ascii?Q?0fGecKB9ORibeYCl+Epu5JqFIR3Ochze4Dh0sdR9MluhLfjxByc3o/OW/1Ca?=
 =?us-ascii?Q?daKgSHgZPc9RZECr/HM9tIdpi4bznwODyCgMnJYucvsG86UEQOfPd35EPpAD?=
X-MS-Exchange-AntiSpam-MessageData-1: i0SpM7u1SKnUjAFC4WHUTTK38OGx7kvci3A=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8984ae6a-889f-4fd5-9f3d-08de7d07f1f6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:41.2742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQx3xKCis3AGvAjG851mDeyvJftU9nd8B1D57Do/l9wEeiLA0n+MbwgfgxM5fbND2NpjefEdieJBJbpemQdVDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8211
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
X-Rspamd-Queue-Id: 72108230ACE
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
	NEURAL_HAM(-0.00)[-0.978];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

Now that all consumers have been updated to no longer dereference fields
inside struct phy, we can hide its definition altogether from public view.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
v1->v2: collect tag
---
 include/linux/phy/phy.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 34b656084caf..0fdcefaa3f55 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -12,8 +12,6 @@
 
 #include <linux/phy/phy-props.h>
 
-#include "../../../drivers/phy/phy-provider.h"
-
 struct device;
 struct device_node;
 struct phy;
-- 
2.43.0

