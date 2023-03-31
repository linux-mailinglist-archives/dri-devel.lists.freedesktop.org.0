Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F27F6D1B86
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF6610F15E;
	Fri, 31 Mar 2023 09:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA4B10F163
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:12:11 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so14894021wmq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 02:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680253930;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=i4thSwDiXLA3gkDJnYvjvujNMO/o2OKEhGcuq2D7Pfg=;
 b=VMr5dvyNW9RJTXlRTRQD+t+qBWvvOx8N43jhhw/m+GZ7M800L+4y2JTClbCQlZHu6g
 eAbAJmAbJDJMYqD2iHOCGoxncIpDIuEezgsfHbIzJXczP35KPR/Q5+ewjH4yNt2iAe/W
 XLWadnQUfhIg24Hr7vhMUdXknyj8kakRquJTKxVte7LSVqfaZ7qD2svT10jaBMeYPR7z
 RLRlYlcCS0XMOvYzRuPFNqqqci/OTNCN5r+9GaMWKHQSoU5S80wpid5zanBgt3as+8io
 q3guKA+Gaw4rBZ/mbCNWfJqU/S/zD5+0zGT9bQD091DMTtWc7hQw03BSfks6UrPcCkMo
 G4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680253930;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i4thSwDiXLA3gkDJnYvjvujNMO/o2OKEhGcuq2D7Pfg=;
 b=0dqZAJ5ND5OpS98OkU3X52ipwrFdj+16jsVhtxyYUlAaZJ8BRy8V1xxvxNXKmjEry+
 wEcmQ/kS5K3I0uFRrPR5PwPyP6lasvYQIlb88aAyzIzUaR1N2o80s93ST0jVIu1Fvu1C
 o7dG/hs5RviLqXshsQu7FaitBJXgX1ADVgJ5LHranySfjgst9txW76h1o6UN47qLzCYp
 s1KwhiZe9AiKVax8xRGFiJA1pF8VCsv0gDx/l8ZRs/sdHlxBFf6k1HBOaxygz1RMjFNt
 363FjSCgZ+IFLK7DhCyc2ElC5NmgIZBKbbg6XXqh3A5NuX0PX8LUlMLFFe7YQz8LUzxV
 Ci6w==
X-Gm-Message-State: AO0yUKXnAjj0+8jnAe5j1+KGiX0S6U81uxKRo48ssDJfwMPsGJXqGG6v
 LeiVLNDuWic3CXexgf/s7dRxhsHaWgesgqkorgevdQ==
X-Google-Smtp-Source: AK7set89SbsMZBaWTSeTQsZzf6AN0otVzApRZKiZpDJhgHdd/+5eZull8XGw1I0Q7dbrbrhLprOKqg==
X-Received: by 2002:a05:600c:2312:b0:3ee:b3bf:5f7c with SMTP id
 18-20020a05600c231200b003eeb3bf5f7cmr20162839wmo.23.1680253929961; 
 Fri, 31 Mar 2023 02:12:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0?
 ([2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c4f8200b003ef5e5f93f5sm9141705wmq.19.2023.03.31.02.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 02:12:09 -0700 (PDT)
Message-ID: <fc931920-67cd-e776-8f4d-444ade4afcef@linaro.org>
Date: Fri, 31 Mar 2023 11:12:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 10/12] drm/bridge: Implement enable_next_first to alter
 bridge init order
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20230329131929.1328612-1-jagan@amarulasolutions.com>
 <CAPY8ntCJP53uiGNQHUZqma08Vsxfwm7KvAkgMzK=hn4AxJLS3A@mail.gmail.com>
 <20230329164638.v43la4l7rxut6hk6@penduick>
 <CAMty3ZCsn6OR1-TvqFXP48iamG-k5sPU1_CH2fNLBQP3Ofb0QA@mail.gmail.com>
 <CAPY8ntCpmKPzPVjRWS7Pf1Fat9V_JqGD4BaMo8P8_o+74DeDiQ@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAPY8ntCpmKPzPVjRWS7Pf1Fat9V_JqGD4BaMo8P8_o+74DeDiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 12:01, Dave Stevenson wrote:
> Hi Jagan
> 
> On Thu, 30 Mar 2023 at 07:56, Jagan Teki <jagan@amarulasolutions.com> wrote:
>>
>> On Wed, Mar 29, 2023 at 10:16 PM Maxime Ripard <maxime@cerno.tech> wrote:
>>>
>>> On Wed, Mar 29, 2023 at 05:28:28PM +0100, Dave Stevenson wrote:
>>>> On Wed, 29 Mar 2023 at 14:19, Jagan Teki <jagan@amarulasolutions.com> wrote:
>>>>>
>>>>> DSI sink devices typically send the MIPI-DCS commands to the DSI host
>>>>> via general MIPI_DSI_DCS read and write API.
>>>>>
>>>>> The classical DSI sequence mentioned that the DSI host receives MIPI-DCS
>>>>> commands from the DSI sink first in order to switch HS mode properly.
>>>>> Once the DSI host switches to HS mode any MIPI-DCS commands from the
>>>>> DSI sink are unfunctional.
>>>>
>>>> That statement contradicts the spec.
>>>> The DSI spec section 8.11.1 Transmission Packet Sequences says that
>>>> during any BLLP (Blanking or Low Power) period the host can do any of:
>>>> - remain in LP-11
>>>> - transmit one or more non-video packets from host to peripheral in escape mode
>>>> - transmit one or more non-video packets from host to peripheral in
>>>> using HS mode
>>>> - receive one or more packets from peripheral to host using escape mode
>>>> - transmit data on a different virtual channel.
>>>>
>>>> Indeed if the sink doesn't set MIPI_DSI_MODE_LPM /
>>>> MIPI_DSI_MSG_USE_LPM, then the expectation is that any data transfer
>>>> will be in HS mode.
>>>>
>>>> That makes me confused as to the need for this patch.
>>>
>>> Yeah, and it looks like that would break the expectation that, in
>>> enable, a bridge can expect its controller to be in HS mode.
>>>
>>> I think that was Jagan is trying to do is to work around an issue with
>>> the Allwinner DSI driver:
>>> https://elixir.bootlin.com/linux/v6.3-rc4/source/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c#L775
>>
>> Correct and I can see it seems to be a classic DSI sequence observed
>> in dw-mipi-dsi as well - based on Neil's comments.
>> https://lore.kernel.org/all/9aa3d19d-4378-aaf3-6857-c40be5d252c7@baylibre.com/
> 
> Neil's comments are from 2021, and his response would appear to be
> with regard the PHY power up sequence issues that
> pre_enable_prev_first should solve. The DSI host pre_enable can now be
> called before the sink's pre_enable, therefore allowing the PHY to be
> configured in pre_enable. Hacking the PHY init into mode_set is
> therefore not required.

Yes this part is not solved, but is seems the assumption the DSI controller
can switch to HS to LS & then to HS back after a command while in video mode
isn't true in the Allwinner's case. As I understood it's one of the problems.

We're hitting a limit of the DSI controller model in Linux where we cannot
express all the DSI capabilities (Video mode, Command mode, dynamic framerate
switching, DSC, ...) since from the Panel or Bridge PoV we're blind and
we do not know what are the features supported by the DSI controller and
we lack knowledge of any operation mode we must try to achieve.

> 
> I don't see any restriction in dw-mipi-dsi over when transfer can be
> called (as long as it is between pre_enable and post_disable), and it
> supports MIPI_DSI_MSG_USE_LPM for requesting the command be sent in
> either LP or HS mode.
> 
>> In fact, I did follow and initialize the command-mode mode_set which
>> set low-speed DCS and switch back to video-mode @enable and switch to
>> HS but could see the same issue as the host cannot accept DCS as
>> before (I might implement improper sequence, but not sure due to lack
>> of documentation). But this sequence has issues with calling
>> post_disable twice even on dw-mipi-dsi.
> 
> Calling up/down the bridge chain from within other bridge elements is
> going to have issues and shouldn't be necessary.
> 
> The comment in dw-mipi-dsi post_disable[1]
> * TODO Only way found to call panel-bridge post_disable &
> * panel unprepare before the dsi "final" disable...
> * This needs to be fixed in the drm_bridge framework and the API
> * needs to be updated to manage our own call chains...
> 
> It has now been fixed up with pre_enable_prev_first.
> 
> I seem to recall seeing a patchset for one of the DSI hosts (other
> than vc4) that was moving the init from mode_set to pre_enable - I
> think it is probably [2] for msm.
> 
> Cheers
>    Dave
> 
> [1] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L862-L867
> [2] https://github.com/torvalds/linux/commit/ec7981e6c614254937b37ce0af9eac09901c05c5
> 
>> May be Neill, can comment here?
>>
>> Thanks,
>> Jagan.

