Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CE9493D6F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A8110E302;
	Wed, 19 Jan 2022 15:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2754610E314
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:42:20 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 q15-20020a4a6c0f000000b002dc415427d3so853197ooc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sV3+kDUL8DjXoSEoLC5sXb4a9dOfAi1JlkS/4ECjvmk=;
 b=evupy6jbU/zkHyiw80GH7FsGZa1tP7RHT2/12cO+4uKW5JeDTCmqIYtqol5Zre9096
 zea8POTzyFWE686ja34SKcLRPrrM8RovCstJr77m/tNTbDjX+hlEcc8BsUH5FvwNU5HD
 qsr4oXlbRiiNg3A0dp5ep0yYYVTkTW9BpZ5iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sV3+kDUL8DjXoSEoLC5sXb4a9dOfAi1JlkS/4ECjvmk=;
 b=5Pmpq+aBHOUYp/IWXc65gsoEaQW3gkKVLiqZnHe8qCzOpUnEDcDGZCPATz+E1kCXqy
 Gbw7ZxB9cq8ldsOLy0xC7r/Bn6js8792xeUJtCp1qrtpO/x3ii0x78xI+zX6JjauDBlY
 wcQOEQVKHw5mumCHcah1ztcebSE+9JbKXDPr732WJiXLudPkx/M+l+NqM+bf5ncZIury
 fWAfIRaFMkYNEQ+N4h0leqvQ6dv5iWF5dxvGdUCHXvSI/2a2YMb8hoOrCvhsbmpQdUJy
 s79wCc22PLDekl6MjFGe3bWaPfzZ5nV3qIb+D1qQLIxDciF+TteVmhccR3nrWffnpOq2
 7BUA==
X-Gm-Message-State: AOAM5304+tNb58PRTLGDmbdZhWfweyrMIJHYksPrKO1bVh9We2grSiEo
 jra9RxO5ySbAg4moSn29BMrxIE4AuGVW41ElLK9x3Q==
X-Google-Smtp-Source: ABdhPJy1jF87ij4w/+5l4yF+BCVJUry1sfgh+1wGxiideA8/zbNw4kVCCpwr6CQ1DSKDi+tQ6WImdhmt0nLCEpnChJc=
X-Received: by 2002:a4a:db96:: with SMTP id s22mr20322036oou.66.1642606939245; 
 Wed, 19 Jan 2022 07:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de>
 <Yef0j8+DBbwC7Kjv@kroah.com> <Yef15k2GtC40aJEu@kroah.com>
 <CAMuHMdVWFJEDwjf-htZ_D1484efmuPnz_L-qhcTeUE-GVpvZXA@mail.gmail.com>
 <4d8950c7-5f51-ca2b-4c93-741c7805a214@gmx.de>
 <CAHk-=wikFKjwdUBWCLCu=iL3rFq4BDDF0aBGdXC6ay74yJb+5Q@mail.gmail.com>
 <CAKMK7uEb53iu_HxYSnFZ59j=vXQdMvTWT7xosEo85XkAwzDMnA@mail.gmail.com>
 <8735ljkboo.fsf@x1.stackframe.org>
In-Reply-To: <8735ljkboo.fsf@x1.stackframe.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 19 Jan 2022 16:42:06 +0100
Message-ID: <CAKMK7uHHF22+MBz5D2kBv07X2BR76UDi2-JP7eO-f=nm-pymcw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
To: Sven Schnelle <svens@stackframe.org>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 4:06 PM Sven Schnelle <svens@stackframe.org> wrote:
>
> Daniel Vetter <daniel@ffwll.ch> writes:
>
> > On Wed, Jan 19, 2022 at 3:01 PM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > Irrespective of this code being buggy or not buggy I think the bigger
> > pictures, and really the reason I want to see as much code ditched
> > from the fbdev/fbcon stack as we possible can, are very clear:
> >
> > - it's full of bugs
> > - there's no test coverage/CI to speak of
> > - it's very arcane code which is damn hard to understand and fix issues within
> > - the locking is busted (largely thanks to console_lock, and the
> > effort to make that reasonable from -rt folks has been slowly creeping
> > forward for years).
> >
> > Iow this subsystem is firmly stuck in the 90s, and I think it's best
> > to just leave it there. There's also not been anyone actually capable
> > and willing to put in the work to change this (pretty much all actual
> > changes/fixes have been done by drm folks anyway, like me having a
> > small pet project to make the fbdev vs fbcon locking slightly less
> > busted).
>
> Saying it's stuck in the 90ies, and actively trying to prevent
> Helge from taking over maintainership at the same time looks odd.
> I think Helge should at least get a chance to fix the issues. If the
> state is still the same in a year or so it should be discussed again.

You don't need maintainership to fix issues. You need to submit patches.

If otoh you get the maintainership first to be able to cram in reverts
without discussions, then it's very backwards.

> > The other side is that being a maintainer is about collaboration, and
> > this entire fbdev maintainership takeover has been a demonstration of
> > anything but that. MAINTAINERS entry was a bit confusing since defacto
> > drm has been maintaining it for years.
>
> It was marked as 'Orphaned'. Anyone is free to send a Patch/PR to take
> over maintainership. If you have strong opinions about that code (And you
> obviously have reading your mail, set it to 'maintained' and care about
> it. Everything else is just wrong in my opinion.

I already added dri-devel so anything we drastically change can be
discussed first. If that's indeed not strong enough then yes I can
whack in full maintainer entry with a bugfix-only status.

But really I try to not create facts with just editing MAINTAINERS
first and ask questions later, that's just not a great way to
collaborate.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
