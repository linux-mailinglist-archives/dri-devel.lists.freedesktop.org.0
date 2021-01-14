Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72462F6576
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 17:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E48D6E027;
	Thu, 14 Jan 2021 16:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FCC6E027
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 16:11:19 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id i6so5652694otr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 08:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lI7DNB9PJvzlL1ZP9cY7fdOx2/ptLeVjeZhhrDDi7c4=;
 b=Zi8S4ocJOhLeZPI7DA82w2n/RGNymWj4EnipZ421KIVCN3q+pn6FHQlQjVv4fbVCTq
 Arl+l+jzarPBMM/Q4vO6TR9DcPVhQMO9VvuyqHQXyLCv+FfsVMoypWDiVtBzddb+YuxA
 K1x1YV7KyaUREwbkOGl2QJAf+Oot3y9DhjTh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lI7DNB9PJvzlL1ZP9cY7fdOx2/ptLeVjeZhhrDDi7c4=;
 b=VKnNFc00a4qOi3R2YjNZ6zYsPYlqxnqCFO/G7F318q4UP8Q1cJnqVfT+Wk2WloQqVy
 liq04E1lm9HWnwQUm+NAmiqhg6IbpNPLwB5mo0DfPQAZt9eFIkfmcAUkqZw+kADYydxN
 XtkUGzz6Py06BIJ2Mg7mZ1daNC8D/rkHwOFdzGExgsz26X6XjPcQI0Dhyz3Z5t6NI5P5
 kezDP8QuH3x4WT9mwgqS7xa+wV/XND4i/4c/8VpU+EONSJ0rLri+2ML1Ve5twiAiBqT6
 bdx5eQFv9zvNY5wOXQkKU6ZsRO+iMTmrikxFsNhoOVI2oSRcj8qnQSuaivggUwEe0AtI
 vrVA==
X-Gm-Message-State: AOAM533G0b7QHLz3r91nwFNLXK6HhOL2wbQy8dysurLpVsXaqFv5vji+
 pEM+lJ1gArmrVrJIa7IcuY6Q9QJVsIhLgovF9sHuSQ==
X-Google-Smtp-Source: ABdhPJzzz22o9OQD7ab1kI0cLaSVhXvWLJ9AS4BVjPKCWnUBdp3at3x0E09pBUvROlXehDbVAiUAp+GHsISnTag0oIg=
X-Received: by 2002:a05:6830:1bef:: with SMTP id
 k15mr4945559otb.303.1610640679142; 
 Thu, 14 Jan 2021 08:11:19 -0800 (PST)
MIME-Version: 1.0
References: <20200916205434.GA10389@duo.ucw.cz>
 <87czyf5jjp.fsf@vps.thesusis.net>
 <CAHk-=wjsjC1h7fskwYaaRLykN1ms6ZtxGvucQgmL-zZTfxPdBA@mail.gmail.com>
 <CAKMK7uEGXOC_ci=Drm=Hz+xPGdcoxv8YZ-gcOckoPmu2XijiSA@mail.gmail.com>
 <CAMuHMdVzCjVim4A3eAZzztqUyjb6a2bjmSkgxUnaugQFv42qag@mail.gmail.com>
In-Reply-To: <CAMuHMdVzCjVim4A3eAZzztqUyjb6a2bjmSkgxUnaugQFv42qag@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 14 Jan 2021 17:11:07 +0100
Message-ID: <CAKMK7uEwHu5GLF16wn83PLZUjoJWgF0dcLXwsGkt_aBpOgLt+w@mail.gmail.com>
Subject: Re: fbcon: remove soft scrollback code (missing Doc. patch)
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
 Phillip Susi <phill@thesusis.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 14, 2021 at 4:56 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Daniel,
>
> CC linux-fbdev
>
> On Tue, Jan 12, 2021 at 5:00 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Sat, Jan 9, 2021 at 12:11 AM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > > On Fri, Jan 8, 2021 at 11:13 AM Phillip Susi <phill@thesusis.net> wrote:
> > > > > Could we pause this madness? Scrollback is still useful. I needed it
> > > > > today... it was too small, so command results I was looking for
> > > > > already scrolled away, but... life will be really painful with 0
> > > > > scrollback.
> > > >
> > > > > You'll need it, too... as soon as you get oops and will want to see
> > > > > errors just prior to that oops.
> > > >
> > > > > If it means I get to maintain it... I'm not happy about it but that's
> > > > > better than no scrollback.
> > > >
> > > > Amen!  What self respecting admin installs a gui on servers?  What do we
> > > > have to do to get this back in?  What was so buggy with this code that
> > > > it needed to be removed?  Why was it such a burden to just leave it be?
> > >
> > > It really was buggy, with security implications. And we have no maintainers.
> > >
> > > So the scroll-back code can't come back until we have a maintainer and
> > > a cleaner and simpler implementation.
> > >
> > > And no, maintaining it really doesn't mean "just get it back to the
> > > old broken state".
> > >
> > > So far I haven't actually seen any patches, which means that it's not
> > > coming back.
> > >
> > > The good news? If you have an actual text VGA console, that should
> > > still work just fine.
>
> IIRC, all of this was written for systems lacking VGA text consoles
> in the first place...
>
> > Also on anything that is remotely modern (i.e. runs a drm kernel
> > modesetting driver undearneath the fbdev/fbcon stack) there's a pile
> > more issues on top of just the scrollback/fbcon code being a mess.
>
> Would it help to remove DRM_FBDEV_EMULATION (instead)?

It's a problem with the hardware. "Write some registers and done"
isn't how display blocks work nowadays. So your proposal amounts to
"no fbdev/fbcon for anything modern-ish".

Also I said "a pile more", most of the issues in fbcon/fbdev code
apply for all drivers.

> > Specifically the locking is somewhere between yolo and outright
> > deadlocks. This holds even more so if the use case here is "I want
> > scrollback for an oops". There's rough sketches for how it could be
> > solved, but it's all very tricky work.
>
> When an oops happens, all bets are off.  At that point, all information
> you can extract from the system is valuable, and additional locking
> issues are moot.

Except the first oops then scrolls aways because it's getting buried
under further fail. Your locking needs to be minimally good enough to
not make the situation worse.
-Daniel

> > Also adding dri-devel since defacto that's the only place where
> > display people hang out nowadays.
>
> Please keep on CCing linux-fbdev, especially for patches removing
> fbdev features.
>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
