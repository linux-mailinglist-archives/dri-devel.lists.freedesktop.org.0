Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1384D91BB51
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4558910E23D;
	Fri, 28 Jun 2024 09:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/zyoL/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF11110EBFE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719566499; x=1751102499;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vErCeTWOxVLVhrrmANEwFGWg+7zIKDfDfYOoS/fQtoo=;
 b=I/zyoL/6HMZU+fvnKuwu08vAwEA/v0S/IrpnK9T42UPUAoH5OAJWmL98
 1bSNodW34duPR6KLmSkR6qafojf90Hcv1OzTov4oejRNENhIVos/6cGI0
 FaR1APhoP0aHO2ZcH3Kt4B5QjebI0Qgh3Cuz+YxqEK8nc63Y+Ft63dmxu
 lcMzKxhPLLKNBP0xOYR//q0siNtYxZwm/1MMbVi36BhMH1Yslyc0NtVQC
 eAirZxDbVoL8RsfBe61Z062ymTmH9RC7ZJbBb8t7Tlnq8AJZC0RVkGdZo
 7Oj1YOyItCK4YkJusSL6NjvW9x32UB3Vwqo7kSVtJpNsy1kM1nbZuzTg4 A==;
X-CSE-ConnectionGUID: WRkhbI5gQRWJmFvPX+pGqA==
X-CSE-MsgGUID: 8us0AtF6QFSsSeYIktwO4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16621804"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="16621804"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 02:21:39 -0700
X-CSE-ConnectionGUID: gEpHqPKVRxKCyiDRAUy6zA==
X-CSE-MsgGUID: 9lHtUkKoQ4u6dOgVo9+ksQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="49284057"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 02:21:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Daniel
 Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org, Rob Clark
 <robdclark@gmail.com>
Subject: Re: [rerere PATCH] nightly.conf: Merge drm-msm trees into drm-tip
In-Reply-To: <je4acmn744pwhdgwek2cgd22reoanogofcqm43vl2sxoyhb2dr@wxst2ffxistw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240626184515.3961230-1-dmitry.baryshkov@linaro.org>
 <87bk3md9ms.fsf@intel.com> <8734oyckdw.fsf@intel.com>
 <je4acmn744pwhdgwek2cgd22reoanogofcqm43vl2sxoyhb2dr@wxst2ffxistw>
Date: Fri, 28 Jun 2024 12:21:32 +0300
Message-ID: <87h6ddbexv.fsf@intel.com>
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

On Fri, 28 Jun 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Thu, Jun 27, 2024 at 09:26:19PM GMT, Jani Nikula wrote:
>> On Thu, 27 Jun 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> > On Wed, 26 Jun 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>> >> In order to improve testing of drm/msm branches, add drm-msm trees to
>> >> the list of the trees to be merged into drm-tip.
>> >>
>> >> Cc: Rob Clark <robdclark@gmail.com>
>> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> >
>> > It also helps in avoiding conflicts!
>> >
>> > Acked-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> Oh, this is with the assumption that you'll also maintain the branches
>> with dim. I realized this was not spelled out, but I'm hoping it is the
>> case.
>
> No, we use gitlab MRs in order to be able to pre-test patches. But it
> doesn't stop anybody from running dim ub && dim push after merging an
> MR.

IMO that's not quite enough.

The main problem with this (from drm-tip and dim POV) is that you won't
notice if you push patches that cause conflicts in rebuilding
drm-tip. That's then left for the next person to figure out, and for
them it's completely unexpected.

We had this when AMD branches were part of drm-tip, and it really wasn't
much fun, because the burden and benefits were quite lopsided. It's the
main reason the branches were dropped.

Now, I think there's a non-trivial amount of people who want to see more
of gitlab MR based workflows. This is a problem we'll inevitably need to
tackle anyway. Perhaps rebuilding drm-tip could be a gitlab workflow,
triggered automatically when any of the branches are pushed? With
notifications for folks to figure out the conflicts. Maybe there could
be some linux-next like logic to use older branches until the conflicts
get fixed.


BR,
Jani.


>
>> 
>> BR,
>> Jani.
>> 
>> 
>> >
>> >> ---
>> >>  nightly.conf | 8 ++++++++
>> >>  1 file changed, 8 insertions(+)
>> >>
>> >> diff --git a/nightly.conf b/nightly.conf
>> >> index 49abf3fb2a72..f2e181aa29e2 100644
>> >> --- a/nightly.conf
>> >> +++ b/nightly.conf
>> >> @@ -47,6 +47,11 @@ git://anongit.freedesktop.org/drm-intel
>> >>  https://anongit.freedesktop.org/git/drm/drm-intel
>> >>  https://anongit.freedesktop.org/git/drm/drm-intel.git
>> >>  "
>> >> +drm_tip_repos[drm-msm]="
>> >> +git@gitlab.freedesktop.org:drm/msm.git
>> >> +https://gitlab.freedesktop.org/drm/msm.git
>> >> +ssh://git@gitlab.freedesktop.org/drm/msm.git
>> >> +"
>> >>  drm_tip_repos[drm-misc]="
>> >>  git@gitlab.freedesktop.org:drm/misc/kernel.git
>> >>  https://gitlab.freedesktop.org/drm/misc/kernel.git
>> >> @@ -91,16 +96,19 @@ drm_tip_config=(
>> >>  	"drm-misc		drm-misc-fixes"
>> >>  	"drm-intel		drm-intel-fixes"
>> >>  	"drm-xe			drm-xe-fixes"
>> >> +	"drm-msm		msm-fixes"
>> >>  
>> >>  	"drm			drm-next"
>> >>  	"drm-misc		drm-misc-next-fixes"
>> >>  	"drm-intel		drm-intel-next-fixes"
>> >>  	"drm-xe			drm-xe-next-fixes"
>> >> +	#no msm-next-fixes in drm-msm
>> >>  
>> >>  	"drm-misc		drm-misc-next"
>> >>  	"drm-intel		drm-intel-next"
>> >>  	"drm-intel		drm-intel-gt-next"
>> >>  	"drm-xe			drm-xe-next"
>> >> +	"drm-msm		msm-next"
>> >>  
>> >>  	"drm-intel		topic/core-for-CI"
>> >>  	"drm-xe			topic/xe-for-CI"
>> 
>> -- 
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
