Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1387AC1CBA2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 19:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E10810E21E;
	Wed, 29 Oct 2025 18:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T73DY/BJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9221610E1AE;
 Wed, 29 Oct 2025 18:16:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4F12243D3E;
 Wed, 29 Oct 2025 18:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE21C4CEF7;
 Wed, 29 Oct 2025 18:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761761761;
 bh=eLbccdj+72VhYU327uN0Zxnlm8keZTmMM2Y3v4EP+vs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T73DY/BJfAkbXY6fKpZl/O9cj1+Su+EgbmJYRTf3U+uqURDEmiGf1Oqsk8ptDWNik
 EvbAWxgQmqn+hTHBuZwL5+1fsOL+Tpl5DydIwGt4kuNHgJkGHhQqSJYrZutMGfQQDV
 MD3G8dYmAIJcF+QZ/ew+pZey9uxQHLkEbnZLmWQyr2JCVwCVDjU1Wc5gFcXyLo+giJ
 vf4eM+Z3NETGYsc62FowhYsOQAhIoe46PgDcUhiTIgfaRbVN5UCWCaeoDjrfiOfEJM
 hEN/k006LPPMZsElT+TFsOn9KIp3TvJiwRfo+CGV9jzNcVw9c2VtDDgML77mWT+zZ9
 gZ/f6/BEO5x+w==
Date: Wed, 29 Oct 2025 08:16:00 -1000
From: Tejun Heo <tj@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangshanlai@gmail.com,
 simona.vetter@ffwll.ch, pstanner@redhat.com, dakr@kernel.org
Subject: Re: [RFC PATCH 1/3] workqueue: Add an interface to taint workqueue
 lockdep with reclaim
Message-ID: <aQJZ4E5axRGCPpPv@slm.duckdns.org>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-2-matthew.brost@intel.com>
 <2e1e9d6f-4f9e-49f7-90f0-6759c260701f@amd.com>
 <aQEkq7DYy5/AaJ4R@lstrano-desk.jf.intel.com>
 <aQIthmQmKfztyaQZ@slm.duckdns.org>
 <aQJE170PEFatwXCG@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQJE170PEFatwXCG@lstrano-desk.jf.intel.com>
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

On Wed, Oct 29, 2025 at 09:46:15AM -0700, Matthew Brost wrote:
> On Wed, Oct 29, 2025 at 05:06:46AM -1000, Tejun Heo wrote:
> > How about making it a WQ flag?
> 
> That could work too. We want to enforce rules of drivers actually set
> these flags setting passing workqueues to the DRM scheduler. Any
> objection to adding helpers to the workqueue layer to fish the
> information we'd like to enforce?

Difficult to tell definitively without looking at the helpers but no
objections to the general idea.

Thanks.

-- 
tejun
