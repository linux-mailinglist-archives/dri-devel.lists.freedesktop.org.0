Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6623C3812A8
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 23:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992B76E3F2;
	Fri, 14 May 2021 21:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC5B6E3F2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 21:11:03 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id o8so121085ljp.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 14:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qmD8bOtABF5XD+YzylZZ0F+UXv+l/cf1tAlHtz2MQKI=;
 b=E7NGDr8baMYrNmyWjoI5iqN4uwMNaqda9XZ6KgibagBhs7q01o3AiUnWU21oLy+K+p
 05yfVvaCeBxwJ+GRX7lNtGVBy1um0kIwp/pOYG3jAYfNG7rU+EMqRTrceEygaNGT81+E
 I6Kf4BqE1SyN58yvSQudkP2u9VbbGuJjaYF7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qmD8bOtABF5XD+YzylZZ0F+UXv+l/cf1tAlHtz2MQKI=;
 b=XucNVx7padp2OihCN7u7RrG+zZDC/exQb7xHoVYjwoVwwozQNi8kMtv50b1XZwHpIL
 MNO/fTDjgUULiJppyBEc6sc2hBgqQirOKX4ryGKz6q2TLQgsOX8WiXmL4XMUAFKtmWhT
 jg7l/O+v/8IuB1QAjcEE3RTWnAVFSRKgGBvUouBYffUV7acDaKjNvWWfsKND2xNK6t1M
 AvaoRzpKbUzjLZDbwok5ULmfQ2FCiouCZYuiRn0sQDgDHILU3gnGkq6cj9u6tKbitlna
 D28A7tQzdWOAPh2nEF/jL7Y4+E+diuGs/XmSaqHTE4r3G3C7ZCwqpdIHeZCgNIY+aO7I
 2A3w==
X-Gm-Message-State: AOAM5314Dc7oxRiHtgtAN0Lln1oepVV685wiothfm1UC/gq853U++bzC
 1vbb5VmZ58a9QhjbiofrA/djgsHxv1Zdtlhi8GM=
X-Google-Smtp-Source: ABdhPJyMMkbjBmmjHGdT8QxIuhKgrttUHIFpWAkZotTkKkfi6+w1oVrHNDwUJGnjwYrR5W2DoWEUgw==
X-Received: by 2002:a2e:8797:: with SMTP id n23mr19468219lji.248.1621026661692; 
 Fri, 14 May 2021 14:11:01 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175])
 by smtp.gmail.com with ESMTPSA id f10sm972951lfv.40.2021.05.14.14.11.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 14:11:01 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id w15so43504ljo.10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 14:11:00 -0700 (PDT)
X-Received: by 2002:a2e:22c4:: with SMTP id
 i187mr38530598lji.465.1621026660520; 
 Fri, 14 May 2021 14:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006bbd0c05c14f1b09@google.com>
 <6e21483c-06f6-404b-4018-e00ee85c456c@i-love.sakura.ne.jp>
 <87d928e4-b2b9-ad30-f3f0-1dfb8e4e03ed@i-love.sakura.ne.jp>
 <05acdda8-dc1c-5119-4326-96eed24bea0c@i-love.sakura.ne.jp>
 <CAHk-=wguwhFpjhyMtDaH2hhjoV62gDgByC=aPyTrW9CkM5hqvA@mail.gmail.com>
 <alpine.DEB.2.21.2105142150460.3032@angie.orcam.me.uk>
 <CAHk-=wioOHwKNj8AmvXWV-oL60ae0jKswAHy9e6wCYYeA5EQXg@mail.gmail.com>
In-Reply-To: <CAHk-=wioOHwKNj8AmvXWV-oL60ae0jKswAHy9e6wCYYeA5EQXg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 14 May 2021 14:10:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjkVAjfWrmmJnJe1_MriK9gezWCew_MU=MbQNzHbGopsQ@mail.gmail.com>
Message-ID: <CAHk-=wjkVAjfWrmmJnJe1_MriK9gezWCew_MU=MbQNzHbGopsQ@mail.gmail.com>
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

On Fri, May 14, 2021 at 1:32 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Another alternative would be to just delay the resize to when vcmode
> is put back to text mode again. That sounds somewhat reasonable to me,
> but it's a pretty big thing.

Actually thinking more about that option, it sounds horrible. It would
mean that we'd continue to use the old geometry for the actual VC
buffers for a random time, and then change it to the new geometry at
some arbitrary point.

So I think the only reasonable approach (apart from just my "don't do
that then") might be to just always call ->con_resize().

There are only actually three cases of "->con_resize()", so it might
not be too bad.

Looking at it, both sisusbcon_resize() and vgacon_resize() seem to be
trivially fine in KD_GRAPHICS mode.

vgacon already seems to have that "!vga_is_gfx" test, and does
vgacon_doresize() at vgacon_switch(). It might need to add a
vgacon_doresize() to the vgacon_blank() case 0 code so that it
actually does the right thing when going back to KD_TEXT mode.

And fbcon_resize() looks like it might be mostly ok with it too.
Again, there is a con_is_visible() test, and I suspect that might need
to be changed to

        if (con_is_visible(vc) && vc->vc_mode == KD_TEXT)

instead,  but it doesn't look _too_ bad.

So I think just removing the "vc->vc_mode != KD_GRAPHICS" test from
resize_screen() might be the way to go. That way, the low-level data
structures actually are in sync with the resize, and the "out of
bounds" bug should never happen.

Would you mind testing that?

               Linus
