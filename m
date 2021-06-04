Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B4A39B4A5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 10:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6866E6F5CA;
	Fri,  4 Jun 2021 08:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325516F5CA
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 08:11:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso7345996wmh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 01:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JbXWfw7rrnkJO0+fk5lbZKzFiOhfx+LiMyaaEdW/mjw=;
 b=lclALgIiYw54A8W7+Ox+5Eh42U4Ays74e35ike/aCCIFEkx0hv6CFw7xjO2L9hIuir
 nzJppMwAuODotlb2Xd6braAJE6iY5LwBYhNakOAZaVCXWkenjqjukYkOGOQVy9dydCBx
 Yrh1qJf7Uy/f8rulc40YO8noDoyouJxE3c4Yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JbXWfw7rrnkJO0+fk5lbZKzFiOhfx+LiMyaaEdW/mjw=;
 b=drh6eKYQmpTcssHcEdPmIOjeG4QoYRLU9L5xhjnBl4CrKbUhP9zMuPIAIlwRmUqFDI
 UY1GVQYybUhgf6HEoSp5Gf3Rv0aWO3DVmmyiOYFta/zRIYoI0o07p9HmoYtfjzp48OsL
 4DnJ9qY5CDxUj+epU529TsapZFtvgkpZz4gRz4eYfZ4ly15ym7J38GrpOnnFK1m3UDlz
 yha+9qFxke8jvq0FnMREVFBjVd0j/+poNtP4mamcXNhrvRz+s+tK9THyeV8fxHq1STQN
 DfpuA7pDe8njQ+amIXtYP+mzgROrl+IU3sHk2MFfDBvZv+yrIhG2S4rlXGd3/dFLLmP8
 IZQQ==
X-Gm-Message-State: AOAM533PhkArMz9o3oly5zU0ziszdNfxv7urVVcuHdPE4NlXSmDHVSHi
 SJh5YeGvXs59Wmwl/288qZjktw==
X-Google-Smtp-Source: ABdhPJwo/rZ2UdOad6ixL+y3zRpZ3JGzpRCVu+1JGIU6Q3hgIw6c/ULqcmX7Q/gJw7Kw7RUkeRMWHw==
X-Received: by 2002:a1c:e343:: with SMTP id a64mr2408669wmh.114.1622794265825; 
 Fri, 04 Jun 2021 01:11:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i2sm4737107wmo.40.2021.06.04.01.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 01:11:05 -0700 (PDT)
Date: Fri, 4 Jun 2021 10:11:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 08/20] drm/i915: Promote ptrdiff() to i915_utils.h
Message-ID: <YLngFj1NhZaoLfV1@phenom.ffwll.local>
References: <20210603051630.2635-1-matthew.brost@intel.com>
 <20210603051630.2635-9-matthew.brost@intel.com>
 <YLlLIG9sBjouIJE2@phenom.ffwll.local>
 <20210604020257.GA7149@sdutt-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604020257.GA7149@sdutt-i7>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 07:02:57PM -0700, Matthew Brost wrote:
> On Thu, Jun 03, 2021 at 11:35:28PM +0200, Daniel Vetter wrote:
> > On Wed, Jun 02, 2021 at 10:16:18PM -0700, Matthew Brost wrote:
> > > From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > 
> > > Generic helpers should be placed in i915_utils.h.
> > 
> > Random rant, but we're _way_ too happy to just stuff random things into
> > i915_utils.h without trying to properly upstream it.
> > 
> > For thinks like this the general dumping ground would be kernel.h, there's
> > a few pointer helpers there already. Follow up patch maybe nice.
> > -Daniel
> > 
> 
> Sure. I've added this to a list of follow ups so this comment doesn't
> get lost.

btw I think we probably want to rename it, because it's not just the
well-defined C pointer difference. We convert to void * so we get the
difference in bytes. So maybe ptr_offset or ptrdiff_in_bytes or something
like that which makes it clear.
-Daniel

> 
> Matt
> 
> > > 
> > > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/i915_utils.h | 5 +++++
> > >  drivers/gpu/drm/i915/i915_vma.h   | 5 -----
> > >  2 files changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> > > index f02f52ab5070..5259edacde38 100644
> > > --- a/drivers/gpu/drm/i915/i915_utils.h
> > > +++ b/drivers/gpu/drm/i915/i915_utils.h
> > > @@ -201,6 +201,11 @@ __check_struct_size(size_t base, size_t arr, size_t count, size_t *size)
> > >  	__T;								\
> > >  })
> > >  
> > > +static __always_inline ptrdiff_t ptrdiff(const void *a, const void *b)
> > > +{
> > > +	return a - b;
> > > +}
> > > +
> > >  /*
> > >   * container_of_user: Extract the superclass from a pointer to a member.
> > >   *
> > > diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> > > index dc6926d89626..eca452a9851f 100644
> > > --- a/drivers/gpu/drm/i915/i915_vma.h
> > > +++ b/drivers/gpu/drm/i915/i915_vma.h
> > > @@ -151,11 +151,6 @@ static inline void i915_vma_put(struct i915_vma *vma)
> > >  	i915_gem_object_put(vma->obj);
> > >  }
> > >  
> > > -static __always_inline ptrdiff_t ptrdiff(const void *a, const void *b)
> > > -{
> > > -	return a - b;
> > > -}
> > > -
> > >  static inline long
> > >  i915_vma_compare(struct i915_vma *vma,
> > >  		 struct i915_address_space *vm,
> > > -- 
> > > 2.28.0
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
