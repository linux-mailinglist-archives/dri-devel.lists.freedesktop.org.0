Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13378C256A
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 15:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED98610E311;
	Fri, 10 May 2024 13:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jrg98nfu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B49B10E311
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 13:11:18 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51ef64d051bso2392542e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 06:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715346676; x=1715951476; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yX/K9M0yYdHwHzi/BBLfUdHd4tXuv30HVLx+oV240j0=;
 b=jrg98nfusZ401lSWlbwIwUOWvnQeLxMMo0hLmMKknNwO4MWxJHo8w41v/2Yg361V9J
 jwz/Axym5597b0iT0UPDcHhYL3YkVC+ep7JEV7+y2rAnDQ4KuVVUx2xZ2HlnadI0OIKC
 qQNG66m+jbGhVWuus+wYdRB7LNqYN2L3PPfH0uCYs4mOrMCia8Z8kI6K7OBDhbMNOdWk
 gFDIJvCa6Pium6rUBvYdVI5jqF27dq93IGsc4qwe/47vRzyoZ8seCzwg3CoVK4cOcS14
 z3M53MMW5/Pf3CpD5QUp9sYAT2rUElIrvXgE3vAEmIN6xU5PVT8i498bNlzdkieTCQxA
 LsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715346676; x=1715951476;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yX/K9M0yYdHwHzi/BBLfUdHd4tXuv30HVLx+oV240j0=;
 b=uP68HNsysQuwS04ScGB6u8k3A9jyXICOVbatwTnuTSuTZ7U2/U6YigK6TU7fzVjBFC
 moZ6aFtuI0VWcS36YHu0ppfaTOFm9HBQohMuVD2Q8uzVmslH2qpehyKIx+teUO6r2i+9
 VnYkgA5R96aLAr00p2YHLJETSN6PXa+YkK76vm1xfdOQP6fqYs45FFKVK2+tRk79bnRK
 IzslG3KeURouoP5hKpgh9LNATgkfvDe1D4HpiJ1qqczpHFFJDj6OlVdJ69OJzkHlYxwg
 zfA2BNMW+bLfLCZYE5QAoxf7nxvfxWL4BxcLUzK25EVgb9UKOtHW9MN0CWzduzAdnvSi
 Bs8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqhqrpAziZ/nBid4LKiRn3b5p0unKcTiib1N38NjW2PCkinfnTfsncML4IcN9D3UEjVWuvNlKJOpNsPltqIF4cakJcotfT+wwfmxL+VM0l
X-Gm-Message-State: AOJu0Yykw/RrEBlHzKupgS2itCbHNESR4n8FuU9U1omIN+4WbmJsY90E
 3hoH38KdDzre7PRgYAJ/LVaEubJq7v6KM0RDKBcN4y/A8iXw4fw1
X-Google-Smtp-Source: AGHT+IF0Jjqhsy55UZdYKVqMBz+7nNud1TD4Pq7eqv4OiZ+mFV57hZsD0Ki/MoSnZW9EtkeVNICelQ==
X-Received: by 2002:a05:6512:358e:b0:522:2990:7739 with SMTP id
 2adb3069b0e04-522299078a7mr449300e87.20.1715346675484; 
 Fri, 10 May 2024 06:11:15 -0700 (PDT)
Received: from gmail.com (host-90-235-80-216.mobileonline.telia.com.
 [90.235.80.216]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f39d2c8fsm678263e87.279.2024.05.10.06.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 06:11:15 -0700 (PDT)
Date: Fri, 10 May 2024 15:11:13 +0200
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: nerdopolis <bluescreen_avenger@verizon.net>,
 dri-devel@lists.freedesktop.org
Subject: Re: simpledrm, running display servers, and drivers replacing
 simpledrm while the display server is running
Message-ID: <Zj4c8Tk_zkzb9R48@gmail.com>
References: <9215788.EvYhyI6sBW.ref@nerdopolis2>
 <9215788.EvYhyI6sBW@nerdopolis2>
 <d8822317-db81-4179-93b8-18629a95af73@suse.de>
 <Zj3tvKayXdn2_JMq@gmail.com>
 <4710c7b9-d4e5-4eb9-9d69-d80c385deadf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4710c7b9-d4e5-4eb9-9d69-d80c385deadf@suse.de>
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

On Fri, May 10, 2024 at 02:45:48PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> > (This was discussed on #dri-devel, but I'll reiterate here as well).
> > 
> > There are two problems at hand; one is the race condition during boot
> > when the login screen (or whatever display server appears first) is
> > launched with simpledrm, only some moments later having the real GPU
> > driver appear.
> > 
> > The other is general purpose GPU hotplugging, including the unplugging
> > the GPU decided by the compositor to be the primary one.
> 
> The situation of booting with simpledrm (problem 2) is a special case of
> problem 1. From the kernel's perspective, unloading simpledrm is the same as
> what you call general purpose GPU hotplugging. Even through there is not a
> full GPU, but a trivial scanout buffer. In userspace, you see the same
> sequence of events as in the general case.

Sure, in a way it is, but the consequence and frequency of occurence is
quite different, so I think it makes sense to think of them as different
problems, since they need different solutions. One is about fixing
userspace components support for arbitrary hotplugging, the other for
mitigating the race condition that caused this discussion to begin with.

> 
> > 
> > The latter is something that should be handled in userspace, by
> > compositors, etc, I agree.
> > 
> > The former, however, is not properly solved by userspace learning how to
> > deal with primary GPU unplugging and switching to using a real GPU
> > driver, as it'd break the booting and login experience.
> > 
> > When it works, i.e. the race condition is not hit, is this:
> > 
> >   * System boots
> >   * Plymouth shows a "splash" screen
> >   * The login screen display server is launched with the real GPU driver
> >   * The login screen interface is smoothly animating using hardware
> >     accelerating, presenting "advanced" graphical content depending on
> >     hardware capabilities (e.g. high color bit depth, HDR, and so on)
> > 
> > If the race condition is hit, with a compositor supporting primary GPU
> > hotplugging, it'll work like this:
> > 
> >   * System boots
> >   * Plymouth shows a "splash" screen
> >   * The login screen display server is launched with simpledrm
> >   * Due to using simpldrm, the login screen interface is not animated and
> >     just plops up, and no "advanced" graphical content is enabled due to
> >     apparent missing hardware capabilities
> >   * The real GPU driver appears, the login screen now starts to become
> >     animated, and may suddenly change appearance due to capabilties
> >     having changed
> > 
> > Thus, by just supporting hotplugging the primary GPU in userspace, we'll
> > still end up with a glitchy boot experience, and it forces userspace to
> > add things like sleep(10) to work around this.
> > 
> > In other words, fixing userspace is *not* a correct solution to the
> > problem, it's a work around (albeit a behaivor we want for other
> > reasons) for the race condition.
> 
> To really fix the flickering, you need to read the old DRM device's atomic
> state and apply it to the new device. Then tell the desktop and applications
> to re-init their rendering stack.
> 
> Depending on the DRM driver and its hardware, it might be possible to do
> this without flickering. The key is to not loose the original scanout
> buffer, while not probing the new device driver. But that needs work in each
> individual DRM driver.

This doesn't sound like it'll fix any flickering as I describe them.
First, the loss of initial animation when the login interface appears is
not something one can "fix", since it has already happened.

Avoiding flickering when switching to the new driver is only possible
if one limits oneself to what simpledrm was capable of doing, i.e. no
HDR signaling etc.

> 
> > 
> > Arguably, the only place a more educated guess about whether to wait or
> > not, and if so how long, is the kernel.
> 
> As I said before, driver modules come and go and hardware devices come and
> go.
> 
> To detect if there might be a native driver waiting to be loaded, you can
> test for
> 
> - 'nomodeset' on the command line -> no native driver

Makes sense to not wait here, and just assume simpledrm forever.

> - 'systemd-load-modules' not started -> maybe wait
> - look for drivers under /lib/modules/<version>/kernel/drivers/gpu/drm/ ->
> maybe wait

I suspect this is not useful for general purpose distributions. I have
43 kernel GPU modules there, on a F40 installation.

> - maybe udev can tell you more
> - it might for detection help that recently simpledrm devices refer to their
> parent PCI device
> - maybe systemd tracks the probed devices

If the kernel already plumbs enough state so userspace components can
make a decent decision, instead of just sleeping for an arbitrary amount
of time, then great. This is to some degree what
https://github.com/systemd/systemd/issues/32509 is about.


Jonas

> 
> Best regards
> Thomas
> 
> > 
> > 
> > Jonas
> > 
> > > The next best solution is to keep the final DRM device open until a new one
> > > shows up. All DRM graphics drivers with hotplugging support are required to
> > > accept commands after their hardware has been unplugged. They simply won't
> > > display anything.
> > > 
> > > Best regards
> > > Thomas
> > > 
> > > 
> > > > Thanks
> > > > 
> > > -- 
> > > --
> > > Thomas Zimmermann
> > > Graphics Driver Developer
> > > SUSE Software Solutions Germany GmbH
> > > Frankenstrasse 146, 90461 Nuernberg, Germany
> > > GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> > > HRB 36809 (AG Nuernberg)
> > > 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 
