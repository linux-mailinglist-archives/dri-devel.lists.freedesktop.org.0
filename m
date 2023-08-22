Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B17783C46
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 10:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB82010E2E2;
	Tue, 22 Aug 2023 08:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2072.outbound.protection.outlook.com [40.107.6.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9A110E2E4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 08:56:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHYgra2UbzvxdQduL4qpHnXFMVxCznltCp0ws3wsmtLsp2QqWmCmtDCFEnlYXAQOUvB/e3vO28L1ruj5BnVGngRNjfQDjQ/3PhZxgSBB5g+utsb57O59h/cQZUCrVLcPnYTaATFwXcgZ3abU7gVCq3t/Niwe9J39g90g0NlY9QEQ2zvRImiAhiLIJlipi2dqDRiodly2zgRsGOH3h8KJGmDj7d0c+l6qkNJKNRox0quBagkWC4TtU7VZrVR8slo33YN47SsimkBbNgErPhcjlTd9Yr09DmWggmsMq7u0a+kKTKOtoDl2Xu1rbqw1AOu8dJXyM4DMdnjLOZM75U7WZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhXBP1d4GSWTL0ZiMaJVqgy2TLilSqUY6DhKMTu2sXI=;
 b=IjmJ43RF2KD5ZsjX7QTMWjt/tgcA2G+Tlj8BV94M83W5L+2AIzS9/lROhIE6NRBoIlRt3kME+3IEn4M4dcmAI+pLQHFozm1Fo+2PmIfc35wo3B4+wwiKH9YnZutNFM0gyWw8wFURX+ZhLXyEbJZn7UlZXByi/GXyNsF8kQc1aTZbbbtSWqms0W0dDQ+v8XJH4Vw87BR5+Fldl0i9+BvIc15TLnBzkqjIEjMkh7XdOLGEaGpDiwVqGz2Df0E6Pqh5ytD3StBMAy22Z7CwRnAxHp/ENPhg6NjhXbUSzdXqobuOAiyIxFL0swZ7vF1B7fRgFG2qJ6Nep/3H/OYUenCrZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhXBP1d4GSWTL0ZiMaJVqgy2TLilSqUY6DhKMTu2sXI=;
 b=JQieRt35Vcrm5jS6vYjgQqWIqwurA8SVj8eEge47n6ZjRsD9HkL30yv3ZzWAObTlGlEoMs91BtEWAouxQjIgSaqYTnZZsCLzlC8nmpFGdSEjsgSZQZShE6a45U2T2D8hlt4iO0fcpGTpFgihRnlsoL9vaKs49VvkuWs7XHsrRac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9970.eurprd04.prod.outlook.com (2603:10a6:20b:67e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:56:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 08:56:20 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v14 RESEND 6/6] MAINTAINERS: add maintainer for i.MX8qxp DPU
 DRM driver
Date: Tue, 22 Aug 2023 16:59:49 +0800
Message-Id: <20230822085949.816844-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230822085949.816844-1-victor.liu@nxp.com>
References: <20230822085949.816844-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9970:EE_
X-MS-Office365-Filtering-Correlation-Id: 00da75cb-6978-4ecd-de22-08dba2eda745
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 639A2WJHIZHgsKPV97gRoVOUmJGSU2VYyD92lH9OpdTBJ1NeQcy/vuc/TbCAMW3IUh+rcCMc//tVvZW6NssDbFEBQ9P6O16wflQBD8+qFj5yCxztYtIF9OekIu+MXE6H+Ld8z8swl8gXzu9VS+WgDH8NgywKccH1jBEjR97nKGNupqbHa1XtFcmysezyfptslBdfUt84vl4avtvyC9NE0c9l0ZeAM9QNvZqeYYdcEVtaZ1b/3eUoyEus5iXcj3yBMSxldjicyZ2uKsFt6+k/ievoXp3zQHkqp2fy0CJ8dUFZ4B5/Q/suezslhNolDnzUujwtmAbCoWuYcm3VG6y2VTttgfsPuim7Us6KECCb/1PS6rHKqqAQBzE94Xys0lRgKVQyBB1M4SXjeTWHBm8oLZ+NJLQs2SsKL4hxbtDKps/Mybd0fB1mDi5hcIX21G2hVQXyaFY7OFiZKEVKqMXr4L9dac2D4H3RzcV8sKX09y2rsN6UzUJOt2w58Y28er44LtxHl9YLI4TZGCFOd75XB24u+/pnGq5Hs704q3jQUp5J3/uP14tFbIzFjw+SIpTmCxtvHJhNGTknGZhPr4eofYbPm/zsjkj/0x87TungVgywwftzE4/LOj9ZhclxVccJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(1800799009)(186009)(451199024)(66476007)(66556008)(316002)(66946007)(6512007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(1076003)(478600001)(6666004)(38100700002)(52116002)(38350700002)(6506007)(6486002)(2906002)(7416002)(86362001)(5660300002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T1ys8vQCPELEzqqmpMSS83nSVdPZHIxzoJgQY5NPBNDVuM0pSttHGqCwHzGp?=
 =?us-ascii?Q?srV8GC/vaeL8SQZciZplnyukReLQUhfRn1Iv6fz4bjz09iClWrFmxG9DH8Ma?=
 =?us-ascii?Q?pjmsDE3ZaxqDd9IHanT/cjV27e5RhnBQphiiWLWBf4SA83AoEzdJl0F1IsAR?=
 =?us-ascii?Q?0o99m2CU9mFEpV9pa/PECUnR2LwaxfFXtCCfDA6gYbRV6Ak19U6TqXUmwfHp?=
 =?us-ascii?Q?xs+6SNfOvICjB+YFP37qMW+BfLro9drcprIp1iCafft7THaxx7FsVnzzAtCN?=
 =?us-ascii?Q?fKrna43ths13wp+SZJQw67TAdx2dfuT8D/XytHYduB+XEmWvmZaYFsSKF9AE?=
 =?us-ascii?Q?NswUwxhgT+Q25Orf1Hdh43RmoWSso30bENF8WAtyClJwOjHA0W8H7ktTgh0T?=
 =?us-ascii?Q?LHNdWzbwx6D7k6vSr7HFhEyKDk62Q7f4Km/ekZOc/drgFtBiphUm9HMnK1Lt?=
 =?us-ascii?Q?NGsFEEiPt3h/r0EJ50J3e1FcnxpHrYMuHRbOeF/0kgeB2wx4F7/hSyyGFH92?=
 =?us-ascii?Q?IUHRnSMaom6EAsImlqkI34S2CML8M6mMaRj4jfFSejeQcex57gDG1j2+PLpc?=
 =?us-ascii?Q?wjA6L5+NyLc67GkRF8smQRL/YUwkpN6HiYQRVgadUJgFVax2h/F+pMO2xiAt?=
 =?us-ascii?Q?vsKLSP7AhWYW6bDfNkWVSRcmJtpyhLvKNTjDi1eg+miXwACRhscqMEPAht7K?=
 =?us-ascii?Q?l+yk9b2Y7HAIGvv+RdRhmlOywLxOah5ekDU7XqJQDNLbwR09M/hkNkn0bLb2?=
 =?us-ascii?Q?18/NynogItoHQ40yGfScXnBub4gfWYGZsEXtVlxG1oRoB4RlNm7WuT2fFEYh?=
 =?us-ascii?Q?v4dZS+/b80sX0BAo9zxFdpj4PziZ3ux9bQtHcRaPzo/lZ/9PTLww4xnonMZD?=
 =?us-ascii?Q?CIoZwcpYaFjaJVuc8ljgx2NdhjHWzjH0UFyjuhcKSlTXBA0YOrrN9HAMhEm6?=
 =?us-ascii?Q?EBvgi/arvLR682ZZa8qn+sU3/wX0l922BPvZrCcfQ83RVX6tQayGD5lxY4Oo?=
 =?us-ascii?Q?KOsZHJVLf4hD4+A/mW0a3Ly0SusigX+0luUaYwxB34w0WyJYWtuwDHzzs7QF?=
 =?us-ascii?Q?AA6wvqO2wKcUlQXs7ZMOG0ayDJQKD/HRzpxQlY2d1CR1go4KP2sAVMzGMZWK?=
 =?us-ascii?Q?qimyArV/AcYIyz07tGDD2HdKGHLXTIz5NRESjX1FKMjAnrTuITNM8T08boEB?=
 =?us-ascii?Q?xe86Zvj2HOxdxUqn4LA1XLSNByu0wzXLlK8XzfLRZKSNdLjVefAYzTSn0Wvc?=
 =?us-ascii?Q?mJaTTcC/6IxU908RTyNibuK3dbHUdwY0Eh3dmUL+RznTIgNdBL4jpdumMdNt?=
 =?us-ascii?Q?F3yHBPnJHhG6zQf4zicfjFRbpAVy2OT9q7QbMFPNir/Xj/Jof8RMOhWd6C3N?=
 =?us-ascii?Q?aQNnPJ47zMsgk6SSWcM7eFIl+o8uY0/CbB2tKAZzA7xD+EV9Ej1IK/WkXXHY?=
 =?us-ascii?Q?zNi8fegxqzPuA7oH7329yoEJhxlWbilRHwIJc6/FOY0UlDJ4Vk/FB/e8j8mo?=
 =?us-ascii?Q?tymISgqSHV679Z7BTyRZTjwtGbPpjw09r6PhACwHLJOigjYkhCmZV4ajW4QL?=
 =?us-ascii?Q?7DoYvUL8sca7PGRlYxX0Oi2y6ePfiIYhKccQPmiV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00da75cb-6978-4ecd-de22-08dba2eda745
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:56:20.4728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIoTBUvfpIDyC9AKkIP2L162y+w6dN7oq0aDWQmQ4U6JUixoNq2tmnjr2CsLINlv1ZFZz/wuDBTYkqK5muiPfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9970
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
Cc: conor+dt@kernel.org, tzimmermann@suse.de, marcel.ziswiler@toradex.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of the i.MX8qxp DPU DRM driver.

Acked-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v11->v14:
* No change.

v10->v11:
* Rebase upon v6.0-rc1.

v9->v10:
* Add Laurentiu's A-b tag.

v1->v9:
* No change.

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6308efa121e1..dc0a0d15edad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6918,6 +6918,15 @@ F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
 F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
 F:	drivers/gpu/drm/bridge/imx/
 
+DRM DRIVERS FOR FREESCALE i.MX8QXP
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
+F:	drivers/gpu/drm/imx/dpu/
+
 DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and derivative chipsets)
 M:	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.37.1

