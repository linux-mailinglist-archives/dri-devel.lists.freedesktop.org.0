Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BED629BE9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 15:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09A810E402;
	Tue, 15 Nov 2022 14:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D0F10E15C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 14:21:35 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id j16so24595476lfe.12
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 06:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nffnf9Q28oIvlTSCKd5PVZQfzynL+6KmEWpLNwR055c=;
 b=ozX8DtpyceprskFSRB75qJflxMUgLPNYsVjR0lA1rbhyd+CIMEv82etjgy10N37onk
 HcoV7URPPg4x1GghAecmxbWY4pHENpeusXWI7KPq5gYK2nos6zPVdIO74D/cihLUeBj2
 yZ2Uxoq7OuFUFB7yzB4OGbUdFmCMfQZmEzdkDeRj70/sJJ0e6tpNae1c8wP6ueULxNyu
 NApuHoW8JlhIwQ6EkcxMCR2U+CFrS7+8czwW56rpmyMJaWnON6/sJIXrjQ2QxtnhZhu0
 AsKCQcXhcRgPxUoxrAuzkXitw7HQLeJrNV64ZNX9oUBeokjIUoLXEUyKOZhLtmnKU14z
 ZvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nffnf9Q28oIvlTSCKd5PVZQfzynL+6KmEWpLNwR055c=;
 b=7dZNQaR1jFNUcWsi6w3QblfcG9v8AcF1RjBqcd2K1NQJs4YGIZEpj5xZOfPBi4WJnZ
 gJeCfXPINtbNZe3i2oovFkB9yYu5PJq6sXSOdDOsFuQNRJwMBw1Ywo62bOTvi+MH9H2k
 0mqWmD0xepj9/S6Tt0aYW4HAATAzZ14TL2aFYjiCuVNoARvgpe+sOTqTts+pRVZrQtdf
 /n+2p3+z+L984IVQ9+nKY4ZNdPJXpb91xpsrsyikbpdLxCTGflv3ENyOz4iWVRhz3sRd
 1+3XDHSoQyApyCL85fbrZWDbbw8Nu5OvWfbm0WP3YNTCMIifFPqstv6vPu72cfbokBBI
 3gnQ==
X-Gm-Message-State: ANoB5pn+R0eb7I53v0hG87DVBB9tLSlQuejmH0FnavrMHIB7Q5U3+//a
 WpR/43gs8ADL+DBvwM0AC7xMRg==
X-Google-Smtp-Source: AA0mqf432iTjsXgBQzW4KdqMBIYZYpFhbT5NSDJ8rjjPvai8gHDEo52Gp1ZJnGqIAGRho/iOjVOVxA==
X-Received: by 2002:a05:6512:3a94:b0:4a2:3bbb:ad3f with SMTP id
 q20-20020a0565123a9400b004a23bbbad3fmr5603008lfu.524.1668522093286; 
 Tue, 15 Nov 2022 06:21:33 -0800 (PST)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id
 s25-20020a056512203900b004b0317a1035sm2229377lfs.109.2022.11.15.06.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 06:21:32 -0800 (PST)
Message-ID: <b2115a41-c8cc-7b06-b9c8-95e5cc3545a3@linaro.org>
Date: Tue, 15 Nov 2022 17:21:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
Content-Language: en-GB
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <YtXIEg0rRZLLYS75@ravnborg.org>
 <CAPY8ntCfXuZ6nPcJ77FLP5bgdcbXOeh-7rieb5PS-7oPFg7xnQ@mail.gmail.com>
 <0c472bfe-8faa-32b4-fe6e-c52a4cb74681@linaro.org>
 <CAPY8ntCN1YA6cRB80M_Dx9ZyxdRPhpdxZVPnkXmtzQG-gLyq7Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAPY8ntCN1YA6cRB80M_Dx9ZyxdRPhpdxZVPnkXmtzQG-gLyq7Q@mail.gmail.com>
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
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Caleb Connolly <caleb.connolly@linaro.org>, dri-devel@lists.freedesktop.org,
 andrzej.hajda@gmail.com, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/11/2022 17:14, Dave Stevenson wrote:
> Hi Dmitry
> 
> On Sun, 13 Nov 2022 at 13:06, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> Hi Dave,
>>
>> On 19/07/2022 16:45, Dave Stevenson wrote:
>>> Hi Sam
>>>
>>> On Mon, 18 Jul 2022 at 21:52, Sam Ravnborg <sam@ravnborg.org> wrote:
>>>>
>>>> Hi Dave,
>>>>
>>>> a long overdue reply on this series.
>>>>
>>>> On Fri, Mar 04, 2022 at 03:17:55PM +0000, Dave Stevenson wrote:
>>>>> Hi All
>>>>>
>>>>> Changes from v1:
>>>>> - New patch to refactor drm_bridge_chain_post_disable and drm_bridge_chain_pre_enable
>>>>>     to reuse drm_atomic_bridge_chain_post_disable / drm_atomic_bridge_chain_pre_enable
>>>>>     but with a NULL state.
>>>>> - New patch that adds a pre_enable_upstream_first to drm_panel.
>>>>> - changed from an OPS flag to a bool "pre_enable_upstream_first" in drm_bridge.
>>>>> - Followed Andrzej's suggestion of using continue in the main loop to avoid
>>>>>     needing 2 additional loops (one forward to find the last bridge wanting
>>>>>     upstream first, and the second backwards again).
>>>>> - Actioned Laurent's review comments on docs patch.
>>>>>
>>>>> Original cover letter:
>>>>>
>>>>> Hopefully I've cc'ed all those that have bashed this problem around previously,
>>>>> or are otherwise linked to DRM bridges.
>>>>>
>>>>> There have been numerous discussions around how DSI support is currently broken
>>>>> as it doesn't support initialising the PHY to LP-11 and potentially the clock
>>>>> lane to HS prior to configuring the DSI peripheral. There is no op where the
>>>>> interface is initialised but HS video isn't also being sent.
>>>>> Currently you have:
>>>>> - peripheral pre_enable (host not initialised yet)
>>>>> - host pre_enable
>>>>> - encoder enable
>>>>> - host enable
>>>>> - peripheral enable (video already running)
>>>>>
>>>>> vc4 and exynos currently implement the DSI host as an encoder, and split the
>>>>> bridge_chain. This fails if you want to switch to being a bridge and/or use
>>>>> atomic calls as the state of all the elements split off are not added by
>>>>> drm_atomic_add_encoder_bridges.
>>>>
>>>> A typically chain looks like this:
>>>>
>>>> CRTC => Encoder => Bridge A => Bridge B
>>>>
>>>> We have in DRM bridges established what is the "next" bridge - indicated
>>>> with the direction of the arrows in the drawing.
>>>>
>>>> This set of patches introduces the concept of "upstream" bridges.
>>>>
>>>> pre_enable_prev_bridge_first would be easier to understand as it uses
>>>> the current terminology.
>>>> I get that "upstream" is used in the DSI specification - but we are
>>>> dealing with bridges that happens to support DSI and more, and mixing
>>>> the two terminologies is not good.
>>>>
>>>> Note: Upstream is also used in a bridge doc section - here it should
>>>>         most likely be updated too.
>>>
>>> Sure, I have no issues with switching to prev/next from upstream/downstream.
>>> To the outsider it can be confusing - in pre_enable and disable, the
>>> next bridge to be called is the previous one. At least it is
>>> documented.
>>>
>>>> The current approach set a flag that magically makes the core do something
>>>> else. Have you considered a much more explicit approach?
>>>>
>>>> A few helpers like:
>>>>
>>>>           drm_bridge_pre_enable_prev_bridge()
>>>>           drm_bridge_enable_prev_bridge()
>>>>           drm_bridge_disable_prev_bridge()
>>>>           drm_bridge_post_disable_prev_bridge()
>>>
>>> No point in drm_bridge_enable_prev_bridge() and
>>> drm_bridge_post_disable_prev_bridge() as the call order down the chain
>>> will mean that they have already been called.
>>> drm_bridge_enable_next_bridge() and
>>> drm_bridge_post_disable_next_bridge() possibly.
>>>
>>>> And then update the core so the relevant function is only called once
>>>> for a bridge.
>>>> Then the need for DSI lanes in LP-11 can be archived by a call to
>>>>
>>>>           drm_bridge_pre_enable_prev_bridge()
>>>
>>> Unfortunately it gets ugly with post_disable.
>>> The DSI host controller post_disable will have been called before the
>>> DSI peripheral's post_disable, and there are conditions where the
>>> peripheral needs to send DSI commands in post_disable (eg
>>> panel-asus-z00t-tm5p5-n35596 [1]). Changing all DSI hosts to call
>>> drm_bridge_post_disable_next_bridge feels like the wrong thing to do.
>>> There are currently hacks in dw-mipi-dsi that do call the next
>>> panel/bridge post_disable [2] and it would be nice to get rid of them.
>>> Currently the calls aren't tracked for state, so you end up with
>>> post_disable being called twice, and panels having to track state (eg
>>> jdi_lt070me050000 [3]).
>>>
>>> [1] tm5p5_nt35596_unprepare() calls tm5p5_nt35596_off()
>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c#L107
>>> [2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L889
>>> [3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c#L44
>>>
>>>> This is more explicit than a flag that triggers some magic behaviour.
>>>> It may even see uses we have not realised yet.
>>>
>>> Personally it feels like more boilerplate in almost all DSI drivers,
>>> and generally I see a push to remove boilerplate.
>>>
>>>> It is late here - so maybe the above is not a good idea tomorrow - but
>>>> right now I like the simplicity of it.
>>>>
>>>> Other than the above I read that a mipi_dsi_host_init() is planned,
>>>> which is also explicit and simple - good.
>>>
>>> It's been raised, but the justification for most use cases hasn't been
>>> made. The Exynos conversion looks to be doing the wrong thing in
>>> checking state, and that's why it is currently needing it.
>>> Again it's also more boilerplate.
>>>
>>> TC358767 is an odd one as it wants the DSI interface enabled very
>>> early in order to have a clock for the DP aux channel well before
>>> video is running. I had a thought on that, but It looks like I haven't
>>> hit send on a reply to Lucas on that one - too many distractions.
>>>
>>>> Have we seen a new revision of some of these?
>>>> Chances are high that I have missed it then.
>>>
>>> No, still on V2. Other than Dmitry's comment over updating
>>> parade-ps8640 and dropping drm_bridge_chain_*, no real comments had
>>> been made.
>>
>> It's been a while now. Do you still plan to pursue this patchset?
> 
> If there was anything that could actually be worked on, then I'm happy
> to respin it, but if the approach is generally being rejected then I
> don't want to waste the effort.
> 
> I'm not totally clear who the maintainers are that the final arbiters
> and need to sign off on this.
> drm_bridge.c falls to Maarten, Maxime, and Thomas for "DRM DRIVERS AND
> MISC GPU PATCHES"
> drm_panel.c falls to Thierry and Sam for "DRM PANEL DRIVERS", and then
> Maarten, Maxime, and Thomas.
> Only Sam has responded publicly. I have had discussions with Maxime,
> but it's not directly his area of knowledge.
> 
> Looking at the patch series:
> Patch 1: Your comment "update parade-ps8640 to use
> drm_atomic_bridge_chain_". It looks like patchset [1] by Sam does
> this, but the patchset went wrong and is missing patches 8-11 and
> therefore hasn't been merged.
> Patch 2: Comment from Jagan that it's like an old patch. It has
> similarities, but isn't the same.
> Patch 3: R-b by you (thank you), but concerns from Jagan which I still
> don't understand. Without clarification on the issue and whether my
> suggested alternative place for the hook solves the issue, IMHO it's
> not worth respinning.
> Patch 4: R-b Laurent.
> 
> This cover note got totally subverted with Exynos issues.
> Sam did request use of prev / next instead of upstream / downstream,
> which can be done and perhaps warrants a respin now.
> 
>> [personal notice: I'd prefer something less strange, e.g. an explicit
>> calls to mipi_dsi_host, but as this patchset seems to fix the issues,
>> I'm fine with it].
> 
> That can fix the power up sequence, but how do you propose telling the
> DSI controller NOT to power down in post_disable before the DSI
> peripheral post_disable has potentially sent DCS commands - i.e. the
> case you were discussing on Friday in [2].

I thought that the same 'call the parent beforehand' switch applied to 
the deinit paths, didn't it?

> If a panel/bridge driver doesn't call mipi_dsi_host_init then the
> expectation must be that it will be called by the DSI controller's
> pre_enable, and deinit from post_disable. Likewise init & deinit would
> be called if host_transfer is used when the host isn't initialised.
> 
> If the panel/bridge driver explicitly calls mipi_dsi_host_init, then
> does that mandate that it must also call mipi_dsi_host_deinint. The
> controller post_disable is then effectively a no-op. This can be
> covered in documentation, but also leaves the potential for strange
> behaviour if the requirement is not followed, and I can't think of a
> nice place to drop a WARN to flag the issue in the driver.
> 
> 
> TBH The lack of interest in solving the issues almost makes me want to
> just document the total brokenness of it and throw in the towel.
> Seeing as we as Raspberry Pi run a vendor kernel, we can run with
> downstream patches until those who care finally make a decision for
> mainline. I'd prefer to solve it properly, but it requires some
> engagement from the community.

I see. I can probably try spinning a patchset doing explicit mipi_dsi 
calls. Let's see if it gains more attention.

It seems something is broken with respect to reviewing of core drm 
patches touching strange areas. My patchset improving 
drm_bridge_connector HPD also didn't gain a lot of responses.


> I'll do a respin now second guessing Jagan's comment, and then give it
> a month before giving up
> 
> Cheers
>    Dave
> 
> [1] https://patchwork.freedesktop.org/series/106422/#rev5
> [2] https://lists.freedesktop.org/archives/dri-devel/2022-November/379693.html
> 
> 
>>>
>>>     Dave
>>
>> --
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

