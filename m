Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ABD91A282
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 11:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CD010E1AB;
	Thu, 27 Jun 2024 09:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FnMO2nZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E77E10E1AB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 09:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719480066; x=1751016066;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3dyV6s/xdcOociYM1zZ/5CSFVu3cAmPm2qJPXO9HT6s=;
 b=FnMO2nZVXVqP44LgN7//CgRuJZ7AWb31JE3SywvfD2wVcHrWkdJ0z4tH
 brj6ihZyvjizcDQ5PwIBzFuU/GCwmKkhAPBmSaP6dtIdeZ1tle0ctIVtW
 jpEXk66cE92CmTjxKxfAcblHKFVg24EvpUkXfT6GtpJXLI5qKmRlP+dU6
 FOFasuR1GaUbeQJdP56bO21TuIfzYJ8eHpN7ZbPY86wIeFiHOG3jTMHiZ
 zXyeZ6fWczExnFgXd7y2Em/K39AnrBMSxWrrEp7Tb6pPM1fzvK2dAjwHS
 YlQNiqgHQgKQo9sPSgpJNj1Igwn6ROP1hMJo5+eTDQ1/Vg/ueMM40Wz9e g==;
X-CSE-ConnectionGUID: nvcQKHYXRgyrKoL9DL25Zw==
X-CSE-MsgGUID: yGUs6NdhRhmfyLXqIgwFIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16740381"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="16740381"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 02:21:06 -0700
X-CSE-ConnectionGUID: balyYQLLSKKZLxOU/ZDDLA==
X-CSE-MsgGUID: C+BouRLOSQadwdvMJrjJWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="75502437"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.146])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 02:21:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Stone
 <daniels@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Subject: Re: [rerere PATCH] nightly.conf: Merge drm-msm trees into drm-tip
In-Reply-To: <20240626184515.3961230-1-dmitry.baryshkov@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240626184515.3961230-1-dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 12:20:59 +0300
Message-ID: <87bk3md9ms.fsf@intel.com>
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

On Wed, 26 Jun 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> In order to improve testing of drm/msm branches, add drm-msm trees to
> the list of the trees to be merged into drm-tip.
>
> Cc: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

It also helps in avoiding conflicts!

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  nightly.conf | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/nightly.conf b/nightly.conf
> index 49abf3fb2a72..f2e181aa29e2 100644
> --- a/nightly.conf
> +++ b/nightly.conf
> @@ -47,6 +47,11 @@ git://anongit.freedesktop.org/drm-intel
>  https://anongit.freedesktop.org/git/drm/drm-intel
>  https://anongit.freedesktop.org/git/drm/drm-intel.git
>  "
> +drm_tip_repos[drm-msm]="
> +git@gitlab.freedesktop.org:drm/msm.git
> +https://gitlab.freedesktop.org/drm/msm.git
> +ssh://git@gitlab.freedesktop.org/drm/msm.git
> +"
>  drm_tip_repos[drm-misc]="
>  git@gitlab.freedesktop.org:drm/misc/kernel.git
>  https://gitlab.freedesktop.org/drm/misc/kernel.git
> @@ -91,16 +96,19 @@ drm_tip_config=(
>  	"drm-misc		drm-misc-fixes"
>  	"drm-intel		drm-intel-fixes"
>  	"drm-xe			drm-xe-fixes"
> +	"drm-msm		msm-fixes"
>  
>  	"drm			drm-next"
>  	"drm-misc		drm-misc-next-fixes"
>  	"drm-intel		drm-intel-next-fixes"
>  	"drm-xe			drm-xe-next-fixes"
> +	#no msm-next-fixes in drm-msm
>  
>  	"drm-misc		drm-misc-next"
>  	"drm-intel		drm-intel-next"
>  	"drm-intel		drm-intel-gt-next"
>  	"drm-xe			drm-xe-next"
> +	"drm-msm		msm-next"
>  
>  	"drm-intel		topic/core-for-CI"
>  	"drm-xe			topic/xe-for-CI"

-- 
Jani Nikula, Intel
