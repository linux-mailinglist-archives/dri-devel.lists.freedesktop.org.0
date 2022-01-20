Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B4B494D0F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 12:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6835B10E637;
	Thu, 20 Jan 2022 11:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D050410E637
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 11:33:10 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 m8-20020a9d4c88000000b00592bae7944bso7191122otf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 03:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f+OEkxn4NakLGLT2aLZNbBo/yxXriEj8f/NZ6PMsXkA=;
 b=D/cV3Z013jsfQfCjTfYLYoU/Nfvo04vCLc5JfdNQAJ9VK2jat1BKsNrsHhDt1GUC1U
 M8OmYvquL8tqRHYrTsKBwZPZZy66HZsWfc7kejODp1QyjJOrZCgdUTB7rMvmYMwSoYs3
 4pWI/2QQczbTgPQAGCQUu/N6YZ4xrMord2kec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f+OEkxn4NakLGLT2aLZNbBo/yxXriEj8f/NZ6PMsXkA=;
 b=YH0ZjhSDM3lYUEKwSld9rA/Iz2sjao1MLBDeZGuZZwGyFug3ALiupFherCmC4DrE/8
 zrTA1bJCy3KNia+iLn6fiTGzX31vUuGx/OvmkqZfHO5wWsVqdJjMs6KFWxq9cmfIf2cJ
 wpU6ZRrPul8QcLhkOiJVScJsJTxkrQPiF9XhGXL67RC1Flg1xIgru82TB2DgIo8n/OWZ
 VW/CXd59lCX853doPpwNBZi7iiOPbZanr7Lkpq0HDRwHEWPXWvCmZm5eO1zzl6f1InbF
 wJRqsEpRIkQIhGYjJU5TeKNR+/ZQkaCdxyFZiE+C1ynU3AZWDp+uEogX7OhD4PtNyfwg
 BRjA==
X-Gm-Message-State: AOAM531KS/DX9ygVbgEX+M1As1T+XC1MSv9sj5QfrrG0zGMGRjRMRjro
 5ZD9A7FmQ9VnWapyWOV/3kB/4jJIX9Xhu/V6LW5wSQ==
X-Google-Smtp-Source: ABdhPJwpgfUsa4H2B5o2SXGcAXjYQNL5392vttSDan+DK2TkQUL9WGK7eutH4BDga0De/2cHyXd07fHl7K0b/Ox99rY=
X-Received: by 2002:a05:6830:2704:: with SMTP id
 j4mr15756956otu.323.1642678390125; 
 Thu, 20 Jan 2022 03:33:10 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <87bl0amc6s.fsf@x1.stackframe.org> <20220118103323.4bae3a7d@eldfell>
 <20220118095352.xsb6fqacw4p276c5@sirius.home.kraxel.org>
 <CAMuHMdWV+-+Jr7HggbfH_GEDcdep4pJLiMG+15jxBvQ91BCS0w@mail.gmail.com>
In-Reply-To: <CAMuHMdWV+-+Jr7HggbfH_GEDcdep4pJLiMG+15jxBvQ91BCS0w@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 20 Jan 2022 12:32:58 +0100
Message-ID: <CAKMK7uEOFg3z2btFERQ5XBQ7hqex6bXCb9X=SdwCjeLfX_SdFw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
 Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 10:06 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Gerd,
>
> On Thu, Jan 20, 2022 at 4:29 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > On Tue, Jan 18, 2022 at 10:33:23AM +0200, Pekka Paalanen wrote:
> > > On Mon, 17 Jan 2022 19:47:39 +0100
> > > Sven Schnelle <svens@stackframe.org> wrote:
> > >
> > > > I also tested the speed on my Thinkpad X1 with Intel graphics, and there
> > > > a dmesg with 919 lines one the text console took about 2s to display. In
> > > > x11, i measure 22ms. This might be unfair because encoding might be
> > > > different, but i cannot confirm the 'memcpy' is faster than hardware
> > > > blitting' point. I think if that would be the case, no-one would care
> > > > about 2D acceleration.
> > >
> > > I think that is an extremely unfair comparison, because a graphical
> > > terminal app is not going to render every line of text streamed to it.
> > > It probably renders only the final view alone if you simply run
> > > 'dmesg', skipping the first 800-900 lines completely.
> >
> > Probably more like "render on every vblank", but yes, unlike fbcon it
> > surely wouldn't render every single character sent to the terminal.
> >
> > Also acceleration on modern hardware is more like "compose window
> > content using the 3d engine" than "use 2d blitter to scroll the window".
> >
> > > Maybe fbcon should do the same when presented with a flood of text,
> > > but I don't know how or why it works like it works.
> >
> > fbcon could do the same, i.e. render to fbdev in a 60Hz timer instead of
> > doing it synchronously.
>
> Hopefully only the parts of the screen which need a redraw?
>
> Not all displays can be updated that fast. For a "modern" example, see
> https://patchwork.freedesktop.org/series/93070/.

drm does damage tracking throughout the stack, e.g.

https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#damage-tracking-properties

And unlike fbdev, it's explicit (so less overhead since userspace
generally knows what it's drawn) and doesn't rely on page fault
intercepting and fun stuff like that.

Like do people actually know what drm can and cannot do, or would that
take out all the fun?
-Daniel

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
