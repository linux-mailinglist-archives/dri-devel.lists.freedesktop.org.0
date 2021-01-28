Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ABC307127
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9C16E960;
	Thu, 28 Jan 2021 08:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770131.outbound.protection.outlook.com [40.107.77.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97E489B9F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 03:08:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+UOYRO755p1HnKvXHCl+9pdvTKImBv7gRqqlElA92ATDiIAMTqefh4tHpxfU5UaOb6jpcbnnJM2AxXLVWzcZBsodyRvWjRw0CZXIGIwxGkowJUHpS5wy5IklWvyeV8YzScuMItMTV+YVx3C4OI2CxIC1WT06F+952NLpVDqEReYDOS+al1JDhzLDvpTwj8geyP42Hw5s7Cm/8+jyuM26csTYuvz7A+A+M9COaw9FfKgIKzmKKV4R37dw/4tDAcgpMjO8EQkAysTws3bf4eCNJ13wb8ZpJuxpnRhL6GFrC8A0h79KmD8cIGuCaAQ8m/ziH2VS95/uqYWhWsLP6+pww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBYfrYYMhk8tHK5mOTNjFWWNKuHkXuBRd3JEa7pPS3E=;
 b=TjKktMc/z2D88s9de+z0yZ3L34Uij7WeOq0naOdKiMGuuoFtJOcvLafbpAtEKMXscPPTBLhaFI2IK7/5VdhHVQSI63I3OyFKKu2xUXvt9sO5u2ikf0e5tKowWhSMO7H9DhGV/hdK6A8vSaCj7TgebheTF4dDMlEVtD783ST4RUUHgaVbcBGlPOvQfGpgf9+FG9qfHCVRWGMAZ8KPhkyt7rWXEqUQJI8VUKoAG8spwVJ8WTkWVPuw6mxeyyLt+S+ZPwQJrIFvH9diCGQMo+T8HFJEiYiFO2fiZ25vatzf3M8cRxf43Qr7cVZ9p/n+XdGz7h+iL8+Nk/AnXRqZ4nbM+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBYfrYYMhk8tHK5mOTNjFWWNKuHkXuBRd3JEa7pPS3E=;
 b=koROuI7HlvJO4LBgsi7MJj6LTC+b9UbD/8vlePA/SykizsXSxn91kb3YUiaQeRG5aBAmHyxjy/gZU3RtP8D5393sJzT9p5FxPFUuh4vKnTpoHgGbbEV7CxFlM56rFsP9YqSvZQFz9hK0gNXtrHQGV93TIZ3l6FQCI6gErbT3xdc=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7504.namprd04.prod.outlook.com (2603:10b6:a03:32e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.19; Thu, 28 Jan
 2021 03:08:12 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132%6]) with mapi id 15.20.3763.019; Thu, 28 Jan 2021
 03:08:12 +0000
Date: Thu, 28 Jan 2021 11:07:32 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v4 0/3] Add MIPI rx DPI support
Message-ID: <cover.1611802321.git.xji@analogixsemi.com>
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:202:2e::25) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HK2PR06CA0013.apcprd06.prod.outlook.com (2603:1096:202:2e::25) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 03:08:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab9a7418-e7a8-4daa-cda8-08d8c339f239
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7504:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB7504BADBF2A45137C892ABF9C7BA9@SJ0PR04MB7504.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sk4ZRMiEa1bRp9A9nBUyOyyCES+CadP05g1UpukLdWkjfl6y+es3TrhkyPddwD2f1beAQ5EUORSkG8lvp5X86vB5DX5TFuDjv+GQ4XjxwSDfoEh3N1NhMMRLYLflAJBka61UNtgcVTFQHcXCNMafNHOfdLPc8QFaSXV87okC9ABVM7A3QZMluWEJBU4ySTEgTMlVBwPTlccSzAlnHJHJ/hEU/sEtq1nbNWL6oiuZY382x6U5OigqsuQGFEZ70Bbq9pu2CIbgRv3ON5UlAL/lDor8KdJ6ARcsFBashZC8z/j9q0WzwEJ2zwI61j0cnNikhrBFGHOUqkGZzCL4yM43EpNbsoOanf0agoWsp5l312IHWW4IVMBFveCF41UYkYfAbvdNMk0iQGaBBTo/5wobhVbtb75ocVO1m6+GO/k72nwmJUzH4+cIXedVnHL5zDTn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39840400004)(396003)(136003)(366004)(478600001)(7416002)(956004)(8936002)(6666004)(6486002)(5660300002)(186003)(36756003)(8676002)(6496006)(110136005)(316002)(52116002)(4326008)(83380400001)(66476007)(16526019)(86362001)(66946007)(26005)(2906002)(54906003)(66556008)(2616005)(16060500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FtyHGmroRw2PWozn9egtfWQKZqAaAYyFi5gyuu279fQCwYFSMGumyRjNPfD2?=
 =?us-ascii?Q?daPGueqzuIY2uofO/ArAz8iKF4IOXE4y8T1RuHLHeQTwwLTztcPuJqLE1cUz?=
 =?us-ascii?Q?8fHehjJF2E1yNKyEzWCaXzqgLMpyZORqDxWNQK7VC/5ubF56YQ8IfsvhCNZ/?=
 =?us-ascii?Q?xkMRUHu2/kxm6g8F6LuAeW/MpyMygNPWWAqiJsuaWJ8FNxOqKpQtzq5zyfgm?=
 =?us-ascii?Q?m3LPDUdnbdvjmImgi4xhVOQYSApMjS+t+bLWSszHkBuuPLWmGPYHk0tmtOJp?=
 =?us-ascii?Q?U94joAW0cZ/6DzCVOz4w2vbKENI9jl1Og7WF3vqlQ+e9vKUqpy9QgsQ2dy5M?=
 =?us-ascii?Q?UykiAf4jhmqKTZHMLQxZ6pYrhNwoeUkbDg3Co2VMuOYvGCXfFMqOokbwtDhU?=
 =?us-ascii?Q?o63SeVd0F5z6u2tcpXFlk8ID3L6c5ud9dmmHUY9bhRPUdJWaDY3MJKSsEutv?=
 =?us-ascii?Q?Lj01c+glgdglQyY6yDIFL8/Sno7ZXr7gU4lTlZUtuR2BZUUyIT/SNpwc6W4f?=
 =?us-ascii?Q?tgB0g9FCSyTSgkchUmZabBNDiCLdsEN4v69Ouko43OHY12VhUc49n0Acds7A?=
 =?us-ascii?Q?3yzQ8AE2dMbjVf3k/3lIC2pYm6GXSgGes95ePuP/SNhhlvOxFMpf3IeIns0O?=
 =?us-ascii?Q?IL/p6VHPl/F1Yim4e6wBaz+rHL16Q6LKvamqsTvpu8YWaTDRuSV8XNchXSud?=
 =?us-ascii?Q?kzMU7cA8b9//wu8xBCJf3enXpuH5ylffBWBagiAPXp5mps9XQwGbGHgA5jlS?=
 =?us-ascii?Q?4G9hKr+k6+Bhs0iF9c7Oi0uSpPdN/srDMqvw+Oi4sU3z2kjnWeUEW9tnDYQD?=
 =?us-ascii?Q?jfkhuxu9bQ26TbB0RoRCsMLnxSQRXF888pTkXWIyxrFib7mivdvDUIj3Xloc?=
 =?us-ascii?Q?YfNbLOjDIkpn2Nn7n6XUFUWacdBf2ZRvRvHkeyQb6RRApf8+mB3DcbecT2nT?=
 =?us-ascii?Q?9xr23VdXSXVTt2YwxbaR04UNLhp/LsivkY9n2sBQE80YGAFN6XTm209z9K+5?=
 =?us-ascii?Q?1OTXU3WTZagVJGeHbnUHi1/Lp8XSvRsAV9jgefdnpkmta8Bhzqt/0D7CDm0l?=
 =?us-ascii?Q?cofVBIXF?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9a7418-e7a8-4daa-cda8-08d8c339f239
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 03:08:12.0806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DumYLdykhTAdVPRDgIOjbfG7Y8JnBNbv2CoHnBJ4bZqQG5U94MCPG5Z0b4LeIs4/j7zT9AmU2Oc5VUPCIKnvAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7504
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
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

This is the v4 version, any mistakes, please let me know,
I'll fix it in the next series.

Change history:
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

Xin Ji (3):
  dt-bindings:drm/bridge:anx7625:add vendor define flags
  drm/bridge: anx7625: fix not correct return value
  drm/bridge: anx7625: add MIPI DPI input feature support

 .../bindings/display/bridge/analogix,anx7625.yaml  |  54 +++-
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 330 +++++++++++++++++----
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  20 +-
 3 files changed, 340 insertions(+), 64 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
