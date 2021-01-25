Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E76AB30380B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EF96E422;
	Tue, 26 Jan 2021 08:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2136.outbound.protection.outlook.com [40.107.243.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0922A89CDB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 11:12:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7lZQ2Kf5Nupm7wFPbZImN2sglRFvYuhDEkh1iP8o5loch2V8VuAxPYsPCphjDT0k4sO/hT2mYEuUUZ5Nlq2T6lRpjv5KxsFrs8uGow+Mp73jZfMeqCKVIbwA4I/ofnFqhv9fzyH+s0dGKANanNYDMKr4Tn62+V3GQFz5FV0ug3Y2njs1U/XOyzILDon37JHkDYbXeT2qa3gZSkHtG7g/fG5rF0MwNTnuDFQr3icZ+ekEyxlHJwoN5H8ufhnwLcrx+mtkpxQHQ0YgZOeP/Zsn8eF20aTxEJwEledw7/xbHWnSJdQLetZ8sMg3Z+jZQKHfvpDvFEO2Jl+qo+9f7DmQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxg3+JEk2NgPu096kffKI0yZ8DWEXezdVXlEc/xTh/I=;
 b=gjVaWjXK9GDRA6hmhikgQ9qbMabeRos8mJYXQj9s95kWGYdIJMu7Zfn1DB834TGwdewj15i2tR1FXJ9fIyRoZt+Jy1KiPLqqeuG5DYRflUhsgBWIkiNNvxAQy440QbHYXpgUKLi9S/ooQTSu/tZWM3Tk+dRRy6KZL/8sC86mbsLot6JgJ5SKS/WjSeEIVQSLWCrs6tepaMZQ1CwGILyCo2kS+qBV10Lvn03A0BLzvoltVfp9gZP9tqQOGcfONlFwKmu96lJOnF7WSDwory5H33cafNGn5BZgsqOiMQK2g0Aq87ViZTMI/elJCYqtNzrAgm1nbdB5aGauiG8iMYmbig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxg3+JEk2NgPu096kffKI0yZ8DWEXezdVXlEc/xTh/I=;
 b=pKDgeIHVZy6E4U4JdTGTkEz6wh5B4MZVfa9xNCXUHFy2c6bJE4fVZYq+E+4MTjM4TWTc0ctTP2qjhAfV+kCJoNf4iHWgZnxNhPnmY9J+yTwngA0X0u2Cf4PypAbdkOj/dEcZXg11ZfzxjsnaI4kUACCAQQwY5GkilEsv9x6xxY4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB6262.namprd04.prod.outlook.com (2603:10b6:a03:e3::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 11:12:50 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132%6]) with mapi id 15.20.3763.015; Mon, 25 Jan 2021
 11:12:50 +0000
Date: Mon, 25 Jan 2021 19:12:21 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Boichat <drinkcat@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v3 1/3] dt-bindings:drm/bridge:anx7625:add HDCP support flag
 and swing reg
Message-ID: <75e29d7386df2ebca4a8e3f0b91c8370a4a8f74f.1611572143.git.xji@analogixsemi.com>
References: <cover.1611572142.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1611572142.git.xji@analogixsemi.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK0PR03CA0114.apcprd03.prod.outlook.com
 (2603:1096:203:b0::30) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HK0PR03CA0114.apcprd03.prod.outlook.com (2603:1096:203:b0::30) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 11:12:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f332bf7-b1c0-4867-3720-08d8c1222715
X-MS-TrafficTypeDiagnostic: BYAPR04MB6262:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB62620BEB534C07B46F5B46D8C7BD9@BYAPR04MB6262.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N99Di+zqQLAG4OHDj4qsVPB27BxX7EUQbisob9KAU1vScOH8JCHAwFLGNsZ4RnSOCjmUiBsKr+CZrdMrjy+HVTiHObJg1JN64sNAuIp/tvs7YkNczO+5kLMDMrq8Gpnjtdd1nuc5IjV4sv0vH3otX2d5SgINEYGjeGz6coHVaYWQ8Lu1FP3LOUbqAGD+iW3ICex8iYzGHP0i/Rleu14+MJi7Cd8Jf7XzqbX0+ybFgBbNaYG8VcAcOtPKC70bA+hR0lKHkOg8VBmj92C/1NrAmMN85bbiDNdEwPaku3SXvKx2Yy/GGHOuoVDz8z5aevJicCUGwolX8TNcvIyaIWpCrrpZGcJoI6Qsoroo6qrKxhYt2JH9ej9YeRq4Rh+2jFQ5gJaVmH+ZgiCk8MExTmoQWtbAyySlvweKztp/W0iWOTBR6MF40H13b26QK+p/hz8BLMuEKNHYADJ6xVPtaHUhhEEs9l/ikzs1fXq1BowT5XVQ0H0bLtlkSDvbrP3JIpBJqs7u8Tbmuy2xfhcHlGBVzP8Ln++UZhzlzKtTdjxxRmt4Hkjr9sY2nnDHfZ/2Fi4JnYwmU5Y8GuzmWw4RY986QQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(39840400004)(136003)(376002)(346002)(26005)(186003)(6486002)(16526019)(83380400001)(2616005)(956004)(478600001)(66946007)(316002)(110136005)(54906003)(8676002)(8936002)(6496006)(66476007)(52116002)(4326008)(66556008)(86362001)(36756003)(7416002)(5660300002)(2906002)(6666004)(16060500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Rbt/tmeuh986rSU2+gYYJa+xPQIQ+Pck+davhooul3VWLYsxqFYczGmkOAqf?=
 =?us-ascii?Q?GLaa2k+HqjjRiwcmr+DKMIwnd6DT0VFHXspP6UWhWDcQy1torvq3O+79Rq70?=
 =?us-ascii?Q?+Xl7YNWtplXbuKxXTBDc1qH2dmVU7epr2lg2TyToiJVvmCFLq8qIusjqAIHw?=
 =?us-ascii?Q?pwck8gyLOrEzTrMwCmJyMMmlZDFas1X0ISDLGXtCyRzNHVR4Ks3aCpuDuCQg?=
 =?us-ascii?Q?h+ftbEpHw2/FeYTQd+pw4+8l35LEOO8dbPtp3kcZejFIfeenLzGWwsCEoiYm?=
 =?us-ascii?Q?SudcqIL3M1wD4JvYOQLUVcxM37Wmo25Oc7gvnYnOxKgOkcrdzAgADcRFdrzB?=
 =?us-ascii?Q?2WEZ0nOcnTVCV6w3jRD13cBtQna4E78VmW75gm9JSh72hDMVIGIOpcuVk0gC?=
 =?us-ascii?Q?dx3SAaBpsFa+4KKaMHHNom5+8h3LLt0hZZVXpe71mC4zLs+xEp3TMdGKVcl7?=
 =?us-ascii?Q?jpWK73HH3HW0cEtYLRzOPwZ8pjFW7QS26q03W6lmJCOJA6f+FE/OZsf2IaTR?=
 =?us-ascii?Q?6pimMTq+W9uH4s7ep+s9IUrm9zHC5GQUEJrpqGzxTiramWY/xi+YqKsOXpR7?=
 =?us-ascii?Q?ThOILYUESZP6b76czIu7jKAU43FJombVRbOgDu2sUddmzE+w2U+ZzKVvgJcm?=
 =?us-ascii?Q?0MuSuWvG8azrJVS314wJqoduZ54QcbkyjYSsOc0MqP2vvRcRbA1lLnbnwIjY?=
 =?us-ascii?Q?ETtBpInJ37iEgWlN+fEcM77YcFTN/78uTc9BSpktrUlSmD5v6o+JBgqP4/q6?=
 =?us-ascii?Q?SRMqR1Ar5WQeH1j/ikW/UPR4WVLlu21+NDpdZvurDyC1STHIiXcUxmHAqX/s?=
 =?us-ascii?Q?p6jD8WfgMwWG0PqdWSpjcT2/gZvOCDo+3sQJ8dTqB7MLB7WchQdHrJUWxpGr?=
 =?us-ascii?Q?Z+SqNBrWARMIkC/E3NY25SiTygK1LVJtXheFh5DGiFlW+Zv2hQq2/5VuOMAB?=
 =?us-ascii?Q?xCfSUs9Hu0ge5kmuwsu7xpbIOC7E+m0hpQVX/8gKSwgPEDgsH8GsmiCgQ+9h?=
 =?us-ascii?Q?Yqm0jm79exp3cOHhmjfkPtZy0ZTL2T3LxApjG+7jBuDjkdgIJM79X6g7KZej?=
 =?us-ascii?Q?bU2a0e4W?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f332bf7-b1c0-4867-3720-08d8c1222715
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 11:12:50.4802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnzdPO5zEaieu1iUcRHszYqbg0mGev9Nl1l+TVL17LRHvdRuu0fUWvMpJiRFAgcf9yZvcYc73EnsojLKWsk9xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6262
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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

Add 'bus-type' and 'data-lanes' define for port0, add HDCP support
flag and DP tx lane0 and lane1 swing register array define.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 .../bindings/display/bridge/analogix,anx7625.yaml  | 57 ++++++++++++++++++++--
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 60585a4..3b1cbe0 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -34,23 +34,69 @@ properties:
     description: used for reset chip control, RESET_N pin B7.
     maxItems: 1
 
+  analogix,lane0-swing:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      an array of swing register setting for DP tx lane0 PHY, please don't
+      add this property, or contact vendor.
+
+  analogix,lane1-swing:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      an array of swing register setting for DP tx lane1 PHY, please don't
+      add this property, or contact vendor.
+
+  analogix,hdcp-support:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: indicate the DP tx HDCP support or not.
+
   ports:
     type: object
+    additionalProperties: false
 
     properties:
       port@0:
         type: object
         description:
-          Video port for MIPI DSI input.
+          Video port for MIPI input.
+
+        properties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            # Properties described in
+            # Documentation/devicetree/bindings/media/video-interfaces.txt
+            properties:
+              remote-endpoint: true
+              bus-type: true
+              data-lanes: true
+
+            required:
+              - remote-endpoint
+
+        required:
+          - endpoint
 
       port@1:
         type: object
         description:
           Video port for panel or connector.
 
+        properties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            required:
+              - remote-endpoint
+
+        required:
+          - endpoint
+
     required:
-        - port@0
-        - port@1
+      - port@0
+      - port@1
 
 required:
   - compatible
@@ -73,6 +119,10 @@ examples:
             enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
             reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
 
+            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
+            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
+            analogix,hdcp-support = <0>;
+
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;
@@ -81,6 +131,7 @@ examples:
                     reg = <0>;
                     anx7625_in: endpoint {
                         remote-endpoint = <&mipi_dsi>;
+                        bus-type = <5>;
                     };
                 };
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
