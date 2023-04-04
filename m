Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909CC6D5C3D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 11:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E62D10E633;
	Tue,  4 Apr 2023 09:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CC210E023;
 Tue,  4 Apr 2023 09:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680601478; x=1712137478;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=evwuNJoFJzh7/WRai7GmJeBqO2kip9yckbdJm/jV9u0=;
 b=jpHV4ZpkeSs+cs45SYNu5sO+4q5zArmUkk6kUHrBiCupiU2O5eaO4bkF
 QowNEhACmjm/7wBYI1jTA+kAIxVd7DwxBfU5cnDimcR9I4uJC6iliyZi9
 8zCuC5sq9fCVSH1AY92X/GAJtZfSMCSvC7YwhbMe1mBmjbl2+RFZ4m+Y5
 1qSo5VOC0FZCanKt3TlFyWRoflTeIJa+0I24Fl/XZLxDfMCoiBsdO5lXC
 0LYUbPJkYmVrs+2ExF55rULS22/7Af5EvREVCX64J2WpSNV6CGyrt+l89
 ak0X2MG5sAMEpBV0YH7AhsPi33z+nOBb2ReA6y6v8s7Rof+twxdBfceQo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="330720192"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="330720192"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:44:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="775576241"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="775576241"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.43.58])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:44:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 01/19] drm/i915/i915_scatterlist: Fix kerneldoc
 formatting issue - missing '@'
In-Reply-To: <20230403162059.GC8371@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230331092607.700644-1-lee@kernel.org>
 <20230331092607.700644-2-lee@kernel.org> <87jzyt0yil.fsf@intel.com>
 <20230403162059.GC8371@google.com>
Date: Tue, 04 Apr 2023 12:44:32 +0300
Message-ID: <878rf80ynz.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 03 Apr 2023, Lee Jones <lee@kernel.org> wrote:
> On Mon, 03 Apr 2023, Jani Nikula wrote:
>
>> On Fri, 31 Mar 2023, Lee Jones <lee@kernel.org> wrote:
>> > Fixes the following W=1 kernel build warning(s):
>> >
>> >  drivers/gpu/drm/i915/i915_scatterlist.c:62: warning: Function parameter or member 'size' not described in 'i915_refct_sgt_init'
>> >
>> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> > Cc: David Airlie <airlied@gmail.com>
>> > Cc: Daniel Vetter <daniel@ffwll.ch>
>> > Cc: intel-gfx@lists.freedesktop.org
>> > Cc: dri-devel@lists.freedesktop.org
>> > Signed-off-by: Lee Jones <lee@kernel.org>
>>
>> Thanks for the patches!
>>
>> Applied all but one of the drm/i915 patches to drm-intel-next or
>> drm-intel-gt-next depending on the area. There were a couple of issues
>> that I fixed while applying. There was a conflict with patch 5/19
>> against drm-intel-gt-next so I left that one out.
>
> Thanks Jani.  I'll rebase and see what's left.

We also took notice and aim to track this more aggressively [1].

BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/intel/-/issues/8335


-- 
Jani Nikula, Intel Open Source Graphics Center
