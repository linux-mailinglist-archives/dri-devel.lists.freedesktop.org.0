Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A07272E35C8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Dec 2020 11:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3530C899DC;
	Mon, 28 Dec 2020 10:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690124.outbound.protection.outlook.com [40.107.69.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE7189C8F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Dec 2020 11:01:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TT8KsHGFXM40Bzm53v/k/eyhvNJIXdiNtgUQxDiOSuz480CnpHbmx+0dQwTRVW1xrqT2gamG/R3Gh2B5dHLszV9K5EfaKFdk1dBZX+YpTZOHX8+RzVbsWjZ21uj73lrRRGfbEA01ZkxMujA0KxEtCFfht++nTavawXvEPEoeny7aHhPZNNLTEo6eDVXZbRdj7wQj7iIFZl/li0dYUnJ1zEuXRz3tjgFdANeg/o0kir8G8zNJAAWVpAnRUa93+LhL16pkuqreqkQf5dGqLnsIu70Ku4JNclJm+vKlGhwfxZOvcLzkeFVxw2MUvPgdPYyRpE+Mwdwm6/12JSjSDQo4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zfchXx4wcWxjhuF4vT0NwWz4ZTEB4irm7p4s7AB7sU=;
 b=Cg5WJVd4KVSf53wHkJQukD2AbDlaeJcNfg+K3JhrplB/Qz2HpZD2ZgkuQtnKdswsHhO+USkai+g18X9Y73tCE5wtlDPwB33WdeOpHkkgT0CmVG5TNZbq3uBey8urmLnouzD2uai2JzHt13E9TQRRwuJm54arFtCP6g3mGwWFBvXfY0TbQF2poiMzVXB080b3QqDMSW+heU2WC/g2oJ1X0x8qf8r3cKFkj0zrIRTR6UsYP/ISUm9m6xTUyDGsbj6EhuKagiXSdmCTNumtovzLIdyh+cd9LzebslBMEJRKpq1CFsFv/6KsW7t6qODmfsmeHyiBLhqjgMAXsB1ZvPonQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zfchXx4wcWxjhuF4vT0NwWz4ZTEB4irm7p4s7AB7sU=;
 b=1pHDHtnOjFhxBzmgAmFQkcpTzutMd5zLkaYIZFYvWimerea0IqF0HpOLmr22HagDR0lXzPOAowwUZb7oqWm5hN6da0imZGkKNLuIjWQKUcvLrYcJtzjvipag2vLkc2tkKkjsuJx1YgQuYPJq52cNr4pQiXJPJL7VFj/qS2v0SVM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7630.namprd04.prod.outlook.com (2603:10b6:a03:32c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.28; Fri, 25 Dec
 2020 11:01:16 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::441c:9020:2a79:3eff]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::441c:9020:2a79:3eff%6]) with mapi id 15.20.3700.026; Fri, 25 Dec 2020
 11:01:16 +0000
Date: Fri, 25 Dec 2020 19:01:09 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Boichat <drinkcat@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v1 1/2] dt-bindings: drm/bridge: anx7625: add DPI flag and
 swing setting
Message-ID: <c29b7d9fda9ce8619d1c718b077250998a8600b8.1608883950.git.xji@analogixsemi.com>
References: <cover.1608883950.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1608883950.git.xji@analogixsemi.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR0401CA0003.apcprd04.prod.outlook.com
 (2603:1096:202:2::13) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (61.148.116.10) by
 HK2PR0401CA0003.apcprd04.prod.outlook.com (2603:1096:202:2::13) with
 Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.3700.27 via Frontend
 Transport; Fri, 25 Dec 2020 11:01:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a8acb47-ab4d-4075-e474-08d8a8c46687
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7630:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB76309710A6C9056349A8A5BCC7DC0@SJ0PR04MB7630.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qg3vKNxvP76CZ2cDop0EUF8qYWSEGT6zNLZwo/tnk2zWJ/Vxq1RqAaeLzkObxwV8PqJ5f+KsBSZMRXu55zibAVMk4hneDUX1mOUygjDPlcLZ/HlmS0WZJWKuvW78gfs9ZYPZchK4aFLA1r1fHNyENJlYA5c7Qk31o/PQIAEDyxtKDuSheeSbK9Glg455YKCHV9bv3/YXUPLUc49zPqM2iQhTJDxZDjbhP7PAnH0G1n+3Yeyx4oV6ldIXw93trso1pjXI0JlB56MMV8ihZ3+PS9p0W9BqtwUijJX7OFMCjZPpFto0ptZAECTbgxAUjNoWtBNPP/aatbjNlf4xhuvbyrOujkNT78d3cfaUDFaQ4nEMX/VSmMTg9ws6yHZjJHk6tMfeg9UrGU0aGtXIxfS1FQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(136003)(366004)(396003)(346002)(376002)(66476007)(16526019)(6496006)(86362001)(66556008)(8676002)(7416002)(2616005)(956004)(26005)(186003)(36756003)(4326008)(8936002)(52116002)(5660300002)(54906003)(110136005)(2906002)(316002)(6666004)(66946007)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fIA/XAbE06x1FBguZvYlhE09gD767RxLnkomzYZjp9e52s/LqpoG5RBR8ohP?=
 =?us-ascii?Q?yhmqXXoinOt3h67ELsTjoGkzTfpjESsdZHDhGLObg64sjI5PnihRsnrdbw58?=
 =?us-ascii?Q?zwh4cjPG0Dw926WDspCmIDFOAMldw9CuTRJVGGA/oAlW8FumA5oVviO1ICE3?=
 =?us-ascii?Q?+NFKmJqwT35Y/ohqpT6O0psqUJ+vt8KH6IiJLhP0n++fXFVSvNx7jfDcen2V?=
 =?us-ascii?Q?b3ogCWRbLMN1SHvg8XwGCPQnm6FC4c1Ouyq9GY6tHBbs5bOW+lY1X7gcW/XR?=
 =?us-ascii?Q?UUke5eZ7ied5DSbAVcglRRZBtRN6dv71Amg/EpVax9ycOGYwR5WtwEz5zWcV?=
 =?us-ascii?Q?kMvV+LcfTxmfuSWn8U9Da7RaeSzomqO30bJlwy+jB3EOGB7gA3st8hP/MwIJ?=
 =?us-ascii?Q?bpzXBp6CEfHbrMcH+MlqhFEIbg/vrRAdUpaNMKnbWOwllUql8TXfZEp+3ezK?=
 =?us-ascii?Q?SelabUSOgGBPx9NjWoSW4pN7p3jR+3O61cV6hl8PmzgTshri2ThAZWHaRUe+?=
 =?us-ascii?Q?3TQZ6YthwcMVDfObv2VRndbgcYQp5mq9VBiaRx/ql/s5TjVa1J0PB7XMLAgH?=
 =?us-ascii?Q?Iem195K4q5EJN5Na4PX+kCK5lb7RRHcZMr37F3CBh7IkVxU+83dGPKpivkCi?=
 =?us-ascii?Q?5u0LUoNzFyl2YepPSsa0i8rYBISNtBokch3gZKSKdFf+sQPpSISO7blbH+Tb?=
 =?us-ascii?Q?CBBF1g9exau+8+luWLjds4EeevipikANaOTKbxointncZ9hcanLk/xbH1NfK?=
 =?us-ascii?Q?Z5wYB4rxRweXc3bIJdLf8CzT3LaUyOKyg0PZCLCRfFwYCldc58gtcTXe9f3A?=
 =?us-ascii?Q?Jm9UwXnUUVAKUKGb+0Jyhg3SO3K1+EtkqUer1Mllv+R1kiEyGKUl61r1Rdqu?=
 =?us-ascii?Q?q5h9+Emaxr5xI9yGnzm1T9pLvq117r/Z/kbz3Q6r4sbSlyFpW4WNuwEU8ojl?=
 =?us-ascii?Q?YxCEam0mZj89Fi2PEOx/71FdNZl4IUtrs07jRvnkmopzj7m+uxGxtQOgUBjg?=
 =?us-ascii?Q?a0s3?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2020 11:01:15.9546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8acb47-ab4d-4075-e474-08d8a8c46687
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnbHUhXrUzKmNWtYXA17B1h+LUIZao0Hb5cWsCIztjeOpwR9ONXJNvgHJNKYAgO5g08HFFvSbYtpRP0cgySYSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7630
X-Mailman-Approved-At: Mon, 28 Dec 2020 10:19:13 +0000
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
 .../bindings/display/bridge/analogix,anx7625.yaml     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 60585a4..34a7faf 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -34,6 +34,14 @@ properties:
     description: used for reset chip control, RESET_N pin B7.
     maxItems: 1
 
+  anx,swing-setting:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: an array of swing register setting for DP tx PHY
+
+  anx,mipi-dpi-in:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: indicate the MIPI rx signal type is DPI or DSI
+
   ports:
     type: object
 
@@ -72,6 +80,17 @@ examples:
             reg = <0x58>;
             enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
             reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+            anx,swing-setting = <0x00 0x14>, <0x01 0x54>,
+                <0x02 0x64>, <0x03 0x74>, <0x04 0x29>,
+                <0x05 0x7b>, <0x06 0x77>, <0x07 0x5b>,
+                <0x08 0x7f>, <0x0c 0x20>, <0x0d 0x60>,
+                <0x10 0x60>, <0x12 0x40>, <0x13 0x60>,
+                <0x14 0x14>, <0x15 0x54>, <0x16 0x64>,
+                <0x17 0x74>, <0x18 0x29>, <0x19 0x7b>,
+                <0x1a 0x77>, <0x1b 0x5b>, <0x1c 0x7f>,
+                <0x20 0x20>, <0x21 0x60>, <0x24 0x60>,
+                <0x26 0x40>, <0x27 0x60>;
+            anx,mipi-dpi-in = <0>;
 
             ports {
                 #address-cells = <1>;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
