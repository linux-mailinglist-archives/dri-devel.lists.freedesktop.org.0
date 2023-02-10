Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5036916CC
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 03:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA2C10EC3E;
	Fri, 10 Feb 2023 02:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E47E10EC3D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 02:46:12 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id sa10so12285727ejc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 18:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UV2BCAxuhKmPnFF6bX9iUFaZwPA1IRXzHYxhL0H769U=;
 b=UC8ETTH7Ah8O3zOtdGD6X0ZsZd05mX0gnTx9Nweq56nG/oP4e2K1r8Ir+RDQ6gefql
 b+hdhkGZragIOO84dt6/2JhEC4xqBz8Ci3Xpdp51PCOay0n8gJum4OElrlQyDKkWh8jb
 rlENs+DsGTBUDNM/kwpQhM3RE+UuuMMJZxDOpKW4htryGP4ne/GZR2jHsLHDT8UDs56d
 jalW2baWyxxE5tc1y2IUzqFln5F4VH29Rj4Or0dlqGrOkf6EfXy5QBHoEoTm/28DEf1T
 EIYz+oloAkU9EvKYEBRNlkUgBLC3dQdDtsfx921JS9S9nWWHCL/f5bRuDyYc+9tdHhU8
 cP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UV2BCAxuhKmPnFF6bX9iUFaZwPA1IRXzHYxhL0H769U=;
 b=cZeGLxNOIysLDFRsYdarvbM2sacLIKX/rQhpoMNws8eIxueOdngOLPl0/esFNuSkwR
 33+lCk6i+6YVlg6tqI64LPnwpZgB3GGBtImrEW768pFIRrGCtoW8nWugk4pV8NCbNnBu
 YcfWVNKBrbPBxfu2++8btDwsTHkJHlScnvWfSYshShVE/p63h5Mqs96uDRR8hsrU+4Q4
 ZodiEVFqdAjaA/ONcwGQGEz9oHOhgSt1iDfAMFd7uHliZ80YO8qZgrn9DToD4OrnqIH4
 mBvp7xXGM58DKFdNgbDUepFdJnIVuGruocLN3M46z+u7HJdsNplysVLLadihjW9ZwJBl
 Gdyw==
X-Gm-Message-State: AO0yUKWMSgWQt5XE8oAbjZRIzRM2e5ZOlzhW+B1j3t7xbodZhfpvdrHp
 mjKBw+muP039LnUbefWotq/Unw==
X-Google-Smtp-Source: AK7set9itydlZmTt0EN+MtswJ3cc5eBIzSxgpgCQd3y1tx2toIoiY5Mpg1YYOAek+OSL24dXDuJmvA==
X-Received: by 2002:a17:906:a5b:b0:887:aac3:9340 with SMTP id
 x27-20020a1709060a5b00b00887aac39340mr8717358ejf.29.1675997170886; 
 Thu, 09 Feb 2023 18:46:10 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 le3-20020a170907170300b0087be1055f83sm1696667ejc.206.2023.02.09.18.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 18:46:10 -0800 (PST)
Message-ID: <e8319ee2-7b32-4f51-e965-69e6884bd881@linaro.org>
Date: Fri, 10 Feb 2023 04:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Freedreno] [PATCH v3 27/27] drm/msm/dpu: add support for wide
 planes
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-28-dmitry.baryshkov@linaro.org>
 <fd654e2e-4cc0-29bf-374d-beed0bada0bc@quicinc.com>
 <CAA8EJpocfk2bY0fGaGrzcho-NmHyam3NR-=W3L0E9M7nrY_wVw@mail.gmail.com>
 <ef0482a4-6c07-873c-62d8-e16e0220b75f@quicinc.com>
 <CAA8EJppHhd5WSqOsz5tfW0zwyqevZgYANHhg8Yqwvr4X3jZ65A@mail.gmail.com>
 <396c388b-de81-6794-d846-636234f1edb0@quicinc.com>
 <CAA8EJppuM97q2uc04_id7fEY26WHbnb=Mc0eAU1sDMTNwguAYg@mail.gmail.com>
 <21a0fa07-4079-5f68-2dba-9a1cd1c9f6d9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <21a0fa07-4079-5f68-2dba-9a1cd1c9f6d9@quicinc.com>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/02/2023 03:12, Abhinav Kumar wrote:
> Hi Dmitry
> 
> On 2/9/2023 4:09 PM, Dmitry Baryshkov wrote:
>>   .
>>
>> On Fri, 10 Feb 2023 at 00:12, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>>
>>> Hi Dmitry
>>>
>>> On 2/9/2023 1:23 PM, Dmitry Baryshkov wrote:
>>>> Hi Abhinav,
>>>>
>>>> On Thu, 9 Feb 2023 at 21:25, Abhinav Kumar 
>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 2/9/2023 3:45 AM, Dmitry Baryshkov wrote:
>>>>>> On Thu, 9 Feb 2023 at 04:19, Abhinav Kumar 
>>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>>>>>>>> Typically SSPP can support rectangle with width up to 2560. 
>>>>>>>> However it's
>>>>>>>
>>>>>>> Not always 2560. Depends on the chipset.
>>>>>>
>>>>>> _typically_
>>>>>>
>>>>>
>>>>> Would just say maxlinewidth of SSPP instead of giving some 
>>>>> hardcoded number.
>>>>
>>>> Ack.
>>>>
>>>>>
>>>>>>>
>>>>>>>> possible to use multirect feature and split source to use the 
>>>>>>>> SSPP to
>>>>>>>> output two consecutive rectangles. This commit brings in this 
>>>>>>>> capability
>>>>>>>> to support wider screen resolutions.
>>>>>>>>
>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   6 ++
>>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 116 
>>>>>>>> +++++++++++++++++++---
>>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   4 +
>>>>>>>>      3 files changed, 114 insertions(+), 12 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>>>>> index 0ca3bc38ff7e..867832a752b2 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>>>>> @@ -485,6 +485,12 @@ static void 
>>>>>>>> _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>>>>>>>>                                             fetch_active,
>>>>>>>>                                             &pstate->pipe);
>>>>>>>>
>>>>>>>> +             _dpu_crtc_blend_setup_pipe(crtc, plane,
>>>>>>>> +                                        mixer, cstate->num_mixers,
>>>>>>>> +                                        stage_cfg, 
>>>>>>>> pstate->stage, 1,
>>>>>>>> +                                        fetch_active,
>>>>>>>> +                                        &pstate->r_pipe);
>>>>>>>> +
>>>>>>>>                  /* blend config update */
>>>>>>>>                  for (lm_idx = 0; lm_idx < cstate->num_mixers; 
>>>>>>>> lm_idx++) {
>>>>>>>>                          _dpu_crtc_setup_blend_cfg(mixer + 
>>>>>>>> lm_idx, pstate, format);
>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>>>>> index e2e85688ed3c..401ead64c6bd 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>>>>> @@ -365,6 +365,9 @@ static void _dpu_plane_set_qos_ctrl(struct 
>>>>>>>> drm_plane *plane,
>>>>>>>>          struct dpu_plane *pdpu = to_dpu_plane(plane);
>>>>>>>>          struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
>>>>>>>>
>>>>>>>> +     if (!pipe->sspp)
>>>>>>>> +             return;
>>>>>>>> +
>>>>>>>>          memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
>>>>>>>>
>>>>>>>>          if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
>>>>>>>> @@ -647,6 +650,9 @@ static int _dpu_plane_color_fill_pipe(struct 
>>>>>>>> dpu_plane_state *pstate,
>>>>>>>>      {
>>>>>>>>          struct dpu_hw_sspp_cfg pipe_cfg;
>>>>>>>>
>>>>>>>> +     if (!pipe->sspp)
>>>>>>>> +             return 0;
>>>>>>>
>>>>>>> instead of checking if sspp was present, is it not better for the 
>>>>>>> caller
>>>>>>> to check if the rpipe is valid before calling this?
>>>>>>>
>>>>>>>> +
>>>>>>>>          /* update sspp */
>>>>>>>>          if (!pipe->sspp->ops.setup_solidfill)
>>>>>>>>                  return 0;
>>>>>>>> @@ -701,6 +707,8 @@ static void _dpu_plane_color_fill(struct 
>>>>>>>> dpu_plane *pdpu,
>>>>>>>>
>>>>>>>>          /* update sspp */
>>>>>>>>          _dpu_plane_color_fill_pipe(pstate, &pstate->pipe, 
>>>>>>>> &pstate->pipe_cfg, fill_color, fmt);
>>>>>>>> +
>>>>>>>> +     _dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, 
>>>>>>>> &pstate->r_pipe_cfg, fill_color, fmt);
>>>>>>>>      }
>>>>>>>
>>>>>>> So cant we do
>>>>>>>
>>>>>>> if (pstate->r_pipe.sspp)
>>>>>>>            _dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe,
>>>>>>>                    &pstate->r_pipe_cfg, fill_color, fmt);
>>>>>>>
>>>>>>> It just seems better to me as the caller would already know if 
>>>>>>> the sspp
>>>>>>> was assigned.
>>>>>>
>>>>>>     I think I had this kind of code earlier, but then I found it more
>>>>>> logical to move the check to the called function. I'll move it back.
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>>      int dpu_plane_validate_multirect_v2(struct 
>>>>>>>> dpu_multirect_plane_states *plane)
>>>>>>>> @@ -911,6 +919,9 @@ static int 
>>>>>>>> dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>>>>>>>>      {
>>>>>>>>          uint32_t min_src_size;
>>>>>>>>
>>>>>>>> +     if (!pipe->sspp)
>>>>>>>> +             return 0;
>>>>>>>> +
>>>>>>>>          min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>>>>>>>>
>>>>>>>>          if (DPU_FORMAT_IS_YUV(fmt) &&
>>>>>>>> @@ -957,9 +968,12 @@ static int dpu_plane_atomic_check(struct 
>>>>>>>> drm_plane *plane,
>>>>>>>>          int ret = 0, min_scale;
>>>>>>>>          struct dpu_plane *pdpu = to_dpu_plane(plane);
>>>>>>>>          struct dpu_plane_state *pstate = 
>>>>>>>> to_dpu_plane_state(new_plane_state);
>>>>>>>> +     struct dpu_sw_pipe *pipe = &pstate->pipe;
>>>>>>>> +     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>>>>>>>>          const struct drm_crtc_state *crtc_state = NULL;
>>>>>>>>          const struct dpu_format *fmt;
>>>>>>>>          struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
>>>>>>>> +     struct dpu_hw_sspp_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
>>>>>>>>          struct drm_rect fb_rect = { 0 };
>>>>>>>>          uint32_t max_linewidth;
>>>>>>>>          unsigned int rotation;
>>>>>>>> @@ -983,8 +997,11 @@ static int dpu_plane_atomic_check(struct 
>>>>>>>> drm_plane *plane,
>>>>>>>>          if (!new_plane_state->visible)
>>>>>>>>                  return 0;
>>>>>>>>
>>>>>>>> -     pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
>>>>>>>> -     pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>>>>>> +     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>>>>>>> +     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>>>>>> +     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>>>>>>> +     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>>>>>> +     r_pipe->sspp = NULL;
>>>>>>>>
>>>>>>>>          pstate->stage = DPU_STAGE_0 + 
>>>>>>>> pstate->base.normalized_zpos;
>>>>>>>>          if (pstate->stage >= 
>>>>>>>> pdpu->catalog->caps->max_mixer_blendstages) {
>>>>>>>> @@ -1016,16 +1033,53 @@ static int dpu_plane_atomic_check(struct 
>>>>>>>> drm_plane *plane,
>>>>>>>>
>>>>>>>>          max_linewidth = pdpu->catalog->caps->max_linewidth;
>>>>>>>>
>>>>>>>> -     /* check decimated source width */
>>>>>>>>          if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>>>>>>>> -             DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT 
>>>>>>>> " line:%u\n",
>>>>>>>> -                             DRM_RECT_ARG(&pipe_cfg->src_rect), 
>>>>>>>> max_linewidth);
>>>>>>>> -             return -E2BIG;
>>>>>>>> +             /* struct dpu_crtc_state *cstate = 
>>>>>>>> to_dpu_crtc_state(crtc_state); */
>>>>>>>> +
>>>>>>>> +             if (drm_rect_width(&pipe_cfg->src_rect) > 2 * 
>>>>>>>> max_linewidth) {
>>>>>>>> +                     DPU_DEBUG_PLANE(pdpu, "invalid src " 
>>>>>>>> DRM_RECT_FMT " line:%u\n",
>>>>>>>> +                                     
>>>>>>>> DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
>>>>>>>> +                     return -E2BIG;
>>>>>>>> +             }
>>>>>>>
>>>>>>> This is where I am a bit concerned enabling it for all chipsets 
>>>>>>> in one go.
>>>>>>
>>>>>> As I wrote earlier, I'd prefer the opt-out rather than opt-in 
>>>>>> here. It
>>>>>> is much easier to handle the reports "I have a device with sm6543,
>>>>>> where the display worked before 6.4, but started failing afterwards"
>>>>>> rather than trying to find a person with sm6543 and asking him if he
>>>>>> can enable this and that on his device. And even a lower chance of a
>>>>>> person with sm6543 coming up with a patch 'hey, I enabled this for my
>>>>>> phone and it works!'.
>>>>>>
>>>>>> If we find any issues during or close to the end of the development
>>>>>> cycle, we can add a 'don't enable wide plane here' switch and enable
>>>>>> it for failing platforms. But each enablement of this switch should
>>>>>> come with a reason (wide planes not working here because ....). In 
>>>>>> the
>>>>>> end this switch should be gone and transformed into proper HW
>>>>>> limitation checks.
>>>>>>
>>>>>
>>>>> As it has become clear that with this patch series 4K with UBWC cannot
>>>>> be supported without true virtual planes (with two SSPPs), why do you
>>>>> need to relax this check right now?
>>>>
>>>> Yes. It enables support for 4k @ linear formats. So my plan for this
>>>> series is to land 4k with all the proper applicable restrictions.
>>>>
>>>>> You can relax this when you add the support for virtual planes till 
>>>>> then
>>>>> let it be this way.
>>>>>
>>>>> Its not going to break smartDMA as such. You can still use it for 
>>>>> layers
>>>>> < 2560.
>>>>>
>>>>> That way we stay true to the purpose of the feature. I think 
>>>>> originally
>>>>> you wanted to get this in for smartDMA and not to support wide 
>>>>> plane and
>>>>> that purpose will still be achieved even with keeping this check 
>>>>> intact.
>>>>
>>>> Actually, no. With this series I wanted to get 4k. It was developed in
>>>> parallel with the 4k enablement for RB3 (posted, bridge patches are
>>>> being merged for 6.3) and RB5 (delayed for now, I have other issues
>>>> there).
>>>>
>>>
>>> With the UBWC related checks, this wont support 4K for UBWC layers which
>>> is default on QC chipsets. So I am fine with respect to that. But still
>>> this does not address the product spec advertized modes. Like I
>>> mentioned before, relaxing the maxlinewidth check with the added UBWC
>>> checks is fine from DPU point of view but not from the product POV.
>>>
>>> As things stand today, this is the only check failing the 4K modes on
>>> chipsets which shouldnt support 4k (linear or UBWC doesnt matter).
>>>
>>>>> You can relax it in the virtual plane series.
>>>>>
>>>>> Regarding issues, this is where it gets tricky. We should be aligning
>>>>> with what the product supports. QC will not support issues arising 
>>>>> with
>>>>> 4K on chipsets on which 4K is not advertized.
>>>>
>>>> So, we have several different items here:
>>>> - SmartDMA v2 per se, supporting two rectangles per VIG or DMA plane,
>>>> - Source split support,
>>>> - Supporting 4k modes.
>>>>
>>>> I think we should tend them one by one. This series concerns SmartDMA
>>>> v2. Using SmartDMA it is possible to use two rectangles side by side
>>>> to emulate a wide plane. This series doesn't care at all about max
>>>> resolutions. These two items are completely orthogonal.
>>>>
>>>
>>> No its not orthogonal. Relaxing the maxlinewidth check in the
>>> atomic_check() will allow 4K layers now even on chipsets where 4K wasnt
>>> advertized. Linear or UBWC doesnt matter as the spec doesnt go into 
>>> that.
>>
>> Please correct my answers, if I got something wrong here:
>>
>> Does sc7180 support SmartDMA? Yes it does.
>> Can QC or CrOS validate SmartDMA separately on sc7180? I hope you can.
>> Should the hw-supported feature be enabled? Yes, it should.
>>
>> Now limiting out 4k by not supporting SmartDMA looks like a misfeature.
>> I can only suggest sending a change to block 4k on sc7180.
>>
> 
> Agreed. We should first block 4K on sc7180 and other devices which dont 
> advertize 4k. No, it was never a question of limiting out 4K by not 
> supporting smartDMA but the other way around. By supporting smartDMA, we 
> would have had to support 4K on some chipsets due to this change which I 
> didnt want to do.
> 
> And yes agreed that we can stop discussing 4K anymore on this patch but 
> not smartDMA itself. Please see below.
> 
>>>>>>> As you are aware,  we have an open bug today that we do not 
>>>>>>> filter out
>>>>>>> the modes which we do not support.
>>>>>>>
>>>>>>> https://gitlab.freedesktop.org/drm/msm/-/issues/21
>>>>>>
>>>>>> I thought that with the link-frequencies in place and with the DSI
>>>>>> checking the OPP tables this issue is mostly handled. Isn't it?
>>>>>> Is a mode check in the DPU driver itself the last missing piece?
>>>>>>
>>>>>
>>>>> opp based checking was implemented only for DSI. That one is byte 
>>>>> clk based.
>>>>>
>>>>> DP uses link rate for opp table.
>>>>>
>>>>> Even with a 5.4G link rate (the one in sc7180 chromebook) 4k@30 would
>>>>> still be possible but it was not advertized
>>>>>
>>>>> https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/prod_brief_qcom_sd7c.pdf
>>>>>
>>>>> These docs are available in public domain.
>>>>>
>>>>> As we synced up last time on
>>>>> https://patchwork.freedesktop.org/series/107917/, even with these 
>>>>> limits
>>>>> in place, its not matching the advertized limits.
>>>>>
>>>>>>>
>>>>>>> Due to this, on all chipsets we will end up trying to do a 4K on
>>>>>>> external display which we dont know what bugs it will expose.
>>>>>>
>>>>>> If we do not expose bugs, we do not have a way to fix them. And I
>>>>>> definitely think that all the bugs should be listed as early as
>>>>>> possible, while both of us still remember the code under the 
>>>>>> question.
>>>>>>
>>>>>
>>>>> Yes but on chipsets where 4K is supported ( and hence needed ).
>>>>
>>>> 4k, SmartDMA, src-split, split-display, etc.
>>>>
>>>
>>> The visual issues reported on sdm845 on the other thread are a classic
>>> example of what I just wrote on that patchset and thats why I was
>>> emphasizing a visual validation OR in other words enable the feature on
>>> which you are able to visually validate it.
>>
>> Yes. And if we did not enable the feature, Amit would not be able to
>> spot that. I can repeat my suggestion:
>>
>> - prevalidate these features for the accessible platforms (e.g. I only
>> have sdm845, sm8250 and sm8350 at hand)
> 
> How? Your validation is not with a compositor in most cases and just 
> with modetest.

Yes, I mostly validated it using the modetest up to now. It was enough 
to spot most of the issues during development.

My plan is to validate it with wayland on C630 (sdm850, DP), X11 on RB3 
(sdm845, DSI) and, once I get back to the office, X11 on RB5 (sm8250, 
DSI). I did not have particular plans for sm8350, but it might also be 
worth giving it a try.

>> - enable SmartDMA for all chipsets where SmartDMA is supported
>> - collect possible tested-by and broken-at reports, while the patches
>> sit in linux-next
> 
> Question:
> 
> 1) Who will test these on all the devices for us? This is what I had 
> written even before that someone should give Tested-by tags then.
> 
> Even if you have them on linux-next, someone has to test them voluntarily.

My plan is to depend on the contributors of the corresponding platforms. 
In other words, Bjorn (for sc8180x/sc8280xp), Neal (sm8450/sm8550) and 
hopefully Marijn or Adam (for sm6115 and maybe other platforms)

> 2) Who will look at these broken-at reports and debug them?

The author of the patchset, me. With the hope that you can help in 
obscure cases.

> 
>> - disable SmartDMA basing on the feedback from the previous step (e.g.
>> select from 'mostly disable', 'disable for the bugged cases', 'do not
>> disable at all', etc).
>>    I can promise that if we see a significant validation failure rate I
>> will not oppose disabling SmartDMA.
>>
> 
> Thanks for agreeing on this :)
> 
>> As a reminder: if the patchset is ready at the time of 6.3-rc1 (in
>> three weeks from now), it is going to be merged into linux-next first,
>> after that it can go into the main Linus'es tree at 6.4-rc1. So we
>> will have _two_ kernel cycles to collect bug reports and to disable
>> (or fix) broken cases.
>>
> 
>>> We can evaluate and enable smartDMA on other chipsets on a need basis.
>>>
>>> We discussed this again even today in the team discussion. Our team's
>>> PoV doesnt change. We would still like to enable smartDMA only on
>>> chipsets which can be visually validated first to limit the debugging
>>> effort to one chipset first and then perfect it. Otherwise its too much
>>> effort on QC side to debug those issues on all chipsets.
>>
>> I think QC mostly debugs issues on sc7180/sc7280 and sometimes on
>> sdm845/sm8250 (and now on sm8350). I think we can let people
>> (somainline, PmOS) test features on other platforms.
>> And testing happens better if we can say 'please test linux-next'
>> rather than 'please test linux-next + this patch to enable the feature
>> + that patch to enable the second patch of the feature'.
>>
> 
> In this particular case, in the current timeframe QC can only commit to 
> validate sc7280 at this point and not sc7180, sdm845, sm8250 and sm8350 
> for this feature.

This is both good and bad. Not being able to test sc7180 sounds 
particularly bad. I still didn't have time to work on my sc7180 laptop. 
It still has WoA.

> 
> So it will be upto you and others for all other targets.
> 
> Yes, I agree, people prefer to test on a branch rather than branch + 
> patches.

Good.

> 
>>>>>>> So lets say if we test it on sc7280 fully but not on sc7180, we will
>>>>>>> still hit this condition on sc7180 too but on that chipset we did 
>>>>>>> not
>>>>>>> advertise 4K as a capability in the product spec.
>>>>>>
>>>>>> Is it 'not advertised' or 'not supported by hw'?
>>>>>>
>>>>>
>>>>> The document
>>>>> https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/prod_brief_qcom_sd7c.pdf
>>>>> is made from inputs from not just display team but overall system
>>>>> limits. So even though you could argue that this falls within the
>>>>> display capabilities, all I can say at the moment is we have to 
>>>>> stick to
>>>>> the advertized limits as its compiled with inputs from all the teams
>>>>> (system/performance etc).
>>>>
>>>> So, there should be a limiting factor (or a combination of them).
>>>> Filter out 4k modes on sc7180. Or modes using fill rate higher than N.
>>>> Pixel clock rate higher than M. But it has nothing to do with these
>>>> patches enabling SmartDMA support on this platform.
>>>>
>>>> Even if we look at the vendor kernels, we don't see 'maximum external
>>>> resolution'. Instead I see a combination of linewidth and bandwidth
>>>> limitations. If we can stick to that, that would be great.
>>>>
>>>
>>> Can you please point me to bandwidth limitation checks? How are other
>>> vendors coming up with this number? It has to be based on some
>>> resolution too right?
>>
>> Usually it is considered in the other direction. The SoC can support
>> this-and-that pixel clock and bandwidth, so put the NxM resolution to
>> the datasheet as the max supported one.
>>
> Our data sheet also gave the resolution so I chose the pixel clk last time.
> 
>> Can you point out how the vendor kernel limits DP modes? I checked out
>> several dtsi files. For sm8250 the DP is limited to 1920x1080 (while
>> PB explicitly mentions 4k@60).
> 
> Where do you see 1920x1080? In kona-sde.dtsi I see 675000

I have been looking at the DTSI files for the RB5 board. See post-CS8 
and post-CS9 releases.

> 
>> sm7125 is limited to 2560x1600. sm6150 again 1920x1080. From the pile
>> of the DTS that I have here the rest lists only
>> qcom,max-pclk-frequency-khz
> 
> Yes, qcom,max-pclk-frequency-khz is the method they use.
> 
>>
>>> My RFC https://patchwork.freedesktop.org/series/107917/ considered pixel
>>> clk as the limiting factor which was posted after discussions
>>> internally. In the absence of another way, that remains the only
>>> solution to tackle this.
>>
>> If I remember correctly the mentioned patchset used manually crafted
>> pixel clocks. And for example for sm8250 this clock doesn't correspond
>> to verifiable source.
>> Your patchset used 594000 KHz as max ext pclk for sm8250. vendor dtsi
>> lists 187500 KHz as maximum DP pclk for RB5 and 150000 KHz in all
> 
> Lets discuss this more when I re-post the patch to limit 4K modes.
> 
>> other cases. And, at the same time, it lists a 3840x2160@60 mode for
>> the DSI/lt9611uxc with the pixel clock as high as 608040 KHz.
>>
>> I suggest we stop the discussion at this point, unless there is
>> anything else wrong with this patchset itself.
>>
> 
> Agreed but please look at my comments about smartDMA validation above 
> and let me know.
> 
>> I noted the point regarding UBWC & parallel mode. I will handle it in
>> the next iteration.
>>
>> I noted your valid point about the visual verification. I proposed a
>> way to ease validation, allowing it to be enabled for testers and
>> early adopters for nearly two cycles. I hope you'd agree to this plan.
>> I on the other side agree to revert to opt-in if the failure rate is
>> high.
>>
> 
> Agreed but with above concerns.

Thanks!

> 
>> Please stop bringing max resolution issues to this patchserie. It must
> 
> It got dragged into this patch because this patch relaxed the checks for 
> max resolution.
> 
>> be handled separately. I hope to see the mode filter patch targeting
>> sc7180 & sc7280. With the DSI opp check in place I think we should
>> concentrate on the DP case. If nothing else, I think even adding the
>> max PCLK to the msm_dp_desc should be sufficient to your worries. I'd
>> prefer to be able to override it for the particular board, but I think
>> this can come later, as it would require an agreement from the DT
>> schema team.
>>
> 
> Alright, I can rebase that RFC to cover the DP cases for now and we can 
> discuss all the max resolution discussions there.

Thanks!

> 
>> -- 
>> With best wishes
>> Dmitry

-- 
With best wishes
Dmitry

