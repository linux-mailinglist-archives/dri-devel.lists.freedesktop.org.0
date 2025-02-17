Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89985A38EF2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 23:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF74410E601;
	Mon, 17 Feb 2025 22:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="OBtI1Qyw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887F310E604
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 22:23:36 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43932b9b09aso52826575e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 14:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739831015; x=1740435815; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ya/pP9fwWcplJVlKmZlEVPBLpghqO5qHibfD85/FdDI=;
 b=OBtI1QywZQeBNTqsxuhin0iBBp1um76QJWFxnxlzgu0l2ewNZuLHTLR0Y20Z8RUQ1B
 y8+4wbC4tZ/NdDxbFCezIgt+WQHIRz8ZmMnXFYMxER0U7rDHKkLw7tJedrT6nH93yrsW
 w7DbCwWq0q3LhUeHm7VY/AnImhfs/xKEoskwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739831015; x=1740435815;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ya/pP9fwWcplJVlKmZlEVPBLpghqO5qHibfD85/FdDI=;
 b=HycheZzf5XKhA5Hg5nTmKNXzDRx6szxHafC0tdVsl30um7wP9BzJ5Zre1iIWJqRJsx
 C0ajugxox7zS/HqHgtBCnCOR5tGpB0f51/WHv65R3LaBrelKrOFx/0JoFA5D4HqDP7WA
 iIyHYMtzEUVLhj851DkYfHlmGCUzI1wnFyS6NRhzH7iZovBckDWgvSmMrA/pkObWZ4xK
 1sI33t8ZN4BebaIveGcok8tBnGzbgB90RVgK71o4vwxi1M8InTeQTrkFouboxvKVvfCZ
 mTO0WeL1b/CIWRCw/xF9E3m4tcEt6WMQCmwCtRoq/H1uuY/qDaChsq+2wX/TaW+UgQBg
 xCLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0vyVN10Cx6D4vGBTpKDy6mg1fRkrtYdV8McSF4YK9lOJ0D3sQCfWUPeLzcsHhkD/XcxuZCSUbmIA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1HupZ+MeXabCOFy/ySzC70g24pj6etQapSUfabkxiApVSLqN9
 XgdOcgxoACjsiUoIBNd69Di2GVZFcmaETdaOgmz6hz96h5wP1xg8pkrOSut8JtQ=
X-Gm-Gg: ASbGncuxe70HY+7puLlzZF/vfsBoO0hHw+zJXPrlTsx3Ox3+GTCB2CK5zAr/Q05EnYu
 j91dGU702YB1vJThARFIe5Frw/ksjo1jXGTTePgJRF5K27Lvf343hmswGhwSww488HjR2GNDMIc
 ZjXE75w2oSjGw3mU5zghx7yFGR3feK2UrMZ6eJdp0wIyyM55X1aGXcsX+y6zFDz7iB7eBrsTkyS
 TY2HW+vVT3jz9Tg6ELKGxB1cNHkeZu0gGeaHKnC2Cisfy4GkWOrxl6MEE31Ni+et7E2ikYsrZ1A
 tFBEEHJ4pUNf/1UxI2UarSP/HBc=
X-Google-Smtp-Source: AGHT+IGhLFH9GT6vQtRNpmM8uOm4OS77lPqdQNdi0QzlLzND4BTNKAeYGQY/2B0DlxZ0sr5mjVdJkA==
X-Received: by 2002:a05:600c:4450:b0:439:916a:b3db with SMTP id
 5b1f17b1804b1-439916ab5bdmr19832885e9.6.1739831014492; 
 Mon, 17 Feb 2025 14:23:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4398e35c522sm17399425e9.34.2025.02.17.14.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 14:23:33 -0800 (PST)
Date: Mon, 17 Feb 2025 23:23:31 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Arun R Murthy <arun.r.murthy@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 suraj.kandpal@intel.com, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Message-ID: <Z7O24-tT9wGq3aZn@phenom.ffwll.local>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com>
 <20250217120808.708b9b4d@eldfell>
 <Z7NxOVfgvvBt_sj3@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7NxOVfgvvBt_sj3@phenom.ffwll.local>
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

On Mon, Feb 17, 2025 at 06:26:17PM +0100, Simona Vetter wrote:
> On Mon, Feb 17, 2025 at 12:08:08PM +0200, Pekka Paalanen wrote:
> > Hi Arun,
> > 
> > this whole series seems to be missing all the UAPI docs for the DRM
> > ReST files, e.g. drm-kms.rst. The UAPI header doc comments are not a
> > replacement for them, I would assume both are a requirement.
> > 
> > Without the ReST docs it is really difficult to see how this new UAPI
> > should be used.
> 
> Seconded. But really only wanted to comment on the userspace address in
> drm blobs.
> 
> > > +/**
> > > + * struct drm_histogram_config
> > > + *
> > > + * @hist_mode_data: address to the histogram mode specific data if any
> > 
> > Do I understand correctly that the KMS blob will contain a userspace
> > virtual memory address (a user pointer)? How does that work? What are
> > the lifetime requirements for that memory?
> > 
> > I do not remember any precedent of this, and I suspect it's not a good
> > design. I believe all the data should be contained in the blobs, e.g.
> > how IN_FORMATS does it. I'm not sure what would be the best UAPI here
> > for returning histogram data to userspace, but at least all the data
> > sent to the kernel should be contained in the blob itself since it
> > seems to be quite small. Variable length is ok for blobs.
> 
> So yeah this doesn't work for a few reasons:
> 
> - It's very restrictive what you're allowed to do during an atomic kms
>   commit, and a userspace page fault due to copy_from/to_user is
>   definitely not ok. Which means you need to unconditionally copy before
>   the atomic commit in the synchronous prep phase for the user->kernel
>   direction, and somewhere after the entire thing has finished for the
>   other direction. So this is worse than just more blobs, because with
>   drm blobs you can at least avoid copying if nothing has changed.
> 
> - Due to the above you also cannot synchronize with userspace for the
>   kernel->userspace copy. And you can't fix that with a sync_file out
>   fence, because the underlying dma_fence rules are what prevents you from
>   doing userspace page faults in atomic commit, and the same rules apply
>   for any other sync_file fence too.
> 
> - More fundamentally, both drm blobs and userspace virtual address spaces
>   (as represented by struct mm_struct) are refconted objects, with
>   entirely decoupled lifetimes. You'll have UAF issues here, and if you
>   fix them by grabbing references you'll break the world.
> 
> tldr; this does not work
> 
> Alternative A: drm blob
> -----------------------
> 
> This would work for the userspace->kernel direction, but there's some
> downsides:
> 
> - You still copy, although less often than with a userspace pointer.
> 
> - The kernel->userspace direction doesn't work, because blob objects are
>   immutable. We have mutable blob properties, but mutability is achieved
>   by exchanging the entire blob object. There's two options to address
>   that:
> 
>   a) Fundamentally immutable objects is really nice api designs, so I
>      prefer to not change that. But in theory making blob objects mutable
>      would work, and probably break the world.
> 
>   b) A more benign trick would be to split the blob object id allocation
>      from creating the object itself. We could then allocate and return
>      the blob ID of the new histogram to userspace synchronously from the
>      atomic ioctl, while creating the object for real only in the atomic
>      commit.
> 
>      As long as we preallocate any memory this doesn't break and dma_fence
>      signalling rules. Which also means we could use the existing atomic
>      out-fence (or a new one for histograms) to signal to userspace when
>      the data is ready, so this is at least somewhat useful for
>      compositors without fundamental issues.
> 
>      You still suffer from additional copies here.
> 
> Alternative B: gem_bo
> ---------------------
> 
> One alternative which naturally has mutable data would be gem_bo, maybe
> wrapped in a drm_fb. The issue with that is that for small histograms you
> really want cpu access both in userspace and the kernel, while most
> display hardware wants uncached. And all the display-only kms drivers we
> have do not have a concept of cached gem_bo, unlike many of the drm
> drivers with render/accel support. Which means we're adding gem_bo which
> cannot be used for display, on display-only drivers, and I'd expect this
> will result in compositors blowing up in funny ways to no end.
> 
> So not a good idea either, at least not if your histograms are small and
> the display hw doesn't dma them in/out already anyway.
> 
> This also means that we'll probably need 2 interfaces here, one supporting
> gem_bo for big histograms and hw that can dma in/out of them, and a 2nd
> one optimized for the cpu access case.
> 
> Alternative C: memfd
> --------------------
> 
> I think a new drm property type that accepts memfd would fit the bill
> quit well:
> 
> - memfd can be mmap(), so you avoid copies.
> 
> - their distinct from gem_bo, so no chaos in apis everywhere with imposter
>   gem_bo that cannot ever be used for display.
> 
> - memfd can be sealed, so we can validate that they have the right size
> 
> - thanks to umdabuf there's already core mm code to properly pin them, so
>   painful to implement this all.
> 
> For a driver interface I think the memfd should be pinned as long as it's
> in a drm_crtc/plane/whatever_state structure, with a kernel vmap void *
> pointer already set up. That way drivers can't get this wrong.
> 
> The uapi has a few options:
> 
> - Allow memfd to back drm_framebuffer. This won't result in api chaos
>   since the compositor creates these, and these memfd should never show up
>   in any property that would have a real fb backed by gem_bo. This still
>   feels horrible to me personally, but it would allow to support
>   histograms that need gem_bo in the same api. Personally I think we
>   should just do two flavors, they're too distinct.
> 
> - A new memfd kms object like blob objects, which you can create and
>   destroy and which are refcounted. Creation would also pin the memfd and
>   check it has a sealed size (and whatever else we want sealed). This
>   avoids pin/unpin every time you change the memfd property, but no idea
>   whether that's a real use-case.
> 
> - memfd properties just get the file descriptor (like in/out fences do)
>   and the drm atomic ioctl layer transparently pins/unpins as needed.

One thing I forgot: We'd need to think through if other compositors can
get back to the memfd from the property. Or if it's better to just
disallow that because it'd open up a very funny new ipc mechanism.
-Sima

> Personally I think option C is neat, A doable, B really only for hw that
> can dma in/out of histograms and where it's big enough that doing so is a
> functional requirement.
> 
> Cheers, Sima
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
