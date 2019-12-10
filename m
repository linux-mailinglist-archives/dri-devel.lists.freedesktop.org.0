Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7947A11A6D8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3DB6EAC8;
	Wed, 11 Dec 2019 09:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40097.outbound.protection.outlook.com [40.107.4.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011028922B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 17:23:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dj4RO5GdrGGL818zgMCLRYNKR4nwtuF4lN4p1ijsrmO7zWAASVmZaUEZrYDeVNxkYwVF4FimmjHH04gwlseqgXfn1edGQbYtplkGv+40qBOv8P/9PYAExBf1fuPFWoQOXauD/bu7Ir1QJYFd1H09D6C7Fpr9qR44fjRzmxYyDcZ6Pi1UwfuZ0owEd6VZJkh/bUc7VDl+Y20pLdu7VGX9ZlYrb4iJP6xVRtbOEDMjwxwhnl1vzRLBqQKVHQoLXGN5Wc5F+g4Rvij7e2+TMlaY3HJIfatkbobxZ5ES9fU2aIRB2bN8b+DQZFQQADNie3/mP5BitdzjEyivp6ZUGFt49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgN6TM3hsDnuQ8kp6yYGCwfMb96CSmuVN2j36F1JCVE=;
 b=JLIvjpgHUo3v289XG21j9pwKknIByGKr5/Bb20yql2gxvWApdKubb5oI+bQG1Lkwng6MRahaYr88BxL0CUfNifiEM5NYieG6SfHOrd8OnN68OIrEFYfM4cfsYfG8LovpvAbcX8Go/enihN86hJOEznYOP7zcvIJzOgWM+ypPYSi361iWfApvp1rBc6VMd9jY69Mns8d/Z7ks9XG19Is3BIPcnlyUFr93PWLubC2jZKewqPTIvEMxSdfcV1iZoucIqfhaRcZX2FAI1XlwG/lYFvFzugoPmichTpmfv+QkEWdob2IqrEaNJyDRR8jZ1zKLJ7YsOWO88OljSMZsGsc6MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgN6TM3hsDnuQ8kp6yYGCwfMb96CSmuVN2j36F1JCVE=;
 b=b6I/X2gnCwn+i7tNsDKdKb7btOBfCLzsJ64TCBXFN7YTXg+EFl9fJikcry385U/UmriyrZqnBDUFHre5ziKsaZfU0kKyb3PQgtywvXO9HD113j9shm8ByZOzIEntBq8dNHQ0HScRbl0RQkOn7Bsh/G3FOVjKQ42fNP705//xJo8=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3404.eurprd02.prod.outlook.com (52.134.68.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.17; Tue, 10 Dec 2019 17:22:59 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::446e:c4f8:7e59:1c6d]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::446e:c4f8:7e59:1c6d%7]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 17:22:59 +0000
From: Peter Rosin <peda@axentia.se>
To: "Claudiu.Beznea@microchip.com" <Claudiu.Beznea@microchip.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "bbrezillon@kernel.org"
 <bbrezillon@kernel.org>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Nicolas.Ferre@microchip.com"
 <Nicolas.Ferre@microchip.com>, "alexandre.belloni@bootlin.com"
 <alexandre.belloni@bootlin.com>, "Ludovic.Desroches@microchip.com"
 <Ludovic.Desroches@microchip.com>, "lee.jones@linaro.org"
 <lee.jones@linaro.org>
Subject: Re: [PATCH 4/5] Revert "drm/atmel-hlcdc: allow selecting a higher
 pixel-clock than requested"
Thread-Topic: [PATCH 4/5] Revert "drm/atmel-hlcdc: allow selecting a higher
 pixel-clock than requested"
Thread-Index: AQHVr11DyxIz9S+dLEWyrkArJlSyg6ezeYGA///8moCAACgWAA==
Date: Tue, 10 Dec 2019 17:22:59 +0000
Message-ID: <2272669c-38ee-1928-9563-46755574897c@axentia.se>
References: <1575984287-26787-1-git-send-email-claudiu.beznea@microchip.com>
 <1575984287-26787-5-git-send-email-claudiu.beznea@microchip.com>
 <4c3ffc48-7aa5-1e48-b0e9-a50c4eea7c38@axentia.se>
 <5fbad2cd-0dbe-0be5-833a-f7a612d48012@microchip.com>
In-Reply-To: <5fbad2cd-0dbe-0be5-833a-f7a612d48012@microchip.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR05CA0158.eurprd05.prod.outlook.com
 (2603:10a6:7:28::45) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5b200d6-3e3d-4dd8-e48d-08d77d959a60
x-ms-traffictypediagnostic: DB3PR0202MB3404:
x-microsoft-antispam-prvs: <DB3PR0202MB3404FB03D7D4B79D2D8C093CBC5B0@DB3PR0202MB3404.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(39840400004)(346002)(396003)(136003)(189003)(199004)(2616005)(36756003)(6486002)(66476007)(4001150100001)(31686004)(316002)(81166006)(66946007)(66446008)(508600001)(64756008)(66556008)(4326008)(86362001)(26005)(6512007)(53546011)(2906002)(54906003)(186003)(7416002)(52116002)(81156014)(31696002)(8936002)(8676002)(71200400001)(6506007)(5660300002)(110136005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3404;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hbhh7sNwcJR+jAohzN4/z9SxPwL49VDMzyeQuwInotkK5KgOQrUFk7CNhedaAzgCUA9D04u0G1tPkOIxMY4Lh+X5/FtqTXj/Ck5SSWMwm2ZwZv8KbpX9KHqiKwmfQ09qmwC1SFaRT9r+3WlUPE0+DTYhmqIkash17NGTwOapCbREhzXA72CewIwvY95Ao5nqicgwIrvWKmoy+nHXFxcaJqUkhvncgnXKfWLIWh8aX4THbYNKP7teyKxu8GnC7OsfXDabK/xBcQ5crao2BdhE/eIV0I37RYUP7NdH7YvvvHBGpUCChvsflXgIsTPqkzQeJcgD6abNHm5K7gRm9VqK4+oYOSXiQQKIdTl3Xma/mwKs4oBYU250efqX61FVUCLX8pBJ4Pu1qUpKM62Aync8Y9jmStkmwQMO1OA4oXDJhfWo0YEsnZkYivPbjptNGOcz
x-ms-exchange-transport-forked: True
Content-ID: <A9E8A3325A99654699E1B825FC51ECCC@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b200d6-3e3d-4dd8-e48d-08d77d959a60
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 17:22:59.1933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kT2mTsS0ZoZwTo6Gr5jeIc8W62MJ0u/U+VfnLh2luKNqwCrZTiV550uhEzq7Jx1J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3404
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

On 2019-12-10 15:59, Claudiu.Beznea@microchip.com wrote:
> 
> 
> On 10.12.2019 16:11, Peter Rosin wrote:
>> On 2019-12-10 14:24, Claudiu Beznea wrote:
>>> This reverts commit f6f7ad3234613f6f7f27c25036aaf078de07e9b0.
>>> ("drm/atmel-hlcdc: allow selecting a higher pixel-clock than requested")
>>> because allowing selecting a higher pixel clock may overclock
>>> LCD devices, not all of them being capable of this.
>>
>> Without this patch, there are panels that are *severly* underclocked (on the
>> magnitude of 40MHz instead of 65MHz or something like that, I don't remember
>> the exact figures). 
> 
> With patch that switches by default to 2xsystem clock for pixel clock, if
> using 133MHz system clock (as you specified in the patch I proposed for
> revert here) that would go, without this patch at 53MHz if 65MHz is
> requested. Correct me if I'm wrong.

It might have been 53MHz, whatever it was it was too low for things to work.

>> And they are of course not capable of that. All panels
>> have *some* slack as to what frequencies are supported, and the patch was
>> written under the assumption that the preferred frequency of the panel was
>> requested, which should leave at least a *little* headroom.
> 
> I see, but from my point of view, the upper layers should decide what
> frequency settings should be done on the LCD controller and not let this at
>  the driver's latitude.

Right, but the upper layers do not support negotiating a frequency from
ranges. At least the didn't when the patch was written, and implementing
*that* seemed like a huge undertaking.

>>
>> So, I'm curious as to what panel regressed. Or rather, what pixel-clock it needs
>> and what it gets with/without the patch?
> 
> I have 2 use cases:
> 1/ system clock = 200MHz and requested pixel clock (mode_rate) ~71MHz. With
> the reverted patch the resulted computed pixel clock would be 80MHz.
> Previously it was at 66MHz

I don't see how that's possible.

[doing some calculation by hand]

Arrgh. *blush*

The code does not do what I intended for it to do.
Can you please try this instead of reverting?

Cheers,
Peter

From b3e86d55b8d107a5c07e98f879c67f67120c87a6 Mon Sep 17 00:00:00 2001
From: Peter Rosin <peda@axentia.se>
Date: Tue, 10 Dec 2019 18:11:28 +0100
Subject: [PATCH] drm/atmel-hlcdc: prefer a lower pixel-clock than requested

The intention was to only select a higher pixel-clock rate than the
requested, if a slight overclocking would result in a rate significantly
closer to the requested rate than if the conservative lower pixel-clock
rate is selected. The fixed patch has the logic the other way around and
actually prefers the higher frequency. Fix that.

Fixes: f6f7ad323461 ("drm/atmel-hlcdc: allow selecting a higher pixel-clock than requested")
Reported-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 9e34bce089d0..03691845d37a 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -120,8 +120,8 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 		int div_low = prate / mode_rate;
 
 		if (div_low >= 2 &&
-		    ((prate / div_low - mode_rate) <
-		     10 * (mode_rate - prate / div)))
+		    (10 * (prate / div_low - mode_rate) <
+		     (mode_rate - prate / div)))
 			/*
 			 * At least 10 times better when using a higher
 			 * frequency than requested, instead of a lower.
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
