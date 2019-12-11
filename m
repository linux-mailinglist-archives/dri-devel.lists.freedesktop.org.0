Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E79C11C893
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BFE6ECBE;
	Thu, 12 Dec 2019 08:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 11 Dec 2019 11:52:15 UTC
Received: from esa1.microchip.iphmx.com (esa1.microchip.iphmx.com
 [68.232.147.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABBB6E141
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 11:52:15 +0000 (UTC)
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Claudiu.Beznea@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="Claudiu.Beznea@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: DfIdp8VjNltaXMRNXaJvTbFNoYSAYsak/0q7gywIDKwfvwNMXFlLYJB+0ebbv+fuJui3kCv97x
 4dZtOKVKOf3KYCQZvtN0WHxtqZmVAnO0tBtKkcsoFgTc6qol9UAwrLUMvItsomH5ml647urKUf
 X8meClyxFD4rntHwwbnVv+29Ct8WH85f3k6D5PUd1z7fYVEPCqIfErepcnIwwwQIYir3Y8azol
 zfi/P0BmipMENlC3Lha4rTdiriDtZxPIuYZt0zqplVXdw6Dp7jdevG4GPP1Mep4q6PMdTSRHdI
 hy0=
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="61351831"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Dec 2019 04:45:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Dec 2019 04:45:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 11 Dec 2019 04:45:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhfiQ88WkCgs6bPefm720P/efqK+HzlF/OuAZKx7wcRVXbvpwRQlVRLQh7FID78t2I7u9uG3LN1nK1+oNOs7aEvn4U2ilysbmBJHYr1ArtSXARhEO0XhKbeB8muvmvDZ0p087MTQJp8BF+OBiMZgsNBh6OMg4ZIQnNi603cBDegwDcKDuwnCsWzwwXJ6DjwRWP8ZOWw+KxxAGKCI56DYiwl+mzJYO5PHRWUunvw+ldv6Vm+J2Y/MwRN5ZY/OiQ+fvp/WHiJx9xPjXA7H/BEcjJgRdY9YkJXxHjF79eKAngx2xzZpWRTiXvf5x4b3aq3vkQMp0A29IxXAkppWNglzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGPxMDefpO3kz7dNeiCxXgFkQB0e2YiUbEwYP5llBFQ=;
 b=M6zct/8ZvaG09sTSWFgkJkkci/tWGK7Hc/kC0zaubSYRPaJRuXCcgRlljCYHeYT9ZM0w9nio3Z4JXdYNeCl3/bJbhYepsK1yeZYe+UdcpjopHBcvPFoN0uKKvRqmgwKtuHTHR5em+f99KrDAzytJ0LJEDU/2x3F1XMyzGWtoJFj7pubq30b/j9RObYO+1to/kOI/9NSyv6zWiaeJyY876ab2X7E5Tiya9NgRZo8WvsJOBsw28QN2GJf+28diW+6UxoRXo2FS6ZrLeYbqXSWWlXvyy3aX8iP3VrH3CmMIrjNdKkWkAoHJiTPCkTTs67ioA8/9sMSUd+pLgBAsEAEqtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGPxMDefpO3kz7dNeiCxXgFkQB0e2YiUbEwYP5llBFQ=;
 b=mzXudpHod5i76Pk0dkEOadN0aKigNOX77V5NzBRfk9ud/HRgG0yhewhahAP44Uw8g92soA3ggia9uHoLboqvaHJYBES4IZOYYa88e3CVjZoykIcMGDMReTU/BfM6FZPkZJYFiir3vlfOAQt5Q9ZzJhSuRyxlPaeZpej6viwp/qc=
Received: from DM6PR11MB3225.namprd11.prod.outlook.com (20.176.120.224) by
 DM6PR11MB2860.namprd11.prod.outlook.com (20.176.96.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Wed, 11 Dec 2019 11:45:05 +0000
Received: from DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::ed7d:d06f:7d55:cbe2]) by DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::ed7d:d06f:7d55:cbe2%6]) with mapi id 15.20.2538.012; Wed, 11 Dec 2019
 11:45:05 +0000
From: <Claudiu.Beznea@microchip.com>
To: <peda@axentia.se>, <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <lee.jones@linaro.org>
Subject: Re: [PATCH 4/5] Revert "drm/atmel-hlcdc: allow selecting a higher
 pixel-clock than requested"
Thread-Topic: [PATCH 4/5] Revert "drm/atmel-hlcdc: allow selecting a higher
 pixel-clock than requested"
Thread-Index: AQHVr11ICLJHO/IKjE+yoyNQ0RZUOA==
Date: Wed, 11 Dec 2019 11:45:05 +0000
Message-ID: <167cb87e-b189-71fd-0a79-adf89336d1f3@microchip.com>
References: <1575984287-26787-1-git-send-email-claudiu.beznea@microchip.com>
 <1575984287-26787-5-git-send-email-claudiu.beznea@microchip.com>
 <4c3ffc48-7aa5-1e48-b0e9-a50c4eea7c38@axentia.se>
 <5fbad2cd-0dbe-0be5-833a-f7a612d48012@microchip.com>
 <2272669c-38ee-1928-9563-46755574897c@axentia.se>
In-Reply-To: <2272669c-38ee-1928-9563-46755574897c@axentia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR04CA0146.eurprd04.prod.outlook.com (2603:10a6:207::30)
 To DM6PR11MB3225.namprd11.prod.outlook.com
 (2603:10b6:5:5b::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191211134458152
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 149f0763-8673-458a-b75b-08d77e2f90bc
x-ms-traffictypediagnostic: DM6PR11MB2860:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB28601B518B922837437AECFD875A0@DM6PR11MB2860.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 024847EE92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(346002)(396003)(39860400002)(376002)(189003)(199004)(7416002)(36756003)(86362001)(81166006)(66556008)(110136005)(6512007)(31686004)(2616005)(6486002)(31696002)(66946007)(66476007)(316002)(8676002)(2906002)(71200400001)(5660300002)(478600001)(66446008)(4001150100001)(64756008)(6506007)(8936002)(4326008)(52116002)(186003)(26005)(81156014)(54906003)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR11MB2860;
 H:DM6PR11MB3225.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wQkHWgJnnt+YTqNaa30cXX0QFg3UqsNjy7/Uirpu/KMSYz1aBkALWqAlTvSUcHGl+WKHiaFQIkche8ZcgJkgpV59x6QvZoy59E1I72p3p1xmEoN6DHVj1ygVre9zQoiDxhimC8LsMcU8s3JPfiUVZchQQkuYE8YJ6jRXGrsozfSORJXUhGaZFamJKJlDe7lLHGNzocFku7GAhrtkIfTubryrTZ1mwd5XBUdrQdEnWK/TnItAGraatUMHw6pWAwZEasi5pyzc/qyMWCOFPTwloICUKdirJCOiscOd7PnuylZt1HkKKoSDw5NWMrY59dCIJhIQIFxtfSkCr/fPhqKfm/7CHnN2HRH8lI1b0auVX1YxfoSQ8FGrR3cksZ0HDdxV2kwp2g2w+eSgWJ12zhUnrMNR9q3G5vtpYwDrv+VdxEjA/zpTcyZA+Vu8vr3Bfvob
Content-ID: <DB250B37A69CC644BC5A8E6C8C0A9EBD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 149f0763-8673-458a-b75b-08d77e2f90bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2019 11:45:05.3973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z3o+U/JYA8x8EZnCGpZXuYefdU8kmI8IqLZ7tqPxJyPuYOkcPE+MJB7rE0cx1EfJZCRUqWfl0z30yyKXiYVnl2qO/jeKsJMfkKknntX1HtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2860
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10.12.2019 19:22, Peter Rosin wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 2019-12-10 15:59, Claudiu.Beznea@microchip.com wrote:
>>
>>
>> On 10.12.2019 16:11, Peter Rosin wrote:
>>> On 2019-12-10 14:24, Claudiu Beznea wrote:
>>>> This reverts commit f6f7ad3234613f6f7f27c25036aaf078de07e9b0.
>>>> ("drm/atmel-hlcdc: allow selecting a higher pixel-clock than requested")
>>>> because allowing selecting a higher pixel clock may overclock
>>>> LCD devices, not all of them being capable of this.
>>>
>>> Without this patch, there are panels that are *severly* underclocked (on the
>>> magnitude of 40MHz instead of 65MHz or something like that, I don't remember
>>> the exact figures).
>>
>> With patch that switches by default to 2xsystem clock for pixel clock, if
>> using 133MHz system clock (as you specified in the patch I proposed for
>> revert here) that would go, without this patch at 53MHz if 65MHz is
>> requested. Correct me if I'm wrong.
> 
> It might have been 53MHz, whatever it was it was too low for things to work.
> 
>>> And they are of course not capable of that. All panels
>>> have *some* slack as to what frequencies are supported, and the patch was
>>> written under the assumption that the preferred frequency of the panel was
>>> requested, which should leave at least a *little* headroom.
>>
>> I see, but from my point of view, the upper layers should decide what
>> frequency settings should be done on the LCD controller and not let this at
>>  the driver's latitude.
> 
> Right, but the upper layers do not support negotiating a frequency from
> ranges. At least the didn't when the patch was written, and implementing
> *that* seemed like a huge undertaking.
> 
>>>
>>> So, I'm curious as to what panel regressed. Or rather, what pixel-clock it needs
>>> and what it gets with/without the patch?
>>
>> I have 2 use cases:
>> 1/ system clock = 200MHz and requested pixel clock (mode_rate) ~71MHz. With
>> the reverted patch the resulted computed pixel clock would be 80MHz.
>> Previously it was at 66MHz
> 
> I don't see how that's possible.
> 
> [doing some calculation by hand]
> 
> Arrgh. *blush*
> 
> The code does not do what I intended for it to do.
> Can you please try this instead of reverting?
> 
> Cheers,
> Peter
> 
> From b3e86d55b8d107a5c07e98f879c67f67120c87a6 Mon Sep 17 00:00:00 2001
> From: Peter Rosin <peda@axentia.se>
> Date: Tue, 10 Dec 2019 18:11:28 +0100
> Subject: [PATCH] drm/atmel-hlcdc: prefer a lower pixel-clock than requested
> 
> The intention was to only select a higher pixel-clock rate than the
> requested, if a slight overclocking would result in a rate significantly
> closer to the requested rate than if the conservative lower pixel-clock
> rate is selected. The fixed patch has the logic the other way around and
> actually prefers the higher frequency. Fix that.
> 
> Fixes: f6f7ad323461 ("drm/atmel-hlcdc: allow selecting a higher pixel-clock than requested")
> Reported-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index 9e34bce089d0..03691845d37a 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -120,8 +120,8 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>                 int div_low = prate / mode_rate;
> 
>                 if (div_low >= 2 &&
> -                   ((prate / div_low - mode_rate) <
> -                    10 * (mode_rate - prate / div)))
> +                   (10 * (prate / div_low - mode_rate) <
> +                    (mode_rate - prate / div)))

I tested it on my setup (I have only one of those specified above) and it
is OK. Doing some math for the other setup it should also be OK.

As a whole, I'm OK with this at the moment (let's hope it will work for all
use-cases) but still I am not OK with selecting here, in the driver,
something that might work. Although I am not familiar with how other DRM
drivers are handling this kind of scenarios. Maybe you and/or other DRM
guys knows more about it.

Just as a notice, it may worth adding a print message saying what was
frequency was requested and what frequency has been setup by driver.

>                         /*
>                          * At least 10 times better when using a higher
>                          * frequency than requested, instead of a lower.
> --
> 2.20.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
