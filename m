Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJx6AwE6qWkd3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B082420D33D
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D485A10EB68;
	Thu,  5 Mar 2026 08:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cJqDHM8g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013021.outbound.protection.outlook.com
 [40.107.162.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEEC10EA85;
 Wed,  4 Mar 2026 17:59:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eh9o8Ax5gwgAAA4QfsTmyMbH22KSLZUUl97SPbtKA6+dv1ohdIo0rE1iIngQt5GYZ4iHH/Na+1TEnWsvfkTSkuRbVtxr3xS3K0h0rchDalfDQfwFCfQwQwTkc1T45PuBo5fCv8KJtrEdEmyRjWaruSaA5bQKNWiNk8bsrD5CTRmmv8TEbtPJMlzqQmGZ60CBko/D0CWIRZUwCi+9vY23sNYdI6RtIVrHwxp+f5pN6znug+pYc9QiwlBnUOnYxPfgXDWqlg7G3DE9o/UEZ8BfzRYL3xF36rz9Z8VG6FfDLooaFOYqh2qEC/KTsHOOv/U0d6C0xA5PyBUnoBvHMF13Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4JQ/bII+MvgEezVtqKdJAly6M8oIo8qsWEW6EZQTuc=;
 b=jsJUkLoW0G3Ist1zyaQ5VhNSpRa8TA8ihDmTCqZ9Zsyw93EvTYgZ8k1BEm0cniFN5G/dawisJdbee/Z1YzgUh9k0UEK0njN9TeAzJFXY2Vw+rA0nzIfpNvE6nFpD8RXDTfkHETvwzYZntWmg53wkyeRzvcGjRi2xhKZURD0IPYzUoByFPkNyOQz91XhicHbqKtqwsp5p54k9lKdsfG9pZOjXi0kK/k68gQjmeInOPd6xb+BilMBvijoD1/VaNhMCEmcNeXLrWo8lGcC6BnNESkgoJ87/TDDVtGCF6eyDGmzpoeso+jULvEcurYugMDq48LMpTDAF7h1gMIILAzTd+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4JQ/bII+MvgEezVtqKdJAly6M8oIo8qsWEW6EZQTuc=;
 b=cJqDHM8gkHh6AKdymHl15hlOQj0sVk37T6SxNwLHcRUB5/C10WYfmlmJX9z27qWRYkyJPXQZBJHeXqE/EtJucw15FlIGGAamxHIMadAXYibYuuADkq2hDKqDhQEJOGszVA9DGKkjYo76zYWGQTYmiYgPy+ootvzptq2rQArkzXIk+T0HaVFaQeZ5n9YjvQly6X5eCWJX+c6/tSGJ4ZXbJqnaDFEgCPRX14L2q4FYcQUlAT4NMhIRzUxTTL4sq9aHXR8lieS65zSh3d9Xfu+cjeAg79ZOQoEfJiWG4Fxc+NMzStNYznbmFTz3O2/kmTMiw7AMJQVZmXDi3pLE+fdH5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8778.eurprd04.prod.outlook.com (2603:10a6:20b:409::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 17:59:53 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 17:59:53 +0000
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
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>
Subject: [PATCH phy-next 01/22] ata: add <linux/pm_runtime.h> where missing
Date: Wed,  4 Mar 2026 19:57:14 +0200
Message-ID: <20260304175735.2660419-2-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f4c3b229-4756-4d63-628a-08de7a17d629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|52116014|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: KjgH9F4RKGrzJMwDWFwXCfVbul+ILGB1iW3tXewH5XnhrR9GcEAB4yQzHm/lh+x0NS7aKafythMCJVYr2WQrmvYNkAOmWyRAfM2JnwZDkvXPZd3SN+mJIXtVAGugkpMcHcRrQ8ZcBdJS4adY+2SHeZvMcsXTqC1Cz3kVUg1uEol6OBUXPFpSUNMxmMggUmUR2yDceKx2NsphORlmSjunsNS+oXPHudryoa3twSbOZvv+0WjuxbCeBc5tZkuKH2Pc17epQmWT81qmunnpsLCf25IbGXGLABefEhb+EJds8sp1+dY3rb5aGfXic0bnpyP9ceucGld9yKmaX+29kNuz/VmsznAopeVGin2ERwEYt+ymMdInxeTfI8+jf7lohqOfYWhCbcSSYnTmtwAbKl5GUncQKL187A5KEhNTj8XeQVLoMmS037xzqokj5g/ygRWFf4POw3KkiQT4ImAcS3dcH8uJrbd1UdFPnOKv5Ygv9G3i3HpVptVIqLol8D7WD/OJ5uzyS1YMtInhdVZ8XixPsT6eAk9mnBNs9CcXLf57e8xb9QmGC4Tl6QECDl0mb2Mne0UK/TAbWzIyZSWAPrGyJWcyRG8m9RqsWg3b0kKn11ruH4sV8kfvq6o/dTwQPeFeRrKCG2AXEWpX/f4xCfwiVhQYYdeYO/RTrit+YWYv3aaPtNvkTLOks5IekhDGRLpHJKXE3FtCJYjiBowNSyRkvSTj1Beej8UEBnxNyrwJMn8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(366016)(1800799024)(10070799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PMUBawlHTNAC/3xBbE/zFISgGNLHtdZVv4rh9A5moFleu0Eqg9BpkQUvgJXk?=
 =?us-ascii?Q?o+IELdXQiE+4J+ky+iIzMbIqg6ck1kNMutg/c58AscsOjybi7sX+YTbc2LeC?=
 =?us-ascii?Q?kO2RpCPEytVMZ/KuUACeQcI5gkuFCNReLJ6IsbHfGbVsjgOFc9A+u5P+AGI8?=
 =?us-ascii?Q?r5MmRuRayQ5dUmJXZzaYdjKMpdrlSHed5iyUb+gUSfyRmX8ZvHIS15M6Pykr?=
 =?us-ascii?Q?IO9WPXn9XklcMbxtXN7hjdPdP0XGKruwW7wTFYwysbGcpZ0LHZT40rRGe7FF?=
 =?us-ascii?Q?rE5GDhpAa1tc6L0rbHmzry2eaR2bV5iTptpZpTOXN2nMkds8LZjuMn6WLXtt?=
 =?us-ascii?Q?W9z6tCC8GhJi6hpYSTm14EzHAiXRt12SF7mSidKYOKsyeFGUtpuUAgpN+cSB?=
 =?us-ascii?Q?vvpSO6WQHmegV1B6AeCVsi3FXyoSZ5U6dskhTtp6OIW45Xk6nfiDad5COMEF?=
 =?us-ascii?Q?3UtPUUjnCERQJMHv8WdBadtsD+aUBEwKOCcp8+hoCtpcOESyajn0ZPw/mSG/?=
 =?us-ascii?Q?ajAzg4sfDZeXPz1srzHR3dWuOa4iCCUlWjBmE50Y3QomV6vw8hK5sByH10wD?=
 =?us-ascii?Q?yYizx2x7/Q1K2Gr4cHUBb/VqU5rJaehoYobzYpmMIyB0eOrRlbXHLvC6NPno?=
 =?us-ascii?Q?9R5RSXHVtrrDTlcJetFfJ9kunlsL+PtQnQuYKkjOgJr0QsBc0r+GMqRjNE7g?=
 =?us-ascii?Q?PSDOKf19721GIK3YHahLbRnCdvY9c3YDIT61Ltxg+mZP0adOMC0sOPRp16Yd?=
 =?us-ascii?Q?gmqHuMhFUQQCz1DNIK++K8X6DDf6ZAYdHzMqUkOgZ2DzdZxVuG9ndzhUF1fx?=
 =?us-ascii?Q?HKlRfGmmYi83hPgA/MBSACphIcRWWxdQrG/QfzChFbswPeCh1ktIbUs/Bjp8?=
 =?us-ascii?Q?C5GGHZqbFgnvnP6Ko1VfYlfnQ8KvPw0OfrIUqqyH/xypghyQS7HXCZv/IOzz?=
 =?us-ascii?Q?LWDW2tMGbb7dgCmLXl+tVUNIsuXgyPHoQInZuyXWgOGmE8iiBUCbbfxVrEne?=
 =?us-ascii?Q?i4Hf3MXTdt47Al8S9oBv5UX5sEF7EH+b2SrDKRLRF4Ne7vsd9WSp5VRX9sFn?=
 =?us-ascii?Q?whCCiveenDyDlI3mC8RSYstLIhvlds7kjYI9r1cF/DFHFQrYBLnn6V4Ev0kJ?=
 =?us-ascii?Q?pbErQUwgjL5kfvw/kR2I19Trpxc9IhFLomvR14plJ82XNUAMuSbKiX4qbJNA?=
 =?us-ascii?Q?ZqjU9UYkWrS2e0ZA1jwEEdfilW2RWk+73nEfJsuoLL3eRzh9Lrqm9OZ+I0Im?=
 =?us-ascii?Q?nd1Wr45YRiXLg2xk99qvq033sFjqqSXt6t+LbhB0KQLvFRsGaDgypL1cK4SU?=
 =?us-ascii?Q?ACNs0240xDmMTIW3LvH4HtegXlFvLASl0XE2S12GdI2nkRski6Zu1H/gevos?=
 =?us-ascii?Q?aeWHo+IApH8Lb4d1jGFZtZTz9alRS7NC+8uwbe+YzZaAk/ghOuvVEBkpa56I?=
 =?us-ascii?Q?q16wMutFo/U7YZWgpq+xa8CBjpP6um10/wcGmNACwE1Vi0OxvmwLlyGoygFJ?=
 =?us-ascii?Q?6DXWFmPYMq2QBGzGGUVMpRuiSJ7w/Ir+ClJvW0Tehuh/RckPox4JhaSuAOc8?=
 =?us-ascii?Q?xzdDTu/rhJNyNkHvtG38C/7HzMFWoDp60ZRwstjSTTnJ23UJNqLYKLVH+H1A?=
 =?us-ascii?Q?P0YOjIa8MKA+6FQusPS3X6eo1o0bQNqIeE0jMSvvY9iK+VsBzdMiP9XLDas7?=
 =?us-ascii?Q?S7Y8g2vswVL95WhIQ5nx+HO5yhKMMdefVA3Z7uCp1rJ9kjnBZgPY3nBMpUKU?=
 =?us-ascii?Q?c72iyzyBvqbTZOsieK4LhxzuQzBgNq/y1L6kPAVHorUSF7rHotZ6JZb51Jvm?=
X-MS-Exchange-AntiSpam-MessageData-1: 9aHoSPXB1S7V9A2H1kliwV7ETBg39rsUKms=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c3b229-4756-4d63-628a-08de7a17d629
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:59:53.1166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4z1xmuOCObrSvaoxNu2cEXDTfbztWiRvwYNA1Z0/9WTrLNwnkRAt/oUqobA6yuc9wgUAAOZSwEzt0XrgVr2REg==
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
X-Rspamd-Queue-Id: B082420D33D
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
	RCPT_COUNT_TWELVE(0.00)[25];
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

It appears that libahci.c, ahci.c as well as the ahci_brcm, ahci_ceva
and ahci_qoriq drivers are using runtime PM operations without including
<linux/pm_runtime.h>. This header is somehow being indirectly provided
by <linux/phy/phy.h>, which would like to drop it (none of the functions
it exports need it).

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Damien Le Moal <dlemoal@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>
---
 drivers/ata/ahci.c       | 1 +
 drivers/ata/ahci_brcm.c  | 1 +
 drivers/ata/ahci_ceva.c  | 1 +
 drivers/ata/ahci_qoriq.c | 1 +
 drivers/ata/libahci.c    | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index 931d0081169b..aa3c4949c4ab 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -26,6 +26,7 @@
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/gfp.h>
+#include <linux/pm_runtime.h>
 #include <scsi/scsi_host.h>
 #include <scsi/scsi_cmnd.h>
 #include <linux/libata.h>
diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
index 29be74fedcf0..48460e515722 100644
--- a/drivers/ata/ahci_brcm.c
+++ b/drivers/ata/ahci_brcm.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/string.h>
 
diff --git a/drivers/ata/ahci_ceva.c b/drivers/ata/ahci_ceva.c
index 2d6a08c23d6a..3938bf378341 100644
--- a/drivers/ata/ahci_ceva.c
+++ b/drivers/ata/ahci_ceva.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include "ahci.h"
 
diff --git a/drivers/ata/ahci_qoriq.c b/drivers/ata/ahci_qoriq.c
index 0dec1a17e5b1..409152bfefb6 100644
--- a/drivers/ata/ahci_qoriq.c
+++ b/drivers/ata/ahci_qoriq.c
@@ -14,6 +14,7 @@
 #include <linux/device.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/libata.h>
 #include "ahci.h"
 
diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index c79abdfcd7a9..e0de4703a4f2 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -30,6 +30,7 @@
 #include <scsi/scsi_cmnd.h>
 #include <linux/libata.h>
 #include <linux/pci.h>
+#include <linux/pm_runtime.h>
 #include "ahci.h"
 #include "libata.h"
 
-- 
2.43.0

