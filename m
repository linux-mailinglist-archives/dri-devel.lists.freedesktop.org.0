Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF8F944AA2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 13:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E40D10E926;
	Thu,  1 Aug 2024 11:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzccLXaR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFC310E926;
 Thu,  1 Aug 2024 11:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722513181; x=1754049181;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Oj0fBNiMX6iSU78gN5ci6iFJtkNOfAOkXXuojk5ncrU=;
 b=FzccLXaRj4cBYuWiMWa0DO021pVLRvn4hrntOY19ECw+EH0D6cYMxUeU
 DxsY1hjX6e1jWIBDmGLP9qgsS6F3xeidIoU0u96foDyC2lUzRNR7r2zzl
 peK/tdt3W16+ALm8yn6/iU68vo+6Gx6AE6Dx6s6zETXcVlDZm8werQ346
 uHFOkg7mT2aUnw2HRPGrgSaiTo0NMQOpo2GZLUXJLWYTmbxQpzdcvKMcp
 6mleTtSUFFXO6mPY39IKZJBYQ7zBErr/kBpeD6Ryp36EEEkZcbmFWRjBB
 TX6pXSP8waIQUU/E25GBITZHMf7jwEmZ8gNj43xZYSqKxqi4AvEiwnuJp w==;
X-CSE-ConnectionGUID: IF9zX/wDTjyYLoYzgTYSSA==
X-CSE-MsgGUID: aBAZT3K6QZWV0P9I1SHbHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20402316"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20402316"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 04:53:00 -0700
X-CSE-ConnectionGUID: bFTDRMUGTVyJTOxvA/sXLA==
X-CSE-MsgGUID: molJdK4QQj2FzMQFxrI08g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="59332475"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 04:52:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 2/9] drm/i915: Use backlight power constants
In-Reply-To: <78c8c562-916b-455d-b2e1-5aed9d979926@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240731122311.1143153-1-tzimmermann@suse.de>
 <20240731122311.1143153-3-tzimmermann@suse.de> <87y15hwwii.fsf@intel.com>
 <78c8c562-916b-455d-b2e1-5aed9d979926@suse.de>
Date: Thu, 01 Aug 2024 14:52:54 +0300
Message-ID: <874j84wjc9.fsf@intel.com>
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

On Wed, 31 Jul 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 31.07.24 um 14:56 schrieb Jani Nikula:
>> On Wed, 31 Jul 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> Replace FB_BLANK_ constants with their counterparts from the
>>> backlight subsystem. The values are identical, so there's no
>>> change in functionality or semantics.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
> Thanks.
>
>>
>> Do you want us to take this via drm-intel-next, or all together via
>> drm-misc? Either is fine.
>
> drm-intel-next is fine.

Pushed to drm-intel-next, thanks for the patch.

BR,
Jani.


-- 
Jani Nikula, Intel
