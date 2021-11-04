Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB581444CB8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 01:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027D17AD13;
	Thu,  4 Nov 2021 00:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2127.outbound.protection.outlook.com [40.107.220.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7776F9D2
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 00:51:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ac76GBlvhJK4JA4Mn0m91pxuwXwuytwwSzeMTDwXG1LqImvWT8dQPktNbrpOU6AO6w72o3YTeaeFgfsjb3HduH0pm4hHl7vqsa/hzaovnwz2TFyYa3LBdEDTuy7CWAEyBOCS8mdMhv2bNJTO0aRepzcBFUqA5enmgfsKHadpkEDEhl8/7T/L+dwwt2ZeRCNIRv2hAOTrpGisMMBwRVz5oGSEZT09eQW7Jr69Qkn3uH2uqp6P0ktIHi+In+qgnCcaJfaKBmNwpcbWNujAWfbbk0boms1Vz6RGDfPEAWsCI4yBiDYfY91Kp4c4DKVIaJP6r9HwJNfSp0iU8S7rOoSJfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHL/Qzfovf6b35RlKLi1nivfJbEjX9vtWs/8GNL0TpQ=;
 b=RATtuNTM0irh+0kXhjm8YuV3fxxd6cGCZ8qfy16yG5bTxNxcIS9+cISXV08MM1UA5Dj7PurelhcUliwOQqnGpK5Hehv6piJ6Wyh/L2OfvL2G61kHI57cam2GpYnUvbILi9SlyiQtgCBRrRGB7HMNhjcRXh2lodJ8phT+MboaupziB2rcXXAX6BI7G1XmWosqscEmA2+TCbHQ2SvRUG/FjE3awnEuT+/FuA1erzHWJV31yuaKUESVDwkq/MobFEOWHvTUp6BIPPYGpR5lZn4TieQas4YfSn6+Oqip3inlVn2HKA3HdvlJtLRHTQqtBQDSnFe2JuDB4tbMnG2iqVwp9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHL/Qzfovf6b35RlKLi1nivfJbEjX9vtWs/8GNL0TpQ=;
 b=gx4a59TUE43czCy0MuslPQhM6chj1pJeyseqarGukbhAMURbWY31LQX71Kq9Nbc4IWMXRvyku09QY4xLFJZz5MLPwYeRD23c+wryeFJ7gmho/E59RjOvSwKY4YjpkiBJsjlrym7UrYZfXxIndkgkvmo7VcHaZHDUMqb9ohatpq0=
Authentication-Results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5959.namprd04.prod.outlook.com (2603:10b6:a03:ef::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 4 Nov
 2021 00:51:45 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%3]) with mapi id 15.20.4669.011; Thu, 4 Nov 2021
 00:51:45 +0000
Date: Thu, 4 Nov 2021 08:51:38 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v11 4/4] drm/bridge: anx7625: add HDMI audio function
Message-ID: <20211104005138.GA2328386@anxtwsw-Precision-3640-Tower>
References: <7dc405471da4771641d2942960d364a588bb4395.1628161369.git.xji@analogixsemi.com>
 <20211018030529.2055255-1-xji@analogixsemi.com>
 <20211103142003.GW2794@kadam>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103142003.GW2794@kadam>
X-ClientProxiedBy: HK0PR01CA0059.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::23) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK0PR01CA0059.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Thu, 4 Nov 2021 00:51:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c93e77a6-a554-4387-9110-08d99f2d467f
X-MS-TrafficTypeDiagnostic: BYAPR04MB5959:
X-Microsoft-Antispam-PRVS: <BYAPR04MB5959170F235239B35A453F8BC78D9@BYAPR04MB5959.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WpU124ib1D7WjXF8xaxnulK+oEWOl2CZBGLQe7xYDzw/OSNhrzMNVDqmTMUHHGHlUWSeU2ipxt9KEHm9vatS1aq0vqXg1nLnnW+zZbj4cs4nqp1egMkmw9ZLJuESP7+Q0te3oFguVJ5dV6+T+nHHnnBFrRBCIkcjymmzk6gKQwEV5aY1kz3K/SeFe3vgTqp9FAOJDRYUwzHfB5mIuqfGlj2PgLvbUs6r2Iq5lJsqB6qcGZBT3XcIw70y7UGYeFAZdEPryx3g2q+DIPB8ALUxiqHnDctrA86ttc/3BvM1ZLp5G1mRmCQroOipNh6peH8J5NkRaQvvMFQu0h/NyR7x8p9Nnzw9MEyq99RpeOjojr7uZMuNs9DdX6IGD5DEAX8uMR+IFrPBcKVHmTa8TL5cUr0ht/9bOE/c1VMSyQoA88njnLAM/XZ2G6HCur+6F9D3g8KAhVEk7x95Yd7V1OdqUrKCBtY/30qux6vUeMrtgRNM81oeZYegkofhR1DZYPoC/ANWXpYj/bFzmkgNR+wLFvVQVtwVe0R+ivu3fe4Unogf2GM2kjmzCP//H6SeUpyvqX8DJxf6EFg3GKcc8oi7ZTAIH36enpGA2OGleXubdgHvKhrNlpQuqlatrixfQWEUaq0GDEiEwVYux0AbmLFAmdZoTHH5cQgtQedr9HHjOtzeSZcWNWj00m0parPdV0tXqGFI0tsevK1venU7PiBl1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6916009)(6666004)(8936002)(316002)(7416002)(33656002)(8676002)(4326008)(1076003)(55016002)(5660300002)(186003)(55236004)(9686003)(66946007)(38350700002)(2906002)(38100700002)(66556008)(66476007)(956004)(52116002)(33716001)(508600001)(558084003)(86362001)(26005)(6496006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6THlULcUgK2QmolX6Qiall3LuUzfkZBlRAE6lIURXwfM+ko3hSB6MwbUUWrl?=
 =?us-ascii?Q?Y22I7/u1oBnyNRYHeO/ZZyx8F2yOau9Xz+MNFWowT0I4qJp0IJWXx+odCD+F?=
 =?us-ascii?Q?0g4geqq7VfgzRkiSX6P5/iFCi3iFfB+H8FB2J4XBNDEoNlH5kBcBe9+JmqMb?=
 =?us-ascii?Q?CXrKK0joH3M43cvgXVq44ms85moi2ACBuobiLubXaZ6epcd6J9qAmF5PwQOQ?=
 =?us-ascii?Q?HYoMXuYD0/j+yyvW8zncQk99rCTq5KXSY0b03c/lEsZekaoH/tS4jtiqY9w5?=
 =?us-ascii?Q?IkCAayVLXsHSdGx65jpJNlf5HBj91Dbc6fYGiM1yHtFCvuPodBoPa7Acy88s?=
 =?us-ascii?Q?m/1w5i8sMFMUppOgn8OL0u7Ep20CNsLoUss4/BDD7ttrGqEtK90C3nFoMUzQ?=
 =?us-ascii?Q?lTwFUPMiLXJSnS8UlcDFcopkuoI8cNKvKuwloOXF9X4b3LapqvX+s6kblSs7?=
 =?us-ascii?Q?arY9Wd/7HjsEDS2GnUw50XK1BP2B7/KUvI7BuebF6KQVHaOONT/efZTdYHNt?=
 =?us-ascii?Q?lAYTGWPTMF8cnjJpLfFiBD4DRNpOTcZiAYJwo2xM/IbsLDUZvcpk2+Bo9pmr?=
 =?us-ascii?Q?+yFZmA+f/Ko9fbpYdB+bsLr+UCClQbTUjSYPcPLBTLG/dlt91EZ1ZqpMxT44?=
 =?us-ascii?Q?8K1E42X/OOPMbvO34zKLM/0KyCjbTxZoLCiV+UWomfOufwkzxZ/IGAAFP8k6?=
 =?us-ascii?Q?pCtc5IQTI1AkJgjpWIDx+SL8mqgKyRF6gZLiAWAT94ix/2r046h3P4nL4Y5G?=
 =?us-ascii?Q?JnYk83ftZ+BlG1OGx+7BSVlCKpCNLooj0vwaiucTXQkkOqmA9jrh66l5k4tZ?=
 =?us-ascii?Q?E5Fcf7U+2bHQGo7z+4hskyKB0pah/cCjcfZqOoKwvzm41MDWltAMpf8TaKuN?=
 =?us-ascii?Q?W8XF8sGktGUez6nowrO1eS5XfXmXXVpwcn8g56fxe5hqehDmo3mx75VNqWUW?=
 =?us-ascii?Q?Dg/+FScGIECzXFhfqwtZ2R/qwQNMTTJwF97sZjP3yfuJNCZHu4kIuHrRbYOT?=
 =?us-ascii?Q?EtsxFEaYUg/fOlmd+NuT5s/QVIRiAvB4b2XDAFutE+R51OOYeYRJftxZSmjj?=
 =?us-ascii?Q?8qrxwGqv3PtAD5MB4jOiwsspYx3jNFNFVLKXrOLaqd4tY8KzRCdyURSVxYdM?=
 =?us-ascii?Q?JC1tFNHGqxkLMtJdIGo5Uy1BaqV2qQZT/GY7jlgtMYb+haNZLoTo6AtGsnrl?=
 =?us-ascii?Q?gexxhV6P3WSJzzRgGVkomTi02Zg8ByRMeQXstcQlSsbWtyXFdfckaTi69Ex3?=
 =?us-ascii?Q?vgEDxG8okXgOPZyrzCmM/4LKlXLmTOwl4tTzy5NwdSIjQ3huQngG/ZbN9ZOx?=
 =?us-ascii?Q?fajyFqu8YcJQo03H++OGipFDBG6d9QK7dgHIiQrdDYXtfO0AV0BhciwnbK3d?=
 =?us-ascii?Q?nDy+GDwOYLdOfPdp19iOSVG7UNqgABNSRC0Eg9mMVjeJtgnUq/mvO066Bpz0?=
 =?us-ascii?Q?f97Di3Tnp3km/rpfuMwUGrWPO5TdmdQ5dpVin3/SxxrgqZ38KRqGI4nWkaHX?=
 =?us-ascii?Q?u7IkNiIojHDZ48Y4gYGB+H25++6j2KUQjpXygnDAL9yBV2oe8UA8OyCGES9x?=
 =?us-ascii?Q?CoYFYpJkdSIZpaPJ7cByhVE/qId/Bns9YERygPeKI2ckuWHziR4RARjf5MvR?=
 =?us-ascii?Q?rbtK+GdQznfzx8pL8xkwdaM=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c93e77a6-a554-4387-9110-08d99f2d467f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 00:51:45.7035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWj2+H/rEW4V6XVxgHW3umJ4TW0VjsQb5/sxQEMJOtZSC7tKV2xZCjzoZ6HvaHxV3HR/loI1DYHS1um8czC58w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5959
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
Cc: devel@driverdev.osuosl.org, drinkcat@google.com, jonas@kwiboo.se,
 airlied@linux.ie, zhenli@analogixsemi.com, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 anarsoul@gmail.com, a.hajda@samsung.com, boris.brezillon@collabora.com,
 duwe@lst.de, span@analogixsemi.com, hsinyi@chromium.org,
 m.szyprowski@samsung.com, sam@ravnborg.org, bliang@analogixsemi.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 03, 2021 at 05:20:03PM +0300, Dan Carpenter wrote:
> This is a super awkward way to resend a patch series.  Next time, just
> start a new thread and put [PATCH RESEND] in the subject.
OK, thanks!
Xin
> 
> I am sorry that no one responded to your thread.  :/
> 
> regards,
> dan carpenter
