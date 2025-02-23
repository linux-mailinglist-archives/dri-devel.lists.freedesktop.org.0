Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED77AA4215F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C6F10E4C5;
	Mon, 24 Feb 2025 13:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LJhVwXk/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F4810E010
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 23:13:39 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6e67f377236so31372546d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 15:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740352419; x=1740957219; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/aqSc0p0oPCt6O7iHjOHHk8HuapixPI3TNdWxdGSTFM=;
 b=LJhVwXk/7qqPl2GALZ3acGW8v5UV1tJu2Zx9Q9O7LctuuotaCgmOL2S2q6lpEcxEGd
 Nd0+kYgY8Lqo/zHO+K+HmGVtYAuOznVfnEdDRtQUAVeSMfCaS01l/0l0rQS4fMgclkv3
 hSswlzXS9T7HuiSa9wUel3mggVB7MNgSMk6kYh+pPOOBpIWE0vPI8fy1IKeZCAm2Q5e+
 ozP7wrCYrsS56oCiSrFM2EwDp7TEajNLVmjsoNPb93BIGF4hZ4UAbmxCsBu3qp4ILwgE
 6KNG1G0dpNTBE1pxy8JjKvDBHhNwrb5zIAcRYAwD8w0DMq0hb6RfZAt8Ai4itc3vHLKS
 IMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740352419; x=1740957219;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/aqSc0p0oPCt6O7iHjOHHk8HuapixPI3TNdWxdGSTFM=;
 b=c9kT4O101G3EsDF6KwdR+qj6PM3LOjkfXb8Rk9kmh9qpXF715lF7V9E1fVEPWmYN6D
 JZnlVVPJvU8QlaQNHKfPe5GFEJoBVW5IreIg4+ZFP/yo67Z+bPtvSbpwkne0EX7sawX5
 oxuFdzaPnxhGDx6RDurh3WbbOpMrCRIUIRVotOx8sYNLZk/z31II+UWm/N1qMTKuDQlN
 VAy4JWzdgZZ8ZJxkPmQVBtrSv5SbzanpUsLsHeVCYJMbsf/hkAa4xAuqzU5ZK+xW6cu7
 Mx05zR1oFqrwmMEu0+fV96Nc2gMYiByYpOrn3mBsb/GSpsUXoCczvRb5+yU9jb5gnz2r
 rqPw==
X-Gm-Message-State: AOJu0YwkGtenpIFDZfRoKToaL2vouYRcbyZaRkee3/1iRotQdBOLti/N
 1XKrzkxxyHA0HVciX5lCUr32JzVSmsVx/TTzfYOsJKSFTuewZIo5
X-Gm-Gg: ASbGncvuLHABjxOSfkZ9IHfKetUitdmTCoROqNOEFremsuQC0/4kMGavneWVk3Bvswe
 B+YwukAW5z6DNAM7s4tNwMZwUlFQMIHwIcddSKRnCCMmyLgGkVsIRvQB8486q0L+oI0/gdS11ZZ
 ZzT67JuIYo0CnVNq4i6irYwo9+OtyjF66wdNnbNT/dLRqIBxI2T91KdVD3vShIpMuVr74tggV6L
 5Hdk05BOJWUKmzdNCpCCaiey/exUOJzPKR0RV3MmlKSK3rT+B8yzBhEA4P5/etUi3RfDrNWnQbi
 g0o6if4QgV1qkce5enM4c21whyCsu1l5DgKfXvsFnoiKwAnvclBG
X-Google-Smtp-Source: AGHT+IGX8LSWVvddbJzkt0uuwKM/uCLJfg52JrWeDqFTkzr//ZAmsm/WF0Dbi64YsnN8tUnec4njEQ==
X-Received: by 2002:ad4:5cab:0:b0:6e6:606b:a7bb with SMTP id
 6a1803df08f44-6e6b01d77ecmr145616776d6.43.1740352418721; 
 Sun, 23 Feb 2025 15:13:38 -0800 (PST)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e65d77a2bdsm125149766d6.11.2025.02.23.15.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 15:13:37 -0800 (PST)
Date: Sun, 23 Feb 2025 18:13:35 -0500
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Josef =?utf-8?B?THXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>
Cc: dri-devel@lists.freedesktop.org, noralf@tronnes.org
Subject: Re: drm: mipi_dbi_hw_reset() keeps display in reset
Message-ID: <spav7ftc45ypks3no2sgaciagym2jbd2hfcyqmforvwli47ixj@6rtvedapu342>
References: <CACnTymYtkLJ=EfZK-c1nCW+bLSKAaq2sTW1x+Bj-_ve7hfAdKA@mail.gmail.com>
 <n7qaikyyisdq3m74buqjfxzyi5lgntnsmtirrmw5vi2nkf7izl@6coklitzp3uc>
 <fm4kqbfknroub3onbbhbzvurw7ig3fsjrxpeucdtioobssstjk@hzmdxa7uby6f>
 <CACnTymYBYmGMk8z5Xp=OGBHvsA-hwJtGAi6MSHfpTGJBHMQqSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACnTymYBYmGMk8z5Xp=OGBHvsA-hwJtGAi6MSHfpTGJBHMQqSw@mail.gmail.com>
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

On Mon, Feb 17, 2025 at 12:39:01PM +0100, Josef Luštický wrote:
> On Sat, Feb 15, 2025 at 8:14 PM Alex Lanzano <lanzano.alex@gmail.com> wrote:
> >
> > On Fri, Feb 14, 2025 at 08:04:41PM -0500, Alex Lanzano wrote:
> > > On Fri, Feb 14, 2025 at 10:29:29AM +0100, Josef Luštický wrote:
> > > > Hello Alex,
> > > > there is a bug in mipi_dbi_hw_reset() function that implements the logic of
> > > > display reset contrary.
> > > > It keeps the reset line activated which keeps displays in reset state.
> > > >
> > > > I reported the bug to
> > > > https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/63
> > > >
> > > > Unfortunately, fixing the bug would mean current DTB-ABI breakage and
> > > > device-trees modification would be needed.
> > > > I mainly write this email to let you and other people know about it, so
> > > > hopefully it can be found easier.
> > > > What are your thoughts?
> > > Thanks for making me aware. I'll dig into over the weekend and get back
> > > to you
> >
> > Alright so I looked into a bit more. Looks like the MIPI Specification
> > says that the reset line is active low. So, if we want dt entries to be
> > correct the logic for setting the reset line in mipi_dbi_hw_reset()
> > should be flipped. However, like you said, this is going to cause a some
> > confused developers to break out their oscilloscopes to figure out
> > why their display isn't working.
> >
> > Best regards,
> > Alex
> 
> Thank you Alex for looking into this.
> I think all the supported dts can be changed together with
> mipi_dbi_hw_reset(), however the fix would break existing DTBs and
> third party DTSs.
> So I think it shall be either noted somewhere that due to this bug,
> the reset line needs to be "wrongly" ACTIVE_HIGH in DTS
> or the mipi_dbi_hw_reset() is changed and the compatibility is broken,
> which needs to be announced.
> 
> BTW Zephyr fixed the code [1], but they introduced the MIPI DBI
> support just a couple of weeks before the fix, so they avoided the
> compatibility issue.
> I was not able to find users mentioning issues related to the display
> not functioning properly, so I had to dig into the code.
> But afterwards I found a thread on Raspberry PI forums, where one of
> the moderators mentions it [2].
> 
> [1] https://github.com/zephyrproject-rtos/zephyr/issues/68562
> [2] https://forums.raspberrypi.com/viewtopic.php?p=2165720#p2165720

So, here are my thoughts on this after pondering it over for a bit.
Ideally we should eventually reverse the reset logic so the DTS entry
correctly specifies the hardware. However, instead of an abrupt change
maybe we add an additional property to the DTS node that when present
uses the correct reset logic. If the property isn't present we use the
current incorrect reset logic and print out a dev_warn that it will soon
be deprecated.

Let me know what you think.

Best regards,
Alex


