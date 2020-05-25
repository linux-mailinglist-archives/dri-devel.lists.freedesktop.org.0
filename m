Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AB11E1085
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 16:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDBE89CF3;
	Mon, 25 May 2020 14:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E88289CF3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 14:29:04 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t18so3185877wru.6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 07:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FT7fGFPCrCL8+qBFWfDr8NBLPeRPqmO4Rq16Z/Ijses=;
 b=ifX0D77pkJ2pbYmgRevk30qnTJU5q9wd8B+LkKnsJ5rcj+l74KAHZXK2qeRro1L7uh
 36bzH8NfJIR8qW4VOSojAe++VbNfctTkPwEmIeBl4tqOmDQpQ+J78IZwobzhODJwhy4l
 CCEdhTOmRjj1iibDvRtSQE1tzuTkXmHqkCkDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FT7fGFPCrCL8+qBFWfDr8NBLPeRPqmO4Rq16Z/Ijses=;
 b=jRSmx4hB6p8o3HhFFT1oeDKVGNXwRy4k7C07buhFOvzgpDqcdSBNwnm4wf145r3tv7
 mICPGnKrpuhxmgqrTFHKhtyNGPWbe8/cSPSpO4sHcOoZdAtKsu6ESA6HtwUxV0AQGABy
 zU3g/92/5zovOL9W3teXcmzfJf+ODKcWNN3w7xrxn5AME2TZtbyBGSlHseRHjnf4ObAG
 vAR8N6pfboA/I1jaJbRd7ssY+oz2c59DqHtk0BrjkSBtHfm00OhJfCydybZpaK+/WPRL
 Sc3QiTMLH7c1Oq4AXZPLst8DN8s0vO2keTOxQgVjvXYhy3sVCl35UNcSC+ygov3NUywr
 l9BQ==
X-Gm-Message-State: AOAM531sI8CzrSabYZJaalqyrPZT29jfH4dGLuxJUgVVfzqf0+4JVs8G
 hCn8f/wESzJuM80iyRrD18Cx2A==
X-Google-Smtp-Source: ABdhPJzpsrwUCdqSztzVT/QVgFS6VE77GDLK27DeRdrrPrdEW2yAGPY8Gc02Wh2Fx3sWQeXM8z1TNw==
X-Received: by 2002:adf:fc8b:: with SMTP id g11mr16281580wrr.90.1590416942867; 
 Mon, 25 May 2020 07:29:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i74sm18339007wri.49.2020.05.25.07.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 07:29:02 -0700 (PDT)
Date: Mon, 25 May 2020 16:29:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
Message-ID: <20200525142900.GE206103@phenom.ffwll.local>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <20200520125556.GY206103@phenom.ffwll.local>
 <4Qkv4p0V0uG4sZ8LjizVLq6bLbZ8U1xAwQ0riB72aHH3sT_ZJYz9QzDFPWCko8PfcA-VGBFkGtCn1n9YfKYqo_vwzvE3BVQUlxyBq61GZ08=@emersion.fr>
 <CAKMK7uFzk7UW7k8WTMSzKynGOypQeTzhf9Gqxb4maimG+QEdiQ@mail.gmail.com>
 <20200522125432.0b49ea1a@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522125432.0b49ea1a@eldfell.localdomain>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Sean Paul <sean@poorly.run>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 22, 2020 at 12:54:32PM +0300, Pekka Paalanen wrote:
> On Wed, 20 May 2020 16:19:00 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Wed, May 20, 2020 at 3:20 PM Simon Ser <contact@emersion.fr> wrote:
> > >
> > > On Wednesday, May 20, 2020 2:55 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> > >  
> > > > Maybe we should add an explicit note that there's no guarantee about the
> > > > new chardev minor this new device will get, it could both inherit the
> > > > existing one (you can't open the old one anymore anyway) or get a new one?
> > > >
> > > > Or does userspace want a guarantee, i.e. as long as there's still a handle
> > > > open kernel guarantees to not recycle the chardev minor (which is what we
> > > > currently do). In that case better to add that to your list of guarantees
> > > > above.  
> > >
> > > The are race conditions to consider too, e.g.
> > >
> > > - Compositor sends /dev/dri/card0 to a client
> > > - card0 goes away
> > > - Another device takes card0
> > > - Client receives /dev/dri/card0 and then starts using it, but it's the
> > >   wrong device  
> > 
> > Oh reminds me, what should we do about open() - that one will fail,
> > the chardev is going away after all, not failing kinda doesn't make
> > sense. And more tricky, about creating new leases?
> > 
> > I think reasonable semantics here would be that both of these "create
> > a new open drm fd" operations can fail as soon as the device is
> > unplugged. Userspace needs to be able to deal with that.
> 
> Hi,
> 
> yeah, we can make mmap read/write end result undefined, recycle char
> minors like pids, and let new open()s and new leases fail. Pretty much
> everything Daniel and Simon said make sense to me.
> 
> I'll spin a v2, but maybe next week.
> 
> What about the drm_ioctl() issue Andrey pointed out?

Dropped some thoughts there, tbh dunno, need some more discussions?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
