Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903F75F2E5D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 11:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFCF10E2A9;
	Mon,  3 Oct 2022 09:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BA310E2AB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 09:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664790300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Cg10+SXDpih+TiQBvpfm/H6yLbIewzjoday25U/Cls=;
 b=RqgTL1oFMQFKcUhH7kLgx8nEfQkhG91C06RFmtLjLhiF5qlEU2NUQxdoxcKq3o9DUEbmTu
 p+j6UxLlTzNlzoyAHcjRzjyJc++WceMqydPSHo8xvn/ad6JF1ftYHCRfoB/PzcuIVRpaB8
 /Pk4zV66SfwBt+006uGzbi1/9Sg6nvw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-TVtNm4ssPoeB3me3XCWlgg-1; Mon, 03 Oct 2022 05:44:59 -0400
X-MC-Unique: TVtNm4ssPoeB3me3XCWlgg-1
Received: by mail-ed1-f72.google.com with SMTP id
 v11-20020a056402348b00b004516e0b7eedso8434027edc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 02:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5Cg10+SXDpih+TiQBvpfm/H6yLbIewzjoday25U/Cls=;
 b=6IduUxjzEFU6IwMTov1rwFZDkidCH3VIRM0RAD+QA1q+kru0r3kXrX2sKJ7grZB3u4
 hoCicocMi5VLtd58qu8RxmJKhtk5FPzLWYhEP3woSKhWzamiCajI9nkIvyt2rsCHSdGX
 3d/liOdGQ/PpNWAc0hYsfzgpiMhKzpHtCSGEt2HrVJiZBgGcNeVw2Z3CW7TP0I017wTg
 IBPyHKaS76PbCZOQnjgX7cuh/f1rVMLmF3jhsvdh9ncJKAZbphRXhr+wtsjgFWnOosyf
 HL5N0HyTGAkAlpo8eey/ad3lFc7eoh0Eh5Z2+uz8h7HXyOTnkmMRadNkGlkhqrdDb4+a
 HWVg==
X-Gm-Message-State: ACrzQf1vDBh15wikVZEOT/Q2zApLIRUR9Lr3l7O4JAvN31iCc8z7hiZB
 w59bbW54csWYKEBQzZcnp0BNipGy09HLeXYYr+ukmcLdoX7QX1JF13Vv4i6/8Z8S6zGIKxFk3Ub
 kdy6/sjPXu1yGFe98EM7Io8A7E34x
X-Received: by 2002:a17:907:1c9b:b0:783:43c:10b with SMTP id
 nb27-20020a1709071c9b00b00783043c010bmr14659236ejc.320.1664790297877; 
 Mon, 03 Oct 2022 02:44:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5RtoOhz25v2pUbpgMhQDRJqtD6vJrknMajgZlqGsvrbqkdRFFUTGhjweEIEilB5ATaaU/0NQ==
X-Received: by 2002:a17:907:1c9b:b0:783:43c:10b with SMTP id
 nb27-20020a1709071c9b00b00783043c010bmr14659223ejc.320.1664790297614; 
 Mon, 03 Oct 2022 02:44:57 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a056402115700b00458a243df3esm5238954edw.65.2022.10.03.02.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 02:44:57 -0700 (PDT)
Message-ID: <44df4468-955b-0226-67e7-89467291d38f@redhat.com>
Date: Mon, 3 Oct 2022 11:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
To: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <878rm3zuge.fsf@intel.com> <YzQojrDOGNhm4D8l@intel.com>
 <YzQseBFa5EvDUDSw@intel.com>
 <CA+hFU4xRV74r3Wbs-TTWmtAkEwdJaEb+1QXUZSh52LVRwfddeA@mail.gmail.com>
 <20220930103956.1c3df79e@eldfell>
 <CA+hFU4yR542C3Qo_8ggkXKF+OZs=Pt9awsQ7Q4bXGoiv+7-VyQ@mail.gmail.com>
 <YzcAwVC8tm1imNOL@intel.com> <20220930182652.4ea10013@eldfell>
 <CA+hFU4zat+-0eW_6BaY0pbHzKxBjPtnyV5M=X=9Y0Rn8JJe8Wg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CA+hFU4zat+-0eW_6BaY0pbHzKxBjPtnyV5M=X=9Y0Rn8JJe8Wg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/30/22 18:17, Sebastian Wick wrote:
> On Fri, Sep 30, 2022 at 5:27 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>
>> On Fri, 30 Sep 2022 17:44:17 +0300
>> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>>
>>> On Fri, Sep 30, 2022 at 04:20:29PM +0200, Sebastian Wick wrote:
>>>> On Fri, Sep 30, 2022 at 9:40 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>>>>
>>>>> On Thu, 29 Sep 2022 20:06:50 +0200
>>>>> Sebastian Wick <sebastian.wick@redhat.com> wrote:
>>>>>
>>>>>> If it is supposed to be a non-linear luminance curve, which one is it?
>>>>>> It would be much clearer if user space can control linear luminance
>>>>>> and use whatever definition of perceived brightness it wants. The
>>>>>> obvious downside of it is that it requires bits to encode changes that
>>>>>> users can't perceive. What about backlights which only have a few
>>>>>> predefined luminance levels? How would user space differentiate
>>>>>> between the continuous and discrete backlight? What about
>>>>>> self-emitting displays? They usually increase the dynamic range when
>>>>>> they increase in brightness because the black level doesn't rise. They
>>>>>> also probably employ some tonemapping to adjust for that. What about
>>>>>> the range of the backlight? What about the absolute luminance of the
>>>>>> backlight? I want to know about that all in user space.
>>>>>>
>>>>>> I understand that most of the time the kernel doesn't have answers to
>>>>>> those questions right now but the API should account for all of that.
>>>>>
>>>>> Hi,
>>>>>
>>>>> if the API accounts for all that, and the kernel doesn't know, then how
>>>>> can the API not lie? If the API sometimes lies, how could we ever trust
>>>>> it at all?
>>>>
>>>> Make it possible for the API to say "I don't know". I'd much rather
>>>> have an API tell me explicitly what it does and doesn't know instead
>>>> of having to guess what data I can actually rely on.
>>>>
>>>> For example if the kernel knows the luminance is linear on one display
>>>> and doesn't know anything about the other display and it exposes them
>>>> both in the same way I can not possibly write any code which relies on
>>>> exact control over the luminance for either display.
>>>>
>>>>>
>>>>> Personally I have the feeling that if we can even get to the level of
>>>>> "each step in the value is a more or less perceivable change", that
>>>>> would be good enough. Think of UI, e.g. hotkeys to change brightness.
>>>>> You'd expect almost every press to change it a bit.
>>>>
>>>> The nice thing is that you can have that even if you have no further
>>>> information about the brightness control and it might be good enough
>>>> for some use cases but it isn't for others.
>>>>
>>>>> If an end user wants defined and controlled luminance, I'd suggest they
>>>>> need to profile (physically measure) the response of the display at
>>>>> hand. This is no different from color profiling displays, but you need
>>>>> a measurement device that produces absolute measurements if absolute
>>>>> control is what they want.
>>>>
>>>> If that's the kind of user experience you're after, good for you. I
>>>> certainly want things to work out of the box which makes this just a
>>>> big no-go.
>>>
>>> I think if we have the information to make the default behaviour
>>> better then we should do that. Ie. if the firmaware gives us a
>>> table to remap the values for a more linear response we should
>>> make use of that by default.
>>
>> But that's only like 20% of what Sebastian is asking for.
>>
>> What's "linear"? Radiometric or perceptual?
>>
>> Radiometric linear control would make a terrible UX, so if the control
>> is radiometric, userspace needs to remap it. That might be a good
>> thing, but it's also complicated, because the relationship between
>> brightness and luminance is somewhere between a power curve and
>> exponential curve. You need to make sure that the userspace remapping
>> works for different backlights with different luminance ranges. That's
>> not obvious to me.
>>
>>> We can of course provide a way for the user to plug in their own
>>> actually measured data later. But IMO that doesn't even have to
>>> happen in the initial implementation. Just need to avoid painting
>>> ourselves totally in the corner in a way that would prevent later
>>> additions like that.
>>
>> For userspace delivering its own curve, you need to define the units.
>> Absolute or relative? Radiometric or perceptual? Otherwise the
>> resulting control is not portable between window systems.
>>
>>> I just hate the current limbo where we're somehow too afraid to
>>> change the current behaviour to do the remapping by default.
>>> I see no upsides in the current behaviour of just blindly
>>> exposing the raw hardware register values more or less. They
>>> mean absolutely nothing to any user.
>>
>> I never argued like that.
>>
>> I'm saying that what looks realistic to me is somewhere *between*
>> status quo and what Sebastian is asking for. Whatever you mean by "linear
>> remapping" is probably a realistic goal, because you know you have some
>> hardware/firmware delivering that information already.
>>
>> OTOH, designing UAPI for information that exists only in our dreams
>> is... well.
> 
> I also didn't say that we should design an UAPI for what doesn't
> exist, just that we should design the UAPI we actually need in a way
> that when we get more information we can properly expose that. So if
> the UAPI exposes anything other than the luminance (e.g. "each step is
> a perceptual step in brightness", "linear brightness", ..) we have to
> put some human perception model into the kernel which is ridiculous
> and it makes it impossible to expose luminance to user space if the
> kernel has that information.
> 
> It's really easy to paint yourself into a corner here.

The problem is we are already in that corner and this is not something
which we can fix in the kernel.

I agree that we don't want to put a "human perception model" model
into the kernel. But at the same time the scale of the brightness
control methods already is widely unknown.

Simplifying things greatly there are 2 groups of brightness control
methods:

1. Some firmware interface
2. Directly programming a raw PWM output

For 1. we have no clue of the scale it might be linear electrical
power send to the backlight. But it often already has some perceived
brightness curve applied with the exact curve unknown.

For 2. The PWM might directly turn the LEDs on/off rapidly, making
the duty-cycle a 1:1 linear map of the amount of Watts consumed
by the backlight. But on some (a lot?) have the raw PWM output is
used as input to a LED driver IC which is basically a PWM controlled
current-source. There might be a 1:1 mapping here between the PWM
input and the amount of Ampere coming out of the current-source.
OTOH these backlight drive ICs often have the option to load
some PWM -> Amperage curve in them to do something like
perceived brightness again. And the amount of nits coming out
of the LEDs is also not a linear function of the Amperage going
into the LEDs.

Sebastian, I understand that you would really like a control
where you can just say, amount of nits coming form the screen
is 100 / 200 / 400 (when screen is fully white). But we don't
even know how many nits the backlight (or OLEDs) will send
at full brightness settings, we don't know what if any curve
is being applied by the firmware and/or by some backlight driver
IC and even if knew all that the amount of nits will change
over time due to wear and tear.

So I understand that in an ideal world you would want all this
info for HDR support, but we simply do not have it.

So for now it is important to at least move brightness control
into KMS using a simple uAPI where the only thing we can really
say about the scale is higher values result in a higher brightness.

And then once that is in place we can look at trying to export
more information; in so far as we have that information.

One example mentioned here is that laptops with Intel integrated
graphics may have some "perceived brightness" mapping table
in their Video BIOS Tables (VBT) it would be interesting to use
this and to export the curve coming from that to userspace as
extra information (including allow userspace to write it).
Since in this case (unlike many other cases) at least this
curve is done in the kernel I guess we can then also add a boolean
property to disable the curve (making it linear) in case that
is helpful for HDR scenarios.

But I'm afraid that for now we really need to play it by ear
here since so much of what you want is hidden from the kernel
and will differ greatly from one model laptop to the next.

Regards,

Hans

