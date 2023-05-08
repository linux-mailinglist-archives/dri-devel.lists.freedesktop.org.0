Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8096F9F49
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 07:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE5410E10D;
	Mon,  8 May 2023 05:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E95710E10D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 05:53:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhsgXbob9433aY1gkz3qOMH6X1UpeEKl5t4+6nrGAp4JcFzMH/t2NSU4dNxjFpMSaaK4wYneWdCv1hmDrbxgJPjsNh0EPr3Pz1LZz9pU05QTP7UwrUaRVu+WokSEQW1IKrUGsW/v3wpC0eHpOWmnICcPRp62008ridedPBBVk1Lwanrp86AdxFm+IChWLslvGTZkhTR8qwUDx0q9gbbYh0zS0Vbob8yLd3cjssbsigqq/40j2EXyTNBMTll1z7fE/3oYxp5Q53VF1ShxIPa3hoemk/yXpxVcZCtKZCRO0yyn3tAmSsTFMuY50oTQ7sVcuJyY/w6fUrP1hnNlEMTRfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VP6Xu+Q6I0NhGFzHaSBqhkZ5B2t0WOMmGD7Fe3t9iCQ=;
 b=i+o8WZJCbYhXLcdXBQkHr59BFh1iq+/hITYaduBJk2XD0yjXIb4rcjLBW8V7psTJLHeBzoDACuTuAK8vlpCwWWhDPzFLd8KVSoiLZ040OqeraUjW0wzZGnQzNBSoSFSuTBRR+SIbH2mYbeIDpjVGajesUlEFF28AskW/POOMjEA3cB9tOcxG7Bydg4otv/D82Wn4TkRYmT5jWykRooaunfzkpDI1gTAFcc2GTtaAkoocqoXRM4AlmMpmNqJixum4TPp0UsHDl/168+KLr29+JrlWr+Hzj8mbTivtXOv3CbKAVnOu2b65/ZbvSn4hGpUDEqxxHH21Sdx1LoF8C/j1jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VP6Xu+Q6I0NhGFzHaSBqhkZ5B2t0WOMmGD7Fe3t9iCQ=;
 b=mWFJ/CkFWUUHq9PoF/jCeG3+iaaJ04do2VJp9yeHAyS9nUulsg+Qi+Hygqq5EuEesz3dD8eiU6Yky+CRFS9jqaJVSDtEcQmGEQo0FhiR8qmgi3cCVfm81JSb8aCwP5YWpQkWG/Cxgno1dM2rCi55eRAqNkqMFcJkoSSZVTSxSUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8523.eurprd04.prod.outlook.com (2603:10a6:20b:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 05:53:39 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 05:53:39 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 6/6] drm: lcdif: Add i.MX93 LCDIF compatible string
Date: Mon,  8 May 2023 13:57:40 +0800
Message-Id: <20230508055740.635256-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230508055740.635256-1-victor.liu@nxp.com>
References: <20230508055740.635256-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: c753e2f5-4c24-4999-5353-08db4f889206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FOYQGQRC6Fq42/rOk9sr/d6UFC0bemZ0DpWNtML5S/1l7B1FgicyHk/ysvR92lj2zvrBIOrWYp+6QjAHX7h6fSrkvlyvFeibawCOnubS2B2E8ntdGRa9j0Rp03xFBB/+yrfFLKREeq5AErB/zdeyV/hkmp4YSY+BTzRcFU2rAAMYHU/s9XX3k6VYobbsM5VUNlRehkvxXaPA4ZgTnIkIH8qfiKhR73mnrA5ioeZIONm4Qe5SXkgzyCNHSP1VTgfmYBoQ9i/t9z9ZlBsV9ewSV5rbNRSiLGSkIwwH94SYqdxZeqapIXrfrqRCblmAWN8ZA52EMtf0xx8haDGXbmPRuOajcVfhHXocQ9hNBpg6Zk/YEF8bsHT/geZjk7SU6KrOHPVmWwOZdFTjzoaDt9ws5zqSliUeA7op0t0Tr69DvLGuUgXmQmRNr89HBorTD5IhXXvHq868LDGuj4jEYZ2dM3J6JpvnK6G2yaV18qamnOBKojpVp7FwooxLkHxJQoyoZm5O+/a0FdKRiAwuI/POcJsswLQiMOrr6Ox8ajY3Mjhwaf93lTLCqOhks624YAU/l2NWTyvrIC3GWh8dXOxSez9mYgLHcZNJYh6b+g8HLfWcOX0fhYb28V+bM0/lA8Ak
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(83380400001)(6666004)(52116002)(6486002)(478600001)(2616005)(6512007)(6506007)(1076003)(26005)(186003)(2906002)(7416002)(36756003)(38100700002)(38350700002)(66476007)(66556008)(66946007)(4326008)(41300700001)(8676002)(8936002)(86362001)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8gQr7hBC+KyqqEKwEQNHIyX7RtK5vGFvwDzD17IK6eQHOWTNIanZf8EnWWug?=
 =?us-ascii?Q?QUAan2K1gi4XAHVP9W3w9Q24iZppQcTW6TiwdWZiH86dX+qSbUafBKhzK5CV?=
 =?us-ascii?Q?DAFXasiiXZJWirBx+L+9+omTZSQjHwXyD5uru7ZtZCWzvYJiqiDFXVOZxnKx?=
 =?us-ascii?Q?kBBMOAHZaEp41tMj0ZRdHkNav1MU44pFxdEM04SwYPHaFv/zTwsuT5oGjZBI?=
 =?us-ascii?Q?xOwPvnxEACSQwIEo6KZly7eDlMGGLK/xAk801b0Jm6daXOFgzqZVm74eiRDJ?=
 =?us-ascii?Q?SEiVNcUqgoYlo0l28MEE5sygWuiU8gHferxbwVdYf456HRblzh0YzkOx2Bbr?=
 =?us-ascii?Q?HTvLa51d6JFOipIBsl3nBFGytk0h24eYVpyZjRqzEXUn55UiL8s72+fssjzF?=
 =?us-ascii?Q?LeAyBiyvsCVBN+L32DErh0d544jRYQ7BFtFHcz+Q6BQ3uKHdIofT9z+l0fui?=
 =?us-ascii?Q?+XvwPo2Njde6cubCnJjOaK25qxL0NrrTQ9WZ3l6H2g26NqQRFsqsUzw/yoQg?=
 =?us-ascii?Q?0dLzlvXIIrmIt4xvnhd0rR30xi9RmWpfAjUqFZIdU7doOGwEtE//8o1AOgbo?=
 =?us-ascii?Q?bw/+j6CvZYhC0djMfu+ImnvOwcZHWkqq/5t0OnSc6EikKcBdo6wonDf9DpYP?=
 =?us-ascii?Q?PsRBFabArdZL9IS+vN1zFr9CCrN8aH8G2xpJTfgLzBJrkHXKaniHN/IYxh2Q?=
 =?us-ascii?Q?q714nEB70IEX+7HiGa7PlqZDdy1MUEBgnmpb3kraRb30Kdp659wYlZ20uOnE?=
 =?us-ascii?Q?CwPNZ2o7KuQtYcz1VW9gzAJg6RlVJ3JguLi8oFU2TWQ5OMIimyDQlsu0eblP?=
 =?us-ascii?Q?WAgx+Exy4X00hrOwjpU3/elg5sZyt56ZO7YZvtW9ltci5NiLh+km4UQ7h/pE?=
 =?us-ascii?Q?bAyfJjJNdvI2NPhU1yG9e6dVYA/qFO1DYl1iL+3B4pSSG0XkgPSsObfF3lJH?=
 =?us-ascii?Q?YOeGElZGfgQpBQPNzjMKVmHEbxMOg7UyopQr4EFkxduyVzOiveK6SdyZINOk?=
 =?us-ascii?Q?dVu4m5YtYiRwfAixH9l0a3SP0ACAA/VmzbATbqVCrnwJjnP8VcMBIkH1Vpva?=
 =?us-ascii?Q?53b3p7CzAI6hpGcJOF7+Cl9n3+lCKRoRMh+96SyKDqClINRzdf4XxHkLjHhm?=
 =?us-ascii?Q?EJjYhwTZIJ4EFZbkoBr6giIAu/v/NXoEuZcxkcBVtxQ4sImNoumB/a6F2+vN?=
 =?us-ascii?Q?9XGHvT8OkDBs7jIv13/cC10AcpKdDbAtokopTbWI2IsOv5uPhC3guiNlAxZ5?=
 =?us-ascii?Q?hLCisUkz083Z3RD/zMDVGuU+HgnVHZcGqzbFZ0eTHLcyQu1feX9Rz1HbiOP1?=
 =?us-ascii?Q?OVBXP2q5bjIgj2qBuL+CCKG+VTS/1ITGxm+oJHrYZnLF3f5OF9sW+z4xLh38?=
 =?us-ascii?Q?VDEGvQkz6i0O6zKQ43EDS9KFEonFgJuKaEtK9fZYpwnKp440aYNFgxYMDlSp?=
 =?us-ascii?Q?4bea9Ri2zEwQ+hzVTQtWXKYO7G6xCNqtPEpsi3XX+HloqLXmRKLxmeZNQUVH?=
 =?us-ascii?Q?mjQcLV0s0jsFLhbonw7ME8hBLrg0U2JbODPA6zU/XQENtZybyk1oXBs0fa5r?=
 =?us-ascii?Q?GAjMw+dgK3oL6OBIR0xY1Sl5pninbgOk5YCHgfC3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c753e2f5-4c24-4999-5353-08db4f889206
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 05:53:39.0655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rxm7xt11BDjsNmkrRNBWx9qkQv4+RZt6aW+7yEde9VUeTDvmgHG9uWx7ljeh9suQCuKfCyozgQdJrKCD2rxFWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8523
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
Cc: marex@denx.de, conor+dt@kernel.org, alexander.stein@ew.tq-group.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 kernel@pengutronix.de, LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With all previous preparations done to make it possible for the
single LCDIF embedded in i.MX93 SoC to drive multiple displays
simultaneously, add i.MX93 LCDIF compatible string as the last
step of adding i.MX93 LCDIF support.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4->v5:
* Add Alexander's T-b tag.

v3->v4:
* Add Alexander's R-b tag.

v2->v3:
* Fix a trivial typo in commit message.

v1->v2:
* Split from patch 2/2 in v1. (Marek, Alexander)

 drivers/gpu/drm/mxsfb/lcdif_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index cf27b63b1899..d1bd0f51f451 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -249,6 +249,7 @@ static const struct drm_driver lcdif_driver = {
 
 static const struct of_device_id lcdif_dt_ids[] = {
 	{ .compatible = "fsl,imx8mp-lcdif" },
+	{ .compatible = "fsl,imx93-lcdif" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, lcdif_dt_ids);
-- 
2.37.1

