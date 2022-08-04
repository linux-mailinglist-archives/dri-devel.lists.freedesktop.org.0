Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD1F589BE2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 14:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709AB97B36;
	Thu,  4 Aug 2022 12:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728BC93E4A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 12:47:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVzB1MmNTkdH5gBcSvegsUQNWjVGdONux5Qfv5tsVIOk8Fwmf6HyoOCYCPjXkT9UmcDzUduEmcmjJ1E8euuHLD6PpxBl1PEpioLs00yVloZrHwnyZgXGCxY0XJxwN0Ok3p9MkGnRGnfmjyDsCc3QNHgbb99f+m3CrUsRC1Ymh8ZdGmjkTgQwkZsZPAG7cyElpgu7FSOQa46Y4Kc0DQjEyMkTYV0IMbWaWBrlz9qrk2XT9kfVU3UjoCFrrLjx3Z6XKdSvRf2sCN+e/hJj6obWVTtzNsg/pW03+rvVYvuulyfnNfUePwc3KfDQILtqbgTS1BaTJxxdmevHpHrI3FFAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W32BzReb18UZV39KA6o8N1I87uT/BfoN/TPb9bKbxB8=;
 b=LkV5uhKOiB6SPR2jY8K2qHgaqFQ0jR03hClIt+ul/t2jSTFTcvUHI3gf//18tOzTzZrWdW024LpbSInWdDvGj259bq5BcStHV+Nwnpdw6hQu33XoSiTy/RBNZK5SBzESO/NM2bTFKwHp3wwJpAfK/7xJLIau6O/7AajlSjWHHjU/CJSvJRn8uU3zBT8ui4M9iDa0bv8k6Vr0PJ/KrvMjHQ0qQgs1slU1GZ8T6lBOWS4iqT5ighzuFc+yn+tvJPUezrwlXa97XHajmotvhxStJK9MxJn3wGq9sHqs2B4oWTsLXRT5FzHPPdfJEgYGpfn5elhU0ztcww48B6H73bSESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W32BzReb18UZV39KA6o8N1I87uT/BfoN/TPb9bKbxB8=;
 b=RU9j9fDWQw2re1UCsgFQsA6EcD6VO+kvoexjREjlVseHmsgs401EmbW8MoVTmZmYgpnRp2UHr28KyBqHOK/BopeN9QL6XJu4vkQNqXfqEUbSFWLZG0FP7tvg2eUInPp9lwnBVAYWTRqxlZ2R0Znpf1h4AXUwJWCvv8SvAnCZkY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR0402MB3894.eurprd04.prod.outlook.com
 (2603:10a6:209:20::14) by PAXPR04MB8733.eurprd04.prod.outlook.com
 (2603:10a6:102:21d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 12:47:18 +0000
Received: from AM6PR0402MB3894.eurprd04.prod.outlook.com
 ([fe80::88fc:ee0e:e69e:9466]) by AM6PR0402MB3894.eurprd04.prod.outlook.com
 ([fe80::88fc:ee0e:e69e:9466%3]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 12:47:18 +0000
Date: Thu, 4 Aug 2022 15:47:14 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/imx/dcss: get rid of HPD warning message
Message-ID: <20220804124714.uv4rkk25srdo2k35@fsr-ub1664-121.ea.freescale.net>
References: <20220721120912.6639-1-laurentiu.palcu@oss.nxp.com>
 <YtlFniiVnYUoZCPM@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtlFniiVnYUoZCPM@pendragon.ideasonboard.com>
X-ClientProxiedBy: AM8P191CA0027.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::32) To AM6PR0402MB3894.eurprd04.prod.outlook.com
 (2603:10a6:209:20::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 817f8c1b-e960-4403-a192-08da761776e6
X-MS-TrafficTypeDiagnostic: PAXPR04MB8733:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: drUfS1Rp5ZexPn5GDsg+NIPWfNPRLZIjUEu8djkoCJ9FZQQ3QC9jPc06+QzPioRjY8ModRHlfhM15gnU1Mplrf2KiDcQ6q2Zkiuldp9y0nsYJBRnBT4ip6vJXHdcRd3m4PhjPbyFF5CCV/2ux/zJ2wUNJNlXXk21NcU1pfX8owIIzsQJqE9m6wNh4xWkLp1ZHLHTpIqa+JoOjbVe18MeYox1fUCidkPUCMi1SAPlXO5+MjmvJ0JWYkPa2TziDECMHH3KE9mCGsawman+6ECCGDINMlj5W95NemO1w99Kdk0qDZkl61Ap6SHEG1Fc2YwnM3g7EVnTM23aURbooqTnLb2tlsQAZc31Q9P3s8c0sLm3VLKqG8nbCEYN9pxiQ5REvXg1/D31X3RMFfEXloijILZ6z7DYmej9OK1ao2VTraK64uolMXv63PEdn98LiL3+JvbtZZdzSvNyCykmX1EXCWPC3KY3fsv0vU36HQJ18qa89dvOg8kPnEWZvcf0hYY6XI9jPlpIcgGuLxtQnqomm7KdGu9tUDmcxiqjjPzXHTL3UKvd6JM9Z8lwOQTndctwFQUGcjNr1S40GGd4prZsiZMbAO7DWnOHGtT/iatLOirEiU5Lr6aepshfUi6PrikUC0moHwmKbfyek3uEtPUyKeTq+KqZK9O7iqLI0FNpUw7ac8amHM0tW4Cqd2TjlM6PW0rNqrpBEvvwuHEiEYy1v9JpUD8GYUqsfXrMuLRtwPe9k/BKBdss0vx4DoUjAo8kSV4Apjr7LL41o2gMDowj3pl+8IqjLzAMajU1wZlCuH57a+hRuQ1sBmR6KNzEIccdFs0K0EEhnWyFOEEPYUFalg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR0402MB3894.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(38100700002)(316002)(1076003)(38350700002)(6512007)(9686003)(26005)(186003)(6916009)(54906003)(66556008)(66476007)(66946007)(6506007)(52116002)(83380400001)(44832011)(86362001)(2906002)(4326008)(8676002)(7416002)(6666004)(6486002)(8936002)(4744005)(478600001)(41300700001)(5660300002)(26583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p5g409xq9bIAdlku2Bv7INGZibK5nlsW/uoRHVQr05CZv0tBSaGEgfpUsNE/?=
 =?us-ascii?Q?o1bMCJ24T4Y04mtTb5IZkLWcI4jOcuROt2CJIatm0Hejv3oeXCkzcUQQM/5p?=
 =?us-ascii?Q?i4Q75Z2tM69KiFid4bDM+SWTQ7kPsZcjl9dZcLmSGJQr9q4JsaqIBDpR4djC?=
 =?us-ascii?Q?1duP8lLAycsEugoaaxt9GlR/nfQShmSyD/rvVPm7QMb4YiRyVpF5tSQgoHbj?=
 =?us-ascii?Q?nXqQ/8PZ2yaQSJqQm5iI6cIRDHyiR53UwU7CNPZ5rcqPYmWKjxoBV+6gaeSe?=
 =?us-ascii?Q?DtgiDgxnpHi1Qhj/Ow7RvCAkXwRPc0OWpxtbzB3WTK5rN2eOvUgWLSxJPsAN?=
 =?us-ascii?Q?c0QiTg2GRZ94XX20z7ZFlARYEo2bFD6byUsq3wy+SARUc2NaU9bjGOl7tI8S?=
 =?us-ascii?Q?j4u53yJDPfM0+z/Be6zI4wklThQPgpyXzb7OqnxVU6WjF07aJDibDuN6BL/K?=
 =?us-ascii?Q?aErpSKzmu4a1f4n0+896OH1MfU54J++O8mBFcPryx5Z+F/vO/IwiI0oHEgaC?=
 =?us-ascii?Q?31WCh3E2BfddRBwnTpw/s/iiVqfC7aC1cZu73uw6JL296g1uA6Ow7lIVaY7r?=
 =?us-ascii?Q?NFwE42ktId3cTLUhJTZB/4ZtgWQIGFuh0Y0F3BwUhfbX9mkDgH08FYLs1Z5G?=
 =?us-ascii?Q?rML9taI/gncppYQ1Qt3Cz4n9b84Jrz9W+Cels+XvTCOwAxR/ly5ICXMXQ3F/?=
 =?us-ascii?Q?CMmstr/VGowcJbjHA4bTHsXEPCeE5mQcSC3k8nu0TNPCFyY6Q6vTPegKBb2X?=
 =?us-ascii?Q?a+eW+hzsfFIj0GsoanDHT26kyHIhmfqcMHOmsxecWHotb8E52l44bvkTfUaE?=
 =?us-ascii?Q?OM2OSN8Fiv/rYRfWvVZDQHXyum+7DIQGJiKHdIY83EhF0oXmFDwAr4qlTr2/?=
 =?us-ascii?Q?fBKdjmzs7oYUySRx0xzdxVnmjKbAzQX9AoAxgOWPrt7G1Fy9QAlWTUfXYMuX?=
 =?us-ascii?Q?Y/L/xqkrHNvE7TrdzfCdrYpALgGl+SYH3Pd9ScKhuIcfvLlGu9pcaCfTBjFR?=
 =?us-ascii?Q?b34pe8K8p1J0PFzh65ZzCXeNnpz+H55hh+GuDriJw+qZ3nsMMKuSY7BaHDJN?=
 =?us-ascii?Q?Vn6kERvGMtUeRK9IxXhAqU8X+gHVfOY9mHYPEa0iTkwpvlhKnnjpLVHUjiS1?=
 =?us-ascii?Q?Js2Rwkf4lbjTHsLhWno6RBqpA8XSW8EChSeqTR9QG6mGSFL7FzGBkO+TTv0Z?=
 =?us-ascii?Q?lf+5TZ1QjAAgy4fG7cVVa7JxHoyDDJjxWdD5n8JVORVUPST19H/nC31d+Z57?=
 =?us-ascii?Q?x3htBKF2rnLQgakOufuf9t/QlZnRazmq5bBB9dONQF+fgyqvWBdH4seBssMe?=
 =?us-ascii?Q?CTvZKkkSIeLRZ+rqvO6BXZGfGe4lOrBKQMPM4uiXjCZiSBV2bciGY/hQC3Lt?=
 =?us-ascii?Q?GKe/BiDNVPRqkPcR/zsXkjl2PvdLO2Y2DC0bw+8mbCkOUuDFARXTBDOfN8Bu?=
 =?us-ascii?Q?oL2Uncc6fT61twlOn4e8WPnkS7pKssglvH5EnhiahGJPyES3BqplilPe53vq?=
 =?us-ascii?Q?GoK7xN5YI533kAx1v+7UncNOlsePp8/qn0/fKBCmSrCdcufVUQJHfsGU+7va?=
 =?us-ascii?Q?z1o/4YN2pgSuECDORH1+9bqTKsdT8CgZ1Mip0tKawQJy2a/dlnKNtR8ykffB?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 817f8c1b-e960-4403-a192-08da761776e6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3894.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 12:47:18.6559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMN255p5P+jehRXOYWJIBLzIu6LduqCrH+fOMvIXbgfVeKF1dcqPo42g6MoMcWhSIg2fb96Hyo8pAV5o6i3I6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8733
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 21, 2022 at 03:25:02PM +0300, Laurent Pinchart wrote:
> Hi Laurentiu,
> 
> Thank you for the patch.
> 
> On Thu, Jul 21, 2022 at 03:09:12PM +0300, Laurentiu Palcu wrote:
> > When DCSS + MIPI_DSI is used, and the last bridge in the chain supports
> > HPD, we can see a "Hot plug detection already enabled" warning stack
> > trace dump that's thrown when DCSS is initialized.
> > 
> > The problem appeared when HPD was enabled by default in the
> > bridge_connector initialization, which made the
> > drm_bridge_connector_enable_hpd() call, in DCSS init path, redundant.
> > So, let's remove that call.
> > 
> > Fixes: 09077bc311658 ("drm/bridge_connector: enable HPD by default if supported")
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied to drm-misc/drm-misc-fixes.

Thanks,
laurentiu
