Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F90929533E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 22:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8356E116;
	Wed, 21 Oct 2020 20:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C5D6E116
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 20:05:31 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j7so4411632wrt.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 13:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9JOVUoz2f6BJO86fGiUCXTpdXF5I7iO5hAwJPKQhHBA=;
 b=MvitVHjiguP7V/0VQpwYqijh11GJ4ddLz3TUtYIHqsIxpoPiXWPL9psK/VWJZ9rCKz
 vpqRnX8MsbOPNVsLsPVZVnJs2//mVvuhYgAWfKvA4hzAmFihB41IOx5WGl3XN4QF4f+C
 XXyOQ/oD0+t7ZOP9zigABYWBv/UeHLdX4g688=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9JOVUoz2f6BJO86fGiUCXTpdXF5I7iO5hAwJPKQhHBA=;
 b=RBjsa4ALCUtdRC+a3Lq5Ton8hJnge+ualgFTWgcyfIfju6NvvUx60RUV+/t38uD9ae
 AkB4Bqd5pXVDFX3MraJdRYU0zGIRwaQqVzVRxdOTFSbB/vBV6IjFBHNrPDKmLbwlLKHE
 BAjUXrwINhoF3Asspe0v2JnnikLF0ZzDw6kmKq5A+EQT+Su8kAMKpSQ1aG+KIlcs8kYn
 ymDQaUdGrdmavEWj8WRWikqPUuu/AACUbKMdI1cSYOZjTqnyiIuZTsPs6zmizSdof/RR
 SDrf4vXiEvpByeOQH3aVi/0P93vGPLcfoiYXmhg7VCRMnaUFZArdVkli46sHGq6woA+s
 cCAQ==
X-Gm-Message-State: AOAM532um/0+LWAxx7E7e14z1sE7ZSEDuzdEEmYEwclEBMTSc5ZxNEu4
 sbO53LiGCo1Y2atWvFDC75n4vA==
X-Google-Smtp-Source: ABdhPJy2fp0K0v/lreVzRbHddMXqZXQ1nQfpoVSwIJuLL6E5pOxUso8/fgcz7DpluZqbhk1L5be2yQ==
X-Received: by 2002:adf:fd07:: with SMTP id e7mr6239036wrr.377.1603310729841; 
 Wed, 21 Oct 2020 13:05:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a199sm5591385wmd.8.2020.10.21.13.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 13:05:29 -0700 (PDT)
Date: Wed, 21 Oct 2020 22:05:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/3] drm: Store USB device in struct drm_device
Message-ID: <20201021200527.GR401619@phenom.ffwll.local>
References: <20201021130732.4048-1-tzimmermann@suse.de>
 <20201021200129.GQ401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021200129.GQ401619@phenom.ffwll.local>
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
Cc: airlied@linux.ie, hdegoede@redhat.com, dri-devel@lists.freedesktop.org,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 21, 2020 at 10:01:29PM +0200, Daniel Vetter wrote:
> On Wed, Oct 21, 2020 at 03:07:29PM +0200, Thomas Zimmermann wrote:
> > The drivers gm12u320 and udl operate on USB devices. They leave the
> > PCI device in struct drm_device empty and store the USB device in their
> > own driver structure.
> > 
> > Fix this special case and save a few bytes by putting the USB device
> > into an anonymous union with the PCI data. It's expected that DRM
> > core and helpers only touch the PCI-device field for actual PCI devices.
> 
> Uh no.
> 
> If you're really concerned about the 8 bytes wasted, use drm_device->dev
> instead, and upcast it to the usb device. I think some drivers do this
> already (at least on the platform side iirc).
> 
> But we had this entire drm_bus midlayer stuff already, and it took forever
> to sunset it. I don't want to go back, and saving 8 bytes in a giantic
> structure isn't worth that risk imo.

Typing this I realized that we could even move the pdev pointer to the
legacy chunk of drm_device. Instead of checking for drm_device->pdev we
could instead check for dev_is_pci(drm_device->dev) in the 1-2 core code
places.

But it's a pile of churn to roll that out to drivers, and I'm not sure the
8 bytes saved is even close to paying for that huge effort.
-Daniel

> > Thomas Zimmermann (3):
> >   drm: Add reference to USB device to struct drm_device
> >   drm/tiny/gm12u320: Store USB device in struct drm_device.udev
> >   drm/udl: Store USB device in struct drm_device.udev
> > 
> >  drivers/gpu/drm/tiny/gm12u320.c     | 52 +++++++++++++----------------
> >  drivers/gpu/drm/udl/udl_connector.c |  8 ++---
> >  drivers/gpu/drm/udl/udl_drv.c       |  2 +-
> >  drivers/gpu/drm/udl/udl_drv.h       |  1 -
> >  drivers/gpu/drm/udl/udl_main.c      | 15 +++++----
> >  include/drm/drm_device.h            | 21 ++++++++----
> >  6 files changed, 52 insertions(+), 47 deletions(-)
> > 
> > --
> > 2.28.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
