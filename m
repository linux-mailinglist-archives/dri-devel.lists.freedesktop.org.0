Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124EB1861A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 18:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A4210E30D;
	Fri,  1 Aug 2025 16:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="fYlS8lLk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF94C10E30D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 16:57:51 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7e050bd078cso93158385a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 09:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1754067471; x=1754672271; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PDG0NiUkE6aQQh2+3vtxR81GyiRPYX8OvGtHO76jA4Q=;
 b=fYlS8lLksMOJAnVKWPHJzGUDLJY+raiWV1zVZKoFAI0eAQiUa1bo8b1n5hOBeiXZe2
 EA0y93nwTBxLZ+5G4dty4740JQzxXUTt6vSTdB7Vq6wn2uU2ZirkADP63xY3zOYcbgmS
 0u/K/WZoG9PbD1+jTKLtgnxZ2/hKgM8f8CA0c/9prXt+lviRZsHgESeHfQXn6Yndsz0w
 TLyceu9lBTSjWUAqI7jiXRlq7m00qmtSldpbAcAbn2nrZIfKR2jl2J83YeFG1bA0SvWP
 trXRaGqbQQRuw+sJ9SpOP1qspxnGCiGTndYO5K3Fp3fg7LjAxLvVVmNc7rI0YEiNB0Qf
 QdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754067471; x=1754672271;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PDG0NiUkE6aQQh2+3vtxR81GyiRPYX8OvGtHO76jA4Q=;
 b=Z6/Mx9+710cNBVC9e3umf/b2z8llwGfhhOWBFV58EhUfBrN78c0+zO333N+tgR1Gjs
 L1ZBne3NThmtKu1tytoW5B2pQzLZ1eMBGgE2tXPE6jx4aq0DPGXvnQTPuqWb17I7oDJL
 w7bxEQ+rnkZ7n9VDySHZOhV4B2zunyGrfQnzRl4eU8Rz5OKVjQlFhMW6qwewQY/53Wnm
 tkOsL78hE2ymy4RsevOl5i9nYNWsflF/WCzlXCHZWMjmyyhVG0poQzw7Q6GUWUf1yeVI
 JxcZMN1KKFVvfbLVLqtvU7NwHW5kZFrJTIatEBqCsdGu8KcU0iZJT7WXfuc7g+Ivz+8g
 pVoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKAasbGOGu7YXx5fbrZkjWcaVFVog+tX3KYQ8Kcrc9hOLe6/6M+edDwROCXPvDf85znlr44q/k2jg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysvE84h0f0JZJQCVdXHIR2d9aa3iXDg//457k/+DJ5f2hdkb4V
 fMXu+/xdKcmZYxFfFboKBjWiH7l2fEKOJGTuna+dWWYkektX2Y9ocQ8o5it1ahr24sg=
X-Gm-Gg: ASbGnctrs8CQA4UfaNRJ2GsXpRvEuJxAImZM0V5jKmSvxijI2k9IbJN70TbMuXlnPDz
 9S2spus8/VhTBmZpMmon4eQXdMnSE8+XyyW9s1JLQ+EFPY/EgTwNqpVfKRsDE/A9u6HZjr4cLTo
 eKVtv4MXpDxN5HX6TPe3DbkiYyJlKvemUOBIH6Zbf4BeRRR+gwsHLsJtyOHq8nfxZC3RmnBRB1h
 xB4oVfLWmqMirXgqcE6Bw4Cz37VZS8ccOZ0QIdbjekRsBbLKpFrM9cSJ0X4uSGO38M1DlN6QAdd
 BVgHUWRt9Cht+x21WZgV8WnhKhj+zW2Ixb5xamE/dgqs1oIeyZNLzIFuAgcEGgQkTMMk3ZXHGzx
 qP0z7+ZmkVU1Vt+I+DWsahvPBAeXlyq3+CKTKf9qOYfASU7MtyL7R4fBw23QeizK8wPcR
X-Google-Smtp-Source: AGHT+IERBfIl6+3LPr31vnFrHmPwk8v4BHZ0fVqJ0PrqlgFbKe+fN+UuB/UkeSinm2wl6jaqpYu7OQ==
X-Received: by 2002:a05:620a:4093:b0:7e0:f7e3:7927 with SMTP id
 af79cd13be357-7e6962a98edmr81964885a.21.1754067470755; 
 Fri, 01 Aug 2025 09:57:50 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e67f597e32sm234364185a.18.2025.08.01.09.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 09:57:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uht4n-000000013IN-2zx7;
 Fri, 01 Aug 2025 13:57:49 -0300
Date: Fri, 1 Aug 2025 13:57:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>, Matthew Wilcox <willy@infradead.org>,
 Yonatan Maman <ymaman@nvidia.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@nvidia.com>, Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
Message-ID: <20250801165749.GF26511@ziepe.ca>
References: <aHpXXKTaqp8FUhmq@casper.infradead.org>
 <20250718144442.GG2206214@ziepe.ca>
 <aH4_QaNtIJMrPqOw@casper.infradead.org>
 <7lvduvov3rvfsgixbkyyinnzz3plpp3szxam46ccgjmh6v5d7q@zoz4k723vs3d>
 <aIBcTpC9Te7YIe4J@ziepe.ca>
 <cn7hcxskr5prkc3jnd4vzzeau5weevzumcspzfayeiwdexkkfe@ovvgraqo7svh>
 <a3f1af02-ef3f-40f8-be79-4c3929a59bb7@redhat.com>
 <i5ya3n7bhhufpczprtp2ndg7bxtykoyjtsfae6dfdqk2rfz6ix@nzwnhqfwh6rq>
 <20250801164058.GD26511@ziepe.ca>
 <b8009500-8b0b-4bb9-ae5e-6d2135adbfdd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8009500-8b0b-4bb9-ae5e-6d2135adbfdd@redhat.com>
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

On Fri, Aug 01, 2025 at 06:50:18PM +0200, David Hildenbrand wrote:
> On 01.08.25 18:40, Jason Gunthorpe wrote:
> > On Fri, Jul 25, 2025 at 10:31:25AM +1000, Alistair Popple wrote:
> > 
> > > The only issue would be if there were generic code paths that somehow have a
> > > raw pfn obtained from neither a page-table walk or struct page. My assumption
> > > (yet to be proven/tested) is that these paths don't exist.
> > 
> > hmm does it, it encodes the device private into a pfn and expects the
> > caller to do pfn to page.
> > 
> > This isn't set in stone and could be changed..
> > 
> > But broadly, you'd want to entirely eliminate the ability to go from
> > pfn to device private or from device private to pfn.
> > 
> > Instead you'd want to work on some (space #, space index) tuple, maybe
> > encoded in a pfn_t, but absolutely and typesafely distinct. Each
> > driver gets its own 0 based space for device private information, the
> > space is effectively the pgmap.
> > 
> > And if you do this, maybe we don't need struct page (I mean the type!)
> > backing device memory at all.... Which would be a very worthwhile
> > project.
> > 
> > Do we ever even use anything in the device private struct page? Do we
> > refcount it?
> 
> ref-counted and map-counted ...

Hm, so it would turn into another struct page split up where we get
ourselves a struct device_private and change all the places touching
its refcount and mapcount to use the new type.

If we could use some index scheme we could then divorce from struct
page and strink the struct size sooner.

Jason
