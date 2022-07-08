Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8A956BA31
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 14:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0820113563;
	Fri,  8 Jul 2022 12:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDFC113563;
 Fri,  8 Jul 2022 12:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657285119; x=1688821119;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KQ0DSuaf1cvhb5m8IB++uPVfonuALt6bvvalIEVx8bQ=;
 b=eeRMb2w9szaWc3Ibx8UiywW4K+5Qov7XWvPmVI+5CaPr/+VMVNegsgtp
 jsXTYmbbdcbNzHQD/gx5OXxHb2Xvur0dy904bklc4sZ/alQLB+3a3tdjb
 TNZWnWyUvMNv41cxkvJg4f+6ltNzTcxF9s5Ro651ynjlUrY42DC2O5nf5
 MgRQFFY0r8oo4HcOSd9w8endhf58tk1JBZ36xale5mg9eIWreVcpbQ5GI
 rKBntf8BtEQx5evgutvpql0eVcf/dS/9BpT3SLgbnd8DzlxnHHwHrlYyG
 HxPjz5UNTaW1Wm9ODTSCrZd6FBvSS/CeINPHt0suRA4SFhRvAvRwk44Lf g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="281823360"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="281823360"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 05:58:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="770776187"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 05:58:38 -0700
Date: Fri, 8 Jul 2022 05:58:19 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Subject: Re: [RFC 01/10] drm/i915/vm_bind: Introduce VM_BIND ioctl
Message-ID: <20220708125819.GT14039@nvishwa1-DESK>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-2-niranjana.vishwanathapura@intel.com>
 <fbbba03a0a0d0f97136b1449276b763a70beb084.camel@intel.com>
 <20220707050143.GK14039@nvishwa1-DESK>
 <117ee54783bc88715214cb5082a11b0239dce0c4.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <117ee54783bc88715214cb5082a11b0239dce0c4.camel@intel.com>
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

On Thu, Jul 07, 2022 at 12:32:14AM -0700, Hellstrom, Thomas wrote:
>On Wed, 2022-07-06 at 22:01 -0700, Niranjana Vishwanathapura wrote:
>> > > +       /**
>> > > +        * true: allow only vm_bind method of binding.
>> > > +        * false: allow only legacy execbuff method of binding.
>> > > +        */
>> >
>> > Use proper kerneldoc. (Same holds for structure documentation
>> > across
>> > the series).
>> > Also please follow internal locking guidelines on documentation of
>> > members that need protection with locks.
>>
>> I just followed the documentation convention that was already there
>> ;)
>> I think we need a prep patch in this series that adds kernel-doc for
>> these structures and then add new fields for vm_bind with proper
>> kernel-docs.
>
>That would be awesome if we could do that, but as a minimum, I think
>that new in-line struct / union comments should follow
>
>https://www.kernel.org/doc/html/v5.3/doc-guide/kernel-doc.html#in-line-member-documentation-comments
>
>and completely new struct / unions should follow
>
>https://www.kernel.org/doc/html/v5.3/doc-guide/kernel-doc.html#in-line-member-documentation-comments,
>
>and in particular the internal locking guidelines what members are
>protected with what locks and, if applicable, how. (For example a
>member may be protected by two locks when writing to it and only one of
>the locks when reading).

Sounds good.

Niranjana

>
>/Thomas
>
>
