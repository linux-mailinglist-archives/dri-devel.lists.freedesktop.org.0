Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426FD6C325F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 14:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FFE10E778;
	Tue, 21 Mar 2023 13:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366D610E778
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 13:13:12 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x3so59409658edb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 06:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1679404390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HC9gwfc618v6KLYVU5bFz5fRPoHjo3Tg+T/tjD1CcyI=;
 b=ADn+HLG4/gJc/M+wQH0A2xi4DIflVFh4Hyp1jG6opaXh/6O+oqwoTG7bDyXUQuE2hb
 1bc1pzNhQi19xtTPtquoruCwy0uDkAEIY09wdT+BqtuvFwdJ7icmA1QkROcqHbE7Bx0C
 10lK6FcoDJB7UPuPQyi2HfrmNBSZ1Khk42IcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679404390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HC9gwfc618v6KLYVU5bFz5fRPoHjo3Tg+T/tjD1CcyI=;
 b=vecGnzJz8F+d0j2Bjp0iO1kMcVsEUXzSGT2kjw8Y6ZTMkZcqs/Xs4HDPrcMOFQ6IS6
 PShOAxlOlulWPti71I6BRqlLnTNc9j5SceU+vQ/OHzN5EXDYtVu7o1XBXfY+OnPv5y2q
 yLsrTRuMsPCIfEjwHjfl4TkZ/zz9tpJBJU+7/WN0AzhQq6kaimY4numjXOa5UdFQRv18
 35F0Ep/KFDXpQmJ+Y22tkXA1Tj3Pagj9zsq4/o9nyTrT7+deNGqI3ACuSp0cUGG0PsQn
 LZ0/BS8eSaC9fHDFaDHNxeA1c4m6Q6mmqDBQmJ7Do3frzkd48doi3R/3jKVV7RXmN7SJ
 keWw==
X-Gm-Message-State: AO0yUKUZYb77PyqFC66iJ8HokD6pevdzwtDwwKYKWt3ceJquYcAwK67k
 oSwEFb8UBDppV+eTj4cWVBf21ROjgt5MV5U0XKo2ag==
X-Google-Smtp-Source: AK7set/dbBJ+hLxAtG6BnZVloKSGPUIYpZEeINk903RWYbTUM2E16y4h4u1gV8o5/r1LEObpdHriwWyH3dvSZqK1wyw=
X-Received: by 2002:a17:907:d9f:b0:8d0:2c55:1aa with SMTP id
 go31-20020a1709070d9f00b008d02c5501aamr1380174ejc.0.1679404390586; Tue, 21
 Mar 2023 06:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAOf5uwkDb=pkEV_qSshA7PnSxCV82sEwrmivAZhth48ae0S++g@mail.gmail.com>
 <87ileu8jwh.fsf@intel.com>
 <CAOf5uw=g1mU1F=kD6M472LRaTWa2B=Sry4GDGXxDApoZknLfeA@mail.gmail.com>
 <87cz528hzk.fsf@intel.com>
 <CAPj87rPPA9oYkZyQ=Y3MRuyJUN71WHDWHpdaRUvuXAxFSLW5SA@mail.gmail.com>
 <87355y8fzk.fsf@intel.com>
 <CAPj87rMnr343w+Nm3pZ-pF-y1LXdyzcMOXUxkid2kgViRaNY9g@mail.gmail.com>
In-Reply-To: <CAPj87rMnr343w+Nm3pZ-pF-y1LXdyzcMOXUxkid2kgViRaNY9g@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 21 Mar 2023 14:12:59 +0100
Message-ID: <CAOf5uwmYjtL--qDSwPwLeb6v3rer976em9swBh44YD=0JK2NgQ@mail.gmail.com>
Subject: Re: display band (display area vs real visible area)
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel

On Tue, Mar 21, 2023 at 1:15=E2=80=AFPM Daniel Stone <daniel@fooishbar.org>=
 wrote:
>
> Hi,
>
> On Tue, 21 Mar 2023 at 12:08, Jani Nikula <jani.nikula@linux.intel.com> w=
rote:
> > On Tue, 21 Mar 2023, Daniel Stone <daniel@fooishbar.org> wrote:
> > > There have been some threads - mostly motivated by MacBooks and the
> > > Asahi team - about creating a KMS property to express invisible areas=
.
> > > This would be the same thing, and the userspace ecosystem will pick i=
t
> > > up when the kernel exposes it.
> >
> > In my case the kernel handled it completely internally, and the
> > userspace didn't even know. But I guess it depends on the display being
> > able to take a smaller framebuffer, otherwise I don't think it's
> > feasible.
> >
> > I haven't checked the threads you mention but I assume it covers the
> > more general case of having rounded corners or holes for the camera, no=
t
> > just the frame covering the edges or something like that. That couldn't
> > possibly be handled by kernel alone, but it's also a bunch of
> > infrastructure work both in kernel and userspace to make it happen.
>
> Yeah, exactly. Just a connector property, which could come from DT or
> ACPI or manual overrides or whatever. Userspace would still allocate a
> full-size framebuffer, but look at that property and not render
> anything useful into those areas. In the camera/notch case, it's a
> matter of not putting useful content there. In the letterbox/pillarbox
> case, it's about shrinking the reported screen size so that window
> management, clients, etc, all believe that the screen is smaller than
> it is.

So it's up to wayland or compositor to take account of the side band,
including touch controller.
Am I right?

Michael
>
> Cheers,
> Daniel
