Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5C23A3EBD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 11:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E108C6E037;
	Fri, 11 Jun 2021 09:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2099.outbound.protection.outlook.com [40.107.243.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880376EE4F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 09:11:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtJ4YKTyACicou9DbqumEh0OWEnqZGcOhyyJVzNchE/NTi1SVsfiiGNWxnMp4QPQGisGZXJ8oSjfaz99VhqP6w8IslUlh2DhmK9OQ4j+g/uySlsnJd5ZiwdmdVebyD2KFMJ195BaclBlHYX959xG1bJh6LjoVFP9egHU53i7F/6te7VXTXMkKSYs5R66DdhD4EA8/9upy/hJDZJaV6vz0dHd/GNZqZlh8WYqXCZHlDo/zVJJs5w2OU4ErV2ydD4y+vwCwQMIFGJ5b3w/s7U3+ItJiSUAyA0D0gpxVUy0r0lkBmmdXdgubm2HBUnwrJW4s0pIctINwpvg3nn4klNQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5trHoRkPiCciy0johaWgOqwC9rb3pjv/iDveIgtzbo=;
 b=GGmJOwuwbxHUZ22KcqsDLreR8AZJ2SiW1xIyqAkWH1LI81NSzeFckVIEaial8u0s0Iz0Ici+cbJYXVD5ZeAUFZNGYQa4Gg21dQ49kF09f8X2FK4cKZ1B72E9hYZUh6l+NxemFUQyuqJj2OBXvD/znhYX/1+YVdg1mT5Fgr8WhbYPTccNq8yS+k0RCEUdAPRhTQNSeBbtgSJ34+uyxnQTSSFPEEHsMCNAn/qiJUIP9t8phMUZxUNAwlz/SWeRKoAdhMPAY2jzxLTuWSUjIE83YpUaNw5YZbOfyXt+aigOgPigSMgv8ejTLuIcsycXSYHJDYtIlkWcQoqE74UIxReD/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5trHoRkPiCciy0johaWgOqwC9rb3pjv/iDveIgtzbo=;
 b=cF9kT46CjRFU5G6jcMAJoeHM6cLZ1YRtAaMcn5QQFB0wlazULLC2PwEBvDyZRepJ/zc2k6mwNSlNOWGs621lNFPhrfELei1NJFlDxNo6Iw8uYH4n9AelUXqGp7LuC6Z8PGp2fXH36eglb9dk/JKlIxv8vGjW0XCvn7G94ulBH9A=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6615.namprd04.prod.outlook.com (2603:10b6:a03:1db::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 09:11:15 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::8d56:f2c5:7beb:2bf3]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::8d56:f2c5:7beb:2bf3%9]) with mapi id 15.20.4195.030; Fri, 11 Jun 2021
 09:11:15 +0000
Date: Fri, 11 Jun 2021 17:11:10 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v7 0/4] Add MIPI rx DPI support
Message-ID: <cover.1623402115.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR04CA0079.apcprd04.prod.outlook.com
 (2603:1096:202:15::23) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR04CA0079.apcprd04.prod.outlook.com (2603:1096:202:15::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 09:11:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa9ae8fd-43ae-40ac-400a-08d92cb8dd87
X-MS-TrafficTypeDiagnostic: BY5PR04MB6615:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB6615DF8044B1CFCFBE1123CDC7349@BY5PR04MB6615.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mIuWp2jc4JbM1e9Kc5APbFzL7d7tENglj9xX59zlJKwuKC03tL209cofFt2cB6LsEWfVq8qK9moTLapnFz024JE4CATXPOOcFRV7xubstewhQ85ZA8PcJv5v7lgTdiNy4RyEDobAGYEGoQv73T/5z7BNwK5h8eNqM/NzWmzMiHMZYWtLWxtw9rGQYVKrra/YK8bNvbIIK7Uz+6cpcZvOOrYoDZFbPGUofgETLMPWY8TUAFSf40M9qcmT8x/+wL51C7PvBFKw2VzBGJe6eUp2p0iZNgmkhMuofai4iRLI5Wnr3M6rYRAxCMQfM6TP/Pq5LMSA5ZqH/U3X6mSZEQRP8/e5UciirwJXpW0qoL1VGj9IExpi3+HL1GmRq577LFrhLrVH2t44xZmycRb85qTo/jPI6+5grAqiVh16W3hiddYcNNIocGPcfk7T61NpxshcyH4/FNYN7wTOSTDBet4T/hV3y4wAizknGELiQVkvDKJpfLPHeZmRTjhgC1Cio7LcZfkLb9DNIno7YJztYOD0RJI7TCchDG2jBwwPYYz3Bq9fp9MLr7hdfxz7A9zsNOGOA65wrudupej67Blwb56+9nsC0dvwrwgyf6YhA/fKNWoXpa2oRObpSmVhQswEhC4tyG08uJ/sfJ6A+OAImIrztg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(376002)(366004)(136003)(346002)(396003)(55236004)(26005)(5660300002)(52116002)(86362001)(6496006)(6666004)(66476007)(6486002)(66556008)(66946007)(16526019)(186003)(316002)(7416002)(36756003)(83380400001)(956004)(8676002)(2616005)(4326008)(110136005)(8936002)(478600001)(38350700002)(38100700002)(54906003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XJ4Ay+eeLRIHqkVf01d2ajLZAS3wXAe1EKXuuWd2R/zhzCSVd6m/wtta5EC5?=
 =?us-ascii?Q?rk9AfQ5Td3JZ68PbrqHhVXoxUy5YTGtuUxXq6JA5LKFzSNO04AZV05JXGpl4?=
 =?us-ascii?Q?pdtidOHw7yWse1K3yMy/gIQv0qw2s3CBFFy1vQh1EZyCZfoXG5OfVB/W8PxV?=
 =?us-ascii?Q?fm6PZhnIaBuzEFKlfAkPZukWu4aN0H+EEd3o/45gwvP3F0uwmZvAC5qtYZ3l?=
 =?us-ascii?Q?QSpxwPWuyTPt20ciJsvTfv/txFGNvAqHiOnc2Gy22swAR40LcBpbCtQSmxGj?=
 =?us-ascii?Q?ewxHS60eqWo2zMv6RZ6Xr9JLSpAyIOH2fAZriVDw+ct4g7eQJLSN2EhhLrtM?=
 =?us-ascii?Q?tp61jqvntevs+4FT58iMbca2CD4K2tnU9b9/0pl3U3BqYM38plSazJ5SMDbv?=
 =?us-ascii?Q?PFiuz6A2TVP4XMivoO7i/0Iz6O/f4sytLmaKFH5ytuwtGYZMRqYesMykBtfC?=
 =?us-ascii?Q?IC/uSdT9qVHhkZ2qFFy4HrLSlPCHWTh591KwxQ/VGCSk6UYkWB0KLfx/65IL?=
 =?us-ascii?Q?DL7pdWqj6sdth8kG2tWwhsAQ1XD0PaSILWWJqg7ZJkyRE9GJCeM2wLUmTuDA?=
 =?us-ascii?Q?raeT2+3ZZkvBKS9LyUVmBJuRM2bHLSHws09gdsHMZrE07OYCjHseZmHARJBS?=
 =?us-ascii?Q?pl2OdCMNvMTFVDB3KhdsJcEtrIa7EJIVCmwjDtLQb8q3fNWwYPzgOgdsLFtj?=
 =?us-ascii?Q?ZuqZbOr7iYn72mW8Tkgw5zhyKVYAvyzWO1omcslSwJMEBN4asOvvJPm/B85E?=
 =?us-ascii?Q?VY1oLwJoDVV11FRlzmMq/97ec+N4k4vshTIpSircFuu6TLlzvPLTtU6zTail?=
 =?us-ascii?Q?knj+cD3HIGeiznNmEYU0eQeG6+zYgAROVXRk05GtSvjKZxdjdgHi88DmUThX?=
 =?us-ascii?Q?bHkP+HP8iRcbLUrvsMsjHC/V5OQCoxqqBemqR4+qyZHw6CzEi1+xbhosAQE+?=
 =?us-ascii?Q?0PMNqDTo/X2DwZLeTMvro+O1QK6lzRevng+Du9qpRuqm9DFNdcHbxTvV9vyn?=
 =?us-ascii?Q?cjPBugIbg3LEeIcy0NBqBjtVkqmMOW2gA2TUCeDaatTPTFxs8yH5hFSWVi7T?=
 =?us-ascii?Q?6UQvbpDIaKJYtXfMuCZRYzfPB7DEsUQh5mrj/VQDgD6YHVmfS3RtewenZQf2?=
 =?us-ascii?Q?Hrz0mO66xBo+P3j9BaBSYiwxq8OANTCwiLD3irDnNqyYT4xlnieUSbe8naab?=
 =?us-ascii?Q?GFOSBwHiWKkPvBEKoYy5QXqa26ii23PNSquUivx2MaEDZLueKGzItsRy5GRx?=
 =?us-ascii?Q?+SfkRdyOSV7gUQFDN2knwjIPtSWXpTlzpFDmBQ+2c/0IxLnM5x7/HiM69Wbz?=
 =?us-ascii?Q?+//qsAxwEialtr7QRGC9MrST?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9ae8fd-43ae-40ac-400a-08d92cb8dd87
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 09:11:15.4796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6okYoah1OR258JRmOSSElABEXb5RtxMIq8xFNUS7zoLKphPbXHJgGWtqmBwhR8ZrBPdpoZJ2o8NxFlzAKrY+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6615
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all, this patch series implement MIPI rx DPI feature. Please help to review.

This is the v7 version, rebase DT on the latest code,
removed HDCP patch(I'll upload HDCP feature by a new patch).
Any mistakes, please let me know, I'll fix it in the next series.

Change history:
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

