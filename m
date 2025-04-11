Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571BCA86573
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 20:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D136F10EC4E;
	Fri, 11 Apr 2025 18:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ThUqfiUc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0489D10EC4E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 18:24:37 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so20249835e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 11:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1744395876; x=1745000676; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AJ1OpQiEA2fuYQ7aWXFFifeEjoTfnPqcQsuRUsxPOaI=;
 b=ThUqfiUc0JM2+Vx/K8CNKvQrWbGFk6SnDVX0mXhXgFwkTc80Ipdf8QgkEeDswGulkd
 ksYkfznKMX2/gaR7Els12+oUjVD16E8t/jZWVTO7IwMS54CACo2ve1KNjjBAHBLen9wE
 EzsGWPkzC3z48ptfJh2Di9f8++Pbig4qKvypM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744395876; x=1745000676;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AJ1OpQiEA2fuYQ7aWXFFifeEjoTfnPqcQsuRUsxPOaI=;
 b=HakSXS7xZgKL4tpq/Tq9jXfLUWi3JDbCcWIWaw8Q97cwG19GlUn/dfE49LcemKq3oa
 8PLJYWGj9iENmf3Tg8MzHAislFJtczkqE+lyeNowReJTnP0MId8DjkS+Oly6WfGQS8Fz
 kbc+B5ufQhD+ltctE5SawarHm87YOlKHxHoIUgbZgvMUON2CRIgKcJ3GYRiumrgLDny9
 5pJ3jelhGPBy4iC9k4BFrsHt7tsT+W2VJ74qODxE75SpBvRccgJQmPjLikXpUp/iqnUe
 qghAB1V1/4oWbGutXb8j+sssyZqJcUoFa6XOKOT4GzxzvY+aknBg/qSUFWzor4ymrAbx
 Necw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7iICW+n/mcZv2vNKjSSw5w5go/9LOCRGH/NaxMNg8eR9ykX/TEKEIEUGHHTF9C9KihQT9QJNSC+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxy3loiPchSAZW5nFvZPcqkd4h1AlFt0/u34N7a2xmbb0BpNKs
 v1Q2hdE9zDm+lE7v2HxIedQILSpch3VzTsn6xTZtBUAMZjb8NUIwl8CM+41jNR4=
X-Gm-Gg: ASbGncvqrvn13fXKqq00he6uB2Ox7yPhTlef3WYramFLLOfLBzZkZsDH0D7iDgJc5HL
 j1ARixOQrxVxxJLw1g6CAV3eR/kvJLwlUDNTXZWsx9fCYEasThWKD8gYc5crv7iZ9m1xKxVElvq
 r4rgSIq+yg9USUVKuZiMbYK/qn+E23QpSe8FiMTzyaC7HtEon3Q6fvITuGcDx5WVsZJd50xCNc9
 O3qkFOPR+YF9Cqk0dwIH8KIAqTBjPvlgPPsrxasRrb5X+vMQH2O9Vpxix6NNShmeutC0ItvuX6P
 Yyk13EotPE4XRsAf+1oNTDGgJb290do02pnASWo464DV2hirKAiZ
X-Google-Smtp-Source: AGHT+IGfbceyJgIRFYU4WDkbHylu3zRpQoJ76o5ycjIEZa8G5MVA0sc95QeFaIUCteRTa68IYvch6g==
X-Received: by 2002:a05:600c:3b0d:b0:439:8c80:6af4 with SMTP id
 5b1f17b1804b1-43f3a9599e7mr34458495e9.19.1744395875649; 
 Fri, 11 Apr 2025 11:24:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c81f6sm90409015e9.20.2025.04.11.11.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 11:24:35 -0700 (PDT)
Date: Fri, 11 Apr 2025 20:24:33 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 kernel@collabora.com, Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
Message-ID: <Z_leYYoUcUikjlr4@phenom.ffwll.local>
References: <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
 <4d47cb90-8ed4-4a69-bd91-b90ebd2c9aca@amd.com>
 <20250411103837.753cd92e@collabora.com>
 <9fd6fb8c-7dbb-467d-a759-eec852e1f006@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fd6fb8c-7dbb-467d-a759-eec852e1f006@amd.com>
X-Operating-System: Linux phenom 6.12.17-amd64 
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

On Fri, Apr 11, 2025 at 12:55:57PM +0200, Christian König wrote:
> Am 11.04.25 um 10:38 schrieb Boris Brezillon:
> > On Fri, 11 Apr 2025 10:04:07 +0200
> > Christian König <christian.koenig@amd.com> wrote:
> >
> >> Am 10.04.25 um 20:41 schrieb Boris Brezillon:
> >>> On Thu, 10 Apr 2025 14:01:03 -0400
> >>> Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
> >>>  
> >>>>>>> In Panfrost and Lima, we don't have this concept of "incremental
> >>>>>>> rendering", so when we fail the allocation, we just fail the
> >>>>>>> GPU job with an unhandled GPU fault.      
> >>>>>> To be honest I think that this is enough to mark those two
> >>>>>> drivers as broken.  It's documented that this approach is a
> >>>>>> no-go for upstream drivers.
> >>>>>>
> >>>>>> How widely is that used?    
> >>>>> It exists in lima and panfrost, and I wouldn't be surprised if a
> >>>>> similar mechanism was used in other drivers for tiler-based GPUs
> >>>>> (etnaviv, freedreno, powervr, ...), because ultimately that's how
> >>>>> tilers work: the amount of memory needed to store per-tile
> >>>>> primitives (and metadata) depends on what the geometry pipeline
> >>>>> feeds the tiler with, and that can't be predicted. If you
> >>>>> over-provision, that's memory the system won't be able to use
> >>>>> while rendering takes place, even though only a small portion
> >>>>> might actually be used by the GPU. If your allocation is too
> >>>>> small, it will either trigger a GPU fault (for HW not supporting
> >>>>> an "incremental rendering" mode) or under-perform (because
> >>>>> flushing primitives has a huge cost on tilers).    
> >>>> Yes and no.
> >>>>
> >>>> Although we can't allocate more memory for /this/ frame, we know
> >>>> the required size is probably constant across its lifetime. That
> >>>> gives a simple heuristic to manage the tiler heap efficiently
> >>>> without allocations - even fallible ones - in the fence signal
> >>>> path:
> >>>>
> >>>> * Start with a small fixed size tiler heap
> >>>> * Try to render, let incremental rendering kick in when it's too
> >>>> small.
> >>>> * When cleaning up the job, check if we used incremental rendering.
> >>>> * If we did - double the size of the heap the next time we submit
> >>>> work.
> >>>>
> >>>> The tiler heap still grows dynamically - it just does so over the
> >>>> span of a couple frames. In practice that means a tiny hit to
> >>>> startup time as we dynamically figure out the right size,
> >>>> incurring extra flushing at the start, without needing any
> >>>> "grow-on-page-fault" heroics.
> >>>>
> >>>> This should solve the problem completely for CSF/panthor. So it's
> >>>> only hardware that architecturally cannot do incremental rendering
> >>>> (older Mali: panfrost/lima) where we need this mess.  
> >>> OTOH, if we need something
> >>> for Utgard(Lima)/Midgard/Bifrost/Valhall(Panfrost), why not use the
> >>> same thing for CSF, since CSF is arguably the sanest of all the HW
> >>> architectures listed above: allocation can fail/be non-blocking,
> >>> because there's a fallback to incremental rendering when it fails.  
> >> Yeah that is a rather interesting point Alyssa noted here.
> >>
> >> So basically you could as well implement it like this:
> >> 1. Userspace makes a submission.
> >> 2. HW finds buffer is not large enough, sets and error code and
> >> completes submission. 3. Userspace detects error, re-allocates buffer
> >> with increased size. 4. Userspace re-submits to incremental complete
> >> the submission. 5. Eventually repeat until fully completed.
> >>
> >> That would work but is likely just not the most performant solution.
> >> So faulting in memory on demand is basically just an optimization and
> >> that is ok as far as I can see.
> > Yeah, Alyssa's suggestion got me thinking too, and I think I can come
> > up with a plan where we try non-blocking allocation first, and if it
> > fails, we trigger incremental rendering, and queue a blocking
> > heap-chunk allocation on separate workqueue, such that next time the
> > tiler heap hits an OOM, it has a chunk (or multiple chunks) readily
> > available if the blocking allocation completed in the meantime. That's
> > basically what Alyssa suggested, with an optimization if the system is
> > not under memory pressure, and without userspace being involved (so no
> > uAPI changes).

Please no background task that tries to find memory, you're just
reinventing the background kswapd shrinking. Which even a GFP_NORECLAIM
should kick off.

Instead just rely on kswapd to hopefully get you through the current job
without undue amounts of tiler flushing.

Then just grow dynamic memory synchronously with some heuristics in the
next CS ioctl, that gives you appropriate amounts of throttling, no issues
with error reporting, and you can just use GFP_KERNEL.

> That sounds like it most likely won't work. In an OOM situation the
> blocking allocation would just cause more pressure to complete your
> rendering to free up memory.

The issue isn't oom, the issue is that GFP_RECLAIM can't even throw out
clean caches and so your limited to watermarks and what kswapd manages to
clean out in parallel.

Real OOM is much, much nastier, and there you should just get an ENONMEM
from the CS ioctl. Ideally at least, because that gives throttling and all
that nice stuff for free (for some value of "nice", lots of folks really
despise the stalls that introduces).

Cheers, Sima

> > I guess this leaves older GPUs that don't support incremental rendering
> > in a bad place though.
> 
> Well what's the handling there currently? Just crash when you're OOM?
> 
> Regards,
> Christian.
> 
> >
> >> That is then a rather good justification for your work Boris. Because
> >> a common component makes it possible to implement a common fault
> >> injection functionality to make sure that the fallback path is
> >> properly exercised in testing.
> > I can also add an fault injection mechanism to validate that, yep.
> >
> > Thanks,
> >
> > Boris
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
