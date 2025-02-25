Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D33A44134
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 14:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744E410E69B;
	Tue, 25 Feb 2025 13:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iZW5FNw9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE76210E69B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:46:19 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6e66b4607d2so23361156d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 05:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740491179; x=1741095979; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MZ/xjLq3dlAcrKUMa8YGuiYA3PM2a/RoerL/CPAbyZ0=;
 b=iZW5FNw9qgiILyDjjwGXLMyv38czWqsyrr+NjOMH/XZuf8gBR5rJru7IuiVpARa4DO
 kvDaXPykDTciIGk5hmETea+f0k19UwQ/TGYKu9wWBIzsF3WkTYR4/8V50oiz6rvKmHvs
 d3k0SwjJ9ZO1kKZ3bFZh4cYhMqNlmZt6OSat/h3/OwJpVKtij7l2DTaJQiosWK5BgpoJ
 zta4x6vaHgcdC+EmuIfEln3SfuS57OHPtJFVK+PGb3ttIFeLe0fvESo5a5R9IV+6tfCK
 BE7+vQLYJvMWJiC8uscpsVpU3K+OlC+SiFqjbio5IDzADrSBLvc1Fza6hWITJ9Oi85Gc
 SimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740491179; x=1741095979;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MZ/xjLq3dlAcrKUMa8YGuiYA3PM2a/RoerL/CPAbyZ0=;
 b=RAMlDE7n5R3H1YRKqeyI/qGlZG7mjGyzta3WO14jhxbAzRvBm1RP/QEog/aOc1tkaz
 0C6M5TjrOJh3GE2lRxSOAzuvg7XzRcT0+i/DWqc5EonRhM/WnOl31sDpMgsuve1H3+AR
 ArF5TvD5n5lQ4EeQIbaANwp9kEt5kvtprY8D2D4d4/RX3rdbMTdCmGERZLpUA5K6VNNz
 gKau8Rv/rD0rK2m/69YMSK1JYq3KmSSgR9d6EVTGJLg4K4bTlsLf9a36fkkP+iBJSvY8
 dXSEM/HFYVdr169VYuRkypXQuo9aBy35mIjhZcyZ3eRPAsPOOJrzcpQqhLKuiYfNOotg
 BkLg==
X-Gm-Message-State: AOJu0YyyDegevZ3r9gyteyZXovplM+B9cgsQc5pW1PgsJhfgc7ZNK+2i
 kYqUVRMhJsUdGLqu47M8mU0wJDeB5Fg7PsQTXvYrjQ7VsjwbzOkI
X-Gm-Gg: ASbGncvKCMGztq+vW1luazs23rjeT4+wXjq1QdPvatNkCwXXyy1UW8GhRYiOe+E7Drr
 hOfmC9v22/imCB7yJVymWcP/I8uDmGDWWsaTWxhdgdUoOJcfD3o/cb3IEM8Z8cN6Z8Z/6pkSzOp
 z/KZGjA8XThZ7zmPmkLTiENFAsxvNVCZr97VehQMCq98lOnEl7b6YJaWJA3gQ/8WHE4d4z+nTwa
 2l7st9IOJj0YXW/Arwe0xORY1ztL/VI+Ki93mNdHFpvsz5wdkv6y3CZA+0egno/JvYG/YlUgIee
 2TUVGAuUHvZ6ku0aHxSPtLqulQ==
X-Google-Smtp-Source: AGHT+IHcLvfJR84hpgFtMJs4MJdsc/ZvRqWXZfsMRxJWO7oJKi2Wpqxe5t3tRurxFn0bNtjh09DmJQ==
X-Received: by 2002:a05:6214:194b:b0:6e6:682b:804d with SMTP id
 6a1803df08f44-6e6ae82fa16mr236466476d6.25.1740491178692; 
 Tue, 25 Feb 2025 05:46:18 -0800 (PST)
Received: from VM-Arch ([2600:1001:b148:ac05:b436:d12:7285:cda7])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e87b06e1c3sm9424166d6.7.2025.02.25.05.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 05:46:18 -0800 (PST)
Date: Tue, 25 Feb 2025 08:46:15 -0500
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Josef =?utf-8?B?THXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>
Cc: dri-devel@lists.freedesktop.org, noralf@tronnes.org
Subject: Re: drm: mipi_dbi_hw_reset() keeps display in reset
Message-ID: <6he4g5se6cqu6l3bdbfv636pm62ucvzsm5ujhi2xjig7srxxqb@gagbovuujysx>
References: <CACnTymYtkLJ=EfZK-c1nCW+bLSKAaq2sTW1x+Bj-_ve7hfAdKA@mail.gmail.com>
 <n7qaikyyisdq3m74buqjfxzyi5lgntnsmtirrmw5vi2nkf7izl@6coklitzp3uc>
 <fm4kqbfknroub3onbbhbzvurw7ig3fsjrxpeucdtioobssstjk@hzmdxa7uby6f>
 <CACnTymYBYmGMk8z5Xp=OGBHvsA-hwJtGAi6MSHfpTGJBHMQqSw@mail.gmail.com>
 <spav7ftc45ypks3no2sgaciagym2jbd2hfcyqmforvwli47ixj@6rtvedapu342>
 <CACnTymaA5UZGRGveAOOFTtRWrWr9rnyWj8Ah6qmMOTS0dbuVNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACnTymaA5UZGRGveAOOFTtRWrWr9rnyWj8Ah6qmMOTS0dbuVNg@mail.gmail.com>
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

On Tue, Feb 25, 2025 at 12:59:59PM +0100, Josef Luštický wrote:
> On Mon, Feb 24, 2025 at 12:13 AM Alex Lanzano <lanzano.alex@gmail.com> wrote:
> >
> > On Mon, Feb 17, 2025 at 12:39:01PM +0100, Josef Luštický wrote:
> > > On Sat, Feb 15, 2025 at 8:14 PM Alex Lanzano <lanzano.alex@gmail.com> wrote:
> > > >
> > > > On Fri, Feb 14, 2025 at 08:04:41PM -0500, Alex Lanzano wrote:
> > > > > On Fri, Feb 14, 2025 at 10:29:29AM +0100, Josef Luštický wrote:
> > > > > > Hello Alex,
> > > > > > there is a bug in mipi_dbi_hw_reset() function that implements the logic of
> > > > > > display reset contrary.
> > > > > > It keeps the reset line activated which keeps displays in reset state.
> > > > > >
> > > > > > I reported the bug to
> > > > > > https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/63
> > > > > >
> > > > > > Unfortunately, fixing the bug would mean current DTB-ABI breakage and
> > > > > > device-trees modification would be needed.
> > > > > > I mainly write this email to let you and other people know about it, so
> > > > > > hopefully it can be found easier.
> > > > > > What are your thoughts?
> > > > > Thanks for making me aware. I'll dig into over the weekend and get back
> > > > > to you
> > > >
> > > > Alright so I looked into a bit more. Looks like the MIPI Specification
> > > > says that the reset line is active low. So, if we want dt entries to be
> > > > correct the logic for setting the reset line in mipi_dbi_hw_reset()
> > > > should be flipped. However, like you said, this is going to cause a some
> > > > confused developers to break out their oscilloscopes to figure out
> > > > why their display isn't working.
> > > >
> > > > Best regards,
> > > > Alex
> > >
> > > Thank you Alex for looking into this.
> > > I think all the supported dts can be changed together with
> > > mipi_dbi_hw_reset(), however the fix would break existing DTBs and
> > > third party DTSs.
> > > So I think it shall be either noted somewhere that due to this bug,
> > > the reset line needs to be "wrongly" ACTIVE_HIGH in DTS
> > > or the mipi_dbi_hw_reset() is changed and the compatibility is broken,
> > > which needs to be announced.
> > >
> > > BTW Zephyr fixed the code [1], but they introduced the MIPI DBI
> > > support just a couple of weeks before the fix, so they avoided the
> > > compatibility issue.
> > > I was not able to find users mentioning issues related to the display
> > > not functioning properly, so I had to dig into the code.
> > > But afterwards I found a thread on Raspberry PI forums, where one of
> > > the moderators mentions it [2].
> > >
> > > [1] https://github.com/zephyrproject-rtos/zephyr/issues/68562
> > > [2] https://forums.raspberrypi.com/viewtopic.php?p=2165720#p2165720
> >
> > So, here are my thoughts on this after pondering it over for a bit.
> > Ideally we should eventually reverse the reset logic so the DTS entry
> > correctly specifies the hardware. However, instead of an abrupt change
> > maybe we add an additional property to the DTS node that when present
> > uses the correct reset logic. If the property isn't present we use the
> > current incorrect reset logic and print out a dev_warn that it will soon
> > be deprecated.
> >
> > Let me know what you think.
> >
> > Best regards,
> > Alex
> >
> >
> I think it's a good idea if the current logic is about to be fixed.
> Another (probably not as good) idea is to introduce a new property
> named "nreset-gpios = ..." or something like that, but I realise that
> "reset-gpios" is the de-facto standard naming.
> 
> Best regards,
> Josef
> 

Yeah I think it may be simpler to just add a boolean property like
'reverse-reset'. It would make the driver code simpler to implement too.
Would you like to implement this change and submit the patch or would
you like me to?

Best regards,
Alex
