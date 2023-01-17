Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AABB670C27
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 23:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73D810E1CB;
	Tue, 17 Jan 2023 22:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2124.outbound.protection.outlook.com [40.107.113.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F2410E1CB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 22:52:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecdbkIS5e5pcnD47APNleEfeEIheYN5uFqZ3SfAbP1uGDdbn6vKK0m89WOa0gAfdyi42CK9PDk/pc/ENDRJsaXjyIXOLc7lLZz1UPqWMxbEo/8pG2B5GA8QhACpRDtmdakPKwaL/S7Ff8MjoBdPRfoB+//w1tAi8JAiwKp2o4Q2LOczpuWwcSqvnrXDprjxHMRE7Jagvmcs7lEWyGVlzo+CS9ai6W6qcVlmlDtoWj/dTyWL4YnycesDMYgcZUu6of6KxnJO0adVRMyA7eLe1sWP5AUM4mJ1qIdoXsiSbDc0qr+dHJK0k0LNIvtRW9zMil/czRNM7T9lM8UjWf/qkuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/hH+tGbJuZtF85CByKB3t4EoTi8CvYAcYaLwC2SE0E=;
 b=U/aeDDvsHrbLshcAOnID6xCPHquf+Q25XYpbcUSsZVzRzvTnPA12uyLOpKgWCQwD/KicWzVc9Myy6IaWfFjFod59PENbcsQIm9ADmKa4IFnIDOkN+WsqVu14hp0AoY71Vx6JWThsANUKAUqS0B+XvY1oUxyKfmwlMyff3ekWF6C9cnGn6FEMgadx18yG/s53pd3dmdIZsn6aW55SPg4ghJxfP8xUHGl3LkwXEPBjmWVaoU0vgritVdHUiN0CJ/5uOSvvp6Abr9G48A9OCFGW8m4KHsUR8T0idxJ90OVo0eqniEzZQVzMpCOSydYskXc4E94kAZEZr1qndrtWwOb6nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/hH+tGbJuZtF85CByKB3t4EoTi8CvYAcYaLwC2SE0E=;
 b=PYP/0HLopJ6OBpVGhKHkIdVJ2BLvWY6O4lR7DAFUF8x+N90AMG+/s7qBBAJYuAijrkZkgkUQ9MGWwuPrdYeKxMyPTsX3IlyFxSdf1T0R1vz3w9+QaPNC7mpjtDu/m2Krd4VEgvVRM8ZaIL3ODQuyxUjyyWvNqBaZOnMqa1avqFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB6010.jpnprd01.prod.outlook.com (2603:1096:402:31::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Tue, 17 Jan
 2023 22:52:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Tue, 17 Jan 2023
 22:52:23 +0000
Message-ID: <877cxkdba6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/22] sound: remove sh-specific sounds/soc/sh drivers
In-Reply-To: <20230113062339.1909087-6-hch@lst.de>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-6-hch@lst.de>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jan 2023 22:52:22 +0000
X-ClientProxiedBy: TYAPR01CA0070.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYAPR01MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: b379b111-69b2-4922-9459-08daf8dd7ef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QfvrGbYcPVRDZqzEvw69I3/6c6y4wOmoABUT6hjIQ0LcPnxW5B+AP1BqefHu9U6pd8Z5Y45xZPLlNPM71u5BKTFjUjzDx6B+AgT0m5PRHBTxv2yhVCjC8DcjIx6bPUR9UstMuh8kZ/M+JGv9eZcemwi9zaMdJaaSqPd+m1d67EMBCsaRJHmgSXIaki2nbIeoKy6sCAqyNixO1jY7hDtxlPELZygbxbGotSxqAE5HihP2Sw1DunN9CS8P72zScF9i6TaKd2iAldxoamQ3Bi8ms8ZFNmVXVRFmYH+Wfx613oLR4ZOsHZ0Crz1oGQqy2/MU6Ruy0BVGyUXRToAW9qBAebcSiCWBAv9HD3rH4GJxyamHzL1o/wWNLCIlnAOjJ5vYXMEqmvp0qYnpUFRvn+WAlkLlGK4HEDYAyyzsLsmHBmeXJiTLu2E7epjRXwc17iBLFpclSGVTE8R34sdLqVT8lFdJcMhdfdX3XM7fXnXLw+5/Hk0OZPsYOonlHsBF3DpQDL4tDPaowNDfxa5zKVeQ1z7vX2UdBEumZJ75gVrP7CUpBY0lklpw5H3/Q8J58XPw2sQ2v+qHQkmKtr7FXajRalxr0TwpvywIuxvadA8OQae9Hgs96+tq3sMUUXJRLnR6xffoMd2gThesQQyqsPBu1WrD5TDHPikmMoATcS2yw8CVuZk3Wq4zGAgUS+dMyXec
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(451199015)(36756003)(41300700001)(66556008)(2616005)(66476007)(66946007)(26005)(6512007)(186003)(6916009)(8676002)(4326008)(86362001)(5660300002)(7416002)(38350700002)(8936002)(478600001)(54906003)(316002)(6506007)(52116002)(6486002)(38100700002)(2906002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mZOl0elRhwt/KGbhGU8a1THpk6ytUEPKVJp140gOHJFbaPRrzSxXeVoa1oZZ?=
 =?us-ascii?Q?IYomH6N4sZjvo6EOL1eO2Lq2VTXH6gvy/bytgluorShxS6ogxSiYb8OMi0oB?=
 =?us-ascii?Q?wUGuebwXhnysR3O5ckcV/Qq2MlOn91hH5UhqFu80F73TEG3Ei6G5+ug95R42?=
 =?us-ascii?Q?7otfnLYknydYIoOinGDfLgUVBMACiheyrXm5EFcS3ZIM6F7+1jKD7Eyqpsms?=
 =?us-ascii?Q?fasKOBH0e1FJGCWXc5LA3md64OuHd1ZJZDjUrIIyVPjS/7HfYE5GmDI5GW1P?=
 =?us-ascii?Q?BMgEbXtbpdTjjvOL9KNuix1r/h2rMl4CqqyM0ENx919W4GmVCJqqhsf6AE23?=
 =?us-ascii?Q?p0jQVQhAzBfLblmv3vYGGL+VL6wzKM6/O2RJz2XwK/lCTdA6kyfw1xzEKCAL?=
 =?us-ascii?Q?rrC4aDLkQoxBx3F5Y881Y6ukI34yBg0NqTmWHcVDNrxFwz8moXvkqHE848Oq?=
 =?us-ascii?Q?fr27sf8MLKeiuUZzFhIETinxqm3kaROXn3kd/xdLHl+QsYjEa90Rd+iM2fiB?=
 =?us-ascii?Q?Via+4zYpLFPGCrPDHkuIJH+4Ex5uEUxIPqRMiFADRe3aJWdxBjNbOkv9ClNt?=
 =?us-ascii?Q?PjWnCBVc6uxCMfG7jR8zMm+g1PAViUga/hWk9sYKjv/ji9efwj5NmbeNd2cL?=
 =?us-ascii?Q?tZwBQa1Xg1qMR2eqz2d5+pf/fYnppHdD12VHWYWrZJPkMlE+qy/rRBMG/MQQ?=
 =?us-ascii?Q?7+PovCtLT7C9HykZsbY1T168gAQ0svOUkjmbjkHnzKvybkn9qRwumy8cYIey?=
 =?us-ascii?Q?cOfPqd6NY7jcSw1hCKels9F1SVpnx9j4zzmm7hjte2xLvlP2avzN/5nrvPZV?=
 =?us-ascii?Q?0vgHJIJ/T2ojiDnuCZxJqRKVlH8IhppZxiQZTqipBpcxcx03UvTUrb1kAsBN?=
 =?us-ascii?Q?eXObdglw9mH9JQHCGZSwgHMl+7J6pY4RrXheOUBdxAhZ4dA9XrGGnV0e4k2b?=
 =?us-ascii?Q?5fi5EawJmOpgYpTvrZ7GypK+0gUkXIysvedbS2Cs04qRXiTS/EBp1Ch59f6F?=
 =?us-ascii?Q?LXNzpXOWQO7J4gzXJpDuMwHPkBh9d+7v6Z3BKnFVwhw/LCuqxU7cMn3WYNEY?=
 =?us-ascii?Q?neUMQfFNNssM6C+uviOPSgFlsbdEmuA9HiAaAqjScsFsRvrxM9WRZNWoFnTd?=
 =?us-ascii?Q?cDkVREQ6Re2NnYyfxNCurBNjPmnhIxBEnk8NZMLZNGx/rnHL73h2PrOq9SSR?=
 =?us-ascii?Q?PTQMQ2xnWCIfTHBgWTrkXW6tzVKeJcCVZ1HPZo1jDXm1IQadXcKtzesM8gPy?=
 =?us-ascii?Q?rSI5MIb/+W7YxdmK6MNVZ15DmBhWC/D2kBjrHHl2iB+3RG+94rbmU4xHoj5x?=
 =?us-ascii?Q?ff3/NCy/zHpGbZEMc1SupvMx4iIs4/tiwBNQV5B2b2h/ESdLg2A2KmoyJIvG?=
 =?us-ascii?Q?mDxRfOdRBR9g67CX4iPKpRNT4v5vF8LcnxhLpECO9TjQ6wBULvYP+lKRQ0w5?=
 =?us-ascii?Q?kvKRBRKOfDM8RPF7SUSr1wRswGXZTd/x5o4KG1mUvkGHFlYdX+ss2q6WRT/H?=
 =?us-ascii?Q?AqvE0KztlecLLtgCWBNpQmbEdjc9s7G1BjY3Wb3v/1amJ5j2UhYR1S8VEF63?=
 =?us-ascii?Q?rqQvakXf0/xvQR09nxzbsWImBcwxTLatRZJPkok+xiYCKCYvLPRjLlVdXKKl?=
 =?us-ascii?Q?XU7LeAeHdmrfSJsu14tKvPc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b379b111-69b2-4922-9459-08daf8dd7ef3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 22:52:23.0355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lj1mhU1Xlqt+WLwQ6CnlFII94JNv7so1T0iRaWrLBwU2hRYWSAXB0a+GQYnA4yJWzF5ZZrUJpX4Mux38JDOt+JIx9SvQMIOxU3VNEh82Bqg5avcw6VR/JHbrwjA4CTnZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6010
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-rtc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Christoph
> 
> Now that arch/sh is removed these drivers are dead code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
(snip)
>  sound/soc/sh/fsi.c         |   9 -
(snip)
>  config SND_SOC_SH4_FSI
>  	tristate "SH4 FSI support"
>  	depends on COMMON_CLK

You can remove sound/soc/sh/fsi.c
It is for SH SoC.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
