Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE7E459DB2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 09:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA70E6E830;
	Tue, 23 Nov 2021 08:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417676E830
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 08:19:17 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s13so37503074wrb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 00:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FlAPRw93HnBgN1/crP7SiL9krCnQX8TjZRETr8czZZc=;
 b=lw0WZeJWWzKi5alrvuikxQyV+NhFte99qUzhPf23KDL3NWJSuYVzRNSAivONYBjpex
 5UeDyhjeneemm5bOOJdGXVqdR34kq9jbAC1IBOYsrRL0tPt0Bi2UQZ7+SIesyxHxi+5x
 DLARzSJoOkBVKXFcO2QIIPoFDF8qJ65tY7XBD7cmrz/MaEheNG86TK6amqFQNi0JC4HQ
 QJT5hKfX+lPff3IxQmUOWM0cTMIZKi6y5EeOEeQesB8KXEOwZFtXTexak1VRjVafVw2W
 h1oXGw+1daf2F3BAhZttXwS8FP2aQarxgb44jH98a5+3/tvsGvx0VB5XD7uAShtpsM0H
 QJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=FlAPRw93HnBgN1/crP7SiL9krCnQX8TjZRETr8czZZc=;
 b=sG+NDsWjF6Ovj8tfMmqEHy1w+gKAz9Ulw3d1f/VQBJV0493d8A62AjOfKQC5bLkcEl
 WS8KRirurfirKzScXIQxNM+FNYATmYm/NuLHBjg7GsnfvkD7r6pS45DM+KgXVGTCrlde
 5EqNsfuU2bZs/VHssVhk1V8n7KDM6v5IXFQt8Cr/qZRFGAqKVaeAgVs4dqz2SQvJAQeY
 b7vHKqaGR+0w3YJMByGfzYbyUu9BQ0l1JE5emidA0PSEuu5do49te1N0VUlbobt3nf4o
 uqAUT2HE/NPDMzmEJTwdeMeA9o3hsJSt1YYOgG/Xl4rLO/iiyva09tITWAPu99V0Btxl
 hkRQ==
X-Gm-Message-State: AOAM5309zH4R9g7giaj8jPpuwzDC3VgVU0pOUxqdRu/uJfipDSRlnbk/
 00pBajlcSighNwKnmKrXEtFdDg==
X-Google-Smtp-Source: ABdhPJz8Ez15amhvrb+IBF1sIcQPWoOj/2O/TYYjZr/0fNy3z73xQMjkaHYqBcmdT4LbGVGTAWJ2Tg==
X-Received: by 2002:a5d:47c7:: with SMTP id o7mr5361116wrc.204.1637655555449; 
 Tue, 23 Nov 2021 00:19:15 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:5732:d3c2:58d8:3499?
 ([2001:861:44c0:66c0:5732:d3c2:58d8:3499])
 by smtp.gmail.com with ESMTPSA id l2sm340241wmq.42.2021.11.23.00.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 00:19:14 -0800 (PST)
Subject: Re: [PATCH v5 3/7] drm: sun4i: dsi: Convert to bridge driver
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-4-jagan@amarulasolutions.com>
 <35a25992-741b-b3f1-c3cd-695a19b9a413@baylibre.com>
 <CAMty3ZDATTKoJq7aLOe5i=RPo2UHzqnLs8j8sT-EBNdpC7=3DQ@mail.gmail.com>
 <9aa3d19d-4378-aaf3-6857-c40be5d252c7@baylibre.com>
 <CAPY8ntBFhz4KXFML_+12He+z57eiO1+iLTgt9hWX75s0yKn-sQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <a85c9e6c-1bab-3ada-b08d-2e0c6abdf75e@baylibre.com>
Date: Tue, 23 Nov 2021 09:19:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntBFhz4KXFML_+12He+z57eiO1+iLTgt9hWX75s0yKn-sQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>, Robert Foss <robert.foss@linaro.org>,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On 22/11/2021 18:19, Dave Stevenson wrote:
> Hi
> 
> On Mon, 22 Nov 2021 at 15:35, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Hi,
>>
>> On 22/11/2021 14:16, Jagan Teki wrote:
>>> Hi Neil,
>>>
>>> On Mon, Nov 22, 2021 at 6:22 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>>
>>>> On 22/11/2021 07:52, Jagan Teki wrote:
>>>>> Some display panels would come up with a non-DSI output, those
>>>>> can have an option to connect the DSI host by means of interface
>>>>> bridge converter.
>>>>>
>>>>> This DSI to non-DSI interface bridge converter would requires
>>>>> DSI Host to handle drm bridge functionalities in order to DSI
>>>>> Host to Interface bridge.
>>>>>
>>>>> This patch convert the existing to a drm bridge driver with a
>>>>> built-in encoder support for compatibility with existing
>>>>> component drivers.
>>>>>
>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>> ---
>>>>> Changes for v5:
>>>>> - add atomic APIs
>>>>> - find host and device variant DSI devices.
>>>>> Changes for v4, v3:
>>>>> - none
>>>>>
>>>>>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 112 ++++++++++++++++++++-----
>>>>>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |   7 ++
>>>>>  2 files changed, 96 insertions(+), 23 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>>>>> index 43d9c9e5198d..a6a272b55f77 100644
>>>>> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>>>>> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>>>>> @@ -21,6 +21,7 @@
>>>>>
>>>>>  #include <drm/drm_atomic_helper.h>
>>>>>  #include <drm/drm_mipi_dsi.h>
>>>>> +#include <drm/drm_of.h>
>>>>>  #include <drm/drm_panel.h>
>>>>>  #include <drm/drm_print.h>
>>>>>  #include <drm/drm_probe_helper.h>
>>>>> @@ -713,10 +714,11 @@ static int sun6i_dsi_start(struct sun6i_dsi *dsi,
>>>>>       return 0;
>>>>>  }
>>>>>
>>>>> -static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
>>>>> +static void sun6i_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>>>>> +                                        struct drm_bridge_state *old_bridge_state)
>>>>>  {
>>>>> -     struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
>>>>> -     struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
>>>>> +     struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
>>>>> +     struct drm_display_mode *mode = &bridge->encoder->crtc->state->adjusted_mode;
>>>>>       struct mipi_dsi_device *device = dsi->device;
>>>>>       union phy_configure_opts opts = { };
>>>>>       struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
>>>>> @@ -772,6 +774,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
>>>>>       if (dsi->panel)
>>>>>               drm_panel_prepare(dsi->panel);
>>>>>
>>>>> +     if (dsi->next_bridge)
>>>>> +             dsi->next_bridge->funcs->atomic_pre_enable(dsi->next_bridge, old_bridge_state);
>>>>> +
>>>>>       /*
>>>>>        * FIXME: This should be moved after the switch to HS mode.
>>>>>        *
>>>>> @@ -787,6 +792,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
>>>>>       if (dsi->panel)
>>>>>               drm_panel_enable(dsi->panel);
>>>>>
>>>>> +     if (dsi->next_bridge)
>>>>> +             dsi->next_bridge->funcs->atomic_enable(dsi->next_bridge, old_bridge_state);
>>>>> +
>>>>
>>>>
>>>> No need to call the next bridge atomic pre_enable/enable/disable/post_disable since they will
>>>> be called automatically on the bridge chain.
>>>
>>> Correct, but the existing bridge chain (stack) is not compatible with
>>> sun6i DSI start sequence. We cannot send any DCS once we start HS
>>> mode.
>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c#n775
>>
>> It's a classical DSI sequence init issue, look at dw-mipi-dsi:
>> https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>>
>> We setup the "command-mode" (low-speed) withing mode_set so when the next bridge dsi_pre_enable is called,
>> low-speed DCS can be sent, then the bridge enable() sets video mode (high-speed).
>> The disable still needs to call the next_bridge post_disable :
>> https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L893
> 
> Doesn't that mean the post_disable gets called twice? Once by the
> dw-mipi-dsi driver and once by the framework.

Yes indeed

> 
>> You can send any low-speed DCS once HS mode is started if the HW supports it and the driver handles it, look
>> at the https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L397
>> The MIPI_DSI_MODE_LPM and MIPI_DSI_MSG_USE_LPM is used for that.
> 
> This seems to be the same question as I was asking back in [1] and
> continued in [2].
> 
> vc4 and Exynos break the chain apart so that they can initialise the
> DSI host before the panel.
> That doesn't work if the DSI host is an encoder, as the encoder
> mode_valid call is missing the struct drm_display_info needed for
> calling the bridge mode_valid function.
> It also fails with the atomic operations as the framework can't see
> the bridges/panels beyond the DSI host, and therefore doesn't create
> the state for them.
> This is why I've been trying to reinstate the chain as a whole for
> vc4, however we then hit the issue of the downstream bridge/panel
> pre_enables being called before the DSI host (be it a bridge or
> encoder), therefore it's unlikely to have been powered up or
> configured. The DSI bus is also generally going to be powered down
> during the pre_enables, when many displays want it at LP-11.
> 
> It sounds like dw-mipi-dsi has a hack to the bridge operations and
> powers up in mode_set (not what the docs say). sun6i sounds to have
> some similar restrictions that these patches are trying to work
> around.
> 
> The documentation for struct mipi_dsi_host_ops transfer [3] states:
>  * Also note that those callbacks can be called no matter the state the
>  * host is in. Drivers that need the underlying device to be powered to
>  * perform these operations will first need to make sure it's been
>  * properly enabled.
> 
> It sounds like neither of the above drivers do this.
> As stated it would be valid to request a transfer from attach, at
> which point mode_set hasn't been called, so dw-mipi-dsi falls down
> there. sun4i can't send commands once in HS mode.
> What's the correct behaviour if the hardware can't support sending the
> transfer due to the state? Returning an error would be an obvious
> step.
> 
> 
> Is it time to actually thrash out the specifics of how DSI should be
> implemented, and fix the DSI framework where it doesn't currently
> work?

Yes, we should fix this

> 
> Previously proposed have been:
> - a pre_pre_enable (called from encoder outwards) and a matching
> post_post_disable (towards the encoder).
> - a mechanism for the panel/bridge to request that the PHY is powered
> up, so the bus is at LP-11, and the clock lane running if
> !MIPI_DSI_CLOCK_NON_CONTINUOUS, before powering up the bridge.
> (Powering up for transfers would be internal to the DSI host driver).
> 
> Do either or both of those solve the problem in this case? The first
> is the easiest to implement, but does it cover all the current use
> cases?

I don't think it's a viable solution, because maybe some weird protocol will
need another pre_pre_pre_enable callback...

I don't have the solution in mind but it must be generic and simple,
smarter minds than mine should be able to think of it....

Maybe something like the format negotiation ? where each bridge can tell
if they need precedence on the next bridge for a particular callback ?

> I don't quite see why dw-mipi-dsi calls the downstream post_disable
> early. Are there really devices that want to send DSI DCS transfers
> during shutdown? I'm guessing that's the reasoning, same as the power
> up via mode_set.

Yes panels needs some DCS commands to correctly shut down the panel

> 
> There are already bridge drivers such as SN65DSI83 which don't follow
> the requirements specified in the datasheet for power up sequences due
> to issues in the framework. Hacking the bridge seems wrong.
> (It configures the bridge from enable because it needs the DSI clock
> lane running and LP-11 on the data lanes, but actually enable has the
> data lanes active too. It should be in pre_enable, but the clock lane
> isn't running then.)
> 
> Also undefined in DRM is how DSI burst mode parameters should be
> configured, and the exact meaning of half the MIPI_DSI_MODE_* defines
> and their interactions (eg MIPI_DSI_VIDEO_MODE_BURST, but not
> MIPI_DSI_VIDEO [4]?).
> 
> Cheers
>  Dave
> 
> [1] https://lists.freedesktop.org/archives/dri-devel/2021-July/313576.html
> [2] https://lists.freedesktop.org/archives/dri-devel/2021-October/325853.html
> [3] https://elixir.bootlin.com/linux/latest/source/include/drm/drm_mipi_dsi.h#L84
> [4] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c#L226
> 
> 
>>>
>>> This specific problem can be fixed only if we change the bridge chain
>>> from stack to queue. Please check this series
>>> https://patchwork.kernel.org/project/dri-devel/patch/20210214194102.126146-6-jagan@amarulasolutions.com/
>>>
>>> Jagan.
>>>
>>

