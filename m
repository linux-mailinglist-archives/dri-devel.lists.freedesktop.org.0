Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA9B3FEFAE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 16:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395786E593;
	Thu,  2 Sep 2021 14:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5726E593
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 14:47:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1550031wml.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 07:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bmnFc+3KKaFI2ANGRuUW8hsGhsal2uOwCkvONqI8gJA=;
 b=Hr7rsCo1GYxr9LhmTSx4oDSriTUT1rhtCBfxGnlH7EZTrcopR2bTop9Fk8h+ejGxiN
 CuJVwfjJuCGWfn4mzdbLHpI1KmsoWp51caDSUeG3M7rPGu218UB3qGjnhs4aH8DGNYdr
 RftB+RhSBASzkmct5mmtuHUJzOTkPCQEViHe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bmnFc+3KKaFI2ANGRuUW8hsGhsal2uOwCkvONqI8gJA=;
 b=UGquHdT/jUa3KxvEAeSzAgimXEJUZTSmtRphnywbzk/oR5a1f3hYp6ZbH2AfheQrEc
 HhY9xoKthugOaDuCd8hWbukOcNJRUvTU/A3GYW8DXy0/5A/i0B7JTjka/Fx1SWHim3c7
 5zmRp7KmRPjfUcHNsb81jI1qSccxAzCnbEnF+2KtR3quaZo2e+F9+Yk8ApgsjtQ7bruQ
 Z8oner8bFVyJ5RXPI6oVltoKV2LATrOMDslSuUwQj+E0RaBASAd8+kOyzre6jkXL4dUH
 93BpIK4AQdI2s7fuN9Y1m7EGCsl9uZBK2FO9yPL1lfrBJFkH7d88aZT3EyDQjUQrek13
 YbPw==
X-Gm-Message-State: AOAM530QJ5I6ilw+ZZL4UYNR/3R16iJEtyXUPau/INdM7uQ26FcCR58c
 IceGtkfMwm2ZSeISDE+esHy91A==
X-Google-Smtp-Source: ABdhPJzznbKpEm89FGRfInwUPR2jriyfkrQ2085VLjIRu6nEAaRFI/BY1LtJmgOcNvkUTtwukXZARA==
X-Received: by 2002:a1c:f214:: with SMTP id s20mr3569210wmc.14.1630594057264; 
 Thu, 02 Sep 2021 07:47:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u27sm2114288wru.2.2021.09.02.07.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 07:47:36 -0700 (PDT)
Date: Thu, 2 Sep 2021 16:47:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Stone <daniels@collabora.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Emil Velikov <emil.l.velikov@gmail.com>, Keith Packard <keithp@keithp.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH] drm/lease: allow empty leases
Message-ID: <YTDkB2JSuBwRWcnP@phenom.ffwll.local>
References: <20210902091126.2312-1-contact@emersion.fr>
 <20210902172810.24ed05bb@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210902172810.24ed05bb@eldfell>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 02, 2021 at 05:28:10PM +0300, Pekka Paalanen wrote:
> On Thu, 02 Sep 2021 09:11:40 +0000
> Simon Ser <contact@emersion.fr> wrote:
> 
> > This can be used to create a separate DRM file description, thus
> > creating a new GEM handle namespace. See [1].
> > 
> > Example usage in wlroots is available at [2].
> > 
> > [1]: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/110
> > [2]: https://github.com/swaywm/wlroots/pull/3158
> > 
> 
> Hi Simon,
> 
> I have a feeling that this is a good idea, but could you explain in
> this commit message some real use cases where one needs a new GEM
> handle namespace? Not just "when you share a DRM fd between processes"
> but *why* you shared a DRM device fd between processes.
> 
> If I have trouble remembering or figuring that out from those links,
> then I'm sure others have too.

Also please document the uapi headers and explain the use-case there and
why and all that.

I'd like that we officiate all uapi we intentionally create in the docs as
much as possible.

Also igt testcase patch for this too pls.
-Daniel

> 
> 
> Thanks,
> pq
> 
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Daniel Stone <daniels@collabora.com>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> > Cc: Michel Dänzer <michel@daenzer.net>
> > Cc: Emil Velikov <emil.l.velikov@gmail.com>
> > Cc: Keith Packard <keithp@keithp.com>
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > ---
> >  drivers/gpu/drm/drm_lease.c | 39 +++++++++++++++++--------------------
> >  1 file changed, 18 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> > index dee4f24a1808..d72c2fac0ff1 100644
> > --- a/drivers/gpu/drm/drm_lease.c
> > +++ b/drivers/gpu/drm/drm_lease.c
> > @@ -489,12 +489,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
> >  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
> >  		return -EOPNOTSUPP;
> >  
> > -	/* need some objects */
> > -	if (cl->object_count == 0) {
> > -		DRM_DEBUG_LEASE("no objects in lease\n");
> > -		return -EINVAL;
> > -	}
> > -
> >  	if (cl->flags && (cl->flags & ~(O_CLOEXEC | O_NONBLOCK))) {
> >  		DRM_DEBUG_LEASE("invalid flags\n");
> >  		return -EINVAL;
> > @@ -510,23 +504,26 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
> >  
> >  	object_count = cl->object_count;
> >  
> > -	object_ids = memdup_user(u64_to_user_ptr(cl->object_ids),
> > -			array_size(object_count, sizeof(__u32)));
> > -	if (IS_ERR(object_ids)) {
> > -		ret = PTR_ERR(object_ids);
> > -		goto out_lessor;
> > -	}
> > -
> > +	/* Handle leased objects, if any */
> >  	idr_init(&leases);
> > +	if (object_count != 0) {
> > +		object_ids = memdup_user(u64_to_user_ptr(cl->object_ids),
> > +					 array_size(object_count, sizeof(__u32)));
> > +		if (IS_ERR(object_ids)) {
> > +			ret = PTR_ERR(object_ids);
> > +			idr_destroy(&leases);
> > +			goto out_lessor;
> > +		}
> >  
> > -	/* fill and validate the object idr */
> > -	ret = fill_object_idr(dev, lessor_priv, &leases,
> > -			      object_count, object_ids);
> > -	kfree(object_ids);
> > -	if (ret) {
> > -		DRM_DEBUG_LEASE("lease object lookup failed: %i\n", ret);
> > -		idr_destroy(&leases);
> > -		goto out_lessor;
> > +		/* fill and validate the object idr */
> > +		ret = fill_object_idr(dev, lessor_priv, &leases,
> > +				      object_count, object_ids);
> > +		kfree(object_ids);
> > +		if (ret) {
> > +			DRM_DEBUG_LEASE("lease object lookup failed: %i\n", ret);
> > +			idr_destroy(&leases);
> > +			goto out_lessor;
> > +		}
> >  	}
> >  
> >  	/* Allocate a file descriptor for the lease */
> 



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
