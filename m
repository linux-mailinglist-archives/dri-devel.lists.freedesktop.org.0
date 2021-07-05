Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67D33BC3A8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 23:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5FF898BC;
	Mon,  5 Jul 2021 21:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B61898BC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 21:29:56 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id w13so12210502wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jul 2021 14:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DTN8bCbDwjO89bPKxxvXHBdJS09GqhwSe1EkHMOagRk=;
 b=G3HKjdYiuP0q+kmPsoBvi49hjHdop6kq67iBuL3kc1L8obIRQxR/fg+SpbTln6sast
 JLmLxn+V2lPu8iHY4Xy4/1wcckQsB0rOXDOUN+qFIzuOddw/UxZ8tzevUMZK+Y5rRSze
 2uwh+hs+RFpBqqI7P43Kmo2ZMraHRsIAfkZOMYQ6ezSkn0JwCQrhCLekB2D0CM2GjlaA
 XBMr/k+bGwQZymlQbcnm5R2MA0pgXqqF2N/yVDxUVTcs07akJ9UUGvbzBy3ZFSr8YwS0
 Dz++ZQdXmiPWpcFUhCfccyA4aFlA+8nz7/XzEJm9kwm+a1/wj7WrXkUqcGSywQla2RMb
 r0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DTN8bCbDwjO89bPKxxvXHBdJS09GqhwSe1EkHMOagRk=;
 b=Qd6C5MWkqIB17oK8Yg+CPNzq+giry7C+mQYCEctiY1G7ynFEKqJnPVAmWe9Ar6ZE4o
 HtlKGSWXHMZeC/Qym9UMwk6uOS+nZ6ZADMOYutUQsFbjf2StsfNlg6oRcTtkijwr6bTd
 z4hsBQYJdQLt20hIlUGHrHOu7Z+1Kt0DLqGh8lHc0tJdOxBTI7r+HvlICVIEYRFGgP2P
 1tmAhZlDdSvMxWXiZscBj9ZfFuCK8PQh5T174PRmTa80uvMlUc4uvfXpi5O39FCIyX5Q
 YZFbXnqx0/fOvd9m9/eAGv9Ktf9gUSWCDXcHiYvaY0FChl4z+vzcpjSFObY/9P2y+PUn
 3xyA==
X-Gm-Message-State: AOAM531MYP7pkcvtQi/Rk1DIcBgtPu5+AO8VAuaOG3Zv9P7byCHTJSVl
 uPVtD+z6qIZpLXCOVdWADdY=
X-Google-Smtp-Source: ABdhPJxP5ChjlE1m2vy5/kOWGLSJPYzmx+l61b21887Q+rbjstNRrHdeK76zeWh5couRO+oZVCanPw==
X-Received: by 2002:a05:600c:1c93:: with SMTP id
 k19mr15154734wms.125.1625520595011; 
 Mon, 05 Jul 2021 14:29:55 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id g15sm14181433wrs.50.2021.07.05.14.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 14:29:54 -0700 (PDT)
Date: Mon, 5 Jul 2021 22:29:45 +0100
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
Message-ID: <20210705212945.qwwrrbxe5ygotycf@smtp.gmail.com>
References: <20210705074633.9425-1-tzimmermann@suse.de>
 <YOLQbp7m7ggecg05@phenom.ffwll.local>
 <246a3772-b632-c7c1-c1ec-5ac1277f7525@suse.de>
 <YOMVFi3q/JSoZ+p9@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOMVFi3q/JSoZ+p9@phenom.ffwll.local>
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
Cc: airlied@linux.ie, hamohammed.sa@gmail.com, dri-devel@lists.freedesktop.org,
 rodrigosiqueiramelo@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/05, Daniel Vetter wrote:
> On Mon, Jul 05, 2021 at 12:05:28PM +0200, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 05.07.21 um 11:27 schrieb Daniel Vetter:
> > > On Mon, Jul 05, 2021 at 09:46:29AM +0200, Thomas Zimmermann wrote:
> > > > Vkms copies each plane's framebuffer into the output buffer; essentially
> > > > using a shadow buffer. DRM provides struct drm_shadow_plane_state, which
> > > > handles the details of mapping/unmapping shadow buffers into memory for
> > > > active planes.
> > > > 
> > > > Convert vkms to the helpers. Makes vkms use shared code and gives more
> > > > test exposure to shadow-plane helpers.
> > > > 
> > > > Thomas Zimmermann (4):
> > > >    drm/gem: Export implementation of shadow-plane helpers
> > > >    drm/vkms: Inherit plane state from struct drm_shadow_plane_state
> > > >    drm/vkms: Let shadow-plane helpers prepare the plane's FB
> > > >    drm/vkms: Use dma-buf mapping from shadow-plane state for composing
> > > 
> > > So I think right now this fits, but I think it'll mismit going forward: We
> > > don't really have a shadow-plane that we then toss to the hw, it's a
> > > shadow-crtc-area. Right now there's no difference, because we don't
> > > support positioning/scaling the primary plane. But that's all kinda stuff
> > > that's on the table.
> > > 
> > > But conceptually at least the compositioning buffer should bet part of the
> > > crtc, not of the primary plane.
> > > 
> > > So not sure what to do, but also coffee hasn't kicked in yet, so maybe I'm
> > > just confused.
> > 
> > I'm not sure if I understand your concern. Can you elaborate? The
> > compositing output buffer is not affected by this patchset. Only the input
> > frambuffers of the planes. Those are shadow buffers. AFAICT the composer
> > code memcpy's the primary plane and then blends the other planes on top.
> > Supporting transformation of the primary plane doesn't really change much
> > wrt to the vmaping of input fbs.
> 
> Yeah that's the current implementation, because that's easier. But
> fundamentally we don't need a copy of the input shadow plane, we need a
> scratch area that's sized for the crtc.

Maybe I'm missing something, but I am not sure the relevance for vkms to
switch to shadow-buffered plane. (?)

Btw, in terms of code changes, it works well and also vmap error stops
to happen (reported in the last update of todo list). This fix seems to
be a side-effect because it replaces the vkms_prepare_fb that got
problematic since (I guess) the last switch to shmem. 

Thanks,
Melissa

> So if the primary plane is smaller than the crtc window (because we use
> plane hw for compositing, or maybe primary plane shows a vidoe with black
> borders or whatever), then the primary plane shadow isn't the right size.
> 
> And yes this means some surgery, vkms isn't there yet at all. But still it
> would mean we're going right here, but then have to backtrack before we
> can go left again. So a detour.
> 
> Also I don't think any other driver will ever need this, you really only
> need it when you want to composite planes in software - which defeats the
> purpose of planes. Except when the goal of your driver is to be a software
> model.
> -Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
