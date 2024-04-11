Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBE78A188F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 17:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E83110F189;
	Thu, 11 Apr 2024 15:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ag2IJrVq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4900B10F189;
 Thu, 11 Apr 2024 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712849138; x=1744385138;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=a81Df6w9Zvh1CHKFLbu5a03nMo/xzhwiat+oKvGw7P0=;
 b=Ag2IJrVqR6ntfERXBjK75IW4ujXwDh5hju/CjOJE4u/f68/btVWxr47j
 JlcMMshmOpEp7krDF47vpZd5g0cPDIoSw40Pd0Gd6IY9QHdle7/kgC7tZ
 ZsnAyB8qPKPvU9JZcmUtrqezrtJFn7P5QWHREs5WO8DnY/xT9rYZIVJUE
 76XgvtjnB7K5PaflRfQmOkbydQaPNnQGJmOAbeEbkiO36ehv6vAuuMWRH
 FE4B1GFTUu7i22XVF8nvq5DuoJLDy42XKgndmi5Grd5hzmXGy3hUYq5UD
 hLdTzYU94ssU1lx84vxlLxgf4jT497JY/FGxXNhBqXzBcxEX2jbYK0Ssq g==;
X-CSE-ConnectionGUID: eEiIGbZ9T1CesR3Hj5NkUg==
X-CSE-MsgGUID: GmX/l4yRTl+J48ahdw0cFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8141796"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8141796"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 08:25:31 -0700
X-CSE-ConnectionGUID: GKc4nwOKSXuMhAWqHzBUnQ==
X-CSE-MsgGUID: gBerfbMmSJKGnOb5Fwes5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25582616"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 08:25:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Dave
 Airlie <airlied@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 05/10] drm: move intel_lpe_audio.h under include/drm/intel
In-Reply-To: <Zhfxb2TWL_Cdh5sW@ashyti-mobl2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1712743191.git.jani.nikula@intel.com>
 <bf584e79e13001b962370a26e3b93c1c57ac6a1e.1712743191.git.jani.nikula@intel.com>
 <Zhfxb2TWL_Cdh5sW@ashyti-mobl2.lan>
Date: Thu, 11 Apr 2024 18:25:23 +0300
Message-ID: <877ch36hwc.fsf@intel.com>
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

On Thu, 11 Apr 2024, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Hi Jani,
>
> On Wed, Apr 10, 2024 at 01:05:12PM +0300, Jani Nikula wrote:
>> Clean up the top level include/drm directory by grouping all the Intel
>> specific files under a common subdirectory.
>> 
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Dave Airlie <airlied@gmail.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Jaroslav Kysela <perex@perex.cz>
>> Cc: Takashi Iwai <tiwai@suse.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_hdmi.c      | 2 +-
>>  drivers/gpu/drm/i915/display/intel_lpe_audio.c | 2 +-
>>  include/drm/{ => intel}/intel_lpe_audio.h      | 0
>
> strange thing here is that we have two different
> intel_lpe_audio.h. Can't they be merged?

Not so strange. The one in i915 is internal to i915, and the one in
include/drm is shared with sound/x86/intel_hdmi_audio.c.

> And, perhaps, we could also think of dropping the intel_ prefix
> for the files inside drm/intel/.

This series was scripted, so I didn't go into manual stuff like that
(yet). :)

BR,
Jani.

>
> In any case,
>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>
> Thanks,
> Andi

-- 
Jani Nikula, Intel
