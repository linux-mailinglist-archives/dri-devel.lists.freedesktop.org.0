Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19111AE0FA7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 00:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B711D10E011;
	Thu, 19 Jun 2025 22:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="o09kz7wi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1185610E011
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 22:37:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 75F515C56C3;
 Thu, 19 Jun 2025 22:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714ECC4CEEA;
 Thu, 19 Jun 2025 22:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1750372665;
 bh=h1vxlDnif7B8TZawqR83m32DAxL4utsCoQcKr1pHeM4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o09kz7wi84WNm9EzW2qQ91d6DJOG2GUUHD/sIrad/cMSBG2L9HdavOX+O4jjJZHMF
 PIOHxcJWaS9FC8zFO1vMsrNuK4EPgIzpKV1Foyz3STBOcLMyIEdDu0Zm7fRlT8wyi5
 N3JxH2+JoRgL+qq0/P6ln+FU3jfdc+0sPYFtBDT0=
Date: Thu, 19 Jun 2025 15:37:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org
Subject: Re: [PATCH 1/2] mm: add gpu active/reclaim per-node stat counters (v2)
Message-Id: <20250619153744.eb9ee6202a7bccf3ae021443@linux-foundation.org>
In-Reply-To: <20250619072026.635133-1-airlied@gmail.com>
References: <20250619072026.635133-1-airlied@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 19 Jun 2025 17:20:25 +1000 Dave Airlie <airlied@gmail.com> wrote:

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

Acked-by: Andrew Morton <akpm@linux-foundation.org>
