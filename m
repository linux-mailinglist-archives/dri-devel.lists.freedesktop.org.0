Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EC434F902
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 08:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B15C6E9E2;
	Wed, 31 Mar 2021 06:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCCD6E9E2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:48:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSjJ9TbzmcvY8lFxd5HhCKBpNbQx50RpwE17ft+FtO8ccl0zRUWQ99m2wldVg6SpHZEE2ZExUnqm648zcCB7cMlNKnyoHhkpiBQxq8UU0WUM20lLb6bS1QInjdKle7vXwHyx6nJQeuFcvYSBkSU/cUH4gsVssk7se846xofDvZ9D/p1388sOjX/zzho0CEZw8/zHnpYz2699vQ9UKkxtot/H+DO2nPdHUjhgRMnrNNZMsE1gzNgvRL6CTGz3furAYGkJZ4KGR1VLyqpNZlBgyxVYSbQcMA0DJby2zHeIQ7XH5WbOdvBRvA9CA0YWyZokD4HJtJTwvJFfV7wd5M8pGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fIvUbqgzh2AM1uyMHedNUJvc1wwHR065UxLSpMCKso=;
 b=g5vmX/49if7yo4BD4wPV/QKiEYB6Gadl8BLv0vCTWqqQzjODw6tJxcWix/IzuTxonWk9ayaHiPzOXpfY1H4HH9VzzLjlkmzTgm9avaJME/cFp/VwwIBelkQqOgb7OcT0lMQN8DgrjRi2kEK5dwPjX3r0Kbods7hA+1cNGcSmnIcpwOHm4juVHTzmUWy5jwEbCzIAwyrBaRSCmvrB8sM6+JBJ6BCTgx24jqBZWePzOUb3h8/zr/t1JXNsCfLl1NnfsSOJFNz2WsmE3QRaiq2TLRM0tG97aQqsMajTB7eloscwROHuoPSO8yf8MhdsnmGAbQwOA4UcfWuceS28dvS2QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fIvUbqgzh2AM1uyMHedNUJvc1wwHR065UxLSpMCKso=;
 b=e9F84dGNGZRqkr5Jpt3sbPRb5qsOOWCrx5nzgvjM42UE63R/ExZoJVf4PQS9Z6b/xB11917yNQXYxaARbo3gRGIPT/IJOO1cdng2kDXlD5kAiM+QrnoHWGxv/uc8+gKw2CYTGeU1fcOSSzn+3CvA82Nyi+d4/wHctRUS65v8el8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6349.eurprd04.prod.outlook.com (2603:10a6:803:126::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Wed, 31 Mar
 2021 06:48:39 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:48:39 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v7 02/14] media: docs: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Date: Wed, 31 Mar 2021 14:33:13 +0800
Message-Id: <1617172405-12962-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
References: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3977.26 via Frontend Transport; Wed, 31 Mar 2021 06:48:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6288f849-89a6-44b1-c589-08d8f4110425
X-MS-TrafficTypeDiagnostic: VE1PR04MB6349:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB63496D588D42EEF638940566987C9@VE1PR04MB6349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +W3wivkbEUjkdW9axNZjCeyPp9t/7O/t4ts69ufR1KJQdG4XScTwXYZaldP99oFvu9eR5n7+OJI5UKyJrlcmMZY9hXzPbL22LmDVYEYOBoUn/w1vPt4IgFiPD+7aY3Awv9KBVeIfSDRNhvDzxllYSR1d7gpMN98xrjflXFlPetcnL/N6uOYYT0qP8LF7QnLgxH/mqDr0GA2HYv2QYdIcNeKEUCf4gu5+43eJsVgtCqT3lJ8QPlWWg7OLqPukUw6No8IW5fV9b9ZwcmWXpTukYOK1htHGupGr8b3pXlCbTUY1SOD3SXZtdrZ8+fnRNU5Fk0SR/A9nfduOQTTe0v1Z1CUKKAR+UuisOkJBBBlZ5eAmoVot9s63TJLTmQ8gk3nMXgRSoN+XcL6Nm3B+dUXVYkhgBVfTnQKFl8P6RzUA2GrME5UkPDgV2+28OeGHeNa2vS2dnQ+cCYJghXtJuThaEzPIMOIOZZNFR/uZ9JZ4Nvd9DMbt3d+P/uq0MqEln9ABRmaCoTi8Vd2UUq6OOhW0TZCmJHeYhkwGZXg87SGJXuQoeYwgvQDe2/we37MfsPOtLxjk6X3mTKngGvQyCnnRDc8kuBOsAQ/RlhbPbVzMRwrvse/fbY7tc8GxbNttankfBEPOnp8gZyIoREMKnAX0KJxr1djWb5Ulb+QOgprTh8cJ89ls6dXtKCVvTgUfUy0K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16526019)(7416002)(52116002)(86362001)(6512007)(8676002)(6506007)(69590400012)(186003)(66556008)(5660300002)(26005)(498600001)(66476007)(38100700001)(4326008)(2616005)(956004)(36756003)(2906002)(6666004)(8936002)(6486002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?W9XD5KIT/K2YhtKsIdxcwXrgEhvEUmuvUFwwAUWmkfKzuFQHEis8AYQG1lOU?=
 =?us-ascii?Q?AZ+mwFOYO9ZxSh5kuvYoufFfr3Oah7xCjqfdf6oNWYxGq/18P4Ft0H0h3FTV?=
 =?us-ascii?Q?KABYohsNqu11iD5/w62t1gcr77T6CTwPjZXK5mWJFYwpbTNx2EqaE4tNLLjh?=
 =?us-ascii?Q?mxBRkgQZhrsB5uFXwXGqR0HT5P/hQrtNkzmzUob9/ZXjfPajOfuvqNwMQj6E?=
 =?us-ascii?Q?ugmxG/YCUPVmUG3SPm1y/xoXNllGwK7xFVHeumYkjZv2YE3O+6zrq2Xa9YrT?=
 =?us-ascii?Q?0dRlqMgHJNYIt0vZo+DeJnhJfLA4TmKgkgX53leqHosGq+HWkoI0x9lbEBod?=
 =?us-ascii?Q?ZfJszKeIejKKM/KGJf5ytJOoABQOPVhAyebyXi+mG7i6CxyI1Fp68FN9y25U?=
 =?us-ascii?Q?VG2NonRte9c1M54Gj+uuFWMPrCqlM2Vz35SEnPpVcuKTrnK7qfXaMdhX89tV?=
 =?us-ascii?Q?jYfp3VW0DODaD5wZF8BqH1bq11xQVWW1gacDPyXU6Zgdvawp60B5+zannWX3?=
 =?us-ascii?Q?jtUmNFj4wJkFgGto6LQfMouIXA6amd9gK6Hl49GjtbJhQ+/dnnsYS4G6AHQP?=
 =?us-ascii?Q?wVuCgPQwFRaj7taYuWdCWYFb1L5L8Ft3EwkgZdomlen6HHCrcLe1/UOkHUfS?=
 =?us-ascii?Q?xCJerPbqC0wxIMDVK7dKAQkvig/MQGu0qrRR4dr2jKHeTrTlefDhs0BewQ5c?=
 =?us-ascii?Q?CumqvC13c9WR0jbE6ijKOVMVa/AnyHZDCO0Rikz4QDLWz9j5dAaFtC5YommH?=
 =?us-ascii?Q?tLXuxj82aHv8vu2EgoF+yvnMkmo8Ieo6MQfMamnja++qsAj+vOlX0CowRJYU?=
 =?us-ascii?Q?Bs71h20Bc7AKAgzIGKoko2KpM027eHJayE8p9YvwGkFunNFwDj/NAoLpvYxe?=
 =?us-ascii?Q?h9E5ntLBNcPAOcaHe6fTIVVWdZlBBAIk/HOKgFugu8wwsthgxze9T8ZDKxef?=
 =?us-ascii?Q?4kYAYpUwfcg+h96+daH3qpXeKHhSwHPArFW4EFfTlf8MCd8oStf68XZZJ3te?=
 =?us-ascii?Q?oLdWyIOXTx9IAPrnZrAEte9eaHrzxc1ErIaXs0jBb+dvfom5YfpWbEdD+P8V?=
 =?us-ascii?Q?/2VqHzQC2XLYPon2NNT5yR7YneAN+xTHllosXpTyxXLfCKdvXFxbH37n4pQp?=
 =?us-ascii?Q?hpveNsDmPAyiXNc8GZWDEuznv67v7E86jIBnv6FAcz0+Ibj6lUQOkjKTEd2r?=
 =?us-ascii?Q?gZ7bbJY9tq4s+zsh7zzvg3Wm4opL19m9JlUnnvMwNIqwtMkQmBvMGyAdWuw5?=
 =?us-ascii?Q?CxQhaebT4U+TPU7zz+sAzVIiZIuQzVf6qv7Mi4hUMZ9NK/Rag8lJ95zZoXzk?=
 =?us-ascii?Q?hLMe4cVkojmgRez2PDx1A+JB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6288f849-89a6-44b1-c589-08d8f4110425
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:48:39.6639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMfFYytUKnnu2VeD71McFanxYJNaJNL7ouYNhaBsHgaCfoAodw/uQrFpYyGm6Xa+VQmAcVCMKfSGCR25OND+fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6349
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
Cc: jernej.skrabec@siol.net, marcel.ziswiler@toradex.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds documentations for RGB666_1X30_CPADLO, RGB888_1X30_CPADLO,
RGB666_1X36_CPADLO and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp
pixel combiner.  The RGB pixels with padding low per component are
transmitted on a 30-bit input bus(10-bit per component) from a display
controller or a 36-bit output bus(12-bit per component) to a pixel link.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Robert, I keep your R-b tag from v5. Let me know if you want me to drop it, as
v6 contains a fix.

v6->v7:
* No change.

v5->v6:
* Fix data organizations of MEDIA_BUS_FMT_RGB{666,888}_1X30-CPADLO. (Laurent)
* Add Laurent's R-b tag.

v4->v5:
* Add Robert's R-b tag.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 .../userspace-api/media/v4l/subdev-formats.rst     | 156 +++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 7f16cbe..1402e18 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -1488,6 +1488,80 @@ The following tables list existing packed RGB formats.
       - b\ :sub:`2`
       - b\ :sub:`1`
       - b\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-RGB666-1X30-CPADLO:
+
+      - MEDIA_BUS_FMT_RGB666_1X30-CPADLO
+      - 0x101e
+      -
+      -
+      -
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+    * .. _MEDIA-BUS-FMT-RGB888-1X30-CPADLO:
+
+      - MEDIA_BUS_FMT_RGB888_1X30-CPADLO
+      - 0x101f
+      -
+      -
+      -
+      - r\ :sub:`7`
+      - r\ :sub:`6`
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - 0
+      - 0
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - 0
+      - 0
+      - b\ :sub:`7`
+      - b\ :sub:`6`
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+      - 0
+      - 0
     * .. _MEDIA-BUS-FMT-ARGB888-1X32:
 
       - MEDIA_BUS_FMT_ARGB888_1X32
@@ -1665,6 +1739,88 @@ The following table list existing packed 36bit wide RGB formats.
       - 2
       - 1
       - 0
+    * .. _MEDIA-BUS-FMT-RGB666-1X36-CPADLO:
+
+      - MEDIA_BUS_FMT_RGB666_1X36_CPADLO
+      - 0x1020
+      -
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+      - 0
+    * .. _MEDIA-BUS-FMT-RGB888-1X36-CPADLO:
+
+      - MEDIA_BUS_FMT_RGB888_1X36_CPADLO
+      - 0x1021
+      -
+      - r\ :sub:`7`
+      - r\ :sub:`6`
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
+      - b\ :sub:`7`
+      - b\ :sub:`6`
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - 0
     * .. _MEDIA-BUS-FMT-RGB121212-1X36:
 
       - MEDIA_BUS_FMT_RGB121212_1X36
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
