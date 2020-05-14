Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0BE1D465C
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906916EBEB;
	Fri, 15 May 2020 06:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631026EB41
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:53:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04ECqOfG012268; Thu, 14 May 2020 14:53:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=nHSWD3rAvd4p9vuLYKA3ZWiKVn+Vm2Lf+IPFO5a7YEk=;
 b=aqMOulBAvl+8xoCgiDgMnbTqfEe79LvSFqONLc7j5PE6Hpuh1hW6OjVpaMaDDCalnUim
 asRk0IBE6JIzsW0gKEpec3FgCSv+4gBMntCJHSqfdnBmCy5rXRn5/tgT0Debk3c5oZVg
 ywFW1sS8IYwPOP1RK4gTQBxMzEoJh1T4kbeURsD6gyvIBPzugWOuT+NJL2j9OX5m1SME
 zZZumUCD5bLXiTFkt0v+jhyyatlDh0HlK3Fu6fHTi5xeEXGr972vRrahzpV5PveXxKWX
 31xMuAnpAko1YAR9rsPFP0oh3/YyYzbjxVRINoHrOfZwEgFT8YHKIW0oAi8azE1Hor+A bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vpkb2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 14:53:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 442B5100034;
 Thu, 14 May 2020 14:53:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18F0F2BAE4E;
 Thu, 14 May 2020 14:53:05 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 14 May
 2020 14:52:56 +0200
Subject: Re: [PATCH v3 3/5] ARM: dts: stm32: enable ltdc binding with ili9341
 on stm32429-disco board
To: Linus Walleij <linus.walleij@linaro.org>, <dillon.minfei@gmail.com>
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-4-git-send-email-dillon.minfei@gmail.com>
 <CACRpkda5VjjBdbruXTi33QBNb=VU6vK2zDE8yyQXoWw7=NQFeg@mail.gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <a4ebd7cd-5756-0683-135f-0f96be8a4a7b@st.com>
Date: Thu, 14 May 2020 14:52:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CACRpkda5VjjBdbruXTi33QBNb=VU6vK2zDE8yyQXoWw7=NQFeg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_03:2020-05-14,
 2020-05-14 signatures=0
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Dave Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/14/20 10:24 AM, Linus Walleij wrote:
> On Tue, May 12, 2020 at 9:04 AM <dillon.minfei@gmail.com> wrote:
> 
>> From: dillon min <dillon.minfei@gmail.com>
>>
>> Enable the ltdc & ili9341 on stm32429-disco board.
>>
>> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> 
> This mostly looks good but...
> 
>> +&spi5 {
>> +       status = "okay";
>> +       pinctrl-0 = <&spi5_pins>;
>> +       pinctrl-names = "default";
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +       cs-gpios = <&gpioc 2 GPIO_ACTIVE_LOW>;
>> +       dmas = <&dma2 3 2 0x400 0x0>,
>> +              <&dma2 4 2 0x400 0x0>;
>> +       dma-names = "rx", "tx";
> 
> These DMA assignments seem to be SoC things and should
> rather be in the DTS(I) file where &spi5 is defined, right?
> stm32f429.dtsi I suppose?

I agree with Linus, DMA have to be defined in SoC dtsi. And if a board 
doesn't want to use it, we use the "delete-property".

> 
> It is likely the same no matter which device is using spi5.
> 
> Yours,
> Linus Walleij
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
