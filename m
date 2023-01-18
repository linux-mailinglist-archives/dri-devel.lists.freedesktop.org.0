Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF5D6711EE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 04:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27F310E658;
	Wed, 18 Jan 2023 03:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D36F10E1C4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 03:28:21 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id vw16so16971933ejc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 19:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7YzHL45992jRHnnSjdtVLclelyHPX6XjznsApl7Zow8=;
 b=n/0dleEkC7sBtukFVPtAJers7XF99uSkQBal7mQ0kdExvFJcZTr4N/rKYUifIDFVA0
 hOIOpOyfj6MjrX8B056g1Cxpsjb7JiH7yuVXSlxlSdx9gnTS5NiIwPQMqDdYo8JjdsRL
 xGAoG2B+sDfCUAVf/7qVCIP857ZJbB+GTIjFXXUZFCLc9HB5mZRbxz7oW0NHMJ5nL4SM
 URRomUtzW8XK+PGyPEjAL446wy2IqS6uN0yQuJ0gNV/epoYxWL6s28u5ZzfVNxAxxYUj
 FlvG1Eu6nlHXcggXFZrqlNOqUoib/eqL4agSsZNKniIupHYCaXxy1ib+R/pJDVU8/Mjn
 ljAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7YzHL45992jRHnnSjdtVLclelyHPX6XjznsApl7Zow8=;
 b=2BHy9fiYIz0sQMRi8IYxV9UA/SzHTUJXgsYz81oaUEN/jQyE6hD93FbWubh2nJv1+Y
 peQSuMWEe/7Nx1h+A5mtPllvPiWeiG0sQ2OOPsbp6S5fpTfFeYJY4xk2uxI+jW9M1P8X
 nAk2x4UxTovVIxvRIAl+vDVmTM7C/y6bik7UUk/tXWlibTOvy6tbZRnlsgsE0BrqQm/b
 KvaD+CXUoYYc6Azm4B3PBxx/X5bkkmsrHB+DS87ufj+Rj0WYxKcx/dz0syC1q60TEz7N
 uQHRtniQ+6HhNiflDRVPdhrLr4rtmgQwBiTQnFPWeIyqBCkQLggNM0lIeGthf7wOFl1i
 iMSw==
X-Gm-Message-State: AFqh2kq2a/m14uixbgVjL0dkKsG7oZOBKc2lUJKv/xn/c6yFAe+hQf6h
 uj4YSJ9amxWNqY9gRGI2WD7U6Q==
X-Google-Smtp-Source: AMrXdXvl/d4gPVWEfwAUaTFKECMxB4ZNhkMsXCsn2dfggtow53Q8e+Egg3wyhwNpfpt7LH9tbJvOog==
X-Received: by 2002:a17:907:9548:b0:84d:37d4:7533 with SMTP id
 ex8-20020a170907954800b0084d37d47533mr4680433ejc.0.1674012499614; 
 Tue, 17 Jan 2023 19:28:19 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906311200b0084b89c66eb5sm13890311ejx.4.2023.01.17.19.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 19:28:19 -0800 (PST)
Message-ID: <43dddd52-a789-4ce1-f97e-16467329c746@linaro.org>
Date: Wed, 18 Jan 2023 05:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] drm/msm/disp/dpu1: allow reservation even if dspps
 are not available.
Content-Language: en-GB
To: Kalyan Thota <kalyant@qti.qualcomm.com>,
 "Kalyan Thota (QUIC)" <quic_kalyant@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1673972488-30140-1-git-send-email-quic_kalyant@quicinc.com>
 <1673972488-30140-2-git-send-email-quic_kalyant@quicinc.com>
 <0a845c24-b1a5-a961-103f-0d8840a8f17d@linaro.org>
 <84849b99-93ab-bc10-39ff-ac46328ede47@linaro.org>
 <BN0PR02MB8142227B547A2BEA43B5B86896C79@BN0PR02MB8142.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <BN0PR02MB8142227B547A2BEA43B5B86896C79@BN0PR02MB8142.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "robdclark@chromium.org" <robdclark@chromium.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2023 05:24, Kalyan Thota wrote:
> 
> 
>> -----Original Message-----
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Sent: Tuesday, January 17, 2023 10:10 PM
>> To: Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>; dri-
>> devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
>> freedreno@lists.freedesktop.org; devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org; robdclark@chromium.org;
>> dianders@chromium.org; swboyd@chromium.org; Vinod Polimera (QUIC)
>> <quic_vpolimer@quicinc.com>; Abhinav Kumar (QUIC)
>> <quic_abhinavk@quicinc.com>
>> Subject: Re: [PATCH 1/3] drm/msm/disp/dpu1: allow reservation even if dspps are
>> not available.
>>
>> WARNING: This email originated from outside of Qualcomm. Please be wary of
>> any links or attachments, and do not enable macros.
>>
>> On 17/01/2023 18:35, Dmitry Baryshkov wrote:
>>> On 17/01/2023 18:21, Kalyan Thota wrote:
>>>> if any topology requests for dspps and catalogue doesn't have the
>>>> allocation, avoid failing the reservation.
>>>>
>>>> This can pave way to build logic allowing composer fallbacks for all
>>>> the color features that are handled in dspp.
>>>>
>>>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 8 +++++++-
>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>> index 73b3442..c8899ae 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>> @@ -343,7 +343,13 @@ static bool
>>>> _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>>>>            return true;
>>>>        idx = lm_cfg->dspp - DSPP_0;
>>>> -    if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
>>>> +
>>>> +    if (idx < 0) {
>>>
>>> The change doesn't correspond to commit message.
>>>
>>>> +        DPU_DEBUG("lm doesn't have dspp, ignoring the request %d\n",
>>>> lm_cfg->dspp);
>>>> +        return true;
>>>> +    }
>>>> +
>>>> +    if (idx >= ARRAY_SIZE(rm->dspp_blks)) {
>>>>            DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
>>>>            return false;
>>>>        }
>>>
>>> If you'd like to remove duplicate for the (idx >= ARRAY_SIZE) check,
>>> I'd suggest dropping the second one
>>>
>>
>> I've misread the patch. However I don't see, why would one request DSPP_NONE
>> while specifying topology->num_dspp. I think that you are trying to put additional
>> logic into a function that should just check for the available resources.
>>
> 
> The link is specified in the catalogue.
> For example:
> 
> 	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
> 		&sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),     --> This LM has DSPP attached
> 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SC7180_MASK,
> 		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),  --> no DSPP
> 	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SC7180_MASK,
> 		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0), --> no DSPP
> 
> For the above example, num_dspps will be 1 which is nonzero. But if a request comes on second interface and if there are no dspps then we are not failing the reservation of data path as color features can be offloaded to GPU.
> Idx for LM_2 and LM_3 will be -1 for above case hence the check not to fail reservation.
> 
> topology->num_dspp previously was filled based on encoder type, since we want to move away from encoder checks, we are now passing it same as LM number. If there are dspps available we will allocate,
> in case of non-availability then we are not failing the datapath reservation so that composer fallbacks can be implemented.

As I wrote, num_dspps should be filled correctly (by the 
dpu_get_topology) to request DSPP for CTM-enabled CRTCs and to set the 
field to 0 if CRTC doesn't have CTM enabled.

Then RM code should adhere to the num_dspps passed. It must return an 
error if it can not fulfil the requirements. Also if no DSPPs are 
requested, RM should prefer non-DSPP-enabled LMs.

-- 
With best wishes
Dmitry

