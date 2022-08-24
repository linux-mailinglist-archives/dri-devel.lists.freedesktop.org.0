Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9048C59FFAE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 18:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F9EB71F3;
	Wed, 24 Aug 2022 16:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F39ABA1E4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 16:42:23 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bq23so15737323lfb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 09:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc;
 bh=KCOQwxQwM6kZAnVvhYHrZ6fsZ5y+7Jy5+MqGdBhDJdA=;
 b=DYxlSMiNv4JFWdFQO0qEkLxn4I59nXL1GXafWUyB5bzhB0rofZR87HD5Y6gMSKcpq2
 4obGzDZa/WCNxq7lOTRxtl4OMEum5kEp5YqmdK+GsnnLRb95zble03cuiWh63ry6oPRw
 wbIxGAmsVYjIppd+fHZuCrd783SkOnLjME0m0qUzGCqo0bUrAVimiIPK5+FkiYi0gRYj
 Mgh5pkXAa2xFRo+S9lBTffAZ5xUdnFRAAeQennj4Z+HBT4YXelGb8R5+nWySZSVoNfda
 tkiQO+GTTJDJEaaTeqSgdy164tMTzcmtZwRTh9Ex1yQXZfhZhM/SzGHYFQQby0u9YwR5
 Lkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc;
 bh=KCOQwxQwM6kZAnVvhYHrZ6fsZ5y+7Jy5+MqGdBhDJdA=;
 b=zstgp0U4tRo7/qZ7l3CXqarAuDDuVJjTLSSZlB6KD3YNzR8JjB6pN7/4++vusT2M82
 35WgzCRYq2MyqB8NRQSUJVjI1pgjihYP1s562AGA5kp+gj4C+bwU08bw5QLhAR3+uJOq
 ELkEtTbNxbMuMnEIWKnTQ+5ZlxYuquhIwv+lHOAMFtwyLi1RayxD8qJ9nAqwTd9nN4O9
 tJ6xMtYKqFDTMfJKr9O89LRzgWKwbxdAmaMqy/E+KzcZiVF1hQoTLd7fH+e9hLb7cSxo
 aeNmAhu6BKM1hfrjl07mJnnvrX1thOC6GKJYJou2rvMVpFfizUS8qHjWEmQ7lBAvY5d2
 9Epw==
X-Gm-Message-State: ACgBeo2mL5tZ0gAYDyPoTtEvNgW+wi+dzgJncozLlKGBwi7mGXDNtP2V
 HRTpZEo6hSpFAf3GrThTGwA=
X-Google-Smtp-Source: AA6agR7byvTPMQnOkLPqXZI5Jqbva8Ujm+q+uNRPwLoLbYsnpktBmgHm9nY55kdNbUME1yb4/myDiA==
X-Received: by 2002:a05:6512:31c5:b0:48b:38cf:51f8 with SMTP id
 j5-20020a05651231c500b0048b38cf51f8mr10957827lfe.315.1661359340522; 
 Wed, 24 Aug 2022 09:42:20 -0700 (PDT)
Received: from [10.10.53.53] (81-18-220-16.static.chello.pl. [81.18.220.16])
 by smtp.googlemail.com with ESMTPSA id
 g6-20020ac25386000000b00492eebe1f09sm226lfh.74.2022.08.24.09.42.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 09:42:19 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <6d1dfaad-7310-a596-34dd-4a6d9aa95f65@gmail.com>
Date: Wed, 24 Aug 2022 18:42:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>
References: <20220816132636.3tmwqmrox64pu3lt@houat>
 <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
 <20220817075351.4xpsqdngjgtiqvob@houat>
 <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat>
 <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
 <20220818123934.eim2bfrgbxsmviqx@houat>
 <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
 <20220818134200.cr22bftmjn226ehn@houat>
 <CAMuHMdX6dyQaB34oeXwiCa2rDkxks0qNh=ekqh7Wd2kSNED9TA@mail.gmail.com>
 <20220818154641.ouvrar5s74qu74zn@houat>
 <CAMuHMdUjE0mwu8z5AksW4h1OwzDCQ5h1ZoCWDi+rC4p2Pu5O4g@mail.gmail.com>
In-Reply-To: <CAMuHMdUjE0mwu8z5AksW4h1OwzDCQ5h1ZoCWDi+rC4p2Pu5O4g@mail.gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

W dniu 18.08.2022 o 17:56, Geert Uytterhoeven pisze:
> Hi Maxime,
>
> On Thu, Aug 18, 2022 at 5:46 PM Maxime Ripard <maxime@cerno.tech> wrote:
>> On Thu, Aug 18, 2022 at 05:34:30PM +0200, Geert Uytterhoeven wrote:
>>> On Thu, Aug 18, 2022 at 3:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
>>>> I started adding more sanity checks to my code, and I just realised I
>>>> don't seem to be able to reach 720 pixels over a single line though. If
>>>> I understood it properly, and according to [1] the active part of a line
>>>> is supposed to be 51.95us, and the blanking period taking 12.05us. [2]
>>>> in the timing section has pretty much the same numbers, so it looks
>>>> sane.
>>>>
>>>> At 13.5Mhz, a pixel is going to take roughly 74ns, and 51950 / 74 = 702
>>>> pixels
>>>>
>>>> It seems we can go push it to 52350 ns, but that still gives us only 706
>>>> pixels.
>>>>
>>>> Similarly, if I just choose to ignore that limit and just take the
>>>> active time I need, 720 * 74 = 53280ns
>>>>
>>>> That leaves us 10720ns for the blanking period, and that's not enough to
>>>> fit even the minimum of the front porch, hsync and back porch (1.55 +
>>>> 4.5 + 5.5 = 11.55us).
>>>>
>>>> Are those constraints merely recommendations, or am I missing something?
>>>
>>> You are missing that the parts near the borders of the full image are
>>> part of the overscan range, and may or may not be visible, depending
>>> on your actual display.
>>> The full 768x576 image size from BT.656 is not visible on a typical PAL display,
>>> and is more of an "absolute maximum rating", guaranteed to cover more
>>> than analog PAL.
>>
>> So the overscan range is not part of the active area, unlike what HDMI
>> is doing for example?
>
> Indeed. DVI-D and HDMI etc. are pure digital (let's ignore they are a
> digitized variant of old analog VGA ;-), hence there is a one-to-one
> match between pixels in the image and pixels on the screen (ignoring
> scaling).  But even when using an analog VGA input on a modern
> digital display, you have controls to e.g. move the image.
>
>> Is there some minimal timings available somewhere to fit those absolute
>> maximum ratings?
>
> I guess they can be found on the Internet...

Here are some references that I personally found useful:

- ITU-R BT.601 <https://www.itu.int/rec/R-REC-BT.601/en>
  This is *the* standard that pretty much every modern device that deals with
  analog-style TV signal follows then converting to and from the digital domain.
  For example in the figures on page 10 (12 in the PDF numbering) you can see
  that the "time datum", i.e. start of horizontal sync pulse is canonically
  supposed to happen on sample 732 for 50 Hz or sample 736 for 59.94 Hz modes.

  BT.601 assumes 13.5 MHz sample rate / pixel clock, but you can proportionally
  scale those for other pixel clocks.

- ITU-R BT.1700 <https://www.itu.int/rec/R-REC-BT.1700/en>
  This is *the* standard in force for actual analog composite video signals.
  The vertical sync specs are discrete, so they don't really change between
  analog and digital domains. For horizontal sync, the values in those specs
  are given in microseconds/nanoseconds, but you can multiply those by the
  sampling rate for equivalent pixel counts.

- Pembers' Ponderings
  <https://web.archive.org/web/20160423225838/http://www.pembers.freeserve.co.uk/>
  An old archived website with a ton of resources about analog TV.
  The "Line Standards" article will probably be most interesting to you.

By the way, please note a couple of things:

- The analog standards are very imprecise for modern digital norms, giving
  considerable leeway for just about every timing. The allowed leeways are
  usually equivalent to a couple of pixels at the standard 13.5 MHz sampling
  rate - and those are meant for the transmitting end. Receivers are usually
  much more forgiving to maximize compatibility.

- The 720-pixel standard of BT.601 is considerably wider than the active width
  specified in the analog standards. AFAIK this is intentional, to ensure that
  no part of the actual image is missed during digitization, and to keep the
  number a nice multiply of 16. The picture width given in the analog standards
  is equivalent to somewhere between 702 and 714 pixels (at 13.5 MHz clock),
  depending on the specific standard. And that includes overscan.

- Same goes for the vertical active area. Original analog standards varied
  wildly from country to country, before finally settling on 575 lines for the
  50 Hz standard and 485 lines for the 59.94 Hz standard. Or 576/486, depending
  on how you count. The topmost line of those 576/486 starts at half the screen,
  and the bottommost line ends at half the screen - so they are often combined
  when counting and given as 575/485. The digital 576i50 standard includes
  those half-lines. In the 59.94 Hz regions, 480 active digial lines ended up
  the norm, because 486 does not have nice dividers, and also some of the
  outermost lines which were always overscanned anyway, ended up used for things
  like closed captioning over the years.

- Speaking of closed captioning... a lot of different stuff were put in the
  blanking interval over the years. Like teletext in Europe. There are projects
  like VBIT2 <https://github.com/peterkvt80/vbit2> which intentionally
  reconfigure the Raspberry Pi composite output to include the blanking interval
  in the framebuffer so that teletext can be output by drawing on the edge of
  the "screen" (from the computer point of view).

- A lot of equipment outside the broadcast industry willingly violated those
  standards, and there are real world use cases for that. Film studios used very
  slightly modified TVs to make them sync with 24fps cameras - in that variant,
  "NTSC" could have e.g. 655 lines so that the TV would refresh at 48 Hz with
  the same line frequency. Home computers and video game consoles output
  progressive 262/312-line modes instead of interlaced 525/625 lines. And often
  changed the line frequency slightly as well, for various reasons. Those
  progressive modes are still favored by retro gaming and emulation enthusiasts,
  because they incur a specific look on CRT displays. Even playing back video
  from a tape (especially home-grade, like VHS) could cause timings to go wildly
  out of spec, because of mechanical imprecisions.

- There were multitude of standards predating the ubiquitous 525/60 and 625/50
  modes. The British 405-line and French 819-line standards are the most
  notorious, having lasted well into the 1980s, but there were also a lot of
  wildly varying pre-WW2 television systems. And there are enthusiasts dedicated
  to preserving those.

My point is that the norms for analog TV are rather loose, and I think we
shouldn't limit the drivers to only accepting the "proper" modes as defined in
the spec. Those should of course be the default, but if non-standard modelines
can be generated - there are legitimate use cases why people might want those.

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

Best regards,
Mateusz Kwiatkowski
