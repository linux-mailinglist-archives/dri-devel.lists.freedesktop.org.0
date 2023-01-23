Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B6D6773F6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 03:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79BA10E0F0;
	Mon, 23 Jan 2023 02:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2045.outbound.protection.outlook.com [40.107.8.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF6910E1D0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 02:13:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVGb1NZWFkhg3y8z8JKzAQnrqTeVADllhAkBubUl6d6lpIg13E7UAccX99nw7IltzaAwXUWjACgf+iDZrp75n4NxHrpxZu8rYzOz7dEb0SeMgOtckVXomHcyVNvaYZ+89dXQWVgAK3IPZtSl+7J2EAv6SwJ8YLQprpxi3cAvJ9upwfx3Ztf4ZttZjf3/kkxGYXh3JJRCTfiSXJaWHK0viRO4qFJ+8cyoOfK4ct0jNEez2a4ajTujvr+xm7t8lXdC3NyEOgTXYYMRKY4oRKbh2c3DEjIFdO1vGsbQ8YTraNmRX9K4RtMdHV3PuiAwTjWASA5LzF2VlNp477JVjKXF+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8E0bdYpNvwtkufG5eoMa4bVsSDga1a6QxFBD2NmQS6Y=;
 b=DvM/xwvfHf4OkNQPCTifxYI6ZqllyyzqAum8zzU1DTUwXsSY7rSSXgUyE1t3HBwOxC7YAQ4cvijd+Hu0wo6gO3ixd55ss5FU0Cxiu18i/5e9Nd1S8ERqqWk8FFS2tgOwNwzBc9lfxVN3wvzybC/GkIzVxlHbfR33v88P6r9rdGlBj4nA815+++aHQmJUH1N1pXs/C7gBsLgLjohjMIEjGVnkZjZK+47qqVFVTXPn14mwIktaoaQNdS2sbqay5ZnZhq9jvwM9nAchOYTtVsR2Mi6Y4e/pWl4YIFj0vh7sl3f3ZZA4HF8j9bOJobLc4m+oIt947G2K8wGZX3hzpY0FvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E0bdYpNvwtkufG5eoMa4bVsSDga1a6QxFBD2NmQS6Y=;
 b=Oisy1AX1WsGWr4PnPJ6kml+B6/AELs3Jcunm/ebY/7P2fMrueqIfrDkX3htvCVrKO946JtxepknH0BP9MLVT3L5ylJh9kVimMnMzBCky0wbGHqZQ/bkO7NEAhE/cHXKdPVe42W/4zj9IaUjBz8mqLKh+7IJ7FioWhQT6gYqyag4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8878.eurprd04.prod.outlook.com (2603:10a6:102:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 02:13:42 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Mon, 23 Jan 2023
 02:13:42 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] drm/bridge: fsl-ldb: Add i.MX93 LDB support
Date: Mon, 23 Jan 2023 10:14:47 +0800
Message-Id: <20230123021449.969243-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::34)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8878:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c84c9de-fa24-42eb-814a-08dafce772f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kt9s9/Uo+v6BUiJtPjH9JJ2093/qJ4fs6x+Hxkgto/EgUJqCt6vHHUYqE6CgrywZckCk65zEx00gZrFVdFu5AXFnXWYTipJy6hCU8PIXQJBll8PHa8DTi24sQo/IBZpZyfwirJd1RK9GE9pvl1kKvjKUM8WjJuth/DJkYaFvVBk6z04qi0iv9NzIUK7qwxq9U5GJXD5z5P6wv48dvCrYj3lJhU2kkWaZTt+/fYTMeY460BwFC9F0Y0Pb8Iqf3pv1DZw5MsWlmgCtBXw57AUMCHgDFZBc2dpA8EIWb9z4JfjcKNwFqaAhuwR/VVNMBhyQtK6ouUaweLE9ERg6U2pE/R3CJiCp2Xh5lWwlqf9oC3dmiIgxopqNH/w5N1mXU6y/MWp2VH6GWt1ymxl5bcHrYst3OhFdiC5DCnvfxOCJSTZdXeA8Ag97ZGtzqld1t318sYnkGLtL+EJNgiy0fHD78xuwhcYJUO7B8u31x+59hiPn6PJfFFSjOVYthxb08CRxKRZnvylBYS8px75RiXYjaas5KdurcMFymWbv8aeVUxj+RE+XXbSN4nAzcBYHM375Q0Vy7K13HQbK0IELViXr1l3UfB7K4pq9I0SiwSfq8Wxh1qL7KhhLnE6+e0ge3lQSC2Tc+4z87TMhZmVWyUnS+mfSUER+hsFjpYdcuUrC7b2eQd+iY9WzSkRlb05QJmLXOK0oqXrt2LWkzIHNQNWfaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(36756003)(2906002)(5660300002)(38100700002)(38350700002)(7416002)(8936002)(4326008)(4744005)(41300700001)(83380400001)(52116002)(478600001)(6486002)(66476007)(86362001)(8676002)(26005)(6512007)(186003)(6506007)(316002)(2616005)(66946007)(1076003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z6Ytb/6TkSVEIXpstyJGU729za8tUtMriuhGiVT/hniHrqWV9dBh3FuYJaUW?=
 =?us-ascii?Q?ObgeZrBvhTiTm0cj5lrMOSxMeZ03EhuwU3kehlmYiqmZACBOZ1xgsGgwp18s?=
 =?us-ascii?Q?etkoNhrqJZ3+h/aEcs3H/7kV/DQqQN876uiR0bETfDCP52ggZZAJPMGHOikV?=
 =?us-ascii?Q?bUMuMfs6/z8VjxnDrS7vbgeERbCFReSiLVo5Icze7cgKi9wePgNGOA2FfNO3?=
 =?us-ascii?Q?rMQiB3rYBmbBDI0dLaNTuxNf8ZtFLDANd6I8xPlTSXBo6qPsflFGwmrQs0Ji?=
 =?us-ascii?Q?cJm3J/Y67k4hWtsv0LmvLxev3dCdJUqdTPIr0zUumoJVvmjjc2qjmv8VEfnz?=
 =?us-ascii?Q?Qlt3/+JzT4PhA66ExzJiEHF/PF2napa57JDiQgbpdwdAaNkWXIOfbnTg6t80?=
 =?us-ascii?Q?pTKe/KsKpvpIWq4Av+yW616gz905Qxqq+Mbs0JKh5Lpfm/CoMDaKwxYSIjb2?=
 =?us-ascii?Q?AL4+GW1swjSXNCZrzKkHW3mQ4YAL8n6fmgPZ9+Ww7dAa/qNqT3e+PD8FZvOE?=
 =?us-ascii?Q?7aqZURmGPN+iwkcHhAC8gCmrd4zODIEuL+gbBXEWcwXgu8UEbstnSV+IWuRX?=
 =?us-ascii?Q?ZSuUXs3UOa+i3vTtZYkvh7zckJtCx/DCkTImfap6cHBd/ZdfFseCdtGZY/P7?=
 =?us-ascii?Q?leGT+ojkiwaLrMX6GhcAzql8sqJEESntux85jYOq6H7yOTrs5/uzzL4DJhwd?=
 =?us-ascii?Q?s5Kg1gHkdGKOVq0DChL37OTfvZFBMzajpBYmLgD9uqAWbaDx7RENTJr7jneU?=
 =?us-ascii?Q?NrT2o+bIU19VccPaaGJgIApMm5Esj159M1hMlCs5KJOW6XcGHoXAAtV31FIV?=
 =?us-ascii?Q?NWi8gOzqmP8ZnmR9zrxne4M2twR/iArGmqE/WYgsVnB8D59lQ5M73V1hvjB0?=
 =?us-ascii?Q?MyfNOAR6KsCDYAwJev8PHnQml7hpbAT8XS8cUvQcpI+6UoXYoDBySPMISjHI?=
 =?us-ascii?Q?FpxRdmcrCIvXWQ2KBBcb+CnGN3+AXiJM11lNuoNk/9uI6QZvfp23Qo8xT2QJ?=
 =?us-ascii?Q?2tRVNran9ggW8VBRCgqxH0u6X+Q5FO0VvsFSqWIzjg49iipOJ2HPh/jfU+V0?=
 =?us-ascii?Q?/RhONLafZg8eAowZWh2BikQ/Ltf/EllnAUPRRf+AD56hlbzG+l+x9ftf92Fj?=
 =?us-ascii?Q?tUcUjCPAwtpYcFM3d5QNflml0kKCj+jgZc684OxmRpRIW2H2MfPMqVLQGtvs?=
 =?us-ascii?Q?fhP25VXhLr7iYy3U4sAUPrZGBlQMVnHUY37ZTsn8erWjjMtFa0ALO1mVrxn5?=
 =?us-ascii?Q?FPyVeOook8vjImgwKERlqQBpf41fpJb60CUbjcjnnLnGIHS1Ihl7jx7zBeb4?=
 =?us-ascii?Q?qlOSAlCN99eZUVGHe9UbsloxvK/YCW18whoGKi07GLHQ6I+UjiXpvFBdpAFS?=
 =?us-ascii?Q?vuWz2RPwxHT+DZbEmGpWAF0klhKYMSKjxMNf/Lp7wl9lrbQuAy4gR1v1Rr/h?=
 =?us-ascii?Q?hwaaaAUXMGjgZJ4+qpvgUiFK3waPywoTPNG+XLNqM+wWv6kqvbfdiIMXEgxC?=
 =?us-ascii?Q?Fibgy2SXdRtW1CVn+6vVV9WTKj1YH4AoWfFhgFwlZLyVK9xR4+M1VXu8mE6D?=
 =?us-ascii?Q?j0jiCQXDEPfU3QmKKHsRdNwZ7XQA8jPU8zUCDRf6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c84c9de-fa24-42eb-814a-08dafce772f4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 02:13:42.5898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LI7Y/pBXO9YaInLwhG8bg6uKt7zZwlv0ES5U8ATzW1p/7GD7XWtqM70fMf4aFcYd9Mr+x0dDVnR82w9aqyoxBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8878
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
Cc: marex@denx.de, neil.armstrong@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, linux-imx@nxp.com, jernej.skrabec@gmail.com,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, robert.foss@linaro.org,
 andrzej.hajda@intel.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch set aims to add i.MX93 LVDS Display Bridge(LDB) support in
the existing i.MX8mp LDB DRM bridge driver.  Same to i.MX8mp LDB, i.MX93
LDB is controlled by mediamix blk-ctrl through two registers.  i.MX93
LDB supports only one LVDS channel(channel 0) while i.MX8mp supports at
most two.

Patch 1/2 adds device tree binding for i.MX93 LDB in the existing
fsl,ldb.yaml.

Patch 2/2 adds i.MX93 LDB support in the existing i.MX8mp LDB DRM bridge
driver.

v2->v3:
* Provide comment on LVDS_CTRL_LVDS_EN bit in patch 2/2 when defining
  it's macro. (Marek)
* Add Marek's R-b tag on patch 2/2.

v1->v2:
* Drop redundant "device tree binding" from patch 1/2's subject. (Krzysztof)
* Add Krzysztof's A-b tag on patch 1/2.

Liu Ying (2):
  dt-bindings: display: bridge: ldb: Add i.MX93 LDB
  drm/bridge: fsl-ldb: Add i.MX93 LDB support

 .../bindings/display/bridge/fsl,ldb.yaml      | 16 +++++-
 drivers/gpu/drm/bridge/fsl-ldb.c              | 57 ++++++++++++++++---
 2 files changed, 63 insertions(+), 10 deletions(-)

-- 
2.37.1

