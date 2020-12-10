Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9142D5557
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214ED6EA3B;
	Thu, 10 Dec 2020 08:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70088.outbound.protection.outlook.com [40.107.7.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26256E3AA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 05:36:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VN4SnHw61aw/KoSeq1OIoYJgHwpnQCAzB6dV8HpvXO5Xg5Bfm1o5mEYVPLK9e/luqTqoQmn0hmcATIS8t28KhbH05nqF3XwOtLDaqnh8kXfl3yiyLyy1M8+ybgz6ZIckyf4o8voAwFifvRjx6hVMVm/hpPGt0/5ve5q/Bm+38bfzKM16t3gtehvPexB/x5chXwGv4IMgcj50ysz9KeEBB3zWWB1DW6imPtyKDX90yFzuI4hgJeiClpwtW1wjm/h/Le/6aMTGMQ/T9I/Jw+xJhzuiPfUKhqyv7Phv93nmKfsUvmLFtvpjvzOI8vuwUnjOCF0Hon7DH2MCA4RiuVLNYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nczCY47a1b5PppQHrCKyH0PQDvnPXJCqSfeNocs7wrk=;
 b=MPSoRzKls0IrYNDqX4L0HtVA00UVu21QY4N9DkJORM+ZsO5sTY82rFVVh0PnqAcsrWAvTuxDGwVbbYvOnL8kVzS0Bx9bMhjpjtajvUIY+Ss7Ot5f5SduJgyupnNgnfZ2R1E0nGsiXuk+Px5Zm/ipxFXMLtV1QPqsWEUxVexeKAEg8I4+rwwqWZ5o3hLmx95fz5kQnUqyLqyXG6S7e0Pz2FD8osA5W9pYgNRn6AsxdvgdtZkQRFTK0u0wZDCx+5/jvtJHccCpaN3BnsjC7iWEizP9EFZwhpQ6Qb0hoYbzUJDP5otA2yUkAwlsNqV9B5N8y1EkEoWoR08Aymbpd+wAgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nczCY47a1b5PppQHrCKyH0PQDvnPXJCqSfeNocs7wrk=;
 b=rpm8L4ZxR8PrsCdZpzCHW3VFW/5El3qQWrxi/EK3MierkxiiwdepZFTlKY+5MSovk3jmDy3fsXUvrbv3AII0aLbVZH0sjx+OtohfEozG/tYJeCNPPo9Dw9Hr0DTIsNHdaJC4Y5DyedL6mICYh1AEvgYwFVsyxR/DUqFE+pzbVTM=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5454.eurprd04.prod.outlook.com (2603:10a6:803:d1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Thu, 10 Dec
 2020 05:36:35 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 05:36:35 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] MAINTAINERS: add maintainer for i.MX8qxp DPU DRM driver
Date: Thu, 10 Dec 2020 13:27:31 +0800
Message-Id: <1607578052-4316-7-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607578052-4316-1-git-send-email-victor.liu@nxp.com>
References: <1607578052-4316-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 05:36:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c7f1f627-c42e-4d93-b839-08d89ccd8f3c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5454:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5454CA86436C11C0A2B2948C98CB0@VI1PR04MB5454.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KbDKmj2YfctlQUaF//DtnzT51HkN32tIUfUAat4j54LDTRFBrjKfryrZYbZv5IhAFRzydsEibLw69PdVapI5kuFmoq4Aio9n2sd0JtIuz/GULUgdmU/p9M5fpr5tteory4+lV2Dn5dVVGRZm4+g0R8Otr+jYU1NczoUzb+1I9lV4DXzTSNPjKFrvnI/PmCfaO+PTwr4yKO8ui8MjaLci+v2lUJEd3nh83X6xWTfjMQc7NspHklhiK47jjnsQx63Xjox6cwyXlS7TPTDoKUl95MmH1gwrn2AOPIRGWaCFMt57rLEQVXaV2bSOclOsJ8wm0MTUi5Zbrbr4LHYPuWKt0GsckzG7jf2wFuqx0akYvy7rrqxeDk3AdMpuTcaPX0wK63K6GE5Jba0WyplNuRqqKGx9b03lC+1AdfipPlGVI2k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(7416002)(6512007)(34490700003)(52116002)(8936002)(8676002)(4744005)(66476007)(66946007)(66556008)(6486002)(508600001)(2906002)(2616005)(69590400008)(956004)(86362001)(4326008)(186003)(5660300002)(6506007)(26005)(36756003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3sKdmLUEPvAOicIBOPD7A5CkLp9hIP7PIz5FF9a/ADM2kHd08e42blovsHfi?=
 =?us-ascii?Q?SZo2BiRYPCJqfwb3mFi7OUfqINeu547CJQb5VcjZr7ELVRybvuxGNWkYU4Z9?=
 =?us-ascii?Q?7CVu1kVzBbOyfGFKBLmHMmBjvn6gt9RuO/B5umFH2RSsveDWsvcinJlsnWNA?=
 =?us-ascii?Q?DL/XIvhlcpD470UZ/Z4P7BABpAHWn9dMdxdd4yI2TlvSNr9RpR6GvlL3HPh6?=
 =?us-ascii?Q?PpMlgYjBBbTwQ4Lji83TB5JaIYTj0K50BEx4XnlgR+/bDnN6kyJ9L4269Z/+?=
 =?us-ascii?Q?5S8u4Ri2PmMABTVAuZsFLOFNcB/9k09/rbHSSMWpOw/Zxkd1Jn3dFK/rNNnM?=
 =?us-ascii?Q?PQJe18uCYwKRERtTAYztb8uNYPfGmmssCDJJKHz+QxHARuwhtYtcwQLIMyE5?=
 =?us-ascii?Q?5L6xcWYsfSw3t8aKgehqICwGBRTvqFH5yIOI5XZnnrCxQ5Z+LDqNwEpPRV2s?=
 =?us-ascii?Q?9Y7tsqCtlDPkrSDeKfTtRmNpUEwKd3SJjY/fok8VIqSV7UFtTkFx+Ep4PgFP?=
 =?us-ascii?Q?ZcKja4J9f9WSOcwcSGmbwZcd2ASYRt2lsTKgIz3By8SnN9NYLU0jl47Scz43?=
 =?us-ascii?Q?jSCqnFSoQyzVRHHkVBGV8bWdOHW407Hdynjlims+rR7F9y7lzUQry+hJLCD+?=
 =?us-ascii?Q?ACpAVKsJEAzPMqeUFAjF9Lm+tycOrvY9BX3WHpQKeBgQ80bhzS49z0i5rPXv?=
 =?us-ascii?Q?NvqVlZoPSh9f+73I7g9HdKPcgW8Mq4qIz8p/poJZsVtysjg8vPRpT5l0kesl?=
 =?us-ascii?Q?jWsmxc3vjmKImLLJN3nKxR5aNhPXkA9Aw6heqXKIx/XVkqqrJlmv7B0wTLnL?=
 =?us-ascii?Q?DiTG1qQrhrC3syoop4psD7ACPpjH/Ojlx+qogFaSv9z0HiORV0YmOyT7Jv+y?=
 =?us-ascii?Q?UoOjuZMbfICheYBd7E1bYMEpOSqhtYpTST+mYTslEuicvEoEZ1XC+HyQ2UwK?=
 =?us-ascii?Q?GwWzkinHSA6ukUGI5tsUqmxT4V6rSpfBM84ZbSQInY7kKDwumDA0Y0NRUzaa?=
 =?us-ascii?Q?nap2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 05:36:35.6795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f1f627-c42e-4d93-b839-08d89ccd8f3c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvgAYBjDv8Xz0+5nZ7EzzVvLI1kIkFUnnIYLCKOAfBIn0uCc7mbdpxRGS8H6fHvvNL9leO3hklTg+2gM5rCoaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5454
X-Mailman-Approved-At: Thu, 10 Dec 2020 08:25:40 +0000
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of the i.MX8qxp DPU DRM driver.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 970d9ce..dee4586 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5834,6 +5834,15 @@ F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/
 F:	drivers/gpu/ipu-v3/
 
+DRM DRIVERS FOR FREESCALE i.MX8QXP
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
+F:	drivers/gpu/drm/imx/dpu/
+
 DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and derivative chipsets)
 M:	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
