Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D8B59BAF9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 10:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83770112382;
	Mon, 22 Aug 2022 08:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A439AC39
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 08:07:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JN7KtooMpF6t1FNy3dJAZTCQ1hxGXeRJ1IBgl0fmgsKrGXgu+BsIf06qSfbqFj8TL30Lz64qupaBHz0Rly3g8Nyd7wazfThUdGT5B/xnXJG3WRWMy8qk+WR0MiP4lTr32uLxpE/C5yfuOyBHMJPYBGJvTf6QFxfK51sBVi96447DyiTxrDiIDQ94ozhoKoM0rM6Go07Lno8DYyVSTZGIiLIeg5onmKpHXe1RbA7DHsuPoVBLGT3vp8fYEJ2TVltHaSD5fYQI8MTH/713PP9Eaq4wZWBPsVqE6jG5a1RJH6XlE6Sjy+7JlTuctxe2smwkbl6Y6hUpRgct2GoMgB/aSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41q4oOyN56yST2XHYBVpzBeIcfZDnh4QhwBVOdQ8D4M=;
 b=CYxCTfC/v4yIyzYiIXaw8KlDORLfX5gtaZYkIDtqDX0G8TgTke81SIKk7TrCDmDWfJs2TVkYGPRrUJSWDHE4BjKB4eBUhqyLvdaaQsTm5eDSJAq3Zpjn252jd0eQTR/655eRStiaSQWQrBS1pg0EHlHjy1S0vRgRe66ynNMtJsTpDITnj7GU4RZI4LKKuA0anq26spcJYdP9EWyLTlR5yi7vCrWabihz3dknWJ4z7eSw4pzAJ/PiLTEtIak1/VwzYc10bv+V3g8E1soETppSaGqm1uoCNVoHCU+gwkbtF7Pc85ZGjE3T1G5i5nnNs06hPcDz5WcC6zkJXt2vppym5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41q4oOyN56yST2XHYBVpzBeIcfZDnh4QhwBVOdQ8D4M=;
 b=RVNhSCamXGhUZXygVNqHYC6hXgiwP+b0NeEZygRHCxJYi3tUfN6EYS0rhzQD06UWRg85gN1WioT+DuQ6HmuOLrAgG/YLGDAWr/rNZ4zAtoGMCU1oEbFU3jCUvRw5S8u7rLxYQrMP2hv5XKnAtHL+1KTQ6m45BEjKcm3wgBquh7U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB6499.eurprd04.prod.outlook.com (2603:10a6:208:173::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 08:07:22 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::2549:869e:d80b:3a1b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::2549:869e:d80b:3a1b%6]) with mapi id 15.20.5504.027; Mon, 22 Aug 2022
 08:07:22 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 6/6] MAINTAINERS: add maintainer for i.MX8qxp DPU DRM
 driver
Date: Mon, 22 Aug 2022 16:07:56 +0800
Message-Id: <20220822080756.37400-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220822080756.37400-1-victor.liu@nxp.com>
References: <20220822080756.37400-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 863c3b67-ec32-49b2-eaf5-08da841556f9
X-MS-TrafficTypeDiagnostic: AM0PR04MB6499:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q7/Jlm7Vt7D2MW01zM6a3YlTtRjKLQkWLuNJAofyUUtgUOXGfAGOGMaqEvCYdC4I0EC6HqMXTbqLYIiDPCKHChQ4CEDMJ/YlyMy+cJJjU1d0u/x/0i8dRgF02MmQ6asq5sQ/XVnyBaoktyrNkiVXsktC7Hb4/Xccx4qCG0Bfixb+DOG/Uw2nQYnZCRqo3OKYpH+/8jiOJwW4u6k5wD02kXgFvnkBLKKQBEvP5HPl40SkUhHUVxz7cV0cLQXOIDDazmqq/a149zzATh2q8rLLUS/pXveoISGKdRuQOhwbqO/577/WQh1MWWLDtYSwRWvSBV/bXPEUvFFhkh2TaFjq/ZxtPQWxTa0BUrdt/CoWU17ioV9+c26KMiYVmznJv7FVxRTkeVxQu8ui+QjEjW8ur3XwXA3szXCx3uKjnQlT6sHyCHwRU15u6yIMTUqwfF8Pu1bo9i1iMBiNrt6ltgHMrvaqdcyBBAzB2lxKjaeLmtzZp2ZMP6KpZ2S3K+SDiK7tZoPYDx6Y6pEIZ7iKUOqUhYfTNnuNa5hFxXf7KvBTU8Kaxyu87Rtzw8PdqOcdMEULl9G71FiOzbw+l/5XtIN2hDbv5jLgnQwO7Z7b7sVEpqj2/PTzQSJgetOS16Zm7GLzhC+d9sE6smg6QmMcipljpdRVHqCPtCioLDURpInLgM5HHNZULYyqFJbOJDegHp2GvGIkzAybBtfOPGIZl4R2MJ8m7yfi4wcX5T3R2E8PjrQgUkbkJDTKXOO8UhgdCI9hIorNQzwjgJ8x0R1VNudeGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(41300700001)(6666004)(6506007)(6486002)(478600001)(186003)(1076003)(2616005)(8936002)(6512007)(52116002)(26005)(2906002)(5660300002)(7416002)(316002)(86362001)(66946007)(66556008)(4326008)(8676002)(66476007)(38350700002)(38100700002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iJReOKEsVBhIKe5ke3fmmvdfxO20yV1ZJPj5ifs+qtOVJGtpz1DNot6jB4cx?=
 =?us-ascii?Q?/qM1kSlBYExdKAwiouCcwMU5lMCtZD2yna6t/lTfwXtUlR3WxAaQB7QPPmR9?=
 =?us-ascii?Q?dRV859cYvYCP0qheZJ6EKhNcXyARVzVTeQvwxluMdpEmn/PjAC+qnswm4kW6?=
 =?us-ascii?Q?ruIV37XGMkAwQZ27zewyjdIVohV62VMgkxU5T5JLwPc578ijHhkd+8aUq6r9?=
 =?us-ascii?Q?KD6ja/Lo4+PIDSDwCeuJfxMjgGvgMw5D2sHd6Vd4p1YCvhG7pMfgyfSKN1Zw?=
 =?us-ascii?Q?dBT0i5A19k1GlnNXR1asR5mLqIx4Nzyxb4TpPrkVeasP/UPCGqYoXo4j8ZOr?=
 =?us-ascii?Q?HYJulHAk1tfynUqijWz+8/Y5f+m74UEUg19HhxIWsQWvtDNXV/knfHUdOIBx?=
 =?us-ascii?Q?KclniiePFmjCIjB0eTOhrHISN0Yob0nqCUtD4dZcheTChL9BS2/BWei/qaEc?=
 =?us-ascii?Q?Ohlaf9deF3kY8a8CD7Io9iw1NPFfdxTWCGoWR+jpe9NJPxrFkcFQxamQFbyr?=
 =?us-ascii?Q?tnZlP66GCyTxi03+hRyIlfXupeLTXqN9eS+N7RUWlPywLBvavISDV0upg1LY?=
 =?us-ascii?Q?ur2UaH4qCVOM0vTg98i+/rTGCdzD8DVyzq4/Daw6NAodkX5LEg/feyapOr2W?=
 =?us-ascii?Q?2/TlTBtNiuyySZKYS2a61CUHzwMSyPJid/vr4uL5HPoMO9HiOup/BRIbSfit?=
 =?us-ascii?Q?ZCkfsGTX6YufEIwLLgMjWtKFGvygeGeQ/qZ3is2G5Ch9mADUtDza+EnHZEsB?=
 =?us-ascii?Q?v4hFHlZEeRs+nZ5cqxLKfG50aF9lPi0Diq5/6GUjAWbgaGiLydlWbh92NRCI?=
 =?us-ascii?Q?MshIVdzDYlNyDNq1M2ZZjHchluKGUeibnYhHWR4UIfHTFgsC4jmrWEqmJOa2?=
 =?us-ascii?Q?Ng/DF1oDHrjDzy4bjKV8w6c34RbiAQvd4+ENWHsWxC1EuCQozzrAjyATG8he?=
 =?us-ascii?Q?4wxRYaqJMAIjPc9uG4d7fPKgdZursV6/uu2qkm9bRIGo2kBWuHc6o4gDg2bV?=
 =?us-ascii?Q?R/Pl9iGZ1MkkDunrMCZpKm3jBE1OtCNXi0bYq2cLtx6yTkPWx0223wzY9zDW?=
 =?us-ascii?Q?HwoCsYw7z16PLlP3SxrAcCNsLIAlV2+/+LW//iPvLaaEONNkS7Nj0Bv73qHG?=
 =?us-ascii?Q?x5QhTlZtkFv3DM4ozO8LvcvHibnVJw8sBoTFjBPz+kaBL4Co8GybTNKWc8az?=
 =?us-ascii?Q?VqEgBUioZn0Nz27hJxSBRrCCOViUF6NafA0bRaSTx4p7K5ZydZwu+T06Yize?=
 =?us-ascii?Q?uqErsdKZTZAvZopeuaMA5M6H3RiY/VUDzNmkUymVvst9xkEFOjEIcsmazcUc?=
 =?us-ascii?Q?ySr9nHZQ/9VEi3eRDBnt1STvuyJJul/JdUzIZ4MKOJpNLphfianDU9eiPKNM?=
 =?us-ascii?Q?42wxTRzq3O0n/Dd3tbD6yLxRo7k4ReBMFO/jCsPPHRkABLGC1QsnGgIyofgA?=
 =?us-ascii?Q?xVEZQxKexFn0WuU6MbC2beDbEYNHu3HYbVTvnESOY4owhGso6isI3Qa2T+4O?=
 =?us-ascii?Q?xVJhF+qNFe+9PLunGw0+doitIbWGKzILWZ14D7fq63QuZlM2rPs5Tz216x7F?=
 =?us-ascii?Q?FXUIgEm9xDLZ75kaqWvyYVUiZTSaCPn9QGng81Ga?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 863c3b67-ec32-49b2-eaf5-08da841556f9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 08:07:21.9109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UW4k6AQQ0R0t95tRru/w/O867jSSjXlIv1pSCsCukpB3rKaVSKhESN8iMZlfqpP+CJHtjoetRY+HlB5GDlqcbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6499
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 marcel.ziswiler@toradex.com, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, laurentiu.palcu@oss.nxp.com,
 guido.gunther@puri.sm, shawnguo@kernel.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of the i.MX8qxp DPU DRM driver.

Acked-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v10->v11:
* Rebase upon v6.0-rc1.

v9->v10:
* Add Laurentiu's A-b tag.

v8->v9:
* No change.

v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a5012ba6ff9..ffc8da8d5a8b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6861,6 +6861,15 @@ F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
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

