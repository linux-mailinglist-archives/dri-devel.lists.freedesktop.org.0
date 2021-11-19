Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B3C456CBC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 10:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4046EA49;
	Fri, 19 Nov 2021 09:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5366EA49
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 09:49:06 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id l25so23812086eda.11
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 01:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=M9v5/XdYpuZeIIcgl9q7bFmSNHM6pBUvrptoyvy0cMU=;
 b=dTXXkpZfl63wrfvj86ewtUj+CYLC3JFkrHWDDq6e2T5nLItmXq6QGMVlkNlsdDSLaq
 nNE1mXHnDU8x2rfni6zx6xtsKa+JHM0UQnJBQBPavVGuGesTfgKM8DqAVbwbuvM2qXjI
 SSTp6snHxfEl6Jz4Ecf/THBjD7X4dRVGgPf2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=M9v5/XdYpuZeIIcgl9q7bFmSNHM6pBUvrptoyvy0cMU=;
 b=o8Von1V78qMcA/W0QJS4waGcI9e8jt1YPzWg9Y1/T9LTiPUqWqtkYMhbl6H6GUYWId
 5N4fS3vExzYOimsvMs65jpZEUw9+cAo7ajCm3evLyhDEMBMHaFqcUH9fPRIqHtLQtk9g
 Pgn6/uAjgR+0RBwyS+T8jJkCUXBpPi3+0VkgBAiw2Nqc/Kt8pVjPthP/r3K14znSb+Hr
 aFBShG3qkh3qTOo0NXiXPIHyEO5Fi94NocxBDt1yEUvW8W5Wz6VdZIlKXrmQmYa4om/d
 dfxp17NFYCGLv025f2ApHgywM4w1q8WRdzC8n8HaH6C1auV8oJkS7HbJyoCC+/plJXHn
 tMBg==
X-Gm-Message-State: AOAM530+n4Bmd0N04mvOjJObIxruhWNnDP/xdKYmczics028b+R9gQNb
 zt6b3P6oLVSsl3kqt5gFz4+nwQ==
X-Google-Smtp-Source: ABdhPJwByHB0KgEJUuEAxyg29EN3Q28TK03EHzbMmKUrxMsquMRCWvPU26nFKGYlAH8xCv+u6FbUhw==
X-Received: by 2002:a05:6402:5188:: with SMTP id
 q8mr22079666edd.181.1637315345352; 
 Fri, 19 Nov 2021 01:49:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f22sm558533edf.93.2021.11.19.01.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 01:49:04 -0800 (PST)
Date: Fri, 19 Nov 2021 10:49:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Subject: Re: [PATCH v2] drm/fb-helper: Call drm_fb_helper_hotplug_event()
 when releasing drm master
Message-ID: <YZdzDh6oUpCEuXKz@phenom.ffwll.local>
References: <20211108153453.51240-1-jfalempe@redhat.com>
 <YYlJsmrlDH5yW6nf@phenom.ffwll.local>
 <5b9e4690-fe8c-b043-9a52-60c7f8a55ad8@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b9e4690-fe8c-b043-9a52-60c7f8a55ad8@mailbox.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 18, 2021 at 11:23:32AM +0100, Michel Dänzer wrote:
> On 2021-11-08 17:00, Daniel Vetter wrote:
> > On Mon, Nov 08, 2021 at 04:34:53PM +0100, Jocelyn Falempe wrote:
> >> When using Xorg/Logind and an external monitor connected with an MST dock.
> >> After disconnecting the external monitor, switching to VT may not work,
> >> the (internal) monitor sill display Xorg, and you can't see what you are
> >> typing in the VT.
> >>
> >> This is related to commit e2809c7db818 ("drm/fb_helper: move deferred fb
> >> checking into restore mode (v2)")
> >>
> >> When switching to VT, with Xorg and logind, if there
> >> are pending hotplug event (like MST unplugged), the hotplug path
> >> may not be fulfilled, because logind may drop the master a bit later.
> >> It leads to the console not showing up on the monitor.
> >>
> >> So when dropping the drm master, call the delayed hotplug function if
> >> needed.
> >>
> >> v2: rewrote the patch by calling the hotplug function after dropping master
> >>
> >> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> > 
> > Lastclose console restore is a very gross hack, and generally doesn't work
> > well.
> > 
> > The way this is supposed to work is:
> > - userspace drops drm master (because drm master always wins)
> > - userspace switches the console back to text mode (which will restore the
> >   console)
> > 
> > I guess we could also do this from dropmaster once more (like from
> > lastclose), but that really feels like papering over userspace bugs. And
> > given what a massive mess this entire area is already, I'm not eager to
> > add more hacks here.
> > 
> > So ... can't we fix userspace?
> 
> Sounds like the good old UMS days, when VT switching relied on user space doing the right things in the right order.
> 
> With KMS, surely the kernel needs to be able to get to a known good
> state from scratch when it's in control of the VT, no matter what state
> user space left things in.

Unfortunately not. When your in KD_GRAPHICS mode we explicitly tell fbcon
to shut up and not restore itself, and it shouldn't ever do that.

And afaik there's not really a holder concept for KD_TEXT/GRAPHICS, unlike
the drm master which signifies ownership of kms resources.

Which sucks ofc, but fixing this would mean we need to retrofit ownership
into VT somehow, so that ownership is auto-dropped like drm_master on
close()/exit(). Not sure that's possible without breaking uapi (e.g. with
logind I think it's logind also doing the KD_TEXT/GRAPHICS dance, but
didn't check).

But if we'd have some kind of real ownership for KD_GRAPHICS then we could
tie that to the implied/weak drm_master status of fbdev emulation and make
this work correctly. But as-is the kernel simply doesn't have enough
information to dtrt. Or at least I'm not seeing how exactly, without just
trying to make guesses what userspace wants to do.

Either way I think we need to really clearly spell out how this is all
supposed to work, and not just add random bandaids justified with "works
for me". It is already a byzantine mess as-is.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
