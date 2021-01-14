Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8A52F653A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 16:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4126E42E;
	Thu, 14 Jan 2021 15:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779E46E42E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 15:56:50 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id l207so6382176oib.4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 07:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y0MoCmIyBbiEovesbLQa2skQFcnP2H8/At5+Yu5mU8k=;
 b=il7mPD7QMYz7FfsCJNHbp8cge9eCL3lW8Vnn+wOru7M7bhPIhC3jRm2NkgdpV3OLRE
 Rf79hXMHwlZZa6rFtwAK2ZF9JCGo3qP8TugerJRGBVNupA0gyw9DHCP7Is7osqUmNEjq
 KuGf4ql1FJ5ZErTZ3TOoIknjBtTMT8ZfxdcuhnyeqxJ4NYmhbmkK2Etoli0MVVFl5Tao
 QvR6niuA9MeswwhNEtmhdOy83LBU9yFMDV3uN+n1GekRsU7LW2Uuh3co0Xsrymvstmpd
 P/amf+MjY2zJ2MnCm/J+2StMo0OB2llHGTZbMpD2pIGesCzXEkklfmZc+hE6GBXthzm4
 /24Q==
X-Gm-Message-State: AOAM530ALFJ0rl1BwBrvwL4o9tHBhMJjVVJBbWZ4i7+E51alolTEyrkt
 tEFZnY4reV1EpuBz1GGYM9dXssPBTM2pHR1tn21eBrTYPC0=
X-Google-Smtp-Source: ABdhPJz3tFPzEi+kqhb52Yw3+gOpoRqT4PX+G+XIAyHJZ4riIuUyvmmAAObS/i6xIg8FVvZgRnPMv5SNOvQoR8zuzzk=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr2906604oih.153.1610639809807; 
 Thu, 14 Jan 2021 07:56:49 -0800 (PST)
MIME-Version: 1.0
References: <20200916205434.GA10389@duo.ucw.cz>
 <87czyf5jjp.fsf@vps.thesusis.net>
 <CAHk-=wjsjC1h7fskwYaaRLykN1ms6ZtxGvucQgmL-zZTfxPdBA@mail.gmail.com>
 <CAKMK7uEGXOC_ci=Drm=Hz+xPGdcoxv8YZ-gcOckoPmu2XijiSA@mail.gmail.com>
In-Reply-To: <CAKMK7uEGXOC_ci=Drm=Hz+xPGdcoxv8YZ-gcOckoPmu2XijiSA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Jan 2021 16:56:38 +0100
Message-ID: <CAMuHMdVzCjVim4A3eAZzztqUyjb6a2bjmSkgxUnaugQFv42qag@mail.gmail.com>
Subject: Re: fbcon: remove soft scrollback code (missing Doc. patch)
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

Hi Daniel,

CC linux-fbdev

On Tue, Jan 12, 2021 at 5:00 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Sat, Jan 9, 2021 at 12:11 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> > On Fri, Jan 8, 2021 at 11:13 AM Phillip Susi <phill@thesusis.net> wrote:
> > > > Could we pause this madness? Scrollback is still useful. I needed it
> > > > today... it was too small, so command results I was looking for
> > > > already scrolled away, but... life will be really painful with 0
> > > > scrollback.
> > >
> > > > You'll need it, too... as soon as you get oops and will want to see
> > > > errors just prior to that oops.
> > >
> > > > If it means I get to maintain it... I'm not happy about it but that's
> > > > better than no scrollback.
> > >
> > > Amen!  What self respecting admin installs a gui on servers?  What do we
> > > have to do to get this back in?  What was so buggy with this code that
> > > it needed to be removed?  Why was it such a burden to just leave it be?
> >
> > It really was buggy, with security implications. And we have no maintainers.
> >
> > So the scroll-back code can't come back until we have a maintainer and
> > a cleaner and simpler implementation.
> >
> > And no, maintaining it really doesn't mean "just get it back to the
> > old broken state".
> >
> > So far I haven't actually seen any patches, which means that it's not
> > coming back.
> >
> > The good news? If you have an actual text VGA console, that should
> > still work just fine.

IIRC, all of this was written for systems lacking VGA text consoles
in the first place...

> Also on anything that is remotely modern (i.e. runs a drm kernel
> modesetting driver undearneath the fbdev/fbcon stack) there's a pile
> more issues on top of just the scrollback/fbcon code being a mess.

Would it help to remove DRM_FBDEV_EMULATION (instead)?

> Specifically the locking is somewhere between yolo and outright
> deadlocks. This holds even more so if the use case here is "I want
> scrollback for an oops". There's rough sketches for how it could be
> solved, but it's all very tricky work.

When an oops happens, all bets are off.  At that point, all information
you can extract from the system is valuable, and additional locking
issues are moot.

> Also adding dri-devel since defacto that's the only place where
> display people hang out nowadays.

Please keep on CCing linux-fbdev, especially for patches removing
fbdev features.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
