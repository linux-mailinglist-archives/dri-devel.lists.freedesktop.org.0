Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E92A405DBD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 21:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7AA6E909;
	Thu,  9 Sep 2021 19:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E02D6E907
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 19:50:02 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631217002; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3CekIbdYG/DWaxayOnRmOo9RT1gL6hIM3S/cqAXoD8M=;
 b=IKVUud6db4j4w0MJsssNz2YP6eDymmzqPU56sEVNM4msxwhKH/mPYjnUTJlV8rv2HFF5PtMh
 HCk3cFWt3jBcv1+AS6Z8v2dKTgr9EIeNo79FfhDrwfBR8T0M1klsNCszDYq4d7LD4DjtG1XP
 lY+2YSSyqLw3s7Q78uRdGUcN2EI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 613a6568aa8996eab7a9a123 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 19:50:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0914DC43637; Thu,  9 Sep 2021 19:49:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.0
Received: from [192.168.1.12] (unknown [59.88.226.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 223BFC4338F;
 Thu,  9 Sep 2021 19:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 223BFC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To: Amit Pundir <amit.pundir@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel
 <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek
 <jonathan@marek.ca>, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>
References: <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org>
 <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
 <b7334a1a-c4ad-da90-03b4-0d19e1811b13@linaro.org>
 <CAF6AEGv0WWB3Z1hmXf8vxm1_-d7fsNBRcaQF35aE2JXcJn8-cA@mail.gmail.com>
 <8aa590be-6a9f-9343-e897-18e86ea48202@linaro.org>
 <CAF6AEGtd_5jKhixp6h+NnN8-aqjBHTLopRozASE73oT3rfnFHA@mail.gmail.com>
 <6eefedb2-9e59-56d2-7703-2faf6cb0ca3a@codeaurora.org>
 <CAF6AEGvhqPHWNK=6GYz+Mu5aKe8+iE4_Teem6o=X6eiANhWsPg@mail.gmail.com>
 <83ecbe74-caf0-6c42-e6f5-4887b3b534c6@linaro.org>
 <53d3e5b7-9dc0-a806-70e9-b9b5ff877462@codeaurora.org>
 <YTgeIuwumPoR9ZTE@ripper>
 <CAMi1Hd1TOFj5USToEhuvZz8vgboQbMWco7gN413-jHJp-A7Ozg@mail.gmail.com>
 <CAMi1Hd2gmo-qzDSDpi1hwpX=N1eGM+Q5HqPSvdbq9LdqwNuK+w@mail.gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <ea5c23cb-0de4-3f1d-3052-c41fa9317984@codeaurora.org>
Date: Fri, 10 Sep 2021 01:19:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMi1Hd2gmo-qzDSDpi1hwpX=N1eGM+Q5HqPSvdbq9LdqwNuK+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/9/2021 9:42 PM, Amit Pundir wrote:
> On Thu, 9 Sept 2021 at 17:47, Amit Pundir <amit.pundir@linaro.org> wrote:
>>
>> On Wed, 8 Sept 2021 at 07:50, Bjorn Andersson
>> <bjorn.andersson@linaro.org> wrote:
>>>
>>> On Mon 09 Aug 10:26 PDT 2021, Akhil P Oommen wrote:
>>>
>>>> On 8/9/2021 9:48 PM, Caleb Connolly wrote:
>>>>>
>>>>>
>>>>> On 09/08/2021 17:12, Rob Clark wrote:
>>>>>> On Mon, Aug 9, 2021 at 7:52 AM Akhil P Oommen
>>>>>> <akhilpo@codeaurora.org> wrote:
>>> [..]
>>>>>>> I am a bit confused. We don't define a power domain for gpu in dt,
>>>>>>> correct? Then what exactly set_opp do here? Do you think this usleep is
>>>>>>> what is helping here somehow to mask the issue?
>>>>> The power domains (for cx and gx) are defined in the GMU DT, the OPPs in
>>>>> the GPU DT. For the sake of simplicity I'll refer to the lowest
>>>>> frequency (257000000) and OPP level (RPMH_REGULATOR_LEVEL_LOW_SVS) as
>>>>> the "min" state, and the highest frequency (710000000) and OPP level
>>>>> (RPMH_REGULATOR_LEVEL_TURBO_L1) as the "max" state. These are defined in
>>>>> sdm845.dtsi under the gpu node.
>>>>>
>>>>> The new devfreq behaviour unmasks what I think is a driver bug, it
>>>>> inadvertently puts much more strain on the GPU regulators than they
>>>>> usually get. With the new behaviour the GPU jumps from it's min state to
>>>>> the max state and back again extremely rapidly under workloads as small
>>>>> as refreshing UI. Where previously the GPU would rarely if ever go above
>>>>> 342MHz when interacting with the device, it now jumps between min and
>>>>> max many times per second.
>>>>>
>>>>> If my understanding is correct, the current implementation of the GMU
>>>>> set freq is the following:
>>>>>    - Get OPP for frequency to set
>>>>>    - Push the frequency to the GMU - immediately updating the core clock
>>>>>    - Call dev_pm_opp_set_opp() which triggers a notify chain, this winds
>>>>> up somewhere in power management code and causes the gx regulator level
>>>>> to be updated
>>>>
>>>> Nope. dev_pm_opp_set_opp() sets the bandwidth for gpu and nothing else. We
>>>> were using a different api earlier which got deprecated -
>>>> dev_pm_opp_set_bw().
>>>>
>>>
>>> On the Lenovo Yoga C630 this is reproduced by starting alacritty and if
>>> I'm lucky I managed to hit a few keys before it crashes, so I spent a
>>> few hours looking into this as well...
>>>
>>> As you say, the dev_pm_opp_set_opp() will only cast a interconnect vote.
>>> The opp-level is just there for show and isn't used by anything, at
>>> least not on 845.
>>>
>>> Further more, I'm missing something in my tree, so the interconnect
>>> doesn't hit sync_state, and as such we're not actually scaling the
>>> buses. So the problem is not that Linux doesn't turn on the buses in
>>> time.
>>>
>>> So I suspect that the "AHB bus error" isn't saying that we turned off
>>> the bus, but rather that the GPU becomes unstable or something of that
>>> sort.
>>>
>>>
>>> Lastly, I reverted 9bc95570175a ("drm/msm: Devfreq tuning") and ran
>>> Aquarium for 20 minutes without a problem. I then switched the gpu
>>> devfreq governor to "userspace" and ran the following:
>>>
>>> while true; do
>>>    echo 257000000 > /sys/class/devfreq/5000000.gpu/userspace/set_freq
>>>    echo 710000000 > /sys/class/devfreq/5000000.gpu/userspace/set_freq
>>> done
>>>
>>> It took 19 iterations of this loop to crash the GPU.
>>
>> Ack. With your above script, I can reproduce a crash too on db845c
>> (A630) running v5.14. I didn't get any crash log though and device
>> just rebooted to USB crash mode.
>>
>> And same crash on RB5 (A650) too https://hastebin.com/raw/ejutetuwun

Are we sure this is the same issue? It could be, but I thought we were 
seeing a bunch of random gpu errors (which may eventually hit device crash).

-Akhil

> 
> fwiw I can't reproduce this crash on RB5 so far with v5.15-rc1 merge
> window (HEAD: 477f70cd2a67)
> 
>>
>>>
>>> So the problem doesn't seem to be Rob's change, it's just that prior to
>>> it the chance to hitting it is way lower. Question is still what it is
>>> that we're triggering.
>>>
>>> Regards,
>>> Bjorn

