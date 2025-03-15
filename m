Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E9FA62B36
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 11:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733E510E26A;
	Sat, 15 Mar 2025 10:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.b="0Rz1okwn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D1A10E26A
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 10:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202412;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
 Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SUgQuiihpS5x0K+ET772Aq/8KPYtzIU6EL8azg/8FuA=; b=0
 Rz1okwnyYfHu3lrvLrVGDjc+GfaQRlBUunsd5jX4/+YwGjpOOYZihIHq2q4tgXuFwVyGLtftyUCql
 6VQEz9Nz1KhmBDLAPLfwYFquVErN+aIMhhhKbEaiQyS3wW6DhV2eHi6jvO70BFEkBrthqR/GIifjN
 K2SVHZU7bbTYbW/Psqc+KdjTEUA1uN6dh2mQcwJqbeZYJ9LAKCWMHpmRnsKo5gZeOY/vvps63idvj
 W6P1Jr7M6G3aooEQ5XavbjYZqWemF4slpfs9sVkeqBeS3EHBwOAV7n1SyBdSvyANsV4+/zd14r/pO
 Lk5mA87toAN3eDvAEV78YbxZwzomA+cLQ==;
Received: from smtp by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 id 1ttOzk-00Ami1-7X; Sat, 15 Mar 2025 11:43:56 +0100
Message-ID: <727c7617-9eaf-4db9-ac43-614f11387d92@tronnes.org>
Date: Sat, 15 Mar 2025 11:43:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm: mipi_dbi_hw_reset() keeps display in reset
To: Alex Lanzano <lanzano.alex@gmail.com>,
 =?UTF-8?Q?Josef_Lu=C5=A1tick=C3=BD?= <josef.lusticky@braiins.cz>
Cc: dri-devel@lists.freedesktop.org
References: <CACnTymYtkLJ=EfZK-c1nCW+bLSKAaq2sTW1x+Bj-_ve7hfAdKA@mail.gmail.com>
 <n7qaikyyisdq3m74buqjfxzyi5lgntnsmtirrmw5vi2nkf7izl@6coklitzp3uc>
 <fm4kqbfknroub3onbbhbzvurw7ig3fsjrxpeucdtioobssstjk@hzmdxa7uby6f>
 <CACnTymYBYmGMk8z5Xp=OGBHvsA-hwJtGAi6MSHfpTGJBHMQqSw@mail.gmail.com>
 <spav7ftc45ypks3no2sgaciagym2jbd2hfcyqmforvwli47ixj@6rtvedapu342>
 <CACnTymaA5UZGRGveAOOFTtRWrWr9rnyWj8Ah6qmMOTS0dbuVNg@mail.gmail.com>
 <6he4g5se6cqu6l3bdbfv636pm62ucvzsm5ujhi2xjig7srxxqb@gagbovuujysx>
 <CACnTymbj8u_QchzC9CT2mcbg-0MPfVBs8ukwdWkJtjq_SpCvwQ@mail.gmail.com>
 <p6ajylavycnvylrn7wmtsp2rqrezkkthajszuobqsm4bhymqzz@lki2bo6ybxpz>
 <CACnTymZX7DY72Dmc0HWFvbKYzGaC3_tM-8f6EimndpPYOYf+sA@mail.gmail.com>
 <t3tzwl7eytu36klzoa5n4ccx46ffha5yt66dnla25tsxqka4s2@yzmlhufhe7qq>
Content-Language: en-US
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <t3tzwl7eytu36klzoa5n4ccx46ffha5yt66dnla25tsxqka4s2@yzmlhufhe7qq>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 15.03.2025 00:50, Alex Lanzano wrote:
> On Fri, Mar 14, 2025 at 12:57:27PM +0100, Josef Luštický wrote:
>> On Mon, Mar 10, 2025 at 7:33 PM Alex Lanzano <lanzano.alex@gmail.com> wrote:
>>>
>>> On Fri, Mar 07, 2025 at 10:25:18AM +0100, Josef Luštický wrote:
>>>> Ok, I'll implement the change and post it for a review.
>>>> About the property naming, I tend to name it something like
>>>> "inverted-reset-gpio-fixed" to denote that it is assumed the code
>>>> using the "reset-gpios" property was fixed.
>>>> What are your thoughts?
>>>>
>>>
>>> You probably wnat something more concise and in present tense like
>>> 'invert-reset-gpio'
>>
>> OK, I understand.
>> It still feels like the 'invert' would mean that the code is supposed
>> to do something non-standard with the reset-gpios property
>> specification.
>> How about 'correct-reset-gpio' or 'proper-reset-gpio' to denote that
>> the reset-gpio property describes the HW correctly.
>>
> 
> My main concern here is that the device tree properties are supposed to
> be completely independent of the driver code. So, I'd be hesitant to
> imply that a property 'fixes' a specific behavior in the driver in the
> name of the property itself (even though it does).
> 

I suggest you ask on the devicetree ML, they probably know how to handle
bugs like this.

Noralf.

> Best regards,
> Alex
> 
>>>> On Tue, Feb 25, 2025 at 2:46 PM Alex Lanzano <lanzano.alex@gmail.com> wrote:
>>>>>
>>>>> On Tue, Feb 25, 2025 at 12:59:59PM +0100, Josef Luštický wrote:
>>>>>> On Mon, Feb 24, 2025 at 12:13 AM Alex Lanzano <lanzano.alex@gmail.com> wrote:
>>>>>>>
>>>>>>> On Mon, Feb 17, 2025 at 12:39:01PM +0100, Josef Luštický wrote:
>>>>>>>> On Sat, Feb 15, 2025 at 8:14 PM Alex Lanzano <lanzano.alex@gmail.com> wrote:
>>>>>>>>>
>>>>>>>>> On Fri, Feb 14, 2025 at 08:04:41PM -0500, Alex Lanzano wrote:
>>>>>>>>>> On Fri, Feb 14, 2025 at 10:29:29AM +0100, Josef Luštický wrote:
>>>>>>>>>>> Hello Alex,
>>>>>>>>>>> there is a bug in mipi_dbi_hw_reset() function that implements the logic of
>>>>>>>>>>> display reset contrary.
>>>>>>>>>>> It keeps the reset line activated which keeps displays in reset state.
>>>>>>>>>>>
>>>>>>>>>>> I reported the bug to
>>>>>>>>>>> https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/63
>>>>>>>>>>>
>>>>>>>>>>> Unfortunately, fixing the bug would mean current DTB-ABI breakage and
>>>>>>>>>>> device-trees modification would be needed.
>>>>>>>>>>> I mainly write this email to let you and other people know about it, so
>>>>>>>>>>> hopefully it can be found easier.
>>>>>>>>>>> What are your thoughts?
>>>>>>>>>> Thanks for making me aware. I'll dig into over the weekend and get back
>>>>>>>>>> to you
>>>>>>>>>
>>>>>>>>> Alright so I looked into a bit more. Looks like the MIPI Specification
>>>>>>>>> says that the reset line is active low. So, if we want dt entries to be
>>>>>>>>> correct the logic for setting the reset line in mipi_dbi_hw_reset()
>>>>>>>>> should be flipped. However, like you said, this is going to cause a some
>>>>>>>>> confused developers to break out their oscilloscopes to figure out
>>>>>>>>> why their display isn't working.
>>>>>>>>>
>>>>>>>>> Best regards,
>>>>>>>>> Alex
>>>>>>>>
>>>>>>>> Thank you Alex for looking into this.
>>>>>>>> I think all the supported dts can be changed together with
>>>>>>>> mipi_dbi_hw_reset(), however the fix would break existing DTBs and
>>>>>>>> third party DTSs.
>>>>>>>> So I think it shall be either noted somewhere that due to this bug,
>>>>>>>> the reset line needs to be "wrongly" ACTIVE_HIGH in DTS
>>>>>>>> or the mipi_dbi_hw_reset() is changed and the compatibility is broken,
>>>>>>>> which needs to be announced.
>>>>>>>>
>>>>>>>> BTW Zephyr fixed the code [1], but they introduced the MIPI DBI
>>>>>>>> support just a couple of weeks before the fix, so they avoided the
>>>>>>>> compatibility issue.
>>>>>>>> I was not able to find users mentioning issues related to the display
>>>>>>>> not functioning properly, so I had to dig into the code.
>>>>>>>> But afterwards I found a thread on Raspberry PI forums, where one of
>>>>>>>> the moderators mentions it [2].
>>>>>>>>
>>>>>>>> [1] https://github.com/zephyrproject-rtos/zephyr/issues/68562
>>>>>>>> [2] https://forums.raspberrypi.com/viewtopic.php?p=2165720#p2165720
>>>>>>>
>>>>>>> So, here are my thoughts on this after pondering it over for a bit.
>>>>>>> Ideally we should eventually reverse the reset logic so the DTS entry
>>>>>>> correctly specifies the hardware. However, instead of an abrupt change
>>>>>>> maybe we add an additional property to the DTS node that when present
>>>>>>> uses the correct reset logic. If the property isn't present we use the
>>>>>>> current incorrect reset logic and print out a dev_warn that it will soon
>>>>>>> be deprecated.
>>>>>>>
>>>>>>> Let me know what you think.
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Alex
>>>>>>>
>>>>>>>
>>>>>> I think it's a good idea if the current logic is about to be fixed.
>>>>>> Another (probably not as good) idea is to introduce a new property
>>>>>> named "nreset-gpios = ..." or something like that, but I realise that
>>>>>> "reset-gpios" is the de-facto standard naming.
>>>>>>
>>>>>> Best regards,
>>>>>> Josef
>>>>>>
>>>>>
>>>>> Yeah I think it may be simpler to just add a boolean property like
>>>>> 'reverse-reset'. It would make the driver code simpler to implement too.
>>>>> Would you like to implement this change and submit the patch or would
>>>>> you like me to?
>>>>>
>>>>> Best regards,
>>>>> Alex

