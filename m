Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E93095A28DA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 15:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF1710E920;
	Fri, 26 Aug 2022 13:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9C410E910
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 13:52:15 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bq23so2081089lfb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 06:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=lTzV7n7YCX+2rNWBDGnjMopVLA2KjEwwfdhSN/SUuIQ=;
 b=v4orgEt+Ur+7MTTMWfRNCAhqjJWT7FuDT9PJ32ngcplFQEi/WHUTZS4Ej5BZaqnY6k
 7sSPLlNmeQ5rWJVLzjU1VC4dv6dWPPaugV8iZNIHPh+xKD/wu1cHwznHOAJ6Dw8eQZ0V
 hzePykCuNsBJCZ/RGyMop4Ta5b92A2TucKtRsEbr7YGduAP4kjkR6qbmgr/OATyQNvlo
 pjHRaqUOPCczgXgMpzWnUBOmx/hcZ/CYq28w3Y8c7b214LkKMKBJcR6YKhus569Y7lHR
 blPOH0i2XZmlcbI97AyBHsrah0/t77fBK1rzKfVPkUUSECQ//jGXgkUklh0wmSJwB6bg
 U2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=lTzV7n7YCX+2rNWBDGnjMopVLA2KjEwwfdhSN/SUuIQ=;
 b=tSEe87fPggNgk0Sdp200E8x1ujl7UNtO5D9mD6ijQbovs6k0c3uAaZ35CbbuWINuZ1
 FsJmSqkHmZ/H9YMSPtMp3fR1ZM27D5URlgQIJc+qagbM6wpyWr+/OAvz3Ba5sYV0Cly8
 IJb9Uz9EnmSlHFxCYW/kZCN1/LmEvP6yErG3VGqwuHmq9/YcaOurXCvtRpLyirYwc4uE
 wJyAjcOhUv5XQQtxATEo55aGxPbC66HH7ENcUuhFqhoXZokfu6dJztmOBsK+qdqbf36r
 b0XGjQtParJktLBtOPU+GLZ7mZD/YGBdz53FW8qua1dynOxTKIOVuv2UeluyJ2R099dv
 pMFw==
X-Gm-Message-State: ACgBeo0vdQzeTptEGfLDAH2OrFUmidgZywBIzK9CGD6pA665EYAIvkN0
 VEU32czAU9YoxYiKtVEfbgj3WA==
X-Google-Smtp-Source: AA6agR5PK2neleXjNF0K3AJOAc0RaleB3Pq+FuSAeBmtSFLkJx+AxFxMsVP6Wp/QFsnK2NL3vjxsRA==
X-Received: by 2002:a05:6512:210b:b0:492:e4cb:b93a with SMTP id
 q11-20020a056512210b00b00492e4cbb93amr2457810lfr.601.1661521933823; 
 Fri, 26 Aug 2022 06:52:13 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a2eb5c1000000b0026181467eb4sm472629ljn.114.2022.08.26.06.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 06:52:13 -0700 (PDT)
Message-ID: <648214d3-df31-9554-7b42-c69d72fe1ba9@linaro.org>
Date: Fri, 26 Aug 2022 16:52:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [RFC] drm/bridge: adv7533: remove dynamic lane switching from
 adv7533 bridge
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1660005330-12369-1-git-send-email-quic_abhinavk@quicinc.com>
 <YvK4SpvF0zwtaIM9@pendragon.ideasonboard.com>
 <2933a555-d000-3fc3-5336-778238545b80@linaro.org>
 <ef88ed87-fd32-5c50-d220-fd43b238bd7c@linaro.org>
 <Ywi0u4E5+MUx9wCk@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Ywi0u4E5+MUx9wCk@pendragon.ideasonboard.com>
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
Cc: jernej.skrabec@gmail.com, andrzej.hajda@intel.com, narmstrong@baylibre.com,
 airlied@linux.ie, sam@ravnborg.org, jonas@kwiboo.se,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, robert.foss@linaro.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com, colin.king@intel.com,
 freedreno@lists.freedesktop.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/08/2022 14:55, Laurent Pinchart wrote:
> Hello,
> 
> On Fri, Aug 26, 2022 at 01:17:43PM +0300, Dmitry Baryshkov wrote:
>> On 22/08/2022 19:31, Dmitry Baryshkov wrote:
>>> On 09/08/2022 22:40, Laurent Pinchart wrote:
>>>> On Mon, Aug 08, 2022 at 05:35:30PM -0700, Abhinav Kumar wrote:
>>>>> adv7533 bridge tries to dynamically switch lanes based on the
>>>>> mode by detaching and attaching the mipi dsi device.
>>>>>
>>>>> This approach is incorrect because as per the DSI spec the
>>>>> number of lanes is fixed at the time of system design or initial
>>>>> configuration and may not change dynamically.
>>>>
>>>> Is that really so ? The number of lanes connected on the board is
>>>> certainlyset at design time, but a lower number of lanes can be used at
>>>> runtime. It shouldn't change dynamically while the display is on, but it
>>>> could change at mode set time.
>>>
>>> I'm not sure if I interpreted the standard correctly, but I tended to
>>> have the same interpretation as Abhinav did.
>>>
>>> Anyway, even if we allow the drivers to switch the amount of lanes, this
>>> should not happen in the form of detach()/attach() cycle. The drivers
> 
> Agreed.
> 
>>> use mipi_dsi_attach() as way to signal the DSI hosts that the sink
>>> device is ready. Some of DSI hosts (including MSM one) would bind
>>> components from the attach callback.
>>>
>>> If we were to support dynamically changing the amount of lanes, I would
>>> ask for additional mipi_dsi API call telling the host to switch the
>>> amount of lanes. And note that this can open the can of worms. Different
>>> hosts might have different requirements here. For example for the MSM
>>> platform the amount of lanes is programmed during bridge_pre_enable
>>> chain call, so it is possible to just set the amount of lanes following
>>> the msm_dsi_device::lanes. Other hosts might have other requirements.
> 
> Conceptually, I would expect the number of effective lanes to be
> selected at mode set time, because it has to be done while the output is
> disabled.

There is one tightly coupled question. The dual-DSI (or bonded-DSI) 
mode. Currently it is exposed as two independent DSI hosts. If we allow 
changing the amount of DSI lanes at runtime, bonded DSI mode would 
become complicated by fixing amount of lanes for each of outputs (or 
switching them in tight loop). And then comes the question of switching 
between single-DSI and bonded-DSI at runtime.

> With the atomic API for bridges the .mode_set() operation is
> deprecated, so .pre_enable() sounds best, but there's a potential issue:
> the .pre_enable() operation is called from sink to source. It means that
> a DSI sink .pre_enable() operation would need to call a DSI host
> operation to set (or maybe negotiate instead of just setting a fixed
> value) the number of lanes first if it wants to control the sink through
> DCS at .pre_enable() time. We'd have to see how that fits.

What is the fate of the patchset that implemented 'parent-first' opt-in 
for the drm_bridge chains? It was supposed to solve this this kind of 
issues. I'm asking because until it is merged some DSI hosts (e.g. the 
msm dsi) turn on the power in .mode_set() to allow the pre_enable() 
callbacks work when the DSI link is in LP11 mode.

Back then I voted for the explicit mipi_dsi_power_on kind of calls, 
which would allow the sink bridge to prepare for the DSI powerup (e.g. 
by setting the amount of lanes), power up the DSI host, putting the link 
into LP11 and after that communicate with the sink using the DSI data 
lanes.

> 
>>> Thus said I'd suggest accepting this patch and maybe working on the
>>> API/support for the lane switching as a followup.
> 
> I don't have a personal need for the ADV7533 so I won't really complain
> about any potential regression this may introduce (given that it fixes a
> deadlock maybe things are completely broken already and nothing can
> regress). I'd like to see this fixed though, doing it as a follow up is
> too often a way to avoid doing it at all :-)

I don't know if this sounds like a promise, we are supporting several 
devices which use adv75xx (including famous dragonboard410c and less 
known Inforce ifc6510). So it might be (*) in our interest to restore 
this functionality. However as it requires adding additional API, design 
& negotiations might take some time.

(*) might be if it limits the functionality of the device by limiting 
support for different modes. If not... why care then?


> In any case, the commit message should be reworded to explain the
> rationale and what needs to be done. Adding a TODO or FIXME comment in
> the code would also help.
> 

-- 
With best wishes
Dmitry

