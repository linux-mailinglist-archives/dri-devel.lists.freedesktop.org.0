Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C51DD3412DC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 03:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633026E30D;
	Fri, 19 Mar 2021 02:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2128.outbound.protection.outlook.com [40.107.92.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638A86E30D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 02:34:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROVJky/HfuiNao7PVqh9Y62MbfO2XmSdGsjIL/RT7r6kDu2oCYjTdkA8J7fTRaHxeGUvamakjqh3uN2EbOgCcqc+gDmcxAlRgXvwgeWmWPEJn2CHwiLMHnxDu96Ov4nwCutRenNPbTSBXCTPLK/RpK/e6RQ9XgC1WbIYFylvJy1Uk3k3ol/QkPN2rKJ4NenQUfiqnQRHlLkgiolApCR+xQn+uDtqFdahtGOA9C6LyvCJUnu7gk3Y7jBV9drSAbeUZXN5e6QuV8xxqsu/4sJ9dny1kfkPC/3JH5lucrQkf1Y4keDJhixYzh74h0BU6nDsQq88eBOOBMloLfQbb+06KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyRpO5Q2WsDNsX0nDY/+Jlsv8M6fn7uv5l2AK5ZGBrM=;
 b=lqIsq4VtnwW2Dmmp6xK0zf3tW6z5ZuSTlYQlDkTZ5WW/Z3LbPL5dJNsIW5E2ZES/ZsNXGI3wknpuPt6brl0s0EZNIPoJKRrySvS+LKsIkayKeGuAafK+JWR0gJGubxPkNVkb5sWD51nzTUr/t0602oyxa7J9knSqRnUY9eWLzwOHPLuYFC1HAFPlAUowtfxFz6p1tauyxyEuf+xXy2MgRmk8HLaWAalUrjvKbmDu04AF+Dy8ioO9nuYtAAxKji6Pn7M+OGxdnhFUxWJXW2h40WsZ+ykZBaAlJHC3GVjOK1JbwRm6/eQhiWtfUmOsjTQPj6sY5+SGjtqwk1bZuTsghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyRpO5Q2WsDNsX0nDY/+Jlsv8M6fn7uv5l2AK5ZGBrM=;
 b=WNu7GxlkNiBdgfzARydk9XReyMold2x0k42CzEW/h5Mga2yy+wSIaOcCItqZXsZRwtG9J9aBb+i4QtBUKOld7aU5p3QjrI29Q5mSQC35uFTTF+Zdx2BuOS5ap8nbj9i7mvrTwwoS9pnAlD0utaApKLJuDfdsQPzmZ8GlZmiVelI=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7597.namprd04.prod.outlook.com (2603:10b6:a03:320::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 02:34:34 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 02:34:34 +0000
Date: Fri, 19 Mar 2021 10:34:27 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v5 0/5] Add MIPI rx DPI support
Message-ID: <cover.1616071250.git.xji@analogixsemi.com>
Content-Disposition: inline
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR02CA0218.apcprd02.prod.outlook.com
 (2603:1096:201:20::30) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0218.apcprd02.prod.outlook.com (2603:1096:201:20::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 02:34:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4286fd57-7bf1-44c4-1161-08d8ea7f8836
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7597:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB7597A4257F9EA3ECC0C115DAC7689@SJ0PR04MB7597.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sysEfTimU7fgCwb/7UQNTjGMgBmHOEKHgz7qCYaRMjYCLDOwH7g1V6Db6YTfHh+Ia1jtt60sb9gLupHihlKwNU2sHg02yhKjtbFtompTgabpyUfZTS6vcdjWs49OR1Wz1vA8RmEotIenQ88JkJZQe4mcde8OqBUrj3D8wdnxQUYpLyxmVBtwMj8Dgi4GvOFYzY5nozowo4vy11s0gg6G30O/+0N9Q+g8AblPk/IslsaN7ROjm8X5AcqEnFKkpet74JxHnruaqe6pfI/tpSyzhA8suuF8mBofhS2CofgwDQPhRe9JLB6ckeXTjMOZEoVMDzBDcXuad9wwSUaYglbD4nyhaLdLDLnTxusNlpYAs1QQT6JTaw1NyJJV+OhtD8Vo7tKMeoO2VGApYZKaz0WxuKI/kIL9pxWitJBJLyTy3HO/g44gXYDk+HW0f9FzECTfIVQ4l43UrekE5F4FF86J2QqiQjRVrvfT/G0Vem8GMYPiibJEUozZcU4S9ZfwtOJNzk+2C7s27DX/qA+rp1q+kzPgaw5NlRj2hVZhlMjzT3zEcTFO17nbDQ6z2DSj1G916T+wgcaj6ySSgs0bgiU7fVw68dFN416IXOF0CiIuSs9Bs4tPomgNbO9IZ0b1kh/XMktvBlaB+hGutWVfTWlyRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(366004)(39840400004)(136003)(396003)(4326008)(110136005)(26005)(16526019)(86362001)(8676002)(55236004)(6486002)(956004)(2616005)(6666004)(7416002)(38100700001)(52116002)(2906002)(478600001)(5660300002)(8936002)(36756003)(6496006)(54906003)(66556008)(66476007)(316002)(66946007)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MnVTAvtLz42q9ybtDA4aS5jqJHpDChFqKd8n3NSIK98LVoxxUuReLVV2fiQk?=
 =?us-ascii?Q?1IEc5OuDFtPUv3cXbf7qcAr/8zow9gPkjLgkGVl3EIeJ7UoJ/xQt3z5FrND5?=
 =?us-ascii?Q?m5DCN++eIrOpCsfFUqqTxbv/4DTOA8Di4rBTe9LMGBvV7v3MfRk/t6WmBU/a?=
 =?us-ascii?Q?SO45/aHmYalbXgMWuCjWbDRdSvdrrsbWhq3Foc+byF2dOwDI3E2+eeM7Zf70?=
 =?us-ascii?Q?hmXrP+gHgHltvHo7ISlbItXxtjCqOUkyMLaNQN45Ah/zuLMMLaIPp3NmdKD7?=
 =?us-ascii?Q?5h38jXUL6p6gIg9cM2G0ubrKONVk8tYxqb4cizoWDh6MQsCv8WqNG4xP2GFv?=
 =?us-ascii?Q?ocf4Qn74NmBzqgwc8xPHBxXa+64JgpEmJ97ClXXTMaJ2bKFmxxwR81bddy0G?=
 =?us-ascii?Q?1Dlk7b7ZH1PbAxgbAg8ejVvrrdMY1U5897GaMe/QwdDgq7GlfnsPqRlKW3m1?=
 =?us-ascii?Q?16IxIv+rCUuReAa/Y3Y/snG7WXk0g8BV8GHA708y4rbCNoN5+UwdLPa9qi7v?=
 =?us-ascii?Q?WXLZ3/0LygJ9NahcA/7Dbn1S/Nux2tKZ+J+Rwst04cyiBMouWebjcV188odi?=
 =?us-ascii?Q?SHIjgVyCo5oeKpqY2icRYYxYPJmYDAB3XeAu1+RF3NGSoM6eonofk7iM1FEE?=
 =?us-ascii?Q?8ZRibvnePWJjXMDOrlHtZY8QUazw02YwFraGQTPVgq/z9vS10mG2vvoOgoTM?=
 =?us-ascii?Q?PHRZyPdHmR85qp/8dhGCAXpQRhs5gbSd1gVMXdiCuv5DGAI8C2q32h5ffs0q?=
 =?us-ascii?Q?a5BQF/m22MnzFmDUVHKjWFdTw1QkFv9eG9ucdBMm6gv9P2OXM5G2m4ZjEQDz?=
 =?us-ascii?Q?F/0tA62W92n1pamBDmtGKo0Ho8fz51hT0T2I1eRS/8Ycm/5JpLs7dsAirwUV?=
 =?us-ascii?Q?Z3oKg2L5X2gjTmwXTPAdUH+0F09eC1mYQEI6IfV3e+8DX+7p81IPrZAXRZgr?=
 =?us-ascii?Q?/jueKF+OMRFhk/nN37+rGN3DCkAAA7gO74YTcXXQ3B7bFG1zd35Px0YP04fx?=
 =?us-ascii?Q?N4ORMHpLE+Uctmu2+RM/1A5k4DjLMd7pOuMWoxTDDWHfM8QaKIbAIQ3AUE66?=
 =?us-ascii?Q?188G3OPdZlQil+F7MmM7idjDWjLw4u8HfmKdr/GJXLJKz2iNR8IbyFUDC2El?=
 =?us-ascii?Q?9awCYAitaRXWpNWFeX45UALftCItyrQBSOvD/od/Uu5sm6r+kKOgbudxLMio?=
 =?us-ascii?Q?ntvSwcv/ac4XXVU4dsH+l8O+WsK5Niz8pD4i/pbPiR9U5EJK8lLWlWqhyMk8?=
 =?us-ascii?Q?0iznoGzCQ+zGDEpz82ofOJvhLQ4+FKyT8zqZKn+WSRmbo3EGqBKGR8dDbqS1?=
 =?us-ascii?Q?QE1OlFPy6NCI8cujPhT9/P92?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4286fd57-7bf1-44c4-1161-08d8ea7f8836
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 02:34:34.1678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /em69W8HlPZU29w3rzQg1xL9Mvj3PP71dUWlLj/d2+qxkTGfw8P7i2Ma/Kjy1vm/b4RRaV5j9gBfGgn8ytp57Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7597
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

This is the v5 version, any mistakes, please let me know,
I'll fix it in the next series.

Change history:
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

 .../bindings/display/bridge/analogix,anx7625.yaml  |  58 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 601 +++++++++++++++++++--
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  59 +-
 3 files changed, 665 insertions(+), 53 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
