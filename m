Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 261E56FA24C
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1800E10E174;
	Mon,  8 May 2023 08:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2064.outbound.protection.outlook.com [40.107.241.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686E210E174
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 08:33:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKrBXhcTkkMIYiUQd5TWPuG4k6RyspzIwECxXi+UzZNxnX/LYmHKKZ1hhwl4NLBXC0AZ+WTB5WI5nX2T2h03RZzyzN0V9n7OOUT2Vv72mkfnkudrMnd3l1lzKoqsHzH35Ge4MtMJxBcHxy2zKHG5/JqywGPwMoWmmBMw2xuDQbVvL/KtFiDGIz+ovV3QrIWDhqghM+8qNylS6mC53K4+QYCp+D7f7t5g4XKjt3XVvjLSBEf3sM9+DELzTn9epQJAh6UbjGg6WUEl6QxqqWwN6AyTyK65+8z8x64zHCj62mbbhXeCXK1NnPTZtgPGtMUuUaPxrmefAQM0xuYNZn0OHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p986L4DAC8T8cAyXUDnV3rBAoQP+GgvIq78VMuSwVaQ=;
 b=Waq8n1alriuNyPRbtMpeOvtHULLefmRunUcPxAbz/jFmuKTX2c6TAgfuz5tSaGj3mg2RNO6O8bljPbA8evQJ8q7T26mBYQP5D4qj4h4mQRE6ZJvFSCire+7iTHBwnI24hxjTZmS7S6blJXcZ0QJhH1325kWKiJAvGUxx62x88IvDLMpBzNBEAoJaIS/wLN1qI2RV1sMMZwg/GJlHcqWjLBJx85Cr+lQQbGgKYHGts97kNb9BM2vREP1Q74w8XLRYvhM9NCaMV/zFqEsVaj38lqlIRVylIpx96H/g/BW0a0aLiMLPWJKs/asNhy3JdlW7uyS2/lDYmucsad2ZeaeYrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p986L4DAC8T8cAyXUDnV3rBAoQP+GgvIq78VMuSwVaQ=;
 b=nE2u8Tbj8RaPThNKqXes7tpp8G4vMh1FjFDdPJq8YXYjj0OZv7w0luC1vDsDNPDKeXYps47mIxhXAZYXvI49y9M1dcA9XrS/KmcweeAiGozP5us9gYD8X/MjSAEK78d6S7cpXfM5A4ClYCPLRsIVUUlBTsnF8DS77LVKGyHwRm4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS1PR04MB9408.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 08:33:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 08:33:50 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: simple: Add BOE
 EV121WXM-N10-1850 panel
Date: Mon,  8 May 2023 16:38:25 +0800
Message-Id: <20230508083826.1016206-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230508083826.1016206-1-victor.liu@nxp.com>
References: <20230508083826.1016206-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0045.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::14)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS1PR04MB9408:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c9fd2b-2c95-403a-f47f-08db4f9ef2ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IS4oLfPCdnbN26eZwVsIMTXYXbtsxpysEKVpFsNlfSitRrRxS1fJNsX/Y2S/bkhsUpkY5GMbiKagvM7a94yaMRKNZR2V7SDmXPjhUcuPK3ANSPArX2JHFQ3KPZtYa4LQfZy7kQwSFmpR4gbXzf6rSxyx4Unmzur9HVT6zVz0waj9zjMXkcmDavQloLEiIeCcLh2S4c7eCcnHpBENIuCwVHpuiItO3jLgBVdvF2g6Wb8EavzutNpQsD4nTYQI2qhRZNLUWMOW11wA3vOKWcAMRW8syH0bY/8LgUDpErBuwe8QZYUx8+jg4kh6Bev/cBI2o30s5oZVGrcy5dkzC65by4Brhn30QNrYiOHkFg0vQabkPL3d3YRqYzTNiGc+x0Lwa54srz5HQ/quxtt3bKpe7K2f4aCfdgRSWutRcT//crQVOjV1sHXkB/OHbtAYrWsLBbHRTBKCEeqOkftrn65DaIxzP4N5NHyGXaGSAo2eCe8y8QQAKqmGJNG5eqEcrf6DhGlxIxYLy0HaIigiy2467WZyEGwFJXG/AxkggNyFJgPKr1imDid7wpE1xZS6XiTB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(966005)(52116002)(66946007)(66556008)(66476007)(4326008)(478600001)(6486002)(316002)(6666004)(86362001)(36756003)(2616005)(6512007)(6506007)(1076003)(26005)(8676002)(8936002)(5660300002)(41300700001)(7416002)(2906002)(186003)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AhVltYlOJvVPArrnsMAsisbG7MQ9UWZ8MKVq0eGuMnQp0B2VJkD3pDkKA7eW?=
 =?us-ascii?Q?Gb5teGJzRzitD8NroVw+c89DQed6jAZVAnTaUvc5rqSwcP5izwT3WVuz26jL?=
 =?us-ascii?Q?Lr/+iySPlntKBmV0yL6zC/uS6UsWH4fJO+Xw7Bh/7z3DM/WitnGl+tPaBGLY?=
 =?us-ascii?Q?3k5XTGzSTp+y9awYxIIMJ0dWYvoOt/bmHMOMIwy0yB5bxItM+5nNm/btsTKe?=
 =?us-ascii?Q?PqHBTtSlMtrySZE8Fa+3/QQKKJYAEuixMBCVEs2APKhpsPZ5rL1XRfsHed6Q?=
 =?us-ascii?Q?ivsiICKV9NFIOJzP9sQc1OJSo6zBzMYRfQ+ZAfUIXZCd85HO4stIzpawD0r7?=
 =?us-ascii?Q?+sv7Miw3Wa00UgxFckiP41iOYlWlHYRqE/3J+MUFg+wXinBnmYuZftgClIhB?=
 =?us-ascii?Q?wUvrZgK+XOpvqP5VKxOvHqljDK7j25rZwADBOUlfqGJ8dwzqJ8qsvwlTmUr8?=
 =?us-ascii?Q?+FadkzqmDNzx3WzY4jTAvI9ImGYzfmtoAVNXUHkNTWcgVFJST9br/3o80/8/?=
 =?us-ascii?Q?VLUo2Czp3a/WRYJZXe3QfZFh+7F+87hPAHU3BX4tyF7Ik6JCyPswUrm2swNe?=
 =?us-ascii?Q?QeAOIVFUZctLkStoOxXH6eySKxk3DvxwTeVtikS+rsGoy/VA45hkBOWpzMYG?=
 =?us-ascii?Q?CzyMvfUsTMUpTrqdOnHipgX+cbUNTRzX/c2KxxkHtRS4rnGO3KYdId59QKwn?=
 =?us-ascii?Q?NST5j2AfMjzNBeeBiDB2pBx2zcUdjBO4FMzSFmSH3xzhSVUDMc1l4hfPaD9a?=
 =?us-ascii?Q?CgxrmL2wS7Tyi5oVavvVqRQkfmL6ZPuPwPKKWWKSbZmL8FoDYAYKg9up6gL4?=
 =?us-ascii?Q?RBdn/frJ7Yo0a93NjsI7AI9EH4dQ67iZyzhydAcnCDX1OiNP4L+tYpwMA/oA?=
 =?us-ascii?Q?N5pOb97dqatIFxBQjN2293+MO6ziAA9ZhaNworS7KRuT4Gh5as1UWfaxdVs3?=
 =?us-ascii?Q?MMdWeqvBANUb2Bpi5F5FRWHpJgZLNXeG6zeotd210T35Rs32e4wYrexRByo8?=
 =?us-ascii?Q?pl9X8d2hpNiLnO8EtA7ExGBBjzMbWTbR6rb6iMs8i1XFudp1uJWXKYEDydNX?=
 =?us-ascii?Q?oWFz4iV0Le8tSCL664iaN1YZ/NRfGvbE8HOd787ElpH4/slbwN48La5UeUb7?=
 =?us-ascii?Q?/rffJDSzywpHSEruhW61xI7wfFqu26MLk0hvWk9kzYoEjbwL4xuXvbWrA3i5?=
 =?us-ascii?Q?3JtlqpQu2Mh2cctVMLvf3EVtZ4Wzx325AqwKtBGp4BC4p4eXbBtUHJn+OSYP?=
 =?us-ascii?Q?qWg0JCKpeqZthfyzQLkui6Hx/EtBr4eRH61vYRH2WUc+MHPi24rjrovTIiaW?=
 =?us-ascii?Q?TVvDL1PQ5ZSY+s0xpYjVnGJEJfTaohtchEm2CvwXjQVROANQBVuwoh5oYih3?=
 =?us-ascii?Q?Q+MKxKO1GcJqDJ8/jGR/w3e4iDUpXxfgC+dxLnfJPRECgIy4HDj9zjwrU0Ef?=
 =?us-ascii?Q?7ggo1M4tKN5euclRhSkB5jV0l89X5tZrSCfzS8PRYVn6brEhpgVlocCdloDZ?=
 =?us-ascii?Q?Cq9nTw11eTZBPblmQHYUEe/CejJYQbVM9Yvu2hPcZNHXVvozrpCkTqudvpJi?=
 =?us-ascii?Q?MG4p8VS0wbW+gxbruW5gQYMsFsWB8CEhIF6+v+fl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c9fd2b-2c95-403a-f47f-08db4f9ef2ed
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 08:33:50.5159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3bw1I0C0pX0UeXX9Z14BcfVwVwr8EH9vwdNhWKjd3MldK8kIikyUG//kIAvxTtPPgRME99Vik0H6DRMo+U7sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9408
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, sam@ravnborg.org,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add BOE EV121WXM-N10-1850 12.1" WXGA (1280x800) TFT LCD panel
compatible string.  The panel has a LVDS display interface.

The panel's product specification can be found at:
http://www.onetech.com.tw/files/EV121WXM-N10-1850ProductSpecification_20180801.pdf

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* Add Krzysztof's A-b tag.

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 01560fe226dd..b9dbc5bb065d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -77,6 +77,8 @@ properties:
       - auo,t215hvn01
         # Shanghai AVIC Optoelectronics 7" 1024x600 color TFT-LCD panel
       - avic,tm070ddh03
+        # BOE EV121WXM-N10-1850 12.1" WXGA (1280x800) TFT LCD panel
+      - boe,ev121wxm-n10-1850
         # BOE HV070WSA-100 7.01" WSVGA TFT LCD panel
       - boe,hv070wsa-100
         # BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
-- 
2.37.1

