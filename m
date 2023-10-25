Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B83AB7D7094
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 17:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8021510E6AA;
	Wed, 25 Oct 2023 15:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A227110E6A0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 15:16:18 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-507e85ebf50so6632090e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 08:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698246977; x=1698851777; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Td1Qp2jEYN6EwIlzvrnD5w5N2Jcs878/iCYHd4DtvAU=;
 b=wbBB/K7wvXpPm2b8LVoYbYa8Qkm6o4GrjQoNvzVR+vgg6WRjretT6AfcxNtTneH+Vo
 jMtRVE0vVzranosa/ZBE5F85lPh+v6JZzkGvFMwckXiNJZRRiDXdmqC1dXsPLGouq+l3
 qA41ZEFRyh3SzNy27zZIdHQ4SR6p7RImQTCoO+k3FJkh3P7D37Sqj4SUMEyZ0hWZV6Ku
 pNhYLEbXDVj2GWUuN5S0l8m14hae/V01fjvudWhQ/T3f115PFQh7kriGqx4tbHubOeHS
 w0LCpxpBRqvooe1QgnM268CO7Nav6zZN47F0cONHoE4JX2YghbDSMx1ex8qXpiqgYU88
 rTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698246977; x=1698851777;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Td1Qp2jEYN6EwIlzvrnD5w5N2Jcs878/iCYHd4DtvAU=;
 b=mw4EmJQm+LZekFhzGUZjMQ1KsugC8a3szV1Ob/zeKUbKDUZXIn5yY8kmb2W6LRPtHa
 QMK4nxshgEb+rdI2iXczZYRHRDmiHdI3QYEjf80fhcPUMi6vBQMiJd+M6iZ8KOanG8R7
 7e1TASKkk7Bpgfk07Z7c9gAE+nn5hU63xWIldGpx+D+L5SqveBwfk5r5GpKCZ/G1res0
 9LXxSQMpFcDYk9VqEsGd0VUnWcaZgEJgekEmet/owjxrAS+E0MHt5zmbCJOeBMi9vH0a
 4pishloV18lBizHvVbiK6mh3BRYGxTGLsNx1Gcp7yJofDSoK80zNdzLDbMk4mALc3tZh
 oTOA==
X-Gm-Message-State: AOJu0YyGEeg2E6y4uCVkkFqWlaKXSng4HGS5BF+yc+G0TZlTN7jKLW90
 MoSQNAzxmBRPYOpSIdLHt7dDCQ==
X-Google-Smtp-Source: AGHT+IFU0aD6A6CHpv9y7jOR2dZ44pugJWs69QC07vhVJ3EOmVWLtgzjKARGyA2TIeyVSr1x2sn0Dw==
X-Received: by 2002:a05:6512:71:b0:507:a6b2:c63e with SMTP id
 i17-20020a056512007100b00507a6b2c63emr9706041lfo.53.1698246976791; 
 Wed, 25 Oct 2023 08:16:16 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 v26-20020ac258fa000000b00507a3b8b008sm2586135lfo.112.2023.10.25.08.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 08:16:16 -0700 (PDT)
Message-ID: <1696f131-83fb-4d0c-b4d7-0bdb61e4ae65@linaro.org>
Date: Wed, 25 Oct 2023 18:16:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
Content-Language: en-GB
To: Maxime Ripard <mripard@kernel.org>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
 <20231016165355.1327217-4-dmitry.baryshkov@linaro.org>
 <7e4ak4e77fp5dat2aopyq3g4wnqu3tt7di7ytdr3dvgjviyhrd@vqiqx6iso6vg>
 <CAA8EJpp48AdJmx_U=bEJZUWZgOiT1Ctz6Lpe9QwjLXkMQvsw5w@mail.gmail.com>
 <uj6rtlionmacnwlqxy6ejt5iaczgbbe5z54ipte5ffbixcx3p4@pps7fcr3uqhf>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <uj6rtlionmacnwlqxy6ejt5iaczgbbe5z54ipte5ffbixcx3p4@pps7fcr3uqhf>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Marek Vasut <marex@denx.de>,
 Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/10/2023 15:44, Maxime Ripard wrote:
> On Thu, Oct 19, 2023 at 02:19:51PM +0300, Dmitry Baryshkov wrote:
>> On Thu, 19 Oct 2023 at 12:26, Maxime Ripard <mripard@kernel.org> wrote:
>>>
>>> On Mon, Oct 16, 2023 at 07:53:48PM +0300, Dmitry Baryshkov wrote:
>>>> The MIPI DSI links do not fully fall into the DRM callbacks model.
>>>
>>> Explaining why would help
>>
>> A kind of explanation comes afterwards, but probably I should change
>> the order of the phrases and expand it:
>>
>> The atomic_pre_enable / atomic_enable and correspondingly
>> atomic_disable / atomic_post_disable expect that the bridge links
>> follow a simple paradigm: either it is off, or it is on and streaming
>> video. Thus, it is fine to just enable the link at the enable time,
>> doing some preparations during the pre_enable.
>>
>> But then it causes several issues with DSI. First, some of the DSI
>> bridges and most of the DSI panels would like to send commands over
>> the DSI link to setup the device.
> 
> What prevent them from doing it in enable when the link is enabled?
> 
>> Next, some of the DSI hosts have limitations on sending the commands.
>> The proverbial sunxi DSI host can not send DSI commands after the
>> video stream has started. Thus most of the panels have opted to send
>> all DSI commands from pre_enable (or prepare) callback (before the
>> video stream has started).
> 
> I'm not sure we should account for a single driver when designing a
> framework. We should focus on designing something sound, and then making
> that driver work with whatever we designed, but not the other way
> around. And if we can't, we should get rid of that driver because it's
> de-facto unmaintainable. And I'm saying that as the author of that
> driver.

That's not the only driver with strange peculiarities. For example, see 
commit 8a4b2fc9c91a ("drm/bridge: tc358762: Split register programming 
from pre-enable to enable"), which was one of the issues that actually 
prompted me to send this this patchset (after my previous version of 
this patch being rejected because of sunxi).

> 
>> However this leaves no good place for the DSI host to power up the DSI
>> link. By default the host's pre_enable callback is called after the
>> DSI bridge's pre_enable. For quite some time we were powering up the
>> DSI link from mode_set. This doesn't look fully correct.
> 
> Yeah, it's not.
> 
>> And also we got into the issue with ps8640 bridge, which requires for
>> the DSI link to be quiet / unpowered at the bridge's reset time.
>>
>> Dave has come with the idea of pre_enable_prev_first /
>> prepare_prev_first flags, which attempt to solve the issue by
>> reversing the order of pre_enable callbacks. This mostly solves the
>> issue. However during this cycle it became obvious that this approach
>> is not ideal too. There is no way for the DSI host to know whether the
>> DSI panel / bridge has been updated to use this flag or not, see the
>> discussion at [1].
> 
> Yeah. Well, that happens. I kind of disagree with Neil here though when
> he says that "A panel driver should not depend on features of a DSI
> controller". Panels definitely rely on particular features, like the
> number of lanes, the modes supported, etc.

In the mentioned discussion it was more about 'DSI host should not 
assume panel driver features', like the panel sending commands in 
pre_enable or not, or having pre_enable_prev_first.

So the pre_enable_prev_first clearly lacks feature negotiation.


> 
> Panels shouldn't depend on a particular driver *behaviour*. But the
> features are fine.
> 
> For our particular discussion, I think that that kind of discussion is a
> dead-end, and we just shouldn't worry about it. Yes, some panels have
> not yet been updated to take the new flags into account. However, the
> proper thing to do is to update them if we see a problem with that (and
> thus move forward to the ideal solution), not revert the beginning of
> that feature enablement (thus moving away from where we want to end up
> in).
> 
>> Thus comes this proposal. It allows for the panels to explicitly bring
>> the link up and down at the correct time, it supports automatic use
>> case, where no special handling is required. And last, but not least,
>> it allows the DSI host to note that the bridge / panel were not
>> updated to follow new protocol and thus the link should be powered on
>> at the mode_set time. This leaves us with the possibility of dropping
>> support for this workaround once all in-kernel drivers are updated.
> 
> I'm kind of skeptical for these kind of claims that everything will be
> automatic and will be handled fine. What if we have conflicting
> requirements, for example two bridges drivers that would request the
> power up at different times?

Well, we do not support DSI sublinks, do we?

> 
> Also, we would still need to update every single panel driver, which is
> going to create a lot of boilerplate that people might get wrong.

Yes, quite unfortunately. Another approach that I have in mind is to add 
two callbacks to mipi_dsi_device. This way the DSI host will call into 
the device to initialise it once the link has been powered up and just 
before tearing it down. We solve a lot of problems this way, no 
boilerplate and the panel / bridge are in control of the initialisation 
procedure. WDYT?

> I have the feeling that we should lay out the problem without talking
> about any existing code base first. So, what does the MIPI-DSI spec
> requires and what does panels and bridges expect?

There is not that much in the DSI spec (or maybe I do not understand the 
question). The spec is more about the power states and the commands. Our 
problem is that this doesn't fully match kernel expectations.

-- 
With best wishes
Dmitry

