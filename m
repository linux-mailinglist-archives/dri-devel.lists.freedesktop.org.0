Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772B93A3EC9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 11:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268936E055;
	Fri, 11 Jun 2021 09:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2098.outbound.protection.outlook.com [40.107.243.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2DD6E055
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 09:12:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwtBKoJ9uCekgNhVD4dtcIxplamA3Ae8UJ6olb9vmjNYMJwShFsaW3NGj2l7wUtEX+mJwDtTRgu9guOUSyTXDGXbcXUAz0GbJMGDD+j0y8AiBQ1i16IK4OswxcCh6KcLpl543gC8HdDw4XKMoOix12P9BSQZDfDmFKwMYm11Bu6iQbdFOViofh2ur77bZ/m8szwk5izmQGOaqNGkg75FjF+avn0dbb++Ioa5wsIKoRQiZ3okCG46a8OjTucZnl42fYE7gaOFTQeZpaY4sf2gSx+dEOezLSsGu1sfVuKggYSI5OvRgspSOybT5UCM2AqYanwb6YrdWL4LUfX9bZcGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHiX9lQtnIeKhj6Qt0SUl/JhVCIyQh/ysPONcF8eE/M=;
 b=bkAw1z7Vbf8HeWQDMuSQYrQ2oqaMsefszMGoZGf6ywveJVJNryzJz3DUAL3EwOQr6UKl4OuO1nhf0AQOzsoDzAvDJ+xYswVKHKS2ucsAKYBoJxxUkUO6sHy6bMkzpLrJkYloFzKjdKd91xATV51zfa4MK2/sAciSVDJ1OgasRXfbeBmqq1YmUSrz2NJ22vFIyS508fbcc5Btk6TiP3WBhWCD9U8Fd9QbaTdhbUadnkHIvtK72432uJSqUkJYpORxGHyuETC/UkGoE7Ys3Nu2r6A799wBL4b8MfNmagL2Y2fqkqT+7xinwFNh34S3nDR+Ax74O//0ejBh7zJ8bevJ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHiX9lQtnIeKhj6Qt0SUl/JhVCIyQh/ysPONcF8eE/M=;
 b=xdQUxAbrxiuBAht51ZJVoV/0JtY/sJ9MKWkX4C0qJS6+XwT5r9cMplq7cBWHW5bTpmuMHJGOFzScAuBDhSMl5PibHTN34B97VHZFNZ2Tun8x4xQJoz5J1+zZyr00HT/rHBQ4XeO8BQHHMBFlq6jecYOiKUX+sZCZd2M5KE7mSw0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6615.namprd04.prod.outlook.com (2603:10b6:a03:1db::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 09:12:09 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::8d56:f2c5:7beb:2bf3]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::8d56:f2c5:7beb:2bf3%9]) with mapi id 15.20.4195.030; Fri, 11 Jun 2021
 09:12:09 +0000
Date: Fri, 11 Jun 2021 17:12:03 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Boichat <drinkcat@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v7 1/4] dt-bindings:drm/bridge:anx7625:add vendor define flags
Message-ID: <75faf1744b7857508fa21578e21208216561e82b.1623402115.git.xji@analogixsemi.com>
References: <cover.1623402115.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1623402115.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR02CA0209.apcprd02.prod.outlook.com
 (2603:1096:201:20::21) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0209.apcprd02.prod.outlook.com (2603:1096:201:20::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 09:12:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b19ededa-c35b-422f-0cc2-08d92cb8fdc3
X-MS-TrafficTypeDiagnostic: BY5PR04MB6615:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB66154B46172D771C59BB6C18C7349@BY5PR04MB6615.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aSMCXqg6j36kb8YjOmwApzDYejKaaq8ND208ZtomzfthV0ZSeTgHhVCSB6wf95dC3nZS8lhfUPyhSSymQhhaIwuCz5Omq69Xj8P00atYYNS7tiKieCm0ykkdaheFARwvquR4gJot5pSnUMTVJGzKkUdxNOB1So9QKnZudH/lErguQ4QFY0zOG/yfgsLJN304fcYzNDkR02vFlP746hDgQkttJsAM9gcLF8l9zBbdPQoQpcRUm4HlhpHnYfUl544brZla8rx5iAfIjcNaIynFCxPRyWuKMZqPfYNA64dpwHAycSFVr1ULzd0EC6X81BEBXq5/5ZCdyzSwUkYcggiElrNUYTvGlsUfWZB4Tny+u4SSN7qxVk6QOeJ8fgpiIE6KWqH7oxrhpz97j+U8p2B3fQuIoNADvRTzv4fxhArnEarRd9bz9catxMyMqHY/MCkLBgcIJqeHbHzKsSuxko/Irhiz/vzelvfXr52DkIKTQf8GX8k+gNCoAWQ7sYWBjQCHyTP+7H4s9e8tZ6IJM8QAdGk7juuv0nZkRMz5bQlEcttvIieLylWYxUXrg0RxKGrLDIjiOfqHDEq0iqXz9RerLq8RH+8bgB2qzx3c7OyCQhkhwtU87Z7XK5/RD3yn0FsuPMbJVcdgktQV5eU9AG96oQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(376002)(366004)(136003)(346002)(396003)(55236004)(26005)(5660300002)(52116002)(86362001)(6496006)(6666004)(66476007)(6486002)(66556008)(66946007)(16526019)(186003)(316002)(7416002)(36756003)(83380400001)(956004)(8676002)(2616005)(4326008)(110136005)(8936002)(478600001)(38350700002)(38100700002)(54906003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qD6bSAzHrM48l/zowxjV+9t4dV46hPcDHCoWVwSY2z772w2BLy7Ygx8G0vXC?=
 =?us-ascii?Q?/+lEjoyOGPbsAMkDFg1+NqG11J6XEWZLDIcK//QTLu2q3MaDWnZkGEduSATd?=
 =?us-ascii?Q?QGKCovjetkVc8NplgE/GW6J1xQbzlyGHWel4sQXfE3elBTWNt5Yf4RUv1q/7?=
 =?us-ascii?Q?O5fTDkg2/fjnM7qwaElUH/D7uPkeYCgt+4nZQKHQ639n4Jb6zuGzWdk9tuZW?=
 =?us-ascii?Q?dS+5OX4GP7AiR04DxFA3FBu0DMbC3siUm41YfKAcyTX+dE/DxA6zCqVZhHCJ?=
 =?us-ascii?Q?EmGJgs+gmbUW5RZfa8LqH/W9ey+EcLewaeZFX0q2evUbItwkWmsIinrEMq6c?=
 =?us-ascii?Q?TjzcPzoTMhYBhfQbMfHdR9MD5kActqZp0Hvg+YJ1Qz/OydoD7bqh1LAfDh3D?=
 =?us-ascii?Q?eWUG3DQVlqE/2vgkWHHRIZsMWVzJjog1yx6nsbrdP50AG1NP7FH6+JDbsoLO?=
 =?us-ascii?Q?eI5oeiLIdHZpwivvSZkLYQNjlstTXnq6GipsOaL8MJMcP7iylEwpjfWQN0n2?=
 =?us-ascii?Q?JLqYrnV0b+HY7SRlHQjVx9zwQPqlSW7dz2fQjw9MWn0Kqq9aOMl4B7R7UlYu?=
 =?us-ascii?Q?jPjZFepLKT/7P8NAkSCVfnqRwvsSr2CTZJsGTLV4S8v5M03eS1vLJGLRdul9?=
 =?us-ascii?Q?SMS30KLIUaW3D84dSDiui/sd+/L3dRVUVuBszdQ7rABJeWy8EQOjRvpLqMMM?=
 =?us-ascii?Q?2xaOTTOczD/gfBdeInfnjg5Tl76v4D+i4jnB9UAio1y2stqqcG5WJ1Ye0VFk?=
 =?us-ascii?Q?8XxkYMljAU0DpG6ThN+sa8Cr5x5QW9EijLImHAPRjtW4WsjQ3WJhobS1q4kC?=
 =?us-ascii?Q?L4GhbSezMgdh0IwkYvUlPjd0+O3VqWShCN4NFwQ3xSORQy1g70ksaxd7dULP?=
 =?us-ascii?Q?o9WkKCYnraAME0NUrjoSt3Qq42ZrS4kBpdICpigQZHCUKqBM/BM2rvGharLk?=
 =?us-ascii?Q?pp1KSAyzj5VSM6xJvrrXTn6eQI0UiyTUubr2YGB6T32pA4Nny+q5qvG/iBRj?=
 =?us-ascii?Q?yatYfFRu2oo34N+ndZUGxKZWSjUNsrF/KaW7vnJYQj2QjnuKLuez7EGXzvyG?=
 =?us-ascii?Q?DtC1KQzB7wwQTrn3HMSDoqw6M7wQBlqCDHBtEcPsLNAbi7vGDOIyqUbNO0KI?=
 =?us-ascii?Q?zrV9kGUVaPSqocfTRcSb6IXauzUXOgMwKFDZwqpa4QPmPWB8uJwKWepsrfli?=
 =?us-ascii?Q?3KR/4mr2rGKYR7AXwkXwl2a7GAuXrrzqs5SbLzDz5XhCywo1CR9oHyXJU7xk?=
 =?us-ascii?Q?Vfn8u1mP8SLSVUCRxiRnPr6DOZT0MmZfVMb0273gfOWSDnkAsghzVk4iwGwF?=
 =?us-ascii?Q?Fy5Ebbnulh7EW2J/rFYezCwU?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b19ededa-c35b-422f-0cc2-08d92cb8fdc3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 09:12:09.5735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLBpM/pujUQO6JYRVGjMouv1AUzoR4Pjm3Urgz/YfmtyQnQGDj5ShXi7hnh9b6RTNHWoV5rMcZILPU9rERtyIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6615
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
 Zhen Li <zhenli@analogixsemi.com>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 Bernie Liang <bliang@analogixsemi.com>, Sheng Pan <span@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add 'bus-type' and 'data-lanes' define for port0. Define DP tx lane0,
lane1 swing register array define, and audio enable flag.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 .../display/bridge/analogix,anx7625.yaml      | 57 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index ab48ab2f4240..9e604d19a3d5 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -43,6 +43,26 @@ properties:
   vdd33-supply:
     description: Regulator that provides the supply 3.3V power.
 
+  analogix,lane0-swing:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 20
+    description:
+      an array of swing register setting for DP tx lane0 PHY, please don't
+      add this property, or contact vendor.
+
+  analogix,lane1-swing:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 20
+    description:
+      an array of swing register setting for DP tx lane1 PHY, please don't
+      add this property, or contact vendor.
+
+  analogix,audio-enable:
+    type: boolean
+    description: let the driver enable audio HDMI codec function or not.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -50,13 +70,43 @@ properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
         description:
-          Video port for MIPI DSI input.
+          MIPI DSI/DPI input.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            type: object
+            additionalProperties: false
+
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
+            $ref: /schemas/media/video-interfaces.yaml#
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+            required:
+              - remote-endpoint
+
     required:
       - port@0
       - port@1
@@ -87,6 +137,9 @@ examples:
             vdd10-supply = <&pp1000_mipibrdg>;
             vdd18-supply = <&pp1800_mipibrdg>;
             vdd33-supply = <&pp3300_mipibrdg>;
+            analogix,audio-enable;
+            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
+            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
 
             ports {
                 #address-cells = <1>;
@@ -96,6 +149,8 @@ examples:
                     reg = <0>;
                     anx7625_in: endpoint {
                         remote-endpoint = <&mipi_dsi>;
+                        bus-type = <5>;
+                        data-lanes = <0 1 2 3>;
                     };
                 };
 
-- 
2.25.1

