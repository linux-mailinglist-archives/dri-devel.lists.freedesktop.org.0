Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4269D28CC25
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 13:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667736E8C3;
	Tue, 13 Oct 2020 11:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE796E8C0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 11:03:20 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e2so21316605wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 04:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CfBR6bK2J2fJ7B48qll68SXvB5y0yP/GwVh+vZbBFTA=;
 b=b4LhS6hszN5QU1ZN5nMBwrIGzNWzNpO2gPy7LBGl4nl/EA3dwVwgTMfasxYJzPbwJB
 S6kE3k3cjHl6s0XMBB/zCtEzKD4FXx6Th4lkgr+pVo0YcKge8zuMbuDGZAHbQorCQxNn
 02tMLD07wqLvTh6O2guPdaY+bvMl7iDxbKzoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CfBR6bK2J2fJ7B48qll68SXvB5y0yP/GwVh+vZbBFTA=;
 b=APeTyF6sgzQ4jVPf5PFSZMCem04df9pIAhrRzzaZR/rVKZkj50SUseFEzGEzioIj1P
 xjAoSZMlyuD1kfezfeDAgXFU3wTAnBtBzgLlC0jtCWc5wmUUdfUHi5whd8k7BjOJ7Tkj
 +R2WrRbzpEI5CzJEffuXeXL8u+6Sglnx2qxLUmoD9rPuxQuilCXjOVO3S9uP1qwbb+TC
 vlbvbENdGhrEPicx4zzVDR11WFTx17WphTjVunyIKltiQsDoMshWT2CXDQ+I4BF/nngJ
 frT40kM6ovyNWWAZsfHGCDeKFsRnmj8So6v9SR0sFVrn/djMqiGNPrZyouY2Y0YD1zWG
 QCpw==
X-Gm-Message-State: AOAM531Q2rvSS3fawTCVKd2Mzof40Qs+YHs7UaaxhfnsJUGGdIreCMp6
 Mcqv9pYHqOzfmK+i8hpZFVlyFxQa7FBy2shw
X-Google-Smtp-Source: ABdhPJxMkmx1A04d4cOnOXH+9cK3po8hUkPpfrvqcXVZ26Ih5XpltBa3wVlPCMifsNT0tT9/f4sACw==
X-Received: by 2002:a1c:1bd8:: with SMTP id
 b207mr15265980wmb.139.1602586999512; 
 Tue, 13 Oct 2020 04:03:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n9sm29127087wrq.72.2020.10.13.04.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 04:03:18 -0700 (PDT)
Date: Tue, 13 Oct 2020 13:03:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 3/3] drm/vkms: fbdev emulation support
Message-ID: <20201013110316.GC438822@phenom.ffwll.local>
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <20201009232156.3916879-3-daniel.vetter@ffwll.ch>
 <20201012132452.1241297a@linux-uq9g>
 <9ad2c6dd-9f3e-8b88-e013-dcb0e1fd8005@baylibre.com>
 <20201012142335.GY438822@phenom.ffwll.local>
 <20201013091410.06c98a1c@eldfell>
 <CAKMK7uHY_nrB=0-xkWi+FXFosCY1XPVXLJb+mGqDR+GpRZ6C6Q@mail.gmail.com>
 <20201013131938.73a5d1c6@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013131938.73a5d1c6@eldfell>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 01:19:38PM +0300, Pekka Paalanen wrote:
> On Tue, 13 Oct 2020 09:53:44 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Tue, Oct 13, 2020 at 8:14 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > On Mon, 12 Oct 2020 16:23:35 +0200
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > >  
> > > > On Mon, Oct 12, 2020 at 02:40:58PM +0200, Neil Armstrong wrote:  
> > > > > Hi,
> > > > >  
> > >
> > > ...
> > >  
> > > > > It's weird because it the kernel is misconfigured and no console is specified on the cmdline
> > > > > this console could become the main console...
> > > > >
> > > > > It's a great feature, but couldn't this be a module parameter ?  
> > > >
> > > > If you have vkms enabled in a distro, you're doing it wrong.  
> > >
> > > That's really not a great position to take. I would prefer that
> > > if a random contributor writes a Weston patch and runs 'meson test', it
> > > will use VKMS to run Weston's DRM-backend tests on his machine
> > > automatically, maybe save for some seat and device node access
> > > permissions bits which distributions could be delivering as well.
> > >
> > > Just put the VKMS device node into a non-default seat, and Xorg etc.
> > > will happily ignore it.
> > >
> > > For the fbdev device node, I don't know. Maybe a module parameter
> > > really is a good choice there, defaulting to off. I have no interest in
> > > testing anything against fbdev, but other people might disagree of
> > > course.
> > >
> > > Why? Gitlab CI is still not running tests for every commit, just per
> > > MR, and it might even be infeasible too.
> > >
> > > I am also hoping for a future where I don't have to build my own kernel
> > > just to be able to run Weston DRM tests with VKMS. That means I want to
> > > be able to run my machine with VKMS loaded and active at all times,
> > > without affecting the normal desktop. I already have such a setup with
> > > an extra AMD card, but you can't run most KMS tests against real
> > > hardware drivers.  
> > 
> > I just realized that building vkms is no problem, since it doesn't
> > auto-load. And if our Grand Plans with configurability come true, then
> > your test-harness will want to do that loading and setup itself
> > anyway. With that there also shouldn't be any problems with fbcon,
> > since presumably you already have that bound to the real gpu.
> > 
> > So I think we're all fine here, for everyone.
> > 
> > Now if you built-in vkms, that's a different thing. And for that I
> > really think a "don't do that" is the right choice.
> 
> Very good.
> 
> My remaining wish is that VKMS would be fully configurable and usable
> by an ordinary user, but I suppose that should be solved with a
> privileged userspace daemon somewhat similar to logind that hands out
> VKMS "sessions" somehow.
> 
> Not sure configfs is the best choice for VKMS configuration, unless
> maybe unprivileged userspace could ask for a VKMS instance with its own
> configfs tree it can access without CAP_ADMIN...

My idea for testing would be to build a gitlab docker image and run that
under usermode linux, with vkms built-in. Given how few people work on
this, I don't think you get a fancy logind configuration session thing for
it anytime soon.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
