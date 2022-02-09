Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D09774AFF86
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 22:56:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D7D10E5E2;
	Wed,  9 Feb 2022 21:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5C510E53D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 21:56:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNkItvvwtei+k30ntSUo3FEZ0d5Qip83ll32gP35DYSD5HbdXnB2ZqHv2q98ix+6p//JwSTQXbv+n2BnoLiLz93TMjgCXXxTJnOlTFQXns3YM2z075txIekqN8iTQASbLUzW3jiY61bMT+WVPzB3ZD5nSPrd6Mf0OLypnefD0yRprQoEiMHqmDq/O9IcxsZLKQHDdBQKnL5YlbNjy7H6JktSRL05wJJX9mUJ9rtG8D/aLi+RBypVUHedudwqeZVX5s4l59vjgsi4ePyXKNMO1ptX3d+helIX4KuWJLfoAGNl7ZsYQufulGoQ7yh0g8vzUUbNogV/XwWBTXRU35185w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLbgpsASm0DdWNyCqP9doSRhaeJEjX2WjAOp3VoZBmM=;
 b=M/k/yD7DGoFBPTdPFIwuKlyrhrU8b8YvZFRuOwwnJi0Yro0K69Kyh0cyB7/GW5tDxAuGeHCOWOASpOl04H1j9Ec9RExcGzdOQQsTmlZ/AZMYX23WVEOtYFi4YnIx4g1LS7Eo4owlyRaztBUO2d5qsur6zUvPY55HmLJhF5ujYXHl7ILX8+LRGIGN+72H3x3EVgDDp5v2J7vjHWA5aWqL6wrx1T988H/AgpN22BcO6W8nlgMJEe9UJ+hrtH8fo3YVLCFaM1CBVVNLMX/ybNlJQsDtxqNRMS2eXV9wJqKzyYHQ0ux71Awkt7GWJ5pSS383kFapAfabqrbvhvs+6xvJqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLbgpsASm0DdWNyCqP9doSRhaeJEjX2WjAOp3VoZBmM=;
 b=FoJ/nBgrt+PC+cdpKNLoKz8htuHVKaVEJTM2FJK++NWH7OjoWFgMWsC9lxaaiEFXUoiqRuOWotHM2+yEqAu6C+Dn7wR5fBZc8YVpIUn0Ox82VpoTPQXwIFE4qlhdHifZ+P7U/xxi8QukeY+Zsjqh5JE4hD/XBYtIKqd7j3IP9wQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com (2603:10a6:3:e1::23)
 by VI1PR08MB4575.eurprd08.prod.outlook.com (2603:10a6:803:eb::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 21:56:04 +0000
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56]) by HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56%3]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 21:56:04 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH v6 1/5] dt-bindings: gpu: mali-bifrost: describe clocks for
 the rk356x gpu
Date: Wed,  9 Feb 2022 22:55:45 +0100
Message-Id: <20220209215549.94524-2-michael.riesch@wolfvision.net>
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
X-MS-Office365-Filtering-Correlation-Id: d407f3a2-f53a-4f44-1eab-08d9ec16f7e8
X-MS-TrafficTypeDiagnostic: VI1PR08MB4575:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB4575DC5FE8E33C739B23262EF22E9@VI1PR08MB4575.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5bmUesViaLms2bDWroGduFry/PsD/b9GWJgffCzKfBqVk9rmnJUs6VOtORWR/2uSKdlZZ/cllkobm62Q21HXb28I3mXWhyyFn4DrGN5X3aGHUWzbwVRdEwA/Ghm8UdWwKrsXxZsNxYaRpsHHc0Vnqrjure07UlWWdVcmCJxtlSuskdz7ho8cnTLli+Z26BncUSfma2Cw1jHC/PSYUl6Z8dUksISqvVORAQ9JqXWvc66Z7I5LiMnTXXUZxoreutk5ZDKl4Fa6mwQ+PGg2d5A7dG69xttFSmu0tp6dhgZAkzYqenmQa5tunUHyp8qv+mh4zvSN4XgTWTdwzH/E4LBPJCSiGvyyoMl/a0uHgmiebr6dPAsERTvPRUc/yINciqHWLEdRddi/LKKNUFWLezQcTz3O0/GHelOF4fdbyc4TXIxaShU58huJtaAcVXHDQJsK5/SnZYcdCAu9RUshNdtuIvGJuR6dRJAWHKVmX/2Mm8KWnA/KrPycSMktEND3VnqTb7MJt3qeoUUAUZ+P4+MgzkJU+v8wbq/XXa0vTfH3vZdktbvCHqclR8tbEPmymQaXSFZIWCp1hXUKuSddjuZm5HOCx2ox0VJkGdHGWH+Kj87z9DfyS7wzZVQ5+s0jGic4DPzpoHlBnty4vKMocwPSIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0802MB2426.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(38100700002)(2906002)(4326008)(508600001)(316002)(54906003)(52116002)(36756003)(6666004)(6506007)(6486002)(2616005)(44832011)(1076003)(86362001)(7416002)(66946007)(66556008)(186003)(8676002)(66476007)(8936002)(5660300002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wGg90dOQBK5e7FWrPnNl0ukd+/SBrdomWsYJ+ix3xg6NqYn06r96gpppVbCD?=
 =?us-ascii?Q?dOmFmnIaj+b25IwR1gEz+A+w30iu1O6Mgo8ciwx5RIkulycq57frxAuL9/Yt?=
 =?us-ascii?Q?OJZcgvOzTIBOYjBbZPITMXBpH8+BVDCMYeAwLqsO0sm/9YoGqfO12pUQ0rUP?=
 =?us-ascii?Q?yVTqtBviciooPhQywwCiXsbcx1aaQ4DY5Qv18VK4vsWt4sVu3cr9TDFindRm?=
 =?us-ascii?Q?xsQMv+oAU7f1yPipwVq/0UYvYiLxqZ0clwTb0SXTqRCPwF4jP4qfucgNmO7u?=
 =?us-ascii?Q?jP5dV33P6fRComoy/gr1jTrcf/TkkScvtkXKpLrDYvw4/S//FbxZN+v9J6Ur?=
 =?us-ascii?Q?BO4FeI8yvAex0YyFTaJ/cfP8riOhwnxTjtmFaDzeUcC2z+QQoD+ALYxeEmoq?=
 =?us-ascii?Q?1jJlcYKftwjGBI6j+khdj/YbC99LecFGPKjPzCesjgGZ+yqZ9/cBMlKevMf5?=
 =?us-ascii?Q?koDibOFcM3JqoB8Tj4TT4rLsB4UGCUGJw0dfx/cSIdNoXvXlNEq1d14FPzb3?=
 =?us-ascii?Q?RSBZjQLvCWxv16VxDDLzyg521k9oWFmWnT9Jk5ZGR5xJ4W9qNhI/sNXtgfhX?=
 =?us-ascii?Q?Fr4JiFjZqBheh07Lz1NxqdDkvZ0ZdeaxGIeAfWEQtOCobKvYtSN9njrXsUOf?=
 =?us-ascii?Q?AcJORl7ibxMGxAhwirnTra56pM9la67wmQaBVp8B3I4Vq1UMEHpeDWqCG7Pa?=
 =?us-ascii?Q?oeS3S/V5VziMXIB8MmqyHisvYOYgqQFkYSUT2AZa6IIb6D4ABLrmx1CdrH68?=
 =?us-ascii?Q?dQZ+Gy/WuxKnPrqlgZJKnxmBjdZ5SfOJZJzkQ+c1Ll8VdsOAmRJYWUDtguTu?=
 =?us-ascii?Q?etVCXOJJCfswe8lsKMKfnMvWqTTMGYj1N0PbMRWyCh1FgnLJRTZRhvw5CCd1?=
 =?us-ascii?Q?APp/Bg9OTbYh4dHTsTn7g7sdgYr9+B6BQ4xGfd06raaI3zDS6NeiI9D5i+vI?=
 =?us-ascii?Q?+snFxhNnI51iY2uquDoXj30ZbOdOggIXjtesSzAn4R6ld+LQBh46T6hf1vE9?=
 =?us-ascii?Q?7QZZlWAXYhX5WjfeNu3taDK+SCNd5tG3HWaC/zjz0VZCVwB23KrA4IXMvd0+?=
 =?us-ascii?Q?I0NTTuKwiVax3aNnMVeT76ffxrZU8UAJKwoG7eevPy387dVaIRG6F8HxXE6E?=
 =?us-ascii?Q?wrpR3ugeCUVoA2McsEOk/QC0Ran9oiBfWq9QICOwvjqQMshXcZzIsqcNQ+zd?=
 =?us-ascii?Q?8fvsDEBgDvATuprwtsbiHIJuO8eIKf6P8Rsd9RlRM2FdEV1gIrytUI9l6msH?=
 =?us-ascii?Q?IR4C4gIY08rKclL+QU2z/zRWfv4eZbCH0BRpj7X3UtBuXxpntUhAqGZELw7P?=
 =?us-ascii?Q?/6eba1X11mJ7fgcDfZKYJYk3Lms9H1oTzxU30kO66MbB4xHlgx12ErFLmKOG?=
 =?us-ascii?Q?Qgal/5kXZOAQjWWuP8LWFsexZw/bd5HqKE+AKuxuDdh/++Hzg6RA7VY11j3u?=
 =?us-ascii?Q?cFbkqSEIrQKSJC5DULPTjSk36iHeroOXu4qkg58KhiADOZ5PWbVZwCK7AxH4?=
 =?us-ascii?Q?fBW8oFtwdi4c10RCzyUJJc6X93CTR6EVf05bd1FMxrn2tjptPpeiCmZANNiW?=
 =?us-ascii?Q?onEs30gkn1e9cHZSunv/KsmB5sycrUnmZTWHE8cS65ICFHsAxcbkKqi+LKvi?=
 =?us-ascii?Q?d4vnIf02JEMyJASt7emKy6+iSuwHtF7bsY9eo1p4WNxfswFsyHyoVRFkxLTa?=
 =?us-ascii?Q?ItvdZoPBSGdxT8khlvUY/v+07Bn1jNZCwkYcVCiqHNygh6qTG/uFC6n/aCof?=
 =?us-ascii?Q?c+kJewA23+qKY7HmjfIxF5F+lkXuInc=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d407f3a2-f53a-4f44-1eab-08d9ec16f7e8
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0802MB2426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 21:56:04.4287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stQ/ariryfiFcXHKPRMprDzk9VAFL6a6cH/YmlKsGRiFaQ+NxvJsNJrBa4cEGh5Bi+lIwMjj9EImOzbUagNp4T5XIqIRFYFG8bO5lG5g390=
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

From: Alex Bee <knaerzche@gmail.com>

The Bifrost GPU in Rockchip RK356x SoCs has a core and a bus clock.
Reflect this in the SoC specific part of the binding.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
[move the changes to the SoC section]
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 63a08f3f321d..4d6bfae0653c 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -159,6 +159,21 @@ allOf:
         power-domains:
           maxItems: 1
         sram-supply: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-mali
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          items:
+            - const: gpu
+            - const: bus
+      required:
+        - clock-names
 
 examples:
   - |
-- 
2.30.2

