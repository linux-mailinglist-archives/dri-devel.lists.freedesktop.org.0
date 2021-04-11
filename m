Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA0635B729
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 00:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1B889FD1;
	Sun, 11 Apr 2021 22:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249B189FD1
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Apr 2021 22:15:55 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b14so18256401lfv.8
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Apr 2021 15:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=we0IPy7GkHXIWTEepGW7TLgrKnT+n2hTi8pOuKv6Tfg=;
 b=bMBOsx+IjgATxfVRDghj2rM1/YzPonOm1tzZeLG+5a54MJfIfaO/nZWtWht/TTfoyT
 CvjwlGxrg9yUQQv/VPXJ+Rq9opfuEJ0tz3NPnswOkwDjFd4CaeAQXYAhtf428HEx9T0/
 3wq3L5dGSr12c9RX5GXiaysDYCFWmelpOE5R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=we0IPy7GkHXIWTEepGW7TLgrKnT+n2hTi8pOuKv6Tfg=;
 b=IctYHqakYLRqKQXA13nypbwqpE9kKDD7Q4buAvLihd8FX7iYLvSsjQ3hKn0X2Feivo
 vSCsoI07riRIJQAA2HejjwqsjMBffImHvgJ9R9Ir1NSzcMrrTbc9IGjiEfICSGlxWqNi
 IXWrSRgIIG/kUM/RVdEhWEy1/B7GuwS4NqqlvNqCZ6Rib4sSWsGtH49SHvT39WCryCxz
 RsHzAonu347lt+sggcyOn2qtAqcyuxp9J4R8Vil392V4gbIA0n3Fdpogx/JVDVY0EIrM
 KnW22Q0OLSZDFgrOc+YYGNBpBRRljVWjPGEGv6/YV8z0eiwvjxpxCV8KGtHlt62EYjmQ
 tXeg==
X-Gm-Message-State: AOAM530qZ72YmzJ8Al8lLdbzdbWNjki29jlWSPg+V1M6VseIudKs3fLl
 P7L21gcHlwCNY79yfisQnEZbqgVQJJ2F8g==
X-Google-Smtp-Source: ABdhPJzU6HO7woLXNMWKqtr/7Sp9flwp5FZG4hvZPHrcU2IZfkBSTwW/isv4wsmnt7c5n5isfsWoTA==
X-Received: by 2002:a05:6512:695:: with SMTP id
 t21mr17042515lfe.60.1618179352957; 
 Sun, 11 Apr 2021 15:15:52 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id s35sm1654149lje.87.2021.04.11.15.15.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Apr 2021 15:15:51 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id r8so18172386lfp.10
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Apr 2021 15:15:51 -0700 (PDT)
X-Received: by 2002:ac2:4947:: with SMTP id o7mr12254385lfi.253.1618179351232; 
 Sun, 11 Apr 2021 15:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000226d3f05b02dd607@google.com>
 <bbcef674-4ac6-c933-b55d-8961ada97f4c@i-love.sakura.ne.jp>
 <47907f77-b14b-b433-45c6-a315193f0c1a@i-love.sakura.ne.jp>
 <494395bc-a7dd-fdb1-8196-a236a266ef54@i-love.sakura.ne.jp>
 <20200927092701.GA1037755@PWN>
 <4933b81b-9b1a-355b-df0e-9b31e8280ab9@i-love.sakura.ne.jp>
 <20200928175956.GF24673@neutronstar.dyndns.org>
 <100dfd3f-3415-80ae-a6cf-30d15f7ca49f@i-love.sakura.ne.jp>
 <20200929105203.GG24673@neutronstar.dyndns.org>
 <20200929165657.GS438822@phenom.ffwll.local>
 <20200929171040.GB1351851@kroah.com>
 <alpine.DEB.2.21.2104112250310.65251@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2104112250310.65251@angie.orcam.me.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 11 Apr 2021 15:15:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgF8e5i+9eeGu=CgWAagTPv-9UbkG7B6bR5jDe6kkkFZQ@mail.gmail.com>
Message-ID: <CAHk-=wgF8e5i+9eeGu=CgWAagTPv-9UbkG7B6bR5jDe6kkkFZQ@mail.gmail.com>
Subject: Re: [PATCH] vt_ioctl: make VT_RESIZEX behave like VT_RESIZE
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
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
Cc: syzbot <syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg KH <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Martin Hostettler <textshell@uchuujin.de>,
 George Kennedy <george.kennedy@oracle.com>, Jiri Slaby <jirislaby@kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 11, 2021 at 2:43 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
>  So it does trigger with vgacon and my old server, which I have started
> experimenting with and for a start I have switched to a new kernel for an
> unrelated purpose (now that I have relieved it from all its usual tasks
> except for the last remaining one for which I haven't got the required
> user software ported to the new system yet):
>
> "struct vt_consize"->v_vlin is ignored. Please report if you need this.
> "struct vt_consize"->v_clin is ignored. Please report if you need this.

Note that it's entirely possible that things continue to work well
despite this warning. It's unclear to me from your email if you
actually see any difference (and apparently you're not able to see it
right now due to not being close to the machine).

The fact that v_vlin/v_clin are ignored doesn't necessarily mean that
they are different from what they were before, so the warning may be a
non-issue.

> It continues using svgatextmode with its glass (CRT) VT to set my usual
> 80x37 text mode (720x576 pixel resolution) by manipulating the VGA clock
> chip and the CRT controller appropriately for a nice refresh rate of 85Hz:
>
> Chipset = `TVGA8900', Textmode clock = 44.90 MHz, 80x37 chars, CharCell = 9x16. Refresh = 52.51kHz/84.7Hz.

That doesn't seem necessarily wrong to me.

>  So what's the supposed impact of this change that prompted the inclusion
> of the messages?

There _may_ be no impact at all apart from the messages.

The code _used_ to set the scan lines (v_vlin) and font height
(v_clin) from those numbers if they were non-zero, and now it just
ignores them and warns instead.

The code now just sets the font height from the actual font size when
the font is set. Which is honestly the only thing that ever made
sense. Trying to set it with v_clin is ignored, but it's entirely
possible - maybe even likely - that your user of VT_RESIZEX sets it to
the same values it already has.

Exactly because setting a font line number to anything else than the
font size isn't exactly sensible.

But if your screen looks different than it used to, that is obviously
interesting and says something actually changed (outside of the
message itself).

           Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
