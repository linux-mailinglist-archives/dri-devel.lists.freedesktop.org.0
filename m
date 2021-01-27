Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFF4307111
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927C56E92D;
	Thu, 28 Jan 2021 08:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607B46E02E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 09:03:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDJdLL5Sst0DEf6qdrA5NGbiQZNkLXC/YmOBlsbdFkSAo+XGrQCG9YCN/zwTZb5tTxAVhTl3c2IjEbtbknJuPKRdefMDf9icwkJA5ndVcjH+Uasd+1d+eZ5Cqkr68+UNkZtsnKQTVCg4YwetAwhAO+CUov6xOYocOm1yC9p9znFRT3WDKwfFMSoP852ggTKTrQ+2f0rro5OQKZ9U4JnpQThRXCZ/hdDIeu2WpI1Z4hc7lQ7BBJKOBFlLJqZWzQKnFSOqXbeoaTYYc3GjmdXrWUj4FwBar/wA/KOD1XcPOR555Y1gaCqtWxKqvnzk20W48e35TIYQt2OHnXl85aodgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJ9D6wUCOmhV5ZTraNjnEVJgT2jCXhX0NtGyGMUMmu8=;
 b=LKjbGzudaSpMXp48LcwFGvD+p8itr/5eE8suQIlBx5kjnXQS6jxlZ/8OOay6fx++WNDRCKbyHWRklbN+93lrv1y9pQB61E8ULc9Xi7Ct7qP/K9IKvBEiN4cKrnpLEdzTckYAPRzJyPRPr8q/Rkap9XOirWR9wNG//gP+NbncZtUqKwBOdV5EX0Bl5iVy6wc23x70BfAPU4CzNZyRA696a47M4IOQ6nt68XlgZCRSEJafK266kEXQFmc2gPvrDmQHr1pYVAkz1xVz2HGpas8SpJmMqfIxzV+0i3wztstmM2qIyLVlXn/curzgz9B78yL/gZJIMek80kR12GmUcnf2nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJ9D6wUCOmhV5ZTraNjnEVJgT2jCXhX0NtGyGMUMmu8=;
 b=bJ3eNLZDY1wKES7pLfkG7bRLzONiHdrR0iRWu7jUvlOhvbqtLJMm4iQ0vz9li67kTBlTF4UckK79NsD4h+1xeINEL+biUjgO2igx5WwhYR0U3Bym8PfBT+EjiLCyBbLoWUTdiF5EPzn4icKz+Nas3uZc2GYnGzd6uNT3fCmfqLA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2975.eurprd04.prod.outlook.com (2603:10a6:802:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 09:03:49 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3805.016; Wed, 27 Jan 2021
 09:03:49 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v3 14/14] MAINTAINERS: add maintainer for DRM bridge drivers
 for i.MX SoCs
Date: Wed, 27 Jan 2021 16:51:28 +0800
Message-Id: <1611737488-2791-15-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
References: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:54::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 09:03:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 915de6bb-e053-4f93-d379-08d8c2a275d6
X-MS-TrafficTypeDiagnostic: VI1PR04MB2975:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB2975477D205CD0329DDEB2A698BB0@VI1PR04MB2975.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nux30k/YVL2pZRgJ0arwDTlf1fyhl5psiAvs2TXmgc/qO9Xo2Hh42dGxyaPHf3hsmXT6+PrEBLHVyLpie6xgaRj+naT4GEurJxRPH2x9GyAT1Ud2VBTe10A5RH4qmgL8NmSKWf+Kvw9K6kNWAfMRvXlZ1WjZADNm4Eb68J1yqguFLNsVl+NvkgylT3+oTEAtZjFBITQy7IVimpS5UGUniCUQl+ooUQhan9Lebx/xyLBn8RH1zSLLqGQ3lVRORIyDMN/y1g70yrEw81BguNMjpZu0s9iHKNGGPp4r8QCvCEC8q84lL0Cs2JDm7kOSceVbBxfTvzP4Jw9Tzf4HVmcN6Q2lwDwUt0EwRwnUR7ETlRsW+M1HFcirzUFyWRRr/6hyDnOK3ghz8d+hNyx8fH395W3yNFCWJ/Kj14GMTtAr+ei88LxsLrdt72Y6AyCenLoKrznB/dG72pU//esIP9dUsq1saBDwtDJrqeGz85ZPHy3YIn2NtKCwF24Qk4W0M+7Jh2Q16Z8cF/TkzC7SeBzWasznaAjOhv3UjzwPYCfgdx7Ome6NUenkGPrZTOk2dQwPg6Jqetnv4o+aAWPDJb1YQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(8936002)(2616005)(6486002)(66946007)(186003)(6666004)(956004)(7416002)(4326008)(36756003)(69590400011)(6506007)(8676002)(316002)(5660300002)(16526019)(86362001)(478600001)(6512007)(2906002)(52116002)(66556008)(26005)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dtUyFQHFLrf84zD4zm2fi+DGiDQNG50E5/KpP/dDfhr1WkUY7cm2L871LLZZ?=
 =?us-ascii?Q?wXncraZ/NJxN7bChijt4Bowdg2R9d8kfcnPofHjY+glq3dh9FJVAb7f4yCkh?=
 =?us-ascii?Q?+lt0AoM7lfJ6FVm55j9tBJ/+Qxy1t86fa1rzEAAtMBsEOy0QsKINQJ1hbXTy?=
 =?us-ascii?Q?Sz9BMyuKqdt32xBRVfLCUdlSTHum95pv8QSc/doy6D6IvkwdAbZIUNdk+yl9?=
 =?us-ascii?Q?d+pfJ3PC6EcEbAEB07y+NHi565+fp3a0pdFxFXthDifhJEwQQ3YWT2UtzI2k?=
 =?us-ascii?Q?3Nv/DPcNxndxYMDjURciqqW1DHAlgIbyiS09mgqQEizXWmSobFOCRNyuRR7g?=
 =?us-ascii?Q?7jjxwBVWRSkcxUym+7wh0UsuQXgQPteLszM3NTLpvEEro0YSXwiSZ/JGGdi0?=
 =?us-ascii?Q?uzsEZAKyVCoTFmLdBTBTVkDCxG2TSXVyKOI6lEvJSaBpqpnk2MCt47l0HCjv?=
 =?us-ascii?Q?t4GxNttlltjjQOV9Uc1VyjMN1f1BhM7TNh/uFff4qCsFlK0ErmZ+PZDMk0oT?=
 =?us-ascii?Q?ZeCwpCkcGfZZ+TMUSE/BNisp3y2lkB6/OmWFxFJBlPI6oXZJmISi25UMv33q?=
 =?us-ascii?Q?hTqil3AyDIwoDMkOABUEONZOtEr/FpYKp+PqURQk0ehuuIsPvr0mpD2C45Bi?=
 =?us-ascii?Q?/sq/Y4giSsw8dHP4gFpIewpKixLnyhpp6+ineFJ84YPfLKdPhkzIs9PR1kLf?=
 =?us-ascii?Q?84q2w7sSbxHvCF0tIfcrwyOPX3f5mbbBTM0/Gz2KqpZYwbnsBPk44oeWzIL8?=
 =?us-ascii?Q?r5Y9gdIoqSTI+55fFFTG7azcL6z20lSX1wwrSN5ODH2EkU0mJjuOC8ckwk0J?=
 =?us-ascii?Q?jeTaSMQuJ3waRlBcWIutpCZg8gtsWqPTXKWvoKMgH7RDKUW50HZGpHk4KZJC?=
 =?us-ascii?Q?dmg1nEe4coJqCBWHQLTG9VSJgw/+94iGy8qelDHIamTXLJwqRhL2xW3JJ3VI?=
 =?us-ascii?Q?7yqBzdL4OrfJNAU9JxKlEd3CleMImP/ZA2LK1z2x+z3r5DmnKZt2z16qXsgm?=
 =?us-ascii?Q?rcR5lPG1gc05ojjceXTCFD18h4w9VPr0d99ErmdKXPrK6cbaCWlpDvGjcQBB?=
 =?us-ascii?Q?WF7MIPmP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 915de6bb-e053-4f93-d379-08d8c2a275d6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:03:49.8054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KouCFYj3axLEIZ3DsWV67MbPBUL3Xzptnk1qtkV2+eBm/647PDxSADeYgp0FpSS5tW3o+7UkpGvO1M21Zswu+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2975
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 mchehab@kernel.org, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of DRM bridge drivers for i.MX SoCs.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2->v3:
* No change.

v1->v2:
* No change.

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d241b8..d96c917 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5892,6 +5892,16 @@ F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/
 F:	drivers/gpu/ipu-v3/
 
+DRM DRIVERS FOR FREESCALE IMX BRIDGE
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
+F:	drivers/gpu/drm/bridge/imx/
+
 DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and derivative chipsets)
 M:	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
