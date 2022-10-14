Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4053D5FEF76
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 15:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE6910EAED;
	Fri, 14 Oct 2022 13:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 965 seconds by postgrey-1.36 at gabe;
 Fri, 14 Oct 2022 13:58:54 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376C010EAED
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 13:58:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EAIpwD021787;
 Fri, 14 Oct 2022 15:42:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=content-type :
 message-id : date : mime-version : from : subject : to : references :
 in-reply-to; s=selector1; bh=rBoOJvOv5eClaQsP0MmwAdSMqzXhW3Ej8ixjUHvhNTc=;
 b=TREVCjYMYpvvc9UgJy++0lBMkWeo4wdmsKLg3knTfucLFUWzTFf+nfV5l4nvmEXHdzF2
 EYKC4I0raFSUwXaQ0DmwIiOilp/Ic7Ow9swARNOi1g1B+3I33YuTFm1BRbN8Yn0/adj/
 IjWMArfaLBQa2dbTnrJWGVJqcZxvaTdKPfKs1I60jTV2j9Fg+/q6zAcgUf0GeoFuV1wg
 iKBDDqquCOLoEtSX9HE56+3MRBrP1dwnSU0ljrx51mTWomBCQQjFdcBAC2/qYNgSSWgI
 dWEfmV8HL4E3YWZipYgkHX1DDvvq7oWx+3pKo7cZ2aOsEF7cSd4wq++9hZ6jG/4gnDmE 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k64m7wss0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 15:42:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AD997100045;
 Fri, 14 Oct 2022 15:42:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A253122F7CA;
 Fri, 14 Oct 2022 15:42:39 +0200 (CEST)
Received: from [10.48.0.201] (10.75.127.121) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 14 Oct
 2022 15:42:37 +0200
Content-Type: multipart/alternative;
 boundary="------------ju2X8xY2WVyoFrWq7CDXUbHN"
Message-ID: <3ce425c7-978f-64e7-0630-b9aa5d1af55c@foss.st.com>
Date: Fri, 14 Oct 2022 15:42:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From: Yannick FERTRE <yannick.fertre@foss.st.com>
Subject: Re: [PATCH] drm/stm: Fix resolution bitmasks
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
References: <20221011231048.505967-1-marex@denx.de>
 <93a77911-e9b2-d2e1-4fff-41f63c87376b@foss.st.com>
Content-Language: en-US
In-Reply-To: <93a77911-e9b2-d2e1-4fff-41f63c87376b@foss.st.com>
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_08,2022-10-14_01,2022-06-22_01
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

--------------ju2X8xY2WVyoFrWq7CDXUbHN
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Marek,

The genmask of regsiter SSCR, BPCR & others were setted accordly to the 
chipset stm32f4.

You can see more details on page 493 of reference manual RM0090:

https://www.st.com/resource/en/reference_manual/DM00031020-.pdf

With future hardware, all of these registers will aligned on 16bits.

I would like to know if you use a display which resolution exceed 2048.

Best regards

Yannick Fertré


On 10/14/22 14:17, Yannick FERTRE wrote:
> Hi Marek,
>
> thanks for the patch.
>
> Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
>
> On 10/12/22 01:10, Marek Vasut wrote:
>> STM32MP15xx RM0436 Rev 6 "35.7.3 LTDC synchronization size configuration
>> register (LTDC_SSCR)" on page 1784 and onward indicates VSH and similar
>> bits are all [11:0] instead of [10:0] wide. Fix this.
>>
>> [1] https://www.st.com/resource/en/reference_manual/DM00327659-.pdf
>>
>> Fixes: b759012c5fa7 ("drm/stm: Add STM32 LTDC driver")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
>> Cc: Benjamin Gaignard <benjamin.gaignard@foss.st.com>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Vincent Abriou <vincent.abriou@foss.st.com>
>> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> To: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/stm/ltdc.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
>> index 03c6becda795c..639ed00b44a57 100644
>> --- a/drivers/gpu/drm/stm/ltdc.c
>> +++ b/drivers/gpu/drm/stm/ltdc.c
>> @@ -111,16 +111,16 @@
>>   #define LTDC_L1FPF1R    (ldev->caps.layer_regs[24])    /* L1 
>> Flexible Pixel Format 1 */
>>     /* Bit definitions */
>> -#define SSCR_VSH    GENMASK(10, 0)    /* Vertical Synchronization 
>> Height */
>> +#define SSCR_VSH    GENMASK(11, 0)    /* Vertical Synchronization 
>> Height */
>>   #define SSCR_HSW    GENMASK(27, 16)    /* Horizontal 
>> Synchronization Width */
>>   -#define BPCR_AVBP    GENMASK(10, 0)    /* Accumulated Vertical 
>> Back Porch */
>> +#define BPCR_AVBP    GENMASK(11, 0)    /* Accumulated Vertical Back 
>> Porch */
>>   #define BPCR_AHBP    GENMASK(27, 16)    /* Accumulated Horizontal 
>> Back Porch */
>>   -#define AWCR_AAH    GENMASK(10, 0)    /* Accumulated Active Height */
>> +#define AWCR_AAH    GENMASK(11, 0)    /* Accumulated Active Height */
>>   #define AWCR_AAW    GENMASK(27, 16)    /* Accumulated Active Width */
>>   -#define TWCR_TOTALH    GENMASK(10, 0)    /* TOTAL Height */
>> +#define TWCR_TOTALH    GENMASK(11, 0)    /* TOTAL Height */
>>   #define TWCR_TOTALW    GENMASK(27, 16)    /* TOTAL Width */
>>     #define GCR_LTDCEN    BIT(0)        /* LTDC ENable */
--------------ju2X8xY2WVyoFrWq7CDXUbHN
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p class="MsoNormal"><span style="mso-fareast-language:EN-US">Hi
        Marek,<br>
      </span></p>
    <p class="MsoNormal"><span style="mso-fareast-language:EN-US">The
        genmask of regsiter SSCR, BPCR &amp; others were setted accordly
        to the chipset stm32f4.</span></p>
    <p class="MsoNormal"><span style="mso-fareast-language:EN-US">You
        can see more details on page 493 of reference manual RM0090:</span></p>
    <p class="MsoNormal"><span style="mso-fareast-language:EN-US"><a
          href="https://www.st.com/resource/en/reference_manual/DM00031020-.pdf"
          class="moz-txt-link-freetext">https://www.st.com/resource/en/reference_manual/DM00031020-.pdf</a></span></p>
    <p>With future hardware, all of these registers will aligned on
      16bits.<br>
    </p>
    <p>I would like to know if you use a display which resolution exceed
      2048.<br>
    </p>
    <p>Best regards<br>
    </p>
    <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
        lang="EN-US">Yannick Fertré <br>
      </span></p>
    <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
        lang="EN-US"><br>
      </span></p>
    <div class="moz-cite-prefix">On 10/14/22 14:17, Yannick FERTRE
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:93a77911-e9b2-d2e1-4fff-41f63c87376b@foss.st.com">Hi
      Marek, <br>
      <br>
      thanks for the patch. <br>
      <br>
      Reviewed-by: Yannick Fertre <a class="moz-txt-link-rfc2396E"
        href="mailto:yannick.fertre@foss.st.com">&lt;yannick.fertre@foss.st.com&gt;</a>
      <br>
      <br>
      On 10/12/22 01:10, Marek Vasut wrote: <br>
      <blockquote type="cite">STM32MP15xx RM0436 Rev 6 "35.7.3 LTDC
        synchronization size configuration <br>
        register (LTDC_SSCR)" on page 1784 and onward indicates VSH and
        similar <br>
        bits are all [11:0] instead of [10:0] wide. Fix this. <br>
        <br>
        [1] <a class="moz-txt-link-freetext"
          href="https://www.st.com/resource/en/reference_manual/DM00327659-.pdf">https://www.st.com/resource/en/reference_manual/DM00327659-.pdf</a>
        <br>
        <br>
        Fixes: b759012c5fa7 ("drm/stm: Add STM32 LTDC driver") <br>
        Signed-off-by: Marek Vasut <a class="moz-txt-link-rfc2396E"
          href="mailto:marex@denx.de">&lt;marex@denx.de&gt;</a> <br>
        --- <br>
        Cc: Alexandre Torgue <a class="moz-txt-link-rfc2396E"
          href="mailto:alexandre.torgue@foss.st.com">&lt;alexandre.torgue@foss.st.com&gt;</a>
        <br>
        Cc: Antonio Borneo <a class="moz-txt-link-rfc2396E"
          href="mailto:antonio.borneo@foss.st.com">&lt;antonio.borneo@foss.st.com&gt;</a>
        <br>
        Cc: Benjamin Gaignard <a class="moz-txt-link-rfc2396E"
          href="mailto:benjamin.gaignard@foss.st.com">&lt;benjamin.gaignard@foss.st.com&gt;</a>
        <br>
        Cc: Maxime Coquelin <a class="moz-txt-link-rfc2396E"
          href="mailto:mcoquelin.stm32@gmail.com">&lt;mcoquelin.stm32@gmail.com&gt;</a>
        <br>
        Cc: Philippe Cornu <a class="moz-txt-link-rfc2396E"
          href="mailto:philippe.cornu@foss.st.com">&lt;philippe.cornu@foss.st.com&gt;</a>
        <br>
        Cc: Sam Ravnborg <a class="moz-txt-link-rfc2396E"
          href="mailto:sam@ravnborg.org">&lt;sam@ravnborg.org&gt;</a> <br>
        Cc: Vincent Abriou <a class="moz-txt-link-rfc2396E"
          href="mailto:vincent.abriou@foss.st.com">&lt;vincent.abriou@foss.st.com&gt;</a>
        <br>
        Cc: Yannick Fertre <a class="moz-txt-link-rfc2396E"
          href="mailto:yannick.fertre@foss.st.com">&lt;yannick.fertre@foss.st.com&gt;</a>
        <br>
        Cc: <a class="moz-txt-link-abbreviated moz-txt-link-freetext"
          href="mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@lists.infradead.org</a>
        <br>
        Cc: <a class="moz-txt-link-abbreviated moz-txt-link-freetext"
          href="mailto:linux-stm32@st-md-mailman.stormreply.com">linux-stm32@st-md-mailman.stormreply.com</a>
        <br>
        To: <a class="moz-txt-link-abbreviated moz-txt-link-freetext"
          href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
        <br>
        --- <br>
          drivers/gpu/drm/stm/ltdc.c | 8 ++++---- <br>
          1 file changed, 4 insertions(+), 4 deletions(-) <br>
        <br>
        diff --git a/drivers/gpu/drm/stm/ltdc.c
        b/drivers/gpu/drm/stm/ltdc.c <br>
        index 03c6becda795c..639ed00b44a57 100644 <br>
        --- a/drivers/gpu/drm/stm/ltdc.c <br>
        +++ b/drivers/gpu/drm/stm/ltdc.c <br>
        @@ -111,16 +111,16 @@ <br>
          #define LTDC_L1FPF1R    (ldev-&gt;caps.layer_regs[24])    /*
        L1 Flexible Pixel Format 1 */ <br>
            /* Bit definitions */ <br>
        -#define SSCR_VSH    GENMASK(10, 0)    /* Vertical
        Synchronization Height */ <br>
        +#define SSCR_VSH    GENMASK(11, 0)    /* Vertical
        Synchronization Height */ <br>
          #define SSCR_HSW    GENMASK(27, 16)    /* Horizontal
        Synchronization Width */ <br>
          -#define BPCR_AVBP    GENMASK(10, 0)    /* Accumulated
        Vertical Back Porch */ <br>
        +#define BPCR_AVBP    GENMASK(11, 0)    /* Accumulated Vertical
        Back Porch */ <br>
          #define BPCR_AHBP    GENMASK(27, 16)    /* Accumulated
        Horizontal Back Porch */ <br>
          -#define AWCR_AAH    GENMASK(10, 0)    /* Accumulated Active
        Height */ <br>
        +#define AWCR_AAH    GENMASK(11, 0)    /* Accumulated Active
        Height */ <br>
          #define AWCR_AAW    GENMASK(27, 16)    /* Accumulated Active
        Width */ <br>
          -#define TWCR_TOTALH    GENMASK(10, 0)    /* TOTAL Height */ <br>
        +#define TWCR_TOTALH    GENMASK(11, 0)    /* TOTAL Height */ <br>
          #define TWCR_TOTALW    GENMASK(27, 16)    /* TOTAL Width */ <br>
            #define GCR_LTDCEN    BIT(0)        /* LTDC ENable */ <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------ju2X8xY2WVyoFrWq7CDXUbHN--
