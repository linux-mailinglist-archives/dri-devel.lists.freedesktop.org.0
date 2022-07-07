Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C43A05699A8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 07:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4CB11B318;
	Thu,  7 Jul 2022 05:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E1C11B318;
 Thu,  7 Jul 2022 05:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657170386; x=1688706386;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FLgz5b6CngcNW/rNqHfQHY1Gx8hedgThsZ1vTrebCu8=;
 b=bx3fscqpIVZ0Xhy1X9uypdn8N9FPHIoqJqYLmaH0BO+wwSCIwsoT2ULE
 Pl68a4l1uwI/nPFib0FOS4cWF2hVxky6Kbh/yJ762ZnaxS0qKtPne6keF
 DwF1n9AZgcWgz0NftnyITnJ3w/JCAt9VxxHi3FSPmz9dCUNeajxHtf2UU
 yIqti6PhtcjGDCHl5edwXlV1FcaKclR/FO6spSxxCSSeJrly+h4g7xAnQ
 8LgIkG35QxlKre7wDYkD+KbKx3cZlSA2biUXI7vAfHFSM29OATVGxc8UW
 iot0kky9Tb1G+jh3P3fADnj7kFq5Qadm28mehoyhVy6WiKAPJ8Yrf9eEn A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="284671968"
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="284671968"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 22:06:25 -0700
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="650972543"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 22:06:23 -0700
Date: Wed, 6 Jul 2022 22:06:05 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC 01/10] drm/i915/vm_bind: Introduce VM_BIND ioctl
Message-ID: <20220707050605.GL14039@nvishwa1-DESK>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-2-niranjana.vishwanathapura@intel.com>
 <fbbba03a0a0d0f97136b1449276b763a70beb084.camel@intel.com>
 <YsY0V2JJgXNPjy1s@alfio.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsY0V2JJgXNPjy1s@alfio.lan>
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
Cc: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 07, 2022 at 03:18:15AM +0200, Andi Shyti wrote:
>Hi,
>
>[...]
>
>> > +/*
>> > + * VM_BIND feature version supported.
>> > + *
>> > + * The following versions of VM_BIND have been defined:
>> > + *
>> > + * 0: No VM_BIND support.
>> > + *
>> > + * 1: In VM_UNBIND calls, the UMD must specify the exact mappings
>> > created
>> > + *    previously with VM_BIND, the ioctl will not support unbinding
>> > multiple
>> > + *    mappings or splitting them. Similarly, VM_BIND calls will not
>> > replace
>> > + *    any existing mappings.
>> > + *
>> > + * 2: The restrictions on unbinding partial or multiple mappings is
>> > + *    lifted, Similarly, binding will replace any mappings in the
>> > given range.
>> > + *
>> > + * See struct drm_i915_gem_vm_bind and struct
>> > drm_i915_gem_vm_unbind.
>> > + */
>> > +#define I915_PARAM_VM_BIND_VERSION     57
>>
>> Perhaps clarify that new versions are always backwards compatible?
>
>how is this 57 coherent with the description above?
>

57 is the next availble I915_PARAM_* number (from i915_drm.h). The
description above is regarding that 'value' it returns.

Niranjana

>Andi
