Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A30168E22
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 11:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976D96E5A9;
	Sat, 22 Feb 2020 10:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD04D6E5A9
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 10:07:41 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id d62so4239993oia.11
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 02:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gX5aU4Op+sd5cS8vefDKZ5kSmTYkiuc5xXZniwnPNs0=;
 b=bQ0sRxsm7X6ug8MSJOKsoV7Fc1pW8ONcueV7VfrXd2001Kfa24/zKCK8d3nGyQ/wue
 hpd27iHZlJOVltdAzLhp2lqZ1tAdQcDoWRxbtq3K1sf7ytqe/UpAgolj6Cn1jfv6xlXh
 IoZYqAsvROnYF1VKmFPo5qmZF+gEiSDyAYGTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gX5aU4Op+sd5cS8vefDKZ5kSmTYkiuc5xXZniwnPNs0=;
 b=Jw2RR087CYWgvkiVLAgIWV7gjeF8/x0eWpC8f6l9PqN7cnUUPQBDXlJB/BCGISYndt
 soeIOUlrpOyGkqJgMy3eVckPkCh7Or/8enDl5mF3QphW/e6RRJs2cOLu/OP/IOxdr+Jc
 cp4IsRtQkEptgtjLHT5wMWp9+toHa7YIwT9+m2qej08PRbf5Fpwm4djWu2XEz5NZ6ZKG
 KFM4L8FSx8GUFcMgfyz0eBtHfVJJ8XBfPZHVhG3rGXNOuAxV53SvglBuJlCPHsHykLx3
 t6IoJW20GIOKWtbLGPx7uxLDonyGstXUSwXpCFzBM3oI/hgmS8+Im4+h31jB/Voq45Y9
 UT/Q==
X-Gm-Message-State: APjAAAUHiM9y7r0nYW0B2OYnu1xVYbp3kCCiLSwkodCjMeqApm9CG7yP
 p8LJ06q7G9ZD3LMKTMhub5tXvnpo+sp14wrvrju/dQ==
X-Google-Smtp-Source: APXvYqyAx6WTnOQMihnDaBROATu4RCrU5QuuliGHSNfXRNCyRN+zLyUNuJ8eSQlvLO4saJffF6u+3nkKQNG4iZwQHMg=
X-Received: by 2002:a05:6808:319:: with SMTP id
 i25mr5708575oie.128.1582366060760; 
 Sat, 22 Feb 2020 02:07:40 -0800 (PST)
MIME-Version: 1.0
References: <20200222090321.swxvqnwjqynqeh46@smtp.gmail.com>
In-Reply-To: <20200222090321.swxvqnwjqynqeh46@smtp.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sat, 22 Feb 2020 11:07:29 +0100
Message-ID: <CAKMK7uHo3ec915Tt=0A84VGJ113FxOQi+aCc=9Vfxbu8ew=60A@mail.gmail.com>
Subject: Re: Looking for guidance to reproduce a bug in drm/vkms reported by
 syzkaller
To: Melissa Wen <melissa.srw@gmail.com>, 
 syzbot <syzbot+e7ad70d406e74d8fc9d0@syzkaller.appspotmail.com>
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 22, 2020 at 10:03 AM Melissa Wen <melissa.srw@gmail.com> wrote:
>
> Hi,
>
> I am trying to reproduce a syzkaller bug found in the vkms:
> - WARNING in vkms_gem_free_object
> - https://groups.google.com/forum/#!msg/syzkaller-bugs/_oARhriB1SA/PelnW1BqAwAJ
>
> However, I was not very successful in this task. As I don't know how to deal
> with syzkaller and I am not sure if I am following the right steps, it would be
> great if someone can give me some tips and guidance.
>
> First, looking at the bug history at:
> - https://syzkaller.appspot.com/bug?extid=e7ad70d406e74d8fc9d0,
> it seems like the bug still exists. Am I right?
>
> Second, here is a report of what I tried to do:
> Note: For testing, I use a VM (QEMU) with Debian 10 with a kernel compiled at
> - https://cgit.freedesktop.org/drm/drm-misc (branch drm-misc-next)
>
> 1 - Using the usual .config for my VM, I compiled and installed the kernel and,
> as root, ran the C program provided by syzkaller:
> - https://syzkaller.appspot.com/x/repro.c?x=15e27c53600000
> Nothing happened.
>
> 2 - Then, I checked the debug/panic/hacking/drm/i915 debugging/vkms settings on
> the .config reported by syzkaller:
> - https://syzkaller.appspot.com/x/.config?x=7cf4eed5fe42c31a
> and enabled the same things in my .config.
> I compiled and installed the kernel and ran the C program.
> Nothing happened.
>
> 3 - So, I reverted my current branch to the commit that generated the bug
> (as reported: 94e2ec3f7fef86506293a448273b2b4ee21e6195) and used the kernel on
> that state.
> Nothing happened.
>
> 4 - I decided to use the syzkaller .config without modifications and
> adaptations for my VM (although I didn't think it felt right). I compiled,
> installed... some boot problems happened, but the kernel worked. I ran the C
> program and nothing.
>
> So I gave up... for a while :)
>
> Does anyone have any advice for me?

Adding the syzbot people (you can just grab the mail address from the
report, should go to the right place), maybe they have some ideas what
would help in reproducing the bug. I never tried to repro a syzbot bug
before yet, so not really useful experience from my side :-/
-Daniel

> I have already searched for information on the Internet, but I am still stuck.
>
> The last thing that I noted is that syzkaller stopped providing a C program of
> this bug for crashes after the beginning of the year (I also don't know if it
> is something important).
>
> Thanks in advance,
>
> Melissa Wen



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
