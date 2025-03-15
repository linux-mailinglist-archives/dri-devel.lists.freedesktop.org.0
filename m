Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49626A62E2E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 15:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B914710E093;
	Sat, 15 Mar 2025 14:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FegTVAjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C73810E093
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 14:31:53 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7c5675dec99so356861885a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 07:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742049111; x=1742653911; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IscmsdmQTVEzzH32yucM4nyd6euLaurtc90NJ3s27C4=;
 b=FegTVAjMBa/l3E5P/MrnNMjm8O9kKCJEt8GQN70w3Bwi2EnMx4kums3ArCaUvHioMP
 Fwfy6EmXgyURz0CzYk8fWher5CIXbFzjKLE+CkyLaM6mEotGxyM3Sg+mn8bfCMuESpss
 3PEpRm6Ch5nreJ5gBlwBBlMzKOeh1JlyL/80vyONd8GUPXItKTEDHzcOrc8dZpeWx8dJ
 7Lc5HKHozESAEWEbEo+tCzs14hXo1xIsoqpXb/WF6HCp1yXrm28VNHRKWAytVKSgRhYy
 fd/hpBOaxZNX3CwkQw4l21APDT2JvD3WXn8a2UWsym1otTUBjgVv8Is7TQux2NBcG/PG
 lA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742049111; x=1742653911;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IscmsdmQTVEzzH32yucM4nyd6euLaurtc90NJ3s27C4=;
 b=jQcKxJZuWfZp1we0hrLkykOOks6/UxNheM3RN92J5Rfj6//dVTF3xMTJbPEt9ZqDtB
 zlXJ34PRy/hhVhvErjgOX6NBt/QcRgbPO+xvxLId4/jn6/egi4Mmr57SrIBeloJa2FRK
 4xETOX71HcjKsez5GO1ECOe5jvnjtcKFEyqzoA3J6a2J5qkWj/2OuntUF3cm7160f7sS
 vqOvQLASi25pRw1Q1vm0ubLh0GL7kqqqypVabZrSVTLJpdIGsN1r4Vv8JlVlWh0FZXUl
 eSD4RrsW7a8poWzE0spSuImrZUpg7f8Wj+54r1ASNGVQgJEtFHGx64C3XArvwKpTl46o
 VpQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL2r72W7CPICjYabHBjqciDl0yzq1KNZkLdLaVqLpT04iC8FOGgILVMxcZQs0+K3oPFVWR7n3/ZAo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz438ryQWDKBpQZT7jzglhiw37bCUCvRF/bp92Wdi/PCBitKHWJ
 aboCYfLp1u+udXjxnKzSYvUywS3Gf/x2+DQ8142WVrnrOuLtWY7wOnunlw==
X-Gm-Gg: ASbGncusy01uERzkL0fEEiY6EXDckcJyTzrVn7DgjPVPd97nnq8fEpQ8eN07+M0EE9d
 zp/WqzQtDTdxQBuQqfacyB+Boe5OpZuMbC6WDbG/ggzIkGlfr6Qe1QLHpqhffB+Lh6dajaun4jL
 XyLzeSod9euzIajDGAYBgDMS9Vxlp/M7Yum0gQv0iJzg6ZNwLQelFeJUFT4r4x5B2Bycj1IJC3X
 lbos2TlyIrcUf5GbkfNsuAlqvruOeech9jORGdSvGJ1ikX9tmkwIdDLSuXsS7D1YTM7o4mNhFLA
 cQYRpNm5l78mO6caV6T/37U2LxZj9TWuKlPY4GdaqW3WOEweyWN9c49ai5FV/CbEr6B3law=
X-Google-Smtp-Source: AGHT+IF4L2Py2YuOxeK1d2s5CPnRyXlx4pwkg/WrKa6l0XsFm4MaNdNxecR30mrROCtf++JecdEQsQ==
X-Received: by 2002:ad4:5c44:0:b0:6e6:668a:a27f with SMTP id
 6a1803df08f44-6eaeaa23bfemr103461846d6.17.1742049111514; 
 Sat, 15 Mar 2025 07:31:51 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c573d8a06esm380488485a.93.2025.03.15.07.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 07:31:50 -0700 (PDT)
Date: Sat, 15 Mar 2025 10:31:48 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: Josef =?utf-8?B?THXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>, 
 dri-devel@lists.freedesktop.org
Subject: Re: drm: mipi_dbi_hw_reset() keeps display in reset
Message-ID: <pgn5j2jsosn4tez2szkv5r6l2iodqkdiput2cd37zuirpsoobw@2ndh46c5w5yn>
References: <fm4kqbfknroub3onbbhbzvurw7ig3fsjrxpeucdtioobssstjk@hzmdxa7uby6f>
 <CACnTymYBYmGMk8z5Xp=OGBHvsA-hwJtGAi6MSHfpTGJBHMQqSw@mail.gmail.com>
 <spav7ftc45ypks3no2sgaciagym2jbd2hfcyqmforvwli47ixj@6rtvedapu342>
 <CACnTymaA5UZGRGveAOOFTtRWrWr9rnyWj8Ah6qmMOTS0dbuVNg@mail.gmail.com>
 <6he4g5se6cqu6l3bdbfv636pm62ucvzsm5ujhi2xjig7srxxqb@gagbovuujysx>
 <CACnTymbj8u_QchzC9CT2mcbg-0MPfVBs8ukwdWkJtjq_SpCvwQ@mail.gmail.com>
 <p6ajylavycnvylrn7wmtsp2rqrezkkthajszuobqsm4bhymqzz@lki2bo6ybxpz>
 <CACnTymZX7DY72Dmc0HWFvbKYzGaC3_tM-8f6EimndpPYOYf+sA@mail.gmail.com>
 <t3tzwl7eytu36klzoa5n4ccx46ffha5yt66dnla25tsxqka4s2@yzmlhufhe7qq>
 <727c7617-9eaf-4db9-ac43-614f11387d92@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <727c7617-9eaf-4db9-ac43-614f11387d92@tronnes.org>
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

On Sat, Mar 15, 2025 at 11:43:54AM +0100, Noralf Trønnes wrote:
> 
> 
> On 15.03.2025 00:50, Alex Lanzano wrote:
> > On Fri, Mar 14, 2025 at 12:57:27PM +0100, Josef Luštický wrote:
> >> On Mon, Mar 10, 2025 at 7:33 PM Alex Lanzano <lanzano.alex@gmail.com> wrote:
> >>>
> >>> On Fri, Mar 07, 2025 at 10:25:18AM +0100, Josef Luštický wrote:
> >>>> Ok, I'll implement the change and post it for a review.
> >>>> About the property naming, I tend to name it something like
> >>>> "inverted-reset-gpio-fixed" to denote that it is assumed the code
> >>>> using the "reset-gpios" property was fixed.
> >>>> What are your thoughts?
> >>>>
> >>>
> >>> You probably wnat something more concise and in present tense like
> >>> 'invert-reset-gpio'
> >>
> >> OK, I understand.
> >> It still feels like the 'invert' would mean that the code is supposed
> >> to do something non-standard with the reset-gpios property
> >> specification.
> >> How about 'correct-reset-gpio' or 'proper-reset-gpio' to denote that
> >> the reset-gpio property describes the HW correctly.
> >>
> > 
> > My main concern here is that the device tree properties are supposed to
> > be completely independent of the driver code. So, I'd be hesitant to
> > imply that a property 'fixes' a specific behavior in the driver in the
> > name of the property itself (even though it does).
> > 
> 
> I suggest you ask on the devicetree ML, they probably know how to handle
> bugs like this.
> 

Will do! Thanks!

> Noralf.
> 
> > Best regards,
> > Alex
> > 
> >>>> On Tue, Feb 25, 2025 at 2:46 PM Alex Lanzano <lanzano.alex@gmail.com> wrote:
> >>>>>
> >>>>> On Tue, Feb 25, 2025 at 12:59:59PM +0100, Josef Luštický wrote:
> >>>>>> On Mon, Feb 24, 2025 at 12:13 AM Alex Lanzano <lanzano.alex@gmail.com> wrote:
> >>>>>>>
> >>>>>>> On Mon, Feb 17, 2025 at 12:39:01PM +0100, Josef Luštický wrote:
> >>>>>>>> On Sat, Feb 15, 2025 at 8:14 PM Alex Lanzano <lanzano.alex@gmail.com> wrote:
> >>>>>>>>>
> >>>>>>>>> On Fri, Feb 14, 2025 at 08:04:41PM -0500, Alex Lanzano wrote:
> >>>>>>>>>> On Fri, Feb 14, 2025 at 10:29:29AM +0100, Josef Luštický wrote:
> >>>>>>>>>>> Hello Alex,
> >>>>>>>>>>> there is a bug in mipi_dbi_hw_reset() function that implements the logic of
> >>>>>>>>>>> display reset contrary.
> >>>>>>>>>>> It keeps the reset line activated which keeps displays in reset state.
> >>>>>>>>>>>
> >>>>>>>>>>> I reported the bug to
> >>>>>>>>>>> https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/63
> >>>>>>>>>>>
> >>>>>>>>>>> Unfortunately, fixing the bug would mean current DTB-ABI breakage and
> >>>>>>>>>>> device-trees modification would be needed.
> >>>>>>>>>>> I mainly write this email to let you and other people know about it, so
> >>>>>>>>>>> hopefully it can be found easier.
> >>>>>>>>>>> What are your thoughts?
> >>>>>>>>>> Thanks for making me aware. I'll dig into over the weekend and get back
> >>>>>>>>>> to you
> >>>>>>>>>
> >>>>>>>>> Alright so I looked into a bit more. Looks like the MIPI Specification
> >>>>>>>>> says that the reset line is active low. So, if we want dt entries to be
> >>>>>>>>> correct the logic for setting the reset line in mipi_dbi_hw_reset()
> >>>>>>>>> should be flipped. However, like you said, this is going to cause a some
> >>>>>>>>> confused developers to break out their oscilloscopes to figure out
> >>>>>>>>> why their display isn't working.
> >>>>>>>>>
> >>>>>>>>> Best regards,
> >>>>>>>>> Alex
> >>>>>>>>
> >>>>>>>> Thank you Alex for looking into this.
> >>>>>>>> I think all the supported dts can be changed together with
> >>>>>>>> mipi_dbi_hw_reset(), however the fix would break existing DTBs and
> >>>>>>>> third party DTSs.
> >>>>>>>> So I think it shall be either noted somewhere that due to this bug,
> >>>>>>>> the reset line needs to be "wrongly" ACTIVE_HIGH in DTS
> >>>>>>>> or the mipi_dbi_hw_reset() is changed and the compatibility is broken,
> >>>>>>>> which needs to be announced.
> >>>>>>>>
> >>>>>>>> BTW Zephyr fixed the code [1], but they introduced the MIPI DBI
> >>>>>>>> support just a couple of weeks before the fix, so they avoided the
> >>>>>>>> compatibility issue.
> >>>>>>>> I was not able to find users mentioning issues related to the display
> >>>>>>>> not functioning properly, so I had to dig into the code.
> >>>>>>>> But afterwards I found a thread on Raspberry PI forums, where one of
> >>>>>>>> the moderators mentions it [2].
> >>>>>>>>
> >>>>>>>> [1] https://github.com/zephyrproject-rtos/zephyr/issues/68562
> >>>>>>>> [2] https://forums.raspberrypi.com/viewtopic.php?p=2165720#p2165720
> >>>>>>>
> >>>>>>> So, here are my thoughts on this after pondering it over for a bit.
> >>>>>>> Ideally we should eventually reverse the reset logic so the DTS entry
> >>>>>>> correctly specifies the hardware. However, instead of an abrupt change
> >>>>>>> maybe we add an additional property to the DTS node that when present
> >>>>>>> uses the correct reset logic. If the property isn't present we use the
> >>>>>>> current incorrect reset logic and print out a dev_warn that it will soon
> >>>>>>> be deprecated.
> >>>>>>>
> >>>>>>> Let me know what you think.
> >>>>>>>
> >>>>>>> Best regards,
> >>>>>>> Alex
> >>>>>>>
> >>>>>>>
> >>>>>> I think it's a good idea if the current logic is about to be fixed.
> >>>>>> Another (probably not as good) idea is to introduce a new property
> >>>>>> named "nreset-gpios = ..." or something like that, but I realise that
> >>>>>> "reset-gpios" is the de-facto standard naming.
> >>>>>>
> >>>>>> Best regards,
> >>>>>> Josef
> >>>>>>
> >>>>>
> >>>>> Yeah I think it may be simpler to just add a boolean property like
> >>>>> 'reverse-reset'. It would make the driver code simpler to implement too.
> >>>>> Would you like to implement this change and submit the patch or would
> >>>>> you like me to?
> >>>>>
> >>>>> Best regards,
> >>>>> Alex
> 
