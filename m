Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 975F7291FD6
	for <lists+dri-devel@lfdr.de>; Sun, 18 Oct 2020 22:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85886E89F;
	Sun, 18 Oct 2020 20:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BD96E89F
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 20:33:22 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id s21so10181973oij.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 13:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2tjt8ngbdIU3h9PETCczfJ9vnTQ40FaapLpDo2xIhaE=;
 b=Sp9iIrfZIvjznRS75UO82B6KhHY8UwiZ3t5UFaGmGqwmbjlttQPIxbes+8+VYGfeUc
 vBjeQ28RaYl66uxePh4ZL0rA8ul4c6tJl5y34Ezn0mtkJ7fpCfvAm+1vc/JkXxoDiX+m
 XWZgtLUI+RJeQdB9hmX2gJ2FWQlkhnbRrBU7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2tjt8ngbdIU3h9PETCczfJ9vnTQ40FaapLpDo2xIhaE=;
 b=Nk2GDrJxQD96BwdahCazj5kPV315gsxHgROItSskfVZGgTVYlU/O9MEdnI8l9MrEZs
 iaSEqVwGP3HvZeNBgoBpBEyhglLYFtY6sv2eiaAtAVo2jZMShQGe7ZjOAPl2u2UCTxJD
 SvNJH23MIkKhxcpuIpq9toQ9Yt1mAVw/FzgGb1dR9IF/vNuK1Us2tDC74peM+0yM6neU
 tUQCCG4yd/T1ha33+yqJszd89d/JVibQ1DEHojb/R82GYDHsjq/wnoWzOG21t+tmrAsQ
 rgQZeB/c/mIIRGqc5lxjkbSrlSvlpfagFkeKJ1LUeTCNZ0yPAIiM81l9bhsEpwa8CQ7W
 cTAw==
X-Gm-Message-State: AOAM531FOdLqGr+uC0auYmhgP9jEhZremxS1+WJlQ9MuzrKGLjO/rg2b
 INGpZscU3/M1oClXww1RTYLWLxEN88qel31I76FYDQ==
X-Google-Smtp-Source: ABdhPJxGp/avmYnxlHs5bpREP0kcu2f1x3Av0xEFWBggKhyJihr+jjRB7wtkrc3DNtVCdX/JVjLJsFJDIiHvWMvOt4s=
X-Received: by 2002:aca:6083:: with SMTP id u125mr9349336oib.14.1603053202045; 
 Sun, 18 Oct 2020 13:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200820082137.5907-1-s.hauer@pengutronix.de>
 <926453876c92caac34cba8545716a491754d04d5.1603037079.git.yepeilin.cs@gmail.com>
 <CAKMK7uF9E24P=vzKt28=1_iaFTYD7obHs+tEPwwZPNMhh7DBrg@mail.gmail.com>
 <20201018201811.GA697615@PWN>
In-Reply-To: <20201018201811.GA697615@PWN>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 18 Oct 2020 22:33:11 +0200
Message-ID: <CAKMK7uFEmNnBdpoHYqvCUYS=nxh99gKs6P1-1pgp-ouvTSioGw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Fonts: Support FONT_EXTRA_WORDS macros for font_6x8
To: Peilin Ye <yepeilin.cs@gmail.com>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sven Schneider <s.schneider@arkona-technologies.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 18, 2020 at 10:18 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> On Sun, Oct 18, 2020 at 10:09:06PM +0200, Daniel Vetter wrote:
> > Adding dri-devel too, not sure anyone is still listening on linux-fbdev.
>
> I see, thanks!
>
> > On Sun, Oct 18, 2020 at 8:13 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > >
> > > Recently, in commit 6735b4632def ("Fonts: Support FONT_EXTRA_WORDS macros
> > > for built-in fonts"), we wrapped each of our built-in data buffers in a
> > > `font_data` structure, in order to use the following macros on them, see
> > > include/linux/font.h:
> > >
> > >         #define REFCOUNT(fd)    (((int *)(fd))[-1])
> > >         #define FNTSIZE(fd)     (((int *)(fd))[-2])
> > >         #define FNTCHARCNT(fd)  (((int *)(fd))[-3])
> > >         #define FNTSUM(fd)      (((int *)(fd))[-4])
> > >
> > >         #define FONT_EXTRA_WORDS 4
> > >
> > > Do the same thing to our new 6x8 font. For built-in fonts, currently we
> > > only use FNTSIZE(). Since this is only a temporary solution for an
> > > out-of-bounds issue in the framebuffer layer (see commit 5af08640795b
> > > ("fbcon: Fix global-out-of-bounds read in fbcon_get_font()")), all the
> > > three other fields are intentionally set to zero in order to discourage
> > > using these negative-indexing macros.
> > >
> > > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> >
> > Patch looks good to me, but it says 1/2 and I can't find 2/2 anywhere,
> > not even on lore. Did that get lost?
>
> 2/2 is just updating the fb documentation:
>
> [PATCH 2/2] docs: fb: Add font_6x8 to available built-in fonts
> https://lore.kernel.org/lkml/717bb41dda8e2ed615f3faadfbc3e215de726d38.1603037079.git.yepeilin.cs@gmail.com/
>
> I did `git format-patch -2 --thread=deep`, did I do something wrong when
> sending it?

No idea, it just didn't arrive anywhere I could find. And I did get
your previous patch series. Maybe just try again with dri-devel
included and hope it works then?
-Daniel

>


--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
