Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14FBA8A484
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 18:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EC110E0BC;
	Tue, 15 Apr 2025 16:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SJNIyXZw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1F210E0BC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 16:51:02 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28CD6594;
 Tue, 15 Apr 2025 18:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1744735737;
 bh=Bmpm8IMw8GxzzNMkCewPMbLqyv+XIJtKtxODGSPJXkI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SJNIyXZwutnW8eOmb/UTIowwNgkIFEPqxFqrXGKiO3P371O8HjKDey/J8GyrKPYN2
 0J2Kpq9fcH3iQI0SremmGJOY/FfHaV3tIUmNuuDjzrzZsCY9yUStUctGiWiPkn6p5h
 IyUvSAhN9Ivy/dZ3BWGGW5pL+ae/maART6AzQ+VM=
Message-ID: <0f7faf12-0ac1-46cb-b18a-e6890bd1b31d@ideasonboard.com>
Date: Tue, 15 Apr 2025 19:50:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: drm/bridge: Add no-hpd property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Doug Anderson <dianders@chromium.org>, Dmitry Baryshkov
 <lumag@kernel.org>, Harikrishna Shenoy <a0512644@ti.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Harikrishna Shenoy <h-shenoy@ti.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 jani.nikula@intel.com, j-choudhary@ti.com, sui.jingfeng@linux.dev,
 viro@zeniv.linux.org.uk, r-ravikumar@ti.com, sjakhade@cadence.com,
 yamonkar@cadence.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250205115025.3133487-1-h-shenoy@ti.com>
 <20250205115025.3133487-2-h-shenoy@ti.com>
 <efd89cf8-2f83-44fd-8bdf-aa348d4d9659@kernel.org>
 <h24gpx6cxm4s6gzcunjnswubtvqask5dewi3udulmntsuieklm@w3pw4ig3t7gm>
 <de0cb22d-d251-4b0b-8fc7-e8b5a891a527@ti.com>
 <vfg6hlkzmqahbswgyctzuuzcdm2aend6wmo3uci4qs74jasjtc@3hlox276hazj>
 <673e79bc-53c9-4772-ad18-8c00e4036905@ideasonboard.com>
 <CAD=FV=W45V-AZdbo4MBfZ-A9M4vf42Lda82s8iUoW5azVwM0hA@mail.gmail.com>
 <c0b2e2cb-eb31-4b49-a28b-295c0389de89@ideasonboard.com>
 <ymsrdrq3l6ws57gpwyuggc5ohapctxrozbmgs3zn6m7ovffnkm@s5rsp6qirw3t>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <ymsrdrq3l6ws57gpwyuggc5ohapctxrozbmgs3zn6m7ovffnkm@s5rsp6qirw3t>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 15/04/2025 18:40, Dmitry Baryshkov wrote:
> On Tue, Apr 15, 2025 at 03:50:46PM +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 18/03/2025 21:51, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Tue, Mar 18, 2025 at 8:50 AM Tomi Valkeinen
>>> <tomi.valkeinen@ideasonboard.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 12/03/2025 14:52, Dmitry Baryshkov wrote:
>>>>> On Wed, Mar 12, 2025 at 11:56:41AM +0530, Harikrishna Shenoy wrote:
>>>>>>
>>>>>>
>>>>>> On 05/02/25 19:03, Dmitry Baryshkov wrote:
>>>>>>> On Wed, Feb 05, 2025 at 12:52:52PM +0100, Krzysztof Kozlowski wrote:
>>>>>>>> On 05/02/2025 12:50, Harikrishna Shenoy wrote:
>>>>>>>>> From: Rahul T R <r-ravikumar@ti.com>
>>>>>>>>>
>>>>>>>>> The mhdp bridge can work without its HPD pin hooked up to the connector,
>>>>>>>>> but the current bridge driver throws an error when hpd line is not
>>>>>>>>> connected to the connector. For such cases, we need an indication for
>>>>>>>>> no-hpd, using which we can bypass the hpd detection and instead use the
>>>>>>>>> auxiliary channels connected to the DP connector to confirm the
>>>>>>>>> connection.
>>>>>>>>> So add no-hpd property to the bindings, to disable hpd when not
>>>>>>>>> connected or unusable due to DP0-HPD not connected to correct HPD
>>>>>>>>> pin on SOC like in case of J721S2.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>>>>>>>>
>>>>>>>> Why are you sending over and over the same? You already got feedback.
>>>>>>>> Then you send v2. You got the same feedback.
>>>>>>>>
>>>>>>>> Now you send v3?
>>>>>>>>
>>>>>>>> So the same feedback, but this time: NAK
>>>
>>> I only spent a few minutes on it, but I couldn't find a v2. If there's
>>> a link I'm happy to read it, but otherwise all my comments below are
>>> without any context from prior verisons...
>>
>> There was a link in the intro letter, although it seems to point to a reply
>> to the v2 thread... Here's v2 intro letter:
>>
>> https://lore.kernel.org/all/20230405142440.191939-1-j-choudhary@ti.com/
>>
>>>>>>> Krzysztof's email forced me to take a look at the actual boards that you
>>>>>>> are trying to enable. I couldn't stop by notice that the HPD signal
>>>>>>> _is_ connected to a GPIO pin. Please stop hacking the bridge driver and
>>>>>>> use the tools that are already provided to you: add the HPD pin to the
>>>>>>> dp-controller device node. And then fix any possible issues coming from
>>>>>>> the bridge driver not being able to handle HPD signals being delivered
>>>>>>> by the DRM framework via the .hpd_notify() callback.
>>>>>>>
>>>>>>> TL;DR: also a NAK from my side, add HPD gpio to dp-controller.
>>>>>>>
>>>>>> We tried implementing a interrupt based HPD functionality as HPD signal is
>>>>>> connected to GPIO0_18 pin, we were able to get interrupt based HPD working
>>>>>> however to route this signal to SoC we are loosing audio capability due to
>>>>>> MUX conflict. Due to board level limitations to
>>>>>> route the signal to SoC, we will not be able to support interrupt
>>>>>> based HPD and polling seems a possible way without loosing on audio
>>>>>> capability.
>>>>>
>>>>> Still NAK for the no-hpd property. HPD pin is a requirement for
>>>>> DisplayPort to work, as it is used e.g. for the 'attention' IRQs being
>>>>> sent by the DP sink. I'm not sure what kind of idea you HW engineers had
>>>>> in mind.
>>>>
>>>> It's true that for normal DP functionality the HPD is required, but
>>>> afaik DP works "fine" without HPD too. This is not the first board that
>>>> has DP connector, but doesn't have HPD, that I have seen or worked on.
>>>> Polling can be used for the IRQs too.
>>>
>>> I have less familiarity with DP than with eDP, but from what I know
>>> I'd agree with Tomi here that it would probably work "fine" by some
>>> definition of "fine". As Dmitry says, the "attention" IRQ wouldn't
>>> work, but as I understand it that's not really part of the normal flow
>>> of using DP. As evidence, some people have made "ti-sn65dsi86" (which
>>> is supposed to be for eDP only) work with DP. While the ti-sn65dsi86
>>> hardware _does_ support HPD, because of the forced (slow) debouncing
>>> it turned out not to be terribly useful for eDP and we designed our
>>> boards to route HPD to a GPIO. ...and because of that nobody ever
>>> wrote the code to handle the "attention" IRQ. Apparently people are
>>> still using this bridge w/ some success on DP monitors.
>>>
>>>
>>>> For eDP HPD is optional, and some of the cases I've worked with involved
>>>> a chip intended for eDP, but used with a full DP connector, and no HPD.
>>>
>>> I definitely agree. The eDP spec explicitly states that HPD is
>>> optional even though it's also documented to be an "attention" IRQ
>>> there. We've hooked up large numbers of eDP panels and the lack of the
>>> attention IRQ wasn't a problem.
>>>
>>>
>>>> However, in this particular case the DP chip supports full DP, so it's
>>>> just a board design error.
>>>>
>>>> My question is, is J721s2 EVM something that's used widely? Or is it a
>>>> rare board? If it's a rare one, maybe there's no point in solving this
>>>> in upstream? But if it's widely used, I don't see why we wouldn't
>>>> support it in upstream. The HW is broken, but we need to live with it.
>>>>
>>>> Another question is, if eDP support is added to the cdns-mhdp driver,
>>>> and used with a panel that doesn't have an HPD, how would that code look
>>>> like? If that would be solved with a "no-hpd" property, identical to the
>>>> one proposed in this series, then... There's even less reason to not
>>>> support this.
>>>>
>>>> Disclaimer: I didn't study the schematics, and I haven't thought or
>>>> looked at how eDP is implemented in other drm drivers.
>>>
>>> I spent lots of time working through this on ti-sn65dsi86. How it
>>> works today (and how it's documented in the bindings) is that it's
>>> possible to specify "no-hpd" on both the eDP panel node and on the
>>> bridge chip. They mean different things.
>>
>> As this text covers only eDP with Panel, I'll fill in some lines here about
>> DP and HDMI connectors. I think we need to consider all the cases.
>>
>>> The HPD-related properties that can be specified on the panel are
>>> a) <nothing> - HPD hooked up to the bridge
>>> b) no-hpd - HPD isn't hooked up at all
>>> c) hpd-gpios - HPD is hooked up to a GPIO
>>
>> For DP and HDMI connectors (dp-connector.yaml, hdmi-connector.yaml) we have
>> only 'hpd-gpios'. There hasn't been need for no-hpd.
>>
>>> The HPD-related properties that can be specified on ti-sn65dsi86 are:
>>> a) <nothing> - HPD is hooked up to the bridge
>>> b) no-hpd - HPD is not hooked up to the bridge
>>
>> More generally speaking (also with HDMI), I think this is device specific.
>> E.g. TFP410 doesn't have any kind of HPD support, so 'no-hpd' flag doesn't
>> make sense. That said, probably most of the chips do have HPD support, and
>> no-hpd is needed.
> 
> TFP410 has the EDGE/HTPLG pin, which should be used to monitor DVI /
> HDMI hot plugging pin.

Indeed! I had forgotten about that. All the uses of TFP410 I have seen 
have been without i2c, thus no usable HPD.

>>
>>> NOTE: The "ti-sn65dsi86" controller needs to be programmed to ignore
>>> its HPD line if HPD isn't hooked up. IIRC the hardware itself will not
>>> transfer things over the AUX bus unless you either tell the controller
>>> to ignore HPD or HPD is asserted.
>>>
>>>
>>> Here are the combinations:
>>>
>>> 1. Panel has no HPD-related properties, ti-sn65dsi86 has no
>>> HPD-related properties
>>>
>>> HPD is assumed to be hooked up to the dedicated HPD pin on the bridge.
>>> Panel driver queries the bridge driver to know the status of HPD. In
>>> Linux today ti-sn65dsi86 doesn't really implement this and the bridge
>>> chip just has a big, fixed, non-optimized delay that tries to account
>>> for the max delay any panel could need.
>>
>> For the connector case, I don't think there's any assumption about HPD in
>> this scenario. The connector does not handle the HPD, and it's up to the
>> bridge to decide if it does something about it or not.
> 
> Hmm? display-connector definitely supports HPD for DVI, HDMI and DP
> connectors.

Yes. I was mirroring the connector use case with what Doug described 
here: both the connector and the bridge with no HPD related properties. 
My point was that while Doug says HPD is assumed to be hooked up to the 
bridge, we don't have that kind of assumption in the general sense: the 
HPD may or may not be hooked up to the bridge, depends on the device. 
But the connector does not handle it.

>>
>>> 2. Panel has "hpd-gpios", ti-sn65dsi86 has no HPD-related properties
>>>
>>> In theory, I guess this would say that HPD goes _both_ to a GPIO and
>>> to the HPD of the bridge. Maybe handy if the bridge doesn't provide a
>>> "debounced" signal but still wants HPD hooked up to get the
>>> "attention" IRQ?
>>
>> Both the bridge and the panel handling HPD doesn't sound good to me...
>> For the connector case, this case would mean that the connector driver
>> handles the HPD, and the bridge doesn't. If the bridge has HPD support, I
>> think it would make sense to disable it with 'no-hpd' property (i.e. this
>> would then be case 5).
> 
> I'm not so sure. eDP / DP link has special meaning for HPD pin, so it
> might be worth handling it on both sides. I can imaging the bridge
> handling HPD pin to report attention IRQs, while GPIO is used for main
> plug / unplug detection.

Well... Maybe. One never knows what the HW guys come up with ;). But if 
the bridge handled HPD IRQ, I have hard time imagining a case where it 
couldn't also handle the plug/unplug HPD.

>>
>>> 3. Panel has "no-hpd", ti-sn65dsi86 has no HPD-related properties
>>>
>>> Doesn't really make sense. Says that panel should delay the max amount
>>> but there's no good reason to do this if HPD is hooked up on
>>> ti-sn65dsi86.
>>
>> The connectors don't have no-hpd, so this doesn't apply there.
> 
> Connectors can simply skip the hpd-gpios property which should have the
> same effect.

Right, that's what I meant. It is then case 1.

>>
>>> 4. Panel has no HPD-related properties, ti-sn65dsi86 has "no-hpd"
>>>
>>> Doesn't really make sense. Says that the panel should assume the
>>> bridge has HPD hooked up but then the bridge doesn't.
>>
>> For connectors, this would just mean no HPD at all connected (i.e. the case
>> discussed in this series).
> 
> Same as above. Connectors don't require special handling for no HPD
> case.
> 
>>
>>> 5. Panel has "hpd-gpios", ti-sn65dsi86 has "no-hpd"
>>>
>>> This is the sc7180-trogdor config. Says the panel should use the GPIO
>>> to read HPD for power sequencing purposes. Tells us that HPD is not
>>> hooked up to the bridge chip so we should program the bridge chip to
>>> ignore HPD.
>>
>> For the connector case, this would be the same as 2, except the bridge
>> requires disabling the HPD support via a property.
> 
> see above
> 
>>
>>> 6. Panel has "no-hpd", ti-sn65dsi86 has "no-hpd"
>>>
>>> Says HPD is just not hooked up at all. panel-edp will delay for
>>> "hpd-absent-delay-ms". Bridge chip should be programmed to tell the
>>> hardware to ignore the HPD signal.
>>
>> For connectors, this would be the same as 4.
>>
>>> How we got there was fairly organic and quite a long time ago, but it
>>> all sorta makes sense even if it is a bit convoluted.
>>
>> I think it makes sense, and is quite similar for connectors.
>>
>> Going back to this series, I think the no-hpd property makes sense to solve
>> the TI issue.
>>
>> However, my question about "is this needed in upstream" is still unanswered.
>> If these boards are widely available, let's add this. If there are just a
>> few boards here and there, with customers who anyway use TI BSP kernel, and
>> the next revision of the board has the issue fixed, maybe it's not worth it?
>> This change doesn't exactly make the driver cleaner or easier to maintain
>> =).
> 
> I'd say, the driver needs some cleanup, if we are to land this patch.
> I'd suggest to rework HPD enablement / disablement to use hpd_enable /
> disable functions. Make no-hpd disable OP_HPD. Make actual detect / plug
> handling tied to the hpd_notify callback, etc.

And it would be nice to get rid of the !DRM_BRIDGE_ATTACH_NO_CONNECTOR 
case in the driver.

  Tomi

