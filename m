Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90003254D4B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 20:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE186E0F1;
	Thu, 27 Aug 2020 18:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5BB6E0F1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 18:54:24 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id j19so1471143oor.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 11:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BWqUveoeKZMIhm3GjalPyEQmnfCWpI1alLQjjqHt+NU=;
 b=SCcrh3qeuy5Pqm6KFI/xAj5Y/ENojt7/jYbC4IkRyQsWuyYTXztzy3Y/JwrtY3NGfK
 VJA5M/PFjjZNQZgCL4ipJNIe/29Icg2ojlK0A2jBoN2fPMa3Ljmy6wP/gwYIhQzI5LFf
 x0xQLnuGiXjWg1XJngPFxg+N/oncHwtwyx/QJ1d2o4CCgIWvNNh2YmvscoicgdTapmkx
 Avigv/QQopdYQ8XfX6SK5xvTrgHlbrIT1J7hzhJtXLWN6NpzInoHSkk2n5mDMmDHnKXh
 nYZv6OIfmGztUzuVBFq6FpcWumyGQO5lvbRrUQpmA06r767ZOPzu2PJXJZFndd22/MmJ
 50mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BWqUveoeKZMIhm3GjalPyEQmnfCWpI1alLQjjqHt+NU=;
 b=X5wOZryaRO+u56PhkL6OQc7bUWz+rClOzVKNNQ67+5Y0/gEOa8NMWzUZvI1I5yA+cl
 +qjenyJfCq6Du4iY3YgRKPCnvLjzHmVWsw4mnD1DmhG2ERgi46ct8PUjuqBa9lNzmzrJ
 AzAJA6xrksoWUkTy23t6R5mC4dOs3ybsS1lBM4ygDqPspXcUzs6UzOCNwQc4dradlKLP
 WBugH988eLKHdDoPQ6MzSYNuqgF/BxuypGlZCo74muCyj3RTNP522mIwE4XGg9lGliGh
 jDsdclGEViFd7/azeLwwxt2V7re5bDd5LfRqqYm3aOSOmBEAvQMrQWiXAziPCqGeZnwz
 QZkQ==
X-Gm-Message-State: AOAM531eYbqtzEe8T/21LDtcrbUXiGekteSND1r2xI9os1ukDvGcIeoX
 EigkXIUWlj0LgLZynec9iuKYnHc2DOlq4G5pRtGnXA==
X-Google-Smtp-Source: ABdhPJy8T8ttMmxpmzdBmMLZEkAuTLQvD2G2liKWH2H+Jb7ky01tXVyV7oYkkXZ8NroZL6tIlOl+3FM2CROEfwK+7xM=
X-Received: by 2002:a4a:aa42:: with SMTP id y2mr9682938oom.88.1598554463803;
 Thu, 27 Aug 2020 11:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200827123627.538189-1-gregkh@linuxfoundation.org>
 <3d8de519-65b3-123b-8ace-e820982884e0@labbott.name>
 <20200827160506.GC684514@kroah.com>
 <CAMi1Hd1Ch1RWvOTnON3tsrucaKThTuGQnwNFo94GqUjufVmnOg@mail.gmail.com>
 <20200827171745.GA701089@kroah.com>
In-Reply-To: <20200827171745.GA701089@kroah.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 27 Aug 2020 11:54:12 -0700
Message-ID: <CALAqxLVOEBaLtkbL-OENYSK0dUc_PBo-oC=BOBFQbPh-bkWTgQ@mail.gmail.com>
Subject: Re: [PATCH] staging: ion: remove from the tree
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 "open list:ANDROID DRIVERS" <devel@driverdev.osuosl.org>,
 Shuah Khan <shuah@kernel.org>, Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Suren Baghdasaryan <surenb@google.com>, Christoph Hellwig <hch@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Joel Fernandes <joel@joelfernandes.org>, Hridya Valsaraju <hridya@google.com>,
 Laura Abbott <laura@labbott.name>,
 Android Kernel Team <kernel-team@android.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 27, 2020 at 10:17 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Thu, Aug 27, 2020 at 10:31:41PM +0530, Amit Pundir wrote:
> > I don't know what is the right thing to do here. I just want to
> > highlight that AOSP's audio (codec2) HAL depends on the ION system
> > heap and it will break AOSP for people who boot mainline on their
> > devices, even for just testing purpose like we do in Linaro. Right now
> > we need only 1 (Android specific out-of-tree) patch to boot AOSP with
> > mainline and Sumit is already trying to upstream that vma naming
> > patch. Removal of in-kernel ION, will just add more to that delta.
>
> As AOSP will continue to rely on ION after December of this year, all
> you are doing is postponing the inevitable a few more months.
>
> Push back on the Android team to fix up the code to not use ION, they
> know this needs to happen.

The point though, is your main premise that no one is using this isn't true.

I'm actively working with Hridya and folks on the codec2 HAL side to
transition this on the userland side:
  https://android-review.googlesource.com/c/platform/frameworks/av/+/1368918/3

I'd like AOSP to not use ION after September (though being external I
can't promise anything), much less continuing after December.

I want this migration to happen as much as anyone.  But I'd prefer to
keep ION in staging until after the LTS is announced. Having both
around helps development for the transition, which helps us have a
reliable solution, which helps vendors to migrate and be able to do
comparative performance testing.

I do appreciate that keeping it isn't free, but I also don't feel the
chaos-monkey approach here is really motivational in the way you
intend.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
