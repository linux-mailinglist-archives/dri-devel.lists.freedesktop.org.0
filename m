Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28587AB9EFB
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 16:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920A810EAF8;
	Fri, 16 May 2025 14:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="VYAN0YjP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7E810EAF8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:53:23 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-476a720e806so20882481cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1747407203; x=1748012003;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3liem+b8cA6/TclhL8mCksvmZ3Emi9zqV78pGY0077E=;
 b=VYAN0YjPoecxPRqEDiP7iM3zyO3yJabXzql3Mj0+FSZFT9D93gPdxTsOVuOHSzjjgU
 JJllgX59oIHNQWkyoIPb0RPzdSKTz0bQRG2t1xqmoLkRSd4ohu63pu/C9FqXw0hNBV2g
 Lxd2BVzcTBddTEGGbr2DxmNl+1EDcQOPic13Vw0Ksa+rHT09cunvvpKEK2EH2CgcdRcW
 dLSIrJ768e6MFPONnim7l0x0BedD7bKfrWN0TqWGjVhKjjMRmC89s7yySarO7cgeFt1T
 lA7mukg8r96WnOaW8/6rj+3h883LSB1zOy7rqkj3Da1QjzKC04sviZSW/wA7boQn4eJu
 7VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747407203; x=1748012003;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3liem+b8cA6/TclhL8mCksvmZ3Emi9zqV78pGY0077E=;
 b=e00qWELoTQaJ48dBZuYuS4SwyeQo/buEuzwkBbfG1MJyqWWe1SlDuuR+rkIwzsfNyz
 Y4DSM8w7MeEKZGcOVi5PwVmGsV5aUSg28JTsn9ux0XfKJ+fSPyXio/XnipgpM+m/1maQ
 xLBHdAoA428pXRf+WlZdvvaI/+dR9tGSX4bi9mf4szC+fOiGJCtSMadr9IatH+lrqDLQ
 nUxtOhda1xh59LiGG/ALN7eNmoTdap3oPI2AD44jHltaQ7N0BWp/MhbWbefPqN22Oyuq
 YUgUqE87JQQHA3YwIUYSXCCkABpSi991GzIwcUyo/+YE9Q/7Q47TLBv50GzXasDn26A3
 0Xjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZs/0R1HAxk6kmcBCaQphbxTpbhAsqkPZyTQVFyPVNbbj464Ti5kHHAPU7dIY+5rhi3qYKGc1acIY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuC3h2TOs1t1bzuhm4/EroxT7B4KWRc9x7UYn6dmBUgLY9cPhK
 heSrXH9CdHeLH75KHlrJpELnQLu//Wj8vXtZVwuqkNcZ1/w+YHt5sZ9shKtcvTOo4fg=
X-Gm-Gg: ASbGncuWCtgmsFw0dUsTh7vEEed6qb3vurgCH9fJKszTKLRfjS2khlh+0RE+ZKQ8H6Y
 jLYc+6hSbZV/bceGzF2Wy8JaAplgySA9GwqOg99S/UJ05/VYufXTfMD40nUpoJZiTG1fcldvu83
 F3DbSx7n65GIruIgC3MT/1a4IDKn/2iX/g9XzCfOsKM9vq9xqdslOQlH+8/sQRGctDfBlZNLAe5
 E5/Sq6D6KlLc8EP4ddjCANULGuE4kTXKhcWNGYTDD2iJuy8nqUS7eaXxSTMXLUfBQXfYKbFHoQ8
 /Ur2vlC8xJf+QH8F+R6uh3jvkXU/1YwMT762xYGYBi08rYoY0Q==
X-Google-Smtp-Source: AGHT+IE+hsSXV2yOA3E29yMTb4jXX1JHyTjCK/nx4iWIkVhTsLBzrdfnwNkfb3Re37+s7+VAS7UBUg==
X-Received: by 2002:a05:622a:4d05:b0:494:9908:d74d with SMTP id
 d75a77b69052e-494ae42d2aamr71668301cf.37.1747407203025; 
 Fri, 16 May 2025 07:53:23 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
 by smtp.gmail.com with UTF8SMTPSA id
 d75a77b69052e-494b8fa2cebsm3107461cf.34.2025.05.16.07.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 07:53:22 -0700 (PDT)
Date: Fri, 16 May 2025 10:53:18 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
Message-ID: <20250516145318.GB720744@cmpxchg.org>
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250507175238.GB276050@cmpxchg.org>
 <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
 <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
 <20250515160842.GA720744@cmpxchg.org>
 <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
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

On Fri, May 16, 2025 at 08:53:07AM +0200, Christian König wrote:
> On 5/15/25 18:08, Johannes Weiner wrote:
> >> Stop for a second.
> >>
> >> As far as I can see the shrinker for the TTM pool should *not* be
> >> memcg aware. Background is that pages who enter the pool are
> >> considered freed by the application.
> > 
> > They're not free from a system POV until they're back in the page
> > allocator.
> > 
> >> The only reason we have the pool is to speed up allocation of
> >> uncached and write combined pages as well as work around for
> >> performance problems of the coherent DMA API.
> >>
> >> The shrinker makes sure that the pages can be given back to the core
> >> memory management at any given time.
> > 
> > That's work. And it's a direct result of some cgroup having allocated
> > this memory. Why should somebody else have to clean it up?
> 
> Because the cgroup who has allocated the memory is long gone. As
> soon as the pages enter the pool they must be considered freed by
> this cgroup.

Nope, not at all.

> The cgroup who originally allocated it has no reference to the
> memory any more and also no way of giving it back to the core
> system.

Of course it does, the shrinker LRU.

Listen, none of this is even remotely new. This isn't the first cache
we're tracking, and it's not the first consumer that can outlive the
controlling cgroup.

> > The shrinker also doesn't run in isolation. It's invoked in the
> > broader context of there being a memory shortage, along with all the
> > other shrinkers in the system, along with file reclaim, and
> > potentially even swapping.
> > 
> > Why should all of this be externalized to other containers?
> 
> That's the whole purpose of the pool.
> 
> The pool only exists because the core memory management can't track
> the difference between unchached, write combined and cached
> memory. It's similar to moveable or DMA/DMA32.

And because of that, in the real world, you are operating a
shrinker-managed cache for those setup costs, yes? And I explained to
you the implications and consequences of that.

> > For proper memory isolation, the cleanup cost needs to be carried by
> > the cgroup that is responsible for it in the first place - not some
> > other container that's just trying to read() a file or malloc().
> 
> That makes no sense at all.

How about we stay in our respective lanes of expertise and find a more
productive way to get alignment on this, shall we?
