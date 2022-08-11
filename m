Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDC058FD84
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 15:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58488B13DD;
	Thu, 11 Aug 2022 13:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115B011B160
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 13:38:44 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 p12-20020a7bcc8c000000b003a5360f218fso2726046wma.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 06:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc;
 bh=Zt1DdekTqC/b6j5H87LHP9VnxUbeUvSwLypi+Rc1nT0=;
 b=RTcrODiQUIAj/KSLFgemALMUDjhVPm7riJtasW/hb6FtIn58h3spQbWcCBEgFQ+DIS
 0rJV/8tEEMpk522BnvEV2Neg4liRLsipFwb2HyM2CdhwSl9FWoEQuaRU2vyupzm/0DkD
 TaSR6De6DlgvYbHX8/a0C1j51EkYwHtVLt5NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=Zt1DdekTqC/b6j5H87LHP9VnxUbeUvSwLypi+Rc1nT0=;
 b=hItEYUAVyLeFoa8w2ARn5c6X9YfL87As2tgQ0rtuF6fZyLYlwgJHWz953zX6AKEwYF
 ZMYqE8WUG+EuN8OuAOZHwsA3b7uaERSjIAomsLo+A5Smw6PqVDQ/qiUNmoDiYnZbbhZC
 uVfyrNMq553xuH/lYL3eWRJrlKZ7SzcRcvrOr6tofozcdulzawG56/ijZsePBA87sYho
 IRaG5/Hmjn7Wr38IxbZV1SZ+faiQxkGQbYKYeNN26o4Isvc/D5E7+VPB+6/Khg9mjDSS
 0wMGQuO7+HvlTjTWCxPUrSuuCfHo5sWKEXmQh8W3Rds37DvlVHsfQ4uv7Ll8YVhsKNbd
 L5zA==
X-Gm-Message-State: ACgBeo1Q1YzsqaTfyMYj/7jd8xlbpZt1l0jVknShFOTMt2MdHX2exAmd
 p45Oujiswl1K8ckgFJhJEOhutw==
X-Google-Smtp-Source: AA6agR4P0mdQJ/7UBCeQO2a4ghnLkMWb9dioaTelBmAdU811ArDvgIOW4MYv7W8ZGrHXoTheC13ONA==
X-Received: by 2002:a1c:f618:0:b0:3a4:e569:946b with SMTP id
 w24-20020a1cf618000000b003a4e569946bmr5678918wmc.106.1660225123332; 
 Thu, 11 Aug 2022 06:38:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a5d670d000000b0021d7b41255esm18380218wru.98.2022.08.11.06.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 06:38:42 -0700 (PDT)
Date: Thu, 11 Aug 2022 15:38:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [GIT PULL] printk for 5.20
Message-ID: <YvUGYPcNo4HPS6Kt@phenom.ffwll.local>
Mail-Followup-To: Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Jan Kara <jack@suse.cz>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, Clark Williams <williams@redhat.com>,
 Mel Gorman <mgorman@suse.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <CAHk-=wie+VC-R5=Hm=Vrg5PLrJxb1XiV67Efx-9Cr1fBKCWHTQ@mail.gmail.com>
 <87r11qp63n.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r11qp63n.ffs@tglx>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Petr Mladek <pmladek@suse.com>, Clark Williams <williams@redhat.com>,
 Jan Kara <jack@suse.cz>, John Ogness <john.ogness@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Mel Gorman <mgorman@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 09, 2022 at 03:18:20AM +0200, Thomas Gleixner wrote:
> On Tue, Aug 02 2022 at 20:19, Linus Torvalds wrote:
> > On Mon, Aug 1, 2022 at 8:08 AM Petr Mladek <pmladek@suse.com> wrote:
> >>
> >> - Completely disable printing on consoles with CONFIG_RT.
> > And guys, I want to make it really clear how disappointed I am with
> > the printk tree lately. There seems to be some kind of hardline
> > religious fervor having taken over to make these kinds of "this is how
> > it has to be done, screw any sanity or common sense".
> ...
> > Put another way: not only am I not pulling this, I'm concerned that I
> > will not be pulling printk patches in the future either because of
> > where these pull requests seem to be trending.
> 
> I really have to stand up for the printk maintainers here.
> 
> Especially Petr has done an extraordinary job in the past few years.
> There have been hickups, but with such a semantically ill defined
> mechanism like printk() that's not a surprise at all.
> 
> Let me add some historical background here.
> 
> In Sept. 2019, i.e. almost 3 years ago, we all - including you - sat
> together at Plumbers in Lisbon and agreed that printk() in it's back
> then form is a nightmare not only for PREEMPT_RT. We also agreed back
> then that seperating out the console writes into individual printk
> threads makes sense because it also gets rid of the fully serializing
> nature of printk() which exists for historical but not for technical
> reasons. Also the magic oops_in_progress heuristics have been declared
> to be just duct tape, as the still existing (after 25+ years of Linux)
> situation with graphics demonstrates on a daily basis. We all agreed
> that a dedicated atomic_write() which also allows to prioritize your
> favourite pet pieve of making laptops more debugable by utilizing
> persistant storage simpler and what's more important more reliable.

Cutting the more detail stuff below because I'm justing chiming in on the
overall direction.

I want this. Where "want" means by default and across the board, and
"this" the entire printk/console_lock redesign we discussed in Lisbon with
threaded printing and properly separate out emergency output and
everything else. Because ffs I'm so fed up having to deal with
console_lock in graphcis drivers.

This has nothing to do with rt or being niche or whatever but just that
Petr, John and others are tackling some really nasty corners that everyone
just covered with industrial quantities of duct-tape in the past years
(decades?) and finally there's real movement (but a bit slower than I
hoped for really). I visted linutronix folks a few weeks ago and we talked
a bit what we could all do when this mess is sorted and I want it all.

*graphics maintainer out*
-Daniel

> It took whopping 2.5 years to get to the point to reach this seperation
> as it required to rewrite the buffers and other infrastructure. This was
> very responsible and cautionosly guided by Petr and the other members of
> the printk() maintainer team. Along with that went quite some
> improvements like realistic timestamping and other details which matter
> for dmesg power users.
> 
> The printk threads were added in the 5.19 merge window and unfortunately
> reverted between 5.19-rc3 and 5.19-rc4 for the very wrong reason:
> 
>    Some embedded boards failed to boot.
> 
>      The root cause is missing locking in the init functions of the
>      related UART drivers.
> 
>      This is not a problem of threaded printk(), Those are existing bugs
>      in these drivers which can be triggered on a 5.18 kernel. They are
>      hard to trigger and nobody cared so far because they were neither
>      bisectable nor reliably reproducible. The threaded printk() change
>      made them reproducible and the bisect pointed at the messenger and
>      not at the root cause.
> 
> Nevertheless it was decided to throw away valuable work for no real good
> reason. That revert costs me constantly ~2 seconds of boot time on one my
> main development machines. Not much, but ~10% and I know that quite some
> folks in the fastboot camp give a leg for 10%.
> 
> The right decision would have been to offer this by boot or config
> parameter and not to throw the baby out with the bathwater.
> 
> I know it's my fault because I was AFK that week...
> 
> Coming back to the commit in question which made you (rightfully) upset.
> 
> I agree that it should never have happened, but OTOH it's a very clear
> message of developer frustration to you:
> 
> On one hand you can't get tired of "praising" the RT people about their
> responsible approach to solve fundamental shortcomigs in the kernel, but
> at the same time you're pulling whatever new fancy "technology" which
> comes around the corner and then makes my and your inbox full of
> security issues. That's obviously not a problem, right?
> 
> Neither is it a problem that all of these "feature" developers can
> rightfully ignore PREEMPT_RT and offload all the resulting problems to
> the RT people, right?
> 
> I might be wrong, but you seem to have a fundamental misunderstanding of
> the scope and importance of PREEEMPT_RT:
> 
> >  Oh, I agree that it probably is a pretty small community.
> 
> Pull the rug under that "pretty small community" and the industrial
> world is comming to a grinding halt. That grinding halt will affect your
> power grid, your water supply and quite some other essential things
> which are listed under Civil Infrastructure. Plus the new fangled edge
> computing, modern cars ....
> 
> There is a reason that at least some major industry players have
> invested into the RT project for the last couple of years. All major
> distro players have commercially supported RT offerings for years and
> they are surely not doing this just for fun.
> 
> There are freeriders as always. Space*, car*, distro* ,,,,
> 
> > And I also think that people who are really into RT are basically
> > always going to have extra patches anyway - I think the bulk of the
> > core stuff has made it upstream, but not *all* has made it.
> 
> At the point of this writing the only outstanding issue is printk, which
> prevents PREEMPT_RT from being enabled in your tree on x86[64] and
> ARM[64].
> 
> This still does not justify the commit in question, but clearly points
> out that there is an attitude problem.
> 
> Which attitude problem?
> 
>    The attitude problem that PREEMPT_RT is just a niche, but the larger
>    kernel community is happy to consume the benefits of that allegded
>    niche without giving anything back.
> 
> Think about that.
> 
> Thanks,
> 
>         Thomas

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
