Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A153F3B047A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 14:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5DD6E4C7;
	Tue, 22 Jun 2021 12:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2099.outbound.protection.outlook.com [40.107.93.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7D86E4C7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 12:30:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iaaan4yDyzHMqNeehdJ4AQ6cuKJvQy0VPcSQMNrVJDKmW0cG7pSTvwV1Z9QWTS0/XHIYwGiRWbrTR9Hyrrq11HhZDV/TswMq7dlC69zw5dKV6r35BNwDUvVJJPZnN3jlJPQ7ff6qWea2pxVzgxBHabjwMa8sjN5DfVSk/SiLY+IPELYqlU6rJikVlAE7BM22FlB5B17U1BzoPVKBC7vQOu0sBKfLaTPgzQggNBUibzmIBNvu1AHYX/9r8m+KkGQ/bu7mVr1ih4qn8J7SQRCtA41FXjV8EMMpvDc/kYBZfPDCGdXh+EN7dNaHZaQNftsCQQKtxoZ9KzV5y3JIIPJhag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiNniqzHawWoeSMXrYb6gwkaaxz5fvzAOIc5PnnLSXg=;
 b=m92liBSwnUukAvLOCALdi55ZppgkAPq2kTEmNI/QmPXRwyWONSE+EPQy9mynEGDwzOlJR5D4t212HocJeS8QAhtnOUZFpZSne+9GKOkb5SFP8ypzPkC6lrKv5iMDbnBZWvwxoO7fu5yxmXjvZIsD4AjKuX1JeDQRNT7ZnKpokwG+9oGn6RkAhTW1+TYH0PYzsnsadydDAWt72yfF1bqaFCAWZjW7QWmWe4ZaAfNpExkn9jLtFetF4pqBtbtS8inO5SVNmRNedmgyi3SiAFOu9gbke5lTXWaSY8yRvXSsEyUIbi5+Gae8xoq9s8RiKe0sAOotOVPS6r1XFNPAF48iMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiNniqzHawWoeSMXrYb6gwkaaxz5fvzAOIc5PnnLSXg=;
 b=OJJUn31KdC+uPMgT51TL3jxDobRC39aeYqwqYB+Qrd35+7ziQJazR9tn0fps43xGWqUaKgEQJYwMnWnfC2vToXXw6TaoynPel3KV6DI+obwKOBjNXNvVLLaenLjtpeXl9nB/PzWMDNPBLmVd9quxH4B3hKMk+IzF52DRnqJS1W8=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7245.namprd04.prod.outlook.com (2603:10b6:a03:294::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 12:30:46 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4264.018; Tue, 22 Jun 2021
 12:30:45 +0000
Date: Tue, 22 Jun 2021 20:30:38 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v9 0/4] Add MIPI rx DPI support
Message-ID: <cover.1624349479.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2P15301CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::25) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2P15301CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.6 via Frontend Transport; Tue, 22 Jun 2021 12:30:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbff5528-4936-4f56-5fc0-08d935798efc
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB7245CFE50F172E0E3AA423C6C7099@SJ0PR04MB7245.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 13SNEOgWJ+Ld5an9A3Wen9xmY0905AX9dJeWUR/8XtT6ZraLdmhiWP2e6wKoo8uT1qszD8T64OCa+MUesJVRjBQRyvPG0T0rI1BOGYsDbHFwSD20JQM35uhmsn9WlICQzJn6+Rie3QSnNDzIbDlMCNPDpEVMoJDTTe1sHyKlInPJZ1HuWGEz4CoKw21dpBy6qPhjZobBLgMG+GGADuSwZ2D8ioag9LFAOHlhUg0PqN+bSKwfnEILZJhMaJ21QG//Lfp5NkDcZKG3MHsIohhoVBu27659BJ0IzG5hhqqddqGejV2wLlXYBHiZG+7GR7q7PTA8a4OfToJ75Ah1jdzgHngd215IlbHczt6+4pcnr6MPCBU1AxfTuHfezyih790JRu/prhLZ1vlMzKvW+dvhms1YyzcJbeGGAZL8HuxH1vj90+g2w/hh6IzFt1Y5vaE+wOVa9fY7T9zulQs78CQ7+Dkwz3oCFm1t0gis3Qy1qLsWuNzj1vkMjdKumeShg8Fe/Qi1R2Fb/+ZpiXMLrs5YbEC0injY0U3rDKmFia7qVI9RdU8T4Rw/do2Bnf/PMbZISkgvviU849OP+XVs50YBQF3IK1tEsO+yGT/awF+NaimpI8PFaYniEAVH/UZi79WvaTSK2puFxG2CrkQ/1si8Eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(346002)(396003)(39840400004)(366004)(83380400001)(6486002)(956004)(5660300002)(2616005)(7416002)(38100700002)(38350700002)(4326008)(6666004)(66946007)(36756003)(110136005)(54906003)(16526019)(316002)(186003)(8676002)(8936002)(26005)(52116002)(6496006)(55236004)(2906002)(478600001)(86362001)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4VTSizz2x6jFbN5g9Fx6Ism0raD6qhrSEHnk6p10NyuE+v+Sjt5MPvjSlsYi?=
 =?us-ascii?Q?Fox3RBxms+lfVO9HhrQ3rlzf+q8xny3VPbZ3tHcpMe5ul1H+JN526sSMxPup?=
 =?us-ascii?Q?ifsG8TM3FfEZ7dq+x0Lb3+i+Snb7bA7bDOJW+SbvwnxivpdKiuIZrrMxHaNg?=
 =?us-ascii?Q?BwD9z7EP/iw59aNkMIkyEPFyqxTXBzdSxbxcge1tSHvpUSjwlVuyxqxX4BzV?=
 =?us-ascii?Q?wC0lU5H6tcd9kQLQ3lfwfVXRhd3bx5RqNo/GCgDuWZdzcXNbvbavv2RIBi1Z?=
 =?us-ascii?Q?Ti0QC4zxHYG1z4g+TwPRtampT+7rE/p5rv6aiIFz2Lbl3cxvmcJOVsLdwOo1?=
 =?us-ascii?Q?7gJ9l1UzsgRekQFPcpbpzDI1hd8ltba0x6K9Yh75bufteR+I32+uogS0pqon?=
 =?us-ascii?Q?LOoqPNSAgJ3anUmTjg8PpBvdfCNq2a19zF0WQ2kJ80dSG18dMONHM7D3GOlT?=
 =?us-ascii?Q?MkT86Ojd0Skbu/GZvGE98cS2VtA65QnMaoDmsS3sCxRKhYuFXW9mzOAIcZjX?=
 =?us-ascii?Q?qL9qUg3XI4zFsHnp6Or7KNuyCQDqjYX6GxZw71ibaKADf14HiLTmll5H1iS1?=
 =?us-ascii?Q?LpoQAIvJXgDsfonIh6Z4HLsH6NzT73We8ZmaSdkOVPJ4CUm2iY6aC8OODh3K?=
 =?us-ascii?Q?o9EF/PxDfyk483P1W2Y81heCgsR4emrgwBOWDpa2d/PWHoxuOelAn/ZhIzbf?=
 =?us-ascii?Q?1x46pIsmR9IPOB5Gmry5RZHxq/1/NMDAXnJixgJXaTdNrvibTbaKSJSsH61H?=
 =?us-ascii?Q?9bZstJ1dRHGHL1pS1K6Hv5sGxk4MiAHE8zPbbbfd8LklTtUk93pp1NpdPHtp?=
 =?us-ascii?Q?q6s/dMTeuWrzpTYXIKcPoBkVN/e6lCOXf6Vf0uRx4c3h3n5xVSFRuSSGU6vj?=
 =?us-ascii?Q?dtVKeGEWUy+LgvoQ9ADiDt++0O2xWKS0/5OloJE62IinZhqFyAYeBGYGutCh?=
 =?us-ascii?Q?1Id/ZCPCxeSj6F/1plhrcRbcqM8NL/CPnj5RGVwGctifOQyAgERAGEM2O40i?=
 =?us-ascii?Q?NKSuTJOMufEIIYfQ7jCMztpLQEzrbe3gqmqCclHvUI/9xFLxJDwOB6BeqZHU?=
 =?us-ascii?Q?KHco68PA/Cft12a8z2rhhwAKsvZPAJdozD9APzOYNeNUa0ekdyj72Zpwe9i4?=
 =?us-ascii?Q?uClnmtV7inty7AZyu/N7fAFrxUvzHQM75bncNP9pqQhXvLrPTuu58zVeJzaK?=
 =?us-ascii?Q?LpYYPBNddKXp8LkW1+TqANfpZiRDX3ACeptK/BCdaT4G+sZculefRX6GPWO/?=
 =?us-ascii?Q?WjMDleZ9DRd1SzMudbwR3ozUo2nEBAPdKGkR5GaHC3gvPzyRQKkXTacilkph?=
 =?us-ascii?Q?ND/MNyxf29Xu2Of+ypoF1dPJ?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbff5528-4936-4f56-5fc0-08d935798efc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 12:30:45.7826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdvU2MgN5F8M9Mmw2ZT0mGpLxfvND4O9XeuctRI/VGM6Rk6QxssRBpVTqzFjSiMt+9vVugofXJ6tdHNiugoWDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7245
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
Cc: devel@driverdev.osuosl.org, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Bernie Liang <bliang@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all, this patch series implement MIPI rx DPI feature. Please help to review.

This is the v9 version, rebase all patches on the latest code.
Any mistakes, please let me know, I'll fix it in the next series.

Change history:
v9: Fix Neil Amstrong comment
 - use macro define 'V4L2_FWNODE_BUS_TYPE_PARALLEL' instead of fixing
   value.

v8: Fix Laurent Pinchart comment
 - Expand the commit message

v7:
 - Rebase DT on the latest branch 'drm-misc-next'.
 - Remove HDCP patch.

v6: Fix kernel robot compile warning

v5: Fix Rob Herring, Hsin-Yi, Robert Foss comments
 - Rebase code on the branch 'drm-misc-next', refer video-interfaces.yaml
 - Seprate HDCP function to a new patch
 - Fix driver not correctly get 'bus-type' 'data-lanes'
 - Add audio HDMI codec function support

v4: Fix Rob Herring comment
 - Rebase code on the branch 'drm-misc-next'
 - Change 'analogix,hdcp-support' type to boolean

v3: Fix Rob Herring, Dan Carpenter, Nicolas comment
 - Split the patch, fix not correct return data
 - Fix several coding format
 - Split DP tx swing register setting to two property
 - Add HDCP support vender flag
 - remove 'analogix,swing-setting' and 'analogix,mipi-dpi-in' property

v2: Fix Rob Herring comment
 - Fix yamllint warnings/errors in analogix,anx7625.yaml
 - Fix kernel robot compile warning

v1: initial MIPI rx DPI feature support

*** BLURB HERE ***

Xin Ji (4):
  dt-bindings:drm/bridge:anx7625:add vendor define flags
  drm/bridge: anx7625: fix not correct return value
  drm/bridge: anx7625: add MIPI DPI input feature
  drm/bridge: anx7625: add HDMI audio function

 .../display/bridge/analogix,anx7625.yaml      |  57 ++-
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 458 ++++++++++++++++--
 drivers/gpu/drm/bridge/analogix/anx7625.h     |  23 +-
 3 files changed, 484 insertions(+), 54 deletions(-)

-- 
2.25.1

