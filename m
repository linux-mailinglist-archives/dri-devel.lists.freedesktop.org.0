Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F334A3BF1E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 13:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0441D10E7EF;
	Wed, 19 Feb 2025 12:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="InYRb5YN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8874410E7F4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 12:58:42 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so45991745e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 04:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739969921; x=1740574721; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=34sVOinnrdUpopDeZt0X3vBKN/d5vCnq4SYbVGcMLpU=;
 b=InYRb5YNatfFgBmOCwRv2PrKJ5MBxoIoG4LlZ0/geojEINLwSFOJY/R/JA5V238tSz
 FKz65ckK7bPRiVyuf6hQyLU0Hd98+D5Jeb6hY2v8QMvfGJbNRUsPPL4BQUvHcxaBPWF9
 GGEz3KLJMx732GP4zTVIuKoCbCTlFO5VrZp+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739969921; x=1740574721;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=34sVOinnrdUpopDeZt0X3vBKN/d5vCnq4SYbVGcMLpU=;
 b=Fufa9LDtzxvytmEH4Jow7hT9eMk9F7qFFtOMUHbCY8NzhGiCti/msR8ErFhEpciKvN
 M63yyW6/j1YKX3Ols4a/ARQ+7n0uafM2lq0IKCFdLQjuowPEl8lIVsVhpGeAosAXe5E7
 IL9rtsSN8jJN+d+QZ2cli0GM7H17C/yFOuJtypvkPqoOWO4P2iU9VNKRDAyG/ZlkUQET
 i7E7MZi74xH6imsU8tk2nsIykoebll+2g0ZFs2G/7CKPxu8STuWAU8zYuCv/PSDaDU8a
 AXJ0FTO1Xg9Op+/DAshQbM5N1wkaJHqRL4QW/W+BpCh89PsY9SNjC5ws6ryFY6w36JTG
 QemA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmJYxQiW3BdnIz2ZEeEuRLnCO+7iynID+w7YsGayrpOVaatgjTJEuWdBmt0OduJ20jmVelqTuebBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkMwy245K6dKkiPfumGYkco8G0kFx02l7N0O9wVB0+4jqvVxmE
 XnKJntZ7rO2zKoUVyaFPkJJr6CftgLvqaDXiD65RKPMV/aaYjy+/ihTjibvf0Lw=
X-Gm-Gg: ASbGnct9P/rm7clbdpUQgawNVYg3YdxvGm+Lx6itEhUHrtyfHW4PsQpiMpHgPbr7/f4
 VTB7iCGE0fOhP19iYcdcjCe4FI/+dTip2pAYut/TestXAGqQxTrvvK1nZ++leSpP9oDBeNKGv5G
 h+x9ad7OdXsmmHwWYZ3A8myJqBUBPr4T0y/k0DEvTYjbtH8F1Qo7vY7T8Q6xdnGmrUlM8Ig4duS
 zOx9RZwQjRSycIDtflRCbwqwgsiJOec139IB4hQF5PzLQjzGXw+RWKVaKntt0L/oFN3VwxCxjPx
 +aM7IV5CWioH9E8DmpsDEnj3lvU=
X-Google-Smtp-Source: AGHT+IGzbUBUg/56lBAekqPCOphT5RTECYUG5Q84fY/+IOL0ZwxmdTe8Ny3WUiTLHfIX8hhDw7t+4Q==
X-Received: by 2002:a05:600c:1c98:b0:439:88bb:d026 with SMTP id
 5b1f17b1804b1-43988bbd48cmr104447115e9.5.1739969920700; 
 Wed, 19 Feb 2025 04:58:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1aa7c7sm214383535e9.27.2025.02.19.04.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 04:58:40 -0800 (PST)
Date: Wed, 19 Feb 2025 13:58:38 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z7XVfnnrRKrtQbB6@phenom.ffwll.local>
Mail-Followup-To: Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <Z7RgOd_57wcSUyB0@pollux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7RgOd_57wcSUyB0@pollux>
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

On Tue, Feb 18, 2025 at 11:26:01AM +0100, Danilo Krummrich wrote:
> On Tue, Feb 18, 2025 at 11:46:26AM +1000, Dave Airlie wrote:
> > > 1. How to avoid unnecessary calls to try_access().
> > >
> > > This is why I made Boot0.read() take a &RevocableGuard<'_, Bar0> as argument. I
> > > think we can just call try_access() once and then propage the guard through the
> > > callchain, where necessary.
> > 
> > Nope, you can't do that, RevocableGuard holds a lock and things
> > explode badly in lockdep if you do.
> 
> Yes, try_access() marks the begin of an RCU read side critical section. Hence,
> sections holding the guard should be kept as short as possible.
> 
> What I meant is that for a series of I/O operations we can still pass the guard
> to subsequent functions doing the actual I/O ops.
> 
> More generally, I also thought about whether we should also provide an SRCU
> variant of Revocable and hence Devres. Maybe we even want to replace it with
> SRCU entirely to ensure that drivers can't stall the RCU grace period for too
> long by accident.

The issue with srcu is that the revocation on driver unload or hotunplug
becomes unbound. Which is very, very uncool, and the fundamental issue
that also drm_dev_enter/exit() struggles with. So unless the kernel has a
concept of "bound-time mutex only, but not unbounded sleeps of any sort" I
think we should try really, really hard to introduce srcu revocables on
the rust side. And at least for mmio I don't think any driver needs more
than maybe some retry loops while holding a spinlock, which is fine under
standard rcu. It does mean that drivers need to have fairly fine-grained
fallible paths for dealing with revocable resources, but I think that's
also a good thing - mmio to an unplugged device times out and is really
slow, so doing too many of those isn't a great idea either.

Ofc on the C side of things the balance shits a lot, and we just want to
at least make "no uaf on driver hotunplug" something achievable and hence
are much more ok with the risk that it's just stuck forever or driver
calls take an undue amount of time until they've finished timing out
everything.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
