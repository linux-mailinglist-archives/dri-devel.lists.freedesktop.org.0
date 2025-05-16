Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D491ABA0A4
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 18:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5D410EB0F;
	Fri, 16 May 2025 16:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="p42e4r+j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBA610EB0F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 16:12:12 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7c9376c4bddso262825285a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1747411932; x=1748016732;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6/foCbE5Wq0Xso6tyeNxk9D4GjTI97oBs1Ze76bf/1c=;
 b=p42e4r+jBTS1LNR57YsoDr99Po8MqlOo0PgSD/eYAS+zl/vSCfA1mNV/xLlb5bUQHb
 6Qk+jHACYpL5bbpF9WvyZFcqBUEpzyovcsraqU/eQf4j2N6c0t/ABuWp/Y3nLQQABg9h
 RLw15kRabh4m4XKTNOYcJLD+9/3CbHascFOCIga4rtnVJOaE1289LgoKx16YC2+DcgQN
 fr8OOcpob7Jv6oepitM3WTxrgokiJ+npqMmAETP8wxDrkivxlyF4VPJffJhJjo/LcWqi
 DjQ3e7Vwamo0WdOqOIBtuWaBIJyjURsKEI9qrchrSJpAc5TCh6vYwKlpknMJkMTbd09f
 4EzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747411932; x=1748016732;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6/foCbE5Wq0Xso6tyeNxk9D4GjTI97oBs1Ze76bf/1c=;
 b=nzg6vZ9Zj55ohtlDE7V/G77PjCYOiKmuniOXgWNmrBQedHEh8zrOp/IP2WCLrNfPW8
 h6miW3XErTseo8W2UCwO/z6dYHvokA6VERvGo4bhNUU2CSyI3OcO4AvIvusV9fwewDPA
 9T8Vfwe+OaDaVi+BG7NYBejkqbYigX3rK7qzxvukoukfqpbuGKFUEeqsohrDHij2tMY7
 UAGSRgz7vDRMBuV25wyNrEcOk9ZXUpb/zkfCQpFGd/YK+n6STcD3K2tsgX2oBkP2i4XK
 pqsRPmse2FSoCw904xS71B1Ap5XRdxVIK7JljDqD0+sB7fNnKttZGPTNL7eYBKRch5nN
 Ap5g==
X-Gm-Message-State: AOJu0YwheiGn2sfdNMn9oX0PNeetnGmeJQgOlZTXry3mQhasmatQypFf
 6r9Hbd/LlqQUxEv5l298Meg5JVefOAD9UOUb3fxXrEoH51H0RQ6w+y9lIoQdUQeHRBw=
X-Gm-Gg: ASbGncva/UtTQ6YpFlYYIZyQAIfPam/dPc88l7bkhbfMA9LDHJiIEDwfZYBNnn3XslT
 tNyGchMy7ACfkBTb6QF9+CIO5Onil2l5ZD534YPn0dDGORpbd1C8S3gBXVprbleW8d46cvcVq2P
 I1nQhyA6SIDyG2se71oY1ATuIwFh+u9FODojAiNAcjmv9Q/3GoKX5pG3LoW69YkaorZzgfYZ+cd
 +/FxGzmd/MTUmWRADF7tp79SoBV1eD7AAi7pU/tk7ZEQ5I6lXkSss1s6hsp8fzLnXrgV/CVzwKV
 mbw+oMa13zSS2V9dZzs9zydFxEFx357W+mXl8vkvGJbdUpnmPg==
X-Google-Smtp-Source: AGHT+IGSDDRQvoq5/KhBOed6CNzLZKnlfPZ3M2DWoplggEBng95wnrmjGCjJplI6E4lOaxAeG6aTgw==
X-Received: by 2002:a05:620a:3948:b0:7cd:145:d652 with SMTP id
 af79cd13be357-7cd46718966mr493753385a.12.1747411931648; 
 Fri, 16 May 2025 09:12:11 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7cd468ccd94sm132108585a.109.2025.05.16.09.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 09:12:10 -0700 (PDT)
Date: Fri, 16 May 2025 12:12:06 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org,
 christian.koenig@amd.com, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
Message-ID: <20250516161206.GC720744@cmpxchg.org>
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250507175238.GB276050@cmpxchg.org>
 <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
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

On Thu, May 15, 2025 at 01:02:07PM +1000, Dave Airlie wrote:
> > I have to admit I'm pretty clueless about the gpu driver internals and
> > can't really judge how feasible this is. But from a cgroup POV, if you
> > want proper memory isolation between groups, it seems to me that's the
> > direction you'd have to take this in.
> 
> Thanks for this insight, I think you have definitely shown me where
> things need to go here, and I agree that the goal should be to make
> the pools and the shrinker memcg aware is the proper answer,
> unfortunately I think we are long way from that at the moment, but
> I'll need to do a bit more research.

Per-cgroup LRUs are quite common, so we have a lib to make this easy.

Take a look at <linux/list_lru.h>.

It provides a list type as a replacement for the bare struct
list_head, along with list_lru_add(), list_lru_del() helpers.

Call memcg_list_lru_alloc() before adding objects, this makes sure the
internal per-cgroup data structures are all set up.

list_lru_add()/del() take a memcg argument, so you have to work out
how you want to plumb that down. page->memcg still sounds easiest to
me. That doesn't mean you have to use __GFP_ACCOUNT, considering the
dma allocation path; You can always memcg_kmem_charge_page() them by
hand after the allocation is done, which will set up the backptr.

For the shrinker itself, there are list_lru_shrink_count() and
list_lru_shrink_walk() helpers which are designed to slot right into
the shrinker callbacks. You only have to implement the callback to
isolate an item - this is where the LRU specific locking and reclaim
rules live, but that should be straight forward in your case.
