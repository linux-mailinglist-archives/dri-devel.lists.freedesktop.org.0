Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9881A403AEF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 15:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00B56E101;
	Wed,  8 Sep 2021 13:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C98B6E101
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 13:49:35 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1607794wmi.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 06:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y0lh+sRHyJvQUVAPP40k5yKczJum04OO6ZyC4AudIkU=;
 b=oZdIoJNdme6vvjVB/0Gc1a7V21qx2XE+NiQ7TRgrELm+J9yaO9LaPpFJsvpQq9klZ/
 HqLtUaAcz/afrFGiy/d6OenFiDKWhNBr4WzUK8xj0l3U8eBSB09TxVjGjLv1jQEIVV88
 38AIqd6sUEPv91QTXD8fOV3yV8/49Qak7CX7o+Rhpe1GNDNYGPsrJ3GuYah3GcCkCeyC
 uTngstmz4BsZWCCwUWZMj50LjGbKdnATC4bR3O2b3dEpTu3yWtydzGCUsgmrnSgsyzDb
 I1II2grn8UkgJ9c7osJMgRbDQjL3p+okgD7IkB1rW27pukzY+p6xPiBiRuzIdvM3mLqD
 E60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y0lh+sRHyJvQUVAPP40k5yKczJum04OO6ZyC4AudIkU=;
 b=31rm7pV7Nq66OPhfRxLza9Vah+KUIpDhF3FHMKCaHeIlF0Pczl+fQfXb03D1V5LX2O
 zK5ZJKxoVYbnx0eQFYTu8rNrjoEADspCGGtOM6uXhS7zEx1NcIcJZ7qsynwkQTaHd+PW
 Y77RHZAW7UlQr6leDyonaCxjkiAaI7f2OqITmC4lGKplXaHihegyzIfwd4poFwdJc1fi
 LLh0xvpm5Nxpkp6O9uJbInmaSpiDHATX9zRcWLrUkELRFv4rj6jbT2dDcEkKspjPpWwv
 kDG05YyGEFKGGlMeOEV2Y6kprwJzpfpvOvnUtliFU8mGSm8qRoG7NZRr5PnCJAPA8t9+
 Psaw==
X-Gm-Message-State: AOAM5332j+Lh4OV8WJwZV2HRJkLHLZ/NMh2njLtmIfRvb0xfm16BQCvC
 m4h9mFhiELafmTb9jKl8Crg4aw==
X-Google-Smtp-Source: ABdhPJxbIMavCBh55V8iWCnGjzV8EOJfy9bGnqV2NbUt8wggKrAvSL1Pd11a9RjPE+B2TkXi099IMA==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr3714062wmc.150.1631108973796; 
 Wed, 08 Sep 2021 06:49:33 -0700 (PDT)
Received: from [192.168.1.12] (host-92-17-50-173.as13285.net. [92.17.50.173])
 by smtp.gmail.com with ESMTPSA id
 w1sm2193690wmc.19.2021.09.08.06.49.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 06:49:33 -0700 (PDT)
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>
Cc: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek
 <jonathan@marek.ca>, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
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
From: Caleb Connolly <caleb.connolly@linaro.org>
Message-ID: <076cb487-7929-2af4-b2c0-385cd731ee48@linaro.org>
Date: Wed, 8 Sep 2021 14:49:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTgeIuwumPoR9ZTE@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/09/2021 03:21, Bjorn Andersson wrote:
> On Mon 09 Aug 10:26 PDT 2021, Akhil P Oommen wrote:
> 
>> On 8/9/2021 9:48 PM, Caleb Connolly wrote:
>>>
>>>
>>> On 09/08/2021 17:12, Rob Clark wrote:
>>>> On Mon, Aug 9, 2021 at 7:52 AM Akhil P Oommen
>>>> <akhilpo@codeaurora.org> wrote:
> [..]
>>>>> I am a bit confused. We don't define a power domain for gpu in dt,
>>>>> correct? Then what exactly set_opp do here? Do you think this usleep is
>>>>> what is helping here somehow to mask the issue?
>>> The power domains (for cx and gx) are defined in the GMU DT, the OPPs in
>>> the GPU DT. For the sake of simplicity I'll refer to the lowest
>>> frequency (257000000) and OPP level (RPMH_REGULATOR_LEVEL_LOW_SVS) as
>>> the "min" state, and the highest frequency (710000000) and OPP level
>>> (RPMH_REGULATOR_LEVEL_TURBO_L1) as the "max" state. These are defined in
>>> sdm845.dtsi under the gpu node.
>>>
>>> The new devfreq behaviour unmasks what I think is a driver bug, it
>>> inadvertently puts much more strain on the GPU regulators than they
>>> usually get. With the new behaviour the GPU jumps from it's min state to
>>> the max state and back again extremely rapidly under workloads as small
>>> as refreshing UI. Where previously the GPU would rarely if ever go above
>>> 342MHz when interacting with the device, it now jumps between min and
>>> max many times per second.
>>>
>>> If my understanding is correct, the current implementation of the GMU
>>> set freq is the following:
>>>    - Get OPP for frequency to set
>>>    - Push the frequency to the GMU - immediately updating the core clock
>>>    - Call dev_pm_opp_set_opp() which triggers a notify chain, this winds
>>> up somewhere in power management code and causes the gx regulator level
>>> to be updated
>>
>> Nope. dev_pm_opp_set_opp() sets the bandwidth for gpu and nothing else. We
>> were using a different api earlier which got deprecated -
>> dev_pm_opp_set_bw().
>>
> 
> On the Lenovo Yoga C630 this is reproduced by starting alacritty and if
> I'm lucky I managed to hit a few keys before it crashes, so I spent a
> few hours looking into this as well...
> 
> As you say, the dev_pm_opp_set_opp() will only cast a interconnect vote.
> The opp-level is just there for show and isn't used by anything, at
> least not on 845.
> 
> Further more, I'm missing something in my tree, so the interconnect
> doesn't hit sync_state, and as such we're not actually scaling the
> buses. So the problem is not that Linux doesn't turn on the buses in
> time.
> 
> So I suspect that the "AHB bus error" isn't saying that we turned off
> the bus, but rather that the GPU becomes unstable or something of that
> sort.
> 
> 
> Lastly, I reverted 9bc95570175a ("drm/msm: Devfreq tuning") and ran
> Aquarium for 20 minutes without a problem. I then switched the gpu
> devfreq governor to "userspace" and ran the following:
> 
> while true; do
>    echo 257000000 > /sys/class/devfreq/5000000.gpu/userspace/set_freq
>    echo 710000000 > /sys/class/devfreq/5000000.gpu/userspace/set_freq
> done
> 
> It took 19 iterations of this loop to crash the GPU.
> 
> So the problem doesn't seem to be Rob's change, it's just that prior to
> it the chance to hitting it is way lower. Question is still what it is
> that we're triggering.

Do the opp-levels in DTS represent how the hardware behaves? If so then it does just
appear to be that whatever is responsible for scaling the GX rail voltage
has no time limits and will attempt to switch the regulator between min/max
voltage as often as we tell it to which is probably not something the hardware expected.
> 
> Regards,
> Bjorn
> 

-- 
Kind Regards,
Caleb (they/them)
