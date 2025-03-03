Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E66FA4C5C2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 16:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A813E10E47E;
	Mon,  3 Mar 2025 15:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LQJYKHSI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850F710E47E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 15:53:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 12503611F7;
 Mon,  3 Mar 2025 15:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DBDC4CED6;
 Mon,  3 Mar 2025 15:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741017190;
 bh=ORKfRgQGW0056hFlRKXF0EJAyVhkyKhngGPxX2PqvPI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LQJYKHSIhCc+zkDJOINw/+gYZGMW1saFycpp7jykJx/liPxunoNS1bYapqJy44Tzl
 0YosxQCdFCdm2eNMkXF1Fb7YD90Oz1f3sRmTJNk19aLiDl6sBfIPAOcukqaH1FZJnp
 hZ3FIIiGJxLNftS0do9jClz/yzcyfj+Nb0iyZdl9IYtxp3XK2JPTuKlrRY4t/y+H1r
 SKB4cIQAAkANGYzq4lIZruJlr66Mhui6H0DVEXFmmdLV3s3K49n7hckYbJCF+myC5m
 PifzLKwMGjvQJeEUR/Z/vKygTPm5o01XKWIWCX4DmtxfYO923kJFOa21DH2U6Bmj9i
 gO2Z1CUOzl8gQ==
Date: Mon, 3 Mar 2025 16:53:05 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: phasta@kernel.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/sched: Fix outdated comments referencing thread
Message-ID: <Z8XQYTXOktHKaOY1@pollux>
References: <20250225131332.83415-2-phasta@kernel.org>
 <Z73LVBw7HXANVbHQ@cassiopeiae>
 <d7308a0c8ea0fa95f0d4a93364e72e4a1eb15587.camel@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7308a0c8ea0fa95f0d4a93364e72e4a1eb15587.camel@mailbox.org>
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

On Mon, Mar 03, 2025 at 04:48:36PM +0100, Philipp Stanner wrote:
> On Tue, 2025-02-25 at 14:53 +0100, Danilo Krummrich wrote:
> > On Tue, Feb 25, 2025 at 02:13:32PM +0100, Philipp Stanner wrote:
> 
> > > -		 * is parked at which point it's safe.
> > > +		 * drm_sched_cleanup_jobs. It will be reinserted
> > > back after the
> > > +		 * scheduler's workqueues are stopped at which
> > > point it's safe.
> > 
> > You don't know whether the workqueues are "stopped". I think you want
> > to say
> > that run_job / free_job work isn't scheduled or running.
> 
> How about "after the scheduler's work items have been cancelled"?

Sure, that's fine too. But be aware that you may have to change this wording in
case another (unrelated) work item is gets added to the scheduler for some
reason.
