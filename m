Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E173E14C4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 14:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F896EA23;
	Thu,  5 Aug 2021 12:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537F589E52
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 09:37:46 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1759Xnvp021646; Thu, 5 Aug 2021 11:37:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/lg8ln5qr6r8cxbsCBbPBe1Cx7VPnaMBPEeubKnLIRo=;
 b=TLSpPOjvLLeQEHxlNixNz7uG3OhF5Z1ff8BzJ11oGK21VGlL5S/idaK/R14zIPFJbghr
 glCMHtfiJXM3/JYPFR1Yv0PupQidR7IEUL+vkTNdfRn8Ng+hSbiJBWMHY5sfxz32ec2D
 MNCT7IHdvxkcvZIlHKcndmkEUlaYY/Q5EUuNtGf7gbusKOlUjAUkLAH8ejRXN/dVmr/l
 HK1C3fNyH1LTWElur1fqfbrcs9vIQL7hh+smB6mXnEWgFyO6KxlW27fHwOZ85l82STLK
 G3NlyzMBMaSwM/J0giioS86ZIVg6DVO9qc7FcFWImS7OXh5yTVRHfaU9mdY4ARXqd2Tr ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a8bpvrnp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 11:37:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 86185100034;
 Thu,  5 Aug 2021 11:37:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C7E22138F9;
 Thu,  5 Aug 2021 11:37:32 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 5 Aug
 2021 11:37:30 +0200
Subject: Re: [PATCH v4 2/3] ARM: dts: stm32: fix dtbs_check warning on ili9341
 dts binding
To: Dillon Min <dillon.minfei@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, Peter Robinson <pbrobinson@gmail.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, Dave Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>,
 <kbuild-all@lists.01.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
 <1627098243-2742-3-git-send-email-dillon.minfei@gmail.com>
 <CACRpkdYReUdg_7oSTqcsA_+9tS9w6MH90=KV1rGyr4YWT=NW-w@mail.gmail.com>
 <CAL9mu0LfcLS1iNQnamxA_oTrxu8eEBpUm+u92V2d9-8qz6hvow@mail.gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <ecffd445-7f18-518f-2093-19e393588c1e@foss.st.com>
Date: Thu, 5 Aug 2021 11:37:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0LfcLS1iNQnamxA_oTrxu8eEBpUm+u92V2d9-8qz6hvow@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_03:2021-08-05,
 2021-08-05 signatures=0
X-Mailman-Approved-At: Thu, 05 Aug 2021 12:33:48 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dillon

On 8/5/21 11:19 AM, Dillon Min wrote:
> Hi Linus
> 
> Thanks.
> 
> On Thu, 5 Aug 2021 at 17:11, Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>> On Sat, Jul 24, 2021 at 5:44 AM <dillon.minfei@gmail.com> wrote:
>>
>>> From: Dillon Min <dillon.minfei@gmail.com>
>>>
>>> Since the compatible string defined from ilitek,ili9341.yaml is
>>> "st,sf-tc240t-9370-t", "ilitek,ili9341"
>>>
>>> so, append "ilitek,ili9341" to avoid the below dtbs_check warning.
>>>
>>> arch/arm/boot/dts/stm32f429-disco.dt.yaml: display@1: compatible:
>>> ['st,sf-tc240t-9370-t'] is too short
>>>
>>> Fixes: a726e2f000ec ("ARM: dts: stm32: enable ltdc binding with ili9341, gyro l3gd20 on stm32429-disco board")
>>> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> ---
>>> v4: no change.
>>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Please funnel this patch through the STM and ARM SoC tree.
> 
> Sure, I will let Alex know. Thanks for your help on this driver.
> 
> Hi Alex,
> Should I send v5 with Linus's Reviewed-by tag on this patch? thanks.

No, I'll do it.

cheers
alex

> 
> Best Regards
> Dillon
> 
>>
>> Yours,
>> Linus Walleij

