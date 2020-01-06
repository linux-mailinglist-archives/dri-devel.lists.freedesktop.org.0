Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8CF1320F3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6D289C17;
	Tue,  7 Jan 2020 08:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa3.microchip.iphmx.com (esa3.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034816E20D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 09:24:58 +0000 (UTC)
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Claudiu.Beznea@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="Claudiu.Beznea@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 2BZd56lg6Xwwa8rZYLVuK5VrQdQF5bOYDHhmpbOKV/XoeMce4UR78EEcktrv4UlQrXK5VterbO
 CqW2b8m1DpuCSzespbVRpzWwOxilI4EXO1wyRLU6xPggEHaGSZIaVXinxgtjPsfP23tZTnyVdN
 cm2Z/x4Q02wocirRRI7KQz0bRaj1Ro3FsfomVskoa4ErEFoAkAFhhOWjIaHhtlW68+MWnVPWWO
 lMfEoTekPm7AadUr0HBa2j3wnIwAghFL75Q/jZ3kQWkyr01nNcYS39b19uumvDtAvzfVX7WHsh
 444=
X-IronPort-AV: E=Sophos;i="5.69,402,1571727600"; d="scan'208";a="62299538"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Jan 2020 02:24:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 6 Jan 2020 02:24:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 6 Jan 2020 02:24:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlA7tPQ/IOe7ED1I5e0GA9p7SMbz1dwl7ReYpLxhKvmWVYStTQNOYG5TpekOZtsHcVspaj858Pub1s84Ob0pEgpdm5c2q1i0ESVd1l2Vc+FhR2UXwIYvSpIyU6hc3kSdN8fAj3ym9ATYXYgXy3jKFjGKDbfLsmCSZFRjbC2tvcWgDCWTwEW1J4juKAg0ovhoZhcL7qKpzVeCx4I3LIjbhXJ/MKvt6uMgoud0AaSsS7jloD+PrgC5ggwrrMskjHMZLYktR9WSxETOLuQLfDuTvnkzYodrjprFhoBt4IvyWhwW3Rf63g0tTWYQgjcvkcs0DrKrAV7q3grBp5lXD5dyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rh9aNqo5n5LkVfP2WVL1yJvZPQJn0nB6mkWJ0BhoAU=;
 b=IJHsLxddh3IPOyQlT9M+EMz8QODsK3OXiD88CYfirEwdKUBdn4Py/8YQlUqEyszJUmz72mDIKoiWB+q3KjzFjhCEmljd/5/vw+jBQkM34yzrh1WquX+YvbmShfALQJVk388P6P4q5Kn3PWWQOaiiH3+9a4zM7DzZ8+KB1IoCaCDb/Jcx001+NhhFeCT1d3WYo/Mfc1Ku9e8a08KnbFv1ctw7lYfTsx3Uj2dJTKoo/0zdEhQfyQYvJvK1fhCWE+cx5yXGiUZ9Src0ycXfdbWauq3Ttya5thz+JUavnNSolnzMh3OHQ8Am8UMrmwApyUDmhzwAI+MZ6i7718DfAYVpCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rh9aNqo5n5LkVfP2WVL1yJvZPQJn0nB6mkWJ0BhoAU=;
 b=HitOQ6uZpPOwU3nasNvJsiCqHIMfxX/nAThfp8XZqv0phwqFenZ0cOgk9fM81u0zpjPr9vGbzvsQV9gFrUGucA8Y/2YaAPswrwJnZXb6xj3z7cOFSsIv7wyz8svP2RiRguzVjE6zzvMfa2JaJcq9k0Wsgx0AmDL1MoGw5NK/ROI=
Received: from DM6PR11MB3225.namprd11.prod.outlook.com (20.176.120.224) by
 DM6PR11MB4267.namprd11.prod.outlook.com (52.132.248.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.13; Mon, 6 Jan 2020 09:24:52 +0000
Received: from DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::106f:424f:ac54:1dbb]) by DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::106f:424f:ac54:1dbb%7]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 09:24:52 +0000
From: <Claudiu.Beznea@microchip.com>
To: <sam@ravnborg.org>
Subject: Re: [PATCH v3 5/6] drm: atmel-hlcdc: prefer a lower pixel-clock than
 requested
Thread-Topic: [PATCH v3 5/6] drm: atmel-hlcdc: prefer a lower pixel-clock than
 requested
Thread-Index: AQHVxHMmEp4Pw+8WakiQvTSsv/2xSA==
Date: Mon, 6 Jan 2020 09:24:52 +0000
Message-ID: <64902ae8-ef5a-a94a-8edf-05159699b72c@microchip.com>
References: <1576672109-22707-1-git-send-email-claudiu.beznea@microchip.com>
 <1576672109-22707-6-git-send-email-claudiu.beznea@microchip.com>
 <20200102090848.GC29446@ravnborg.org>
In-Reply-To: <20200102090848.GC29446@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da646c3e-f9b8-422e-b5aa-08d7928a48f5
x-ms-traffictypediagnostic: DM6PR11MB4267:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB42673924A3DA4C916580902A873C0@DM6PR11MB4267.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(366004)(396003)(39860400002)(136003)(199004)(189003)(6486002)(478600001)(31686004)(86362001)(6512007)(71200400001)(5660300002)(53546011)(6506007)(26005)(6916009)(2616005)(4326008)(76116006)(91956017)(36756003)(8936002)(316002)(66946007)(31696002)(66556008)(186003)(64756008)(2906002)(66476007)(81166006)(81156014)(8676002)(54906003)(66446008)(341764005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR11MB4267;
 H:DM6PR11MB3225.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AtxUO7lJyPE/HmtazA5qu11dheXa94oParEFVZxe432vWXENVot+IvGzvjdDAMA0n5P0xE0PeYFeVQ9bDbjKI01bQ0jmRij3rJAPfNr5t8O9+Ti8pygHtKcg6a8wYPT27xT9X06UvxczIJFQzyEjY4cVU+fzqDtEbqUWlC4UT6rtUF8n7hMC5aZiGWoulzeye4bdlBAFVCu4saLcqQFr55FJRi9ypvnPruPDWTyi62gMAZVQa6LzovqcvEA3MP7wkGxfeem249vyamwS7NlA8Vz1YEqy0PCWjEpSqHajd+Xeu0qe7Xgdq4aTWmOpPC6pHg7uxxN6GW5rCq6DmHkEhNfbOdtqZCoC20pMR3OhJKPpVtef+vcsN1aNn0AxNXr2E0QNi/uM9DreebI78N7s1mSvcy7J/Q0r4ZaVv/ukVittLZA07vUukCSmRBH/1dtR6YiITKS4M8gEjooepYNmN0njWlJZnOvI5+AqalGao1icPF5nQHGavx96uf1jCF1O
Content-ID: <15361D37B1196A4E85FED38C025D31C9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: da646c3e-f9b8-422e-b5aa-08d7928a48f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 09:24:52.3069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bI+26/ilveq9TheOYFDbsu9FurIgSfcd943Sgj59RIotSRaHReiIEo405F9JuJIJAU2F9c3OGPH9X9nAJOCbeHAYgkqcTrMb/DKuwUx0BmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4267
X-Mailman-Approved-At: Tue, 07 Jan 2020 08:05:10 +0000
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
Cc: alexandre.belloni@bootlin.com, airlied@linux.ie,
 Nicolas.Ferre@microchip.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.brezillon@bootlin.com,
 lee.jones@linaro.org, peda@axentia.se, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 02.01.2020 11:08, Sam Ravnborg wrote:
> On Wed, Dec 18, 2019 at 02:28:28PM +0200, Claudiu Beznea wrote:
>> From: Peter Rosin <peda@axentia.se>
>>
>> The intention was to only select a higher pixel-clock rate than the
>> requested, if a slight overclocking would result in a rate significantly
>> closer to the requested rate than if the conservative lower pixel-clock
>> rate is selected. The fixed patch has the logic the other way around and
>> actually prefers the higher frequency. Fix that.
>>
>> Fixes: f6f7ad323461 ("drm/atmel-hlcdc: allow selecting a higher pixel-clock than requested")
> The id is wrong here - the right one is: 9946a3a9dbedaaacef8b7e94f6ac144f1daaf1de

Right! Sorry for this one! Thank you for fixing it up.

Claudiu Beznea

> The wrong id above was used before - so I think it is a copy'n'paste
> thing.
> 
> Hint: try "dim fixes 9946a3a9dbedaaacef8b7e94f6ac144f1daaf1de"
> 
> If I get a quick response from Lee I can fix it up while applying.
> 
>         Sam
> 
>> Reported-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>> Tested-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>> Signed-off-by: Peter Rosin <peda@axentia.se>
>> ---
>>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> index 721fa88bf71d..10985134ce0b 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>> @@ -121,8 +121,8 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>>               int div_low = prate / mode_rate;
>>
>>               if (div_low >= 2 &&
>> -                 ((prate / div_low - mode_rate) <
>> -                  10 * (mode_rate - prate / div)))
>> +                 (10 * (prate / div_low - mode_rate) <
>> +                  (mode_rate - prate / div)))
>>                       /*
>>                        * At least 10 times better when using a higher
>>                        * frequency than requested, instead of a lower.
>> --
>> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
