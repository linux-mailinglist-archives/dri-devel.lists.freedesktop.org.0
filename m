Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E553411C891
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C404A6ECB7;
	Thu, 12 Dec 2019 08:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80102.outbound.protection.outlook.com [40.107.8.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1386EB4F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 13:28:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzO70vcgwCF41Eb3KWf/e7vjCkskQ4V4PzFc9+iIQOjolnaCGPCeGzGASYe87cQxFy7PkdlPWw6+1etuJZjL9f8wAG6a7USci+ESKAXdw4XIas/v+EZOIHxGe3N5EtqedH8Mr4y380lT/hDwsKESJMXazm3Jaw26Fnbib1ghOgQv9vXAHq63l4rOpjPAlD8wdZtmd+IHuvytaz8HLJ+Hr/Yl1LeJDnM64Etge0gEi6OtK2acX+OIQmW6z/tJM1l6IJD2Zeh+MQcF4HbFkYnF9psdwpFJWRrrxiHCE9Srzf9IlL16tIm4Utd/gmwrOb8+wpfdMkTObvMPRehgSsRuIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fobG7iXK3Vnr71c7kmaI6NzpYuDTJLkcz2urF3IzLjU=;
 b=WqwnreWWlQnrBJeKZqJRtBaNwx82XQv9HB/RqLk7DjplD7XZ8SSGcV+0lIux4KbnKkZvlqdY1H7MAYyGVSaKGgqyJGyvJTFdO9HQcA4hHtqNnvgMCFoSP+zdHUOae6GWGDZ7eOy8oNS4kLYkNJdRvNoKxE5bBfkDH5YK/buhBjX7kpBzPf9/bK8yFkoqyQuMU5+19zAHUPoRB94BHYgeLSu5fdu5/+YZK4EyuEdvl0LlATu9xpuPFoa2h/GOltOE4bipcPni5i3xvBByEzgj0Kd1T7iYPAMLJSsY7Pfxggj4HSeSuQBpYc/1QlfAZviCWiq1KLz1iXFLWNpXmm5/tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fobG7iXK3Vnr71c7kmaI6NzpYuDTJLkcz2urF3IzLjU=;
 b=S8QhF5CyTKNL9pfss6+YfhH/j+aARhqqsvWsQq1hQx+SRZ+fK/UANdiwzHqVH+bCeUCr/PeISCpvXfS8G1VPpWBPLsRi3MFQ7dym7vTMze6jESlUZBt20szUvl2Nxt47KoHG2Rwr68XehEG70SFSybyzP4e1yCxtzQqZp1Vzreg=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3451.eurprd02.prod.outlook.com (52.134.72.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Wed, 11 Dec 2019 13:28:24 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::446e:c4f8:7e59:1c6d]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::446e:c4f8:7e59:1c6d%7]) with mapi id 15.20.2516.019; Wed, 11 Dec 2019
 13:28:24 +0000
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
Thread-Index: AQHVr11DyxIz9S+dLEWyrkArJlSyg6ezeYGA///8moCAADjaAIABIyyAgAAc2oA=
Date: Wed, 11 Dec 2019 13:28:24 +0000
Message-ID: <b5ea01da-5345-05cf-9f89-b7123dbbb893@axentia.se>
References: <1575984287-26787-1-git-send-email-claudiu.beznea@microchip.com>
 <1575984287-26787-5-git-send-email-claudiu.beznea@microchip.com>
 <4c3ffc48-7aa5-1e48-b0e9-a50c4eea7c38@axentia.se>
 <5fbad2cd-0dbe-0be5-833a-f7a612d48012@microchip.com>
 <2272669c-38ee-1928-9563-46755574897c@axentia.se>
 <167cb87e-b189-71fd-0a79-adf89336d1f3@microchip.com>
In-Reply-To: <167cb87e-b189-71fd-0a79-adf89336d1f3@microchip.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR05CA0285.eurprd05.prod.outlook.com
 (2603:10a6:7:93::16) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10076e51-e796-4c5e-18c8-08d77e3dff8a
x-ms-traffictypediagnostic: DB3PR0202MB3451:
x-microsoft-antispam-prvs: <DB3PR0202MB34519BCF7196AC79E6F700C9BC5A0@DB3PR0202MB3451.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 024847EE92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(396003)(346002)(39830400003)(376002)(199004)(189003)(7416002)(81166006)(81156014)(6486002)(66446008)(64756008)(6512007)(66946007)(4001150100001)(31686004)(66476007)(66556008)(8676002)(5660300002)(2906002)(186003)(2616005)(36756003)(8936002)(6506007)(71200400001)(52116002)(110136005)(54906003)(316002)(86362001)(53546011)(26005)(31696002)(4326008)(508600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3451;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1DeSgWEvYFuSFysNUIoAfzx9XIYylvJD9zTflE7YSxgU5G+gJhapKXqSdzZXnzfTswxlDfF9Lh5eQaS2jCDNZsWygZygVpe7WzU0BdlApl3V2+KB+qddD6Q9u9FzBuQDALn/0PEogtVy0SiTz0PQNAsGLgvmHigCt9lPz3RTtvuO8YRMXfUyrFyvqonwI0fUgipr5DHdc15Rin8v1XxOf0rik1oQk495OXlXd5pB7kB5DeUMDWp8kAlwkhW/ejXpPUCYTP5MTwcHp+KOhr7ZvSFYuQNWRNvtymv5LGlbZ9IlCJqen4pchUsEjLR4ckrnc4Uphuq2uu2/P4yK7ik9mXvysAuoqWnUwPvIg99b8IsPkJwwKIMcGmshZ9kNwSkDCVQQxrikPaU85LzY4+2fz1sTlHACtFcAHyGlDN2jnL1RX9IZnPx4Fq/fP/rfJ31S
x-ms-exchange-transport-forked: True
Content-ID: <6EA23D3E9801C6479DB9954F58F85094@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 10076e51-e796-4c5e-18c8-08d77e3dff8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2019 13:28:24.3048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sk7yPS9LhC1PGTHv8YujCt8ZuUvCQEegprgQ65677S4Nb4s6Z9uc/DdZyYHcMaR9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3451
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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

On 2019-12-11 12:45, Claudiu.Beznea@microchip.com wrote:
> 
> 
> On 10.12.2019 19:22, Peter Rosin wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 2019-12-10 15:59, Claudiu.Beznea@microchip.com wrote:
>>>
>>>
>>> On 10.12.2019 16:11, Peter Rosin wrote:
>>>> On 2019-12-10 14:24, Claudiu Beznea wrote:
>>>>> This reverts commit f6f7ad3234613f6f7f27c25036aaf078de07e9b0.
>>>>> ("drm/atmel-hlcdc: allow selecting a higher pixel-clock than requested")
>>>>> because allowing selecting a higher pixel clock may overclock
>>>>> LCD devices, not all of them being capable of this.
>>>>
>>>> Without this patch, there are panels that are *severly* underclocked (on the
>>>> magnitude of 40MHz instead of 65MHz or something like that, I don't remember
>>>> the exact figures).
>>>
>>> With patch that switches by default to 2xsystem clock for pixel clock, if
>>> using 133MHz system clock (as you specified in the patch I proposed for
>>> revert here) that would go, without this patch at 53MHz if 65MHz is
>>> requested. Correct me if I'm wrong.
>>
>> It might have been 53MHz, whatever it was it was too low for things to work.
>>
>>>> And they are of course not capable of that. All panels
>>>> have *some* slack as to what frequencies are supported, and the patch was
>>>> written under the assumption that the preferred frequency of the panel was
>>>> requested, which should leave at least a *little* headroom.
>>>
>>> I see, but from my point of view, the upper layers should decide what
>>> frequency settings should be done on the LCD controller and not let this at
>>>  the driver's latitude.
>>
>> Right, but the upper layers do not support negotiating a frequency from
>> ranges. At least the didn't when the patch was written, and implementing
>> *that* seemed like a huge undertaking.
>>
>>>>
>>>> So, I'm curious as to what panel regressed. Or rather, what pixel-clock it needs
>>>> and what it gets with/without the patch?
>>>
>>> I have 2 use cases:
>>> 1/ system clock = 200MHz and requested pixel clock (mode_rate) ~71MHz. With
>>> the reverted patch the resulted computed pixel clock would be 80MHz.
>>> Previously it was at 66MHz
>>
>> I don't see how that's possible.
>>
>> [doing some calculation by hand]
>>
>> Arrgh. *blush*
>>
>> The code does not do what I intended for it to do.
>> Can you please try this instead of reverting?
>>
>> Cheers,
>> Peter
>>
>> From b3e86d55b8d107a5c07e98f879c67f67120c87a6 Mon Sep 17 00:00:00 2001
>> From: Peter Rosin <peda@axentia.se>
>> Date: Tue, 10 Dec 2019 18:11:28 +0100
>> Subject: [PATCH] drm/atmel-hlcdc: prefer a lower pixel-clock than requested
>>
>> The intention was to only select a higher pixel-clock rate than the
>> requested, if a slight overclocking would result in a rate significantly
>> closer to the requested rate than if the conservative lower pixel-clock
>> rate is selected. The fixed patch has the logic the other way around and
>> actually prefers the higher frequency. Fix that.
>>
>> Fixes: f6f7ad323461 ("drm/atmel-hlcdc: allow selecting a higher pixel-clock than requested")
>> Reported-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>> Signed-off-by: Peter Rosin <peda@axentia.se>
>> ---
>>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> index 9e34bce089d0..03691845d37a 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> @@ -120,8 +120,8 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>>                 int div_low = prate / mode_rate;
>>
>>                 if (div_low >= 2 &&
>> -                   ((prate / div_low - mode_rate) <
>> -                    10 * (mode_rate - prate / div)))
>> +                   (10 * (prate / div_low - mode_rate) <
>> +                    (mode_rate - prate / div)))
> 
> I tested it on my setup (I have only one of those specified above) and it
> is OK. Doing some math for the other setup it should also be OK.

Glad to hear it, and thanks for testing/verifying!

> As a whole, I'm OK with this at the moment (let's hope it will work for all
> use-cases) but still I am not OK with selecting here, in the driver,
> something that might work.

The driver has to select *something*. If it can deliver the exact requested
frequency, fine. Otherwise? What should it do? Bail out? Why is 53MHz better
and more likely to produce a picture than 66MHz, when 65MHz is requested?
That's of course an impossible question for the driver to answer.

So, if you are not ok with that, you need to implement something that uses
the min/max fields from the various fields inside struct display_timing
instead of only looking at the typ field. E.g. the panel_lvds driver calls
videomode_from_timings() and the result is a single possible mode with only
the typical timings, with no negotiation of the best option within the
given ranges with the other drivers involved with the pipe. I think the
panel-simple driver also makes this one-sided decision of only making use
of the typ field for each given timing range. Having dabbled a bit in what
the sound stack does to negotiate the sample rate, sample format and
channel count etc, I can only predict that retrofitting something like that
for video modes will be ... interesting. Which is probably why it's not
done at all, at least not in the general case.

And yes, I agree, the current mechanics are less than ideal. But I have no
time to do anything about it.

>                            Although I am not familiar with how other DRM
> drivers are handling this kind of scenarios. Maybe you and/or other DRM
> guys knows more about it.

I don't know (and I mean it literally), but maybe these chips are special
as they typically end up with very small dividers and thus large frequency
steps? BTW, I do not consider myself a DRM guy, I have only tried to
fix that which did not work out for our needs...

> Just as a notice, it may worth adding a print message saying what was
> frequency was requested and what frequency has been setup by driver.

I have no problem with that.

Cheers,
Peter

> 
>>                         /*
>>                          * At least 10 times better when using a higher
>>                          * frequency than requested, instead of a lower.
>> --
>> 2.20.1
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
