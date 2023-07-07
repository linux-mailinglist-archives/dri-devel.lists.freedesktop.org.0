Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE49C74AE73
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2E210E54D;
	Fri,  7 Jul 2023 10:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0269510E516
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:21:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmYFM4TvC2yeF6JsbEKlov8N0v7mBfr57sFXOrsUr0HAGgGwAHVTiON7dE6N0EywmD+A0ndpQdJDxqKxMNgesPFzZNIxL59bypwD7w0lI8hM0DVOcMVqbiGpeiSt5I3JMiMKdbNRFBaMePU6hs7sulv9iiW9V8HRB1uMshjQDg4TpOkjQHiG+6mvMO3cebHvmCCWPMMwOOHexSagsuXU/k/b478A5OO1Ad7ZRuE+17pPdskQ9KFL++lNyJWX7sSTTFDy6etPvIx/A4Xgf8PuDQIr3A/Y7C1I2aVV3+cvKtyOj3pWNB0vPL00UbHTIyOjImPtQE3omAsMUjftwLlp9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivfT4v0mzD3LpVA1iGHHtg7OrjYNNt3hYWZ2jX3pDWo=;
 b=oOxbiD43mqwE695h/lIwUHsupdfZzWj5d2f1VbSDFrbq5rvs19AMmrroKzHFLBtNNfdvM0HXpMnppi254P73o/yDo0NXB6ka/CrujWKklbBRjICCBVKLDexoh4U5C7KDCPoSZeAienNTBYG0wpsJRlFbeErWA9J5fAAMZkvNJn2yUcoWFofQdVj1P4ujz5xvVxZKwq4uWXvQQ9WTZrP+CXcJbMPU4oS9Q9TtsNIZwugCuiqV6xzHL3Hrbo4+w/KPNkMwZ4xXO7RDwF8rNalhRAVhixCuJl2KKAAiz0aBAQNsB+a0lQQokswFMGs9Cbi/CQOrG6ZAaNJx6AwgLznDXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivfT4v0mzD3LpVA1iGHHtg7OrjYNNt3hYWZ2jX3pDWo=;
 b=Vz06y4G1zIzWBMX2MUcIOR/LE/N7uW5t/LMNN7Qqm1pkm4kvtxeAhtvYIdUYDNhu6+23IMIVu4sDjJm8GfGDjOTwgg65V5hNYXFIJ4FSFDKomFc4f1WRcqNkCFjXB93STY3gaiOXqrYS6M+u7uiZolLLXCQ+kEZUKt44+8K/SsTWaOoTpljvdF32507eBAs2aACQX7y/Djo+tYl/jC7OT7nnY6jtnmlVr8NEin1B7kQzVP/Hykdfq1XQveH1R+Szr43RZ0NWoLcVNS0oSJtxm2chxDUOl3ZRFDvGzQBE7dOyUkHGg9wP+yqOv/qqzopJOYNNnBQL81VNAWcZtUds1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5342.apcprd06.prod.outlook.com (2603:1096:101:7e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:20:56 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:20:56 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 06/18] drm: bridge: dw_hdmi: Use
 devm_platform_get_and_ioremap_resource()
Date: Fri,  7 Jul 2023 15:20:22 +0800
Message-Id: <20230707072034.48977-6-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230707072034.48977-1-frank.li@vivo.com>
References: <20230707072034.48977-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5342:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c9d2dc-dfbd-4f99-a769-08db7ebab4df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YwzLE0puxQLDXCZCfu8qT/BnY1r+atOnfBQQY1VSNUDJJjsbG+nmxxBIela4x4X25cO49mCwzBT9yMxk794BZiswh8TdBh8A0LKNwWriWs7DmeR0lzirFVjmmafjtuqyzZ+YHcxHqZBV9o8Wvc5OBNYcYr7kTQceoyvOKtC3ntUBNrBrxISVRz+L1Z0Z8fgfxVTsBqdpnWk6/Tp/y26z1gLIPOmQo519UV3nXI7JjIOk5KlS0+CWkidCc+d9/PTtTQI35ykIPcI3M/Y5alZf398v3nUIAMaNuiMpaYrt3qE0fET/oqDmJPJq4yhs5tld3g6oKvI1nwQQq56oiD1Ed/5JJSX0rJ3Dt7UDk12fkgdHuJUdty1cuaE6WtgBD6iTbfrtxGeJqN9EoDzXJ7maroAS0V9JS8gZdWySZk4biaKNDGOpagXiN6O1OJFsHkkEDLSWtxtqAOb32qFOo0Dn3il8CpX8859jX8E0tR2Zvlq/fqNyetR4Miav+MkLiQ/UpEfsJxnjbQMFKT2YNJeqbEdpDzDvpunvf7zSNF3ALGD4Fs16tcyPfj3WBkAEKw9TGmahAUCk/5spwU5qr7ZGZ1M9yPBwkFbXzhLj0w2swl6uGeEkk1/Geukgbm27MmFB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199021)(41300700001)(5660300002)(110136005)(6486002)(4744005)(7416002)(316002)(2906002)(8676002)(8936002)(66476007)(66556008)(66946007)(36756003)(6512007)(478600001)(38350700002)(186003)(86362001)(2616005)(38100700002)(4326008)(83380400001)(6506007)(1076003)(26005)(52116002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zY3Sev/XKjP8k1uKtBbMVCLvheebh7KmyFpHZSMlCUDY3/GjsIMZEk+GJ/EW?=
 =?us-ascii?Q?6NFuSsbMEjJ/RS/K/6CAISTa2gU8CnzzWFI7ErgwPbqxprMrIpZMTpN5NwBa?=
 =?us-ascii?Q?dLJfPc4n/imFRujezzFel2Bn8eiDlTVED/cltKx4IOLN15WglGl+lNGTApCN?=
 =?us-ascii?Q?eCcJiMNkfKjBI5qkm2Ak4BeGED1hGdF43S+lD/cFticChghle3j83IBXBJpN?=
 =?us-ascii?Q?jF6ciuRXvvgTFc8z4E+5PFXR798t8ZYFhi9Zu9YV7sIvPYf611NozzSvi7dY?=
 =?us-ascii?Q?sXFmCaXtwAdX1RRT37+M6GXFAEqWVf0xJTKEHDUutUCSuMvM95cvG3v5TUO9?=
 =?us-ascii?Q?hyXdQskcLVha4OoWA+JaAYufX6Ronw3p6SOymDeff73qaSJqI6uVO6Xo6XQX?=
 =?us-ascii?Q?5DsYIpBSgjYe/aGjZncmgY3IXfYYrVRjiYndGvzWpdwpwSjhfmNTUdgI/enh?=
 =?us-ascii?Q?Ki2TFV1tBdGAfgjXdC7+nJaFkUbNo842lISx7cVJB+VL4yBuwR2dnjV1DAj5?=
 =?us-ascii?Q?GJ+12d5sZN/ulWpq4lM68rZnpKExzK9OldBaUKtgWoU66VAm0+IoAjOCcSKa?=
 =?us-ascii?Q?G2c9xojpR8Y2MnGknwNtGNKIBgMRS0URIbAKOHX0EnWo4IMXtUh9OZvLa+K+?=
 =?us-ascii?Q?P1k5a2XfBfye9nOIpRWvfFD+Bj89Z+gALB4bEHucYY5Rze4mtXOxydw9bnKZ?=
 =?us-ascii?Q?gUpoc/6olPfzkMpx61v7TXDMsNC9uBBzi+0WEFrHoQV1C5Q4Vd8VL2nqRg7R?=
 =?us-ascii?Q?9d9rgKUQzCzlfoLWUfIkYOomp0MED/1Ue8aLxmgYUsTOVQOLJ6JhzM66ru/4?=
 =?us-ascii?Q?anjG/wMUQRuwVltRBBI7cE4nTgauBmwgBdg7z5Zo5lQ9/vllWpNDrWGtd2eE?=
 =?us-ascii?Q?UDErn12cr5UBMw8Fp1IR1m/6kBqMHeu1pI34JYhX4OMEZdjaj38EJGnNG+iK?=
 =?us-ascii?Q?vSRDyfWvTYglrsvflkA13ZFOO3fZiACeQArntrzxQs6XEtXWFOIwqUinC4vw?=
 =?us-ascii?Q?AUwZufogAHfoQPCbye1hSV/FU8ZsE66b/Wc2WSAC+hoXDyT9Yrcf3KC3/KKx?=
 =?us-ascii?Q?3583nZEXox5sZ1mEN0tqk4AoeMVhqNrFyM/PRoxGzQrvXov4xGNpNivxhxbY?=
 =?us-ascii?Q?8/j0Kw1IksSpz1I2DUI6QRFJtXlWr75SwIOSMTj8xXwsUl8RizYvtFBxZ+g5?=
 =?us-ascii?Q?BqJt4j7vrKoqW4Hqp5lh2Z0HBID6rRO7iNOUx8q+684U067cQUTvVTgbQaGt?=
 =?us-ascii?Q?pVkFTY5r1tNxLbz7/RXV6f9Hzs1yOeFcJwoouEDX2YQKNw20SOjySl4HDUeg?=
 =?us-ascii?Q?XPk8PtJsMnRSXBvE1PiLKk6jbSNHQYL4egVPnGVuqFX+LKGw2JOaXyYptgOv?=
 =?us-ascii?Q?fbId7pnUhdkJYt81SdHo/v2ftN78iNdD+nISbSxMLDNvhfjH6acdsFPlWrwK?=
 =?us-ascii?Q?Q/YNXBs8jYunwGyOHj4gE01vh4oYzkrJr2SjQv3q8Y7KFnXefhC+NdC1oDgx?=
 =?us-ascii?Q?VYOLmc5fbJIjeqG0UutuzIX673/J01tb+O/1cn9S2SCRYhXwdsA2DdIVwi7j?=
 =?us-ascii?Q?ZkRJOEb+NokmZLkMBTTQhJD8hFOEj2PylGZZRCg/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c9d2dc-dfbd-4f99-a769-08db7ebab4df
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:20:56.8316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4g7esAEJA0YAjeBgkhLzsSaPHzfBJaD6xCAuDWx0QijaavYVC30yqneab9TmdDmy31fmXZz83zaYo55eR5TZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5342
X-Mailman-Approved-At: Fri, 07 Jul 2023 10:06:28 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 7b66f362afd8..b2b320ba2196 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3417,8 +3417,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 			return ERR_PTR(-EINVAL);
 		}
 
-		iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		hdmi->regs = devm_ioremap_resource(dev, iores);
+		hdmi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &iores);
 		if (IS_ERR(hdmi->regs)) {
 			ret = PTR_ERR(hdmi->regs);
 			goto err_res;
-- 
2.39.0

