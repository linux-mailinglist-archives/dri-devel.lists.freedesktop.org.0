Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C00A3BFFB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE3310E499;
	Wed, 19 Feb 2025 13:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ljgxtu6v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F32510E808
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:32:01 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4399a1eada3so9157625e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739971920; x=1740576720; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Hhaee7knRiKVL8BNIdwLBrNmxyHdvsdM5IwNqpSg+oA=;
 b=ljgxtu6vW8Bs46qLJ5EaYVkv6g1FCI1L4niC0xGPuXVuUGbv4/ZGT4X631uYrLY4jU
 YPvu1RAKDLluhNPShyvfsCxx7ECCWtZY4dshIy0N0xAGBXUc/d5UeQV0HyGXJ45eWTX5
 MxPzDPT2i/CPGYoziUu3n00EjcM/WlABhM2VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739971920; x=1740576720;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hhaee7knRiKVL8BNIdwLBrNmxyHdvsdM5IwNqpSg+oA=;
 b=CPbOOeDIpvlWOXH8wcosVMZsIu96gQSTShlfnittEEzQ0BNpk5lNDMZlFgYx1SwJ7s
 XqcpDJDiQgQqmOwhEeHTk/OcRKnIuJHSMCqDURQn13jiXNKnzVLm2Nj2dGM8qAJQqhWH
 CbQ6fEAVhcimfMpSP0aEj7HKdeY+b4LDankdK/ZrTRJhL5aNKQtFLIwtMmwxVMsuE20y
 Dn8Azf7U6fA32bMg//GKWwci+tBC+D1VwPeWLdwmwvkLeFK9O1mxnNgWzpPcQsSHP6LS
 5CKhUgqS6fXiZQwshDOWl0vhygZO0t7PS+T1DSE7tix09FSYOCm/LNPJb5FnDUb8cynF
 5ZvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCh+VyfzT5kAX0PPjPDtsQbmf5+xiIOyv/l2co5pk2dOVbKnwr7JiW1lkFJDDpGYwrNK/VSoCRiqE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIuLIGUQHPKS5IskCdqnqthWnzCfJUYeEl9eHu454WRMZn4+Qc
 QYnPDLD3wPJHUxRYZz2Z1OH7c3ty4okqR4hNxwKvM4N+bKneo8NBkfuFxH+7Rf4=
X-Gm-Gg: ASbGncuh2l4R8W8d0GsNyThhOzWcpOPPrmlrZ3aD0CDNzhMCFJiAWuxJaXPZ+IUsCSA
 UfdI3/QT1uMaAnxvMqZwHTmap3xrmYT7vSXyZJbhhwl+fNjLlWCNXSHwb7b73sDoWigFpE3gkHf
 PgwFImu+Y40Sp2p8H1vxzAUQVGxLWaKnepA1A3uTukRyXsxhxDdilJilW8aW4fLBUG7ySnxVgMf
 9ZP0/FqbrxMgHA8AiUlG9kyuaDWpUxt3tbd0/LXS/0VJJY3kufJiHOVer1VyaxV9aQ/tPJIUWI2
 0q5YzF0EEd8+OgcrfjKbJvBM3ao=
X-Google-Smtp-Source: AGHT+IFgN0FZMlzOxNyXz022ZDpIf8Iarx9k9ShQrCHyoh3SgQeJG0HUfuGX5PSKEQgj34iSRaSUCg==
X-Received: by 2002:a05:6000:1842:b0:38f:2856:7d9a with SMTP id
 ffacd0b85a97d-38f58782b96mr3380323f8f.3.1739971919542; 
 Wed, 19 Feb 2025 05:31:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258dd5acsm18120235f8f.35.2025.02.19.05.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:31:59 -0800 (PST)
Date: Wed, 19 Feb 2025 14:31:57 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Arun R Murthy <arun.r.murthy@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 suraj.kandpal@intel.com, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Message-ID: <Z7XdTfEgMlW4wrm8@phenom.ffwll.local>
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

Another detail I've forgotten: If you queue an atomic commit and then
immmediately do a compositor swithc, then the new compositor would end up
with the very confusing situation of having a blob property pointing at a
blob which does not yet exist. And since it wont get the drm_event nor has
a dma_fence out-fence, it also cannot reliably wait.

So this would be awkward at best, and might actually be a cross-compositor
attack vector.

So yeah delayed blob object creation also don't look great, and mutable
blob objects probably break compositors even harder and we'd need to make
this all opt-in.

We need an opt-in for all of these I think, but the more I think about it
the more this alternative looks like the worst.

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
> 
> Personally I think option C is neat, A doable, B really only for hw that
> can dma in/out of histograms and where it's big enough that doing so is a
> functional requirement.

Also for all these we'd need to make these new properties opt-in and hide
them from compositors who cannot cope. Just defensive programming best
practices.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
