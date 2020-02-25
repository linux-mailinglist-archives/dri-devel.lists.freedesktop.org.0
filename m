Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D3B16BCA0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305E66EA6F;
	Tue, 25 Feb 2020 08:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2139.outbound.protection.outlook.com [40.107.92.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01CF6E9FE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 08:20:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpdsztXaVSXgtb26CbEEqDyVZJpZFmUlAAgPQaQD00ERwtWL4B5vn4vpZHsCUdwNTjzxwHzdv/QFaUdmMXijWD3JknAYyPB74UE2zAITCIkJCQHyHmfo187lo7dIhHIx4KwEGDWXNwox0xy8F7p7cYDLl5ChuWrfuogifhHcy+jL8MV14opGppBPK3kg/6Rn+VZu23H+T/80SlNaCMOy74CyrSUshrnmNInryFb6tPIvcBnHLLZ2zUNEhOUiilbgZnxIe021eGwVdYUbUwo7VuDBMnXq9hViLDaWtQT7r9paoz4eHZ9kck2gRS9+WHYqHGhgoesec5aA7nS9CCHIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjvfW3blzjYTfmXMaAj7x+nd9bqUza/aoLBG5Qz0GGQ=;
 b=VsuhASLrVjUioo8yielM9cJGNFRwFBZ9136n6BTLseuF2OpOkxcnoFc9WeHi5K6CYuUsvodFOev8BvT83PXJMI0nSqk+AcDzI37RolQFvcHGc+Nq1KCUN93t+f6wROIpMWgw9WgNQiEFKkG7bEduVhdYvSMkgf5hWcDUGLXyKtyJkMjgcBkF6dCn38UpmqW4ilgjS56iw04PEib1rkZeL0LoyprrsInDkSOyGy0J5E7xBW5ZlTv1ORV+kGNT8VBKKgMlisrgVmmRlbJw04K9WEPLFqIRAYF8TF7bh7L+3YTzfkkwcsVJxa59wMn+TSJgdxIsRrjTI9si+6B6O+t2uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjvfW3blzjYTfmXMaAj7x+nd9bqUza/aoLBG5Qz0GGQ=;
 b=CHHFuvMIohbtMKeXP4rrlclDUEI0QKiwo3bC8IYe7uu9KLr7NuW8iCqe+lWOlUvHZ+L7svxJ6yQZLUZCNkxcPBtaBcU7uqYnaC/XQa6nD/C/6LzPViVqlr7DO92UG+glhBIbUfjR2yBfAAB6OnncpWJCZMnEmZXVvSAhOJtu4o8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=xji@analogixsemi.com; 
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (2603:10b6:805:a5::18)
 by SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Tue, 25 Feb
 2020 08:20:17 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::9598:7ff:b397:ba56]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::9598:7ff:b397:ba56%7]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 08:20:17 +0000
Date: Tue, 25 Feb 2020 16:20:08 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v7 0/2] Add initial support for slimport anx7625
Message-ID: <cover.1582529411.git.xji@analogixsemi.com>
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR02CA0175.apcprd02.prod.outlook.com
 (2603:1096:201:21::11) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a5::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR02CA0175.apcprd02.prod.outlook.com (2603:1096:201:21::11) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.2750.18 via Frontend Transport; Tue, 25 Feb 2020 08:20:16 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07a78762-f8f8-41fd-ff58-08d7b9cb8b83
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR04MB515102109BCB3D1255C02715C7ED0@SN6PR04MB5151.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0324C2C0E2
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(346002)(366004)(39840400004)(136003)(189003)(199004)(7416002)(36756003)(6666004)(52116002)(6496006)(186003)(6486002)(478600001)(4326008)(26005)(2616005)(16526019)(2906002)(956004)(8676002)(107886003)(5660300002)(54906003)(110136005)(66556008)(81156014)(66476007)(316002)(81166006)(8936002)(86362001)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB5151;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fvIa+mQ1oraAG9dX3Q9dsFzTdYg/gkgvnupr/6yVQTxu60n+OleHsMtPf47A4sMJnEsqxElsLvt4rt0prFiGjTZhvL9x/6NoDcWQI0cF3KpWb3nxX0yE+x44xFxFz0oICNDllH6NhpYgZbeSW7dhrMZQWUnfrriKXEinfZFnLPAhGctRp+8HFYTwWBQ+bVjqfGSrQ5WNywtCN8LWuS0DiG9knOoOWDiMkmnBZuVL+G9Jf8YedLHX5ox5HOV6W/WbfaRk0/1wnw61/f8J1WnR86uQtjtPPoQd+3D4OEQgbJsjL9YbwTe+T/vGRAWyfG1qzWymWdLoJ40oUWwPog7U9TrhCoH7mn4uY0Ynvjfox40uOXhnsqx+AnCZXqy9sbKWHuuvJWc+xZpIW7lEnNMhmAtKdM68a1gg/vVtM/0+un9qTmHGfjhqyKycf1bamTqg
X-MS-Exchange-AntiSpam-MessageData: B2A8yjS88ITzVMSSR8x5vOYD3pIcd3xwJORDUS2qn0CirfbjkpPZ18Imb29b9cCmIl9VvCsnWmKlQ1RGBdbBegmq/K3iodrh7/nDPLnwSdJAA5KbfstiHOk7UfAl8G4GN95jnjVB7NhAd5nKb3V2tA==
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a78762-f8f8-41fd-ff58-08d7b9cb8b83
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 08:20:17.0145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zvjJAvTR+8Sr7WIfjifquJ/ISzX/2f4E3EEJVdDy9uHKfjDlEYtTAQt6H7Jn/MZQ1mFcZlafeH26pyUEocz7sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5151
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sheng Pan <span@analogixsemi.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

The following series add support for the Slimport ANX7625 transmitter, a
ultra-low power Full-HD 4K MIPI to DP transmitter designed for portable device.

This is the v7 version, any mistakes, please let me know, I will fix it in
the next series. This series fix critical timing(eg:odd hfp/hbp) in "mode_fixup"
interface, enlarge MIPI RX tolerance by setting register MIPI_DIGITAL_ADJ_1 to
0x3D.

Thanks,
Xin


Xin Ji (2):
  dt-bindings: drm/bridge: anx7625: MIPI to DP transmitter binding
  drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP bridge driver

 .../bindings/display/bridge/anx7625.yaml           |   91 +
 drivers/gpu/drm/bridge/Makefile                    |    2 +-
 drivers/gpu/drm/bridge/analogix/Kconfig            |    6 +
 drivers/gpu/drm/bridge/analogix/Makefile           |    1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 2172 ++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  410 ++++
 6 files changed, 2681 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7625.yaml
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
