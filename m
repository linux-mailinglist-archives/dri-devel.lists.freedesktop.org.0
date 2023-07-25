Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB2F7624B5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 23:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9443710E1B6;
	Tue, 25 Jul 2023 21:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368C010E18E;
 Tue, 25 Jul 2023 21:44:15 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1b9ecf0cb4cso34888375ad.2; 
 Tue, 25 Jul 2023 14:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690321455; x=1690926255;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=LMF20IZtbfCz3aU/3bfXT+An6WYKlC9WFpBOERsbLtc=;
 b=cuSOP3cY00kalmUDb+byhPR92kTHul30bSE157ciDmWkuI3153sw6DFVNwFXC73ZZH
 AMb7lJ2vBq3NfzlR75VP9ViihITZUUBuwZSP+iZbcnGqMdmLWEqXA3VleLVomwy1AQ7K
 ot9lBHyDBPxyHGh8V0vMqtTuB/kS4Flz9vR00TJzFanJ7/hOzkkIhAlOcCaVYUWR/q4O
 PXmqDHD51oaTBEblzjHQjFk3hcSdEHYiNZdxxP7RxHHD4HSfdG65/jyaMhgqcPMVdOgf
 DDMqgL1wXsE0INWvlim252xKspmHeBqwoIe1+prRY5UcjPYodxV6TTiAF6/c+R5lSC29
 IUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690321455; x=1690926255;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LMF20IZtbfCz3aU/3bfXT+An6WYKlC9WFpBOERsbLtc=;
 b=LQOvzvWSknKYgceGhhkViXf0WTnVY0++GZ+lbZKAcuHzAOyHD60xbgZwviaZ3dJPi/
 lzT4jn0/fjdJvWejUiGfnm/TtUwKovEc0UughmMW976jRQi3Z45Ul8ip5TTtGxWrPUIB
 1ThQWdQSXZsTLhzn8fzosETGyteQShdVhbI8egGX46B+tm1r07f3rSFZVn6a4Mq8cbw0
 7KZ1HdnsPCtH+IjdpqtfMPHw5psL9Ny91EeHqtCu2R6azKQhNwDzEWxowV4S3Nbzu5Ze
 945cc9POxApbHYplTrqbfglRdBQa0vd0QQgbMV9FyP0s09KAkpNDkzsUGr5jQRGY1RCn
 TJDA==
X-Gm-Message-State: ABy/qLbxqrReb7iUQHh9JgX5aNbcaibU3iq6Sz1e3Bxz128bUzULFljY
 qi06Z9YI9jMVNp8G6q4yRDGeU0kn3q0=
X-Google-Smtp-Source: APBJJlGEvIWL8IjcRtZzTTX4hJPQpgL1X1ro3T1G7CJ0ISXDwtKv3zqQvmRPdYNOVSRJKkvn3KdUjA==
X-Received: by 2002:a17:902:e314:b0:1bb:c64f:9a5e with SMTP id
 q20-20020a170902e31400b001bbc64f9a5emr323769plc.5.1690321454499; 
 Tue, 25 Jul 2023 14:44:14 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:18d])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a170902d34900b001b86f1b5797sm2642688plk.302.2023.07.25.14.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 14:44:14 -0700 (PDT)
Date: Tue, 25 Jul 2023 11:44:12 -1000
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 15/17] cgroup/drm: Expose GPU utilisation
Message-ID: <ZMBCLJMLL_cl9G_e@slm.duckdns.org>
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
 <20230712114605.519432-16-tvrtko.ursulin@linux.intel.com>
 <ZLsEdJeEAPYWFunT@slm.duckdns.org>
 <ZLsEomsuxoy-YnkA@slm.duckdns.org>
 <3b96cada-3433-139c-3180-1f050f0f80f3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b96cada-3433-139c-3180-1f050f0f80f3@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 Eero Tamminen <eero.t.tamminen@intel.com>,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Tue, Jul 25, 2023 at 03:08:40PM +0100, Tvrtko Ursulin wrote:
> > Also, shouldn't this be keyed by the drm device?
>
> It could have that too, or it could come later. Fun with GPUs that it not
> only could be keyed by the device, but also by the type of the GPU engine.
> (Which are a) vendor specific and b) some aree fully independent, some
> partially so, and some not at all - so it could get complicated semantics
> wise really fast.)

I see.

> If for now I'd go with drm.stat/usage_usec containing the total time spent
> how would you suggest adding per device granularity? Files as documented
> are either flag or nested, not both at the same time. So something like:
> 
> usage_usec 100000
> card0 usage_usec 50000
> card1 usage_usec 50000
> 
> Would or would not fly? Have two files along the lines of drm.stat and drm.dev_stat?

Please follow one of the pre-defined formats. If you want to have card
identifier and field key, it should be a nested keyed file like io.stat.

> While on this general topic, you will notice that for memory stats I have
> _sort of_ nested keyed per device format, for example on integrated Intel
> GPU:
> 
>   $ cat drm.memory.stat
>   card0 region=system total=12898304 shared=0 active=0 resident=12111872 purgeable=167936
>   card0 region=stolen-system total=0 shared=0 active=0 resident=0 purgeable=0
> 
> If one a discrete Intel GPU two more lines would appear with memory
> regions of local and local-system. But then on some server class
> multi-tile GPUs even further regions with more than one device local
> memory region. And users do want to see this granularity for container use
> cases at least.
> 
> Anyway, this may not be compatible with the nested key format as
> documented in cgroup-v2.rst, although it does not explicitly say.
> 
> Should I cheat and create key names based on device and memory region name
> and let userspace parse it? Like:
> 
>   $ cat drm.memory.stat
>   card0.system total=12898304 shared=0 active=0 resident=12111872 purgeable=167936
>   card0.stolen-system total=0 shared=0 active=0 resident=0 purgeable=0

Yeah, this looks better to me. If they're reporting different values for the
same fields, they're separate keys.

Thanks.

-- 
tejun
