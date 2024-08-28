Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF7F962C7F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2E310E341;
	Wed, 28 Aug 2024 15:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTOns+9G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B1210E2B6;
 Wed, 28 Aug 2024 15:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724859357; x=1756395357;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4vc6Jph9gyscXAZz9m8y4tZfXYGQl3dRVac88wqku6I=;
 b=DTOns+9G0HvsjW62YaPO4YcQDk/9nlPjYXV5Iy7auTcpIgQ3qlZXTxh0
 UUYQtS7CcLyq1p9UyeX77Dc69EucMA/cJH9t5V3pDu5K69zCICnWN+b1d
 68UXPkwbkhaPO533gu5LGoktDL6AFsCcdVDKhmXaTnc5M3DwR8/UFB+d7
 WpjcrLBhE2FRHvhk/GHui45eM/Xz/sMl9QyGacnXos2QwhiRbOxSJfIhv
 6b21SunuEgajzmt4UI+ytWP/inkbi7zSs2cuwP/2r8IvD5ObnAcAukARD
 XWKZIC/HZJ2GziDTJZmR0zx72Hh/7txukALkcyySvGJYrP4lpABNNjO6m A==;
X-CSE-ConnectionGUID: IzcRQwNUQP67dSSwjxx+XA==
X-CSE-MsgGUID: fzWdmZIyRti9TM3yNGm8sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23282824"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23282824"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 08:35:57 -0700
X-CSE-ConnectionGUID: yopWN+gNTLG7PIhCGiIidA==
X-CSE-MsgGUID: MGWl/Dl3SdCte4SrVMeTKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="62905914"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.163])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 08:35:50 -0700
Date: Wed, 28 Aug 2024 17:35:45 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v3 00/15] CCS static load balance
Message-ID: <Zs9D0WpVLpZviBNg@ashyti-mobl2.lan>
References: <20240823130855.72436-1-andi.shyti@linux.intel.com>
 <Zs4NaUgcDhcBb4Ok@phenom.ffwll.local>
 <Zs7dv57piSIj3Og4@ashyti-mobl2.lan>
 <Zs8qaZftGbq7Ls00@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zs8qaZftGbq7Ls00@phenom.ffwll.local>
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

Hi Sima,

On Wed, Aug 28, 2024 at 03:47:21PM +0200, Daniel Vetter wrote:
> On Wed, Aug 28, 2024 at 10:20:15AM +0200, Andi Shyti wrote:
> > Hi Sima,
> > 
> > first of all, thanks for looking into this series.
> > 
> > On Tue, Aug 27, 2024 at 07:31:21PM +0200, Daniel Vetter wrote:
> > > On Fri, Aug 23, 2024 at 03:08:40PM +0200, Andi Shyti wrote:
> > > > Hi,
> > > > 
> > > > This patch series introduces static load balancing for GPUs with
> > > > multiple compute engines. It's a lengthy series, and some
> > > > challenging aspects still need to be resolved.
> > > 
> > > Do we have an actual user for this, where just reloading the entire driver
> > > (or well-rebinding, if you only want to change the value for a specific
> > > device) with a new module option isn't enough?
> > 
> > Yes, we have users for this and this has been already agreed with
> > architects and maintainers.
> 
> So my understanding is that for upstream, this only applies to dg2,
> because the other platforms don't have enough CCS engines to make this a
> real issue.
> 
> Do we really have upstream demand for this feature on dg2 only?

That's my understanding.

> Also how hard would it be to make these users happy with xe-on-dg2 in
> upstream instead?

I don't know this, I think the user is already on i915.

> > Why are you saying that we are reloading/rebinding the driver?
> 
> That's the other alternate solution.

But that's not how XE does it, though.

The use case is that userspace has an environment variable that
they change ondemand for choosing the CCS mode. They want to
change the value of that variable on the fly and, as we are only
adding or removing a few engines, this is done without reprobing
the whole driver.

In a previous implementation (from where both I and Niranjana for
XE took inspiration) the CCS mode was passed during compute
execbuf.

> > I'm only removing the exposure of user engines, which is
> > basically a flag in the engines data structure.
> > 
> > > There's some really gnarly locking and lifetime fun in there, and it needs
> > > a corresponding justification.
> > 
> > What locking are you referring about?
> > 
> > I only added one single mutex that has a comment and a
> > justification. If you think that's not enough, I can of course
> > improve it (please note that the changes have a good amount of
> > comments and I tried to be aso more descriptive as I could).
> > 
> > When I change the engines configurations only for the compute
> > engines and only for DG2 platforms, I need to make sure that no
> > other user is affected by the change. Thus I need to make sure
> > that access to some of the strucures are properly serialized.
> > 
> > > Which needs to be enormous for this case,
> > > meaning actual customers willing to shout on dri-devel that they really,
> > > absolutely need this, or their machines will go up in flames.
> > > Otherwise this is a nack from me.
> > 
> > Would you please tell me why are you nacking the patch? So that I
> > address your comments for v4?
> 
> So for one, this is substantially more flexible than the solution merged
> into xe. And the patch set doesn't explain why (the commit messages
> actualy describe the design xe has).

I think in XE we might have missed a few things and my plan is to
check the XE implementation once I'm done with i915 (I was one of
the XE reviewers). And, many of the things in XE are so different
that the solution can't be taken as it is.

> That does not inspire confidence at all.

Consider that most of the patches are refactoring, only the last
patch is doing the real job. That's because the first workaround
was already merged a while ago. While XE didn't need the
refactorings I made.

> Second, I don't think anyone understands the entire engine/ctx locking
> design in i915-gem. And the fix for that was to make as much as absolutely
> possible immutable. Yes the implementation looks correct, but when I
> looked at the much, much simpler xe implementation I'm pretty sure I've
> found an issue there too. Here I can't even tell.

The locking is fairly simple, when the user wants to set a
specific CCS mode, I take the wakrefe lock and I check no one is
holding it. This way I am sure that I am the only user of the GPU
(otherwise the GPU would be off).

I added one single lock to be used for the for_each_uabi_engine.
It's not really required but I really want to be sure that I am
not changing the CCS mode while someone else is using the uabi
engines.

I'm also adding Joonas in Cc with whom I discussed many details
of the implementation. I would really appreaciate to know what
exactly is wrong here and what are the necessary changes needed
to get the series merged.

For now, thanks a lot for your comments,
Andi
