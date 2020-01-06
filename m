Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A951320F4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B708B89C69;
	Tue,  7 Jan 2020 08:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa3.microchip.iphmx.com (esa3.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A46A89C03
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 09:25:43 +0000 (UTC)
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
IronPort-SDR: rzlpXnb4R/Y5PrZmMefld8E2qociqRlrBzMNWznJSDb0pjgKZwK8iSE+GSmj8cMuZwYDvmJEsK
 XDS9QhiI9VVV9HPmncQJh3RSUzg/CcfY08456xPkneejAS7gHYLyoBNEBnhBbH53m1Uf19M7T3
 U99P8CsPFDapK/7fcmxEfzJ8PSgTHBX0taQjdEhDiSyB4XQJpDfMXcPt4pdWDFP6cHg3lwxKKw
 LI/covz2/5p98sWpp8xnNmQB4wDQZQG1I7YBeVO7zhMzVj5uGJ+uwSuvSX4gSoaAFwdV41Zbvg
 XOc=
X-IronPort-AV: E=Sophos;i="5.69,402,1571727600"; d="scan'208";a="62299730"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Jan 2020 02:25:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 6 Jan 2020 02:25:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 6 Jan 2020 02:25:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEmIibhvltiP9C/80oHSQcc+Kxy/S2Nv8fZweefhFfBhbvsHfJta+RDd4D24TXzyfiGVLXojjiXzMEhrA2TQ3DE2zZLFpnbTOjAEgu9YuNLWpJPgeiqAgTpBGUcCicvpBFBhe0ik+Ln+ktIQ3FXxxdbEp6hzd1vic0fPXLTuc2NPGzb5N9/9w+xTZwy5VM1nI5jciSPKiOBTjB8n5h+/p4zRflSx6U2VyZ8xjGAHJF7PkvP/m6d6/KNY3LDUZILCPh6i+bXNasKiUQlo+u0TCHTRmTqaKg4afnNM6DIMfTMbYFYfQzbSx4gFeKxdMSDpqo2B1KqOWcy63sNmiN4SpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=941kcKZhBhh+TxPpX85cVntgP0aJ0WJ8gW+fsaOfafE=;
 b=JEXkhZcWelmfqE3Wuf9z8g3T4WXAKoRctLoAbTeUZeAnYu4J1aAEg5kB0NzAN1qfrQR7/r9+Z/xEgIAPMbw21zv0mkjg/cqFfYPAMlTRkZpR9/SnZs2BRvqbyS6Nk2nw/OxRPIlP+Re6wplGjU3MpKnpJ5O55iSOhOS2HSk92AWhbgdFkBETvyKSe2Ce8dm/x/zkri3Yxqo4PiVWKHUQwFPUxuTgz9hRePXevP+wvOM5vj4czvYji9fe6Yi+6M7Dj2h6+Me3oP4pvGUTvvGE7gfQOMc2DPOydz8xYMSYa4Y9XBpT0yjG1/HaX9F70gBkSwue13t8u61vaArSi0XUKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=941kcKZhBhh+TxPpX85cVntgP0aJ0WJ8gW+fsaOfafE=;
 b=jGtivY4pW4yhp8LX2PmB5Kqm7Y75PNkGUR+iAAXs/gc5ijz9CUn4ak5OgvdhlybNjj1F/UFjz6Y2Mb7Arqd0Jhs+QjEJz4iWKv+3vbowvGAOrAVEfuwjXPeXA5NgrEJHvPHBoLKvRRMo2NufkYlq2ughScgQ/o1NSW51idReiHc=
Received: from DM6PR11MB3225.namprd11.prod.outlook.com (20.176.120.224) by
 DM6PR11MB4267.namprd11.prod.outlook.com (52.132.248.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.13; Mon, 6 Jan 2020 09:25:40 +0000
Received: from DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::106f:424f:ac54:1dbb]) by DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::106f:424f:ac54:1dbb%7]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 09:25:40 +0000
From: <Claudiu.Beznea@microchip.com>
To: <sam@ravnborg.org>
Subject: Re: [PATCH v3 5/6] drm: atmel-hlcdc: prefer a lower pixel-clock than
 requested
Thread-Topic: [PATCH v3 5/6] drm: atmel-hlcdc: prefer a lower pixel-clock than
 requested
Thread-Index: AQHVxHNCEp4Pw+8WakiQvTSsv/2xSA==
Date: Mon, 6 Jan 2020 09:25:40 +0000
Message-ID: <4f8603b2-9ae6-97bf-73c0-1b204595dce1@microchip.com>
References: <1576672109-22707-1-git-send-email-claudiu.beznea@microchip.com>
 <1576672109-22707-6-git-send-email-claudiu.beznea@microchip.com>
 <20200102090848.GC29446@ravnborg.org> <20200104171205.GA8724@ravnborg.org>
In-Reply-To: <20200104171205.GA8724@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55449d4f-541d-4aff-3c1e-08d7928a65e0
x-ms-traffictypediagnostic: DM6PR11MB4267:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4267CAF002B54096E337E269873C0@DM6PR11MB4267.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(366004)(396003)(39860400002)(136003)(199004)(189003)(966005)(6486002)(478600001)(31686004)(86362001)(6512007)(71200400001)(5660300002)(53546011)(6506007)(26005)(6916009)(2616005)(4326008)(76116006)(91956017)(36756003)(8936002)(316002)(66946007)(31696002)(66556008)(186003)(64756008)(2906002)(66476007)(81166006)(81156014)(8676002)(54906003)(66446008)(341764005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR11MB4267;
 H:DM6PR11MB3225.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mg9wAwehj9k4lQ3q5Sa2hi30BY4zjMTg+FV8pnYYvkAXPypOeaN0bhZ/CxgF4p4PCgbSzuu3rz91Yjliu9dEviryWohOkZcn90S8Jjg26qs47Igjte37PywNBi02soxNKy00/j/8+yWlv7NDDkpKksaug7UyeBBPkgutrw9a63E+WdDIdX5GTrWPWhrvSNbOxnZxDSV4y9V8kQ04mg3gMnBSiPDjKYE8W5HKlPtiIzeu4DkwaBV1VynzfNv53gIHRQOQSPpw+oWr8dn0f6jnMC/KUSgdp7lBZP5ffObLalWtrqiE/rztaHDr+QznH9x1LH3DayP+SS+oV2NJ9MVlWE2ciQ06ZPI5U5HCY3ZVMsGyOYVcLUo8ElodXr+Q3lSBiMhNjxKApCHg/VnL/dSZoXh+sunLqsnjBhJpVw8w6QEWqTzynkFUiIZkGOasKt8bg2HdarofW59JTkb+1QUuFI8oz5C/YFXQ30MPG4jgb9JZO261K9fNpvxPvDNmkPPncr1Yf4T5fh3fhYqt47qnOfaaDW/NMb02AEpGxNt7/v0=
Content-ID: <5650812FEB10074894AA48B03B41578D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 55449d4f-541d-4aff-3c1e-08d7928a65e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 09:25:40.8301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V3/RLpCCjpLGvIlmxC7sF6/A9f/zx5qircgyWlLzyYPHZrvDT7FS4WJVYRvy9orpWaoM0sf33f3NiZ3MMWekmmD49QB+uqbxhh2axsR6O7c=
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



On 04.01.2020 19:12, Sam Ravnborg wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Claudiu
> 
> On Thu, Jan 02, 2020 at 10:08:48AM +0100, Sam Ravnborg wrote:
>> On Wed, Dec 18, 2019 at 02:28:28PM +0200, Claudiu Beznea wrote:
>>> From: Peter Rosin <peda@axentia.se>
>>>
>>> The intention was to only select a higher pixel-clock rate than the
>>> requested, if a slight overclocking would result in a rate significantly
>>> closer to the requested rate than if the conservative lower pixel-clock
>>> rate is selected. The fixed patch has the logic the other way around and
>>> actually prefers the higher frequency. Fix that.
>>>
>>> Fixes: f6f7ad323461 ("drm/atmel-hlcdc: allow selecting a higher pixel-clock than requested")
>> The id is wrong here - the right one is: 9946a3a9dbedaaacef8b7e94f6ac144f1daaf1de
>> The wrong id above was used before - so I think it is a copy'n'paste
>> thing.
>>
>> Hint: try "dim fixes 9946a3a9dbedaaacef8b7e94f6ac144f1daaf1de"
>>
>> If I get a quick response from Lee I can fix it up while applying.
>>
>>       Sam
>>
>>> Reported-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>>> Tested-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>>> Signed-off-by: Peter Rosin <peda@axentia.se>
> 
> One other detail.
> The patch has passed through your hands, so you have to add your s-o-b
> to document this.
> The chain of s-o-b shall document the path the patch has taken towards
> the kernel.
> 
> In this case:
> Peter => Claudiu => Sam => Applied.
> 
> Please resend or reply where you say OK that I add your s-o-b.

Sure! Please add my Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>

Thank you, Sam!

> 
> PS. And happy new year!
> 
>         Sam
> 
> 
>>> ---
>>>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>>> index 721fa88bf71d..10985134ce0b 100644
>>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>>> @@ -121,8 +121,8 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>>>             int div_low = prate / mode_rate;
>>>
>>>             if (div_low >= 2 &&
>>> -               ((prate / div_low - mode_rate) <
>>> -                10 * (mode_rate - prate / div)))
>>> +               (10 * (prate / div_low - mode_rate) <
>>> +                (mode_rate - prate / div)))
>>>                     /*
>>>                      * At least 10 times better when using a higher
>>>                      * frequency than requested, instead of a lower.
>>> --
>>> 2.7.4
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
