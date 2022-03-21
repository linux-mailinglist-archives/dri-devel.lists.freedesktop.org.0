Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 370DE4E2B98
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 16:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CA210E367;
	Mon, 21 Mar 2022 15:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF9B10E357;
 Mon, 21 Mar 2022 15:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647875706; x=1679411706;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iCXxoMW/NEwbKFJN8r+yz2XewEatvO6raZs5qOz6yGs=;
 b=Cg+UxdHBy705PrOa7QM0hA5ueoDKaIFt9W9zHDgT3wzI0O8flIU6lAQE
 iASw9JsL/T/6LUm+y9+tKKKlt88SI4rG+H9mpcLb5aM0j1u/ZFUepgRIu
 aL/Ovgag1n0JvcdD8TXktSwf1o+UsbcOBpP2xVknTVhYsKosZspHAt2cG
 SBdbSuLRYhgyhVnXhFCIzDPRCrjbxglS3b7OcwnlE3p0R6vawmTJ8cQv8
 uG9r3vm6LlK6Ykh5daEwWp09hOhRFOD7dmdh+MM9iNJyUTs+M5Wm1BSQ+
 tujyKDQcxi2yrSSibX9z2sqjNclCPclDbEhV999qaEUnoVghX7kVpoLjC A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="257525029"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="257525029"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 08:15:06 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="543262908"
Received: from evinintel.ger.corp.intel.com (HELO [10.249.254.209])
 ([10.249.254.209])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 08:15:03 -0700
Message-ID: <d6bc73c04c4c69d3d9e6cf42bd62340a61a7d4c3.camel@linux.intel.com>
Subject: Re: [PATCH 0/4] Drop wbinvd_on_all_cpus usage
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Michael Cheng
 <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
Date: Mon, 21 Mar 2022 16:15:01 +0100
In-Reply-To: <b6bb4d03-6229-2419-97dd-f010c9890363@linux.intel.com>
References: <20220319194227.297639-1-michael.cheng@intel.com>
 <4c86ae70-6f97-7a7c-1fd4-5e73ca29d0ba@linux.intel.com>
 <5db61477-6064-ada0-82a7-c1dc659dacad@linux.intel.com>
 <abdc3b07-a05e-f67d-2135-a30421cb9d12@linux.intel.com>
 <29bde7b0e680e503fbf483a560616e2ce22cdd79.camel@linux.intel.com>
 <210af2db-37ec-2cff-f6a6-7ea0263e135b@linux.intel.com>
 <1bd4ac91f24f6b4322811177f786f4867278ab83.camel@linux.intel.com>
 <b6bb4d03-6229-2419-97dd-f010c9890363@linux.intel.com>
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

On Mon, 2022-03-21 at 14:43 +0000, Tvrtko Ursulin wrote:
> 
> On 21/03/2022 13:40, Thomas Hellström wrote:
> > Hi,
> > 
> > On Mon, 2022-03-21 at 13:12 +0000, Tvrtko Ursulin wrote:
> > > 
> > > On 21/03/2022 12:33, Thomas Hellström wrote:
> > > > On Mon, 2022-03-21 at 12:22 +0000, Tvrtko Ursulin wrote:
> > > > > 
> > > > > On 21/03/2022 11:03, Thomas Hellström wrote:
> > > > > > Hi, Tvrtko.
> > > > > > 
> > > > > > On 3/21/22 11:27, Tvrtko Ursulin wrote:
> > > > > > > 
> > > > > > > On 19/03/2022 19:42, Michael Cheng wrote:
> > > > > > > > To align with the discussion in [1][2], this patch
> > > > > > > > series
> > > > > > > > drops
> > > > > > > > all
> > > > > > > > usage of
> > > > > > > > wbvind_on_all_cpus within i915 by either replacing the
> > > > > > > > call
> > > > > > > > with certain
> > > > > > > > drm clflush helpers, or reverting to a previous logic.
> > > > > > > 
> > > > > > > AFAIU, complaint from [1] was that it is wrong to provide
> > > > > > > non
> > > > > > > x86
> > > > > > > implementations under the wbinvd_on_all_cpus name.
> > > > > > > Instead an
> > > > > > > arch
> > > > > > > agnostic helper which achieves the same effect could be
> > > > > > > created.
> > > > > > > Does
> > > > > > > Arm have such concept?
> > > > > > 
> > > > > > I also understand Linus' email like we shouldn't leak
> > > > > > incoherent
> > > > > > IO
> > > > > > to
> > > > > > other architectures, meaning any remaining wbinvd()s should
> > > > > > be
> > > > > > X86
> > > > > > only.
> > > > > 
> > > > > The last part is completely obvious since it is a x86
> > > > > instruction
> > > > > name.
> > > > 
> > > > Yeah, I meant the function implementing wbinvd() semantics.
> > > > 
> > > > > 
> > > > > But I think we can't pick a solution until we know how the
> > > > > concept
> > > > > maps
> > > > > to Arm and that will also include seeing how the
> > > > > drm_clflush_sg for
> > > > > Arm
> > > > > would look. Is there a range based solution, or just a big
> > > > > hammer
> > > > > there.
> > > > > If the latter, then it is no good to churn all these reverts
> > > > > but
> > > > > instead
> > > > > an arch agnostic wrapper, with a generic name, would be the
> > > > > way to
> > > > > go.
> > > > 
> > > > But my impression was that ARM would not need the range-based
> > > > interface
> > > > either, because ARM is only for discrete and with discrete
> > > > we're
> > > > always
> > > > coherent.
> > > 
> > > Not sure what you mean here - what about flushing system memory
> > > objects
> > > on discrete? Those still need flushing on paths like suspend
> > > which this
> > > series touches. Am I missing something?
> > 
> > System bos on discrete should always have
> > 
> > I915_BO_CACHE_COHERENT_FOR_READ | I915_BO_CACHE_COHERENT_FOR_WRITE
> > 
> > either by the gpu being fully cache coherent (or us mapping system
> > write-combined). Hence no need for cache clflushes or wbinvd() for
> > incoherent IO.
> 
> Hmm so you are talking about the shmem ttm backend. It ends up
> depending on the result of i915_ttm_cache_level, yes? It cannot end
> up with I915_CACHE_NONE from that function?

If the object is allocated with allowable placement in either LMEM or
SYSTEM, and it ends in system, it gets allocated with I915_CACHE_NONE,
but then the shmem ttm backend isn't used but TTM's wc pools, and the
object should *always* be mapped wc. Even in system.

> 
> I also found in i915_drm.h:
> 
>          * As caching mode when specifying `I915_MMAP_OFFSET_FIXED`,
> WC or WB will
>          * be used, depending on the object placement on creation. WB
> will be used
>          * when the object can only exist in system memory, WC
> otherwise.
> 
> If what you say is true, that on discrete it is _always_ WC, then
> that needs updating as well.

If an object is allocated as system only, then it is mapped WB, and
we're relying on the gpu being cache coherent to avoid clflushes. Same
is actually currently true if the object happens to be accessed by the
cpu while evicted. Might need an update for that.

> 
> > 
> > That's adhering to Linus'
> > 
> > "And I sincerely hope to the gods that no cache-incoherent i915
> > mess
> > ever makes it out of the x86 world. Incoherent IO was always a
> > historical mistake and should never ever happen again, so we should
> > not spread that horrific pattern around."
> 
> Sure, but I was not talking about IO - just the CPU side access to
> CPU side objects.

OK, I was under the impression that clflushes() and wbinvd()s in i915
was only ever used to make data visible to non-snooping GPUs. 

Do you mean that there are other uses as well? Agreed the wb cache
flush on on suspend only if gpu is !I915_BO_CACHE_COHERENT_FOR_READ?
looks to not fit this pattern completely.

Otherwise, for architectures where memory isn't always fully coherent
with the cpu cache, I'd expect them to use the apis in
asm/cacheflush.h, like flush_cache_range() and similar, which are nops
on x86.

Thanks,
Thomas


> 
> Regards,
> 
> Tvrtko


