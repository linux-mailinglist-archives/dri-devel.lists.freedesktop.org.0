Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1283F55BB65
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 19:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D450112C83;
	Mon, 27 Jun 2022 17:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29F1112C83;
 Mon, 27 Jun 2022 17:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656352772; x=1687888772;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VPKMQQZhfOUkCWVUdt2byIq70XKVCkhpGY3EMq5E+yU=;
 b=K3wmlhxTdoi2zUauj8Aai7Us01wNdVrc1Dd6sqmF9EhEWoFhMQYXXxix
 bcGGn6XpbFZrKdHVZbqLOYhbYkbMLckrvzhmBgJ+lyTnzdjTMJ2hvwSHn
 p4rzs3OPo/Pb34U17bZ+YOQ2jcNOfOEMUvg95g6vi+kSlZI368y/zD1m3
 zBb9AiX7/V8JjEb+pskTg/9EhglWe6xvI3mPm7H+bkV2jTCrF1JiWGdDA
 ComcAzp2X9ra/yP2IZLMDpGnbqMrEmq6mMjdRPp8ZN6q/XHVwdHvbaKb9
 NUaBfXohlcOWFZo8eC6RpO6Qwlw30xHf2q7v4v3D0+BsLY8vAXRBZ/Uoc A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="343211631"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="343211631"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 10:59:32 -0700
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="732418110"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by fmsmga001-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 10:59:30 -0700
Date: Mon, 27 Jun 2022 23:31:08 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 3/3] drm/i915: Do not use reserved requests for virtual
 engines
Message-ID: <20220627180107.GA29275@intel.com>
References: <20220614184348.23746-1-ramalingam.c@intel.com>
 <20220614184348.23746-4-ramalingam.c@intel.com>
 <20220627171859.GA23032@jons-linux-dev-box>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220627171859.GA23032@jons-linux-dev-box>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-06-27 at 10:18:59 -0700, Matthew Brost wrote:
> On Wed, Jun 15, 2022 at 12:13:48AM +0530, Ramalingam C wrote:
> > Do not use reserved requests for virtual engines as this is only
> > needed for kernel contexts.
> > 
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> 
> With the patch squashed into the previous patch:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Thank you Matthew. I will squash them while merging.

Ram
> 
> > ---
> >  drivers/gpu/drm/i915/i915_request.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> > index c71905d8e154..f0392b053bca 100644
> > --- a/drivers/gpu/drm/i915/i915_request.c
> > +++ b/drivers/gpu/drm/i915/i915_request.c
> > @@ -135,6 +135,8 @@ static void i915_fence_release(struct dma_fence *fence)
> >  
> >  	/*
> >  	 * Keep one request on each engine for reserved use under mempressure
> > +	 * do not use with virtual engines as this really is only needed for
> > +	 * kernel contexts.
> >  	 *
> >  	 * We do not hold a reference to the engine here and so have to be
> >  	 * very careful in what rq->engine we poke. The virtual engine is
> > @@ -164,7 +166,8 @@ static void i915_fence_release(struct dma_fence *fence)
> >  	 * know that if the rq->execution_mask is a single bit, rq->engine
> >  	 * can be a physical engine with the exact corresponding mask.
> >  	 */
> > -	if (is_power_of_2(rq->execution_mask) &&
> > +	if (!intel_engine_is_virtual(rq->engine) &&
> > +	    is_power_of_2(rq->execution_mask) &&
> >  	    !cmpxchg(&rq->engine->request_pool, NULL, rq))
> >  		return;
> >  
> > -- 
> > 2.20.1
> > 
