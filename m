Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPDTAppNemkp5AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 18:55:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640A9A74EB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 18:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A544D10E750;
	Wed, 28 Jan 2026 17:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="dK+jjXKz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887B510E2D7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 17:55:33 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-894770e34afso1790186d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 09:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1769622932; x=1770227732; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3xBSS0DeVw8xEgvg0/l6ZgQewOha1VHL+sr48ksbiD8=;
 b=dK+jjXKz+DO8jK3VmI/EXhnR6zJ5+H39U5V9gWNyJEJKo0hlo8QnIGw7eb+BxNE6gx
 4v7Zb2EojbQizvUNZVjgcQuIySvyo8fXReejYZQN+BJVujGep1tX5evilfmUTh7EaVWq
 6DKnAl4G1yPxuYf5fxTJ/wD6oLLk14d9HrwaP8+A1Ydvu0qM3iEShcyIBQJS98ysACG2
 K6KvMs7zDVH16wRUFEnAkwyxpqKoZd3EmeGYZHZNR7GmFrhtTsP4cr3iXH1tQfZTqn55
 oLdqumbcQLLCKlJjMDTv1AZc1bxsx+IBNxj0rH/nNZoFstYeskx5DlAhSQdmySIUVL5S
 y3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769622932; x=1770227732;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3xBSS0DeVw8xEgvg0/l6ZgQewOha1VHL+sr48ksbiD8=;
 b=ccjQZGoarodXujG4g+PoUCG1/ZPZ1ufs05TSs8fyouGrYWLpaaEOavNjunESeKvzpp
 k7vCqIKT160FwNpKU+IhqJsW5O7EIHw9JkKcC/AVhcfZL2Ra3sJ5E85LhKgVtPZP7LBV
 gLgkTKEdBFNoG5j6Mek9EW3qkhnDLVfmwPZ2ecarsp9oP1DrwCxmU7jO6ZnebXv+r81W
 oyBbSTJlWfXWoTwSaUHYrQobIti4CPkqcOMraaaSBFeVKqjwX6Jabz+/fx2KLs48LvJL
 JgwTSM86RpO0Dxk4joSvy65rCs2G1eoA31s2USP5p5iTmsEbmGZ1gslT1qBMmWYKBNlY
 ZEEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqmNJ/jnmAaOROHaYL0hjC5+H2ZbKQKH7X06qkUhBBN0XQtzFpe0wohAinVGBMjfv6XV+AGbKW+SI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSekZHdSMOdxcOTGfX2lg0pt8sGpulevzbynuvGbknb2/aeBYG
 +3pgwD6Q1LdLemcfBeLeUYvJSvJaBnD6PCEjbw6QG8YYC/zXPvJncGxGkuQy+nwnyIY=
X-Gm-Gg: AZuq6aJlWUvUqyzuzHqtYqdrkaB4qA+XDImqeXo3uKNqo/ENUysqeo+6n6WBWH47A4U
 ye6XXnNkA7DJrAGBqqLTqDr40C3LRh0ZzWXYSCTlv3dK1rar004hC36B3b1PbTWxHgtBx1oOZhx
 +nsGFazyBSZZHt9dFKovlOtOnNukzF9lYxI6bpC8LoTEbMnOx0wMVV2CueWFiOqJGNLl4WNPUji
 trmnFnSjWxkCKfksCY0m/AzzU6HWQOYgJkoFQou6yjth9bFR3rULJJ9ghxcjuW3373GsqEYjIap
 4ed7KXoirodA6wsuTkqnPjYbgB/rpp3aYTpkAGjjsVGqccosnDNc+splzCqz7kN1jUxlsv0ICtW
 QmK4xMRXTyzeKG+YeiaEJBCUogN1TQylB3s9vyu4ZqZZ5CHOfOxqNtPTmyBcnpT3oI4M/iIWVbU
 38jWVckLSMsGUKzEl8Ey1lC76D/EF4uDLNQG+BNwgETXbFg0O0J5MA2pzb13ub4EOzSkY=
X-Received: by 2002:a05:6214:23cb:b0:889:b6f1:1f30 with SMTP id
 6a1803df08f44-894cc834d99mr88314886d6.18.1769622932463; 
 Wed, 28 Jan 2026 09:55:32 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-894d375c0d8sm21091826d6.43.2026.01.28.09.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 09:55:31 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vl9lL-00000009Zjn-285x;
 Wed, 28 Jan 2026 13:55:31 -0400
Date: Wed, 28 Jan 2026 13:55:31 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Leon Romanovsky <leonro@nvidia.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: Re: [RFC PATCH v3 04/11] drm/pagemap: Use dma-map IOVA alloc, link,
 and sync API for DRM pagemap
Message-ID: <20260128175531.GR1641016@ziepe.ca>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-5-matthew.brost@intel.com>
 <20260128142853.GH40916@unreal>
 <aXpLhN08jVbltQC0@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXpLhN08jVbltQC0@lstrano-desk.jf.intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:leonro@nvidia.com,m:intel-xe@lists.freedesktop.org,m:francois.dugast@intel.com,m:thomas.hellstrom@linux.intel.com,m:himal.prasad.ghimiray@intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 640A9A74EB
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 09:46:44AM -0800, Matthew Brost wrote:

> It is intended to fill holes. The input pages come from the
> migrate_vma_* functions, which can return a sparsely populated array of
> pages for a region (e.g., it scans a 2M range but only finds several of
> the 512 pages eligible for migration). As a result, if (!page) is true
> for many entries.

This is migration?? So something is DMA'ing from A -> B - why put
holes in the first place? Can you tightly pack the pages in the IOVA?

If there is no iommu then the addresses are scattered all over anyhow
so it can't be relying on some dma_addr_t relationship?

You don't have to fully populate the allocated iova, you can link from
A-B and then unlink from A-B even if B is less than the total size
requested.

The hmm users have the holes because hmm is dynamically
adding/removing pages as it runs and it can't do anything to pack the
mapping.

> > IOVA space? If so, what necessitates those holes? You can have less mapped
> > than IOVA and dma_iova_*() API can handle it.
> 
> I was actually going to ask you about this, so I’m glad you brought it
> up here. Again, this is a hack to avoid holes — the holes are never
> touched by our copy function, but rather skipped, so we just jam in a
> dummy address so the entire IOVA range has valid IOMMU pages.

I would say what you are doing is trying to optimize unmap by
unmapping everything in one shot instead of just the mapped areas, and
the WARN_ON is telling you that it isn't allowed to unmap across a
hole.

> at the moment I’m not sure whether this warning affects actual
> functionality or if we could just delete it. 

It means the iommu page table stopped unmapping when it hit a hole and
there is a bunch of left over maps in the page table that shouldn't be
there. So yes, it is serious and cannot be deleted.

This is a possible option to teach things to detect the holes and
ignore them..

Jason
