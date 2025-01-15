Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80924A1299A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 18:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CAB10E07B;
	Wed, 15 Jan 2025 17:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eSopfV5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E00B10E07B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 17:18:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D060EA407F4;
 Wed, 15 Jan 2025 17:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60EA2C4CED1;
 Wed, 15 Jan 2025 17:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736961497;
 bh=Opc70KPaMpCETIvcrSgDpc441Njxjw4Y92P7a86TPCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eSopfV5OrjgHZYal+iEowIfiaZhIDtKkB5h6d84l3RpdILQ7WRbsEyZqNCXuMd+eG
 svBEm0n02jFZiJ4PQ0mL5r8LtflHJ89WCf1Bz/5/xOQBuvJhqTnj4gqsEZTYmU9+KS
 kDE6Jj2u+lokSMqRQi2soYjkqE+1elp+mJGjFPqHUPTW6bhWJUxepUEjI+FWqjSaEt
 ty50RIhvO4t4PyLLs2sECd0JacA0ef+oR4DJ5aasj3vaMDLqAbXu6R8qDI+L3WQMj3
 VDZCP2svI+Sq2mYBBrvEdqL77B4cAOOG3xAfvAH/HjdevQut2iMv2Uh8XinpXYAE/6
 8BiN99ngmbk9A==
Date: Wed, 15 Jan 2025 12:18:13 -0500
From: Sasha Levin <sashal@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Greg KH <gregkh@linuxfoundation.org>, Dave Airlie <airlied@gmail.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 stable@vger.kernel.org, ashutosh.dixit@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode
 of operation for OAR/OAC)
Message-ID: <Z4ft1fFjbwy0EF-X@lappy>
References: <2025011247-spoilage-hamster-28b2@gregkh>
 <CAPM=9tx1cFzhaZNz=gQOmP9Q0KEK5fMKZYSc-P0xA_f2sxoZ9w@mail.gmail.com>
 <2025011352-fox-wrangle-4d3f@gregkh>
 <CAPM=9tzkJ=dn2gq7GcvtN_C95ZzxwC7XMMXHBrwF6Ez6fYfU=g@mail.gmail.com>
 <Z4Z8rQKR2QEaWNyI@phenom.ffwll.local> <Z4aIGvAmMld_uztJ@lappy>
 <Z4afbuFN1uc3zhOt@phenom.ffwll.local>
 <Z4d6406b82Pu1PRV@phenom.ffwll.local>
 <2025011503-algorithm-composed-3b81@gregkh>
 <Z4eY4rv8ygi9dRbz@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4eY4rv8ygi9dRbz@phenom.ffwll.local>
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

On Wed, Jan 15, 2025 at 12:15:46PM +0100, Simona Vetter wrote:
>On Wed, Jan 15, 2025 at 10:38:34AM +0100, Greg KH wrote:
>So my understanding is that you got confused by this:
>
>> commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16 upstream
>
>$ git log --grep="(cherry picked from commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16)" --since="6 month ago"   --pretty=oneline
>f0ed39830e6064d62f9c5393505677a26569bb56
>
>And yes f0ed39830e6064d62f9c5393505677a26569bb56 is the commit you care
>about for stable backport and cve tracking purposes, because it's the one
>in v6.13-rc6.
>
>And the thing is, Sasha's bot found that one too:
>
>https://lore.kernel.org/all/20250110164811-61a12d6905bb8676@stable.kernel.org/
>
>Except Sasha's bot plays guessing games, the above git log query is exact.

Cool, can we test it out? I'll try and pick a recent commit (2024).

Let's assume that I'm looking at the v6.10 git tree before 50aec9665e0b
("drm/xe: Use ordered WQ for G2H handler") made it upstream ("git
checkout v6.10" will do the trick), and I get a backport request that
says:

	commit 50aec9665e0babd62b9eee4e613d9a1ef8d2b7de upstream

I run my trusty script that says "50aec9665e0b isn't real, grep for
cherry picked from line!". My trusty script runs the query you've
provided:

$ git log --grep="(cherry picked from commit 50aec9665e0babd62b9eee4e613d9a1ef8d2b7de)" --since="6 month ago"   --pretty=oneline
2d9c72f676e6f79a021b74c6c1c88235e7d5b722 drm/xe: Use ordered WQ for G2H handler
c002bfe644a29ba600c571f2abba13a155a12dcd drm/xe: Use ordered WQ for G2H handler

Which commit do I pick? Note that they are slightly different from
eachother, and c002bfe644 landed in v6.9 while 2d9c72f676 landed in
v6.10.

>Like I tried to explain in my reply to Sasha somewhere else in this thread
>it really only takes two things:
>- drm maintainers consistently add cherry picked from lines anytime we
>  cherry-pick
>- you adjust your script to go hunt for the cherry pick alias if you get a
>  sha1 that makes no sense, so that you can put in the right sha1. And if
>  you do that for any sha1 you find (whether upstream references, Fixes:
>  or Reverts or stable candidate commits or whatever really), it will sort
>  out all the things we've been shouting about for years now.

We still have holes here... For example, this backport claims to:

	Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close")

But 8135f1c09dd2 is a cherry-pick:

	(cherry picked from commit 0c8650b09a365f4a31fca1d1d1e9d99c56071128)

In the future, if we get a new patch that says:

	Fixes: 0c8650b09a36 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close")

By your logic, our scripts will look at it and say "0c8650b09a36 is a
real commit, but it's not in linux-6.12.y so there's no need to backport
the fix".

Which is the wrong thing to do, because we have 8135f1c09dd2 in
linux-6.12.y.

So no, this isn't a simple trace-the-cherry-pick-tags exercise.

>  Automatically, without human intervention, because it's just a git
>  oneliner.

So look at the backport in question which started this thread. The
backporter ends up with:

"""
[...]

commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16 upstream

[...]

Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> # commit 1
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: stable@vger.kernel.org # 6.12+
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241220171919.571528-2-umesh.nerlige.ramappa@intel.com
(cherry picked from commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16)
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
(cherry picked from commit f0ed39830e6064d62f9c5393505677a26569bb56)

"""

Where most of the git IDs in it are invalid right now :)

-- 
Thanks,
Sasha
