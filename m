Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD7174CA71
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D2E10E146;
	Mon, 10 Jul 2023 03:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2126.outbound.protection.outlook.com [40.107.117.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA8110E135
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftSJ9njjX7csNckNqznTzfIv3iR1TM1Dx8uuSX8oB3oqtsHyYOMzTLZGLifiw0mJPFNZC4SC11VGy3IJwHkVQ9W7/d4sC/6GmJMb/7ZM+UU00dbS1V55ECS+1PhL027BtLG2Byn30VSz7em4SDD905tKQuJnlxnnBY5Rm/nYs/fX+k3c5u1xhWMy1lQa/3o7i/Mkcbs1rFaWV394sz48HSi/1k317cC22xKnuDZKmHOeSiMeIxbpSshTkM9/NISgLmLfaXGxXcQkKXB23J8sKRke9kC3b55O0d+clu813PA47VOKJ5imA25XiLQyS05Fo8db31P+lkQMg5aB+ouJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ld9P3YFbn7HPVQyzzxckyYBDskRJ6Ek1NWLPPDZFxek=;
 b=AEfEkF3G7HF5Vu3j5JYYLwulDJY0thdGK1+ug7xNlXYtXAWjmSt8HKjtUk0MEqoiyc2nrNyXLAlQYVswYGGoi7ktz9qbwFU0D57qWhhP8mfE9qBAob0xAW+ksJRd6EP/iDsgv/LaoX1GC5Crn9kP8TKLKYFroTPtyKTi+jC8iA6Wg24ZfMHQHzAZr7LMErQvJkxA1cDYGaFF2BpzzTnLiQvYNJ/3KiQlRnpyVGB8FjKKXEDn78rxVLLNvgNdEc2KTax0K58X1Wbh834WDXaExZruTCSJwF5SrWK6/8IAYXQP/y8NgXWqBmXrLpv13ywFIPUdY9Zcb7GshGf1qHFfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ld9P3YFbn7HPVQyzzxckyYBDskRJ6Ek1NWLPPDZFxek=;
 b=WYVry/Pe3MyrHvXlJwCjveAnnfnfZTcOYAaaWJ75voTf7R+JwQJDfv/G7aQSlPUj6ejDTWMbEhscb6cGY2wKNmFdivq6AWkGngjz0sWKP9x+tRALzjE0mbEHfo7QR1JcV3/FeTso6nTAzHb4JK7ZTL0tUdrxpzXXo8ZwYsZAYBTGo0OGs6NzoQ3BA0WTatHZmiPlrFgbHolxgMON6VAUPiUKGTcf+NA/jmytADDBp5WJcjOBlXgQbyQGT8si9D457LY1zcnNxhSK7/kyGkD1nb9fYpGrfY/MNzTkonn1Nk6j7K3ps5896vQxmbNHrFAz2FahZV7yoKVvaxNaZg9LFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYSPR06MB6472.apcprd06.prod.outlook.com (2603:1096:400:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 03:24:37 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:37 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 12/19] drm/tegra: dpaux: Convert to
 devm_platform_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:48 +0800
Message-Id: <20230710032355.72914-12-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710032355.72914-1-frank.li@vivo.com>
References: <20230710032355.72914-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYSPR06MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aac08b3-2e56-4875-92cb-08db80f53030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U0H7DdEk/mT8vPNfI43h6BtwGod6JNZkQtUHTYnk2qple1zFZSR6hlRiaoSyNCdmLPQ8b5USgBvcig3mnGbq8tVGxF11LMT1uGbjJyb3oAlda5bk1waGFLlYqRecrPlnyM4iGa+WEPrqrFmrJBkqwwFEv1juv+g+WWT7icQbvt/x2/gybbkA9BOAGNRJzANQa/SOr9HrcR1CpkRhDQCJEBNAqKsf3mUNs738/v0XxBth4EXiOo4RdKMG89myGg5jUCLXGBPgtmMr7v8J9WXGGu151iGBjVpfSH+RmKQrFgW7Uib4wlaFoCalkuMU9t664q/qWKKgdGazx8Bh991B3PkZhzvlKFuaegsJmvd09QVKZpbQboMvaRlkXythYmXxghS2T1Epl+WBBHFD+cr6hJjB8W8RmIfOdZiGwV9SiWbpyJE7UYLg8jCDWjU9tBTTSGsixlJl0YxbJmHoXkgAhQOshy30HvO4MrejIq33AWTWwZhvlhqZAPzs5GICS+RHat6G3CCFpGfxIKfxD+rlMlHLbOBbMA/FidR2kEgdD2IhFPkKqVZ79QOrJLeLwKFUJa+Hdx4U2BZlZsW9F1VgVBe8SJShUmbLksHEI1PR7GZDo5HX59lmHGOG8wkCZe60
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199021)(186003)(6506007)(26005)(1076003)(2616005)(6512007)(83380400001)(4744005)(41300700001)(4326008)(2906002)(66556008)(316002)(5660300002)(8676002)(8936002)(66476007)(478600001)(66946007)(6486002)(52116002)(6666004)(110136005)(36756003)(86362001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Dkc2CPwh37CnIiPIf07R3zG1n4osK6AfdE1+wx9K0Wvti4s+CbcXeUThwM1?=
 =?us-ascii?Q?USdIp5mIa/1PYgnHE+X9nixlXvKCtMh35t/Le7hysg6n9Hxzv52CKbxCeOss?=
 =?us-ascii?Q?DIL3DuwBqFQ82Pyj6m+05P8sh/7p0+it2vJXeQWKLGU99+VG03MB0RZsaNSY?=
 =?us-ascii?Q?o26wPQfb2gD072PO2p6MPe3AEq9AsvoJV+l+aiJh6qL8KgtXDxzpqDxr+uR2?=
 =?us-ascii?Q?I954Ap2GuEeJgQJRoI2JRof58kS37n2eRtBKHYyVlbjEGJA6GQ1kf3ribWeI?=
 =?us-ascii?Q?7dPJxCRhZviEIPVLc0Zik4UT1lBa8PUNR0tk10r5qXvY9xt+KpErHQw8PeeB?=
 =?us-ascii?Q?P6F3zr0rf9dgNte2c+aqtj7q0SP+2/wi4fO4IuHqJP/5z4i5rno4jUc0zZHX?=
 =?us-ascii?Q?/XgaTpaNPI2ITKnidjnxlcfSGIMsOmdfny0MFMeEviXGNkkukisVyKaN5zEW?=
 =?us-ascii?Q?YpDOdp6S39II/VecJyFSyUjUDwcsWcU4t0QYz0ABRUmhJKYoHoWV2MEzmBpD?=
 =?us-ascii?Q?VZEgW6grxJ1mALi7Dw38d+x+QL+PPMOTKp3iqxgaMW7dMKPqhOiqsVOpLZdf?=
 =?us-ascii?Q?AXRlcJwxNMypWmmhJl+hZNFPOvrmGU7Wm64CjGT01h7XTFVaR4wekBL/++uK?=
 =?us-ascii?Q?d94x2LtiFgTsvmf16f09C7lvggp5KgwjfQDw5ulo0mOooTXRub7uPJAqfzh3?=
 =?us-ascii?Q?Zu9wxl7dgVRZ3H/rI4MF49rdKOhb5hpAaBc8hIrTeAqBG1j5kftfqDMK3wit?=
 =?us-ascii?Q?g8QTzBd30JpOskU1zyebKTdiKSOXOLiC0bjnR45tXldy4Ln5FKBFxLGDAWeC?=
 =?us-ascii?Q?n0xAn8D0MLWJAXpDuWPYYIxn4sD0d17AOaB8XrtONoXuphPlEPaVN8DvwVU9?=
 =?us-ascii?Q?2Svhky1efSAGZR7shqmi1pWvUX/xi2N7M3J/CVdK1CWuMhKgDhybFE8wr0I2?=
 =?us-ascii?Q?jlUTVI/KPS54SRMFEpgurw08dQkMxy3z9bC3NPyKSwTQEcVa26CYxUECimyc?=
 =?us-ascii?Q?ggDC1rpWwee45YuxTzrlDIQw1+H8ZJxadNGJFJXBTZvBTeUAtIzKC4CK0QJb?=
 =?us-ascii?Q?EOJSR51/do5nFVs2pK5e+DL7WHQ7o19Eh+7KetGjj1EgtQu8zjyOXus8dznX?=
 =?us-ascii?Q?4m8jP1YsAedo6TW62LqnlfpzVLJxwQiZs6zdg5qEdIlbUc4mV5MSNod2GW4F?=
 =?us-ascii?Q?vWcKtM8G6PwDK6pn7uBkaY94gYDlRbjDwmkaBKqj4nsaDMNr9WommEunE+XM?=
 =?us-ascii?Q?YCqZ7Chefkz+LNa20ZFqd+UPkFIcDLS7B06Igzk0q3IaSjDnoltWtHDj3I0c?=
 =?us-ascii?Q?lq/iecX6HvtFcexqVgfZy2rOQQtPsme74sUBnK3udkEgXAQiqaznBs09ApKt?=
 =?us-ascii?Q?RElVgJPGyGfR2McKzbwDLGGKAiVOTYzaf2tlbZBD0bCl9Lmfn4siLq3233Jn?=
 =?us-ascii?Q?00ZR1Oa20fdpldmTlI2HQb2h4br1JULZwOSqG53+NKf1eZIrxypewg8hpm/B?=
 =?us-ascii?Q?yV+06tpMn0elqcr+b1IQr0tKxqgSvhU3oTiwpUQAxGDkWVa7CzClLrJiznvN?=
 =?us-ascii?Q?oxTDuKfu4jNDvRs1jDY+vKbFLMLwgF0PNTV5QyzJ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aac08b3-2e56-4875-92cb-08db80f53030
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:36.9202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLv86LzoEB2kW1DjJM9su3F0dD4pGAbAKsl+v7n5oPbGjOKDIiehP1GQxBdbzhRIty6ibolYF3tL8GD4OEHDVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6472
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 4d2677dcd831..4699def04190 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -447,7 +447,6 @@ static const struct pinmux_ops tegra_dpaux_pinmux_ops = {
 static int tegra_dpaux_probe(struct platform_device *pdev)
 {
 	struct tegra_dpaux *dpaux;
-	struct resource *regs;
 	u32 value;
 	int err;
 
@@ -461,8 +460,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&dpaux->list);
 	dpaux->dev = &pdev->dev;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dpaux->regs = devm_ioremap_resource(&pdev->dev, regs);
+	dpaux->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dpaux->regs))
 		return PTR_ERR(dpaux->regs);
 
-- 
2.39.0

