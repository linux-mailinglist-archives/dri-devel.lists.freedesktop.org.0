Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A47376E856
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 14:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D6E10E600;
	Thu,  3 Aug 2023 12:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080EB10E600
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 12:35:02 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-317744867a6so746488f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691066100; x=1691670900;
 h=content-transfer-encoding:in-reply-to:subject:organization
 :references:cc:to:content-language:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=WJJ9qJiOv0G7HMQjbiIKrFLcNirkUQDo0H5qNV9GEQA=;
 b=SJpwUC05tWzEyelJ3a2TSZaEZfWFIePkz9SCekMbUlLs+5EySWtT5nSP7WUBypiROb
 /+ldtFSlXKraSOodBFh96ITt7dDAB5ieJJMMvJ7RyNepSE6wNWXK6YJXnu2O5zvjMja1
 z+us5Zw+RrVg3IaNcjghMJGss3aKnQJ2w3lMEbyCOE0RORIjTtF96PxqYqmeMrqTelKR
 tjMGSHpmT/suG8jILy3SCwi8lNyAtmxvMLRxwwQh5g6/6neZobO2nCSnJ32091eXWENY
 eCjV70RhiFldfKSEMPkxK18LmfU9vpwGkAPQydrb0oarQzjtjNl1QzOkDWKSstoUySQ8
 2xIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691066100; x=1691670900;
 h=content-transfer-encoding:in-reply-to:subject:organization
 :references:cc:to:content-language:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WJJ9qJiOv0G7HMQjbiIKrFLcNirkUQDo0H5qNV9GEQA=;
 b=DuavWofcSJkGmIAzI2dIqOseV/yZ3zwlQrMS/Em88MaKMH+bK2IpOtk9h7Q2t2QrAK
 0KKqKES25p1qibcN4zVueYP6dAGH5QWwy7FGuxYbH0kfsFCwwxv6lwz3lIdtxO/dJ92Y
 G0lfgp+jQaPINmZTjo4B5MwI+2d6kx/4F0YarN2CoQosCaYItTF70lU4ZbpR8AIwdBSz
 4D+JP9pjZ+ZJ1kWOTqpArCDZHUEl21n5zMC9nD1Ocsh5at7oq+eC5Rs8ayGYaLBIi3dh
 qfR3C3H8c7Z/D21ENNjL5VWwdpoMA89Wvttm/PZgyAOcr/fps71E4ulbNYN6qvoFGbWk
 PzYw==
X-Gm-Message-State: ABy/qLbnlU3Wm6zXXCdxMfV6EqfthKRK/Y9nfwveUpphXeu35cUa03yj
 1lNSixiSH+7TIaTyGEdxvExGYd2NhEONYdnC8DVBnw==
X-Google-Smtp-Source: APBJJlH7eK9YiZvHBqaTZLhPa68PLhJGbb04OrulSf0llnNzG6Ksw81XL0g7UCeSVVMe8AZAN2p7UQ==
X-Received: by 2002:a05:6000:1046:b0:317:6623:e33f with SMTP id
 c6-20020a056000104600b003176623e33fmr6810018wrx.14.1691066100348; 
 Thu, 03 Aug 2023 05:35:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8656:583:d034:d966?
 ([2a01:e0a:982:cbb0:8656:583:d034:d966])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a5d6083000000b003179d5aee67sm13658067wrt.94.2023.08.03.05.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 05:34:59 -0700 (PDT)
Message-ID: <e8c395e4-23b7-b252-21a1-5f8f8c5c552a@linaro.org>
Date: Thu, 3 Aug 2023 14:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
 <292c3e7d-82ea-2631-bd4b-ef747f56287c@linaro.org>
 <ekmwiy3iuvtqtb6hwjbba2ia3aemt3dxmx6dj3zh6ljfmuim4w@4jzhqdenxth4>
 <ZMtqraOyGN9JvVj9@phenom.ffwll.local>
 <qmwtcungahbe2bhty7v2rso2kf3vai6k47muwipifbybmi7o6s@oj6lngnhyhtg>
 <CAKMK7uFbQURKYvB2JWnwZDEeA-qURpx_GFqR1FxgtuvK7jX4TA@mail.gmail.com>
 <d2sgj2iap4ouu425buqkorx76kpdqh77k3z36vaegma67pciyv@n3mbiglfidxx>
Organization: Linaro Developer Services
Subject: Re: [PATCH 0/4] drm/panel: sitronix-st7789v: add support for partial
 mode
In-Reply-To: <d2sgj2iap4ouu425buqkorx76kpdqh77k3z36vaegma67pciyv@n3mbiglfidxx>
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/08/2023 13:43, Maxime Ripard wrote:
> On Thu, Aug 03, 2023 at 12:26:03PM +0200, Daniel Vetter wrote:
>> On Thu, 3 Aug 2023 at 11:22, Maxime Ripard <mripard@kernel.org> wrote:
>>>
>>> On Thu, Aug 03, 2023 at 10:51:57AM +0200, Daniel Vetter wrote:
>>>> On Thu, Aug 03, 2023 at 10:48:57AM +0200, Maxime Ripard wrote:
>>>>> On Thu, Aug 03, 2023 at 10:11:22AM +0200, Neil Armstrong wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 18/07/2023 17:31, Michael Riesch wrote:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> This series adds support for the partial display mode to the Sitronix
>>>>>>> ST7789V panel driver. This is useful for panels that are partially
>>>>>>> occluded by design, such as the Jasonic JT240MHQS-HWT-EK-E3. Support
>>>>>>> for this particular panel is added as well.
>>>>>>>
>>>>>>> Note: This series is already based on
>>>>>>> https://lore.kernel.org/lkml/20230714013756.1546769-1-sre@kernel.org/
>>>>>>
>>>>>> I understand Maxime's arguments, but by looking closely at the code,
>>>>>> this doesn't look like an hack at all and uses capabilities of the
>>>>>> panel controller to expose a smaller area without depending on any
>>>>>> changes or hacks on the display controller side which is coherent.
>>>>>>
>>>>>> Following's Daniel's summary we cannot compare it to TV overscan
>>>>>> because overscan is only on *some* displays, we can still get 100%
>>>>>> of the picture from the signal.
>>>>>
>>>>> Still disagree on the fact that it only affects some display. But it's
>>>>> not really relevant for that series.
>>>>
>>>> See my 2nd point, from a quick grep aside from i915 hdmi support, no one
>>>> else sets all the required hdmi infoframes correctly. Which means on a
>>>> compliant hdmi tv, you _should_ get overscan. That's how that stuff is
>>>> speced.
>>>>
>>>> Iirc you need to at least set both the VIC and the content type, maybe
>>>> even more stuff.
>>>>
>>>> Unless all that stuff is set I'd say it's a kms driver bug if you get
>>>> overscan on a hdmi TV.
>>>
>>> I have no doubt that i915 works there. The source of my disagreement is
>>> that if all drivers but one don't do that, then userspace will have to
>>> care. You kind of said it yourself, i915 is kind of the exception there.
>>>
>>> The exception can be (and I'm sure it is) right, but still, it deviates
>>> from the norm.
>>
>> The right fix for these is sending the right infoframes, _not_ trying
>> to fiddle with overscan margins. Only the kernel can make sure the
>> right infoframes are sent out. If you try to paper over this in
>> userspace, you'll make the situation worse, not better (because
>> fiddling with overscan means you get scaling, and so rescaling
>> artifacts, and for hard contrasts along pixel lines that'll look like
>> crap).
>>
>> So yeah this is a case of "most upstream hdmi drivers are broken".
>> Please don't try to fix kernel bugs in userspace.
> 
> ACK.
> 
>>>>> I think I'll still like to have something clarified before we merge it:
>>>>> if userspace forces a mode, does it contain the margins or not? I don't
>>>>> have an opinion there, I just think it should be documented.
>>>>
>>>> The mode comes with the margins, so if userspace does something really
>>>> funny then either it gets garbage (as in, part of it's crtc area isn't
>>>> visible, or maybe black bars on the screen), or the driver rejects it
>>>> (which I think is the case for panels, they only take their mode and
>>>> nothing else).
>>>
>>> Panels can usually be quite flexible when it comes to the timings they
>>> accept, and we could actually use that to our advantage, but even if we
>>> assume that they have a single mode, I don't think we have anything that
>>> enforces that, either at the framework or documentation levels?
>>
>> Maybe more bugs? We've been slowly filling out all kinds of atomic kms
>> validation bugs in core/helper code because as a rule of thumb,
>> drivers get it wrong. Developers test until things work, then call it
>> good enough, and very few driver teams make a serious effort in trying
>> to really validate all invalid input. Because doing that is an
>> enormous amount of work.
>>
>> I think for clear-cut cases like drm_panel the fix is to just put more
>> stricter validation into shared code (and then if we break something,
>> figure out how we can be sufficiently lenient again).
> 
> Panels are kind of weird, since they essentially don't exist at all in
> the framework so it's difficult to make it handle them or their state.
> 
> It's typically handled by encoders directly, so each and every driver
> would need to make that check, and from a quick grep, none of them are
> (for the reasons you said).
> 
> Just like for HDMI, even though we can commit to changing those facts,
> it won't happen overnight, so to circle back to that series, I'd like a
> comment in the driver when the partial mode is enabled that if userspace
> ever pushes a mode different from the expected one, we'll add the margins.

To be fair, a majority of the panel drivers would do the wrong
init of the controller with a different mode because:
- mainly the controller model is unknown
- when it's known the datasheet is missing
- when the datasheet is here, most of the registers are missing
- and most of the time the timings are buried in the init sequence

It's sad but it's the real situation.

Only a few drivers can handle a different mode, and we should perhaps
add a flag when not set rejecting a different mode for those controllers and
mark the few ones who can handle that...
And this should be a first step before adding an atomic Panel API.

Neil

> 
> That way, if and when we come back to it, we'll know what the original
> intent and semantics were.
> 
> Maxime

