Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D0B827F8F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 08:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0529010E364;
	Tue,  9 Jan 2024 07:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 918 seconds by postgrey-1.36 at gabe;
 Tue, 09 Jan 2024 07:40:45 UTC
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2040.outbound.protection.partner.outlook.cn [139.219.17.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E537E10E35B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 07:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XySMMhkEb2SjcTg4jSHIQVRFn8biV/NBAKZYUmuq/tcQF81pDgCBuOtCSHho03caFU/FGl7ZFNRfzhYnwWHW1n2+FOYv3Z9jujnxTgQqf85sZ/H/yQNlfIvy9/TzaS3lGO4YsN9jmyCck2Ferc81EHqYoQ+8EbLZyLqmL0NR/mqTg1wmHNO0cXg/Nyn3MHYJT+SZ/axEiZ1wHHK9r5sfxAsFsaSQv24XUIYKsQ2vKfctUuYLlz9EhBSC5V3sRw9jOnxRzNqo3uGKJ+yBBH+C4dIdqaks/l9YbqaHVcd81SiGs2heSHWrfsCWy2ZfuR56cW8DKAA0428jqGMB0hOEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTzShixjE7oUtM7mcd+b6ERhd0vS0ITc1Wt5L7srMuE=;
 b=ZqtW95cPxUQDASdkOpYdlq2/nukIXXAmDazFtGiMBZoUD7gBtNcX5IljzGuE8fY6FhQ4W4RW1yUu229EiCFBqzU5ek8+e+SDIqBvHr38M08WqPf9SIwQqgUvPNW5Bc1uOpxD0uaO43apb+0ZxypLyHfK+nqq9AMbGyX8ixDBjNmJWX46Ov2jzzvz5ud4hUU3QVY0Rq1KGrnA47YWwBZAr2MLINtUwVYbdj208NmCD4ieKMAbf/P7gtbgKKs6eUQf1a2j1r7/bzzoE4vtCRdOZ1QW95pke5TvnkaqmZZKxxNlFOqf9vltUVjSoppRZ9Ncg2i5ZGKGUeELZM0DTQvC/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) by NT0PR01MB1231.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.32; Tue, 9 Jan
 2024 07:25:24 +0000
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::85fc:7fb9:8b00:dd88]) by
 NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn ([fe80::85fc:7fb9:8b00:dd88%3])
 with mapi id 15.20.7135.019; Tue, 9 Jan 2024 07:25:24 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] Add StarFive JH7110 SoC DSI support
Date: Tue,  9 Jan 2024 15:25:14 +0800
Message-Id: <20240109072516.24328-1-shengyang.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0008.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::13) To NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1070:EE_|NT0PR01MB1231:EE_
X-MS-Office365-Filtering-Correlation-Id: db48c1bf-e533-438b-ca23-08dc10e42546
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jz2tFfE3xGi17J0rgz+y+hYj130rrPknRkWqJfTn0RV7KD6h1qHFO4xRDWUj2ImEjG+JmrYNHf97I1ZJWlkLnvtQBMocyhWw3oznSxQlYsDdd+R/xuIPgcFeoI2Qvm2/2otI17EURREtg04x27fzopyzX3395bD0Sb9X0IeLsxcLycJzT0H1Aevo9fL0kruMo6r1NskmEhxvKYdBbILHMva//98AHsPuu754YcNIDym8SpKbmLvutIPgyBGY7c4lLY91HmjWohK79eQOUY5lBAbyl/3zyzDTknslL+oP99sD51V86VP7n1G9FgU/MAepuG/GZIDhQZvExupHzLc+A40qHZcJFEfINNiXW8UqW4Uf1rCNjv2B+CSysp381bmo4Bg3S1ZVd3jr/scBGGMt2hq7gammj1UU1gEzUHlUyvtAZxAAidZuSuPAmc6GVHvV5JkoCS4QwsESxyvGIS7uNRU+CQLa9ePEKcq+p8hsApnwzWe5Z+IZ4It/CH9kZ1JlfoHX2rcSW7h8ZNEcWNOn8oVsdfB7XX2+TY2Io7GlWSHsBxEEhEmNY+kiVg3eY1Gd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(39830400003)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(86362001)(66946007)(40160700002)(36756003)(40180700001)(38100700002)(83380400001)(1076003)(38350700005)(508600001)(52116002)(966005)(6666004)(7416002)(8676002)(8936002)(2906002)(66556008)(4326008)(44832011)(5660300002)(66476007)(26005)(41300700001)(2616005)(41320700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pC2pKiZhwMH4+9Km0YqLBmE+jryGpPzid4rYkem3pTzHsb0dgPNSuPYL5/mu?=
 =?us-ascii?Q?Sh+xL2XjK3mSvAm5M55x+rvNRnlfMjcrAC+tus9Hhed+yvvnGEdiYPlVVKYq?=
 =?us-ascii?Q?Hkpfl2LTqJp4nsCSZTT7tL7zRtz4evOP4H3Ss6zpiNVh11tqx2kpizBqd8Z0?=
 =?us-ascii?Q?NgSotgMMu/mMmvY66DhhE1o1YgwJglo0+J73nzOCbaw7iOcm8LKXAhDePfqk?=
 =?us-ascii?Q?iSJAm24ddYRmhAkQuUO9lH+mmM2WOtneSqRcLiUsQtHbSOBOcj/bAmQx3U2T?=
 =?us-ascii?Q?oz1pEiTu6r0UJXMTT9f60+EYGK6Yk/GeKGzrYxP3Pa6ldfLbs9xXMlUzYa6K?=
 =?us-ascii?Q?XcO7yjMREApr1/AaVVG1/3qvw/IKI/cVKEjEV9klmsY0/O7+Zi3GGqaXeD5P?=
 =?us-ascii?Q?CuUGUy3GIZfS6B/GcK62cPOWK3WyMi5JPftnbSLB2zX/PIOKjhLbpNLUnL4V?=
 =?us-ascii?Q?B70nrZ2s8WWpwltohL//nVyvGresXxuv3T8uVmLn+4IeZmpS6LrLddZCGsQC?=
 =?us-ascii?Q?8AwxZXBeiL9lYgAhoJVL0YYi9h4smwYYmQmuS/hNY0JfSkae6m8bCLfyQNqg?=
 =?us-ascii?Q?I4zyixiwIdrI2OfDXGe2p9VtL8GQhU4a2kvNRaOTW4UJTlTLtkm2oJjKH4KS?=
 =?us-ascii?Q?ShgfThhxLpE8CHGGjN38TKtx8kXYEoAhlCYrvZPtMQDQsBDaxGolSXn9Yg2j?=
 =?us-ascii?Q?vuEEnrkfbQSNUDSXxoG83+MOrVkzSe3XWrjW6lcCxk4AlPtaFy7G+Y0MMoyw?=
 =?us-ascii?Q?AupTw1JQFBRnWBvDSiARES78Hpo4+gdNE77bF8xVviOwNX8BOVPlDV8x0l4x?=
 =?us-ascii?Q?CLNAXxTJ7b3RXU8GHYV8zbH560w2cDsNJ0z8CH3LsYttBpxqbZxdAc4+h6pO?=
 =?us-ascii?Q?87k6eIRpiTLUTm2zK4Y4O0B3VF8gQ+ABcvCBW4tM3xadZ1TRyj/AvYNR1AHl?=
 =?us-ascii?Q?C4O9N1m7ZYvkugCzIwjyYt106KzpRIencjnqtzmshMTNfme58s/OOjwhYrnM?=
 =?us-ascii?Q?x6vg/iMvdI+9DOcOhwT8L4L8+V/w42rT9xwO7QFnzj4mN+RZpz8moOpmHJs+?=
 =?us-ascii?Q?rFyUikO07AXSt9VAUPGq5NhdliLt5bs4po38OZhORBfWlp5XgKVy8D5eiq/c?=
 =?us-ascii?Q?ArpRcksTsWhA2oCNL2UXwyNEUTJZRPHvKFWr2r95ai4Bin0D7K37o1YfqE7D?=
 =?us-ascii?Q?rlOYNZgsZ2p8vEDIp9V/I6SdHp32sVJX1pyMU26hWGW4Jf2cksxCKeeXsHxt?=
 =?us-ascii?Q?e/DAwKCSGV0BMwGwyVkXjFCOP8K0k8mDZd4trCCF4R8udq8YNuHjdWrLvj9o?=
 =?us-ascii?Q?h9/rFkSsXYTxNIUMEYUIwp9z6aLAcVOnEW3mrEOO/AHjRa1gjDZtsiavCA3X?=
 =?us-ascii?Q?MCdQTNPrw+kEIlDfxQCLwqCLMKUcVwndY/pEDyBrChmgc/KXG8eJCI0VZks2?=
 =?us-ascii?Q?m7+9bqtUqIq2AgXxWRn8uEerOgDllobG3TZhkiI9c/SesSa3W8RC9r7gwmgU?=
 =?us-ascii?Q?QEmBzv9ntT1JNyzyDlMVzOQIek+h/w/vD0m+OEvlVe/c7CQDwAAkovchF/I3?=
 =?us-ascii?Q?luxpN0zvpZNNPdc0MtV6RsEWeP/JaC256mPsPiBcaLG1R7/xLcWKGm3JCODO?=
 =?us-ascii?Q?jCegKxam0gUC2cHO6puqX08=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db48c1bf-e533-438b-ca23-08dc10e42546
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 07:25:24.5306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJq775dZnJx2jggY7iEIAWjIjuG/tSj9/h/B/tBH7L4I3I9P9TLCJzN6HzhHYSUS4y+PYQsX4LvRsV8XAyqNaoqoZDANI9MITRZVbm6rMa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1231
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 r-ravikumar@ti.com, rfoss@kernel.org, jernej.skrabec@gmail.com,
 u.kleine-koenig@pengutronix.de, shengyang.chen@starfivetech.com,
 conor+dt@kernel.org, jonas@kwiboo.se, mripard@kernel.org, robh+dt@kernel.org,
 aford173@gmail.com, neil.armstrong@linaro.org, keith.zhao@starfivetech.com,
 bbrezillon@kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 jack.zhu@starfivetech.com, tzimmermann@suse.de,
 changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is the series that attempts to support
the CDNS DSI driver used to converts DPI to DSI.
CDNS DSI is embedded in StarFive JH7110 SoC.
The series has been tested on the VisionFive 2 board.


changes since v1:
- Rebased on tag v6.7.

patch 1:
- Changed the 'starfive,cdns-dsi' to 'starfve,jh7110-dsi'.
- Changed the compatible enum alphabetical order.
- Restrict other variants.
- Drop 'dsi_' prefix.

patch 2:
- Optimize the calculation process.
- Drop useless definition.

v1: https://patchwork.kernel.org/project/dri-devel/cover/20231127113436.57361-1-shengyang.chen@starfivetech.com/

Keith Zhao (2):
  dt-bindings: display: bridge: cdns: Add properties to support StarFive
    JH7110 SoC
  gpu: drm: bridge: cadence: Add a driver and platform ops for StarFive
    JH7110 SoC

 .../bindings/display/bridge/cdns,dsi.yaml     |  44 +++-
 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |   7 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    |  29 ++-
 .../gpu/drm/bridge/cadence/cdns-dsi-core.h    |  21 ++
 .../gpu/drm/bridge/cadence/cdns-dsi-jh7110.c  | 193 ++++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-dsi-jh7110.h  |  16 ++
 8 files changed, 316 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h

-- 
2.17.1

