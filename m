Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C25846E8EA7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 11:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7562310E0EC;
	Thu, 20 Apr 2023 09:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB33810E0EC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 09:54:03 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4edcc885d8fso440029e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 02:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681984440; x=1684576440;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mGGvYz0vqZ33n+fo0Tr5AwZsVe0Xqlv0TtcIG/mEdRM=;
 b=FOLFkVdZ0v44OL6a8anDA51YEWjj1ueQkF6fXUjxy9/2GrffrqyIQV4jqMAU1uWkRr
 IWmpPCKlgCSgBGZMOJk6lL+d19uqtXDYozyUl9ylDc0qsVqkyUc8vgPHwgBhis+sblZr
 6CYCqqz9RHKsO8DpEvpLTEilZK5we08WkBhros9yXgygNmPXxqYgjjCmolN1dxR7GvcJ
 Lh8WHR6ozwt7UrrvN5dPMdMc+JRM7zwSWRJkrbmE1ZQT2D+UvPnfylsDYrlF/kJMe7Da
 AYtlBZ9czPCkn8xBazSzW6BKVro0eq8UvzoZOy5DTGeA2gHGeTsVxt9tua8feP17iUUP
 TBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681984440; x=1684576440;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mGGvYz0vqZ33n+fo0Tr5AwZsVe0Xqlv0TtcIG/mEdRM=;
 b=KVmvOEodibvJS8d4Q5U5pp4be3VPTpL+fVSIXMGrAJCiUYQyzyBFnifh/HNteWqPT0
 2PTgx6bHGMTc8tWyPtFNqC7XVDDWXfiDGgp+LjvMAR9PCMDJNfrlxvLeIfTWlOizmOUi
 k0U3XLIM8N/Preo8IibPOH9cQpi9fnYbGDih0Z1uh3JuT3pxitDPgJCMr5Kn03D6kXOa
 zUa/Mfrs1LufVjoxwe8FnD9ndhnkLhien4nFRY7YE5YysJsErtyOWnPZo6CePAa6TasS
 A3FuSM+9cvETPEb8fgr4tEu8sZ62vzVNS8iRC/JAC/iYnErcgY4Ql+U+k6DacoLYPABU
 Obfg==
X-Gm-Message-State: AAQBX9fNsRivvKgKrcJ1s/Je7AEnYDjlzh9WAkg6MYe5is+pgypyVaxI
 n2bLA5qNh5nzDGRRiS/tGAv2ag==
X-Google-Smtp-Source: AKy350Y7UIxnxGPQnkZd6F1ty5wN9QW7ABmp+6yZagCX0dwlMCfwws+fXNS7jbCUDatA5h7CGh55LA==
X-Received: by 2002:ac2:4a8c:0:b0:4ee:e0c7:435f with SMTP id
 l12-20020ac24a8c000000b004eee0c7435fmr116894lfp.61.1681984440112; 
 Thu, 20 Apr 2023 02:54:00 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v28-20020ac2559c000000b004edc608d86bsm162230lfg.104.2023.04.20.02.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:53:59 -0700 (PDT)
Message-ID: <bcbda796-908a-43d5-0744-c03656fda47b@linaro.org>
Date: Thu, 20 Apr 2023 12:53:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 04/11] drm/msm/dpu: allow using lm mixer base stage
Content-Language: en-GB
To: Arnaud Vrac <avrac@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-4-d1bac46db075@freebox.fr>
 <74c59560-8a79-150f-0c1e-13f22eb35cb2@linaro.org>
 <CAG9NU6_Ua_XLa+c=_93fs5chzQTyPf11W4F87UYbny1k-feoJw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAG9NU6_Ua_XLa+c=_93fs5chzQTyPf11W4F87UYbny1k-feoJw@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/2023 10:26, Arnaud Vrac wrote:
> Le jeu. 20 avr. 2023 à 00:43, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> a écrit :
>>
>> On 19/04/2023 17:41, Arnaud Vrac wrote:
>>> The dpu backend already handles applying alpha to the base stage, so we
>>> can use it to render the bottom plane in all cases. This allows mixing
>>> one additional plane with the hardware mixer.
>>>
>>> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
>>
>> This might require additional changes. First, for the STAGE_BASE pipe
>> in the source split mode (iow using two LMs) should programmed with
>> respect to the right LM's x offset (rather than usual left top-left LM).
>> See  mdss_mdp_pipe_position_update().
> 
> Ok, I did test with 2 LMs and it seems to be working, I'll investigate.

The only reference I have here is the fbdev driver, see [1]. The newer 
SDE driver doesn't handle STAGE_BASE vs STAGE0 (and DPU inherited that 
design). Maybe this got fixed in hw at some point.

[1] 
https://git.codelinaro.org/clo/la/kernel/msm-4.19/-/blob/LE.UM.4.4.1.r2-17500-QRB5165.0/drivers/video/fbdev/msm/mdss_mdp_pipe.c#L1789

I think, it only concerns the src_split + multirect cases, where the 
rectangle base point is on the right LM.

> 
>>
>> Also this might need some interaction with CTL_MIXER_BORDER_OUT being
>> set or not. If I remember correctly, if there bottom plane is not
>> fullscreen or if there are no planes at all, we should set
>> CTL_MIXER_BORDER_OUT (which takes STAGE_BASE) and start assigning them
>> from STAGE0. If not, we can use STAGE_BASE.
> 
> I also tested with both fullscreen and non-fullscreen primary plane,
> and no plane. I'll check this.

Yes, the DPU driver always enables the MIXER_BORDER_OUT.

> 
>>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index 14b5cfe306113..148921ed62f85 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -881,7 +881,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>>>        r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>        r_pipe->sspp = NULL;
>>>
>>> -     pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
>>> +     pstate->stage = DPU_STAGE_BASE + pstate->base.normalized_zpos;
>>>        if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
>>>                DPU_ERROR("> %d plane stages assigned\n",
>>>                          pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
>>>
>>
>> --
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

