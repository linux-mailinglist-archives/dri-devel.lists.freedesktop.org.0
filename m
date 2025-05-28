Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83938AC7476
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 01:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D5710E19A;
	Wed, 28 May 2025 23:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="zCViqKCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D8E10E19A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 23:20:54 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-22d95f0dda4so3912805ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1748474454; x=1749079254;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kRk/j4UJcpI25iSYs2tNOZ2YhqltfiULVUyfUcUgcnw=;
 b=zCViqKCa4FmETrpe5+zpGZULokCzJQ8Waf/PTot6d662aNzSTgQP4kbt5e28yznqDR
 /LqLo0z6oYRDFpW0W7vbO/WmF3/PygjK3MHlCZxFHqaKGB3gXcXLYHp1ePIguOi8qpll
 x3JcPNKpI5swRtkMgBOReoUQjJacwYeRSKWlmMN1qmukhjMwkDR7ElyiNrdVhm68B8em
 O3Bt2I87mYHZI+vLoSGY9U7UOXpxnr2st8DgWfySb6fy5zmVgFPxYHtDWns9hyOzrweF
 x7lT0kbKNTAa05ie1IfrehyVnYNVkkTHSf4DjOmg8OkCraGWKhHMCVeXsQsO2bc8spwK
 mylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748474454; x=1749079254;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kRk/j4UJcpI25iSYs2tNOZ2YhqltfiULVUyfUcUgcnw=;
 b=PtubYyFvtaCwA89giukg8oFxbU600sdjFKzTPcCs9Ty2S6bV6epyYHjTmLbN8YXtzi
 a4c7OwZLVZDHLo39srSTqLQlvj/PN2VxTVSKmZnPPi0ZO/sEm0xArUTCkDD8N21L7C4L
 x65aR1mQ/cME0Y+G/nyiBZ8UtKAgrPqUv1lxZOZVBR+RNF1JRNdBYbbclt4l/9+UQCkT
 opcx/jAt1ZuXdw39T6xC9d16nEIbG8urtfuTXK0whonhGjQdsbUyhkSEeCQeCfZMzp2U
 CoYPbusMnGudCJ3dxb6xg9qohDW8dlIuYX1VraYttCbWo8GIs/IimSl3JKewQzmWOA+5
 jddA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpaosVn8k9wqaZbgr6OZPx+EqCr2FHKlY+9wpK//AxMxT/EGhmM/U5nxv/a8nLYvRKeSxhCfO8Zf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjmaV4wExq+Ev8/0X6Tp3PV1+TvltsYK7ov0gQqJ09CQNLpocS
 +UEcq2jQSFcjvkMZ5a25vxi935eeMjMj5y3q7yBODqNHODwjNM7Nh2AQT+h9+emYtJY=
X-Gm-Gg: ASbGncvvFgNek7z1gQPcuGVP4jNsGLNflN0N4nnsJyR0rSBZQyucevTHSsw+0nuDPJ/
 +tzxxcUFvhhfPq5+VjW7jJUVxzW8jM8tvIQ9MKnz6rij/zykyfXlUq+/CmKBMppsjX61g84avBR
 x9r5gvsKsp/uWTFhxElQY3mrt7+lrOlUIitc7qW5IctjAhgEAms0lrM7tHw3xj7x/RTH3hWx680
 5DElSrW461sZ55Ifd8K7sSjw58uczsh79x6zJ9bV0KPI82OPu51KmPNaSWiY7FlbL50DWlUhfLZ
 ZDYUFa524ILs5MlK/qaZpsxnCYk77XpUYy9dfUEp5LFC5gZS6MEDkXQ0svH6Z2iajI4RHFytAgG
 i/fj/12oDEDZ9BVMP/sPxHBVsCys=
X-Google-Smtp-Source: AGHT+IE+iJcdkq2qRpwQMOP8EM7B7lfm3d9HfLW2u7q7q3Ri0wJ9I/OqIP0Ok4UmAWqGijwp3lYyJw==
X-Received: by 2002:a17:902:d506:b0:234:eea2:9483 with SMTP id
 d9443c01a7336-234eea2b09dmr30173335ad.51.1748474453949; 
 Wed, 28 May 2025 16:20:53 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-184-88.pa.nsw.optusnet.com.au.
 [49.180.184.88]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506d21802sm1167265ad.215.2025.05.28.16.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 16:20:53 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
 (envelope-from <david@fromorbit.com>) id 1uKQ4o-00000009Opy-1fvz;
 Thu, 29 May 2025 09:20:50 +1000
Date: Thu, 29 May 2025 09:20:50 +1000
From: Dave Chinner <david@fromorbit.com>
To: Dave Airlie <airlied@gmail.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kasong@tencent.com,
 nphamcs@gmail.com
Subject: Re: list_lru operation for new child memcg?
Message-ID: <aDeaUkvbakteBtZQ@dread.disaster.area>
References: <CAPM=9tyJgHPp5N6XpauFRL1hZDLCG8L+9Gmi7RCLRaK4BN4tzA@mail.gmail.com>
 <aDTmUw-CQYuZ1THd@dread.disaster.area>
 <CAPM=9txBdeJmAhZb1XW=3m-uxPxfDdQgb=PCBvssoJkQQDAdFw@mail.gmail.com>
 <aDT-B0EqqDeqXYFh@dread.disaster.area>
 <b20606e9-fc73-4f8c-91a7-e059a9fbce1a@amd.com>
 <CAPM=9txMcS4TsU5M8v6yGH7T7vbAFJM_yw0CVdZWPUpWfNLqmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPM=9txMcS4TsU5M8v6yGH7T7vbAFJM_yw0CVdZWPUpWfNLqmg@mail.gmail.com>
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

On Thu, May 29, 2025 at 07:53:55AM +1000, Dave Airlie wrote:
> On Wed, 28 May 2025 at 17:20, Christian König <christian.koenig@amd.com> wrote:
> >
> > Hi guys,
> >
> > On 5/27/25 01:49, Dave Chinner wrote:
> > > I disagree - specifically ordered memcg traversal is not something
> > > that the list_lru implementation is currently doing, nor should it
> > > be doing.
> >
> > I realized over night that I didn't fully explored a way of getting both advantages. And we actually don't need list_lru for that.
> >
> > So here is a side question:
> >
> > Is it possible to just have a per cgroup counter on how many pages a cgroup released back to a particular pool? E.g. something which is added up to the same counter on the parent when a cgroup is released.
> >
> > Background is that the pages are not distinguishable from each other, e.g. they are not cache hot or cold or anything like this. So it doesn't matter which pages a cgroup has released but only how many.
> >
> > If it would be possible to get such a counter then it would be like just a few lines of code to add the isolation and still get the advantage of sharing released pages between different cgroups.
> 
> I think numa is the only possible distinction I can see between pages
> here, even uncached GPU access will be slower to further away numa
> nodes,
> 
> But indeed this might be a workable idea, just make something that
> does what list_lru does but just for the counters, and keep the pages
> in a single pool.

If you only want NUMA aware LRU + reclaim/reuse without memcg
awareness, list_lru supports that configuration. Use list_lru_init()
for numa-aware LRU infrastructure, list_lru_init_memcg() should only
be used if need memcg awareness in the LRU.

THere are various caches that use this config e.g. the XFS buffer
cache and dquot caches because they are global caches whose contents
is shared across all cgroups. The shrinker associated with them is
configured only as SHRINKER_NUMA_AWARE so that reclaim is done
per-node rather than as a single global LRU....

-Dave.
-- 
Dave Chinner
david@fromorbit.com
