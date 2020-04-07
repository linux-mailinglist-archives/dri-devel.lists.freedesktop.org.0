Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BBE1A08B9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 09:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5826E581;
	Tue,  7 Apr 2020 07:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33686E581
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 07:54:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 31so2711477wre.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 00:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RNh5NUUPymSENxkio0eTD9Cxz1g3v18KmMt9ynkpZVg=;
 b=TyS5OxDn+/Vz9s5d3xFylO4xwjzBs+qv0f5tfmJM+UC3KezKV9GVGZa5e0L3kh0NeN
 yM7nN2OpNwmxjsLl1Oag0FCvAxXnVmcs0XHU8AF1cTLTehRq5yc8TyaJssipYI1/xlcq
 hGzi0MWdnsWg1fgDp9u9H88lmZg1Lg2AeKPxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RNh5NUUPymSENxkio0eTD9Cxz1g3v18KmMt9ynkpZVg=;
 b=LliH3fZViSFXtVkjr5+fOWIJEmVvFq5DQwl+rhE6X6wZ64U03E+eKxYXayR4HtVA80
 11+bSMgyyANxVLDIJT4Zqs6OZitGbqb+H3+crtSxaBYJoP9RZH+mQeB0Q4waauMtI0LN
 uNKpJcktSo/x6My/An6Ba/BBw7PCByl3zj1pDZFGaKuwuQlCfe86N+AJcQOkT3LbfQyx
 bksP1LBxfIHRTXo/IgJwELlxwOrOasxgPYqte0qoblCKK0K5sOuWMyz8JnfQuoxSW7F5
 paOGpIMl3rbwxmON/4aLnqVgsS5knmhxqxNbF4I7kUcdKEX4KQtd2n+b/ir2Dd3HthPX
 avpw==
X-Gm-Message-State: AGi0PuYjJheWuBcULU/lf8kUi9Celi31lqhzFZQ8Ji5GQ3UGs6fnEJ25
 UgYLwWj6FBG0uS4m9KbR7+VkCCOEIHU=
X-Google-Smtp-Source: APiQypID+Dhl8F6lEan7tJQQpqResDXvbFoKSTdAk0ONvQBbcKHl7lwN1iTejGqWHyF72qt0gj9QHA==
X-Received: by 2002:adf:aacc:: with SMTP id i12mr1393375wrc.116.1586246068420; 
 Tue, 07 Apr 2020 00:54:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p13sm29461254wru.3.2020.04.07.00.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 00:54:27 -0700 (PDT)
Date: Tue, 7 Apr 2020 09:54:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: Curtaining API / Force blanking displays
Message-ID: <20200407075426.GF3456981@phenom.ffwll.local>
References: <CAN=K5G92HHwFqH4FPeqfJkD-hj8HJBy+7dTWEg55BP_HnHFjKw@mail.gmail.com>
 <20200405112131.1b2c5fc0@ferris.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200405112131.1b2c5fc0@ferris.localdomain>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: dri-devel@lists.freedesktop.org, Erik Jensen <rkjnsn@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 05, 2020 at 11:21:31AM +0300, Pekka Paalanen wrote:
> On Fri, 3 Apr 2020 12:56:33 -0700
> Erik Jensen <rkjnsn@google.com> wrote:
> 
> > First off, apologies if the functionality described already exists and I
> > just failed to find it, or if this isn't the correct venue for this
> > discussion. If so, pointers to the correct location would be appreciated.
> > 
> > I'm currently looking into the feasibility of developing a remote access
> > tool using kernel-level interfaces (e.g., drmModeGetFB and uinput) to
> > operate regardless of whether the user is using Xorg, a Wayland compositor,
> > or even a text console (assuming KMS is in use).
> > 
> > One of the requirements, however, is the remote user is able to "curtain"
> > their session in order to prevent individuals near the physical machine
> > from watching their session. Imagine a user working from home and
> > connecting to their workstation in a shared office space.
> > 
> > One possible solution I came up with would be a new kernel API to allow a
> > privileged process other than the DRM-Master to request that all displays
> > of a card be blanked or left in power saving mode. This wouldn't affect the
> > ability of the DRM-Master to change modes and layout configuration, but no
> > content would be visible on the physical displays until the curtaining
> > process ended the curtain or exited.
> > 
> > Is this (a) a good approach to solving this issue, (b) an API that, if
> > implemented, would be likely to be accepted into the kernel, and (c)
> > something that would be feasible to implement given the current
> > architecture? E.g., would it require changes in individual drivers, or
> > could it be managed solely in driver-independent kernel code?
> > 
> > I'm new to DRI development, so if it is something that folks would be open
> > to having, pointers to a good part of the code to look at to start
> > implementing such a feature would be appreciated.
> 
> Hi,
> 
> I have heard of such a screen scraper already existing, maybe Simon
> remembers where one is?
> 
> Personally I am very much against the whole idea:
> 
> Screen scraping like that will have big problems trying to a)
> synchronize to the display updates correctly (was the screen
> updated, did you get old or new frame, and you have to poll rather
> than be notified), and b) synchronizing framebuffer reads vs.
> writes (is the display server re-using the buffer when you are
> still reading it). You also get to handle each KMS plane
> individually.
> 
> You have to adapt to what the display server does and you have no
> way to negotiate better configurations. The framebuffers could be
> tiled and/or compressed, and quite likely are the kind of memory
> that is very slow to read by CPU, at least directly.
> 
> It obviously needs elevated privileges, because you are stealing
> data behind the display server's back. Then you are feeding it
> through network.
> 
> The curtaining goes against the policy that the current DRM master
> is in full control of the display. It also means the kernel has to
> lie to the DRM master to make the display server unaware of the
> funny business, and I don't like that at all.
> 
> With uinput, you will be having fun issues trying to guess what
> keymaps the display server and apps might be using, since you need
> to know that to be able to manufacture the right evdev keycodes
> that will be translated into the keysyms you actually wanted.
> Keymaps can change dynamically, too.
> 
> I believe it would much better to cooperate with display servers
> than trying to bypass and fool them. Maybe look towards Pipewire at
> least for the screen capturing API?

Yup, this should be done in something like systemd-logind, whose job it
already is to forcibly remove master rights and stuff like that. "I'm
going to take your display to blank it" is a very natural extension of
that.

Wrt actual screen grabbing part: We have minimal support for that, for
smooth/flicker free booting. But that assumes the old compositor has
ceased to access the driver already, there's 0 support for correctly
syncing access to buffers. So if you do that behind a compositor huge
chances that you race and read out black, when the user actually sees
seomthing ... Fixing that isn't possible without the cooperation of the
compositor and some real protocol. Essentially you need a nested
compositor, with maybe something like drm_lease thrown on top for a nice
fast-path for when the system compositor does not want to capture all the
frames.

Again the kernel isn't in that business, that's userspace's job.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
