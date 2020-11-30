Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 929662C8869
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 16:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C236E4C9;
	Mon, 30 Nov 2020 15:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC5D6E4C9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 15:41:52 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t4so16753988wrr.12
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 07:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5uwbd32nMoGasvv4Rb1SYFn9FAHpSeMQI2GqF7/ClB8=;
 b=VwQzQyaaaEAkhG0uP6JstBj0Ne46sEfpbP0AFJ3lWiA++4MlZwdX9VmPAP/xVurdUF
 qX4WHN6t+fCPaRR5ufvVvHLQKuKNE081OxBIgwTEwj5VvwIYDSzQKKh5FsGvpPpWEmKw
 0A++XINBdb/kUTZnGevAnk66MzpDarVS0veEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5uwbd32nMoGasvv4Rb1SYFn9FAHpSeMQI2GqF7/ClB8=;
 b=XPk8lty7/S9kUeYMotv9FdeLR+WGelr5ZuyhmM7RrhXjkzt4ELLcnkg0GXH23WH/XA
 04A7zHvR6O2Ie3RWayutj360RVfePL9fn329omviFVBwSgvauvI0tHX2iP2o+EyeYJv9
 872lIHVtY6EnobNVsi8+EAfEVy12S6vknxERnVGl0MzaWAysLd76B9yzAD8rzjeWSqt9
 +GLE/l13aMlYc2UzOSJKty8ExrZ0C9I+QI8MERrxfYTI//s5HTZUwNCeChpAWh5EfDpm
 sE/51fJ+EXlf4j5Uo565guDQLtHk5QsSA3ULJOvaME5J2WfTb8VUO6C2W3W8lkWwtuAB
 iUmA==
X-Gm-Message-State: AOAM532lqpK8Z8UoVvWYofnoYEWxJXuFT61pDhqv7pDlSlGQSsDZBi1U
 XIubTEgF3VCUFNvN7KRpIOfKmA==
X-Google-Smtp-Source: ABdhPJzbQ7wIr8vjKUp/Fu7xmk4z5hzYG4AZXWX3oC/JPVbzbr6768nAjbVpzfmu5NcRVdZ7xSbXYA==
X-Received: by 2002:a5d:560e:: with SMTP id l14mr28887320wrv.191.1606750910237; 
 Mon, 30 Nov 2020 07:41:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k11sm18921870wmj.42.2020.11.30.07.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 07:41:49 -0800 (PST)
Date: Mon, 30 Nov 2020 16:41:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH] fbdev: Remove udlfb driver
Message-ID: <20201130154147.GT401619@phenom.ffwll.local>
References: <20201130125200.10416-1-tzimmermann@suse.de>
 <alpine.LRH.2.02.2011300843270.29199@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.2011300843270.29199@file01.intranet.prod.int.rdu2.redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, geert+renesas@glider.be,
 linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch, corbet@lwn.net,
 bernie@plugable.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 30, 2020 at 09:31:15AM -0500, Mikulas Patocka wrote:
> 
> 
> On Mon, 30 Nov 2020, Thomas Zimmermann wrote:
> 
> > Udlfb has been superseded by DRM's udl. The DRM driver is better by
> > any means and actively maintained. Remove udlfb.
> 
> Hi
> 
> I am using udlfb and it's definitely better than the DRM driver. The DRM 
> driver will crash the kernel if you unplug the device while Xorg is 
> running. The framebuffer driver doesn't crash in this case. (I have a cat 
> and the cat sometimes unplugs cables and I don't want to reboot the system 
> because of it :-)

This should be a lot better in recent kernels, there's been tons of fixes
for drm hotunplug. Might be there's still bugs in the drm/udl driver.

> The framebuffer driver is faster, it keeps back buffer and updates only 
> data that differ between the front and back buffer. The DRM driver doesn't 
> have such optimization, it will update everything in a given rectangle - 
> this increases USB traffic and makes video playback more jerky.
> 
> The framebuffer driver supports programs running full-screen directly on 
> the framebuffer console, such as web browser "links -g", image viewer 
> "fbi", postscript+pdf viewer "fbgs", ZX Spectrum emulator "fuse-sdl", 
> movie player "mplayer -vo fbdev". The DRM driver doesn't run them.

Hm this should in general work on drm drivers. Without that it's clear the
switch-over isn't really ready yet.

> If you seach for someone to maintain the framebuffer driver, I can do it.

We're looking for people to port the missing features over to the drm
drivers. The problem is that fbdev is full of security bugs, and we're
fixing them by removing the features. So that's why there's some push to
sunset at much as possible.
-Daniel

> 
> Mikulas
> 
> 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  CREDITS                      |    5 +
> >  Documentation/fb/index.rst   |    1 -
> >  Documentation/fb/udlfb.rst   |  162 ---
> >  MAINTAINERS                  |    9 -
> >  drivers/video/fbdev/Kconfig  |   17 +-
> >  drivers/video/fbdev/Makefile |    1 -
> >  drivers/video/fbdev/udlfb.c  | 1994 ----------------------------------
> >  7 files changed, 6 insertions(+), 2183 deletions(-)
> >  delete mode 100644 Documentation/fb/udlfb.rst
> >  delete mode 100644 drivers/video/fbdev/udlfb.c
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
