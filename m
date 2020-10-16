Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE390290449
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 13:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085C86EDB0;
	Fri, 16 Oct 2020 11:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC96A6EDB0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 11:46:48 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id gm14so1254191pjb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 04:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rf59RR7LOH6nYY3PgUu8f+ejtVyIbXmE2ywgumTcYQI=;
 b=mE6zMjL7IHwkvwhW7qbOLehRNYgDtsgjh7CPiIvu1pq1EvrjC9+Pz7JJI6pC2kbGCv
 g5xv+Lp/BfjvgzdS4E7K4DGZqhJkazZg/dwkXuC7dDrrHDcGAbFaKl8lGC1UyZ1skz68
 zZu5l9DvCi0mifh3RhstoyEG3vUX95GivgHJdGNBR8+yo4KEqaup5LpyLlQzAIdwhrpT
 pEww5Ly+wNQuX5ZryorqrT8deHhs8amPRm0B0W+muFk6D6TlynvMsvnxrTatI8DosnZj
 HTxMVlFDM5jWNNnwrAGAdIEb3/gO8yuC83PstMMnq1WgtWRKI7b6Ynq+o7EogjcF4lP5
 8ZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rf59RR7LOH6nYY3PgUu8f+ejtVyIbXmE2ywgumTcYQI=;
 b=ILEyVju5zPDRu200jhynXQRJqYpGI+C0bPTwMsGzfDEJbK/2GVW82ZffKcgeY+daO7
 Nn0mCjBylJpzzRMxBN/ON0K4J6tL8bDZaT/SUpz2rQ77mQyIC/mwZ2L7bjPPIfU0VCXL
 12DcVuPLMETJzodhPf0j91UEIIg93PR0hlGWUDL8+3Bl0MWqxkHWYtqnnC30lyBnH0Io
 Ii4UmC8GYu4bR8vO4sDHEt63D2ctOYgiHw/pq9zhQLC6RIPKKxIjBi9WQiHNrGAjS049
 MZkc8lVvT/vYZTfVZT5GEuXaHieF/WhoVNoYe6q1HATh6VsxB+mjW/sPn2v/uNCTrJOH
 JkVA==
X-Gm-Message-State: AOAM530nPWnRFStOBVSADBiAbu8/lgGet08f28yOwli/a7+DMzx8UUUV
 RByctjHqL+pnOsZNzBhpGrR74Q==
X-Google-Smtp-Source: ABdhPJxpMoEgqUH1bBRlhgSIddiDTIu7lZgNanbj8oZHahbt/PK+QfMX3+mn/f1WJG6+agyVb8lpKQ==
X-Received: by 2002:a17:90a:f184:: with SMTP id
 bv4mr3484762pjb.1.1602848808244; 
 Fri, 16 Oct 2020 04:46:48 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id jx17sm2861521pjb.10.2020.10.16.04.46.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Oct 2020 04:46:47 -0700 (PDT)
Date: Fri, 16 Oct 2020 19:46:41 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/drm_vblank: use drm_warn_once() to warn undefined
 mode timing
Message-ID: <20201016114637.GB5182@dragon>
References: <20201016071254.2681-1-shawn.guo@linaro.org>
 <CAKMK7uHvDK6Cd2BBvUV-xtArD73gQVAp0ETBw=tLXrYUfOS-zw@mail.gmail.com>
 <20201016085407.GA5182@dragon>
 <CAKMK7uHbhBzS=DdrDgpzYYaiCCkVLj=sAMUi3puLxjoF-Z+NbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHbhBzS=DdrDgpzYYaiCCkVLj=sAMUi3puLxjoF-Z+NbQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 16, 2020 at 11:30:04AM +0200, Daniel Vetter wrote:
> On Fri, Oct 16, 2020 at 10:54 AM Shawn Guo <shawn.guo@linaro.org> wrote:
> >
> > On Fri, Oct 16, 2020 at 09:58:46AM +0200, Daniel Vetter wrote:
> > > On Fri, Oct 16, 2020 at 9:13 AM Shawn Guo <shawn.guo@linaro.org> wrote:
> > > >
> > > > Commit 5caa0feafcc6 ("drm/vblank: Lock down vblank->hwmode more") added
> > > > WARN_ON_ONCE() for atomic drivers to warn the case that vsync is enabled
> > > > before a mode has been set on CRTC.  This happens sometimes during the
> > > > initial mode setting of a CRTC.  It also happens on Android running HWC2
> > > > backed with drm_hwcomposer, where HWC2::SetVsyncEnabled could be called
> > > > before the atomic mode setting on CRTC happens.
> > > >
> > > > In this case, there is nothing really bad to happen as kernel function
> > > > returns as no-op.  So using WARN() version might be overkilled,
> > > > considering some user space crash reporting services may treat kernel
> > > > WARNINGS as crashes.  Let's drop WARN_ON_ONCE() and change drm_dbg_core()
> > > > to drm_warn_once() for warning undefined mode timing.
> > >
> > > This indicates a bug in your driver. Please fix it there, not by
> > > shutting up the core code complaining about that. Either you're
> > > getting vblank timestamps when the vblank isn't set up yet
> > > (drm_crtc_vblank_on/off) or there's some other race going on in your
> > > driver code resulting in this.
> >
> > Thanks for the comment, Daniel.
> >
> > I'm hitting this warning on an Android running drm_hwcomposer.  I'm
> > indeed getting vblank timestamps request before drm_crtc_vblank_on() is
> > called.  I'm not sure this is a bug or race condition in the driver
> > code, as both vblank timestamps and on/off requests are coming from user
> > space ioctl for my case.  @Sean, that means the problem is in Android
> > drm_hwcomposer code?
> 
> vblank request when the crtc is off should be rejected. Most drivers
> got this wrong before I added the required drm_crtc_vblank_reset()
> into atomic helpers in 51f644b40b4b ("drm/atomic-helper: reset vblank
> on crtc reset")
> 
> Please make sure you have that, and that drm_crtc_vblank_reset is run
> at driver load time. If the crtc is off, vblank ioctl should be
> rejected. So this is definitely not a userspace bug, still a driver
> bug. In general, userspace is not allowed to do anything that results
> in dmesg spam at normal log levels. Anytime that happens it's a kernel
> bug. And if it's a warning in core code, it's most likely a driver bug
> since the core code tends to be better debugged about these things.
> But there's ofc exceptions.

Indeed!  Adding drm_crtc_vblank_reset() into driver crtc reset hook
removes the WARNING for me.  Really appreciate your comments, Daniel!

Shawn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
