Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F366469CB48
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 13:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B4610E1B4;
	Mon, 20 Feb 2023 12:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2046.outbound.protection.outlook.com [40.107.241.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D346810E1B4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 12:47:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/fleIHgCfGEpYVBofY2ZaAwfy6Eqh1J+9DZTGDfmzcsONooWdAOGkBtbqkV0iqQ12CZY0XK6+7tSByoDE7cj9Yi6OKvQQ9Jwr6JolNCr4mMyyX3u3Y1yc1hrEHmCtG8bAmtQSKhk8foqGlRIppLvJ5wZPRthaKtf2H90bjn8+6mHaT1mdq0ibeyUwN5EQt78Gavlmqclf7t8WlK2bR7eVRcxPKq7ccyLmatfjigRNXOThu7QOK6BBM6Ae8/I/Bkgiq40hrIbAJGYwAZaXwo2Ph+emGq5oqs2WT71qMlJTNJ2jxD7c4GiO3ry0LirhyLKp8T2bXMYWMp/voUsTN1Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKL+polS9Q0ukkQR2IGZw9aBIqzvtty/U3PJ5UBpyjc=;
 b=SQmrYuMpNOkpgSGDGSD6sdaqxfjNa9eyEBL2iwoDEPIMYE6cCa1mBCpOlU5hTQls44dzawBZDpc0vLdj86bNW/oQVDPkPPTu/4eQQKhBNkrrYN4gFVsYIuN8ODz8HiSyHWnCcCbVmIa4/HlNhys/9eBCQ3ITGLZVkDQTYiL2wTdyBFcUMn7D6YfQRv8UdsGl8vxF8YzCpo0MJvdEs4xz3NwVwDeUansP1oM1j9kzGaFP/AuBwRFSPeZzvVYB54rRAgea8u4QRal9jzmk7h8K8on9vHjtuFu3fTLzsgOARwjxN2HgkZVLGbh0HoYfEvXCiUJ2yn/t4gWKS3KTpe1n2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKL+polS9Q0ukkQR2IGZw9aBIqzvtty/U3PJ5UBpyjc=;
 b=T5dzcgbt267u9k0xjLOoHkjVnKIegWMV1imiYXWIJXYlBrebco+ULiywgDFcR/74WEB1+kgbkYhbyDlVmE5/ROrVfgm1SwXfgRyD9+151iKIsLiZpOdlQnGpOlFx4jj/KIQ7KRzdQnQwOOGfn3p+8gCHJvf7qMn/5hEFo/hxGDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8260.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.18; Mon, 20 Feb
 2023 12:47:34 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%8]) with mapi id 15.20.6111.018; Mon, 20 Feb 2023
 12:47:34 +0000
Message-ID: <c1e4f2957772addc7158c2f68572000b31187e65.camel@nxp.com>
Subject: Re: [PATCH v4 0/6] drm: lcdif: Add i.MX93 LCDIF support
From: Liu Ying <victor.liu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Mon, 20 Feb 2023 20:46:45 +0800
In-Reply-To: <2871322.e9J7NaK4W3@steina-w>
References: <20230217065407.2259731-1-victor.liu@nxp.com>
 <52b8025ee9b71dfb147127bd1cb2c532d222df3c.camel@nxp.com>
 <2135575.irdbgypaU6@steina-w> <2871322.e9J7NaK4W3@steina-w>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:196::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: 82656551-ca74-46d3-e743-08db1340a322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QubtbVnRSgnmpFxzqKagaPx8zpFp94VaYlv7IFBBuTttjeCwNcJ1K1FZSnv97e2sFi50tr87ccIsjihwJ9UyoCPCro/zj9ensf+eeh4VS1jH4SU+MUIL+LfBMchcRNS5kobiLr4x1j1+PgfYdBSGC5r2Q0poyVvrXv7xwZnVrPM5eu0epQIta/TRMtP3ETdiEHjfUhXCMONSAdc8oWa5m2+p9AKs83WOew42487n+D8CStjW2aQcHhZrGWRlf/pnfOcMW56R+p1k3WWtAWKje9h57laIgXQ5L/mIYFifXpRx4zpbtl1PqARYJpRLZWGGkopADedK7MCPNZP8IG5NmBNb83iVYHFIJ0JmL7V270sFrkEvPJAihWIM5SqwOlbCJGFdocgva8eltYoCUtx8tBO8gGQ7fUAMq+Fv+omZh47sTXHNDRZMdX2J+L7POTA425lvXO06Lr/2rnd5n5PoAWlRz1OOOey0GcV8MU0oRvZTiS+Y+2AoETMkMCHz+xTOkICpwnsmrqiCfvFwIsfAjTlY7TwfPxxKJkSZWuIMiluBfxNwz7lHbc672nFDa+shCZ3WDW+rdYdOSOLSHKoIwmyrNAbjL3ikKeB5EGWk5FIbHQK3s3xLstdNMlvQfVGC7laRu1qC+rGWn8pDfMdbTA0w/Chh0xQIyFX9GzJZzUv76qE/ISAH5aLJf4OnEtky4uI8zA68pdbed/hHgvB/1BxyJDMT7bdTK8EkqURPW2g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199018)(66556008)(6916009)(66946007)(66476007)(8676002)(4326008)(41300700001)(8936002)(7416002)(52116002)(2906002)(6666004)(478600001)(6486002)(6506007)(316002)(19627235002)(186003)(6512007)(26005)(2616005)(83380400001)(5660300002)(86362001)(36756003)(38100700002)(38350700002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em9hakw0RitsaFdEcUVvOEFCaXlhY0tlckF2em1aRXlBODdFYWFqczNZYncv?=
 =?utf-8?B?aG9sdjRRZlBsMmFKVDVHZ3R1YU5zcjBBNHhuTjJXUm9wczdFaUwrNExsSFZF?=
 =?utf-8?B?V3pXYXVXTkFzNkdEU3YvbW9TblVhYjBrL1lkZzN4WVlpNXYySHRDR1JxSU5X?=
 =?utf-8?B?OVllYzgzQ0dOZ1dWQmhvaE9PQ0ZSYzlDUEI3cTArRFFqQ3hrNHBrL2s1dHI4?=
 =?utf-8?B?ZGtiZitoZHUrdmN2WFpsMkFiVWVQQXhnL0pQQVpNQk1IdXBaLzVENjJNSC9Y?=
 =?utf-8?B?bUJKbm8xcVJybzNrNnB0T25RaGFDdld0UnlVUU5lVUp5NWYwemR2OEZJZnh3?=
 =?utf-8?B?WmtVQzJmZVRFTHU1WXdGY1JNSVlFRStaeEJDR1pTVTR5NVFPa25vSzE5MUtq?=
 =?utf-8?B?UnhuNWd6TGR2QWptWmVBQnd1T2JqNE5UUk9Iak0wNldLZERoMk1BdFBnRmZE?=
 =?utf-8?B?djEzc3hNYUdZZmowUWhHU0k0QXhjTDRFendEOTl4aDdyQTU5UW9ySFYxNmw2?=
 =?utf-8?B?cEozK2FHeml1NE9SVUhlc1pPeG1OaEs2NnE5R3lXYTUvSm82TktyYUZtYS8r?=
 =?utf-8?B?SlYwSjM1c3dDN3ptVUxnWUVQbzYxMXBuMUVYbG1qYThadGE3aTlqZkZkbmtT?=
 =?utf-8?B?MXVKRExlU2N1cDZhMTF0RDdWdnA3emFPNmtoNXMyZFc1OWZaVGhTbzRHOGY5?=
 =?utf-8?B?aTROS1RhdzQ4bU9HQ3NHNFpCa0lhQUtmZkZvMlJ6VUZZZXZWT0dmeEliSkxw?=
 =?utf-8?B?L0NPMGJmeDBvVFJubGVnRkUwMmdEUFVzSGlhK2pxWm9VcE5sdVFnSm5XZVVU?=
 =?utf-8?B?Tmtsd28wNTVrUm9Mb01aTjFtdVlNT0g0ZGtUbWRFUUM2MzNCeXRzbzN0eExx?=
 =?utf-8?B?VjZndW43MFREYXdTRUNaci9rVXJIOFNUZXc0STdTYkZzQmJnN04wWVNEQ1hE?=
 =?utf-8?B?VTlyRFVESitxZnRzaUxoYXdVSVNMKzFndW1BRUxBeE9MMW5BQnVjNGswTS9S?=
 =?utf-8?B?bExQclE5c1B4TUh0OHU1UzUwVmhiaWtSZk5HaDhFaGp1RnpvSUo0d2RjWmhi?=
 =?utf-8?B?b2hycUNsVkI2dXA4aHVzYjZZd2VxQ0NGWEExWFA5NXRtc0dmK0crc3JSNzRk?=
 =?utf-8?B?YUlveUtJc1lrTkdTWVNWVmtBQ1pUVDRTUVFEYmdYcmtIc0FBTG1SblQ1WWNu?=
 =?utf-8?B?OTFibmNCSnRlRzAwOHdJVmp6eWlHSW5pNk9RSllRalpQaUN3SzA0TCtkam5Q?=
 =?utf-8?B?eFdyVitpSmhjcWExZ2UvMFJKbnpyakpqczlyTzE3SzdlTzNQWjMyOW1QdEJr?=
 =?utf-8?B?bUtrdURFclUzVFZiZkZCL2x2ZDdCOThubHNJekJjcXhwVlNzbW5VWWlmbllv?=
 =?utf-8?B?VmE1VVk1NGVzTTkzS2lSaDFSd3hzUHMyN2ZsclBHb215TEx5ZVNrbzNIeGpk?=
 =?utf-8?B?MkpJQk1rbDJXdkdJdlU0Ulh4SXlxb01lMUxIcVoyQkwwcnZJLzlzTU45SDFw?=
 =?utf-8?B?RlQwczEyenQ3ckZuT1lPRjJpY3FsTWF4NkZzYXBNREl4eXY4eGkrV2NtZElB?=
 =?utf-8?B?eG1HWEsrZ3k4K2dyZklpQ3ZoWTFkemhPc1JXUENDQWk4ZlZmWDBFVUxJdjls?=
 =?utf-8?B?cjlmOTlLdWd1U1I1Vmt5V0pnVzNxdEYrOXpZNFY1dzBoQ1ZNS1RTdTBwWjNU?=
 =?utf-8?B?V2k0ZjhlYmkrZzFkdkpHZG1kM3VTWGxELzV3eExUaDVDMFg2dVp3Ykx2TXc4?=
 =?utf-8?B?clkwVUpEWllTSFFHR0hiSGxNWXl3UjZIcUluY1MyU0ZibTJWTlltRG9xYTl1?=
 =?utf-8?B?c1RTcnR0VFJWU0FpMTlOa0FyVWo4ZzlSVUtzeW5pYVAzNkI3MjMyMXI4OFVy?=
 =?utf-8?B?RDU0b0RrVm0wTU9VWm9BVEt4aDVTenhMQWZYTi83azQzRkR5Z3U1aG1DRjBx?=
 =?utf-8?B?cGduSHVEWXRQYThydm5iOFNMTXNSaWE3eGUrbUc1UWIxNFVnSVVSYjZocHdp?=
 =?utf-8?B?TE5ralU1T0dKcC9NeVQwbVg0R2l3QVJXUjhobS9KbDgremR2YmhsY0pzaWJE?=
 =?utf-8?B?WmNZdDI5VWU3TElqZmlPV0I0c0hYb2JoQ3JJN01FbzRxTmJOVmVzajhXbnVr?=
 =?utf-8?Q?S6nRfxqrLtdqTDgqsQaJc992z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82656551-ca74-46d3-e743-08db1340a322
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 12:47:34.5739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZ//rd+pmV3qUSdrcJKLyATOb5aXzFQZApxvCalwenhMUnabzs4WkSLP1yUTvidbo3E09/OAhNhbKC0UKFj7vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8260
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
Cc: marex@denx.de, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org, LW@karo-electronics.de,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2023-02-20 at 11:16 +0100, Alexander Stein wrote:
> Hi Liu,

Hi Alexander,

> 
> Am Montag, 20. Februar 2023, 09:55:19 CET schrieb Alexander Stein:
> > Hi Liu,
> > 
> > Am Freitag, 17. Februar 2023, 09:59:14 CET schrieb Liu Ying:
> > > On Fri, 2023-02-17 at 09:18 +0100, Alexander Stein wrote:
> > > > Hi Liu,
> > > 
> > > Hi Alexander,
> > > 
> > > > Am Freitag, 17. Februar 2023, 07:54:01 CET schrieb Liu Ying:
> > > > > Hi,
> > > > > 
> > > > > This patch set aims to add i.MX93 LCDIF display controller
> > > > > support
> > > > > in the existing LCDIF DRM driver.  The LCDIF embedded in
> > > > > i.MX93 SoC
> > > > > is essentially the same to those embedded in i.MX8mp
> > > > > SoC.  Through
> > > > > internal bridges, i.MX93 LCDIF may drive a MIPI DSI display
> > > > > or a LVDS
> > > > > display or a parallel display.
> > > > > 
> > > > > Patch 1/6 adds device tree binding support for i.MX93 LCDIF
> > > > > in the
> > > > > existing fsl,lcdif.yaml.
> > > > > 
> > > > > Patch 2/6 drops lcdif->bridge NULL pointer check as a cleanup
> > > > > patch.
> > > > > 
> > > > > Patch 3/6~5/6 prepare for adding i.MX93 LCDIF support step by
> > > > > step.
> > > > > 
> > > > > Patch 6/6 adds i.MX93 LCDIF compatible string as the last
> > > > > step of
> > > > > adding i.MX93 LCDIF support.
> > > > 
> > > > Thanks for the series. I could test this on my
> > > > TQMa93xxLA/MBa93xxCA with
> > > > a
> > > > single LVDS display attached, so no DSI or parallel display.
> > > > Hence I
> > > > could
> > > > not test the bus format and flags checks, but they look okay.
> > > > So you can add
> > > > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > to the whole series as well.
> > > 
> > > Thanks for your test.
> > > 
> > > > One thing I noticed is that, sometimes it seems that before
> > > > probing
> > > > lcdif
> > > > my system completely freezes. Adding some debug output it seems
> > > > that's
> > > > during powering up the IMX93_MEDIABLK_PD_LCDIF power domain
> > > > there is
> > > > some
> > > > race condition. But adding more more detailed output made the
> > > > problem go
> > > > away. Did you notice something similar? It might be a red
> > > > hering though.
> > > 
> > > I don't see system freezing with my i.MX93 11x11 EVK when probing
> > > lcdif. I did try to boot the system several times. All look ok.
> > > This is
> > > a snippet of dmesg when lcdif probes:
> > > 
> > > --------------------------8<-------------------------------------
> > > -----
> > > [    0.753083] Serial: 8250/16550 driver, 4 ports, IRQ sharing
> > > enabled
> > > [    0.761669] SuperH (H)SCI(F) driver initialized
> > > [    0.766523] msm_serial: driver initialized
> > > [    0.780523] printk: console [ttyLP0] enabled0x44380010 (irq =
> > > 16,
> > > base_baud = 1500000) is a FSL_LPUART
> > > [    0.780523] printk: console [ttyLP0] enabled
> > > [    0.788928] printk: bootconsole [lpuart32] disabled
> > > [    0.788928] printk: bootconsole [lpuart32] disabled
> > > [    0.804632] panel-simple lvds_panel: supply power not found,
> > > using
> > > dummy regulator
> > > [    0.814741] [drm] Initialized imx-lcdif 1.0.0 20220417 for
> > > 4ae30000.lcd-controller on minor 0
> > > [    1.195930] Console: switching to colour frame buffer device
> > > 160x50
> > > [    1.218385] imx-lcdif 4ae30000.lcd-controller: [drm] fb0: imx-
> > > lcdifdrmfb frame buffer device
> > > [    1.227099] cacheinfo: Unable to detect cache hierarchy for
> > > CPU 0
> > > [    1.236725] loop: module loaded
> > > --------------------------8<-------------------------------------
> > > -----
> > > 
> > > ~300 milliseconds are consumed by the enablement delay required
> > > by the
> > > "boe,ev121wxm-n10-1850" LVDS panel I use.
> > 
> > It seems you have the drivers compiled in. I use modules in my case
> > and
> > simple-panel as well. But this is unrelated, because lcdif_probe()
> > is yet to
> > be called. Using the debug diff from below I get the following
> > output:
> > 
> > [   16.111197] imx93-blk-ctrl 4ac10000.system-controller:
> > imx93_blk_ctrl_power_on: 1
> > [   16.122491] imx93-blk-ctrl 4ac10000.system-controller:
> > imx93_blk_ctrl_power_on: 2
> > [   16.137766] imx93-blk-ctrl 4ac10000.system-controller:
> > imx93_blk_ctrl_power_on: 3
> > [   16.154905] imx93-blk-ctrl 4ac10000.system-controller:
> > imx93_blk_ctrl_power_on: 4
> > 
> > It seems setting BLK_CLK_EN blocks the whole system, even reading
> > is not
> > possible. I don't have any details on the hardware, but it seems
> > that either
> > some clock or power domain is not enabled. This can also happen if
> > I'm
> > loading the lcdif module manually after boot. But I can't detect
> > any
> > differences in / sys/kernel/debug/clk/clk_summary.
> 
> I think I found the cause. It's the maximum clock frequency for
> media_axi and 
> media_apb. These clocks were not explicitly configured, most
> probably 
> exceeding the maximum frequency allowed.

Thanks for sharing the cause. I use 400MHz media_axi and 133MHz
media_apb.

Regards,
Liu Ying

> 
> Best regards,
> Alexander
> 
> > ---8<---
> > diff --git a/drivers/soc/imx/imx93-blk-ctrl.c
> > b/drivers/soc/imx/imx93-blk-
> > ctrl.c
> > index 2c600329436cf..50aeb20ce90dc 100644
> > --- a/drivers/soc/imx/imx93-blk-ctrl.c
> > +++ b/drivers/soc/imx/imx93-blk-ctrl.c
> > @@ -129,12 +129,14 @@ static int imx93_blk_ctrl_power_on(struct
> > generic_pm_domain *genpd)
> >  	struct imx93_blk_ctrl *bc = domain->bc;
> >  	int ret;
> > 
> > +	dev_info(bc->dev, "%s: 1\n", __func__);
> >  	ret = clk_bulk_prepare_enable(bc->num_clks, bc->clks);
> >  	if (ret) {
> >  		dev_err(bc->dev, "failed to enable bus clocks\n");
> >  		return ret;
> >  	}
> > 
> > +	dev_info(bc->dev, "%s: 2\n", __func__);
> >  	ret = clk_bulk_prepare_enable(data->num_clks, domain->clks);
> >  	if (ret) {
> >  		clk_bulk_disable_unprepare(bc->num_clks, bc->clks);
> > @@ -142,6 +144,7 @@ static int imx93_blk_ctrl_power_on(struct
> > generic_pm_domain *genpd)
> >  		return ret;
> >  	}
> > 
> > +	dev_info(bc->dev, "%s: 3\n", __func__);
> >  	ret = pm_runtime_get_sync(bc->dev);
> >  	if (ret < 0) {
> >  		pm_runtime_put_noidle(bc->dev);
> > @@ -149,11 +152,15 @@ static int imx93_blk_ctrl_power_on(struct
> > generic_pm_domain *genpd)
> >  		goto disable_clk;
> >  	}
> > 
> > +	dev_info(bc->dev, "%s: 4\n", __func__);
> > +
> >  	/* ungate clk */
> >  	regmap_clear_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
> > +	dev_info(bc->dev, "%s: 5\n", __func__);
> > 
> >  	/* release reset */
> >  	regmap_set_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
> > +	dev_info(bc->dev, "%s: 6\n", __func__);
> > 
> >  	dev_dbg(bc->dev, "pd_on: name: %s\n", genpd->name);
> > 
> > 
> > ---8<---
> > 
> > Best regards,
> > Alexander
> > 
> > > Regards,
> > > Liu Ying
> > > 
> > > > Best regards,
> > > > Alexander
> > > > 
> > > > > v3->v4:
> > > > > * Improve warning message when ignoring invalid LCDIF OF
> > > > > endpoint ids
> > > > > in
> > > > > 
> > > > >   patch 5/6. (Alexander)
> > > > > 
> > > > > * Use 'new_{c,p}state' instead of 'new_{crtc,plane}_state' in
> > > > > patch
> > > > > 3/6.
> > > > > 
> > > > >   (Alexander)
> > > > > 
> > > > > * Simplify lcdif_crtc_reset() by calling
> > > > > lcdif_crtc_atomic_destroy_state()
> > > > > 
> > > > >   in patch 3/6. (Alexander)
> > > > > 
> > > > > * Add '!crtc->state' check in
> > > > > lcdif_crtc_atomic_duplicate_state() in
> > > > > patch
> > > > > 3/6. (Alexander)
> > > > > * Collect Alexander's R-b tags on patch 1/6, 2/6 and 6/6.
> > > > > 
> > > > > v2->v3:
> > > > > * Fix a trivial typo in patch 6/6's commit message.
> > > > > 
> > > > > v1->v2:
> > > > > * Add Krzysztof's A-b and Marek's R-b tags on patch 1/6.
> > > > > * Split patch 2/2 in v1 into patch 2/6~6/6 in v2. (Marek,
> > > > > Alexander)
> > > > > * Drop '!remote ||' from lcdif_attach_bridge(). (Lothar)
> > > > > * Add comment on the 'base' member of lcdif_crtc_state
> > > > > structure to
> > > > > 
> > > > >   note it should always be the first member. (Lothar)
> > > > > 
> > > > > * Drop unneeded 'bridges' member from lcdif_drm_private
> > > > > structure.
> > > > > * Drop a comment about bridge input bus format from
> > > > > lcdif_crtc_atomic_check().
> > > > > 
> > > > > Liu Ying (6):
> > > > >   dt-bindings: lcdif: Add i.MX93 LCDIF support
> > > > >   drm: lcdif: Drop unnecessary NULL pointer check on lcdif-
> > > > > >bridge
> > > > >   drm: lcdif: Determine bus format and flags in
> > > > > ->atomic_check()
> > > > >   drm: lcdif: Check consistent bus format and flags across
> > > > > first
> > > > >   bridges
> > > > >   drm: lcdif: Add multiple encoders and first bridges support
> > > > >   drm: lcdif: Add i.MX93 LCDIF compatible string
> > > > >  
> > > > >  .../bindings/display/fsl,lcdif.yaml           |   7 +-
> > > > >  drivers/gpu/drm/mxsfb/lcdif_drv.c             |  71 ++++++-
> > > > >  drivers/gpu/drm/mxsfb/lcdif_drv.h             |   5 +-
> > > > >  drivers/gpu/drm/mxsfb/lcdif_kms.c             | 198
> > > > >  ++++++++++++------
> > > > >  4 files changed, 206 insertions(+), 75 deletions(-)
> 
> 

