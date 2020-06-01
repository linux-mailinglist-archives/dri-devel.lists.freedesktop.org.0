Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FE91EB656
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 09:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C0B6E082;
	Tue,  2 Jun 2020 07:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10044.outbound.protection.outlook.com [40.107.1.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E336E038
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 06:21:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiMHJEol2jh3j8UI9g2gXjX/SpTBXh6RIKNGqcOgzIJlf36Xmc8MB2XBT7OoFokozEof9Ln9fBdmuAANdWnBGNFxxyZlabsdWMbKGJ8sItM5TJ5PmxqGuSSfr7Kmmr92II90JvRO+LqziIH1oTEBEqSQRbA5mWwy0TlEacK25REdhvMOvr9axWALmXX70fppiyMAXEcqBNFZVs/Ljgj/IboLvZlh8M3dlv/WbF5m0AbOJQluRBGRYm5U2poDW8a0zro8GyAMW0V7W3V3ny+uXG14JifVThRr0qRvRxUwi4SujGjWGN1WuSrRe9QtHTiPcqHSd+QAuhCZaymiIuDKJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ps5R40EYm16OVG3b3NHzDOhnUx/jgWey59KzSsUr57U=;
 b=FMqUlHts2NVvfSvuo0VilYaSo/u/a2eJHlqc4OxfH3eXxlpLWPgfCMS7XKwHjsAakJaa1iCH8DpYj8X2t4Zz9lklG9WwtaxQZQ/UDOniME3DpLOhCRmu/2pByVjyWl1LlHjFg+SO77cl1b29cWztiBONTVePGNpeClsKs9gmZbwP+hM0iD2s0hUZE0+5iw1bQGH64yHyMDM4d6DDcXObbiglTqCxDK4EQR8OSbp8NKq9yB7QapY7e6Ado6GgGy/i9FMH/SHsTc3U37HAT20/Vta8Sd0ysjptSjYzSShwapksxv9Xq5qdQ7sy2f5n+0aoUQi4v/hcTrTCWZfN9m2Dxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ps5R40EYm16OVG3b3NHzDOhnUx/jgWey59KzSsUr57U=;
 b=C3wNYEcUAYxxycWtOReAGrsAsnnf507NB44hqYtc4wTftF/u33oDCGgwBFR+uded2wIeEp22ZyAK0033OT7qDY3C2nYSd617svN6ObSqhpq8qAH0UYmjx8kVN90gXCf7B0cjmy9mcNTbIPpw6NQTJsJu6OO8OliRXw5UpUX1XnA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4543.eurprd04.prod.outlook.com (2603:10a6:803:6e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Mon, 1 Jun
 2020 06:21:17 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38%5]) with mapi id 15.20.3045.024; Mon, 1 Jun 2020
 06:21:17 +0000
From: Liu Ying <victor.liu@nxp.com>
To: devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: panel-simple: Add koe,
 tx26d202vm0bwa compatible
Date: Mon,  1 Jun 2020 14:10:43 +0800
Message-Id: <1590991843-24231-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SG2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:3:17::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0010.apcprd02.prod.outlook.com (2603:1096:3:17::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3045.21 via Frontend Transport; Mon, 1 Jun 2020 06:21:15 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 20e68dff-132b-4166-9aed-08d805f3fe18
X-MS-TrafficTypeDiagnostic: VI1PR04MB4543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4543C7703E8B44CC1940F67C988A0@VI1PR04MB4543.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-Forefront-PRVS: 0421BF7135
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5zqAJdvseWuqn0B28NJS5ncVGc79of4/tV5nn/gdNa24jPhTPCxD5I6yA26PD6WItAmwCKaG6k/Ukj7j/NtP0s0nXGlFLmD2njuqSrCGHD252msdLR+nHptSplprxSz4BCCHqqvfxHRENaFDbe6/fVgWGoRtYVa8O+hSVQ56V/VoyR+J/ZSCMvSX3N9EU/78oGHqhD8tTpXouywqft+gfghjrsNmMoPipZMGmvY5ZQnuuEhSnBjwdMK9+EMQTxUgwWekLQxrSn7dJCFn/m5Ux+Pu6ds9LjNkyRazMQRy53uxB9H/PkjdpA9SKAYWb1/0Q2yUWBFyUt/f0BdeOeAfyZhz1oLFt1xlTjRWVGYMGc1Up6PfjSr8SrXy6NqwkJparpW/8ysR2ucWt1f+pfzHF+Jc7ME/QgqSWv6wB8I2eWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(6506007)(186003)(956004)(2616005)(16526019)(2906002)(52116002)(26005)(6486002)(5660300002)(478600001)(8676002)(4326008)(316002)(8936002)(69590400007)(6512007)(86362001)(6666004)(66556008)(36756003)(66946007)(6916009)(66476007)(142933001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: X2SqcLrVsVWcw3nBqCgZPJqllc78KzkcvSLameNw1DM9+6WyJLu7fhFL1mBWd3SNzkcYBIPPHRFLcH7Flf74JaB6jJJM73XYpma4TLPmhsc3lOF8+hx1kT8jZP0pKFYWuTIpIXLAfSZl0roczG/LJVmvEHI9M7CQM9oqcTm5QWdh6s7RCi+IhsazX2SU0V0R3gJA/2fhsSvr1PVsFfQO4V9wSd4fyK1SAeamexoiMn6wDguERD/PLJHMCGlOeAQbm2KgfOUlQys9tgM4HMUQNtY6sFPKr8UJ4ozFVQu6txbKqIAfjL3buK8dLTdAJFQgPIOoiWUgBNiOSDKGd3dGFitXFTS88FRpCDta8VbVE67OOY9KfZnvtp/TqGPWpMaLvT/AbOKai7AIkymt+WUcpabr+PJuheMZZZAK3hAvbyrpsHjeJNfpexMKjvnRRCfDJz6lOG99IXjitgJ0MaJ+LhcJFzMXfy3X25W93TAfLkQ=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e68dff-132b-4166-9aed-08d805f3fe18
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2020 06:21:17.4740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9X8nndkTnojxV1nsU+3Y+XpvzJ/9QngfNwycnJ/IOFE/oKSdHVHjLVHUwrl753ViVQt26U5ti6eg5Z2U76pjOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4543
X-Mailman-Approved-At: Tue, 02 Jun 2020 07:16:26 +0000
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
Cc: robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 linux-imx@nxp.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible to panel-simple for Kaohsiung Opto-Electronics Inc.
10.1" WUXGA(1920x1200) TX26D202VM0BWA TFT LCD panel with LVDS interface.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index d6cca14..31e3efc 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -157,6 +157,8 @@ properties:
       - innolux,zj070na-01p
         # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
       - koe,tx14d24vm1bpa
+        # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
+      - koe,tx26d202vm0bwa
         # Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
       - koe,tx31d200vm0baa
         # Kyocera Corporation 12.1" XGA (1024x768) TFT LCD panel
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
