Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4C775D763
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 00:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C496710E70D;
	Fri, 21 Jul 2023 22:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3330110E70C;
 Fri, 21 Jul 2023 22:21:59 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-262c42d3fafso1662235a91.0; 
 Fri, 21 Jul 2023 15:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689978119; x=1690582919;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=91mL5jfG2O2HHjlTT7P8VaJYQOxhCgdT7EC1VTa5Mlk=;
 b=HoTrEYR2GIsVg0GudEbf1N4STKpjkBfxcIxV8y4tckabtqJiXjkWnRyTMvEvodEDKy
 03wenOijhJ+tz7aJDaz6ktZq2S+2ea84w8eFBiNgmFbHdK3MdKsab/DgPlyqg57SV9mL
 IGK9P1QQ1OSJTXDk3wrx0YWu81fBhzrZK7dvLtbfMBKSOnWl3qh8LtIB4j6mN6+41KcR
 CPzHBXacWVpcD7202RYxOO6l77KD3p35XYRFkjBMvI62PoRHwECevgNiUY75d76DmXUK
 HnA6FyFKxSgAi4SNMPpnrnVccOXAIhNLC7OXA0S1Z7aFf6+LPA9HGgSVVY9xeboyvKdz
 tSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689978119; x=1690582919;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=91mL5jfG2O2HHjlTT7P8VaJYQOxhCgdT7EC1VTa5Mlk=;
 b=SLBs01Ucq43ipB+fAu3xGi42faKAp1tk6tEx1Z7b0gEYmZyteAHtm1mTowYLbWM4u5
 1EBgrsYFqDs64fW2jzpAhQoCuc2B0RkdzI0yya27nAi5qXSa7TLUQneY6Kr87wtcXJUB
 WNLHXZVhJbCbvOxihLyn9zRcifo9GmLoVbKQd292uYXXhWBr6sdAuNI6y65EjExu6Jc1
 3y9N1VLdRKAQ9/dcVztMB1/5/iPZ+dyWn8tJ2w7IhzTMoE7fUw93d60KjGUGoNWqqgjI
 SDb79g9cb4to/KS+lnd5/6zG1GDO/v4ot4YcayeEbRCOUAk4iNFf4TqDvhSLlZZ9e4Ba
 QDrw==
X-Gm-Message-State: ABy/qLZL9XhMj1YCJGFmCYZNS+TzaMdBKrpxlqgo/x+NmcnQnGIk9Lo+
 6ZeMLpqQhcm5pLU07qwFJEA=
X-Google-Smtp-Source: APBJJlHKMa7ltMEibHTz8p6SimlBXW/dfy5JPiBMaVtarDRYEJmmQv5gvJ8rHnOz8BqcCK2OH/SWEg==
X-Received: by 2002:a17:90a:4a0f:b0:263:f521:da3e with SMTP id
 e15-20020a17090a4a0f00b00263f521da3emr4581496pjh.2.1689978118480; 
 Fri, 21 Jul 2023 15:21:58 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:fbd8])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a17090aae8300b00265a7145fe5sm4626319pjq.41.2023.07.21.15.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 15:21:58 -0700 (PDT)
Date: Fri, 21 Jul 2023 12:21:56 -1000
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 16/17] cgroup/drm: Expose memory stats
Message-ID: <ZLsFBHqCQdPHoZVw@slm.duckdns.org>
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
 <20230712114605.519432-17-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712114605.519432-17-tvrtko.ursulin@linux.intel.com>
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

On Wed, Jul 12, 2023 at 12:46:04PM +0100, Tvrtko Ursulin wrote:
>   $ cat drm.memory.stat
>   card0 region=system total=12898304 shared=0 active=0 resident=12111872 purgeable=167936
>   card0 region=stolen-system total=0 shared=0 active=0 resident=0 purgeable=0
> 
> Data is generated on demand for simplicty of implementation ie. no running
> totals are kept or accounted during migrations and such. Various
> optimisations such as cheaper collection of data are possible but
> deliberately left out for now.
> 
> Overall, the feature is deemed to be useful to container orchestration
> software (and manual management).
> 
> Limits, either soft or hard, are not envisaged to be implemented on top of
> this approach due on demand nature of collecting the stats.

So, yeah, if you want to add memory controls, we better think through how
the fd ownership migration should work.

Thanks.

-- 
tejun
