Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3178B7AE5DE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 08:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5570210E0B6;
	Tue, 26 Sep 2023 06:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe16::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8253310E0B6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 06:28:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyfFSae9cQsPEcQy1jD+VIwedH9Ps7Qx9SiWIl34FLaxEqq7Oh5sLZtxEOzTFYEDy/E+oB4WnvY0t+0gyHh0OdMwzHMetgWTVTeOU3XtbPlDn6lHXs3bEeHw24I9wF5Pd5QNvbdXI5NLG8J505TrhcwQydk4IRnBT76IG393hXIQtqSKDao5GUEvpnlXY5MuvFJfaT8k3b8PmnRz7vDiRiF0E0q6wAAvOZ2ggw5ZHAMsQtTpQFHQ/9nVL+fKFwmCyIpFG+LPGj5Gp9HMpNnlamCczSk3LJZguzb5e2vvczaLvaKeCfKW8N/hJpAOPII/whm9hhq/gZvb/OZQ65kl2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwS+WLRhVEWDotGTB0W0NJVMD6IE9HewF8JIo+EeZKQ=;
 b=Ay+UylYB8V6tfAEkZYVx7MAMyY6bwb5UQE1DSLKZoJwgHGh4P90vbVAHcuuJh3WDc/44CWJcH1xZ3X5ol/t9rylocVcHeiS9zRYRFbX06Qu72HOUHPW5xKZj55FmzFh0fWvKNELkA9WU07pEfSJBRGpf1C/XXUoJVVYxSBtnoJG8ivWpzwSBPAGgaADgEE0+MI3MfAI5MX75N5BYm0zNcdjYVKGr2qisCYxB44nA9/I3xQ+LnFyGDqxiMegpE21bEZVkb6ZSZWH3Xbhwt56EZH5pUGknHVB42LAfyx5ca+fjayntngl47W/oBg5Ltkw8w3bmlGEL2Pmf/BM/bKtiuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwS+WLRhVEWDotGTB0W0NJVMD6IE9HewF8JIo+EeZKQ=;
 b=OqC+VgcZgBUxvHKqLocMm6bbRQy7KdAuwsdFSWuP2HzG7KdbVbvG6zU3g/CuvBfO1oAv64cnjlFILDOEWaU3kgLAnwiw0xt6SAIMHS1AJvEEERQyXmPYbFeivmXLq0rgGghxDm+8YhmkvVLspGvgr+ycFD39LWaL+czZxnnAauA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by AS8PR04MB8310.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:28:25 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::ad16:42a5:193f:6396]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::ad16:42a5:193f:6396%7]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:28:24 +0000
Date: Tue, 26 Sep 2023 09:28:20 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] MAINTAINERS: Document that the NXP i.MX 8MQ DCSS driver
 goes thru drm-misc
Message-ID: <20230926062820.ir4j4plavd4vnjfb@fsr-ub1664-121.ea.freescale.net>
References: <20230925154929.1.I3287e895ce8e68d41b458494a49a1b5ec5c71013@changeid>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925154929.1.I3287e895ce8e68d41b458494a49a1b5ec5c71013@changeid>
X-ClientProxiedBy: AM8P191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::26) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3902:EE_|AS8PR04MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e4ccaa-1f53-47f4-0eea-08dbbe59c93d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w4Q6+DrRs8x8WfEIaoUu8kzqFxAdRz1DlygyFU9VO60wLewhUAyAKV1Po49GfA7ufwllOtz+i3vjCF1LOuN7R6bxK66KVcvpU9YWJN184WmWPxu0klEHwiRjUAoVFaT5fTORsenLwA/ekAwlEo8vX12kHr6H/zYcQKf0i95BNWMSr2VxubrNUTnxPVBukJVJ+deoBNBNFUD/m2ICHy97joaIv82yB3S4VRjkXD9lNr/x8ojqgoqg2FtLKJJuVg6AlmAOu8pYy/1ZkE/XF+gAXjVq6wiYZH334X13kNhxoPDL901SqpjBdTJKObu7RK6kcyTnn8Ec/AHTM1mC07eq2LiEoHZMBq2hIY6XIub+TcwPXAQqAidhDtstc9XGB96o32LTiKNAK6sfEKDHeASBVfRkZcwON47mS3b9DVqt6Dq2VfiI3Fde3qNnfBvaq9Ydp0NzZ2acigy9CX5YbM6CmuMdNjdGdHMLqHwFVBYp5hGY9jt5IuTtg0Tvrrq48K/Q+/EM0F4pR3VHAB1F0M8o76EBM0ofnlxH+LDc4FZY/LQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(230922051799003)(451199024)(1800799009)(186009)(5660300002)(4744005)(2906002)(316002)(6916009)(44832011)(41300700001)(8936002)(8676002)(4326008)(66476007)(66556008)(66946007)(1076003)(9686003)(6486002)(966005)(6512007)(6666004)(6506007)(86362001)(26005)(38100700002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Oi0L3cCYMC9bcJJsAh6lTIvcqrFtiTQ4uiTOLhgxmjHAmO6RNZcb1nv22Y9?=
 =?us-ascii?Q?W4jKZwK82RT2pZ+Jsr6JqkYfwSI7ST23Tm0D5Shd10puEMX60v+wIzYQXOot?=
 =?us-ascii?Q?Lgx+stdcmGv1orvv3pRyiHjOrxKRsmaelqKNtqPtJPhFmIrkPypN8ww0GDQ3?=
 =?us-ascii?Q?KMRfxTVqfYRPLTgv8wje0/h0EbDPmsRnS2a6o1YLZPrQnQbvxHQqrFlvBSaY?=
 =?us-ascii?Q?tC8ZCqUxm1CLBRd0KD1rL8UEXv7aDxkpWFrWQYUmLmZVh/NYdvBmAUX7p/iR?=
 =?us-ascii?Q?8gReqbyGAukP+3NP+ZqJ/INVnYQFwYdRThiqxsoKPYYJ0lUQi+/KTRoB4Ef2?=
 =?us-ascii?Q?lH9Uz8f6y73vvdtU/tTrvjhsCT2C4JDLta86j8Lr4EuUVyI4+llIPyGwzB3H?=
 =?us-ascii?Q?kqD8IAtv1ve794Cy2+ZN+oLzCfX305EKqb8Tenlt0hiFmSqFLxDK4PGmdvyj?=
 =?us-ascii?Q?ncM+Aocpu+PAHVLvl2QJkc8Ctr312ejtC0eRFFFy5Nr/WDkKfcxi5lBJEPBk?=
 =?us-ascii?Q?DvWutYJKJkVKBAQZC90NucWvPX/JkyoNJXrxB09wp8hw3Yl4Iemma2V1TGW0?=
 =?us-ascii?Q?qstgG7CPHk7U0o0dIZHHRX3JgLB6Z5dn0g4NQrSvNMdBPmLbWVxNm4pE2ZiP?=
 =?us-ascii?Q?zsFolwkCGhbWLhXmRFEPu1By/+1TzouDQWLa+rpA9N0RpI3VWkb4lcR9CBiR?=
 =?us-ascii?Q?ndY2VKh70fYA19ZUaqnhK/DIptwmTENU2nEnOXkVKxyyUr2O73o1H14Zk1Dt?=
 =?us-ascii?Q?LW+amHK7sTiQy1w+ctFYDHEnIQUR6g5KPT9jxWa/Vd4oWE7Y0q0hwM5UcKay?=
 =?us-ascii?Q?LfHQegrZOgo1jJSPrqA34wmlrzMaxb3jk9cvwHSUczGb7J0nIaybiIdzYAgi?=
 =?us-ascii?Q?O4jYS+7vUCWap4gkESKHY4WrmArb7Ivlz6QaF3RGCUvR1hFn2UVW48dGGpQD?=
 =?us-ascii?Q?M7QoITbsYFJhNIcwJTVehjOrQEDSP+O97p0in3M/ClCMk2kjjsjHjrpG88lj?=
 =?us-ascii?Q?FAAA+PiC2KQ9/q5HQHkO8SNFywghQNjcPdlqnbqFNL+PCiBqCi1X0XqSar4Z?=
 =?us-ascii?Q?vnZnUVQLqH36b+BjWmgfB8k4TVufy4dPIi/JwT2FuC6dKUuV7dBBomeJe0p5?=
 =?us-ascii?Q?vjHNlhYRddDevr4Qw8TFdEWKsvPYEyOCIbk0Ug6qQAFRJm0Ged/2/6Q6vOUr?=
 =?us-ascii?Q?8nMZiL6m7mWbA5BI9SK2aZ888K07k/jySNvFlDh4ylL3FrKtj22OimJ/eQWo?=
 =?us-ascii?Q?R4ZO1T6zYjf5sXxUGl2SU189b/hhq7Ve0UHhg6IpgNKYO05CGvvNfi42XEOq?=
 =?us-ascii?Q?zrm3N3PzMGAn8UrnAzgAKGMWmoDU7Gj2D9KBCgAhyT/rJy2fEvixhRwelf1E?=
 =?us-ascii?Q?PhQ9lisSoAlCH6xVMoMEPaAd+29dhO1og2bobGH0vm4ZNdT43N5rTnCwJmRj?=
 =?us-ascii?Q?Lx5Cm7N1GFM2WIkFoqEdr9KZIr/5/cNxDei+tddhFV/uuRRobI7WFR6TcSdN?=
 =?us-ascii?Q?/x8nD86zWczudWlb+YpEOl+hk8DWrFLlmeRfOp/VGi1U1v/LcOxW+9LAg2kF?=
 =?us-ascii?Q?/LDZ6EPi0SavCbLLpyHEUoJEkXrBbzvhIaadFw4PMHepjIjfeG38N6sCe4d+?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e4ccaa-1f53-47f4-0eea-08dbbe59c93d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:28:24.4453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9PFwQ3BiVIO/2Z/UIyKNKFKPHxVM9NsOOR6MoonUM3agqDCBdmNhH2NFeZ5HmzT1QmVbCejewcpsic0MMVW+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8310
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 03:49:29PM -0700, Douglas Anderson wrote:
> As per the discussion on the lists [1], changes to this driver
> generally flow through drm-misc. Add a tag in MAINTAINERS to document
> this
> 
> [1] https://lore.kernel.org/r/20230925054710.r3guqn5jzdl4giwd@fsr-ub1664-121.ea.freescale.net
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Acked-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Thanks,
Laurentiu

> ---
> 
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d72d3af551fb..d20a375ecd7d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15225,6 +15225,7 @@ M:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
>  R:	Lucas Stach <l.stach@pengutronix.de>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
>  F:	drivers/gpu/drm/imx/dcss/
>  
> -- 
> 2.42.0.515.g380fc7ccd1-goog
> 
