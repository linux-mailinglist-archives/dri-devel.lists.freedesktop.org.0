Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA52C507302
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D6110EEA9;
	Tue, 19 Apr 2022 16:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FD810EFB8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:34:20 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id x17so30362313lfa.10
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 09:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VNdZ3ZruDjUYtNO7GtR4WiBEqgFZBuawM6uWA4DvH/8=;
 b=uxHF5LtW35cvpK03WGeFJqgjydEO3GxmFPcfl0YZoVHI4PEqOXEhtoUN6GX4oHGzZX
 jzmqhwarYkAzXPXZ2GWKzxXd+DMn5URfESPWhA9r5MRjqj0J4X2mZcqggcNWzpBAHtpO
 RHZuOQznNDWwNkFvdGqUjBDBCkR02Ea5H8V9aCXG2GAXxkbWGN/IWqBiwo5Sns4Vz/2f
 t5wMzcACJ5+c2oguF+Eszi2ZhtAO8TPjMnK2ERkR0N1NiqwTB5IdkHK8QmPM5dwGbJKp
 OFgEHguPUptOH66I0DVeeUTTFiV0mHPA7If3VCck3tIKLioNfF3APSiaLoMIGg2otsGy
 /LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VNdZ3ZruDjUYtNO7GtR4WiBEqgFZBuawM6uWA4DvH/8=;
 b=AcRnX+ZB9+KvmFZlglaL9cxJVdgW4+ym3N8xnP3UeUCFKGxbQqI4ZreHh9mXEmx7Of
 EOg2H2AwdxJ0V4rXLPl/eKwgNOpZvwy+7f1spApF6L7l4P7JHiwwjKEIEazyaqnBQoSL
 NO8sKFA3kMEDgkq7s1L8xtefNRRMiW0dViJHwPjaaihg+UyEpDxRSRQ6PeLvxfGllDyW
 Lp5s9GB0v9IpfwoLGIdv7KTlrXByCLeC6POKf6ST46PKQItcc5y5Tp/yTGHm5tYQkj9Q
 tMmEc4/MC42HligBhatsi53QyGF4FzIPZEI+raFkYU1Q20WWuTDDZ9sW2Fjc1uePMcs0
 bRcw==
X-Gm-Message-State: AOAM532drCPFcwKzEuB9JVsl1w/9oiXMNn0x+Cy46J7GzfRiG4Rbd3iy
 eK1XqpS5gIPzA8fQtJ9MBSq7pkZ0P55Epg==
X-Google-Smtp-Source: ABdhPJye/4SzndnfCvrzgAth0tHbrcYYwiLGApxmaGuqYkH5ug3ief/UBEdzo03g0HHBjWu+JXwJJA==
X-Received: by 2002:a05:6512:3d94:b0:471:2436:f8f4 with SMTP id
 k20-20020a0565123d9400b004712436f8f4mr9745009lfv.441.1650386059267; 
 Tue, 19 Apr 2022 09:34:19 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a2e9c08000000b0024af06d6674sm1446430lji.61.2022.04.19.09.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 09:34:18 -0700 (PDT)
Message-ID: <77e7ed06-8b7a-35d9-c133-561058a9ea6d@linaro.org>
Date: Tue, 19 Apr 2022 19:34:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 3/5] drm/msm/dp: set stream_pixel rate directly
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-4-dmitry.baryshkov@linaro.org>
 <CAE-0n529mx1ke89iw8xXZEDcs0z84hA09B31cWeVQSTU9RAAYg@mail.gmail.com>
 <CAA8EJpq4fXHH6GEJO=m3Ckw0A2p7B_X0D3SiXi1xnJ=4VZOC=g@mail.gmail.com>
 <CAE-0n50h=REsyLsjNMaMaZtH7Dptowink7Tq0nzmBRYNas9OmQ@mail.gmail.com>
 <CAA8EJppT9O+bDjfEZv9tWCWpeCDMDPTf+VV0a0HxDw2mXhiMtw@mail.gmail.com>
 <CAE-0n522eve3K1ou-sFgNnfwtb6qSzOssB0=Ewu53PnBYkzO-g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n522eve3K1ou-sFgNnfwtb6qSzOssB0=Ewu53PnBYkzO-g@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/03/2022 23:46, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-03-03 23:58:58)
>> On Fri, 4 Mar 2022 at 07:31, Stephen Boyd <swboyd@chromium.org> wrote:
>>>
>>> Quoting Dmitry Baryshkov (2022-03-03 20:23:06)
>>>> On Fri, 4 Mar 2022 at 01:32, Stephen Boyd <swboyd@chromium.org> wrote:
>>>>>
>>>>> Quoting Dmitry Baryshkov (2022-02-16 21:55:27)
>>>>>> The only clock for which we set the rate is the "stream_pixel". Rather
>>>>>> than storing the rate and then setting it by looping over all the
>>>>>> clocks, set the clock rate directly.
>>>>>>
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> [...]
>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>>>> index 07f6bf7e1acb..8e6361dedd77 100644
>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>>>> @@ -1315,7 +1315,7 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
>>>>>>          DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
>>>>>>
>>>>>>          if (num)
>>>>>> -               cfg->rate = rate;
>>>>>> +               clk_set_rate(cfg->clk, rate);
>>>>>
>>>>> This looks bad. From what I can tell we set the rate of the pixel clk
>>>>> after enabling the phy and configuring it. See the order of operations
>>>>> in dp_ctrl_enable_mainlink_clocks() and note how dp_power_clk_enable()
>>>>> is the one that eventually sets a rate through dp_power_clk_set_rate()
>>>>>
>>>>>          dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
>>>>>                                          ctrl->link->link_params.rate * 1000);
>>>>>
>>>>>          phy_configure(phy, &dp_io->phy_opts);
>>>>>          phy_power_on(phy);
>>>>>
>>>>>          ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
>>>>
>>>> This code has been changed in the previous patch.
>>>>
>>>> Let's get back a bit.
>>>> Currently dp_ctrl_set_clock_rate() doesn't change the clock rate. It
>>>> just stores the rate in the config so that later the sequence of
>>>> dp_power_clk_enable() -> dp_power_clk_set_rate() ->
>>>> [dp_power_clk_set_link_rate() -> dev_pm_opp_set_rate() or
>>>> msm_dss_clk_set_rate() -> clk_set_rate()] will use that.
>>>>
>>>> There are only two users of dp_ctrl_set_clock_rate():
>>>> - dp_ctrl_enable_mainlink_clocks(), which you have quoted above.
>>>>    This case is handled in the patch 1 from this series. It makes
>>>
>>> Patch 1 form this series says DP is unaffected. Huh?
>>>
>>>> dp_ctrl_enable_mainlink_clocks() call dev_pm_opp_set_rate() directly
>>>> without storing (!) the rate in the config, calling
>>>> phy_configure()/phy_power_on() and then setting the opp via the
>>>> sequence of calls specified above
>>
>> Note, this handles the "ctrl_link" clock.
>>
>>>>
>>>> - dp_ctrl_enable_stream_clocks(), which calls dp_power_clk_enable()
>>>> immediately afterwards. This call would set the stream_pixel rate
>>>> while enabling stream clocks. As far as I can see, the stream_pixel is
>>>> the only stream clock. So this patch sets the clock rate without
>>>> storing in the interim configuration data.
>>>>
>>>> Could you please clarify, what exactly looks bad to you?
>>>>
>>
>> Note, this handles the "stream_pixel" clock.
>>
>>>
>>> I'm concerned about the order of operations changing between the
>>> phy being powered on and the pixel clk frequency being set. From what I
>>> recall the pixel clk rate operations depend on the phy frequency being
>>> set (which is done through phy_configure?) so if we call clk_set_rate()
>>> on the pixel clk before the phy is set then the clk frequency will be
>>> calculated badly and probably be incorrect.
>>
>> But the order of operations is mostly unchanged. The only major change
>> is that the opp point is now set before calling the
>> phy_configure()/phy_power_on()
> 
> Yes that's my concern. The qmp phy driver has a couple clk_set_rate()
> calls in the .configure_dp_phy callback. That is called from
> phy_power_on() (see qcom_qmp_phy_power_on() and qcom_qmp_phy_dp_ops).
> Looking at qcom_qmp_v3_phy_configure_dp_phy() it does
> 
>          clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
>          clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);
> 
> and I believe the child of dp_pixel_hw is find_clock("stream_pixel").
> Looks like that is DISP_CC_MDSS_DP_PIXEL_CLK which is
> disp_cc_mdss_dp_pixel_clk_src for the rate settable part. That has
> clk_dp_ops which is clk_rcg2_dp_set_rate() for the set rate part. That
> wants the parent clk frequency to be something non-zero to use in
> rational_best_approximation(). If the clk_set_rate("stream_pixel") call
> is made before phy_power_on() then the parent_rate in
> clk_rcg2_dp_set_rate() won't be valid and the pixel clk frequency will
> be wrong.


Please excuse me, I didn't have time for this patchset up to now.

I double checked the previous patch (drm/msm/dp: "inline" 
dp_ctrl_set_clock_rate("ctrl_link")). Note, that the OPP is set _after_ 
the PHY is powered on and configured.

Does that cover your concerns?



-- 
With best wishes
Dmitry
