Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7976C4842CD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 14:53:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666CE10E356;
	Tue,  4 Jan 2022 13:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87A410E356
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 13:52:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 204B2g5v030926;
 Tue, 4 Jan 2022 14:52:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=praGwGEYsgBaggT9u2yedfPPFakmcyA85Vqx86E0DLw=;
 b=eRJKRUJJP3Glsf478hzyyAE32YEW/QwN0nnEOsAGNFZsoZvPFbtDd/W5h7fVfw/f44T2
 crzn2TTt1KtlpXOo9fOBULANNAS/GXAaTY16ADSoBi0iqbRLGW5fhzirEwLFoYiUFCZs
 axE14gZElZ4e1Ei3BdK8uGVRTdfNf4KVbmYsVPOzbQw72pw5NedhyFBw2WJu/ZdGL5nm
 o2udpmgEUElmIkVGSlW2864otVvo6C6b8h7PYTn5podQ+YkihTzV4KU6B6MxnbKBHLVS
 tonBpdmrNZ3bv4ML46n6xAdaXZp+SJOfDIo0QGVS8gOKDkEUVY7llaFdkN0Lfy00ID5D zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dcewm29a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 14:52:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4396A10002A;
 Tue,  4 Jan 2022 14:52:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E76D24241C;
 Tue,  4 Jan 2022 14:52:54 +0100 (CET)
Received: from lmecxl0993.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 4 Jan
 2022 14:52:53 +0100
Subject: Re: [PATCH] drm/stm: remove conflicting framebuffers
From: Philippe CORNU <philippe.cornu@foss.st.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211206134735.13537-1-yannick.fertre@foss.st.com>
 <10c5672d-a228-ed9e-2f32-1ce9ae86dbcc@suse.de>
 <58cc264b-7b46-7869-1c38-f6d79a4daafe@foss.st.com>
Message-ID: <5c58402b-9219-2789-f8c1-67cf2149beac@foss.st.com>
Date: Tue, 4 Jan 2022 14:52:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <58cc264b-7b46-7869-1c38-f6d79a4daafe@foss.st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_06,2022-01-04_01,2021-12-02_01
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



On 12/14/21 11:15 AM, Philippe CORNU wrote:
> 
> 
> On 12/6/21 3:23 PM, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 06.12.21 um 14:47 schrieb Yannick Fertre:
>>> In case of using simplefb or another conflicting framebuffer,
>>> call drm_aperture_remove_framebuffers() to remove memory allocated.
>>>
>>> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
>>
>> The patch should have contained a note that this is version 2 of the 
>> change with a short changelog. Anyway
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> Best regards
>> Thomas
>>
>>> ---
>>>   drivers/gpu/drm/stm/drv.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
>>> index 222869b232ae..9f441aadf2d5 100644
>>> --- a/drivers/gpu/drm/stm/drv.c
>>> +++ b/drivers/gpu/drm/stm/drv.c
>>> @@ -14,6 +14,7 @@
>>>   #include <linux/of_platform.h>
>>>   #include <linux/pm_runtime.h>
>>> +#include <drm/drm_aperture.h>
>>>   #include <drm/drm_atomic.h>
>>>   #include <drm/drm_atomic_helper.h>
>>>   #include <drm/drm_drv.h>
>>> @@ -183,6 +184,10 @@ static int stm_drm_platform_probe(struct 
>>> platform_device *pdev)
>>>       DRM_DEBUG("%s\n", __func__);
>>> +    ret = drm_aperture_remove_framebuffers(false, &drv_driver);
>>> +    if (ret)
>>> +        return ret;
>>> +
> 
> Hi Yannick,
> and many thanks for your patch.
> Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>
> Philippe :-)
> 
> 
>>>       dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
>>>       ddev = drm_dev_alloc(&drv_driver, dev);
>>>
>>

Applied on drm-misc-next.
Many thanks for your patch,
Philippe :-)
