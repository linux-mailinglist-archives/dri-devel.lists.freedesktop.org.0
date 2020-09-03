Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26F325BE5A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 11:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFFD6E96F;
	Thu,  3 Sep 2020 09:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EDC6E96F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 09:20:55 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a17so2371665wrn.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 02:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GU3OF5beHFAs1Xb5+hR/AYQEeB05kzzuVQYw0PVXkZY=;
 b=hx3SjoXOtY4ytm3X2qgKF3gELk9BTgub/u0mzGU2uMg0NNxqwbEJ4S5lwt0XBodghe
 W+etxtVB016uaGusZ8/vqIUWTWbmAGmAJrD1laMVDe2ndUn2GLU7uD+0oDGpxmVCQfSM
 I5oiuWe1zioHUIvF4fhz4hjdpKi2ZiBPvmoOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GU3OF5beHFAs1Xb5+hR/AYQEeB05kzzuVQYw0PVXkZY=;
 b=mG+E3pYZGWTdMJGer6SCZoLB08PxhWOSqdJjvT3aZr4adlpd0Nn8K7dOxsXkWj2I7I
 1M+mcKk9FQrc72g9/yAM7YZrAukWHudn0qvOz/KU7rIe+FFdgatzterRUbgFNyc3UUpt
 nGmF2bK3O2ZH2UvpSfRT5pvdsUZGCHEc2uVUeLJHV0lLGorqWW5G8MehNy5NBPatXJou
 sZ0NkofzXwDf5x5uqLSHzwizQtnkLLslv35nec3nPXP+5pVWDUajgEX4v8kyrTjWNpre
 ufQtz2DCUNxg4XUbNiXOPcPJL7LiWy1YDrvcZRXI33d+gykxqBUMYAoY5QhZVVeXVdLb
 JjWg==
X-Gm-Message-State: AOAM531ejNdSAW73rHMIRbg9x584NUHTdlY0YTIQNr2Jy/r0w+lDcIt0
 lEYec1i9/fgsUBgWMeXs3L65aw==
X-Google-Smtp-Source: ABdhPJxwDecXSI0EjGDi1uFxWS4yEG5O+bHICw4SmqpOHlcmT5aWDaRPZB28OiQq0nZBhmKKMdq3IQ==
X-Received: by 2002:adf:9e90:: with SMTP id a16mr1513983wrf.40.1599124853610; 
 Thu, 03 Sep 2020 02:20:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o124sm3290671wmb.2.2020.09.03.02.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 02:20:52 -0700 (PDT)
Date: Thu, 3 Sep 2020 11:20:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Dadap <ddadap@nvidia.com>
Subject: Re: How to address individual vga-switcheroo muxes on systems with
 multiple muxes
Message-ID: <20200903092050.GK2352366@phenom.ffwll.local>
References: <bfa0e1e9-2ecf-e1d7-1a6f-71c2f7b01c7a@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bfa0e1e9-2ecf-e1d7-1a6f-71c2f7b01c7a@nvidia.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 02, 2020 at 12:50:18PM -0500, Daniel Dadap wrote:
> Hi all,
> 
> 
> Some time ago, I asked some questions about how to handle issues with DRM
> drivers attempting to touch eDP while muxed away, due to implicit
> assumptions about eDP being permanently connected. I've proposed some
> changes which prevent eDP access on switched-away eDP outputs for at least
> i915, but now I'd like to follow up on one of the topics that was brought up
> during that previous conversation: namely, how to deal with systems with
> multiple mux devices, where it may be desirable to address the muxes
> independently of each other. Currently, the apple-gmux driver seems to
> support multiple muxes by just switching them in sync with each other,
> exposing only one logical mux device to the vga-switcheroo subsystem to
> control both physical muxes.
> 
> 
> Since then, I've proposed a driver for a mux that is present on some
> upcoming notebook designs, some of which have distinct muxes for internal
> and external display connections [1]. I don't believe any of these systems
> are available publicly just yet, but it's only a matter of time before they
> are. During the previous discussion, I believe Daniel Vetter stated that the
> ability to address multiple muxes is something that could be addressed when
> designing a "proper" userspace API for vga-switcheroo (i.e., not debugfs),
> so I'd like to get the conversation started on how we could go about
> designing this API.

I think roughly the pieces we need:

- exposing each mux in sysfs somehow, probably needs a new class for
  these. We probably also want some flags and stuff about how the mux
  works, if that has userspace visible impact. Stuff like whether the mux
  is delayed (gpu level mux wait for all users to close, and iirc your new
  driver even waits for a reboot), or immediate (I think the display muxes
  work like that, i.e. gpu will immediate get some hotplug notification
  and active use will not stop the switch).
- add links from each drm connector (those are already in sysfs) to the
  mux controlling it.
- for muxes that also control the entire gpu power supply I think we also
  want a link from the overall drm device to the mux, so that userspace
  can realize it'll whack the entire gpu if it touches that mux.

Locking for all this is likely going to be a nightmare, and I have no idea
what it should look like :-/

I'm also not sure whether anything like the above already exists and would
make sense to reuse for e.g. the mux class.
-Daniel

> 
> 
> [1] https://patchwork.kernel.org/patch/11751453/
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
