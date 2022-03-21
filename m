Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F01714E27DF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207C410E346;
	Mon, 21 Mar 2022 13:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEA310E346;
 Mon, 21 Mar 2022 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647870057; x=1679406057;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eAtpi4PDlrO7uimuy/Kh+72hIkzBKxOKO/7IV9U7P4A=;
 b=KxtAI3s8YiSnkCWq7AEwn5hUdzC8H6tUCMAeqXt7pd9eTp6FS8qN6k5m
 n08xqYR1WB5A9ET3ZWsqeZ5TFsVioZTDKkxNuy1+kz+Jar9AYQP75kCDW
 J54SnLfxbGRiizOCzxZcAGc+3lPczTrmxy5LYuAIECEZTv+OrK9UIqh/R
 +ExGJu00oEMJu4jhGcPooRz+m26dviSylR9Uc5hPcL4XaPJOJPFN7eKB+
 m3jK668gMIv4537PhYhW5CFyrVTi8hGBKC9qU7z1aT1mTNiRwi+zeDGTx
 U2Lo9HjZT/nTDn5hJq+tK2WTpCmtIj535tgUIUErPDn6a67LV8KgJtBcl Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="257744498"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="257744498"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 06:40:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="648567928"
Received: from evinintel.ger.corp.intel.com (HELO [10.249.254.209])
 ([10.249.254.209])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 06:40:53 -0700
Message-ID: <1bd4ac91f24f6b4322811177f786f4867278ab83.camel@linux.intel.com>
Subject: Re: [PATCH 0/4] Drop wbinvd_on_all_cpus usage
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Michael Cheng
 <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
Date: Mon, 21 Mar 2022 14:40:51 +0100
In-Reply-To: <210af2db-37ec-2cff-f6a6-7ea0263e135b@linux.intel.com>
References: <20220319194227.297639-1-michael.cheng@intel.com>
 <4c86ae70-6f97-7a7c-1fd4-5e73ca29d0ba@linux.intel.com>
 <5db61477-6064-ada0-82a7-c1dc659dacad@linux.intel.com>
 <abdc3b07-a05e-f67d-2135-a30421cb9d12@linux.intel.com>
 <29bde7b0e680e503fbf483a560616e2ce22cdd79.camel@linux.intel.com>
 <210af2db-37ec-2cff-f6a6-7ea0263e135b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: wayne.boyer@intel.com, daniel.vetter@ffwll.ch, casey.g.bowman@intel.com,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 2022-03-21 at 13:12 +0000, Tvrtko Ursulin wrote:
> 
> On 21/03/2022 12:33, Thomas Hellström wrote:
> > On Mon, 2022-03-21 at 12:22 +0000, Tvrtko Ursulin wrote:
> > > 
> > > On 21/03/2022 11:03, Thomas Hellström wrote:
> > > > Hi, Tvrtko.
> > > > 
> > > > On 3/21/22 11:27, Tvrtko Ursulin wrote:
> > > > > 
> > > > > On 19/03/2022 19:42, Michael Cheng wrote:
> > > > > > To align with the discussion in [1][2], this patch series
> > > > > > drops
> > > > > > all
> > > > > > usage of
> > > > > > wbvind_on_all_cpus within i915 by either replacing the call
> > > > > > with certain
> > > > > > drm clflush helpers, or reverting to a previous logic.
> > > > > 
> > > > > AFAIU, complaint from [1] was that it is wrong to provide non
> > > > > x86
> > > > > implementations under the wbinvd_on_all_cpus name. Instead an
> > > > > arch
> > > > > agnostic helper which achieves the same effect could be
> > > > > created.
> > > > > Does
> > > > > Arm have such concept?
> > > > 
> > > > I also understand Linus' email like we shouldn't leak incoherent
> > > > IO
> > > > to
> > > > other architectures, meaning any remaining wbinvd()s should be
> > > > X86
> > > > only.
> > > 
> > > The last part is completely obvious since it is a x86 instruction
> > > name.
> > 
> > Yeah, I meant the function implementing wbinvd() semantics.
> > 
> > > 
> > > But I think we can't pick a solution until we know how the concept
> > > maps
> > > to Arm and that will also include seeing how the drm_clflush_sg for
> > > Arm
> > > would look. Is there a range based solution, or just a big hammer
> > > there.
> > > If the latter, then it is no good to churn all these reverts but
> > > instead
> > > an arch agnostic wrapper, with a generic name, would be the way to
> > > go.
> > 
> > But my impression was that ARM would not need the range-based
> > interface
> > either, because ARM is only for discrete and with discrete we're
> > always
> > coherent.
> 
> Not sure what you mean here - what about flushing system memory objects
> on discrete? Those still need flushing on paths like suspend which this
> series touches. Am I missing something?

System bos on discrete should always have

I915_BO_CACHE_COHERENT_FOR_READ | I915_BO_CACHE_COHERENT_FOR_WRITE

either by the gpu being fully cache coherent (or us mapping system
write-combined). Hence no need for cache clflushes or wbinvd() for
incoherent IO.

That's adhering to Linus'

"And I sincerely hope to the gods that no cache-incoherent i915 mess
ever makes it out of the x86 world. Incoherent IO was always a
historical mistake and should never ever happen again, so we should
not spread that horrific pattern around."


/Thomas


