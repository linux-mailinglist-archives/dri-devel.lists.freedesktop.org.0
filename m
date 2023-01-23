Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 043A7677585
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 08:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB8010E1DF;
	Mon, 23 Jan 2023 07:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2078.outbound.protection.outlook.com [40.107.8.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9339110E1DF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:22:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRPYAtfg/eyL90+Yu+HGL7paqhSoRQkVLvd1LgnMU2V9zEDSri45XYpkKaBo0a1CIbwO0TDi52LXWPb9oKyEM+ET3PmqUWxoc5Ku1Ki48IE8OSpVxWjm87wVaN9BLkwYFkagGhCCLAcH1dIq2r4ZGK+1LCjpTtYH6dkbhNMnrRQnlyNHLvzPhfW1A9eYt96n9SfBMvauM94y9ZSd+K+OM1eWuelYpWJwKlIyAel1IvZzq7hD9JRHG25C/iw/6tTFr7s8aYxB+FoRqCxupjW5QZ8W34rea33VnluHYQY9PpDIJ0M8lpilQWvXMrLub45/W28IBroK+eYBqrY5aeDmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kS9KZ97ATymYvvLJW7I78ww8uR/MpwTvDHD9TKY6IBo=;
 b=oP6cj4tztErVosVyJYIabJ9+Ea6WVOiRJI/1HR5xm3crc7p2+dHdZ5a15gf3WeWVtiqdFWTyUOWOxF4XM5RjvAmOzC0xfO950qrZI8jmx4B++54o5civBijBOsvamDPPQTvKKR5V+IaQ8X4jjWryH5ffPjxHDGvGJvx/RrG4sOb+f535F0Kl6sQYXghDtvD4U8E8JHIKeto+SjM0rYuWPVxsFlPxHPYEJOoo0iVhgRZXhdsXyjndDPuuelJ6FrWfnuyFDXs7jOfKA6euAzODd57X2JOiolafogPHdYxrcg8+6L5cxg1xCaoTpPnvNP2UKl4ucLUxEDjbSbDmUZvp9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kS9KZ97ATymYvvLJW7I78ww8uR/MpwTvDHD9TKY6IBo=;
 b=NWBO2xto5+/bdy+NkSdvdsBKUwg/zO7IGVdCsznbFsw6K0ghTSjTBjKeWUrUkF8XTaZZD4seaQJ+WlV24BoYYem96T6R8lZb24GNF99HPjdNtwH1iuk+D/E9FtqacCNngIV4yYb8aNABX9n6Pmr44FZaffghq5T/PCSh3vpWkI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8184.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 07:22:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Mon, 23 Jan 2023
 07:22:51 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: lcdif: Add i.MX93 LCDIF support
Date: Mon, 23 Jan 2023 15:23:57 +0800
Message-Id: <20230123072358.1060670-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230123072358.1060670-1-victor.liu@nxp.com>
References: <20230123072358.1060670-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0104.apcprd03.prod.outlook.com
 (2603:1096:4:7c::32) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 71dec194-dd38-4cd2-462b-08dafd12a2b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /xlmXQXaZMXdIUEfbPw9wib9Awy9LveUCD5ZZUIMps14t1KLWxLYf9iYitmJgmc2Qbqmd5xXOW4dJ7rqumvB2MrToI4dkbI2IpZSGG1z9sEg461o5IHaPoRrVt7mI3akXbCg/h6Wywhh5DFXdQUmOVYUWpS1JsJsAgBHdd/iA8wnRjH7BARr9JK0770BqyhG61+79IgtWenl3xs3BeXgfOo+aRaI2YRZ60ng3QylI53vHmVkbHOJTOT07ZI/3Dl8akreAMNWy1ErynW5QPz1R30lBoIvrOP/eWAhc6XNc0nfF3MKdDkgNaxnf+/+MfhJETy5rDvNcQVOWwZ45odIrb6+U4xNppEZaeeNZqnREzZ0PGA0k792FZjnZwtc05LXWS4smQ+h4Z7NN8hESzJqrlFY676Y4yUkx7hcVZWzzExPtQW1XZGG5Qyth5WgSmOOV0Z1OLsZJLuC4FGihUtxFH/WoieENLg41iO6tNqNco2U/zxX70BsX/IITmgnrgjCI/EOzL0WWZKCOXV9PPglKDJjv6lksLYpxGjylUUM/pyPeBf94iAq3P1NfnPzHtbVqHWObSHrRRVV9ot0/almNsw/VKwi7+a32Gz9fSGVqpiqDzX5MB8jsQw1oymu2NSZOXmHwFOJm9mzbcbu0q+bGqoSo7gvPPykS9y6WPkXW7TR43mP4vwTzDTPOQUO0kxUBq7mi/35buQqlIrljzhN+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199015)(36756003)(86362001)(7416002)(5660300002)(8936002)(2906002)(4326008)(83380400001)(38100700002)(38350700002)(41300700001)(6486002)(478600001)(52116002)(8676002)(186003)(26005)(6512007)(6506007)(1076003)(316002)(66946007)(66556008)(2616005)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?go1+MGRCeucAE/xcwT0U1s4BD8s2OwJm4tPScjU6aMH2E09vxaJ9w9EHyalw?=
 =?us-ascii?Q?yaaJIkFa8WAXCl24/efO8yhc9OkNMRmuZ/WHem8FSZcO6zEBjU44VmUp0Mip?=
 =?us-ascii?Q?NiKgJ8c1IAdyQelPqHQ2FNPjrO7u/IA7HF3D3TijruDIwHpkJlUtrc294SuT?=
 =?us-ascii?Q?dOe9w0WO/cen0IjxitOGeIHaQl1neYUlW+tTpVQ5LVPxi2ZjwPx+YAHxNvVO?=
 =?us-ascii?Q?QpCvyqtLhcUUt8195+1CVnCkHgTg0jBn9ufsLKlFCh/glZSIPn3IWev8T4D5?=
 =?us-ascii?Q?BxEMpt4tMofrx15v8lkOqNDIMtq2zcKb/Yfd2+PhxgZ32O/fY6sVJpcgXsKA?=
 =?us-ascii?Q?TXfNvllCeTf4FLcyml11BzsLDsk46mgqme9gc7ODEM17wDG5yjXqMe7zVEv/?=
 =?us-ascii?Q?1PJbg0hhyZyX2D36JT+Up6I3ycHepG9HiuNdyVkgPM04SXItSgE2cC9TDXXu?=
 =?us-ascii?Q?FwRLirgd1/0Wi3KvC76kDdL6OHt7NKMJBmVTWARO27Gf4PVycqozvY0Je3Hn?=
 =?us-ascii?Q?zepbd50/vyKqpfQ68Bam0ibbMG+5Py0XDw+XNRkFPb/y6W16EkVsE+436hNx?=
 =?us-ascii?Q?KlqmWGTgIqBYXoGkRzSDX5KDNBl7XOS3+wtAK9HW6yT99O8WgDRn1mYub01v?=
 =?us-ascii?Q?jbKWo2XJrPx/vpBwXZpWL7umC4piGd5WiUkoMvRIs0KqQwpQoh2CDy1yDY9D?=
 =?us-ascii?Q?1xo7GjaQYw9qFSZqwI3wpxVEjoTzH7V2lLmrp9cPv8TN2hOa/GcAA5gXg0Wm?=
 =?us-ascii?Q?R6DM510bVLXkHVTOfCCFV7buMMDUOXzKGytN4GQ5KTIL7/Zh9zMht/pR0uh2?=
 =?us-ascii?Q?epsk43xX5Bj8tUTtOGD+7AVM0SLJmZ2tvthY2QqIbIKIE1SkcbrEfvFPaddg?=
 =?us-ascii?Q?pj4/B2ZqD9brUYri2u0ddlVwZVaZakvft09PrIWEafMt7Q4vcA6DdZAbrnVS?=
 =?us-ascii?Q?Jb0KNbf/EqfofLxvfnUmIpM2glOPDPXn1L7TyyoEPofX7Wlp3LtEoL3fcp+F?=
 =?us-ascii?Q?WPYlbCvkRNvl2lKDijTm50/i+luL+Fb+SlFXt1aavrefpooYxH87FZR0h6Tw?=
 =?us-ascii?Q?Yo3g6o/MK1GgFt3aT8z6X1Dj43mVKSZhiqzzJ9wK/U7LWZxvNBegb5FpLrm0?=
 =?us-ascii?Q?FgEhus1FYbtQ4F/n4PiiwWwMteI3mEGJ23yvcKc1ffGX1341m95ROdGlde9E?=
 =?us-ascii?Q?oHKr824B0AFgk+TpDVFaEJz+nHbKUzoCO5aOOZE8j5/LeJKh+tl69V5YUfdv?=
 =?us-ascii?Q?3Rp5rqHeKq7jtohQtE2hSXb+4mr4bTQEAEYGPHF78HPVg/IjV39FdQkaUFKn?=
 =?us-ascii?Q?0oGacPIejBO/l2CdKUsCWLSMTIY8ITpatIRwpsMe7Gc7txcH+MynvLUKuH5p?=
 =?us-ascii?Q?Sga+3FSmXYFuTj51gDCtQEoX952NJx3mI8r3ZaLCLzt3HrBC2j1SYsmm0B8v?=
 =?us-ascii?Q?GUmwgSBYf6k1141nh7qAPt5x9kF/GC16Mpn1DG16PK+QsQg+CZthedZheDJY?=
 =?us-ascii?Q?V5d1SBeMG74tYjG/JDyC6yErFJ1gFakUMkf7X934nUJcOXX/DP5ofkHt15cc?=
 =?us-ascii?Q?0d/evwD2u4zUqF04yF2gFev+h+wetXbcY59Vt4l7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71dec194-dd38-4cd2-462b-08dafd12a2b6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 07:22:50.9939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1m+sOa9+/5HvZHP1KhR/If9gDzau29FrXJBEKBb3ftBiAjq0hs+drsAJFB+mh361L55NFrcUR1KOgcvNL7p6BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8184
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
Cc: marex@denx.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is one LCDIF embedded in i.MX93 SoC to connect with
MIPI DSI controller through LCDIF cross line pattern(controlled
by mediamix blk-ctrl) or connect with LVDS display bridge(LDB)
directly or connect with a parallel display through parallel
display format(also controlled by mediamix blk-ctrl).  i.MX93
LCDIF IP is essentially the same to i.MX8MP LCDIF IP.  Add device
tree binding for i.MX93 LCDIF.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 75b4efd70ba8..fc11ab5fc465 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -21,6 +21,7 @@ properties:
           - fsl,imx28-lcdif
           - fsl,imx6sx-lcdif
           - fsl,imx8mp-lcdif
+          - fsl,imx93-lcdif
       - items:
           - enum:
               - fsl,imx6sl-lcdif
@@ -88,7 +89,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: fsl,imx8mp-lcdif
+            enum:
+              - fsl,imx8mp-lcdif
+              - fsl,imx93-lcdif
     then:
       properties:
         clocks:
@@ -107,6 +110,7 @@ allOf:
               enum:
                 - fsl,imx6sx-lcdif
                 - fsl,imx8mp-lcdif
+                - fsl,imx93-lcdif
     then:
       properties:
         clocks:
@@ -123,6 +127,7 @@ allOf:
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mp-lcdif
+              - fsl,imx93-lcdif
     then:
       required:
         - power-domains
-- 
2.37.1

