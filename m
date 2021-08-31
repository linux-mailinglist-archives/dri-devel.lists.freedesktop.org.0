Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF6D3FCD27
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 21:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6146E051;
	Tue, 31 Aug 2021 19:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E716E051
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 19:05:01 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id 6so443719oiy.8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 12:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZvHe6WFLlEOY+cnNyJHf8IUGJZtLzfrewOzKEL/ktBI=;
 b=ACWt0ukBTDTGH9DZcqNb3LHML6ZIXTJi22x9F1+NGl+2yrk61J+GgzScyE3gFTlSlQ
 x226k4VgR+xl+Mxu1P2nWpexNXNlNb1LiuVItVK2b3hkNGxNhP3j+ea03k66KOk1vptW
 JM2F8HfiCiSzN9m0fQJeZ3AwirWfftjNbongs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZvHe6WFLlEOY+cnNyJHf8IUGJZtLzfrewOzKEL/ktBI=;
 b=Izzc9pyQSG0QBuTk6N0+f8YawRuyiLyB8J4zKEjtjUkB0wCP0T0T5A1vO2AS3m1TtI
 fPKnwzNaZxhOeU7GZlrr21IRTnNu5cNmRqX8RnA34oixpgp4MyaW6KbQoBHM92uTUDNS
 Btwc4EOXuazTvC+r0yoNjjjmDJc/SRXqLiU1JQdz2eiA9+ZBJe44Kiwt1KUUYDdbyh1S
 tC3P678oNqysFJm7UwdlgZbjmEfhFuqxy3cJ2x28N5Br2NTUfEr/RRuyyDbSt1YNl1YP
 mqf/dvlhW1RZB5XvCsa6ipp15J60wtoMsdm4qoMlbA3Ew2UmNmEhE1zPBhWkq469dGXp
 Tzaw==
X-Gm-Message-State: AOAM531TWYwPMx/XsWfjPBvMTiN+tSkzf8i6cGo2R8zGMuDcKOZj6/qP
 MF7NXLx3lFq6CgDi/z1n5CjRwTLcMoT97ra67Cr9Jw==
X-Google-Smtp-Source: ABdhPJzuNvtIttTsikeJhpfgPjZLhIkRqb9ifqIW1nYLm/S07/enaQExtksB0ZnMvf3m4HMYN91Gb9HNmjtQutiTXpc=
X-Received: by 2002:a05:6808:1449:: with SMTP id
 x9mr4264801oiv.14.1630436700262; 
 Tue, 31 Aug 2021 12:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000815b9605c70e74f8@google.com>
 <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
 <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
 <339bfb21-8e80-c7d9-46dd-c416f87c50c0@infradead.org>
 <535e404d-03bf-8e7a-b296-132a2a98c599@i-love.sakura.ne.jp>
 <CAMuHMdWX7s63X_zR9329canbQkPGBVxZNG4O+_=jUut60aGR9g@mail.gmail.com>
 <5c6d2b95-31d7-0d59-5e62-2593d9a0e1fe@i-love.sakura.ne.jp>
 <CAMuHMdWbSUGRGAVi-17C3hyDBZnGLAsmbAs+wXPHiCNWWLbMpA@mail.gmail.com>
 <CAKMK7uF1cnen2UVWeOL164z1CCqOuRMC5SmM+5GvRvi7C-UOTw@mail.gmail.com>
 <CAMuHMdWNYaZxZB0Td4PFb76rrtQMumKu6cJgLi2aNnW-9NmG8A@mail.gmail.com>
In-Reply-To: <CAMuHMdWNYaZxZB0Td4PFb76rrtQMumKu6cJgLi2aNnW-9NmG8A@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 31 Aug 2021 21:04:48 +0200
Message-ID: <CAKMK7uHuOQWUnsiH00QFbHKgTdjjryK0ra9We2stojXMiAVgJA@mail.gmail.com>
Subject: Re: [PATCH] fbmem: don't allow too huge resolutions
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
 syzbot <syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Colin King <colin.king@canonical.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Randy Dunlap <rdunlap@infradead.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 31, 2021 at 8:56 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Daniel,
>
> On Tue, Aug 31, 2021 at 8:53 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > On Tue, Aug 31, 2021 at 7:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Aug 31, 2021 at 5:24 PM Tetsuo Handa
> > > <penguin-kernel@i-love.sakura.ne.jp> wrote:
> > > > On 2021/08/31 15:48, Geert Uytterhoeven wrote:
> > > > > Furthermore, this restricts the virtual frame buffer size on 64-bit,
> > > > > too, while graphics cards can have much more than 4 GiB of RAM.
> > > >
> > > > Excuse me, but do you mean that some hardware allows allocating more than
> > > > UINT_MAX bytes of memory for kernel frame buffer drivers?
> > >
> > > While smem_len is u32 (there have been complaints about such
> > > limitations on 64-bit platforms as far as 10 years ago), I see no
> > > reason why a graphics card with more than 4 GiB of RAM would not be
> > > able to provide a very large virtual screen.
> > >
> > > Of course e.g. vga16fb cannot, as it is limited to 64 KiB.
> >
> > The first gpus with 4GB or more memory started shipping in 2012. We're
> > not going to have fbdev drivers for these, so let's not invent code
> > for use-cases that aren't please.
>
> This code path is used with fbdev emulation for drm drivers, too,
> right?

Yeah, you get one buffer, with overallocating 2. That's all, you don't
get the entire vram because we can't revoke that for fbdev users. We'd
have fixed this long ago if it's a real limitations.

8k at 64bpp is still less than 256MB. Also due to pci bar limitations
(which finally get lifted now because windows fixed their pci code,
which motivates motherboard manufactures for desktop space to also fix
theirs) we're limited to 256MB actually cpu visible anyway.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
