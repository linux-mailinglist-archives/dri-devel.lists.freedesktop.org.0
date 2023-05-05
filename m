Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE25B6F8732
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 19:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003BF10E044;
	Fri,  5 May 2023 17:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0B510E044
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 17:02:01 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-3f315712406so107195505e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 10:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=froggi.es; s=google; t=1683306120; x=1685898120;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MdO8scax03xH5AsYuAJkpQ2H175QRbZjuf159kgL8ic=;
 b=AsSyvFBZbgsk+HxEqGYPznFQacN6/wNxFKFD3BbxAr5amsCidLSW5cQJ398TvXsiEn
 A9K7kxZ6Enm6Gwexmy2Yim8WlHAJEiD8Yw1lQBIL1j+JVeQKjKyBAbu8wJ2ikhie285t
 z7JBWuk46w2oN14SQyOiKkiUkftHUMjvNmyjXYe4zqQ04e0inq5oMFutfD7UCXQs+KsD
 VDyjmC7a9zWXlAtdlooT5rUG2iyMhvnyrqpcVPesNmU917AtvTG23uep1SgUcSyyHo2n
 XS8zesF/3T8yxGUaq44QWQ4JfqMP1kgZ66GRWMMYr2gZzzL+g9c3eDs5ceDCduZ/plDG
 GMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683306120; x=1685898120;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MdO8scax03xH5AsYuAJkpQ2H175QRbZjuf159kgL8ic=;
 b=DEOlzlrDs9wakq0Z2k4HOMLzsI/Vb3laXIjw6OuA0apw1Q2JEnIfI9oMjXk+P0aaIa
 8Ulyp9lN5kTrL+dxsvO02CxEXfZis3l/M5dfha7i3QC1Se4jhBdBbooqtdn6T1T25f98
 gmdY4t5fjM1+fiGm4EWMHZlRgxykmzXyqfCjPXvNhRixhRUYAdB7pCU8yUN2tE81G00T
 wEGEB+xMVyDlD68uLZhzBDbDDoqM/GeMp0+ALeGc+poL1UB4Bph9RpS69qMaos177P0F
 rgEeDdXXiRjdM1kcd978gb0prFhk+LbaBom0zvf8+QRCsG90QY9/kQURs9KYCmNJVJoR
 2goA==
X-Gm-Message-State: AC+VfDxBo2MlqRbL9+rvqMEa/MU6j7gulzZcYnyZn5asjRwdoxPTqKoO
 sfUo1cz7NMelvxpHw0tCXrV/OA==
X-Google-Smtp-Source: ACHHUZ4T/DU2FcqK37E4UVyl9a0ITnM5sYndhaMMmVk7UzU/vfiiyosVBV5T0FudoFl2kYjSp9cTBA==
X-Received: by 2002:a05:600c:540b:b0:3f1:6fb4:5645 with SMTP id
 he11-20020a05600c540b00b003f16fb45645mr2439087wmb.1.1683306119743; 
 Fri, 05 May 2023 10:01:59 -0700 (PDT)
Received: from [192.168.0.89]
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c379200b003f17300c7dcsm8455367wmr.48.2023.05.05.10.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 10:01:59 -0700 (PDT)
Message-ID: <8d233894-d168-efdf-8c6c-deb3d0917eb7@froggi.es>
Date: Fri, 5 May 2023 18:01:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <20230505144150.741a90e1@eldfell>
 <CAEZNXZDnCeZKTJvTwFYnrECzjLc+WEhUG5y-GBDmOeoMBCdJ+A@mail.gmail.com>
 <20230505171622.1c83ff1e@eldfell>
From: Joshua Ashton <joshua@froggi.es>
In-Reply-To: <20230505171622.1c83ff1e@eldfell>
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
Cc: "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Sebastian Wick <sebastian.wick@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/5/23 15:16, Pekka Paalanen wrote:
> On Fri, 5 May 2023 14:30:11 +0100
> Joshua Ashton <joshua@froggi.es> wrote:
> 
>> Some corrections and replies inline.
>>
>> On Fri, 5 May 2023 at 12:42, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>>
>>> On Thu, 04 May 2023 15:22:59 +0000
>>> Simon Ser <contact@emersion.fr> wrote:
> 
> ...
> 
>>>> To wrap things up, let's take a real-world example: how would gamescope [2]
>>>> configure the AMD DCN 3.0 hardware for its color pipeline? The gamescope color
>>>> pipeline is described in [3]. The AMD DCN 3.0 hardware is described in [4].
>>>>
>>>> AMD would expose the following objects and properties:
>>>>
>>>>      Plane 10
>>>>      ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
>>>>      └─ "color_pipeline": enum {0, 42} = 0
>>>>      Color operation 42 (input CSC)
>>>>      ├─ "type": enum {Bypass, Matrix} = Matrix
>>>>      ├─ "matrix_data": blob
>>>>      └─ "next": immutable color operation ID = 43
>>>>      Color operation 43
>>>>      ├─ "type": enum {Scaling} = Scaling
>>>>      └─ "next": immutable color operation ID = 44
>>>>      Color operation 44 (DeGamma)
>>>>      ├─ "type": enum {Bypass, 1D curve} = 1D curve
>>>>      ├─ "1d_curve_type": enum {sRGB, PQ, …} = sRGB
>>>>      └─ "next": immutable color operation ID = 45
>>
>> Some vendors have per-tap degamma and some have a degamma after the sample.
>> How do we distinguish that behaviour?
>> It is important to know.
> 
> ...
> 
>>> Btw. ISTR that if you want to do scaling properly with alpha channel,
>>> you need optical values multiplied by alpha. Alpha vs. scaling is just
>>> yet another thing to look into, and TF operations do not work with
>>> pre-mult.
>>
>> What are your concerns here?
> 
> I believe this is exactly the same question as yours about sampling, at
> least for up-scaling where sampling the framebuffer interpolates in
> some way.
> 
> Oh, interpolation mode would fit in the scaling COLOROP...
> 
>> Having pre-multiplied alpha is fine with a TF: the alpha was
>> premultiplied in linear, then encoded with the TF by the client.
> 
> There are two different ways to pre-multiply: into optical values
> (okay), and into electrical values (what everyone actually does, and
> what Wayland assumes by default).
> 
> What you described is the thing mostly no-one does in GUI graphics.
> Even in the web.

Yeah, I have seen this problem many times before in different fields.

There are not many transparent clients that I know of (most of them are 
Gamescope Overlays), but the ones I do know of do actually do the 
premultiply in linear space (mainly because they use sRGB image views 
for their color attachments so it gets handled for them).

 From my perspective and experience, we definitely shouldn't do anything 
to try and 'fix' apps doing their premultiply in the wrong space.

I've had to deal with this before in game development on a transparent 
HUD, and my solution and thinking for that was:
It was authored (or "mastered") with this behaviour in mind. So that's 
what we should do.
It felt bad to 'break' the blending on the HUD of that game, but it 
looked better, and it was what was intended before it was 'fixed' in a 
later engine version.

It is still definitely interesting to think about, but I don't think 
presents a problem at all.
In fact, doing anything would just 'break' the expected behaviour of apps.

> 
>> If you think of a TF as something something relative to a bunch of
>> reference state or whatever then you might think "oh you can't do
>> that!", but you really can.
>> It's really best to just think of it as a mathematical encoding of a
>> value in all instances that we touch.
> 
> True, except when it's false. If you assume that decoding is the exact
> mathematical inverse of encoding, then your conclusion follows.
> 
> Unfortunately many video standards do not have it so. BT.601, BT.709,
> and I forget if BT.2020 (SDR) as well encode with one function and
> decode with something that is not the inverse, and it is totally
> intentional and necessary mangling of the values to get the expected
> result on screen. Someone has called this "implicit color management".
> 
> So one needs to be very careful here what the actual characteristics
> are.
> 
>> The only issue is that you lose precision from having pre-multiplied
>> alpha as it's quantized to fit into the DRM format rather than using
>> the full range then getting divided by the alpha at blend time.
>> It doesn't end up being a visible issue ever however in my experience, at 8bpc.
> 
> That's true. Wait, why would you divide by alpha for blending?
> Blending/interpolation is the only operation where pre-mult is useful.

I mis-spoke, I meant multiply.

- Joshie 🐸✨

> 
> 
> Thanks,
> pq
> 
>>
>> Thanks
>>   - Joshie 🐸✨
>>
>>>
>>>
>>> Thanks,
>>> pq
>>>   
>>>>
>>>> I hope comparing these properties to the diagrams linked above can help
>>>> understand how the uAPI would be used and give an idea of its viability.
>>>>
>>>> Please feel free to provide feedback! It would be especially useful to have
>>>> someone familiar with Arm SoCs look at this, to confirm that this proposal
>>>> would work there.
>>>>
>>>> Unless there is a show-stopper, we plan to follow up this RFC with
>>>> implementations for AMD, Intel, NVIDIA, gamescope, and IGT.
>>>>
>>>> Many thanks to everybody who contributed to the hackfest, on-site or remotely!
>>>> Let's work together to make this happen!
>>>>
>>>> Simon, on behalf of the hackfest participants
>>>>
>>>> [1]: https://wiki.gnome.org/Hackfests/ShellDisplayNext2023
>>>> [2]: https://github.com/ValveSoftware/gamescope
>>>> [3]: https://github.com/ValveSoftware/gamescope/blob/5af321724c8b8a29cef5ae9e31293fd5d560c4ec/src/docs/Steam%20Deck%20Display%20Pipeline.png
>>>> [4]: https://kernel.org/doc/html/latest/_images/dcn3_cm_drm_current.svg
>>>   
> 

