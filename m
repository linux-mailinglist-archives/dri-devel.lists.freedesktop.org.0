Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9675626F9F
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 14:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582AA10E088;
	Sun, 13 Nov 2022 13:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CB510E088
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 13:06:44 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id a15so9738262ljb.7
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 05:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bg2KmiI76U4Ti0aZEk6xjJDTuRTut6Y+EHhsa95b5oY=;
 b=DwzzemF5LFztYxgctPsOQw/8nRByZ4FKAEJdT9nAPbSho6AKSV7Z/JykwSd6Ywl7V4
 rS4zLu3x6E9LPEk4w9oAnYJ7fR21HPe8f5f92NDK+vSAMFbM/s94kaMobiAzHa6bJ3Bl
 MaHhWLG/Kdu2s1pp3hwxAcrUQm5SXVFJxHqNwFcxiovysrlEWPEGpGlP0GbB5ETzdWBD
 YMxJKcWxnBBI3/2rLw05zbcjjarXyy9Qa9qGsGUF3zNzPwCObl3fHFqGqCtUPljxRa7w
 Z6/4pzldxenGG3J0bKfKI0kp/BJ4cw0QVKOe4yzVZBq0RrCO9+B7mJWd+BIf5Ip+I+oq
 MDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bg2KmiI76U4Ti0aZEk6xjJDTuRTut6Y+EHhsa95b5oY=;
 b=bgB2jsq6PezAKTEPeH+c6TyKBlgDHccdCW1rJAxvpSgGfX3+gg8/f1amuFcF/2wvhW
 zHJsmHYJ6ScT1mS+oe0lKc9j5Cb0uZfqCIkBIkjGj+k1AwrtiTzhvTXn4OrKlq86MIC/
 aebCRjD/EeLWjU3z4fJSrPk4MeCZ0+2Xh6PNIaIFMnb7wDmUA4qEH+0lVgW1sxWwfijA
 sImJwyYLKMrxrWM7lxHvY1Fgpu5GV0QfT/H0eWCNUu8ocNKfBeFVRoQKC6X5jfMFevKs
 R9Rla4ktSOfEKzxbGXAw9d/FBcbPdTUEVB51kT9OxEgiH1japwiXnjHrUgvE4VBwoyjo
 3gWw==
X-Gm-Message-State: ANoB5pklt0o/iSzOrC++0R8BaszP5TpDN9JA+2ICP1tFpSno8cHHGiwT
 fWPyt7ZzWCpcHwU8mt1rmPm6+Q==
X-Google-Smtp-Source: AA0mqf5iZ3L5DrafYgbQ34vvz+riwftXcJxAHd/q9n2bZkcTvWvLMXcFnlR1j2uCVTJ9ySH7n1b8vw==
X-Received: by 2002:a2e:be8a:0:b0:277:710f:f973 with SMTP id
 a10-20020a2ebe8a000000b00277710ff973mr2903088ljr.74.1668344802403; 
 Sun, 13 Nov 2022 05:06:42 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 f21-20020ac25cd5000000b004a01105eea2sm1359389lfq.150.2022.11.13.05.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Nov 2022 05:06:41 -0800 (PST)
Message-ID: <0c472bfe-8faa-32b4-fe6e-c52a4cb74681@linaro.org>
Date: Sun, 13 Nov 2022 16:06:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
Content-Language: en-GB
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <YtXIEg0rRZLLYS75@ravnborg.org>
 <CAPY8ntCfXuZ6nPcJ77FLP5bgdcbXOeh-7rieb5PS-7oPFg7xnQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAPY8ntCfXuZ6nPcJ77FLP5bgdcbXOeh-7rieb5PS-7oPFg7xnQ@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Caleb Connolly <caleb.connolly@linaro.org>, andrzej.hajda@gmail.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On 19/07/2022 16:45, Dave Stevenson wrote:
> Hi Sam
> 
> On Mon, 18 Jul 2022 at 21:52, Sam Ravnborg <sam@ravnborg.org> wrote:
>>
>> Hi Dave,
>>
>> a long overdue reply on this series.
>>
>> On Fri, Mar 04, 2022 at 03:17:55PM +0000, Dave Stevenson wrote:
>>> Hi All
>>>
>>> Changes from v1:
>>> - New patch to refactor drm_bridge_chain_post_disable and drm_bridge_chain_pre_enable
>>>    to reuse drm_atomic_bridge_chain_post_disable / drm_atomic_bridge_chain_pre_enable
>>>    but with a NULL state.
>>> - New patch that adds a pre_enable_upstream_first to drm_panel.
>>> - changed from an OPS flag to a bool "pre_enable_upstream_first" in drm_bridge.
>>> - Followed Andrzej's suggestion of using continue in the main loop to avoid
>>>    needing 2 additional loops (one forward to find the last bridge wanting
>>>    upstream first, and the second backwards again).
>>> - Actioned Laurent's review comments on docs patch.
>>>
>>> Original cover letter:
>>>
>>> Hopefully I've cc'ed all those that have bashed this problem around previously,
>>> or are otherwise linked to DRM bridges.
>>>
>>> There have been numerous discussions around how DSI support is currently broken
>>> as it doesn't support initialising the PHY to LP-11 and potentially the clock
>>> lane to HS prior to configuring the DSI peripheral. There is no op where the
>>> interface is initialised but HS video isn't also being sent.
>>> Currently you have:
>>> - peripheral pre_enable (host not initialised yet)
>>> - host pre_enable
>>> - encoder enable
>>> - host enable
>>> - peripheral enable (video already running)
>>>
>>> vc4 and exynos currently implement the DSI host as an encoder, and split the
>>> bridge_chain. This fails if you want to switch to being a bridge and/or use
>>> atomic calls as the state of all the elements split off are not added by
>>> drm_atomic_add_encoder_bridges.
>>
>> A typically chain looks like this:
>>
>> CRTC => Encoder => Bridge A => Bridge B
>>
>> We have in DRM bridges established what is the "next" bridge - indicated
>> with the direction of the arrows in the drawing.
>>
>> This set of patches introduces the concept of "upstream" bridges.
>>
>> pre_enable_prev_bridge_first would be easier to understand as it uses
>> the current terminology.
>> I get that "upstream" is used in the DSI specification - but we are
>> dealing with bridges that happens to support DSI and more, and mixing
>> the two terminologies is not good.
>>
>> Note: Upstream is also used in a bridge doc section - here it should
>>        most likely be updated too.
> 
> Sure, I have no issues with switching to prev/next from upstream/downstream.
> To the outsider it can be confusing - in pre_enable and disable, the
> next bridge to be called is the previous one. At least it is
> documented.
> 
>> The current approach set a flag that magically makes the core do something
>> else. Have you considered a much more explicit approach?
>>
>> A few helpers like:
>>
>>          drm_bridge_pre_enable_prev_bridge()
>>          drm_bridge_enable_prev_bridge()
>>          drm_bridge_disable_prev_bridge()
>>          drm_bridge_post_disable_prev_bridge()
> 
> No point in drm_bridge_enable_prev_bridge() and
> drm_bridge_post_disable_prev_bridge() as the call order down the chain
> will mean that they have already been called.
> drm_bridge_enable_next_bridge() and
> drm_bridge_post_disable_next_bridge() possibly.
> 
>> And then update the core so the relevant function is only called once
>> for a bridge.
>> Then the need for DSI lanes in LP-11 can be archived by a call to
>>
>>          drm_bridge_pre_enable_prev_bridge()
> 
> Unfortunately it gets ugly with post_disable.
> The DSI host controller post_disable will have been called before the
> DSI peripheral's post_disable, and there are conditions where the
> peripheral needs to send DSI commands in post_disable (eg
> panel-asus-z00t-tm5p5-n35596 [1]). Changing all DSI hosts to call
> drm_bridge_post_disable_next_bridge feels like the wrong thing to do.
> There are currently hacks in dw-mipi-dsi that do call the next
> panel/bridge post_disable [2] and it would be nice to get rid of them.
> Currently the calls aren't tracked for state, so you end up with
> post_disable being called twice, and panels having to track state (eg
> jdi_lt070me050000 [3]).
> 
> [1] tm5p5_nt35596_unprepare() calls tm5p5_nt35596_off()
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c#L107
> [2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L889
> [3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c#L44
> 
>> This is more explicit than a flag that triggers some magic behaviour.
>> It may even see uses we have not realised yet.
> 
> Personally it feels like more boilerplate in almost all DSI drivers,
> and generally I see a push to remove boilerplate.
> 
>> It is late here - so maybe the above is not a good idea tomorrow - but
>> right now I like the simplicity of it.
>>
>> Other than the above I read that a mipi_dsi_host_init() is planned,
>> which is also explicit and simple - good.
> 
> It's been raised, but the justification for most use cases hasn't been
> made. The Exynos conversion looks to be doing the wrong thing in
> checking state, and that's why it is currently needing it.
> Again it's also more boilerplate.
> 
> TC358767 is an odd one as it wants the DSI interface enabled very
> early in order to have a clock for the DP aux channel well before
> video is running. I had a thought on that, but It looks like I haven't
> hit send on a reply to Lucas on that one - too many distractions.
> 
>> Have we seen a new revision of some of these?
>> Chances are high that I have missed it then.
> 
> No, still on V2. Other than Dmitry's comment over updating
> parade-ps8640 and dropping drm_bridge_chain_*, no real comments had
> been made.

It's been a while now. Do you still plan to pursue this patchset?

[personal notice: I'd prefer something less strange, e.g. an explicit 
calls to mipi_dsi_host, but as this patchset seems to fix the issues, 
I'm fine with it].

> 
>    Dave

-- 
With best wishes
Dmitry

