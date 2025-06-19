Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4C5ADF9FA
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 02:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6603410E3C9;
	Thu, 19 Jun 2025 00:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dtu39QeF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B814710E3C9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 00:05:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F3BCF6116E;
 Thu, 19 Jun 2025 00:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4D5C4CEE7;
 Thu, 19 Jun 2025 00:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1750291522;
 bh=rGBkoGeD2sDR2V0t+gDO5g3elVeqUWjTZ76XinyvByE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dtu39QeFzJLW9pxcjcANUmHd926Jqn5CobO837NQGo1BIukfeZKRMYlhugdfAqpi9
 Ihfg2QFnak2JopKfWUZnSwmhdeZLFN9mQhbf40LGAbzmKZGEOlQO9GzNCAUi+TlKye
 l2v/klCxwQgMLwInyuPHQTDeQRTO4BZyFH2AjgtA=
Date: Wed, 18 Jun 2025 17:05:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org
Subject: Re: [PATCH 1/2] mm: add gpu active/reclaim per-node stat counters
Message-Id: <20250618170521.2469a575c04ed3ab1dd22b7a@linux-foundation.org>
In-Reply-To: <20250618040618.564650-1-airlied@gmail.com>
References: <20250618040618.564650-1-airlied@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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

On Wed, 18 Jun 2025 14:06:17 +1000 Dave Airlie <airlied@gmail.com> wrote:

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

Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
