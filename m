Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F0953D3D5
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jun 2022 01:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9901F112442;
	Fri,  3 Jun 2022 23:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14973112442;
 Fri,  3 Jun 2022 23:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654298485; x=1685834485;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bUMNBuUXY/UAvVKqEyweKMXGBGukeILdGV/BgiEzxl4=;
 b=R+OmJmUQWYW9uyAlBgeqbVKsGBSWBFjR+wznpfRq6MpyuOl/BuBuKIcA
 7ov/qJhbaw/FkjmDiwghxWNOpgFLKLHNTQAdDaPi7AMvy9c4NOKf1fVGA
 YI9rxTDybVKvrmqN6PZgpdQtj5qBArbMphC8s2crwhc1nYLxG5yOSzcWR Y=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Jun 2022 16:21:24 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 16:21:24 -0700
Received: from [10.71.110.111] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 3 Jun 2022
 16:21:23 -0700
Message-ID: <ec9516d1-31dd-5cfb-6f93-8cb41e205498@quicinc.com>
Date: Fri, 3 Jun 2022 16:21:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dpu: Add interface support for
 CRC debugfs
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220527185407.162-1-quic_jesszhan@quicinc.com>
 <20220527185407.162-4-quic_jesszhan@quicinc.com>
 <266fdac1-db57-a729-3d73-42d2b34017cd@linaro.org>
 <aa4617f6-65fd-73c6-61b1-686a72c515d7@quicinc.com>
 <beaaeb57-c144-a680-eea6-20a950d25205@linaro.org>
 <bd96aaaf-e324-295c-a35b-1474deeb706c@quicinc.com>
 <CAA8EJppE8dZFQD0fsoS1YwKTzj6U_CfL1SD6RB5stRnD-7UYuQ@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJppE8dZFQD0fsoS1YwKTzj6U_CfL1SD6RB5stRnD-7UYuQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/3/2022 12:02 AM, Dmitry Baryshkov wrote:
> On Fri, 3 Jun 2022 at 04:02, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>> On 6/2/2022 3:51 PM, Dmitry Baryshkov wrote:
>>> On 28/05/2022 01:23, Jessica Zhang wrote:
>>>> On 5/27/2022 12:46 PM, Dmitry Baryshkov wrote:
>>>>> On 27/05/2022 21:54, Jessica Zhang wrote:
>>>>>> Add support for writing CRC values for the interface block to
>>>>>> the debugfs by calling the necessary MISR setup/collect methods.
>>>>>>
>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> [skipped]
> 
>>>>>> +
>>>>>> +        phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
>>>>>> +    }
>>>>>> +}
>>>>>> +
>>>>>> +int dpu_encoder_get_crc(const struct drm_encoder *drm_enc)
>>>>>> +{
>>>>>> +    struct dpu_encoder_virt *dpu_enc;
>>>>>> +    u32 crcs[MAX_PHYS_ENCODERS_PER_VIRTUAL];
>>>>>> +
>>>>>> +    int i, rc;
>>>>>> +
>>>>>> +    if (!drm_enc->crtc) {
>>>>>> +        DRM_ERROR("no crtc found for encoder %d\n", drm_enc->index);
>>>>>> +        return -EINVAL;
>>>>>> +    }
>>>>>> +
>>>>>> +    dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>>>> +
>>>>>> +    for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>>>>> +        struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>>>>>> +
>>>>>> +        if (!phys->hw_intf || !phys->hw_intf->ops.collect_misr)
>>>>>> +            continue;
>>>>>> +
>>>>>> +        rc = phys->hw_intf->ops.collect_misr(phys->hw_intf, &crcs[i]);
>>>>>
>>>>> This doesn't look fully correct. Do we need to skip the indices for
>>>>> the phys without a backing hw_intf?
>>>>
>>>> Sorry if I'm misunderstanding your question, but don't we need to have
>>>> a backing hw_intf (and skip if there isn't any) since the methods for
>>>> collecting/setting MISR registers is within the hw_intf?
>>>
>>> Yes. So the question if we should skip the phys and leave the crcs[i]
>>> untouched, skip the phys and sset crcs[i] to 0 or change
>>> dpu_crtc_parse_crc_source() to return the number of intf-backed
>>> phys_enc's and do not skip any crcs[i].
>>
>> Thanks for the clarification.
>>
>> Is it possible to hit a case where a phys_encoder won't have a
>> corresponding hw_intf?
>>
>> AFAIK, it seems guaranteed that a phys_encoder will have an hw_intf
>> since dpu_encoder_setup_display will skip incrementing num_phys_encs if
>> dpu_encoder_get_intf fails [1].
> 
> WB encoders won't have hw_intf. The code checks that either get_intf
> or get_wb succeeds.

Got it, I see your point. I'll change the values_cnt to only include the 
intf-backed phys_encoders then.

Thanks,

Jessica Zhang

> 
>>
>> [1]
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2263
> 
> 
> -- 
> With best wishes
> Dmitry
