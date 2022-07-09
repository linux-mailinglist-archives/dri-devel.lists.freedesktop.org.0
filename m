Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7B756CB75
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 22:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AF411B8DE;
	Sat,  9 Jul 2022 20:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D409D11B8DE;
 Sat,  9 Jul 2022 20:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657400182; x=1688936182;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lorjjjRF59WC20APXAqWBxHXN1GVl6m7SiOezAXvgv8=;
 b=guGeGwTrBxVocDqLm+cJp6gQlG9o44sVq0Gc2bSKLyZ4j55PexpBVoAZ
 GC9ajeis7ll56Sj+bmbvS1d521KTXrKdx+JphaeUMezF2YMS371ODLCSO
 OAJUyCszp4tLSfFEs3HzbfLo8bixyRO/JW88DCM3ypZ/GTabgolbDODf3
 eXTpb8k4TlhDE3QoY+cDF8IV4BXcI2hWccZBHC0zFm1ugx7gTKrjW/K83
 vvUu71JDEvDopWxBO26pRSBtXSEp9udDLw1LP0YRd9UN59/mmnRSEnmwo
 QivEKTm6VLcMzjJCq8s/W1dhuyBb23Tasx2b6K1FujM8JWH18X4aPrPWF w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10403"; a="285586738"
X-IronPort-AV: E=Sophos;i="5.92,259,1650956400"; d="scan'208";a="285586738"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2022 13:56:22 -0700
X-IronPort-AV: E=Sophos;i="5.92,259,1650956400"; d="scan'208";a="651960839"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2022 13:56:21 -0700
Date: Sat, 9 Jul 2022 13:56:02 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Subject: Re: [RFC 08/10] drm/i915/vm_bind: userptr dma-resv changes
Message-ID: <20220709205601.GE14039@nvishwa1-DESK>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-9-niranjana.vishwanathapura@intel.com>
 <d1c8cd2c44c07ebc7053f192100bf0ee5aa67140.camel@intel.com>
 <20220708145157.GX14039@nvishwa1-DESK>
 <839b728191ae8e7dcc65ad2cf9978f4a7f1b8e6a.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <839b728191ae8e7dcc65ad2cf9978f4a7f1b8e6a.camel@intel.com>
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
 Paulo R" <paulo.r.zanoni@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 08, 2022 at 03:20:01PM +0000, Hellstrom, Thomas wrote:
>On Fri, 2022-07-08 at 07:51 -0700, Niranjana Vishwanathapura wrote:
>> > Since we don't loop over the vm_bound_list, there is a need to
>> > check
>> > whether the rebind_list is empty here under the notifier_lock in
>> > read
>> > mode, and in that case, restart from eb_lookup_vmas(). That might
>> > also
>> > eliminate the need for the __EXEC3_USERPTR_USED flag?
>> >
>> > That will also catch any objects that were evicted between
>> > eb_lookup_vmas() where the rebind_list was last checked, and
>> > i915_gem_vm_priv_lock(), which prohibits further eviction, but if
>> > we
>> > want to catch these earlier (which I think is a good idea), we
>> > could
>> > check that the rebind_list is indeed empty just after taking the
>> > vm_priv_lock(), and if not, restart from eb_lookup_vmas().
>>
>> Yah, right, we need to check rebind_list here and if not empty,
>> restart
>> from lookup phase.
>> It is bit tricky with userptr here as the unbind happens during
>> submit_init() call after we scoop unbound vmas here, the vmas gets
>> re-added to rebind_list :(.
>
>Ugh.
>
>> I think we need a separate 'invalidated_userptr_list' here and we
>> iterate through it for submit_init() and submit_done() calls (yes,
>> __EXEC3_USERPTR_USED flag won't be needed then).
>> And, we call, eb_scoop_unbound_vmas() after calling
>> eb_lookup_persistent_userptr_vmas(), so that we scoop all unbound
>> vmas properly.
>>
>
>I'm not sure that will help much, because we'd also need to recheck the
>rebind_list and possibly restart after taking the vm_priv_lock, since
>objects can be evicted between the scooping and taking the
>vm_priv_lock. So then the userptrs will be caught by that check.

Yah, what I mentioned above is in addition to rechecking rebind_list and
restarting.

Niranjana

>
>/Thomas
>
>
