Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3DA3CD18C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 12:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E3D89D87;
	Mon, 19 Jul 2021 10:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2137.outbound.protection.outlook.com [40.107.244.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748DF89D87
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 10:09:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbPmJczMN7RDaJZMYMgzo1hPVfhtJ8zHbRZsXLH91JX2RJjjKQDLIME4FxB82nA5m4jy7mi/8qpdzHCxcDTZE0sVRbMglmRbHLyvhuqyeCG37pC3WVgmcqweVSubU+crjWmqJUCN1RWrNQ2QVzRhNapPmOqmpMPIBtGb6bbPe/WkW1oAmTzvCnjnrF72szqIMoSENoNg1YDnVLt58QbIRbhUYcYsFOjrS8azA1sAQkoaj+s/xBM8yFRW8N0NOmARmsnZHfZgOIh1sZc3KnDAXqhRu1Iy+suRQDz0IF1Z9623LiM4O3rO6YoSplRj/mVzDt/Hg6GuVis/fd/cs2e1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/et3v1aAJhtrboFKZIiuli8v3ZsCRoVAHwSQji2yxB4=;
 b=c1r7L3IcNleSe3tZge0Jx1wGfV7EB+P54Nec5bDBIPcGoI9+K5mPLBqPKfLKmOTS+GOhSW5rSMXYu2t52zkGvLQwL9NUX+U91JITLQtlFZviBRRwEbITtJ9uBDwJznKDo/NeXbb3IFeRK68izf5ImS+TGg9AdeRtc24/BOtKq4iDvfDu9hGJuSm770q4O5Ik4i7GiAPxaGolRT2vbIpP6Sws9a02uwGm6oWyhzdXZfvIPcyV2mAGsqFgn5qHjoRdP2gDm8cbLUjhmz2JviTh7Lb7SnDksw3WzqR2+Cydcjx3zl/hncmPC1P+l/WMPSEbMycWTEW9jKV5Cp6xFAZoZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/et3v1aAJhtrboFKZIiuli8v3ZsCRoVAHwSQji2yxB4=;
 b=rEZEkfMXvqAzbSvPLwKirRXQHv8NTPmZnBbbWrdRVBMtl8vgStr0W4Jn/yHsOSiBlfM7v64jUIJHtISw1hCKOXiA+qcRixPokt+26QkXUlm1paxAKNprOxCYLTjSUD2uxGjXbhJeyflaYkUgWkztuHFvfdNZSLTdKC5+Njgv0L8=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6568.namprd04.prod.outlook.com (2603:10b6:a03:1de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 10:09:30 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 10:09:30 +0000
Date: Mon, 19 Jul 2021 18:09:21 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v10 0/4] Add MIPI rx DPI support
Message-ID: <cover.1626685856.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: HK2PR04CA0062.apcprd04.prod.outlook.com
 (2603:1096:202:14::30) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR04CA0062.apcprd04.prod.outlook.com (2603:1096:202:14::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 10:09:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0dd8282-b616-4698-63ae-08d94a9d4c4b
X-MS-TrafficTypeDiagnostic: BY5PR04MB6568:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB65680CBBA11B62DE846354CEC7E19@BY5PR04MB6568.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: elvanVDKFGYtdgwYp1LYzgT0/NkhmhY1NI/KI84R+BOClX0bXZWF6C39S0PhB6O3BOk+9fiz0VxoDwccS7i5+MVJj1eR04qUanE4L9F7EkaLAszwbMLn3/2feiUhsowFZ3tqElO/3oeY8/QbnCCP0lhsk2i9mro4+DA8ytg5ON2WMOPygGa71UtyNm5rnnN9fFaJGz+TyMNhAkYnEWbq+4KTW0Gbj+nyvEIepuZNjZfWUdl56RpuR220yVUgH+EMsLqhr4sA0nVrj21iIZN5Mi1XbO2BoZ+gujlRdwu+hK55wI0X1O0ET3lycochW6FRxIxpiQYbQTaQk3BzXPJ3C0jRhlSRH7Z5AeObOttCrlJQO2d8gVWDWuPcazeW+EdsgBb4hfldk8UammccQzx8bM3L/ANW0pZp2ZEtKVRFz8vxsWcUUxUY4mSLb+J6K0Q4M1U5S0CKZT+eDbwVG3jVsdrgwLecBQqzJEreLtHYK7ziinduitPcx0eCRu9Ad01zKV4tvC6tfOV6tbkrms6ppAtDKcm9Y3x8xoOgIXt2LzrROYUKw+Fn6PBU+xbc4f6idPfM6heZ4dotLnq7kasx7pvyE85lzMamJ4whQROlvV4QzEUYyKCdmbiIHS7kuLQu8y56xa82rzBbBgP1zm09TSTS04Z05FhAuMvNLuLRljkFFm68+vu5h08rMc9o7ohQAKwf/BnstShDBBqxsDtvvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(376002)(39840400004)(396003)(346002)(186003)(52116002)(83380400001)(6486002)(8936002)(86362001)(4326008)(6666004)(26005)(2906002)(55236004)(36756003)(5660300002)(66556008)(7416002)(66476007)(54906003)(956004)(316002)(2616005)(8676002)(110136005)(38350700002)(66946007)(38100700002)(6496006)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g9McnSD5aHpPYa4ed0GPd7B9kDssEZ/OJGKvpvud3mGrRcJ81GYOBU8AzM2Z?=
 =?us-ascii?Q?nUhsibsVfXff/G+VvRNK0mPNcVnTnyFhzQok4MYOheO5StMKUmdCeL9TKY1R?=
 =?us-ascii?Q?c3QcgM6niFb5C0ZQtYdlNd837fLPfoJ1B316pFPDNE28MmdbIsgcq3OMNJMM?=
 =?us-ascii?Q?ZVgoGaUHKY06W1ZBXmLwiQlC2Gzi3a0mIlcQtSmwTlKxyI6KNSDNmkOOPUK4?=
 =?us-ascii?Q?Zf/tWJEwwDAkv7UUqXbLS4g6kvvZS7+5w/RYLDDnZigdazND6E1J8c/4rIqC?=
 =?us-ascii?Q?HIj8+t3/GIjhYtLi13xhPfYye0oevzvjFFz6q74y1sj0OGywMuuM5qc3c3H6?=
 =?us-ascii?Q?KTWMNah3dpYMhNooFUs5FmOX1V5ON3z8U5ktWnXwMI816ZhSPoHr33UFHa70?=
 =?us-ascii?Q?rteZcjpXHZFmA/OXHW0fxO/q+mKSlRLVimlHNRkZbA2u0yAJ4/Ct0Zng6Y5b?=
 =?us-ascii?Q?zoRBKjMWPdTq+l4hooLmdwQ8SjYIQLR8/RYPXi7lBd9xbty3/pojfP58leGc?=
 =?us-ascii?Q?3ET4uV82+MiDElES6V5LRRmqyLFOjIMUFVzAZke//ED+MbDtsnlx0Ybxa4YR?=
 =?us-ascii?Q?wLBKEYhLklYxnn2Uj/NNMGPWeEAwgla1tTLSqunHL5HwVV5bUAa+QJsT85f5?=
 =?us-ascii?Q?Re4y1UGxfguRqNGQv0CFXwewhA3W4bUhhoLmOjb/sjYu5QflQuHuDmiGRZyG?=
 =?us-ascii?Q?kZh1GHOTi7bsVaJ63FW6OQehs7DROQipwKXHqwfm4DiZb0CDOHQ4FDQt877i?=
 =?us-ascii?Q?11zYqPCL2DPXdgLYoILuxPpd8IDM0N8Zx5K9UAOZOxZxxzF5CT3PdFr3Z8Qx?=
 =?us-ascii?Q?sRmJDTdzJWKFpfpnKG8qgLBnJBgd6/ZHGPqO/SCflKygGso/JvAiqgi3Yoon?=
 =?us-ascii?Q?n7KY8bLzA1vF2q/oBylKkkrzUyv+FCXM+KfK6dUPmdQAdtk4XCh5TiQIWdyv?=
 =?us-ascii?Q?UbH+Nh8bbmgW/RiKMR3c1CUZwqNqKjL3D7Qy0N4B5/cMg8mpcH+SZRNLRvcT?=
 =?us-ascii?Q?57G82rvbC8RF0j7Lwmjm4l8AbBzz2uQOYeLPH1aoA7F10ZCW3eABzN3OTiCm?=
 =?us-ascii?Q?m4W3zw+ViVKkCTyIlBKFYpF5QgZFB9xyYGkAJjnnQ3VR5QITsqsarnHbD+L4?=
 =?us-ascii?Q?jBIV8yURwxaUqxSwey08SsKm1J/wAJ+N8pkwoFwKKD7NsSn37GcCxsOQC2Sw?=
 =?us-ascii?Q?uzB+7WPrXbLB8BV9YmfTDc9cyFiIa1PZDqu/raBPwF4lERpUDwmjHXh7OnjE?=
 =?us-ascii?Q?gK5OoNTBFzxlQH7UfeFrJpT/FDTghKwzkvtEID7LOrbcq5bI9UWNorvbUVom?=
 =?us-ascii?Q?2qryujT+Jb8G5R0Ftx15THpW?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0dd8282-b616-4698-63ae-08d94a9d4c4b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 10:09:30.2534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkDwsy1SvfwPF7g7R3aVRu2ce3gLslFp/T2Xq0+Jix00vpUjygC0B6vXFG6Qt1hzRnzdXo/wgPba13v0Rfq9TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6568
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

This is the v10 version, rebase all patches on the latest code.
Any mistakes, please let me know, I'll fix it in the next series.

Change history:
v10: Fix Rob Herring and Laurent Pinchart comments
 - Add more description about lane swing configuration in commit message

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

Xin Ji (4):
  dt-bindings:drm/bridge:anx7625:add vendor define flags
  drm/bridge: anx7625: fix not correct return value
  drm/bridge: anx7625: add MIPI DPI input feature
  drm/bridge: anx7625: add HDMI audio function

 .../display/bridge/analogix,anx7625.yaml      |  55 ++-
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 458 ++++++++++++++++--
 drivers/gpu/drm/bridge/analogix/anx7625.h     |  23 +-
 3 files changed, 482 insertions(+), 54 deletions(-)

-- 
2.25.1

