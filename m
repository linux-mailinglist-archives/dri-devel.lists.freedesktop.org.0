Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B033006EB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 16:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE51F6EA24;
	Fri, 22 Jan 2021 15:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D67E6EA22;
 Fri, 22 Jan 2021 15:16:57 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id 63so5375553oty.0;
 Fri, 22 Jan 2021 07:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J7hsM5X337RBXgA8zRlxgywXuUZqHJFg0yJyxLbobjc=;
 b=CCJrN+kO4vxq6UZ/Wj22Wm6u8zl0Uidb/urVTs8ZtEy49rZyeCu8sXikgTz/wN3NGe
 Nd25JRPX8MevMmw8d6kqnVvqCj5rgB8pdDT0UZK2GB0S4GgROoL0Pgx7XX5Ay5iAvwtH
 C9Gc9IbuV5X5aIRQR415UN6y2IY6w0jNzePrVYormbygKQW/LMw0QXFu6rUFSq30Pls3
 tRRgq75SOOdBf0hyrIxySdha/kfIv+FXFwCVePREWolv1I5w0nVA/NVXwIzTxH84VxBR
 TkIQUm5m8TMEtBAR6vK+YS/xWJQa1ASd6RqP5N2TyE3BYksgAIZ+NIMroCh463FR0qT5
 mmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J7hsM5X337RBXgA8zRlxgywXuUZqHJFg0yJyxLbobjc=;
 b=M7VVDfI03HK+UMYM5xCSPd4xPmbpyd0j7Xj7r1DQWQt9SztNKMBWVTzr03AHwFQR9h
 dTziR3SrjsmaPceQ8xWQjoHg2a/piS774xPCtr3OmS0WQqVQ2UT+6C6M+7aizepV+utE
 HxsSv3iU4XKGq49je5BuG8XOwtAzV0XEHrcdzJm68ual4OPoLgZFIedUxJr3F5EXmk8d
 1BWfWX9MGnillfA9Gauf5S6OV8/BLVwXi4+P9ICTTTTuKJOfr/8YPA6cYaHkOptRoDNe
 dDT46/eRiGROlqAl3aMkpYhVQIGJwWAoY1BqPKj7lDFv8IY2I/wnHvWNSRHz1YAWeg9p
 KFLA==
X-Gm-Message-State: AOAM530JZ/yOHTFoHpeKe9RtV+69mjvRy6ENPkG0XxJ5xsr1T8qDg4JF
 k+gCnHHQtzGq5vXidf57KhETabiUbBQm6+8hBNk=
X-Google-Smtp-Source: ABdhPJzKjbvT4HLqe+JUjy1xMTgv1OV5BygQ+3I+v0cQ5ltL+ymiZWeskpC0NMssThgkmNlCPeiHIyzSzj0Uw2ZvmBE=
X-Received: by 2002:a9d:1293:: with SMTP id g19mr3634062otg.311.1611328616464; 
 Fri, 22 Jan 2021 07:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20210119155029.18943-1-aurabindo.pillai@amd.com>
 <20210122103248.779e70bf@eldfell> <YAqeHZlDBrgALLo9@phenom.ffwll.local>
In-Reply-To: <YAqeHZlDBrgALLo9@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 22 Jan 2021 10:16:45 -0500
Message-ID: <CADnq5_NkgDQqm8uTziTOhb9sv3jEzyfoCt_q_P1RA_mvpmkfEQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Experimental freesync video mode optimization
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Stylon Wang <stylon.wang@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Thong Thai <thong.thai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Wayne Lin <wayne.lin@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 22, 2021 at 4:43 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Jan 22, 2021 at 10:32:48AM +0200, Pekka Paalanen wrote:
> > On Tue, 19 Jan 2021 10:50:26 -0500
> > Aurabindo Pillai <aurabindo.pillai@amd.com> wrote:
> >
> > > Changes in V5
> > > =============
> > >
> > > * More info in commit messages on the rationale of changes being added
> > > to the kernel.
> > > * Minor fixes
> >
> > Hi,
> >
> > thank you for adding the explanations in the commit messages I asked
> > for. It is now up to DRM maintainers to determine if this is
> > conceptually fine.
> >
> > I do see that apparently setting the opt-in option does not yet taint
> > the kernel although Daniel Vetter suggested it might be a good idea. I
> > guess tainting the kernel would make it easier to remove this feature
> > in the future because it would be easier to dismiss people that claim a
> > kernel regression due to the removal.
>
> Reading the descriptions I'm honestly not sure why this isn't enabled by
> default?
>
> Maybe the explanations should also capture why this is maybe not a good
> idea ...

I don't know that it's a bad idea, I guess we are just cautious to
avoid unforeseen consequences until we have more real world experience
using the feature.  One issue brought up as a possible problem, but
not actually verified to my knowledge, was the possibility of using a
bit more power with freesync modes.  E.g., if you just change the
front porch to set the refresh to 48 Hz on a 90Hz mode, you are
technically running the display phys at the higher clock speed so you
can seamlessly transition to 90Hz or whatever.  I don't know that it
uses that much additional power and lets you get some nice features in
a relatively seamless manner that already works today with most media
players.

I guess for media player folks, is this something you'd like as is?  A
more explicit API may be nicer, but I think I think the ultimate
solution will end up getting tied up in what are plans are for bigger
features like more advanced flip queues and stuff like that.  So this
seems like a nice intermediate step.

Alex


> -Daniel
>
> >
> >
> > Thanks,
> > pq
> >
> >
> > > --
> > >
> > > This patchset enables freesync video mode usecase where the userspace
> > > can request a freesync compatible video mode such that switching to this
> > > mode does not trigger blanking.
> > >
> > > This feature is guarded by a module parameter which is disabled by
> > > default. Enabling this paramters adds additional modes to the driver
> > > modelist, and also enables the optimization to skip modeset when using
> > > one of these modes.
> > >
> > > --
> > >
> > > Aurabindo Pillai (3):
> > >   drm/amd/display: Add module parameter for freesync video mode
> > >   drm/amd/display: Add freesync video modes based on preferred modes
> > >   drm/amd/display: Skip modeset for front porch change
> > >
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 401 ++++++++++++++++--
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   3 +
> > >  4 files changed, 382 insertions(+), 35 deletions(-)
> > >
> >
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
