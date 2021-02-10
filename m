Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E498317484
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 00:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467386ED34;
	Wed, 10 Feb 2021 23:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D776ECC8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 18:49:21 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id g3so1721413plp.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 10:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CloQUc1U17umK7rBjEXA9Nkgqjyy37jLzHJyFOe/tgA=;
 b=a69bAPVyOU7JSl0dhgBD2I67FkznunnfwPhoEym7Iv0/tORA3cMoRgavA4+mhNeSpR
 uyFhBJLTMlHRveIVzrtaz85cTZ05Bcn9rZQWDoDMiqqRO/xDFPKeVAO4Dl3zZWqG/iQA
 pnPohnqw5EhrTBMGFNmwo1wL4bPbDlB46rB2TC6eAvXqRuu4iGWEDO6wKq6fQ/ZDcenu
 hqZl78Ec+NaeyGCD9XgNUpLVZa1i4VmngxhthieJPXJL5RS7vUtO7VGUS6+jowxCPi4w
 xw4OEyGVYVfLs888kEXTRgpVh3SPQIkT1USPcJ/vL+5vGFGhT51XuTnbOQ/7wYPLHW8P
 nfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=CloQUc1U17umK7rBjEXA9Nkgqjyy37jLzHJyFOe/tgA=;
 b=ntGrfq5R6STV38Pkt2AiOfvjnwn+3kXfBMDxJG17aNmvbtJuQvuZ6/EgP126UVgk3f
 7IPvEXAzTR7k0ImavufYk4LuG7nsf/x2ATo236qqywpv1+dMwalbJJlEbG7a8x7cPbRL
 JohqeWwZvUpqByZtlty38hCZ8cnvFz9AiWeQrwsuj58YZX896GgclH7gOrd0UTxe8unE
 /rrmvjUK9+EdAUdWN+8/FLg+QjOZ9yHNQbfg6oHuBLn/el20VDFycJSz8hrxK8mHNyJ0
 LPVujpdc6Y6/s93QUt/tf29gWCBGgvr5POo9uv2VUKVSA3oQvKBm4j55zHpEPuX3zQT5
 xqkw==
X-Gm-Message-State: AOAM5322MtQP1YrAvseIkoP0G1FXkj7/jUAX0wOTub3X6SkyYCAMH8+T
 /3BSQPRzkt6BNL7uXq4WQO4=
X-Google-Smtp-Source: ABdhPJz+flTyvln8J6vyzzyupys/jF4RMD+Ecv962pETkInzxpyxGK9yE4uIvvqD1eBxEzVcB7Qg+A==
X-Received: by 2002:a17:90a:4fe4:: with SMTP id
 q91mr248277pjh.165.1612982961183; 
 Wed, 10 Feb 2021 10:49:21 -0800 (PST)
Received: from [10.67.49.228] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id z15sm2951594pjz.41.2021.02.10.10.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 10:49:20 -0800 (PST)
Subject: Re: [PATCH v2 14/15] ARM: dts: bcm2711: Add the BSC interrupt
 controller
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Marc Zyngier <maz@kernel.org>
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-15-maxime@cerno.tech>
 <CAPY8ntC7U1BAVT8xe0emX19p4mCu-BQOeBeC-CDgKjE+asZKRQ@mail.gmail.com>
 <20210210144043.s4plyc7ekwnnu7k4@gilmour>
 <9d868bf76072fee7838b6f2ff73a575c@kernel.org>
 <CAPY8ntCG3vLy1NWNF09DEZWE-t_xc+q5m89Jv8GB8GofBLVp3Q@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <d4f8c89b-9bab-3dce-1f05-aeef39f64211@gmail.com>
Date: Wed, 10 Feb 2021 10:49:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntCG3vLy1NWNF09DEZWE-t_xc+q5m89Jv8GB8GofBLVp3Q@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 10 Feb 2021 23:36:24 +0000
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/10/21 7:49 AM, Dave Stevenson wrote:
> Hi Marc.
> 
> On Wed, 10 Feb 2021 at 15:30, Marc Zyngier <maz@kernel.org> wrote:
>>
>> Hi Maxime,
>>
>> On 2021-02-10 14:40, Maxime Ripard wrote:
>>> Hi Dave,
>>>
>>> On Tue, Feb 09, 2021 at 09:49:05AM +0000, Dave Stevenson wrote:
>>>> On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
>>>>>
>>>>> The BSC controllers used for the HDMI DDC have an interrupt controller
>>>>> shared between both instances. Let's add it to avoid polling.
>>>>
>>>> This seems to have unintended side effects.
>>>> GIC interrupt 117 is shared between the standard I2C controllers
>>>> (i2c-bcm2835) and the l2-intc block handling the HDMI I2C interrupts.
>>>>
>>>> Whilst i2c-bcm2835 requests the interrupt with IRQF_SHARED, that
>>>> doesn't appear to be an option for l2-intc registering as an interrupt
>>>> controller. i2c-bcm2835 therefore loses out and fails to register for
>>>> the interrupt.
>>>>
>>>> Is there an equivalent flag that an interrupt controller can add to
>>>> say that the parent interrupt is shared? Is that even supported?
>>>
>>> Indeed, it looks like setting an equivalent to IRQF_SHARED would be the
>>> solution, but I couldn't find anything that would allow us to in the
>>> irqchip code.
>>>
>>> Marc, Thomas, is it something that is allowed?
>>
>> No, not really. That's because the chained handler is actually an
>> interrupt flow, and not a normal handler. IRQF_SHARED acts at the wrong
>> level for that.
>>
>> I can see two possibilities:
>>
>> - the l2-intc gets turned into a normal handler, and does the demux
>>    from there. Horrible stuff.
>>
>> - the i2c controller gets parented to the l2c-int as a fake interrupt,
>>    and gets called from there. Horrible stuff.
>>
>> Pick your poison... :-/
> 
> Thanks for the info.
> 
> Option 3 - remove l2-intc and drop back to polling the i2c-brcmstb
> blocks (which the driver supports anyway).
> HDMI I2C generally isn't heavily used once displays are connected, so
> I'd be OK with that.
> 
> (We can keep the l2-intc that handles CEC and HPD as that is on a
> unique GIC interrupt).

Agreed, Maxime or Nicolas do you want me to send a revert of this patch?
-- 
Florian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
