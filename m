Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DED11F23D
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E1A6E3C1;
	Sat, 14 Dec 2019 14:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316B86E2E4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 09:28:22 +0000 (UTC)
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Claudiu.Beznea@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="Claudiu.Beznea@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: MbQyB8jav0meLzsQ6VkAU3yr410RWy9q0RB36G6Qx/iL6NNae+J5TAPrEkXHl7dnjvs5aSgayJ
 gllH4aqbfmhPTQ0GpxXaG4qoL7+UyZKkgniXVr55mDri6gIoVryUcdyVW08IG7X4RBQ5KXIybh
 mtumwp1C8YZeM8aNrv6RGyZzt1yxjHLcvhG2rclPRjXn716WkWG7aiBC0qLd2AjdDDXAqoSdrF
 /Qb9l+DFQ2kqofSXa+kCfmfW1gDXVClzNJXg1A7cTf5MRJJX4P/tSRP9G5vMgoE7G1Cmud3rzC
 cu4=
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="59698589"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Dec 2019 02:28:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 13 Dec 2019 02:28:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 02:28:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzLJcbb9g4WQ+anKlzQRjj2R8iV75iMHOKdz8X60ndY2WX4zLrCjjr4KNQxpYkCLUSJMe7Uqtm2tT6qkrTB6tYgiRbGGK7Bc78bm2WWnI4kgWbWshLWteQh4qoozb0uGnQ7ROKMAxLBkd0bJ6qjyLEk+PZRaE1XF3fvtrMFFZbzjbEqjJ8Y8DmNoaxX+HjIXaanRdyuROrrWawovBXFxppLmnByl2zP+gQtH5nMluKGUI++Ki9t7dy9zk9RdPXBpNyU134rXMVZUJ9JeGGbKPMHQQLJNwsoMUU67gH+d5SDUGTFkBXB8XtbejI3ZR/OBZx34Bg6ZFreXE1RbTYqDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u105ZdStS5kNW3FojgtQ13IYA/cM80YfeMAeth5VQwo=;
 b=ie8S2oFXj1YLQPsXtgSt82BXONjKZF5MYdvGA2OVXTqGFaLudT2iyJC6uyusqRLMSGXHDamnTPHjuTqXC04ZOX8TKpggzTv+d4r+Q7nnYFNeXMZWZ8WBqmkgkdn7LWwgSqsHRO6am0B9S5j6Me7KtTfT75KyfO45stFKTtY+iSbAV+z2SdjN4srd8Q1WIx3aF5E5vn2c6KltCigWb4VJimj6aYBDqAAifh+I6YEBEEUNfbFGWOmrNaz1A0/PR6A0DgcVhb3vvGW/YdCXzZ3Vq/HMM1RXdpnFpiurjTrFtVQ7Civ1nOVHALppfPX4mCcdrJwyGNB3pzHPnkq2bKnB2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u105ZdStS5kNW3FojgtQ13IYA/cM80YfeMAeth5VQwo=;
 b=QS2II95rN+O/MMw8I7pALHTncOL7UEBLh6WknuKj2zBe5RMoUfaFqwBWbEikeCCbLMa/+fctxH/9ISmvVAaVTQjYtAc51v7oGiQh4KTyAuzAZC5EXoLJNEIwU80g+P/Dl0q51EOl2gxbSHslAPRtrf8ZCGoBkOmRg07v2p/kdPU=
Received: from DM6PR11MB3225.namprd11.prod.outlook.com (20.176.120.224) by
 DM6PR11MB3547.namprd11.prod.outlook.com (20.178.229.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Fri, 13 Dec 2019 09:28:17 +0000
Received: from DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::ed7d:d06f:7d55:cbe2]) by DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::ed7d:d06f:7d55:cbe2%6]) with mapi id 15.20.2538.012; Fri, 13 Dec 2019
 09:28:17 +0000
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
Date: Fri, 13 Dec 2019 09:28:17 +0000
Message-ID: <be6a9bce-7d14-563b-1ee5-a968e2e3a6c8@microchip.com>
References: <1575984287-26787-1-git-send-email-claudiu.beznea@microchip.com>
 <1575984287-26787-5-git-send-email-claudiu.beznea@microchip.com>
 <4c3ffc48-7aa5-1e48-b0e9-a50c4eea7c38@axentia.se>
 <5fbad2cd-0dbe-0be5-833a-f7a612d48012@microchip.com>
 <2272669c-38ee-1928-9563-46755574897c@axentia.se>
 <167cb87e-b189-71fd-0a79-adf89336d1f3@microchip.com>
 <b5ea01da-5345-05cf-9f89-b7123dbbb893@axentia.se>
In-Reply-To: <b5ea01da-5345-05cf-9f89-b7123dbbb893@axentia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0178.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::26) To DM6PR11MB3225.namprd11.prod.outlook.com
 (2603:10b6:5:5b::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191213112808831
x-originating-ip: [86.120.233.88]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6823cf79-73f4-4af2-2cd9-08d77faec901
x-ms-traffictypediagnostic: DM6PR11MB3547:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB354700FC55C3D7AED14F206E87540@DM6PR11MB3547.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0250B840C1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(39860400002)(346002)(396003)(376002)(189003)(199004)(478600001)(66556008)(66446008)(64756008)(186003)(5660300002)(71200400001)(66476007)(7416002)(26005)(6486002)(66946007)(316002)(6506007)(53546011)(110136005)(36756003)(54906003)(6512007)(31696002)(2616005)(86362001)(4001150100001)(52116002)(8936002)(31686004)(2906002)(4326008)(81156014)(8676002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR11MB3547;
 H:DM6PR11MB3225.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jnf+EgXK+QXE0putF9EAqk9tztfkNXkGAXTQUa65mangGkIX4WhAVoaQ0J52855XCtANVP9Pme4f2bCwCGhliMMWzTD74UueidUwwV7fmuITugP3E/wy4RitjNRHSG2qE3HHJFlextZsDB1tbMRgOutf9k5CRmHjrnOotFAx4WukxeoVL+iUnFvQ0BOc2nUr1AIY6b8v8U7SE8ILnZBjo2sm9jRm/kDVRFMlpAeMvS/3KRw26Ohp/uPjTfNV3Cnec6+tnhKxML+ykO6kA0JFwY6NmPLbVML6yuVMjsAmnbJe0q+swKcgfyLM7aGpk8K+pShvhA+OlMKARmDuzC5c7xIhOqvV5v37jevNv7jfwL8OwlsSUwt55ZS4+nuW8Z8amyDtf24S5w7yMQ323hcC8UOaPlzES7H5gNmKcSj+SJVSg9/SMdSnKql2ubslq9gr
Content-ID: <86B38DDC3095E349B80FB36F9A3D0A26@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6823cf79-73f4-4af2-2cd9-08d77faec901
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2019 09:28:17.3616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V0bPibBkMDEvFO2u3OhyWoMAqjJWaGjH95/P4E1I9PUw/lLqVCpoVcPhZZwjohzpqMRJpF3mWEhhwWpq8+jsSZz1UYJpkUFSrQAhuGEbpmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3547
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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



On 11.12.2019 15:28, Peter Rosin wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 2019-12-11 12:45, Claudiu.Beznea@microchip.com wrote:
>>
>>
>> On 10.12.2019 19:22, Peter Rosin wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 2019-12-10 15:59, Claudiu.Beznea@microchip.com wrote:
>>>>
>>>>
>>>> On 10.12.2019 16:11, Peter Rosin wrote:
>>>>> On 2019-12-10 14:24, Claudiu Beznea wrote:
>>>>>> This reverts commit f6f7ad3234613f6f7f27c25036aaf078de07e9b0.
>>>>>> ("drm/atmel-hlcdc: allow selecting a higher pixel-clock than requested")
>>>>>> because allowing selecting a higher pixel clock may overclock
>>>>>> LCD devices, not all of them being capable of this.
>>>>>
>>>>> Without this patch, there are panels that are *severly* underclocked (on the
>>>>> magnitude of 40MHz instead of 65MHz or something like that, I don't remember
>>>>> the exact figures).
>>>>
>>>> With patch that switches by default to 2xsystem clock for pixel clock, if
>>>> using 133MHz system clock (as you specified in the patch I proposed for
>>>> revert here) that would go, without this patch at 53MHz if 65MHz is
>>>> requested. Correct me if I'm wrong.
>>>
>>> It might have been 53MHz, whatever it was it was too low for things to work.
>>>
>>>>> And they are of course not capable of that. All panels
>>>>> have *some* slack as to what frequencies are supported, and the patch was
>>>>> written under the assumption that the preferred frequency of the panel was
>>>>> requested, which should leave at least a *little* headroom.
>>>>
>>>> I see, but from my point of view, the upper layers should decide what
>>>> frequency settings should be done on the LCD controller and not let this at
>>>>  the driver's latitude.
>>>
>>> Right, but the upper layers do not support negotiating a frequency from
>>> ranges. At least the didn't when the patch was written, and implementing
>>> *that* seemed like a huge undertaking.
>>>
>>>>>
>>>>> So, I'm curious as to what panel regressed. Or rather, what pixel-clock it needs
>>>>> and what it gets with/without the patch?
>>>>
>>>> I have 2 use cases:
>>>> 1/ system clock = 200MHz and requested pixel clock (mode_rate) ~71MHz. With
>>>> the reverted patch the resulted computed pixel clock would be 80MHz.
>>>> Previously it was at 66MHz
>>>
>>> I don't see how that's possible.
>>>
>>> [doing some calculation by hand]
>>>
>>> Arrgh. *blush*
>>>
>>> The code does not do what I intended for it to do.
>>> Can you please try this instead of reverting?
>>>
>>> Cheers,
>>> Peter
>>>
>>> From b3e86d55b8d107a5c07e98f879c67f67120c87a6 Mon Sep 17 00:00:00 2001
>>> From: Peter Rosin <peda@axentia.se>
>>> Date: Tue, 10 Dec 2019 18:11:28 +0100
>>> Subject: [PATCH] drm/atmel-hlcdc: prefer a lower pixel-clock than requested
>>>
>>> The intention was to only select a higher pixel-clock rate than the
>>> requested, if a slight overclocking would result in a rate significantly
>>> closer to the requested rate than if the conservative lower pixel-clock
>>> rate is selected. The fixed patch has the logic the other way around and
>>> actually prefers the higher frequency. Fix that.
>>>
>>> Fixes: f6f7ad323461 ("drm/atmel-hlcdc: allow selecting a higher pixel-clock than requested")
>>> Reported-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>>> Signed-off-by: Peter Rosin <peda@axentia.se>
>>> ---
>>>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>>> index 9e34bce089d0..03691845d37a 100644
>>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
>>> @@ -120,8 +120,8 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>>>                 int div_low = prate / mode_rate;
>>>
>>>                 if (div_low >= 2 &&
>>> -                   ((prate / div_low - mode_rate) <
>>> -                    10 * (mode_rate - prate / div)))
>>> +                   (10 * (prate / div_low - mode_rate) <
>>> +                    (mode_rate - prate / div)))
>>
>> I tested it on my setup (I have only one of those specified above) and it
>> is OK. Doing some math for the other setup it should also be OK.
> 
> Glad to hear it, and thanks for testing/verifying!
> 
>> As a whole, I'm OK with this at the moment (let's hope it will work for all
>> use-cases) but still I am not OK with selecting here, in the driver,
>> something that might work.
> 
> The driver has to select *something*. If it can deliver the exact requested
> frequency, fine. Otherwise? What should it do? Bail out? Why is 53MHz better
> and more likely to produce a picture than 66MHz, when 65MHz is requested?
> That's of course an impossible question for the driver to answer.
> 
> So, if you are not ok with that, you need to implement something that uses
> the min/max fields from the various fields inside struct display_timing
> instead of only looking at the typ field. E.g. the panel_lvds driver calls
> videomode_from_timings() and the result is a single possible mode with only
> the typical timings, with no negotiation of the best option within the
> given ranges with the other drivers involved with the pipe. I think the
> panel-simple driver also makes this one-sided decision of only making use
> of the typ field for each given timing range. Having dabbled a bit in what
> the sound stack does to negotiate the sample rate, sample format and
> channel count etc, I can only predict that retrofitting something like that
> for video modes will be ... interesting. Which is probably why it's not
> done at all, at least not in the general case.
> 
> And yes, I agree, the current mechanics are less than ideal. But I have no
> time to do anything about it.
> 
>>                            Although I am not familiar with how other DRM
>> drivers are handling this kind of scenarios. Maybe you and/or other DRM
>> guys knows more about it.
> 
> I don't know (and I mean it literally), but maybe these chips are special
> as they typically end up with very small dividers and thus large frequency
> steps? BTW, I do not consider myself a DRM guy, I have only tried to
> fix that which did not work out for our needs...
> 
>> Just as a notice, it may worth adding a print message saying what was
>> frequency was requested and what frequency has been setup by driver.
> 
> I have no problem with that.

Hi Peter,

I intend to prepare my v2 of this series. How would you like to proceed
with the patch you provided? Are you OK if I add it to my v2 of this series
or would you prefer to send it on your own?

Thank you,
Claudiu Beznea

> 
> Cheers,
> Peter
> 
>>
>>>                         /*
>>>                          * At least 10 times better when using a higher
>>>                          * frequency than requested, instead of a lower.
>>> --
>>> 2.20.1
>>>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
