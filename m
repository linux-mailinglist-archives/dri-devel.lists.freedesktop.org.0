Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB70557862
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7726D10ECFF;
	Thu, 23 Jun 2022 11:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A85310E36D;
 Thu, 23 Jun 2022 11:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655982357; x=1687518357;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=13XOENe0irCM+kI77q75ASTCU+eCvf/oQlu39KeQd6s=;
 b=ERDyjomF0MolLcbUZww0rWaoF4HfIsX7s2Lb8H0kXWSuj/7t6JDkgaDR
 1hHQWtulZFu7LOfU2IZGv3NE0FvHxhgRYY4PED49c00Ph6tyvWif0mAYo
 c7kXlud20x77UpD3MBPZSvExLxSz2NEIlXMWeZneSBJ7mh2SnCMjHw+2f
 UchT+LhpaTBE/ZyNPlIaD9OU7IVv535/GBfea6oGOjO9rJeR/7lP7HtS4
 gwe4f3w+cbDMsBbrQGrBm9KsdntD/YAbj9azW8z77NKZ2A22lwg6915aV
 XOVCf5saBe4iBFLEkJQmLZH5lVKLQqaJ248iH7uTvWmjE50+3Wc5OY0N6 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="281767321"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="281767321"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 04:05:56 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="615539098"
Received: from bo3zhang-mobl.amr.corp.intel.com (HELO [10.212.47.148])
 ([10.212.47.148])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 04:05:54 -0700
Message-ID: <6d70cde9-f856-540a-b1d4-0325596b0c88@linux.intel.com>
Date: Thu, 23 Jun 2022 12:05:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
Content-Language: en-US
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20220622035650.29256-1-niranjana.vishwanathapura@intel.com>
 <20220622035650.29256-4-niranjana.vishwanathapura@intel.com>
 <6ac2f495-8ead-4824-f9af-1c03fb3770c4@linux.intel.com>
 <20220622151229.GY376@nvishwa1-DESK>
 <b347fb63-5200-9f5c-b0d6-ca51b7a064f9@linux.intel.com>
 <20220622164445.GZ376@nvishwa1-DESK>
 <e6ed0d2f-ee2a-2219-c2cc-49efc32f0560@linux.intel.com>
 <1874e47b-4337-5ac6-ebea-fca21ea1ba4c@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <1874e47b-4337-5ac6-ebea-fca21ea1ba4c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: paulo.r.zanoni@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 chris.p.wilson@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/06/2022 09:57, Lionel Landwerlin wrote:
> On 23/06/2022 11:27, Tvrtko Ursulin wrote:
>>>
>>> After a vm_unbind, UMD can re-bind to same VA range against an active 
>>> VM.
>>> Though I am not sue with Mesa usecase if that new mapping is required 
>>> for
>>> running GPU job or it will be for the next submission. But ensuring the
>>> tlb flush upon unbind, KMD can ensure correctness.
>>
>> Isn't that their problem? If they re-bind for submitting _new_ work 
>> then they get the flush as part of batch buffer pre-amble. 
> 
> In the non sparse case, if a VA range is unbound, it is invalid to use 
> that range for anything until it has been rebound by something else.
> 
> We'll take the fence provided by vm_bind and put it as a wait fence on 
> the next execbuffer.
> 
> It might be safer in case of memory over fetching?
> 
> 
> TLB flush will have to happen at some point right?
> 
> What's the alternative to do it in unbind?

Currently TLB flush happens from the ring before every BB_START and also 
when i915 returns the backing store pages to the system.

For the former, I haven't seen any mention that for execbuf3 there are 
plans to stop doing it? Anyway, as long as this is kept and sequence of 
bind[1..N]+execbuf is safe and correctly sees all the preceding binds.
Hence about the alternative to doing it in unbind - first I think lets 
state the problem that is trying to solve.

For instance is it just for the compute "append work to the running 
batch" use case? I honestly don't remember how was that supposed to work 
so maybe the tlb flush on bind was supposed to deal with that scenario?

Or you see a problem even for Mesa with the current model?

Regards,

Tvrtko
