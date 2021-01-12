Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A94BD2F34D6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 16:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C276E247;
	Tue, 12 Jan 2021 15:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D136E247
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 15:57:45 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id x13so2683073oto.8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 07:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ipPU2vUc+BFfUi92jCI9tLYRCUYmdD6X+lgC1SjK0wc=;
 b=N/kJEm00glSMDkxyusQwQrXuK/TuEczkrU13epKkLv4ZujV7CmBMz7zExMyAmD/c8V
 fn4UuIte+aoF6LalD6gqyintU4Sx+9Y/524JjdnFYzLFIXD1OIRHQoZuytPVhhhbEBOD
 cC7OkVGttZF6yeiEnyVnJ+Dirk1yKpLg3XsWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ipPU2vUc+BFfUi92jCI9tLYRCUYmdD6X+lgC1SjK0wc=;
 b=DxXNluLbijhiO5FqZTevYxutfGm3d5g+RBnkvVNqQGkjSO1sfVH/8boJUwBuHTk81v
 OHGWIexAefOrsCAEn9y++oHdBEboIgAlK9p5ljZwwjMo8R5u+bx8zrP5ZsH82OzyGSWD
 uJ5/pyI78QBv/i7KUFpXqapOCr50s6Qz9BRAnedyCI9R8VVuLlrLtfOEn0bAFsj9UFPY
 SXXHrCUrEq7eBeJuirJB3eiWZYNpGlZDjxIfEW6BBwbVWzVFr28eZMmL1jzjqK9p1VCH
 L0nPoHJ7/A+BfZesbMpeIJKFBlfL1sn8UfG/NhoB7x8Cj2jChRSAmvXqB+i7GtVQdwhS
 Zz6A==
X-Gm-Message-State: AOAM531PQzlBiPtoceXJ6AGVpyZtAdBUXbMuh+ZanDoRN4IxjFPtiw6E
 lLr7vjem1Zcl/p/mo+oqRKNL9xTXLavgyvuAKgxWOw==
X-Google-Smtp-Source: ABdhPJzXSshJQKExSJsT5ioLk9EsBQSNfGxfM3kxQUxKh+G7AoddxywtMTAUCL44UVcbxALZuyaFQc/OpgMmBHp1mPc=
X-Received: by 2002:a05:6830:1bef:: with SMTP id
 k15mr8948otb.303.1610467065202; 
 Tue, 12 Jan 2021 07:57:45 -0800 (PST)
MIME-Version: 1.0
References: <20200916205434.GA10389@duo.ucw.cz>
 <87czyf5jjp.fsf@vps.thesusis.net>
 <CAHk-=wjsjC1h7fskwYaaRLykN1ms6ZtxGvucQgmL-zZTfxPdBA@mail.gmail.com>
In-Reply-To: <CAHk-=wjsjC1h7fskwYaaRLykN1ms6ZtxGvucQgmL-zZTfxPdBA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 12 Jan 2021 16:57:34 +0100
Message-ID: <CAKMK7uEGXOC_ci=Drm=Hz+xPGdcoxv8YZ-gcOckoPmu2XijiSA@mail.gmail.com>
Subject: Re: fbcon: remove soft scrollback code (missing Doc. patch)
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Phillip Susi <phill@thesusis.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 9, 2021 at 12:11 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Jan 8, 2021 at 11:13 AM Phillip Susi <phill@thesusis.net> wrote:
> >
> > > Could we pause this madness? Scrollback is still useful. I needed it
> > > today... it was too small, so command results I was looking for
> > > already scrolled away, but... life will be really painful with 0
> > > scrollback.
> >
> > > You'll need it, too... as soon as you get oops and will want to see
> > > errors just prior to that oops.
> >
> > > If it means I get to maintain it... I'm not happy about it but that's
> > > better than no scrollback.
> >
> > Amen!  What self respecting admin installs a gui on servers?  What do we
> > have to do to get this back in?  What was so buggy with this code that
> > it needed to be removed?  Why was it such a burden to just leave it be?
>
> It really was buggy, with security implications. And we have no maintainers.
>
> So the scroll-back code can't come back until we have a maintainer and
> a cleaner and simpler implementation.
>
> And no, maintaining it really doesn't mean "just get it back to the
> old broken state".
>
> So far I haven't actually seen any patches, which means that it's not
> coming back.
>
> The good news? If you have an actual text VGA console, that should
> still work just fine.

Also on anything that is remotely modern (i.e. runs a drm kernel
modesetting driver undearneath the fbdev/fbcon stack) there's a pile
more issues on top of just the scrollback/fbcon code being a mess.
Specifically the locking is somewhere between yolo and outright
deadlocks. This holds even more so if the use case here is "I want
scrollback for an oops". There's rough sketches for how it could be
solved, but it's all very tricky work.

Also, we need testcases for this, both in-kernel unit-test style stuff
and uapi testcases. Especially the full interaction on a modern stack
between /dev/fb/0, /dev/drm/card0, vt ioctls and the console is a pure
nightmare.

Altogether this is a few years of full time hacking to get this back
into shape, and until that's happening and clearly getting somewhere
the only reasonable thing to do is to delete features in response to
syzkaller crashes.

Also adding dri-devel since defacto that's the only place where
display people hang out nowadays.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
