Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F48384AE86
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 07:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCEA10F8B8;
	Tue,  6 Feb 2024 06:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2120.outbound.protection.partner.outlook.cn
 [139.219.146.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E1110F8B8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 06:57:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j980TdmEM7JcsAB+aDcEmoaymXYiKtzZZkT9OXzm1EfkdycxJb2Zg5k/J8cZIVNlHQx20ZR6GHiEHr0Z+XqNiZpJOem8TUo3Wae0fXw73gtWXOuwmZPW+F6r7v6mBGjQ6SZT5AV4sYKgR6d+QkINoGV6MEPeQtapMWCoXV3YC1Wifd9Y1N0aIhkairho8dB81M/kMO8pIJWa0i4C0X7mO+iloUZNxIS+f7QnIlCTLW1uX+0TFnprnJ6NiWAKoLUHT5sFQ3w5AhcjqHIYohmYCZ+HmyIA2JDruGygXAtQ55qh3LCh/JSmD3vN/ZwFCp+7IzB+AhRTEpWqg6uJMcwNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pi/0Q8/kpiYChiyc0vAH0QkOcBjl8DJjq9rbHKlytRU=;
 b=NMQ3zkGHEORAEzGDckIjRQE7ontWnNFxVA09bWHtNcPg4kMwjVNEwrqFLcCOg+rv/MVDSyjC3b57akULUXaGM6xxudwa74UF0GYAIPg2DqfucNRVOBupX8wtf9ZEgnTHV6DoUGWxIlq3VN5+B7AqHrDetifJjYcq4XxRXBWXf/lyf8EXPZ3cf+No4fgEp46drJ9yLLsmVVMoUbFsf1FRAoyU4TSSzAHLiL9v2vkYI/n5A/tiCObxmh9gXN4iQIbY6VtAoK+EaxH7dI7em6mVPix6qhVcZ+eKXfoV9o2ZIzpEtIoSu3TdAgBaEPaeQ640mrWjnyBStG5NVjf7ECjw8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) by NT0PR01MB0974.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.19; Tue, 6 Feb
 2024 06:57:26 +0000
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::57c1:eb9d:c4e0:71af]) by
 NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn ([fe80::57c1:eb9d:c4e0:71af%4])
 with mapi id 15.20.7249.017; Tue, 6 Feb 2024 06:57:26 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de,
 tomi.valkeinen@ideasonboard.com, r-ravikumar@ti.com, aford173@gmail.com,
 agx@sigxcpu.org, rdunlap@infradead.org, u.kleine-koenig@pengutronix.de,
 sam@ravnborg.org, bbrezillon@kernel.org, changhuang.liang@starfivetech.com,
 keith.zhao@starfivetech.com, shengyang.chen@starfivetech.com,
 jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add StarFive JH7110 SoC DSI support
Date: Tue,  6 Feb 2024 14:57:07 +0800
Message-Id: <20240206065709.108684-1-shengyang.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0014.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::23) To NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1070:EE_|NT0PR01MB0974:EE_
X-MS-Office365-Filtering-Correlation-Id: b1ba55f8-f6ac-420e-2b86-08dc26e0e0ca
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MUILdAxMK4gAuyBbdyiHt5Yowjji3Brv9ivGsSohf5uU9u9ZHPlQZrdNNvsy+q36uLWD376jWhl05rbAkboDnY2BLGiz3GWK8cZpHlROwD0NUNz6OG/aLL+tES3oooDxJP6n0R/8PLNUrntbtGKupv1ceG/BQx4AFUMpvd9R6XJJnEfTjg9Q2jIEuoz52kKd+q1JVvEgK63Npaemqjy1VQb2PDZrhP1AtnBG6UoQHDN2WBI8s8PrslpxO/1xPhUl0OH9i/NTEt0lLojoK6MnM0CC3br1ytl4/9FRU5Dfub97QPSQJyix81JxpdKDElE5X03dDfEvqtCBRlt3ewrD5JHK9mZlUukmlmoI0cgXL2MBVAZ4yp+jpz6fOJejf9PGeDqUdf5A92XQlxS0OQRRT7EfsHWwaWa86saapxkjywWFPpsRkcMIBc4CgPv2Fc7YZUCQfCJWEGgLmCi8bBpgEuoawMAl7rJiKStlxg5nVag+Ukhg4OEMZqXLSPQYyzXUenykOhCTDXlRLzDmE+vZHtwLH+JSriRJOEmc1X7B6dMWXe9xemrlSkXOzhezYXps
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(366004)(39830400003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(40160700002)(41300700001)(83380400001)(66946007)(6666004)(8676002)(7416002)(2906002)(8936002)(5660300002)(4326008)(44832011)(40180700001)(86362001)(38350700005)(66556008)(38100700002)(66476007)(36756003)(41320700001)(508600001)(966005)(52116002)(2616005)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/CHkyqGqg1pwCzDuQsDabxCH/LVY3SAhLrkjOazhqD3ZVer/0EYrv/K3N0Dw?=
 =?us-ascii?Q?/iTLZ0G5/J/vyFyBFHVnXFBypsix63NRVi2T91btS4A6T9WzjX86HGb98L2a?=
 =?us-ascii?Q?mGMK3I31EAJtYYAmbIcI9Nvz7POWiWcfBp9Z1Qx4gddn23swZIn3k6DDvLHv?=
 =?us-ascii?Q?T05tVBXCUNEsdwiPU6xTv/QBSwA+TXg3mfxa8ra6m80slbI1lK/Gi5qIJTOr?=
 =?us-ascii?Q?S6yO1AhZra27N8vGkjY3k4xvaZ7bTpieXtkIYPR1XQ/pcFkwFMb870WLG8Si?=
 =?us-ascii?Q?Glpgwa5h0ztefjiTthlzrUiHEkhuhuEZjH6MFH0kwvjOKyGW66w1U/aT9a1f?=
 =?us-ascii?Q?B1wGTduefTpDQ1LVssqawMKWxyGlvTRzRFFyF/KridcoodIESZDFTb8wPMd8?=
 =?us-ascii?Q?fuDbWG4QYNpad8EKUqM6jPz2QufKsV+q3/IctJa/xqEKtTjVHU3YiFHlH75E?=
 =?us-ascii?Q?SVvg+ejnUCu/w2ED3qnP8MQRd7VUZSLYwykMLtOFaXbSdXxQt7wNLS7WN9pP?=
 =?us-ascii?Q?jAmapXe4buiPFP9n+h6llsAO3sDkEPmnjhCTY3aUSCZOr7Mb6fBWACsDT2h6?=
 =?us-ascii?Q?cuDi0RjCzwr7+lCBH+m/N8gEnnXVTg5qWjMTUHoAdmV6CRnwW1PPXwi46suo?=
 =?us-ascii?Q?BIoXQsueJt+pILgs7dGUKwxz9SQhzFNMF+C24euJ+NUX6EQ/AlQDUaXDb8uW?=
 =?us-ascii?Q?SRLRj9zC1xedfCkeijwyYrYFvbriqZdA0plwj+ADhqXIqr/dKAkNkm1yNx6G?=
 =?us-ascii?Q?x+Dk4dZTeA+ezwfl7kFq01EmKoa6b5oYP0U7kudelKtZ02BQwkuYNbbmzUp3?=
 =?us-ascii?Q?TYoVdxPKJTvBdzlCCSdWRA5BU1KToW1JsizSTegh2dAXXxTI0+I1JZlwWzpF?=
 =?us-ascii?Q?JZYSpmMbD0TFEacIk4vZh3K+ZX5o8Te0vURacvkfE5TPxLOgHP20VgddgJQ5?=
 =?us-ascii?Q?+aVLe3HSU3yaK2bYHxEfI4Kwj7FmAm0uqoVKuNDjrYiAricBZ9Br7HewovDQ?=
 =?us-ascii?Q?jpNsDt+bxko+8gquWIURfER2PjENPy0OVcrb9HHfcEIq+yPL4jnS9asOanUJ?=
 =?us-ascii?Q?ocHFpZu3UnxWjeslSQFPnr2xcrTCl/SdENKX+WXlrfL02ydz2x9GIfNXf/13?=
 =?us-ascii?Q?JMlPe8tzWSLqBRKxieXhfVyEAqXC65D7/p7TOYcOfLSUtg+EkYdoMhCAvNly?=
 =?us-ascii?Q?DtycD/9Eqay3/ExlFyq25ay8bxZeDUElI5DgnwGfSHJI+WhpR4C3uzVlfobR?=
 =?us-ascii?Q?vywm8LfsgJFwxsNBAf6fWyEGKklkQrRkU6kuk8D6NU6hSeMTUc3fZ2MuZBSP?=
 =?us-ascii?Q?hjkQRARvPZgqIcqEDpNGH08rpv+2t0RIN77CCJqyJZPoNXZVnDylKUdU0Ct7?=
 =?us-ascii?Q?BkO8KLmPxDGIlTfW+5BRYvK1zEVRnQwhijgtsdKQz6rWo4e6M++1ORgLBhFV?=
 =?us-ascii?Q?+USwuAwwESsf0Q+26pkcTK2V6GPUcc2os64OqxcGx7aFaTtBvH06yoZNZ6HA?=
 =?us-ascii?Q?F5BfLBmqpa+EpBaliqlmXZwsWkHtwXd51+WoO0bFFBFjnzLY6Wl8qjM+qHfx?=
 =?us-ascii?Q?mpZeriM9fIcixeqaiH0iEfz62CBA6nnMG66Z/ckd8ZEmRylaifcqUiEwrde4?=
 =?us-ascii?Q?QF5cCNrTodQUVO+FllSJO1k=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ba55f8-f6ac-420e-2b86-08dc26e0e0ca
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 06:57:26.6869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MmmiblDbE8iGqMvWNL2+YqjZzvpxXSjRl4hbDwOkQLB1FKwz5xSwJrmenwM1UtvV/6zQKQDz54SYjsRKmCqjO8jfcv59Q7RAkMA4LV2oSkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB0974
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is the series that attempts to support
the CDNS DSI driver used to converts DPI to DSI.
CDNS DSI is embedded in StarFive JH7110 SoC.
The series has been tested on the VisionFive 2 board.


change since v2:
- Rebased on tag v6.8-rc3.

patch 1:
- Modify commit message and patch subject
- Change 'starfve,jh7110-dsi' to 'starfive,jh7110-dsi'
- Add constraints for reset-names and clock names
- Add resets, reset-names attribute
- Correct reset and clock names

patch 2:
- Modify commit message and patch subject
- Drop useless MAINTAINERS modification
- Change callback name from 'update' to 'mode_fixup'
- Optimize the mode_fixup function.
- Change devm_reset_control_get() to devm_reset_control_get_exclusive()
- Correct reset and clock names

v2: https://patchwork.kernel.org/project/dri-devel/cover/20240109072516.24328-1-shengyang.chen@starfivetech.com/



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
  dt-bindings: display: bridge: cdns: Add display bridge support for dsi
    on StarFive JH7110 SoC
  drm/bridge: cdns-dsi: Add support for StarFive JH7110 SoC

 .../bindings/display/bridge/cdns,dsi.yaml     |  56 ++++-
 drivers/gpu/drm/bridge/cadence/Kconfig        |   7 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    |  29 ++-
 .../gpu/drm/bridge/cadence/cdns-dsi-core.h    |  21 ++
 .../gpu/drm/bridge/cadence/cdns-dsi-jh7110.c  | 193 ++++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-dsi-jh7110.h  |  16 ++
 7 files changed, 320 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h

-- 
2.17.1

