Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C763DE707
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 09:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71F16E420;
	Tue,  3 Aug 2021 07:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02156E159
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 06:54:30 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 s21-20020a4ae5550000b02902667598672bso4977229oot.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 23:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4oJ/jweDfhBNzYtl7cCA85MSZCoSaUkH+H3AHvOTrdo=;
 b=Q7T8lrKRMiZFhbrH9Kuj8YjWlp/32J2eatqWjLvhxKq44gIXSIzEQvxjiIZjc3yow+
 zEYXSXoLaPPcRGipX/YZKT0Zxh7KLEhgBgFIG1jQCxNqrLPpzdPHEo47vsOHoj5xzz8W
 dpHISSOI6dWGOyKASL3fgvTNxRG+WQkmLDlv90px5w9kxPskULngQ3jV/T9espPH3S3f
 pA+Ua687K1nU9mEDWLzhz/cGz70XczyR0ZGS+m+ckoxI/M6yZBon84Yw4hXQIq4Q4UZL
 FnmMDdvwJbj/EnOqU+ymrGUJz2bMk+igczHoaCX3jWuSWTgV6ZulI/cZCpS4E8jcE3nS
 lotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4oJ/jweDfhBNzYtl7cCA85MSZCoSaUkH+H3AHvOTrdo=;
 b=BwDa+x9JU0ZDBKxK1OdiyjjBpbLlVhjNW/oPMQXD3iJssko4zBZOZj67cj26au/Pts
 nvUiSMelcE+xXIPh61TbqJD4gPqE0e2KdlQnmLDn5BBIaY0U0IaYT0jRnHJx9Ywp57Hz
 Ur04OPw7s5hHUHUG7i0iOp8cWlx80wcwcP+taoKkiH4l2Y1FcLtyaAGQaQh+FcYo9FpD
 MkF+adRAs+vcV/8jvGFUPWLoLWz+5T54YPcAg3YWtOcwAWBkP8DxS9Gd3JSFVqCcGnlk
 qrE4G4tixTZct9f+TMLbKuXq9Y7m/BXw8WiHLLY9JnOx7QvimHKVV3wGhjfG6un2Vwdm
 sd/Q==
X-Gm-Message-State: AOAM530359vgTtz0l9qi6SRaNZtYc5jpSpehBUCcHjs4l1yf7sgsCfbS
 bB9gaBfsPO2TNBBjS0Soqpc2pKpfocUy9agkBHU=
X-Google-Smtp-Source: ABdhPJw/KFzh4RBceTHLwY8pNWrudKwrxWElPQzZu7APABTp0flCbC3wsOnBm6xHXk3rYBJL9ROwC5q00Dp2Iiuka+4=
X-Received: by 2002:a4a:5dc6:: with SMTP id w189mr13495446ooa.1.1627973669935; 
 Mon, 02 Aug 2021 23:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAM43=SNDAcS952MZpsiD2Z-WU9Bd0EPv=7Z86i7FGdvDtsSXdQ@mail.gmail.com>
 <20210802112904.110028a4@ws>
In-Reply-To: <20210802112904.110028a4@ws>
From: Mikael Pettersson <mikpelinux@gmail.com>
Date: Tue, 3 Aug 2021 08:54:18 +0200
Message-ID: <CAM43=SP2TUUfo2bUiu+5fvKvT1gn0e4vofoX3zDP1pV_qnv+BA@mail.gmail.com>
Subject: Re: [BISECTED] 5.14.0-rc4 broke drm/ttm when !CONFIG_DEBUG_FS
To: Duncan <j.duncan@cox.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Jason Ekstrand <jason@jlekstrand.net>,
 Linux Kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 03 Aug 2021 07:11:08 +0000
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

On Mon, Aug 2, 2021 at 8:29 PM Duncan <j.duncan@cox.net> wrote:
>
> [Not subscribed so please CC me.  Manual quoting after using lore's
> in-reply-to functionality.  First time doing that so hope I got it
> right.]
>
> Mikael Pettersson <mikpelinux@gmail.com> wrote...
> > Booting 5.14.0-rc4 on my box with Radeon graphics breaks with
> >
> > [drm:radeon_ttm_init [radeon]] *ERROR* failed initializing buffer
> > object driver(-19).
> > radeon 0000:01:00.0: Fatal error during GPU init
>
> Seeing this here too.  amdgpu on polaris-11, on an old amd-fx6100
> system.
>
> > after which the screen goes black for the rest of kernel boot
> > and early user-space init.
>
> *NOT* seeing that.  However, I have boot messages turned on by default
> and I see them as usual, only it stays in vga-console mode instead of
> switching to framebuffer after early-boot. I'm guessing MP has a
> high-res boot-splash which doesn't work in vga mode, thus the
> black-screen until the login shows up.

Yes, I have the Fedora boot splash enabled.

> > Once the console login shows up the screen is in some legacy low-res
> > mode and Xorg can't be started.
> >
> > A git bisect between v5.14-rc3 (good) and v5.14-rc4 (bad) identified
> >
> > # first bad commit: [69de4421bb4c103ef42a32bafc596e23918c106f]
> > drm/ttm: Initialize debugfs from ttm_global_init()
> >
> > Reverting that from 5.14.0-rc4 gives me a working kernel again.
> >
> > Note that I have
> > # CONFIG_DEBUG_FS is not set
>
> That all matches here, including the unset CONFIG_DEBUG_FS and
> confirming the revert on 5.14.0-rc4 works.

Thanks for the confirmation.
