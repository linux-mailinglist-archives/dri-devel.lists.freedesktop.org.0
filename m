Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD9D4AFF89
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 22:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BE710E5E7;
	Wed,  9 Feb 2022 21:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70053.outbound.protection.outlook.com [40.107.7.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2250D10E5E0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 21:56:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5yzLHvTyFV5X3lRwSM50NV92otEgcOM+o21oZHvveMcKRgAlLGN7DMz3BguHCCSLOOGabgBH49P/r+JitpCRaxILbM+Juzi5mjInu0i3mm0dYZDznEVkq6/+bWXjoBCF3c9B8lwcOQ8Ygo9VPmWXkjkpyiizdAEjj6LIcI/qeLLb3Ci+DoXwHE00ROVMqEAgNJzDiM6h56jrQYHC/rmDH1Zj0++BiygBSJ9oGeo8M0r/D16jfQLD3Encle4fz6WSygoUerfTIMq7TrrfdJ5U9m+aZkIKEN0+oGMjEOQ/vL055g0UZMyDOKfumLqrBQehKwX5ahS5NjaBv+eaUQVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXhbRDQGkISr6kHJqbllfTp+stN+je4oakh0iU0AGdo=;
 b=bZa6kUGDNC1dFRKOYnugbEDK5BoowARKNzbtxxie6OWdAUpvBMUNrV4onqiexJaye3KIRJWjLa1fEub3eL70q8vv3IyLHf+d5yzlQNTbXompoxTBD4Dv8RFifth5crm7ihpjauuoyt7Ixrk4pubUrwJEtTPeypdFhZQysZRvPqGSBjl7EcetiQCICXPOwglYlHM4A9ql8Eb/Y9AJx26yno6rMIwh2KyaIILehcdVqF2oxMsK8Gfeqxxe8/lRrI3yJs76LWhrN7qZSVceEuxu8XN4g+WmVxwksyeyVwOYFLUKQ4Gw5QUCw0BDooXNG6QP+ssf3IrHfr1Mzet3zDUR5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXhbRDQGkISr6kHJqbllfTp+stN+je4oakh0iU0AGdo=;
 b=tVoFmdo1+vr99MdIsV/qMaCMYPP/hwKsHOdffuV7cgN86qa3wiGNK4S9Wc2r6Q3IDC6frcZ4mcZugd3u3rXBZIKgdx7NqDt+C4/3FUkKAZY5jaGvxmt0Le8qOFeuh5JGITur+1hb11X8TIikLvhRUdz889IJFnr2eFeGRF7gIFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com (2603:10a6:3:e1::23)
 by VI1PR08MB4575.eurprd08.prod.outlook.com (2603:10a6:803:eb::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 21:56:10 +0000
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56]) by HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56%3]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 21:56:10 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH v6 4/5] arm64: dts: rockchip: enable the gpu on quartz64-a
Date: Wed,  9 Feb 2022 22:55:48 +0100
Message-Id: <20220209215549.94524-5-michael.riesch@wolfvision.net>
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
X-MS-Office365-Filtering-Correlation-Id: 84f16967-ab7a-44b3-22e8-08d9ec16fb28
X-MS-TrafficTypeDiagnostic: VI1PR08MB4575:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB45759822CE8B0FF3AFA967FDF22E9@VI1PR08MB4575.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HEboKU0RxdD3//Zwd58TyMJXtXfLaifgiJ6EPe6YsN1/tMqNgnx3Nc9WhH+6gut5qCx01scuEQtYAZ8O0GUN1Sj1QHzE0OwCWmhgtowHM/nAnAxkzmREiwbdnIPehlM5JPBotWtNKC79vZUezvYGjowWVXetNxS4Kx8SPWtwlH6ZHG26Ng06zkBSqAUCs0k2GtkRFi8I6o6hpEvl9qPGLfauvLYRB9So8112J4GEMCyG7i803j24PnZ0YdOps4djf5KC0pj2pOrtwD3+G19ooyIm6SjZi+B5Mu5V7p2ko6k4f+cOUyrJ8y3JeO2VVtRm7MfwmjE1QZ+90EQXeSHtjl/V0nfFl/B3ScWEqMXRQH5Mq1Jo90xHspYQd0+1hMCP3LXHIVDOpSbIPkUFCDYhgdrSmg2EjNQwblCCa5/bdjlI9VCL3EV3jzxyhg04mLkHKyBK/MGTdw+ED+zkIMtQV77vOq/XnioVs9lcJdsmyCeIHBmDjVo6drQIun5kJxblvBPWiPZQqt2rckPsLEu5hu+kkbOkgOdjzoYWRCj0wqF8uEs3ybDujDsX59RyfX3j++CACJD9V2oyCMiTkfHd9YLzT36CjFQZDorssrbuMtGQPGrkJ+3mujNgsKbyvBUz/fpNF4SL1bl4WGOQ50kqyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0802MB2426.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(38100700002)(2906002)(4326008)(508600001)(316002)(54906003)(52116002)(36756003)(6666004)(6506007)(6486002)(2616005)(44832011)(1076003)(86362001)(7416002)(66946007)(66556008)(186003)(4744005)(8676002)(66476007)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/ldw58wNDPW4tNZuxLTB9D6PdJgOT9t+3sE2qTOlSAAdE6Xi8KAiSAbc+xaW?=
 =?us-ascii?Q?NyEtK0EshxqI4zMGq28O2PO+9Y77kg4qKETcnylwx2GKAq/z9m1JoVTTvi2g?=
 =?us-ascii?Q?pmUqC3Rw7DpFu0EmTgom2Bqs7CICta9MheJlVNu90mOK2rlM1TmNa9qd2Kcb?=
 =?us-ascii?Q?jKTIkbPJg824g/dFT+GNbdVKX4kLTzTSN/UDmYMhZbpTzCsZT7Pi7B8qPazW?=
 =?us-ascii?Q?BR6dMmd2gqg0Io6HRNlYJnmcExEgKQyR7SFwcnIEbLC85/8QprYZR77xnLWa?=
 =?us-ascii?Q?AkqJo/YMzEgCURIm1B9v9KBkh414WChEjZ7BC8mk/KYNy7T6ci4hIqwx8us4?=
 =?us-ascii?Q?qoMW33D3ZYL/G1yy6qRgwbtlgeHZHtr1yOqcpD0r3vgnAudMiW7zktcmXx/z?=
 =?us-ascii?Q?J9R/tqzncYHd+R6tIh3LsxgWeELRBe0Zc0hDeo6ajstMzvmfMyaqaH3gV5ZB?=
 =?us-ascii?Q?CVPyhrPKywC/zM4N0RjVNBWkxpH9v070EFWfxUU+9PPaPTY0YH424hJduDcj?=
 =?us-ascii?Q?FycxyX38SsePVYpGT0uqyvGtaWf+gvf0hjt9cLwTy2urcoh/t3mBoMhPY2ad?=
 =?us-ascii?Q?r86B9DRAWdqHd6xKXH/uLXu0w1Y2ULaw8GhdNGHA1mff1gnSsZplwL2cu5VD?=
 =?us-ascii?Q?/N85J9qXXECEkdLASnJ5LzuC6tOEK/xlNSzFgy6omtczKFDKs/M5aqCU+QvO?=
 =?us-ascii?Q?WiPX+voPQ0WYRp7ilL+LxScAqLil5Siy/nLCBfEkbjo2Q1YRGajCmqDWURUX?=
 =?us-ascii?Q?09rZDhCwIHJ8/mJdfUnpcmoPPGMM4MEXVIjl1JKUoToO3Q5Q+jz2ARDRjjly?=
 =?us-ascii?Q?z5mTIDlFiAiRFk/xjxGrEQRX6IQMgkIg3WRqREe9KVbBQsWpDeEBnBzl6XWQ?=
 =?us-ascii?Q?M+VgnYIEBCGAsLaCAmSUhp0ycdYRApaNtXd1t9PauM6kp7tNf/OHgIvZEQvN?=
 =?us-ascii?Q?bh3wjqZLr2aWqqCmt1j3YRuteTV+g3/QOLSSU8I4OYbFyo1XWl+knK2beuH4?=
 =?us-ascii?Q?d1adg7VlocLMv9WWS6GLqHyWs/vBmEFtVVX45uk6DgjTv8oepxxhkl5G+16p?=
 =?us-ascii?Q?i+/CKI1TudxXIp2PZHmJ0titQ9r4muh4vHsB/cEml1YogGvM9VPkHr7Xi3bO?=
 =?us-ascii?Q?zYO+aDnPPdNgFyaNww6d+Nb2iv+Byl0MPOQRpnrmZM1Kba0kEeQmTp7JPvdZ?=
 =?us-ascii?Q?i1ljdYAb1SqBHfPmGOSHLs1hA6SzdSJuwmJ+o+XYgpm+qszqx68rRdm0nu8O?=
 =?us-ascii?Q?JETcaGgY5CjLa6e0T3rfrrAyZfMlS2PmmSpS14wCgKx+CM+GUZEo4AqsepCz?=
 =?us-ascii?Q?cTZTWEthsl0klWERvaI0ddl2nooDEfZ9+rxZIiJ6x2mBsmQchQFB31meM4wp?=
 =?us-ascii?Q?MpHlZzcFnIZP7RjNz0sDckhbq5dmPMskMroImVAXbrGcED57KTYe5bF7mgu7?=
 =?us-ascii?Q?4PkRFlT4S1QZoSCa3nJ5jgu+W8LhlbItIM93pMAVdZbPU66LyGzMXmlDR058?=
 =?us-ascii?Q?U4VYHRdiBHrgHWEUKDQn7fAxZBaC5tQl4+VnvOAHwwi75wWjwQyFP23EAY5z?=
 =?us-ascii?Q?Yhud8VYo1zxlyhbBkvbvi3BNzML8L9QvDcJH1s3M+EBbSsLvK5TQYlWoj6Xs?=
 =?us-ascii?Q?l0vZTENzJEssKOsAsj20ExvRrdpybtB58BbIte4VtkWM24WZmQo1sdhPm9uW?=
 =?us-ascii?Q?Xw5aNtYPSXRmoFiNIHPL0qQn3GQIH6CBCU3K2BczqyMVN1k9pjc+3NO6dXnY?=
 =?us-ascii?Q?gM6QAWDGBV2cGeJDjxcu9RBeki9VgO0=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f16967-ab7a-44b3-22e8-08d9ec16fb28
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0802MB2426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 21:56:09.8657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3ENJpxdhu817cz/B5eN+sGxv8i7qdmldN75GIjt12Lt3gNbl9vPVGqH/0pVxoxsmDTyeaNy53FCpQQlicxBKkmD1udyphBmu0KNGSb86jg=
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

