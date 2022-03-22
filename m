Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B93C4E3CA7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 11:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C51A10E0D8;
	Tue, 22 Mar 2022 10:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2436E10E0D8;
 Tue, 22 Mar 2022 10:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647945720; x=1679481720;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GgYTi/C65Y/NFDzWoYs9sp1Uf8potNDwSVEyvBl6Rfg=;
 b=djh3QvfVOchHsWQQSdo5P5Spd9UHoIFIDVDxw39sbsjXVObJIuHNFkvr
 qUZNnmT5+TQ6mCenCIeynMkmF42iuReeVQCD+KuT4fUDi7RH6vvQhCYBf
 ijeTCL0Mkz80cFSgE7EqiaNn5rlH35z0eWjXfqAibiVVGDZpTBkooZ/6l
 O6cgF01z0Ia24zQxL+Nc1CQSIOmmqK1GB+P/LVJgu0TeY0Fvh1EMr2U8q
 8CJSz6iKTB57TBt661+LjLTsEk8HylukuXOjZ71AKwksGU32hG5s899OC
 GXsyGfBzogmJYfjEH98nECLsqbtjUiSCaq6IKSreI/KuvI137wvU+6F4t g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="344214015"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="344214015"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 03:41:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="785333645"
Received: from sorenthe-mobl2.ger.corp.intel.com (HELO [10.249.254.95])
 ([10.249.254.95])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 03:41:56 -0700
Message-ID: <96c0cec57b07550a3f60327bbe20fff7ce18e5d2.camel@linux.intel.com>
Subject: Re: [PATCH 0/4] Drop wbinvd_on_all_cpus usage
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Michael Cheng
 <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 22 Mar 2022 11:41:53 +0100
In-Reply-To: <5931be1a37dbb9ccdce127f6173d42fa4dbee593.camel@linux.intel.com>
References: <20220319194227.297639-1-michael.cheng@intel.com>
 <4c86ae70-6f97-7a7c-1fd4-5e73ca29d0ba@linux.intel.com>
 <5db61477-6064-ada0-82a7-c1dc659dacad@linux.intel.com>
 <abdc3b07-a05e-f67d-2135-a30421cb9d12@linux.intel.com>
 <29bde7b0e680e503fbf483a560616e2ce22cdd79.camel@linux.intel.com>
 <210af2db-37ec-2cff-f6a6-7ea0263e135b@linux.intel.com>
 <1bd4ac91f24f6b4322811177f786f4867278ab83.camel@linux.intel.com>
 <b6bb4d03-6229-2419-97dd-f010c9890363@linux.intel.com>
 <d6bc73c04c4c69d3d9e6cf42bd62340a61a7d4c3.camel@linux.intel.com>
 <31310790-4bc5-b9a7-8d35-c0f542b4d658@linux.intel.com>
 <5931be1a37dbb9ccdce127f6173d42fa4dbee593.camel@linux.intel.com>
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

On Tue, 2022-03-22 at 11:26 +0100, Thomas Hellström wrote:
> On Tue, 2022-03-22 at 10:13 +0000, Tvrtko Ursulin wrote:
> > 
> > On 21/03/2022 15:15, Thomas Hellström wrote:
> > > On Mon, 2022-03-21 at 14:43 +0000, Tvrtko Ursulin wrote:
> > > > 
> > > > On 21/03/2022 13:40, Thomas Hellström wrote:
> > > > > Hi,
> > > > > 
> > > > > On Mon, 2022-03-21 at 13:12 +0000, Tvrtko Ursulin wrote:
> > > > > > 
> > > > > > On 21/03/2022 12:33, Thomas Hellström wrote:
> > > > > > > On Mon, 2022-03-21 at 12:22 +0000, Tvrtko Ursulin wrote:
> > > > > > > > 
> > > > > > > > On 21/03/2022 11:03, Thomas Hellström wrote:
> > > > > > > > > Hi, Tvrtko.
> > > > > > > > > 
> > > > > > > > > On 3/21/22 11:27, Tvrtko Ursulin wrote:
> > > > > > > > > > 
> > > > > > > > > > On 19/03/2022 19:42, Michael Cheng wrote:
> > > > > > > > > > > To align with the discussion in [1][2], this
> > > > > > > > > > > patch
> > > > > > > > > > > series
> > > > > > > > > > > drops
> > > > > > > > > > > all
> > > > > > > > > > > usage of
> > > > > > > > > > > wbvind_on_all_cpus within i915 by either
> > > > > > > > > > > replacing
> > > > > > > > > > > the
> > > > > > > > > > > call
> > > > > > > > > > > with certain
> > > > > > > > > > > drm clflush helpers, or reverting to a previous
> > > > > > > > > > > logic.
> > > > > > > > > > 
> > > > > > > > > > AFAIU, complaint from [1] was that it is wrong to
> > > > > > > > > > provide
> > > > > > > > > > non
> > > > > > > > > > x86
> > > > > > > > > > implementations under the wbinvd_on_all_cpus name.
> > > > > > > > > > Instead an
> > > > > > > > > > arch
> > > > > > > > > > agnostic helper which achieves the same effect
> > > > > > > > > > could
> > > > > > > > > > be
> > > > > > > > > > created.
> > > > > > > > > > Does
> > > > > > > > > > Arm have such concept?
> > > > > > > > > 
> > > > > > > > > I also understand Linus' email like we shouldn't leak
> > > > > > > > > incoherent
> > > > > > > > > IO
> > > > > > > > > to
> > > > > > > > > other architectures, meaning any remaining wbinvd()s
> > > > > > > > > should
> > > > > > > > > be
> > > > > > > > > X86
> > > > > > > > > only.
> > > > > > > > 
> > > > > > > > The last part is completely obvious since it is a x86
> > > > > > > > instruction
> > > > > > > > name.
> > > > > > > 
> > > > > > > Yeah, I meant the function implementing wbinvd()
> > > > > > > semantics.
> > > > > > > 
> > > > > > > > 
> > > > > > > > But I think we can't pick a solution until we know how
> > > > > > > > the
> > > > > > > > concept
> > > > > > > > maps
> > > > > > > > to Arm and that will also include seeing how the
> > > > > > > > drm_clflush_sg for
> > > > > > > > Arm
> > > > > > > > would look. Is there a range based solution, or just a
> > > > > > > > big
> > > > > > > > hammer
> > > > > > > > there.
> > > > > > > > If the latter, then it is no good to churn all these
> > > > > > > > reverts
> > > > > > > > but
> > > > > > > > instead
> > > > > > > > an arch agnostic wrapper, with a generic name, would be
> > > > > > > > the
> > > > > > > > way to
> > > > > > > > go.
> > > > > > > 
> > > > > > > But my impression was that ARM would not need the range-
> > > > > > > based
> > > > > > > interface
> > > > > > > either, because ARM is only for discrete and with
> > > > > > > discrete
> > > > > > > we're
> > > > > > > always
> > > > > > > coherent.
> > > > > > 
> > > > > > Not sure what you mean here - what about flushing system
> > > > > > memory
> > > > > > objects
> > > > > > on discrete? Those still need flushing on paths like
> > > > > > suspend
> > > > > > which this
> > > > > > series touches. Am I missing something?
> > > > > 
> > > > > System bos on discrete should always have
> > > > > 
> > > > > I915_BO_CACHE_COHERENT_FOR_READ |
> > > > > I915_BO_CACHE_COHERENT_FOR_WRITE
> > > > > 
> > > > > either by the gpu being fully cache coherent (or us mapping
> > > > > system
> > > > > write-combined). Hence no need for cache clflushes or
> > > > > wbinvd()
> > > > > for
> > > > > incoherent IO.
> > > > 
> > > > Hmm so you are talking about the shmem ttm backend. It ends up
> > > > depending on the result of i915_ttm_cache_level, yes? It cannot
> > > > end
> > > > up with I915_CACHE_NONE from that function?
> > > 
> > > If the object is allocated with allowable placement in either
> > > LMEM
> > > or
> > > SYSTEM, and it ends in system, it gets allocated with
> > > I915_CACHE_NONE,
> > > but then the shmem ttm backend isn't used but TTM's wc pools, and
> > > the
> > > object should *always* be mapped wc. Even in system.
> > 
> > I am not familiar with neither TTM backend or wc pools so maybe a
> > missed 
> > question - if obj->cache_level can be set to none, and 
> > obj->cache_coherency to zero, then during object lifetime helpers
> > which 
> > consult those fields (like i915_gem_cpu_write_needs_clflush, 
> > __start_cpu_write, etc) are giving out incorrect answers? That is,
> > it
> > is 
> > irrelevant that they would say flushes are required, since in
> > actuality 
> > those objects can never ever and from anywhere be mapped other than
> > WC 
> > so flushes aren't actually required?
> 
> If we map other than WC somewhere in these situations, that should be
> a
> bug needing a fix. It might be that some of these helpers that you
> mention might still flag that a clflush is needed, and in that case
> that's an oversight that also needs fixing.

Actually, it seems like most of these has a IS_DGFX() in them, in
particular i915_gem_clflush_object(), but it looks like some sort of
cleanup might be needed here. In particular we might want to introduce
an IS_COHERENT() in case we change the api at some point also for
integrated.

/Thomas


