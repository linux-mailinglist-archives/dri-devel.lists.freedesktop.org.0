Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA045974CEB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 10:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29E110E759;
	Wed, 11 Sep 2024 08:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lp/Lu+uf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3371F10E366;
 Wed, 11 Sep 2024 08:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726044203; x=1757580203;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pSQDs7KMoH7HaIy4NIvWWkshPAjMFbu930zgWis30To=;
 b=lp/Lu+ufTVJ2fMnvi6D/6A1TTjEYOZxgOdkWAs1tLf0OUfi/wBeWFSQ4
 ql3qPkKn105smUzLk6YUje4B8H41/GyF1uulkMyvcPQrcS7iKG4kZ4z4V
 LWuzUL2ZS1KFL6vgh0rBThiURdmztCp9lYkzNM93oiKxtlF47MkW3R6px
 T8DSTo0hSOTkuf1+6MJNQGAkC2qyee26xqAkQmMeHUGuHYYXftldDgG21
 xhT6hOMFNNprmoXb7LDbS6msEQ5ng5sIUC0myrRNYmZ8z/lvM84utiHHL
 XZPBxgsaXMkmGy7/UkTtjczUM84MPuk0tGMczmiF0djqT9SGdcnejyI3q g==;
X-CSE-ConnectionGUID: Nh1+ovwdQSe7dtv4x7vtfQ==
X-CSE-MsgGUID: ifTOEgK9TwKNhSCNJW0G1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24700047"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="24700047"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 01:43:23 -0700
X-CSE-ConnectionGUID: ssBJW64jSTeZXEl5I3m4lg==
X-CSE-MsgGUID: ZAxfyomMSEOqQal2KBgxSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="66929497"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.149])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 01:43:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Simona Vetter
 <simona.vetter@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr?=
 =?utf-8?Q?=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 DRM XE List <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm-xe tree with the drm-intel
 tree
In-Reply-To: <20240911135249.543da06a@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240906131502.7a7d1962@canb.auug.org.au>
 <20240911135249.543da06a@canb.auug.org.au>
Date: Wed, 11 Sep 2024 11:43:15 +0300
Message-ID: <87ed5qk2cc.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Sep 2024, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> On Fri, 6 Sep 2024 13:15:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the drm-xe tree got a conflict in:
>> 
>>   drivers/gpu/drm/xe/display/xe_display.c
>> 
>> between commit:
>> 
>>   11d0613af7c5 ("drm/i915/display: include drm/drm_probe_helper.h where needed")
>> 
>> from the drm-intel tree and commit:
>> 
>>   87d8ecf01544 ("drm/xe: replace #include <drm/xe_drm.h> with <uapi/drm/xe_drm.h>")
>> 
>> from the drm-xe tree.
>> 
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>> 
>> -- 
>> Cheers,
>> Stephen Rothwell
>> 
>> diff --cc drivers/gpu/drm/xe/display/xe_display.c
>> index 303d00b99a68,75736faf2a80..000000000000
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@@ -10,8 -10,7 +10,8 @@@
>>   
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_managed.h>
>>  +#include <drm/drm_probe_helper.h>
>> - #include <drm/xe_drm.h>
>> + #include <uapi/drm/xe_drm.h>
>>   
>>   #include "soc/intel_dram.h"
>>   #include "i915_drv.h"		/* FIXME: HAS_DISPLAY() depends on this */
>
> This is now a conflict between the drm-intel and drm trees.

I backmerged drm-next to drm-intel-next, resolving the conflict.

Thanks,
Jani.

-- 
Jani Nikula, Intel
