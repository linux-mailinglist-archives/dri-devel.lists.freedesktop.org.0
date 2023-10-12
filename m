Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A97C7620
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 20:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9CB10E18D;
	Thu, 12 Oct 2023 18:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F5F10E18D;
 Thu, 12 Oct 2023 18:48:56 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-4526a936dcaso566044137.2; 
 Thu, 12 Oct 2023 11:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697136535; x=1697741335; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kykyVVmR/6y2L/pYKKXrvrrzSR32PllJLijuEY0UolQ=;
 b=eBkVZ1Ze0x8USILHNoesj0splotW6ZatWe2u+i/XxIkzmMg40i8xj3pzTjC/+D8K3t
 bjMy9NHsMbVOdm5fQRU1SF0ikBo4cIHf/5k2ecL4pA/LZCdlEUoXz7VGwTO8IPFrolYB
 X60jmsB7D21u4wthUCqYV4MkP17hXdUhJp/tt51uO6SCn1ZJF1hQd6aZ6blaT1VF6Ahq
 zQZlnupUeIw/F2/Uh2RGYiwmVf9W2SA8+SXHx5L7L0AC8WMnJeO5CtC9H/3bP4Bx/qlq
 rmBj8DAzu3EFPjNKEyLqc5TyMg9Rez65oEmfsY8Ik9yU2vAOEOziW/DcEmBOHo+D25t7
 9JEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697136535; x=1697741335;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kykyVVmR/6y2L/pYKKXrvrrzSR32PllJLijuEY0UolQ=;
 b=SwY772S8cPmGTU5hGtySqzsEDGsdKzGHPIl+ZfUV/QndbX/7O3Q3EIUeLrKrrKh1sg
 aRtJ6dYMiIJp3LwItDLixFNLjkFICLNb/E4mWjGxHYlroVwRJdUAgd3qL/RoC25ejymL
 5wH9MZ9Je1uAV2WejVdbNXRW5yknqa+UNp0rxWo+A25u/U9yaAwOL0VCnSbnA4TQNeAT
 KYjwTGfSzW5m9U7j25rIS6Op88LyBOXCJCjmmSPH0Vx+jgTucXaG64UQvVcLHdL6k88i
 fy6vCAkZHMqhk0vJ4tPXtoP/75QWp6kXCFskksm0kPtJTYGZ/jVegaRUr2lZXk+vBJYH
 9BLg==
X-Gm-Message-State: AOJu0Yw3XhV7NSH82/t0jklrIC8pJVNOnVxghz29mBNUd3uWYtz3qZ9L
 VX5MPHeYV79/swF4KD3SdTlQ/gIJi9IXcnrzUCc=
X-Google-Smtp-Source: AGHT+IG9Zn74JvBPzF7lyfSR9CSn6UISiUudD/+HAMbb5FjvDC8XozITeM4NEPDnrsdY5z3lxLfx+/QINq8yj2Vgu54=
X-Received: by 2002:a67:ea18:0:b0:452:f119:20f with SMTP id
 g24-20020a67ea18000000b00452f119020fmr22722856vso.8.1697136535192; Thu, 12
 Oct 2023 11:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8ByeJBrPEQSgUc91LQO9Krzjh2pauhMTjEC82M8ozayE76Yg@mail.gmail.com>
 <CAJfuBxxmL-GtBgt=033F9UNeLCreFbJh3HrQQN2nYKwR_0uTbg@mail.gmail.com>
 <20231003155810.6df9de16@gandalf.local.home>
 <CAJfuBxyJyFbFEhRxrtxJ_RazaTODV6Gg64b1aiNEzt6_iE4=Og@mail.gmail.com>
 <CAK8ByeLNc9UbTNG4x=40AxYqjjRCsvBNtNFai0PMveM2X4XCow@mail.gmail.com>
 <CAJfuBxyRF4q_T8LmHwR=-PKKDDpiFg2nO03uLnL8aGpRyBByKw@mail.gmail.com>
 <CAK8ByeLpkSV6o6gPw8eJVqq5+ynQrSDjemY7mXkO1ZmA0rYKfQ@mail.gmail.com>
 <CAJfuBxw+ANLwssAGWpkn5PeJb8ZKn4LXQkk2Gfv3aGsSN=S55Q@mail.gmail.com>
 <CAJfuBxy9qn-4i3SteTL1LBbBxPrFM52KkBd=1UhcKV3S_KdQvw@mail.gmail.com>
 <20231011114816.19d79f43@eldfell> <ZSZuACLwt5_XAL2n@phenom.ffwll.local>
In-Reply-To: <ZSZuACLwt5_XAL2n@phenom.ffwll.local>
From: jim.cromie@gmail.com
Date: Thu, 12 Oct 2023 12:48:28 -0600
Message-ID: <CAJfuBxytOcUDmPBO7uQ9mMRvpNvzA3tgg_-pSGmdXpjDPe5sNQ@mail.gmail.com>
Subject: Re: [PATCH v1] dynamic_debug: add support for logs destination
To: Pekka Paalanen <ppaalanen@gmail.com>, jim.cromie@gmail.com, 
 =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>, 
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

> If you want the kernel to keep separate flight recorders I guess we could
> add that, but I don't think it currently exists for the dyndbg stuff at
> least. Maybe a flight recorder v2 feature, once the basics are in.
>

dyndbg has   +p    writes to syslog
+T  would separately independently write the same to global trace

This would allow  graceful switchover to tracefs,
without removing logging from dmesg, where most folks
(and any monitor tools) would expect it.

Lukas (iiuc) wants to steer each site to just 1 destination.
Or maybe (in addition to +p > syslog) one trace destination,
either global via events, or a separate tracebuf

Im ambivalent, but thinking the smooth rollover from syslog to trace
might be worth having to ease migration / weaning off syslog.

And we have a 4 byte hole in struct _ddebug we could just use.
Unless the align 8 is optional on 32-bits,
I think we're never gonna close the hole anywhere.

is align 8 a generic expression of an architectural simplifying constraint ?
or a need for 1-7 ptr offsets ?




> > That's my idea of it. It is interesting to see how far the requirements
> > can be reasonably realised.
>
> I think aside from the "make it available directly to unpriviledged
> userspace" everything sounds reasonable and doable.
>
> More on the process side of things, I think Jim is very much looking for
> acks and tested-by by people who are interested in better drm logging
> infra. That should help that things are moving in a direction that's
> actually useful, even when it's not yet entirely complete.
>

yes, please.  Now posted at

https://lore.kernel.org/lkml/20231012172137.3286566-1-jim.cromie@gmail.com/T/#t

Lukas, I managed to miss your email in the send phase.
please consider yourself a direct recipient :-)

thanks everyone

> Cheers, Sima
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
