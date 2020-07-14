Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C44F521EB8D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 10:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C206E25B;
	Tue, 14 Jul 2020 08:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0696E110
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 08:39:20 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q15so3759330wmj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 01:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wWL0p/Vwv0P0ZyYXD3ZMaH3SKBU8WIQHi3HTc/T6A9w=;
 b=ebQ0MwriHk720YK7jpRkgDh2q1K2tVmNTC1YJBlS9yxg5jlb36yjp65sCLFR8BptZ1
 yZjZyyJaO41YaqFoM6++oKXxdeZXDR1ZfvX30KrXnQzzpONVPuYR1S+CF443DmyIJlu5
 Ubb6RD5v3HGzwEZnMQENeriNav21kKQkbJstQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wWL0p/Vwv0P0ZyYXD3ZMaH3SKBU8WIQHi3HTc/T6A9w=;
 b=jK8iyVxMCFe6VoEzrmLYRKCl9+lGiuQH1PgEEbBdZlXlVwZQEb8uK74c45Yt8uBBfz
 g82Ef7oQSVA8JTcjKWrN10IlyF4XRdtUNIqioJbC3BJ5t0/7WHCYCLYI6g9wDVLziAA2
 bQ7qyVdruxN+y/rH3JU93S8u8a4wbzOTpTpb5cqFSo521+gpcXSGJBkh5RwLPdpI7QGD
 wYlq8HlF+NUMyl8LjyeSSk7OO1M1ye5D2t8tNmkXxHlF98xPEXeuk5dCH+IIPeDCgBIl
 hXVqgiDewCIYFlGdGbCczrlnJb0YiI+AhmGnNB1lkmRDCf2k5aY5Pe+PS+dMSVBFjzm9
 AamQ==
X-Gm-Message-State: AOAM532xYVW97oJicvHIZm0dB1Oh2ZPjocLxMO3O31ltaMrPossCFVWC
 M6ZNfOUakV7K8I3Q39MLCR+KioKNBys=
X-Google-Smtp-Source: ABdhPJyOnLYCZDLW6HYI2v9CjdLtSc+vjAnr+zti6cxE291NZ0S4kQLPNPRV5xw+YN8juLwXY+es/Q==
X-Received: by 2002:a7b:c054:: with SMTP id u20mr3129190wmc.2.1594715958922;
 Tue, 14 Jul 2020 01:39:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k11sm30494142wrd.23.2020.07.14.01.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 01:39:18 -0700 (PDT)
Date: Tue, 14 Jul 2020 10:39:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 12/25] drm/rcar-du: Annotate dma-fence critical section
 in commit path
Message-ID: <20200714083916.GV3278063@phenom.ffwll.local>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-13-daniel.vetter@ffwll.ch>
 <20200707233240.GR19803@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707233240.GR19803@pendragon.ideasonboard.com>
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
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 08, 2020 at 02:32:40AM +0300, Laurent Pinchart wrote:
> Hi Daniel,
> 
> Thank you for the patch.
> 
> On Tue, Jul 07, 2020 at 10:12:16PM +0200, Daniel Vetter wrote:
> > Ends right after drm_atomic_helper_commit_hw_done(), absolutely
> > nothing fancy going on here.
> 
> Just looking at this patch and the commit message, I have no idea what
> this does, and why. It would be nice to expand the commit message to
> give some more context, and especially explain why ending signalling
> right after drm_atomic_helper_commit_hw_done() is the right option.
> 
> I suppose I'll have to check the whole series in the meantime :-)

Yes first three patches. They should land in the next few days. The
explanation is a few pages long, not sure that makes much sense to
copypaste into every driver patch here.

Also patch 16 has some more explanation specific for display.

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Cc: linux-renesas-soc@vger.kernel.org
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > index 482329102f19..42c5dc588435 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > @@ -391,6 +391,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
> >  	struct drm_crtc_state *crtc_state;
> >  	struct drm_crtc *crtc;
> >  	unsigned int i;
> > +	bool fence_cookie = dma_fence_begin_signalling();
> 
> Can this be moved right before the
> drm_atomic_helper_commit_modeset_disables() call ?

The critical section starts even before this function starts, but for
composability each part is individually annotated. That's why I've put it
as the very first thing in every patch. Currently there's nothing between
the funciton start and drm_atomic_helper_commit_modeset_disables which
could break dma-fence rules, but the entire point of annotations is to not
have to manually prove stuff like this. Wrapping it all is the point here.

Does that make sense?

Also, what I'm realling looking for is testing with lockdep enabled.
Neither me nor you is going to catch issues with review here :-)
-Daniel

> 
> >  
> >  	/*
> >  	 * Store RGB routing to DPAD0 and DPAD1, the hardware will be configured
> > @@ -417,6 +418,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
> >  	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> >  
> >  	drm_atomic_helper_commit_hw_done(old_state);
> > +	dma_fence_end_signalling(fence_cookie);
> >  	drm_atomic_helper_wait_for_flip_done(dev, old_state);
> >  
> >  	drm_atomic_helper_cleanup_planes(dev, old_state);
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
