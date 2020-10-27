Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C238129C752
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 19:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E088D6E0DE;
	Tue, 27 Oct 2020 18:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358DC6E0DE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 18:37:07 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id u127so2313822oib.6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 11:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IgE8yf8VvPCLXY3kXPndgQiUgJhhV1XD/7Oo36pvGbU=;
 b=MygqLEYK5L/J+eMI396OafToclJIM8p9jDuPmPtJd7fAX+/4M5rpvwarc0itBKpmzs
 /bw5UPnSDfKCpmC9FP4VwDlk8Udr76hnDLOjvfhGFsddQfip47U2C4Ynt/vbfjdGuZjm
 GjYxNRv+DOxPE603nQ/5mwrW8dV+DBlUfcTRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IgE8yf8VvPCLXY3kXPndgQiUgJhhV1XD/7Oo36pvGbU=;
 b=r/AySbPeplOHHR8j1i0BRDo4A4ihXO7FB9OXT38C3Wmm79ztf/7M5QeBwHNRU4ZFpp
 LP90E9imxGeLJC2yjLgP/1/4rod44l9S4wD5+wHrbZJ/nN0HqwYgy8GKUvXd512rySd9
 2TGqcgHYo7OnuutG94+OzxtXvsD3Bzm5Ym8thFLvWZIR+xgRR8xtLfrHIO4C5WAz/wk/
 nluhIaF5O0XVSfKehmCdFsVaCTsnbwylmfEhA4f7HZuTyupzcnve6Ia7rCkzW6nFrYj6
 17ep6QUK3ti3332lWa+4MzOMlLxMvChWe/9rgfFUPfqU6S+z/eisA+IFo63O/Oe4W8vb
 FpQg==
X-Gm-Message-State: AOAM530JXFzbB1Nz1dpPl49un7jKoh59ZU5xCjS3sKWHHhEKDzsstJgR
 Egt9j3M6Dm+OaxS44b/kql67dWIuQeG8EDq1Ihb5dg==
X-Google-Smtp-Source: ABdhPJyicyC6gqjrwubRETzltc2wCSn7+EzSAF6sd19doLxVKlafgjjX+Xfkx+kdBYozc4TF6IgWRQLAD81gssswQiA=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr2475031oig.128.1603823826322; 
 Tue, 27 Oct 2020 11:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <20201027165021.GA1178130@PWN>
In-Reply-To: <20201027165021.GA1178130@PWN>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 27 Oct 2020 19:36:54 +0100
Message-ID: <CAKMK7uH9L9WHBndEnUhAMMh0KsKUcz2zfKdi250gVqJGEG6usQ@mail.gmail.com>
Subject: Re: Following up
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 5:50 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> Hi Daniel,
>
> More about the 3 things we've discussed before:
>
>   1. Cleaning up con_font_op():
>
> (drivers/tty/vt/vt.c)
> int con_font_op(struct vc_data *vc, struct console_font_op *op)
> {
>         switch (op->op) {
>         case KD_FONT_OP_SET:
>                 return con_font_set(vc, op);
>         case KD_FONT_OP_GET:
>                 return con_font_get(vc, op);
>         case KD_FONT_OP_SET_DEFAULT:
>                 return con_font_default(vc, op);
>         case KD_FONT_OP_COPY:
>                 return con_font_copy(vc, op);
>         }
>         return -ENOSYS;
> }
>
> On Tue, Sep 29, 2020 at 04:38:49PM +0200, Daniel Vetter wrote:
> > I think if we change the conf_font_get/set/default/copy functions to not
> > take the *op struct (which is take pretty arbitrarily from one of the
> > ioctl), but the parameters each needs directly, that would clean up the
> > code a _lot_.
>
>     This is on my TODO list! One day I came up with some idea about
>     fbcon.c, so I postponed this a bit...
>
>   2. Removing dummy functions, like sisusbdummycon_font_set():
>
>     Turns out, before c396a5bf457f ("console: Expand dummy functions for
>     CFI"), they were just some macros:
>
> -#define SISUSBCONDUMMY (void *)sisusbdummycon_dummy
> +static int sisusbdummycon_font_set(struct vc_data *vc,
> +                                  struct console_font *font,
> +                                  unsigned int flags)
> +{
> +       return 0;
> +}
>
>     ...and they had been there for a very long (10+ years) time. Removing
>     code like this makes me a bit nervous, and...
>
> On Tue, Sep 29, 2020 at 04:38:49PM +0200, Daniel Vetter wrote:
> > This actually does something. tbh I would not be surprises if the
> > fb_set utility is the only thing that uses this - with a bit of code
> > search we could perhaps confirm this, and delete all the other
> > implementations.
>
>     ...you mentioned code search, where & what should we look at, in order
>     to confirm it's safe to remove them?

Way back there was google's code search, which was awesome. Now I just
put the structure name/ioctl #define/number into
google/bing/duckduckgo and see if anything turns up. Plus check how
it's used in fb tools (although I just recently learned that fb-test
pretty much disappeared from the internet, very hard to find the
original).

If you're unsure, we can merge a patch, then wait about 1 year for any
users to show up with problems. If that's not the case, assume they're
all gone, or it was never used and just implemented because it was
copied from somewhere else, or "just in case". There's lots of dead
uapi around.

>   3. Using `font_desc` in `vc_data`:
>
>     Our plan for the gradual conversion was to use a helper function to
>     set font for a vc, but after reviewing the 300-ish occurrence of
>     `vc_font`, it seems like code doesn't usually set it as a whole:
>
> (drivers/usb/misc/sisusbvga/sisusb_con.c)
>         [...]
>         c->vc_font.height = sisusb->current_font_height;
>         [...]
>
>     ...that's it! It only cares about the height. There are only 4 or 5
>     places in fbcon.c that actually set all fields of `vc_font`, like:
>
>                 vc->vc_font.width = font->width;
>                 vc->vc_font.height = font->height;
>                 vc->vc_font.data = (void *)(p->fontdata = font->data);
>                 vc->vc_font.charcount = 256; /* FIXME  Need to support more fonts */
>
>     To make it even more complicated, `p` is a `struct fbcon_display *`,
>     containing yet another font data pointer (`fontdata`) that I think
>     should be replaced by a `font_desc *`...
>
>     In conclusion, I think it's all about a few hard problems in fbcon.c.
>     I'll keep trying and see how it goes.

Yeah fbcon.c is pretty good horrors unfortunately :-/
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
