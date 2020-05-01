Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B951C241D
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 10:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C8C6EE15;
	Sat,  2 May 2020 08:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593726E039;
 Fri,  1 May 2020 12:36:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcAj1lURYVN53UTVOTcAwkucNrxGr7w3Q69AZRiKUbzXN7Ql7CP6rTffPLQ2QgzuJ3bsGBd30W+lWMoAIPjwXHNgz3qKGrN5GYnuOLAP2avr6xRLTwKv9yvU+kUyCzb/nf1oQ6oZazXUWWdG+6FXzyiVsJUndsh+wM/Mlyvsq1H29eAWUXVcZZ7ifPb5KBUTTjjHgrzBbpQF9S73SliXyPEQIlfWdfoVDoGN42OLEKqDhBX9YllqSKwelioakyrmYNbdsuOsWZPReWmHdPZgzdXEZ/Fw+E/XnHY/5h7yhzMp08UCHcuU0MTrR7KfDfsQ4y1ojNbHUvq/ynEEOhQ1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNtXGdz1Qd1ZPEX3P0mHUeuOUjRtckIEAVXzk5jJ6To=;
 b=f2ZWeDmYSrWd6xFcnj8fIdWxeYKe2PF13wxo2HTuc1a5owthDzv6OF0L+5R5hjaA6CNhTtfGFcI/acbp/IGZ5YG2KgaSIvxUrO0LHMvXDmZ+cpVZe307goWz3qp7ufbMZHIqOngFHKFFuK6u06zeHYwoPO159pDhrTG84EZsoB8AimrdnURPwjU+ntHxsNylkM3mXiADjLdbBnq8pnlgZ9my5uXK5KxelE0ZTRIHWpTbQzgJCTHj62dt/ryPEX56lyjrxumpf91TOLRPcB7zZoZ6cnfGOemsEQzkWFGzARyDIB/EaiOBDOnRCzLlUULoOwk3KzS6jtG30v3sjb2hlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNtXGdz1Qd1ZPEX3P0mHUeuOUjRtckIEAVXzk5jJ6To=;
 b=j9kriS3wKS2oF3VUtlYkA9X7/o5EjdXVSmZBb4BdZfdeEbfyTmBTvpgBjGOJ64OGCYpgDUhtozC3NG+AWRWwDSexzQkyyO819Zme191LqNiK3EKkUx83DqAMmLmjqOKbPpgFnsad7k2P2FfeEIzVm12rlxo8CLWWX2stGW9Pa1A=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2693.eurprd04.prod.outlook.com (2603:10a6:4:96::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.21; Fri, 1 May
 2020 12:36:43 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871%6]) with mapi id 15.20.2937.028; Fri, 1 May 2020
 12:36:43 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>, Lucas Stach
 <l.stach@pengutronix.de>, Adam Ford <aford173@gmail.com>, Anson Huang
 <anson.huang@nxp.com>, Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Leonard Crestez <leonard.crestez@nxp.com>, Jun Li <jun.li@nxp.com>,
 dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, Sascha
 Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "S.j. Wang"
 <shengjiu.wang@nxp.com>
Subject: RE: [RFC PATCH 3/4] drm/etnaviv: Change order of enabling clocks to
 fix boot on i.MX8MM
Thread-Topic: [RFC PATCH 3/4] drm/etnaviv: Change order of enabling clocks to
 fix boot on i.MX8MM
Thread-Index: AQHWHu1XXaOrH0g5LUa6iTgqgfKJiaiRuzoAgAAQ8wCAAWANAA==
Date: Fri, 1 May 2020 12:36:43 +0000
Message-ID: <DB6PR0402MB276059A8D612ECBA8812379988AB0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200430124602.14463-1-frieder.schrempf@kontron.de>
 <20200430124602.14463-4-frieder.schrempf@kontron.de>
 <3895f202cf5919e41a56878a62f6d5259dea12d3.camel@pengutronix.de>
 <72e8618b-856e-de42-9282-958cd03b239f@kontron.de>
In-Reply-To: <72e8618b-856e-de42-9282-958cd03b239f@kontron.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kontron.de; dkim=none (message not signed)
 header.d=none;kontron.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [117.80.211.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dd022fd0-19ef-4527-b0c5-08d7edcc4e2a
x-ms-traffictypediagnostic: DB6PR0402MB2693:|DB6PR0402MB2693:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB26933799CE920046023BB5BE88AB0@DB6PR0402MB2693.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0390DB4BDA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5bTqiyBAY++NeG4ZDnd/YIrMCzypL2vWIRKVuetw89LQHOe3nlg3edVVAij2kAJQkS66lg0MrG22rFYX6YqHvAkPSsyAFz989QWErfmMAs40tAQ7PQNYZnsRzAli+68OWNdnZjnIfE7eW3+8h8/19cHpR6OrNjfRe+wB3OrD6NPdrj7HxPPMCY5I0Qm2fjAq5grCfRcJ0xV2MxEAMbc7Z6paJVLz1rnv9Qaw52Rvy5A0mb9kXHCyp9DCZzPnaYDxqehJyp/T708m59jIThATdHCQzF0rn8NN0lCQn8jKi5VD+FmpYhm+qWDT3131MabqY5rIno/Izy5ThdiiCi1dwb3Yy4Uie/6oQckJKBexL78Xg+HCMVtXg58O4sB0HzxE5d/N+vlKiHf3IKfdDIK9b0+7HgQg8M1suBqT153CEdJ4DgIyWzIjaL1nFAAiZUa5Vqfc6bcDEQfqdKMMM7h76+GN4+tZ5CDWR5cutzOQWSSJTfBcJnmRcitkEuUY19Rut2pGkLDz4bNMkV4WTuapdJZp71urnmVc6RhV3nFClW9Y5v9Hf3AE1ktAstbS+IC0X52W9sRhv/GjOsNKzBorKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(8676002)(5660300002)(44832011)(54906003)(8936002)(26005)(7696005)(186003)(86362001)(33656002)(966005)(9686003)(316002)(6506007)(53546011)(7416002)(4326008)(45080400002)(110136005)(52536014)(6636002)(71200400001)(55016002)(76116006)(66556008)(66476007)(83080400001)(66946007)(66446008)(64756008)(478600001)(2906002)(154233001)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: tSx1ffESOpM+8v4nMGrR5uUZ4Bc/vH0VQA30JHgvS0/TEo95o1lv804bcQo2PwoVnT91AFWhcDbAJ9c5cFdJFs2An7ZpDsEuw3URVL7039kDrSK0S3LMnzUO6kjZkVfRegM5LVVZo9rggDnvQo3X5+dpnJ3R5NbYPIEfts/CYErzkD32Ir6B8KovLHkUWomvMo/RgDff/Z2vKxkYNTaybW8tpVkJYarF1oL+XPjdo0P95Geo6ulU3+zgDCE8DIgTaQe/wXKToGL42Jjp/QC5PeD438IjIo82OcJyFc+Wx+i5xAoJswt0F0p6H73KaqGH+xNuE1XbJWzLRocudrDoygLYGMhSjLPOgWZICA4doSvxibg4PHVJsQVnEO8hMEfBycIC2+7OsJo4JeE0QSsNaEOOdzvPUePWff1YUTTuZOiPnHCE2f4qIRm7e4xmDJRzFUH+xi644EUC8cqsS2i3us9xjXdGSSpo20lhmLqUKzfBEvVb6dkV2MSVC9P817L7EV4belXmGod5+FpddOTPqomrgdga2XnYeHmtePq7Yx0XaaIj7SJGu+9ztN+7ksuMvz6YRB2nVkp3hQqJKeaAfSZXlj/WqTWbwGrGCdbXpseW7O8P6nu12nezm3aQc+t0RTZV9OHued6f/ylB2htIxtK+ErtWil68InJsnIytTau8tru2MEndO0GVqAdH/B3UICXYsVv7MSfmQjBvpXV3Lw1HUm7gz7GVZBo3TRJV7QT7Pttj/vcwKiiUmh5v2VqoC3J0rehPwYEcQEOiuqypvN6GNGTaWcv4ATTs3oMkhJI=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd022fd0-19ef-4527-b0c5-08d7edcc4e2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2020 12:36:43.5277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V66WV62PPen+FylOLq1CNkM4+tZdOb029lAvStzDa7wmKQo37B1HCXlKjYGTpp4hngxw+Zxa+oHRMPfSYQsN7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2693
X-Mailman-Approved-At: Sat, 02 May 2020 08:34:27 +0000
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Subject: Re: [RFC PATCH 3/4] drm/etnaviv: Change order of enabling clocks to
> fix boot on i.MX8MM
> 
> On 30.04.20 16:35, Lucas Stach wrote:
> > Am Donnerstag, den 30.04.2020, 12:46 +0000 schrieb Schrempf Frieder:
> >> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>
> >> On some i.MX8MM devices the boot hangs when enabling the GPU clocks.
> >> Changing the order of clock initalization to
> >>
> >> core -> shader -> bus -> reg
> >>
> >> fixes the issue. This is the same order used in the imx platform code
> >> of the downstream GPU driver in the NXP kernel [1]. For the sake of
> >> consistency we also adjust the order of disabling the clocks to the
> >> reverse.
> >>
> >> [1]
> >> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsou
> >>
> rce.codeaurora.org%2Fexternal%2Fimx%2Flinux-imx%2Ftree%2Fdrivers%2F
> mx
> >>
> c%2Fgpu-viv%2Fhal%2Fos%2Flinux%2Fkernel%2Fplatform%2Ffreescale%2Fgc
> _h
> >>
> al_kernel_platform_imx.c%3Fh%3Dimx_5.4.3_2.0.0%23n1538&amp;data=02
> %7C
> >>
> 01%7Cpeng.fan%40nxp.com%7Cdc7da53f665e4f567e3008d7ed1c27e0%7C6
> 86ea1d3
> >>
> bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637238577497969787&amp;sda
> ta=QRHzu
> >> C6gSKy%2F6y2FTRvlNF5t7DmJIvTgBESYKchI%2FDw%3D&amp;reserved=0
> >
> > I don't see why the order of the clocks is important. Is this really a
> > GPU issue? As in: does a GPU access hang when enabling the clocks in
> > the wrong order? Or is this a clock driver issue with a clock access
> > hanging due to an upstream clock still being disabled?
> 
> Actually you might be right with this being a clock driver issue. The hanging
> happens while enabling the clocks (unrelated to any GPU register access). The
> strange thing is that most of the devices we have don't care and work as is
> and some devices reliably fail each time when enabling the clocks in the
> "wrong" order.
> 
> So I guess this could indeed be some clock being enabled with an upstream
> PLL not having locked yet or something.

https://patchwork.kernel.org/cover/11433775/

Will this pachset help?

The i.MX8M CCM root mux code in Linux needs a fix.

Regards,
Peng.

> 
> >
> > Regards,
> > Lucas
> >
> >> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >> ---
> >>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 42
> +++++++++++++--------------
> >>   1 file changed, 21 insertions(+), 21 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> >> b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> >> index 7b138d4dd068..424b2e5951f0 100644
> >> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> >> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> >> @@ -1487,55 +1487,55 @@ static int etnaviv_gpu_clk_enable(struct
> etnaviv_gpu *gpu)
> >>   {
> >>   	int ret;
> >>
> >> -	if (gpu->clk_reg) {
> >> -		ret = clk_prepare_enable(gpu->clk_reg);
> >> +	if (gpu->clk_core) {
> >> +		ret = clk_prepare_enable(gpu->clk_core);
> >>   		if (ret)
> >>   			return ret;
> >>   	}
> >>
> >> -	if (gpu->clk_bus) {
> >> -		ret = clk_prepare_enable(gpu->clk_bus);
> >> +	if (gpu->clk_shader) {
> >> +		ret = clk_prepare_enable(gpu->clk_shader);
> >>   		if (ret)
> >> -			goto disable_clk_reg;
> >> +			goto disable_clk_core;
> >>   	}
> >>
> >> -	if (gpu->clk_core) {
> >> -		ret = clk_prepare_enable(gpu->clk_core);
> >> +	if (gpu->clk_bus) {
> >> +		ret = clk_prepare_enable(gpu->clk_bus);
> >>   		if (ret)
> >> -			goto disable_clk_bus;
> >> +			goto disable_clk_shader;
> >>   	}
> >>
> >> -	if (gpu->clk_shader) {
> >> -		ret = clk_prepare_enable(gpu->clk_shader);
> >> +	if (gpu->clk_reg) {
> >> +		ret = clk_prepare_enable(gpu->clk_reg);
> >>   		if (ret)
> >> -			goto disable_clk_core;
> >> +			goto disable_clk_bus;
> >>   	}
> >>
> >>   	return 0;
> >>
> >> -disable_clk_core:
> >> -	if (gpu->clk_core)
> >> -		clk_disable_unprepare(gpu->clk_core);
> >>   disable_clk_bus:
> >>   	if (gpu->clk_bus)
> >>   		clk_disable_unprepare(gpu->clk_bus);
> >> -disable_clk_reg:
> >> -	if (gpu->clk_reg)
> >> -		clk_disable_unprepare(gpu->clk_reg);
> >> +disable_clk_shader:
> >> +	if (gpu->clk_shader)
> >> +		clk_disable_unprepare(gpu->clk_shader);
> >> +disable_clk_core:
> >> +	if (gpu->clk_core)
> >> +		clk_disable_unprepare(gpu->clk_core);
> >>
> >>   	return ret;
> >>   }
> >>
> >>   static int etnaviv_gpu_clk_disable(struct etnaviv_gpu *gpu)
> >>   {
> >> +	if (gpu->clk_reg)
> >> +		clk_disable_unprepare(gpu->clk_reg);
> >> +	if (gpu->clk_bus)
> >> +		clk_disable_unprepare(gpu->clk_bus);
> >>   	if (gpu->clk_shader)
> >>   		clk_disable_unprepare(gpu->clk_shader);
> >>   	if (gpu->clk_core)
> >>   		clk_disable_unprepare(gpu->clk_core);
> >> -	if (gpu->clk_bus)
> >> -		clk_disable_unprepare(gpu->clk_bus);
> >> -	if (gpu->clk_reg)
> >> -		clk_disable_unprepare(gpu->clk_reg);
> >>
> >>   	return 0;
> >>   }
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
