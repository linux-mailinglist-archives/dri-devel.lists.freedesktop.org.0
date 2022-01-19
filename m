Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B994493BF9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 15:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB67210EB6E;
	Wed, 19 Jan 2022 14:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC7A10EB6E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 14:34:19 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 y11-20020a0568302a0b00b0059a54d66106so3410211otu.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 06:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9kzQsP7xdcOo4/yHfvVfKqgcZoVNHB3M0EMVy+tuCNU=;
 b=MwwZUQEW+QtUVAq3466CCsAjvpvJ+cNXwRETxi+xwQ7hhpUwOhOatm4nTEbLEGotoB
 1TtUz25a044+zv7NdXKpBKYbkIe9pjHagzS4w7TB1YrlUpj02u78LXj10ZlkcabweW3t
 MGkz/WnNcQ137Dj9PLFhK8zwzqRGaCNqxSQUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9kzQsP7xdcOo4/yHfvVfKqgcZoVNHB3M0EMVy+tuCNU=;
 b=JVOAe2rqsAAaFxk2bRd7hPhW5ZxHP9GX4O6PNUcVH9fba7oApSrP8FPh88tbvKzq8U
 n3bU4cRtnBi6l7PmyScQa+I9uPr3g6OBZePuZhz65PR0FzqkQNK6Z5fssNOXI58drW97
 GomY+m+OuMLjL/bP0caS7ZOFt5ft9alNhE1ZbopG1sToYUeE011zA94jN6X97Um6XrkB
 6H+6H3rcIQwKaLGo5IePRiLo1nuwEDKBdjdCwKTds0AZausUiLTp0wZO4ERd9+4P9h7o
 Y2B3AIh+iD+n6dgjIDsY++cCo6lpkC4wal7uARA+UH3v2zwughWIJpFkgy6VMtUyACwa
 qKRQ==
X-Gm-Message-State: AOAM533juJoVgb10B8Sdy5pu+k5847M+LGerf+oml6o0q0RzcufMTJv8
 WgX2416fw4BZCRWuKuvjK3LY7CWEMTWjEc7F2wQhJA==
X-Google-Smtp-Source: ABdhPJzsPoKUTRwcahcaLPyRU+wwxVRU/sDDpI8hVyibcKoclfqdsQi3ILaSD45Jj8A4q4A51AgWhTyQFQ3zYYEmCCc=
X-Received: by 2002:a9d:685a:: with SMTP id c26mr24282535oto.239.1642602858341; 
 Wed, 19 Jan 2022 06:34:18 -0800 (PST)
MIME-Version: 1.0
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de>
 <Yef0j8+DBbwC7Kjv@kroah.com> <Yef15k2GtC40aJEu@kroah.com>
 <CAMuHMdVWFJEDwjf-htZ_D1484efmuPnz_L-qhcTeUE-GVpvZXA@mail.gmail.com>
 <4d8950c7-5f51-ca2b-4c93-741c7805a214@gmx.de>
 <CAHk-=wikFKjwdUBWCLCu=iL3rFq4BDDF0aBGdXC6ay74yJb+5Q@mail.gmail.com>
In-Reply-To: <CAHk-=wikFKjwdUBWCLCu=iL3rFq4BDDF0aBGdXC6ay74yJb+5Q@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 19 Jan 2022 15:34:06 +0100
Message-ID: <CAKMK7uEb53iu_HxYSnFZ59j=vXQdMvTWT7xosEo85XkAwzDMnA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
To: Linus Torvalds <torvalds@linux-foundation.org>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Sven Schnelle <svens@stackframe.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 3:01 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Jan 19, 2022 at 2:29 PM Helge Deller <deller@gmx.de> wrote:
> >
> > >>
> > >> Ah, no, that was just the soft scrollback code I was thinking of, which
> >
> > Right.
> > That was commit 973c096f6a85 and it was about vgacon, not fbcon.
>
> No, fbcon had some bug too, although I've paged out the details. See
> commit 50145474f6ef ("fbcon: remove soft scrollback code").

tbh I've paged it all out too.

> If I remember correctly (and it's entirely possible that I don't), the
> whole "softback_lines" logic had serious problems with resizing the
> console (or maybe changing the font size).

Yeah that pile of reverts was my motiviation to look into this and see
what else we could rip out most likely and still have an fbcon that
works as well as it does right now for almost all users (which is not
so great, but oh well).

> There may have been some other bad interaction with
> foreground/background consoles too, I forget.

Irrespective of this code being buggy or not buggy I think the bigger
pictures, and really the reason I want to see as much code ditched
from the fbdev/fbcon stack as we possible can, are very clear:

- it's full of bugs
- there's no test coverage/CI to speak of
- it's very arcane code which is damn hard to understand and fix issues within
- the locking is busted (largely thanks to console_lock, and the
effort to make that reasonable from -rt folks has been slowly creeping
forward for years).

Iow this subsystem is firmly stuck in the 90s, and I think it's best
to just leave it there. There's also not been anyone actually capable
and willing to put in the work to change this (pretty much all actual
changes/fixes have been done by drm folks anyway, like me having a
small pet project to make the fbdev vs fbcon locking slightly less
busted).

The other side is that being a maintainer is about collaboration, and
this entire fbdev maintainership takeover has been a demonstration of
anything but that. MAINTAINERS entry was a bit confusing since defacto
drm has been maintaining it for years, but for the above reasons we've
done that by just aggressively deleting stuff that isn't absolutely
needed - hence why I figured "orphaned" is a reasonable description of
the state of things. This entire affair of rushing in a maintainer
change over the w/e and then being greeted by a lot of wtf mails next
Monday does leave a rather sour aftertaste. Plus that thread shows a
lot of misunderstandings of what's all been going on and what drm can
and cannot do by Helge, which doesn't improve the entire "we need
fbdev back" argument.

But if the overall consensus is that that fbdev needs to be brought
back to it's full 90s glory then I think we need a copy of that code
for drm drivers (should work out if we intercept fb_open() and put our
own file_ops in there, maybe some more fun with fbcon), so that at
least for anything modern using drm driver we can keep on maintaining
that compat support code.

And with maintaining here I don't mean build a museum around it, but
actually try to keep/move the thing towards a state where we can still
tell distros that enabling it is an ok thing to do and not just a CVE
subscription (well it is that too right now, but at least we can fix a
lot of them by just deleting code).

I think until that mess is sorted out resurrecting code that's not
strictly needed is just not a bright idea.

Also wrt the issue at hand of "fbcon scrolling": The way to actually
do that with some speed is to render into a fully cached shadow buffer
and upload changed areas with a timer. Not with hw accelerated
scrolling, at least not if we just don't have full scale development
teams for each driver because creating 2d accel that doesn't suck is
really hard. drm fbdev compat helpers give you that shadow buffer for
free (well you got to set some options).

Unfortunately just ditching fbdev/fbcon compat is not an option for
many distros still, althought things are very slowly moving towards
that. Until we've arrived there I can't just pretend to not care about
what's going on in drivers/video.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
