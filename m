Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 099BC48C961
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 18:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B7710F7A5;
	Wed, 12 Jan 2022 17:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFB210F7A0;
 Wed, 12 Jan 2022 17:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642008571; x=1673544571;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hJegF/7qpRipc0wF5xCtA4l9HboCT9Y6QMaoc4bDvYQ=;
 b=DhNV7JO/rDuCMRmkciBollr+FtiqfjfrK9u5GIgowmHFFZrrSfeRG6PY
 dhnA6O7ZvIPJfgVDQffMMa0ykR2ONXxQANFeSxK/Gufck0CNVE4et5nGx
 3YQQu9PlcxMBsOFf+w6frxSAP51fFnAUSughD6Dz3AVSDr8Cebi9w+rIA
 SnfRY7f/G5xGmIVoNpqq+P1bjS11Zhim7Wz18KlOt4tnC+c/mW89MkjNP
 7qtqgh6H/6buLog8GiiBb+M3mtPPJakfyxLvrlllj2RA0L48NRoob5yg9
 1OZWWEdDTRzw71+iqJKB+uOKXeFswQ5WItEv4c288bRN9mChVuGsnTbkf w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="307139918"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="307139918"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 09:29:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="558782364"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 09:29:30 -0800
Date: Wed, 12 Jan 2022 09:23:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Flip guc_id allocation partition
Message-ID: <20220112172339.GA18127@jons-linux-dev-box>
References: <20220111163019.13694-1-matthew.brost@intel.com>
 <4f9a8e6a-5a12-2d6b-bdb9-f40269045874@linux.intel.com>
 <20220112170906.ln6es7v7f7gyaj5g@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220112170906.ln6es7v7f7gyaj5g@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 12, 2022 at 06:09:06PM +0100, Piotr Piórkowski wrote:
> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote on śro [2022-sty-12 08:54:19 +0000]:
> > 
> > On 11/01/2022 16:30, Matthew Brost wrote:
> > > Move the multi-lrc guc_id from the lower allocation partition (0 to
> > > number of multi-lrc guc_ids) to upper allocation partition (number of
> > > single-lrc to max guc_ids).
> > 
> > Just a reminder that best practice for commit messages is to include the
> > "why" as well.
> > 
> > Regards,
> > 
> > Tvrtko
> > 
> 
>  In my opinion this patch is good step forward.
>  Lazy allocation of the bitmap for MLRC and moving the MLRC pool to the 
>  end will allow easier development contexts for SR-IOV.
>  Introduction of two new helpers (new_mlrc_guc_id and new_slrc_guc_id) cleans up the code.
> 
>  I agree with Tvrtko's comment that you should expand your commit
>  message.
> 

Agree. Didn't know if I could talk about SR-IOV publicly but clearly
can so add an explaination in the next rev.

> One thing I personally don't like is this NUMBER_SINGLE_LRC_GUC_ID definition (same for MLRC)
> In my opinion it should be inline function and this value 1/16 defined as constant

Agree. I'll move these to functions in next rev.

Matt

> 
> - Piotr
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 57 ++++++++++++++-----
> > >   1 file changed, 42 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index 9989d121127df..1bacc9621cea8 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -147,6 +147,8 @@ guc_create_parallel(struct intel_engine_cs **engines,
> > >    */
> > >   #define NUMBER_MULTI_LRC_GUC_ID(guc)	\
> > >   	((guc)->submission_state.num_guc_ids / 16)
> > > +#define NUMBER_SINGLE_LRC_GUC_ID(guc)	\
> > > +	((guc)->submission_state.num_guc_ids - NUMBER_MULTI_LRC_GUC_ID(guc))
> > >   /*
> > >    * Below is a set of functions which control the GuC scheduling state which
> > > @@ -1776,11 +1778,6 @@ int intel_guc_submission_init(struct intel_guc *guc)
> > >   	INIT_WORK(&guc->submission_state.destroyed_worker,
> > >   		  destroyed_worker_func);
> > > -	guc->submission_state.guc_ids_bitmap =
> > > -		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> > > -	if (!guc->submission_state.guc_ids_bitmap)
> > > -		return -ENOMEM;
> > > -
> > >   	spin_lock_init(&guc->timestamp.lock);
> > >   	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
> > >   	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
> > > @@ -1796,7 +1793,8 @@ void intel_guc_submission_fini(struct intel_guc *guc)
> > >   	guc_flush_destroyed_contexts(guc);
> > >   	guc_lrc_desc_pool_destroy(guc);
> > >   	i915_sched_engine_put(guc->sched_engine);
> > > -	bitmap_free(guc->submission_state.guc_ids_bitmap);
> > > +	if (guc->submission_state.guc_ids_bitmap)
> > > +		bitmap_free(guc->submission_state.guc_ids_bitmap);
> > >   }
> > >   static inline void queue_request(struct i915_sched_engine *sched_engine,
> > > @@ -1863,6 +1861,33 @@ static void guc_submit_request(struct i915_request *rq)
> > >   	spin_unlock_irqrestore(&sched_engine->lock, flags);
> > >   }
> > > +static int new_mlrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > > +{
> > > +	int ret;
> > > +
> > > +	GEM_BUG_ON(!intel_context_is_parent(ce));
> > > +	GEM_BUG_ON(!guc->submission_state.guc_ids_bitmap);
> > > +
> > > +	ret =  bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> > > +				       NUMBER_MULTI_LRC_GUC_ID(guc),
> > > +				       order_base_2(ce->parallel.number_children
> > > +						    + 1));
> > > +	if (likely(!(ret < 0)))
> > > +		ret += NUMBER_SINGLE_LRC_GUC_ID(guc);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int new_slrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > > +{
> > > +	GEM_BUG_ON(intel_context_is_parent(ce));
> > > +
> > > +	return ida_simple_get(&guc->submission_state.guc_ids,
> > > +			      0, NUMBER_SINGLE_LRC_GUC_ID(guc),
> > > +			      GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> > > +			      __GFP_NOWARN);
> > > +}
> > > +
> > >   static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > >   {
> > >   	int ret;
> > > @@ -1870,16 +1895,10 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > >   	GEM_BUG_ON(intel_context_is_child(ce));
> > >   	if (intel_context_is_parent(ce))
> > > -		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> > > -					      NUMBER_MULTI_LRC_GUC_ID(guc),
> > > -					      order_base_2(ce->parallel.number_children
> > > -							   + 1));
> > > +		ret = new_mlrc_guc_id(guc, ce);
> > >   	else
> > > -		ret = ida_simple_get(&guc->submission_state.guc_ids,
> > > -				     NUMBER_MULTI_LRC_GUC_ID(guc),
> > > -				     guc->submission_state.num_guc_ids,
> > > -				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> > > -				     __GFP_NOWARN);
> > > +		ret = new_slrc_guc_id(guc, ce);
> > > +
> > >   	if (unlikely(ret < 0))
> > >   		return ret;
> > > @@ -1989,6 +2008,14 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > >   	GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
> > > +	if (unlikely(intel_context_is_parent(ce) &&
> > > +		     !guc->submission_state.guc_ids_bitmap)) {
> > > +		guc->submission_state.guc_ids_bitmap =
> > > +			bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> > > +		if (!guc->submission_state.guc_ids_bitmap)
> > > +			return -ENOMEM;
> > > +	}
> > > +
> > >   try_again:
> > >   	spin_lock_irqsave(&guc->submission_state.lock, flags);
> > > 
> 
> -- 
