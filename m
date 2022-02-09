Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1430B4AED20
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB71C10E60A;
	Wed,  9 Feb 2022 08:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DFF10E5F8
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 08:51:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWl3glTaL30g3Gv+wqmPSkzBc7hvkJdQydikKW1qa6kn1qmWGCM9l23jFSz87elJELLvLnHzrTEGafsNRcF38WFWM3v5ejtqiQlizKeB0WufbZyB+ON/CxZz8+ymybEqGCmJA1xm5y+TkeJD5QU2X4I431P2r6qvA3fs3s1FH423S0yKpCMRVZOhQaRGJgwK5vJLcMRzFxxYf5Jpln3/+QAHXICMV59I4WZtVl1bYLfm//AbjgQVaPgUJ30PxfQJ0i/ZihwjwhKMKxBu+zYEo9H65C/KUyFH5rqChNvMQvZoYVUH71XvvSvDpwL/FkdXC/r6zgGSUCzKpXGKFUKBiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXhbRDQGkISr6kHJqbllfTp+stN+je4oakh0iU0AGdo=;
 b=QqJ6hVM8iovev17HnBn3GJTuRhUtbIOG7yZRqqeTv7/DOu5s1g9rAdmNYKon7Nu8rivkvLELAU4EG9K5d8JroohHxY35ELP6PuV7GTlKwy7xiLvfEHIMQVflJui1ulcg881RMvPnpd5ZbtFUzziZ5Xf0EoYzuSwOT1DY7elhaWjXxcnsmwyVk7oNoPk8wZjc2hcPug0eudJ33RN7sqsDbemZy6syuhSsmg3lo/NgwiK6CrGfps7j5rRGbqyFKRnvwLtseZlKryG7rkVBDC68uUNwXOo9MkK8eKMFDVCYxOWgEXbJFLtHRJzHw8xuPxEljHeUwVix/kJdchg/AcVKnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXhbRDQGkISr6kHJqbllfTp+stN+je4oakh0iU0AGdo=;
 b=BPOrIDNQhgGthHuShIH2GKHBGlxDjQezXLmdvkqE07Yx1V56BenlA2EIlhP3v1vVbs0l8x5bTkd91lIs6fWjGAuKZkz8+qdVc3RI1WwvVNTNTAiUMDpDq7N0NXQI6w8N4ymznr7Ro9cq1EI+2F8aPWby/zGvkEGCXrIRyUUJbZg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com (2603:10a6:3:e1::23)
 by VI1PR08MB2927.eurprd08.prod.outlook.com (2603:10a6:802:21::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 08:51:30 +0000
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56]) by HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56%3]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 08:51:30 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH v5 4/5] arm64: dts: rockchip: enable the gpu on quartz64-a
Date: Wed,  9 Feb 2022 09:51:09 +0100
Message-Id: <20220209085110.3588035-5-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209085110.3588035-1-michael.riesch@wolfvision.net>
References: <20220209085110.3588035-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0072.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::23) To HE1PR0802MB2426.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77fac23d-a810-4d4e-4b28-08d9eba95d8f
X-MS-TrafficTypeDiagnostic: VI1PR08MB2927:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB292721893AEFF190328A77ABF22E9@VI1PR08MB2927.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ORY1qBZfuBjqaWJsC5TJcudOS50/5IXAHKvpoJYRRsW6xMcEmjdgREI4PnqyhRgszqngzHNrSuibNyHtGdkU8iy03n6MeuxHh2TjCAp0SV9w4vFj506Ulu+J/PatcnZnJwrEoeUhRXTOGYqf/yi0DFGRPgQagBe2+eIx5A8Yp8w0GOqsaQJ+9zKnp87tuexoXRPNW1C8ymBSI259XyEmz/v2/J3On3xn5kmVtQA0hNjw9IhqorFkaxyivN2uSoddCHTcrdMg14b9bTeftaQ7n0YYEWrrg8U+65nSwvAtQjrNKgoKvVbqpqnCBKHkFnaTQtZJXvU5HuVB32JAo5n0OHmdVnyQkebIEmzDbPW1cFn9/NgeQMueXBZKjuCPeI1Zo3qa/t41zw+XXlZqLPDHO8Yp8CkBoXBEOlJFLvlzJTaCkS0bM7muvWHz2ntVTCjjI/6xMke5oAFC6jvXHhg+uMGZdzTQ6ejnGeeNMBlzSn0+TLU7X1CdFq0Tc2RHXOP2EjDFS5XanlHnf0c/R3QccwzTD2HwchPaNrwOcIUeANMGOUkB9gfDd8N+KByPwIXbKkKx5yxj+e2u/ORmm7JQ8w6RX1Ss8CcWiGMITF4E+xHOCIZTN3k7wHzF8VjHIwiT3Ur+jwfxiNiQ7dGEcTtbyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0802MB2426.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(66556008)(186003)(4326008)(316002)(66476007)(36756003)(6666004)(4744005)(44832011)(8676002)(66946007)(7416002)(5660300002)(52116002)(6506007)(86362001)(2616005)(1076003)(8936002)(6486002)(508600001)(38100700002)(2906002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Af7GTf2H2+6lhABbMgIrecqXB1VtolBQCkmjUi8GOV9R02mHlNb6nPrQ2aRL?=
 =?us-ascii?Q?JiiA6fvdOvtJxlyZTExcD8ELFF7sL9EEjikqHQquMMbvz99ClmoesdzAd82/?=
 =?us-ascii?Q?VIicbS++hZFsx/sz6JA5guJTPCzxyBEu9HAfzSxrX3GJEWmHIPQ/8jTPFzKa?=
 =?us-ascii?Q?AE7cdmSwXCqutrCFdvPYhivh81KuPHT7dW0c8eTscOUD8pWeZL8VFtUf5Nf8?=
 =?us-ascii?Q?1F3D+5vz7IL6dlmD0W/tgMCycYkBwFEQk48Ul/dvCdsPSaX/BHkWmIhg0Odr?=
 =?us-ascii?Q?+3tOITL/LguiEuG1PXznz4AQM+1UyensxD5x9CcAw6bbL+z6MlsUqoQk5pxf?=
 =?us-ascii?Q?C1/zTF+iZvUgWScyBct7l2GDY7KlC1ty1hfwPSGxyapm0HNnTk80rIh9eJ0V?=
 =?us-ascii?Q?TFQIwIdeyQOtWDxELKBPZG9cd5U2wCBdqm3xKV1P5GNDz0OACGHWMpcwY98h?=
 =?us-ascii?Q?vsiHdaqnb7u08k6WawypQgluuAoaf+i2vqrraIQK9PkFgl2hgVUKBbUnNJ8I?=
 =?us-ascii?Q?zjdY70md1OqCbOGjg+CHLkl2P4IC9igpnb+jo2JsDtGqVMkmDcEi4M6dLvlg?=
 =?us-ascii?Q?kgCdkvXd89Uhdvb+3PyEcNb4nQXFhG0locH3WEprQq3JffJ0O4xRxFzlXoKN?=
 =?us-ascii?Q?66bIpuXM/QkEDmthHWwNyMwpQEOVCyA/olApELI1Ta3MWaFAypUhd9FCX+M/?=
 =?us-ascii?Q?eqa5yvGZDPRqC4kfDhAqX9688x6mpESbiRJWIzAzzSeE6aXUI/QhugSjACR3?=
 =?us-ascii?Q?AoLIKGEOJEs8f3VrnUVVKlumAdNRybs9KNJ712WFzsEar7QUqycGC7/eAF0s?=
 =?us-ascii?Q?xZmSQdxr4W/7N/mvQWsqy69qhvZlp1W0S5RQ/5rwO3tJr3kTcMYeexxFkx8e?=
 =?us-ascii?Q?EFOOq2Xx/ZZOf9nyTtvjy9FmJP3SRttsTAFGV9bQCv6t3ibowZBizHopQRkE?=
 =?us-ascii?Q?US10q6tDFG8RGanC+PflzJfAv9PVy6uvDSwE41xgc19/0e80vukynZlEVl3W?=
 =?us-ascii?Q?I0+xogL7+xEYl8+dQDwfqSdeq4lCvNDdc61lg0OMB0VGkmx6HwCq8PEkwOAD?=
 =?us-ascii?Q?2avEUddc1K3qopll30TorLrMH5Ndj7XXUsC1kG7Eqp7EEm7vCJWKper40nDv?=
 =?us-ascii?Q?V7U++r9cPojhnXBc27+p/XEWBgiOrYyg7ubSyJJLJ3xVH3LPtZrXEe++BYoX?=
 =?us-ascii?Q?d+f4nrMde3RKvkc5YMLFOcxctoFsJQMcq1xfSy9nWf3jCzzKurtvwv1p7RnT?=
 =?us-ascii?Q?wpt7bxPkXiXvFGo0cf07cskwXJbaniCbejHpw0xRQAtXUUduypcr+N9zqoAu?=
 =?us-ascii?Q?x6nm3Nfb5aReSiB8iJ/tDRctNeE2jt+pxEQBEsltKgrH6A6g+zsc4/QDLjiS?=
 =?us-ascii?Q?9QemzOzYXOJo4B9tYZ4ZQEjsO1aXqlYLQ4tAyautQvMnc3S9kBK7DxoRu+xy?=
 =?us-ascii?Q?WdhZ4tb7c94B3YA8TCQDm7xPf4eZcuEGeIyyd3O1tOiJqbixrN0SBidiFK+8?=
 =?us-ascii?Q?DFfBXAsFmekegWCLvep7I2UrH6EILXLS3KtlwjKK9mtXZoiBW5YiVArlqBFj?=
 =?us-ascii?Q?deBCSbd8arpA3TLh40Z2CVUgBlMtnvypy+330Qvi9PAD7LVtwVJLjSJsia6B?=
 =?us-ascii?Q?k1W+gMGKYltZa+LiTPc5WBLhBTRzvuBedfEm0QivzjsRp+9T5HDiPBIuArv9?=
 =?us-ascii?Q?nFlqxFsixmOFI/1S9vUqPxR8P0xzujdJLLigXqMyV1n2FnwI5yGl3G7IK2EM?=
 =?us-ascii?Q?L8vLB2ZN4ANGlJ8+imAz5o8e7HQSJOU=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 77fac23d-a810-4d4e-4b28-08d9eba95d8f
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0802MB2426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 08:51:30.3651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0ruuJo5omRmnu6Xwa3nLTYSwJN2no66AUV3qmJvUKVBauLbHzvhgMJ1CAPyWOkNpxN3vSOgLhfNXNxH4oVivoUHCX4puARes248TCZ8NaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2927
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
 Peter Geis <pgwipeout@gmail.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 Liang Chen <cl@rock-chips.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ezequiel Garcia <ezequiel@collabora.com>

Enable the GPU core on the Pine64 Quartz64 Model A.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
index 3e65465ac7d5..b048db6cff3a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
@@ -221,6 +221,11 @@ &gmac1m0_clkinout
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.30.2

