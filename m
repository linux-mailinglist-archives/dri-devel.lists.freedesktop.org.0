Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E49C9FAA9B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 07:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26A110E40D;
	Mon, 23 Dec 2024 06:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DenYbJ26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8D110E40D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:43:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I83307TsRqeUM8hAlVMW7NofbdKmSA4wvmd2SZRpjx7JOKaXxJ3WAenB/qCKn3FssKFeEy9ojI6ZvKUEIKLnr33r3D47/N+CD8EeFuBhD15h6br7MyV9Zlz1k+PvUFu73tkKyENVUIuCtKoGRiCQdhceKs3ebPdfkN3mMN9uhfH++8e9HGA7ICGEVKAjbcTXM7br4V1YHs4Ws+KAZVOUyp0eKIUigcD4phccsmo85TPf97zyTG4mPpdkwwCJmBQKBNF/UhJZFBev3RAV+6kMgy0flEEdb+GgF6yo/PuRQV4yc2M9AHWMKvsZOJk5wVPyqOHIUTwK5iGGwpcjVGWb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wG6/JzaMRxk3dfZhVC9OJQ9riNRSkwXcHHHfGpp2Plk=;
 b=jg7CpxazgGWzfZjvbZ7yvqFGCtORysHTaBnafu8GILGmPEAHGTLJIuU78336Nwd7FugHVl/mRqdTY+MfAdlbb6Ed8kHTCVAI0R6tmO7m1YwiAMhtoVDWwDZac1kWOLAXftGfvfJjk2GlLugNnYzUrTNTYLFYFEx2mNAibAB0hYQlLbK3ihGmOioPS1GN4c7zpGG+sDGI4PhzpejjiwmD4tPZ+YK7ji+3CN8KzgABzmidYv/DrkDJhMkC8qeGVFYBKHTwlBnPX7SyRbVHb80wsaI3CmW9nm67uNvCm3G8i0xyisyoBRd2XWrR3MiuNbyZBx5XP+LpFcJuLCMa+wEzAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wG6/JzaMRxk3dfZhVC9OJQ9riNRSkwXcHHHfGpp2Plk=;
 b=DenYbJ26tSfUK7CI1TyPbsqbGDaXaR/VDMDKfnA8jjlFfIGMCf71jiAtSigPaZI8kzN9totH4FqonPoJkhtDEzE9N5ackVTSnwAiJJwTmqtMrMCm7JVcqRw8JDK6Zxas7WVqcrW5kifQ5N7N11+/Wm7VapSBTYjYurMQahdiccimfgl9S1H+O2kEugULGYGGjfA698elGHO44jdNUF1QMKE24U1MccRE7Qgz6gLAtaQChbYD0UxIgKByBY2EGFPZApHSsHUeL5VXIWWhIhB9P13WiNs4tdZU6lNJoa2eWPQcK1mV0jskoaxXYYjUuedj3d5Ei4MQYHKwdqNWHIFQlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7941.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 06:43:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 06:43:32 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v7 14/19] dt-bindings: phy: mixel,
 mipi-dsi-phy: Allow assigned-clock* properties
Date: Mon, 23 Dec 2024 14:41:42 +0800
Message-Id: <20241223064147.3961652-15-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223064147.3961652-1-victor.liu@nxp.com>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 260e29d1-9080-4bd4-d1a3-08dd231d1e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i1ETTbsok+44D4HIh9oLhMfXKx5hmJXiJ0QhJmYcAoYRge43Gu5/AvOOKKkx?=
 =?us-ascii?Q?HJ/pB7a2QlKk5nwKRGEOIisrQgz1aI1Q0FFr9HP6Zo6utBSOBoIGnomvOYLP?=
 =?us-ascii?Q?TQhZ9z9fVq6SKagGy5lWFnQTscx0YTp1U+F2t9769t1EIc/w9xdsEWb3QzzN?=
 =?us-ascii?Q?6A7MEIzIVt1Tr87egjfLqmNwrWV+cq5foIAwsUMF2V9sIB5gUjcPBSF0v8pz?=
 =?us-ascii?Q?Ns7sHOuTAug4fsJ2S66DG+pHRjhhXoG7ijFR4NVfeQCMQJsph/GTsxZ7eyCJ?=
 =?us-ascii?Q?SA7f6yhtoqAPFU9SmkcAxciXRveXgHfeQ3FQxZVCNstAh/A9GZGj4BD63H+c?=
 =?us-ascii?Q?i0KnirgCRqHr1AiS/FetZ9PR7YuKAfOXKXkBrL0+j63ere2u7hdyXfDwjer7?=
 =?us-ascii?Q?2ObYZIQKC3zNE+0nSWdFBvFUCUEqlh8NGd7UfQolgyv4Wgo3HJuPmBFp1hgk?=
 =?us-ascii?Q?PhNkt80GzJnzwMz3zggBKCXZXrvzqnr39SypqxNYZiUWM82FTojMq/TDFs3a?=
 =?us-ascii?Q?F/zcFSE3AVfUgF+MSxNuQoUb0EFPawXFDFzFp+5TUM9iP6tPU8Mygt6Z2N7D?=
 =?us-ascii?Q?vCXIM3gqvt2h2wBifmrc3jwKClb2dgsyczq65BeEsRGY26vXTW7nbZfokTMu?=
 =?us-ascii?Q?3FgbqvliTMkJw+y4jnqqaeuLlPt536eKy7mo0MtEYMom74MhkNsI7EnVs14g?=
 =?us-ascii?Q?/ierF8lc6D+G/dYz/DFgftO4c576688X/+kQwGMzBNImwGTQq+T7dVUucEhj?=
 =?us-ascii?Q?Qh/UdeJHkSDO8Tny/h9fHcgmYzsq/u7hdzsGE8s/Y9gWK8G0X4jJGLDSmenO?=
 =?us-ascii?Q?nsBClIR5kYAhJz4SOPVOd6xxhTAlFlbS8iNTti3YK5QiafaykB4S+YCKM+nV?=
 =?us-ascii?Q?3niDImJ9b6FV0U13ks7Dyg0W03Ctks07mlS17TscR12eJK2wTv2gLyhRnFNl?=
 =?us-ascii?Q?9p9q6Hp9EyCChtcvWzPQfEBw+2Y48AirVztlXMl3H1o+wcxcHaX/8OgH/A3N?=
 =?us-ascii?Q?m/0hRWcoiq8pPeb+IdN4+EnQBPV4PgK86PXdzMausSvJZbV8sNtuVyttFX7m?=
 =?us-ascii?Q?RQlLwkKiRgnaW/N2hmXwvAZRXmjGYcplV5aiCkLqLXQvAwB0SNOVlDg8G5tc?=
 =?us-ascii?Q?q7Duv2y0rjEd7zVS/29YKwI2Yd7uG2v5TG3lHTgfvIAy/AMn+iSWKhCpdY+M?=
 =?us-ascii?Q?2w2mCEiCUuWusitQ1bq7id0PeMIf4cNDFqz+u7BIima0vsj3+0AtPIcyb0m/?=
 =?us-ascii?Q?J0Y4FScxGyAZJrcwjdIxZbbJJeQLZ744dAwv0uRGt4m1vC7fVrr4vFBCM/LN?=
 =?us-ascii?Q?BYk5LZbavFytlc6vf47AVYwOXMHVUtiHUm7dwo666lVCiUmefc5GFQn5Lbqm?=
 =?us-ascii?Q?9iSF4HUVWXy0eKECdLM1yqtVU+oAw2Rar3ARFNLnVF86qyPgD0mpORBy/lsJ?=
 =?us-ascii?Q?L34UUVyWG2yTR9Bc0zmuUzd9qSrmzPZT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9yqPJIVPGsw7Q94RZa4sPNeQZhPmNlEbp1DaL2PnnmdT0zsKGTBCBXtKjdMC?=
 =?us-ascii?Q?Luvw9ZoA9Q2zPn02BZ4jyRhbL/49xiUz8OOSGb2xaXRIDe0CV4gGy2PDl4T7?=
 =?us-ascii?Q?BXvaXcK5M0gDo/vblkHB5/R8D3Ck92siB9TQEkumH7VkA55JbkLFYM1G8ogR?=
 =?us-ascii?Q?iSeFW5o5oqomwOLt+5uitqjWVFwZ9ePWJ0vepD3A3gdWn2s8gnSjw+xRkINT?=
 =?us-ascii?Q?vLtwLCE244XKULKYfLjg2cQmVRpAULK2jaRdiAOU9fsL22yuMhBOjnioQNsa?=
 =?us-ascii?Q?kEr8C4Khf/gU4q12esYS5u29EUEK7KEK3DpMZxYFROphbOPyN8vqrgu5jqX0?=
 =?us-ascii?Q?ZAtfMTQx9qgDprpR6U2KmaMVn6XktGG3ZwrBsNACr+1+ch98X+fHGWvX3eWu?=
 =?us-ascii?Q?tVVMnzqHo90xZNh7eAG2ituglOpGWR0jd3de9smy1WHCPemeRKaapV5pbpMA?=
 =?us-ascii?Q?ijEMBm0dwfXJEDoHRit8pudsKvIDNn81/++eQ0BWT0qAhdWcZ3Am1HI3ufdn?=
 =?us-ascii?Q?z0zLZj2k6KYfyzHWDtWVz90Zo1A9B0taHhRH/3ItxibjHM+JGrx+wt7mUd8t?=
 =?us-ascii?Q?FDrmhjEv/NYtgxmU2ikT37tqpe4LpLVo+yzp7cMfNzEoggol//x+vQ4F4M/e?=
 =?us-ascii?Q?e6eg2Yq2MvmsPCTKw2Faa96Em5TYdjAGdGVSsiLLnOPgeRQ/OegYL08ar49P?=
 =?us-ascii?Q?8DYIlPcFbUKcTku9zTbYEpB6qGSUZporQ9alo1igWuCI7yQNRUbYfGhUNvmc?=
 =?us-ascii?Q?AUdwy1pkybNHGG2Ej25wOnrtpK+c4W2Y/2ef6EYLJGKL1RHT8+ksqRvhpPsY?=
 =?us-ascii?Q?iTinIuL5hB4UMLJmRyFfnTxxjGCuhMzFNlRoLWmTHhWQ0c47EPEO93yltpVb?=
 =?us-ascii?Q?4W91ZjRvuAeWtHWVmVbelXlfw9y6Ve0j4qIUc+5YfUyaztGvo45Uc2/K3BIy?=
 =?us-ascii?Q?Qnky1QZvCXE3BF6TEcx9ianyUuMxYgiN/gW4+FpjTM4Iqk1qfreUdvcOHX4F?=
 =?us-ascii?Q?aQm83/AUJeSMrki1IpJAdMt0f8AiqarMF3htgebXU+OmO6FhIMDypUDcS0Hy?=
 =?us-ascii?Q?tpFZ6LHdh+ibrYZyvkrRYmcGDf1VVRZ9sDgW2QWPlTJ+JHJrmlDSqlijtKD3?=
 =?us-ascii?Q?vMePAXdHBxNWRK/e8H3eY6VQ1+x8hZsIrSMjmufdBJAxgz3yyrNAs/fLQJHy?=
 =?us-ascii?Q?GbSM83jCk/+OyIM/8LcHOB8zOFV70M44vrLW0s8EJMpyeTemWGnAx3xornWD?=
 =?us-ascii?Q?jWBTR2ooUYVzLplGgkGR6hSk+HbqylIe+WhUmRRhE5aVVJP0NEaMsF7XTFg4?=
 =?us-ascii?Q?H67Z6ONIvorznTd+NCOLkoCJeR9xptbllhFSHdsW+TzIffxsYntiA4BCKhdF?=
 =?us-ascii?Q?CgYtRXamw74BDfdCz5cnaMQT8J3TDvwSch6ZrxMP46TOz37zyXM0XlQTaDTP?=
 =?us-ascii?Q?EIbaFA1Xcz/9541xT8aYEhWQZ1u1CDTJJgdY0TM85WgTo8GR9GsBM8UwAvxm?=
 =?us-ascii?Q?5pZb4iLwfi/hfbOlKHrdiHn4MAayfG60gcKhURYKzN+ZzqM5wqMxo59bCNKK?=
 =?us-ascii?Q?5C6BOYJfT/7Ej44J4WaIKPV+5FrgMBhHuoZrX+/q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 260e29d1-9080-4bd4-d1a3-08dd231d1e38
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:43:32.7440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3b95nRQjGty2ErOV7QjGYpPfL1+5Y4G+j+vfjmHMeAKDCU2mgOtOAvVjWIRMQuFPl8MCPZ4Hp0Z2PsmG/6QzQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7941
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

assigned-clock* properties can be used by default now, so allow them.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* New patch as needed by MIPI/LVDS subsystems device tree.

 .../devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml          | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
index 3c28ec50f097..286a4fcc977d 100644
--- a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
@@ -72,11 +72,6 @@ allOf:
           contains:
             const: fsl,imx8qxp-mipi-dphy
     then:
-      properties:
-        assigned-clocks: false
-        assigned-clock-parents: false
-        assigned-clock-rates: false
-
       required:
         - fsl,syscon
 
-- 
2.34.1

