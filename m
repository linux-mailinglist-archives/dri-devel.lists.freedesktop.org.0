Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE9B4AFF8A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 22:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C4110E5EE;
	Wed,  9 Feb 2022 21:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70053.outbound.protection.outlook.com [40.107.7.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E4410E5E0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 21:56:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mel02+VPhLCRpZVKfJ3uH/zinH8fI3ruY7AszZjam/xqGs79OQrw2MOmLNqlsP8NjyGT7YQsozPwTkDaBkwQrws7qM9uMR2GwjZgDUpn9Cp1C4FaZLkMn9P/twNIjhyYL6ENHVy9JuQO4rMruemBvyl/3YzwC1D+9NhL67e/bIPaXQENy3reOO4ZEdYp7qIbUbZGjvTd0H5qIMtn22RDpru116E9AbSWvCKuvgItvd5yawBY9BA6kHQJZmJayBzA9sAcyS8KGnJy+vzOiovHteLDEA73gkz7jm+05my/30RKF9j2Qld3fKMW0vBL4DcN8119oF3meMw1EUIiZbdwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maYIBthui/wiXVu7QZ+ik0rjmMzwVfPApPwcKGj9fFM=;
 b=Kk/BTX6FV1ENIOJpsiM7kWtpubDE3jCG4TxJMnto6gpooqIz9fqfD6OsD2kIGhe0n5eG/EEUahKvgiZEXvk0N1Fm6/SoTXeTogPg6v9m9scBpBIqKz7LkEnFo6KXmqSUeQkbjk6nQqiyrVu1xgvB3VSdAMqjpLY330wZJiZ7o1DWPdlpnQ+PVW0n7qOH/TTM19DbGEtmK6SPXZjsAFqu/HFXS9RPFK4843RyfeX46EFdfYT5c1uEY7/7JwixQJEbbiX1NmZFX4jWPKDPJMrQ7dvznZ0vUPj3u3J3F+hCl5J4NVR5pUS+o8FwEpRLZMUkwoAjbWMXNBk888J51F5Ymw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maYIBthui/wiXVu7QZ+ik0rjmMzwVfPApPwcKGj9fFM=;
 b=lnoDTr5+OQQRPID+rxkYWRGDwLoxoXeM+2PZ8pSHt0OFrlnDgTvfX8dNBJdDPy1sG9S7zlB5qqXYrUWKeaPXDNaJFpWNMiUCW9kzf07m3KrPU+DiLQXJjmOCSoOQmxrGXEm9A7ccD2ZYMOzggN9kEsnuO6i5RutIDezV3AzXElI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com (2603:10a6:3:e1::23)
 by VI1PR08MB4575.eurprd08.prod.outlook.com (2603:10a6:803:eb::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 21:56:11 +0000
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56]) by HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56%3]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 21:56:11 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH v6 5/5] arm64: dts: rockchip: enable the gpu on rk3568-evb1-v10
Date: Wed,  9 Feb 2022 22:55:49 +0100
Message-Id: <20220209215549.94524-6-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209215549.94524-1-michael.riesch@wolfvision.net>
References: <20220209215549.94524-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0197.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::8) To HE1PR0802MB2426.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5732fd5d-8de5-46f5-8747-08d9ec16fc35
X-MS-TrafficTypeDiagnostic: VI1PR08MB4575:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB457563BC741397E91CA2D8A5F22E9@VI1PR08MB4575.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aNjspTOzH+dT/7ElZ/ySJ/XKm+MYxBMw1KL3IF4OMkytRhURNqz8gdWn41V2qKMz2G9KdIrMHEqq5dzksOEkYo+F6/TIRb6oY3kNSIcBNRbLv11NFitiqanaxFo30UEXL63aSe1zBM6R1LkFmcv3r5otDFNLKkF3vqnHT06apLS3AFqXtVFbUKEbVZtplAboafQh7IMfl1CI+GxGLzegnIDF8ld68iqB94tA8K3VBnu0hT3zZGCXAtSrEbhUPurfYsWhaHXiWfRtPfZ79Ouk/FaNIUWzT83Hs9v6dUFsiRc2FlbBw3esqzkiTQfbAgUU44gTKWPr2/AhslsbtB4w4j50JdqNYl80RbUqjb1zfQ4154Kjcx632ii2N+p6bjdBg0lyKxtW9JyWnEkLbCZH9sS++jwfruLlceRQpMzztW+XpvDXNW41ARDbEfZfs+lebBGBccbpsjmHxzTtpjeiw+5Zsw9Lybq/2/ShAaCvSb/MgliXIpoHqhfjgwJl/VJW+VHRRxASXN/Pm6c7mGD2cJqMrRL6dHZlg5LM8bv4Y2ps3dXAuHN0QvVbYN8lVlt0GQcT2mm0tTvqPR/6LKqs0Jaa8XLKwaeMF9GSEplrihYYR9SWSgjE+92ZZRl08jlo2+7ZwTTMi7Lh/JpefDQyKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0802MB2426.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(38100700002)(2906002)(4326008)(508600001)(316002)(54906003)(52116002)(36756003)(6666004)(6506007)(6486002)(2616005)(44832011)(1076003)(86362001)(7416002)(66946007)(66556008)(186003)(4744005)(8676002)(66476007)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T1YckavoAlKkyxtImsZTJkAPNCF8FR8gflCwPSAGftNHedZ3qliLE2d7vrsT?=
 =?us-ascii?Q?zQjECaJifGesmSElpc2Y1J1Puu32g/3CdZSjsHeyG8VZYeUAR2F/PURjkkZU?=
 =?us-ascii?Q?AjckSPu4eKq8U2QG+Ouk1YU3x1tjkkFrMYA03If2Qv/dDT5rSbhZSY7j2qCW?=
 =?us-ascii?Q?iQxZq50XEI1JQ3LOj/ujWZe5bvnGhVuRWuZKMh2y2423mthpobsNOpiqJiLW?=
 =?us-ascii?Q?NJRiARYcbcSEXPX4Gmep9eWwzQXbhWNUL2nhzvuBuHiPsLVFhnKEceSI9wh6?=
 =?us-ascii?Q?JFtrEZTZLSXVEzH19ZMLuSu6ce6j5fDUrKxTUQ67eyPSpnZw8oXkXss6u8AM?=
 =?us-ascii?Q?giN+Izk9llKcJgYptXRsdWm5GkSXEdmlhIc8kqmQStffVfMuicGQukJz7b+g?=
 =?us-ascii?Q?wDQ3sZ5fN4FJ7TIgrF9Qy/Xe0qUnJbCFVFxdBQZxNNYR0E1XFzexEqMXFRg4?=
 =?us-ascii?Q?WDfspxtUr4is6H77pJ5DsgBmrN3GKSnUiO9mz2TSgbf0HH9K1RDq+Hi3TXNZ?=
 =?us-ascii?Q?fsx5yGlyivL1Fh6gzIpZaUDCU6G6Nt2UZs72OXesiDOkHNSi8iQRqZtQompr?=
 =?us-ascii?Q?isidDUqDaQl1sLVWpTKglQ3G7GFcCV0DbPzEsk2gmE5WUdnd82vILWe55rrl?=
 =?us-ascii?Q?k2N4FulNwLR/PHzL8DfjfbddoleMLNlA8rmWLvDu9Y8PkdjQtU5Ml0E37BpB?=
 =?us-ascii?Q?8AvMAOqzdLofmB0F+pMzHxS/EFAJ4qptdZ+brOUHSQoolUwq5T5JSjcfu4pi?=
 =?us-ascii?Q?IL7tJc6BldvAjC9VH28O+3u04mYqsGsiGpCtuoB6bEdpF9TZ3TXKGJHFn+2v?=
 =?us-ascii?Q?4M3sYw3jiP2I2yGv0zolAn2iKSa3C/PHmwnPc48ZZ28mSZtXQOn4dIfhNCOT?=
 =?us-ascii?Q?nhutAdD+9WyCmi5h9WMuaivtVGtmqDW08JTLtFCV7Ekaqlu4pcT8fs/J05m3?=
 =?us-ascii?Q?AHIjtdyWGrcKeK9Lq2rfb4TqHn5sLM8lAYF3lN+5yk8/mOfEqoC4ZTz+l9O5?=
 =?us-ascii?Q?p+uZzR4Xuk48oa2lJIiK45GUwtRmkCYpnJ4OWDURQHexumLiQvnXKRB9BkNg?=
 =?us-ascii?Q?UV18/d6H7HyQvk7ipb+GUwlyaxEnYKkcd0mz3XL5ShyQA8IOHjx2ei9aUMKy?=
 =?us-ascii?Q?q51FKOWDbtaom++yYdH+tKBjq5NhjcVDBk7VMnzNtzc9uTp4Uk531xY/T9OV?=
 =?us-ascii?Q?gLOTZ207KSUIeoJXXzU8E3BzpPedislJMXpsGW1TRmjP5+aFlEMw5lKDpdpN?=
 =?us-ascii?Q?ycPlntp4pt3EjhWrFSnx8KRaE3idryiAX6KnuU8Qh52WTz8bwYVnaW5fBqyD?=
 =?us-ascii?Q?vKd6sRl9+5zWMkFKynTxuYYraeLtOq/QI6sAFNaidDI90UiPnq0JQ7EI6Otz?=
 =?us-ascii?Q?hobRObTaiAxViQ2xyCkZ7CqUll24oRTm+oT1pZpW5JubCNcKQhMTgyVaq3Js?=
 =?us-ascii?Q?jWnQm+IeYWedsxe2fLvL0WqHJfmGsl2bsSNNGDUDyF1ACfgDRIa4EYydszo1?=
 =?us-ascii?Q?ylY8O+3x7eartncmeOmw4FSCwhWhxQKBIlu9CiJnDzcY1czkYrGSc79XIxOL?=
 =?us-ascii?Q?tvM8uX4W63mv9pahjk3xYEmCzPV+NjqmqwVknuTnCrhRHtaM6xE+5QjfdsvH?=
 =?us-ascii?Q?C/RKtC6vq4RTfIX24AS9wNsBcA2pd6mQERED200yoEyiAUJrKroHjePP7E0A?=
 =?us-ascii?Q?sY4OyqMWGrM3ms8nspuJIq+LVOQAX0ssWf1htb3S/bmM7lxc6qggcXws76ZS?=
 =?us-ascii?Q?wWY/9C8ahkw1N+DPFSFXQll9SE/SNmg=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5732fd5d-8de5-46f5-8747-08d9ec16fc35
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0802MB2426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 21:56:11.6469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhAwlU5YOwAfrLHtYv27SsV8NfCbLMPMuc+zR7rtt3hChzzXtNipIOCyaS+VItsubYr3IaEXdtG61pjQi70ms9jflbKmCe58evvDuHJ4cNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4575
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alex Bee <knaerzche@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Liang Chen <cl@rock-chips.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the GPU core on the Rockchip RK3568 EVB1.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
index d8a4f7a9f562..39c495ff0157 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
@@ -140,6 +140,11 @@ &gmac1m1_rgmii_clk
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -462,6 +467,12 @@ &sdmmc0 {
 	status = "okay";
 };
 
+&tsadc {
+	rockchip,hw-tshut-mode = <1>;
+	rockchip,hw-tshut-polarity = <0>;
+	status = "okay";
+};
+
 &uart2 {
 	status = "okay";
 };
-- 
2.30.2

