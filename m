Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2E8491199
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 23:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C411D10FFA1;
	Mon, 17 Jan 2022 22:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC60D10E2F6;
 Mon, 17 Jan 2022 14:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642430307; x=1673966307;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/wDgTOF9nD7qJTc2/BsA6bElbpP6tW+QytfeDJS27YY=;
 b=pCooqTNrVTL4+NWSmBiDaUyaUWXJ7i2UlvVhE3Qkoe5DMsqrEAkOANBL
 yYaNX+2Ablbj4/kuAK3lkk+RYYDvf13FmLhdvRozSID30e5btfyaccq+f
 VA9Yj7INu2y5ZJG0yOtSLOS6bVBckE62SZ021acJaTQ+LbMeLteeCvlHp 0=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 17 Jan 2022 06:38:27 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 06:38:26 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 17 Jan 2022 06:38:25 -0800
Received: from [10.216.12.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 17 Jan
 2022 06:38:19 -0800
Message-ID: <bd284863-3643-4a8e-beb6-f47cc60ea1b5@quicinc.com>
Date: Mon, 17 Jan 2022 20:08:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 3/4] drm/msm/adreno: Expose speedbin to userspace
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>
References: <20220112030115.1.Ibac66e1e0e565313bc28f192e6c94cb508f205eb@changeid>
 <20220112030115.3.I86c32730e08cba9e5c83f02ec17885124d45fa56@changeid>
 <CAF6AEGuJxdrYM5XXt6sUGmjossqZTRzwQ6Y8qYsnfCYDvGQurw@mail.gmail.com>
 <CAA8EJpokgiUbqj9BOF52a9QjJK53PinNHfxy_6nbNq53JnO2Og@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAA8EJpokgiUbqj9BOF52a9QjJK53PinNHfxy_6nbNq53JnO2Og@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Mailman-Approved-At: Mon, 17 Jan 2022 22:07:45 +0000
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
Cc: Sean Paul <sean@poorly.run>, OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS <devicetree@vger.kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/13/2022 12:43 PM, Dmitry Baryshkov wrote:
> On Thu, 13 Jan 2022 at 00:19, Rob Clark <robdclark@gmail.com> wrote:
>> On Tue, Jan 11, 2022 at 1:31 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>> Expose speedbin through MSM_PARAM_CHIP_ID parameter to help userspace
>>> identify the sku.
>>>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> ---
>>>
>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 9 +++++----
>>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> index f33cfa4..e970e6a 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> @@ -242,10 +242,11 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
>>>                  *value = !adreno_is_a650_family(adreno_gpu) ? 0x100000 : 0;
>>>                  return 0;
>>>          case MSM_PARAM_CHIP_ID:
>>> -               *value = adreno_gpu->rev.patchid |
>>> -                               (adreno_gpu->rev.minor << 8) |
>>> -                               (adreno_gpu->rev.major << 16) |
>>> -                               (adreno_gpu->rev.core << 24);
>>> +               *value = (uint64_t) adreno_gpu->rev.patchid |
>>> +                               (uint64_t) (adreno_gpu->rev.minor << 8) |
>>> +                               (uint64_t) (adreno_gpu->rev.major << 16) |
>>> +                               (uint64_t) (adreno_gpu->rev.core << 24) |
>>> +                               (((uint64_t) adreno_gpu->rev.sku) << 32);
>> How about this instead, so we are only changing the behavior for
>> new/unreleased devices:

I thought this property was only used for new devices whereas the 
existing devices rely on REVN.

-Akhil.

>>
>> *value = adreno_gpu->rev.patchid |
>> (adreno_gpu->rev.minor << 8) |
>> (adreno_gpu->rev.major << 16) |
>> (adreno_gpu->rev.core << 24);
>> if (!adreno_gpu->info->revn)
>> *value |= (((uint64_t) adreno_gpu->rev.sku) << 32);
>>
>> (sorry about the butchered indentation.. somehow gmail has become
>> antagonistic about pasting code)
> I assume that you would like to keep userspace compat for older chips.
> thus the if.
> Maybe we should introduce MSM_PARAM_CHIP_ID_SKU instead (and gradually
> make userspace switch to it)?
>
>> BR,
>> -R
>>
>>>                  return 0;
>>>          case MSM_PARAM_MAX_FREQ:
>>>                  *value = adreno_gpu->base.fast_rate;
>>> --
>>> 2.7.4
>>>
>
>

