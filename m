Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE3B2E7F72
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 11:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DCF89B5F;
	Thu, 31 Dec 2020 10:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2107.outbound.protection.outlook.com [40.107.92.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1838089AF3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Dec 2020 02:19:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7J0oBZ26ShoiftCHiRofXExwsd7cm+5uN/VEUr6lAoAf9p6zIzE31fsrqGigUY2uEsdKImu1rrHo3PpDDKWe8OoFFTN/+psLvS//YDRNvmNuB44ThmJ54DM0XvDtvkpuZDFpMYx2ApmCkYzG8DiUFrBE4Gm8eMVbARlvFrbAxwz3RzEkcc47K+HFjTiPNhpMDWhnJnb4loqsW0MFHbsZGM+0p0tNrKmKVWy1p+fmhnwGMshjSXkN+TgUeBFNYat091JgD7UOUXoxDVqHIDBCNvPZCNcLePQuYZKqWRewFzjIO4SEujrXPQI7O+slFYngUua1Xjgz7agofK0RgCuOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYTxRNuLtW1rps/vGoj0fy/DVPBIR97RGaf/tnJnlW0=;
 b=gkVfalwfzqkmSi2LD9NS0azTIEzAZE1fFvhEQders0NeUS0pejqik1bXyKKkZjjyhh5gASt/yk20nb9VZj3PHvq7GmMNW05GivYz6eaiKDN6FUDkgNk6sEQifGUNGOx5gOH9HlGvzNcYmXnF+GFfI0/ncNRcteuSbVkX4PwQujn9LnsHkSpWHtm9cLSnVVCDRyWeJAWzC7dqpxCyqQMYNr8eTSxZZGbil+d7oDlt4s1YQLgksePTaT6K4ZqqU2S1yRVlQn6hu9VmTzJSYcdK6gc1xa7eVmlT8F1MMaG9mBeEbTvd0vbbVuWmVOdLP1k2x5tAJWXgk1XvxC9e4C0ruQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYTxRNuLtW1rps/vGoj0fy/DVPBIR97RGaf/tnJnlW0=;
 b=AasimMjY1puGcjxhLYwFoUOwt9efiTaeZSNXvEdSWJ3JQA8cU3hqZTfssMoHbmJn8ri4CDbCUp9sZ/TNi2pa42ijKvuyI6fJHD+9frKw2jL471jYCf6wlt/KKad8yCCtvFL48Xtlxe/kkJcVvgW8v5hSzQyxUoEs6FduvpK+fS8=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5957.namprd04.prod.outlook.com (2603:10b6:a03:ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Thu, 31 Dec
 2020 02:19:37 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::707e:7179:3257:e72b]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::707e:7179:3257:e72b%8]) with mapi id 15.20.3721.020; Thu, 31 Dec 2020
 02:19:37 +0000
Date: Thu, 31 Dec 2020 10:19:29 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 0/2] Add MIPI rx DPI support
Message-ID: <cover.1609380663.git.xji@analogixsemi.com>
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR02CA0215.apcprd02.prod.outlook.com
 (2603:1096:201:20::27) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (61.148.116.10) by
 HK2PR02CA0215.apcprd02.prod.outlook.com (2603:1096:201:20::27) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3721.20 via Frontend Transport; Thu, 31 Dec 2020 02:19:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3c7d46c-6f54-4121-72ba-08d8ad32859a
X-MS-TrafficTypeDiagnostic: BYAPR04MB5957:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB5957C65BB697F1D48C865519C7D60@BYAPR04MB5957.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pGW0qhNV1vYZPh/nfeSTnvqb3JkpTjy1bZ7CDepl3vVQJe8FuXEvc/ve0LWtieitWuTwJKMIjnJPlI5BKyBRmbAQktzaGbRXHtsHwPEB5Cve2bKHjlp8mRua2D9GDlUwErvtrsEm6QeDNyBiKFYG02OseyQ5YP+OM05QrGUJQA0xDgi/J1PTky1ZA9PIb2dDb9Hbsm0z7Nuxiqp/DRzkH3lLWEcKMdlhhtXsDaJpPhYxpG+jUGQRbNgISQcB5YgM5SbHO+Btz0oNMZ50sMa099YLoUlO/wVbkU/nuvHdL39O4Gi8/92D4cOVvMyJvxRQCg8QiTLIcdh6e1OAPwaI7KjiX0ndodH7zgspPLcjL2KC5ebxyt2dgpvzfzYzIlE1i9vwA+DLAiInwp1FqV9EOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(136003)(396003)(376002)(39840400004)(52116002)(6496006)(86362001)(316002)(54906003)(36756003)(66946007)(110136005)(66556008)(66476007)(83380400001)(5660300002)(7416002)(6666004)(2906002)(8936002)(26005)(6486002)(4326008)(8676002)(478600001)(4744005)(2616005)(956004)(186003)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?63gIan9y7OsPU1647Tqc2YTFYD8v26uU65tldAuPHY+gyCIC/ESOtZGAYD1o?=
 =?us-ascii?Q?YvtxYYLTJ5jeLZeeYjJxfjrQB8LtYkyqYGPdiI7rJJNUlpHqJP7l+jFyLoI0?=
 =?us-ascii?Q?EzHNnhKawKHGZlDYx8WC1pcMAEgrbDY5BQCTeLp0KuaTSjU8ua5s8xMIpZtc?=
 =?us-ascii?Q?CT5ELbmZG4A+tCjncitW1qMF/56mpL41fbig3Sid1VJpVr9JUtzUExeTFQst?=
 =?us-ascii?Q?1Cu/3HMiM698j0H4v5nLDgD0vb13PzRDRnRs4ahjLBupAYwCTtDj5/3y3Ji0?=
 =?us-ascii?Q?X+vpmZI80rPFoWB9p0VY2tnDAmhPO+miwi5N27BbC0FpyL5QKI5anWa77Yf5?=
 =?us-ascii?Q?NmYJsuO8JfDR3nokUThx2dP9riE03JcwmwgLKviMQUnmBggqb86nRKhMcxd9?=
 =?us-ascii?Q?CZRL8HF2OO+GId8Ze4njtXs530lrQMJ6p9w2ewWv7aDUz7qlGNGPBNgmoT8T?=
 =?us-ascii?Q?f6gicVrza4gE4OJJsvA4q36bmEsav9U9qvV/R9ekw9BQxql6DabRN/G8KMZ8?=
 =?us-ascii?Q?3R3n3UN4/bnx3TiC1TCM7WXC7ak/m0QKCNr4ts6WwaG1dH+Yf10Y7TlIWEA5?=
 =?us-ascii?Q?PBxVeYMCRkiTOoT/vuE46iRUyOy5nCBN6vUgMtG6gP5gtee8504F7xV2VQU8?=
 =?us-ascii?Q?7w2047TVGqUHvZUbVYOPtr4v2F+1nL+91m4+3KzsuJwMKshpx44WVHjHQYO6?=
 =?us-ascii?Q?c066468w433hy7ixejZJJOXAg5lF9ZIrbq8BN5OA9haSVd5360cdZaLxzYk5?=
 =?us-ascii?Q?eWGNj8aimNLzXQ4Y0ylXCP3a2L3cxa9BPAbyZT3c+lPFpqApo7Efh00wcGxB?=
 =?us-ascii?Q?JGbbfGa/f9QXJgHyXL0U4AM2K7WNmGwSS7h7zgtdbW8TneEqMoMqokVszIur?=
 =?us-ascii?Q?RVmahWDFnzS/jQN8lZFjNW4LGUdoVRE4qsCL4ONLQvDfOtGQaL0S/TUGrRTP?=
 =?us-ascii?Q?BJXY3tDipa+yVv7/MIARY9k2MVaDWIisk7CjOSTiGIyqWy3qmKbOx/KLGwLK?=
 =?us-ascii?Q?PQEB?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2020 02:19:37.2694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c7d46c-6f54-4121-72ba-08d8ad32859a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqRRr96uk/tJxJ3b17kbgKyJc4hwtdh8hCZYEn9VN/U1XEBVzlTAX1MyYxr2uAUdAcO6ZikvR6+srVISZSmSXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5957
X-Mailman-Approved-At: Thu, 31 Dec 2020 10:42:13 +0000
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
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Sheng Pan <span@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all, this patch series implement MIPI rx DPI feature. Please help to review.

This is the v2 version, any mistakes, please let me know,
I'll fix it in the next series.

Change history:
v2: Fix Rob Herring comment
 - Fix yamllint warnings/errors in analogix,anx7625.yaml
 - Fix kernel robot compiling warning

v1: initial MIPI rx DPI feature support

Xin Ji (2):
  dt-bindings: drm/bridge: anx7625: add DPI flag and swing setting
  drm/bridge: anx7625: add MIPI DPI input feature support

 .../bindings/display/bridge/analogix,anx7625.yaml  |  25 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 344 +++++++++++++++++++--
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  24 +-
 3 files changed, 371 insertions(+), 22 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
