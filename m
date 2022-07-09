Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECE056CB54
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 22:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB4211AFEF;
	Sat,  9 Jul 2022 20:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF90113A33;
 Sat,  9 Jul 2022 20:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657397648; x=1688933648;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PI3SdYJJX/AtfnQZjnhPrqVmNnq8hjACDYyS3abbCwU=;
 b=VBs39yVsEszUWXazPJwGKVm74K5jDD60N7Q+SjbHZD0v7XInfdCTLpnA
 Pf1NiR2jmt7LZ3MpyxEaaT5fSLeAB1In63H34MkS5l/SBjSgDojsvpHux
 GXzu5NV9uk7mloRI5o/TlBzQCUYaC1IL8ev8ti/SKybL1SXu67R9QhyU6
 NvD2NkFv3M/zYPRVEB0z5S47nrmFBgpYxFbqx8FZpaNpzWRL+IM4lOfXf
 a5RU6m/nynGC5s97yi0eUQusftYxGg5BH1lkGIid7rU/v3MtOX2Nza042
 Lvut+w11TWKO64ekW99aog9FWlsmnOR4rgbGAZCE4i5vfwiE6AatzHdpa w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10403"; a="283212700"
X-IronPort-AV: E=Sophos;i="5.92,259,1650956400"; d="scan'208";a="283212700"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2022 13:14:07 -0700
X-IronPort-AV: E=Sophos;i="5.92,259,1650956400"; d="scan'208";a="569317093"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2022 13:14:07 -0700
Date: Sat, 9 Jul 2022 13:13:48 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Subject: Re: [RFC 03/10] drm/i915/vm_bind: Support private and shared BOs
Message-ID: <20220709201347.GA14039@nvishwa1-DESK>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-4-niranjana.vishwanathapura@intel.com>
 <e004aef5d2c491e584d6d3c2e6627093ec89d119.camel@intel.com>
 <20220708131446.GU14039@nvishwa1-DESK>
 <14ea50c0efa43f569c0662bafcea5ad81f4886d9.camel@intel.com>
 <b9cae3426f00b1f8335a45f6458c430710b06e8c.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9cae3426f00b1f8335a45f6458c430710b06e8c.camel@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>, "Zanoni,
 Paulo R" <paulo.r.zanoni@intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 08, 2022 at 07:44:54AM -0700, Hellstrom, Thomas wrote:
>On Fri, 2022-07-08 at 15:43 +0200, Thomas Hellström wrote:
>> > The vm_bind/bound_list and the non_priv_vm_bind_list are there for
>> > very different reasons.
>> >
>> > The reason for having separate vm_bind_list and vm_bound_list is
>> > that
>> > during the execbuf path, we can rebind the unbound mappings by
>> > scooping
>> > all unbound vmas back from bound list into the bind list and
>> > binding
>> > them. In fact, this probably can be done with a single vm_bind_list
>> > and
>> > a 'eb.bind_list' (local to execbuf3 ioctl) for rebinding.
>> >
>> > The non_priv_vm_bind_list is just an optimization to loop only
>> > through
>> > non-priv objects while taking the locks in
>> > eb_lock_persistent_vmas()
>> > as only non-priv objects needs that (private objects are locked in
>> > a
>> > single shot with vm_priv_lock). A non-priv mapping will also be in
>> > the
>> > vm_bind/bound_list.
>> >
>> > I think, we need to add this as documentation to be more clear.
>>
>> OK, I understood it as private objects were either on the vm_bind
>> list
>> or vm_bound_list depending on whether they needed rebinding or not,
>> and
>> shared objects only on the non_priv_vm_bind list, and were always
>> locked, validated and fenced...
>>
>> Need to take a deeper look...
>>
>> /Thomas
>>
>>
>>
>> >
>> > Niranjana
>> >
>> >
>
>Hmm. Just a quick thought on this, Since the non-private vm-bind
>objects all need to be iterated through (locked and fenced and userptr
>valid) on each execbuf, and checking for validation (resident and
>bound) is a very quick check, then we'd never need to add them to the
>rebind list at all, right? If so the rebind list would be exclusive to
>vm-private objects.

Yah, non-private vm-bind objects all need to be iterated through, locked
and fenced (not required to be validated/userptr validated unless there
is an invalidation).

Yah, we can say that it is a quick check to see if BO needs rebinding
(validated), and hence rebind_list is mainly useful only for vm-private
objects.
But there has been some discussions to optimize the non-private BOs case
by not having to iterate. I am not sure how that will shape up, but
something to consider here.

>
>Also I don't think the vm_bind list can be execbuf-local, since binding
>may not have completed at vma_release time, at which point the objects
>need to remain on the vm_bind list until the next execbuf...

Yah, in execbuf3, after scooping all unbind BOs in vm_bind_list and
validating (binding) them, during eb_release_vmas, we only move those
BOs to vm_bound_list for which the binding is complete. If not, they
will remain in vm_bind_list. If we make this list, execbuf-local, then
we have to add all the BOs for which binding is not complete back into
rebind_list so that next execbuf will pick it up. Probably the current
vm_bind/bound_list is the better option.

Niranjana

>
>/Thomas
>
>
