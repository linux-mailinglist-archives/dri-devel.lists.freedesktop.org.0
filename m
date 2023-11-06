Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66DC7E1E58
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 11:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C8210E2BD;
	Mon,  6 Nov 2023 10:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A292610E2BD
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 10:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699266692; x=1730802692;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mFmIIGG7adzfu43wmeMMXhqUmLpP5dB3WqHiSnXa6qY=;
 b=K9hZSf6iGsVfeJ37rrRMnzUivTRSOu2zun6En8wMF3+ExQ3w76Nh30uc
 xkYS3KS/UaEge/XGkBZ2uiUh1axrC0SSv3HH4jqGpZstNL2nkdLmDjCs7
 7tpeTv+ybeg7b3+eIZbNFAzaqdzaAvtE/xfsMdj/hZpXdQqnTH8vZ/UjE
 k1UPordAejjdJIEKBGZvS2tw2qG2OA6mOyAHvY6NBZDw9ISOMel1SQuCG
 MWB31WeXzaarV8C93+B/CbVV/72EDuoksKYFgokaXqFh4rUBW1kG7JHpF
 iKOUgo4cmQFf5NAS/cRvYfA1Sob2FG743iUztI4/sAoHlueCftuReo0H+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2236699"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="2236699"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 02:31:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="832683907"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="832683907"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.222])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 02:31:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Hunter Chasens
 <hunter.chasens18@ncf.edu>, corbet@lwn.net, Luca Coelho
 <luciano.coelho@intel.com>
Subject: Re: [PATCH v1] docs: gpu: rfc: i915_scheduler.rst remove unused
 directives for namespacing
In-Reply-To: <ZUhvj2uj_PvaDxIM@debian.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231104134708.69432-1-hunter.chasens18@ncf.edu>
 <ZUhvj2uj_PvaDxIM@debian.me>
Date: Mon, 06 Nov 2023 12:31:23 +0200
Message-ID: <8734xj18ck.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: tzimmermann@suse.de, Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 06 Nov 2023, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> On Sat, Nov 04, 2023 at 09:47:08AM -0400, Hunter Chasens wrote:
>> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
>> index c237ebc024cd..23ba7006929b 100644
>> --- a/Documentation/gpu/rfc/i915_scheduler.rst
>> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
>> @@ -135,13 +135,9 @@ Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
>>  drm_i915_context_engines_parallel_submit to the uAPI to implement this
>>  extension.
>>  
>> -.. c:namespace-push:: rfc
>> -
>>  .. kernel-doc:: include/uapi/drm/i915_drm.h
>>          :functions: i915_context_engines_parallel_submit
>>  
>> -.. c:namespace-pop::
>> -

What makes the namespacing unnecessary?

$ git grep '.. kernel-doc:: include/uapi/drm/i915_drm.h'
Documentation/gpu/driver-uapi.rst:.. kernel-doc:: include/uapi/drm/i915_drm.h
Documentation/gpu/rfc/i915_scheduler.rst:.. kernel-doc:: include/uapi/drm/i915_drm.h

And you get [1] and [2].

>>  Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
>>  -------------------------------------------------------------------
>>  Contexts that have been configured with the 'set_parallel' extension can only
>
> The warnings go away, thanks!

What warnings go away?

BR,
Jani.


[1] https://docs.kernel.org/gpu/driver-uapi.html#c.i915_context_engines_parallel_submit
[2] https://docs.kernel.org/gpu/rfc/i915_scheduler.html#c.rfc.i915_context_engines_parallel_submit

>
> Fixes: f6757dfcfde7 ("drm/doc: fix duplicate declaration warning")
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
Jani Nikula, Intel
