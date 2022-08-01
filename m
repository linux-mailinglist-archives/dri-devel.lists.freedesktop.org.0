Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4877586CEC
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 16:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E1ACDB97;
	Mon,  1 Aug 2022 14:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38802CD801;
 Mon,  1 Aug 2022 14:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659364375; x=1690900375;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NkCrMrpG7PAAemzFvj7zQriC7ibq+uDZy/7liQTcrfA=;
 b=P3XI91bCn3q57bAW9KXSbn3kG6BJ5swqQGnIFvuRcVDvXHrlAiD86Sri
 1Ebzh8lPOpBVPurHZLqGPbXKKwg2X1ealJc/h0YzFjSTZprW2VC+qLA7p
 RzQVEuRIwQeQgWgnNN3jI++HgT0FSvppML+LNBz+sM9Ml4rY5pRbFmlUg I=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Aug 2022 07:32:54 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 07:32:53 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 1 Aug 2022 07:32:52 -0700
Received: from [10.216.14.65] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 1 Aug 2022
 07:32:46 -0700
Message-ID: <f9ab9c36-5ecd-a15d-57de-0ad999d575e4@quicinc.com>
Date: Mon, 1 Aug 2022 20:02:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 1/8] drm/msm: Remove unnecessary pm_runtime_get/put
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <1659174051-27816-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220730150952.v3.1.Icf1e8f0c9b3e7e9933c3b48c70477d0582f3243f@changeid>
 <CAF6AEGsOzd8wMbgpt7bGNdCspNoH4shQfTknwwdyVde8k4zcZw@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAF6AEGsOzd8wMbgpt7bGNdCspNoH4shQfTknwwdyVde8k4zcZw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org, Douglas
 Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Matthias Kaehlcke <mka@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn
 Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/31/2022 9:25 PM, Rob Clark wrote:
> On Sat, Jul 30, 2022 at 2:41 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>> We already enable gpu power from msm_gpu_submit(), so avoid a duplicate
>> pm_runtime_get/put from msm_job_run().
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>
>> (no changes since v1)
>>
>>   drivers/gpu/drm/msm/msm_ringbuffer.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
>> index 56eecb4..cad4c35 100644
>> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
>> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
>> @@ -29,8 +29,6 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
>>                  msm_gem_unlock(obj);
>>          }
>>
>> -       pm_runtime_get_sync(&gpu->pdev->dev);
>> -
> This is removing a _get_sync() and simply relying on a _get() (async)
> in msm_gpu_submit().. that seems pretty likely to go badly?  I think
> it should probably replace the _get() in msm_gpu_submit() with
> _get_sync() (but also since this is changing position of
> resume/suspend vs active_lock, please make sure you test with lockdep
> enabled)
>
> BR,
> -R
As discussed in the other patch, this is correctly handled in 
msm_gpu_submit(). And from active_lock perspective, there is no change 
actually. GPU is ON by the time we touch active_lock in both cases.

-Akhil.
>>          /* TODO move submit path over to using a per-ring lock.. */
>>          mutex_lock(&gpu->lock);
>>
>> @@ -38,8 +36,6 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
>>
>>          mutex_unlock(&gpu->lock);
>>
>> -       pm_runtime_put(&gpu->pdev->dev);
>> -
>>          return dma_fence_get(submit->hw_fence);
>>   }
>>
>> --
>> 2.7.4
>>

