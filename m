Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DE091AF04
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 20:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9419910E069;
	Thu, 27 Jun 2024 18:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pn+4d1z5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D09610E069
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 18:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719512787; x=1751048787;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LKE/tf/jU18XPufKdN9vvyC1hP9Uqub5vAVVInIn/z8=;
 b=Pn+4d1z5st79dYQO6VEb0tmZnGDKAa8NFMjQEBNhQYweM2IHBjQq8jGr
 PZ0e3ecn1at4/lJHdED9I3wU1Rfl4E8ojkB2D9nM/oOGF2ldXPbFZIzwk
 wskJnZ3YhYHSUTYcEhnnQqWmxS6gr0gNKfejZ5uNVha0e/+O8HOi9F+Wp
 g9gdl3xDf03Yhnsq8N5fcCuqnpa4y8oJsVG34x090nrx/6K4Y1Ybq5n7w
 7WNszNZ4mGA0VGiU60jwOE0CP80XHB4gxa4TEt7O+XhgCoTMgRb+d4u+V
 uIH7vE3HFUM724fZTCCHfJ4TTBgnDXpJi3nOIFV1n3djQ+xrMXHWtt8NQ g==;
X-CSE-ConnectionGUID: zTltIOFHR024qPlKw/bUNg==
X-CSE-MsgGUID: d9UnUfYuRuWKj0/jyewoTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16345863"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="16345863"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 11:26:26 -0700
X-CSE-ConnectionGUID: 7/crlZUOSYqbP9u24Y/a2w==
X-CSE-MsgGUID: dCLn/PSBSZOhW49JiAsAsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="48808608"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.189])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 11:26:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Stone
 <daniels@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Subject: Re: [rerere PATCH] nightly.conf: Merge drm-msm trees into drm-tip
In-Reply-To: <87bk3md9ms.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240626184515.3961230-1-dmitry.baryshkov@linaro.org>
 <87bk3md9ms.fsf@intel.com>
Date: Thu, 27 Jun 2024 21:26:19 +0300
Message-ID: <8734oyckdw.fsf@intel.com>
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

On Thu, 27 Jun 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 26 Jun 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>> In order to improve testing of drm/msm branches, add drm-msm trees to
>> the list of the trees to be merged into drm-tip.
>>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> It also helps in avoiding conflicts!
>
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Oh, this is with the assumption that you'll also maintain the branches
with dim. I realized this was not spelled out, but I'm hoping it is the
case.

BR,
Jani.


>
>> ---
>>  nightly.conf | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/nightly.conf b/nightly.conf
>> index 49abf3fb2a72..f2e181aa29e2 100644
>> --- a/nightly.conf
>> +++ b/nightly.conf
>> @@ -47,6 +47,11 @@ git://anongit.freedesktop.org/drm-intel
>>  https://anongit.freedesktop.org/git/drm/drm-intel
>>  https://anongit.freedesktop.org/git/drm/drm-intel.git
>>  "
>> +drm_tip_repos[drm-msm]="
>> +git@gitlab.freedesktop.org:drm/msm.git
>> +https://gitlab.freedesktop.org/drm/msm.git
>> +ssh://git@gitlab.freedesktop.org/drm/msm.git
>> +"
>>  drm_tip_repos[drm-misc]="
>>  git@gitlab.freedesktop.org:drm/misc/kernel.git
>>  https://gitlab.freedesktop.org/drm/misc/kernel.git
>> @@ -91,16 +96,19 @@ drm_tip_config=(
>>  	"drm-misc		drm-misc-fixes"
>>  	"drm-intel		drm-intel-fixes"
>>  	"drm-xe			drm-xe-fixes"
>> +	"drm-msm		msm-fixes"
>>  
>>  	"drm			drm-next"
>>  	"drm-misc		drm-misc-next-fixes"
>>  	"drm-intel		drm-intel-next-fixes"
>>  	"drm-xe			drm-xe-next-fixes"
>> +	#no msm-next-fixes in drm-msm
>>  
>>  	"drm-misc		drm-misc-next"
>>  	"drm-intel		drm-intel-next"
>>  	"drm-intel		drm-intel-gt-next"
>>  	"drm-xe			drm-xe-next"
>> +	"drm-msm		msm-next"
>>  
>>  	"drm-intel		topic/core-for-CI"
>>  	"drm-xe			topic/xe-for-CI"

-- 
Jani Nikula, Intel
