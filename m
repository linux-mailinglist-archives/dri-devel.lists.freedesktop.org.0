Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1162A469758
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 14:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6315D7AB0D;
	Mon,  6 Dec 2021 13:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A7E7AB00
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 13:42:58 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B6BTNV5004649;
 Mon, 6 Dec 2021 14:42:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=F6W+F1Vf7fYffkjJdPpsISKp/C9lL7UUAM9B4MeGe9M=;
 b=h9Izmgr4eMqce9mCmp48j0IWXnASaiBlCb2qCT3AcvaKj8NI4VLMuI1Zk1JZ7D8o5DRl
 8yuUowYCW8BDL4U6tYcUqdAChpi7+hHTu/LBPKLkGCdRV+ZNGGNqzXuI7IKK5msVPDwg
 yAIeWBcB9araYy4lwmn8fyzrLKlwPflU4t7rRPbjoT+pLGyL/kvip8Tx9aW0sVprX7Uw
 +qrtY7kw1Som+ZslVdJWnYMRR00IQeSwS2lPeqpbK8cj7WqOyIquGC/yFw8ApjnqQL88
 HjJ0G8FZWav6UrKFgQBvCSJxm/N981Hngpp1JUwBduf3U9+iPt+vOLYPucUOOaVb4u87 Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cryhqvsm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 14:42:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F82310002A;
 Mon,  6 Dec 2021 14:42:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DBF3C2A4D7F;
 Mon,  6 Dec 2021 14:42:50 +0100 (CET)
Received: from lmecxl0951.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 6 Dec
 2021 14:42:50 +0100
Subject: Re: [PATCH] drm/stm: remove conflicting framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211203085512.11127-1-yannick.fertre@foss.st.com>
 <7469e918-b2bf-00a9-1bbc-2f3514ec0816@suse.de>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <169ba08b-fdaa-866e-91bf-7a353c1d713d@foss.st.com>
Date: Mon, 6 Dec 2021 14:42:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7469e918-b2bf-00a9-1bbc-2f3514ec0816@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_04,2021-12-06_02,2021-12-02_01
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

Hi Thomas,


On 12/3/21 10:35 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.12.21 um 09:55 schrieb Yannick Fertre:
>> In case of using simplefb or another conflicting framebuffer,
>> call drm_aperture_remove_framebuffers() to remove memory allocated.
>>
>> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
>> ---
>>   drivers/gpu/drm/stm/drv.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
>> index 222869b232ae..5ba46f70f081 100644
>> --- a/drivers/gpu/drm/stm/drv.c
>> +++ b/drivers/gpu/drm/stm/drv.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/of_platform.h>
>>   #include <linux/pm_runtime.h>
>> +#include <drm/drm_aperture.h>
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_drv.h>
>> @@ -193,6 +194,10 @@ static int stm_drm_platform_probe(struct 
>> platform_device *pdev)
>>       if (ret)
>>           goto err_put;
>> +    ret = drm_aperture_remove_framebuffers(false, &drv_driver);
>> +    if (ret)
>> +        goto err_put;
>> +
> 
> This has to be done at the very top of the probe function, before 
> anything that touches the device. Otherwise both drivers interfere with 
> each other while probing and setup's going on.
> 
> Best regards
> Thomas
> 
>>       ret = drm_dev_register(ddev, 0);
>>       if (ret)
>>           goto err_put;
>>
> 
Thanks for reviewing the patch.
I will follow your advice and push a new patch.

Yannick
