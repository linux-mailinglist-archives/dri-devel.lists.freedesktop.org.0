Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBD576F3ED
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 22:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E975910E21B;
	Thu,  3 Aug 2023 20:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2079.outbound.protection.outlook.com [40.107.8.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE2210E0E8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 20:14:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bupS3+HBRdRR14y4IQfX+t3JgOl4wuLwGwKqUrZDRerldKBtNsz56WBuCILZJZ/GZC2zFkMHHFneVf95UP1TtV6gEsEh2zUUcVvV50Ok+YQF3JPdAuK4qzR9qLSBjw/8ZYaY1QZW+mq/AaKJEI73PhQ4Oqzqg7HrfO3/gxy3GV+e+VUAn0/XGxTHOBw1+euIMfs8aQwkNNhQx+QyaxN3BzTp03Fz9KWQ4ayTJhgGff6YCtMcR2Jz1C3PZ5OivpLL9aFIlXMpDLFLpTNtHp4Q3hLb+b1oPNZRog6kdPWrHFr+UKc8xIW/If6Sb225XsreX6A8itXfeLxH1RU4CBUOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUr501IUuspCEdQe3Qu5HSBpESl3w9Cz4Tbq8OLmvms=;
 b=mm/L4EcgBb8T0XveK+0Tb1ybjG0pHN4MPDeSG22tPTxfYHLQputv468i9HqIdTDsntGWFE0XyvTemCdv5o7QBqSaCB+c/9cizzI9dOdL5yYjSKjh5g7mquTRhlhIQGul4Li+YI/mhu+FLtFlu2i1+aqH81GvLuVu3BnBTHAOVxSTdeUV6Wpu0Mkubhg7jbtzUvXFl5kCUncvkyQU0zW2ajMhXim0kk9m1l5GpSzjGyygQ4F4uEZ6Rgk1RCeMTiLXQ2xKn8NZSnR4P4OYd+qVLcpfJjTf2OIgYWuA8WmH/wtylTJ77M6ZchARJwGxQLdLDVRqme9joRiBzO0VvbOLGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUr501IUuspCEdQe3Qu5HSBpESl3w9Cz4Tbq8OLmvms=;
 b=rMLZpOjIrXfw1wuQ3N7XaStYmZdHcT8hPDj+iBoU3IbxxdvLmzIljm6vUEdC80z/siAo9zu3cXufLsHpIXGcOLe2F1t179dXX86UNiHNK5SS9gr9CGz046S1xWCSrwAFr5e5AevVtrZbbrfU3Tz6UgyZLULNP1sUm+0ffdIaBqg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU0PR08MB8277.eurprd08.prod.outlook.com (2603:10a6:10:40f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 20:14:01 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 20:14:01 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 03 Aug 2023 22:13:48 +0200
Subject: [PATCH v2 1/3] drm/panel: sitronix-st7789v: fix indentation in
 drm_panel_funcs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-feature-st7789v-v2-1-207cb1baea0f@wolfvision.net>
References: <20230718-feature-st7789v-v2-0-207cb1baea0f@wolfvision.net>
In-Reply-To: <20230718-feature-st7789v-v2-0-207cb1baea0f@wolfvision.net>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691093639; l=1072;
 i=michael.riesch@wolfvision.net; s=20230425; h=from:subject:message-id;
 bh=YB4ONAvYgx0+mzq4tpPeUDh4qNY1DT3r5vCGxuztUV8=;
 b=abZCbMBXq8+JKdPFRTCnc5GBTri7Dxg9gBeMTWkBgsVRygPc1pi2jhxBSG/oI5oOrRtf6OCUf
 oG9X2C0VTAbDoCH/se7t/f+6lnhgvDnuOQbNK0JCZ11VD5QrGn3tHEx
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=1QQdXA2QbwdxaQn/VQK0hz04C8IBYhDowbK0hlNU4Ng=
X-ClientProxiedBy: VI1PR06CA0212.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::33) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU0PR08MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: 51715b8e-5e44-4b90-f0f7-08db945e2d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VsII806W81X6b0LPMmzEsFvcrKAWGl5uE13COVn3Sw/fO2lH8htHHcQDhYgrNOWmTmnA0grGLFczEuHy7QqAFAscm+tik3OaY5qER6grVhAtGmogi9eSXLsTXdnO4t/UMtDo0m8M7bJDZ3LoUgs7a1NzDGWsMu7ix/s2bEhSPPGNGJ8Zn6N1yV4J298Ro67weFXPJzCe1h8lUhx3JLOHtxcgShFgqGcsjqE/245cepyT3QLyxUssYSR0B7zvf2Kuj6OlafmQpRu2ldFizwR5dTK1Id2UNkcxQ3wcwqM1A1ji1D3ilxgosNpwFJBTO8KzKczBk6giGAe1KKVfFisShFlBcxIGyy9F3HVGx3aiAUEMabLQPjRsHd7lSL1EOJCVpWPq09us0OeSJp4utDEhTF+jPTPYs67i5kK0yyiZFnw0oVuOxQY2kDlOyRTQv34m+YmrY2cz1PEFS61VGKljm9gmipEtOQUgEIEpR1FX6Q4JIJYjOcIXqR/DiGVOZTmwe55O5A5sphfMjyLNwLm+xEpkvhJAe9YLm3L08PqVkn2wORtQ8PgUakPaaSWuevRT+mEUpHHhif9XE6BH/8iAa5GdQraPO6qdj1teNUT5fUudNoLbtbUOo3hRU3seGk9Gseia8ZnYYNLnVdlSD27mVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(366004)(39840400004)(136003)(346002)(451199021)(2616005)(107886003)(6506007)(186003)(8676002)(83380400001)(26005)(66476007)(2906002)(316002)(66556008)(6636002)(4326008)(66946007)(5660300002)(7416002)(44832011)(8936002)(41300700001)(6666004)(6486002)(6512007)(52116002)(110136005)(478600001)(38350700002)(921005)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjVsMW5YT25VbllwYmY5OVRGUzQxVVpGbERZV1c5MnRWd284emV4bzlkYVNR?=
 =?utf-8?B?V0xONlhsekg2WHhBNEE3OVdqKzZwTGNvT2NudGdWSFlab1BNUU9yNHNkeFpa?=
 =?utf-8?B?WHdzZGRncEVEUWpBK2djQjV1eTk5RmhIdmRGeTNzNG5HS2ZGbndVeFVBOUY0?=
 =?utf-8?B?WGh6bHBqV2QzVWdlbW1naE5obXVuVWRtMSs1MHJUU013UnlwSTdudkZxSWlD?=
 =?utf-8?B?cUtuSTdnOTYxbjRhTGZ5aExlTFpvVCs1dXlLcmZkblVnTStYSER0cUc2Mm5v?=
 =?utf-8?B?ZDJPUGp1NWltdGcxeldYS1gwWVVzbG1PbFBoelBBVEpFNEdPT0JEblYwYUU3?=
 =?utf-8?B?aHBFMkhXTVFFTDBUb0RNSDlXVTBIYWpheVoycFNmZFQ3S0l4M21lcGgxVmMv?=
 =?utf-8?B?YUM3QmUrK1lPSXZHbFdQQ3h1MWhCM0g5UjRIWlY2SWI4QjNRM1p3bU1CRXcy?=
 =?utf-8?B?ZGRwN3FUdUJibHlXSG1KTndDRWF6YW1RU2xYcTBPYlIrejhNOUxCcHQ0VFdm?=
 =?utf-8?B?NXIyNWovSlI2M28wY25lRks3ZnFkYjFmNkhydE03enZJankxT09VUy9oMGhW?=
 =?utf-8?B?R2pTTVRJVytkUERFOUQwblJSTTZBbXpjdHdTZCtpTW5NbmJsZllsZ2xRckJr?=
 =?utf-8?B?T1c1NWliQzMvN2V0QmZqbTdSd3VpYjhzWmQxeENHR21ZTGNxT2dsRUVWejVU?=
 =?utf-8?B?VHhKUDBER21oQm41U01QdUErTHpZc1dNQ0ZCMlFjaHJUNVlXTHUrQVMzRmpJ?=
 =?utf-8?B?Q0ozdE9tbVc0NHUycnNMZWtPMjFvREhyN0JHTTZCUkRsOGNwakRzM0RkMVVR?=
 =?utf-8?B?NEZMbDh3bGpPOWdRMFdXWDNhbjVSenUyTXZXS1pUa0FnMXFId0xDYWxsMWJa?=
 =?utf-8?B?Y0tSVDZsWWJseVFmdXJ6SXV3Z3ZqS25sZnBINFR2a2N2TEw2OU9IM3VRRTZK?=
 =?utf-8?B?QWxnNGdpU3ZwZnptbExpazRyTlBla1ZDaTRkUWR0RHJHZVZiLzlZUTVvZEFi?=
 =?utf-8?B?QWozOTRnbHNEZFZNNC9GZzBDQkt4cGVYdHIwZndnTmJ0SkM3MXRCblArTTRC?=
 =?utf-8?B?N3lWMWxFQVV6Nmh3MzdSYTNFcmo3d2Y4Q2M4b0Iyb2RXVjk5M05JT2RrM0VC?=
 =?utf-8?B?RlZyVWNsa3pqRDBZQ2VzandSS2c4VDhLN2RhUXpyWGRieVJ4REIxS3N0SHdp?=
 =?utf-8?B?cVBhRnltUzFHYThYc2tsZ1gwWkUydXNPWE1OK2VnSUNUMUdWL3laTUZuc2VB?=
 =?utf-8?B?akxvWnJjQ2pETkg2cGszUDA3Tk9Sbm5ReVZ0d0FreTlXeHVFYzNydmtMVXVE?=
 =?utf-8?B?TTJDMnptUUFIb0JXZnhRaTZITTFNcUR2RURtOHltQXArd1pFVDNjNnFuODZE?=
 =?utf-8?B?SzZNTEdTcklmRGg4WG1oWGhJZ3BIMFhmYzUvM1NlUUFjOENieURmYnpoMWFW?=
 =?utf-8?B?Z09scnNleXNzOUdFU1NPTjFsSjVKcjU0R2Rhb292UFZIczBIa210MzVDUStm?=
 =?utf-8?B?ZERJdlV0M3paM1hubThjTTFGSnNLMmEyQmY0eTYrS2JpeWhBbXE4NEJnRDQy?=
 =?utf-8?B?OW1SZW85SWZpWm8wdklBekVkOUNJbmFwaXJyMWliT1dNVVpOazRHczVmd1F2?=
 =?utf-8?B?YTJYNXdpUzJjUytLcDU4L3FBN1IzMlB4dVJmNXIvZDE5ZUF3YzE2c2dBTUlL?=
 =?utf-8?B?dUoyckI4TWFabkxMR1MyU0Zyc2Q4akc5NnRxUWlvSUJWTWEvckVYSmVhcTg3?=
 =?utf-8?B?ZXU0cVc4UVI0R1FLbW5SMjZIazkwMFZKVW9GdkhZN1ZjekxTTXdFZEFxSm1Y?=
 =?utf-8?B?UnE3elJZYzdjdmdzcHJuR2lFRGdoelBocGRHTnByK0lqRklSMWlXRjR4RkhP?=
 =?utf-8?B?R2F0V0VQRXl2OHkrTTdwN29PMll6and1SlpNcWpCWlNPTmIxZ3B1a0J2OHlm?=
 =?utf-8?B?TXh3Zm5rZkdkYkgxTTloOXZzQ2NHL2NUSUtpNEtvRXhPZkdtN2w4cFY5by9W?=
 =?utf-8?B?cW5UdGJmSE5rbnlDczgvUVhMTFloNVpVdXFybE5oazEzaDR5eG1XSUI0dmpH?=
 =?utf-8?B?WHFsQ0pOYTNaZ0lKV2ZITjNWUndzQnNTM0NJRmJoRVVQamdQRTdjVmp4eWcw?=
 =?utf-8?B?dzdzZzgyWDJNbzJLSURGR2dvRWNxRUs2OGMvUlUvUnMyYjVLdSt2aUV0MDAy?=
 =?utf-8?B?R3c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 51715b8e-5e44-4b90-f0f7-08db945e2d4c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 20:14:01.1877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/bHdCXgUYz6p8jr/BUZEXy/+2ObWD+cGS4p1L3I9U6y8aHvMTcvM3wKCoSG460CvEH2oZGdVX48QSd4i2qwyjjCtAjc3EVYm8O6Bk+06+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8277
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix indentation of the callbacks in struct drm_panel_funcs.
No functional changes.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index bbc4569cbcdc..c7cbfe6ca82c 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -346,11 +346,11 @@ static int st7789v_unprepare(struct drm_panel *panel)
 }
 
 static const struct drm_panel_funcs st7789v_drm_funcs = {
-	.disable	= st7789v_disable,
-	.enable		= st7789v_enable,
-	.get_modes	= st7789v_get_modes,
-	.prepare	= st7789v_prepare,
-	.unprepare	= st7789v_unprepare,
+	.disable = st7789v_disable,
+	.enable	= st7789v_enable,
+	.get_modes = st7789v_get_modes,
+	.prepare = st7789v_prepare,
+	.unprepare = st7789v_unprepare,
 };
 
 static int st7789v_probe(struct spi_device *spi)

-- 
2.37.2

