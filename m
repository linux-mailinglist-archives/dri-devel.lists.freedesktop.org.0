Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D2F3811DA
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 22:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05916E24D;
	Fri, 14 May 2021 20:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7506E24D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 20:33:01 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id a2so132345lfc.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 13:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z9fFCzzakKEZE6yIPzCdXzgESj8HznLN13JEu2IrUhs=;
 b=AZD5F3fmpvTeEhIt43za7+8EIrk2t9t9HMEYztpTlYaJJuCP+wvA3afhdJCb5YQVUE
 gku0fZAVygSRcHZvtbgGNSvieB4UtA0Btv4ADLqSbXfXPrX0uVMGUN+SV7Sw6GZaO0Cl
 LSH64wCZBlZv1NlK5Pmcnn3tyCs7yG5F18jNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z9fFCzzakKEZE6yIPzCdXzgESj8HznLN13JEu2IrUhs=;
 b=KO94y85OZjVetcnbdhMy8xO0+QqWi4KJdpFk7QZVcvyI/17SbzGwNyNtMlJQXS21L2
 kwNeulNRKZkZiBE3n5kxCWCWpA4ZeICv9XGRLWsuNiZV+/HuG9eqnaQysD3M+54KAVzR
 R5lJRvoIyUxjFzacxTDhyGg0/UtBFZIqiK4D2EDlP/e2p45W2gRZR9CD7r/VnP1m8gB8
 vx/+PvNwh4FdFi+rBE0Vp9zJvVTjFlP8XsX5qkKZbevuz7NCGkCxMro0XQXL48DSQrzK
 Oo0epLT6vLGRTbxktVCA6pwN8JzE3cZq3ZbsQnYV3RwIGo89b2myEmE5xIPIIv8YpSXv
 02yQ==
X-Gm-Message-State: AOAM531n3hGTRRdJ7lUaBcic79vTboXzobRZgHgaOKGvkrKOnEdpcHn3
 4b8tIzQhET3xzAVY7mABVBPA84x+AsW3BelchgE=
X-Google-Smtp-Source: ABdhPJwkOF2gcy089POw6f7iyLvWxHZ4uWgayrOiI8ar19+K99xdd2G3pUbGOxPxCJNrQCpbeHaTQg==
X-Received: by 2002:a05:6512:2304:: with SMTP id
 o4mr33018633lfu.135.1621024379795; 
 Fri, 14 May 2021 13:32:59 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id w5sm939630lfk.2.2021.05.14.13.32.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 13:32:59 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id x19so178528lfa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 13:32:58 -0700 (PDT)
X-Received: by 2002:a05:6512:36c5:: with SMTP id
 e5mr655215lfs.41.1621024378774; 
 Fri, 14 May 2021 13:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006bbd0c05c14f1b09@google.com>
 <6e21483c-06f6-404b-4018-e00ee85c456c@i-love.sakura.ne.jp>
 <87d928e4-b2b9-ad30-f3f0-1dfb8e4e03ed@i-love.sakura.ne.jp>
 <05acdda8-dc1c-5119-4326-96eed24bea0c@i-love.sakura.ne.jp>
 <CAHk-=wguwhFpjhyMtDaH2hhjoV62gDgByC=aPyTrW9CkM5hqvA@mail.gmail.com>
 <alpine.DEB.2.21.2105142150460.3032@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2105142150460.3032@angie.orcam.me.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 14 May 2021 13:32:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wioOHwKNj8AmvXWV-oL60ae0jKswAHy9e6wCYYeA5EQXg@mail.gmail.com>
Message-ID: <CAHk-=wioOHwKNj8AmvXWV-oL60ae0jKswAHy9e6wCYYeA5EQXg@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: vga16fb: fix OOB write in
 vga16fb_imageblit()
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@intel.com>, Colin King <colin.king@canonical.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 14, 2021 at 1:25 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
>  Overall I think it does make sense to resize the text console at any
> time, even if the visible console (VT) chosen is in the graphics mode,

It might make sense, but only if we call the function to update the
low-level data.

Not calling it, and then starting to randomly use the (wrong)
geometry, and just limiting it so that it's all within the buffer -
THAT does not make sense.

So I think your patch is fundamentally wrong. It basically says "let's
use random stale incorrect data, but just make sure that the end
result is still within the allocated buffer".

My patch is at least conceptually sane.

An alternative would be to just remove the "vcmode != KD_GRAPHICS"
check entirely, and always call con_resize() to update the low-level
data, but honestly, that seems very likelty to break something very
fundamentally, since it's not how any of fbcon has ever been tested,

Another alternative would be to just delay the resize to when vcmode
is put back to text mode again. That sounds somewhat reasonable to me,
but it's a pretty big thing.

But no, your patch to just "knowingly use entirely wrong values, then
add a limit check because we know the values are possibly garbage and
not consistent with reality" is simply not acceptable.

              Linus
