Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6576C40B73
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 16:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D89C10E0DD;
	Fri,  7 Nov 2025 15:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FxXdlNjf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B876F10E0DD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 15:58:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGHAJ0FETQo6r96UbjA2VwMGb/JgEFTSuXI27wMhpm9AwnuvhLnbpS1XjcjyU2LnBKib0WnL9tvV0UZlQb50MJI69hBphFnyirwHJbKkZvmRTTGO0jEez9l4f5WRgDDCqBvhNTlletH0WrpiiiqrTXetxZLU4wPAOTtV32xJNR8DlYbyedWsd5UqIu8LUg9kC7vbf9CmnZ9QqVhnEGzQ9+TPCZzlSrCFSJAmZe48s8495y6+qpPowQl4V2smnxNvbfgmqg3hw6F8d0M3eRTcMgjZ+Tokg6y4VT8PaRsD6kAXbTKHL37U7mzW88FyCIYSUfoD8vynsU+ov5PsJEE+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8arjA4Js81pjpng5838Gh/Pt8912EmX44lVjEzB8ZY=;
 b=YOBk9OA6le/BxK0O9Gm6hAxJ4hhdFr1mA2MkWU+oFl8ISnB/Ug1OHSZ9waDhicBM2qHWbuyhLaM25vdhnPkdvInErlMwtTHDift6UP/NE1ZI2VGWG+EHOS9700u9Sp2/eOwUnsC2v3tl7GYpAkn61xzelzpHODnKY094SF/hqMh/uCP1NyUXyQ+pLTfOEUKVgY8yUdgu8d5M4303NXpnRyxH+uSytsj5Jz0EORVNLol5+rKYXraSNBo9kjyMcWnVSYtbcgCbXvp+bHdEsds1GMCbsJ7aRvwy+hl7TJdo/w3AEQVNnA+rbCgSGIoRDOCjtRN7rjjeC4qai+dUnTu7eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8arjA4Js81pjpng5838Gh/Pt8912EmX44lVjEzB8ZY=;
 b=FxXdlNjf0MdrNZhNGlOrYVOC0NK2RQ1YOY1ZPY/y0D856+GNh1/pjKJL9iPfvVS0LHoMkfSuamnC6/qwDV5ntfaxxhrQLLgy6lSVgBW6+f2WCF4EIZtCMnM1MevGD1B4PlQ93Mo0MVf+PbC+zRbWLnFoaz2RxAL/I1PgxZtFQaS8M1bx6dXXuMBeX2qzxQyUO/A4pF8BYTWcPP52hUaewsd9bhd9fF9zTh40kVq3Li75rmruFusAFKRKDOxakwwVAL1QBX4qzu3cAG8aARH13C/m/JsZ3HehfWd7plyVNeAQ8cusvhBmdXevPIxlkn57kXLgwaajpHd/K9QgkkKfXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DB9PR04MB9673.eurprd04.prod.outlook.com (2603:10a6:10:305::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Fri, 7 Nov
 2025 15:58:31 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 15:58:31 +0000
Date: Fri, 7 Nov 2025 10:58:21 -0500
From: Frank Li <Frank.li@nxp.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 04/11] Input: ilitek_ts_i2c: fix warning with gpio
 controllers that sleep
Message-ID: <aQ4XHWtxukLuSuuB@lizhi-Precision-Tower-5810>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
 <20251107-imx8mp-hb-iiot-v2-4-d8233ded999e@solid-run.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-imx8mp-hb-iiot-v2-4-d8233ded999e@solid-run.com>
X-ClientProxiedBy: PH8PR20CA0016.namprd20.prod.outlook.com
 (2603:10b6:510:23c::20) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DB9PR04MB9673:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dc0552d-bf50-4a1b-ea1b-08de1e167fba
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VCc1rxOfGJGvCDVTm5h2glhSXcF6P7dmw9BPu6FnZiqVzXeb8uEgdekHe7IG?=
 =?us-ascii?Q?p5Q1IeVlGAFIeFIfxs8EaeSXXNDiRE/9MVYARpAtGHrQ944RgN8rbsEVZj4L?=
 =?us-ascii?Q?NZA+8KsMvxDz4reqaqBOzMTNZNwafZjWus6bSeVs7hQMVm12Tcje5fZrN3yk?=
 =?us-ascii?Q?oC2a9Za/aRvAsAj85fUK6AcEl1YAfMyZrp9URdw3QKEK2D611odRRQFDjF3H?=
 =?us-ascii?Q?PIlkMMoTxv/gYKUeWXcRrlYr+t9cK7me79mgdTtD+kRyJ/DFwpb1CTAItxae?=
 =?us-ascii?Q?ZOy0xwBLGqdVo7eKFoiIqbVMnTlDY6As6w1rDHGKy1HM1oB2H6NmG6ByfBTg?=
 =?us-ascii?Q?lo5BBDWW7KHIbHTmMh4vqGu8msVN1zJYn7qbh60djYAbra8CrRZEMP8f9uin?=
 =?us-ascii?Q?/CCMdOP3DU0KcK9Hh6pdFhl3+yEX1MPwaxEm19vHMPW5S4YkvvWuppd41Ou0?=
 =?us-ascii?Q?f5fNR1oYOo4j6mlflKKAF/VHheP1xIWkn2autZBSmvXvDwTs3Z1YfF7Zt7y8?=
 =?us-ascii?Q?r4texBmHohBGGuUDCDesmjFuWJLmWMQQy/prM60l3tC0A21P8u3LlriQzIbw?=
 =?us-ascii?Q?MiMJTX0eoukeklR0Jx3LQ/IGcRlramLjEN5Ikootfr327S9Qe+oP1sE3hOb8?=
 =?us-ascii?Q?YU3b67Uk6qDSVCVEoGZ0d1C5rofhXQ411fSv76g6R7hdnSW9SrOobCjblWva?=
 =?us-ascii?Q?P+tLM2dOg80flnipLeUkcja8dQGeEyrrYbPvFdajeOHFXFvCpFzwHWa8Ezb5?=
 =?us-ascii?Q?ct9xrI41Fl8uuIf/cc43RY0nJUcKBs5Mgl3eJfWvEZni+0aDA6xFGWY0BmIC?=
 =?us-ascii?Q?8ucFiiwGp/+RzOttuOAvTk9C14uWEBPhi7oKde+eggig71XpFBomz7+DJ5TA?=
 =?us-ascii?Q?KvRHVlV3HWlC9X16+CGdfQrIgsV1ABHBINJ294PS0YgUrmFl9k4udkZseRsg?=
 =?us-ascii?Q?mZznqIY/IryFQsqZzU5F00njE/Sd6SJv2AHo+l9amma/96jEmWyXkT7y4NIl?=
 =?us-ascii?Q?c3A2T1mMlNJ0yAWy/EdROjpkj/oExdBfHk7ZaVkizgbSYwMZDjR8oNlj7YQs?=
 =?us-ascii?Q?F1jyoudW9eXFNJauWbpHmG7y36eo9uC23LZ8w4zGogLQjuWDpn+0mKgyhuv7?=
 =?us-ascii?Q?Hrs5hfw96ePPjyJ6XfqrNwP0lp4R2Mts5bsqjwgHKFU4Q6zbOZq95WBRbrHZ?=
 =?us-ascii?Q?Kjd8qx6B1COPERKdWm4Td5ziawMLljgtmkk3xP2F9fZKYQHzv+gB3OkAawMr?=
 =?us-ascii?Q?XDmGmXaj87pio/yTCtUDNer2gsfDf+QW1RH4urlGUPCD5+4rZWUad7EEB2eO?=
 =?us-ascii?Q?rWUy0UJzyL5Vw/Lpy2CvAlWj9yINQPBnfud1Mmo9TQvKLOBhtqy5N4olin9b?=
 =?us-ascii?Q?EsfgtfmJnyp39SlZSj0yAck2igadlzEd0r9YL/s0+Y2mhH+31eDLYARf9L6Q?=
 =?us-ascii?Q?in2aoTPOHUc8AU3DyN9ZwGfZ3STGmxDYvcfjfh5JcH+82+OhZIoM5urK3aYs?=
 =?us-ascii?Q?zSCWny8kDJ6wzAC7IlQ1k/nD/icSJT/rNxAq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+WIfKWuMC/xllO8eqh23QKj06h/cwWrhQHVu0BLGGS+I0XgxQMf1G1b3JMJl?=
 =?us-ascii?Q?/Qrl8tiGL89oS17zkC7V5DcJgI1up3uLQ8uY3R6g+8yRXM47jCivBWpSlKl0?=
 =?us-ascii?Q?/egEeU3v44ptEG3AK/5ByuuzvGgO637YQeeYBPv8rBtkZqqqis8DoChLSKvC?=
 =?us-ascii?Q?Nw3Q+YWrL46kkAIvbOG2h2awpaNrFuCArubR0cY3p6mF+odryw13qSii5HBB?=
 =?us-ascii?Q?KxVq6+EU9EfBWXijVVSSHa7l8EOlrT27H0H/cVwQO9CnArv5Zr1Lj8C4nbDU?=
 =?us-ascii?Q?PSXtsuxG5mrlBNBB7SKqDKnx+BJpVltmjoQejpRGKCczkaVxqDAeyIh85zNG?=
 =?us-ascii?Q?bqSvmuyc4dw4D22sk6K+/x97LoVQRSYMgdhDlAmsrLRAdF/d/M8qnXRCcmmJ?=
 =?us-ascii?Q?i5DeYCNGHYWLRqCkLVdl9R6g+0OcUE5MNsyEHdOob2zzmSNP6TMXTOG++Q6D?=
 =?us-ascii?Q?f2XsLhVjBxI59Rdfw8uIz4Mgzh67LFk2LQJwIE7TQuEr02jstUnBC63WXY9J?=
 =?us-ascii?Q?3DAalnQLrJiIByDxsdqujPfFBL7KZkIBAC0yioSrOVRW/pJUpTra94XHEdNc?=
 =?us-ascii?Q?UaGJSZ8ygoUsZhJFBmClkDprHUiCcDnWu1xNq9RTiiu0dQZa8bEaKppDACUG?=
 =?us-ascii?Q?hKmVT0kNqzfONh26MObVhkH20v5vi31aH60bITQ+P5MAG1je8X4yfpdIKE7A?=
 =?us-ascii?Q?zaMAV6rGxwFxJTLTlUchuxPcoljFRTI1Xkf3H0o17S60gAQ5X+Sg4pqwNNH6?=
 =?us-ascii?Q?gWnGwv72RpozCftw+W1YpwcqHPKyFjUrTw/AtPKZHFVSXJPaJYJoGuYMIis4?=
 =?us-ascii?Q?gMOD3mXyUYiTC+GmZB95YPftZ1mzA1/Q6RyQUEqmRy5KUGrCfBFHhrMT8G+v?=
 =?us-ascii?Q?lOdO4+Rceg7eSwW+LvIwcdmB9QAFldJ0tMR+Hmuiy1k4j9mp+PQ9L6BnROcW?=
 =?us-ascii?Q?w2Gw1Ww9Z1hTE4Syo3ybmsoPBgw4Thl/U05RH/KN6Tkd6/tS2azhj6HgqEsH?=
 =?us-ascii?Q?UcvWLBZTH0JNrpoBQzVAUR+ygjSAL0216vXGVlJmAy8NMl+k914sG2aRX8gl?=
 =?us-ascii?Q?7nMpvh3k0Y5upPh7qb1FErEcsl3Omrqiah+DoPMjbfuCDg3E7IWpwyt7Nv1t?=
 =?us-ascii?Q?w4sNlnMsLTivG6BP7Fpn6WWWISeabQTVG9hr2UbCxUzBiA6vHRP87Uwl6xGX?=
 =?us-ascii?Q?yhoWge6GKu192czooaQ7Rlt6223+VxavvXHDNi0RohZn6owkqIZe2o7ER8Od?=
 =?us-ascii?Q?+FX4SP34vCAO4VxLkd5SdPfLiSPlP9BY73wDec3/nWbKs5ZUwnYNAXDSlhfQ?=
 =?us-ascii?Q?GC/ODqzQwT214Q/jxPkAX3idEVo4Knaq+wV+urZ1kaL6i2haLDBvMFnAFgL5?=
 =?us-ascii?Q?J5/Hqkggj/dG+7LAmTLsf/WO2wZE0W/UXRyo9S+j+paZbwEnNjD4qq2rf231?=
 =?us-ascii?Q?lXqzGSxlJIPKYvtk/NPTI14StD8u6SRMkGE7NYVWcdQr3g+BcfqutluMnM4V?=
 =?us-ascii?Q?lsX4LfkGGHV8MBLzqNES7CGcO3U10vFsRVE2wX2MRrC8gRNRor0ha4x3ox4S?=
 =?us-ascii?Q?uQX9JplZtSHmLc5qSWHklDG2PFzeb3SGTUECdlXk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc0552d-bf50-4a1b-ea1b-08de1e167fba
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 15:58:31.6125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FA4MaF1+GUMApkVoBgyRMOVgO5t5Pix5l7vgs2Zh6MrwhPOmhnHCoTINXa17PCDlhxKyKNh9NIq2+Pn3MWn9RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9673
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

On Fri, Nov 07, 2025 at 12:46:11PM +0100, Josua Mayer wrote:
> The ilitek touchscreen driver uses the non-sleeping gpiod_set_value
> function for reset.
>
> When the connected gpio controller needs to sleep as is common for i2c
> based expanders, this causes noisy complaints in kernel log.
>
> Reset is not time-critical, switch to the gpiod_set_value_cansleep
> variant.

Suggest use simple words

Switch to using gpiod_set_value_cansleep() when controlling reset_gpio to
support GPIO providers that may sleep, such as I2C GPIO expanders.

Frank
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  drivers/input/touchscreen/ilitek_ts_i2c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
> index 0dd632724a003..8c5a54b336816 100644
> --- a/drivers/input/touchscreen/ilitek_ts_i2c.c
> +++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
> @@ -396,9 +396,9 @@ static const struct ilitek_protocol_map ptl_func_map[] = {
>  static void ilitek_reset(struct ilitek_ts_data *ts, int delay)
>  {
>  	if (ts->reset_gpio) {
> -		gpiod_set_value(ts->reset_gpio, 1);
> +		gpiod_set_value_cansleep(ts->reset_gpio, 1);
>  		mdelay(10);
> -		gpiod_set_value(ts->reset_gpio, 0);
> +		gpiod_set_value_cansleep(ts->reset_gpio, 0);
>  		mdelay(delay);
>  	}
>  }
>
> --
> 2.51.0
>
