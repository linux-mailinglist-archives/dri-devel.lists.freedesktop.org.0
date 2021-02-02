Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC7C30C122
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 15:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7456E177;
	Tue,  2 Feb 2021 14:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DC16E177
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 14:18:22 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c12so20642740wrc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 06:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=9FZzU82hRsBiBhCvFEyc1JNn9WVYxWSX0ROwEjKj8Rg=;
 b=GwVbMM/GT+m8K5UcUXdmExA/pYjXDof3+EnMb7+8Cl6aIJlm1uCCHPw+tlPv1hohpT
 1zTGdVrF2VGLmCwNxrlxlPiK78iFKTflXrGTi66wCosaQUGX5O0OStfWw78RHa9PiLJC
 osn8fiaBb3p8cxCoJS8Ws2hlTRkIsSbxHMUU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=9FZzU82hRsBiBhCvFEyc1JNn9WVYxWSX0ROwEjKj8Rg=;
 b=KbCe4zCbr6pS23O4KwOkktk3wA8mY7mortQX/sufxSh5NobBGJioa0PekvyFWPSAbG
 ynlIiC3uLNgH/ifgm5/jjlDhlfXVrOYNzT5wvbo/m+4jvkLnHvFTfXdKdjSpsg3rfuQo
 MabcPL6C3Ws7Uw35I1wG7REqj0qvrRAX8ur0tjr7wWYvY1vt6P/Slj9uBdZg4mMwICeA
 f1hbyfHIYaxOW8pLVJCVafNv0WNkXDVX+AWfJdRnWo50Mef1ag19VPiff750YAKwL5zV
 1ihsA6uwIwvSGF4B1lkLsyIC71sUX9FS6hOxHenBKyDChYDHSLuAiyK69S2LxfZGT1HD
 z7Iw==
X-Gm-Message-State: AOAM5323Sz22E+L9Lr1P74kSzOtFCVnb0gK+aYjeXPw4jMJt/5MKqo6m
 C4PrdGOA/srFOv+OyuM7Akz+0w==
X-Google-Smtp-Source: ABdhPJxWbAhjU2qfGmhuJhrSt3iNYt3WMYnXjgmiSCegUaxOoOCW83wp3SgyIYrGtzxriJ9bTMvKTg==
X-Received: by 2002:adf:b64f:: with SMTP id i15mr23222482wre.279.1612275501681; 
 Tue, 02 Feb 2021 06:18:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t205sm3373846wmt.28.2021.02.02.06.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 06:18:20 -0800 (PST)
Date: Tue, 2 Feb 2021 15:18:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Phillip Susi <phill@thesusis.net>
Subject: Re: fbcon: remove soft scrollback code (missing Doc. patch)
Message-ID: <YBlfKgQ1laQLFqpW@phenom.ffwll.local>
Mail-Followup-To: Phillip Susi <phill@thesusis.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Pavel Machek <pavel@ucw.cz>, Randy Dunlap <rdunlap@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
References: <20200916205434.GA10389@duo.ucw.cz>
 <87czyf5jjp.fsf@vps.thesusis.net>
 <CAHk-=wjsjC1h7fskwYaaRLykN1ms6ZtxGvucQgmL-zZTfxPdBA@mail.gmail.com>
 <CAKMK7uEGXOC_ci=Drm=Hz+xPGdcoxv8YZ-gcOckoPmu2XijiSA@mail.gmail.com>
 <CAMuHMdVzCjVim4A3eAZzztqUyjb6a2bjmSkgxUnaugQFv42qag@mail.gmail.com>
 <87k0s4ai33.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k0s4ai33.fsf@vps.thesusis.net>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Pavel Machek <pavel@ucw.cz>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 22, 2021 at 01:55:04PM -0500, Phillip Susi wrote:
> 
> Geert Uytterhoeven writes:
> 
> Judging from some of the comments in the code, it looks like you were
> one of the original authors of fbcon?  I haven't been able to find any
> of these sczbot crash reports, and am not sure how fuzzing syscalls
> would really affect this code ( it's not really handling a buch of
> ioctls or otherwise taking arguments from user space ) , but I am a bit
> confused as to why the softback was implemented the way that it was.
> 
> vgacon simply copies the main buffer to vram in ->set_origin() and then
> changes the pointers to operate out of the much larger vram while that
> virtual terminal is active.  If I understand it correctly, it looks like
> fbcon instead opts to operate out of the main buffer but rescue lines as
> they are scrolled off and relocate them to the softback buffer.  This
> seems to be rather more convoluted.
> 
> I'm thinking of re-implementing scrollback more like the way vgacon does
> it: allocate a big "vram" buffer and operate out of that.  Obviously
> ->scroll() and ->scrolldelta() have to actually repaint the screen rather
> than simply change the pointer register, but that should be about the
> only difference.
> 
> I have also noticed that there was some code to use hardware panning of
> the video buffer rather than having to do a block bitblt to scroll the
> contents of the screen, but that it was disabled because virtually no
> video drivers actually implemented it?  That seems like a shame, but if
> it is so, then there's no sense carrying the dead code so I think I'll
> clean that up now.
> 
> Now that I look at it again, everything is simply always redrawn now
> instead of even doing a simple bitblt.  Daniel, you mentioned that
> almost nobody supports hardware acceleration, but even without any
> specific hardware support, surely even if bitblt() is implemented just
> as a memcpy(), it has to be faster than redrawing all of the characters
> doesn't it?  Getting rid of the panning if it isn't generally supported
> I can see, but I don't understand killing bitblt even if most devices
> don't accelerate it.

Just a quick comment on this: Since most framebuffers are write-combining,
and reads from that tend to be ~3 orders of magnitude slower than writes
(at least on the pile of machines I looked at here, there's big
differences, and some special streaming cpu instructions to make the
reading side not so slow).

So scrolling by copying tends to be significantly slower than just
redrawing everything.

And once you're at that point it's really hard to write a 2d acceleration
which is consistently faster than just cpu rendering.

If you're interested in why 2d acceleration is rather hard as a general
problem, not just specific to fbcon, I wrote a blog on that a while ago:

https://blog.ffwll.ch/2018/08/no-2d-in-drm.html

Cheers, Daniel

> In addition, I noticed that ->screen_pos() was changed to just return
> vc_origin+offset.  fbcon is the only console driver to implement
> ->screenpos() and if not implemented, vt defaults to using
> vc_visible_origin+offset, so it looks like this function isn't needed at
> all anymore and ->screen_pos() can be removed from struct consw.
> 
> Does this make sense or am I talking crazy?

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
