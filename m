Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7D058450B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 19:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA16E10EE2B;
	Thu, 28 Jul 2022 17:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A53111A1A4;
 Thu, 28 Jul 2022 17:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659029666; x=1690565666;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=o+fn6h9fFDfk07b94ykcs0xYkUzKgqQtjInlwWCLcjs=;
 b=jwQ1HpKjEiU8jJBoBqrTA2eeN9TvXocWLVLHZoc7WyC+XYhAEiapTpfy
 RvYEDigEeJp3pbAbMBj0sWqf+ELL7Ru3CnYFdqwj2QmYpnY6qjCMkl/Uw
 9vxvvAnudidKFA+99g1z6tu0bmAJYvl7u1yKZW20ZyeAfx6W/9wITgXBo A=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 28 Jul 2022 10:34:25 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 10:34:25 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 28 Jul 2022 10:34:24 -0700
Received: from [10.111.167.242] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 28 Jul
 2022 10:34:21 -0700
Message-ID: <5c8ca71c-5f0b-d5f5-9f16-e312dec0d01b@quicinc.com>
Date: Thu, 28 Jul 2022 10:34:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH] drm/edid: Make 144 Hz not preferred on Sharp
 LQ140M1JW46
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Doug Anderson <dianders@chromium.org>
References: <20220721152314.RFC.1.Ie333b3e4aff6e4a5b58c4aa805e030e561be8773@changeid>
 <269f2610-425b-f296-dcfc-89bdc2e1d587@quicinc.com>
 <CAD=FV=XSVXasU5PMR2kL0WQjQ458xDePuTGd1m14_v9JO5B6oA@mail.gmail.com>
 <CAF6AEGv_Vikf80v-7ccz90fvGPrk5pV1tOxRoWKxKHYuEW8=aA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAF6AEGv_Vikf80v-7ccz90fvGPrk5pV1tOxRoWKxKHYuEW8=aA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob and Doug

On 7/22/2022 10:36 AM, Rob Clark wrote:
> On Fri, Jul 22, 2022 at 9:48 AM Doug Anderson <dianders@chromium.org> wrote:
>>
>> Hi,
>>
>> On Fri, Jul 22, 2022 at 9:37 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>
>>> + sankeerth
>>>
>>> Hi Doug
>>>
>>> On 7/21/2022 3:23 PM, Douglas Anderson wrote:
>>>> The Sharp LQ140M1JW46 panel is on the Qualcomm sc7280 CRD reference
>>>> board. This panel supports 144 Hz and 60 Hz. In the EDID, the 144 Hz
>>>> mode is listed first and thus is marked preferred. The EDID decode I
>>>> ran says:
>>>>
>>>>     First detailed timing includes the native pixel format and preferred
>>>>     refresh rate.
>>>>
>>>>     ...
>>>>
>>>>     Detailed Timing Descriptors:
>>>>       DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  346.500 MHz
>>>>                    Hfront   48 Hsync  32 Hback  80 Hpol N
>>>>                    Vfront    3 Vsync   5 Vback  69 Vpol N
>>>>       DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  144.370 MHz
>>>>                    Hfront   48 Hsync  32 Hback  80 Hpol N
>>>>                    Vfront    3 Vsync   5 Vback  69 Vpol N
>>>>
>>>> I'm proposing here that the above is actually a bug and that the 60 Hz
>>>> mode really should be considered preferred by Linux.

Its a bit tricky to say that this is a bug but I think we can certainly 
add here that for an internal display we would have ideally had the 
lower resolution first to indicate it as default.

>>>>
>>>> The argument here is that this is a laptop panel and on a laptop we
>>>> know power will always be a concern. Presumably even if someone using
>>>> this panel wanted to use 144 Hz for some use cases they would only do
>>>> so dynamically and would still want the default to be 60 Hz.
>>>>
>>>> Let's change the default to 60 Hz using a standard quirk.
>>>>
>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>>
>>> Yes, we were aware that 144Hz was getting picked. We found that while
>>> debugging the screen corruption issue.
>>>
>>> Well, yes power would be less with 60Hz but so will be the performance.
>>
>> What performance specifically will be less with 60 Hz? In general the
>> sc7280 CPU is a bit memory-bandwidth constrained and the LCD refresh
>> from memory is a non-trivial part of that. Reducing to 60 Hz will
>> relieve some of the memory bandwidth pressure and will actually allow
>> tasks on the CPU to run _faster_. I guess the downside is that some
>> animations might be a little less smooth...
> 
> I guess he is referring to something that is vblank sync'd running
> faster than 60fps.
> 
> but OTOH it is a bit of a waste for fbcon to be using 144Hz.  And
> there are enough android games that limit themselves to 30fps to save
> your "phone" battery.  So it seems a lot more sane to default to 60Hz
> and let userspace that knows it wants more pick the 144Hz rate when
> needed.
> 
> BR,
> -R

Yes i was referring to vblank synced apps.

> 
>>
>>
>>> The test teams have been validating with 144Hz so far so we are checking
>>> internally with the team whether its OKAY to goto 60Hz now since that
>>> kind of invalidates the testing they have been doing.
>>
>> You're worried that the panel itself won't work well at 60 Hz, or
>> something else about the system won't? The whole system in general
>> needs to work well with 60 Hz displays and I expect them to be much
>> more common than 144 Hz displays. Quite honestly if switching to 60 Hz
>> uncovers a problem that would be a huge benefit of landing this patch
>> because it would mean we'd find it now rather than down the road when
>> someone hooks up a different panel.

I was worried that it will invalidate the testing they did so far but 
since you have confirmed that you would prefer 60Hz to be more 
thoroughly tested than 144Hz, I have informed the internal teams of this 
change and given the heads up.

You can have my R-b for this change,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

I would also wait to see if others have different thought about this.

>>
>> -Doug
