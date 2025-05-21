Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C210DABF813
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 16:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C95C10E8AA;
	Wed, 21 May 2025 14:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="0MIcf4mK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F410018A7A9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 14:43:17 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6f8c53aeedbso92522816d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 07:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1747838596; x=1748443396;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tm5t+Bgq7540ocHTCpxJRFMuSZJmOFrIbkmxzwr4YdE=;
 b=0MIcf4mKGQLQZk6+fuXG5xC45YOGMhhRFxuXsKX6ycST3cQy88SBmqywXnTpObI1Hc
 ihG+41TnTSIDWBmfkziteS8fwcC8REiyXjj0BNYc7Be0h9FDcR4cuO2lORhOTFTfOYIz
 tbMeAShoNzk8Yg2vYOm1ueogk3ebBLaj67XJMfcBc79YrZIN35duItqTnPaZyFxm2na6
 Q0hFtxVgyID+7ZvwwS4pOSnW8SfiviOA88g8VuAgeLQG3YqHDWe9qhBN+qS+Akvr5nSq
 joENvmGkMh4RTPGrslToQlq6Dbzb+mQ0UFt4UrPTl38bYnOfJ0VfLDYLlvqQo0JBSnje
 OiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747838596; x=1748443396;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tm5t+Bgq7540ocHTCpxJRFMuSZJmOFrIbkmxzwr4YdE=;
 b=HNB/w44PpWbhaSowC4zDcla2GzSNGPQycdrGBoFz+8i+eTQ6FyLQHXPDgj8mxPoqnm
 Of74eHTuEJSJoiZZewHUq/U6g0OsKydZS8Wrgv7gQf/wwHhujCNFC5SJ3vLzwXtIPK02
 HMgjOCmPNN4JSKu3k5nK6CYIeNHcnZq+UU1tdxDaBh5Bwhdn6nqU2+jmkBKsT+vg/s2M
 mq1UxVysqbszqKoMdVQ2Ltc5hPs/rDxlvAuu7KnG8BGy4Ws0jKYapc10wyJYonUXPmHC
 rxZpth+AG1yVfzakv+/SoadZ61PqRs9/7LDCtvmEY098gnq4ES4qVJ3V5NpdEeXpCXML
 EqDQ==
X-Gm-Message-State: AOJu0Yzb+Ecy6jS9m5wtyo60Q/lWuTxrwPD8e7dswjngOPPrTNDaYPJe
 dICo2n10tpHTG6HH9RVxfOPeGs+dNP2eMXvIopCR51EnDe62vhZWkMC948KnaIfUT/E=
X-Gm-Gg: ASbGnctL9vzWKvjsQVjvCqPV9AXKsFOno3B8Mf174D16oW4RgkcEmx3wK7Z4nYVMaPU
 jw6QGunSV5ilmESjVgywcI1H6yK57iKwuuQIiUSJaRNmWAJ9eJstOqlfJjNDJ9O6mkAVtm2E5xN
 CQm7HhucKmUFKY0FGviFbh0HiBNfKzowM+NAXlaPtQ4XrygFdaBzmDCn1WgG+sZFJg6AwT6qaoH
 tkvTj/Ku2sCAHwtGW880ZgVWQ2In9hCiLFi81PhMspoeinNqXL394Iykh0yvXf6m1YqW5Jkr9Yn
 pEURDxaZtND5Q3ePFqR1Q6qEDaAgLVWfPtbvDiqOikw0rgN/ew==
X-Google-Smtp-Source: AGHT+IHEM+wvUcEaGmWTryHjewq8bJ6N/GLkNLp803DMsIdPw7rLGbMkCkeiFVtKhclLf9k4Ii/+7Q==
X-Received: by 2002:a05:6214:932:b0:6f8:b73e:8e65 with SMTP id
 6a1803df08f44-6f8b73ea51bmr256380506d6.18.1747838596519; 
 Wed, 21 May 2025 07:43:16 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6f986a86b90sm7541296d6.97.2025.05.21.07.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 07:43:15 -0700 (PDT)
Date: Wed, 21 May 2025 10:43:12 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org,
 christian.koenig@amd.com, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
Message-ID: <20250521144312.GE773385@cmpxchg.org>
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250507175238.GB276050@cmpxchg.org>
 <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9tw+DE5-q2o6Di2POEPcXq2kgE4DXbn_uoN+LAXYKMp06g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9tw+DE5-q2o6Di2POEPcXq2kgE4DXbn_uoN+LAXYKMp06g@mail.gmail.com>
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

On Wed, May 21, 2025 at 12:23:58PM +1000, Dave Airlie wrote:
> >
> > So in the GPU case, you'd charge on allocation, free objects into a
> > cgroup-specific pool, and shrink using a cgroup-specific LRU
> > list. Freed objects can be reused by this cgroup, but nobody else.
> > They're reclaimed through memory pressure inside the cgroup, not due
> > to the action of others. And all allocated memory is accounted for.
> >
> > I have to admit I'm pretty clueless about the gpu driver internals and
> > can't really judge how feasible this is. But from a cgroup POV, if you
> > want proper memory isolation between groups, it seems to me that's the
> > direction you'd have to take this in.
> 
> I've been digging into this a bit today, to try and work out what
> various paths forward might look like and run into a few impedance
> mismatches.
> 
> 1. TTM doesn't pool objects, it pools pages. TTM objects are varied in
> size, we don't need to keep any sort of special allocator that we
> would need if we cached sized objects (size buckets etc). list_lru
> doesn't work on pages, if we were pooling the ttm objects I can see
> being able to enable list_lru. But I'm seeing increased complexity for
> no major return, but I might dig a bit more into whether caching
> objects might help.
> 
> 2. list_lru isn't suitable for pages, AFAICS we have to stick the page
> into another object to store it in the list_lru, which would mean we'd
> be allocating yet another wrapper object. Currently TTM uses the page
> LRU pointer to add it to the shrinker_list, which is simple and low
> overhead.

Why wouldn't you be able to use the page LRU list_head with list_lru?

list_lru_add(&ttm_pool_lru, &page->lru, page_to_nid(page), page_memcg(page));
