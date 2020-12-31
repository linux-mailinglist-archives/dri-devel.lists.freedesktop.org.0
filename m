Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4942E7F6F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 11:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDAF889B4D;
	Thu, 31 Dec 2020 10:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2109.outbound.protection.outlook.com [40.107.223.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B40289893
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Dec 2020 02:21:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFocloFoAd2+3qS6laHqsCaCP1RMGfT0XsHbrsIPVx4EKCRM9ZBgrliaCd9o7YWrgnLfjVBpEYfd5Xl2KgmU6OGx5ACZ3HjQ1lGyzu/Om2g357iEEv89q0srwu3ZTeKhJPkcy22eHgBYuxhdYAQdwhiWDXeuFDzKgVq41pSmz6g6l2dLvJb0gOkNnW/sfbknpLAU/G09J2lv6JRHbIukvkW1c6ma/lEcP7FueckqgpdDomB/0JbOZK4QB0+GcBe0ug7dWO000dPBrDEH00QnGVAYJMH8BD3cKZTY/aEJH9uKO0wtgeIrwUo7NAVSNfTGWHnFMoKh6ymgcHUVuhrC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiVHUzY2cWvuYYAqvztcJJlqNp2mg7pu2f7RqR6Tx4Y=;
 b=nttWPc1XWPSL9aODSwCcJahapHpeDNSbw2f0uZvaA26iPP2XlWkkPD12BKcLL5Er+Z3gEw8W+opykPxDIIoUsPPzQITTHeKA5xdVvUfUPDzFh/7QTqQPB53tuJPIhh/aJPq+FIwg7aBD9ISG4HJe1UwlrumuavbyiwbpoV+nZyNIYtHl0z1+rUmOWlLCTb2+X3XXmFHx6FsVFcLSuTtgHCrgcMuLGliYSKzsGW5Xkwj1Nrktrrl2HeUw7uWWB4avTL0peH/1m6ipN9f5Lns6uzr9rFTCaQ3qdWJmEALgyQR8anyrEG2/IB2vNSfSmYoBq3MROWV080+8riE/Ne3n7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiVHUzY2cWvuYYAqvztcJJlqNp2mg7pu2f7RqR6Tx4Y=;
 b=oXUPm3qynVxCsZeU+D3buv7Pg8rOZFmsWWsQhpwe+7o4c+Pvg1mXP2jxN6XY6x8rdUANIqjywd+mQ8Lgc+ZyyEfBhWh2dOkb0r9Dq05YbUDHkk6ND2D30w60DXoM8ULTjpdZ970eSYruqdt2l6BOOvo0qsSuclDMaDJ7LWVlMbA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7615.namprd04.prod.outlook.com (2603:10b6:a03:32b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Thu, 31 Dec
 2020 02:21:18 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::707e:7179:3257:e72b]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::707e:7179:3257:e72b%8]) with mapi id 15.20.3721.020; Thu, 31 Dec 2020
 02:21:18 +0000
Date: Thu, 31 Dec 2020 10:21:12 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Boichat <drinkcat@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: add DPI flag and
 swing setting
Message-ID: <d13442f84fefccc992d6c5e48ac1e6129882af31.1609380663.git.xji@analogixsemi.com>
References: <cover.1609380663.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1609380663.git.xji@analogixsemi.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR02CA0145.apcprd02.prod.outlook.com
 (2603:1096:202:16::29) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (61.148.116.10) by
 HK2PR02CA0145.apcprd02.prod.outlook.com (2603:1096:202:16::29) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3721.20 via Frontend Transport; Thu, 31 Dec 2020 02:21:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1d54d61-4a91-496e-7420-08d8ad32c20e
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7615:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB7615F83C7F69B73B0FF9D0C5C7D60@SJ0PR04MB7615.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0lX5Iah3xPg9PVo5xoCg3cN4n7FkXg7UpxD09pR1YMUCKdYqeVnAuqoELAXIsg6JnEi+n5ewCiDl51HflQ1Jgkq8QePjvEdhEWoqHaP4s0Z0Eg/VRe1HAPL8gtICXg+sUbE9zhEtGFcYQ9G6Lz42ghUa9syUHIdLi7nyg5ww+f66RuyT+saxD0G3wUHpCdXdsQvM2fINZPTVEozKkuNfd9ikxGHlEgoRaOZjH8cjYY5v92iEjX4qZnK+XowTjgaXCTEOEOVJ/mKRXtn/+thFCFQ8JxI2EcrN8ek2lO3eqVzON16XFAZQeRzWi6/Hr/NnW816+aFcC6+fnNBQH3kFppq//Q13ba4IJLdoCroTo7yFuyxSicbYM/KnZexTCMCH2pqzUChLU9nxFAoC7zTxwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(376002)(366004)(346002)(136003)(396003)(110136005)(7416002)(478600001)(54906003)(8936002)(66476007)(66556008)(6496006)(8676002)(66946007)(4326008)(52116002)(36756003)(86362001)(83380400001)(6666004)(6486002)(5660300002)(2906002)(26005)(956004)(2616005)(316002)(186003)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hOdWZd0pWLH6A52dm7fiVrJ6cAOrKg+lAwcD2gfxJZvnJGtx8BOJNrTHNGuL?=
 =?us-ascii?Q?MwxZnC4F4N6QSYx2AZJ/SBQ1R9CogdChPDmdTF8XoesY/EUJPwLDN814Ecqy?=
 =?us-ascii?Q?r99c0G4YjtNqrj9dSZze8qEC68jktVtCB2glcy2lNmXqCDPf+Oe9z5mAu6y2?=
 =?us-ascii?Q?cE0Mpgxn8B5H0iTqhn5ccsZfBDLjrLrnf92g1G1RQYYLeHsUY1a5wEerePNV?=
 =?us-ascii?Q?3ev8gj7NZccdRWOy66bhOYXI27kelttrIOaa7iZRdPSbjDITeIhLoQ1jy/QC?=
 =?us-ascii?Q?mUBnF6qMaQXqqVfNi5wss+Y2B/WLU+XwWsUdL3lvBuc8s12Sv7SYt7DO9FeS?=
 =?us-ascii?Q?6vi0MBFba7xFeABt8Z8fw5yhr60C1PD3qC5l7E4012xx9NhJUpEyKLklEeIJ?=
 =?us-ascii?Q?aJug5/lOjNsdjlRxMB+CgF36x7MrlFRM9Sv42ZKaFKOPn0gfW06w886fk1+l?=
 =?us-ascii?Q?gZvglJgviCPbu1ETW7Z+Klp9fvuLCRdtfbWbTRaqcm4+2mK9zK4loV31O59T?=
 =?us-ascii?Q?+8h6ZmulhKPusx4ss5VsacF1UCAWnEhRxKB1lIKfCOhvD2P86/DYtWvD4TYk?=
 =?us-ascii?Q?ifKlHaVbkh/lJZC2AqBK4BhyfrcklqYj+RkuNlLWaC0QVxX8SdwSijGjlQMi?=
 =?us-ascii?Q?TMMg2L2BqwOrOASq7lyYoB33aBoJJLS9OCqMIybduMu5LMMO3nW4fx7WXGsR?=
 =?us-ascii?Q?J50FtXle+KXsRObjs0rI+ZbiYoizSU+KZbBSd+3GeNk+4zaOZdG9EFEY4lxl?=
 =?us-ascii?Q?L8d/trOvpmoHnlmbG2kliVXX8Df+gygWD1eQfTvajUmJE4o2rdXGRt+qdLUr?=
 =?us-ascii?Q?cyM9A37751jKLCk9sta+ZQO8hN/S1fy4nxfpubbi09lLqXlDJQ7LQ5aEYTAg?=
 =?us-ascii?Q?nf3kmZACjUxnl8bFvq1UeeHsHTC/G6eyYX2MoUtl2OkdfOLh0ElU5ptS20PZ?=
 =?us-ascii?Q?FZr5kA86/wtr/+3jYo153CfxDSGgjJ5HxXWkDbc5u4vl7Gd5XHV5R9tT02rt?=
 =?us-ascii?Q?hZwW?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2020 02:21:18.7517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d54d61-4a91-496e-7420-08d8ad32c20e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yoi4ktoe8puUWJCIP2aRtM53msQ75T4XmYNAoel6TOuNNcONc4MMvTDvmds99rV+ag1Aul8P6xMGf64kecCsSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7615
X-Mailman-Approved-At: Thu, 31 Dec 2020 10:42:13 +0000
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DPI flag for distinguish MIPI input signal type, DSI or DPI. Add
swing setting for adjusting DP tx PHY swing

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 .../bindings/display/bridge/analogix,anx7625.yaml  | 25 ++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 60585a4..4eb0ea3 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -34,6 +34,16 @@ properties:
     description: used for reset chip control, RESET_N pin B7.
     maxItems: 1
 
+  analogix,swing-setting:
+    type: uint8-array
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: an array of swing register setting for DP tx PHY
+
+  analogix,mipi-dpi-in:
+    type: int
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: indicate the MIPI rx signal type is DPI or DSI
+
   ports:
     type: object
 
@@ -49,8 +59,8 @@ properties:
           Video port for panel or connector.
 
     required:
-        - port@0
-        - port@1
+      - port@0
+      - port@1
 
 required:
   - compatible
@@ -72,6 +82,17 @@ examples:
             reg = <0x58>;
             enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
             reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+            analogix,swing-setting = <0x00 0x14>, <0x01 0x54>,
+                <0x02 0x64>, <0x03 0x74>, <0x04 0x29>,
+                <0x05 0x7b>, <0x06 0x77>, <0x07 0x5b>,
+                <0x08 0x7f>, <0x0c 0x20>, <0x0d 0x60>,
+                <0x10 0x60>, <0x12 0x40>, <0x13 0x60>,
+                <0x14 0x14>, <0x15 0x54>, <0x16 0x64>,
+                <0x17 0x74>, <0x18 0x29>, <0x19 0x7b>,
+                <0x1a 0x77>, <0x1b 0x5b>, <0x1c 0x7f>,
+                <0x20 0x20>, <0x21 0x60>, <0x24 0x60>,
+                <0x26 0x40>, <0x27 0x60>;
+            analogix,mipi-dpi-in = <0>;
 
             ports {
                 #address-cells = <1>;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
