Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF3467F468
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 04:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782AE10E1CD;
	Sat, 28 Jan 2023 03:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2085.outbound.protection.outlook.com [40.107.8.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F1A10E1CD
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 03:46:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wt0VKoIAcUi4xEgYOvYFu5+eCHYGsFgtR43phuqe4VCiGk+0utBHj3WaJa6S//igVwiqyy9oJTwfSAHk72+Ibc/Lkl0fe0WPOMmq6Gl3QG+m1iaQokUr2Qk9hlpvQTTriWPm8TlXRiWn/6oVK0rpejO6Q9Fw0f95WXZUKvjHt4hqaNwqHUW9F7wFzFGldMSbaVjcNgwEStCYM7gl2s1yJnslKA7xdhIYOhIMIWVPz7rgLriQhMht0QdLwoN+NwHJDWmhbjQmQMg5VB7Txo8maM6BtlK2KYkEs5R/PBfR7Q2m4RzAPEUQhYTLFo5MjATWqDLKqa504JQpquRI50s/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BE7SY8Sj3Y0aKM4j48HBZlyBNJRlO2gGpJedsD3TFsE=;
 b=jtz91eVUKSuizxom/QODcgu3JWrLs+ewIgeZGKVbWzSQlFUNg9W1jpksL3gxG91FaDw8tqLpFgV49r6u9mKZ8F2w6/076YORdkCAz0DZbq2pBUOq4H1EZ9EVLyHAMaAxCUSDq5RWeeX3Yqw/HgJH8KQ3tUUTSJdmuaGheDnMQQ/ppfTrQJGVJlHdhJ78PYptVke+7vcCgAU+PqpvTzp/oc0t15EEDvfsP81ZZhNlJ4o4vyhFX6JnApS8dcGDsafsBhYS2E9SP9eqF1cRYpsh+mZ9c++Eg2NVnZ3xPCIaouPgqVbcY4WYuj7DA955TTf4PHy193FZ8jL4IrVJ2mrqgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BE7SY8Sj3Y0aKM4j48HBZlyBNJRlO2gGpJedsD3TFsE=;
 b=LwJUaO4bXZODW1JCXQKgY+SfmxDs4v0jp5aAIIHTNrkQQllxBFyS3NDm+kwcHNdYOmpeBhONOBq9tkFFHEpAHn7Knyorvzz/How5eW8sxS/oDqVPXvkj4UUlLhm3yOeIK0/fzdh7KgtuEOZXJXzrxL3yP8Rn38fYTo9hc23kwGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9203.eurprd04.prod.outlook.com (2603:10a6:102:222::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25; Sat, 28 Jan
 2023 03:46:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%8]) with mapi id 15.20.6043.023; Sat, 28 Jan 2023
 03:46:23 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/bridge: imx: Add i.MX93 parallel display format
 configuration support
Date: Sat, 28 Jan 2023 11:47:11 +0800
Message-Id: <20230128034713.1530218-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9203:EE_
X-MS-Office365-Filtering-Correlation-Id: 331b37e5-1b5e-481b-873d-08db00e2394d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e2hQBPGwpgo7cuuxsl68iMYUdNLHx0dMtH2knUhC+IMu53QHZz+jVzDQL9krjPBOgX0wc4fhW6IdwyDUAb2DbdzFak6V4rgkxQCNqOL5E1UslOuuZyrzk8YIuCIByjDhwApfDufr6B+fDWSKSqLXyyG5uY+JFHUum8wl5d0gUY8diXachtpWgs4o//J89e+ZbgyZyPO5nazs1u006X+YlxJekoztFmwQ4rJpyWIIsbNGlFixVTNz+Li0lkIJxhkHm/hM7KyAHJPoP/Ai6/44JlY8XCCnm/fd0u3hOM174l/DZ/WJIOOaHPL5ODL+yWwSn/Yz3pLkytAvsK4qmahgBC1xIgw7d8EmmNH9ikvT4EBkWpfOpe9B5acKqx5HF0kERHj0qAoJKZWd0hiA+632Ol3t3e7AIRL9/CLrFJ/UYTaZZaeZlQDztyIAvgPrAeD4TQRDVYnsuPM8iRtbZYMewNt2l0FvJrL8c2GhRCyYOETT0IfgoX/a4s058lGH2xpkfv4m1hwhbbaz1tXmiaDj+6V9I5OScAiplXwoXgvcNVCklGR2uMZc4lhQHuqi+TtiYVQegCfUDav2yCNg0lQoy9LF/Cosbe7+HFfO3YjvevfY0Z3SbkeynpG5sHHkkHYQWL5Vm7I6GsRjMD81F647t7ekRi61mTCsQRQqK0z4GCkzATFxHm6ns6AalVqZ+oEBUXGLqZOYFul7Z904PA1UCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199018)(186003)(36756003)(6506007)(1076003)(6512007)(26005)(38350700002)(5660300002)(7416002)(38100700002)(2906002)(6486002)(6666004)(52116002)(86362001)(2616005)(4326008)(66946007)(478600001)(66476007)(66556008)(316002)(8676002)(41300700001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pEh2NVWqC5nSVBk9cCe5GUYmifZPCngNL8rr1zQ5edn/qFtn7U3Dg4MFLmnW?=
 =?us-ascii?Q?ABF4dEC9lNhgCmi/SEiyZKHTnV+tbncxjNxvyNkRcre1PHUKEtYgNrPQaOTk?=
 =?us-ascii?Q?92U19zEChl2tc1oql5DGRzbeHpYdlouZEp5wGLKQPH91GwYmvyGW3YTKl69q?=
 =?us-ascii?Q?h009GUYMSSXJpzSxWfe57nFuZAP+15WfUylNMazET8mNWrH9n6W93b7XUZtO?=
 =?us-ascii?Q?mUhOHZLS0RqSBEB7FF7Uv9y+Bh7VGXpIOHgtdjnTlUsOy0QUMwID/qRlnTUE?=
 =?us-ascii?Q?GyDw4KwHFu7rj6tbGNOpmXJCrI5VaC+VPtCx3a3tAYeqiCbjhuf6rb1QykNU?=
 =?us-ascii?Q?X12od6lhEzwax/8yUhDp6Ama+JEdm4sIUX63sQP4ipaLSPTDApYVG6pelOri?=
 =?us-ascii?Q?x6hHno2BlPZfAiPDMU2oqr0TzQswhpLvBjH6qsyrVNebqwuLojFtkChCzjM+?=
 =?us-ascii?Q?l+9Su6NjbIb0kw2tSEEdGWjqmDhZppsTjVy7XabqKyIXMuD3WrWoPgkYYoqh?=
 =?us-ascii?Q?wE3Y5evZUS+cdnScbYcKWYD5icnvOKLPHla0IFUgMop3cyyBUZYlTiQLxOJd?=
 =?us-ascii?Q?cGJyRSWomcoNepQQjqEPTuu0g+h7wqPrdg0naAGZtp6y5HW66Z11xXOtmqPB?=
 =?us-ascii?Q?iZUndNM+OMu76eiiZgdH34Zq1eZoVSLkkxjOeEt4wGKL+L1ruyn9bg+hHsvY?=
 =?us-ascii?Q?CUYn/nwWmeWGAuUPh72Svo5h2D4vKTI5nHMRhiB1Tgq+b359ppiWmWaUbv4H?=
 =?us-ascii?Q?9CPoxjIlV9Fd2qwDJLIUSoqmze8byETMhu22ovwhZFINowAM9nnxCbpdtWBM?=
 =?us-ascii?Q?q/C+sURMjLGOr8WVGPjQk6cAm0mfYuLL1Vb5AjbIkAGOmIiGQs+Gwy40+pq6?=
 =?us-ascii?Q?Knmmsgb1mgUFdfurJYPttpN8Jgo65b8qvTbtHdftm71bErhAJv6miFDwnmRZ?=
 =?us-ascii?Q?DbEQevRgywHdS16lfZAFZU9qIGnCp49bs0/8n0nw7kf8Cj1pPFNEXaH2Q309?=
 =?us-ascii?Q?4xSEpH9Eeo9F2LRjrZ1vjnQARolRHYBOTlgmDifefTTftddlh6cduFg34jk6?=
 =?us-ascii?Q?ikljri+zMM7fN+I1yXJIlY8pPJHxfD34dY9POWhjgZhl0EzD5AKVALD6kQxo?=
 =?us-ascii?Q?xL7xNbXkzckvqj2ocg0cMDICfTbLlOF7Tqqq/oLTuqakj4Ims/4PVPLPmrHo?=
 =?us-ascii?Q?NRdWOMOVUrqIGfknoMENw946jQD4dRKQXGLRlw3viIf86P9YQaygegYPe4Ds?=
 =?us-ascii?Q?TM9SQ3lOkE7lsd+B4hF9ye9hKUrzVlzYlxWxSV53zPrAMSkrstFjIdFHswHf?=
 =?us-ascii?Q?k2WbXLH1f62QPi5iiNqfVh9RWuT1TYQeHiBiUhXOoO2c4SE9ZG99Qou4sVhS?=
 =?us-ascii?Q?cqi9YoaOFt069/F0+XUlcL6PBt9eBfQKc+0U/gUhF5OXxSh4MWq3EvXhscgI?=
 =?us-ascii?Q?//SC8q+lKjq2lPZqOcrsDxK37FlOHNeE7pY1IwcEfX5tJNn7oYaSccZ9oo3f?=
 =?us-ascii?Q?Ld/4w7fnsefql71Ok6QieHJUgaFbWOUFkISzAl9tePvIEi/TU2MBfdgQqAE/?=
 =?us-ascii?Q?3VyKlWrNgzs6XX3qyMCu6+2LOXRKUeRgfIkueoH8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331b37e5-1b5e-481b-873d-08db00e2394d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 03:46:23.2203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvI65mSkFKHD9rxMbHbBbvJptwZL9jO2N7LETu/fJ/0QFxcz7qwo9GQ8VRlNBETQ8FJ1KEpOrOhrt/InkfZwqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9203
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
Cc: neil.armstrong@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-imx@nxp.com, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 robert.foss@linaro.org, andrzej.hajda@intel.com, kernel@pengutronix.de,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch aims to add NXP i.MX93 parallel display format configuration
DRM bridge driver support. i.MX93 mediamix blk-ctrl contains one
DISPLAY_MUX register which configures parallel display format by using
the "PARALLEL_DISP_FORMAT" field. i.MX93 LCDIF display controller's
parallel output connects with this piece of small logic to configure
parallel display format.

Patch 1/2 adds NXP i.MX93 parallel display format configuration dt-bindings.

Patch 2/2 adds NXP i.MX93 parallel display format configuration DRM bridge
driver support.

Liu Ying (2):
  dt-bindings: display: bridge: Add NXP i.MX93 parallel display format
    configuration
  drm/bridge: imx: Add i.MX93 parallel display format configuration
    support

 .../display/bridge/nxp,imx93-pdfc.yaml        |  78 +++++++
 drivers/gpu/drm/bridge/imx/Kconfig            |   8 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 drivers/gpu/drm/bridge/imx/imx93-pdfc.c       | 209 ++++++++++++++++++
 4 files changed, 296 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,imx93-pdfc.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx93-pdfc.c

-- 
2.37.1

