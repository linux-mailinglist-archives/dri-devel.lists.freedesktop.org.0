Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28191292ACE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 17:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C4F6EA04;
	Mon, 19 Oct 2020 15:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392226EA04
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 15:48:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i1so313978wro.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 08:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hB2FrfWVDy55EOBjXBJXCyrrL+u+E9Sicq1StHpgWPQ=;
 b=Qt5tpFRHZ7fgW79Xvr69jN2/R8XSB8MVBooYWMy/N0tW5N5HlGCKmPYAfhoWkjqEfi
 l2rbpAE6mE5rl07KpebS99krYWZAHBm+cYL7qLWrdo8HPtHXpH37+kxvXPbeoFgDmFuS
 dlJTvAUWpRbIROqLAG4nDkeOQW5F5xsCH8iIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hB2FrfWVDy55EOBjXBJXCyrrL+u+E9Sicq1StHpgWPQ=;
 b=k7CUm60gCXwSOsXtnO2ItqYuHgnMR/NtS0i7h0UIGyXXtXj8qPKt5RJV9fBsFhynWG
 YvZbq6bk++0ZjLb0Dgq8gFpQgtwbVU7hzBOZdaF7/Q3hKW5AObEZybu7gGJgHzJ43RGb
 wcGARNONbJWV1OhIn8vl0cIPqRssho4hBmoxXjFWew3B5LwODPAf6x77B15nbNKYOhOH
 XgWIuOprcj2uIMTqtJOVDSUY5s3HZhwuGorn89QZY30FIybmz7hy+JBNhWce7yy+myaM
 V1JvVIxxva1a8OIGssAJWpqCziUmHg/gLsgH7W+GQrSvLI7qnse9WetB8RtX9glUmLu0
 6jMA==
X-Gm-Message-State: AOAM530q2KJOPFAwQ0+BtCDaKPyJu5vCQK4WSN2EdOdFWnfneaZnhm4K
 JRqp4EJQpU4ScsrwwCrlj5dq5A==
X-Google-Smtp-Source: ABdhPJzoE8hR8LhP0ymIEIJZVar1bmgWCKtZxaGCpwqcqIBYt/A1A48X8i02M8/zJTt6RvTGlccR9w==
X-Received: by 2002:adf:f3d2:: with SMTP id g18mr121336wrp.367.1603122511881; 
 Mon, 19 Oct 2020 08:48:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h16sm118214wre.87.2020.10.19.08.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 08:48:31 -0700 (PDT)
Date: Mon, 19 Oct 2020 17:48:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] drm/drm_vblank: use drm_warn_once() to warn undefined
 mode timing
Message-ID: <20201019154829.GG401619@phenom.ffwll.local>
References: <20201016071254.2681-1-shawn.guo@linaro.org>
 <CAKMK7uHvDK6Cd2BBvUV-xtArD73gQVAp0ETBw=tLXrYUfOS-zw@mail.gmail.com>
 <20201016085407.GA5182@dragon>
 <CAKMK7uHbhBzS=DdrDgpzYYaiCCkVLj=sAMUi3puLxjoF-Z+NbQ@mail.gmail.com>
 <20201016114637.GB5182@dragon>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016114637.GB5182@dragon>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 16, 2020 at 07:46:41PM +0800, Shawn Guo wrote:
> On Fri, Oct 16, 2020 at 11:30:04AM +0200, Daniel Vetter wrote:
> > On Fri, Oct 16, 2020 at 10:54 AM Shawn Guo <shawn.guo@linaro.org> wrote:
> > >
> > > On Fri, Oct 16, 2020 at 09:58:46AM +0200, Daniel Vetter wrote:
> > > > On Fri, Oct 16, 2020 at 9:13 AM Shawn Guo <shawn.guo@linaro.org> wrote:
> > > > >
> > > > > Commit 5caa0feafcc6 ("drm/vblank: Lock down vblank->hwmode more") added
> > > > > WARN_ON_ONCE() for atomic drivers to warn the case that vsync is enabled
> > > > > before a mode has been set on CRTC.  This happens sometimes during the
> > > > > initial mode setting of a CRTC.  It also happens on Android running HWC2
> > > > > backed with drm_hwcomposer, where HWC2::SetVsyncEnabled could be called
> > > > > before the atomic mode setting on CRTC happens.
> > > > >
> > > > > In this case, there is nothing really bad to happen as kernel function
> > > > > returns as no-op.  So using WARN() version might be overkilled,
> > > > > considering some user space crash reporting services may treat kernel
> > > > > WARNINGS as crashes.  Let's drop WARN_ON_ONCE() and change drm_dbg_core()
> > > > > to drm_warn_once() for warning undefined mode timing.
> > > >
> > > > This indicates a bug in your driver. Please fix it there, not by
> > > > shutting up the core code complaining about that. Either you're
> > > > getting vblank timestamps when the vblank isn't set up yet
> > > > (drm_crtc_vblank_on/off) or there's some other race going on in your
> > > > driver code resulting in this.
> > >
> > > Thanks for the comment, Daniel.
> > >
> > > I'm hitting this warning on an Android running drm_hwcomposer.  I'm
> > > indeed getting vblank timestamps request before drm_crtc_vblank_on() is
> > > called.  I'm not sure this is a bug or race condition in the driver
> > > code, as both vblank timestamps and on/off requests are coming from user
> > > space ioctl for my case.  @Sean, that means the problem is in Android
> > > drm_hwcomposer code?
> > 
> > vblank request when the crtc is off should be rejected. Most drivers
> > got this wrong before I added the required drm_crtc_vblank_reset()
> > into atomic helpers in 51f644b40b4b ("drm/atomic-helper: reset vblank
> > on crtc reset")
> > 
> > Please make sure you have that, and that drm_crtc_vblank_reset is run
> > at driver load time. If the crtc is off, vblank ioctl should be
> > rejected. So this is definitely not a userspace bug, still a driver
> > bug. In general, userspace is not allowed to do anything that results
> > in dmesg spam at normal log levels. Anytime that happens it's a kernel
> > bug. And if it's a warning in core code, it's most likely a driver bug
> > since the core code tends to be better debugged about these things.
> > But there's ofc exceptions.
> 
> Indeed!  Adding drm_crtc_vblank_reset() into driver crtc reset hook
> removes the WARNING for me.  Really appreciate your comments, Daniel!

This should work automatically if you're using the atomic state helpers.
Please try to unify as much as possible, so you're not missing any future
bugfixes in this area. Although I thought I've completely reviewed all
drivers to fix as many as possible for this bug. Are you on some older
kernel that didn't have this? Maybe good idea to submit the bugfix in
upstream to stable, if that's the case.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
