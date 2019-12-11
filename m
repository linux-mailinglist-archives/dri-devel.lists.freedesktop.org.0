Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E88C11C890
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960286ECB9;
	Thu, 12 Dec 2019 08:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa3.microchip.iphmx.com (esa3.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE7E6EB1C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 11:55:24 +0000 (UTC)
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
IronPort-SDR: Xca9Va4L8bZ06TH98A+wzzQJYp4w/1UuCAAQdmLHeopb2tkZnpxALjWAnc6ILkoe3501/TynwX
 whWgtbhj+cM7SgYgh9A8gLjDPlsoyYiGlZodGF2IhLAl+8xEDOzUqUQ8NfhmKZjxrTO6NX3Cri
 L7I/okdKioKPHYoyKLpcOBDnrdhP34SvqERpD5pm082ToOMNVPyS+Ohw6NCgozhjwxMxMJPxRX
 hSClFMJ5GzbxGhHvqGs+t7MYkJgNRCXebs+8x2fZsafKnpSRqnTC/WgIy3Hv6obnWq0/otntL9
 J18=
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="59983848"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Dec 2019 04:55:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Dec 2019 04:55:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 11 Dec 2019 04:55:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+v7fgsOZqDTH63k/T5WRIpx2On21z+Lk2GrNvxln4FvZtNQwUefxaODsTaZ1GMrmGW0VEV2HW1bgvKc60+tUHGmIrThaCAaqEqMZK/rVbscPom5kZT5ZcJ27BIWvy/vQpmqHj8Nfwhsa/Tsf0YVcoSug1tGleTa/Gfm1Ndz2SLjGebg9qHc0wsl+zKjn4YyV1l2k1mmcSYaLliR8Wj0CHEPgSR+eTUo6/rWY3uIQfpUKF62eZP85w0e+gjiFc2aUOACv3Y9Tv2ap8BrDUAwKjTGdRe6cHJufymaYhhqjh5JtVrritl441MRYx4nDz16uWRNj9NeztwkxnAav2KLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7bjXlBAyX6EXBKcW3knaX8HA4PAzbyuoW6oX6cclVc=;
 b=SArq66iz2KrJkZYqcakJ2bhb2VDsP2BsIvSGotQNheZ0ZQTH3NpdxSle6VT+Epa/TvS8FBtnmsdWqXqdYC3/qYTLpNNUpk9nDXmWSlMGDDTXT565LZbx9x7Pj6q6go3TmktiMSNUOj2+hgJJCHYrfO/DJqG5gImAGjRGHg476BJkuTWjdc/UgrzCekUJun2whniN7/Hk0kpf/cerK4KGTl/9Gl1oUJ36co3Fyb55Sc5eyuvySF42RbnU0sIfCuxPD+jru8HLeJcAr212otpRDcI0CSY+0SUrSu1p988ED0x4thFH+h2feSTh1++7uaGjEKIAquSsT+22XnxcC34Liw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7bjXlBAyX6EXBKcW3knaX8HA4PAzbyuoW6oX6cclVc=;
 b=Z6Jeu9u5kR8DigXSSsdhU+UpLjpRkoHlAb8u6krteJ5SslDJazfZP/8RjbdQnzVD6dHKXUfDPU8lqaRJMexwT2gcwDxp4mD4LFJ4CupToBz7thjO7pWKK4lTJ6Yj9ZZxnPwIqrmh4DpIrZzzyKHC9mGKVblFbGx2sGmvrqyrLE4=
Received: from DM6PR11MB3225.namprd11.prod.outlook.com (20.176.120.224) by
 DM6PR11MB3625.namprd11.prod.outlook.com (20.178.230.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Wed, 11 Dec 2019 11:55:21 +0000
Received: from DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::ed7d:d06f:7d55:cbe2]) by DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::ed7d:d06f:7d55:cbe2%6]) with mapi id 15.20.2538.012; Wed, 11 Dec 2019
 11:55:21 +0000
From: <Claudiu.Beznea@microchip.com>
To: <sam@ravnborg.org>
Subject: Re: [PATCH 5/5] Revert "drm: atmel-hlcdc: enable sys_clk during
 initalization."
Thread-Topic: [PATCH 5/5] Revert "drm: atmel-hlcdc: enable sys_clk during
 initalization."
Thread-Index: AQHVsBnYQZ15xrGMOEKSh87APGOhBA==
Date: Wed, 11 Dec 2019 11:55:20 +0000
Message-ID: <67fab980-1371-2658-4b32-b101a248498d@microchip.com>
References: <1575984287-26787-1-git-send-email-claudiu.beznea@microchip.com>
 <1575984287-26787-6-git-send-email-claudiu.beznea@microchip.com>
 <20191210203419.GB24756@ravnborg.org>
In-Reply-To: <20191210203419.GB24756@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::30) To DM6PR11MB3225.namprd11.prod.outlook.com
 (2603:10b6:5:5b::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191211135513350
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d181a78-47f8-41d8-34db-08d77e30ffa2
x-ms-traffictypediagnostic: DM6PR11MB3625:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3625BEDE354F46DC248DF019875A0@DM6PR11MB3625.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 024847EE92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(199004)(189003)(86362001)(52116002)(6486002)(31696002)(36756003)(107886003)(6512007)(4326008)(66946007)(66446008)(71200400001)(66556008)(64756008)(66476007)(54906003)(6916009)(81156014)(81166006)(31686004)(53546011)(5660300002)(6506007)(186003)(26005)(498600001)(2906002)(2616005)(8676002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR11MB3625;
 H:DM6PR11MB3225.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WHz0Y/NBJZFSam1plUDgw9YLsjynCKdJZgJ6HdBLUFz76jDh1Gi5mqPMAmvuo2TOm1+JFDuDIh1k93jRKjwe8RsTaobT73+/ag+PtPJ7/s32/ThN3DcZrNk3hYmsWmMCOUmX9/XV+ePlDWOpYaumoE59X0oTVRVNfo4Hm5flmpFGF4Nh1BMnPKLqChH/6l/WViKkiHzlgfcxAZDAr4IuWgQxZbx8MUnWMRSIF6pWLVvshHdRfAzKJnYk/A6OMyFKEoc0a0Ty4OZZg6d4qup9AmCXbaUbjLsHfAXvx0HzgtX/nFyXuexevYFwaRrDLwMyhIwYhSuCLvpwzvRz7MuvgN6mR3V5qqzYl6StwkjeMAdpVVSlrTkY2J1RxV39/ntNbucG7Ev8F1TP9HgJnPYY2Hxz6Wc2lVJkgdixq+CZQomQ+bVs+G6cwHFvaYzJlQxG
Content-ID: <675EA5625499E548A9C443A2306EB68C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d181a78-47f8-41d8-34db-08d77e30ffa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2019 11:55:20.9624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IEFXlJz3PuG0G4Kk1E589xrQzWzhPrSDfrLI0s304muV/UF1abvWkTFWL/0O3ViSDToyZNoxUYXOLcTq0/vcfHK5/1C1GV25T3+mgHzWy2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3625
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
Cc: alexandre.belloni@bootlin.com, bbrezillon@kernel.org, airlied@linux.ie,
 Nicolas.Ferre@microchip.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ludovic.Desroches@microchip.com,
 Sandeep.Sheriker@microchip.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10.12.2019 22:34, Sam Ravnborg wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Cladiu
> 
> On Tue, Dec 10, 2019 at 03:24:47PM +0200, Claudiu Beznea wrote:
>> This reverts commit d2c755e66617620b729041c625a6396c81d1231c.
>> ("drm: atmel-hlcdc: enable sys_clk during initalization."). With
>> commit "drm: atmel-hlcdc: enable clock before configuring timing engine"
>> there is no need for this patch. Code is also simpler.
>>
>> Cc: Sandeep Sheriker Mallikarjun <sandeepsheriker.mallikarjun@microchip.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> 
> Getting further in the patches tells me you looked at the
> patch I referenced in previous mail.
> Please squash the two patches together - that would make it
> easier to follow what is done.

Wouldn't this lead to a patch doing 2 things?
1/ fix the timeout of the timing engine after setting pixel clock which is
   from the beginning of the driver and has nothing to do with patch
   reverted here (but, actually we wouldn't had reach the point of
   introducing the patch reverted here with that fix)
2/ revert a previous functionality as a result of fixing the timeout.

With this in mind would you still want to squash them?

Thank you,
Claudiu Beznea

> 
> With the two patches applied sysclk is enabled only in mode_set_nofb()
> and atomic_enable(). And disabled in atomic_disable().
> This is simpler and we drop the conditionals. Also good.
> So the end result looks OK.
> 
>         Sam
> 
>> ---
>>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 19 +------------------
>>  1 file changed, 1 insertion(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> index 8dc917a1270b..112aa5066cee 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> @@ -721,18 +721,10 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>>       dc->hlcdc = dev_get_drvdata(dev->dev->parent);
>>       dev->dev_private = dc;
>>
>> -     if (dc->desc->fixed_clksrc) {
>> -             ret = clk_prepare_enable(dc->hlcdc->sys_clk);
>> -             if (ret) {
>> -                     dev_err(dev->dev, "failed to enable sys_clk\n");
>> -                     goto err_destroy_wq;
>> -             }
>> -     }
>> -
>>       ret = clk_prepare_enable(dc->hlcdc->periph_clk);
>>       if (ret) {
>>               dev_err(dev->dev, "failed to enable periph_clk\n");
>> -             goto err_sys_clk_disable;
>> +             goto err_destroy_wq;
>>       }
>>
>>       pm_runtime_enable(dev->dev);
>> @@ -768,9 +760,6 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>>  err_periph_clk_disable:
>>       pm_runtime_disable(dev->dev);
>>       clk_disable_unprepare(dc->hlcdc->periph_clk);
>> -err_sys_clk_disable:
>> -     if (dc->desc->fixed_clksrc)
>> -             clk_disable_unprepare(dc->hlcdc->sys_clk);
>>
>>  err_destroy_wq:
>>       destroy_workqueue(dc->wq);
>> @@ -795,8 +784,6 @@ static void atmel_hlcdc_dc_unload(struct drm_device *dev)
>>
>>       pm_runtime_disable(dev->dev);
>>       clk_disable_unprepare(dc->hlcdc->periph_clk);
>> -     if (dc->desc->fixed_clksrc)
>> -             clk_disable_unprepare(dc->hlcdc->sys_clk);
>>       destroy_workqueue(dc->wq);
>>  }
>>
>> @@ -910,8 +897,6 @@ static int atmel_hlcdc_dc_drm_suspend(struct device *dev)
>>       regmap_read(regmap, ATMEL_HLCDC_IMR, &dc->suspend.imr);
>>       regmap_write(regmap, ATMEL_HLCDC_IDR, dc->suspend.imr);
>>       clk_disable_unprepare(dc->hlcdc->periph_clk);
>> -     if (dc->desc->fixed_clksrc)
>> -             clk_disable_unprepare(dc->hlcdc->sys_clk);
>>
>>       return 0;
>>  }
>> @@ -921,8 +906,6 @@ static int atmel_hlcdc_dc_drm_resume(struct device *dev)
>>       struct drm_device *drm_dev = dev_get_drvdata(dev);
>>       struct atmel_hlcdc_dc *dc = drm_dev->dev_private;
>>
>> -     if (dc->desc->fixed_clksrc)
>> -             clk_prepare_enable(dc->hlcdc->sys_clk);
>>       clk_prepare_enable(dc->hlcdc->periph_clk);
>>       regmap_write(dc->hlcdc->regmap, ATMEL_HLCDC_IER, dc->suspend.imr);
>>
>> --
>> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
