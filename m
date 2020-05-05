Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324E51C5132
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DD86E558;
	Tue,  5 May 2020 08:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1776E558
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:48:56 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x25so1328039wmc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 01:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4xTTp/iEzUhMXhLONayQ7XtPfLOg/XcaBi/aLqdb2aQ=;
 b=QPbsjKI6PduvG1slUbiH8M50TSscondJNsgyuk4pUt6MDdr6OUQZLNgNQwu6Be+hJ/
 WR21Bo5VeHIwqcqY5ViyQ3TynDuKSktZeiTru3bX6Y9/bpTe1oFZgpvSt1ZCLlM5Hgs0
 em1JVnKBCe2DiDznYQldiRzzub/s2jSPd/ACo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4xTTp/iEzUhMXhLONayQ7XtPfLOg/XcaBi/aLqdb2aQ=;
 b=KjYSVV1pmPQEpjwebtORdBqoTa6/zLgzeXLYgVzc2gPQHHUavD816q7dtPx87BhIPk
 GKxatQ7xvkj8/edGj0GXPEm+AgMjj9Vj8MCI/f0aq+7Tm6Um2HH9/ATqeDOY6qlyOTDt
 M8esPznOREjvYE8TQZb1gMXkHZGbYCvNr8juZmk6HE35g/m5tRN/xCOvH4mTtX0Dks80
 wyy60iDSUcfKrDVw0br+lXDwTsDGHP7GIWtD+qN2A32oWNU7jo4GHzc1v4vAirYuk8Va
 5YzYqz6Pw5Xh0zCD+7swlYR5TzKnz5Qbl80BVU6OJoMtx5/XqE8++tfpPvVy9el4kOR6
 T2cw==
X-Gm-Message-State: AGi0PuaQZE2jL2UFG1wXb2oiLw9HvxlPPL/d9iNO3wMlF8wWlCyO/zRM
 W84XEyIccsAXRsVPkWcMxOUr8w==
X-Google-Smtp-Source: APiQypJogICR1lA7e8dqPXGNaWlzQ8xBW7a9emaXdKJ4by8EH+258IkpLRyCY+efu80516UZdGodRA==
X-Received: by 2002:a1c:1983:: with SMTP id 125mr2167355wmz.43.1588668535199; 
 Tue, 05 May 2020 01:48:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r20sm2526800wmh.26.2020.05.05.01.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 01:48:54 -0700 (PDT)
Date: Tue, 5 May 2020 10:48:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: Operating KMS UAPI (Re: RFC: Drm-connector properties managed by
 another driver / privacy screen support)
Message-ID: <20200505084852.GN10381@phenom.ffwll.local>
References: <20200421121552.GT3456981@phenom.ffwll.local>
 <20200421173300.3cd078f4@eldfell.localdomain>
 <CAKMK7uEr6eHfEuGfLU_JTk=fbo=FBcU_aasGwUTRACny7WeojQ@mail.gmail.com>
 <20200424113216.3b5d4e90@eldfell.localdomain>
 <20200428145157.GP3456981@phenom.ffwll.local>
 <20200429130754.311d7178@eldfell.localdomain>
 <20200430135323.GC10381@phenom.ffwll.local>
 <20200504124913.65f6087f@eldfell.localdomain>
 <CAKMK7uGEi6=SK8=943Eu2AVW9yhj=scTvjdguTYQKhXzyL4D4w@mail.gmail.com>
 <20200504152228.4885e26f@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504152228.4885e26f@eldfell.localdomain>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Christian Kellner <ckellner@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Nitin Joshi1 <njoshi1@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>,
 Benjamin Berg <bberg@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Refocusing on where I think we still have a bit a disconnnect.

On Mon, May 04, 2020 at 03:22:28PM +0300, Pekka Paalanen wrote:
> On Mon, 4 May 2020 13:00:02 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Mon, May 4, 2020 at 11:49 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > On Thu, 30 Apr 2020 15:53:23 +0200
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > I guess my point is, this is a lot bigger problem than just the
> > default state. This = vt switching that doesn't look horrible and
> > doesn't result in artifacts and issues on the new compositor.
> 
> I am interested in getting reliably to the same hardware state as you
> used to have before, either after reboots or after vt-switches. The
> transition does not have to be guaranteed to be smooth, but at the same
> time the restore policy should not exclude the possibility of a
> smooth transition.

So my point is kinda that if you want both, then the only way to get there
to have a very clear set of what's allowed to be left behind be the
outgoing compositor. For example:
- only primary plane
- only untiled
- no color transform magic
- ...

Imo this is a related problem to the save/restore topic, since if one
compositor does something the new one doesn't understand (e.g. tiled
buffers with modifiers, and new compositor doesn't use getfb2), then it's
going to break.

Similar, if the old compositor sets a new color transform property that
the new compositor doesn't understand, then you get a mess.

Blind restore handles the permanent mess issue, but it doesn't handle the
smooth transition issue. But both problems are of the "old compositor did
something the new compositor doesn't understand", hence why I chuck them
into the same bin. And the issue with a blind save/restore, or kernel
defaults, or any of the solutions proposed here is that they pretty much
guarantee non-smooth transitions, they only solve the permanent damange
part of the problem.

I think to solve both, we need some kind of proper compositor switching
protocol, e.g. using logind:
- old compositor transitions to the minimal config as specified somewhere
- logind forces all other properties to "defaults", whether that's
  restoring boot-up defaults or defaults obtained from the kernel or
  something else is tbd
- logind maybe even does a transition if there's multiple version of the
  protocol, e.g. v2 allows modifiers, v1 only untiled, so it'd need to do
  a blit to untiled if the new compositor only supports v1 switching
  protocol
- new compositor takes over, and can continue the smooth transition since
  it's a well-defined starting state with limited feature usage, _and_
  everything else is reset to "defaults"
 
I fear that if we only solve the "resets to defaults" issue then we can
draw ourselves into a corner for the smooth transition stuff, if e.g. the
wrong entity in the above dance forces the reset to defaults.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
