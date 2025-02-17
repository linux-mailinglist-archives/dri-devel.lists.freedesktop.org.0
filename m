Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C159BA381EF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 12:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E83510E1C6;
	Mon, 17 Feb 2025 11:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=braiins.cz header.i=@braiins.cz header.b="Zm3IZF5E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5B910E1C6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:39:13 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2fbfa8c73a6so8006011a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 03:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braiins.cz; s=google; t=1739792353; x=1740397153; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9zz5DKFZ6uuYN8PSXSGgIORH7WCajmIYoaxWCWLM7L0=;
 b=Zm3IZF5EdNa/dpr3xLkrgOxXVh8DePBWydeQpltikQSvv6a5fBEOBfqj7eMLJ4o6Ho
 nSS+OFGs1Az47zfzHnyiVO4B1wwFk0EfIGXHTpcHc+QqDyK1hb6WrgD2U5SpRkS6Xjoe
 bwqAcd0SYg1KK4sD9YaTp7we2zh3cuhh9mf/Y6fwpTB5EoCTL6/vOmSLfbTo+VDQuCbC
 G2ReA3jSU6HL56YOhU9KbF1IcPZg1K28cmvEnTUKAWDQHDWJYneIzrUJAfGvK3/vsbMl
 fzPCBycXfZs9L5xJWYewZpr4SSBLXopVya1uVvrjLpARljcn4o/VoHy6vCcHArQK0D4u
 P8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739792353; x=1740397153;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9zz5DKFZ6uuYN8PSXSGgIORH7WCajmIYoaxWCWLM7L0=;
 b=dgyyZTULnvsr960qafDGrKJRMw5otj76rUBVZwlt6GG26NWinamq/V0OK4QyZiaJEC
 0R4Z8cI/eK9TMNrrr7FiiiQtYOox1mlTmRhhsH/j2X8gxzuA8jf8akMMSS9EV317Vyh8
 xhse93HAMGA5VizvFlTotnqjAy0nfMz0I6L3ENYwfkj5LZwMbR6q6yqXXXeIyPQq/pb6
 /xueyNA5puTkbg0/R/jOdAH6tOzgELM1W/gmSuCYxY/Xn/g8yUSK7zkWalx5TN9PDMyA
 3yooaiRXpqLPZQLINKw8X4oQLLJHmERgg+neilZ+miZ6fb5pwOQZPedRlikt9CoY62gM
 cNkg==
X-Gm-Message-State: AOJu0YyA5Qm/dms5YuKqdLhpnPCKkdfKTGrDeYGrkH7Uq56Viru9kIbE
 VVDFR2pPbyiGzxBNPzSxo3Oo8mPRAzcH/AxpiL1ejFYSeIHmIotlt51hSWtG7g5HBfEPV+/ftRH
 2iCadKi5YYoSfQJXVJdBuqVRzVjbJVRNpZkUu+CZ+NulrioiH
X-Gm-Gg: ASbGnctj3bQV2PSzwbf4dVjotmPctgB29isBEAfv+ZZ3klstrTGHc3lb/a9M7hLQePN
 /mgUN3c2kXh12RoB5mwMqFQARrnevMI/i5Be3f5KNhNYu1f2fEASQu7fNWTMYmWHxkpCXPpI=
X-Google-Smtp-Source: AGHT+IH57zypZBYdFu9rNQ56w86cSfnL2oJDZTpOS138yAq0Kv6l0YTxTwlxEJG3pvzqTNPwNqIagtuL3NZcYtgXCDg=
X-Received: by 2002:a17:90b:2d83:b0:2f9:c56b:6ec8 with SMTP id
 98e67ed59e1d1-2fc40f0e646mr15164079a91.10.1739792352714; Mon, 17 Feb 2025
 03:39:12 -0800 (PST)
MIME-Version: 1.0
References: <CACnTymYtkLJ=EfZK-c1nCW+bLSKAaq2sTW1x+Bj-_ve7hfAdKA@mail.gmail.com>
 <n7qaikyyisdq3m74buqjfxzyi5lgntnsmtirrmw5vi2nkf7izl@6coklitzp3uc>
 <fm4kqbfknroub3onbbhbzvurw7ig3fsjrxpeucdtioobssstjk@hzmdxa7uby6f>
In-Reply-To: <fm4kqbfknroub3onbbhbzvurw7ig3fsjrxpeucdtioobssstjk@hzmdxa7uby6f>
From: =?UTF-8?B?Sm9zZWYgTHXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>
Date: Mon, 17 Feb 2025 12:39:01 +0100
X-Gm-Features: AWEUYZkJq_k42m7A8gGM7qtW2LxH9WttgEpJlZn59VK8COWic8d2-9gJfUdWrlg
Message-ID: <CACnTymYBYmGMk8z5Xp=OGBHvsA-hwJtGAi6MSHfpTGJBHMQqSw@mail.gmail.com>
Subject: Re: drm: mipi_dbi_hw_reset() keeps display in reset
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: dri-devel@lists.freedesktop.org, noralf@tronnes.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Feb 15, 2025 at 8:14=E2=80=AFPM Alex Lanzano <lanzano.alex@gmail.co=
m> wrote:
>
> On Fri, Feb 14, 2025 at 08:04:41PM -0500, Alex Lanzano wrote:
> > On Fri, Feb 14, 2025 at 10:29:29AM +0100, Josef Lu=C5=A1tick=C3=BD wrot=
e:
> > > Hello Alex,
> > > there is a bug in mipi_dbi_hw_reset() function that implements the lo=
gic of
> > > display reset contrary.
> > > It keeps the reset line activated which keeps displays in reset state=
.
> > >
> > > I reported the bug to
> > > https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/63
> > >
> > > Unfortunately, fixing the bug would mean current DTB-ABI breakage and
> > > device-trees modification would be needed.
> > > I mainly write this email to let you and other people know about it, =
so
> > > hopefully it can be found easier.
> > > What are your thoughts?
> > Thanks for making me aware. I'll dig into over the weekend and get back
> > to you
>
> Alright so I looked into a bit more. Looks like the MIPI Specification
> says that the reset line is active low. So, if we want dt entries to be
> correct the logic for setting the reset line in mipi_dbi_hw_reset()
> should be flipped. However, like you said, this is going to cause a some
> confused developers to break out their oscilloscopes to figure out
> why their display isn't working.
>
> Best regards,
> Alex

Thank you Alex for looking into this.
I think all the supported dts can be changed together with
mipi_dbi_hw_reset(), however the fix would break existing DTBs and
third party DTSs.
So I think it shall be either noted somewhere that due to this bug,
the reset line needs to be "wrongly" ACTIVE_HIGH in DTS
or the mipi_dbi_hw_reset() is changed and the compatibility is broken,
which needs to be announced.

BTW Zephyr fixed the code [1], but they introduced the MIPI DBI
support just a couple of weeks before the fix, so they avoided the
compatibility issue.
I was not able to find users mentioning issues related to the display
not functioning properly, so I had to dig into the code.
But afterwards I found a thread on Raspberry PI forums, where one of
the moderators mentions it [2].

[1] https://github.com/zephyrproject-rtos/zephyr/issues/68562
[2] https://forums.raspberrypi.com/viewtopic.php?p=3D2165720#p2165720

Best regards,
Josef
