Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4814E3CD5D4
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 15:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180A789D61;
	Mon, 19 Jul 2021 13:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3474589D61
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 13:40:27 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JDaoJh017942; Mon, 19 Jul 2021 15:40:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ZcrhWZxjqzw+tLt3ksAwkFTYrwwcbGzvtLZGLF4ZfNk=;
 b=Z4FtGDp7HjhOsUz0+FRIcems2MI7KjNmQkNa5mX/BuTbyaJ2404ja3XeGL+zjev+ZWlk
 SJNXM/GHgbdLnh8wnAW2oUFvhvFo9uWmIJIhfMoHT8sZAG39Vk9wXZz5RXeXDQFDjSnL
 rrdRmqtHs3P2A0mxy5Xjg5Mk8gitrix+E8SFHzlTOKuuAZctZCRTTU+H4NDL3ONdvHXt
 2Njl1kQYbsDl0oTgiIeaxS4lwPI2uu+3ydZmybai/eJvi0HOs3/VRXTQIOvSNzhD7TKD
 2OKP1uKktlN6nZsioP5TqbFre1i1Igexk/vwpxQVfnYV08E4OFzq43FNVuDbXPnFjPRo OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39w76ds2f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 15:40:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6B89010002A;
 Mon, 19 Jul 2021 15:40:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 435732291C7;
 Mon, 19 Jul 2021 15:40:23 +0200 (CEST)
Received: from lmecxl0993.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Jul
 2021 15:40:21 +0200
Subject: Re: [PATCH] drm/stm: ltdc: Silence -EPROBE_DEFER till bridge attached
From: Philippe CORNU <philippe.cornu@foss.st.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>
References: <20210704135914.268308-1-jagan@amarulasolutions.com>
 <9008c9b8-ae48-588c-cfb4-cda7323e15dd@foss.st.com>
Message-ID: <5306eb41-64d7-1aa3-91f4-2f787c3a2109@foss.st.com>
Date: Mon, 19 Jul 2021 15:40:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9008c9b8-ae48-588c-cfb4-cda7323e15dd@foss.st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_05:2021-07-19,
 2021-07-19 signatures=0
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/13/21 6:43 PM, Philippe CORNU wrote:
> Hi Jagan,
> 
> On 7/4/21 3:59 PM, Jagan Teki wrote:
>> As dw-mipi-dsi supported all possible ways to find the DSI
>> devices. It can take multiple iterations for ltdc to find
>> all components attached to the DSI bridge.
>>
>> The current ltdc driver failed to find the endpoint as
>> it returned -EINVAL for the first iteration itself. This leads
>> to following error:
>>
>> [    3.099289] [drm:ltdc_load] *ERROR* init encoder endpoint 0
>>
>> So, check the return value and cleanup the encoder only if it's
>> not -EPROBE_DEFER. This make all components in the attached DSI
>> bridge found properly.
>>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> ---
>>   drivers/gpu/drm/stm/ltdc.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
>> index 08b71248044d..95e983d3ffb5 100644
>> --- a/drivers/gpu/drm/stm/ltdc.c
>> +++ b/drivers/gpu/drm/stm/ltdc.c
>> @@ -1122,8 +1122,9 @@ static int ltdc_encoder_init(struct drm_device 
>> *ddev, struct drm_bridge *bridge)
>>       ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>>       if (ret) {
>> -        drm_encoder_cleanup(encoder);
>> -        return -EINVAL;
>> +        if (ret != -EPROBE_DEFER)
>> +            drm_encoder_cleanup(encoder);
> 
> Many thanks for your patch.
> 
> This means that we are counting on the future success of the deferred 
> probe because we do not clean the encoder...
> However, Yannick gave his "Tested-by" and this patch seems useful so
> 
> Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>
> 
> I will merge it friday or early next week,
> 
> Thank you
> Philippe :-)
> 
> 
>> +        return ret;
>>       }
>>       DRM_DEBUG_DRIVER("Bridge encoder:%d created\n", encoder->base.id);
>> @@ -1266,7 +1267,8 @@ int ltdc_load(struct drm_device *ddev)
>>           if (bridge) {
>>               ret = ltdc_encoder_init(ddev, bridge);
>>               if (ret) {
>> -                DRM_ERROR("init encoder endpoint %d\n", i);
>> +                if (ret != -EPROBE_DEFER)
>> +                    DRM_ERROR("init encoder endpoint %d\n", i);
>>                   goto err;
>>               }
>>           }
>>

Applied on drm-misc-next.
Many thanks for your patch,
Philippe :-)

