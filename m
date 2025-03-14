Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BC1A60BE8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 09:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E274E10E346;
	Fri, 14 Mar 2025 08:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="LisimSm7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA7410E34F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 08:40:03 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso1883040f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 01:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741941602; x=1742546402; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zTD8i7ehrtWGXAGvlrD7ICGK3PvUyLJ6pHY0HnCJJW4=;
 b=LisimSm7Up1EdP8hrWzqtYT3sYEZ9JBXFTvYJ1DSWC8z5L6AKdI3iorxkMlHWd6Ovs
 rVNSGXP+2hkpM9HqX3swyvAE+YutoaaDohtPRPz6Do/Lud812mZML1LFCN/bar5H11Lc
 qOQMbRzTvrJVn9gZkPyqVP1c+gpHtwqyuVOqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741941602; x=1742546402;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zTD8i7ehrtWGXAGvlrD7ICGK3PvUyLJ6pHY0HnCJJW4=;
 b=CmelE1U790SEFfDu0sJPre+2O7W5t+LKhc+HMsb8G0Myimvrhw8kCScAG6ffoxCCap
 Y2TXlB4k9FB36qp+EaJvqYVfoDmor29EUedKZOft16z9xxezGRW9RN5BJ2V8xcpOheOL
 YoGEEysTeFbSeKeyEwXlwOx/ZzK2Oc0hs3Gz3JXX18p++Hp/QvjMseHvnzbxgmjncuCq
 apavSL+lR2Y8Y5gswW4rLeNhFGu1sv4K6RkjbSlT+tvZqcRcBDQxohg5qjgPCrOl8vLx
 i8XGjCsEp6L4YiLs3i90bsyWUqM/Y8nLOUYdBoL087pGRiQc4YppmY9TkB7Cc3R8L0nA
 EReg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8dCC2P7qzHDD8RmlXBm6YrbojmaRqPD7TRdd5z26+1xK8yaiYPNs4YFHwO4MTMADeOzc6d7WF+3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMzK7vyND0vIY3Uroa8PdlTeWEwxsvIaDyPTYNGo4EcppD8MPp
 2k2bjB3HbJpU5tqSAKBdxxKWNHRXm9U1EgAfjEArOuHOJKXz04NEORwHQXH6Kx8=
X-Gm-Gg: ASbGncvcDtQYtXzvOefEE1HN/6GwUJMUN+IzJOTh2Npc8JxD6me2CUHd7EJLF0QjQbT
 2LuMqLZVFpN3lNxKfN7LVs1ZkNVqxOhQ5Pyf7MEOa/ydf9HgAEkdRjxWyJDjmRC1p79TATxPk5p
 SPHJT+gfBzq74DbEcLZWPkyCOWGENPUgIInW2UNB0tBfdC7tahVi7icc9M4H6q+DK8Buj0jpLys
 gvSra1IAyUEUhAvrpXHkAZNaoCYI41qB5sRoEWt/slmZcUEJBAWyA0Au33QapzWWIloeDc9vmcL
 8Znz4DXfZy8kdkhXBIDs8LpfAEAdKwQUcOxzokGHtlwa7+nWgK/RoOZ7
X-Google-Smtp-Source: AGHT+IF3El0IcCegrk7kxsLbPhk6T5yA/RlbcCrLwdVepuvGVFRDQsO8rTnEsFvIbEpHMtRzd+Cu8w==
X-Received: by 2002:a5d:64e8:0:b0:390:df83:1f22 with SMTP id
 ffacd0b85a97d-395b9b10ed6mr5683819f8f.25.1741941601570; 
 Fri, 14 Mar 2025 01:40:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffbfa90sm9932745e9.16.2025.03.14.01.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 01:40:00 -0700 (PDT)
Date: Fri, 14 Mar 2025 09:39:59 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Lee Jones <lee@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, pavel@ucw.cz,
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 00/11] backlight, lcd, led: Remove fbdev dependencies
Message-ID: <Z9PrX6Qz4io3M9xs@phenom.ffwll.local>
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250313165151.GE3645863@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313165151.GE3645863@google.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Thu, Mar 13, 2025 at 04:51:51PM +0000, Lee Jones wrote:
> On Thu, 06 Mar 2025, Thomas Zimmermann wrote:
> 
> > This series removes the remaining dependencies on fbdev from the
> > backlight, lcd and led subsystems. Each depends on fbdev events to
> > track display state. Make fbdev inform each subsystem via a dedicated
> > interface instead.
> > 
> > Patches 1 to 3 make fbdev track blank state for each display, so that
> > backlight code doesn't have to.
> > 
> > Patches 4 to 6 remove fbdev event handling from backlight code. Patches
> > 7 and 8 remove fbdev event handling from lcd code and patches 9 and 10
> > do the same for led's backlight trigger.
> > 
> > The final patch removes the event constants from fbdev.
> > 
> > With the series applied, the three subsystems do no longer depend on
> > fbdev. It's also a clean up for fbdev. Fbdev used to send out a large
> > number of events. That mechanism has been deprecated for some time and
> > converted call to dedicated functions instead.
> > 
> > Testing is very welcome, as I don't have the hardware to test this
> > series.
> > 
> > v3:
> > - export several symbols
> > - static-inline declare empty placeholders
> > v2:
> > - avoid IS_REACHABLE() in source file (Lee)
> > - simplify several interfaces and helpers
> > - use lock guards
> > - initialize global lists and mutices
> > 
> > Thomas Zimmermann (11):
> >   fbdev: Rework fb_blank()
> >   fbdev: Track display blanking state
> >   fbdev: Send old blank state in FB_EVENT_BLANK
> >   backlight: Implement fbdev tracking with blank state from event
> >   backlight: Move blank-state handling into helper
> >   backlight: Replace fb events with a dedicated function call
> >   backlight: lcd: Move event handling into helpers
> >   backlight: lcd: Replace fb events with a dedicated function call
> >   leds: backlight trigger: Move blank-state handling into helper
> >   leds: backlight trigger: Replace fb events with a dedicated function
> >     call
> >   fbdev: Remove constants of unused events
> > 
> >  drivers/leds/trigger/ledtrig-backlight.c |  48 +++++-----
> >  drivers/video/backlight/backlight.c      |  93 +++++--------------
> >  drivers/video/backlight/lcd.c            | 108 +++++++++--------------
> >  drivers/video/fbdev/core/fb_backlight.c  |  12 +++
> >  drivers/video/fbdev/core/fb_info.c       |   1 +
> >  drivers/video/fbdev/core/fbmem.c         |  82 ++++++++++++++---
> >  drivers/video/fbdev/core/fbsysfs.c       |   8 +-
> >  include/linux/backlight.h                |  22 ++---
> >  include/linux/fb.h                       |  12 +--
> >  include/linux/lcd.h                      |  21 ++++-
> >  include/linux/leds.h                     |   6 ++
> >  11 files changed, 205 insertions(+), 208 deletions(-)
> 
> No immediately obvious issues from the LEDs side.
> 
> Still needs reviews from Backlight and fbdev.

I looked throught the series and it's a small step, but I think it's the
right direction for where we want backlight/fbdev/drm-kms to head towards
long-term. So on the series:

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima

> 
> -- 
> Lee Jones [李琼斯]

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
