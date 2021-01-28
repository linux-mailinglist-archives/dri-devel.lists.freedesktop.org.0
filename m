Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CBC3070E9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BD76E90F;
	Thu, 28 Jan 2021 08:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2098.outbound.protection.outlook.com [40.107.236.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B7789B9F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 03:09:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMiTqY/u5Nn9/qXG1NLQX36ILgU3m5qWTXeKsomaee/PH6bHau5B9OpCKwIQNASnVI2tPjA5HBtdeOPqyLRJ+Iad+4536kkQyJGEyC6AwZdk564o6TB4sjv2gUw4mYj5Yj+seHIOwM7L8HG/i8mjurSITlWELUMknFtaETs70nQF3BNmx4YOZjuoXe4EvX9WOD674zLBKn+Q7eLomAOxxCqDaiPeqgIFDfDBoo5boxBaVvfq0FiXnxT6c9sva/lyFWUdVPEeW4jwnoBU1NQYXBzYheN98JdtpnHHPDLe0ByO9uAKo3xwpHA6lx6NNhBMZ2wNcdOq9Ra0ukfCGweQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMzjw8mGhLiz/yr/QZuSzHoccfMOaO9JAwQ4G+ezjxc=;
 b=FzXZc/qjr7Gbj5CD8FnpCMD2rF7ngsaP89YP58jTvzDFnF7fuXHgML5o1yRXjYJHyiBJaR/S9mNAG3rS3rH6semNVVF3gnpP1N2fx5daSrpASohS5d0PmBuYOxXd0PWSYm/Wov/qjjrLECNfqIsodPBz4XnDgVAkypj9F/9uDGp9LMJdkqo8STFssLq3tWw/LpZ77WhqxrNiOGJ4V7bVy0AkX+YA8KaWpC0hiWocmjAYX2beZf5W6LJ4Hfc/wrgoI4HncLGt2Bcyhxz1tbp/Ej5HQhUMM5+sURbwqn+s0GKRiL1R0es8PylLAs4k1kcM3HSSF/h/ngLkIjTnQCwD4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMzjw8mGhLiz/yr/QZuSzHoccfMOaO9JAwQ4G+ezjxc=;
 b=0WzqwGCQ1wPqsH3/PuI03H72XqOhnbAdDAFyHGArPsW7cuem+haYIg0bWWd4LgmOVrEJm2/4xYr13DLd0mQMQD87SQMiLjc+kTyxYqEGz6QYmn2AoJffNUYjezRu8IwATj30Z4xHREJbObtuoeUzBAKkm4CxiUY/uH3Je632kZg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7504.namprd04.prod.outlook.com (2603:10b6:a03:32e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.19; Thu, 28 Jan
 2021 03:09:03 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132%6]) with mapi id 15.20.3763.019; Thu, 28 Jan 2021
 03:09:03 +0000
Date: Thu, 28 Jan 2021 11:08:26 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Boichat <drinkcat@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v4 1/3] dt-bindings:drm/bridge:anx7625:add vendor define flags
Message-ID: <246b8bd6e51ed5c8cb3618f4259adf8aba319511.1611802321.git.xji@analogixsemi.com>
References: <cover.1611802321.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1611802321.git.xji@analogixsemi.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR04CA0052.apcprd04.prod.outlook.com
 (2603:1096:202:14::20) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HK2PR04CA0052.apcprd04.prod.outlook.com (2603:1096:202:14::20) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 03:09:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7c6806f-0ed5-4873-cf25-08d8c33a10c0
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7504:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB7504F5E802D7A7353154A1A2C7BA9@SJ0PR04MB7504.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T/l4LIOybi802UkOAfDjmdHDQiivsLgE6lsPDu8rJapPHoaoMxHpQshu1cWjEDgmklxEN4jtcUdbJLjgPywr5TGsw2ZG5SRqaG+lekkjj3sCJSp3mf30PCCZTDhuomCLeoVMhmbXBh8hNjw0hJ97nw3MjD8NIJb4bBO6v94ceyDckrozHwUkiWecGLNxPKSdPtcRMYUjJ/OQ2H6roZYel0F+Yjdp/VBO+2cRs/sXqiI4jvK/sCbUdL6c1rZ0sUZXV7lFr5s09fLKgIMOEbcuvk11UKGYDzdxBXW390pOxTbHOdfMX+9RscA+eSmXsEZ8x3KDlnBBtHQxEipfvy3bM5t+cmlRqRyP8dUUVtIU1EGIiyzmqfSr3Sm/D3n9eXjEhXKngXPaRLAP+c/oJC1+XkPCdlLHQIqs+aC/BleS/uv7G5CjiR+94WOyOjs9IQw5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39840400004)(396003)(136003)(366004)(478600001)(7416002)(956004)(8936002)(6666004)(6486002)(5660300002)(186003)(36756003)(8676002)(6496006)(110136005)(316002)(52116002)(4326008)(83380400001)(66476007)(16526019)(86362001)(66946007)(26005)(2906002)(54906003)(66556008)(2616005)(16060500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?R/KqUZacRslJOwa9Z/qv1f+9ZPLDf1ZQslhHAmy3gIBmnp0E6cFb6l+MqLOe?=
 =?us-ascii?Q?7OTk/ONSZ5QypX5OZWcc4NbxKty9wV9AaYmnWdrqoEMuNoApfrX2xP+Y/Wcn?=
 =?us-ascii?Q?nIAqFQmoJbK8OzhyNXbGG+oPhjePB/vh2ZItH1Wd4yr/PueyU+xNPO3hbrW5?=
 =?us-ascii?Q?hlV500eSC5Xik4vYlpMNwZmxVZAKiMDDdRrEV+Uy7Y7R+MDFUjcN6gj1d/vF?=
 =?us-ascii?Q?DFaXVHQeyQYmBO5Fhx8R9pwB80hNes0Sdl7FSu4ZokeHLz+1AMbkUiQBA5Ad?=
 =?us-ascii?Q?SYZcX8BM4hs4l0FCIchydKSddMlXRThK/nxRH5YWnZAElu1VftllBVhv9sDR?=
 =?us-ascii?Q?j09+CMLFQ94cK11bTSt8Mvg3VeeV3mJN0ALoo1IrsWIeaw4IaNt58J5M+LMd?=
 =?us-ascii?Q?iNUV35u0EbIAD+Ps+6fldulwig33QO2xVAeuGTMs6f/lUFYhgb8AGSlLRsS/?=
 =?us-ascii?Q?VDbWhFXUELqV/IHo1ZjxNxwAgtNqy6iQnW08aQsrHZH7vVumUOomWIoiypiX?=
 =?us-ascii?Q?q57IsfPnYWAi65WoCCOfNhxTK9cacu4z3dV4zrOLATXkoZDC8knG/kOgt80K?=
 =?us-ascii?Q?mCo6S5TLW4ZiA4dFaHvDSOW7xEkSZzZJZt+jJJak4wCAbfejEwC4WiWXXIAP?=
 =?us-ascii?Q?W7Uge5K1nwry5lm1x61a3vkyBf3mFTiqsm66x3YwO+EcXy2qltPjhuA7w5fj?=
 =?us-ascii?Q?duchHCW1LvoQLFDZnE2i5tlcm1z0+PAUwGl1iJQwvHuK3TAlgL23C5wvbIC5?=
 =?us-ascii?Q?xMu3eMMqzUvzLdlM2+RkS74WZay0+kUbEtH4H88+CEHF2sOcQmRTeabBWEEx?=
 =?us-ascii?Q?riNcLv+KK/LcCYDTi2fKlpH1IVFdO/8hXkKwNboHeqtEnd7g6xBpGis34sAd?=
 =?us-ascii?Q?nBy6LJFq7rG7KAwnYOBFr/VHfPjweijJIel3FbZQTESt5ED96oND5vcpwvGY?=
 =?us-ascii?Q?Yy6k12vM0/diuDf9CepPi9u2DsaTB5sk3zbr+cGg9HrhZfwfZqgFP6mADvxx?=
 =?us-ascii?Q?hAJSH3u0N0OJd8alNm30l5W7GJkDod6HbJLe7pyMdAoaDiK1Txz6uIcmi5Qh?=
 =?us-ascii?Q?8MUgwWXm?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c6806f-0ed5-4873-cf25-08d8c33a10c0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 03:09:03.3309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iaAf0rYM0fiWcjwkuP72l5SHvq/Oxln8I7z8IFF9epRgCnP0IcUL8d052p4qfu49aWLhekYRDo0+DTAy9uPyrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7504
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
 .../bindings/display/bridge/analogix,anx7625.yaml  | 54 +++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index c789784..048deec 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -34,6 +34,24 @@ properties:
     description: used for reset chip control, RESET_N pin B7.
     maxItems: 1
 
+  analogix,lane0-swing:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 20
+    description:
+      an array of swing register setting for DP tx lane0 PHY, please don't
+      add this property, or contact vendor.
+
+  analogix,lane1-swing:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 20
+    description:
+      an array of swing register setting for DP tx lane1 PHY, please don't
+      add this property, or contact vendor.
+
+  analogix,hdcp-support:
+    type: boolean
+    description: indicate the DP tx HDCP support or not.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -41,13 +59,45 @@ properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
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
+
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description:
           Video port for panel or connector.
 
+        properties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            # Properties described in
+            # Documentation/devicetree/bindings/media/video-interfaces.txt
+            properties:
+              remote-endpoint: true
+
+            required:
+              - remote-endpoint
+
     required:
       - port@0
       - port@1
@@ -81,6 +131,8 @@ examples:
                     reg = <0>;
                     anx7625_in: endpoint {
                         remote-endpoint = <&mipi_dsi>;
+                        bus-type = <5>;
+                        data-lanes = <0 1 2 3>;
                     };
                 };
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
