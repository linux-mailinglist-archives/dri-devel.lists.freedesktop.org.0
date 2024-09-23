Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7BA983A42
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 01:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B01410E071;
	Mon, 23 Sep 2024 23:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QIAk09aN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F5210E071
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 23:16:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3E8E9A4299D;
 Mon, 23 Sep 2024 23:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D394BC4CEC4;
 Mon, 23 Sep 2024 23:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727133388;
 bh=ElxzDnHDm+cQyLjqxzn0fvBfDC2loxlsAlEw4+uXM+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QIAk09aNXrgSIqDhOwqbW5TSzHJceiq2OvRtRjoJIV+pU9cWfV3h939PQuxFlDmDY
 veZG5CHSRPpJiYhXmXBw+NSDQDRJC6HGbUhAdUgRPjM4ItAaVqKXkk4VRe46Xyi3Pp
 IeCJKJnT5dWPRh7i3pePB4wZersiPclxnwRydRAhQyZkVExnN709Zv8uWnTBfNkQy8
 1r4ZWTPWQ6OFKG3zoH4jFNE8IlgS6T+B9AWUWhwdb+te0JdEEC4b/m7syxC7eDLeQM
 nFHZ152WgWZzcgPHxq4Coh1Bd6AxXLMM5TnkKEj2Hza/qFSKNs7OLvpJtLDG1Twmgg
 UibhAQ8BhhLuA==
Date: Tue, 24 Sep 2024 01:16:24 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH] MAINTAINERS: drm/sched: Add new maintainers
Message-ID: <ZvH2yIsPIbDXN-_r@pollux.localdomain>
References: <20240916185159.35727-3-pstanner@redhat.com>
 <ZuiP/4AzCNnoaDZ/@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuiP/4AzCNnoaDZ/@DUT025-TGLU.fm.intel.com>
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

On Mon, Sep 16, 2024 at 08:07:27PM +0000, Matthew Brost wrote:
> On Mon, Sep 16, 2024 at 08:52:00PM +0200, Philipp Stanner wrote:
> > DRM's GPU scheduler is arguably in need of more intensive maintenance.
> > Danilo and Philipp volunteer to help with the maintainership.
> > 
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > 
> 
> Acked-by: Matthew Brost <matthew.brost@intel.com>

Applied to drm-misc-fixes.

> 
> > ---
> >  MAINTAINERS | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 10430778c998..fc2d8bf3ee74 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7710,6 +7710,8 @@ F:	drivers/gpu/drm/xlnx/
> >  DRM GPU SCHEDULER
> >  M:	Luben Tuikov <ltuikov89@gmail.com>
> >  M:	Matthew Brost <matthew.brost@intel.com>
> > +M:	Danilo Krummrich <dakr@kernel.org>
> > +M:	Philipp Stanner <pstanner@redhat.com>
> >  L:	dri-devel@lists.freedesktop.org
> >  S:	Maintained
> >  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> > -- 
> > 2.46.0
> > 
> 
