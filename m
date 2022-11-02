Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3485B616A8F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 18:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54F610E514;
	Wed,  2 Nov 2022 17:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5EE10E514
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 17:23:20 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id be13so29359841lfb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 10:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kASadRV8FgmzPVXt8X+CbiRrdhinkrSMcb3XJepFmAA=;
 b=TpLzINr5CMIwEnr/trS4fLyZW69tu2sP80qy3pCm1vgE974Rd5kmOmyR3QbmhKz9kB
 lxVQnqJ9wbcL45QUVFHG8/VVxYm0cPZM5usizExzMZRpgCnTR70zbSNG+tQCau6cjfa4
 f+ztgXxQ/6KFGjlRPe+TulrVZtJsETbGWPDMlTnb1i9mwxO3Q0CcE3Yy2ydMv0TKEwsv
 YGkcnQVfJh5o6qtwdbLApXmFako98O/cyVCkQg0h1iBgDUuNTscFPEAdNrqk+dHNZp+a
 UrTrvjn6M34gXcBixfGNoAsckceuJoAWeU5BuvN+dTZexM7crH8w+BT4Rhx3pKn9xXql
 Gsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kASadRV8FgmzPVXt8X+CbiRrdhinkrSMcb3XJepFmAA=;
 b=0Ol8RnrUHME7SUMu0Q6kpYfcXbWS7MIbjmCQem98opJ+jBjzQaKSUZMxUSZfCZcX3U
 yiIabPa3G//hh5w0DUeaEtvIoOwwyYG0eMTZAxKfR7+q6PFRpd45aWULFvkVMhDLJBUs
 bimn5OeLZ7i8IG2vRdTZRwWlXLGAiy0ngEQi54HeNONhzz9jKhW3+PF4PpqgfyB/V/1K
 x+GHE/AcWz6RFjF0rznHJt+93PV9PT/X56qRsefhzQgyb39pZcuyQdB9U1a46qwInnup
 1D9OOuAYXDg/Bf0BwhpENgVhTRgHkP8GcC1wGMRQ2daN9LXURI8RC5VgMiCoVzcx2MH9
 1wcA==
X-Gm-Message-State: ACrzQf1cO3a/+JmKp369MEwHRBrPSvDKny5+0kAEMqKqPczU2e1dEeOm
 a4SBvI+J1iRM4bczzn3IFeIyJg==
X-Google-Smtp-Source: AMsMyM6sM8PwtorYIEkYWFVARx9LRGePDFosS1ShUVLzaPCU+JB/RnN5PY6I6GBPKA3U1b/JY2379w==
X-Received: by 2002:a05:6512:2a97:b0:4a2:caa1:e2f7 with SMTP id
 dt23-20020a0565122a9700b004a2caa1e2f7mr9100986lfb.653.1667409798826; 
 Wed, 02 Nov 2022 10:23:18 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a2e99d9000000b0026e15713edesm2257243ljj.9.2022.11.02.10.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 10:23:18 -0700 (PDT)
Message-ID: <c5aedb31-3881-50e7-f747-e75b18c3f4b8@linaro.org>
Date: Wed, 2 Nov 2022 20:23:17 +0300
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
 <CAD=FV=XTOUjVAGFWZ6xTkcNOrCT1p73aU-=KJNYUOxsS-BQsyA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAD=FV=XTOUjVAGFWZ6xTkcNOrCT1p73aU-=KJNYUOxsS-BQsyA@mail.gmail.com>
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

On 02/11/2022 18:47, Doug Anderson wrote:
> Hi,
> 
> On Tue, Nov 1, 2022 at 7:37 AM Doug Anderson <dianders@chromium.org> wrote:
>>
>> Hi,
>>
>> On Mon, Oct 31, 2022 at 5:15 PM Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org> wrote:
>>>
>>> On 01/11/2022 03:08, Doug Anderson wrote:
>>>> Hi,
>>>>
>>>> On Mon, Oct 31, 2022 at 2:11 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>>>
>>>>> Hi Dmitry,
>>>>>
>>>>>
>>>>> Link rate is advertised by sink, but adjusted (reduced the link rate)
>>>>> by host during link training.
>>>>>
>>>>> Therefore should be fine if host did not support HBR3 rate.
>>>>>
>>>>> It will reduce to lower link rate during link training procedures.
>>>>>
>>>>> kuogee
>>>>>
>>>>> On 10/31/2022 11:46 AM, Dmitry Baryshkov wrote:
>>>>>> On 31/10/2022 20:27, Kuogee Hsieh wrote:
>>>>>>> An HBR3-capable device shall also support TPS4. Since TPS4 feature
>>>>>>> had been implemented already, it is not necessary to limit link
>>>>>>> rate at HBR2 (5.4G). This patch remove this limitation to support
>>>>>>> HBR3 (8.1G) link rate.
>>>>>>
>>>>>> The DP driver supports several platforms including sdm845 and can
>>>>>> support, if I'm not mistaken, platforms up to msm8998/sdm630/660.
>>>>>> Could you please confirm that all these SoCs have support for HBR3?
>>>>>>
>>>>>> With that fact being confirmed:
>>>>>>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/msm/dp/dp_panel.c | 4 ----
>>>>>>>     1 file changed, 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c
>>>>>>> b/drivers/gpu/drm/msm/dp/dp_panel.c
>>>>>>> index 5149ceb..3344f5a 100644
>>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>>>>>>> @@ -78,10 +78,6 @@ static int dp_panel_read_dpcd(struct dp_panel
>>>>>>> *dp_panel)
>>>>>>>         if (link_info->num_lanes > dp_panel->max_dp_lanes)
>>>>>>>             link_info->num_lanes = dp_panel->max_dp_lanes;
>>>>>>>     -    /* Limit support upto HBR2 until HBR3 support is added */
>>>>>>> -    if (link_info->rate >=
>>>>>>> (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
>>>>>>> -        link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
>>>>>>> -
>>>>>>>         drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
>>>>>>>         drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
>>>>>>>         drm_dbg_dp(panel->drm_dev, "lane_count=%d\n",
>>>>>>> link_info->num_lanes);
>>>>
>>>> Stephen might remember better, but I could have sworn that the problem
>>>> was that there might be something in the middle that couldn't support
>>>> the higher link rate. In other words, I think we have:
>>>>
>>>> SoC <--> TypeC Port Controller <--> Display
>>>>
>>>> The SoC might support HBR3 and the display might support HBR3, but the
>>>> TCPC (Type C Port Controller) might not. I think that the TCPC is a
>>>> silent/passive component so it can't really let anyone know about its
>>>> limitations.
>>>>
>>>> In theory I guess you could rely on link training to just happen to
>>>> fail if you drive the link too fast for the TCPC to handle. Does this
>>>> actually work reliably?
>>>>
>>>> I think the other option that was discussed in the past was to add
>>>> something in the device tree for this. Either you could somehow model
>>>> the TCPC in DRM and thus know that a given model of TCPC limits the
>>>> link rate or you could hack in a property in the DP controller to
>>>> limit it.
>>>
>>> Latest pmic_glink proposal from Bjorn include adding the drm_bridge for
>>> the TCPC. Such bridge can in theory limit supported modes and rates.
>>
>> Excellent! Even so, I think this isn't totally a solved problem,
>> right? Even though a bridge seems like a good place for this, last I
>> remember checking the bridge API wasn't expressive enough to solve
>> this problem. A bridge could limit pixel clocks just fine, but here we
>> need to take into account other considerations to know if a given
>> pixel clock can work at 5.4 GHz or not. For instance, if we're at 4
>> lanes we could maybe make a given pixel clock at 5.4 GHz but not if we
>> only have 2 lanes. I don't think that the DP controller passes the
>> number of lanes to other parts of the bridge chain, though maybe
>> there's some trick for it?
>>
>> ...I guess the other problem is that all existing users aren't
>> currently modeling their TCPC in this way. What happens to them?
> 
> FWIW, I did more research on the "let's rely on link training to
> detect TCPC's that only support HBR2". I haven't tested it myself, but
> from looking at a 1.5 year old internal bug where we discussed this
> before, both others at Qualcomm and others at Google were skeptical
> about this. Both parties had past experience where link training would
> succeed but the display wouldn't be reliable at the higher link rate.
> 
> I guess that leaves us with 3 possible approaches:
> 
> 1. Someone figures out how to model this with the bridge chain and
> then we only allow HBR3 if we detect we've got a TCPC that supports
> it. This seems like the cleanest / best but feels like a long pole.
> Not only have we been trying to get the TCPC-modeled-as-a-bridge stuff
> landed for a long time but even when we do it we still don't have a
> solution for how to communicate the number of lanes and other stuff
> between the TCPC and the DP controller so we have to enrich the bridge
> interface.

I think we'd need some OOB interface. For example for DSI interfaces we 
have mipi_dsi_device struct to communicate such OOB data.

Also take a note regarding data-lanes from my previous email.

> 
> 2. We add in a DT property to the display controller node that says
> the max link rate for use on this board. This feels like a hack, but
> maybe it's not too bad. Certainly it would be incredibly simple to
> implement. Actually... ...one could argue that even if we later model
> the TCPC as a bridge that this property would still be valid / useful!
> You could certainly imagine that the SoC supports HBR3 and the TCPC
> supports HBR3 but that the board routing between the SoC and the TCPC
> is bad and only supports HBR2. In this case the only way out is
> essentially a "board constraint" AKA a DT property in the DP
> controller.

We have been discussing similar topics with Abhinav. Krzysztof suggested 
using link-frequencies property to provide max and min values.

> 
> 3. We could do some hack based on the SoC. We could assume that newer
> SoCs will have a TCPC that was tested with HBR3. This doesn't require
> any DT changes and would work, but feels like it won't stand the test
> of time.
> 
> I'd vote for #2 but I'm interested in what others say.
> 
> -Doug

-- 
With best wishes
Dmitry

