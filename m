Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F78A14D7A5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 09:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D256F8F8;
	Thu, 30 Jan 2020 08:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75856E39B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 15:06:57 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id m5so5012089qvv.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 07:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=InuKBX2au5PgZW6T2UC0fko2cqbcK+Z9FZ9mVarwTPc=;
 b=UHycOpckqcmEHlujxurhr+2yzJXIdF3P7M/bxMu5HRHXUFMy8t5uMpeIIvIg1zAf5a
 9O/hNk7D/5yWbFCcGAmsKMfAfuBtI7SpykFLDbojMWNcU+0Bltcr98zTC2AnVpvojl1U
 1BVzpyYAs5zc7l1o40O6rgqjAzUvfLnkNpaYhIGOZlu6GfF+RSyCvS+ah7wl66zbboVN
 GG5mZR2jJavEE60EAldt5qavIpwXX56JK5PB7+AHnQD9PbOXfurtN4qmGbPRvvNYdW7H
 I/9oH45TGNXxln3ZF2BpyQ5Vu19jrkPl4KQ6KGwstRBIOiE0PfrRsDtOzoPS0dEOMS+j
 pe9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=InuKBX2au5PgZW6T2UC0fko2cqbcK+Z9FZ9mVarwTPc=;
 b=fdE+JfmyEez9Bbi78B7gRIfwuaCzsXw3uqEXUMEGoFQGeUSmAp88yFtlLKcaE3bCUJ
 f8yi8ZRzzNrdaEw1xClQ6baczASIiBbz7QPzNtaqvDIGUcVFJIm8pqcsxpj3zxdBK+Na
 iZJN6OUzu+5DdWGDapXSCk3h11nH5S5g9fLI/hgi+Roq0h3sQ9V5ITprkXV0R6W1SOmD
 pw7HPSM1MXz2iXyoemUHsUwvZav4sURCZOiXAW/GAkHGSNUV8WUXK16R3LJkATFk6kg/
 vG2yc2zY6xm8msHLsf0nbRea5D457splLHL4ri3P+LrnR5eQqbZGqbzZMvsa6xJqKUcp
 8zIw==
X-Gm-Message-State: APjAAAVNRMavL1v+LgIwFVqponUqqq7ekRvAPivakCQSMjjDDtJ8ck1k
 aR4Z1plq/qldBn3NjM0n529+K+tkwX18Pz0GNvj23Q==
X-Google-Smtp-Source: APXvYqxGXya7Ub3SmIcL1siAW7Ztqg0GnN7Sc8WRiWlrbmRJSMj/AvnQ1pJy7D+Vx9YUjv/TNuT7lT3ae0M7TlCuxdc=
X-Received: by 2002:a05:6214:1874:: with SMTP id
 eh20mr28761173qvb.122.1580310416499; 
 Wed, 29 Jan 2020 07:06:56 -0800 (PST)
MIME-Version: 1.0
References: <CAA=061EoW8AmjUrBLsJy5nTDz-1jeArLeB+z6HJuyZud0zZXug@mail.gmail.com>
 <CGME20200128124918eucas1p1f0ce2b2b7b33a5d63d33f876ef30f454@eucas1p1.samsung.com>
 <20200128124912.chttagasucdpydhk@pathway.suse.cz>
 <4ab69855-6112-52f4-bee2-3358664d0c20@samsung.com>
 <20200129141517.GA13721@jagdpanzerIV.localdomain>
 <20200129141759.GB13721@jagdpanzerIV.localdomain>
 <20200129143754.GA15445@jagdpanzerIV.localdomain>
 <CACT4Y+bavHG8esK3jsv0V40+9+mUOFaSdOD1+prpw6L4Wv816g@mail.gmail.com>
In-Reply-To: <CACT4Y+bavHG8esK3jsv0V40+9+mUOFaSdOD1+prpw6L4Wv816g@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 29 Jan 2020 16:06:45 +0100
Message-ID: <CACT4Y+arS5GsyUa0A0s51OAWj7eJohZsCoY-7cuoU0HVsyeZ6Q@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Write in vgacon_scroll
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Mailman-Approved-At: Thu, 30 Jan 2020 08:32:45 +0000
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
Cc: Petr Mladek <pmladek@suse.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 LKML <linux-kernel@vger.kernel.org>, anon anon <742991625abc@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 29, 2020 at 3:59 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Wed, Jan 29, 2020 at 3:40 PM Sergey Senozhatsky
> <sergey.senozhatsky@gmail.com> wrote:
> >
> > Cc-ing Dmitry and Tetsuo
> >
> > Original Message-id: CAA=061EoW8AmjUrBLsJy5nTDz-1jeArLeB+z6HJuyZud0zZXug@mail.gmail.com
> >
> > On (20/01/29 23:17), Sergey Senozhatsky wrote:
> > > > Hmm. There is something strange about it. I use vga console quite
> > > > often, and scrolling happens all the time, yet I can't get the same
> > > > out-of-bounds report (nor have I ever seen it in the past), even with
> > > > the reproducer. Is it supposed to be executed as it is, or are there
> > > > any preconditions? Any chance that something that runs prior to that
> > > > reproducer somehow impacts the system? Just asking.
> > >
> > > These questions were addressed to anon anon (742991625abc@gmail.com),
> > > not to Bartlomiej.
> >
> > Could this be GCC_PLUGIN related?
>
> syzkaller repros are meant to be self-contained, but they don't
> capture the image and VM setup (or actual hardware). I suspect it may
> have something to do with these bugs.
> syzbot has reported a bunch of similar bugs in one of our internal kernels:
>
> KASAN: slab-out-of-bounds Read in vgacon_scroll
> KASAN: slab-out-of-bounds Read in vgacon_invert_region
> KASAN: use-after-free Write in vgacon_scroll
> KASAN: use-after-free Read in vgacon_scroll
> KASAN: use-after-free Read in vgacon_invert_region
> BUG: unable to handle kernel paging request in vgacon_scroll
>
> But none on upstream kernels. That may be some difference in config?
> I actually don't know what affects these things. When I tried to get
> at least some coverage of that code in syzkaller I just understood
> that relations between all these
> tty/pty/ptmx/vt/pt/ldisc/vcs/vcsu/fb/con/dri/drm/etc are complex to
> say the least...


It would also be good to figure out how we can cover this on syzbot/upstream.

Our upstream config is:

$ grep VGA upstream-kasan.config
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_VGA_SWITCHEROO is not set
CONFIG_FB_VGA16=y
CONFIG_VGASTATE=y
CONFIG_VGA_CONSOLE=y
CONFIG_VGACON_SOFT_SCROLLBACK=y
CONFIG_VGACON_SOFT_SCROLLBACK_SIZE=64
# CONFIG_VGACON_SOFT_SCROLLBACK_PERSISTENT_ENABLE_BY_DEFAULT is not set
CONFIG_LOGO_LINUX_VGA16=y
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_VFIO_PCI_VGA is not set

where anon's is:
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_VGA_SWITCHEROO is not set
# CONFIG_FB_VGA16 is not set
CONFIG_VGA_CONSOLE=y
CONFIG_VGACON_SOFT_SCROLLBACK=y
CONFIG_VGACON_SOFT_SCROLLBACK_SIZE=64
# CONFIG_VGACON_SOFT_SCROLLBACK_PERSISTENT_ENABLE_BY_DEFAULT is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
# CONFIG_USB_SISUSBVGA is not set

And the one on which are catching the bugs in vgacon on internal kernel is:
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_VGA_SWITCHEROO is not set
# CONFIG_VGASTATE is not set
CONFIG_VGA_CONSOLE=y
# CONFIG_VGACON_SOFT_SCROLLBACK is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_VFIO_PCI_VGA is not set


May it be related to CONFIG_VGASTATE?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
