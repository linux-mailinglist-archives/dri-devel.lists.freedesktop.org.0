Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD46F9F56A0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 19:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60C310E7C2;
	Tue, 17 Dec 2024 18:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZLNhWZDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256CC10E663;
 Tue, 17 Dec 2024 18:58:21 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHAmBrb026306;
 Tue, 17 Dec 2024 18:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6EB902R1SCU5aTam+grDN3ROEgB0woaesK/WyArIS5M=; b=ZLNhWZDVfwpmOJ04
 UIisRmtMrNyE4Dt+Dj1OdQQ0Fj7UFARxh3K9PtG6kjTNhKqVD9LPOKpzzFZUzsJH
 b1YL/pWL82hmtheDjQAn+kMAdz98J0hK1j7cJzbRL5b3VC1l+cma+ygH6b6YEpUl
 380f1uopAJ4sbPPa3O0d82L6d15+rOX9UL1DmSiU4trBaCgMOL3jglm/9NADgFHf
 2oZFPU2/X3g1912uNPTpXMM9PCXfKQBYDAPOJy9ItmLZ6kkZV921qgUIp32m82KL
 mAdWBCisq3ihn8BQhFPsVCft0ijGxuSRNJAtg9mUflhLKDBdQRy7ZepOVwXaDjRD
 La2T1A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k7v099sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 18:58:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHIwBEF024934
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 18:58:11 GMT
Received: from [10.216.20.10] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 10:58:05 -0800
Message-ID: <8798a66b-0c07-4713-8966-5bac7bd4aae1@quicinc.com>
Date: Wed, 18 Dec 2024 00:28:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/msm: Add UABI to request perfcntr usage
To: Rob Clark <robdclark@gmail.com>
CC: Connor Abbott <cwabbott0@gmail.com>, Antonino Maniscalco
 <antomani103@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, open list
 <linux-kernel@vger.kernel.org>
References: <20241205165419.54080-1-robdclark@gmail.com>
 <eca60b8e-8a8a-41c4-816a-d084822646f1@quicinc.com>
 <de6cfac6-84a0-4160-b279-c23e10f96872@gmail.com>
 <96e918d7-6e29-4d0a-8e9d-b77232c37ef0@quicinc.com>
 <30fadc96-d531-4cde-a717-c5983908ea04@gmail.com>
 <ae351364-7590-4080-baea-80133c79c86f@quicinc.com>
 <CACu1E7E4Ege0VgsSmjzqPDYg7eWwRWQOjPyyCT-ty5tEYKP-bg@mail.gmail.com>
 <2d41a6b3-dc6c-4bad-82e8-7bed1a561d42@quicinc.com>
 <CAF6AEGsKyQAYPxLTGdJ0mW6_ZMHiRhNgAtXFDaNicHQ_4Y3AmQ@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAF6AEGsKyQAYPxLTGdJ0mW6_ZMHiRhNgAtXFDaNicHQ_4Y3AmQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: oW-UGmsAcX5j9x3Fy7mAk-hW8O5APli-
X-Proofpoint-ORIG-GUID: oW-UGmsAcX5j9x3Fy7mAk-hW8O5APli-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 bulkscore=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170144
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

On 12/17/2024 2:21 AM, Rob Clark wrote:
> On Mon, Dec 16, 2024 at 12:25 PM Akhil P Oommen
> <quic_akhilpo@quicinc.com> wrote:
>>
>> On 12/16/2024 10:28 PM, Connor Abbott wrote:
>>> On Mon, Dec 16, 2024 at 11:55 AM Akhil P Oommen
>>> <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> On 12/13/2024 10:40 PM, Antonino Maniscalco wrote:
>>>>> On 12/13/24 5:50 PM, Akhil P Oommen wrote:
>>>>>> On 12/12/2024 9:44 PM, Antonino Maniscalco wrote:
>>>>>>> On 12/12/24 4:58 PM, Akhil P Oommen wrote:
>>>>>>>> On 12/5/2024 10:24 PM, Rob Clark wrote:
>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>>>>
>>>>>>>>> Performance counter usage falls into two categories:
>>>>>>>>>
>>>>>>>>> 1. Local usage, where the counter configuration, start, and end read
>>>>>>>>>      happen within (locally to) a single SUBMIT.  In this case,
>>>>>>>>> there is
>>>>>>>>>      no dependency on counter configuration or values between submits,
>>>>>>>>> and
>>>>>>>>>      in fact counters are normally cleared on context switches,
>>>>>>>>> making it
>>>>>>>>>      impossible to rely on cross-submit state.
>>>>>>>>>
>>>>>>>>> 2. Global usage, where a single privilaged daemon/process is sampling
>>>>>>>>>      counter values across all processes for profiling.
>>>>>>>>>
>>>>>>>>> The two categories are mutually exclusive.  While you can have many
>>>>>>>>> processes making local counter usage, you cannot combine global and
>>>>>>>>> local usage without the two stepping on each others feet (by changing
>>>>>>>>> counter configuration).
>>>>>>>>>
>>>>>>>>> For global counter usage, there is already a SYSPROF param (since
>>>>>>>>> global
>>>>>>>>> counter usage requires disabling counter clearing on context switch).
>>>>>>>>> This patch adds a REQ_CNTRS param to request local counter usage.  If
>>>>>>>>> one or more processes has requested counter usage, then a SYSPROF
>>>>>>>>> request will fail with -EBUSY.  And if SYSPROF is active, then
>>>>>>>>> REQ_CNTRS
>>>>>>>>> will fail with -EBUSY, maintaining the mutual exclusivity.
>>>>>>>>>
>>>>>>>>> This is purely an advisory interface to help coordinate userspace.
>>>>>>>>> There is no real means of enforcement, but the worst that can
>>>>>>>>> happen if
>>>>>>>>> userspace ignores a REQ_CNTRS failure is that you'll get nonsense
>>>>>>>>> profiling data.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>>>>>> ---
>>>>>>>>> kgsl takes a different approach, which involves a lot more UABI for
>>>>>>>>> assigning counters to different processes.  But I think by taking
>>>>>>>>> advantage of the fact that mesa (freedreno+turnip) reconfigure the
>>>>>>>>> counters they need in each SUBMIT, for their respective gl/vk perf-
>>>>>>>>> counter extensions, we can take this simpler approach.
>>>>>>>>
>>>>>>>> KGSL's approach is preemption and ifpc safe (also whatever HW changes
>>>>>>>> that will come up in future generations). How will we ensure that here?
>>>>>>>>
>>>>>>>> I have plans to bring up IFPC support in near future. Also, I
>>>>>>>> brought up
>>>>>>>> this point during preemption series. But from the responses, I felt
>>>>>>>> that
>>>>>>>> profiling was not considered a serious usecase. Still I wonder how the
>>>>>>>> perfcounter extensions work accurately with preemption.
>>>>>>>
>>>>>>> So back then I implemented the postamble IB to clear perf counters and
>>>>>>> that gets disabled when sysprof (so global usage) is happening. The
>>>>>>> kernel is oblivious to "Local isage" of profiling but in that case
>>>>>>> really what we want to do is disable preemption which in my
>>>>>>> understanding can be done from userspace with a PKT. In my understanding
>>>>>>> this had us covered for all usecases.
>>>>>>
>>>>>> I think this wasn't mentioned at that time. Which UMD PKT in a6x+ did
>>>>>> you mean?
>>>>>
>>>>> Ah, I thought it wasmentioned, sorry.
>>>>> The packet I was referring to is:
>>>>>     <doc> Make next dword 1 to disable preemption, 0 to re-enable it. </
>>>>> doc>
>>>>>     <value name="CP_PREEMPT_DISABLE" value="0x6c" variants="A6XX"/>
>>>>
>>>> Ah! Okay. I think this packet is not used by the downstream blob. IMO,
>>>> disabling preemption is still a suboptimal solution.
>>>
>>> Downstream doesn't expose userspace perfcounters (i.e.
>>> VK_KHR_performance_query) at all. My understanding is that Android
>>> requires you not to expose them for security reasons, but I could be
>>> wrong there. In any case, Qualcomm clearly hasn't really thought
>>> through what it would take to make everything work well with userspace
>>> perfcounters and hasn't implemented the necessary firmware bits for
>>> that, so we're left muddling through and doing what we can.
>>>
>>
>> Honestly, I don't know what you meant by the missing support.
> 
> GMU support to save/restore SEL regs on IFPC when SYSPROF is enabled ;-)
> 

That won't solve the case of reading counters via devmem. That still
would require disabling ifpc.

> If we had that, we wouldn't need ioclts to assign+configure counters,
> everything else could be done in userspace (modulo trying to do both
> local and global profiling at the same time.. but I'm not convinced
> that is a valid use-case, as I mentioned earlier)
> 
Lets ignore this use-case then. We can revisit if it becomes a thing in
upstream.

-Akhil.

> BR,
> -R
> 
>> -Akhil.
>>
>>> Connor
>>>
>>>>
>>>>>
>>>>> BTW you mentioned wanting to look into IFPC. Since I too wanted to look
>>>>> into implementing it wonder if you could let me know when you planned on
>>>>> working on it.
>>>>
>>>> I have few patches in progress. Nothing final yet and need verification
>>>> on the hw side. Also, I need to do some housekeeping here to debug gmu
>>>> issues since IFPC increases the probability of those a lot.
>>>>
>>>> I will try to send out the patches very soon.
>>>>
>>>> -Akhil.
>>>>
>>>>>
>>>>>>
>>>>>> -Akhil.
>>>>>>
>>>>>>>
>>>>>>> So what would you expect instead we should do kernel side to make
>>>>>>> profiling preemption safe?
>>>>>>>
>>>>>>>>
>>>>>>>> -Akhil
>>>>>>>>
>>>>>>>>>
>>>>>>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +
>>>>>>>>>    drivers/gpu/drm/msm/msm_drv.c           |  5 ++-
>>>>>>>>>    drivers/gpu/drm/msm/msm_gpu.c           |  1 +
>>>>>>>>>    drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++-
>>>>>>>>>    drivers/gpu/drm/msm/msm_submitqueue.c   | 52 +++++++++++++++++++
>>>>>>>>> +++++-
>>>>>>>>>    include/uapi/drm/msm_drm.h              |  1 +
>>>>>>>>>    6 files changed, 85 insertions(+), 5 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/
>>>>>>>>> drm/msm/adreno/adreno_gpu.c
>>>>>>>>> index 31bbf2c83de4..f688e37059b8 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>>>>>>> @@ -441,6 +441,8 @@ int adreno_set_param(struct msm_gpu *gpu, struct
>>>>>>>>> msm_file_private *ctx,
>>>>>>>>>            if (!capable(CAP_SYS_ADMIN))
>>>>>>>>>                return UERR(EPERM, drm, "invalid permissions");
>>>>>>>>>            return msm_file_private_set_sysprof(ctx, gpu, value);
>>>>>>>>> +    case MSM_PARAM_REQ_CNTRS:
>>>>>>>>> +        return msm_file_private_request_counters(ctx, gpu, value);
>>>>>>>>>        default:
>>>>>>>>>            return UERR(EINVAL, drm, "%s: invalid param: %u", gpu-
>>>>>>>>>> name, param);
>>>>>>>>>        }
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/
>>>>>>>>> msm_drv.c
>>>>>>>>> index 6416d2cb4efc..bf8314ff4a25 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/msm_drv.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>>>>>>>>> @@ -377,9 +377,12 @@ static void msm_postclose(struct drm_device
>>>>>>>>> *dev, struct drm_file *file)
>>>>>>>>>         * It is not possible to set sysprof param to non-zero if gpu
>>>>>>>>>         * is not initialized:
>>>>>>>>>         */
>>>>>>>>> -    if (priv->gpu)
>>>>>>>>> +    if (ctx->sysprof)
>>>>>>>>>            msm_file_private_set_sysprof(ctx, priv->gpu, 0);
>>>>>>>>>    +    if (ctx->counters_requested)
>>>>>>>>> +        msm_file_private_request_counters(ctx, priv->gpu, 0);
>>>>>>>>> +
>>>>>>>>>        context_close(ctx);
>>>>>>>>>    }
>>>>>>>>>    diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/
>>>>>>>>> msm_gpu.c
>>>>>>>>> index 82f204f3bb8f..013b59ca3bb1 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>>>>>>>>> @@ -991,6 +991,7 @@ int msm_gpu_init(struct drm_device *drm, struct
>>>>>>>>> platform_device *pdev,
>>>>>>>>>        gpu->nr_rings = nr_rings;
>>>>>>>>>          refcount_set(&gpu->sysprof_active, 1);
>>>>>>>>> +    refcount_set(&gpu->local_counters_active, 1);
>>>>>>>>>          return 0;
>>>>>>>>>    diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/
>>>>>>>>> msm_gpu.h
>>>>>>>>> index e25009150579..83c61e523b1b 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>>>>>>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>>>>>>>>> @@ -195,12 +195,28 @@ struct msm_gpu {
>>>>>>>>>        int nr_rings;
>>>>>>>>>          /**
>>>>>>>>> -     * sysprof_active:
>>>>>>>>> +     * @sysprof_active:
>>>>>>>>>         *
>>>>>>>>> -     * The count of contexts that have enabled system profiling.
>>>>>>>>> +     * The count of contexts that have enabled system profiling plus
>>>>>>>>> one.
>>>>>>>>> +     *
>>>>>>>>> +     * Note: refcount_t does not like 0->1 transitions.. we want to
>>>>>>>>> keep
>>>>>>>>> +     * the under/overflow checks that refcount_t provides, but allow
>>>>>>>>> +     * multiple on/off transitions so we track the logical value
>>>>>>>>> plus one.)
>>>>>>>>>         */
>>>>>>>>>        refcount_t sysprof_active;
>>>>>>>>>    +    /**
>>>>>>>>> +     * @local_counters_active:
>>>>>>>>> +     *
>>>>>>>>> +     * The count of contexts that have requested local (intra-submit)
>>>>>>>>> +     * performance counter usage plus one.
>>>>>>>>> +     *
>>>>>>>>> +     * Note: refcount_t does not like 0->1 transitions.. we want to
>>>>>>>>> keep
>>>>>>>>> +     * the under/overflow checks that refcount_t provides, but allow
>>>>>>>>> +     * multiple on/off transitions so we track the logical value
>>>>>>>>> plus one.)
>>>>>>>>> +     */
>>>>>>>>> +    refcount_t local_counters_active;
>>>>>>>>> +
>>>>>>>>>        /**
>>>>>>>>>         * lock:
>>>>>>>>>         *
>>>>>>>>> @@ -383,6 +399,13 @@ struct msm_file_private {
>>>>>>>>>         */
>>>>>>>>>        int sysprof;
>>>>>>>>>    +    /**
>>>>>>>>> +     * @counters_requested:
>>>>>>>>> +     *
>>>>>>>>> +     * Has the context requested local perfcntr usage.
>>>>>>>>> +     */
>>>>>>>>> +    bool counters_requested;
>>>>>>>>> +
>>>>>>>>>        /**
>>>>>>>>>         * comm: Overridden task comm, see MSM_PARAM_COMM
>>>>>>>>>         *
>>>>>>>>> @@ -626,6 +649,8 @@ void msm_submitqueue_destroy(struct kref *kref);
>>>>>>>>>      int msm_file_private_set_sysprof(struct msm_file_private *ctx,
>>>>>>>>>                     struct msm_gpu *gpu, int sysprof);
>>>>>>>>> +int msm_file_private_request_counters(struct msm_file_private *ctx,
>>>>>>>>> +                      struct msm_gpu *gpu, int reqcntrs);
>>>>>>>>>    void __msm_file_private_destroy(struct kref *kref);
>>>>>>>>>      static inline void msm_file_private_put(struct msm_file_private
>>>>>>>>> *ctx)
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/
>>>>>>>>> msm/msm_submitqueue.c
>>>>>>>>> index 7fed1de63b5d..1e1e21e6f7ae 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
>>>>>>>>> @@ -10,6 +10,15 @@
>>>>>>>>>    int msm_file_private_set_sysprof(struct msm_file_private *ctx,
>>>>>>>>>                     struct msm_gpu *gpu, int sysprof)
>>>>>>>>>    {
>>>>>>>>> +    int ret = 0;
>>>>>>>>> +
>>>>>>>>> +    mutex_lock(&gpu->lock);
>>>>>>>>> +
>>>>>>>>> +    if (sysprof && (refcount_read(&gpu->local_counters_active) >
>>>>>>>>> 1)) {
>>>>>>>>> +        ret = UERR(EBUSY, gpu->dev, "Local counter usage active");
>>>>>>>>> +        goto out_unlock;
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>>        /*
>>>>>>>>>         * Since pm_runtime and sysprof_active are both refcounts, we
>>>>>>>>>         * call apply the new value first, and then unwind the previous
>>>>>>>>> @@ -18,7 +27,8 @@ int msm_file_private_set_sysprof(struct
>>>>>>>>> msm_file_private *ctx,
>>>>>>>>>          switch (sysprof) {
>>>>>>>>>        default:
>>>>>>>>> -        return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d",
>>>>>>>>> sysprof);
>>>>>>>>> +        ret = UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysprof);
>>>>>>>>> +        goto out_unlock;
>>>>>>>>>        case 2:
>>>>>>>>>            pm_runtime_get_sync(&gpu->pdev->dev);
>>>>>>>>>            fallthrough;
>>>>>>>>> @@ -43,7 +53,45 @@ int msm_file_private_set_sysprof(struct
>>>>>>>>> msm_file_private *ctx,
>>>>>>>>>          ctx->sysprof = sysprof;
>>>>>>>>>    -    return 0;
>>>>>>>>> +out_unlock:
>>>>>>>>> +    mutex_unlock(&gpu->lock);
>>>>>>>>> +
>>>>>>>>> +    return ret;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +int msm_file_private_request_counters(struct msm_file_private *ctx,
>>>>>>>>> +                      struct msm_gpu *gpu, int reqctrs)
>>>>>>>>> +{
>>>>>>>>> +    int ret = 0;
>>>>>>>>> +
>>>>>>>>> +    mutex_lock(&gpu->lock);
>>>>>>>>> +
>>>>>>>>> +    if (reqctrs && (refcount_read(&gpu->sysprof_active) > 1)) {
>>>>>>>>> +        ret = UERR(EBUSY, gpu->dev, "System profiling active");
>>>>>>>>> +        goto out_unlock;
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +    if (reqctrs) {
>>>>>>>>> +        if (ctx->counters_requested) {
>>>>>>>>> +            ret = UERR(EINVAL, gpu->dev, "Already requested");
>>>>>>>>> +            goto out_unlock;
>>>>>>>>> +        }
>>>>>>>>> +
>>>>>>>>> +        ctx->counters_requested = true;
>>>>>>>>> +        refcount_inc(&gpu->local_counters_active);
>>>>>>>>> +    } else {
>>>>>>>>> +        if (!ctx->counters_requested) {
>>>>>>>>> +            ret = UERR(EINVAL, gpu->dev, "Not requested");
>>>>>>>>> +            goto out_unlock;
>>>>>>>>> +        }
>>>>>>>>> +        refcount_dec(&gpu->local_counters_active);
>>>>>>>>> +        ctx->counters_requested = false;
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +out_unlock:
>>>>>>>>> +    mutex_unlock(&gpu->lock);
>>>>>>>>> +
>>>>>>>>> +    return ret;
>>>>>>>>>    }
>>>>>>>>>      void __msm_file_private_destroy(struct kref *kref)
>>>>>>>>> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
>>>>>>>>> index 2342cb90857e..ae7fb355e4a1 100644
>>>>>>>>> --- a/include/uapi/drm/msm_drm.h
>>>>>>>>> +++ b/include/uapi/drm/msm_drm.h
>>>>>>>>> @@ -91,6 +91,7 @@ struct drm_msm_timespec {
>>>>>>>>>    #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
>>>>>>>>>    #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
>>>>>>>>>    #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
>>>>>>>>> +#define MSM_PARAM_REQ_CNTRS  0x15 /* WO: request "local" (intra-
>>>>>>>>> submit) perfcntr usage  */
>>>>>>>>>      /* For backwards compat.  The original support for preemption was
>>>>>>>>> based on
>>>>>>>>>     * a single ring per priority level so # of priority levels equals
>>>>>>>>> the #
>>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Best regards,
>>>>>>
>>>>>
>>>>>
>>>>> Best regards,
>>>>
>>

