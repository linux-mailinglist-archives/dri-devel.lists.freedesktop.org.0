Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AAC21EC6C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 11:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A36B88697;
	Tue, 14 Jul 2020 09:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B00288697
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 09:13:39 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f139so4220285wmf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 02:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9Pqx/9lkzvh5WKoy2o32ZODIaPfaEwhPcr7+MvK0JLI=;
 b=WEmPKl4FjBTIn0aomMPp7w+X8d/FEsVAv++fuq3P9xc3r87+Pqey830PDSApGhlALv
 7pwdzfizssuQlmE0yFquCuMLj9J4YWorVDXrJLwWIXNmGzHq24ahi9Gr8H3A+rRDG5Ne
 mmUJngtpcM3oUVJzKcRnppID1QBoPuw4mPCCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9Pqx/9lkzvh5WKoy2o32ZODIaPfaEwhPcr7+MvK0JLI=;
 b=fp0Z9F+AyxHHVe3IIZOdWO9mFhZAuteS/NN1HC8kVws2szo5pAqV3vJhkH/7uNZqac
 No1ENiT2amh1OqHrUhc4SumtLJVVKl9J4Smexwh7VKH9YHQyiJAp5XbSsG2zP0z2Z8Lm
 i/aGknOStR1TrPxM2ouqwlINm0tV+fSZmOo+7FyzSVLsoPSH527JtiHNokwmfMFxW51k
 CRzWQkgHvz9Of/Jcm2urap8vWiEVEdHncF9WTRxQYlqPty1IE3dpiwDR5QmYmmZL9pAZ
 bpKsY+Pc2MXmZDpGLofTvnWitxMCUCnE/jIog0dY47WeZXnLddm+GiOab7DmFtjXFl/m
 EgUg==
X-Gm-Message-State: AOAM533qDSg+FAjGh9+32P6JSMDTLlb+Q8xA2g+0ZZazEwpA09AE25rg
 r5H3C0rIXoxVWmgec6IK7SxY6g==
X-Google-Smtp-Source: ABdhPJy4wnELZR5Eh4ZFB+kjIYJnpY/MZyMZokn6shny1yfqigdUl2UIpBotGyCtfwXIA//k/H/hGw==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr3246206wmc.109.1594718018463; 
 Tue, 14 Jul 2020 02:13:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y7sm27516915wrt.11.2020.07.14.02.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 02:13:37 -0700 (PDT)
Date: Tue, 14 Jul 2020 11:13:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/2] drm/virtio: Remove open-coded commit-tail function
Message-ID: <20200714091335.GY3278063@phenom.ffwll.local>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <20200709123339.547390-2-daniel.vetter@ffwll.ch>
 <20200709140531.GA220817@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709140531.GA220817@ravnborg.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 09, 2020 at 04:05:31PM +0200, Sam Ravnborg wrote:
> On Thu, Jul 09, 2020 at 02:33:39PM +0200, Daniel Vetter wrote:
> > Exactly matches the one in the helpers.
> > 
> > This avoids me having to roll out dma-fence critical section
> > annotations to this copy.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: virtualization@lists.linux-foundation.org
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_display.c | 20 --------------------
> >  1 file changed, 20 deletions(-)
> Very nice catch:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Patch applied, thanks for reviewing.

> > 
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
> > index f3ce49c5a34c..af55b334be2f 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> > @@ -314,25 +314,6 @@ virtio_gpu_user_framebuffer_create(struct drm_device *dev,
> >  	return &virtio_gpu_fb->base;
> >  }
> >  
> > -static void vgdev_atomic_commit_tail(struct drm_atomic_state *state)
> > -{
> > -	struct drm_device *dev = state->dev;
> > -
> > -	drm_atomic_helper_commit_modeset_disables(dev, state);
> > -	drm_atomic_helper_commit_modeset_enables(dev, state);
> > -	drm_atomic_helper_commit_planes(dev, state, 0);
> > -
> > -	drm_atomic_helper_fake_vblank(state);
> > -	drm_atomic_helper_commit_hw_done(state);
> > -
> > -	drm_atomic_helper_wait_for_vblanks(dev, state);
> > -	drm_atomic_helper_cleanup_planes(dev, state);
> > -}
> > -
> > -static const struct drm_mode_config_helper_funcs virtio_mode_config_helpers = {
> > -	.atomic_commit_tail = vgdev_atomic_commit_tail,
> > -};
> > -
> >  static const struct drm_mode_config_funcs virtio_gpu_mode_funcs = {
> >  	.fb_create = virtio_gpu_user_framebuffer_create,
> >  	.atomic_check = drm_atomic_helper_check,
> > @@ -346,7 +327,6 @@ void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
> >  	drm_mode_config_init(vgdev->ddev);
> >  	vgdev->ddev->mode_config.quirk_addfb_prefer_host_byte_order = true;
> >  	vgdev->ddev->mode_config.funcs = &virtio_gpu_mode_funcs;
> > -	vgdev->ddev->mode_config.helper_private = &virtio_mode_config_helpers;
> >  
> >  	/* modes will be validated against the framebuffer size */
> >  	vgdev->ddev->mode_config.min_width = XRES_MIN;
> > -- 
> > 2.27.0
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
