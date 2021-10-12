Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AD8429E37
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 08:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8B66E5C6;
	Tue, 12 Oct 2021 06:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597556E5C6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 06:58:03 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id y15so83632670lfk.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 23:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DR5NMfkkAxro/vUyolIR4Jvg/ig/JfbMmgnJxJccp48=;
 b=CetcdIbND/TlgiAavOJeZkfyOmaBgI3qlWfGvmpoIAHJ5SN6tFUnYfKSSco4FGYJFY
 ReCfV+Y5vWFeqe8Onu+veObZjW3gtRfO3zFBzZqrpSH3XH7moQkWc73WpWlN2KRwiWOV
 8frhRw+2o82rYSIYUmS4eac0kwtv9KWv9QBNQR6E63KH4MrpNxc6eaNuIKfQB3wLeAsf
 ie3Su8zIZdwozQ1hDeNlB81i/qmAjIvi6FDjuAbq9M0Sk57I+A1VcX96nO0fMTIyWgpa
 s1MwXQPSfGFs30z78JJH4lmIgKeIpbeW1a0fZT2ASjy6rNICObxNijrVTOzYhfFmroLs
 2MJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DR5NMfkkAxro/vUyolIR4Jvg/ig/JfbMmgnJxJccp48=;
 b=irJu6IQmIyMK5dH012M61VLEoc8jx8TnQGeOQaAhAQPADwns7Z4pTXsWJsTBv0uk8P
 IZqSks/oKw9XvTX11D4EzBFtRsSbvkn5+cXEGQXH+DAikZO/+pytCs9AWxNB6jBtSJGu
 jCH9FF9DTCR6thBchVoToyhP5bDpUfopcF6GxI7L0ht36P8Fe3dTm/p7S+cpkXJBZEoC
 icToqGrv7vhJtNbD3rWs9Lwzn7/EfUqFmh1omhtR76neSo3+hudM6nOo+YrZRd3YhaSw
 kj67S+f3ug23NUU/E+u5fvCENIA60SpnVlmknnXqnxJFAagjNEc9ucepYCx9qp3YsasS
 lCAQ==
X-Gm-Message-State: AOAM530242/OCtMywGcxZJX0diBiS6LPdjzuJjDD9L10iu3kn0IUmzz0
 Q/Fkejy4L4cpeN++/U4Mxm8=
X-Google-Smtp-Source: ABdhPJxn/8zOZTc+RAXrkbDuZKMqQhZ9VZzJJrM4EOgM1Oc9pKLQwM7Xj3qhtwoGQaZL6ukOKPE+Kw==
X-Received: by 2002:a05:6512:2294:: with SMTP id
 f20mr4206689lfu.294.1634021881181; 
 Mon, 11 Oct 2021 23:58:01 -0700 (PDT)
Received: from [192.168.0.14]
 (095160158079.dynamic-2-waw-k-4-2-0.vectranet.pl. [95.160.158.79])
 by smtp.gmail.com with ESMTPSA id w22sm942338lfl.161.2021.10.11.23.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 23:58:00 -0700 (PDT)
Subject: Re: Questions over DSI within DRM.
From: Andrzej Hajda <andrzej.hajda@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <CAPY8ntBUKRkSam59Y+72dW_6XOeKVswPWffzPj3uvgE6pV4ZGQ@mail.gmail.com>
 <YN9BxNP5IfhbJGGk@pendragon.ideasonboard.com>
 <CAPY8ntDRKcq0V_q04q25_EemsBiT4xHKNv1260Fr8kKGtZDpxw@mail.gmail.com>
 <20210706151320.kwn4dwu6buvy4isa@gilmour>
 <CAPY8ntDPQg76JTgZ5iJG=m3sWjKMwi-vXUHyAPqS_HGFbGGkkA@mail.gmail.com>
 <20210715095022.5plcocz6plxnb3xr@gilmour>
 <YVm7U0q6F8T9K32h@pendragon.ideasonboard.com>
 <CAPY8ntAWqaHH=+cGWcpKypvZfGApE6SQ1p0qFzE9XyyqaaQ1OQ@mail.gmail.com>
 <418bd5c8-00a9-5502-f918-821616870943@gmail.com>
 <CAPY8ntDzTa0Xzfk-YUj9pOShi9wMb+_Y0ogRfROaf3kz5Ru5qQ@mail.gmail.com>
 <ce4851e2-3e17-5a4b-eb99-bc8787ec8259@gmail.com>
 <CAPY8ntDgu1t1zxpewVPFnjug0O00D-gPhgXqJtm6hr2JMo_Gmw@mail.gmail.com>
 <11ebfc24-4170-5bd6-4d86-14667f44ac1a@gmail.com>
 <CAPY8ntCGfJXG7S4fmWXWsKGYnJ1gJeCxyTD7bf=yBbQp2tJgtw@mail.gmail.com>
 <fbe103d6-4b0b-7ac7-284a-9bb26f19c590@gmail.com>
Message-ID: <3c80baf2-60cc-ff01-a3eb-fef777824d05@gmail.com>
Date: Tue, 12 Oct 2021 08:58:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fbe103d6-4b0b-7ac7-284a-9bb26f19c590@gmail.com>
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

On 12.10.2021 00:13, Andrzej Hajda wrote:
> On 08.10.2021 19:33, Dave Stevenson wrote:
>> On Thu, 7 Oct 2021 at 21:19, Andrzej Hajda <andrzej.hajda@gmail.com> 
>> wrote:
>>>
>>> On 07.10.2021 13:07, Dave Stevenson wrote:
>>>> On Tue, 5 Oct 2021 at 22:03, Andrzej Hajda <andrzej.hajda@gmail.com> 
>>>> wrote:
>>>>>
>>>>> On 05.10.2021 17:32, Dave Stevenson wrote:
>>>>>> Hi Andrzej
>>>>>>
>>>>>> Thanks for joining in the discussion.
>>>>>>
>>>>>> On Tue, 5 Oct 2021 at 16:08, Andrzej Hajda 
>>>>>> <andrzej.hajda@gmail.com> wrote:
>>>>>>>
>>>>>>> On 05.10.2021 13:23, Dave Stevenson wrote:
>>>>>>>> Hi Laurent
>>>>>>>>
>>>>>>>> On Sun, 3 Oct 2021 at 15:16, Laurent Pinchart
>>>>>>>> <laurent.pinchart@ideasonboard.com> wrote:
>>>>>>>>>
>>>>>>>>> Hello,
>>>>>>>>>
>>>>>>>>> Reviving a bit of an old thread.
>>>>>>>>
>>>>>>>> I'd been looking at reviving this conversation too as I've moved
>>>>>>>> further on with DSI on the Pi, and converting from an encoder to a
>>>>>>>> bridge
>>>>>>>>
>>>>>>>>> On Thu, Jul 15, 2021 at 11:50:22AM +0200, Maxime Ripard wrote:
>>>>>>>>>> On Tue, Jul 06, 2021 at 05:44:58PM +0100, Dave Stevenson wrote:
>>>>>>>>>>> On Tue, 6 Jul 2021 at 16:13, Maxime Ripard wrote:
>>>>>>>>>>>>>>> On a similar theme, some devices want the clock lane in 
>>>>>>>>>>>>>>> HS mode early
>>>>>>>>>>>>>>> so they can use it in place of an external oscillator, 
>>>>>>>>>>>>>>> but the data
>>>>>>>>>>>>>>> lanes still in LP-11. There appears to be no way for the
>>>>>>>>>>>>>>> display/bridge to signal this requirement or it be achieved.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> You're right. A loooong time ago, the omapdrm driver had 
>>>>>>>>>>>>>> an internal
>>>>>>>>>>>>>> infrastructure that didn't use drm_bridge or drm_panel and 
>>>>>>>>>>>>>> instead
>>>>>>>>>>>>>> required omapdrm-specific drivers for those components. It 
>>>>>>>>>>>>>> used to model
>>>>>>>>>>>>>> the display pipeline in a different way than drm_bridge, 
>>>>>>>>>>>>>> with the sync
>>>>>>>>>>>>>> explicitly setting the source state. A DSI sink could thus 
>>>>>>>>>>>>>> control its
>>>>>>>>>>>>>> enable sequence, interleaving programming of the sink with 
>>>>>>>>>>>>>> control of
>>>>>>>>>>>>>> the source.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Migrating omapdrm to the drm_bridge model took a really 
>>>>>>>>>>>>>> large effort,
>>>>>>>>>>>>>> which makes me believe that transitioning the whole 
>>>>>>>>>>>>>> subsystem to
>>>>>>>>>>>>>> sink-controlled sources would be close to impossible. We 
>>>>>>>>>>>>>> could add
>>>>>>>>>>>>>> DSI-specific operations, or add another enable bridge 
>>>>>>>>>>>>>> operation
>>>>>>>>>>>>>> (post_pre_enable ? :-D). Neither would scale, but it may 
>>>>>>>>>>>>>> be enough.
>>>>>>>>>>>>>
>>>>>>>>>>>>> I haven't thought it through for all generic cases, but I 
>>>>>>>>>>>>> suspect it's
>>>>>>>>>>>>> more a pre_pre_enable that is needed to initialise the PHY 
>>>>>>>>>>>>> etc,
>>>>>>>>>>>>> probably from source to sink.
>>>>>>>>>
>>>>>>>>> I believe it could be implemented as a pre-pre-enable indeed. 
>>>>>>>>> It feels
>>>>>>>>> like a bit of a hack, as the next time we need more 
>>>>>>>>> fine-grained control
>>>>>>>>> over the startup sequence, we'll have to add a 
>>>>>>>>> pre-pre-pre-enable. Given
>>>>>>>>> that the startup sequence requirements come from the sink 
>>>>>>>>> device, it
>>>>>>>>> would make sense to let it explicitly control the initialization,
>>>>>>>>> instead of driving it from the source. I don't think we'll be 
>>>>>>>>> able to
>>>>>>>>> rework the bridge API in that direction though, so I'm fine 
>>>>>>>>> with a hack.
>>>>>>>>
>>>>>>>> There are pros and cons to both approaches.
>>>>>>>> You're in a much better place to make that sort of call than I 
>>>>>>>> am, so
>>>>>>>> I'll take your advice.
>>>>>>>>
>>>>>>>> Implementing a DSI host op function may mean an update to a 
>>>>>>>> number of
>>>>>>>> existing DSI host drivers,
>>>>>>>
>>>>>>> Why? You just add new op to mipi_dsi_host_ops and create appropriate
>>>>>>> helper, which in case of NULL will perform default action, either:
>>>>>>> - return -ENOSYS,
>>>>>>> - try to emulate by calling 
>>>>>>> mipi_dsi_device_transfer(MIPI_DSI_NULL_PACKET)
>>>>>>>
>>>>>>> The latter is just wild guess, but I suspect it could work (even 
>>>>>>> now) as
>>>>>>> an alternate way of entering into stop state.
>>>>>>
>>>>>> If we're looking at fixing bridges to use the new DSI state call and
>>>>>> then initialise in "pre_enable" (ie before video is started), then
>>>>>> making that change to the bridge will require support for the DSI
>>>>>> state call or risk regressions.
>>>>>
>>>>> I think there is misunderstanding somewhere, I do not know where, 
>>>>> yet :)
>>>>> My idea is as follow:
>>>>> 1. Add dsi_host.set_state() op to dsi host accompanied with helper, 
>>>>> lets
>>>>> call it mipi_dsi_host_set_state for now.
>>>>> 2. Implement dsi_host.set_state in DSI host you are working with.
>>>>> 3. In body of your bridge pre_enable you call 
>>>>> mipi_dsi_host_set_state in
>>>>> proper place.
>>>>>
>>>>> 1 and 2 do not introduce any regression.
>>>>> 3 can introduce regression only if your bridge is used with another 
>>>>> dsi
>>>>> host but only on such platforms.
>>>>>
>>>>> Why do you think we need to 'fix' it everywhere?
>>>>
>>>> I'm looking at sn65dsi83 which is already working against other
>>>> platforms (I don't know which). If it is fixed to request the DSI
>>>> state and initialise in pre_enable, then those platforms need updating
>>>> too.
>>>> If mipi_dsi_device_transfer(MIPI_DSI_NULL_PACKET) can be used to wake
>>>> the host up then that would be great, but I don't have access to those
>>>> platforms to test.
>>>>
>>>>>> Some may have been getting away with it by making the initialisation
>>>>>> call in "enable" whilst video is active - that sounds like the issue
>>>>>> Marek was trying to log in his patch to SN65DSI83.
>>>>>>
>>>>>>>> but it would be cleaner. It's also what
>>>>>>>> Andrzej has suggested.
>>>>>>>>
>>>>>>>> Thinking it through, a function that requests clock lane 
>>>>>>>> frequency and
>>>>>>>> state (ULPS or LP-11 predominantly), and data lane state (again 
>>>>>>>> ULPS
>>>>>>>> or LP-11) should allow the required behaviour for most of the 
>>>>>>>> bridges
>>>>>>>> I'm aware of. Most want either LP-11, or HS clock at a known
>>>>>>>> frequency.
>>>>>>>
>>>>>>> LP-11 is quite reasonable, but regarding frequency I am not sure who
>>>>>>> should manage it? DSI device datasheets known to me usually 
>>>>>>> mentioned
>>>>>>> max frequency, and it is covered by mipi_dsi_device.hs_rate. Min
>>>>>>> frequency is usually determined by amount of data we need to 
>>>>>>> transfer
>>>>>>> per second.
>>>>>>> Do you need to set frequency from device, or just to know actual 
>>>>>>> frequency?
>>>>>>> In former case (if it is really necessary !!!) you should request
>>>>>>> frequency range anyway, as host usually is able to set only discrete
>>>>>>> number of frequencies. But it need to be clearly specified how 
>>>>>>> and when
>>>>>>> this op can be used - more ops, more questions about interaction 
>>>>>>> between
>>>>>>> them.
>>>>>>> In latter case another mipi host op should be quite easy to 
>>>>>>> implement.
>>>>>>
>>>>>> If a burst mode frequency is specified in struct mipi_dsi_device
>>>>>> hs_rate then there is no issue.
>>>>>
>>>>> hs_rate should be called rather max_hs_rate as it describes only top
>>>>> limit of HS clock, decision which clock to choose is on DSI host side.
>>>>
>>>> Indeed, I've just realised that one.
>>>>
>>>>>> If not, then you'll generally want to use the pixel clock,
>>>>>
>>>>> Probably not, often we want to use rate higher than pixel clock
>>>>> (time-compression in DSI spec), to leave time gaps for LP mode.
>>>>
>>>> Only if MIPI_DSI_MODE_VIDEO_BURST is set in the mode_flags, otherwise
>>>> you should be running at the pixel clock. (Slight assumption as there
>>>> is no definition of what MIPI_DSI_MODE_VIDEO_BURST really means in the
>>>> documentation).
>>>
>>> Specification describes it clearly [1], grep for 'burst'.
>>>
>>> [1]: https://hifpga.com/upfiles/15552304546301142.pdf
>>
>> The MIPI DSI spec defines the concept of burst, it doesn't define the
>> Linux kernel implementation of it.
>>
>> In a Linux DSI host driver:
>> - How should a DSI host driver choose the link frequency to enable
>> "blocks of pixel data can be transferred in a shorter time"? hs_rate
>> defines the max rate, and the pixel clock the minimum. Pick any number
>> in between?
>> - How does a DSI device driver get told the link frequency? Many
>> bridge chips run their PLLs off the DSI HS clock, so need to know how
>> to convert that into a desired pixel clock.
>> - 8.11.4 "Following HS pixel data transmission, the bus may stay in HS
>> Mode for sending blanking packets or go to Low Power Mode, during
>> which it may remain idle, i.e. the host processor remains in LP-11
>> state, or LP transmission may take place in either direction. ".
>> Option in the DSI spec. How is that mode chosen by the DSI device
>> driver for the host driver to implement?
>> - 8.11.1 "To enable PHY synchronization the host processor should
>> periodically end HS transmission and drive the Data Lanes to the LP
>> state. This transition should take place at least once per frame;
>> shown as LPM in the figures in this section." Another option within
>> the DSI spec as to whether it is once per frame or more frequently.
>> How does a DSI device driver signal which mode is required to the DSI
>> host driver? (And I've just had a device that is fussy about this
>> one).
> 
> I think all these questions are rather to hw platform team, if they 
> confirm that hw works well with specific clock and other hw settings 
> developer should obey it. This is probably why almost nobody is using 
> for example hs_rate constraint - developer receives straightforward 
> instruction with fixed set of parameters (or just set of magic numbers 
> without explanation) to program on both DSI host and device - no place 
> for hesitation :)
> As I understand your bridge is re-used in multiple configurations thus 
> you need more intelligence in the driver. Am I right? I think the best 
> would be to just start implementing missing bits.
> 
>>
>> I know we all hate writing documentation, but saying the parent
>> specification defines how it should be implemented on a system isn't
>> true, and developing/updating a DSI driver results in these sorts of
>> questions.
>>
>>>>>> and the DSI
>>>>>> host hasn't necessarily been told the video mode at the point the
>>>>>> bridge/panel requests a new DSI state.
>>>>>
>>>>> pre_enable and enable ops are called after modeset, so video mode 
>>>>> is known.
>>>>
>>>> Thanks, I wasn't aware of that. It didn't help that our DSI driver
>>>> didn't implement a mode_set function as it did all the work in
>>>> pre_enable having looked back at the crtc for the mode.
>>>>
>>>> It looks like there is a slight quirk that there is an encoder
>>>> atomic_mode_set, but not a bridge one. If we're implementing the
>>>> atomic API is it correct to update our bridge's internal state (ie the
>>>> hs_rate) from a (atomic_)mode_set? That's a different discussion
>>>> though.
>>>
>>> It shouldn't matter, the mode should be stored in atomic state. In
>>> pre-enable you should have all required info: videomode and constraints.
>>
>> Sorry, perhaps I didn't describe my scenario well enough.
>> Atomic DSI host bridge driver. Atomic DSI bridge/panel driver.
>>
>> mode_set gets called on all nodes.
>> pre_enables are called starting at the furthest end from the encoder,
>> so the bridge/panel driver pre_enable gets called before the DSI host
>> pre_enable. The bridge/panel wants to power up the DSI host using the
>> new API. The DSI host bridge hasn't had the pre_enable called yet, and
>> currently we're not proposing an atomic_set_state. At that point, what
>> parameters should the DSI host driver be using to determine the link
>> frequency as it doesn't have a state?
> 
> First of all it has access to device's hs_rate, so it can use it.
> But it has also access to crtc state at bridge.encoder->crtc->state. 
> Which should be already set by mode_set - any pre_enable is called after 
> mode_set.
> 
>>
>> Perhaps we should be proposing an atomic_set_state which takes a
>> struct drm_atomic_state *. How would that work if called from a
>> non-atomic bridge driver though?
>>
>>>>
>>>>>>
>>>>>>>> Giving the option for setting back into ULPS also allows
>>>>>>>> for power saving/standby mechanisms should the need arise.
>>>>>>>
>>>>>>> Another op :)
>>>>>>
>>>>>> Does it need to be, or can it be one op as
>>>>>> enum mipi_dsi_lane_state{
>>>>>>     DSI_ULPS,
>>>>>>     DSI_LP11,
>>>>>>     DSI_HS,
>>>>>> };
>>>>>>
>>>>>> int mipi_dsi_set_state(struct mipi_dsi_device *dsi,
>>>>>>           enum mipi_dsi_lane_state clock_lane_state,
>>>>>>           u64 clock_lane_freq,
>>>>>>           enum mipi_dsi_lane_state data_lane_state)
>>>>>
>>>>> I still do not know why do you want to set freq explicitly, ie why DSI
>>>>> host could not choose it, based on bridge constraints, DSI host
>>>>> constraints and requested video mode.
>>>>
>>>> I'm partly trying to piece together what information is already around
>>>> in order to be able to make a good decision on the frequency.
>>>> If we have (max_)hs_rate defined and a mode, then we can make a
>>>> decision within the DSI host driver.
>>>>
>>>> Adding a link-frequencies DT property would allow the system
>>>> configuration to be defined rather than some random heuristics.
>>>
>>> Exynos DSI used samsung,burst-clock-frequency property, I am not sure of
>>> others, but it was rather copy/paste solution from vendor code. Maybe it
>>> is OK this way.
>>
>> Just for interest's sake I had a quick look for how other drivers 
>> configure it.
>> hs_rate is only used by ST-Ericsson MCDE and OMAP.
>> iMX8 nwl-dsi, Synopsys dw-mipi-dsi, hisilicon dw_drm_dsi, mtk_dsi, and
>> msm/dsi_host all set magic flags in the hardware based on
>> MIPI_DSI_MODE_VIDEO_BURST, and appear to have no reporting of the
>> frequency used.
>> Exynos appears to require vendor-specific DT property
>> "samsung,burst-clock-frequency".
>>
>> It would be nice to have a standardised and documented approach.
>>
>> It's obviously not valid for me to reuse a Samsung specific property
>> on a non-Samsung platform, and duplicating it as a different
>> vendor-specific property would imply that it shouldn't be
>> vendor-specific.
>>  From V4L2 there is already the defined link-frequencies DT property to
>> set CSI2 HS rates, so it would seem reasonable for that to be used for
>> DSI as well.
> 
> Sounds OK.
> 
>>
>>>>
>>>> But otherwise I do now agree with you that we probably don't need an
>>>> explicit frequency from the bridge/panel driver.
>>>>
>>>> There is still the situation documented in [1] that the transfer
>>>> function "can be called no matter the state the host is in", so that
>>>> would include as part of attach when we don't have a video mode. Any
>>>> transfer without the MIPI_DSI_MSG_USE_LPM flag is then at an undefined
>>>> HS speed. There are likely very few cases where that matters, so a
>>>> WARN from the DSI host driver is probably sufficient for now.
>>>
>>> But we have already constraints from both players - host and device, so
>>> it should not be an issue to use max allowed speed.
>>
>> For devices that set MIPI_DSI_MODE_VIDEO_BURST we can if hs_rate is
>> set or we otherwise assume 500MHz.
> 
> Maybe better would be fix drivers to provide real limit.
> 
> 
>> This is an issue for devices without MIPI_DSI_MODE_VIDEO_BURST set
>> where they are expecting their pixel rate. Under these conditions we
>> don't know what that pixel rate
>>>>
>>>> [1] 
>>>> https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html?highlight=dsi#c.mipi_dsi_host_ops 
>>>>
>>>>
>>>>> Regarding different modes for clock and data lanes there exists DSI 
>>>>> mode
>>>>> flag MIPI_DSI_CLOCK_NON_CONTINUOUS which determines if host in LP-11
>>>>> data lanes state can also put clock lane into LP-11. Is there need for
>>>>> sth more?
>>>>> I'd like to avoid possibility of nonsense(?) configurations like clock
>>>>> in LP-11 and data lanes in HS.
>>>>
>>>> Having had a first pass at implementing this, then I certainly agree
>>>> with altering the potential states I'd previously suggested.
>>>>       DSI_STANDBY,
>>>
>>> Specification uses LP11 or STOP state to describe LP-11, so I would
>>> prefer to stick to one of it.
>>
>> Sorry, I was meaning standby as in power off the PHY. DSI_OFF is
>> probably more accurate.
>> An LP-11 / STOP state would be DSI_ACTIVE.
>>
>>>>       DSI_ULPS,
>>>
>>> I am not sure but I hope this is LP-00.
>>
>> It is, but also it needs the relevant escape sequence to enter/exit
>> it. You can't simply just switch to LP-00.
>> I'm looking more at link states than physical states.
>>
>>>>       DSI_ACTIVE,
>>>
>>> I am not sure about this one, this would mean start video transmission
>>> in HS, as there is no HS stop state. It does not look like desirable in
>>> pre-enable state. 'HS idle' state is just LP-11.
>>>
>>>> Seems more sensible now
>>>> For the clock lane, as you say, MIPI_DSI_CLOCK_NON_CONTINUOUS
>>>> determines whether DSI_ACTIVE means LP-11 or HS.
>>>> The data lanes follow the clock lane in state, so DSI_ACTIVE means
>>>> LP-11, sending LP commands, or HS if video is actively being
>>>> transmitted.
>>>
>>> I think you are messing up in above sentence :)
>>> For definition look for 'continuous clock' phrase in spec above [1].
>>
>> Not sure I agree with you based on my clarification of what I meant by
>> DSI_STANDBY.
>>
>>>> Having just DSI_ACTIVE also avoids the nonsense you rightly raise of
>>>> LP clock but HS data.
>>>>
>>>> So it can be condensed down to a single state.
>>>> int mipi_dsi_set_state(struct mipi_dsi_device *dsi,
>>>>           enum mipi_dsi_lane_state state);
>>>> Does that seem reasonable?
>>>
>>> Yes, but if we stay with two states I wonder if it wouldn't be better to
>>> use two separate ops, just matter of taste.
>>
>> Well there is the question of whether ULPS is actually useful or not
>> over powering down the PHY, but by making it a single op taking an
>> enum means that even if we ignore it now then it could be added.


It could be added as separate ops as well, no difference.
The only difference is in style IMO. If you provide 'muxing' op (ie with 
parameter 'state'), which will be always demuxed in implementation, it 
will be redundant:
int set_state(state) {
	switch(enum mipi_dsi_lane_state state) {
	case state1: return set_state1();
	case state2: return set_state2();
	default: return ENO...;
}

More straightforward would be provide separate ops.


>> I am aware of DSI devices that will switch to standby when they see a
>> ULPS entry sequence, so being able to request that from disable would
>> be reasonable.

The main question is if we really need ulps. If yes the next question is 
where do you want to use it? In disabled state? Ie before pre-enable, 
and after post-disable? Or maybe in command mode if there is only needed 
partial display update, between long idles?
In both cases the question is who should decide about entering it, my 
1st intuition is that should be rather host - no need for ops.
And entering ULPS on DSI interface should be probable part of putting 
whole pipeline (not only DSI) into some sleep state. Too many question 
to answer without real world example.

Regards
Andrzej

>>
>> If I step back and asked you for a proposal of an API that allows a
>> DSI device to ask the bridge to enable itself based on the existing
>> flags and parameters, what would you have it look like
> 
>>
>>>>
>>>> I guess the other thing to do is document what is meant by each flag.
>>>> Currently the documentation is rather lacking in the intended
>>>> behaviour, which is where I started with this thread.
>>>
>>> Yes, at least in case spec is not clear about it.
>>
>> Again, the spec does not determine the implementation details under a
>> specific operating system.
>>
>> I suspect I'm in the minority where we have a relatively open platform
>> and more and more random non-mainline kernel developers are coming
>> along and wanting to add this or that DSI device. If it isn't
>> documented somewhere as to how to configure this stuff then they go
>> down the totally wrong path, and both the platform and the DRM
>> subsystem look bad.
> 
> This is classic issue - it is hard to write framework/docs for things 
> you cannot test/implement. It is left for devs who need it :)
> 
> 
>> When you have drivers merged into the mainline kernel such as [1]
>> which set mode_flags to just MIPI_DSI_MODE_VIDEO_BURST (presumably
>> command mode but higher link frequency?), or [2] which sets just
>> MIPI_DSI_MODE_VIDEO_SYNC_PULSE (command mode with sync pulses?), it
>> would appear that it isn't clear to experienced developers who are
>> submitting DSI device drivers as to what these flags mean, nor which
>> are valid in various combinations. If they get it wrong, nor is it
>> picked up during review, then relative newbies have no hope.
>>
>> Laurent acknowledged at the start of this thread that a lot of stuff
>> isn't defined. I (or others working on our behalf) can put the work
>> into document it, but that documentation needs to be correct.
>>
>> Thanks
>>    Dave
>>
>> [1] 
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c#L226 
>>
>> I can't find a datasheet for this one, but it seems unlikely.
> 
> http://files.pine64.org/doc/datasheet/pine64/FY07024DI26A30-D_feiyang_LCD_panel.pdf 
> 
> 
> 
> Regards
> Andrzej
> 
> 
>> [2] 
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c#L673 
>>
>> I'm fairly certain that ILI9881 doesn't support command mode.
>>
>>> Regards
>>> Andrzej
>>>
>>>
>>>>
>>>> Thanks.
>>>>     Dave
>>>>
>>>>> Regards
>>>>> Andrzej
>>>>>
>>>>>
>>>>>
>>>>>>
>>>>>>      Dave
>>>>>>
>>>>>>> Regards
>>>>>>> Andrzej
>>>>>>>
>>>>>>>
>>>>>>>> Does it need a way to pass back the actual DSI frequency being 
>>>>>>>> used,
>>>>>>>> in a similar vein to mode_fixup? That allows for the bridge to 
>>>>>>>> request
>>>>>>>> the display clock, but the burst mode link frequency to be returned
>>>>>>>> (I'm assuming that's a property of the DSI host only, and not the
>>>>>>>> bridge).
>>>>>>>>
>>>>>>>> I'm having a discussion with someone who wants to run SN65DSI85 
>>>>>>>> in the
>>>>>>>> two independent LVDS display mode. That requires a DSI HS clock on
>>>>>>>> DSI-A even if only panel B is active, so with this extra 
>>>>>>>> function that
>>>>>>>> would be achievable as well.
>>>>>>>>
>>>>>>>> Thoughts?
>>>>>>>>
>>>>>>>>>>>>> If the panel/bridge can set a flag that can be checked at 
>>>>>>>>>>>>> this point
>>>>>>>>>>>>> for whether an early clock is required or not, I think that 
>>>>>>>>>>>>> allows us
>>>>>>>>>>>>> to comply with the requirements for a large number of 
>>>>>>>>>>>>> panels/bridges
>>>>>>>>>>>>> (LP-11 vs HS config for clock and or data lanes before 
>>>>>>>>>>>>> pre_enable is
>>>>>>>>>>>>> called).
>>>>>>>>>>>>>
>>>>>>>>>>>>> pre_enable retains the current behaviour (initialise the 
>>>>>>>>>>>>> chain from
>>>>>>>>>>>>> sink to source).
>>>>>>>>>>>>> enable then actually starts sending video and enabling 
>>>>>>>>>>>>> outputs.
>>>>>>>>>>>>
>>>>>>>>>>>> Flags indeed seem like a more contained option. Another one 
>>>>>>>>>>>> could be to
>>>>>>>>>>>> have a mipi_dsi_host to (for example) power up the clock 
>>>>>>>>>>>> lane that would
>>>>>>>>>>>> be called by default before the bridge's enable, or at the 
>>>>>>>>>>>> downstream
>>>>>>>>>>>> bridge driver discretion before that.
>>>>>>>>>>>
>>>>>>>>>>> Which driver will that call?
>>>>>>>>>>
>>>>>>>>>> The parent DSI Host
>>>>>>>>>>
>>>>>>>>>>> An extreme example perhaps, but Toshiba make the TC358860 eDP 
>>>>>>>>>>> to DSI
>>>>>>>>>>> bridge chip[1]. So the encoder will be eDP, but the DSI 
>>>>>>>>>>> config needs
>>>>>>>>>>> to go to that bridge. Does that happen automatically within the
>>>>>>>>>>> framework? I guess so as the bridge will have called
>>>>>>>>>>> mipi_dsi_host_register for the DSI sink to attach to.
>>>>>>>>>>
>>>>>>>>>> In that case, whatever sink would be connected to the bridge 
>>>>>>>>>> would call
>>>>>>>>>> the bridge clock enable hook if it needs it in its pre_enable, 
>>>>>>>>>> or it
>>>>>>>>>> would be called automatically before enable if it doesn't
>>>>>>>>>>
>>>>>>>>>> Would that help?
>>>>>>>>>
>>>>>>>>> Sounds good to me, in theory at least (let's see what issues 
>>>>>>>>> we'll run
>>>>>>>>> into in practice :-)).
>>>>>>>>>
>>>>>>>>> Has anyone given it a try, or is planning to ?
>>>>>>>>>
>>>>>>>>>>> Perhaps a new mipi_dsi_host function to configure the PHY is the
>>>>>>>>>>> easier solution. If it can allow the sink to request whatever
>>>>>>>>>>> combination of states from clock and data lanes that it 
>>>>>>>>>>> fancies, then
>>>>>>>>>>> it can be as explicit as required for the initialisation 
>>>>>>>>>>> sequence, and
>>>>>>>>>>> the host driver does its best to comply with the requests.
>>>>>>>>>>
>>>>>>>>>> I don't know, I'm not really fond in general of solutions that 
>>>>>>>>>> try to
>>>>>>>>>> cover any single case if we don't need it and / or have today 
>>>>>>>>>> an issue
>>>>>>>>>> with this. I'd rather have something that works for the 
>>>>>>>>>> particular
>>>>>>>>>> bridge we were discussing, see if it applies to other bridges 
>>>>>>>>>> and modify
>>>>>>>>>> it if it doesn't until it works for all our cases. Trying to 
>>>>>>>>>> reason in
>>>>>>>>>> all possible cases tend to lead to solutions that are 
>>>>>>>>>> difficult to
>>>>>>>>>> maintain and usually over-engineered.
>>>>>>>>>
>>>>>>>>> A DSI host clock enable operation or a DSI host PHY configuration
>>>>>>>>> operation both fit in the same place in the grand scheme of 
>>>>>>>>> things, so I
>>>>>>>>> don't mind either. We should be able to easily move from a more 
>>>>>>>>> specific
>>>>>>>>> operation to a more generic one if the need arises.
>>>>>>>>>
>>>>>>>>>>> I'd have a slight query over when and how the host would drop 
>>>>>>>>>>> to ULPS
>>>>>>>>>>> or power off. It probably shouldn't be in post_disable as the 
>>>>>>>>>>> sink
>>>>>>>>>>> hasn't had a chance to finalise everything in its post_disable.
>>>>>>>>>>>
>>>>>>>>>>> Perhaps pm_runtime with autosuspend is the right call there?
>>>>>>>>>>
>>>>>>>>>> pm_runtime semantics mean that once the device is suspended, 
>>>>>>>>>> its power
>>>>>>>>>> domains, regulators, clocks, etc. are all shut down, so it 
>>>>>>>>>> doesn't
>>>>>>>>>> really fit the low power state expected by DSI
>>>>>>>>>>
>>>>>>>>>>> [1] 
>>>>>>>>>>> https://toshiba.semicon-storage.com/ap-en/semiconductor/product/interface-bridge-ics-for-mobile-peripheral-devices/display-interface-bridge-ics/detail.TC358860XBG.html 
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>>> When I discussed this briefly with Maxime there was a 
>>>>>>>>>>>>> suggestion of
>>>>>>>>>>>>> using pm_runtime to be able to power up the pipeline as a 
>>>>>>>>>>>>> whole. If
>>>>>>>>>>>>> the bridge driver can use pm_runtime to power up the PHY when
>>>>>>>>>>>>> required, then that may solve the issue, however I know too 
>>>>>>>>>>>>> little of
>>>>>>>>>>>>> the details to say whether that is actually practical.
>>>>>>>>>>>>
>>>>>>>>>>>> I'm not sure it was about this topic in particular. If I 
>>>>>>>>>>>> remember well
>>>>>>>>>>>> our discussion, this was about the vc4 driver that tries to 
>>>>>>>>>>>> circumvent
>>>>>>>>>>>> the framework and call the pre_enable and enable hooks 
>>>>>>>>>>>> itself because it
>>>>>>>>>>>> wasn't properly powered before and thus any DCS-related call 
>>>>>>>>>>>> by the
>>>>>>>>>>>> downstream bridge or panel would end up creating a CPU stall.
>>>>>>>>>>>>
>>>>>>>>>>>> I suggested to use runtime_pm in the DCS related calls to 
>>>>>>>>>>>> make sure the
>>>>>>>>>>>> device is powered because there's no relation between the 
>>>>>>>>>>>> state of the
>>>>>>>>>>>> downstream bridge or panel and whether it can send DCS 
>>>>>>>>>>>> commands or not.
>>>>>>>>>>>> For all we know, it could do it at probe time.
>>>>>>>>>>>
>>>>>>>>>>> pm_runtime is all a bit of a magic black box to me.
>>>>>>>>>>>
>>>>>>>>>>> We had discussed shifting to using pm_runtime from DCS (and 
>>>>>>>>>>> enable)
>>>>>>>>>>> calls to power up the PHY on demand, and that's what I 
>>>>>>>>>>> implemented.
>>>>>>>>>>> However Laurent flagged up that using
>>>>>>>>>>> dsi->encoder->crtc->state->adjusted_mode to get the HS clock 
>>>>>>>>>>> info
>>>>>>>>>>> required to send a HS DCS command from that call is 
>>>>>>>>>>> deprecated, so how
>>>>>>>>>>> do we specify the clock rate to use at that point?
>>>>>>>>>>
>>>>>>>>>> I guess the most sensible would be to have a custom bridge 
>>>>>>>>>> state, and
>>>>>>>>>> add a pointer to the current bridge state in struct 
>>>>>>>>>> drm_bridge. Then, as
>>>>>>>>>> long as you have a bridge pointer you have a way to get the 
>>>>>>>>>> current
>>>>>>>>>> state associated to it, and since we already have 
>>>>>>>>>> atomic_duplicate_state
>>>>>>>>>> / atomic_destroy_state we can create our own structure around 
>>>>>>>>>> it storing
>>>>>>>>>> whatever we want.
>>>>>>>>>
>>>>>>>>> That's a good point. It would only be needed if we use runtime 
>>>>>>>>> PM to
>>>>>>>>> work around the initialization sequence issue, not if we 
>>>>>>>>> implement a DSI
>>>>>>>>> host clock enable/disable operation, right ?
>>>>>>>>
>>>>>>>> Obviously this only works with atomic bridges otherwise you have no
>>>>>>>> state, but I assume all bridges should be heading that route now.
>>>>>>>>
>>>>>>>>>>>>>>> host_transfer calls can supposedly be made at any time, 
>>>>>>>>>>>>>>> however unless
>>>>>>>>>>>>>>> MIPI_DSI_MSG_USE_LPM is set in the message then we're 
>>>>>>>>>>>>>>> meant to send it
>>>>>>>>>>>>>>> in high speed mode. If this is before a mode has been 
>>>>>>>>>>>>>>> set, what
>>>>>>>>>>>>>>> defines the link frequency parameters at this point? 
>>>>>>>>>>>>>>> Adopting a random
>>>>>>>>>>>>>>> default sounds like a good way to get undefined behaviour.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> DSI burst mode needs to set the DSI link frequency 
>>>>>>>>>>>>>>> independently of
>>>>>>>>>>>>>>> the display mode. How is that meant to be configured? I 
>>>>>>>>>>>>>>> would have
>>>>>>>>>>>>>>> expected it to come from DT due to link frequency often 
>>>>>>>>>>>>>>> being chosen
>>>>>>>>>>>>>>> based on EMC restrictions, but I don't see such a thing 
>>>>>>>>>>>>>>> in any
>>>>>>>>>>>>>>> binding.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Undefined too. DSI support was added to DRM without any 
>>>>>>>>>>>>>> design effort,
>>>>>>>>>>>>>> it's more a hack than a real solution. The issue with 
>>>>>>>>>>>>>> devices that can
>>>>>>>>>>>>>> be controlled over both DSI and I2C is completely 
>>>>>>>>>>>>>> unhandled. So far
>>>>>>>>>>>>>> nobody has really cared about implementing DSI right as 
>>>>>>>>>>>>>> far as I can
>>>>>>>>>>>>>> tell.
>>>>>>>>>>>>>
>>>>>>>>>>>>> :-(
>>>>>>>>>>>>>
>>>>>>>>>>>>> Thinking aloud, does having the option to set a burst link 
>>>>>>>>>>>>> frequency
>>>>>>>>>>>>> from DT (or ACPI) have any issue for other platforms?
>>>>>>>>>>>>> Looking at the handling of MIPI_DSI_MODE_VIDEO_BURST in the 
>>>>>>>>>>>>> various
>>>>>>>>>>>>> drivers, all except stm/dw_mipi_dsi-stm.c appear to take it 
>>>>>>>>>>>>> as a "use
>>>>>>>>>>>>> all the defined timings, but drop to LP during blanking" 
>>>>>>>>>>>>> option. The
>>>>>>>>>>>>> link frequency has therefore remained a property of the
>>>>>>>>>>>>> display/bridge.
>>>>>>>>>>>>> dw_mipi_dsi-stm.c cranks the PLL up by 20%, but I haven't 
>>>>>>>>>>>>> followed
>>>>>>>>>>>>> through the full detail of the parameters it computes from 
>>>>>>>>>>>>> there.
>>>>>>>>>>>>
>>>>>>>>>>>> I don't see anything wrong with using link-frequency from 
>>>>>>>>>>>> the DT to
>>>>>>>>>>>> setup the burst frequency. It's what v4l2 has been using for 
>>>>>>>>>>>> a while
>>>>>>>>>>>> without any known (to me) drawback, and we're using the same 
>>>>>>>>>>>> of-graph
>>>>>>>>>>>> bindings, so it shouldn't be too controversial there.
>>>>>>>>>
>>>>>>>>> How would that frequency we picked in practice ? Do panels 
>>>>>>>>> typically
>>>>>>>>> support a range of HS frequencies for DCS HS transfers ?
>>>>>>>>
>>>>>>>> I was thinking more of bridges where they often run a PLL off the
>>>>>>>> incoming DSI clock, and then have a FIFO with potentially different
>>>>>>>> clock rates and timings on input and output. SN65DSI83 supports 
>>>>>>>> that,
>>>>>>>> as do the Toshiba bridge chips I'm currently looking at.
>>>>>>>> You need to know the DSI link frequency to configure the PLL
>>>>>>>> correctly, but then the bridge output timing is a different matter.
>>>>>>>>
>>>>>>>>>>> OK, that sounds like a vague plan.
>>>>>>>>>>>
>>>>>>>>>>>>> DSI and I2C controlled devices is yet another issue that I 
>>>>>>>>>>>>> haven't
>>>>>>>>>>>>> even looked at.
>>>>>>>>>>>>> I think it's more that vc4 wants to ignore DSI should the 
>>>>>>>>>>>>> DSI host
>>>>>>>>>>>>> node be enabled in DT, but there's no panel bound to it. 
>>>>>>>>>>>>> One could say
>>>>>>>>>>>>> that is a DT error and tough luck, but from a user's 
>>>>>>>>>>>>> perspective that
>>>>>>>>>>>>> is a bit harsh.
>>>>>>>>>>>>
>>>>>>>>>>>> I guess the larger "issue" is that the tree in the DT is 
>>>>>>>>>>>> done following
>>>>>>>>>>>> the "control" bus, and Linux likes to tie the life cycle of 
>>>>>>>>>>>> a given
>>>>>>>>>>>> device to its parent bus. Both these decisions make sense, 
>>>>>>>>>>>> but they
>>>>>>>>>>>> interact in a weird way in some occurrences (like this one, 
>>>>>>>>>>>> or Allwinner
>>>>>>>>>>>> has an Ethernet PHY controlled through MMIO which end up in 
>>>>>>>>>>>> the same
>>>>>>>>>>>> case).
>>>>>>>>>>>>
>>>>>>>>>>>> I wonder if using device links here could help though.
>>>>>>>>>>>
>>>>>>>>>>> I really don't know about that one.
>>>>>>>>>>
>>>>>>>>>> It's a piece of infrastructure that was created at first (I 
>>>>>>>>>> think?) to
>>>>>>>>>> model the power dependency between devices that don't have a 
>>>>>>>>>> parent /
>>>>>>>>>> child relationship. For example, if you use DMA, you probably 
>>>>>>>>>> want to
>>>>>>>>>> keep the IOMMU powered as long as you are, but it is in a 
>>>>>>>>>> completely
>>>>>>>>>> separate branch of the "device tree" (not one from the DTB, 
>>>>>>>>>> the one that
>>>>>>>>>> linux DM creates).
>>>>>>>>>>
>>>>>>>>>> It was later expanded to also cover probe order and make sure 
>>>>>>>>>> a supplier
>>>>>>>>>> would probe before its consumer, effectively making EPROBE_DEFER
>>>>>>>>>> obsolete.
>>>>>>>>>>
>>>>>>>>>> The second part is still fairly new, but I think we can solve 
>>>>>>>>>> this by
>>>>>>>>>> adding a device link between the DSI host and whatever is at 
>>>>>>>>>> the end of
>>>>>>>>>> the OF-Graph endpoint.
>>>>>>>>>>
>>>>>>>>>>>>>>> As a follow on, bridge devices can support burst mode (eg 
>>>>>>>>>>>>>>> TI's
>>>>>>>>>>>>>>> SN65DSI83 that's just been merged), so it needs to know 
>>>>>>>>>>>>>>> the desired
>>>>>>>>>>>>>>> panel timings for the output side of the bridge, but the 
>>>>>>>>>>>>>>> DSI link
>>>>>>>>>>>>>>> timings to set up the bridge's PLL. What's the correct 
>>>>>>>>>>>>>>> way for
>>>>>>>>>>>>>>> signalling that? drm_crtc_state->adjusted_mode vs
>>>>>>>>>>>>>>> drm_crtc_state->mode? Except mode is userspace's request, 
>>>>>>>>>>>>>>> not what has
>>>>>>>>>>>>>>> been validated/updated by the panel/bridge.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> adjusted_mode is also a bit of a hack, it solves very 
>>>>>>>>>>>>>> specific issues,
>>>>>>>>>>>>>> and its design assumes a single encoder in the chain with 
>>>>>>>>>>>>>> no extra
>>>>>>>>>>>>>> bridges. We should instead add modes to the bridge state, 
>>>>>>>>>>>>>> and negotiate
>>>>>>>>>>>>>> modes along the pipeline the same way we negotiate formats.
>>>>>>>>>>>>>
>>>>>>>>>>>>> So as I understand it we already have format negotiation 
>>>>>>>>>>>>> between
>>>>>>>>>>>>> bridges via atomic_get_output_bus_fmts and 
>>>>>>>>>>>>> atomic_get_input_bus_fmts,
>>>>>>>>>>>>> so is it possible to extend that to modes?
>>>>>>>>>>>>> Are you thinking bridge state that is owned by the 
>>>>>>>>>>>>> framework, or by
>>>>>>>>>>>>> the individual bridge drivers?
>>>>>>>>>>>>
>>>>>>>>>>>> atomic_check is made for that. I guess we could improve its 
>>>>>>>>>>>> call
>>>>>>>>>>>> sequence to each time a mode is modified along the bridge 
>>>>>>>>>>>> list we
>>>>>>>>>>>> restart the sequence until all components agree (or reject 
>>>>>>>>>>>> it entirely
>>>>>>>>>>>> if they can't), but I don't really see why we would need yet 
>>>>>>>>>>>> another
>>>>>>>>>>>> hook.
>>>>>>>>>
>>>>>>>>> Isn't this what atomic_get_output_bus_fmts() and
>>>>>>>>> atomic_get_input_bus_fmts() implement ?
>>>>>>>>
>>>>>>>> Those negotiate a single u32 bus format between nodes, not a 
>>>>>>>> complete timing.
>>>>>>>>
>>>>>>>>>>> Why do all nodes in the bridge list need to agree? Adjacent 
>>>>>>>>>>> nodes need
>>>>>>>>>>> to agree, but they then also need to retain that agreed timing
>>>>>>>>>>> somewhere.
>>>>>>>>>>
>>>>>>>>>> We might have mutually exclusive requirements though? Let's 
>>>>>>>>>> use the
>>>>>>>>>> example of the VC4 HDMI driver that can't have odd horizontal 
>>>>>>>>>> timings,
>>>>>>>>>> and assume it's a constraint of our DSI driver instead.
>>>>>>>>>>
>>>>>>>>>> Then, we have a DSI->LVDS bridge, a LVDS->RGB bridge and a 
>>>>>>>>>> panel (which
>>>>>>>>>> is a bit ridiculous, but whatever). If the LVDS->RGB bridge 
>>>>>>>>>> can't have
>>>>>>>>>> even horizontal timings, then you just can't display it, even 
>>>>>>>>>> though
>>>>>>>>>> they are not adjacent (unless the bridge in the middle can 
>>>>>>>>>> modify the
>>>>>>>>>> timings between the input and output, but that's not always 
>>>>>>>>>> possible).
>>>>>>>>>>
>>>>>>>>>> Similarly, if for the RGB panel we need to increase a bit some 
>>>>>>>>>> timings
>>>>>>>>>> to accommodate for a larger pixel clock and end up above what 
>>>>>>>>>> the DSI
>>>>>>>>>> host can provide, we're also done.
>>>>>>>>>
>>>>>>>>> The hard part will be to figure out a good heuristics to 
>>>>>>>>> perform the
>>>>>>>>> negotiation without going back and forth (at least not in a way 
>>>>>>>>> that
>>>>>>>>> would require too many iterations, and certainly avoiding infinite
>>>>>>>>> loops). That will be an interesting problem to solve, but maybe 
>>>>>>>>> we'll be
>>>>>>>>> lucky and a simple approach will work for the use cases we have to
>>>>>>>>> support today.
>>>>>>>>
>>>>>>>> One to kick into the long grass possibly then.
>>>>>>>>
>>>>>>>> For burst mode and bridges retiming things, generally I think it 
>>>>>>>> works
>>>>>>>> if you consider a single pass through a mode_fixup equivalent 
>>>>>>>> starting
>>>>>>>> at the panel.
>>>>>>>> The panel advertises what it wants.
>>>>>>>> The closest bridge (eg DSI83) fixup amends panel's requested mode
>>>>>>>> based on any constraints that it has, stores a copy, and passes 
>>>>>>>> that
>>>>>>>> down the chain.
>>>>>>>> The next bridge (eg vc4_dsi) amends the mode based on 
>>>>>>>> restrictions it
>>>>>>>> has (eg burst mode link frequency). That's the end of the chain in
>>>>>>>> this case, so that's the mode that the crtc needs to be programmed
>>>>>>>> with.
>>>>>>>>
>>>>>>>> The modes then need to be passed back up the chain so that eg DSI83
>>>>>>>> knows the link frequency in use, and can therefore configure the 
>>>>>>>> PLL
>>>>>>>> appropriately.
>>>>>>>>
>>>>>>>> The bit it would be nice to fix is that burst mode has effectively
>>>>>>>> increased the horizontal front porch, but that could be fixed 
>>>>>>>> within
>>>>>>>> the bridge so that the panel gets the timing it requested.
>>>>>>>>
>>>>>>>>>>> Taking SN65DSI8[3|4|5] as an example, it supports burst mode, 
>>>>>>>>>>> and the
>>>>>>>>>>> DSI frequency and timings are permitted to be different from 
>>>>>>>>>>> that
>>>>>>>>>>> which it uses on the LVDS side. The LVDS panel and LVDS side 
>>>>>>>>>>> of DSI83
>>>>>>>>>>> need to agree over the format, and the DSI host and DSI side 
>>>>>>>>>>> of DSI83
>>>>>>>>>>> need to agree, but they may be two different timings.
>>>>>>>>>>> Register 0x0B (DSI_CLK_DIVIDER & REFCLK_MULTIPLIER) allows 
>>>>>>>>>>> you to
>>>>>>>>>>> configure the LVDS rate compared to the DSI rate (the driver 
>>>>>>>>>>> currently
>>>>>>>>>>> goes for 1:1), and registers 0x20 to 0x34 allow you to set 
>>>>>>>>>>> the number
>>>>>>>>>>> of active pixel and blanking on the LVDS side (again 
>>>>>>>>>>> currently just
>>>>>>>>>>> copied across).
>>>>>>>>>>>
>>>>>>>>>>> The way I'm seeing burst mode as having been interpreted at 
>>>>>>>>>>> present is
>>>>>>>>>>> that it's largely just a flag to say "drop to LP mode between 
>>>>>>>>>>> lines".
>>>>>>>>>>> The timing that needs to be passed to the crtc is therefore 
>>>>>>>>>>> going to
>>>>>>>>>>> be based on the DSI link rate (converted to pixels) with 
>>>>>>>>>>> increased
>>>>>>>>>>> blanking periods.
>>>>>>>>>>>
>>>>>>>>>>> I guess there are similarities with Media Controller and V4L2 
>>>>>>>>>>> here. A
>>>>>>>>>>> typical chain there could be:
>>>>>>>>>>>      sensor -> scaler -> crop -> CSI-2 receiver.
>>>>>>>>>>> The format on each of those links may be different, but the 
>>>>>>>>>>> chain as a
>>>>>>>>>>> whole needs to be valid. Media Controller largely relies on 
>>>>>>>>>>> userspace
>>>>>>>>>>> to configure all links, but with a DRM chain that isn't 
>>>>>>>>>>> really an
>>>>>>>>>>> option as it's expected that the display chain configures 
>>>>>>>>>>> itself.
>>>>>>>>>>
>>>>>>>>>> Also, the userspace has no concept of media sub-devices in 
>>>>>>>>>> DRM, so it
>>>>>>>>>> just sets the mode on the whole DRM/KMS device, unlike what 
>>>>>>>>>> v4l2 does.
>>>>>>>>>> In v4l2, afaik, if you ended up with the above scenarios it 
>>>>>>>>>> would just
>>>>>>>>>> be rejected when you set the format on the link, letting the 
>>>>>>>>>> userspace
>>>>>>>>>> figure it out. We can't really do that here
>>>>>>>>>
>>>>>>>>> I wonder how long we'll be able to keep userspace out of the 
>>>>>>>>> picture to
>>>>>>>>> configure the internals of the pipeline. I don't want to be the 
>>>>>>>>> first
>>>>>>>>> person who will have a use case that requires this.
>>>>>>>>
>>>>>>>> I suspect none of us want to be the first one to hit this scenario!
>>>>>>>>
>>>>>>>> As I've just posted on the other thread about SN65DSI83, I've hit a
>>>>>>>> major stumbling block with the current design where vc4_dsi (and
>>>>>>>> Exynos) breaks the bridge_chain so that it gets called first and 
>>>>>>>> can
>>>>>>>> do initialisation, and then it calls down the chain.
>>>>>>>> Having now converted to a DSI bridge driver, it works fine with
>>>>>>>> connected non-atomic bridges, but fails with atomic bridges.
>>>>>>>> drm_atomic_add_encoder_bridges adds the state for all the 
>>>>>>>> bridges the
>>>>>>>> framework is aware of. With the split chain it misses adding the 
>>>>>>>> state
>>>>>>>> of our "hidden" bridges, and we can't add the extra state from our
>>>>>>>> atomic_duplicate_state call as we don't have the state to add to 
>>>>>>>> (we
>>>>>>>> just return our state to be added).
>>>>>>>> This bumps up the priority for us of finding a suitable solution 
>>>>>>>> for
>>>>>>>> this initialisation issue, so I'll start looking at how feasible 
>>>>>>>> a new
>>>>>>>> DSI host function is.
>>>>>>>>
>>>>>>>> Thanks
>>>>>>>>       Dave
>>>>>>>>
>>>>>>>
>>>>>
>>>
> 

