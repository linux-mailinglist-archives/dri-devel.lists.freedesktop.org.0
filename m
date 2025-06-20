Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4E8AE2289
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 20:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D9910EBB2;
	Fri, 20 Jun 2025 18:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="naLg75YO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAD910EBCD
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:51:54 +0000 (UTC)
Date: Fri, 20 Jun 2025 11:51:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1750445509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rbkqHQu+Mtd4sR5ZeFRVR7X1WBuwy+yYDQbEaITYybk=;
 b=naLg75YODW3pb+AOoaKAJRK35d9O9/CGZpcV0COmeB9QK2a3QwBfMYCGP3wms9kdwvifvs
 VzSgzUA55ckTZLdUJxcEpRH14fn1PBLJOnix09x152N/WwmvUWVYugk2l70cmRiMqXWR8i
 sxN7yoT0caSRErXTwiOT44K/KR/Vh9E=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, 
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/2] mm: add gpu active/reclaim per-node stat counters (v2)
Message-ID: <qam3a7ulnbqwoceaexctxiyn4pucycynmv6cnyx2gci4rnmdoa@rdyiiwmitrda>
References: <20250619072026.635133-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619072026.635133-1-airlied@gmail.com>
X-Migadu-Flow: FLOW_OUT
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

On Thu, Jun 19, 2025 at 05:20:25PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> While discussing memcg intergration with gpu memory allocations,
> it was pointed out that there was no numa/system counters for
> GPU memory allocations.
> 
> With more integrated memory GPU server systems turning up, and
> more requirements for memory tracking it seems we should start
> closing the gap.
> 
> Add two counters to track GPU per-node system memory allocations.
> 
> The first is currently allocated to GPU objects, and the second
> is for memory that is stored in GPU page pools that can be reclaimed,
> by the shrinker.
> 
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: linux-mm@kvack.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

With Zi's suggestion, you can add:

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
