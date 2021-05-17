Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2FA382D0A
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 15:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5554489E59;
	Mon, 17 May 2021 13:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E14E89D58
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:13:17 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so5461753oth.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 06:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1niWPbp6OXctfAAznJewfN6Eqjsqw0nM8ckzYrVktvk=;
 b=d7CG4UV4uV/QvT/PB3LlqCepedtDGPXwmcB5sYhOAr5UFDYI6t2UWqoAu6SQ50Dl+1
 ybQlPRgq6zOcYfRTI8AcmZaVF9UmkTtuSsOILLQKg3mDgdY/GtdJWOLYJba019tbu+U3
 5bHr8t+Jhpl7HsLNJUbqd4PynYK9iGwTXGaoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1niWPbp6OXctfAAznJewfN6Eqjsqw0nM8ckzYrVktvk=;
 b=FSr22mbOKbky1H3XyGxtPgk89K/upublkTdHDFsV3cOogkTONsb9/ye+WPzXIJrVyy
 19JgPlPyqZb/yokHOTjX3KdNC2T2ceHZ49p0HOHchfZ63w4T3QX/eoaLwuj0frNzyZ03
 YzCDDqveYdFX+XTWxgsMlwEyUN+9kguoA04tp2KAJtC/SM6wMQuwzQn2eVdYLqJ3vmzs
 tHiJLP7XPqaYrxcY0qXkRgaF+7deZoJ9bxLXHtUfnlMWewbQAhlarP37ksIG20iwxVW5
 F/sj/2fWRAHMCv98u5MJuc8M1dvRzyYmTzfYz7F/hwk4+zT8LIEJXFOWd4r8PWzQfOSj
 lWmA==
X-Gm-Message-State: AOAM532DebsvKVL6jjtpiVnhpm1HYKaF2hU0MlrfDZCB8j4HYwD4nsIu
 Ggl7l1AUziU89D6j8ZpA7ji8AeY8bHAoWrKpIpP9zg==
X-Google-Smtp-Source: ABdhPJyDuQIvXw+luxml8GEexK3jECtW+UAWqe0kXDIKCICTTAfz7N7CV/zjN9R469BgZWNcW6e4zYMo96HA10ZPQKg=
X-Received: by 2002:a05:6830:1155:: with SMTP id
 x21mr31941099otq.303.1621257196488; 
 Mon, 17 May 2021 06:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006bbd0c05c14f1b09@google.com>
 <6e21483c-06f6-404b-4018-e00ee85c456c@i-love.sakura.ne.jp>
 <87d928e4-b2b9-ad30-f3f0-1dfb8e4e03ed@i-love.sakura.ne.jp>
 <05acdda8-dc1c-5119-4326-96eed24bea0c@i-love.sakura.ne.jp>
 <CAHk-=wguwhFpjhyMtDaH2hhjoV62gDgByC=aPyTrW9CkM5hqvA@mail.gmail.com>
 <alpine.DEB.2.21.2105142150460.3032@angie.orcam.me.uk>
 <CAHk-=wioOHwKNj8AmvXWV-oL60ae0jKswAHy9e6wCYYeA5EQXg@mail.gmail.com>
 <CAHk-=wjkVAjfWrmmJnJe1_MriK9gezWCew_MU=MbQNzHbGopsQ@mail.gmail.com>
 <97f1d292-c3a8-f4d6-0651-b4f5571ecb72@i-love.sakura.ne.jp>
 <alpine.DEB.2.21.2105151815040.3032@angie.orcam.me.uk>
 <alpine.DEB.2.21.2105151828380.3032@angie.orcam.me.uk>
 <CAHk-=wgz-iC97f0cnawKZc_S4-0ZEOdOx43J7pVX6b=AqYUhfg@mail.gmail.com>
In-Reply-To: <CAHk-=wgz-iC97f0cnawKZc_S4-0ZEOdOx43J7pVX6b=AqYUhfg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 May 2021 15:13:05 +0200
Message-ID: <CAKMK7uGO3_EtQem=zuTa2w8jO4zwwT27Ly6uJEYF4wVLYXGZ_Q@mail.gmail.com>
Subject: Re: [PATCH v2] tty: vt: always invoke vc->vc_sw->con_resize callback
To: Linus Torvalds <torvalds@linux-foundation.org>
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
 syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 15, 2021 at 6:42 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, May 15, 2021 at 9:33 AM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> >
> >  NB I suggest that you request your change to be backported, i.e. post v3
> > with:
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Cc: stable@vger.kernel.org # v2.6.12+
>
> I've applied it to my tree, but let's wait to see that it doesn't
> cause any issues before notifying the stable people.

Ah I missed all the fun with the long w/e. fwiw I think this looks
very reasonable, see my other reply why I think this shouldn't cause
issues. Especially when fbcon_resize only touches hw when in KD_TEXT
mode.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
