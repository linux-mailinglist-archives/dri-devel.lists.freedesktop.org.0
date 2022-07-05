Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 277FE5669BA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C961136D9;
	Tue,  5 Jul 2022 11:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5121510E021;
 Tue,  5 Jul 2022 07:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657007240; x=1688543240;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=10yG6y6njUSdyHbnv5fALLIcr4SspTq4ByE5kOtgKqY=;
 b=mQX2giajypP+oY02rkxPLLcBQa2yZ+h6gM5KPbhPg/rAYDPifmMYcIeV
 7cgBiU4LMr2fpIGyajkcwZwm8pjNChMAB5DaAqitXgfWcUtK2l5/aFAEk
 f0ji6Cgh1/L0lkleOr4wCuSjTuicuT9nsAeyhNCQA90a+nR6pyWTVHghS 4=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Jul 2022 22:41:11 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 22:41:10 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 4 Jul 2022 22:41:10 -0700
Received: from [10.111.163.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 4 Jul 2022
 22:41:06 -0700
Message-ID: <48f97293-9fe2-a9fd-b051-fd1fc190bc6c@quicinc.com>
Date: Mon, 4 Jul 2022 22:41:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: make eDP panel as the first
 connected connector
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Doug Anderson <dianders@chromium.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
References: <1656429606-2765-1-git-send-email-quic_khsieh@quicinc.com>
 <F35C87BF-46A5-41D3-B8A5-B2AB4A24252D@linaro.org>
 <CAD=FV=X3cv=Q30pODyi__OyRY+LbFT14RfEELvm_DAeHafF70g@mail.gmail.com>
 <CAF6AEGvFYK3x_CmErkKsmYNEv9y8AksE9UB_sfp-Z7RieX=tVg@mail.gmail.com>
 <E87F561E-22B4-46B6-AD9B-4995E92A8E29@linaro.org>
 <1df69cf9-7610-45af-240c-1b8e02953bc1@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <1df69cf9-7610-45af-240c-1b8e02953bc1@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Vinod
 Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, "Aravind
 Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/4/2022 11:14 AM, Dmitry Baryshkov wrote:
> On 30/06/2022 09:14, Dmitry Baryshkov wrote:
>>
>>
>> On 30 June 2022 04:57:35 GMT+03:00, Rob Clark <robdclark@gmail.com> 
>> wrote:
>>> On Wed, Jun 29, 2022 at 5:36 PM Doug Anderson <dianders@chromium.org> 
>>> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On Tue, Jun 28, 2022 at 1:14 PM Dmitry Baryshkov
>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>
>>>>> On 28 June 2022 18:20:06 GMT+03:00, Kuogee Hsieh 
>>>>> <quic_khsieh@quicinc.com> wrote:
>>>>>> Some userspace presumes that the first connected connector is the 
>>>>>> main
>>>>>> display, where it's supposed to display e.g. the login screen. For
>>>>>> laptops, this should be the main panel.
>>>>>>
>>>>>> This patch call drm_helper_move_panel_connectors_to_head() after
>>>>>> drm_bridge_connector_init() to make sure eDP stay at head of
>>>>>> connected connector list. This fixes unexpected corruption happen
>>>>>> at eDP panel if eDP is not placed at head of connected connector
>>>>>> list.
>>>>>
>>>>> The change itself is a good fix anyway. (And I'd ack it.) However I 
>>>>> would like to understand why does it fix the corruption issue. What 
>>>>> is we have eDP and DSI, with DSI ending up before the eDP? Would we 
>>>>> see the issue?
>>>>> Also could you please describe the mind of corruption you are 
>>>>> observing?
>>>>
>>>> I've spent a whole bunch of time poking at this and in the end my
>>>> conclusion is this:
>>>>
>>>> 1. The glitchyness seems to be a result of the Chrome OS userspace
>>>> somehow telling the kernel to do something wrong.
>>>>
>>>> 2. I believe (though I have no proof other than Kuogee's patch fixing
>>>> things) that the Chrome OS userspace is simply confused by the eDP
>>>> connector being second. This would imply that Kuogee's patch is
>>>> actually the right one.
>>>>
>>>> 3. It would be ideal if the Chrome OS userspace were fixed to handle
>>>> this, but it's an area of code that I've never looked at. It also
>>>> seems terribly low priority to fix since apparently other OSes have
>>>> similar problems (seems like this code was originally added by
>>>> RedHat?)
>>>>
>>>>
>>>> Specifically, I tested with a similar but "persistent" glitch that I
>>>> reproduced. The glitch Kuogee was digging into was a transitory glitch
>>>> on the eDP (internal) display when you plugged in a DP (external)
>>>> display. It would show up for a frame or two and then be fixed. I can
>>>> get a similar-looking glitch (vertical black and white bars) that
>>>> persists by doing these steps on a Chrome OS device (and Chrome OS
>>>> kernel):
>>>>
>>>> a) Observe screen looks good.
>>>> b) Observe DP not connected.
>>>> c) Plug in DP
>>>> d) See transitory glitch on screen, then it all looks fine.
>>>> e) set_power_policy --ac_screen_dim_delay=5 --ac_screen_off_delay=10
>>>> f) Wait for screen to turn off
>>>> g) Unplug DP
>>>> h) Hit key on keyboard to wake device.
>>>> i) See glitchy.
>>>> j) Within 5 seconds: set_power_policy --ac_screen_dim_delay=5000
>>>> --ac_screen_off_delay=10000
>>>>
>>>> Once I'm in the persistent glitch:
>>>>
>>>> * The "screenshot" command in Chrome OS shows corruption. Not exactly
>>>> black and white bars, but the image produced has distinct bands of
>>>> garbage.
>>>>
>>>> * I can actually toggle between VT2 and the main screen (VT1). Note
>>>> that VT1/VT2 are not quite the normal Linux managed solution--I
>>>> believe they're handled by frecon. In any case, when I switch to VT2
>>>> it looks normal (I can see the login prompt). Then back to VT1 and the
>>>> vertical bars glitch. Back to VT2 and it's normal. Back to VT1 and the
>>>> glitch again. This implies (especially with the extra evidence of
>>>> screenshot) that the display controller hardware is all fine and that
>>>> it's the underlying data that's somehow messed up.
>>>
>>> fwiw, from looking at this a bit w/ Doug, I think the "glitch" is
>>> simply just an un-renderered buffer being interpreted by the display
>>> controller as UBWC (because userspace tells it to)
>>
>> Thanks for the description. I think the userspace code should be fixed 
>> too, but this patch can go in on its own.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> After some time (please excuse me), musing with the code and even 
> picking up the commit for the merge branch, I understood the fact that I 
> did not like about this change. It moves all panel connectors (generic 
> code) from the DP-specific driver.
> 
> I'd like to retract my R-b. Please move this call to the msm_drm_init(). 
> Calling this function somewhere after the ->kms_init() would make sure 
> that all panel connectors are close to the top of the list, whichever 
> MDP/DPU driver is used and whichever actual interface is bound to this 
> panel.
> 
Ah. True, but just to add. It should be after kms_init() but before 
drm_dev_register().

>>
>>
>>>
>>> BR,
>>> -R
>>>
>>>> When I pick Kuogee's patch then this "persistent" glitch goes away
>>>> just like the transitory one does.
>>>>
>>>> I'm going to go ahead and do:
>>>>
>>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>>> Tested-by: Douglas Anderson <dianders@chromium.org>
>>
> 
> 
