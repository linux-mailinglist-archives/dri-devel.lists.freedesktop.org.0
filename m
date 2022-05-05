Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB6551C5FA
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 19:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D186710E9F7;
	Thu,  5 May 2022 17:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEB210E9F7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 17:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651771256; x=1683307256;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KWt8qc9rcFQlTYziD1O54IX8AuORvGOLfcwGCOAPqjs=;
 b=ivn92EriGOeu9+LtxwDoA8gtB7cV8EMvhUP7ot1/7h8bXHRcGc6nSjuU
 Mf/J4DMQEAd62YPQbFSPSqpLkC+b+mf81S774GOSF9PMo88K7thIE90at
 yfrQ/SWCJjYq3ph4WZ9TYAz7BdSNPNclEHjn40TZO3sj1BHqE7rSN1V+G k=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 05 May 2022 10:20:55 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 10:20:55 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 5 May 2022 10:20:55 -0700
Received: from [10.111.168.240] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 5 May 2022
 10:20:52 -0700
Message-ID: <4186ab8f-d227-f2c7-ab3f-0729bb915f17@quicinc.com>
Date: Thu, 5 May 2022 10:20:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] drm/probe-helper: For DP, add 640x480 if all other
 modes are bad
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
 <20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
 <CAD=FV=XzGOGc8pMics4=idQeCuLYWxj=bHcic4NZa9+3qbqpbg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=XzGOGc8pMics4=idQeCuLYWxj=bHcic4NZa9+3qbqpbg@mail.gmail.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, "Kuogee
 Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug

On 5/5/2022 8:44 AM, Doug Anderson wrote:
> Ville,
> 
> On Tue, Apr 26, 2022 at 11:47 AM Douglas Anderson <dianders@chromium.org> wrote:
>>
>> As per Displayport spec section 5.2.1.2 ("Video Timing Format") says
>> that all detachable sinks shall support 640x480 @60Hz as a fail safe
>> mode.
>>
>> A DP compliance test expected us to utilize the above fact when all
>> modes it presented to the DP source were not achievable. It presented
>> only modes that would be achievable with more lanes and/or higher
>> speeds than we had available and expected that when we couldn't do
>> that then we'd fall back to 640x480 even though it didn't advertise
>> this size.
>>
>> In order to pass the compliance test (and also support any users who
>> might fall into a similar situation with their display), we need to
>> add 640x480 into the list of modes. However, we don't want to add
>> 640x480 all the time. Despite the fact that the DP spec says all sinks
>> _shall support_ 640x480, they're not guaranteed to support it
>> _well_. Continuing to read the spec you can see that the display is
>> not required to really treat 640x480 equal to all the other modes. It
>> doesn't need to scale or anything--just display the pixels somehow for
>> failsafe purposes. It should also be noted that it's not hard to find
>> a display hooked up via DisplayPort that _doesn't_ support 640x480 at
>> all. The HP ZR30w screen I'm sitting in front of has a native DP port
>> and doesn't work at 640x480. I also plugged in a tiny 800x480 HDMI
>> display via a DP to HDMI adapter and that screen definitely doesn't
>> support 640x480.
>>
>> As a compromise solution, let's only add the 640x480 mode if:
>> * We're on DP.
>> * All other modes have been pruned.
>>
>> This acknowledges that 640x480 might not be the best mode to use but,
>> since sinks are _supposed_ to support it, we will at least fall back
>> to it if there's nothing else.
>>
>> Note that we _don't_ add higher resolution modes like 1024x768 in this
>> case. We only add those modes for a failed EDID read where we have no
>> idea what's going on. In the case where we've pruned all modes then
>> instead we only want 640x480 which is the only defined "Fail Safe"
>> resolution.
>>
>> This patch originated in response to Kuogee Hsieh's patch [1].
>>
>> [1] https://lore.kernel.org/r/1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com
>>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>
>>   drivers/gpu/drm/drm_probe_helper.c | 26 +++++++++++++++++++++-----
>>   1 file changed, 21 insertions(+), 5 deletions(-)
> 
> I think this patch is fairly safe / non-controversial, but someone
> suggested you might have an opinion on it and another patch I posted
> recently [1] so I wanted to double-check. Just to be clear: I'm hoping
> to land _both_ this patch and [1]. If you don't have an opinion,
> that's OK too.
> 
> Abhinav: I think maybe you're happy with this now? Would you be
> willing to give a Reviewed-by?

Yes, I have no concerns with this approach from DP spec standpoint and 
in addition, kuogee has tested this out and this does help us to pass 
the tests.

Although, I might be missing some historical context on why this is not 
already done.

But apart from that, LGTM. Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> 
> [1] https://lore.kernel.org/r/20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid
> 
> -Doug
