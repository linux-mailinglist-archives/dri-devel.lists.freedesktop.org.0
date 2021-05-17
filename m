Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB57F3833BF
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 17:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458596E9C8;
	Mon, 17 May 2021 15:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC526E9C8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 15:04:06 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id n2so6836376wrm.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=eGphPJuK3cgRJFETzUcO/LShGRgzjvs38A9VSCQLJ8k=;
 b=Mzc8dj5AYMq4ixYcDwtq6ArgNnS+NXanSSzxBsoB2qZjEvwsrcIafBggZar4BpgfIU
 iZ3OeRFUoLoYejrvpno0p5K66ZYHyCztQh604uMjFaxBlqdrZPuYg6lYvkgA5WLiMsLA
 S7w9HU1uGA/AkeYqP0LdyXB2Zuh7F8CdmWgwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=eGphPJuK3cgRJFETzUcO/LShGRgzjvs38A9VSCQLJ8k=;
 b=en8peACDcCjDJaRg/N3oLd1raBBa1ziMP/thso/D9A+RHWUIv7p95177c8NsEmT8uM
 /qYg+ypJLbsDdZfcVwYO21fF23W06e8XySrfXKzQRBwFN6AcO2OU30pJEMeItqKrSUFt
 oQU1n6IGElcpEKV6Qf5cr7R6tpcVoYr7iOgTyvHBoQaNG3aAhDYwpCyLfcd15DvJcBjO
 hh0NLwL0gBCoHk2hdL7YKPVSAhWIScmKzQOL+2+Fh3UgCEfhdLFNzVh2tgfIf05JMQ4P
 fc8W4Q3WnEnxjbq7JXhBVva7Fr+fTefQThyXIOZSp3SGx9ahDoPV8qx/RMVgo8ZlVWvR
 bN+w==
X-Gm-Message-State: AOAM53156qXFih/tcuuBX7QuSR6z41ZVVXzD86vxOlYLAbWeZisbrASF
 N2HRs6UCdBMHAutciSssiR9cTA==
X-Google-Smtp-Source: ABdhPJwRQA0zY+tq7EPgKIHjccQyA7oUyu/7jvW/KHgUwjb48uOykuD48aikU0azq/JragIivlTvZQ==
X-Received: by 2002:adf:f00b:: with SMTP id j11mr104515wro.181.1621263845106; 
 Mon, 17 May 2021 08:04:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v3sm10283270wrr.19.2021.05.17.08.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 08:04:04 -0700 (PDT)
Date: Mon, 17 May 2021 17:04:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
Message-ID: <YKKF4jOvM4gJT6a4@phenom.ffwll.local>
References: <20210517141129.2225-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210517141129.2225-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 04:11:18PM +0200, Christian König wrote:
> We had a long outstanding problem in amdgpu that buffers exported to
> user drivers by DMA-buf serialize all command submissions using them.
> 
> In other words we can't compose the buffer with different engines and
> then send it to another driver for display further processing.
> 
> This was added to work around the fact that i915 didn't wanted to wait
> for shared fences in the dma_resv objects before displaying a buffer.
> 
> Since this problem is now causing issues with Vulkan we need to find a
> better solution for that.
> 
> The patch set here tries to do this by adding an usage flag to the
> shared fences noting when and how they should participate in implicit
> synchronization.

So the way this is fixed in every other vulkan driver is that vulkan
userspace sets flags in the CS ioctl when it wants to synchronize with
implicit sync. This gets you mostly there. Last time I checked amdgpu
isn't doing this, and yes that's broken.

I915 and iirc msm has explicit flags for this, panfrost was designed to
support this correctly from the start (also with flags I think). That's at
least what I remember from all the discussions at XDC and #dri-devel, but
didn't check the code again to give you the list of uapi flags you need
for each driver.

The other piece is making sure you're only picking up implicit fences when
you should, and not any later ones, for which Jason has a solution:

https://lore.kernel.org/dri-devel/20210317221940.2146688-1-jason@jlekstrand.net/

If amdgpu isn't using those, then you will suffer from
over-synchronization in vulkan and pay a price. The entire point of vulkan
is that you pick up sync points very explicitly, and we also need to have
very explicit uapi for userspace to pick up/set the implicit fences.

Trying to paper over this with more implicit magic is imo just wrong, and
definitely not the long term explicit sync model we want.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
