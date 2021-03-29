Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708A534C5FE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 10:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980466E30C;
	Mon, 29 Mar 2021 08:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130055.outbound.protection.outlook.com [40.107.13.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C276E30C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 08:07:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VI0UiQL3I9SmvQ4lSKEX//iM8djEOC07+9RbG/uE333Ib7dpevE66QNvJsuHAiY73zH2zsBnIt8bV5hohKxXVQ7ngJRDxvGs0OqcHhjIEGisx2ZUrQNAOjMKZldLPpmxMVMrT5W6hz0CwHI7JebwVarY/+HrmUQEBKvzCdoo1T/IXa2iVITXK8ydEQ3xtBhYBByTQJeVwNTVItBmP1y1pks/EGfYeGXwB4ril0/5WXozAkaCjywsoanW/QlX15G+dApXV9yODHvXLYXTjWKtrP5PNy4I42BvALH8DL+ky3cl7mh9tHrqWPJSwF+VYDhmYxKb0ifXDnYU88lmayaUww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxStv94V1h6TVSaHw5iOj59M0yvBlnJ03ZWBlYgSLaA=;
 b=gCFfI2NSpRj7ycOU0e91u9GPvTzf1EQVvNcyLz9PdagQvI+9gVJq9hVcbC4X/gIe3eo+KzCxTNEzd59XC3ZybZHOedYYgL30BjVav0mjeJ66tsY3opKmRm0TufmwAZ4X5ZcSZKKtHwJ/ja0ZffMPMn2tmiFfZazda4eGjbnxv/RTyk4JIk6JXpIV+MKppiA8CkS1s762f8qs+HeXiC1FUDCTr0SaVCi+Q0OB8C3OgEPwi/mtuKwJtrqMfMxv/MLrXUNVIqga+crnmqovIZmr8tvwUPmNVQ9wX51ALheRdTc8evhWzhonkOyS4NY3cssXDG599l+KXMaacJtAWXQyfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxStv94V1h6TVSaHw5iOj59M0yvBlnJ03ZWBlYgSLaA=;
 b=pZydxSUEblXWChNDqxKieJLXERJLPT0b68gA6KrQ78zPZdDqfMxNEwDxwc9O7NAuBGF+TdHkg8asCq6g7kus5wXaJWL9FF4Gr+Xsn2jLUJ0x4i6ZdUjgdIDVYlhxjwtf70XGNvgmsose3+8vh687uvqnNsd4egfTnE2yYtUn2p8=
Authentication-Results: toradex.com; dkim=none (message not signed)
 header.d=none;toradex.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB3136.eurprd04.prod.outlook.com (2603:10a6:802:10::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 08:07:00 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 08:07:00 +0000
Message-ID: <4576b09da247aa5fd3b2642b1a2420827d1c04be.camel@nxp.com>
Subject: Re: [PATCH v6 00/14] Add some DRM bridge drivers support for
 i.MX8qm/qxp SoCs
From: Liu Ying <victor.liu@nxp.com>
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, 
 "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>
Date: Mon, 29 Mar 2021 16:05:19 +0800
In-Reply-To: <3043284c440c703ab3c4deaf77b6e81670d571e2.camel@toradex.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
 <42710b2d8b474cae5d4d8a1408eaa1cd98b7c2e0.camel@toradex.com>
 <ecb5dc8a52509eed4cf7fa3e9aa235673399f083.camel@nxp.com>
 <3043284c440c703ab3c4deaf77b6e81670d571e2.camel@toradex.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MA1PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::33) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 MA1PR01CA0163.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 08:06:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d9414b24-5f1d-413a-e3fd-08d8f289a093
X-MS-TrafficTypeDiagnostic: VI1PR04MB3136:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB313661509E1CEF6F121C5784987E9@VI1PR04MB3136.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 16nKpXTFEsBuaf6f5avJHDwZbux/cVAAiYZH9fufZj0ZbnXCwB+cI7xnXZeL7mXnDk+aC2r5Gdz5uL/+Om8ynwI62qQGTgeHxmWhyqAzzLloLRhS3dM5hxHf9GHQ83ED3KRqfaTCc8FEH0UAezkpaj3AXF9b1+9pwz4PfgDtTAJnySC5ulNF7peHnclaHXvnJWiE3naSvdZrvNAsiCBfbeEdkSNZl4WGXUR0lTxzBlT2J+pmuZYvd+TL6VaVnXaFbtm4DeXn93FDcuCvFkziiyWy7p71SSsVY9In20yX83nOefskYXqfWDCsfqf2lwSg5CPLc3KZxv8h2h8bJKryTz8IuzzSdvD9jMYh60AifiM9G8us5DcRcitmAven8nWYoCgupmLt+ydEzWe/PyO3R3d4uzx/T7GyqnIsXeTP6BBFoa4IY7u3vtucxkFOCzd0DBMCImlo+OtDtbIGDJPe/XNe26jGZwbn7e/1EjVLcx2NelR7+DHc4dfiC9fNGUxdoxcDNdQ9WSjkoChQWYdKGjeNwQxIbarv0RmaDFynfCHwngYcKR8QsChTTuOIZrn4eNcDnDzSp64brRmVOqn1G2rokaUGO4EPxX7f9hrTYsVA+8H7FIK6VuS7b3YDjXd4R4oHJ0bzO/fnsWEXhQwl6oHVy1iYOTMpNdDzdBHzC6orKKYjlGlIu9Fp6qnxkgETVPoj1AVNwbRnzg/bDKSRMAxm2F7f9QCfMxmaMzrUznY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(966005)(36756003)(2906002)(478600001)(7416002)(6486002)(45080400002)(66946007)(66476007)(66556008)(956004)(6496006)(2616005)(52116002)(8936002)(4326008)(83380400001)(316002)(5660300002)(6666004)(16526019)(110136005)(38100700001)(26005)(86362001)(186003)(54906003)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VVh3Q2l3ZXJpWUJhcTd5cjI5UDZmcXFRbFkxbTJIYnhtOGt6TG5qZSt3WDhl?=
 =?utf-8?B?Q2RYdmFXV3hLRVRkU014d2J5azNKcU5iVGYwaFFaVWpzQlk1SnFGNG1Gb3E2?=
 =?utf-8?B?MWlnckhLS1dQanFVUVkwQm9ZQ2N5cWw2NVEwY3hyQVBrTDMwZkdWdFV1UDRU?=
 =?utf-8?B?UFZUSHo1R1ZvM2NnMEVPV2pJQXdDRGxBbXh4T244VG9ha0FDcG5aK3loV0R6?=
 =?utf-8?B?a0YwL1h0YU1pcHphZFliOXdRcmNzUnpJN0NEcWlmZ29YdHgrNEpRNnE1WS81?=
 =?utf-8?B?RmdQVWY3bUpwRUk4UXErRExoSHNPZ2ZwOEFyLzlGYWpTdzBRekZOQlF3Ui8x?=
 =?utf-8?B?VFZjb3U0cS9DYnZoNTU0NGlhNlUrZmUvK3BCMGlzU3F6dGJQOW90aVd6WHJY?=
 =?utf-8?B?b3JpeEJhRVZWOFloZktVTU1LQUtuelhMNi9aVEk4NnRwREN4TndXVldHMGZV?=
 =?utf-8?B?Nnh4aGJscmJ3NlNaZEhsNjNCcDgzL2oyVWlOZDlNMnJ5NUovU1l4MGRuRjVM?=
 =?utf-8?B?K1BNSnFZQnNVQWJVNk5mRCtEUmdWR05reUlXZEpEUHBreUw0Z2RCNm1NbTlF?=
 =?utf-8?B?OVY1aEtFQWpEdmVPU0s0SkZnSnZHRm9VeDdPNXRTTmZoR0l3Vkh4VFFidGpU?=
 =?utf-8?B?aDcwOE1ROVg3cG9JRElmc3h3aGRNZ3YzL2ZOeGpNSEtiYlVrbHQwVWhDSEF4?=
 =?utf-8?B?ekdDekZXWkJ6MU1DVzFOWkJTRU9hWXFlZi8xbGM5d2phajJtdG83QnY3eWF3?=
 =?utf-8?B?RnRmV01SSk5SNzA1SXFRakgyY0d0TERJeTNKR3R2VVEvKytZNVBGdHRtWWh6?=
 =?utf-8?B?bTNvbUc3R2IzTzVLbm5OTml2eUpDU2ZCNlFUd25oSjZkMHdoSnU4WEVuYWJM?=
 =?utf-8?B?d1RwRklOSDlLTkJWc0ZmQWUyMnBUWm83TFVKMm9MZzJ3dFNZUDVHTnhXL005?=
 =?utf-8?B?RkErZUlvRnVTcUtsK29mYUI1Zkdyd2NwR2YvTldqN0lVTndNaGZJeHh3U2c0?=
 =?utf-8?B?YTZWcEpSZldHZHVvc2JNbGtTYTd3ZGRkV2NadFNYK0JuRXUyVFhzS0NzaExt?=
 =?utf-8?B?VEpFc0trSEVBSGxmSDQydGpqbHpDY2RmdjJZeWw3MlJIbzdJR1cwYWJWM1cz?=
 =?utf-8?B?d1FpanR1bWNKcndNVWhPcTZsTHBUTXpwbHFzczRRQ1lBTHk4TGc2cDQ1M1Vi?=
 =?utf-8?B?Mk1PcFVzWG0rRFVSeS9wU0xWd01zV0FjeXhiRmhwcExqQmhSNWdQYlFXU21S?=
 =?utf-8?B?YWJCbitYQk85STBPamVVZ0RkSG9icmZDRkpMZjRlbkhBUW94Z1hPSzFnSXJZ?=
 =?utf-8?B?VW9qSG10TVVoaENXQ1NHZlFtWE5xQ2FPVlo0Wko1bWdJQ3VwV0xsS1ZMWlNi?=
 =?utf-8?B?bkpTR3ZDOWVaQmhWTHcvamZWWjh3WExiMVVCdEdUakVldlo2WndWbkp3c080?=
 =?utf-8?B?Wk80d0xNQW1NUmxZc0RpMi9mMnFkbFZLR1o1b29Ea1JWdnJUaDU2OGh6TFVT?=
 =?utf-8?B?bUt2ZHRsdWJPeWRVaWxGd0VaTnVzUTZKL1I5NW5nK1NXbzJFL2crajZ5ZlRO?=
 =?utf-8?B?MXNXR2VtT1QzVys0QlZwbTViRXFzeC83dUl6aFVOeWlqREI0VWFwWDRzMDZs?=
 =?utf-8?B?alZ3T1NXbjhxeks3VGdsT0dac3R5VTZWMFJKNSs2MHIrZlY0bE1MODBpek0y?=
 =?utf-8?B?TURJQVY0M0F2NzREQVlSaG1tVU9mWUlCVU5rZHhjRi91NGNOaVFwN0J4Z09Y?=
 =?utf-8?Q?AEo2oFaA1hN/CmnBaVZcsPq69SwNkHvmsDyxurg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9414b24-5f1d-413a-e3fd-08d8f289a093
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 08:07:00.2266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vyrlyqdujPTxYHYw6rhkMGahKbt5gpLpM6xIddDNqvrqxFHfGcCOrUymRw+/xczZK7lCB1qfbG7CywDWGO8Wvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3136
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
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "kishon@ti.com" <kishon@ti.com>, "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marcel,

On Mon, 2021-03-29 at 00:49 +0000, Marcel Ziswiler wrote:
> Hi Liu
> 
> On Tue, 2021-03-23 at 17:09 +0800, Liu Ying wrote:
> > On Tue, 2021-03-23 at 01:03 +0000, Marcel Ziswiler wrote:
> > > Hi Liu
> > > 
> > > Some further discrepancy with them binding examples:
> > > 
> > > arch/arm64/boot/dts/freescale/imx8qxp.dtsi:335.9-36: Warning (reg_format): /dpu@56180000:reg: property has
> > > invalid length (8 bytes) (#address-cells == 2, #size-cells == 2)
> > > arch/arm64/boot/dts/freescale/imx8qxp.dtsi:508.9-35: Warning (reg_format): /syscon@56221000:reg: property has
> > > invalid length (8 bytes) (#address-cells == 2, #size-cells == 2)
> > > arch/arm64/boot/dts/freescale/imx8qxp.dtsi:601.9-34: Warning (reg_format): /phy@56228300:reg: property has
> > > invalid length (8 bytes) (#address-cells == 2, #size-cells == 2)
> > > arch/arm64/boot/dts/freescale/imx8qxp.dtsi:613.9-36: Warning (reg_format): /pixel-combiner@56020000:reg:
> > > property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 2)
> > > 
> > > And with that I am unable to bring it up:
> > > 
> > > [    1.714498] imx8qxp-ldb 5622100000001000.syscon:ldb: [drm:ldb_init_helper] *ERROR* failed to get regmap: -
> > > 12
> > > [    1.724441] imx8qxp-ldb: probe of 5622100000001000.syscon:ldb failed with error -12
> > > [    1.734983] imx8qxp-pixel-combiner 5602000000010000.pixel-combiner: invalid resource
> > > [    1.742830] imx8qxp-pixel-combiner: probe of 5602000000010000.pixel-combiner failed with error -22
> > > [    1.754040] imx8qxp-display-pixel-link dc0-pixel-link0: [drm:imx8qxp_pixel_link_bridge_probe] *ERROR*
> > > failed
> > > to get pixel link node alias id: -19
> > > [    1.769626] imx8qxp-pxl2dpi 5622100000001000.syscon:pxl2dpi: [drm:imx8qxp_pxl2dpi_bridge_probe] *ERROR*
> > > failed to get regmap: -12
> > > [    1.781397] imx8qxp-pxl2dpi: probe of 5622100000001000.syscon:pxl2dpi failed with error -12
> > > [    1.840547] imx8qxp-lpcg-clk 59580000.clock-controller: deferred probe timeout, ignoring dependency
> > > [    1.840571] imx8qxp-lpcg-clk: probe of 59580000.clock-controller failed with error -110
> > > 
> > > Any suggestions welcome. Thanks!
> > 
> > Please reference the patch set I shared in my last reply and see how it
> > goes.  Thanks.
> 
> Thank you very much. After a little bit of fiddling I can confirm that this also works fine on a Toradex
> Colibri iMX8X [1] with either a Capacitive Touch Display 10.1" LVDS which has a Logic Technologies LT170410-
> 2WHC [2] single-channel panel inside or a dual-channel LG LP156WF1 full HD panel.

Thanks a lot for your testing!

Glad to know that the two LVDS panels work on Toradex Colibri iMX8X.

> 
> During boot I noticed quite some clocking/power domain related messages:
> 
> [    0.537965] gpt0_clk: failed to attached the power domain -2
> 
> [    0.562372] dc1_disp0_clk: failed to attached the power domain -2
> [    0.562800] dc1_disp0_clk: failed to get clock parent -22
> [    0.562858] dc1_disp0_clk: failed to get clock rate -22
> 
> [    0.563059] dc1_disp1_clk: failed to attached the power domain -2
> [    0.563463] dc1_disp1_clk: failed to get clock parent -22
> [    0.563514] dc1_disp1_clk: failed to get clock rate -22
> 
> [    0.563773] dc1_pll0_clk: failed to attached the power domain -2
> [    0.564174] dc1_pll0_clk: failed to get clock rate -22
> 
> [    0.564413] dc1_pll1_clk: failed to attached the power domain -2
> [    0.564838] dc1_pll1_clk: failed to get clock rate -22
> 
> [    0.565099] dc1_bypass0_clk: failed to attached the power domain -2
> [    0.565516] dc1_bypass0_clk: failed to get clock rate -22
> 
> [    0.565755] dc1_bypass1_clk: failed to attached the power domain -2
> [    0.566159] dc1_bypass1_clk: failed to get clock rate -22
> 
> [    0.574493] lvds0_i2c0_clk: failed to attached the power domain -2
> [    0.574894] lvds0_i2c0_clk: failed to get clock rate -22
> 
> [    0.575134] lvds0_i2c1_clk: failed to attached the power domain -2
> [    0.575526] lvds0_i2c1_clk: failed to get clock rate -22
> 
> [    0.575785] lvds0_pwm0_clk: failed to attached the power domain -2
> [    0.576189] lvds0_pwm0_clk: failed to get clock rate -22
> 
> [    0.576417] lvds1_i2c0_clk: failed to attached the power domain -2
> [    0.576854] lvds1_i2c0_clk: failed to get clock rate -22
> 
> [    0.577129] lvds1_i2c1_clk: failed to attached the power domain -2
> [    0.577554] lvds1_i2c1_clk: failed to get clock rate -22
> 
> [    0.577787] lvds1_pwm0_clk: failed to attached the power domain -2
> [    0.578198] lvds1_pwm0_clk: failed to get clock rate -22
> 
> [    0.578464] mipi_csi0_core_clk: failed to attached the power domain -2
> 
> [    0.579104] mipi_csi0_esc_clk: failed to attached the power domain -2
> 
> [    0.579738] mipi_csi0_i2c0_clk: failed to attached the power domain -2
> 
> [    0.580368] mipi_csi0_pwm0_clk: failed to attached the power domain -2
> 
> And the following repeats a couple dozens of times:
> 
> [    4.391495] dc1_disp0_clk: failed to get clock parent -22
> [    4.398532] dc1_disp1_clk: failed to get clock parent -22

As I mentioned before, there will be logs like 'dc1_disp0_clk: failed
to get clock parent -22' on i.MX8qxp and i.MX8qm/qxp specific clocks
are not split yet. DC1 and LVDS0/1 are i.MX8qm specific. So, once they
are split up, I assume there won't be those logs any more.

If you don't apply the below two patches for i.MX8qm, then dc1 and
lvds0/1 relevant logs won't come.  That doesn't impact the i.MX8qxp
displays.

clk: imx: clk-imx8qxp: Add I2C and PWM SCU clocks in LVDS0/1 subsystems
clk: imx: clk-imx8qxp: Add some clocks for i.MX8qm DC1 subsystem


The latest Shawn's for-next branch also generates the gpt and mipi_csi
relevant logs on my i.MX8qxp MEK board like below.  So, they are not
related to my patch set.

dmesg | grep clk
[    1.091534] gpt0_clk: failed to attached the power domain -2
[    1.133131] mipi_csi0_core_clk: failed to attached the power domain
-2
[    1.139849] mipi_csi0_esc_clk: failed to attached the power domain
-2
[    1.146441] mipi_csi0_i2c0_clk: failed to attached the power domain
-2
[    1.153312] mipi_csi0_pwm0_clk: failed to attached the power domain
-2

On my i.MX8qm MEK board, the latest Shawn's for-next branch behaves
like this:
dmesg | grep clk
[    0.222517] a35_clk: failed to get clock rate -22
[    0.225331] gpt0_clk: failed to attached the power domain -2
[    0.232859] pwm_clk: failed to attached the power domain -2
[    0.233085] pwm_clk: failed to get clock rate -22
[    0.233158] lcd_clk: failed to attached the power domain -2
[    0.233382] lcd_clk: failed to get clock rate -22
[    0.246576] mipi_csi0_core_clk: failed to attached the power domain
-2
[    0.246899] mipi_csi0_esc_clk: failed to attached the power domain
-2
[    0.247218] mipi_csi0_i2c0_clk: failed to attached the power domain
-2
[    0.247515] mipi_csi0_pwm0_clk: failed to attached the power domain
-2
[    1.510195] imx8qxp-lpcg-clk 5a4a0000.clock-controller: deferred
probe timeout, ignoring dependency
[    1.521361] imx8qxp-lpcg-clk: probe of 5a4a0000.clock-controller
failed with error -110

@Aisheng, it looks like we'd better to suppress those warning logs soon
by splitting i.MX8qm/qxp specific clocks up?


> And finally it spits the following:
> 
> [    4.670303] imx8qxp-lpcg-clk 59580000.clock-controller: deferred probe timeout, ignoring dependency
> [    4.679629] imx8qxp-lpcg-clk: probe of 59580000.clock-controller failed with error -110

I don't see this on my i.MX8qxp MEK board. It looks like it's related
to the 'dsp_lpcg: clock-controller@59580000' node in
imx8-ss-audio.dtsi. Does this reproduce with Shawn's for-next
branch(without my patch set) for you?

> 
> Despite those messages the displays do work fine once booted.
> 
> I am currently running this with SCFW, SECO, TF-A and U-Boot based off NXP's latest downstream BSP 5.4.70-
> 2.3.0. Not sure whether or not especially the used SCFW version could cause some issues. What SCFW are you
> using?
> 
> Full boot logs may be found here [3].
> 
> You may add the following to the whole series.
> 
> Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com> # Colibri iMX8X, LT170410-2WHC, LP156WF1

Thanks for your tag.

> 
> Thanks again and just let us know if we may test anything else for you.

Maybe, any Toradex i.MX8qm board with LVDS display, please?

Regards,
Liu Ying

> 
> [1] commit ba5a5615d54f ("arm64: dts: freescale: add initial support for colibri imx8x")
> [2] commit 5728fe7fa539 ("drm/panel: simple: add display timings for logic technologies displays")
> [3] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fshare.toradex.com%2Fs30wwspcr9iwyrg&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7Ca51f827482704468d27208d8f24c75dd%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637525757505899800%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=VziEUvn3pnk7QvgIl58CuM8VHMqm6Y5xOuod4ali1Zk%3D&amp;reserved=0
> 
> > Liu Ying
> 
> Cheers
> 
> Marcel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
