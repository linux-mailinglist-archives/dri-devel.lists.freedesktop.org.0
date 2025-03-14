Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF674A6223F
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 00:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DA710E127;
	Fri, 14 Mar 2025 23:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hK/j0pa+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B91E10E127
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 23:50:12 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7be6fdeee35so472103585a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741996210; x=1742601010; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cqYnxiSMYvmBOaFany9XEZ67aki9B8yvTgR+K17ddzA=;
 b=hK/j0pa+3b3Zs6UIc/kqLL/Pn2yHZV6VjENuDGQPJgB+P5VEh0+JnsrbTA5sqOD2mt
 esLdbem/Z3h/TofuYY2P0uAPVShnc3mVY4S8McpXV1GlRRr3JWj3FBkpGSQ7fvNICWe0
 aT/+XNNTgBb6uxnPzSp1P7nnCxDlCMu7hyBMJJukQJ7qnjqLSzW55F1G7v2wRAUvLCFy
 ql9KbSnZvmWmjSccZI+4AZJILAHsDqgZY4vq0w6sr0Ty97mMrjN3fQiJ+wMEXKSJEyIK
 wpTrI41vQqQi7TazcD3rde38tX3Cxv9W9T+9IXlVVTSMdtIb6nT1VL5/3qOdecrVwlw+
 m7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741996210; x=1742601010;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cqYnxiSMYvmBOaFany9XEZ67aki9B8yvTgR+K17ddzA=;
 b=ZVCHDEYPpA7L2bVShRCcYFDAgMg1E7/EsylrtXDjey3yC2EHQ73b3tw3qkboJrKv3+
 /V9dVcFhjCpug3Lfc1wlv9iWeUarFnQsQ9r2Edu8vrHJv71a0AYSetjIeGDHlECwIxA7
 E6e4wgSwkALQra1cAH3q+TheZ/cG+w2tUWR4uthyjhnud/z8LEMyGOq8Ev69Ir+HaQ1n
 ojzkXnQiuLfoVm95fnFbXjw7HZ3QdPQZmIr60XwDBRBVXKEbuqRMwUcKwYXDE7pNtSff
 K9SNmdgZMj1WW5j+00gxxVPwnfO1OZVlBp1LLQdGP3V4033qaeJf+bXK64fmE6naSr20
 7NpA==
X-Gm-Message-State: AOJu0YzquMold/9aRjAbAAqeUYDbfBJhInshpnMTnjNvPbHXwPFVGrWE
 D37XC7Cyqjn4RYCzDf+SsUJvPnE99gjQQ6RsyqOfPNrmB0DlEQ8R
X-Gm-Gg: ASbGncvBxIFGc5FhVbMwSGfq8B4ENfuvb5hPJYJBdDfGLDyedDSR+uQyWU8lH7+oOPN
 RBxsZXx4PyN9GZQVgQOC634MWSuSggrrYeqLQvTgHnkF9ypDu2st9kZTSpTLn6DrJLEmTqRiYXc
 pWSxwQPsDC/dMnRtW/pvLHXWuL/qG0maB7B2Po20dF7vePLFUSnbAquLhWKlO1GP104GxdJ4GSh
 BGH4q6tATgDLc/YERStNwQdtjMuRx7K+XfYfvZ/VBVy12TpWMqeVSuWVuauwsV1IE8uWyUGUqYx
 tyYq5Z4Gd5WdYr4cO3KwDmhELbv2Vi2Z7sSsuVMw1z9FhLg8x9lkW1kMundLwGcLQuHGloU=
X-Google-Smtp-Source: AGHT+IEOGc8aUH55gpp8rGjq9lTQwTINxyWXJzrVnTAyG5Q4vTiUt0MML9jmhlDco+BeHvsPOLcnMA==
X-Received: by 2002:a05:620a:1a22:b0:7c5:3e22:616f with SMTP id
 af79cd13be357-7c57c7d4526mr642316385a.21.1741996210269; 
 Fri, 14 Mar 2025 16:50:10 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c573c4dd2bsm315219385a.14.2025.03.14.16.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 16:50:09 -0700 (PDT)
Date: Fri, 14 Mar 2025 19:50:06 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Josef =?utf-8?B?THXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>
Cc: dri-devel@lists.freedesktop.org, noralf@tronnes.org
Subject: Re: drm: mipi_dbi_hw_reset() keeps display in reset
Message-ID: <t3tzwl7eytu36klzoa5n4ccx46ffha5yt66dnla25tsxqka4s2@yzmlhufhe7qq>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACnTymZX7DY72Dmc0HWFvbKYzGaC3_tM-8f6EimndpPYOYf+sA@mail.gmail.com>
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

On Fri, Mar 14, 2025 at 12:57:27PM +0100, Josef Luštický wrote:
> On Mon, Mar 10, 2025 at 7:33 PM Alex Lanzano <lanzano.alex@gmail.com> wrote:
> >
> > On Fri, Mar 07, 2025 at 10:25:18AM +0100, Josef Luštický wrote:
> > > Ok, I'll implement the change and post it for a review.
> > > About the property naming, I tend to name it something like
> > > "inverted-reset-gpio-fixed" to denote that it is assumed the code
> > > using the "reset-gpios" property was fixed.
> > > What are your thoughts?
> > >
> >
> > You probably wnat something more concise and in present tense like
> > 'invert-reset-gpio'
> 
> OK, I understand.
> It still feels like the 'invert' would mean that the code is supposed
> to do something non-standard with the reset-gpios property
> specification.
> How about 'correct-reset-gpio' or 'proper-reset-gpio' to denote that
> the reset-gpio property describes the HW correctly.
> 

My main concern here is that the device tree properties are supposed to
be completely independent of the driver code. So, I'd be hesitant to
imply that a property 'fixes' a specific behavior in the driver in the
name of the property itself (even though it does).

Best regards,
Alex

> > > On Tue, Feb 25, 2025 at 2:46 PM Alex Lanzano <lanzano.alex@gmail.com> wrote:
> > > >
> > > > On Tue, Feb 25, 2025 at 12:59:59PM +0100, Josef Luštický wrote:
> > > > > On Mon, Feb 24, 2025 at 12:13 AM Alex Lanzano <lanzano.alex@gmail.com> wrote:
> > > > > >
> > > > > > On Mon, Feb 17, 2025 at 12:39:01PM +0100, Josef Luštický wrote:
> > > > > > > On Sat, Feb 15, 2025 at 8:14 PM Alex Lanzano <lanzano.alex@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Fri, Feb 14, 2025 at 08:04:41PM -0500, Alex Lanzano wrote:
> > > > > > > > > On Fri, Feb 14, 2025 at 10:29:29AM +0100, Josef Luštický wrote:
> > > > > > > > > > Hello Alex,
> > > > > > > > > > there is a bug in mipi_dbi_hw_reset() function that implements the logic of
> > > > > > > > > > display reset contrary.
> > > > > > > > > > It keeps the reset line activated which keeps displays in reset state.
> > > > > > > > > >
> > > > > > > > > > I reported the bug to
> > > > > > > > > > https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/63
> > > > > > > > > >
> > > > > > > > > > Unfortunately, fixing the bug would mean current DTB-ABI breakage and
> > > > > > > > > > device-trees modification would be needed.
> > > > > > > > > > I mainly write this email to let you and other people know about it, so
> > > > > > > > > > hopefully it can be found easier.
> > > > > > > > > > What are your thoughts?
> > > > > > > > > Thanks for making me aware. I'll dig into over the weekend and get back
> > > > > > > > > to you
> > > > > > > >
> > > > > > > > Alright so I looked into a bit more. Looks like the MIPI Specification
> > > > > > > > says that the reset line is active low. So, if we want dt entries to be
> > > > > > > > correct the logic for setting the reset line in mipi_dbi_hw_reset()
> > > > > > > > should be flipped. However, like you said, this is going to cause a some
> > > > > > > > confused developers to break out their oscilloscopes to figure out
> > > > > > > > why their display isn't working.
> > > > > > > >
> > > > > > > > Best regards,
> > > > > > > > Alex
> > > > > > >
> > > > > > > Thank you Alex for looking into this.
> > > > > > > I think all the supported dts can be changed together with
> > > > > > > mipi_dbi_hw_reset(), however the fix would break existing DTBs and
> > > > > > > third party DTSs.
> > > > > > > So I think it shall be either noted somewhere that due to this bug,
> > > > > > > the reset line needs to be "wrongly" ACTIVE_HIGH in DTS
> > > > > > > or the mipi_dbi_hw_reset() is changed and the compatibility is broken,
> > > > > > > which needs to be announced.
> > > > > > >
> > > > > > > BTW Zephyr fixed the code [1], but they introduced the MIPI DBI
> > > > > > > support just a couple of weeks before the fix, so they avoided the
> > > > > > > compatibility issue.
> > > > > > > I was not able to find users mentioning issues related to the display
> > > > > > > not functioning properly, so I had to dig into the code.
> > > > > > > But afterwards I found a thread on Raspberry PI forums, where one of
> > > > > > > the moderators mentions it [2].
> > > > > > >
> > > > > > > [1] https://github.com/zephyrproject-rtos/zephyr/issues/68562
> > > > > > > [2] https://forums.raspberrypi.com/viewtopic.php?p=2165720#p2165720
> > > > > >
> > > > > > So, here are my thoughts on this after pondering it over for a bit.
> > > > > > Ideally we should eventually reverse the reset logic so the DTS entry
> > > > > > correctly specifies the hardware. However, instead of an abrupt change
> > > > > > maybe we add an additional property to the DTS node that when present
> > > > > > uses the correct reset logic. If the property isn't present we use the
> > > > > > current incorrect reset logic and print out a dev_warn that it will soon
> > > > > > be deprecated.
> > > > > >
> > > > > > Let me know what you think.
> > > > > >
> > > > > > Best regards,
> > > > > > Alex
> > > > > >
> > > > > >
> > > > > I think it's a good idea if the current logic is about to be fixed.
> > > > > Another (probably not as good) idea is to introduce a new property
> > > > > named "nreset-gpios = ..." or something like that, but I realise that
> > > > > "reset-gpios" is the de-facto standard naming.
> > > > >
> > > > > Best regards,
> > > > > Josef
> > > > >
> > > >
> > > > Yeah I think it may be simpler to just add a boolean property like
> > > > 'reverse-reset'. It would make the driver code simpler to implement too.
> > > > Would you like to implement this change and submit the patch or would
> > > > you like me to?
> > > >
> > > > Best regards,
> > > > Alex
