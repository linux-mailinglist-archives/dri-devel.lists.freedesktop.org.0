Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A4C56C171
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 23:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBB010E0C5;
	Fri,  8 Jul 2022 21:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168D910EC55;
 Fri,  8 Jul 2022 21:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657315053; x=1688851053;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Uaw0+e6VdRRhzLG+PpHuDpifABwLHhRV1vkNysKJ3Pk=;
 b=RqzxSruesoZ9LpNCPPPD9czHbrQ/pUtgATu6FzKFPNmrsrlQ+6OMnZR6
 RpzF+GRmumO0uyArP3SS1zDxnSvZODIXKS2oqzfaMgSqeQal9pEWwlN9e
 YG1Hb0RK8COap4HG1F5mIh+m4aQk76ylkVGzBYZm4NH+ptF/91DZlHUam w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Jul 2022 14:17:32 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 14:17:31 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 8 Jul 2022 14:17:31 -0700
Received: from [10.111.160.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 8 Jul 2022
 14:17:28 -0700
Message-ID: <f4a9e0a6-fe8d-cec5-6b46-30ca4cdaeb0a@quicinc.com>
Date: Fri, 8 Jul 2022 14:17:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dsi: Set panel orientation when directly connected
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220706191442.1150634-1-swboyd@chromium.org>
 <CAD=FV=UrYCwm2ByN_5EN3fq-ayMJNjmWfJ5sooRy51ZiCoMcjA@mail.gmail.com>
 <60252405-81f2-2465-bc20-5f91a9072031@quicinc.com>
 <ffad2e39-f775-00de-3119-f9b0ca3fe4f7@quicinc.com>
 <CAA8EJpo-CS9ZUzA7wDZ05W+Wcz9P_1fXHYPaZACEhMOjnJv_Yg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpo-CS9ZUzA7wDZ05W+Wcz9P_1fXHYPaZACEhMOjnJv_Yg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
Cc: Doug Anderson <dianders@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, patches@lists.linux.dev,
 Hsin-Yi Wang <hsinyi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/8/2022 1:58 PM, Dmitry Baryshkov wrote:
> On Fri, 8 Jul 2022 at 22:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 7/8/2022 9:00 AM, Abhinav Kumar wrote:
>>>
>>>
>>> On 7/8/2022 8:25 AM, Doug Anderson wrote:
>>>> Hi,
>>>>
>>>> On Wed, Jul 6, 2022 at 12:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
>>>>>
>>>>> Set the panel orientation in drm when the panel is directly connected,
>>>>> i.e. we're not using an external bridge. The external bridge case is
>>>>> already handled by the panel bridge code, so we only update the path we
>>>>> take when the panel is directly connected/internal. This silences a
>>>>> warning splat coming from __drm_mode_object_add() on Wormdingler boards.
>>>>>
>>>>> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
>>>>> Cc: Douglas Anderson <dianders@chromium.org>
>>>>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>>>> ---
>>>>>
>>>>> This relies on commit 5e41b01a7808 ("drm/panel: Add an API to allow drm
>>>>> to set orientation from panel") which is in drm-misc
>>>>>
>>>>>    drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> I don't personally have objections to this, but (to my understanding)
>>>> "the future" is that everyone should use panel_bridge. If we made the
>>>> move to panel_bridge today then we wouldn't need to do this. In
>>>> general I think panel_bridge would end up letting us delete a bunch of
>>>> code...
>>>>
>>>> See commit 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with
>>>> panel-bridge") for when this was done by ti-sn65dsi86.
>>>>
>>>> Then again, I spent a small amount of time looking into this and it's
>>>> definitely non-trivial. Still likely worthwhile, but not worth
>>>> blocking a tiny fix like this. It also should be fairly obvious that
>>>> we should delete this when we switch to panel_bridge.
>>>
>>> Right, from what I saw on IRC, panel_bridge is the way forward and
>>> dmitry did push a change to do that
>>>
>>> https://patchwork.freedesktop.org/patch/492585/
>>>
>>> But I think we can go ahead with this change because its simple enough.
>>>
>>> Regarding the panel_bridge migration, I am going to start reviewing that
>>> as well.
>>>
>>
>> I did some more digging up on the panel_bridge migration.
>>
>> Dmitry has posted this towards december last year
>>
>> https://patches.linaro.org/project/dri-devel/patch/20211207222901.988484-3-dmitry.baryshkov@linaro.org/
>>
>>
>> and I had given my R-b on this already in Jan.
>>
>> I am not sure why this change was dropped OR was not part of msm-next
>> already.
>>
>> Dmitry, any reason this change was left out so long and why the R-b was
>> not retained and this was reposted?
>>
>>   From what i can see the change looks identical.
> 
> I don't remember if it is identical or not. Basically it was postponed
> to allow DSC to flow in. We used drm_panel to pass DSC pps data. And
> if we use panel-bridge, we don't get a handle of the panel.
> Later on I have posted the series moving DSC pps pointer from
> drm_panel to mipi_dsi_device (which is logical anyway, since it's not
> only the panel, who can provide the DSC pps info, some bridges can
> process DSC-compressed data). But since that time it received no
> feedback.

Thanks for the details.

I will try to review the DRM core bits. But I guess for them to land, we 
need some of the core maintainers to pitch in on that.


> 
> 
