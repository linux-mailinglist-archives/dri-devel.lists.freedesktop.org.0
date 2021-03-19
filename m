Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B8F3415C8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 07:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45D56E204;
	Fri, 19 Mar 2021 06:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2101.outbound.protection.outlook.com [40.107.243.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3543A6E204
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 06:31:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dL4AhKT03W50D13msST2GZQGO2X0ahyDUc2i2WXGrcsjNBBUv1FOn4P0LhRN5lJRUZ1yhwc8wrZD4U6DWjqY+CfAXhouTwbIkLz9ZREo7PrHuNq9pbHHb2d37fjEbi/3VIjRB1HC8NKsfNTQT/XyM/vgSStzurg5YV7OU/66Uz2MnxTrqC2nZz5kM3RQQicXWNQCWULbYOtwkE0E6+tdXuVM1d7NZMWFmWB2KaOzEr9b1nvxILWcqZXMd16t3FmlTzBDFQN0stalyD4S4cKpV86EwZdxIDreI67j7o12IDjCw2304BB0JZXjnUG8t/r2etP8t+uEXpU6Y6bfWQZGqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRvf2Fhmo9JuEWZKEzOLEwJTnNxHMPkGimOehUmxUlI=;
 b=GSbyIBLYmVW3QfNSkHJ+T5jksOOZjDd6JJj1VAPvdTAI5Wgbqv9hWo2I+VPD48RPGr50KCstUrxPazLTf4NsYCp5ErM3B0o3eljAcAdOwRQO6LGYxNDtEhYnmnjI0ggbWXZ9C78dWLsKrTi02uPuRD3+t+SwU06yxlTgsCoeP5Wg2g6uJGvHrW2ibF83FHNRCGhx/eYoTsPeZrixyobxYCCzzMt4i7hD/T3S+Aerk1INm1hPrfiGGZKd2FqzeQHxsbS84eqN6d0/OSlpj8Qrc+B1y7syk5rIbxLRFH4Bc5w6ElBnqvB1SqcKn3wxfwzfUv2rshkLeswnDXTOtUL+dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRvf2Fhmo9JuEWZKEzOLEwJTnNxHMPkGimOehUmxUlI=;
 b=QJDVPo+bkzNNfiv2rEetDQsewijnPmuWNM5E4uycmQPe58LqnDu3y33kUWaw5O6mfr8WKdhWfPuk4ZH5LHnQM2KW/rYmsnokA0ZyRdsiSBYCSoCjPCSfxavooYUcJW7TkSP1pK7cyYrBsghCQAtLXqYvWFwGbxRVxFlbpMcRJqM=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6962.namprd04.prod.outlook.com (2603:10b6:a03:221::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 06:31:55 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 06:31:55 +0000
Date: Fri, 19 Mar 2021 14:31:49 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v6 0/5] Add MIPI rx DPI support
Message-ID: <cover.1616135353.git.xji@analogixsemi.com>
Content-Disposition: inline
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK0PR01CA0060.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::24) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK0PR01CA0060.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Fri, 19 Mar 2021 06:31:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 928185af-0971-4ff9-03ee-08d8eaa0b044
X-MS-TrafficTypeDiagnostic: BY5PR04MB6962:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB696256B003CDEB42234CC115C7689@BY5PR04MB6962.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3pwSkr12yKNy9X/XmFhkDUgygvuJl00qzWnDPy3UNV42hJ04CqhPKDB3h95nMiSlpI7hin6NXG1R1VsjmrML1q+NZUhJdJ/whT55itjl92Y4Xqb0WxTl1OhAf+3FgxYkqybuq15Omv3MpyK4eX2qoOBvgwsqcptrgtXzKqmHpyPoDlsQzbApN/N0YqWYLtpnxQi0XOzkp0MC7OacoL3noaekHR5By3QbygTKY/k/NxBxiArlzJFKoBhVNT47yV+bdMREn9D54JyZkmoqs4s4P2rWyKCBmJV9zwIV/4dpQZmh2nEC67Fgs8Nm43MVyzrr1DfXlE2MngSjCo9TGWKew63WBGzbfjdoqygusk4t+amHf18o4cpQB01ZcJEmEBhceojdd/vVOrhXR3NQsn5Fa8mlYlXURCaW1a+J7kH1D6MNLu6X2BWzP0r4+nQlZOGT+7nKFJDoEtdjD+ZlLn9QGs4qpUY7FVyqYiHj4aDvnZQ4AAifKafIpYsDZ0+EUmd9hJ3uEC8AbaUMO99O55CdrR9iEgMyZo9fhte++b8F1VXE14MV+OW8nBJcGxlLpg5qoqDBPi+rYUsLNaVmcyC7JuXHmiGzhs9+RQie4YaLX+vhmfYP/F/zqfV0kfzrybm8mvfo5GklLfmdz5aWRFTk+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39840400004)(376002)(136003)(346002)(396003)(54906003)(186003)(16526019)(8936002)(2906002)(26005)(8676002)(86362001)(55236004)(66946007)(66476007)(6486002)(478600001)(36756003)(5660300002)(316002)(52116002)(83380400001)(6496006)(4326008)(2616005)(6666004)(110136005)(66556008)(956004)(38100700001)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vDHvEB0cT7I03r18G6OFQ5E3JL8lkULOX0LMsHYQPlxZgCwaVwJBe0YeMWri?=
 =?us-ascii?Q?RUE9TRbT0+y0pGcOmTXApKgAgjbnLSdqxV0q0FZeom3FoOTbGLyPCG2drEqa?=
 =?us-ascii?Q?ZrqaBjJnIxUzRHFDCSyEylBiqqQm5b9+tloBzK3MB5wzJNo1rXEFcstSM22H?=
 =?us-ascii?Q?HDwQVhirzOQuPuCA7gYq1dZj4Tk3GX5AjeHxxLkfYBlfcoNALolW/vQKhroG?=
 =?us-ascii?Q?vvsXFtP++ORDUpFaBYo3pVYrEzkAS2vtfBu8+afC4ZnwZEZYLMGAG2iWkZ1b?=
 =?us-ascii?Q?vyWFoeYhAybv91kJzHqLBUb7GB9lo1/03nGA47aeeP0X/sJ0mW+iO0wLiTT2?=
 =?us-ascii?Q?FCPJq/wyLA+VkT3r553jvv17lIEZT56suiz49tHMFBTzKffHR9ytPUhTTnI/?=
 =?us-ascii?Q?yOLx6O+X1HGBxNrS1cN2nxcQUEI5Ozoe1jxZcauykB0GlJhh+x/a+9+dF4QG?=
 =?us-ascii?Q?+SQYoAyKM4NcW09jSEK0WCaxsa1n/PPij0ZO6C9dl5y9AuEO9SOiDq7bOIGK?=
 =?us-ascii?Q?DEhkIVIIY5VEtMsePHMDX/0KiFBhwcg63L+wkpt/BzbDHUzrmZMNyWBMKQXo?=
 =?us-ascii?Q?0zC4G2JdoA2N+hKieLT23ljIhbg6aUP7o8ng0Q4ZRi1Owz0WUhs6SqWV1KWM?=
 =?us-ascii?Q?NeaXC9WMU3LRNRQyLyFbQ1bcOKAQE2tfW2CXIoHsfAhou6Xg/v/GVnWzMPVh?=
 =?us-ascii?Q?wug2slPifMfeK6DtpD9/2COTojm4LCgVg44OeKcPHzJ3t0B091MZqp0nVEnq?=
 =?us-ascii?Q?te8ZP9vm9k7GJTwQMfnT2BINVDPVHp5fGCx7V8i9l4N5/6+KqSjJz/kqUSbV?=
 =?us-ascii?Q?hfH0+ErA1oyR6GYBv934tpPHEZXsMKK4VpCal/PtsuHLaByyH2yOxtIDiASP?=
 =?us-ascii?Q?n3SAnBQq2qwSNyKtINQ3HDVprzaA/FQ9DjJnbaoQHni6ahoBFLlPtGgL/IQc?=
 =?us-ascii?Q?R8JNwKeEhCJBZ3vELvD+uQoOV65ULLq0qN5YC7ZvMsl6w0Vw/wTru4HkG43v?=
 =?us-ascii?Q?4BB0k/YczYsshu0sWM3E+FahPUlpxpaLOREbGlypxs2yulRpHIXnKZMuKBf6?=
 =?us-ascii?Q?hPBSG4BEz2gt8eKWK48VedxsnwMl1Xj8kF97f14kp8fXnC4gxG352l7tpp/Y?=
 =?us-ascii?Q?+U8qPt5EWfbuGPEZGoj9jUmQMrH7J4ANoPncFl0m0D5f5kF7qJ1IseLceRIA?=
 =?us-ascii?Q?pOcrLxUJnHBNLICZr1kvKJ5UZjasHsMxbnIEAVi+vBTko5KQvsgW0ozhukau?=
 =?us-ascii?Q?hE9YXtHPjcT+bih2kt7hII8eS4b18Wg7snkiSKZ5pZZ1gR5YbVCjyxZFcIBU?=
 =?us-ascii?Q?4fj8UNSCeMsaCDMek0zLlSoE?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928185af-0971-4ff9-03ee-08d8eaa0b044
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 06:31:54.8418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6ifFNTNQdlzJd2VkjyxKe9IvEX8dZlsQoDdBwHiWGbH8/y2dWoj3xc2OCxwcJS/bjarluOlZrzlocGGIj3Cag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6962
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
Cc: devel@driverdev.osuosl.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sheng Pan <span@analogixsemi.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Bernie Liang <bliang@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all, this patch series implement MIPI rx DPI feature. Please help to review.

This is the v6 version, any mistakes, please let me know,
I'll fix it in the next series.

Change history:
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


Xin Ji (5):
  dt-bindings:drm/bridge:anx7625:add vendor define flags
  drm/bridge: anx7625: fix not correct return value
  drm/bridge: anx7625: add MIPI DPI input feature support
  drm/bridge: anx7625: add HDCP support
  drm/bridge: anx7625: add HDMI audio function

 .../display/bridge/analogix,anx7625.yaml      |  58 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 603 ++++++++++++++++--
 drivers/gpu/drm/bridge/analogix/anx7625.h     |  59 +-
 3 files changed, 667 insertions(+), 53 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
