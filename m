Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D81B8CAE9C
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 14:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B190410EC17;
	Tue, 21 May 2024 12:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="KOjkS3iI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E66310EC17
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 12:52:30 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a620a888a35so3467366b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 05:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1716295949; x=1716900749; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oF+ntntgUdAAtRPXv5H4m7IqQJDsLDLXWowJ8iuhomM=;
 b=KOjkS3iI1UTUuybUiHaNhpa7dxfy+dqhIABv6NV0gLOZ4HTt6oC3oHIPfWG8tJMiVH
 9iAPdqvs1PigypJ5B7M81B6JEjIRtuibPg1MOIltU2UiwpgWh9ZrstDDn23CZfPMOJMr
 mlIvc4peb61df0K+6S64WqkkAj8h7mu9BbzrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716295949; x=1716900749;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oF+ntntgUdAAtRPXv5H4m7IqQJDsLDLXWowJ8iuhomM=;
 b=mxsSHlIzqNEGP336Sl1tQ/nWkyf7Vqmo62qxFVb93F7dC8vJvDkhq18nyCSrxRqyz7
 /Oa7q8x3fYDp55qhaiC2e9pj4p9gGTVGCsw9LeGLMEg39kTgC7Wu+H7+N2bGtqRFdjuq
 zIQfCZ/UiyE3A5ipUyut9Di5/Xvc9oEYW6Z9q2wSFor1OF/E2AaFFIfoNuu2DVmGat4I
 1sOluSnVK+MdMl5f2nkPO2lvNNkcmdKyD/nifaQeHy7hAUaSnnw2OKbeHBieZR6ZYd0a
 LWFRlXKMRJL80O9rgpXMH6K3ng2KT+zb/9fbvsQihLTAwzlnOScQHmjsR7AtbZwielvg
 2QpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw1f0rzVL5EgVEDFNTlfAakB83r92CD8MKM/DAIzcUzUYFueShV4zNQrs2f2rdRS2XSV6yBbjoZZSV+lOxV47JOMMoPYpCG68FzooORCEU
X-Gm-Message-State: AOJu0YwP+okcqXgkl1MZtIFTR9+XwOmHG/qPcSNGFSV8O0A4e1uqGi/J
 rU5X6tYx4t4M5l+rKh9QQ1kvEa/FpxfVioKyLldLiX6O17CIgn7+XnNTwLF2m44=
X-Google-Smtp-Source: AGHT+IGGsFTli3nj+YE2FPUS/5bFOx0r5APvotTdEDODi/WPFZUTpdmBV3aQfoQ2trHnkKZgmmIsEg==
X-Received: by 2002:a17:906:3553:b0:a5a:893a:ad3d with SMTP id
 a640c23a62f3a-a5a893aae74mr1313186066b.7.1716295948747; 
 Tue, 21 May 2024 05:52:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a813cd3dasm981711366b.45.2024.05.21.05.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 05:52:27 -0700 (PDT)
Date: Tue, 21 May 2024 14:52:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 nerdopolis <bluescreen_avenger@verizon.net>,
 dri-devel@lists.freedesktop.org
Subject: Re: simpledrm, running display servers, and drivers replacing
 simpledrm while the display server is running
Message-ID: <ZkyZCmMU86nUV4TO@phenom.ffwll.local>
References: <9215788.EvYhyI6sBW.ref@nerdopolis2>
 <9215788.EvYhyI6sBW@nerdopolis2>
 <d8822317-db81-4179-93b8-18629a95af73@suse.de>
 <Zj3tvKayXdn2_JMq@gmail.com>
 <4710c7b9-d4e5-4eb9-9d69-d80c385deadf@suse.de>
 <Zj4c8Tk_zkzb9R48@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zj4c8Tk_zkzb9R48@gmail.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Fri, May 10, 2024 at 03:11:13PM +0200, Jonas Ådahl wrote:
> On Fri, May 10, 2024 at 02:45:48PM +0200, Thomas Zimmermann wrote:
> > Hi
> > 
> > > (This was discussed on #dri-devel, but I'll reiterate here as well).
> > > 
> > > There are two problems at hand; one is the race condition during boot
> > > when the login screen (or whatever display server appears first) is
> > > launched with simpledrm, only some moments later having the real GPU
> > > driver appear.
> > > 
> > > The other is general purpose GPU hotplugging, including the unplugging
> > > the GPU decided by the compositor to be the primary one.
> > 
> > The situation of booting with simpledrm (problem 2) is a special case of
> > problem 1. From the kernel's perspective, unloading simpledrm is the same as
> > what you call general purpose GPU hotplugging. Even through there is not a
> > full GPU, but a trivial scanout buffer. In userspace, you see the same
> > sequence of events as in the general case.
> 
> Sure, in a way it is, but the consequence and frequency of occurence is
> quite different, so I think it makes sense to think of them as different
> problems, since they need different solutions. One is about fixing
> userspace components support for arbitrary hotplugging, the other for
> mitigating the race condition that caused this discussion to begin with.

We're trying to document the hotunplug consensus here:

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#device-hot-unplug

And yes hotunplug is really rough on userspace, but if that doesn't work,
we need to discuss what should be done instead in general. I agree with
Thomas that simpledrm really isn't special in that regard.

> > > The latter is something that should be handled in userspace, by
> > > compositors, etc, I agree.
> > > 
> > > The former, however, is not properly solved by userspace learning how to
> > > deal with primary GPU unplugging and switching to using a real GPU
> > > driver, as it'd break the booting and login experience.
> > > 
> > > When it works, i.e. the race condition is not hit, is this:
> > > 
> > >   * System boots
> > >   * Plymouth shows a "splash" screen
> > >   * The login screen display server is launched with the real GPU driver
> > >   * The login screen interface is smoothly animating using hardware
> > >     accelerating, presenting "advanced" graphical content depending on
> > >     hardware capabilities (e.g. high color bit depth, HDR, and so on)
> > > 
> > > If the race condition is hit, with a compositor supporting primary GPU
> > > hotplugging, it'll work like this:
> > > 
> > >   * System boots
> > >   * Plymouth shows a "splash" screen
> > >   * The login screen display server is launched with simpledrm
> > >   * Due to using simpldrm, the login screen interface is not animated and
> > >     just plops up, and no "advanced" graphical content is enabled due to
> > >     apparent missing hardware capabilities
> > >   * The real GPU driver appears, the login screen now starts to become
> > >     animated, and may suddenly change appearance due to capabilties
> > >     having changed
> > > 
> > > Thus, by just supporting hotplugging the primary GPU in userspace, we'll
> > > still end up with a glitchy boot experience, and it forces userspace to
> > > add things like sleep(10) to work around this.
> > > 
> > > In other words, fixing userspace is *not* a correct solution to the
> > > problem, it's a work around (albeit a behaivor we want for other
> > > reasons) for the race condition.
> > 
> > To really fix the flickering, you need to read the old DRM device's atomic
> > state and apply it to the new device. Then tell the desktop and applications
> > to re-init their rendering stack.
> > 
> > Depending on the DRM driver and its hardware, it might be possible to do
> > this without flickering. The key is to not loose the original scanout
> > buffer, while not probing the new device driver. But that needs work in each
> > individual DRM driver.
> 
> This doesn't sound like it'll fix any flickering as I describe them.
> First, the loss of initial animation when the login interface appears is
> not something one can "fix", since it has already happened.
> 
> Avoiding flickering when switching to the new driver is only possible
> if one limits oneself to what simpledrm was capable of doing, i.e. no
> HDR signaling etc.

As long as you use the atomic ioctls (I think at least) and the real
driver has full atomic state takeover support (only i915 to my knowledge),
and your userspace doesn't unecessarily mess with the display state when
it takes over a new driver, then that should lead to flicker free boot
even across a simpledrm->real driver takeover.

If your userspace doesn't crash&burn ofc :-)

But it's a real steep ask of all components to get this right.

> > > Arguably, the only place a more educated guess about whether to wait or
> > > not, and if so how long, is the kernel.
> > 
> > As I said before, driver modules come and go and hardware devices come and
> > go.
> > 
> > To detect if there might be a native driver waiting to be loaded, you can
> > test for
> > 
> > - 'nomodeset' on the command line -> no native driver
> 
> Makes sense to not wait here, and just assume simpledrm forever.
> 
> > - 'systemd-load-modules' not started -> maybe wait
> > - look for drivers under /lib/modules/<version>/kernel/drivers/gpu/drm/ ->
> > maybe wait
> 
> I suspect this is not useful for general purpose distributions. I have
> 43 kernel GPU modules there, on a F40 installation.
> 
> > - maybe udev can tell you more
> > - it might for detection help that recently simpledrm devices refer to their
> > parent PCI device
> > - maybe systemd tracks the probed devices
> 
> If the kernel already plumbs enough state so userspace components can
> make a decent decision, instead of just sleeping for an arbitrary amount
> of time, then great. This is to some degree what
> https://github.com/systemd/systemd/issues/32509 is about.

I think you can't avoid the timeout entirely for the use-case where the
user has disable the real driver by not compiling it, and simpledrm would
be the only driver you'll ever get.

But that's just not going to happen on any default distro setup, so I
think it's ok if it sucks a bit.

Cheers, Sima

> 
> 
> Jonas
> 
> > 
> > Best regards
> > Thomas
> > 
> > > 
> > > 
> > > Jonas
> > > 
> > > > The next best solution is to keep the final DRM device open until a new one
> > > > shows up. All DRM graphics drivers with hotplugging support are required to
> > > > accept commands after their hardware has been unplugged. They simply won't
> > > > display anything.
> > > > 
> > > > Best regards
> > > > Thomas
> > > > 
> > > > 
> > > > > Thanks
> > > > > 
> > > > -- 
> > > > --
> > > > Thomas Zimmermann
> > > > Graphics Driver Developer
> > > > SUSE Software Solutions Germany GmbH
> > > > Frankenstrasse 146, 90461 Nuernberg, Germany
> > > > GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> > > > HRB 36809 (AG Nuernberg)
> > > > 
> > 
> > -- 
> > --
> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Frankenstrasse 146, 90461 Nuernberg, Germany
> > GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> > HRB 36809 (AG Nuernberg)
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
