Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B50DE11A6B6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E116EAB5;
	Wed, 11 Dec 2019 09:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30125.outbound.protection.outlook.com [40.107.3.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BD06E0ED
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 14:11:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/gb4A0x5jrXXvFU7/2iRyVL0b+h0DBHJNLNUhH5bDJ3U0yFgoNeuQfpJ8h+/N9ZplyHAN0MxPi86esVfClCSfmh/jx7fHmKmtCMwqrdLz2nwSOLJKu/l+C7mDemyPyNKzPESYdXkmMqOHYaU9z2Hv/vlY1hJnchzRLAiy9+rAysqheoiOd3QrPBB89TFq60dJwcgKDiTnUzji5vHBiSXRvZCKUoy8N4ZZePcdCuDGHxglsrsOAikPPCM5jU5zJRxdRQSfUrsUwLYUpectrUK/B/8sd2PZfMQ0d0lOKyiB8givVPC39+3LnJtcc44qithFQEDUUuf6PTXHu2d/rM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qvrvq8CaDXNQ9H+KopgVoVi5iINM1NaNrife4f9usCg=;
 b=MbmjK9FkTcjjT7JMN3zplyOHA/tP9jpWLdhLSDHfgKzV45xMTvcIyv3zvmm547rw+A0v6xrTyXBtB93Qih6Fom3HkJQ5lqeC3gol/40dDgR4MD1aIZkEEbhzw0SuIFuYcIWCnm9e/9QxUemxpT6u3JviY3mnVddrgpkf17iTDJ/w7dVls/9DEM+BvlcbJKKbq++Gl1t2dLx/Y3IS8u1igJ0tVmWMsqb4OtZ1+f+Jw1Zd2ie4qgp1edSgMHonQVs7lqrlJxzymr7kiVmPxT31vgLjPwVU0Ond3vniEqxKQ++5ZKgxUehoi3mA0/GQoD/HwMSfkolbSHRXzojA2Sguyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qvrvq8CaDXNQ9H+KopgVoVi5iINM1NaNrife4f9usCg=;
 b=M2Synzj9fviy4cdNQtbHPsIsH5Ps9/Ou+uhHuAnHfUklim6uOvdh/CZ/BdvtCOd5XqR2ElqDwX/nd7pRyuOGMS+dfV+IEF6ceZkLuQRISVzxFlZAyvzenLlP9UpTSgHlfmpfUzpqMmLEnlMR6GORy2aPilMvpiB8XQgliqcSYmw=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3308.eurprd02.prod.outlook.com (52.134.66.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Tue, 10 Dec 2019 14:11:40 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::446e:c4f8:7e59:1c6d]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::446e:c4f8:7e59:1c6d%7]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 14:11:40 +0000
From: Peter Rosin <peda@axentia.se>
To: Claudiu Beznea <claudiu.beznea@microchip.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [PATCH 4/5] Revert "drm/atmel-hlcdc: allow selecting a higher
 pixel-clock than requested"
Thread-Topic: [PATCH 4/5] Revert "drm/atmel-hlcdc: allow selecting a higher
 pixel-clock than requested"
Thread-Index: AQHVr11DyxIz9S+dLEWyrkArJlSyg6ezaL2A
Date: Tue, 10 Dec 2019 14:11:40 +0000
Message-ID: <4c3ffc48-7aa5-1e48-b0e9-a50c4eea7c38@axentia.se>
References: <1575984287-26787-1-git-send-email-claudiu.beznea@microchip.com>
 <1575984287-26787-5-git-send-email-claudiu.beznea@microchip.com>
In-Reply-To: <1575984287-26787-5-git-send-email-claudiu.beznea@microchip.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR05CA0270.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::22) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e50c755-22b3-45c4-74b8-08d77d7ae08a
x-ms-traffictypediagnostic: DB3PR0202MB3308:
x-microsoft-antispam-prvs: <DB3PR0202MB3308F4AE247A89CE60F74E17BC5B0@DB3PR0202MB3308.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(376002)(39830400003)(396003)(366004)(189003)(199004)(4326008)(81166006)(31686004)(81156014)(8676002)(6512007)(7416002)(6486002)(2906002)(64756008)(66446008)(36756003)(8936002)(186003)(66476007)(26005)(66946007)(5660300002)(66556008)(31696002)(53546011)(6506007)(86362001)(110136005)(508600001)(316002)(4001150100001)(2616005)(52116002)(54906003)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3308;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q4EvAuHaAQdvD6ziEE3XbKAt8mT4satyB9J1v7FnuVcKwoG+XHt2fUSvLdNMoIwk3BUpMKVIKpTvTV2CBPCNMyJFLzDXyRzsorlfrndXeE4SsCIxpEYtr28R9NkDzycyNsVqIKHBRkCJOy9h1sjX88HIHdzQ8U3YHa1orX8zuT+74rzbphxy/CUjnD6T/+4ZV3DgSJKlRg6K5lZa0NKX28jybLvAevI+S+egmJiHBH+cQHCerGaQ0z/LCNT3KCO8JFDQSsWpVqyvnlga8cfwbFmUTAMpsC2rwQ+rQIVXNDmHJ3p6xXdgWuLRhrJXadpfigX6UXH7k1snYz5GBDa38kcY0R1VWaitjCurAQcl3nJrM3e19px4Um633kmomfRkDS27ojF94LTaEVhvtFUdKAVdliuCy55gT4Qwv+toEzy6BFk5Mx4bpizsrnLYOMgk
x-ms-exchange-transport-forked: True
Content-ID: <432D8DF437FB454DBA44BABA59C50F33@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e50c755-22b3-45c4-74b8-08d77d7ae08a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 14:11:40.4695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 32cSkY93M5SVwRzmoy+/2P6MBw12UNBPZq+16FWrHVdU6yPStdDObjOwTGWK6HRJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3308
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2019-12-10 14:24, Claudiu Beznea wrote:
> This reverts commit f6f7ad3234613f6f7f27c25036aaf078de07e9b0.
> ("drm/atmel-hlcdc: allow selecting a higher pixel-clock than requested")
> because allowing selecting a higher pixel clock may overclock
> LCD devices, not all of them being capable of this.

Without this patch, there are panels that are *severly* underclocked (on the
magnitude of 40MHz instead of 65MHz or something like that, I don't remember
the exact figures). And they are of course not capable of that. All panels
have *some* slack as to what frequencies are supported, and the patch was
written under the assumption that the preferred frequency of the panel was
requested, which should leave at least a *little* headroom.

So, I'm curious as to what panel regressed. Or rather, what pixel-clock it needs
and what it gets with/without the patch?

Or is the revert based on some theory of a perceived risk of toasting a panel?

In short, this revert regresses my use case and I would like at least a hook to
re-enable the removed logic.

Cheers,
Peter

> Cc: Peter Rosin <peda@axentia.se>
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index 721fa88bf71d..1a70dff1a417 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -117,18 +117,6 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>  		div = DIV_ROUND_UP(prate, mode_rate);
>  		if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK)
>  			div = ATMEL_HLCDC_CLKDIV_MASK;
> -	} else {
> -		int div_low = prate / mode_rate;
> -
> -		if (div_low >= 2 &&
> -		    ((prate / div_low - mode_rate) <
> -		     10 * (mode_rate - prate / div)))
> -			/*
> -			 * At least 10 times better when using a higher
> -			 * frequency than requested, instead of a lower.
> -			 * So, go with that.
> -			 */
> -			div = div_low;
>  	}
>  
>  	cfg |= ATMEL_HLCDC_CLKDIV(div);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
