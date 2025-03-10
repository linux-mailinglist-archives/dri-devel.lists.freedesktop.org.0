Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F944A5A2F7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 19:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4054910E4BD;
	Mon, 10 Mar 2025 18:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hJkpJefg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2284310E4BD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 18:33:19 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6feb229b716so41044127b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 11:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741631598; x=1742236398; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=r3YXhamQojbHtJJvdyYIQwmP7+xllN6ycD91lj4YM/k=;
 b=hJkpJefgM5MOYZtvPncqLf2821b2MzxW/NaSbGdwJAIwelEChlT95Nn9Jb5hEAz7Ri
 YwWzxW9RrEZ9sccBFqnerRHMuyXKCIKa3PfYzTPlzhsFRUt719XmG9UEWgC+tIVwy34Q
 rmqlZipWPl6m6fxeDieRGMUzoO7h/q41aUjg2Af4ubnwmbZYh7RkycLtt3ezNgMMH49y
 kkH/5uEiGIdJG8801ZwRuq40JU6vj7iQzaDEjIclDBuT+Cy98YknNNQnC+I8ATBxWb0g
 1LDnIWiGSzuGzNxhsrxoiW9QPZGzDZ48YV7cmkEcKJPqfZswE1EMWxf14hYhokVvatTT
 ugsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741631598; x=1742236398;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r3YXhamQojbHtJJvdyYIQwmP7+xllN6ycD91lj4YM/k=;
 b=ZlKUr8oYse8b/EMR2MYMLGeXRj54l1Zgpe0QHIsokc2R8S7+PUXa0fhi44+/OuRjeA
 vGNk4TiJUVPOyPFk2Ai0qGI71jM3YtIwotxXg1BtbVa+QKfXYb9gOE1X9NT8TwMoWbk5
 dFXNQYoWmBAcZBAszerFk4G3WHZ1Niuw/6i0Pzfdo5VZe6MTWbmXDxMoyFZF0feDGJEP
 RNj0SPPDPbyChwWMu3lT04Wji6LSjQF4R6R9NQftDHkK7GKSgfVHHfnMA34DG/7naSoL
 3F1biMEiDmoVbUQ/seP2LOjqre6PqEr95rCz/VF0VAVML3omeefEJZJ8xD+uSYwdeKq9
 sjow==
X-Gm-Message-State: AOJu0YxwMvjBoboG/JcyaNGjY4SrNPLXs6msB4mrgVnDnZtLS/qS2hUt
 uWHsfZSKeQeFArDKC92URBk2L/CXmhDem8AgMsLcvdZOfz0DJraP
X-Gm-Gg: ASbGncuEuiNkRv7cpdDy3IyBq0Wxi8Lb2jZjd0huscaxkkGuKeSOXXnf+1Hx3+XGKmP
 qsL0diMML4KaWQU6K/EMGN/Ml+WLgGKP46VUq9WwL6yvCekItAMDJsCUSOa7aFD7VBI2lK1wpDV
 wmWIXTRM0LfLlSAWurytXIpARdc+/FdX4QL6ZizvsR8ylAoYgPcOzuVp2lQyASPJQhx7vb73Ofu
 ruysVNzgHT2GwJZHbIgjpckWY3BAiPLPFVDthZxD0UzhF0On1et/JaTe6VgK4wQWUQz0KS6Mv/D
 iOGrYuk4GJbGThiv1On0PLCn3GWDHEg6MYE0bEdzs+EVGQ==
X-Google-Smtp-Source: AGHT+IG9x3RNxbucQwyhnEXEtB1I7ZsqaQu2W4mSyd/Nl6ytgjOLcoEVhj+IM0h5reI8GpfKddxcUw==
X-Received: by 2002:a05:690c:6c02:b0:6fd:2321:567f with SMTP id
 00721157ae682-6febf2a660emr165289867b3.8.1741631598363; 
 Mon, 10 Mar 2025 11:33:18 -0700 (PDT)
Received: from VM-Arch ([2601:6c0:c200:fc20:4cad:74f0:cdb0:1c6d])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-6feb2a1bfb8sm22417827b3.8.2025.03.10.11.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 11:33:17 -0700 (PDT)
Date: Mon, 10 Mar 2025 14:33:15 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Josef =?utf-8?B?THXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>
Cc: dri-devel@lists.freedesktop.org, noralf@tronnes.org
Subject: Re: drm: mipi_dbi_hw_reset() keeps display in reset
Message-ID: <p6ajylavycnvylrn7wmtsp2rqrezkkthajszuobqsm4bhymqzz@lki2bo6ybxpz>
References: <CACnTymYtkLJ=EfZK-c1nCW+bLSKAaq2sTW1x+Bj-_ve7hfAdKA@mail.gmail.com>
 <n7qaikyyisdq3m74buqjfxzyi5lgntnsmtirrmw5vi2nkf7izl@6coklitzp3uc>
 <fm4kqbfknroub3onbbhbzvurw7ig3fsjrxpeucdtioobssstjk@hzmdxa7uby6f>
 <CACnTymYBYmGMk8z5Xp=OGBHvsA-hwJtGAi6MSHfpTGJBHMQqSw@mail.gmail.com>
 <spav7ftc45ypks3no2sgaciagym2jbd2hfcyqmforvwli47ixj@6rtvedapu342>
 <CACnTymaA5UZGRGveAOOFTtRWrWr9rnyWj8Ah6qmMOTS0dbuVNg@mail.gmail.com>
 <6he4g5se6cqu6l3bdbfv636pm62ucvzsm5ujhi2xjig7srxxqb@gagbovuujysx>
 <CACnTymbj8u_QchzC9CT2mcbg-0MPfVBs8ukwdWkJtjq_SpCvwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACnTymbj8u_QchzC9CT2mcbg-0MPfVBs8ukwdWkJtjq_SpCvwQ@mail.gmail.com>
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

On Fri, Mar 07, 2025 at 10:25:18AM +0100, Josef Luštický wrote:
> Ok, I'll implement the change and post it for a review.
> About the property naming, I tend to name it something like
> "inverted-reset-gpio-fixed" to denote that it is assumed the code
> using the "reset-gpios" property was fixed.
> What are your thoughts?
> 

You probably wnat something more concise and in present tense like
'invert-reset-gpio'

Best regards,
Alex

> On Tue, Feb 25, 2025 at 2:46 PM Alex Lanzano <lanzano.alex@gmail.com> wrote:
> >
> > On Tue, Feb 25, 2025 at 12:59:59PM +0100, Josef Luštický wrote:
> > > On Mon, Feb 24, 2025 at 12:13 AM Alex Lanzano <lanzano.alex@gmail.com> wrote:
> > > >
> > > > On Mon, Feb 17, 2025 at 12:39:01PM +0100, Josef Luštický wrote:
> > > > > On Sat, Feb 15, 2025 at 8:14 PM Alex Lanzano <lanzano.alex@gmail.com> wrote:
> > > > > >
> > > > > > On Fri, Feb 14, 2025 at 08:04:41PM -0500, Alex Lanzano wrote:
> > > > > > > On Fri, Feb 14, 2025 at 10:29:29AM +0100, Josef Luštický wrote:
> > > > > > > > Hello Alex,
> > > > > > > > there is a bug in mipi_dbi_hw_reset() function that implements the logic of
> > > > > > > > display reset contrary.
> > > > > > > > It keeps the reset line activated which keeps displays in reset state.
> > > > > > > >
> > > > > > > > I reported the bug to
> > > > > > > > https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/63
> > > > > > > >
> > > > > > > > Unfortunately, fixing the bug would mean current DTB-ABI breakage and
> > > > > > > > device-trees modification would be needed.
> > > > > > > > I mainly write this email to let you and other people know about it, so
> > > > > > > > hopefully it can be found easier.
> > > > > > > > What are your thoughts?
> > > > > > > Thanks for making me aware. I'll dig into over the weekend and get back
> > > > > > > to you
> > > > > >
> > > > > > Alright so I looked into a bit more. Looks like the MIPI Specification
> > > > > > says that the reset line is active low. So, if we want dt entries to be
> > > > > > correct the logic for setting the reset line in mipi_dbi_hw_reset()
> > > > > > should be flipped. However, like you said, this is going to cause a some
> > > > > > confused developers to break out their oscilloscopes to figure out
> > > > > > why their display isn't working.
> > > > > >
> > > > > > Best regards,
> > > > > > Alex
> > > > >
> > > > > Thank you Alex for looking into this.
> > > > > I think all the supported dts can be changed together with
> > > > > mipi_dbi_hw_reset(), however the fix would break existing DTBs and
> > > > > third party DTSs.
> > > > > So I think it shall be either noted somewhere that due to this bug,
> > > > > the reset line needs to be "wrongly" ACTIVE_HIGH in DTS
> > > > > or the mipi_dbi_hw_reset() is changed and the compatibility is broken,
> > > > > which needs to be announced.
> > > > >
> > > > > BTW Zephyr fixed the code [1], but they introduced the MIPI DBI
> > > > > support just a couple of weeks before the fix, so they avoided the
> > > > > compatibility issue.
> > > > > I was not able to find users mentioning issues related to the display
> > > > > not functioning properly, so I had to dig into the code.
> > > > > But afterwards I found a thread on Raspberry PI forums, where one of
> > > > > the moderators mentions it [2].
> > > > >
> > > > > [1] https://github.com/zephyrproject-rtos/zephyr/issues/68562
> > > > > [2] https://forums.raspberrypi.com/viewtopic.php?p=2165720#p2165720
> > > >
> > > > So, here are my thoughts on this after pondering it over for a bit.
> > > > Ideally we should eventually reverse the reset logic so the DTS entry
> > > > correctly specifies the hardware. However, instead of an abrupt change
> > > > maybe we add an additional property to the DTS node that when present
> > > > uses the correct reset logic. If the property isn't present we use the
> > > > current incorrect reset logic and print out a dev_warn that it will soon
> > > > be deprecated.
> > > >
> > > > Let me know what you think.
> > > >
> > > > Best regards,
> > > > Alex
> > > >
> > > >
> > > I think it's a good idea if the current logic is about to be fixed.
> > > Another (probably not as good) idea is to introduce a new property
> > > named "nreset-gpios = ..." or something like that, but I realise that
> > > "reset-gpios" is the de-facto standard naming.
> > >
> > > Best regards,
> > > Josef
> > >
> >
> > Yeah I think it may be simpler to just add a boolean property like
> > 'reverse-reset'. It would make the driver code simpler to implement too.
> > Would you like to implement this change and submit the patch or would
> > you like me to?
> >
> > Best regards,
> > Alex
