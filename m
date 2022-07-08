Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 438A456C11C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 21:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF8710E183;
	Fri,  8 Jul 2022 19:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F1D10E0AD;
 Fri,  8 Jul 2022 19:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657309365; x=1688845365;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=cvvPOf0ESif5qtfECCusv626UD+VI6e+YqhLOB1P/oY=;
 b=DBxQPUL+qwuVLamFIWWktqbV3ixcmdwVXO5WtTCRRUzW9hhXVetlCzUn
 zlgeaitEg2hvenB4dX83ICidAue/Ygpq6r9b5FkfL74CPWMrV2e3OrImD
 4Vo6BJRi4r/2Qahnj309OAf9qitLorWqC8tKe+GsQAYxNKtNV/L28h+bT 8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Jul 2022 12:42:44 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 12:42:44 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 8 Jul 2022 12:42:43 -0700
Received: from [10.111.160.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 8 Jul 2022
 12:42:41 -0700
Message-ID: <ffad2e39-f775-00de-3119-f9b0ca3fe4f7@quicinc.com>
Date: Fri, 8 Jul 2022 12:42:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dsi: Set panel orientation when directly connected
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Doug Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>
References: <20220706191442.1150634-1-swboyd@chromium.org>
 <CAD=FV=UrYCwm2ByN_5EN3fq-ayMJNjmWfJ5sooRy51ZiCoMcjA@mail.gmail.com>
 <60252405-81f2-2465-bc20-5f91a9072031@quicinc.com>
In-Reply-To: <60252405-81f2-2465-bc20-5f91a9072031@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, patches@lists.linux.dev,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/8/2022 9:00 AM, Abhinav Kumar wrote:
> 
> 
> On 7/8/2022 8:25 AM, Doug Anderson wrote:
>> Hi,
>>
>> On Wed, Jul 6, 2022 at 12:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
>>>
>>> Set the panel orientation in drm when the panel is directly connected,
>>> i.e. we're not using an external bridge. The external bridge case is
>>> already handled by the panel bridge code, so we only update the path we
>>> take when the panel is directly connected/internal. This silences a
>>> warning splat coming from __drm_mode_object_add() on Wormdingler boards.
>>>
>>> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
>>> Cc: Douglas Anderson <dianders@chromium.org>
>>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>> ---
>>>
>>> This relies on commit 5e41b01a7808 ("drm/panel: Add an API to allow drm
>>> to set orientation from panel") which is in drm-misc
>>>
>>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>
>> I don't personally have objections to this, but (to my understanding)
>> "the future" is that everyone should use panel_bridge. If we made the
>> move to panel_bridge today then we wouldn't need to do this. In
>> general I think panel_bridge would end up letting us delete a bunch of
>> code...
>>
>> See commit 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with
>> panel-bridge") for when this was done by ti-sn65dsi86.
>>
>> Then again, I spent a small amount of time looking into this and it's
>> definitely non-trivial. Still likely worthwhile, but not worth
>> blocking a tiny fix like this. It also should be fairly obvious that
>> we should delete this when we switch to panel_bridge.
> 
> Right, from what I saw on IRC, panel_bridge is the way forward and 
> dmitry did push a change to do that
> 
> https://patchwork.freedesktop.org/patch/492585/
> 
> But I think we can go ahead with this change because its simple enough.
> 
> Regarding the panel_bridge migration, I am going to start reviewing that 
> as well.
> 

I did some more digging up on the panel_bridge migration.

Dmitry has posted this towards december last year

https://patches.linaro.org/project/dri-devel/patch/20211207222901.988484-3-dmitry.baryshkov@linaro.org/ 


and I had given my R-b on this already in Jan.

I am not sure why this change was dropped OR was not part of msm-next 
already.

Dmitry, any reason this change was left out so long and why the R-b was 
not retained and this was reposted?

 From what i can see the change looks identical.

Thanks

Abhinav
>>
>> Thus:
>>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>
>> I'll assume that we'll just snooze this commit until drm-misc-next
>> merges into a tree that msm-next is based on, which will probably be
>> the next -rc1. If desired and Acked I could land this in
>> drm-misc-next, but it's probably not worth it?
