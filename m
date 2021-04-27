Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2AD36CAC7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 20:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DC86E52A;
	Tue, 27 Apr 2021 18:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4386E0FE;
 Tue, 27 Apr 2021 18:01:32 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso54192098otb.13; 
 Tue, 27 Apr 2021 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pu56kuPoUg3CtxjLA5zm06km84+P26QyPuxVzLoO3fc=;
 b=boxvEng40YkCg0LkSLREGdnQ8qodNL00EwgSh3QMro5Ygdq8OFVZkcuZcYOEFj9GrG
 KgHXSQpB5amK/CzhJY0rajz0Hg+i5vRlQs4zxvZD+RIb6K9JY2X8HGYQYvWYJCieS8ay
 ut7du5yFFnvTN83T2xKtpZBu/yk/H6nY2G7dZ7nYr8AhHzM8jYL1dC0AZOUw7Qgye7UK
 eV7AGgY8TIZi53Akzyyvr71jGBqWNOUB1imhNKOKmu9FtlNcK3o14Ce5Jm4GAr0zDFo/
 +zLEFvYPX3nuigQgF3/lcUJYo6ildpcEyMoJyetsmfTgWXK5H6jbfUR3nAiqcovzGwYM
 c2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pu56kuPoUg3CtxjLA5zm06km84+P26QyPuxVzLoO3fc=;
 b=inPHqneqQjSEFkmyrDgVcYFbtmVieorMoJd8NXu1mb686LuBsn5Dx/biaFABHdeRTz
 Znu6f2CrfqiBgPsophRVwsKltYNsNFGh6/Qtxg9ihwyyJCyoO1IMfpSvidKtpq8UAPYx
 vH22T53QT7TxAdSSwweH6wTILNWA/9WE+HOw4KruCyFibhlo3vEMiQJW9OOO9rkfHNJU
 EF3iY7VJvCSwkF923NER81HkldxSOpVWiMLwn/fC3P8/N9Y5GX6n8k1lExbw/ai1mShM
 FS9qQCP4j6NQU4/LqB5mi2tCshOZZ5zRjFqCk90dsCnVIQXqmIhZuK1y1mULnuYJoEzW
 AWxA==
X-Gm-Message-State: AOAM5308vLfImT1xn+VbZsT7bhcVHiFmBLZWvZQ1Chkdu3CXN9NgsVbl
 bPBQCTCXfCcqD/EGJfe44BbIp6DapsIbKsimZDSLFcJyFrYNlyHg
X-Google-Smtp-Source: ABdhPJyH1ysWzXrllHpkkPFrit3i00E0Qq95LYICkliJFKppM+pmSWbrpFhUKZOKD4hDi20LEnV9cAsyh5T+MSz73UQ=
X-Received: by 2002:a05:6830:18d0:: with SMTP id
 v16mr6783255ote.311.1619546492007; 
 Tue, 27 Apr 2021 11:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
 <CAAxE2A7a5+q2j1txN-FxWBvKOoPSRKAZ9iPPeTSjMZDbgJCU-A@mail.gmail.com>
 <CAKMK7uHXSnDetsK1VG-X4ZwUZdA819wUKd=YMgqF=yvAQ6Y2vw@mail.gmail.com>
 <CAAxE2A4BhDZL2rrV1KEXPzmKnOq4DXmkFm=4K5XZoY-Cj0uT=Q@mail.gmail.com>
 <735e0d2e-f2c9-c546-ea6c-b5bbb0fe03a6@gmail.com>
 <CAAxE2A4FwZ11_opL++TPUViTOD6ZpV5b3MR+rTDUPvzqYz-oeQ@mail.gmail.com>
 <23ea06c825279c7a9f7678b335c7f89437d387ed.camel@pengutronix.de>
 <s8QVKcJeMhEBcoOS9h7UzE_fUG-VKfgso3HbaM37xGhbBu6i966cTiD_UY1lBbiOMl-VbGyu7r0eBS3vTY8DWSUItsLrf_ISzDuT9vbRs8I=@emersion.fr>
In-Reply-To: <s8QVKcJeMhEBcoOS9h7UzE_fUG-VKfgso3HbaM37xGhbBu6i966cTiD_UY1lBbiOMl-VbGyu7r0eBS3vTY8DWSUItsLrf_ISzDuT9vbRs8I=@emersion.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Apr 2021 14:01:20 -0400
Message-ID: <CADnq5_PEMvF7Gd4qug=FjfTtxOtygw7SO73HjhSh5AyEramtkA@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Simon Ser <contact@emersion.fr>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 27, 2021 at 1:35 PM Simon Ser <contact@emersion.fr> wrote:
>
> On Tuesday, April 27th, 2021 at 7:31 PM, Lucas Stach <l.stach@pengutronix.de> wrote:
>
> > > Ok. So that would only make the following use cases broken for now:
> > >
> > > - amd render -> external gpu
> > > - amd video encode -> network device
> >
> > FWIW, "only" breaking amd render -> external gpu will make us pretty
> > unhappy
>
> I concur. I have quite a few users with a multi-GPU setup involving
> AMD hardware.
>
> Note, if this brokenness can't be avoided, I'd prefer a to get a clear
> error, and not bad results on screen because nothing is synchronized
> anymore.

It's an upcoming requirement for windows[1], so you are likely to
start seeing this across all GPU vendors that support windows.  I
think the timing depends on how quickly the legacy hardware support
sticks around for each vendor.

Alex


[1] - https://devblogs.microsoft.com/directx/hardware-accelerated-gpu-scheduling/


> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
