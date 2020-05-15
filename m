Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D331D6026
	for <lists+dri-devel@lfdr.de>; Sat, 16 May 2020 11:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01D36E12B;
	Sat, 16 May 2020 09:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD4B89F2D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:34:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04F9XUpx013573; Fri, 15 May 2020 11:34:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=kIbCUmvZzrGEvYKM2nyNwIpvOBCS9R6qDI14SIm99HY=;
 b=qv0C9Up+c497UY6N2ziLJc3ApOSQNAM75XtYD6T2/6y8Jlakdsu/EmVRaprMU8ITFnE1
 3MuALblx7smSCoTAhEEq15RncLzSd9yve0IxzlPoTlhWV4O+1/Fs7Zy8CucXZ3HqKOvf
 EX7hUPNGGl9G8FYFnAFBXYNFZCZsKkE9HET5bjYbaOgCW1EBHeMKhWSxmUK1wid5a+xt
 1XzB36ug1w7ZY6kDnhYXF1X7+ppYyTX3ckP0f2pBQVOUjVzrfmlsn9/GkoHtBuE8fdp8
 C+KOPb7c2TaN74ITOg2935FP9dzjXPl+ImNM/ttnN78xZ9t7DfInkOIddd9OJtOvQLJl eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vys8ue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 May 2020 11:34:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7128F100034;
 Fri, 15 May 2020 11:34:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55B332AF960;
 Fri, 15 May 2020 11:34:16 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 15 May
 2020 11:34:15 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Fri, 15 May 2020 11:34:15 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: dillon min <dillon.minfei@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 3/5] ARM: dts: stm32: enable ltdc binding
 with ili9341 on stm32429-disco board
Thread-Topic: [Linux-stm32] [PATCH v3 3/5] ARM: dts: stm32: enable ltdc
 binding with ili9341 on stm32429-disco board
Thread-Index: AQHWKckeJCttwtJ4Q0KZXBBPInzZ9ainaAuAgAAEJgCAAUVIgIAADrKAgAACuQA=
Date: Fri, 15 May 2020 09:34:15 +0000
Message-ID: <2afd2853-e3bc-0c69-a0e5-8d4aa631a634@st.com>
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-4-git-send-email-dillon.minfei@gmail.com>
 <CACRpkda5VjjBdbruXTi33QBNb=VU6vK2zDE8yyQXoWw7=NQFeg@mail.gmail.com>
 <a4ebd7cd-5756-0683-135f-0f96be8a4a7b@st.com>
 <CAL9mu0Jt_xwo5pJfcx6G3grBuOaxLXvakpEjiB4gV3=bkiq2fg@mail.gmail.com>
 <818b93b4-4431-8338-cd90-ed125ecac615@st.com>
 <CAL9mu0L6d2V5qypPfOSeMdhc=DdHkcsaF4GysNG-vfDe5npkhw@mail.gmail.com>
In-Reply-To: <CAL9mu0L6d2V5qypPfOSeMdhc=DdHkcsaF4GysNG-vfDe5npkhw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <26620BBF7B05D942A1AF671AA1D5FAE6@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-15_03:2020-05-14,
 2020-05-15 signatures=0
X-Mailman-Approved-At: Sat, 16 May 2020 09:58:59 +0000
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
Cc: "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 Michael Turquette <mturquette@baylibre.com>, Dave Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:DRM
 PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Sam
 Ravnborg <sam@ravnborg.org>, linux-clk <linux-clk@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/15/20 11:24 AM, dillon min wrote:
> Hi Benjamin,
>
> thanks for reply.
>
> On Fri, May 15, 2020 at 4:31 PM Benjamin GAIGNARD
> <benjamin.gaignard@st.com> wrote:
>>
>>
>> On 5/14/20 3:07 PM, dillon min wrote:
>>> Hi Alexandre,
>>>
>>> On Thu, May 14, 2020 at 8:53 PM Alexandre Torgue
>>> <alexandre.torgue@st.com> wrote:
>>>>
>>>> On 5/14/20 10:24 AM, Linus Walleij wrote:
>>>>> On Tue, May 12, 2020 at 9:04 AM <dillon.minfei@gmail.com> wrote:
>>>>>
>>>>>> From: dillon min <dillon.minfei@gmail.com>
>>>>>>
>>>>>> Enable the ltdc & ili9341 on stm32429-disco board.
>>>>>>
>>>>>> Signed-off-by: dillon min <dillon.minfei@gmail.com>
>>>>> This mostly looks good but...
>>>>>
>>>>>> +&spi5 {
>>>>>> +       status = "okay";
>>>>>> +       pinctrl-0 = <&spi5_pins>;
>>>>>> +       pinctrl-names = "default";
>>>>>> +       #address-cells = <1>;
>>>>>> +       #size-cells = <0>;
>>>>>> +       cs-gpios = <&gpioc 2 GPIO_ACTIVE_LOW>;
>>>>>> +       dmas = <&dma2 3 2 0x400 0x0>,
>>>>>> +              <&dma2 4 2 0x400 0x0>;
>>>>>> +       dma-names = "rx", "tx";
>>>>> These DMA assignments seem to be SoC things and should
>>>>> rather be in the DTS(I) file where &spi5 is defined, right?
>>>>> stm32f429.dtsi I suppose?
>>>> I agree with Linus, DMA have to be defined in SoC dtsi. And if a board
>>>> doesn't want to use it, we use the "delete-property".
>>> Yes, will move to Soc dtsi in next submits.
>>>
>>> i'm working on write a v4l2-m2m driver for dma2d of stm32 to support
>>> pixel conversion
>>> alpha blending between foreground and background graphics.
>>>
>>> as you know, some soc's engineer trying to add this function to drm system.
>>>
>>> do you know st's planning about soc's hardware accelerator driver on stm32mp?
>>> such as chrom-art, will add to drm subsystem via ioctl to access, or to v4l2,
>> On stm32mp we do not plan to use chrom-art in drm or v4l2 because it
>> does fit
>> with userland way of working. We use the GPU to do conversion, scaling,
>> blending
>> and composition in only one go.
>> As explain here [1] DRM subsytem it isn't a solution and v4l2-m2m isn't
>> used in any
>> mainline compositors like Weston or android surfaceflinger.
>>
>> Benjamin
>>
> After check stm32mp's datasheets, they don't have chrom-art ip inside. sorry for
> didn't check it yet.
>
> for stm32h7 series with chrom-art, jpeg hardware accelerator inside.
> does st has plan to
> setup a driver to support it ? i prefer v4l2-m2m should be easier to
> implement it.
> co work with dcmi, fbdev.
ST doesn't plan to create a driver for chrom-art because nothing in 
mainline
userland could use it.

Benjamin
>
> thanks.
>
> best regards.
>
> Dillon
>> [1]
>> https://www.phoronix.com/scan.php?page=news_item&px=Linux-DRM-No-2D-Accel-API
>>> thanks.
>>>
>>>>> It is likely the same no matter which device is using spi5.
>>>>>
>>>>> Yours,
>>>>> Linus Walleij
>>>>>
>>> _______________________________________________
>>> Linux-stm32 mailing list
>>> Linux-stm32@st-md-mailman.stormreply.com
>>> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
