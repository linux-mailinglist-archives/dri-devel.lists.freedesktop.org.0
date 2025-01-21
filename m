Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD4EA18840
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 00:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1515C10E648;
	Tue, 21 Jan 2025 23:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CouR/Gqs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908E810E27E;
 Tue, 21 Jan 2025 23:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737501578; x=1769037578;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qqiBwm1QvQzu0fFemQV3vOpYsnHG12gG2NpGlOt/xeU=;
 b=CouR/Gqst3+bZ196iJWwCc3qQHl+7ZVAZEJ3zrhwPiWRadd87uv1/SCR
 5iPkbHHlZHbC9iDpTlfE4ZM7/cjrU+rkImuyhZ+E0z/2hchW4gf/Um2DI
 3QPhOCQygee/TF8ZfI07WHPlTvd5als+ZctiiIgp7oCMdOcZiI6Lv0Zs8
 alaD4lxX0MlHllH3WkPqPSpxB5WUD+jRG082pbX5z3uhvvd7oQV80YcJz
 UKnJ0xmTFplzrEjudQOFpGMduinHfhCuPk1V1uPHGmwjzrETHO00YOFPd
 aNt3UEVLd11qK5vYG+QSUNJ1AxF8+BIvMKELiA82agYDqgL5eGWlFn4IK g==;
X-CSE-ConnectionGUID: cBKute2FRaOtjSzHTI5DfA==
X-CSE-MsgGUID: 7/AuBotqTOe3fPWC1aAZAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37816362"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="37816362"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 15:19:38 -0800
X-CSE-ConnectionGUID: qZCiFjVTSlWNM/s/R0vy5Q==
X-CSE-MsgGUID: +0vkHH/2SlaFaysaeUbEnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107844608"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.72])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 15:19:37 -0800
Date: Tue, 21 Jan 2025 17:19:33 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Also exclude xe for drm-misc
Message-ID: <52ljp7otgq3c2dcoot3eaathywfspiyxzet7feo2z5jj26qcvn@z5ypk5axeumd>
References: <20250117164529.393503-1-lucas.demarchi@intel.com>
 <Z4qWmBtbg866SOth@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z4qWmBtbg866SOth@intel.com>
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

On Fri, Jan 17, 2025 at 12:42:48PM -0500, Rodrigo Vivi wrote:
>On Fri, Jan 17, 2025 at 08:45:29AM -0800, Lucas De Marchi wrote:
>> When the xe driver was added, it didn't extend the exclude entries for
>> drm-misc, as done in commit 5a44d50f0072 ("MAINTAINERS: Update drm-misc
>> entry to match all drivers"). Exclude it like is done for i915 and other
>> drivers with dedicated maintainers.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d32d0a9428234..30d8e47a0e5f3 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7606,6 +7606,7 @@ X:	drivers/gpu/drm/nouveau/
>>  X:	drivers/gpu/drm/radeon/
>>  X:	drivers/gpu/drm/renesas/rcar-du/
>>  X:	drivers/gpu/drm/tegra/
>> +X:	drivers/gpu/drm/xe/
>
>my bad! I honestly had never noticed this exclude block before...
>
>at least now I understand why my inbox has more drm items nowadays :)
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

applied to drm-xe-next, thanks

Lucas De Marchi

>
>>
>>  DRM DRIVERS FOR ALLWINNER A10
>>  M:	Maxime Ripard <mripard@kernel.org>
>> --
>> 2.48.0
>>
