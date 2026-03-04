Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHCJJO85qWnf3AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F6220D2A7
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1786B10EB56;
	Thu,  5 Mar 2026 08:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cpoBchoO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012014.outbound.protection.outlook.com [52.101.66.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972DF10EA87;
 Wed,  4 Mar 2026 18:00:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YiFpFqoMQP2fsywvk16eeFyvJ+jH50WVCtFVSdHEOEWHnGEMbNavDzIk9kwzg9PiAb9BI41gzuzUwORfDtK+afMtYz3OuRlxLWPR4vOybuPtQgQT6rYYuNi6x0BmihUuljbpkIu1OYXs2I7HkzYuMjgQNEJTNy9v+iojaog2AauyZruq6wce3dj/giep78LBi0wpeHEE3J5UA1CLkLHgYUzHIrEwGNpoiBo1/GZBeFJXFEFwyvShNJevEvz6Ugi3pYBraNeFlLlucrbZmYSuE+k/L6ooRWr7rh3+1fYBFJHt4qYYqibmRqyJH89HdQ1U0ibtCZawidpPFUEOPd5oaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqQUrtrZTC0ygWfQOLaDpWEJF8XTSw9Y53P6yqIpAPI=;
 b=L1spV7idAJB8Bt1ptFrNtC9XlS4bYzNM1AwHaxeA25VYcs86zADUbeS/9BKIM3rZtoDvygdKqfZx+x7+jAtQCjyx/1qMBz6t0uBDTwiyr0Ws84TWbfZBgzkZzVPpBthRbC2jWlQeobugKRlpIbBtSix9DJ12Zke/yAvNTgYvn8doVEAn4B5+pa7TUHTfs5jUeaRZyN0zRlkAbI0zaFke8K8A25Bd/4/mC7QdvmnTHIoHToT51M0yCmJolpTyoiQAf2+b+uP6R2vyBRfkNh8ucTCO0cqvqmiD79J158mpDtHO6w2WMexeO5sy/+0h4Xys3ZDZdhFy5YxQY8OSds1PRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqQUrtrZTC0ygWfQOLaDpWEJF8XTSw9Y53P6yqIpAPI=;
 b=cpoBchoOx9yhOzPV2rDKGpbrkIGEqKdj0gilU1hYDq5Lh9qo7emWmyYwlaCmfCBX6cOOstgVDc6m8363n2ledHTtIdnZf7zrPZq0wcGJefd3w/K8EWUd5IE5LEBFV+t/7aFu4Q8wl+jRKGcEGXv5SoKz/uU/HOe1vgSPv/GUkMDuxKAEjZLpB/zlZA1uGf94YJsbFaqpdvkOvNBICTLGB8LzbKxAuS+1ZUtNXkIvMc2tdzte20UGdsfMw9IKq0qCMiaCFnMQAUiuefhUGFJsVxAVIrD0ln3g89RGgmTDQf4sG3mjoGZgpND2FVtoWbhzAmA0YyIQwQ9ve+8ue5IjRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 18:00:40 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:00:39 +0000
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
Subject: [PATCH phy-next 21/22] phy: remove temporary provider compatibility
 from consumer header
Date: Wed,  4 Mar 2026 19:57:34 +0200
Message-ID: <20260304175735.2660419-22-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9efb8564-6e60-4159-194e-08de7a17f1db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|10070799003|19092799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: SscV65/hhuYy3Hig9sv6qQebPSL9EZk+1yJ3qsmolIDB8VKAXoeJxnlKwo346kJplztSzaCpiQExPmNPC1Xvs414+WLhy9RKaA2Bo3HIfPazBWZw2RyIq+L8hqI7IVgO5DR1t/50lbJmefP++lpok4dZdmP/0LfRQabWCmD5Xo+qcOUdpvZPdWXx8FCoCy4gLT3moeMgz5ATf0rtp7CX7FEZ21Tug2otnaNPNUHdiVqT1vU5UH+TOyG3Fv5XSzGAbaQ9OQlb2Mvu6cvIUSck3lQUS/yTcRTwHllMHDUgXRL+/qnYm6liH+f9sS5AZCwX/kD183/0jttn35S97VIf5/mppS5eE7bb+Sdn8jsqpKKr/9pCDhNq1WPABbGrwWseKoPhqZDnpdmrZdnGaQzxRz40Shxb43CKKReTg27MJ/Zn7G9QUovsrSAN7fsX2JSL3PSguovm+iHmxswDhziFNJ4OVlXlXgAVrFXexrRweOUhH+Up+Nmq9S9uHy751zQa9edHimWJlUGeZKfIt1Z3NsS6tC8v1vBP4EFImvfhfERARMdU8UI1zvpMWzC3B6sz9Xq30ttsPbAaan97HBf55Cq1H37RUZD10VCA/F7xEKZZLVGc8v5GyldJ9vFNxJSkfcU3wvJDgzSFg6+gUcuJHbJwXFi6yGOuHqYGR9SS4f+9efvwylXcVu7JEmpq7/gAIhTraqEWTwiM7elQgPq1snPndjEGBYl/BkxVvFS2jng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(10070799003)(19092799006)(1800799024)(366016);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2M3TXaaRoSFYjobS6RAcR876BR166dKZRtWAsPfEUHPZRrvKkQ8xyly0DprR?=
 =?us-ascii?Q?sJq5K1fng3MjX1okCkML29kLfq87dGL2/Zz6TadlX25nntIq4z3VFIEaCjsA?=
 =?us-ascii?Q?mAHQkbm7QHRiwCCsYPtGJl3K3k6lcDCEQJxaRDevibkNFKsQ9y1Xg6Mzog+G?=
 =?us-ascii?Q?wQQF1I3iOV5eE6SyTGNX6pT/CnF2bI2dxIcLYDvfe5uVqOJ8MJdTYYYugZh/?=
 =?us-ascii?Q?OIcT7D1DJk1Td/3Lp4JzZiJRpfnEXZj1sR3D2wxvBrAuCWtDKKyco6Pfltzj?=
 =?us-ascii?Q?hAxzy/dQAszfFM2ZoguHTaz/XPDqK6QLXlc6xDrUhw+7Tn//uSIbxPcsMvU/?=
 =?us-ascii?Q?4yLhyf0AtnS85DPR8DBVPDg+Uf+ZvmCKhIjWENGxRUbyH1e2cbCQq/chPwXX?=
 =?us-ascii?Q?JtM/Tbo06YE/kmIq5L3E3eyKyofZg5urUypVok6+tpDvJ0fSusIKcrQs7dLa?=
 =?us-ascii?Q?0AftwzfcUNEd7QqfxMvUFsI7GtMGkxgfB/xAEzqSqa9fT8WKKNOsktnYG4ve?=
 =?us-ascii?Q?5M8QRLfUS72usbW8MTODonMOZnZdP803JuWEvQGbRjynLJaM9ws7Q0VbPGPb?=
 =?us-ascii?Q?GmRzMtbU+5YZ+58cCQcAfoZOzfZGZdsn99rV681gdw+rDvWtF/lVHiUJ1sJL?=
 =?us-ascii?Q?DpaPGEOict+Mze3EOPRxAImyqo9DxX+z8uKhySkKw0tkiV5+n+FpMaZuu+Wm?=
 =?us-ascii?Q?7qdaeA9Y7qpZRCs3P7ypRNY12OrUkiKN4HfMVH5rcpw3y/gwPWHbioAuY5Bo?=
 =?us-ascii?Q?XnPpVqFH+wDRZ7KnNcsY7087fJh6NRqJO0P1f5kX6TaVPMIs0Aj5MnhO6QR/?=
 =?us-ascii?Q?idm3EA2xuPYigkiy3f0BRPWrtT43hqnjtneCmwV67VpI02WtH9d/nOR4gjh1?=
 =?us-ascii?Q?sccYVA+Pw6OpStITPFD8hlisnKx8CtekrraCvY2aknBlvGBgHI2sHOH8Y7Ia?=
 =?us-ascii?Q?7a8iIDTHBHI7KFiMtbPbz5g47hgudOHpmXKvMr4HkrS3M7NAGyB2U0+thiDV?=
 =?us-ascii?Q?PRgudSm8pWr1syROBnU61flUwYIAVrIeZlf6mPJEh4whWdSZxJFLp/BpIpl8?=
 =?us-ascii?Q?qd0wFD2jm5KYLa3Yt9omhxQwx7DXD/BkNuVljYbTVAA/j6aB+h6f7aSR3fen?=
 =?us-ascii?Q?BvTohLM2tIc8LHYx5AF3yoJrnZ7igpiU6TBulWSs8UFdWlJMYLkxmSqA3CgZ?=
 =?us-ascii?Q?3OTifbnOOgTixgEZ7CyQTsOUol2C+nD+QF+LxU0DLQXiSbbhZnGpPk9zrjVd?=
 =?us-ascii?Q?X5cd3/2WGCCr3HTny3V7hIuKPTDHtwtflsXTaXD9JoW7xFlxv9HHs24OFCiO?=
 =?us-ascii?Q?cFN0zVEEVHM+ooKCcbXQqaOZX1ej982d/mxv149k0VQ+cF9udti5d43rGZ/E?=
 =?us-ascii?Q?FkLo1JhValDLOQnnsEGlxr6CtKCmbj1q/hlyp/dJFDy0i/kWNzgsQLkDZz8N?=
 =?us-ascii?Q?BUUjg8CylPko22VsAIMsScL2peQgBgx2K/xU0tKIND2rHx2XF7+jPrvtUQ1K?=
 =?us-ascii?Q?VrWgJy/6HaHv8R5r8Eot7MqAC/Ux1lon1ZZQmk8cE9dTU/uf+HJ58mIZCoeZ?=
 =?us-ascii?Q?yJ0xBIIypnDzbFCTX7vR4UmHGYlteXco6oCfp66j2cUT9vLOZTIxTg+sVrPm?=
 =?us-ascii?Q?fqy9lTAQHtK76A6aUsZNCQ8lzK6OEmLsijoN/0ewos14I6/LOE43JfngIFht?=
 =?us-ascii?Q?fz9Sz20m7SBpU/gIJdbg3yPNYJzSPByg/FyfUO/v8f+lDHF9BFM4PJXxDvEk?=
 =?us-ascii?Q?3WfvexXY0Y5+QCvJ/2vqH015q0mdTzARRn0YVmFOI7RnGtPo1x8LTW1c5FUt?=
X-MS-Exchange-AntiSpam-MessageData-1: RyDakNj5bNfasCRE4/cdSLR+bG88WjyAwYU=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efb8564-6e60-4159-194e-08de7a17f1db
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:00:39.8011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBAL+uObMhR8iD4CjWafkPMFvQtbqFerC6dUnk3IqSDuMauKwMzUMx/s/RB+gsrWtoThqr0S4eOwQfV8lZalBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275
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
X-Rspamd-Queue-Id: 43F6220D2A7
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Now that all consumers have been updated to no longer dereference fields
inside struct phy, we can hide its definition altogether from public view.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 include/linux/phy/phy.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index af9c3e795786..f11ffbbfea2c 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -12,8 +12,6 @@
 
 #include <linux/phy/phy-props.h>
 
-#include "../../drivers/phy/phy-provider.h"
-
 struct device;
 struct device_node;
 struct phy;
-- 
2.43.0

