Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B2E4BC1C5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 22:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE1D10E88E;
	Fri, 18 Feb 2022 21:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E9710E4E4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 21:21:23 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id e5so7714863lfr.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 13:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=C8PWVqmEeS2R4u71x+UbBku/kDbzCPMunA9RTJqGotA=;
 b=vP3mIBw4kFS7x3xWGL70abm1jaIEx14umqK/4z89FbH9yAnBhEGrIEbpGhBnH+IgO+
 Iw9AT4MK71d/XVuNpxojLZjsa1jqMgarsn86u3UakpwbMd8EMD2v8rKu8Ol3MMv/Ovgz
 /dDsyR5p3R+kI4OYliZp4hW1ydvTBPJSMqrbXlj6vzxUdaSQivkIXNDaHz7kmEPLBD0R
 BQqQLRLeSX2c9yPYU8cC1v7Mshrj2N5RLmGdI0QwK1Ke3vBShLj7KGlYYz1NFJflBLHN
 86gUCDxGCytRURix3u/ErgtL7KWvdvk0rK0FatgPVlQ/xW6O5CGUuvcBRsLINMgWisRT
 TBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C8PWVqmEeS2R4u71x+UbBku/kDbzCPMunA9RTJqGotA=;
 b=7tOnUjehbZXG/9zmItQ9UT6w5yU82i+SsEJi6jwO8sb4E6B5YIYrqz0mI+uP4sk5nA
 cnzTjrgv1I4TvO6yeGTa/76jftAuUhCn7MlFqT8FbaowqLR7yCJIHsyz4l8ihNJf7GAK
 vtuizVJ1TRf8HH7v17fFBRoWlLfjNCwuuIQVfdduhY7cBCeFv46Md1QhsobyXFQGnI/x
 nRNzAStnsPTd5y9KF8hkm7IsmjNYrxo/+E00LaEzfJmGM+wp/LuCUEuC/G+IqYzaZLNJ
 gzdKS/2fihgIiHoUUHPkyXF01fz37KrgRMA56SAEGdV2oU7xQRe0vkJPJdUjll9wS2J1
 +Ouw==
X-Gm-Message-State: AOAM530ZGHkRV3Rzyw0Hk2QVZNUY3aNmJLVNuCJJo3LV3Oy5cs8lBHBE
 4qzOdHrgsiOjqLID6DHp9TpRqw==
X-Google-Smtp-Source: ABdhPJxVJKzR4mlUZlWpKN4hS8WZlhHDwwvMfb/OqEvGU0lL5OXCxw4Pk862Lm3VUnmdt96VGPRM5g==
X-Received: by 2002:a05:6512:36d0:b0:442:4cb2:df5 with SMTP id
 e16-20020a05651236d000b004424cb20df5mr6498129lfs.648.1645219282144; 
 Fri, 18 Feb 2022 13:21:22 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id 7sm372446lft.194.2022.02.18.13.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 13:21:21 -0800 (PST)
Message-ID: <9f1e2df6-4f28-1d91-7654-ff2d9339dfd9@linaro.org>
Date: Sat, 19 Feb 2022 00:21:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [REPOST PATCH v4 08/13] drm/msm/disp/dpu1: Don't use DSC with
 mode_3d
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-9-vkoul@kernel.org>
 <67006cc4-3385-fe03-bb4d-58623729a8a8@quicinc.com> <Yg3mvEvqYs89dJWI@matsya>
 <4b89f5fe-0752-3c6a-3fb0-192f1f2e7b9e@quicinc.com>
 <acf0a2a2-f2e5-906a-3c51-525abd18ee6f@linaro.org>
 <a38432a8-7920-e26d-7391-a49bebbc57f9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a38432a8-7920-e26d-7391-a49bebbc57f9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/02/2022 23:46, Abhinav Kumar wrote:
> 
> 
> On 2/16/2022 11:12 PM, Dmitry Baryshkov wrote:
>> On 17/02/2022 09:33, Abhinav Kumar wrote:
>>>
>>>
>>> On 2/16/2022 10:10 PM, Vinod Koul wrote:
>>>> On 16-02-22, 19:11, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 2/10/2022 2:34 AM, Vinod Koul wrote:
>>>>>> We cannot enable mode_3d when we are using the DSC. So pass
>>>>>> configuration to detect DSC is enabled and not enable mode_3d
>>>>>> when we are using DSC
>>>>>>
>>>>>> We add a helper dpu_encoder_helper_get_dsc() to detect dsc
>>>>>> enabled and pass this to .setup_intf_cfg()
>>>>>>
>>>>>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>>>>>
>>>>> We should not use 3D mux only when we use DSC merge topology.
>>>>> I agree that today we use only 2-2-1 topology for DSC which means 
>>>>> its using
>>>>> DSC merge.
>>>>>
>>>>> But generalizing that 3D mux should not be used for DSC is not right.
>>>>>
>>>>> You can detect DSC merge by checking if there are two encoders and one
>>>>> interface in the topology and if so, you can disable 3D mux.
>>>>
>>>> Right now with DSC we disable that as suggested by Dmitry last time.
>>>> Whenever we introduce merge we should revisit this, for now this should
>>>> suffice
>>>>
>>>
>>> Sorry I didnt follow.
>>>
>>> The topology which you are supporting today IS DSC merge 2-2-1. I 
>>> didnt get what you mean by "whenever we introduce".
>>>
>>> I didnt follow Dmitry's comment either.
>>>
>>> "anybody adding support for SDE_RM_TOPOLOGY_DUALPIPE_3DMERGE_DSC 
>>> handle this."
>>>
>>> 3D mux shouldnt be used when DSC merge is used.
>>>
>>> The topology Dmitry is referring to will not use DSC merge but you 
>>> are using it here and thats why you had to make this patch in the 
>>> first place. So I am not sure why would someone who uses 3D merge 
>>> topology worry about DSC merge. Your patch is the one which deals 
>>> with the topology in question.
>>>
>>> What I am suggesting is a small but necessary improvement to this patch.
>>
>> It seems that we can replace this patch by changing 
>> dpu_encoder_helper_get_3d_blend_mode() to contain the following 
>> condition (instead of the one present there). Does the following seem 
>> correct to you:
>>
>> static inline enum dpu_3d_blend_mode 
>> dpu_encoder_helper_get_3d_blend_mode(
>>                  struct dpu_encoder_phys *phys_enc)
>> {
>>          struct dpu_crtc_state *dpu_cstate;
>>
>>          if (!phys_enc || phys_enc->enable_state == DPU_ENC_DISABLING)
>>                  return BLEND_3D_NONE;
>>
>>          dpu_cstate = to_dpu_crtc_state(phys_enc->parent->crtc->state);
>>
>> +    /* Use merge_3d unless DSCMERGE topology is used */
>>          if (phys_enc->split_role == ENC_ROLE_SOLO &&
>> +           hweight(dpu_encoder_helper_get_dsc(phys_enc)) != 1 &&

Yes, the correct should be:
hweight(...) == 2

>>              dpu_cstate->num_mixers == CRTC_DUAL_MIXERS)
>>                  return BLEND_3D_H_ROW_INT;
>>
>>          return BLEND_3D_NONE;
>> }
> 
> This will not be enough. To detect whether DSC merge is enabled you need 
> to query the topology. The above condition only checks if DSC is enabled 
> not DSC merge.
> 
> So the above function can be modified to use a helper like below instead 
> of the hweight.
> 
> bool dpu_encoder_get_dsc_merge_info(struct dpu_encoder_virt *dpu_enc)
> {
>      struct msm_display_topology topology = {0};
> 
>      topology = dpu_encoder_get_topology(...);
> 
>      if (topology.num_dsc > topology.num_intf)

num_intf is 1 or 2. If it's one, the split_role is SOLO
hweight would return a num of bits in the DSC mask. It's 0, 1 or 2.
So, if the split_role is SOLO and hweight is 2, we get exactly your 
condition.

Does that sound correct?

>          return true;
>      else
>          return false;
> }
> 
> if (!dpu_encoder_get_dsc_merge_info() && other conditions listed above)
>      return BLEND_3D_H_ROW_INT;
> else
>      BLEND_3D_NONE;
>>
>>
>>>
>>> All that you have to do is in query whether DSC merge is used from 
>>> the topology. You can do it in multiple ways:
>>>
>>> 1) Either query this from the encoder
>>> 2) Store a bool "dsc_merge" in the intf_cfg
>>>
>>
>>


-- 
With best wishes
Dmitry
