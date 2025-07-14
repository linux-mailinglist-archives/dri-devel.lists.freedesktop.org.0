Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD94B047A7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 21:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BEF10E32D;
	Mon, 14 Jul 2025 19:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Ib/LwqBF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com
 [95.215.58.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941AA10E32D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 19:01:22 +0000 (UTC)
Date: Mon, 14 Jul 2025 12:01:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1752519679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eIWAMDf01S9AC5e/jda+gJQyMNt1EfFUsf2D7gRfs0Y=;
 b=Ib/LwqBFEbdnFAJzSVTc7odURD3pSccMGiqesZ9uIbUsjtUXmT+5dShTNFMq0Rf5xPCQbq
 C8jkm/yYYdFnBe+i+PwB2vfr9zgQyjCDLLhTGjXcVIqGwcH4SIMRZzy2VlZodKdzDndpKU
 50X2PHUky24sZxwVZx1aURnPYNhZioM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>, 
 Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>, 
 Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 03/18] mm/list_lru: export list_lru_add.
Message-ID: <zbi7m233yazj5qibxayuk2hxpkponb5uuyx4oe6jnuaowxrxqi@jwozr7ekmtrx>
References: <20250714052243.1149732-1-airlied@gmail.com>
 <20250714052243.1149732-4-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714052243.1149732-4-airlied@gmail.com>
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

On Mon, Jul 14, 2025 at 03:18:18PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> DRM/TTM wants to use this for it's page pool
> LRU tracking.
> 
> This effective is a revert of
> 78c0ed09131b772f062b986a2fcca6600daa6285
> Author: Kairui Song <kasong@tencent.com>
> Date:   Tue Nov 5 01:52:53 2024 +0800
> 
>     mm/list_lru: don't export list_lru_add
> 
> Cc: Kairui Song <kasong@tencent.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Shakeel Butt <shakeel.butt@linux.dev>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Instead of a separate patch, please put it in the patch which actually
uses list_lru_add.

