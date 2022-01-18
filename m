Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A1D49246D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 12:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F2910E482;
	Tue, 18 Jan 2022 11:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD62F10E482
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 11:14:28 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 v8-20020a9d6048000000b005960952c694so13148392otj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 03:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IE2Bi6BX71GxVQQunYcWXmzILspUK92Ha2RwuVxfI6g=;
 b=LhkdNE7Wa26DngF4QUM7KSJu6ffhXhV5rJMzNxMrt1cOP43VQAYu3S47MmjB6Tokyu
 g+i+uC7VE/qqn2eyLWNhPtarxTba/7Rt8z1VALemM5KSN00/UOLhnIKU9xtl0pFEv+3h
 4yH4xyvyE6otKaXhN2fXWk3QwgUS3V76OsszQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IE2Bi6BX71GxVQQunYcWXmzILspUK92Ha2RwuVxfI6g=;
 b=bxVCJSwAg8zN9mV2mVqKD2vhTMNY72z84rENUv9cHuGJqm3nHCyvqEABc+sEn+VwUd
 8w3wPuLw3zxmdp4YtJ9jvt3PZLLmF2ImQ9rEp3NycdTLzh7DE/9PejAg+yCbqn5LkFAJ
 OJHcVbQN9zCrGL+LZ3BChGKm/scAb5Q9RrMOOaipWyDSdSV2b2DzUW1KHGZ2AfTq/20l
 uxzp45+xWJRhnThWfkoinHzB/G+TS6oNstcoCZBwLQcDBhgvwoFizeZ6FKgr21R2oKIl
 dhwRzRxmjKRFFxzHQlWW5RENCBdZP6E0dDm8XLhJ8eZ/W51pRDtWilT/JSk5OGCBvH8R
 lMPQ==
X-Gm-Message-State: AOAM5318V0YI3inBW0f3R7ajUnYIJUaU5q1GA0hgQ1f9i1xM/4ldXouE
 u6tkMndk1l0x0IKw1BjjkB3ZLwDajAW8wpdX3e6XXQ==
X-Google-Smtp-Source: ABdhPJz/h9I5sASIC1KgAr2w0o6g5bvtKYeaZaU2ifc/uG9A1tp3zEkGuLQZ79GYR8K7qHRcO4txTn0Lx+0OAr5LxfE=
X-Received: by 2002:a9d:685a:: with SMTP id c26mr19640268oto.239.1642504467576; 
 Tue, 18 Jan 2022 03:14:27 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
 <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de>
 <e19563aa-21a3-e13c-4143-847bd77a38c7@gmx.de>
 <e4242fe9-13b1-91b5-d254-992f48115589@gmx.de>
 <CAKb7UvgXaeX7FRUK_Q35N=2zBms8WgCe=ZBKr3dHrixoJWtvqw@mail.gmail.com>
In-Reply-To: <CAKb7UvgXaeX7FRUK_Q35N=2zBms8WgCe=ZBKr3dHrixoJWtvqw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 18 Jan 2022 12:14:16 +0100
Message-ID: <CAKMK7uH+88f6_NANd1F3ux7+j3iXg+AYWsNrVktuZOAAfc9Ngg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To: Ilia Mirkin <imirkin@alum.mit.edu>
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>, Helge Deller <deller@gmx.de>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 17, 2022 at 10:55 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> On Mon, Jan 17, 2022 at 2:47 PM Helge Deller <deller@gmx.de> wrote:
> >
> > On 1/17/22 17:21, Helge Deller wrote:
> > > On 1/17/22 16:58, Thomas Zimmermann wrote:
> > >> Hi
> > >>
> > >> Am 17.01.22 um 16:42 schrieb Helge Deller:
> > >>> [...]
> > >>>>> c) reintroduce the state where fbcon is fast on fbdev. This is important for non-DRM machines,
> > >>>>>     either when run on native hardware or in an emulator.
> > >>>>> d) not break DRM development
> > >>>>>
> > >>>>> Especially regarding c) I complained in [1] and got no feedback. I really would like to
> > >>>>> understand where the actual problems were and what's necessary to fix them.
> > >>>>>
> > >>>>> Helge
> > >>>>>
> > >>>>> [1] https://lore.kernel.org/r/feea8303-2b83-fc36-972c-4fc8ad723bde@gmx.de
> > >>
> > >> Seems like few people read linux-fbdev these days.
> > >> I suggest to partly revert the patch to the point were performance
> > >> gets better again.
> > > Yes, *please*!
> > > That would solve my biggest concern.
> > >
> > > As far as I can see that's only 2 commits to be reverted:
> > > b3ec8cdf457e - "fbdev: Garbage collect fbdev scrolling acceleration, part 1 (from TODO list)"
> > > 39aead8373b3 - "fbcon: Disable accelerated scrolling"for-next-next
> > >
> > > I think both were not related to any 0-day bug reports (but again, I might be wrong).
> >
> > I did some more checking...
> >
> > Both patches are not related to DRM, since no DRM driver sets the
> > FBINFO_HWACCEL_COPYAREA or FBINFO_HWACCEL_FILLRECT flags.
>
> These used to be set by, at least, nouveau (which is a drm driver).
> And yeah, console responsiveness is _way_ worse without that. People
> keep pushing the messaging that it's the same speed to do it as
> memcpy, but that's just not the case in my experience, on a pretty
> bog-standard x86 desktop. The support got dumped, and it felt pretty
> clear from the messaging at the time, "too bad". Would love to see it
> come back.

You need to add in a shadow buffer and it's fast. The problem is that
the default fbcon sw code just replaces a hw blitter, and so does a
_lot_ of memmoves reading from wc/uc memory. Which is an absolute
disaster and results in a slideshow.

Once you stop doing that the thing is pretty reasonable, which would
also be what all the userspace sw compositors are doing. Fact that no
one bothers to roll this out for most drivers just shows how little
people care about accelerated fbcon.
-Daniel


>
> Cheers,
>
>   -ilia



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
