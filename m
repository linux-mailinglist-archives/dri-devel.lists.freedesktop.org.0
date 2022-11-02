Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1364E616A56
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 18:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D88C10E524;
	Wed,  2 Nov 2022 17:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452BD10E524
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 17:15:10 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id k19so25580771lji.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 10:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y2G9zAjcBQvptALVWhMCLTUKJpJ/ntkvAuBFzHIVao0=;
 b=g8o78olqBCoQGPXOE8LAf1/SCjNxsUN6+HYFP69w+yKIO9hmeNBP7VLKjT9gpEckP1
 QskGY4iIISNWtuuJ/lNwRFnhM93LvohbgyRZ5DtlJsFvaSkRgkUvqMoz/cARK5HC06Wu
 Qu0tMtEl1EW3k8bNbW558NeZMGnOJnx4QSMt1CrK3tQ2LQypiq5SbndKfer4yvI/RnNw
 Im1zqCzW1KbNwk7gsiNZoe/EFFQXoFVEZaZolmjFPPDX632UPYzIibz0NojKSR0tdSNt
 aT5poRS0WfC57Ufdqtr2K/VgWu5lsHyxZRjTj0egVSXR7IjR22VBTRRGH9PLkFkaTWzs
 CJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y2G9zAjcBQvptALVWhMCLTUKJpJ/ntkvAuBFzHIVao0=;
 b=kpPVzkMPdFNwNBtNqpohz5wgjA66uLKGNP+JaVAd33lA3+xNd+I88QDy+mRQucGbmf
 pSNat2OssX5ZjlGuNN070AI/SmaDKlyRuxADxdIwXOO2vwGdWfbbZFUzbwiBMGjKtQFc
 A0YqTjwQgR6dBb1NuHnqiKbTDE0UNuNuZwSaTpTQckKzHyKdkZYDib/MwZFV5JdRQNw4
 nnL2mGv2KCLxwCFdzGpoloXKSjDGlLc4Te4aZtFYXuAw7eqIEpWjzUMujQ840yAhgnPK
 CyVFWfyCvWFPEClOU5PR6b8aajE4/1Rnl1SL5xx2SDilyDc0BXozLnWwuUhRHIHo8Jso
 Jw6Q==
X-Gm-Message-State: ACrzQf1ryhiJjvyquWNbhR4MnM2RjhQgWQ47MQ/BUEVLN1NJoiPFpfEX
 X6CFCqbobDd06qOmgitqiN0Waw==
X-Google-Smtp-Source: AMsMyM6BVYOYmT8ompZoc+LlEr1AorwmGjZcVmWGutVwZqsdA1Tsvx9GKgqcDW220eOVU7tZn9PAUg==
X-Received: by 2002:a05:651c:c90:b0:277:45f6:1b2c with SMTP id
 bz16-20020a05651c0c9000b0027745f61b2cmr7949204ljb.15.1667409308240; 
 Wed, 02 Nov 2022 10:15:08 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a2e9f07000000b00276d2537921sm2250544ljk.59.2022.11.02.10.15.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 10:15:07 -0700 (PDT)
Message-ID: <da9720c2-ddc7-1a00-2608-0ef64c072cdd@linaro.org>
Date: Wed, 2 Nov 2022 20:15:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] drm/msm/dp: remove limitation of link rate at 5.4G to
 support HBR3
Content-Language: en-GB
To: Doug Anderson <dianders@chromium.org>
References: <1667237245-24988-1-git-send-email-quic_khsieh@quicinc.com>
 <94b507e8-5b94-12ae-4c81-95f5d36279d5@linaro.org>
 <deb60200-5a37-ec77-9515-0c0c89022174@quicinc.com>
 <CAD=FV=X_fs_4JYcRvAwkU9mAafOten9WdyzPfSVWdAU=ZMo8zg@mail.gmail.com>
 <155e4171-187c-4ecf-5a9b-12f0c2207524@linaro.org>
 <CAD=FV=Wk5rBSq9Mx1GCO0QFYckKV9KUFKL36Ld7dQX1ypHVcYw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAD=FV=Wk5rBSq9Mx1GCO0QFYckKV9KUFKL36Ld7dQX1ypHVcYw@mail.gmail.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/11/2022 17:37, Doug Anderson wrote:
> Hi,
> 
> On Mon, Oct 31, 2022 at 5:15 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 01/11/2022 03:08, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Mon, Oct 31, 2022 at 2:11 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>>
>>>> Hi Dmitry,
>>>>
>>>>
>>>> Link rate is advertised by sink, but adjusted (reduced the link rate)
>>>> by host during link training.
>>>>
>>>> Therefore should be fine if host did not support HBR3 rate.
>>>>
>>>> It will reduce to lower link rate during link training procedures.
>>>>
>>>> kuogee
>>>>
>>>> On 10/31/2022 11:46 AM, Dmitry Baryshkov wrote:
>>>>> On 31/10/2022 20:27, Kuogee Hsieh wrote:
>>>>>> An HBR3-capable device shall also support TPS4. Since TPS4 feature
>>>>>> had been implemented already, it is not necessary to limit link
>>>>>> rate at HBR2 (5.4G). This patch remove this limitation to support
>>>>>> HBR3 (8.1G) link rate.
>>>>>
>>>>> The DP driver supports several platforms including sdm845 and can
>>>>> support, if I'm not mistaken, platforms up to msm8998/sdm630/660.
>>>>> Could you please confirm that all these SoCs have support for HBR3?
>>>>>
>>>>> With that fact being confirmed:
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/dp/dp_panel.c | 4 ----
>>>>>>     1 file changed, 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c
>>>>>> b/drivers/gpu/drm/msm/dp/dp_panel.c
>>>>>> index 5149ceb..3344f5a 100644
>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>>>>>> @@ -78,10 +78,6 @@ static int dp_panel_read_dpcd(struct dp_panel
>>>>>> *dp_panel)
>>>>>>         if (link_info->num_lanes > dp_panel->max_dp_lanes)
>>>>>>             link_info->num_lanes = dp_panel->max_dp_lanes;
>>>>>>     -    /* Limit support upto HBR2 until HBR3 support is added */
>>>>>> -    if (link_info->rate >=
>>>>>> (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
>>>>>> -        link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
>>>>>> -
>>>>>>         drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
>>>>>>         drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
>>>>>>         drm_dbg_dp(panel->drm_dev, "lane_count=%d\n",
>>>>>> link_info->num_lanes);
>>>
>>> Stephen might remember better, but I could have sworn that the problem
>>> was that there might be something in the middle that couldn't support
>>> the higher link rate. In other words, I think we have:
>>>
>>> SoC <--> TypeC Port Controller <--> Display
>>>
>>> The SoC might support HBR3 and the display might support HBR3, but the
>>> TCPC (Type C Port Controller) might not. I think that the TCPC is a
>>> silent/passive component so it can't really let anyone know about its
>>> limitations.
>>>
>>> In theory I guess you could rely on link training to just happen to
>>> fail if you drive the link too fast for the TCPC to handle. Does this
>>> actually work reliably?
>>>
>>> I think the other option that was discussed in the past was to add
>>> something in the device tree for this. Either you could somehow model
>>> the TCPC in DRM and thus know that a given model of TCPC limits the
>>> link rate or you could hack in a property in the DP controller to
>>> limit it.
>>
>> Latest pmic_glink proposal from Bjorn include adding the drm_bridge for
>> the TCPC. Such bridge can in theory limit supported modes and rates.
> 
> Excellent! Even so, I think this isn't totally a solved problem,
> right? Even though a bridge seems like a good place for this, last I
> remember checking the bridge API wasn't expressive enough to solve
> this problem. A bridge could limit pixel clocks just fine, but here we
> need to take into account other considerations to know if a given
> pixel clock can work at 5.4 GHz or not. For instance, if we're at 4
> lanes we could maybe make a given pixel clock at 5.4 GHz but not if we
> only have 2 lanes. I don't think that the DP controller passes the
> number of lanes to other parts of the bridge chain, though maybe
> there's some trick for it?

I hope that somebody would fix MSM DP's data-lanes property usage to 
follow the usual way (a part of DT graph). Then it would be possible to 
query the amount of the lanes from the bridge.

> ...I guess the other problem is that all existing users aren't
> currently modeling their TCPC in this way. What happens to them?

There are no existing users. Bryan implemented TCPM support at some 
point, but we never pushed this upstream.

-- 
With best wishes
Dmitry

