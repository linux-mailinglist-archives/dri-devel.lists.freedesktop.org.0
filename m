Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F9456BBEF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 16:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA6910E4AE;
	Fri,  8 Jul 2022 14:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6F610E4A1;
 Fri,  8 Jul 2022 14:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657292077; x=1688828077;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Y9SmuuHPz8GscEfHuUsZcx4KHke6FNdzhMwVeakNmf0=;
 b=QaiYufw6JsikAHJzosS8d5U2Ddi+iSlBQi//ihAcMlXn67kdVaf/i7gF
 jp6t0dzNEsau/POfgjFa9llL+Z/hzHCMsTYSnbgbb2x84ETCq2u8SHsYB
 NTXujK3fUMbSqjeP/i6RwQcDDRNMSF5rf3HNG3ntEuRv3lJFELanZgqiH
 xdL9go2ghiCrWZtZhjP47DyiUo0nvhX1TK+37QwulgIh8SpFGkFG5MxCw
 4jAUDpkcwJ0p+XvmUnxIiGJjglpyWEvJV+HKjG5e6boL/Zd7KcVYZfglU
 DQVh0NTWPdV7oSdqETyMEQyKRv5JvXPj+xzHQrLea/fkq3PUiMPCpowaQ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="284318225"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="284318225"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 07:54:37 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="651590769"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 07:54:37 -0700
Date: Fri, 8 Jul 2022 07:54:18 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Subject: Re: [RFC 08/10] drm/i915/vm_bind: userptr dma-resv changes
Message-ID: <20220708145418.GY14039@nvishwa1-DESK>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-9-niranjana.vishwanathapura@intel.com>
 <cf5b29a58096cc2e3ab8233c126c01a94bf020b3.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cf5b29a58096cc2e3ab8233c126c01a94bf020b3.camel@intel.com>
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

On Fri, Jul 08, 2022 at 05:17:53AM -0700, Hellstrom, Thomas wrote:
>On Fri, 2022-07-01 at 15:50 -0700, Niranjana Vishwanathapura wrote:
>> For persistent (vm_bind) vmas of userptr BOs, handle the user
>> page pinning by using the i915_gem_object_userptr_submit_init()
>> /done() functions
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 67
>> +++++++++++++++++++
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 16 +++++
>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  1 +
>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |  1 +
>>  4 files changed, 85 insertions(+)
>>
>
>Hmm. I also miss the code in userptr invalidate that puts invalidated
>vm-private userptr vmas on the rebind list?

Yah, looks like it is lost in rebase.
Based on discussion in other thread on this patch, it is going to be
bit different here than adding to rebind_list.

Niranjana

>
>/Thomas
>
