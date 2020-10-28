Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1E929D119
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 17:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5EF6E54C;
	Wed, 28 Oct 2020 16:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9C96E546
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 16:48:44 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id n11so4825880ota.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X5jQzvvvdPmdqjOkHSPEIyySBfjkABtctqToD4WlPds=;
 b=NSjA3mx3770CNXwIxYyfMJ0Ks7APtQWI95kOar03VF/mo/p2HnmzwtllZ3oO/KitIO
 1MSo7mzzd4TF6U0+8l0izfVR+COtYstZ1QaOdGaUDsPGVWJqR2Ai0eGeiev5FbOpONzf
 uH0vlwMW87Ez0144ChoCTqK6R+wYvMJGPIG6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X5jQzvvvdPmdqjOkHSPEIyySBfjkABtctqToD4WlPds=;
 b=rI1zDZtsz823+N00ekLULEz3hYcqNNwhb7ldk4QJ52rhaV+IErOLuGYo5IO9DShlAO
 xBFwkq65OxGWU9xEvpSXq0wPerek84hKOPTx34mk4cFIOLf+Enr+bofoQANMqyGytjRj
 S/GQJalSgBtQNF4DsEMXmuX5decBdQOI5IfxdENpC01iVRyhqK7hfejbAgUAmFwunMFP
 NFc6yBUCaeWwH48AbnIyMNFPJeFQYnDrANJFI/EjfHtumGBR89amUQu8c4aGXP+0A700
 Je/z6MhX5SnQc6IqRDDq9FVedFlso9RzAjKr5+8BOW3mDkELDc107QQ9bEvI2HqkX7gs
 bJ0A==
X-Gm-Message-State: AOAM5313Wd3Sbx0f/TrZk4UqkBmBdHGyeU9N5BUL1Ru7IzYMyswHg9RL
 KIozxl8VlJ2Q6HfsaseeTKJj1IS/BnXft4mP03Z/9w==
X-Google-Smtp-Source: ABdhPJwAFARXDtGaA0IuXNU3vgf8FJQ2VDsoMMBf965lhgzB5CiwU2XW10HkNFejBQ5trrA3kz5WVMzMU8SUYKDjArY=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id
 f28mr143257ote.188.1603903723608; 
 Wed, 28 Oct 2020 09:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201028160600.3752105-1-daniel.vetter@ffwll.ch>
 <20201028164552.GA546379@ravnborg.org>
In-Reply-To: <20201028164552.GA546379@ravnborg.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 28 Oct 2020 17:48:32 +0100
Message-ID: <CAKMK7uFDNKFeMfKiiToppYwx509qhYruoTfiCry9DVYSdWiG0A@mail.gmail.com>
Subject: Re: [PATCH] fbcon: Disable accelerated scrolling
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Peilin Ye <yepeilin.cs@gmail.com>, George Kennedy <george.kennedy@oracle.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Ben Skeggs <bskeggs@redhat.com>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 28, 2020 at 5:45 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Daniel et al.
>
> On Wed, Oct 28, 2020 at 05:06:00PM +0100, Daniel Vetter wrote:
> > So ever since syzbot discovered fbcon, we have solid proof that it's
> > full of bugs. And often the solution is to just delete code and remove
> > features, e.g.  50145474f6ef ("fbcon: remove soft scrollback code").
> >
> > Now the problem is that most modern-ish drivers really only treat
> > fbcon as an dumb kernel console until userspace takes over, and Oops
> > printer for some emergencies. Looking at drm drivers and the basic
> > vesa/efi fbdev drivers shows that only 3 drivers support any kind of
> > acceleration:
> >
> > - nouveau, seems to be enabled by default
> > - omapdrm, when a DMM remapper exists using remapper rewriting for
> >   y/xpanning
> > - gma500, but that is getting deleted now for the GTT remapper trick,
> >   and the accelerated copyarea never set the FBINFO_HWACCEL_COPYAREA
> >   flag, so unused (and could be deleted already I think).
> >
> > No other driver supportes accelerated fbcon. And fbcon is the only
> > user of this accel code (it's not exposed as uapi through ioctls),
> > which means we could garbage collect fairly enormous amounts of code
> > if we kill this.
> >
> > Plus because syzbot only runs on virtual hardware, and none of the
> > drivers for that have acceleration, we'd remove a huge gap in testing.
> > And there's no other even remotely comprehensive testing aside from
> > syzbot.
> >
> > This patch here just disables the acceleration code by always
> > redrawing when scrolling.
>
> So far I follow you - and agree.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
> > The plan is that once this has been merged
> > for well over a year in released kernels, we can start to go around
> > and delete a lot of code.
>
> Why wait one year? We deleted the scrollback code without any prior
> warning - which was fine. And acceleration support has less users
> so there should be no reason to wait.
>
> So unless there are good arguments that I miss then we should just
> delete the acceleration code outright.

If you grep for FBINFO_HWACCEL and related stuff, we could delete like
half the driver code, plus a ton of the related support code in fbcon
and fbdev core. It's going to be a lot of work, and I don't want to do
that and then have to back it out again. Compared to this the
softscrollback removal was nothing.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
