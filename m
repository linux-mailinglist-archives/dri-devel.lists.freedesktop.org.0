Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7651A11261
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 21:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E026710E123;
	Tue, 14 Jan 2025 20:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TR3bLBCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35B710E123
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 20:44:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 49ED45C5999;
 Tue, 14 Jan 2025 20:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980EBC4CEDD;
 Tue, 14 Jan 2025 20:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736887470;
 bh=GhSyuvazemiNBHplKm7JkAuEuU0thINNrfaZZ5PCoG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TR3bLBCaEXtn6gKtpIjKi2FuGrDLFxP23CpdxZWuBPDHHQO5o61eRWp6HptQCGoju
 T/LkaX3g78JIPWzRtHVgtdaBaWDQkacXBkS3uF1DrLPh62OUpNTevE5q/q4yyftkyj
 807NpvzsOAPVyCFVSvMdDM/776gKWQ9zwc/qB5djjSdgrmiowqkW/Nx8MvMvtpO/67
 DhnmNc+CZtday2l+vPTPBMmPoL/8xso2M127C71HeCBEQWyha2aZ0+jnMpJzEgtNJ/
 hq/Dk+/lVFUpxBbeE75tKLb0+OLUQKF7WP9WsK8vVEERzKjAO/h4P6LuuBv4BqaVyQ
 aMyi+EcnhRgsQ==
Date: Tue, 14 Jan 2025 10:44:29 -1000
From: Tejun Heo <tj@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Waiman Long <llong@redhat.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, hannes@cmpxchg.org,
 mkoutny@suse.com, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH -next] kernel/cgroup: Remove the unused variable climit
Message-ID: <Z4bMrXdcNWEj9MYc@slm.duckdns.org>
References: <20250114062804.5092-1-jiapeng.chong@linux.alibaba.com>
 <f502ee68-7743-48c6-9024-83431265a6b8@redhat.com>
 <20250114-voracious-optimal-alligator-cdaaba@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250114-voracious-optimal-alligator-cdaaba@houat>
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

On Tue, Jan 14, 2025 at 06:56:38PM +0100, Maxime Ripard wrote:
> On Tue, Jan 14, 2025 at 10:41:28AM -0500, Waiman Long wrote:
> > On 1/14/25 1:28 AM, Jiapeng Chong wrote:
> > > Variable climit is not effectively used, so delete it.
> > > 
> > > kernel/cgroup/dmem.c:302:23: warning: variable ‘climit’ set but not used.
> > > 
> > > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > > Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=13512
> > > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> > > ---
> > >   kernel/cgroup/dmem.c | 3 +--
> > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
> > > index 52736ef0ccf2..78d9361ed521 100644
> > > --- a/kernel/cgroup/dmem.c
> > > +++ b/kernel/cgroup/dmem.c
> > > @@ -299,7 +299,7 @@ bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_pool_state *limit_pool,
> > >   				      bool ignore_low, bool *ret_hit_low)
> > >   {
> > >   	struct dmem_cgroup_pool_state *pool = test_pool;
> > > -	struct page_counter *climit, *ctest;
> > > +	struct page_counter *ctest;
> > >   	u64 used, min, low;
> > >   	/* Can always evict from current pool, despite limits */
> > > @@ -324,7 +324,6 @@ bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_pool_state *limit_pool,
> > >   			{}
> > >   	}
> > > -	climit = &limit_pool->cnt;
> > >   	ctest = &test_pool->cnt;
> > >   	dmem_cgroup_calculate_protection(limit_pool, test_pool);
> > 
> > The dmem controller is actually pulled into the drm tree at the moment.
> > 
> > cc relevant parties on how to handle this fix commit.
> 
> We can either take it through drm with one of the cgroup maintainers
> ack, or they can merge the PR in their tree and merge the fixes as they
> wish through their tree.

Acked-by: Tejun Heo <tj@kernel.org>

Please route with the rest of dmem changes.

Thanks.

-- 
tejun
